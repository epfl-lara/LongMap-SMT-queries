; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44872 () Bool)

(assert start!44872)

(declare-fun b!492389 () Bool)

(declare-fun res!295149 () Bool)

(declare-fun e!289257 () Bool)

(assert (=> b!492389 (=> (not res!295149) (not e!289257))))

(declare-datatypes ((array!31874 0))(
  ( (array!31875 (arr!15323 (Array (_ BitVec 32) (_ BitVec 64))) (size!15687 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31874)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31874 (_ BitVec 32)) Bool)

(assert (=> b!492389 (= res!295149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492390 () Bool)

(declare-fun e!289253 () Bool)

(assert (=> b!492390 (= e!289253 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun b!492391 () Bool)

(declare-fun e!289256 () Bool)

(assert (=> b!492391 (= e!289256 e!289257)))

(declare-fun res!295144 () Bool)

(assert (=> b!492391 (=> (not res!295144) (not e!289257))))

(declare-datatypes ((SeekEntryResult!3790 0))(
  ( (MissingZero!3790 (index!17339 (_ BitVec 32))) (Found!3790 (index!17340 (_ BitVec 32))) (Intermediate!3790 (undefined!4602 Bool) (index!17341 (_ BitVec 32)) (x!46422 (_ BitVec 32))) (Undefined!3790) (MissingVacant!3790 (index!17342 (_ BitVec 32))) )
))
(declare-fun lt!222594 () SeekEntryResult!3790)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492391 (= res!295144 (or (= lt!222594 (MissingZero!3790 i!1204)) (= lt!222594 (MissingVacant!3790 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31874 (_ BitVec 32)) SeekEntryResult!3790)

(assert (=> b!492391 (= lt!222594 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!492392 () Bool)

(assert (=> b!492392 (= e!289257 (not e!289253))))

(declare-fun res!295150 () Bool)

(assert (=> b!492392 (=> res!295150 e!289253)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31874 (_ BitVec 32)) SeekEntryResult!3790)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492392 (= res!295150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15323 a!3235) j!176) mask!3524) (select (arr!15323 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15323 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15323 a!3235) i!1204 k!2280) j!176) (array!31875 (store (arr!15323 a!3235) i!1204 k!2280) (size!15687 a!3235)) mask!3524)))))

(declare-fun e!289254 () Bool)

(assert (=> b!492392 e!289254))

(declare-fun res!295146 () Bool)

(assert (=> b!492392 (=> (not res!295146) (not e!289254))))

(assert (=> b!492392 (= res!295146 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14526 0))(
  ( (Unit!14527) )
))
(declare-fun lt!222595 () Unit!14526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14526)

(assert (=> b!492392 (= lt!222595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!295145 () Bool)

(assert (=> start!44872 (=> (not res!295145) (not e!289256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44872 (= res!295145 (validMask!0 mask!3524))))

(assert (=> start!44872 e!289256))

(assert (=> start!44872 true))

(declare-fun array_inv!11119 (array!31874) Bool)

(assert (=> start!44872 (array_inv!11119 a!3235)))

(declare-fun b!492393 () Bool)

(declare-fun res!295151 () Bool)

(assert (=> b!492393 (=> (not res!295151) (not e!289257))))

(declare-datatypes ((List!9481 0))(
  ( (Nil!9478) (Cons!9477 (h!10342 (_ BitVec 64)) (t!15709 List!9481)) )
))
(declare-fun arrayNoDuplicates!0 (array!31874 (_ BitVec 32) List!9481) Bool)

(assert (=> b!492393 (= res!295151 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9478))))

(declare-fun b!492394 () Bool)

(assert (=> b!492394 (= e!289254 (= (seekEntryOrOpen!0 (select (arr!15323 a!3235) j!176) a!3235 mask!3524) (Found!3790 j!176)))))

(declare-fun b!492395 () Bool)

(declare-fun res!295143 () Bool)

(assert (=> b!492395 (=> (not res!295143) (not e!289256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492395 (= res!295143 (validKeyInArray!0 k!2280))))

(declare-fun b!492396 () Bool)

(declare-fun res!295148 () Bool)

(assert (=> b!492396 (=> (not res!295148) (not e!289256))))

(assert (=> b!492396 (= res!295148 (and (= (size!15687 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15687 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15687 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492397 () Bool)

(declare-fun res!295142 () Bool)

(assert (=> b!492397 (=> (not res!295142) (not e!289256))))

(declare-fun arrayContainsKey!0 (array!31874 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492397 (= res!295142 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492398 () Bool)

(declare-fun res!295147 () Bool)

(assert (=> b!492398 (=> (not res!295147) (not e!289256))))

(assert (=> b!492398 (= res!295147 (validKeyInArray!0 (select (arr!15323 a!3235) j!176)))))

(assert (= (and start!44872 res!295145) b!492396))

(assert (= (and b!492396 res!295148) b!492398))

(assert (= (and b!492398 res!295147) b!492395))

(assert (= (and b!492395 res!295143) b!492397))

(assert (= (and b!492397 res!295142) b!492391))

(assert (= (and b!492391 res!295144) b!492389))

(assert (= (and b!492389 res!295149) b!492393))

(assert (= (and b!492393 res!295151) b!492392))

(assert (= (and b!492392 res!295146) b!492394))

(assert (= (and b!492392 (not res!295150)) b!492390))

(declare-fun m!473103 () Bool)

(assert (=> start!44872 m!473103))

(declare-fun m!473105 () Bool)

(assert (=> start!44872 m!473105))

(declare-fun m!473107 () Bool)

(assert (=> b!492394 m!473107))

(assert (=> b!492394 m!473107))

(declare-fun m!473109 () Bool)

(assert (=> b!492394 m!473109))

(declare-fun m!473111 () Bool)

(assert (=> b!492397 m!473111))

(declare-fun m!473113 () Bool)

(assert (=> b!492393 m!473113))

(assert (=> b!492398 m!473107))

(assert (=> b!492398 m!473107))

(declare-fun m!473115 () Bool)

(assert (=> b!492398 m!473115))

(declare-fun m!473117 () Bool)

(assert (=> b!492395 m!473117))

(declare-fun m!473119 () Bool)

(assert (=> b!492392 m!473119))

(declare-fun m!473121 () Bool)

(assert (=> b!492392 m!473121))

(declare-fun m!473123 () Bool)

(assert (=> b!492392 m!473123))

(declare-fun m!473125 () Bool)

(assert (=> b!492392 m!473125))

(assert (=> b!492392 m!473107))

(declare-fun m!473127 () Bool)

(assert (=> b!492392 m!473127))

(assert (=> b!492392 m!473107))

(assert (=> b!492392 m!473125))

(declare-fun m!473129 () Bool)

(assert (=> b!492392 m!473129))

(assert (=> b!492392 m!473123))

(declare-fun m!473131 () Bool)

(assert (=> b!492392 m!473131))

(assert (=> b!492392 m!473107))

(declare-fun m!473133 () Bool)

(assert (=> b!492392 m!473133))

(assert (=> b!492392 m!473123))

(assert (=> b!492392 m!473129))

(declare-fun m!473135 () Bool)

(assert (=> b!492389 m!473135))

(declare-fun m!473137 () Bool)

(assert (=> b!492391 m!473137))

(push 1)

(assert (not b!492392))

(assert (not b!492389))

(assert (not b!492391))

(assert (not b!492395))

(assert (not start!44872))

(assert (not b!492393))

(assert (not b!492397))

(assert (not b!492394))

(assert (not b!492398))

(check-sat)

(pop 1)

