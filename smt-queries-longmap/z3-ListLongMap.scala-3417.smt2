; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47414 () Bool)

(assert start!47414)

(declare-fun b!521811 () Bool)

(declare-fun e!304392 () Bool)

(declare-fun e!304397 () Bool)

(assert (=> b!521811 (= e!304392 e!304397)))

(declare-fun res!319603 () Bool)

(assert (=> b!521811 (=> (not res!319603) (not e!304397))))

(declare-datatypes ((SeekEntryResult!4399 0))(
  ( (MissingZero!4399 (index!19799 (_ BitVec 32))) (Found!4399 (index!19800 (_ BitVec 32))) (Intermediate!4399 (undefined!5211 Bool) (index!19801 (_ BitVec 32)) (x!48926 (_ BitVec 32))) (Undefined!4399) (MissingVacant!4399 (index!19802 (_ BitVec 32))) )
))
(declare-fun lt!239251 () SeekEntryResult!4399)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521811 (= res!319603 (or (= lt!239251 (MissingZero!4399 i!1204)) (= lt!239251 (MissingVacant!4399 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33241 0))(
  ( (array!33242 (arr!15976 (Array (_ BitVec 32) (_ BitVec 64))) (size!16340 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33241)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33241 (_ BitVec 32)) SeekEntryResult!4399)

(assert (=> b!521811 (= lt!239251 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521812 () Bool)

(declare-fun e!304396 () Bool)

(assert (=> b!521812 (= e!304396 true)))

(declare-fun lt!239254 () SeekEntryResult!4399)

(assert (=> b!521812 (and (or (= (select (arr!15976 a!3235) (index!19801 lt!239254)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15976 a!3235) (index!19801 lt!239254)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15976 a!3235) (index!19801 lt!239254)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15976 a!3235) (index!19801 lt!239254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16207 0))(
  ( (Unit!16208) )
))
(declare-fun lt!239252 () Unit!16207)

(declare-fun e!304398 () Unit!16207)

(assert (=> b!521812 (= lt!239252 e!304398)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!61406 () Bool)

(assert (=> b!521812 (= c!61406 (= (select (arr!15976 a!3235) (index!19801 lt!239254)) (select (arr!15976 a!3235) j!176)))))

(assert (=> b!521812 (and (bvslt (x!48926 lt!239254) #b01111111111111111111111111111110) (or (= (select (arr!15976 a!3235) (index!19801 lt!239254)) (select (arr!15976 a!3235) j!176)) (= (select (arr!15976 a!3235) (index!19801 lt!239254)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15976 a!3235) (index!19801 lt!239254)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!304393 () Bool)

(declare-fun b!521813 () Bool)

(assert (=> b!521813 (= e!304393 (= (seekEntryOrOpen!0 (select (arr!15976 a!3235) j!176) a!3235 mask!3524) (Found!4399 j!176)))))

(declare-fun b!521814 () Bool)

(declare-fun Unit!16209 () Unit!16207)

(assert (=> b!521814 (= e!304398 Unit!16209)))

(declare-fun b!521815 () Bool)

(declare-fun res!319602 () Bool)

(assert (=> b!521815 (=> res!319602 e!304396)))

(get-info :version)

(assert (=> b!521815 (= res!319602 (or (undefined!5211 lt!239254) (not ((_ is Intermediate!4399) lt!239254))))))

(declare-fun b!521816 () Bool)

(declare-fun res!319604 () Bool)

(assert (=> b!521816 (=> (not res!319604) (not e!304392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521816 (= res!319604 (validKeyInArray!0 (select (arr!15976 a!3235) j!176)))))

(declare-fun b!521817 () Bool)

(declare-fun res!319609 () Bool)

(assert (=> b!521817 (=> (not res!319609) (not e!304397))))

(declare-datatypes ((List!10041 0))(
  ( (Nil!10038) (Cons!10037 (h!10959 (_ BitVec 64)) (t!16261 List!10041)) )
))
(declare-fun arrayNoDuplicates!0 (array!33241 (_ BitVec 32) List!10041) Bool)

(assert (=> b!521817 (= res!319609 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10038))))

(declare-fun b!521818 () Bool)

(declare-fun res!319601 () Bool)

(assert (=> b!521818 (=> (not res!319601) (not e!304392))))

(assert (=> b!521818 (= res!319601 (and (= (size!16340 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16340 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16340 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521819 () Bool)

(declare-fun Unit!16210 () Unit!16207)

(assert (=> b!521819 (= e!304398 Unit!16210)))

(declare-fun lt!239256 () (_ BitVec 32))

(declare-fun lt!239253 () Unit!16207)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33241 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16207)

(assert (=> b!521819 (= lt!239253 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239256 #b00000000000000000000000000000000 (index!19801 lt!239254) (x!48926 lt!239254) mask!3524))))

(declare-fun res!319605 () Bool)

(declare-fun lt!239257 () (_ BitVec 64))

(declare-fun lt!239255 () array!33241)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33241 (_ BitVec 32)) SeekEntryResult!4399)

(assert (=> b!521819 (= res!319605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239256 lt!239257 lt!239255 mask!3524) (Intermediate!4399 false (index!19801 lt!239254) (x!48926 lt!239254))))))

(declare-fun e!304395 () Bool)

(assert (=> b!521819 (=> (not res!319605) (not e!304395))))

(assert (=> b!521819 e!304395))

(declare-fun res!319608 () Bool)

(assert (=> start!47414 (=> (not res!319608) (not e!304392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47414 (= res!319608 (validMask!0 mask!3524))))

(assert (=> start!47414 e!304392))

(assert (=> start!47414 true))

(declare-fun array_inv!11835 (array!33241) Bool)

(assert (=> start!47414 (array_inv!11835 a!3235)))

(declare-fun b!521820 () Bool)

(assert (=> b!521820 (= e!304397 (not e!304396))))

(declare-fun res!319612 () Bool)

(assert (=> b!521820 (=> res!319612 e!304396)))

(declare-fun lt!239249 () (_ BitVec 32))

(assert (=> b!521820 (= res!319612 (= lt!239254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239249 lt!239257 lt!239255 mask!3524)))))

(assert (=> b!521820 (= lt!239254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239256 (select (arr!15976 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521820 (= lt!239249 (toIndex!0 lt!239257 mask!3524))))

(assert (=> b!521820 (= lt!239257 (select (store (arr!15976 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521820 (= lt!239256 (toIndex!0 (select (arr!15976 a!3235) j!176) mask!3524))))

(assert (=> b!521820 (= lt!239255 (array!33242 (store (arr!15976 a!3235) i!1204 k0!2280) (size!16340 a!3235)))))

(assert (=> b!521820 e!304393))

(declare-fun res!319610 () Bool)

(assert (=> b!521820 (=> (not res!319610) (not e!304393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33241 (_ BitVec 32)) Bool)

(assert (=> b!521820 (= res!319610 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239250 () Unit!16207)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16207)

(assert (=> b!521820 (= lt!239250 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521821 () Bool)

(declare-fun res!319607 () Bool)

(assert (=> b!521821 (=> (not res!319607) (not e!304397))))

(assert (=> b!521821 (= res!319607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521822 () Bool)

(declare-fun res!319606 () Bool)

(assert (=> b!521822 (=> (not res!319606) (not e!304392))))

(declare-fun arrayContainsKey!0 (array!33241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521822 (= res!319606 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521823 () Bool)

(assert (=> b!521823 (= e!304395 false)))

(declare-fun b!521824 () Bool)

(declare-fun res!319611 () Bool)

(assert (=> b!521824 (=> (not res!319611) (not e!304392))))

(assert (=> b!521824 (= res!319611 (validKeyInArray!0 k0!2280))))

(assert (= (and start!47414 res!319608) b!521818))

(assert (= (and b!521818 res!319601) b!521816))

(assert (= (and b!521816 res!319604) b!521824))

(assert (= (and b!521824 res!319611) b!521822))

(assert (= (and b!521822 res!319606) b!521811))

(assert (= (and b!521811 res!319603) b!521821))

(assert (= (and b!521821 res!319607) b!521817))

(assert (= (and b!521817 res!319609) b!521820))

(assert (= (and b!521820 res!319610) b!521813))

(assert (= (and b!521820 (not res!319612)) b!521815))

(assert (= (and b!521815 (not res!319602)) b!521812))

(assert (= (and b!521812 c!61406) b!521819))

(assert (= (and b!521812 (not c!61406)) b!521814))

(assert (= (and b!521819 res!319605) b!521823))

(declare-fun m!502969 () Bool)

(assert (=> b!521824 m!502969))

(declare-fun m!502971 () Bool)

(assert (=> b!521821 m!502971))

(declare-fun m!502973 () Bool)

(assert (=> b!521811 m!502973))

(declare-fun m!502975 () Bool)

(assert (=> b!521817 m!502975))

(declare-fun m!502977 () Bool)

(assert (=> b!521820 m!502977))

(declare-fun m!502979 () Bool)

(assert (=> b!521820 m!502979))

(declare-fun m!502981 () Bool)

(assert (=> b!521820 m!502981))

(declare-fun m!502983 () Bool)

(assert (=> b!521820 m!502983))

(declare-fun m!502985 () Bool)

(assert (=> b!521820 m!502985))

(declare-fun m!502987 () Bool)

(assert (=> b!521820 m!502987))

(declare-fun m!502989 () Bool)

(assert (=> b!521820 m!502989))

(assert (=> b!521820 m!502985))

(declare-fun m!502991 () Bool)

(assert (=> b!521820 m!502991))

(assert (=> b!521820 m!502985))

(declare-fun m!502993 () Bool)

(assert (=> b!521820 m!502993))

(assert (=> b!521816 m!502985))

(assert (=> b!521816 m!502985))

(declare-fun m!502995 () Bool)

(assert (=> b!521816 m!502995))

(declare-fun m!502997 () Bool)

(assert (=> b!521812 m!502997))

(assert (=> b!521812 m!502985))

(declare-fun m!502999 () Bool)

(assert (=> b!521822 m!502999))

(assert (=> b!521813 m!502985))

(assert (=> b!521813 m!502985))

(declare-fun m!503001 () Bool)

(assert (=> b!521813 m!503001))

(declare-fun m!503003 () Bool)

(assert (=> start!47414 m!503003))

(declare-fun m!503005 () Bool)

(assert (=> start!47414 m!503005))

(declare-fun m!503007 () Bool)

(assert (=> b!521819 m!503007))

(declare-fun m!503009 () Bool)

(assert (=> b!521819 m!503009))

(check-sat (not b!521822) (not b!521811) (not start!47414) (not b!521816) (not b!521821) (not b!521813) (not b!521817) (not b!521824) (not b!521819) (not b!521820))
(check-sat)
