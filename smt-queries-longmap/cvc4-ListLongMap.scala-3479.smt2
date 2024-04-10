; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48220 () Bool)

(assert start!48220)

(declare-fun res!326554 () Bool)

(declare-fun e!309224 () Bool)

(assert (=> start!48220 (=> (not res!326554) (not e!309224))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48220 (= res!326554 (validMask!0 mask!3216))))

(assert (=> start!48220 e!309224))

(assert (=> start!48220 true))

(declare-datatypes ((array!33645 0))(
  ( (array!33646 (arr!16169 (Array (_ BitVec 32) (_ BitVec 64))) (size!16533 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33645)

(declare-fun array_inv!11965 (array!33645) Bool)

(assert (=> start!48220 (array_inv!11965 a!3154)))

(declare-fun b!530848 () Bool)

(assert (=> b!530848 (= e!309224 false)))

(declare-datatypes ((SeekEntryResult!4627 0))(
  ( (MissingZero!4627 (index!20732 (_ BitVec 32))) (Found!4627 (index!20733 (_ BitVec 32))) (Intermediate!4627 (undefined!5439 Bool) (index!20734 (_ BitVec 32)) (x!49713 (_ BitVec 32))) (Undefined!4627) (MissingVacant!4627 (index!20735 (_ BitVec 32))) )
))
(declare-fun lt!244810 () SeekEntryResult!4627)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33645 (_ BitVec 32)) SeekEntryResult!4627)

(assert (=> b!530848 (= lt!244810 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530849 () Bool)

(declare-fun res!326556 () Bool)

(assert (=> b!530849 (=> (not res!326556) (not e!309224))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530849 (= res!326556 (validKeyInArray!0 (select (arr!16169 a!3154) j!147)))))

(declare-fun b!530850 () Bool)

(declare-fun res!326558 () Bool)

(assert (=> b!530850 (=> (not res!326558) (not e!309224))))

(assert (=> b!530850 (= res!326558 (validKeyInArray!0 k!1998))))

(declare-fun b!530851 () Bool)

(declare-fun res!326557 () Bool)

(assert (=> b!530851 (=> (not res!326557) (not e!309224))))

(declare-fun arrayContainsKey!0 (array!33645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530851 (= res!326557 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530852 () Bool)

(declare-fun res!326555 () Bool)

(assert (=> b!530852 (=> (not res!326555) (not e!309224))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530852 (= res!326555 (and (= (size!16533 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16533 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16533 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48220 res!326554) b!530852))

(assert (= (and b!530852 res!326555) b!530849))

(assert (= (and b!530849 res!326556) b!530850))

(assert (= (and b!530850 res!326558) b!530851))

(assert (= (and b!530851 res!326557) b!530848))

(declare-fun m!511393 () Bool)

(assert (=> start!48220 m!511393))

(declare-fun m!511395 () Bool)

(assert (=> start!48220 m!511395))

(declare-fun m!511397 () Bool)

(assert (=> b!530849 m!511397))

(assert (=> b!530849 m!511397))

(declare-fun m!511399 () Bool)

(assert (=> b!530849 m!511399))

(declare-fun m!511401 () Bool)

(assert (=> b!530851 m!511401))

(declare-fun m!511403 () Bool)

(assert (=> b!530850 m!511403))

(declare-fun m!511405 () Bool)

(assert (=> b!530848 m!511405))

(push 1)

(assert (not start!48220))

(assert (not b!530849))

(assert (not b!530851))

(assert (not b!530850))

(assert (not b!530848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

