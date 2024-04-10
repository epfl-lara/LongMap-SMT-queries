; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68078 () Bool)

(assert start!68078)

(declare-fun b!791942 () Bool)

(declare-fun res!536678 () Bool)

(declare-fun e!440047 () Bool)

(assert (=> b!791942 (=> (not res!536678) (not e!440047))))

(declare-datatypes ((array!42981 0))(
  ( (array!42982 (arr!20575 (Array (_ BitVec 32) (_ BitVec 64))) (size!20996 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42981)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791942 (= res!536678 (validKeyInArray!0 (select (arr!20575 a!3170) j!153)))))

(declare-fun b!791943 () Bool)

(declare-fun res!536677 () Bool)

(assert (=> b!791943 (=> (not res!536677) (not e!440047))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!791943 (= res!536677 (validKeyInArray!0 k0!2044))))

(declare-fun b!791944 () Bool)

(declare-fun res!536680 () Bool)

(assert (=> b!791944 (=> (not res!536680) (not e!440047))))

(declare-fun arrayContainsKey!0 (array!42981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791944 (= res!536680 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!791945 () Bool)

(declare-fun res!536679 () Bool)

(assert (=> b!791945 (=> (not res!536679) (not e!440047))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!791945 (= res!536679 (and (= (size!20996 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!20996 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!20996 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!791946 () Bool)

(assert (=> b!791946 (= e!440047 false)))

(declare-datatypes ((SeekEntryResult!8166 0))(
  ( (MissingZero!8166 (index!35032 (_ BitVec 32))) (Found!8166 (index!35033 (_ BitVec 32))) (Intermediate!8166 (undefined!8978 Bool) (index!35034 (_ BitVec 32)) (x!65988 (_ BitVec 32))) (Undefined!8166) (MissingVacant!8166 (index!35035 (_ BitVec 32))) )
))
(declare-fun lt!353336 () SeekEntryResult!8166)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42981 (_ BitVec 32)) SeekEntryResult!8166)

(assert (=> b!791946 (= lt!353336 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!536681 () Bool)

(assert (=> start!68078 (=> (not res!536681) (not e!440047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68078 (= res!536681 (validMask!0 mask!3266))))

(assert (=> start!68078 e!440047))

(assert (=> start!68078 true))

(declare-fun array_inv!16371 (array!42981) Bool)

(assert (=> start!68078 (array_inv!16371 a!3170)))

(assert (= (and start!68078 res!536681) b!791945))

(assert (= (and b!791945 res!536679) b!791942))

(assert (= (and b!791942 res!536678) b!791943))

(assert (= (and b!791943 res!536677) b!791944))

(assert (= (and b!791944 res!536680) b!791946))

(declare-fun m!732643 () Bool)

(assert (=> b!791944 m!732643))

(declare-fun m!732645 () Bool)

(assert (=> b!791942 m!732645))

(assert (=> b!791942 m!732645))

(declare-fun m!732647 () Bool)

(assert (=> b!791942 m!732647))

(declare-fun m!732649 () Bool)

(assert (=> start!68078 m!732649))

(declare-fun m!732651 () Bool)

(assert (=> start!68078 m!732651))

(declare-fun m!732653 () Bool)

(assert (=> b!791943 m!732653))

(declare-fun m!732655 () Bool)

(assert (=> b!791946 m!732655))

(check-sat (not b!791946) (not b!791942) (not start!68078) (not b!791944) (not b!791943))
