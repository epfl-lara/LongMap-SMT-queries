; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44308 () Bool)

(assert start!44308)

(declare-fun b!487264 () Bool)

(declare-fun res!290657 () Bool)

(declare-fun e!286712 () Bool)

(assert (=> b!487264 (=> (not res!290657) (not e!286712))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487264 (= res!290657 (validKeyInArray!0 k!2280))))

(declare-fun b!487265 () Bool)

(declare-fun res!290652 () Bool)

(declare-fun e!286711 () Bool)

(assert (=> b!487265 (=> (not res!290652) (not e!286711))))

(declare-datatypes ((array!31559 0))(
  ( (array!31560 (arr!15173 (Array (_ BitVec 32) (_ BitVec 64))) (size!15537 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31559)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31559 (_ BitVec 32)) Bool)

(assert (=> b!487265 (= res!290652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487266 () Bool)

(assert (=> b!487266 (= e!286712 e!286711)))

(declare-fun res!290654 () Bool)

(assert (=> b!487266 (=> (not res!290654) (not e!286711))))

(declare-datatypes ((SeekEntryResult!3640 0))(
  ( (MissingZero!3640 (index!16739 (_ BitVec 32))) (Found!3640 (index!16740 (_ BitVec 32))) (Intermediate!3640 (undefined!4452 Bool) (index!16741 (_ BitVec 32)) (x!45860 (_ BitVec 32))) (Undefined!3640) (MissingVacant!3640 (index!16742 (_ BitVec 32))) )
))
(declare-fun lt!219982 () SeekEntryResult!3640)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487266 (= res!290654 (or (= lt!219982 (MissingZero!3640 i!1204)) (= lt!219982 (MissingVacant!3640 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31559 (_ BitVec 32)) SeekEntryResult!3640)

(assert (=> b!487266 (= lt!219982 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487267 () Bool)

(declare-fun res!290656 () Bool)

(assert (=> b!487267 (=> (not res!290656) (not e!286711))))

(declare-datatypes ((List!9331 0))(
  ( (Nil!9328) (Cons!9327 (h!10183 (_ BitVec 64)) (t!15559 List!9331)) )
))
(declare-fun arrayNoDuplicates!0 (array!31559 (_ BitVec 32) List!9331) Bool)

(assert (=> b!487267 (= res!290656 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9328))))

(declare-fun b!487268 () Bool)

(assert (=> b!487268 (= e!286711 (not true))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!487268 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14226 0))(
  ( (Unit!14227) )
))
(declare-fun lt!219981 () Unit!14226)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31559 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14226)

(assert (=> b!487268 (= lt!219981 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487269 () Bool)

(declare-fun res!290653 () Bool)

(assert (=> b!487269 (=> (not res!290653) (not e!286712))))

(assert (=> b!487269 (= res!290653 (and (= (size!15537 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15537 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15537 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290655 () Bool)

(assert (=> start!44308 (=> (not res!290655) (not e!286712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44308 (= res!290655 (validMask!0 mask!3524))))

(assert (=> start!44308 e!286712))

(assert (=> start!44308 true))

(declare-fun array_inv!10969 (array!31559) Bool)

(assert (=> start!44308 (array_inv!10969 a!3235)))

(declare-fun b!487270 () Bool)

(declare-fun res!290650 () Bool)

(assert (=> b!487270 (=> (not res!290650) (not e!286712))))

(assert (=> b!487270 (= res!290650 (validKeyInArray!0 (select (arr!15173 a!3235) j!176)))))

(declare-fun b!487271 () Bool)

(declare-fun res!290651 () Bool)

(assert (=> b!487271 (=> (not res!290651) (not e!286712))))

(declare-fun arrayContainsKey!0 (array!31559 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487271 (= res!290651 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44308 res!290655) b!487269))

(assert (= (and b!487269 res!290653) b!487270))

(assert (= (and b!487270 res!290650) b!487264))

(assert (= (and b!487264 res!290657) b!487271))

(assert (= (and b!487271 res!290651) b!487266))

(assert (= (and b!487266 res!290654) b!487265))

(assert (= (and b!487265 res!290652) b!487267))

(assert (= (and b!487267 res!290656) b!487268))

(declare-fun m!467099 () Bool)

(assert (=> b!487268 m!467099))

(declare-fun m!467101 () Bool)

(assert (=> b!487268 m!467101))

(declare-fun m!467103 () Bool)

(assert (=> start!44308 m!467103))

(declare-fun m!467105 () Bool)

(assert (=> start!44308 m!467105))

(declare-fun m!467107 () Bool)

(assert (=> b!487266 m!467107))

(declare-fun m!467109 () Bool)

(assert (=> b!487264 m!467109))

(declare-fun m!467111 () Bool)

(assert (=> b!487267 m!467111))

(declare-fun m!467113 () Bool)

(assert (=> b!487270 m!467113))

(assert (=> b!487270 m!467113))

(declare-fun m!467115 () Bool)

(assert (=> b!487270 m!467115))

(declare-fun m!467117 () Bool)

(assert (=> b!487271 m!467117))

(declare-fun m!467119 () Bool)

(assert (=> b!487265 m!467119))

(push 1)

(assert (not b!487271))

(assert (not b!487267))

(assert (not b!487265))

(assert (not b!487266))

(assert (not b!487268))

(assert (not b!487264))

(assert (not b!487270))

(assert (not start!44308))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

