; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87508 () Bool)

(assert start!87508)

(declare-fun b!1012989 () Bool)

(declare-fun e!569976 () Bool)

(declare-fun e!569979 () Bool)

(assert (=> b!1012989 (= e!569976 e!569979)))

(declare-fun res!680123 () Bool)

(assert (=> b!1012989 (=> (not res!680123) (not e!569979))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!447639 () (_ BitVec 64))

(declare-datatypes ((array!63723 0))(
  ( (array!63724 (arr!30670 (Array (_ BitVec 32) (_ BitVec 64))) (size!31173 (_ BitVec 32))) )
))
(declare-fun lt!447637 () array!63723)

(declare-datatypes ((SeekEntryResult!9538 0))(
  ( (MissingZero!9538 (index!40523 (_ BitVec 32))) (Found!9538 (index!40524 (_ BitVec 32))) (Intermediate!9538 (undefined!10350 Bool) (index!40525 (_ BitVec 32)) (x!88102 (_ BitVec 32))) (Undefined!9538) (MissingVacant!9538 (index!40526 (_ BitVec 32))) )
))
(declare-fun lt!447638 () SeekEntryResult!9538)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63723 (_ BitVec 32)) SeekEntryResult!9538)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1012989 (= res!680123 (not (= lt!447638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!447639 mask!3464) lt!447639 lt!447637 mask!3464))))))

(declare-fun a!3219 () array!63723)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1012989 (= lt!447639 (select (store (arr!30670 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1012989 (= lt!447637 (array!63724 (store (arr!30670 a!3219) i!1194 k0!2224) (size!31173 a!3219)))))

(declare-fun b!1012990 () Bool)

(declare-fun res!680122 () Bool)

(assert (=> b!1012990 (=> (not res!680122) (not e!569979))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!447641 () SeekEntryResult!9538)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1012990 (= res!680122 (not (= lt!447641 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!447639 lt!447637 mask!3464))))))

(declare-fun b!1012991 () Bool)

(declare-fun res!680125 () Bool)

(declare-fun e!569974 () Bool)

(assert (=> b!1012991 (=> (not res!680125) (not e!569974))))

(assert (=> b!1012991 (= res!680125 (and (= (size!31173 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31173 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31173 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1012992 () Bool)

(declare-fun e!569973 () Bool)

(assert (=> b!1012992 (= e!569973 (not true))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1012992 (= resIndex!38 i!1194)))

(declare-datatypes ((Unit!33025 0))(
  ( (Unit!33026) )
))
(declare-fun lt!447635 () Unit!33025)

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!447640 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!63723 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!33025)

(assert (=> b!1012992 (= lt!447635 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3219 i!1194 k0!2224 j!170 lt!447640 (bvadd #b00000000000000000000000000000001 x!1245) resIndex!38 resX!38 mask!3464))))

(declare-fun b!1012993 () Bool)

(declare-fun res!680127 () Bool)

(assert (=> b!1012993 (=> (not res!680127) (not e!569974))))

(declare-fun arrayContainsKey!0 (array!63723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1012993 (= res!680127 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1012994 () Bool)

(declare-fun res!680135 () Bool)

(assert (=> b!1012994 (=> (not res!680135) (not e!569974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1012994 (= res!680135 (validKeyInArray!0 (select (arr!30670 a!3219) j!170)))))

(declare-fun b!1012995 () Bool)

(declare-fun e!569975 () Bool)

(assert (=> b!1012995 (= e!569974 e!569975)))

(declare-fun res!680124 () Bool)

(assert (=> b!1012995 (=> (not res!680124) (not e!569975))))

(declare-fun lt!447633 () SeekEntryResult!9538)

(assert (=> b!1012995 (= res!680124 (or (= lt!447633 (MissingVacant!9538 i!1194)) (= lt!447633 (MissingZero!9538 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63723 (_ BitVec 32)) SeekEntryResult!9538)

(assert (=> b!1012995 (= lt!447633 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1012996 () Bool)

(declare-fun e!569978 () Bool)

(assert (=> b!1012996 (= e!569978 e!569976)))

(declare-fun res!680126 () Bool)

(assert (=> b!1012996 (=> (not res!680126) (not e!569976))))

(declare-fun lt!447636 () SeekEntryResult!9538)

(assert (=> b!1012996 (= res!680126 (= lt!447641 lt!447636))))

(assert (=> b!1012996 (= lt!447641 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30670 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1012997 () Bool)

(declare-fun res!680134 () Bool)

(assert (=> b!1012997 (=> (not res!680134) (not e!569975))))

(assert (=> b!1012997 (= res!680134 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31173 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31173 a!3219))))))

(declare-fun b!1012998 () Bool)

(declare-fun res!680138 () Bool)

(assert (=> b!1012998 (=> (not res!680138) (not e!569974))))

(assert (=> b!1012998 (= res!680138 (validKeyInArray!0 k0!2224))))

(declare-fun b!1012999 () Bool)

(declare-fun res!680132 () Bool)

(assert (=> b!1012999 (=> (not res!680132) (not e!569973))))

(declare-fun lt!447634 () SeekEntryResult!9538)

(assert (=> b!1012999 (= res!680132 (not (= lt!447634 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447640 lt!447639 lt!447637 mask!3464))))))

(declare-fun b!1013000 () Bool)

(declare-fun res!680129 () Bool)

(assert (=> b!1013000 (=> (not res!680129) (not e!569975))))

(declare-datatypes ((List!21317 0))(
  ( (Nil!21314) (Cons!21313 (h!22520 (_ BitVec 64)) (t!30310 List!21317)) )
))
(declare-fun arrayNoDuplicates!0 (array!63723 (_ BitVec 32) List!21317) Bool)

(assert (=> b!1013000 (= res!680129 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21314))))

(declare-fun res!680137 () Bool)

(assert (=> start!87508 (=> (not res!680137) (not e!569974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87508 (= res!680137 (validMask!0 mask!3464))))

(assert (=> start!87508 e!569974))

(declare-fun array_inv!23806 (array!63723) Bool)

(assert (=> start!87508 (array_inv!23806 a!3219)))

(assert (=> start!87508 true))

(declare-fun b!1013001 () Bool)

(declare-fun res!680131 () Bool)

(assert (=> b!1013001 (=> (not res!680131) (not e!569979))))

(assert (=> b!1013001 (= res!680131 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1013002 () Bool)

(declare-fun e!569977 () Bool)

(assert (=> b!1013002 (= e!569979 e!569977)))

(declare-fun res!680136 () Bool)

(assert (=> b!1013002 (=> (not res!680136) (not e!569977))))

(assert (=> b!1013002 (= res!680136 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!447640 #b00000000000000000000000000000000) (bvslt lt!447640 (size!31173 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1013002 (= lt!447640 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1013003 () Bool)

(assert (=> b!1013003 (= e!569975 e!569978)))

(declare-fun res!680133 () Bool)

(assert (=> b!1013003 (=> (not res!680133) (not e!569978))))

(assert (=> b!1013003 (= res!680133 (= lt!447638 lt!447636))))

(assert (=> b!1013003 (= lt!447636 (Intermediate!9538 false resIndex!38 resX!38))))

(assert (=> b!1013003 (= lt!447638 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30670 a!3219) j!170) mask!3464) (select (arr!30670 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1013004 () Bool)

(declare-fun res!680128 () Bool)

(assert (=> b!1013004 (=> (not res!680128) (not e!569975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63723 (_ BitVec 32)) Bool)

(assert (=> b!1013004 (= res!680128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1013005 () Bool)

(assert (=> b!1013005 (= e!569977 e!569973)))

(declare-fun res!680130 () Bool)

(assert (=> b!1013005 (=> (not res!680130) (not e!569973))))

(assert (=> b!1013005 (= res!680130 (= lt!447634 lt!447636))))

(assert (=> b!1013005 (= lt!447634 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!447640 (select (arr!30670 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!87508 res!680137) b!1012991))

(assert (= (and b!1012991 res!680125) b!1012994))

(assert (= (and b!1012994 res!680135) b!1012998))

(assert (= (and b!1012998 res!680138) b!1012993))

(assert (= (and b!1012993 res!680127) b!1012995))

(assert (= (and b!1012995 res!680124) b!1013004))

(assert (= (and b!1013004 res!680128) b!1013000))

(assert (= (and b!1013000 res!680129) b!1012997))

(assert (= (and b!1012997 res!680134) b!1013003))

(assert (= (and b!1013003 res!680133) b!1012996))

(assert (= (and b!1012996 res!680126) b!1012989))

(assert (= (and b!1012989 res!680123) b!1012990))

(assert (= (and b!1012990 res!680122) b!1013001))

(assert (= (and b!1013001 res!680131) b!1013002))

(assert (= (and b!1013002 res!680136) b!1013005))

(assert (= (and b!1013005 res!680130) b!1012999))

(assert (= (and b!1012999 res!680132) b!1012992))

(declare-fun m!937259 () Bool)

(assert (=> b!1012992 m!937259))

(declare-fun m!937261 () Bool)

(assert (=> start!87508 m!937261))

(declare-fun m!937263 () Bool)

(assert (=> start!87508 m!937263))

(declare-fun m!937265 () Bool)

(assert (=> b!1013002 m!937265))

(declare-fun m!937267 () Bool)

(assert (=> b!1012989 m!937267))

(assert (=> b!1012989 m!937267))

(declare-fun m!937269 () Bool)

(assert (=> b!1012989 m!937269))

(declare-fun m!937271 () Bool)

(assert (=> b!1012989 m!937271))

(declare-fun m!937273 () Bool)

(assert (=> b!1012989 m!937273))

(declare-fun m!937275 () Bool)

(assert (=> b!1013003 m!937275))

(assert (=> b!1013003 m!937275))

(declare-fun m!937277 () Bool)

(assert (=> b!1013003 m!937277))

(assert (=> b!1013003 m!937277))

(assert (=> b!1013003 m!937275))

(declare-fun m!937279 () Bool)

(assert (=> b!1013003 m!937279))

(declare-fun m!937281 () Bool)

(assert (=> b!1012990 m!937281))

(declare-fun m!937283 () Bool)

(assert (=> b!1012993 m!937283))

(declare-fun m!937285 () Bool)

(assert (=> b!1012999 m!937285))

(declare-fun m!937287 () Bool)

(assert (=> b!1012995 m!937287))

(declare-fun m!937289 () Bool)

(assert (=> b!1013004 m!937289))

(declare-fun m!937291 () Bool)

(assert (=> b!1013000 m!937291))

(assert (=> b!1013005 m!937275))

(assert (=> b!1013005 m!937275))

(declare-fun m!937293 () Bool)

(assert (=> b!1013005 m!937293))

(declare-fun m!937295 () Bool)

(assert (=> b!1012998 m!937295))

(assert (=> b!1012994 m!937275))

(assert (=> b!1012994 m!937275))

(declare-fun m!937297 () Bool)

(assert (=> b!1012994 m!937297))

(assert (=> b!1012996 m!937275))

(assert (=> b!1012996 m!937275))

(declare-fun m!937299 () Bool)

(assert (=> b!1012996 m!937299))

(check-sat (not b!1013004) (not b!1012996) (not start!87508) (not b!1012989) (not b!1012998) (not b!1012999) (not b!1012994) (not b!1013005) (not b!1012992) (not b!1013000) (not b!1012993) (not b!1012995) (not b!1013002) (not b!1012990) (not b!1013003))
(check-sat)
