; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86764 () Bool)

(assert start!86764)

(declare-fun b!1005870 () Bool)

(declare-fun res!674962 () Bool)

(declare-fun e!566297 () Bool)

(assert (=> b!1005870 (=> (not res!674962) (not e!566297))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-datatypes ((array!63463 0))(
  ( (array!63464 (arr!30554 (Array (_ BitVec 32) (_ BitVec 64))) (size!31056 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63463)

(declare-datatypes ((SeekEntryResult!9486 0))(
  ( (MissingZero!9486 (index!40315 (_ BitVec 32))) (Found!9486 (index!40316 (_ BitVec 32))) (Intermediate!9486 (undefined!10298 Bool) (index!40317 (_ BitVec 32)) (x!87718 (_ BitVec 32))) (Undefined!9486) (MissingVacant!9486 (index!40318 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63463 (_ BitVec 32)) SeekEntryResult!9486)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005870 (= res!674962 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30554 a!3219) j!170) mask!3464) (select (arr!30554 a!3219) j!170) a!3219 mask!3464) (Intermediate!9486 false resIndex!38 resX!38)))))

(declare-fun b!1005871 () Bool)

(declare-fun res!674966 () Bool)

(assert (=> b!1005871 (=> (not res!674966) (not e!566297))))

(declare-datatypes ((List!21230 0))(
  ( (Nil!21227) (Cons!21226 (h!22409 (_ BitVec 64)) (t!30231 List!21230)) )
))
(declare-fun arrayNoDuplicates!0 (array!63463 (_ BitVec 32) List!21230) Bool)

(assert (=> b!1005871 (= res!674966 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21227))))

(declare-fun res!674964 () Bool)

(declare-fun e!566298 () Bool)

(assert (=> start!86764 (=> (not res!674964) (not e!566298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86764 (= res!674964 (validMask!0 mask!3464))))

(assert (=> start!86764 e!566298))

(declare-fun array_inv!23678 (array!63463) Bool)

(assert (=> start!86764 (array_inv!23678 a!3219)))

(assert (=> start!86764 true))

(declare-fun b!1005872 () Bool)

(declare-fun res!674960 () Bool)

(assert (=> b!1005872 (=> (not res!674960) (not e!566298))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005872 (= res!674960 (and (= (size!31056 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31056 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31056 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005873 () Bool)

(declare-fun res!674963 () Bool)

(assert (=> b!1005873 (=> (not res!674963) (not e!566297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63463 (_ BitVec 32)) Bool)

(assert (=> b!1005873 (= res!674963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005874 () Bool)

(assert (=> b!1005874 (= e!566297 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!444641 () SeekEntryResult!9486)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1005874 (= lt!444641 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30554 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005875 () Bool)

(declare-fun res!674965 () Bool)

(assert (=> b!1005875 (=> (not res!674965) (not e!566298))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005875 (= res!674965 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005876 () Bool)

(assert (=> b!1005876 (= e!566298 e!566297)))

(declare-fun res!674958 () Bool)

(assert (=> b!1005876 (=> (not res!674958) (not e!566297))))

(declare-fun lt!444640 () SeekEntryResult!9486)

(assert (=> b!1005876 (= res!674958 (or (= lt!444640 (MissingVacant!9486 i!1194)) (= lt!444640 (MissingZero!9486 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63463 (_ BitVec 32)) SeekEntryResult!9486)

(assert (=> b!1005876 (= lt!444640 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005877 () Bool)

(declare-fun res!674961 () Bool)

(assert (=> b!1005877 (=> (not res!674961) (not e!566297))))

(assert (=> b!1005877 (= res!674961 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31056 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31056 a!3219))))))

(declare-fun b!1005878 () Bool)

(declare-fun res!674959 () Bool)

(assert (=> b!1005878 (=> (not res!674959) (not e!566298))))

(assert (=> b!1005878 (= res!674959 (validKeyInArray!0 (select (arr!30554 a!3219) j!170)))))

(declare-fun b!1005879 () Bool)

(declare-fun res!674967 () Bool)

(assert (=> b!1005879 (=> (not res!674967) (not e!566298))))

(declare-fun arrayContainsKey!0 (array!63463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005879 (= res!674967 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86764 res!674964) b!1005872))

(assert (= (and b!1005872 res!674960) b!1005878))

(assert (= (and b!1005878 res!674959) b!1005875))

(assert (= (and b!1005875 res!674965) b!1005879))

(assert (= (and b!1005879 res!674967) b!1005876))

(assert (= (and b!1005876 res!674958) b!1005873))

(assert (= (and b!1005873 res!674963) b!1005871))

(assert (= (and b!1005871 res!674966) b!1005877))

(assert (= (and b!1005877 res!674961) b!1005870))

(assert (= (and b!1005870 res!674962) b!1005874))

(declare-fun m!931025 () Bool)

(assert (=> b!1005879 m!931025))

(declare-fun m!931027 () Bool)

(assert (=> start!86764 m!931027))

(declare-fun m!931029 () Bool)

(assert (=> start!86764 m!931029))

(declare-fun m!931031 () Bool)

(assert (=> b!1005878 m!931031))

(assert (=> b!1005878 m!931031))

(declare-fun m!931033 () Bool)

(assert (=> b!1005878 m!931033))

(declare-fun m!931035 () Bool)

(assert (=> b!1005873 m!931035))

(declare-fun m!931037 () Bool)

(assert (=> b!1005876 m!931037))

(assert (=> b!1005874 m!931031))

(assert (=> b!1005874 m!931031))

(declare-fun m!931039 () Bool)

(assert (=> b!1005874 m!931039))

(declare-fun m!931041 () Bool)

(assert (=> b!1005875 m!931041))

(declare-fun m!931043 () Bool)

(assert (=> b!1005871 m!931043))

(assert (=> b!1005870 m!931031))

(assert (=> b!1005870 m!931031))

(declare-fun m!931045 () Bool)

(assert (=> b!1005870 m!931045))

(assert (=> b!1005870 m!931045))

(assert (=> b!1005870 m!931031))

(declare-fun m!931047 () Bool)

(assert (=> b!1005870 m!931047))

(check-sat (not b!1005870) (not b!1005874) (not b!1005878) (not b!1005871) (not b!1005879) (not b!1005873) (not start!86764) (not b!1005876) (not b!1005875))
(check-sat)
