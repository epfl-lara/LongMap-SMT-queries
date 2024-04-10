; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68086 () Bool)

(assert start!68086)

(declare-fun b!792002 () Bool)

(declare-fun res!536740 () Bool)

(declare-fun e!440071 () Bool)

(assert (=> b!792002 (=> (not res!536740) (not e!440071))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42989 0))(
  ( (array!42990 (arr!20579 (Array (_ BitVec 32) (_ BitVec 64))) (size!21000 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42989)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!792002 (= res!536740 (and (= (size!21000 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21000 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21000 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!536739 () Bool)

(assert (=> start!68086 (=> (not res!536739) (not e!440071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68086 (= res!536739 (validMask!0 mask!3266))))

(assert (=> start!68086 e!440071))

(assert (=> start!68086 true))

(declare-fun array_inv!16375 (array!42989) Bool)

(assert (=> start!68086 (array_inv!16375 a!3170)))

(declare-fun b!792003 () Bool)

(declare-datatypes ((SeekEntryResult!8170 0))(
  ( (MissingZero!8170 (index!35048 (_ BitVec 32))) (Found!8170 (index!35049 (_ BitVec 32))) (Intermediate!8170 (undefined!8982 Bool) (index!35050 (_ BitVec 32)) (x!66000 (_ BitVec 32))) (Undefined!8170) (MissingVacant!8170 (index!35051 (_ BitVec 32))) )
))
(declare-fun lt!353348 () SeekEntryResult!8170)

(assert (=> b!792003 (= e!440071 (and (or (= lt!353348 (MissingZero!8170 i!1163)) (= lt!353348 (MissingVacant!8170 i!1163))) (bvsgt #b00000000000000000000000000000000 (size!21000 a!3170))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42989 (_ BitVec 32)) SeekEntryResult!8170)

(assert (=> b!792003 (= lt!353348 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792004 () Bool)

(declare-fun res!536738 () Bool)

(assert (=> b!792004 (=> (not res!536738) (not e!440071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792004 (= res!536738 (validKeyInArray!0 (select (arr!20579 a!3170) j!153)))))

(declare-fun b!792005 () Bool)

(declare-fun res!536737 () Bool)

(assert (=> b!792005 (=> (not res!536737) (not e!440071))))

(assert (=> b!792005 (= res!536737 (validKeyInArray!0 k!2044))))

(declare-fun b!792006 () Bool)

(declare-fun res!536741 () Bool)

(assert (=> b!792006 (=> (not res!536741) (not e!440071))))

(declare-fun arrayContainsKey!0 (array!42989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792006 (= res!536741 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68086 res!536739) b!792002))

(assert (= (and b!792002 res!536740) b!792004))

(assert (= (and b!792004 res!536738) b!792005))

(assert (= (and b!792005 res!536737) b!792006))

(assert (= (and b!792006 res!536741) b!792003))

(declare-fun m!732699 () Bool)

(assert (=> b!792003 m!732699))

(declare-fun m!732701 () Bool)

(assert (=> start!68086 m!732701))

(declare-fun m!732703 () Bool)

(assert (=> start!68086 m!732703))

(declare-fun m!732705 () Bool)

(assert (=> b!792005 m!732705))

(declare-fun m!732707 () Bool)

(assert (=> b!792006 m!732707))

(declare-fun m!732709 () Bool)

(assert (=> b!792004 m!732709))

(assert (=> b!792004 m!732709))

(declare-fun m!732711 () Bool)

(assert (=> b!792004 m!732711))

(push 1)

(assert (not start!68086))

(assert (not b!792003))

(assert (not b!792006))

(assert (not b!792004))

(assert (not b!792005))

(check-sat)

