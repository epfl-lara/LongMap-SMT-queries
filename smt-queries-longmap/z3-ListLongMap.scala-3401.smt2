; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46986 () Bool)

(assert start!46986)

(declare-fun b!517964 () Bool)

(declare-fun e!302207 () Bool)

(declare-fun e!302206 () Bool)

(assert (=> b!517964 (= e!302207 e!302206)))

(declare-fun res!317131 () Bool)

(assert (=> b!517964 (=> (not res!317131) (not e!302206))))

(declare-datatypes ((SeekEntryResult!4396 0))(
  ( (MissingZero!4396 (index!19772 (_ BitVec 32))) (Found!4396 (index!19773 (_ BitVec 32))) (Intermediate!4396 (undefined!5208 Bool) (index!19774 (_ BitVec 32)) (x!48748 (_ BitVec 32))) (Undefined!4396) (MissingVacant!4396 (index!19775 (_ BitVec 32))) )
))
(declare-fun lt!237000 () SeekEntryResult!4396)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517964 (= res!317131 (or (= lt!237000 (MissingZero!4396 i!1204)) (= lt!237000 (MissingVacant!4396 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33137 0))(
  ( (array!33138 (arr!15932 (Array (_ BitVec 32) (_ BitVec 64))) (size!16297 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33137)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33137 (_ BitVec 32)) SeekEntryResult!4396)

(assert (=> b!517964 (= lt!237000 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!517965 () Bool)

(declare-fun e!302209 () Bool)

(declare-fun e!302211 () Bool)

(assert (=> b!517965 (= e!302209 e!302211)))

(declare-fun res!317132 () Bool)

(assert (=> b!517965 (=> res!317132 e!302211)))

(declare-fun lt!236994 () SeekEntryResult!4396)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!517965 (= res!317132 (not (= (select (arr!15932 a!3235) (index!19774 lt!236994)) (select (arr!15932 a!3235) j!176))))))

(assert (=> b!517965 (and (bvslt (x!48748 lt!236994) #b01111111111111111111111111111110) (or (= (select (arr!15932 a!3235) (index!19774 lt!236994)) (select (arr!15932 a!3235) j!176)) (= (select (arr!15932 a!3235) (index!19774 lt!236994)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15932 a!3235) (index!19774 lt!236994)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!317127 () Bool)

(assert (=> start!46986 (=> (not res!317127) (not e!302207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46986 (= res!317127 (validMask!0 mask!3524))))

(assert (=> start!46986 e!302207))

(assert (=> start!46986 true))

(declare-fun array_inv!11815 (array!33137) Bool)

(assert (=> start!46986 (array_inv!11815 a!3235)))

(declare-fun b!517966 () Bool)

(declare-fun res!317121 () Bool)

(assert (=> b!517966 (=> (not res!317121) (not e!302207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517966 (= res!317121 (validKeyInArray!0 k0!2280))))

(declare-fun b!517967 () Bool)

(declare-fun res!317124 () Bool)

(assert (=> b!517967 (=> (not res!317124) (not e!302207))))

(assert (=> b!517967 (= res!317124 (and (= (size!16297 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16297 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16297 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517968 () Bool)

(declare-fun res!317125 () Bool)

(assert (=> b!517968 (=> res!317125 e!302209)))

(get-info :version)

(assert (=> b!517968 (= res!317125 (or (undefined!5208 lt!236994) (not ((_ is Intermediate!4396) lt!236994))))))

(declare-fun b!517969 () Bool)

(assert (=> b!517969 (= e!302206 (not e!302209))))

(declare-fun res!317128 () Bool)

(assert (=> b!517969 (=> res!317128 e!302209)))

(declare-fun lt!236997 () array!33137)

(declare-fun lt!236998 () (_ BitVec 32))

(declare-fun lt!237001 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33137 (_ BitVec 32)) SeekEntryResult!4396)

(assert (=> b!517969 (= res!317128 (= lt!236994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236998 lt!237001 lt!236997 mask!3524)))))

(declare-fun lt!236999 () (_ BitVec 32))

(assert (=> b!517969 (= lt!236994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236999 (select (arr!15932 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517969 (= lt!236998 (toIndex!0 lt!237001 mask!3524))))

(assert (=> b!517969 (= lt!237001 (select (store (arr!15932 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!517969 (= lt!236999 (toIndex!0 (select (arr!15932 a!3235) j!176) mask!3524))))

(assert (=> b!517969 (= lt!236997 (array!33138 (store (arr!15932 a!3235) i!1204 k0!2280) (size!16297 a!3235)))))

(declare-fun e!302210 () Bool)

(assert (=> b!517969 e!302210))

(declare-fun res!317130 () Bool)

(assert (=> b!517969 (=> (not res!317130) (not e!302210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33137 (_ BitVec 32)) Bool)

(assert (=> b!517969 (= res!317130 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16036 0))(
  ( (Unit!16037) )
))
(declare-fun lt!236996 () Unit!16036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16036)

(assert (=> b!517969 (= lt!236996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!517970 () Bool)

(assert (=> b!517970 (= e!302210 (= (seekEntryOrOpen!0 (select (arr!15932 a!3235) j!176) a!3235 mask!3524) (Found!4396 j!176)))))

(declare-fun b!517971 () Bool)

(declare-fun res!317129 () Bool)

(assert (=> b!517971 (=> (not res!317129) (not e!302206))))

(declare-datatypes ((List!10129 0))(
  ( (Nil!10126) (Cons!10125 (h!11032 (_ BitVec 64)) (t!16348 List!10129)) )
))
(declare-fun arrayNoDuplicates!0 (array!33137 (_ BitVec 32) List!10129) Bool)

(assert (=> b!517971 (= res!317129 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10126))))

(declare-fun b!517972 () Bool)

(declare-fun res!317126 () Bool)

(assert (=> b!517972 (=> (not res!317126) (not e!302206))))

(assert (=> b!517972 (= res!317126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517973 () Bool)

(declare-fun res!317123 () Bool)

(assert (=> b!517973 (=> (not res!317123) (not e!302207))))

(declare-fun arrayContainsKey!0 (array!33137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517973 (= res!317123 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517974 () Bool)

(assert (=> b!517974 (= e!302211 false)))

(assert (=> b!517974 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236999 lt!237001 lt!236997 mask!3524) (Intermediate!4396 false (index!19774 lt!236994) (x!48748 lt!236994)))))

(declare-fun lt!236995 () Unit!16036)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16036)

(assert (=> b!517974 (= lt!236995 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!236999 #b00000000000000000000000000000000 (index!19774 lt!236994) (x!48748 lt!236994) mask!3524))))

(declare-fun b!517975 () Bool)

(declare-fun res!317122 () Bool)

(assert (=> b!517975 (=> (not res!317122) (not e!302207))))

(assert (=> b!517975 (= res!317122 (validKeyInArray!0 (select (arr!15932 a!3235) j!176)))))

(assert (= (and start!46986 res!317127) b!517967))

(assert (= (and b!517967 res!317124) b!517975))

(assert (= (and b!517975 res!317122) b!517966))

(assert (= (and b!517966 res!317121) b!517973))

(assert (= (and b!517973 res!317123) b!517964))

(assert (= (and b!517964 res!317131) b!517972))

(assert (= (and b!517972 res!317126) b!517971))

(assert (= (and b!517971 res!317129) b!517969))

(assert (= (and b!517969 res!317130) b!517970))

(assert (= (and b!517969 (not res!317128)) b!517968))

(assert (= (and b!517968 (not res!317125)) b!517965))

(assert (= (and b!517965 (not res!317132)) b!517974))

(declare-fun m!498847 () Bool)

(assert (=> b!517974 m!498847))

(declare-fun m!498849 () Bool)

(assert (=> b!517974 m!498849))

(declare-fun m!498851 () Bool)

(assert (=> b!517965 m!498851))

(declare-fun m!498853 () Bool)

(assert (=> b!517965 m!498853))

(declare-fun m!498855 () Bool)

(assert (=> b!517966 m!498855))

(declare-fun m!498857 () Bool)

(assert (=> b!517972 m!498857))

(declare-fun m!498859 () Bool)

(assert (=> b!517969 m!498859))

(declare-fun m!498861 () Bool)

(assert (=> b!517969 m!498861))

(declare-fun m!498863 () Bool)

(assert (=> b!517969 m!498863))

(assert (=> b!517969 m!498853))

(declare-fun m!498865 () Bool)

(assert (=> b!517969 m!498865))

(assert (=> b!517969 m!498853))

(declare-fun m!498867 () Bool)

(assert (=> b!517969 m!498867))

(assert (=> b!517969 m!498853))

(declare-fun m!498869 () Bool)

(assert (=> b!517969 m!498869))

(declare-fun m!498871 () Bool)

(assert (=> b!517969 m!498871))

(declare-fun m!498873 () Bool)

(assert (=> b!517969 m!498873))

(declare-fun m!498875 () Bool)

(assert (=> b!517964 m!498875))

(declare-fun m!498877 () Bool)

(assert (=> start!46986 m!498877))

(declare-fun m!498879 () Bool)

(assert (=> start!46986 m!498879))

(declare-fun m!498881 () Bool)

(assert (=> b!517971 m!498881))

(assert (=> b!517970 m!498853))

(assert (=> b!517970 m!498853))

(declare-fun m!498883 () Bool)

(assert (=> b!517970 m!498883))

(assert (=> b!517975 m!498853))

(assert (=> b!517975 m!498853))

(declare-fun m!498885 () Bool)

(assert (=> b!517975 m!498885))

(declare-fun m!498887 () Bool)

(assert (=> b!517973 m!498887))

(check-sat (not b!517973) (not b!517966) (not b!517969) (not b!517964) (not b!517972) (not b!517971) (not b!517975) (not start!46986) (not b!517970) (not b!517974))
(check-sat)
