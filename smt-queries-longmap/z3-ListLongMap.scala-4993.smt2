; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68470 () Bool)

(assert start!68470)

(declare-fun b!795950 () Bool)

(declare-fun res!540472 () Bool)

(declare-fun e!441713 () Bool)

(assert (=> b!795950 (=> (not res!540472) (not e!441713))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43260 0))(
  ( (array!43261 (arr!20710 (Array (_ BitVec 32) (_ BitVec 64))) (size!21131 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43260)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795950 (= res!540472 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21131 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20710 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21131 a!3170)) (= (select (arr!20710 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795951 () Bool)

(declare-fun e!441711 () Bool)

(declare-fun e!441712 () Bool)

(assert (=> b!795951 (= e!441711 e!441712)))

(declare-fun res!540478 () Bool)

(assert (=> b!795951 (=> (not res!540478) (not e!441712))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8301 0))(
  ( (MissingZero!8301 (index!35572 (_ BitVec 32))) (Found!8301 (index!35573 (_ BitVec 32))) (Intermediate!8301 (undefined!9113 Bool) (index!35574 (_ BitVec 32)) (x!66483 (_ BitVec 32))) (Undefined!8301) (MissingVacant!8301 (index!35575 (_ BitVec 32))) )
))
(declare-fun lt!354827 () SeekEntryResult!8301)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!354830 () SeekEntryResult!8301)

(assert (=> b!795951 (= res!540478 (and (= lt!354827 lt!354830) (= lt!354830 (Found!8301 j!153)) (= (select (arr!20710 a!3170) index!1236) (select (arr!20710 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20710 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43260 (_ BitVec 32)) SeekEntryResult!8301)

(assert (=> b!795951 (= lt!354830 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20710 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43260 (_ BitVec 32)) SeekEntryResult!8301)

(assert (=> b!795951 (= lt!354827 (seekEntryOrOpen!0 (select (arr!20710 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795953 () Bool)

(declare-fun res!540475 () Bool)

(declare-fun e!441709 () Bool)

(assert (=> b!795953 (=> (not res!540475) (not e!441709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795953 (= res!540475 (validKeyInArray!0 (select (arr!20710 a!3170) j!153)))))

(declare-fun b!795954 () Bool)

(declare-fun res!540476 () Bool)

(assert (=> b!795954 (=> (not res!540476) (not e!441709))))

(declare-fun arrayContainsKey!0 (array!43260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795954 (= res!540476 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795955 () Bool)

(assert (=> b!795955 (= e!441713 e!441711)))

(declare-fun res!540470 () Bool)

(assert (=> b!795955 (=> (not res!540470) (not e!441711))))

(declare-fun lt!354826 () (_ BitVec 64))

(declare-fun lt!354829 () array!43260)

(assert (=> b!795955 (= res!540470 (= (seekEntryOrOpen!0 lt!354826 lt!354829 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354826 lt!354829 mask!3266)))))

(assert (=> b!795955 (= lt!354826 (select (store (arr!20710 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795955 (= lt!354829 (array!43261 (store (arr!20710 a!3170) i!1163 k0!2044) (size!21131 a!3170)))))

(declare-fun b!795956 () Bool)

(declare-fun res!540469 () Bool)

(assert (=> b!795956 (=> (not res!540469) (not e!441713))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43260 (_ BitVec 32)) Bool)

(assert (=> b!795956 (= res!540469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795957 () Bool)

(assert (=> b!795957 (= e!441709 e!441713)))

(declare-fun res!540479 () Bool)

(assert (=> b!795957 (=> (not res!540479) (not e!441713))))

(declare-fun lt!354828 () SeekEntryResult!8301)

(assert (=> b!795957 (= res!540479 (or (= lt!354828 (MissingZero!8301 i!1163)) (= lt!354828 (MissingVacant!8301 i!1163))))))

(assert (=> b!795957 (= lt!354828 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795958 () Bool)

(declare-fun res!540471 () Bool)

(assert (=> b!795958 (=> (not res!540471) (not e!441713))))

(declare-datatypes ((List!14673 0))(
  ( (Nil!14670) (Cons!14669 (h!15798 (_ BitVec 64)) (t!20988 List!14673)) )
))
(declare-fun arrayNoDuplicates!0 (array!43260 (_ BitVec 32) List!14673) Bool)

(assert (=> b!795958 (= res!540471 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14670))))

(declare-fun res!540473 () Bool)

(assert (=> start!68470 (=> (not res!540473) (not e!441709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68470 (= res!540473 (validMask!0 mask!3266))))

(assert (=> start!68470 e!441709))

(assert (=> start!68470 true))

(declare-fun array_inv!16506 (array!43260) Bool)

(assert (=> start!68470 (array_inv!16506 a!3170)))

(declare-fun b!795952 () Bool)

(declare-fun res!540477 () Bool)

(assert (=> b!795952 (=> (not res!540477) (not e!441709))))

(assert (=> b!795952 (= res!540477 (and (= (size!21131 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21131 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21131 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795959 () Bool)

(assert (=> b!795959 (= e!441712 (not (validKeyInArray!0 lt!354826)))))

(declare-fun b!795960 () Bool)

(declare-fun res!540474 () Bool)

(assert (=> b!795960 (=> (not res!540474) (not e!441709))))

(assert (=> b!795960 (= res!540474 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68470 res!540473) b!795952))

(assert (= (and b!795952 res!540477) b!795953))

(assert (= (and b!795953 res!540475) b!795960))

(assert (= (and b!795960 res!540474) b!795954))

(assert (= (and b!795954 res!540476) b!795957))

(assert (= (and b!795957 res!540479) b!795956))

(assert (= (and b!795956 res!540469) b!795958))

(assert (= (and b!795958 res!540471) b!795950))

(assert (= (and b!795950 res!540472) b!795955))

(assert (= (and b!795955 res!540470) b!795951))

(assert (= (and b!795951 res!540478) b!795959))

(declare-fun m!736683 () Bool)

(assert (=> b!795950 m!736683))

(declare-fun m!736685 () Bool)

(assert (=> b!795950 m!736685))

(declare-fun m!736687 () Bool)

(assert (=> b!795954 m!736687))

(declare-fun m!736689 () Bool)

(assert (=> b!795956 m!736689))

(declare-fun m!736691 () Bool)

(assert (=> b!795955 m!736691))

(declare-fun m!736693 () Bool)

(assert (=> b!795955 m!736693))

(declare-fun m!736695 () Bool)

(assert (=> b!795955 m!736695))

(declare-fun m!736697 () Bool)

(assert (=> b!795955 m!736697))

(declare-fun m!736699 () Bool)

(assert (=> b!795959 m!736699))

(declare-fun m!736701 () Bool)

(assert (=> b!795957 m!736701))

(declare-fun m!736703 () Bool)

(assert (=> b!795960 m!736703))

(declare-fun m!736705 () Bool)

(assert (=> b!795953 m!736705))

(assert (=> b!795953 m!736705))

(declare-fun m!736707 () Bool)

(assert (=> b!795953 m!736707))

(declare-fun m!736709 () Bool)

(assert (=> start!68470 m!736709))

(declare-fun m!736711 () Bool)

(assert (=> start!68470 m!736711))

(declare-fun m!736713 () Bool)

(assert (=> b!795958 m!736713))

(assert (=> b!795951 m!736705))

(declare-fun m!736715 () Bool)

(assert (=> b!795951 m!736715))

(declare-fun m!736717 () Bool)

(assert (=> b!795951 m!736717))

(assert (=> b!795951 m!736705))

(declare-fun m!736719 () Bool)

(assert (=> b!795951 m!736719))

(assert (=> b!795951 m!736705))

(declare-fun m!736721 () Bool)

(assert (=> b!795951 m!736721))

(assert (=> b!795951 m!736695))

(check-sat (not b!795960) (not b!795954) (not b!795951) (not b!795959) (not b!795956) (not b!795958) (not b!795957) (not b!795955) (not start!68470) (not b!795953))
(check-sat)
