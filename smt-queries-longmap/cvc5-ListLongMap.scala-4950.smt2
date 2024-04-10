; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68088 () Bool)

(assert start!68088)

(declare-fun res!536760 () Bool)

(declare-fun e!440081 () Bool)

(assert (=> start!68088 (=> (not res!536760) (not e!440081))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68088 (= res!536760 (validMask!0 mask!3266))))

(assert (=> start!68088 e!440081))

(assert (=> start!68088 true))

(declare-datatypes ((array!42991 0))(
  ( (array!42992 (arr!20580 (Array (_ BitVec 32) (_ BitVec 64))) (size!21001 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!42991)

(declare-fun array_inv!16376 (array!42991) Bool)

(assert (=> start!68088 (array_inv!16376 a!3170)))

(declare-fun b!792021 () Bool)

(declare-fun res!536757 () Bool)

(declare-fun e!440080 () Bool)

(assert (=> b!792021 (=> (not res!536757) (not e!440080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42991 (_ BitVec 32)) Bool)

(assert (=> b!792021 (= res!536757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792022 () Bool)

(declare-fun res!536756 () Bool)

(assert (=> b!792022 (=> (not res!536756) (not e!440081))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792022 (= res!536756 (validKeyInArray!0 (select (arr!20580 a!3170) j!153)))))

(declare-fun b!792023 () Bool)

(declare-fun res!536758 () Bool)

(assert (=> b!792023 (=> (not res!536758) (not e!440081))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792023 (= res!536758 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792024 () Bool)

(assert (=> b!792024 (= e!440080 (bvsgt #b00000000000000000000000000000000 (size!21001 a!3170)))))

(declare-fun b!792025 () Bool)

(declare-fun res!536759 () Bool)

(assert (=> b!792025 (=> (not res!536759) (not e!440081))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792025 (= res!536759 (and (= (size!21001 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21001 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21001 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792026 () Bool)

(declare-fun res!536762 () Bool)

(assert (=> b!792026 (=> (not res!536762) (not e!440081))))

(assert (=> b!792026 (= res!536762 (validKeyInArray!0 k!2044))))

(declare-fun b!792027 () Bool)

(assert (=> b!792027 (= e!440081 e!440080)))

(declare-fun res!536761 () Bool)

(assert (=> b!792027 (=> (not res!536761) (not e!440080))))

(declare-datatypes ((SeekEntryResult!8171 0))(
  ( (MissingZero!8171 (index!35052 (_ BitVec 32))) (Found!8171 (index!35053 (_ BitVec 32))) (Intermediate!8171 (undefined!8983 Bool) (index!35054 (_ BitVec 32)) (x!66009 (_ BitVec 32))) (Undefined!8171) (MissingVacant!8171 (index!35055 (_ BitVec 32))) )
))
(declare-fun lt!353351 () SeekEntryResult!8171)

(assert (=> b!792027 (= res!536761 (or (= lt!353351 (MissingZero!8171 i!1163)) (= lt!353351 (MissingVacant!8171 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42991 (_ BitVec 32)) SeekEntryResult!8171)

(assert (=> b!792027 (= lt!353351 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68088 res!536760) b!792025))

(assert (= (and b!792025 res!536759) b!792022))

(assert (= (and b!792022 res!536756) b!792026))

(assert (= (and b!792026 res!536762) b!792023))

(assert (= (and b!792023 res!536758) b!792027))

(assert (= (and b!792027 res!536761) b!792021))

(assert (= (and b!792021 res!536757) b!792024))

(declare-fun m!732713 () Bool)

(assert (=> start!68088 m!732713))

(declare-fun m!732715 () Bool)

(assert (=> start!68088 m!732715))

(declare-fun m!732717 () Bool)

(assert (=> b!792023 m!732717))

(declare-fun m!732719 () Bool)

(assert (=> b!792026 m!732719))

(declare-fun m!732721 () Bool)

(assert (=> b!792022 m!732721))

(assert (=> b!792022 m!732721))

(declare-fun m!732723 () Bool)

(assert (=> b!792022 m!732723))

(declare-fun m!732725 () Bool)

(assert (=> b!792021 m!732725))

(declare-fun m!732727 () Bool)

(assert (=> b!792027 m!732727))

(push 1)

