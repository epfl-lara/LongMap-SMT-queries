; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48210 () Bool)

(assert start!48210)

(declare-fun b!530592 () Bool)

(declare-fun res!326441 () Bool)

(declare-fun e!309056 () Bool)

(assert (=> b!530592 (=> (not res!326441) (not e!309056))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530592 (= res!326441 (validKeyInArray!0 k0!1998))))

(declare-fun b!530593 () Bool)

(declare-fun res!326442 () Bool)

(assert (=> b!530593 (=> (not res!326442) (not e!309056))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33645 0))(
  ( (array!33646 (arr!16169 (Array (_ BitVec 32) (_ BitVec 64))) (size!16534 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33645)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530593 (= res!326442 (and (= (size!16534 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16534 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16534 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326440 () Bool)

(assert (=> start!48210 (=> (not res!326440) (not e!309056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48210 (= res!326440 (validMask!0 mask!3216))))

(assert (=> start!48210 e!309056))

(assert (=> start!48210 true))

(declare-fun array_inv!12052 (array!33645) Bool)

(assert (=> start!48210 (array_inv!12052 a!3154)))

(declare-datatypes ((SeekEntryResult!4624 0))(
  ( (MissingZero!4624 (index!20720 (_ BitVec 32))) (Found!4624 (index!20721 (_ BitVec 32))) (Intermediate!4624 (undefined!5436 Bool) (index!20722 (_ BitVec 32)) (x!49713 (_ BitVec 32))) (Undefined!4624) (MissingVacant!4624 (index!20723 (_ BitVec 32))) )
))
(declare-fun lt!244579 () SeekEntryResult!4624)

(declare-fun b!530594 () Bool)

(assert (=> b!530594 (= e!309056 (and (or (= lt!244579 (MissingZero!4624 i!1153)) (= lt!244579 (MissingVacant!4624 i!1153))) (bvsgt #b00000000000000000000000000000000 (size!16534 a!3154))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33645 (_ BitVec 32)) SeekEntryResult!4624)

(assert (=> b!530594 (= lt!244579 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530595 () Bool)

(declare-fun res!326444 () Bool)

(assert (=> b!530595 (=> (not res!326444) (not e!309056))))

(assert (=> b!530595 (= res!326444 (validKeyInArray!0 (select (arr!16169 a!3154) j!147)))))

(declare-fun b!530596 () Bool)

(declare-fun res!326443 () Bool)

(assert (=> b!530596 (=> (not res!326443) (not e!309056))))

(declare-fun arrayContainsKey!0 (array!33645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530596 (= res!326443 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48210 res!326440) b!530593))

(assert (= (and b!530593 res!326442) b!530595))

(assert (= (and b!530595 res!326444) b!530592))

(assert (= (and b!530592 res!326441) b!530596))

(assert (= (and b!530596 res!326443) b!530594))

(declare-fun m!510655 () Bool)

(assert (=> start!48210 m!510655))

(declare-fun m!510657 () Bool)

(assert (=> start!48210 m!510657))

(declare-fun m!510659 () Bool)

(assert (=> b!530595 m!510659))

(assert (=> b!530595 m!510659))

(declare-fun m!510661 () Bool)

(assert (=> b!530595 m!510661))

(declare-fun m!510663 () Bool)

(assert (=> b!530594 m!510663))

(declare-fun m!510665 () Bool)

(assert (=> b!530592 m!510665))

(declare-fun m!510667 () Bool)

(assert (=> b!530596 m!510667))

(check-sat (not b!530594) (not start!48210) (not b!530592) (not b!530595) (not b!530596))
(check-sat)
