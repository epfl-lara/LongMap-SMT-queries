; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47438 () Bool)

(assert start!47438)

(declare-fun b!522166 () Bool)

(declare-fun res!319862 () Bool)

(declare-fun e!304578 () Bool)

(assert (=> b!522166 (=> (not res!319862) (not e!304578))))

(declare-datatypes ((array!33264 0))(
  ( (array!33265 (arr!15988 (Array (_ BitVec 32) (_ BitVec 64))) (size!16352 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33264)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33264 (_ BitVec 32)) Bool)

(assert (=> b!522166 (= res!319862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522167 () Bool)

(declare-fun res!319863 () Bool)

(declare-fun e!304580 () Bool)

(assert (=> b!522167 (=> (not res!319863) (not e!304580))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!522167 (= res!319863 (and (= (size!16352 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16352 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16352 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522168 () Bool)

(declare-datatypes ((Unit!16272 0))(
  ( (Unit!16273) )
))
(declare-fun e!304581 () Unit!16272)

(declare-fun Unit!16274 () Unit!16272)

(assert (=> b!522168 (= e!304581 Unit!16274)))

(declare-fun lt!239432 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4455 0))(
  ( (MissingZero!4455 (index!20023 (_ BitVec 32))) (Found!4455 (index!20024 (_ BitVec 32))) (Intermediate!4455 (undefined!5267 Bool) (index!20025 (_ BitVec 32)) (x!49001 (_ BitVec 32))) (Undefined!4455) (MissingVacant!4455 (index!20026 (_ BitVec 32))) )
))
(declare-fun lt!239431 () SeekEntryResult!4455)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!239430 () Unit!16272)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33264 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16272)

(assert (=> b!522168 (= lt!239430 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239432 #b00000000000000000000000000000000 (index!20025 lt!239431) (x!49001 lt!239431) mask!3524))))

(declare-fun lt!239428 () (_ BitVec 64))

(declare-fun lt!239434 () array!33264)

(declare-fun res!319861 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33264 (_ BitVec 32)) SeekEntryResult!4455)

(assert (=> b!522168 (= res!319861 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239432 lt!239428 lt!239434 mask!3524) (Intermediate!4455 false (index!20025 lt!239431) (x!49001 lt!239431))))))

(declare-fun e!304582 () Bool)

(assert (=> b!522168 (=> (not res!319861) (not e!304582))))

(assert (=> b!522168 e!304582))

(declare-fun b!522170 () Bool)

(assert (=> b!522170 (= e!304580 e!304578)))

(declare-fun res!319864 () Bool)

(assert (=> b!522170 (=> (not res!319864) (not e!304578))))

(declare-fun lt!239426 () SeekEntryResult!4455)

(assert (=> b!522170 (= res!319864 (or (= lt!239426 (MissingZero!4455 i!1204)) (= lt!239426 (MissingVacant!4455 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33264 (_ BitVec 32)) SeekEntryResult!4455)

(assert (=> b!522170 (= lt!239426 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522171 () Bool)

(declare-fun Unit!16275 () Unit!16272)

(assert (=> b!522171 (= e!304581 Unit!16275)))

(declare-fun b!522172 () Bool)

(declare-fun e!304579 () Bool)

(assert (=> b!522172 (= e!304579 (= (seekEntryOrOpen!0 (select (arr!15988 a!3235) j!176) a!3235 mask!3524) (Found!4455 j!176)))))

(declare-fun b!522173 () Bool)

(declare-fun e!304583 () Bool)

(assert (=> b!522173 (= e!304583 true)))

(assert (=> b!522173 (and (or (= (select (arr!15988 a!3235) (index!20025 lt!239431)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15988 a!3235) (index!20025 lt!239431)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15988 a!3235) (index!20025 lt!239431)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15988 a!3235) (index!20025 lt!239431)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239433 () Unit!16272)

(assert (=> b!522173 (= lt!239433 e!304581)))

(declare-fun c!61454 () Bool)

(assert (=> b!522173 (= c!61454 (= (select (arr!15988 a!3235) (index!20025 lt!239431)) (select (arr!15988 a!3235) j!176)))))

(assert (=> b!522173 (and (bvslt (x!49001 lt!239431) #b01111111111111111111111111111110) (or (= (select (arr!15988 a!3235) (index!20025 lt!239431)) (select (arr!15988 a!3235) j!176)) (= (select (arr!15988 a!3235) (index!20025 lt!239431)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15988 a!3235) (index!20025 lt!239431)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522174 () Bool)

(declare-fun res!319869 () Bool)

(assert (=> b!522174 (=> (not res!319869) (not e!304580))))

(declare-fun arrayContainsKey!0 (array!33264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522174 (= res!319869 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522175 () Bool)

(declare-fun res!319865 () Bool)

(assert (=> b!522175 (=> (not res!319865) (not e!304580))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522175 (= res!319865 (validKeyInArray!0 (select (arr!15988 a!3235) j!176)))))

(declare-fun b!522176 () Bool)

(declare-fun res!319870 () Bool)

(assert (=> b!522176 (=> res!319870 e!304583)))

(get-info :version)

(assert (=> b!522176 (= res!319870 (or (undefined!5267 lt!239431) (not ((_ is Intermediate!4455) lt!239431))))))

(declare-fun b!522177 () Bool)

(declare-fun res!319860 () Bool)

(assert (=> b!522177 (=> (not res!319860) (not e!304580))))

(assert (=> b!522177 (= res!319860 (validKeyInArray!0 k0!2280))))

(declare-fun b!522178 () Bool)

(assert (=> b!522178 (= e!304578 (not e!304583))))

(declare-fun res!319871 () Bool)

(assert (=> b!522178 (=> res!319871 e!304583)))

(declare-fun lt!239427 () (_ BitVec 32))

(assert (=> b!522178 (= res!319871 (= lt!239431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239427 lt!239428 lt!239434 mask!3524)))))

(assert (=> b!522178 (= lt!239431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239432 (select (arr!15988 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522178 (= lt!239427 (toIndex!0 lt!239428 mask!3524))))

(assert (=> b!522178 (= lt!239428 (select (store (arr!15988 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522178 (= lt!239432 (toIndex!0 (select (arr!15988 a!3235) j!176) mask!3524))))

(assert (=> b!522178 (= lt!239434 (array!33265 (store (arr!15988 a!3235) i!1204 k0!2280) (size!16352 a!3235)))))

(assert (=> b!522178 e!304579))

(declare-fun res!319868 () Bool)

(assert (=> b!522178 (=> (not res!319868) (not e!304579))))

(assert (=> b!522178 (= res!319868 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239429 () Unit!16272)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33264 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16272)

(assert (=> b!522178 (= lt!239429 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522179 () Bool)

(declare-fun res!319867 () Bool)

(assert (=> b!522179 (=> (not res!319867) (not e!304578))))

(declare-datatypes ((List!10146 0))(
  ( (Nil!10143) (Cons!10142 (h!11064 (_ BitVec 64)) (t!16374 List!10146)) )
))
(declare-fun arrayNoDuplicates!0 (array!33264 (_ BitVec 32) List!10146) Bool)

(assert (=> b!522179 (= res!319867 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10143))))

(declare-fun res!319866 () Bool)

(assert (=> start!47438 (=> (not res!319866) (not e!304580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47438 (= res!319866 (validMask!0 mask!3524))))

(assert (=> start!47438 e!304580))

(assert (=> start!47438 true))

(declare-fun array_inv!11784 (array!33264) Bool)

(assert (=> start!47438 (array_inv!11784 a!3235)))

(declare-fun b!522169 () Bool)

(assert (=> b!522169 (= e!304582 false)))

(assert (= (and start!47438 res!319866) b!522167))

(assert (= (and b!522167 res!319863) b!522175))

(assert (= (and b!522175 res!319865) b!522177))

(assert (= (and b!522177 res!319860) b!522174))

(assert (= (and b!522174 res!319869) b!522170))

(assert (= (and b!522170 res!319864) b!522166))

(assert (= (and b!522166 res!319862) b!522179))

(assert (= (and b!522179 res!319867) b!522178))

(assert (= (and b!522178 res!319868) b!522172))

(assert (= (and b!522178 (not res!319871)) b!522176))

(assert (= (and b!522176 (not res!319870)) b!522173))

(assert (= (and b!522173 c!61454) b!522168))

(assert (= (and b!522173 (not c!61454)) b!522171))

(assert (= (and b!522168 res!319861) b!522169))

(declare-fun m!503079 () Bool)

(assert (=> b!522168 m!503079))

(declare-fun m!503081 () Bool)

(assert (=> b!522168 m!503081))

(declare-fun m!503083 () Bool)

(assert (=> b!522174 m!503083))

(declare-fun m!503085 () Bool)

(assert (=> b!522177 m!503085))

(declare-fun m!503087 () Bool)

(assert (=> start!47438 m!503087))

(declare-fun m!503089 () Bool)

(assert (=> start!47438 m!503089))

(declare-fun m!503091 () Bool)

(assert (=> b!522178 m!503091))

(declare-fun m!503093 () Bool)

(assert (=> b!522178 m!503093))

(declare-fun m!503095 () Bool)

(assert (=> b!522178 m!503095))

(declare-fun m!503097 () Bool)

(assert (=> b!522178 m!503097))

(declare-fun m!503099 () Bool)

(assert (=> b!522178 m!503099))

(declare-fun m!503101 () Bool)

(assert (=> b!522178 m!503101))

(declare-fun m!503103 () Bool)

(assert (=> b!522178 m!503103))

(assert (=> b!522178 m!503099))

(declare-fun m!503105 () Bool)

(assert (=> b!522178 m!503105))

(assert (=> b!522178 m!503099))

(declare-fun m!503107 () Bool)

(assert (=> b!522178 m!503107))

(declare-fun m!503109 () Bool)

(assert (=> b!522173 m!503109))

(assert (=> b!522173 m!503099))

(declare-fun m!503111 () Bool)

(assert (=> b!522166 m!503111))

(declare-fun m!503113 () Bool)

(assert (=> b!522179 m!503113))

(declare-fun m!503115 () Bool)

(assert (=> b!522170 m!503115))

(assert (=> b!522172 m!503099))

(assert (=> b!522172 m!503099))

(declare-fun m!503117 () Bool)

(assert (=> b!522172 m!503117))

(assert (=> b!522175 m!503099))

(assert (=> b!522175 m!503099))

(declare-fun m!503119 () Bool)

(assert (=> b!522175 m!503119))

(check-sat (not b!522177) (not b!522172) (not b!522178) (not b!522174) (not b!522170) (not b!522175) (not b!522166) (not b!522179) (not start!47438) (not b!522168))
(check-sat)
