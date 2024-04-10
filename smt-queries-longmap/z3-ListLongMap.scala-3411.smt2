; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47390 () Bool)

(assert start!47390)

(declare-fun b!521158 () Bool)

(declare-fun res!319005 () Bool)

(declare-fun e!304077 () Bool)

(assert (=> b!521158 (=> (not res!319005) (not e!304077))))

(declare-datatypes ((array!33216 0))(
  ( (array!33217 (arr!15964 (Array (_ BitVec 32) (_ BitVec 64))) (size!16328 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33216)

(declare-datatypes ((List!10122 0))(
  ( (Nil!10119) (Cons!10118 (h!11040 (_ BitVec 64)) (t!16350 List!10122)) )
))
(declare-fun arrayNoDuplicates!0 (array!33216 (_ BitVec 32) List!10122) Bool)

(assert (=> b!521158 (= res!319005 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10119))))

(declare-fun b!521159 () Bool)

(declare-fun res!319000 () Bool)

(declare-fun e!304079 () Bool)

(assert (=> b!521159 (=> (not res!319000) (not e!304079))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521159 (= res!319000 (and (= (size!16328 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16328 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16328 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521160 () Bool)

(declare-fun res!318999 () Bool)

(assert (=> b!521160 (=> (not res!318999) (not e!304079))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521160 (= res!318999 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521161 () Bool)

(declare-datatypes ((Unit!16176 0))(
  ( (Unit!16177) )
))
(declare-fun e!304074 () Unit!16176)

(declare-fun Unit!16178 () Unit!16176)

(assert (=> b!521161 (= e!304074 Unit!16178)))

(declare-datatypes ((SeekEntryResult!4431 0))(
  ( (MissingZero!4431 (index!19927 (_ BitVec 32))) (Found!4431 (index!19928 (_ BitVec 32))) (Intermediate!4431 (undefined!5243 Bool) (index!19929 (_ BitVec 32)) (x!48913 (_ BitVec 32))) (Undefined!4431) (MissingVacant!4431 (index!19930 (_ BitVec 32))) )
))
(declare-fun lt!238784 () SeekEntryResult!4431)

(declare-fun lt!238781 () (_ BitVec 32))

(declare-fun lt!238786 () Unit!16176)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33216 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16176)

(assert (=> b!521161 (= lt!238786 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238781 #b00000000000000000000000000000000 (index!19929 lt!238784) (x!48913 lt!238784) mask!3524))))

(declare-fun lt!238785 () (_ BitVec 64))

(declare-fun res!319001 () Bool)

(declare-fun lt!238779 () array!33216)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33216 (_ BitVec 32)) SeekEntryResult!4431)

(assert (=> b!521161 (= res!319001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238781 lt!238785 lt!238779 mask!3524) (Intermediate!4431 false (index!19929 lt!238784) (x!48913 lt!238784))))))

(declare-fun e!304075 () Bool)

(assert (=> b!521161 (=> (not res!319001) (not e!304075))))

(assert (=> b!521161 e!304075))

(declare-fun b!521162 () Bool)

(declare-fun res!319006 () Bool)

(assert (=> b!521162 (=> (not res!319006) (not e!304079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521162 (= res!319006 (validKeyInArray!0 k0!2280))))

(declare-fun b!521163 () Bool)

(declare-fun res!319003 () Bool)

(assert (=> b!521163 (=> (not res!319003) (not e!304077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33216 (_ BitVec 32)) Bool)

(assert (=> b!521163 (= res!319003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521164 () Bool)

(declare-fun res!318997 () Bool)

(assert (=> b!521164 (=> (not res!318997) (not e!304079))))

(assert (=> b!521164 (= res!318997 (validKeyInArray!0 (select (arr!15964 a!3235) j!176)))))

(declare-fun b!521165 () Bool)

(declare-fun Unit!16179 () Unit!16176)

(assert (=> b!521165 (= e!304074 Unit!16179)))

(declare-fun b!521166 () Bool)

(assert (=> b!521166 (= e!304079 e!304077)))

(declare-fun res!319002 () Bool)

(assert (=> b!521166 (=> (not res!319002) (not e!304077))))

(declare-fun lt!238778 () SeekEntryResult!4431)

(assert (=> b!521166 (= res!319002 (or (= lt!238778 (MissingZero!4431 i!1204)) (= lt!238778 (MissingVacant!4431 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33216 (_ BitVec 32)) SeekEntryResult!4431)

(assert (=> b!521166 (= lt!238778 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521167 () Bool)

(declare-fun res!319004 () Bool)

(declare-fun e!304078 () Bool)

(assert (=> b!521167 (=> res!319004 e!304078)))

(get-info :version)

(assert (=> b!521167 (= res!319004 (or (undefined!5243 lt!238784) (not ((_ is Intermediate!4431) lt!238784))))))

(declare-fun b!521168 () Bool)

(assert (=> b!521168 (= e!304077 (not e!304078))))

(declare-fun res!318998 () Bool)

(assert (=> b!521168 (=> res!318998 e!304078)))

(declare-fun lt!238780 () (_ BitVec 32))

(assert (=> b!521168 (= res!318998 (= lt!238784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238780 lt!238785 lt!238779 mask!3524)))))

(assert (=> b!521168 (= lt!238784 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238781 (select (arr!15964 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521168 (= lt!238780 (toIndex!0 lt!238785 mask!3524))))

(assert (=> b!521168 (= lt!238785 (select (store (arr!15964 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521168 (= lt!238781 (toIndex!0 (select (arr!15964 a!3235) j!176) mask!3524))))

(assert (=> b!521168 (= lt!238779 (array!33217 (store (arr!15964 a!3235) i!1204 k0!2280) (size!16328 a!3235)))))

(declare-fun e!304076 () Bool)

(assert (=> b!521168 e!304076))

(declare-fun res!318996 () Bool)

(assert (=> b!521168 (=> (not res!318996) (not e!304076))))

(assert (=> b!521168 (= res!318996 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238783 () Unit!16176)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33216 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16176)

(assert (=> b!521168 (= lt!238783 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!319007 () Bool)

(assert (=> start!47390 (=> (not res!319007) (not e!304079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47390 (= res!319007 (validMask!0 mask!3524))))

(assert (=> start!47390 e!304079))

(assert (=> start!47390 true))

(declare-fun array_inv!11760 (array!33216) Bool)

(assert (=> start!47390 (array_inv!11760 a!3235)))

(declare-fun b!521169 () Bool)

(assert (=> b!521169 (= e!304075 false)))

(declare-fun b!521170 () Bool)

(assert (=> b!521170 (= e!304078 true)))

(assert (=> b!521170 (and (or (= (select (arr!15964 a!3235) (index!19929 lt!238784)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15964 a!3235) (index!19929 lt!238784)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15964 a!3235) (index!19929 lt!238784)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15964 a!3235) (index!19929 lt!238784)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238782 () Unit!16176)

(assert (=> b!521170 (= lt!238782 e!304074)))

(declare-fun c!61382 () Bool)

(assert (=> b!521170 (= c!61382 (= (select (arr!15964 a!3235) (index!19929 lt!238784)) (select (arr!15964 a!3235) j!176)))))

(assert (=> b!521170 (and (bvslt (x!48913 lt!238784) #b01111111111111111111111111111110) (or (= (select (arr!15964 a!3235) (index!19929 lt!238784)) (select (arr!15964 a!3235) j!176)) (= (select (arr!15964 a!3235) (index!19929 lt!238784)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15964 a!3235) (index!19929 lt!238784)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521171 () Bool)

(assert (=> b!521171 (= e!304076 (= (seekEntryOrOpen!0 (select (arr!15964 a!3235) j!176) a!3235 mask!3524) (Found!4431 j!176)))))

(assert (= (and start!47390 res!319007) b!521159))

(assert (= (and b!521159 res!319000) b!521164))

(assert (= (and b!521164 res!318997) b!521162))

(assert (= (and b!521162 res!319006) b!521160))

(assert (= (and b!521160 res!318999) b!521166))

(assert (= (and b!521166 res!319002) b!521163))

(assert (= (and b!521163 res!319003) b!521158))

(assert (= (and b!521158 res!319005) b!521168))

(assert (= (and b!521168 res!318996) b!521171))

(assert (= (and b!521168 (not res!318998)) b!521167))

(assert (= (and b!521167 (not res!319004)) b!521170))

(assert (= (and b!521170 c!61382) b!521161))

(assert (= (and b!521170 (not c!61382)) b!521165))

(assert (= (and b!521161 res!319001) b!521169))

(declare-fun m!502071 () Bool)

(assert (=> start!47390 m!502071))

(declare-fun m!502073 () Bool)

(assert (=> start!47390 m!502073))

(declare-fun m!502075 () Bool)

(assert (=> b!521163 m!502075))

(declare-fun m!502077 () Bool)

(assert (=> b!521160 m!502077))

(declare-fun m!502079 () Bool)

(assert (=> b!521162 m!502079))

(declare-fun m!502081 () Bool)

(assert (=> b!521158 m!502081))

(declare-fun m!502083 () Bool)

(assert (=> b!521161 m!502083))

(declare-fun m!502085 () Bool)

(assert (=> b!521161 m!502085))

(declare-fun m!502087 () Bool)

(assert (=> b!521168 m!502087))

(declare-fun m!502089 () Bool)

(assert (=> b!521168 m!502089))

(declare-fun m!502091 () Bool)

(assert (=> b!521168 m!502091))

(declare-fun m!502093 () Bool)

(assert (=> b!521168 m!502093))

(declare-fun m!502095 () Bool)

(assert (=> b!521168 m!502095))

(declare-fun m!502097 () Bool)

(assert (=> b!521168 m!502097))

(assert (=> b!521168 m!502093))

(declare-fun m!502099 () Bool)

(assert (=> b!521168 m!502099))

(assert (=> b!521168 m!502093))

(declare-fun m!502101 () Bool)

(assert (=> b!521168 m!502101))

(declare-fun m!502103 () Bool)

(assert (=> b!521168 m!502103))

(assert (=> b!521171 m!502093))

(assert (=> b!521171 m!502093))

(declare-fun m!502105 () Bool)

(assert (=> b!521171 m!502105))

(declare-fun m!502107 () Bool)

(assert (=> b!521166 m!502107))

(assert (=> b!521164 m!502093))

(assert (=> b!521164 m!502093))

(declare-fun m!502109 () Bool)

(assert (=> b!521164 m!502109))

(declare-fun m!502111 () Bool)

(assert (=> b!521170 m!502111))

(assert (=> b!521170 m!502093))

(check-sat (not start!47390) (not b!521160) (not b!521164) (not b!521163) (not b!521162) (not b!521161) (not b!521166) (not b!521168) (not b!521158) (not b!521171))
(check-sat)
