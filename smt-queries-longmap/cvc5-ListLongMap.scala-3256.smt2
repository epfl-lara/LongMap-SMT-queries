; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45408 () Bool)

(assert start!45408)

(declare-fun b!499143 () Bool)

(declare-fun res!301151 () Bool)

(declare-fun e!292514 () Bool)

(assert (=> b!499143 (=> res!301151 e!292514)))

(declare-datatypes ((SeekEntryResult!3965 0))(
  ( (MissingZero!3965 (index!18042 (_ BitVec 32))) (Found!3965 (index!18043 (_ BitVec 32))) (Intermediate!3965 (undefined!4777 Bool) (index!18044 (_ BitVec 32)) (x!47090 (_ BitVec 32))) (Undefined!3965) (MissingVacant!3965 (index!18045 (_ BitVec 32))) )
))
(declare-fun lt!226254 () SeekEntryResult!3965)

(assert (=> b!499143 (= res!301151 (or (undefined!4777 lt!226254) (not (is-Intermediate!3965 lt!226254))))))

(declare-fun b!499144 () Bool)

(declare-fun res!301149 () Bool)

(declare-fun e!292513 () Bool)

(assert (=> b!499144 (=> (not res!301149) (not e!292513))))

(declare-datatypes ((array!32233 0))(
  ( (array!32234 (arr!15498 (Array (_ BitVec 32) (_ BitVec 64))) (size!15862 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32233)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32233 (_ BitVec 32)) Bool)

(assert (=> b!499144 (= res!301149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499145 () Bool)

(declare-fun e!292511 () Bool)

(assert (=> b!499145 (= e!292511 true)))

(declare-fun lt!226253 () (_ BitVec 32))

(declare-fun lt!226251 () (_ BitVec 64))

(declare-fun lt!226255 () array!32233)

(declare-fun lt!226257 () SeekEntryResult!3965)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32233 (_ BitVec 32)) SeekEntryResult!3965)

(assert (=> b!499145 (= lt!226257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226253 lt!226251 lt!226255 mask!3524))))

(declare-fun b!499146 () Bool)

(declare-fun res!301152 () Bool)

(declare-fun e!292512 () Bool)

(assert (=> b!499146 (=> (not res!301152) (not e!292512))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499146 (= res!301152 (validKeyInArray!0 (select (arr!15498 a!3235) j!176)))))

(declare-fun res!301145 () Bool)

(assert (=> start!45408 (=> (not res!301145) (not e!292512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45408 (= res!301145 (validMask!0 mask!3524))))

(assert (=> start!45408 e!292512))

(assert (=> start!45408 true))

(declare-fun array_inv!11294 (array!32233) Bool)

(assert (=> start!45408 (array_inv!11294 a!3235)))

(declare-fun b!499147 () Bool)

(declare-fun res!301153 () Bool)

(assert (=> b!499147 (=> (not res!301153) (not e!292512))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32233 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499147 (= res!301153 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499148 () Bool)

(declare-fun res!301156 () Bool)

(assert (=> b!499148 (=> (not res!301156) (not e!292513))))

(declare-datatypes ((List!9656 0))(
  ( (Nil!9653) (Cons!9652 (h!10526 (_ BitVec 64)) (t!15884 List!9656)) )
))
(declare-fun arrayNoDuplicates!0 (array!32233 (_ BitVec 32) List!9656) Bool)

(assert (=> b!499148 (= res!301156 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9653))))

(declare-fun b!499149 () Bool)

(declare-datatypes ((Unit!14936 0))(
  ( (Unit!14937) )
))
(declare-fun e!292516 () Unit!14936)

(declare-fun Unit!14938 () Unit!14936)

(assert (=> b!499149 (= e!292516 Unit!14938)))

(declare-fun b!499150 () Bool)

(declare-fun res!301148 () Bool)

(assert (=> b!499150 (=> (not res!301148) (not e!292512))))

(assert (=> b!499150 (= res!301148 (validKeyInArray!0 k!2280))))

(declare-fun b!499151 () Bool)

(declare-fun Unit!14939 () Unit!14936)

(assert (=> b!499151 (= e!292516 Unit!14939)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!226252 () Unit!14936)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32233 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14936)

(assert (=> b!499151 (= lt!226252 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226253 #b00000000000000000000000000000000 (index!18044 lt!226254) (x!47090 lt!226254) mask!3524))))

(declare-fun res!301155 () Bool)

(assert (=> b!499151 (= res!301155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226253 lt!226251 lt!226255 mask!3524) (Intermediate!3965 false (index!18044 lt!226254) (x!47090 lt!226254))))))

(declare-fun e!292517 () Bool)

(assert (=> b!499151 (=> (not res!301155) (not e!292517))))

(assert (=> b!499151 e!292517))

(declare-fun b!499152 () Bool)

(declare-fun e!292515 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32233 (_ BitVec 32)) SeekEntryResult!3965)

(assert (=> b!499152 (= e!292515 (= (seekEntryOrOpen!0 (select (arr!15498 a!3235) j!176) a!3235 mask!3524) (Found!3965 j!176)))))

(declare-fun b!499153 () Bool)

(assert (=> b!499153 (= e!292514 e!292511)))

(declare-fun res!301150 () Bool)

(assert (=> b!499153 (=> res!301150 e!292511)))

(assert (=> b!499153 (= res!301150 (or (bvsgt #b00000000000000000000000000000000 (x!47090 lt!226254)) (bvsgt (x!47090 lt!226254) #b01111111111111111111111111111110) (bvslt lt!226253 #b00000000000000000000000000000000) (bvsge lt!226253 (size!15862 a!3235)) (bvslt (index!18044 lt!226254) #b00000000000000000000000000000000) (bvsge (index!18044 lt!226254) (size!15862 a!3235)) (not (= lt!226254 (Intermediate!3965 false (index!18044 lt!226254) (x!47090 lt!226254))))))))

(assert (=> b!499153 (and (or (= (select (arr!15498 a!3235) (index!18044 lt!226254)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15498 a!3235) (index!18044 lt!226254)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15498 a!3235) (index!18044 lt!226254)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15498 a!3235) (index!18044 lt!226254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226250 () Unit!14936)

(assert (=> b!499153 (= lt!226250 e!292516)))

(declare-fun c!59276 () Bool)

(assert (=> b!499153 (= c!59276 (= (select (arr!15498 a!3235) (index!18044 lt!226254)) (select (arr!15498 a!3235) j!176)))))

(assert (=> b!499153 (and (bvslt (x!47090 lt!226254) #b01111111111111111111111111111110) (or (= (select (arr!15498 a!3235) (index!18044 lt!226254)) (select (arr!15498 a!3235) j!176)) (= (select (arr!15498 a!3235) (index!18044 lt!226254)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15498 a!3235) (index!18044 lt!226254)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499154 () Bool)

(declare-fun res!301154 () Bool)

(assert (=> b!499154 (=> (not res!301154) (not e!292512))))

(assert (=> b!499154 (= res!301154 (and (= (size!15862 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15862 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15862 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499155 () Bool)

(assert (=> b!499155 (= e!292512 e!292513)))

(declare-fun res!301146 () Bool)

(assert (=> b!499155 (=> (not res!301146) (not e!292513))))

(declare-fun lt!226249 () SeekEntryResult!3965)

(assert (=> b!499155 (= res!301146 (or (= lt!226249 (MissingZero!3965 i!1204)) (= lt!226249 (MissingVacant!3965 i!1204))))))

(assert (=> b!499155 (= lt!226249 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499156 () Bool)

(assert (=> b!499156 (= e!292517 false)))

(declare-fun b!499157 () Bool)

(assert (=> b!499157 (= e!292513 (not e!292514))))

(declare-fun res!301157 () Bool)

(assert (=> b!499157 (=> res!301157 e!292514)))

(declare-fun lt!226256 () (_ BitVec 32))

(assert (=> b!499157 (= res!301157 (= lt!226254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226256 lt!226251 lt!226255 mask!3524)))))

(assert (=> b!499157 (= lt!226254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226253 (select (arr!15498 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499157 (= lt!226256 (toIndex!0 lt!226251 mask!3524))))

(assert (=> b!499157 (= lt!226251 (select (store (arr!15498 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499157 (= lt!226253 (toIndex!0 (select (arr!15498 a!3235) j!176) mask!3524))))

(assert (=> b!499157 (= lt!226255 (array!32234 (store (arr!15498 a!3235) i!1204 k!2280) (size!15862 a!3235)))))

(assert (=> b!499157 e!292515))

(declare-fun res!301147 () Bool)

(assert (=> b!499157 (=> (not res!301147) (not e!292515))))

(assert (=> b!499157 (= res!301147 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226258 () Unit!14936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14936)

(assert (=> b!499157 (= lt!226258 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45408 res!301145) b!499154))

(assert (= (and b!499154 res!301154) b!499146))

(assert (= (and b!499146 res!301152) b!499150))

(assert (= (and b!499150 res!301148) b!499147))

(assert (= (and b!499147 res!301153) b!499155))

(assert (= (and b!499155 res!301146) b!499144))

(assert (= (and b!499144 res!301149) b!499148))

(assert (= (and b!499148 res!301156) b!499157))

(assert (= (and b!499157 res!301147) b!499152))

(assert (= (and b!499157 (not res!301157)) b!499143))

(assert (= (and b!499143 (not res!301151)) b!499153))

(assert (= (and b!499153 c!59276) b!499151))

(assert (= (and b!499153 (not c!59276)) b!499149))

(assert (= (and b!499151 res!301155) b!499156))

(assert (= (and b!499153 (not res!301150)) b!499145))

(declare-fun m!480363 () Bool)

(assert (=> b!499155 m!480363))

(declare-fun m!480365 () Bool)

(assert (=> b!499151 m!480365))

(declare-fun m!480367 () Bool)

(assert (=> b!499151 m!480367))

(declare-fun m!480369 () Bool)

(assert (=> b!499147 m!480369))

(declare-fun m!480371 () Bool)

(assert (=> b!499144 m!480371))

(declare-fun m!480373 () Bool)

(assert (=> start!45408 m!480373))

(declare-fun m!480375 () Bool)

(assert (=> start!45408 m!480375))

(declare-fun m!480377 () Bool)

(assert (=> b!499157 m!480377))

(declare-fun m!480379 () Bool)

(assert (=> b!499157 m!480379))

(declare-fun m!480381 () Bool)

(assert (=> b!499157 m!480381))

(declare-fun m!480383 () Bool)

(assert (=> b!499157 m!480383))

(declare-fun m!480385 () Bool)

(assert (=> b!499157 m!480385))

(declare-fun m!480387 () Bool)

(assert (=> b!499157 m!480387))

(assert (=> b!499157 m!480383))

(declare-fun m!480389 () Bool)

(assert (=> b!499157 m!480389))

(declare-fun m!480391 () Bool)

(assert (=> b!499157 m!480391))

(assert (=> b!499157 m!480383))

(declare-fun m!480393 () Bool)

(assert (=> b!499157 m!480393))

(declare-fun m!480395 () Bool)

(assert (=> b!499153 m!480395))

(assert (=> b!499153 m!480383))

(declare-fun m!480397 () Bool)

(assert (=> b!499148 m!480397))

(assert (=> b!499146 m!480383))

(assert (=> b!499146 m!480383))

(declare-fun m!480399 () Bool)

(assert (=> b!499146 m!480399))

(declare-fun m!480401 () Bool)

(assert (=> b!499150 m!480401))

(assert (=> b!499145 m!480367))

(assert (=> b!499152 m!480383))

(assert (=> b!499152 m!480383))

(declare-fun m!480403 () Bool)

(assert (=> b!499152 m!480403))

(push 1)

