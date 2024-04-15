; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68742 () Bool)

(assert start!68742)

(declare-fun b!800936 () Bool)

(declare-fun res!545604 () Bool)

(declare-fun e!443983 () Bool)

(assert (=> b!800936 (=> (not res!545604) (not e!443983))))

(declare-datatypes ((SeekEntryResult!8443 0))(
  ( (MissingZero!8443 (index!36140 (_ BitVec 32))) (Found!8443 (index!36141 (_ BitVec 32))) (Intermediate!8443 (undefined!9255 Bool) (index!36142 (_ BitVec 32)) (x!67012 (_ BitVec 32))) (Undefined!8443) (MissingVacant!8443 (index!36143 (_ BitVec 32))) )
))
(declare-fun lt!357833 () SeekEntryResult!8443)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!357832 () (_ BitVec 64))

(declare-datatypes ((array!43549 0))(
  ( (array!43550 (arr!20855 (Array (_ BitVec 32) (_ BitVec 64))) (size!21276 (_ BitVec 32))) )
))
(declare-fun lt!357831 () array!43549)

(declare-fun lt!357829 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43549 (_ BitVec 32)) SeekEntryResult!8443)

(assert (=> b!800936 (= res!545604 (= lt!357833 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357829 vacantAfter!23 lt!357832 lt!357831 mask!3266)))))

(declare-fun b!800937 () Bool)

(assert (=> b!800937 (= e!443983 false)))

(declare-fun lt!357830 () SeekEntryResult!8443)

(declare-fun a!3170 () array!43549)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!800937 (= lt!357830 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357829 vacantBefore!23 (select (arr!20855 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800938 () Bool)

(declare-fun e!443984 () Bool)

(declare-fun e!443982 () Bool)

(assert (=> b!800938 (= e!443984 e!443982)))

(declare-fun res!545603 () Bool)

(assert (=> b!800938 (=> (not res!545603) (not e!443982))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800938 (= res!545603 (= lt!357833 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357832 lt!357831 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43549 (_ BitVec 32)) SeekEntryResult!8443)

(assert (=> b!800938 (= lt!357833 (seekEntryOrOpen!0 lt!357832 lt!357831 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800938 (= lt!357832 (select (store (arr!20855 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800938 (= lt!357831 (array!43550 (store (arr!20855 a!3170) i!1163 k0!2044) (size!21276 a!3170)))))

(declare-fun res!545600 () Bool)

(declare-fun e!443986 () Bool)

(assert (=> start!68742 (=> (not res!545600) (not e!443986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68742 (= res!545600 (validMask!0 mask!3266))))

(assert (=> start!68742 e!443986))

(assert (=> start!68742 true))

(declare-fun array_inv!16738 (array!43549) Bool)

(assert (=> start!68742 (array_inv!16738 a!3170)))

(declare-fun b!800939 () Bool)

(declare-fun res!545606 () Bool)

(assert (=> b!800939 (=> (not res!545606) (not e!443984))))

(assert (=> b!800939 (= res!545606 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21276 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20855 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21276 a!3170)) (= (select (arr!20855 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800940 () Bool)

(declare-fun e!443981 () Bool)

(assert (=> b!800940 (= e!443981 e!443983)))

(declare-fun res!545598 () Bool)

(assert (=> b!800940 (=> (not res!545598) (not e!443983))))

(assert (=> b!800940 (= res!545598 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357829 #b00000000000000000000000000000000) (bvslt lt!357829 (size!21276 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800940 (= lt!357829 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800941 () Bool)

(assert (=> b!800941 (= e!443982 e!443981)))

(declare-fun res!545597 () Bool)

(assert (=> b!800941 (=> (not res!545597) (not e!443981))))

(declare-fun lt!357827 () SeekEntryResult!8443)

(declare-fun lt!357826 () SeekEntryResult!8443)

(assert (=> b!800941 (= res!545597 (and (= lt!357826 lt!357827) (= lt!357827 (Found!8443 j!153)) (not (= (select (arr!20855 a!3170) index!1236) (select (arr!20855 a!3170) j!153)))))))

(assert (=> b!800941 (= lt!357827 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20855 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800941 (= lt!357826 (seekEntryOrOpen!0 (select (arr!20855 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800942 () Bool)

(declare-fun res!545599 () Bool)

(assert (=> b!800942 (=> (not res!545599) (not e!443986))))

(declare-fun arrayContainsKey!0 (array!43549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800942 (= res!545599 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800943 () Bool)

(declare-fun res!545602 () Bool)

(assert (=> b!800943 (=> (not res!545602) (not e!443984))))

(declare-datatypes ((List!14857 0))(
  ( (Nil!14854) (Cons!14853 (h!15982 (_ BitVec 64)) (t!21163 List!14857)) )
))
(declare-fun arrayNoDuplicates!0 (array!43549 (_ BitVec 32) List!14857) Bool)

(assert (=> b!800943 (= res!545602 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14854))))

(declare-fun b!800944 () Bool)

(declare-fun res!545596 () Bool)

(assert (=> b!800944 (=> (not res!545596) (not e!443986))))

(assert (=> b!800944 (= res!545596 (and (= (size!21276 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21276 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21276 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800945 () Bool)

(declare-fun res!545601 () Bool)

(assert (=> b!800945 (=> (not res!545601) (not e!443986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800945 (= res!545601 (validKeyInArray!0 k0!2044))))

(declare-fun b!800946 () Bool)

(declare-fun res!545605 () Bool)

(assert (=> b!800946 (=> (not res!545605) (not e!443984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43549 (_ BitVec 32)) Bool)

(assert (=> b!800946 (= res!545605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800947 () Bool)

(declare-fun res!545595 () Bool)

(assert (=> b!800947 (=> (not res!545595) (not e!443986))))

(assert (=> b!800947 (= res!545595 (validKeyInArray!0 (select (arr!20855 a!3170) j!153)))))

(declare-fun b!800948 () Bool)

(assert (=> b!800948 (= e!443986 e!443984)))

(declare-fun res!545607 () Bool)

(assert (=> b!800948 (=> (not res!545607) (not e!443984))))

(declare-fun lt!357828 () SeekEntryResult!8443)

(assert (=> b!800948 (= res!545607 (or (= lt!357828 (MissingZero!8443 i!1163)) (= lt!357828 (MissingVacant!8443 i!1163))))))

(assert (=> b!800948 (= lt!357828 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!68742 res!545600) b!800944))

(assert (= (and b!800944 res!545596) b!800947))

(assert (= (and b!800947 res!545595) b!800945))

(assert (= (and b!800945 res!545601) b!800942))

(assert (= (and b!800942 res!545599) b!800948))

(assert (= (and b!800948 res!545607) b!800946))

(assert (= (and b!800946 res!545605) b!800943))

(assert (= (and b!800943 res!545602) b!800939))

(assert (= (and b!800939 res!545606) b!800938))

(assert (= (and b!800938 res!545603) b!800941))

(assert (= (and b!800941 res!545597) b!800940))

(assert (= (and b!800940 res!545598) b!800936))

(assert (= (and b!800936 res!545604) b!800937))

(declare-fun m!741589 () Bool)

(assert (=> b!800943 m!741589))

(declare-fun m!741591 () Bool)

(assert (=> b!800948 m!741591))

(declare-fun m!741593 () Bool)

(assert (=> b!800941 m!741593))

(declare-fun m!741595 () Bool)

(assert (=> b!800941 m!741595))

(assert (=> b!800941 m!741595))

(declare-fun m!741597 () Bool)

(assert (=> b!800941 m!741597))

(assert (=> b!800941 m!741595))

(declare-fun m!741599 () Bool)

(assert (=> b!800941 m!741599))

(declare-fun m!741601 () Bool)

(assert (=> start!68742 m!741601))

(declare-fun m!741603 () Bool)

(assert (=> start!68742 m!741603))

(declare-fun m!741605 () Bool)

(assert (=> b!800938 m!741605))

(declare-fun m!741607 () Bool)

(assert (=> b!800938 m!741607))

(declare-fun m!741609 () Bool)

(assert (=> b!800938 m!741609))

(declare-fun m!741611 () Bool)

(assert (=> b!800938 m!741611))

(declare-fun m!741613 () Bool)

(assert (=> b!800946 m!741613))

(assert (=> b!800947 m!741595))

(assert (=> b!800947 m!741595))

(declare-fun m!741615 () Bool)

(assert (=> b!800947 m!741615))

(declare-fun m!741617 () Bool)

(assert (=> b!800942 m!741617))

(declare-fun m!741619 () Bool)

(assert (=> b!800945 m!741619))

(assert (=> b!800937 m!741595))

(assert (=> b!800937 m!741595))

(declare-fun m!741621 () Bool)

(assert (=> b!800937 m!741621))

(declare-fun m!741623 () Bool)

(assert (=> b!800939 m!741623))

(declare-fun m!741625 () Bool)

(assert (=> b!800939 m!741625))

(declare-fun m!741627 () Bool)

(assert (=> b!800940 m!741627))

(declare-fun m!741629 () Bool)

(assert (=> b!800936 m!741629))

(check-sat (not start!68742) (not b!800937) (not b!800945) (not b!800942) (not b!800947) (not b!800943) (not b!800948) (not b!800938) (not b!800941) (not b!800946) (not b!800936) (not b!800940))
(check-sat)
