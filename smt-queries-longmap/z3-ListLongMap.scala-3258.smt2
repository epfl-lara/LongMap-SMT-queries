; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45408 () Bool)

(assert start!45408)

(declare-fun b!499142 () Bool)

(declare-fun e!292486 () Bool)

(declare-fun e!292483 () Bool)

(assert (=> b!499142 (= e!292486 (not e!292483))))

(declare-fun res!301261 () Bool)

(assert (=> b!499142 (=> res!301261 e!292483)))

(declare-datatypes ((array!32243 0))(
  ( (array!32244 (arr!15503 (Array (_ BitVec 32) (_ BitVec 64))) (size!15868 (_ BitVec 32))) )
))
(declare-fun lt!226202 () array!32243)

(declare-datatypes ((SeekEntryResult!3967 0))(
  ( (MissingZero!3967 (index!18050 (_ BitVec 32))) (Found!3967 (index!18051 (_ BitVec 32))) (Intermediate!3967 (undefined!4779 Bool) (index!18052 (_ BitVec 32)) (x!47103 (_ BitVec 32))) (Undefined!3967) (MissingVacant!3967 (index!18053 (_ BitVec 32))) )
))
(declare-fun lt!226198 () SeekEntryResult!3967)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!226195 () (_ BitVec 64))

(declare-fun lt!226203 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32243 (_ BitVec 32)) SeekEntryResult!3967)

(assert (=> b!499142 (= res!301261 (= lt!226198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226203 lt!226195 lt!226202 mask!3524)))))

(declare-fun a!3235 () array!32243)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!226201 () (_ BitVec 32))

(assert (=> b!499142 (= lt!226198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226201 (select (arr!15503 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499142 (= lt!226203 (toIndex!0 lt!226195 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499142 (= lt!226195 (select (store (arr!15503 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499142 (= lt!226201 (toIndex!0 (select (arr!15503 a!3235) j!176) mask!3524))))

(assert (=> b!499142 (= lt!226202 (array!32244 (store (arr!15503 a!3235) i!1204 k0!2280) (size!15868 a!3235)))))

(declare-fun e!292482 () Bool)

(assert (=> b!499142 e!292482))

(declare-fun res!301259 () Bool)

(assert (=> b!499142 (=> (not res!301259) (not e!292482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32243 (_ BitVec 32)) Bool)

(assert (=> b!499142 (= res!301259 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14938 0))(
  ( (Unit!14939) )
))
(declare-fun lt!226196 () Unit!14938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32243 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14938)

(assert (=> b!499142 (= lt!226196 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499143 () Bool)

(declare-fun e!292487 () Bool)

(assert (=> b!499143 (= e!292487 e!292486)))

(declare-fun res!301257 () Bool)

(assert (=> b!499143 (=> (not res!301257) (not e!292486))))

(declare-fun lt!226200 () SeekEntryResult!3967)

(assert (=> b!499143 (= res!301257 (or (= lt!226200 (MissingZero!3967 i!1204)) (= lt!226200 (MissingVacant!3967 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32243 (_ BitVec 32)) SeekEntryResult!3967)

(assert (=> b!499143 (= lt!226200 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499144 () Bool)

(declare-fun e!292485 () Bool)

(assert (=> b!499144 (= e!292485 true)))

(declare-fun lt!226204 () SeekEntryResult!3967)

(assert (=> b!499144 (= lt!226204 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226201 lt!226195 lt!226202 mask!3524))))

(declare-fun b!499145 () Bool)

(declare-fun res!301258 () Bool)

(assert (=> b!499145 (=> res!301258 e!292483)))

(get-info :version)

(assert (=> b!499145 (= res!301258 (or (undefined!4779 lt!226198) (not ((_ is Intermediate!3967) lt!226198))))))

(declare-fun b!499146 () Bool)

(declare-fun res!301253 () Bool)

(assert (=> b!499146 (=> (not res!301253) (not e!292487))))

(declare-fun arrayContainsKey!0 (array!32243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499146 (= res!301253 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499147 () Bool)

(declare-fun res!301260 () Bool)

(assert (=> b!499147 (=> (not res!301260) (not e!292486))))

(assert (=> b!499147 (= res!301260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!301250 () Bool)

(assert (=> start!45408 (=> (not res!301250) (not e!292487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45408 (= res!301250 (validMask!0 mask!3524))))

(assert (=> start!45408 e!292487))

(assert (=> start!45408 true))

(declare-fun array_inv!11386 (array!32243) Bool)

(assert (=> start!45408 (array_inv!11386 a!3235)))

(declare-fun b!499148 () Bool)

(declare-fun res!301262 () Bool)

(assert (=> b!499148 (=> (not res!301262) (not e!292487))))

(assert (=> b!499148 (= res!301262 (and (= (size!15868 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15868 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15868 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499149 () Bool)

(declare-fun e!292484 () Unit!14938)

(declare-fun Unit!14940 () Unit!14938)

(assert (=> b!499149 (= e!292484 Unit!14940)))

(declare-fun b!499150 () Bool)

(declare-fun e!292488 () Bool)

(assert (=> b!499150 (= e!292488 false)))

(declare-fun b!499151 () Bool)

(declare-fun Unit!14941 () Unit!14938)

(assert (=> b!499151 (= e!292484 Unit!14941)))

(declare-fun lt!226199 () Unit!14938)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32243 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14938)

(assert (=> b!499151 (= lt!226199 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226201 #b00000000000000000000000000000000 (index!18052 lt!226198) (x!47103 lt!226198) mask!3524))))

(declare-fun res!301255 () Bool)

(assert (=> b!499151 (= res!301255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226201 lt!226195 lt!226202 mask!3524) (Intermediate!3967 false (index!18052 lt!226198) (x!47103 lt!226198))))))

(assert (=> b!499151 (=> (not res!301255) (not e!292488))))

(assert (=> b!499151 e!292488))

(declare-fun b!499152 () Bool)

(assert (=> b!499152 (= e!292482 (= (seekEntryOrOpen!0 (select (arr!15503 a!3235) j!176) a!3235 mask!3524) (Found!3967 j!176)))))

(declare-fun b!499153 () Bool)

(declare-fun res!301254 () Bool)

(assert (=> b!499153 (=> (not res!301254) (not e!292486))))

(declare-datatypes ((List!9700 0))(
  ( (Nil!9697) (Cons!9696 (h!10570 (_ BitVec 64)) (t!15919 List!9700)) )
))
(declare-fun arrayNoDuplicates!0 (array!32243 (_ BitVec 32) List!9700) Bool)

(assert (=> b!499153 (= res!301254 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9697))))

(declare-fun b!499154 () Bool)

(declare-fun res!301256 () Bool)

(assert (=> b!499154 (=> (not res!301256) (not e!292487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499154 (= res!301256 (validKeyInArray!0 k0!2280))))

(declare-fun b!499155 () Bool)

(assert (=> b!499155 (= e!292483 e!292485)))

(declare-fun res!301251 () Bool)

(assert (=> b!499155 (=> res!301251 e!292485)))

(assert (=> b!499155 (= res!301251 (or (bvsgt #b00000000000000000000000000000000 (x!47103 lt!226198)) (bvsgt (x!47103 lt!226198) #b01111111111111111111111111111110) (bvslt lt!226201 #b00000000000000000000000000000000) (bvsge lt!226201 (size!15868 a!3235)) (bvslt (index!18052 lt!226198) #b00000000000000000000000000000000) (bvsge (index!18052 lt!226198) (size!15868 a!3235)) (not (= lt!226198 (Intermediate!3967 false (index!18052 lt!226198) (x!47103 lt!226198))))))))

(assert (=> b!499155 (and (or (= (select (arr!15503 a!3235) (index!18052 lt!226198)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15503 a!3235) (index!18052 lt!226198)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15503 a!3235) (index!18052 lt!226198)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15503 a!3235) (index!18052 lt!226198)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226197 () Unit!14938)

(assert (=> b!499155 (= lt!226197 e!292484)))

(declare-fun c!59223 () Bool)

(assert (=> b!499155 (= c!59223 (= (select (arr!15503 a!3235) (index!18052 lt!226198)) (select (arr!15503 a!3235) j!176)))))

(assert (=> b!499155 (and (bvslt (x!47103 lt!226198) #b01111111111111111111111111111110) (or (= (select (arr!15503 a!3235) (index!18052 lt!226198)) (select (arr!15503 a!3235) j!176)) (= (select (arr!15503 a!3235) (index!18052 lt!226198)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15503 a!3235) (index!18052 lt!226198)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499156 () Bool)

(declare-fun res!301252 () Bool)

(assert (=> b!499156 (=> (not res!301252) (not e!292487))))

(assert (=> b!499156 (= res!301252 (validKeyInArray!0 (select (arr!15503 a!3235) j!176)))))

(assert (= (and start!45408 res!301250) b!499148))

(assert (= (and b!499148 res!301262) b!499156))

(assert (= (and b!499156 res!301252) b!499154))

(assert (= (and b!499154 res!301256) b!499146))

(assert (= (and b!499146 res!301253) b!499143))

(assert (= (and b!499143 res!301257) b!499147))

(assert (= (and b!499147 res!301260) b!499153))

(assert (= (and b!499153 res!301254) b!499142))

(assert (= (and b!499142 res!301259) b!499152))

(assert (= (and b!499142 (not res!301261)) b!499145))

(assert (= (and b!499145 (not res!301258)) b!499155))

(assert (= (and b!499155 c!59223) b!499151))

(assert (= (and b!499155 (not c!59223)) b!499149))

(assert (= (and b!499151 res!301255) b!499150))

(assert (= (and b!499155 (not res!301251)) b!499144))

(declare-fun m!479863 () Bool)

(assert (=> b!499146 m!479863))

(declare-fun m!479865 () Bool)

(assert (=> b!499144 m!479865))

(declare-fun m!479867 () Bool)

(assert (=> b!499152 m!479867))

(assert (=> b!499152 m!479867))

(declare-fun m!479869 () Bool)

(assert (=> b!499152 m!479869))

(declare-fun m!479871 () Bool)

(assert (=> b!499143 m!479871))

(assert (=> b!499156 m!479867))

(assert (=> b!499156 m!479867))

(declare-fun m!479873 () Bool)

(assert (=> b!499156 m!479873))

(declare-fun m!479875 () Bool)

(assert (=> start!45408 m!479875))

(declare-fun m!479877 () Bool)

(assert (=> start!45408 m!479877))

(declare-fun m!479879 () Bool)

(assert (=> b!499142 m!479879))

(declare-fun m!479881 () Bool)

(assert (=> b!499142 m!479881))

(declare-fun m!479883 () Bool)

(assert (=> b!499142 m!479883))

(assert (=> b!499142 m!479867))

(declare-fun m!479885 () Bool)

(assert (=> b!499142 m!479885))

(declare-fun m!479887 () Bool)

(assert (=> b!499142 m!479887))

(assert (=> b!499142 m!479867))

(declare-fun m!479889 () Bool)

(assert (=> b!499142 m!479889))

(declare-fun m!479891 () Bool)

(assert (=> b!499142 m!479891))

(declare-fun m!479893 () Bool)

(assert (=> b!499142 m!479893))

(assert (=> b!499142 m!479867))

(declare-fun m!479895 () Bool)

(assert (=> b!499147 m!479895))

(declare-fun m!479897 () Bool)

(assert (=> b!499155 m!479897))

(assert (=> b!499155 m!479867))

(declare-fun m!479899 () Bool)

(assert (=> b!499154 m!479899))

(declare-fun m!479901 () Bool)

(assert (=> b!499153 m!479901))

(declare-fun m!479903 () Bool)

(assert (=> b!499151 m!479903))

(assert (=> b!499151 m!479865))

(check-sat (not b!499147) (not b!499144) (not b!499146) (not b!499151) (not b!499153) (not b!499152) (not b!499142) (not start!45408) (not b!499143) (not b!499154) (not b!499156))
(check-sat)
