; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87040 () Bool)

(assert start!87040)

(declare-fun b!1007866 () Bool)

(declare-fun res!676202 () Bool)

(declare-fun e!567370 () Bool)

(assert (=> b!1007866 (=> (not res!676202) (not e!567370))))

(declare-datatypes ((array!63558 0))(
  ( (array!63559 (arr!30595 (Array (_ BitVec 32) (_ BitVec 64))) (size!31098 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63558)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007866 (= res!676202 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1007867 () Bool)

(declare-fun e!567368 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1007867 (= e!567368 (bvslt (bvsub #b01111111111111111111111111111110 x!1245) #b00000000000000000000000000000000))))

(declare-fun b!1007868 () Bool)

(declare-fun res!676201 () Bool)

(assert (=> b!1007868 (=> (not res!676201) (not e!567370))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007868 (= res!676201 (validKeyInArray!0 (select (arr!30595 a!3219) j!170)))))

(declare-fun res!676204 () Bool)

(assert (=> start!87040 (=> (not res!676204) (not e!567370))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87040 (= res!676204 (validMask!0 mask!3464))))

(assert (=> start!87040 e!567370))

(declare-fun array_inv!23731 (array!63558) Bool)

(assert (=> start!87040 (array_inv!23731 a!3219)))

(assert (=> start!87040 true))

(declare-fun b!1007869 () Bool)

(declare-fun e!567372 () Bool)

(declare-fun e!567369 () Bool)

(assert (=> b!1007869 (= e!567372 e!567369)))

(declare-fun res!676194 () Bool)

(assert (=> b!1007869 (=> (not res!676194) (not e!567369))))

(declare-datatypes ((SeekEntryResult!9463 0))(
  ( (MissingZero!9463 (index!40223 (_ BitVec 32))) (Found!9463 (index!40224 (_ BitVec 32))) (Intermediate!9463 (undefined!10275 Bool) (index!40225 (_ BitVec 32)) (x!87779 (_ BitVec 32))) (Undefined!9463) (MissingVacant!9463 (index!40226 (_ BitVec 32))) )
))
(declare-fun lt!445323 () SeekEntryResult!9463)

(declare-fun lt!445325 () SeekEntryResult!9463)

(assert (=> b!1007869 (= res!676194 (= lt!445323 lt!445325))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007869 (= lt!445325 (Intermediate!9463 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63558 (_ BitVec 32)) SeekEntryResult!9463)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007869 (= lt!445323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30595 a!3219) j!170) mask!3464) (select (arr!30595 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007870 () Bool)

(declare-fun res!676205 () Bool)

(assert (=> b!1007870 (=> (not res!676205) (not e!567370))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1007870 (= res!676205 (and (= (size!31098 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31098 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31098 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007871 () Bool)

(declare-fun res!676198 () Bool)

(assert (=> b!1007871 (=> (not res!676198) (not e!567368))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445324 () (_ BitVec 64))

(declare-fun lt!445320 () array!63558)

(declare-fun lt!445321 () SeekEntryResult!9463)

(assert (=> b!1007871 (= res!676198 (not (= lt!445321 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445324 lt!445320 mask!3464))))))

(declare-fun b!1007872 () Bool)

(declare-fun e!567371 () Bool)

(assert (=> b!1007872 (= e!567369 e!567371)))

(declare-fun res!676200 () Bool)

(assert (=> b!1007872 (=> (not res!676200) (not e!567371))))

(assert (=> b!1007872 (= res!676200 (= lt!445321 lt!445325))))

(assert (=> b!1007872 (= lt!445321 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30595 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007873 () Bool)

(declare-fun res!676203 () Bool)

(assert (=> b!1007873 (=> (not res!676203) (not e!567372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63558 (_ BitVec 32)) Bool)

(assert (=> b!1007873 (= res!676203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007874 () Bool)

(assert (=> b!1007874 (= e!567370 e!567372)))

(declare-fun res!676197 () Bool)

(assert (=> b!1007874 (=> (not res!676197) (not e!567372))))

(declare-fun lt!445322 () SeekEntryResult!9463)

(assert (=> b!1007874 (= res!676197 (or (= lt!445322 (MissingVacant!9463 i!1194)) (= lt!445322 (MissingZero!9463 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63558 (_ BitVec 32)) SeekEntryResult!9463)

(assert (=> b!1007874 (= lt!445322 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1007875 () Bool)

(assert (=> b!1007875 (= e!567371 e!567368)))

(declare-fun res!676195 () Bool)

(assert (=> b!1007875 (=> (not res!676195) (not e!567368))))

(assert (=> b!1007875 (= res!676195 (not (= lt!445323 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445324 mask!3464) lt!445324 lt!445320 mask!3464))))))

(assert (=> b!1007875 (= lt!445324 (select (store (arr!30595 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1007875 (= lt!445320 (array!63559 (store (arr!30595 a!3219) i!1194 k0!2224) (size!31098 a!3219)))))

(declare-fun b!1007876 () Bool)

(declare-fun res!676193 () Bool)

(assert (=> b!1007876 (=> (not res!676193) (not e!567372))))

(assert (=> b!1007876 (= res!676193 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31098 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31098 a!3219))))))

(declare-fun b!1007877 () Bool)

(declare-fun res!676199 () Bool)

(assert (=> b!1007877 (=> (not res!676199) (not e!567370))))

(assert (=> b!1007877 (= res!676199 (validKeyInArray!0 k0!2224))))

(declare-fun b!1007878 () Bool)

(declare-fun res!676196 () Bool)

(assert (=> b!1007878 (=> (not res!676196) (not e!567372))))

(declare-datatypes ((List!21242 0))(
  ( (Nil!21239) (Cons!21238 (h!22430 (_ BitVec 64)) (t!30235 List!21242)) )
))
(declare-fun arrayNoDuplicates!0 (array!63558 (_ BitVec 32) List!21242) Bool)

(assert (=> b!1007878 (= res!676196 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21239))))

(assert (= (and start!87040 res!676204) b!1007870))

(assert (= (and b!1007870 res!676205) b!1007868))

(assert (= (and b!1007868 res!676201) b!1007877))

(assert (= (and b!1007877 res!676199) b!1007866))

(assert (= (and b!1007866 res!676202) b!1007874))

(assert (= (and b!1007874 res!676197) b!1007873))

(assert (= (and b!1007873 res!676203) b!1007878))

(assert (= (and b!1007878 res!676196) b!1007876))

(assert (= (and b!1007876 res!676193) b!1007869))

(assert (= (and b!1007869 res!676194) b!1007872))

(assert (= (and b!1007872 res!676200) b!1007875))

(assert (= (and b!1007875 res!676195) b!1007871))

(assert (= (and b!1007871 res!676198) b!1007867))

(declare-fun m!933233 () Bool)

(assert (=> b!1007871 m!933233))

(declare-fun m!933235 () Bool)

(assert (=> b!1007875 m!933235))

(assert (=> b!1007875 m!933235))

(declare-fun m!933237 () Bool)

(assert (=> b!1007875 m!933237))

(declare-fun m!933239 () Bool)

(assert (=> b!1007875 m!933239))

(declare-fun m!933241 () Bool)

(assert (=> b!1007875 m!933241))

(declare-fun m!933243 () Bool)

(assert (=> b!1007873 m!933243))

(declare-fun m!933245 () Bool)

(assert (=> b!1007877 m!933245))

(declare-fun m!933247 () Bool)

(assert (=> b!1007866 m!933247))

(declare-fun m!933249 () Bool)

(assert (=> b!1007872 m!933249))

(assert (=> b!1007872 m!933249))

(declare-fun m!933251 () Bool)

(assert (=> b!1007872 m!933251))

(assert (=> b!1007868 m!933249))

(assert (=> b!1007868 m!933249))

(declare-fun m!933253 () Bool)

(assert (=> b!1007868 m!933253))

(declare-fun m!933255 () Bool)

(assert (=> start!87040 m!933255))

(declare-fun m!933257 () Bool)

(assert (=> start!87040 m!933257))

(declare-fun m!933259 () Bool)

(assert (=> b!1007874 m!933259))

(declare-fun m!933261 () Bool)

(assert (=> b!1007878 m!933261))

(assert (=> b!1007869 m!933249))

(assert (=> b!1007869 m!933249))

(declare-fun m!933263 () Bool)

(assert (=> b!1007869 m!933263))

(assert (=> b!1007869 m!933263))

(assert (=> b!1007869 m!933249))

(declare-fun m!933265 () Bool)

(assert (=> b!1007869 m!933265))

(check-sat (not b!1007877) (not b!1007874) (not b!1007869) (not b!1007878) (not b!1007868) (not b!1007866) (not b!1007875) (not b!1007873) (not b!1007872) (not b!1007871) (not start!87040))
(check-sat)
