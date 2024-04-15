; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44700 () Bool)

(assert start!44700)

(declare-fun b!490433 () Bool)

(declare-fun res!293511 () Bool)

(declare-fun e!288250 () Bool)

(assert (=> b!490433 (=> (not res!293511) (not e!288250))))

(declare-datatypes ((array!31769 0))(
  ( (array!31770 (arr!15272 (Array (_ BitVec 32) (_ BitVec 64))) (size!15637 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31769)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490433 (= res!293511 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490434 () Bool)

(declare-fun e!288252 () Bool)

(declare-fun e!288251 () Bool)

(assert (=> b!490434 (= e!288252 (not e!288251))))

(declare-fun res!293514 () Bool)

(assert (=> b!490434 (=> res!293514 e!288251)))

(declare-fun lt!221438 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!221435 () array!31769)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3736 0))(
  ( (MissingZero!3736 (index!17123 (_ BitVec 32))) (Found!3736 (index!17124 (_ BitVec 32))) (Intermediate!3736 (undefined!4548 Bool) (index!17125 (_ BitVec 32)) (x!46229 (_ BitVec 32))) (Undefined!3736) (MissingVacant!3736 (index!17126 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31769 (_ BitVec 32)) SeekEntryResult!3736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490434 (= res!293514 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15272 a!3235) j!176) mask!3524) (select (arr!15272 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221438 mask!3524) lt!221438 lt!221435 mask!3524))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490434 (= lt!221438 (select (store (arr!15272 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490434 (= lt!221435 (array!31770 (store (arr!15272 a!3235) i!1204 k0!2280) (size!15637 a!3235)))))

(declare-fun lt!221440 () SeekEntryResult!3736)

(assert (=> b!490434 (= lt!221440 (Found!3736 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31769 (_ BitVec 32)) SeekEntryResult!3736)

(assert (=> b!490434 (= lt!221440 (seekEntryOrOpen!0 (select (arr!15272 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31769 (_ BitVec 32)) Bool)

(assert (=> b!490434 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14404 0))(
  ( (Unit!14405) )
))
(declare-fun lt!221437 () Unit!14404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14404)

(assert (=> b!490434 (= lt!221437 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!293513 () Bool)

(assert (=> start!44700 (=> (not res!293513) (not e!288250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44700 (= res!293513 (validMask!0 mask!3524))))

(assert (=> start!44700 e!288250))

(assert (=> start!44700 true))

(declare-fun array_inv!11155 (array!31769) Bool)

(assert (=> start!44700 (array_inv!11155 a!3235)))

(declare-fun b!490435 () Bool)

(declare-fun res!293518 () Bool)

(assert (=> b!490435 (=> (not res!293518) (not e!288250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490435 (= res!293518 (validKeyInArray!0 k0!2280))))

(declare-fun b!490436 () Bool)

(declare-fun res!293512 () Bool)

(assert (=> b!490436 (=> (not res!293512) (not e!288250))))

(assert (=> b!490436 (= res!293512 (validKeyInArray!0 (select (arr!15272 a!3235) j!176)))))

(declare-fun b!490437 () Bool)

(assert (=> b!490437 (= e!288251 true)))

(assert (=> b!490437 (= lt!221440 (seekEntryOrOpen!0 lt!221438 lt!221435 mask!3524))))

(declare-fun lt!221439 () Unit!14404)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31769 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14404)

(assert (=> b!490437 (= lt!221439 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490438 () Bool)

(declare-fun res!293517 () Bool)

(assert (=> b!490438 (=> (not res!293517) (not e!288252))))

(declare-datatypes ((List!9469 0))(
  ( (Nil!9466) (Cons!9465 (h!10327 (_ BitVec 64)) (t!15688 List!9469)) )
))
(declare-fun arrayNoDuplicates!0 (array!31769 (_ BitVec 32) List!9469) Bool)

(assert (=> b!490438 (= res!293517 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9466))))

(declare-fun b!490439 () Bool)

(declare-fun res!293515 () Bool)

(assert (=> b!490439 (=> (not res!293515) (not e!288250))))

(assert (=> b!490439 (= res!293515 (and (= (size!15637 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15637 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15637 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490440 () Bool)

(assert (=> b!490440 (= e!288250 e!288252)))

(declare-fun res!293519 () Bool)

(assert (=> b!490440 (=> (not res!293519) (not e!288252))))

(declare-fun lt!221436 () SeekEntryResult!3736)

(assert (=> b!490440 (= res!293519 (or (= lt!221436 (MissingZero!3736 i!1204)) (= lt!221436 (MissingVacant!3736 i!1204))))))

(assert (=> b!490440 (= lt!221436 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490441 () Bool)

(declare-fun res!293516 () Bool)

(assert (=> b!490441 (=> (not res!293516) (not e!288252))))

(assert (=> b!490441 (= res!293516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44700 res!293513) b!490439))

(assert (= (and b!490439 res!293515) b!490436))

(assert (= (and b!490436 res!293512) b!490435))

(assert (= (and b!490435 res!293518) b!490433))

(assert (= (and b!490433 res!293511) b!490440))

(assert (= (and b!490440 res!293519) b!490441))

(assert (= (and b!490441 res!293516) b!490438))

(assert (= (and b!490438 res!293517) b!490434))

(assert (= (and b!490434 (not res!293514)) b!490437))

(declare-fun m!470185 () Bool)

(assert (=> b!490438 m!470185))

(declare-fun m!470187 () Bool)

(assert (=> b!490440 m!470187))

(declare-fun m!470189 () Bool)

(assert (=> b!490434 m!470189))

(declare-fun m!470191 () Bool)

(assert (=> b!490434 m!470191))

(declare-fun m!470193 () Bool)

(assert (=> b!490434 m!470193))

(declare-fun m!470195 () Bool)

(assert (=> b!490434 m!470195))

(declare-fun m!470197 () Bool)

(assert (=> b!490434 m!470197))

(declare-fun m!470199 () Bool)

(assert (=> b!490434 m!470199))

(declare-fun m!470201 () Bool)

(assert (=> b!490434 m!470201))

(assert (=> b!490434 m!470199))

(assert (=> b!490434 m!470197))

(assert (=> b!490434 m!470199))

(declare-fun m!470203 () Bool)

(assert (=> b!490434 m!470203))

(assert (=> b!490434 m!470191))

(declare-fun m!470205 () Bool)

(assert (=> b!490434 m!470205))

(assert (=> b!490434 m!470199))

(declare-fun m!470207 () Bool)

(assert (=> b!490434 m!470207))

(declare-fun m!470209 () Bool)

(assert (=> b!490433 m!470209))

(declare-fun m!470211 () Bool)

(assert (=> b!490435 m!470211))

(declare-fun m!470213 () Bool)

(assert (=> b!490437 m!470213))

(declare-fun m!470215 () Bool)

(assert (=> b!490437 m!470215))

(declare-fun m!470217 () Bool)

(assert (=> start!44700 m!470217))

(declare-fun m!470219 () Bool)

(assert (=> start!44700 m!470219))

(assert (=> b!490436 m!470199))

(assert (=> b!490436 m!470199))

(declare-fun m!470221 () Bool)

(assert (=> b!490436 m!470221))

(declare-fun m!470223 () Bool)

(assert (=> b!490441 m!470223))

(check-sat (not b!490435) (not b!490437) (not b!490436) (not b!490438) (not b!490440) (not b!490433) (not b!490441) (not b!490434) (not start!44700))
(check-sat)
