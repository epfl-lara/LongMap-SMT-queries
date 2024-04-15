; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68034 () Bool)

(assert start!68034)

(declare-fun b!791527 () Bool)

(declare-fun res!536402 () Bool)

(declare-fun e!439828 () Bool)

(assert (=> b!791527 (=> (not res!536402) (not e!439828))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791527 (= res!536402 (validKeyInArray!0 k!2044))))

(declare-fun b!791528 () Bool)

(declare-fun res!536405 () Bool)

(assert (=> b!791528 (=> (not res!536405) (not e!439828))))

(declare-datatypes ((array!42956 0))(
  ( (array!42957 (arr!20563 (Array (_ BitVec 32) (_ BitVec 64))) (size!20984 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42956)

(declare-fun arrayContainsKey!0 (array!42956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791528 (= res!536405 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791529 () Bool)

(assert (=> b!791529 (= e!439828 false)))

(declare-datatypes ((SeekEntryResult!8151 0))(
  ( (MissingZero!8151 (index!34972 (_ BitVec 32))) (Found!8151 (index!34973 (_ BitVec 32))) (Intermediate!8151 (undefined!8963 Bool) (index!34974 (_ BitVec 32)) (x!65936 (_ BitVec 32))) (Undefined!8151) (MissingVacant!8151 (index!34975 (_ BitVec 32))) )
))
(declare-fun lt!353063 () SeekEntryResult!8151)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42956 (_ BitVec 32)) SeekEntryResult!8151)

(assert (=> b!791529 (= lt!353063 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!536403 () Bool)

(assert (=> start!68034 (=> (not res!536403) (not e!439828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68034 (= res!536403 (validMask!0 mask!3266))))

(assert (=> start!68034 e!439828))

(assert (=> start!68034 true))

(declare-fun array_inv!16446 (array!42956) Bool)

(assert (=> start!68034 (array_inv!16446 a!3170)))

(declare-fun b!791530 () Bool)

(declare-fun res!536404 () Bool)

(assert (=> b!791530 (=> (not res!536404) (not e!439828))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!791530 (= res!536404 (and (= (size!20984 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20984 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20984 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791531 () Bool)

(declare-fun res!536406 () Bool)

(assert (=> b!791531 (=> (not res!536406) (not e!439828))))

(assert (=> b!791531 (= res!536406 (validKeyInArray!0 (select (arr!20563 a!3170) j!153)))))

(assert (= (and start!68034 res!536403) b!791530))

(assert (= (and b!791530 res!536404) b!791531))

(assert (= (and b!791531 res!536406) b!791527))

(assert (= (and b!791527 res!536402) b!791528))

(assert (= (and b!791528 res!536405) b!791529))

(declare-fun m!731731 () Bool)

(assert (=> start!68034 m!731731))

(declare-fun m!731733 () Bool)

(assert (=> start!68034 m!731733))

(declare-fun m!731735 () Bool)

(assert (=> b!791529 m!731735))

(declare-fun m!731737 () Bool)

(assert (=> b!791527 m!731737))

(declare-fun m!731739 () Bool)

(assert (=> b!791528 m!731739))

(declare-fun m!731741 () Bool)

(assert (=> b!791531 m!731741))

(assert (=> b!791531 m!731741))

(declare-fun m!731743 () Bool)

(assert (=> b!791531 m!731743))

(push 1)

(assert (not b!791528))

(assert (not b!791529))

(assert (not b!791531))

(assert (not b!791527))

(assert (not start!68034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

