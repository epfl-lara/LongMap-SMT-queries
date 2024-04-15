; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68058 () Bool)

(assert start!68058)

(declare-fun b!791707 () Bool)

(declare-fun res!536584 () Bool)

(declare-fun e!439900 () Bool)

(assert (=> b!791707 (=> (not res!536584) (not e!439900))))

(declare-datatypes ((array!42980 0))(
  ( (array!42981 (arr!20575 (Array (_ BitVec 32) (_ BitVec 64))) (size!20996 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42980)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791707 (= res!536584 (validKeyInArray!0 (select (arr!20575 a!3170) j!153)))))

(declare-fun b!791708 () Bool)

(declare-fun res!536586 () Bool)

(assert (=> b!791708 (=> (not res!536586) (not e!439900))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!791708 (= res!536586 (validKeyInArray!0 k!2044))))

(declare-fun b!791709 () Bool)

(declare-fun res!536582 () Bool)

(assert (=> b!791709 (=> (not res!536582) (not e!439900))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791709 (= res!536582 (and (= (size!20996 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20996 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20996 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791710 () Bool)

(declare-fun res!536583 () Bool)

(assert (=> b!791710 (=> (not res!536583) (not e!439900))))

(declare-fun arrayContainsKey!0 (array!42980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791710 (= res!536583 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!536585 () Bool)

(assert (=> start!68058 (=> (not res!536585) (not e!439900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68058 (= res!536585 (validMask!0 mask!3266))))

(assert (=> start!68058 e!439900))

(assert (=> start!68058 true))

(declare-fun array_inv!16458 (array!42980) Bool)

(assert (=> start!68058 (array_inv!16458 a!3170)))

(declare-fun b!791711 () Bool)

(assert (=> b!791711 (= e!439900 false)))

(declare-datatypes ((SeekEntryResult!8163 0))(
  ( (MissingZero!8163 (index!35020 (_ BitVec 32))) (Found!8163 (index!35021 (_ BitVec 32))) (Intermediate!8163 (undefined!8975 Bool) (index!35022 (_ BitVec 32)) (x!65980 (_ BitVec 32))) (Undefined!8163) (MissingVacant!8163 (index!35023 (_ BitVec 32))) )
))
(declare-fun lt!353099 () SeekEntryResult!8163)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42980 (_ BitVec 32)) SeekEntryResult!8163)

(assert (=> b!791711 (= lt!353099 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68058 res!536585) b!791709))

(assert (= (and b!791709 res!536582) b!791707))

(assert (= (and b!791707 res!536584) b!791708))

(assert (= (and b!791708 res!536586) b!791710))

(assert (= (and b!791710 res!536583) b!791711))

(declare-fun m!731899 () Bool)

(assert (=> b!791707 m!731899))

(assert (=> b!791707 m!731899))

(declare-fun m!731901 () Bool)

(assert (=> b!791707 m!731901))

(declare-fun m!731903 () Bool)

(assert (=> b!791711 m!731903))

(declare-fun m!731905 () Bool)

(assert (=> start!68058 m!731905))

(declare-fun m!731907 () Bool)

(assert (=> start!68058 m!731907))

(declare-fun m!731909 () Bool)

(assert (=> b!791708 m!731909))

(declare-fun m!731911 () Bool)

(assert (=> b!791710 m!731911))

(push 1)

(assert (not b!791708))

(assert (not start!68058))

(assert (not b!791707))

(assert (not b!791711))

(assert (not b!791710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

