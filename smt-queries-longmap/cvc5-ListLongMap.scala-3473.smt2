; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48172 () Bool)

(assert start!48172)

(declare-fun b!530298 () Bool)

(declare-fun res!326150 () Bool)

(declare-fun e!308942 () Bool)

(assert (=> b!530298 (=> (not res!326150) (not e!308942))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33607 0))(
  ( (array!33608 (arr!16150 (Array (_ BitVec 32) (_ BitVec 64))) (size!16515 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33607)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530298 (= res!326150 (and (= (size!16515 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16515 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16515 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530299 () Bool)

(declare-fun res!326147 () Bool)

(assert (=> b!530299 (=> (not res!326147) (not e!308942))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530299 (= res!326147 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530300 () Bool)

(declare-fun res!326148 () Bool)

(assert (=> b!530300 (=> (not res!326148) (not e!308942))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530300 (= res!326148 (validKeyInArray!0 k!1998))))

(declare-fun b!530301 () Bool)

(assert (=> b!530301 (= e!308942 false)))

(declare-datatypes ((SeekEntryResult!4605 0))(
  ( (MissingZero!4605 (index!20644 (_ BitVec 32))) (Found!4605 (index!20645 (_ BitVec 32))) (Intermediate!4605 (undefined!5417 Bool) (index!20646 (_ BitVec 32)) (x!49638 (_ BitVec 32))) (Undefined!4605) (MissingVacant!4605 (index!20647 (_ BitVec 32))) )
))
(declare-fun lt!244531 () SeekEntryResult!4605)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33607 (_ BitVec 32)) SeekEntryResult!4605)

(assert (=> b!530301 (= lt!244531 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!326149 () Bool)

(assert (=> start!48172 (=> (not res!326149) (not e!308942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48172 (= res!326149 (validMask!0 mask!3216))))

(assert (=> start!48172 e!308942))

(assert (=> start!48172 true))

(declare-fun array_inv!12033 (array!33607) Bool)

(assert (=> start!48172 (array_inv!12033 a!3154)))

(declare-fun b!530302 () Bool)

(declare-fun res!326146 () Bool)

(assert (=> b!530302 (=> (not res!326146) (not e!308942))))

(assert (=> b!530302 (= res!326146 (validKeyInArray!0 (select (arr!16150 a!3154) j!147)))))

(assert (= (and start!48172 res!326149) b!530298))

(assert (= (and b!530298 res!326150) b!530302))

(assert (= (and b!530302 res!326146) b!530300))

(assert (= (and b!530300 res!326148) b!530299))

(assert (= (and b!530299 res!326147) b!530301))

(declare-fun m!510389 () Bool)

(assert (=> b!530300 m!510389))

(declare-fun m!510391 () Bool)

(assert (=> b!530299 m!510391))

(declare-fun m!510393 () Bool)

(assert (=> start!48172 m!510393))

(declare-fun m!510395 () Bool)

(assert (=> start!48172 m!510395))

(declare-fun m!510397 () Bool)

(assert (=> b!530302 m!510397))

(assert (=> b!530302 m!510397))

(declare-fun m!510399 () Bool)

(assert (=> b!530302 m!510399))

(declare-fun m!510401 () Bool)

(assert (=> b!530301 m!510401))

(push 1)

(assert (not b!530302))

(assert (not b!530301))

(assert (not b!530299))

(assert (not b!530300))

(assert (not start!48172))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

