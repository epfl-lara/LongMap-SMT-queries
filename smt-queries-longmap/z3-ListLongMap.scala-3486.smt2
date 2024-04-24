; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48376 () Bool)

(assert start!48376)

(declare-fun res!327138 () Bool)

(declare-fun e!309631 () Bool)

(assert (=> start!48376 (=> (not res!327138) (not e!309631))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48376 (= res!327138 (validMask!0 mask!3216))))

(assert (=> start!48376 e!309631))

(assert (=> start!48376 true))

(declare-datatypes ((array!33683 0))(
  ( (array!33684 (arr!16183 (Array (_ BitVec 32) (_ BitVec 64))) (size!16547 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33683)

(declare-fun array_inv!12042 (array!33683) Bool)

(assert (=> start!48376 (array_inv!12042 a!3154)))

(declare-fun b!531588 () Bool)

(declare-fun res!327139 () Bool)

(assert (=> b!531588 (=> (not res!327139) (not e!309631))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531588 (= res!327139 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531589 () Bool)

(declare-fun res!327133 () Bool)

(assert (=> b!531589 (=> (not res!327133) (not e!309631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531589 (= res!327133 (validKeyInArray!0 k0!1998))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun e!309632 () Bool)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun b!531590 () Bool)

(assert (=> b!531590 (= e!309632 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16547 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16547 a!3154)) (= (select (arr!16183 a!3154) resIndex!32) (select (arr!16183 a!3154) j!147)) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!531591 () Bool)

(declare-fun res!327137 () Bool)

(assert (=> b!531591 (=> (not res!327137) (not e!309631))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531591 (= res!327137 (and (= (size!16547 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16547 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16547 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531592 () Bool)

(declare-fun res!327136 () Bool)

(assert (=> b!531592 (=> (not res!327136) (not e!309632))))

(declare-datatypes ((List!10209 0))(
  ( (Nil!10206) (Cons!10205 (h!11145 (_ BitVec 64)) (t!16429 List!10209)) )
))
(declare-fun arrayNoDuplicates!0 (array!33683 (_ BitVec 32) List!10209) Bool)

(assert (=> b!531592 (= res!327136 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10206))))

(declare-fun b!531593 () Bool)

(declare-fun res!327135 () Bool)

(assert (=> b!531593 (=> (not res!327135) (not e!309631))))

(assert (=> b!531593 (= res!327135 (validKeyInArray!0 (select (arr!16183 a!3154) j!147)))))

(declare-fun b!531594 () Bool)

(assert (=> b!531594 (= e!309631 e!309632)))

(declare-fun res!327134 () Bool)

(assert (=> b!531594 (=> (not res!327134) (not e!309632))))

(declare-datatypes ((SeekEntryResult!4597 0))(
  ( (MissingZero!4597 (index!20612 (_ BitVec 32))) (Found!4597 (index!20613 (_ BitVec 32))) (Intermediate!4597 (undefined!5409 Bool) (index!20614 (_ BitVec 32)) (x!49736 (_ BitVec 32))) (Undefined!4597) (MissingVacant!4597 (index!20615 (_ BitVec 32))) )
))
(declare-fun lt!245062 () SeekEntryResult!4597)

(assert (=> b!531594 (= res!327134 (or (= lt!245062 (MissingZero!4597 i!1153)) (= lt!245062 (MissingVacant!4597 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33683 (_ BitVec 32)) SeekEntryResult!4597)

(assert (=> b!531594 (= lt!245062 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531595 () Bool)

(declare-fun res!327132 () Bool)

(assert (=> b!531595 (=> (not res!327132) (not e!309632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33683 (_ BitVec 32)) Bool)

(assert (=> b!531595 (= res!327132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48376 res!327138) b!531591))

(assert (= (and b!531591 res!327137) b!531593))

(assert (= (and b!531593 res!327135) b!531589))

(assert (= (and b!531589 res!327133) b!531588))

(assert (= (and b!531588 res!327139) b!531594))

(assert (= (and b!531594 res!327134) b!531595))

(assert (= (and b!531595 res!327132) b!531592))

(assert (= (and b!531592 res!327136) b!531590))

(declare-fun m!512209 () Bool)

(assert (=> start!48376 m!512209))

(declare-fun m!512211 () Bool)

(assert (=> start!48376 m!512211))

(declare-fun m!512213 () Bool)

(assert (=> b!531594 m!512213))

(declare-fun m!512215 () Bool)

(assert (=> b!531589 m!512215))

(declare-fun m!512217 () Bool)

(assert (=> b!531590 m!512217))

(declare-fun m!512219 () Bool)

(assert (=> b!531590 m!512219))

(assert (=> b!531593 m!512219))

(assert (=> b!531593 m!512219))

(declare-fun m!512221 () Bool)

(assert (=> b!531593 m!512221))

(declare-fun m!512223 () Bool)

(assert (=> b!531592 m!512223))

(declare-fun m!512225 () Bool)

(assert (=> b!531595 m!512225))

(declare-fun m!512227 () Bool)

(assert (=> b!531588 m!512227))

(check-sat (not b!531588) (not start!48376) (not b!531595) (not b!531589) (not b!531593) (not b!531594) (not b!531592))
(check-sat)
