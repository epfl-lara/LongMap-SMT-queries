; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68050 () Bool)

(assert start!68050)

(declare-fun b!791731 () Bool)

(declare-fun res!536469 () Bool)

(declare-fun e!439964 () Bool)

(assert (=> b!791731 (=> (not res!536469) (not e!439964))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42953 0))(
  ( (array!42954 (arr!20561 (Array (_ BitVec 32) (_ BitVec 64))) (size!20982 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42953)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8152 0))(
  ( (MissingZero!8152 (index!34976 (_ BitVec 32))) (Found!8152 (index!34977 (_ BitVec 32))) (Intermediate!8152 (undefined!8964 Bool) (index!34978 (_ BitVec 32)) (x!65934 (_ BitVec 32))) (Undefined!8152) (MissingVacant!8152 (index!34979 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42953 (_ BitVec 32)) SeekEntryResult!8152)

(assert (=> b!791731 (= res!536469 (not (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) (MissingZero!8152 i!1163))))))

(declare-fun b!791732 () Bool)

(declare-fun res!536471 () Bool)

(assert (=> b!791732 (=> (not res!536471) (not e!439964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791732 (= res!536471 (validKeyInArray!0 k!2044))))

(declare-fun b!791733 () Bool)

(declare-fun res!536467 () Bool)

(assert (=> b!791733 (=> (not res!536467) (not e!439964))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791733 (= res!536467 (and (= (size!20982 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20982 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20982 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791734 () Bool)

(declare-fun res!536466 () Bool)

(assert (=> b!791734 (=> (not res!536466) (not e!439964))))

(assert (=> b!791734 (= res!536466 (validKeyInArray!0 (select (arr!20561 a!3170) j!153)))))

(declare-fun res!536468 () Bool)

(assert (=> start!68050 (=> (not res!536468) (not e!439964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68050 (= res!536468 (validMask!0 mask!3266))))

(assert (=> start!68050 e!439964))

(assert (=> start!68050 true))

(declare-fun array_inv!16357 (array!42953) Bool)

(assert (=> start!68050 (array_inv!16357 a!3170)))

(declare-fun b!791735 () Bool)

(declare-fun res!536470 () Bool)

(assert (=> b!791735 (=> (not res!536470) (not e!439964))))

(declare-fun arrayContainsKey!0 (array!42953 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791735 (= res!536470 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791736 () Bool)

(assert (=> b!791736 (= e!439964 (bvslt mask!3266 #b00000000000000000000000000000000))))

(assert (= (and start!68050 res!536468) b!791733))

(assert (= (and b!791733 res!536467) b!791734))

(assert (= (and b!791734 res!536466) b!791732))

(assert (= (and b!791732 res!536471) b!791735))

(assert (= (and b!791735 res!536470) b!791731))

(assert (= (and b!791731 res!536469) b!791736))

(declare-fun m!732447 () Bool)

(assert (=> b!791734 m!732447))

(assert (=> b!791734 m!732447))

(declare-fun m!732449 () Bool)

(assert (=> b!791734 m!732449))

(declare-fun m!732451 () Bool)

(assert (=> b!791735 m!732451))

(declare-fun m!732453 () Bool)

(assert (=> b!791732 m!732453))

(declare-fun m!732455 () Bool)

(assert (=> start!68050 m!732455))

(declare-fun m!732457 () Bool)

(assert (=> start!68050 m!732457))

(declare-fun m!732459 () Bool)

(assert (=> b!791731 m!732459))

(push 1)

(assert (not b!791731))

(assert (not start!68050))

(assert (not b!791732))

(assert (not b!791735))

(assert (not b!791734))

(check-sat)

