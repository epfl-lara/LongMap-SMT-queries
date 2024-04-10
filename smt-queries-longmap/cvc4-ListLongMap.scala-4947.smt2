; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68074 () Bool)

(assert start!68074)

(declare-fun b!791913 () Bool)

(declare-fun res!536650 () Bool)

(declare-fun e!440036 () Bool)

(assert (=> b!791913 (=> (not res!536650) (not e!440036))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791913 (= res!536650 (validKeyInArray!0 k!2044))))

(declare-fun b!791914 () Bool)

(declare-fun res!536651 () Bool)

(assert (=> b!791914 (=> (not res!536651) (not e!440036))))

(declare-datatypes ((array!42977 0))(
  ( (array!42978 (arr!20573 (Array (_ BitVec 32) (_ BitVec 64))) (size!20994 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42977)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791914 (= res!536651 (validKeyInArray!0 (select (arr!20573 a!3170) j!153)))))

(declare-fun b!791915 () Bool)

(assert (=> b!791915 (= e!440036 false)))

(declare-datatypes ((SeekEntryResult!8164 0))(
  ( (MissingZero!8164 (index!35024 (_ BitVec 32))) (Found!8164 (index!35025 (_ BitVec 32))) (Intermediate!8164 (undefined!8976 Bool) (index!35026 (_ BitVec 32)) (x!65978 (_ BitVec 32))) (Undefined!8164) (MissingVacant!8164 (index!35027 (_ BitVec 32))) )
))
(declare-fun lt!353330 () SeekEntryResult!8164)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42977 (_ BitVec 32)) SeekEntryResult!8164)

(assert (=> b!791915 (= lt!353330 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791916 () Bool)

(declare-fun res!536647 () Bool)

(assert (=> b!791916 (=> (not res!536647) (not e!440036))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!791916 (= res!536647 (and (= (size!20994 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20994 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20994 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536649 () Bool)

(assert (=> start!68074 (=> (not res!536649) (not e!440036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68074 (= res!536649 (validMask!0 mask!3266))))

(assert (=> start!68074 e!440036))

(assert (=> start!68074 true))

(declare-fun array_inv!16369 (array!42977) Bool)

(assert (=> start!68074 (array_inv!16369 a!3170)))

(declare-fun b!791912 () Bool)

(declare-fun res!536648 () Bool)

(assert (=> b!791912 (=> (not res!536648) (not e!440036))))

(declare-fun arrayContainsKey!0 (array!42977 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791912 (= res!536648 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68074 res!536649) b!791916))

(assert (= (and b!791916 res!536647) b!791914))

(assert (= (and b!791914 res!536651) b!791913))

(assert (= (and b!791913 res!536650) b!791912))

(assert (= (and b!791912 res!536648) b!791915))

(declare-fun m!732615 () Bool)

(assert (=> start!68074 m!732615))

(declare-fun m!732617 () Bool)

(assert (=> start!68074 m!732617))

(declare-fun m!732619 () Bool)

(assert (=> b!791914 m!732619))

(assert (=> b!791914 m!732619))

(declare-fun m!732621 () Bool)

(assert (=> b!791914 m!732621))

(declare-fun m!732623 () Bool)

(assert (=> b!791912 m!732623))

(declare-fun m!732625 () Bool)

(assert (=> b!791915 m!732625))

(declare-fun m!732627 () Bool)

(assert (=> b!791913 m!732627))

(push 1)

(assert (not start!68074))

(assert (not b!791913))

(assert (not b!791915))

