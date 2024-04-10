; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68070 () Bool)

(assert start!68070)

(declare-fun b!791882 () Bool)

(declare-fun res!536620 () Bool)

(declare-fun e!440023 () Bool)

(assert (=> b!791882 (=> (not res!536620) (not e!440023))))

(declare-datatypes ((array!42973 0))(
  ( (array!42974 (arr!20571 (Array (_ BitVec 32) (_ BitVec 64))) (size!20992 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42973)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791882 (= res!536620 (validKeyInArray!0 (select (arr!20571 a!3170) j!153)))))

(declare-fun b!791883 () Bool)

(assert (=> b!791883 (= e!440023 false)))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8162 0))(
  ( (MissingZero!8162 (index!35016 (_ BitVec 32))) (Found!8162 (index!35017 (_ BitVec 32))) (Intermediate!8162 (undefined!8974 Bool) (index!35018 (_ BitVec 32)) (x!65976 (_ BitVec 32))) (Undefined!8162) (MissingVacant!8162 (index!35019 (_ BitVec 32))) )
))
(declare-fun lt!353324 () SeekEntryResult!8162)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42973 (_ BitVec 32)) SeekEntryResult!8162)

(assert (=> b!791883 (= lt!353324 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791884 () Bool)

(declare-fun res!536619 () Bool)

(assert (=> b!791884 (=> (not res!536619) (not e!440023))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791884 (= res!536619 (and (= (size!20992 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20992 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20992 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791885 () Bool)

(declare-fun res!536618 () Bool)

(assert (=> b!791885 (=> (not res!536618) (not e!440023))))

(assert (=> b!791885 (= res!536618 (validKeyInArray!0 k!2044))))

(declare-fun res!536621 () Bool)

(assert (=> start!68070 (=> (not res!536621) (not e!440023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68070 (= res!536621 (validMask!0 mask!3266))))

(assert (=> start!68070 e!440023))

(assert (=> start!68070 true))

(declare-fun array_inv!16367 (array!42973) Bool)

(assert (=> start!68070 (array_inv!16367 a!3170)))

(declare-fun b!791886 () Bool)

(declare-fun res!536617 () Bool)

(assert (=> b!791886 (=> (not res!536617) (not e!440023))))

(declare-fun arrayContainsKey!0 (array!42973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791886 (= res!536617 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68070 res!536621) b!791884))

(assert (= (and b!791884 res!536619) b!791882))

(assert (= (and b!791882 res!536620) b!791885))

(assert (= (and b!791885 res!536618) b!791886))

(assert (= (and b!791886 res!536617) b!791883))

(declare-fun m!732587 () Bool)

(assert (=> b!791883 m!732587))

(declare-fun m!732589 () Bool)

(assert (=> b!791885 m!732589))

(declare-fun m!732591 () Bool)

(assert (=> b!791886 m!732591))

(declare-fun m!732593 () Bool)

(assert (=> b!791882 m!732593))

(assert (=> b!791882 m!732593))

(declare-fun m!732595 () Bool)

(assert (=> b!791882 m!732595))

(declare-fun m!732597 () Bool)

(assert (=> start!68070 m!732597))

(declare-fun m!732599 () Bool)

(assert (=> start!68070 m!732599))

(push 1)

(assert (not start!68070))

(assert (not b!791882))

(assert (not b!791883))

(assert (not b!791885))

(assert (not b!791886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

