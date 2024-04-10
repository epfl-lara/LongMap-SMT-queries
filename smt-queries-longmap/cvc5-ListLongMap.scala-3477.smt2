; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48204 () Bool)

(assert start!48204)

(declare-fun b!530728 () Bool)

(declare-fun res!326438 () Bool)

(declare-fun e!309177 () Bool)

(assert (=> b!530728 (=> (not res!326438) (not e!309177))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-datatypes ((array!33629 0))(
  ( (array!33630 (arr!16161 (Array (_ BitVec 32) (_ BitVec 64))) (size!16525 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33629)

(assert (=> b!530728 (= res!326438 (and (= (size!16525 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16525 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16525 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530729 () Bool)

(assert (=> b!530729 (= e!309177 false)))

(declare-datatypes ((SeekEntryResult!4619 0))(
  ( (MissingZero!4619 (index!20700 (_ BitVec 32))) (Found!4619 (index!20701 (_ BitVec 32))) (Intermediate!4619 (undefined!5431 Bool) (index!20702 (_ BitVec 32)) (x!49689 (_ BitVec 32))) (Undefined!4619) (MissingVacant!4619 (index!20703 (_ BitVec 32))) )
))
(declare-fun lt!244786 () SeekEntryResult!4619)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33629 (_ BitVec 32)) SeekEntryResult!4619)

(assert (=> b!530729 (= lt!244786 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530731 () Bool)

(declare-fun res!326437 () Bool)

(assert (=> b!530731 (=> (not res!326437) (not e!309177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530731 (= res!326437 (validKeyInArray!0 (select (arr!16161 a!3154) j!147)))))

(declare-fun b!530732 () Bool)

(declare-fun res!326435 () Bool)

(assert (=> b!530732 (=> (not res!326435) (not e!309177))))

(assert (=> b!530732 (= res!326435 (validKeyInArray!0 k!1998))))

(declare-fun res!326436 () Bool)

(assert (=> start!48204 (=> (not res!326436) (not e!309177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48204 (= res!326436 (validMask!0 mask!3216))))

(assert (=> start!48204 e!309177))

(assert (=> start!48204 true))

(declare-fun array_inv!11957 (array!33629) Bool)

(assert (=> start!48204 (array_inv!11957 a!3154)))

(declare-fun b!530730 () Bool)

(declare-fun res!326434 () Bool)

(assert (=> b!530730 (=> (not res!326434) (not e!309177))))

(declare-fun arrayContainsKey!0 (array!33629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530730 (= res!326434 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48204 res!326436) b!530728))

(assert (= (and b!530728 res!326438) b!530731))

(assert (= (and b!530731 res!326437) b!530732))

(assert (= (and b!530732 res!326435) b!530730))

(assert (= (and b!530730 res!326434) b!530729))

(declare-fun m!511281 () Bool)

(assert (=> b!530729 m!511281))

(declare-fun m!511283 () Bool)

(assert (=> b!530730 m!511283))

(declare-fun m!511285 () Bool)

(assert (=> start!48204 m!511285))

(declare-fun m!511287 () Bool)

(assert (=> start!48204 m!511287))

(declare-fun m!511289 () Bool)

(assert (=> b!530731 m!511289))

(assert (=> b!530731 m!511289))

(declare-fun m!511291 () Bool)

(assert (=> b!530731 m!511291))

(declare-fun m!511293 () Bool)

(assert (=> b!530732 m!511293))

(push 1)

(assert (not b!530731))

(assert (not start!48204))

(assert (not b!530732))

(assert (not b!530729))

(assert (not b!530730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

