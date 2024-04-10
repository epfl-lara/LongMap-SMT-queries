; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45406 () Bool)

(assert start!45406)

(declare-fun b!499098 () Bool)

(declare-fun res!301118 () Bool)

(declare-fun e!292489 () Bool)

(assert (=> b!499098 (=> (not res!301118) (not e!292489))))

(declare-datatypes ((array!32231 0))(
  ( (array!32232 (arr!15497 (Array (_ BitVec 32) (_ BitVec 64))) (size!15861 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32231)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499098 (= res!301118 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499099 () Bool)

(declare-fun e!292488 () Bool)

(declare-fun e!292494 () Bool)

(assert (=> b!499099 (= e!292488 (not e!292494))))

(declare-fun res!301110 () Bool)

(assert (=> b!499099 (=> res!301110 e!292494)))

(declare-datatypes ((SeekEntryResult!3964 0))(
  ( (MissingZero!3964 (index!18038 (_ BitVec 32))) (Found!3964 (index!18039 (_ BitVec 32))) (Intermediate!3964 (undefined!4776 Bool) (index!18040 (_ BitVec 32)) (x!47081 (_ BitVec 32))) (Undefined!3964) (MissingVacant!3964 (index!18041 (_ BitVec 32))) )
))
(declare-fun lt!226222 () SeekEntryResult!3964)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!226219 () array!32231)

(declare-fun lt!226228 () (_ BitVec 32))

(declare-fun lt!226227 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32231 (_ BitVec 32)) SeekEntryResult!3964)

(assert (=> b!499099 (= res!301110 (= lt!226222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226228 lt!226227 lt!226219 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!226225 () (_ BitVec 32))

(assert (=> b!499099 (= lt!226222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226225 (select (arr!15497 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499099 (= lt!226228 (toIndex!0 lt!226227 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!499099 (= lt!226227 (select (store (arr!15497 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!499099 (= lt!226225 (toIndex!0 (select (arr!15497 a!3235) j!176) mask!3524))))

(assert (=> b!499099 (= lt!226219 (array!32232 (store (arr!15497 a!3235) i!1204 k!2280) (size!15861 a!3235)))))

(declare-fun e!292491 () Bool)

(assert (=> b!499099 e!292491))

(declare-fun res!301114 () Bool)

(assert (=> b!499099 (=> (not res!301114) (not e!292491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32231 (_ BitVec 32)) Bool)

(assert (=> b!499099 (= res!301114 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14932 0))(
  ( (Unit!14933) )
))
(declare-fun lt!226220 () Unit!14932)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32231 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14932)

(assert (=> b!499099 (= lt!226220 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499100 () Bool)

(declare-fun res!301113 () Bool)

(assert (=> b!499100 (=> res!301113 e!292494)))

(assert (=> b!499100 (= res!301113 (or (undefined!4776 lt!226222) (not (is-Intermediate!3964 lt!226222))))))

(declare-fun b!499101 () Bool)

(assert (=> b!499101 (= e!292489 e!292488)))

(declare-fun res!301111 () Bool)

(assert (=> b!499101 (=> (not res!301111) (not e!292488))))

(declare-fun lt!226224 () SeekEntryResult!3964)

(assert (=> b!499101 (= res!301111 (or (= lt!226224 (MissingZero!3964 i!1204)) (= lt!226224 (MissingVacant!3964 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32231 (_ BitVec 32)) SeekEntryResult!3964)

(assert (=> b!499101 (= lt!226224 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!499102 () Bool)

(declare-fun e!292493 () Unit!14932)

(declare-fun Unit!14934 () Unit!14932)

(assert (=> b!499102 (= e!292493 Unit!14934)))

(declare-fun lt!226221 () Unit!14932)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32231 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14932)

(assert (=> b!499102 (= lt!226221 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!226225 #b00000000000000000000000000000000 (index!18040 lt!226222) (x!47081 lt!226222) mask!3524))))

(declare-fun res!301108 () Bool)

(assert (=> b!499102 (= res!301108 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226225 lt!226227 lt!226219 mask!3524) (Intermediate!3964 false (index!18040 lt!226222) (x!47081 lt!226222))))))

(declare-fun e!292487 () Bool)

(assert (=> b!499102 (=> (not res!301108) (not e!292487))))

(assert (=> b!499102 e!292487))

(declare-fun res!301109 () Bool)

(assert (=> start!45406 (=> (not res!301109) (not e!292489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45406 (= res!301109 (validMask!0 mask!3524))))

(assert (=> start!45406 e!292489))

(assert (=> start!45406 true))

(declare-fun array_inv!11293 (array!32231) Bool)

(assert (=> start!45406 (array_inv!11293 a!3235)))

(declare-fun b!499103 () Bool)

(declare-fun res!301116 () Bool)

(assert (=> b!499103 (=> (not res!301116) (not e!292488))))

(declare-datatypes ((List!9655 0))(
  ( (Nil!9652) (Cons!9651 (h!10525 (_ BitVec 64)) (t!15883 List!9655)) )
))
(declare-fun arrayNoDuplicates!0 (array!32231 (_ BitVec 32) List!9655) Bool)

(assert (=> b!499103 (= res!301116 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9652))))

(declare-fun b!499104 () Bool)

(assert (=> b!499104 (= e!292491 (= (seekEntryOrOpen!0 (select (arr!15497 a!3235) j!176) a!3235 mask!3524) (Found!3964 j!176)))))

(declare-fun b!499105 () Bool)

(declare-fun res!301107 () Bool)

(assert (=> b!499105 (=> (not res!301107) (not e!292489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499105 (= res!301107 (validKeyInArray!0 k!2280))))

(declare-fun b!499106 () Bool)

(declare-fun res!301117 () Bool)

(assert (=> b!499106 (=> (not res!301117) (not e!292489))))

(assert (=> b!499106 (= res!301117 (validKeyInArray!0 (select (arr!15497 a!3235) j!176)))))

(declare-fun b!499107 () Bool)

(declare-fun e!292490 () Bool)

(assert (=> b!499107 (= e!292494 e!292490)))

(declare-fun res!301106 () Bool)

(assert (=> b!499107 (=> res!301106 e!292490)))

(assert (=> b!499107 (= res!301106 (or (bvsgt #b00000000000000000000000000000000 (x!47081 lt!226222)) (bvsgt (x!47081 lt!226222) #b01111111111111111111111111111110) (bvslt lt!226225 #b00000000000000000000000000000000) (bvsge lt!226225 (size!15861 a!3235)) (bvslt (index!18040 lt!226222) #b00000000000000000000000000000000) (bvsge (index!18040 lt!226222) (size!15861 a!3235)) (not (= lt!226222 (Intermediate!3964 false (index!18040 lt!226222) (x!47081 lt!226222))))))))

(assert (=> b!499107 (and (or (= (select (arr!15497 a!3235) (index!18040 lt!226222)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15497 a!3235) (index!18040 lt!226222)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15497 a!3235) (index!18040 lt!226222)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15497 a!3235) (index!18040 lt!226222)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226226 () Unit!14932)

(assert (=> b!499107 (= lt!226226 e!292493)))

(declare-fun c!59273 () Bool)

(assert (=> b!499107 (= c!59273 (= (select (arr!15497 a!3235) (index!18040 lt!226222)) (select (arr!15497 a!3235) j!176)))))

(assert (=> b!499107 (and (bvslt (x!47081 lt!226222) #b01111111111111111111111111111110) (or (= (select (arr!15497 a!3235) (index!18040 lt!226222)) (select (arr!15497 a!3235) j!176)) (= (select (arr!15497 a!3235) (index!18040 lt!226222)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15497 a!3235) (index!18040 lt!226222)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499108 () Bool)

(assert (=> b!499108 (= e!292487 false)))

(declare-fun b!499109 () Bool)

(declare-fun Unit!14935 () Unit!14932)

(assert (=> b!499109 (= e!292493 Unit!14935)))

(declare-fun b!499110 () Bool)

(declare-fun res!301112 () Bool)

(assert (=> b!499110 (=> (not res!301112) (not e!292488))))

(assert (=> b!499110 (= res!301112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499111 () Bool)

(assert (=> b!499111 (= e!292490 true)))

(declare-fun lt!226223 () SeekEntryResult!3964)

(assert (=> b!499111 (= lt!226223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226225 lt!226227 lt!226219 mask!3524))))

(declare-fun b!499112 () Bool)

(declare-fun res!301115 () Bool)

(assert (=> b!499112 (=> (not res!301115) (not e!292489))))

(assert (=> b!499112 (= res!301115 (and (= (size!15861 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15861 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15861 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45406 res!301109) b!499112))

(assert (= (and b!499112 res!301115) b!499106))

(assert (= (and b!499106 res!301117) b!499105))

(assert (= (and b!499105 res!301107) b!499098))

(assert (= (and b!499098 res!301118) b!499101))

(assert (= (and b!499101 res!301111) b!499110))

(assert (= (and b!499110 res!301112) b!499103))

(assert (= (and b!499103 res!301116) b!499099))

(assert (= (and b!499099 res!301114) b!499104))

(assert (= (and b!499099 (not res!301110)) b!499100))

(assert (= (and b!499100 (not res!301113)) b!499107))

(assert (= (and b!499107 c!59273) b!499102))

(assert (= (and b!499107 (not c!59273)) b!499109))

(assert (= (and b!499102 res!301108) b!499108))

(assert (= (and b!499107 (not res!301106)) b!499111))

(declare-fun m!480321 () Bool)

(assert (=> b!499099 m!480321))

(declare-fun m!480323 () Bool)

(assert (=> b!499099 m!480323))

(declare-fun m!480325 () Bool)

(assert (=> b!499099 m!480325))

(declare-fun m!480327 () Bool)

(assert (=> b!499099 m!480327))

(declare-fun m!480329 () Bool)

(assert (=> b!499099 m!480329))

(declare-fun m!480331 () Bool)

(assert (=> b!499099 m!480331))

(declare-fun m!480333 () Bool)

(assert (=> b!499099 m!480333))

(assert (=> b!499099 m!480321))

(declare-fun m!480335 () Bool)

(assert (=> b!499099 m!480335))

(assert (=> b!499099 m!480321))

(declare-fun m!480337 () Bool)

(assert (=> b!499099 m!480337))

(declare-fun m!480339 () Bool)

(assert (=> b!499107 m!480339))

(assert (=> b!499107 m!480321))

(declare-fun m!480341 () Bool)

(assert (=> b!499098 m!480341))

(assert (=> b!499104 m!480321))

(assert (=> b!499104 m!480321))

(declare-fun m!480343 () Bool)

(assert (=> b!499104 m!480343))

(assert (=> b!499106 m!480321))

(assert (=> b!499106 m!480321))

(declare-fun m!480345 () Bool)

(assert (=> b!499106 m!480345))

(declare-fun m!480347 () Bool)

(assert (=> b!499105 m!480347))

(declare-fun m!480349 () Bool)

(assert (=> b!499102 m!480349))

(declare-fun m!480351 () Bool)

(assert (=> b!499102 m!480351))

(declare-fun m!480353 () Bool)

(assert (=> b!499110 m!480353))

(assert (=> b!499111 m!480351))

(declare-fun m!480355 () Bool)

(assert (=> b!499103 m!480355))

(declare-fun m!480357 () Bool)

(assert (=> start!45406 m!480357))

(declare-fun m!480359 () Bool)

(assert (=> start!45406 m!480359))

(declare-fun m!480361 () Bool)

(assert (=> b!499101 m!480361))

(push 1)

