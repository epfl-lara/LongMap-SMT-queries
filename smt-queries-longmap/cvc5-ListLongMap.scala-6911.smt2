; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86882 () Bool)

(assert start!86882)

(declare-fun b!1007297 () Bool)

(declare-fun e!566928 () Bool)

(declare-fun e!566924 () Bool)

(assert (=> b!1007297 (= e!566928 e!566924)))

(declare-fun res!676196 () Bool)

(assert (=> b!1007297 (=> (not res!676196) (not e!566924))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!445131 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9518 0))(
  ( (MissingZero!9518 (index!40443 (_ BitVec 32))) (Found!9518 (index!40444 (_ BitVec 32))) (Intermediate!9518 (undefined!10330 Bool) (index!40445 (_ BitVec 32)) (x!87844 (_ BitVec 32))) (Undefined!9518) (MissingVacant!9518 (index!40446 (_ BitVec 32))) )
))
(declare-fun lt!445132 () SeekEntryResult!9518)

(declare-datatypes ((array!63530 0))(
  ( (array!63531 (arr!30586 (Array (_ BitVec 32) (_ BitVec 64))) (size!31088 (_ BitVec 32))) )
))
(declare-fun lt!445130 () array!63530)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63530 (_ BitVec 32)) SeekEntryResult!9518)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007297 (= res!676196 (not (= lt!445132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445131 mask!3464) lt!445131 lt!445130 mask!3464))))))

(declare-fun a!3219 () array!63530)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1007297 (= lt!445131 (select (store (arr!30586 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1007297 (= lt!445130 (array!63531 (store (arr!30586 a!3219) i!1194 k!2224) (size!31088 a!3219)))))

(declare-fun b!1007298 () Bool)

(declare-fun res!676191 () Bool)

(declare-fun e!566925 () Bool)

(assert (=> b!1007298 (=> (not res!676191) (not e!566925))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1007298 (= res!676191 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31088 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31088 a!3219))))))

(declare-fun b!1007299 () Bool)

(declare-fun res!676201 () Bool)

(declare-fun e!566926 () Bool)

(assert (=> b!1007299 (=> (not res!676201) (not e!566926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1007299 (= res!676201 (validKeyInArray!0 (select (arr!30586 a!3219) j!170)))))

(declare-fun b!1007300 () Bool)

(declare-fun res!676192 () Bool)

(assert (=> b!1007300 (=> (not res!676192) (not e!566924))))

(declare-fun lt!445129 () SeekEntryResult!9518)

(assert (=> b!1007300 (= res!676192 (not (= lt!445129 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445131 lt!445130 mask!3464))))))

(declare-fun b!1007301 () Bool)

(declare-fun res!676195 () Bool)

(assert (=> b!1007301 (=> (not res!676195) (not e!566925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63530 (_ BitVec 32)) Bool)

(assert (=> b!1007301 (= res!676195 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1007302 () Bool)

(declare-fun res!676200 () Bool)

(assert (=> b!1007302 (=> (not res!676200) (not e!566926))))

(declare-fun arrayContainsKey!0 (array!63530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1007302 (= res!676200 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!676190 () Bool)

(assert (=> start!86882 (=> (not res!676190) (not e!566926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86882 (= res!676190 (validMask!0 mask!3464))))

(assert (=> start!86882 e!566926))

(declare-fun array_inv!23710 (array!63530) Bool)

(assert (=> start!86882 (array_inv!23710 a!3219)))

(assert (=> start!86882 true))

(declare-fun b!1007303 () Bool)

(declare-fun res!676193 () Bool)

(assert (=> b!1007303 (=> (not res!676193) (not e!566926))))

(assert (=> b!1007303 (= res!676193 (and (= (size!31088 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31088 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31088 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1007304 () Bool)

(declare-fun res!676198 () Bool)

(assert (=> b!1007304 (=> (not res!676198) (not e!566925))))

(declare-datatypes ((List!21262 0))(
  ( (Nil!21259) (Cons!21258 (h!22444 (_ BitVec 64)) (t!30263 List!21262)) )
))
(declare-fun arrayNoDuplicates!0 (array!63530 (_ BitVec 32) List!21262) Bool)

(assert (=> b!1007304 (= res!676198 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21259))))

(declare-fun b!1007305 () Bool)

(declare-fun e!566929 () Bool)

(assert (=> b!1007305 (= e!566925 e!566929)))

(declare-fun res!676203 () Bool)

(assert (=> b!1007305 (=> (not res!676203) (not e!566929))))

(declare-fun lt!445133 () SeekEntryResult!9518)

(assert (=> b!1007305 (= res!676203 (= lt!445132 lt!445133))))

(assert (=> b!1007305 (= lt!445133 (Intermediate!9518 false resIndex!38 resX!38))))

(assert (=> b!1007305 (= lt!445132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30586 a!3219) j!170) mask!3464) (select (arr!30586 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007306 () Bool)

(assert (=> b!1007306 (= e!566924 false)))

(declare-fun lt!445127 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1007306 (= lt!445127 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1007307 () Bool)

(declare-fun res!676202 () Bool)

(assert (=> b!1007307 (=> (not res!676202) (not e!566924))))

(assert (=> b!1007307 (= res!676202 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1007308 () Bool)

(declare-fun res!676197 () Bool)

(assert (=> b!1007308 (=> (not res!676197) (not e!566926))))

(assert (=> b!1007308 (= res!676197 (validKeyInArray!0 k!2224))))

(declare-fun b!1007309 () Bool)

(assert (=> b!1007309 (= e!566929 e!566928)))

(declare-fun res!676199 () Bool)

(assert (=> b!1007309 (=> (not res!676199) (not e!566928))))

(assert (=> b!1007309 (= res!676199 (= lt!445129 lt!445133))))

(assert (=> b!1007309 (= lt!445129 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30586 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1007310 () Bool)

(assert (=> b!1007310 (= e!566926 e!566925)))

(declare-fun res!676194 () Bool)

(assert (=> b!1007310 (=> (not res!676194) (not e!566925))))

(declare-fun lt!445128 () SeekEntryResult!9518)

(assert (=> b!1007310 (= res!676194 (or (= lt!445128 (MissingVacant!9518 i!1194)) (= lt!445128 (MissingZero!9518 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63530 (_ BitVec 32)) SeekEntryResult!9518)

(assert (=> b!1007310 (= lt!445128 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86882 res!676190) b!1007303))

(assert (= (and b!1007303 res!676193) b!1007299))

(assert (= (and b!1007299 res!676201) b!1007308))

(assert (= (and b!1007308 res!676197) b!1007302))

(assert (= (and b!1007302 res!676200) b!1007310))

(assert (= (and b!1007310 res!676194) b!1007301))

(assert (= (and b!1007301 res!676195) b!1007304))

(assert (= (and b!1007304 res!676198) b!1007298))

(assert (= (and b!1007298 res!676191) b!1007305))

(assert (= (and b!1007305 res!676203) b!1007309))

(assert (= (and b!1007309 res!676199) b!1007297))

(assert (= (and b!1007297 res!676196) b!1007300))

(assert (= (and b!1007300 res!676192) b!1007307))

(assert (= (and b!1007307 res!676202) b!1007306))

(declare-fun m!932207 () Bool)

(assert (=> b!1007309 m!932207))

(assert (=> b!1007309 m!932207))

(declare-fun m!932209 () Bool)

(assert (=> b!1007309 m!932209))

(declare-fun m!932211 () Bool)

(assert (=> b!1007300 m!932211))

(declare-fun m!932213 () Bool)

(assert (=> b!1007306 m!932213))

(assert (=> b!1007299 m!932207))

(assert (=> b!1007299 m!932207))

(declare-fun m!932215 () Bool)

(assert (=> b!1007299 m!932215))

(declare-fun m!932217 () Bool)

(assert (=> b!1007297 m!932217))

(assert (=> b!1007297 m!932217))

(declare-fun m!932219 () Bool)

(assert (=> b!1007297 m!932219))

(declare-fun m!932221 () Bool)

(assert (=> b!1007297 m!932221))

(declare-fun m!932223 () Bool)

(assert (=> b!1007297 m!932223))

(declare-fun m!932225 () Bool)

(assert (=> b!1007302 m!932225))

(declare-fun m!932227 () Bool)

(assert (=> b!1007301 m!932227))

(declare-fun m!932229 () Bool)

(assert (=> start!86882 m!932229))

(declare-fun m!932231 () Bool)

(assert (=> start!86882 m!932231))

(declare-fun m!932233 () Bool)

(assert (=> b!1007310 m!932233))

(assert (=> b!1007305 m!932207))

(assert (=> b!1007305 m!932207))

(declare-fun m!932235 () Bool)

(assert (=> b!1007305 m!932235))

(assert (=> b!1007305 m!932235))

(assert (=> b!1007305 m!932207))

(declare-fun m!932237 () Bool)

(assert (=> b!1007305 m!932237))

(declare-fun m!932239 () Bool)

(assert (=> b!1007304 m!932239))

(declare-fun m!932241 () Bool)

(assert (=> b!1007308 m!932241))

(push 1)

