; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48216 () Bool)

(assert start!48216)

(declare-fun b!530641 () Bool)

(declare-fun res!326491 () Bool)

(declare-fun e!309077 () Bool)

(assert (=> b!530641 (=> (not res!326491) (not e!309077))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530641 (= res!326491 (validKeyInArray!0 k0!1998))))

(declare-fun b!530642 () Bool)

(declare-fun res!326495 () Bool)

(assert (=> b!530642 (=> (not res!326495) (not e!309077))))

(declare-datatypes ((array!33651 0))(
  ( (array!33652 (arr!16172 (Array (_ BitVec 32) (_ BitVec 64))) (size!16537 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33651)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!530642 (= res!326495 (validKeyInArray!0 (select (arr!16172 a!3154) j!147)))))

(declare-fun b!530643 () Bool)

(declare-fun res!326494 () Bool)

(assert (=> b!530643 (=> (not res!326494) (not e!309077))))

(declare-fun arrayContainsKey!0 (array!33651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530643 (= res!326494 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530645 () Bool)

(declare-fun e!309078 () Bool)

(assert (=> b!530645 (= e!309077 e!309078)))

(declare-fun res!326493 () Bool)

(assert (=> b!530645 (=> (not res!326493) (not e!309078))))

(declare-datatypes ((SeekEntryResult!4627 0))(
  ( (MissingZero!4627 (index!20732 (_ BitVec 32))) (Found!4627 (index!20733 (_ BitVec 32))) (Intermediate!4627 (undefined!5439 Bool) (index!20734 (_ BitVec 32)) (x!49724 (_ BitVec 32))) (Undefined!4627) (MissingVacant!4627 (index!20735 (_ BitVec 32))) )
))
(declare-fun lt!244588 () SeekEntryResult!4627)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530645 (= res!326493 (or (= lt!244588 (MissingZero!4627 i!1153)) (= lt!244588 (MissingVacant!4627 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33651 (_ BitVec 32)) SeekEntryResult!4627)

(assert (=> b!530645 (= lt!244588 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530646 () Bool)

(declare-fun res!326492 () Bool)

(assert (=> b!530646 (=> (not res!326492) (not e!309077))))

(assert (=> b!530646 (= res!326492 (and (= (size!16537 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16537 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16537 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530647 () Bool)

(assert (=> b!530647 (= e!309078 (bvsgt #b00000000000000000000000000000000 (size!16537 a!3154)))))

(declare-fun res!326489 () Bool)

(assert (=> start!48216 (=> (not res!326489) (not e!309077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48216 (= res!326489 (validMask!0 mask!3216))))

(assert (=> start!48216 e!309077))

(assert (=> start!48216 true))

(declare-fun array_inv!12055 (array!33651) Bool)

(assert (=> start!48216 (array_inv!12055 a!3154)))

(declare-fun b!530644 () Bool)

(declare-fun res!326490 () Bool)

(assert (=> b!530644 (=> (not res!326490) (not e!309078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33651 (_ BitVec 32)) Bool)

(assert (=> b!530644 (= res!326490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48216 res!326489) b!530646))

(assert (= (and b!530646 res!326492) b!530642))

(assert (= (and b!530642 res!326495) b!530641))

(assert (= (and b!530641 res!326491) b!530643))

(assert (= (and b!530643 res!326494) b!530645))

(assert (= (and b!530645 res!326493) b!530644))

(assert (= (and b!530644 res!326490) b!530647))

(declare-fun m!510697 () Bool)

(assert (=> b!530643 m!510697))

(declare-fun m!510699 () Bool)

(assert (=> b!530642 m!510699))

(assert (=> b!530642 m!510699))

(declare-fun m!510701 () Bool)

(assert (=> b!530642 m!510701))

(declare-fun m!510703 () Bool)

(assert (=> b!530641 m!510703))

(declare-fun m!510705 () Bool)

(assert (=> b!530645 m!510705))

(declare-fun m!510707 () Bool)

(assert (=> b!530644 m!510707))

(declare-fun m!510709 () Bool)

(assert (=> start!48216 m!510709))

(declare-fun m!510711 () Bool)

(assert (=> start!48216 m!510711))

(check-sat (not b!530642) (not b!530644) (not b!530641) (not b!530643) (not b!530645) (not start!48216))
(check-sat)
