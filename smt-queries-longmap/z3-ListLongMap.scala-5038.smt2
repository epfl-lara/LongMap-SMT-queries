; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68740 () Bool)

(assert start!68740)

(declare-fun b!800757 () Bool)

(declare-fun res!545283 () Bool)

(declare-fun e!443942 () Bool)

(assert (=> b!800757 (=> (not res!545283) (not e!443942))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43530 0))(
  ( (array!43531 (arr!20845 (Array (_ BitVec 32) (_ BitVec 64))) (size!21266 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43530)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!800757 (= res!545283 (and (= (size!21266 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21266 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21266 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800758 () Bool)

(declare-fun res!545280 () Bool)

(assert (=> b!800758 (=> (not res!545280) (not e!443942))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800758 (= res!545280 (validKeyInArray!0 k0!2044))))

(declare-fun b!800759 () Bool)

(declare-fun e!443939 () Bool)

(declare-fun e!443937 () Bool)

(assert (=> b!800759 (= e!443939 e!443937)))

(declare-fun res!545278 () Bool)

(assert (=> b!800759 (=> (not res!545278) (not e!443937))))

(declare-datatypes ((SeekEntryResult!8436 0))(
  ( (MissingZero!8436 (index!36112 (_ BitVec 32))) (Found!8436 (index!36113 (_ BitVec 32))) (Intermediate!8436 (undefined!9248 Bool) (index!36114 (_ BitVec 32)) (x!66978 (_ BitVec 32))) (Undefined!8436) (MissingVacant!8436 (index!36115 (_ BitVec 32))) )
))
(declare-fun lt!357802 () SeekEntryResult!8436)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!357807 () SeekEntryResult!8436)

(assert (=> b!800759 (= res!545278 (and (= lt!357802 lt!357807) (= lt!357807 (Found!8436 j!153)) (not (= (select (arr!20845 a!3170) index!1236) (select (arr!20845 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43530 (_ BitVec 32)) SeekEntryResult!8436)

(assert (=> b!800759 (= lt!357807 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20845 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43530 (_ BitVec 32)) SeekEntryResult!8436)

(assert (=> b!800759 (= lt!357802 (seekEntryOrOpen!0 (select (arr!20845 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800760 () Bool)

(declare-fun res!545284 () Bool)

(declare-fun e!443940 () Bool)

(assert (=> b!800760 (=> (not res!545284) (not e!443940))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!800760 (= res!545284 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21266 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20845 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21266 a!3170)) (= (select (arr!20845 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800762 () Bool)

(declare-fun e!443941 () Bool)

(assert (=> b!800762 (= e!443937 e!443941)))

(declare-fun res!545282 () Bool)

(assert (=> b!800762 (=> (not res!545282) (not e!443941))))

(declare-fun lt!357804 () (_ BitVec 32))

(assert (=> b!800762 (= res!545282 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357804 #b00000000000000000000000000000000) (bvslt lt!357804 (size!21266 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800762 (= lt!357804 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!800763 () Bool)

(declare-fun res!545287 () Bool)

(assert (=> b!800763 (=> (not res!545287) (not e!443942))))

(declare-fun arrayContainsKey!0 (array!43530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800763 (= res!545287 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800764 () Bool)

(assert (=> b!800764 (= e!443942 e!443940)))

(declare-fun res!545276 () Bool)

(assert (=> b!800764 (=> (not res!545276) (not e!443940))))

(declare-fun lt!357806 () SeekEntryResult!8436)

(assert (=> b!800764 (= res!545276 (or (= lt!357806 (MissingZero!8436 i!1163)) (= lt!357806 (MissingVacant!8436 i!1163))))))

(assert (=> b!800764 (= lt!357806 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!800765 () Bool)

(declare-fun res!545288 () Bool)

(assert (=> b!800765 (=> (not res!545288) (not e!443940))))

(declare-datatypes ((List!14808 0))(
  ( (Nil!14805) (Cons!14804 (h!15933 (_ BitVec 64)) (t!21123 List!14808)) )
))
(declare-fun arrayNoDuplicates!0 (array!43530 (_ BitVec 32) List!14808) Bool)

(assert (=> b!800765 (= res!545288 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14805))))

(declare-fun b!800766 () Bool)

(declare-fun res!545281 () Bool)

(assert (=> b!800766 (=> (not res!545281) (not e!443941))))

(declare-fun lt!357808 () SeekEntryResult!8436)

(declare-fun lt!357805 () array!43530)

(declare-fun lt!357803 () (_ BitVec 64))

(assert (=> b!800766 (= res!545281 (= lt!357808 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357804 vacantAfter!23 lt!357803 lt!357805 mask!3266)))))

(declare-fun b!800767 () Bool)

(assert (=> b!800767 (= e!443940 e!443939)))

(declare-fun res!545285 () Bool)

(assert (=> b!800767 (=> (not res!545285) (not e!443939))))

(assert (=> b!800767 (= res!545285 (= lt!357808 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357803 lt!357805 mask!3266)))))

(assert (=> b!800767 (= lt!357808 (seekEntryOrOpen!0 lt!357803 lt!357805 mask!3266))))

(assert (=> b!800767 (= lt!357803 (select (store (arr!20845 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!800767 (= lt!357805 (array!43531 (store (arr!20845 a!3170) i!1163 k0!2044) (size!21266 a!3170)))))

(declare-fun b!800761 () Bool)

(declare-fun res!545286 () Bool)

(assert (=> b!800761 (=> (not res!545286) (not e!443942))))

(assert (=> b!800761 (= res!545286 (validKeyInArray!0 (select (arr!20845 a!3170) j!153)))))

(declare-fun res!545279 () Bool)

(assert (=> start!68740 (=> (not res!545279) (not e!443942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68740 (= res!545279 (validMask!0 mask!3266))))

(assert (=> start!68740 e!443942))

(assert (=> start!68740 true))

(declare-fun array_inv!16641 (array!43530) Bool)

(assert (=> start!68740 (array_inv!16641 a!3170)))

(declare-fun b!800768 () Bool)

(declare-fun res!545277 () Bool)

(assert (=> b!800768 (=> (not res!545277) (not e!443940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43530 (_ BitVec 32)) Bool)

(assert (=> b!800768 (= res!545277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800769 () Bool)

(assert (=> b!800769 (= e!443941 false)))

(declare-fun lt!357809 () SeekEntryResult!8436)

(assert (=> b!800769 (= lt!357809 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357804 vacantBefore!23 (select (arr!20845 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68740 res!545279) b!800757))

(assert (= (and b!800757 res!545283) b!800761))

(assert (= (and b!800761 res!545286) b!800758))

(assert (= (and b!800758 res!545280) b!800763))

(assert (= (and b!800763 res!545287) b!800764))

(assert (= (and b!800764 res!545276) b!800768))

(assert (= (and b!800768 res!545277) b!800765))

(assert (= (and b!800765 res!545288) b!800760))

(assert (= (and b!800760 res!545284) b!800767))

(assert (= (and b!800767 res!545285) b!800759))

(assert (= (and b!800759 res!545278) b!800762))

(assert (= (and b!800762 res!545282) b!800766))

(assert (= (and b!800766 res!545281) b!800769))

(declare-fun m!741869 () Bool)

(assert (=> b!800766 m!741869))

(declare-fun m!741871 () Bool)

(assert (=> b!800758 m!741871))

(declare-fun m!741873 () Bool)

(assert (=> b!800765 m!741873))

(declare-fun m!741875 () Bool)

(assert (=> b!800763 m!741875))

(declare-fun m!741877 () Bool)

(assert (=> start!68740 m!741877))

(declare-fun m!741879 () Bool)

(assert (=> start!68740 m!741879))

(declare-fun m!741881 () Bool)

(assert (=> b!800759 m!741881))

(declare-fun m!741883 () Bool)

(assert (=> b!800759 m!741883))

(assert (=> b!800759 m!741883))

(declare-fun m!741885 () Bool)

(assert (=> b!800759 m!741885))

(assert (=> b!800759 m!741883))

(declare-fun m!741887 () Bool)

(assert (=> b!800759 m!741887))

(assert (=> b!800769 m!741883))

(assert (=> b!800769 m!741883))

(declare-fun m!741889 () Bool)

(assert (=> b!800769 m!741889))

(assert (=> b!800761 m!741883))

(assert (=> b!800761 m!741883))

(declare-fun m!741891 () Bool)

(assert (=> b!800761 m!741891))

(declare-fun m!741893 () Bool)

(assert (=> b!800760 m!741893))

(declare-fun m!741895 () Bool)

(assert (=> b!800760 m!741895))

(declare-fun m!741897 () Bool)

(assert (=> b!800768 m!741897))

(declare-fun m!741899 () Bool)

(assert (=> b!800764 m!741899))

(declare-fun m!741901 () Bool)

(assert (=> b!800767 m!741901))

(declare-fun m!741903 () Bool)

(assert (=> b!800767 m!741903))

(declare-fun m!741905 () Bool)

(assert (=> b!800767 m!741905))

(declare-fun m!741907 () Bool)

(assert (=> b!800767 m!741907))

(declare-fun m!741909 () Bool)

(assert (=> b!800762 m!741909))

(check-sat (not b!800762) (not b!800769) (not b!800766) (not b!800758) (not b!800767) (not b!800763) (not b!800761) (not b!800759) (not start!68740) (not b!800764) (not b!800765) (not b!800768))
(check-sat)
