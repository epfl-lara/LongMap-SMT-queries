; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46988 () Bool)

(assert start!46988)

(declare-fun b!518174 () Bool)

(declare-fun res!317252 () Bool)

(declare-fun e!302346 () Bool)

(assert (=> b!518174 (=> res!317252 e!302346)))

(declare-datatypes ((SeekEntryResult!4351 0))(
  ( (MissingZero!4351 (index!19592 (_ BitVec 32))) (Found!4351 (index!19593 (_ BitVec 32))) (Intermediate!4351 (undefined!5163 Bool) (index!19594 (_ BitVec 32)) (x!48705 (_ BitVec 32))) (Undefined!4351) (MissingVacant!4351 (index!19595 (_ BitVec 32))) )
))
(declare-fun lt!237240 () SeekEntryResult!4351)

(get-info :version)

(assert (=> b!518174 (= res!317252 (or (undefined!5163 lt!237240) (not ((_ is Intermediate!4351) lt!237240))))))

(declare-fun b!518175 () Bool)

(declare-fun res!317253 () Bool)

(declare-fun e!302345 () Bool)

(assert (=> b!518175 (=> (not res!317253) (not e!302345))))

(declare-datatypes ((array!33130 0))(
  ( (array!33131 (arr!15928 (Array (_ BitVec 32) (_ BitVec 64))) (size!16292 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33130)

(declare-datatypes ((List!9993 0))(
  ( (Nil!9990) (Cons!9989 (h!10896 (_ BitVec 64)) (t!16213 List!9993)) )
))
(declare-fun arrayNoDuplicates!0 (array!33130 (_ BitVec 32) List!9993) Bool)

(assert (=> b!518175 (= res!317253 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9990))))

(declare-fun b!518176 () Bool)

(declare-fun res!317248 () Bool)

(declare-fun e!302343 () Bool)

(assert (=> b!518176 (=> (not res!317248) (not e!302343))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518176 (= res!317248 (validKeyInArray!0 (select (arr!15928 a!3235) j!176)))))

(declare-fun b!518177 () Bool)

(declare-fun res!317244 () Bool)

(assert (=> b!518177 (=> (not res!317244) (not e!302345))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33130 (_ BitVec 32)) Bool)

(assert (=> b!518177 (= res!317244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518178 () Bool)

(declare-fun res!317249 () Bool)

(assert (=> b!518178 (=> (not res!317249) (not e!302343))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518178 (= res!317249 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518179 () Bool)

(declare-fun res!317250 () Bool)

(assert (=> b!518179 (=> (not res!317250) (not e!302343))))

(assert (=> b!518179 (= res!317250 (validKeyInArray!0 k0!2280))))

(declare-fun res!317254 () Bool)

(assert (=> start!46988 (=> (not res!317254) (not e!302343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46988 (= res!317254 (validMask!0 mask!3524))))

(assert (=> start!46988 e!302343))

(assert (=> start!46988 true))

(declare-fun array_inv!11787 (array!33130) Bool)

(assert (=> start!46988 (array_inv!11787 a!3235)))

(declare-fun b!518180 () Bool)

(declare-fun e!302341 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33130 (_ BitVec 32)) SeekEntryResult!4351)

(assert (=> b!518180 (= e!302341 (= (seekEntryOrOpen!0 (select (arr!15928 a!3235) j!176) a!3235 mask!3524) (Found!4351 j!176)))))

(declare-fun b!518181 () Bool)

(assert (=> b!518181 (= e!302343 e!302345)))

(declare-fun res!317251 () Bool)

(assert (=> b!518181 (=> (not res!317251) (not e!302345))))

(declare-fun lt!237241 () SeekEntryResult!4351)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518181 (= res!317251 (or (= lt!237241 (MissingZero!4351 i!1204)) (= lt!237241 (MissingVacant!4351 i!1204))))))

(assert (=> b!518181 (= lt!237241 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518182 () Bool)

(declare-fun e!302342 () Bool)

(assert (=> b!518182 (= e!302346 e!302342)))

(declare-fun res!317247 () Bool)

(assert (=> b!518182 (=> res!317247 e!302342)))

(assert (=> b!518182 (= res!317247 (not (= (select (arr!15928 a!3235) (index!19594 lt!237240)) (select (arr!15928 a!3235) j!176))))))

(assert (=> b!518182 (and (bvslt (x!48705 lt!237240) #b01111111111111111111111111111110) (or (= (select (arr!15928 a!3235) (index!19594 lt!237240)) (select (arr!15928 a!3235) j!176)) (= (select (arr!15928 a!3235) (index!19594 lt!237240)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15928 a!3235) (index!19594 lt!237240)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518183 () Bool)

(assert (=> b!518183 (= e!302342 false)))

(declare-fun lt!237243 () (_ BitVec 32))

(declare-fun lt!237242 () array!33130)

(declare-fun lt!237246 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33130 (_ BitVec 32)) SeekEntryResult!4351)

(assert (=> b!518183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237243 lt!237246 lt!237242 mask!3524) (Intermediate!4351 false (index!19594 lt!237240) (x!48705 lt!237240)))))

(declare-datatypes ((Unit!16021 0))(
  ( (Unit!16022) )
))
(declare-fun lt!237244 () Unit!16021)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33130 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16021)

(assert (=> b!518183 (= lt!237244 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237243 #b00000000000000000000000000000000 (index!19594 lt!237240) (x!48705 lt!237240) mask!3524))))

(declare-fun b!518184 () Bool)

(assert (=> b!518184 (= e!302345 (not e!302346))))

(declare-fun res!317245 () Bool)

(assert (=> b!518184 (=> res!317245 e!302346)))

(declare-fun lt!237245 () (_ BitVec 32))

(assert (=> b!518184 (= res!317245 (= lt!237240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237245 lt!237246 lt!237242 mask!3524)))))

(assert (=> b!518184 (= lt!237240 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237243 (select (arr!15928 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518184 (= lt!237245 (toIndex!0 lt!237246 mask!3524))))

(assert (=> b!518184 (= lt!237246 (select (store (arr!15928 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!518184 (= lt!237243 (toIndex!0 (select (arr!15928 a!3235) j!176) mask!3524))))

(assert (=> b!518184 (= lt!237242 (array!33131 (store (arr!15928 a!3235) i!1204 k0!2280) (size!16292 a!3235)))))

(assert (=> b!518184 e!302341))

(declare-fun res!317246 () Bool)

(assert (=> b!518184 (=> (not res!317246) (not e!302341))))

(assert (=> b!518184 (= res!317246 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237247 () Unit!16021)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16021)

(assert (=> b!518184 (= lt!237247 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518185 () Bool)

(declare-fun res!317243 () Bool)

(assert (=> b!518185 (=> (not res!317243) (not e!302343))))

(assert (=> b!518185 (= res!317243 (and (= (size!16292 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16292 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16292 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46988 res!317254) b!518185))

(assert (= (and b!518185 res!317243) b!518176))

(assert (= (and b!518176 res!317248) b!518179))

(assert (= (and b!518179 res!317250) b!518178))

(assert (= (and b!518178 res!317249) b!518181))

(assert (= (and b!518181 res!317251) b!518177))

(assert (= (and b!518177 res!317244) b!518175))

(assert (= (and b!518175 res!317253) b!518184))

(assert (= (and b!518184 res!317246) b!518180))

(assert (= (and b!518184 (not res!317245)) b!518174))

(assert (= (and b!518174 (not res!317252)) b!518182))

(assert (= (and b!518182 (not res!317247)) b!518183))

(declare-fun m!499783 () Bool)

(assert (=> b!518180 m!499783))

(assert (=> b!518180 m!499783))

(declare-fun m!499785 () Bool)

(assert (=> b!518180 m!499785))

(declare-fun m!499787 () Bool)

(assert (=> b!518183 m!499787))

(declare-fun m!499789 () Bool)

(assert (=> b!518183 m!499789))

(declare-fun m!499791 () Bool)

(assert (=> b!518184 m!499791))

(declare-fun m!499793 () Bool)

(assert (=> b!518184 m!499793))

(assert (=> b!518184 m!499783))

(declare-fun m!499795 () Bool)

(assert (=> b!518184 m!499795))

(assert (=> b!518184 m!499783))

(declare-fun m!499797 () Bool)

(assert (=> b!518184 m!499797))

(declare-fun m!499799 () Bool)

(assert (=> b!518184 m!499799))

(declare-fun m!499801 () Bool)

(assert (=> b!518184 m!499801))

(assert (=> b!518184 m!499783))

(declare-fun m!499803 () Bool)

(assert (=> b!518184 m!499803))

(declare-fun m!499805 () Bool)

(assert (=> b!518184 m!499805))

(declare-fun m!499807 () Bool)

(assert (=> b!518177 m!499807))

(declare-fun m!499809 () Bool)

(assert (=> start!46988 m!499809))

(declare-fun m!499811 () Bool)

(assert (=> start!46988 m!499811))

(declare-fun m!499813 () Bool)

(assert (=> b!518178 m!499813))

(assert (=> b!518176 m!499783))

(assert (=> b!518176 m!499783))

(declare-fun m!499815 () Bool)

(assert (=> b!518176 m!499815))

(declare-fun m!499817 () Bool)

(assert (=> b!518182 m!499817))

(assert (=> b!518182 m!499783))

(declare-fun m!499819 () Bool)

(assert (=> b!518179 m!499819))

(declare-fun m!499821 () Bool)

(assert (=> b!518181 m!499821))

(declare-fun m!499823 () Bool)

(assert (=> b!518175 m!499823))

(check-sat (not b!518183) (not start!46988) (not b!518176) (not b!518175) (not b!518177) (not b!518181) (not b!518180) (not b!518178) (not b!518184) (not b!518179))
(check-sat)
