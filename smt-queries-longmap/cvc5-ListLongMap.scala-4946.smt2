; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68064 () Bool)

(assert start!68064)

(declare-fun b!791837 () Bool)

(declare-fun res!536576 () Bool)

(declare-fun e!440006 () Bool)

(assert (=> b!791837 (=> (not res!536576) (not e!440006))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!42967 0))(
  ( (array!42968 (arr!20568 (Array (_ BitVec 32) (_ BitVec 64))) (size!20989 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42967)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791837 (= res!536576 (and (= (size!20989 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20989 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20989 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791838 () Bool)

(declare-fun res!536572 () Bool)

(assert (=> b!791838 (=> (not res!536572) (not e!440006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791838 (= res!536572 (validKeyInArray!0 (select (arr!20568 a!3170) j!153)))))

(declare-fun b!791839 () Bool)

(declare-fun res!536575 () Bool)

(assert (=> b!791839 (=> (not res!536575) (not e!440006))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791839 (= res!536575 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536574 () Bool)

(assert (=> start!68064 (=> (not res!536574) (not e!440006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68064 (= res!536574 (validMask!0 mask!3266))))

(assert (=> start!68064 e!440006))

(assert (=> start!68064 true))

(declare-fun array_inv!16364 (array!42967) Bool)

(assert (=> start!68064 (array_inv!16364 a!3170)))

(declare-fun b!791840 () Bool)

(assert (=> b!791840 (= e!440006 false)))

(declare-datatypes ((SeekEntryResult!8159 0))(
  ( (MissingZero!8159 (index!35004 (_ BitVec 32))) (Found!8159 (index!35005 (_ BitVec 32))) (Intermediate!8159 (undefined!8971 Bool) (index!35006 (_ BitVec 32)) (x!65965 (_ BitVec 32))) (Undefined!8159) (MissingVacant!8159 (index!35007 (_ BitVec 32))) )
))
(declare-fun lt!353315 () SeekEntryResult!8159)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42967 (_ BitVec 32)) SeekEntryResult!8159)

(assert (=> b!791840 (= lt!353315 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!791841 () Bool)

(declare-fun res!536573 () Bool)

(assert (=> b!791841 (=> (not res!536573) (not e!440006))))

(assert (=> b!791841 (= res!536573 (validKeyInArray!0 k!2044))))

(assert (= (and start!68064 res!536574) b!791837))

(assert (= (and b!791837 res!536576) b!791838))

(assert (= (and b!791838 res!536572) b!791841))

(assert (= (and b!791841 res!536573) b!791839))

(assert (= (and b!791839 res!536575) b!791840))

(declare-fun m!732545 () Bool)

(assert (=> b!791838 m!732545))

(assert (=> b!791838 m!732545))

(declare-fun m!732547 () Bool)

(assert (=> b!791838 m!732547))

(declare-fun m!732549 () Bool)

(assert (=> b!791839 m!732549))

(declare-fun m!732551 () Bool)

(assert (=> b!791841 m!732551))

(declare-fun m!732553 () Bool)

(assert (=> start!68064 m!732553))

(declare-fun m!732555 () Bool)

(assert (=> start!68064 m!732555))

(declare-fun m!732557 () Bool)

(assert (=> b!791840 m!732557))

(push 1)

(assert (not start!68064))

(assert (not b!791839))

(assert (not b!791841))

(assert (not b!791840))

(assert (not b!791838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

