; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68966 () Bool)

(assert start!68966)

(declare-fun res!546716 () Bool)

(declare-fun e!445012 () Bool)

(assert (=> start!68966 (=> (not res!546716) (not e!445012))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68966 (= res!546716 (validMask!0 mask!3266))))

(assert (=> start!68966 e!445012))

(assert (=> start!68966 true))

(declare-datatypes ((array!43588 0))(
  ( (array!43589 (arr!20869 (Array (_ BitVec 32) (_ BitVec 64))) (size!21289 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43588)

(declare-fun array_inv!16728 (array!43588) Bool)

(assert (=> start!68966 (array_inv!16728 a!3170)))

(declare-fun b!802736 () Bool)

(declare-fun res!546714 () Bool)

(declare-fun e!445014 () Bool)

(assert (=> b!802736 (=> (not res!546714) (not e!445014))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!802736 (= res!546714 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21289 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20869 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21289 a!3170)) (= (select (arr!20869 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802737 () Bool)

(declare-fun res!546708 () Bool)

(assert (=> b!802737 (=> (not res!546708) (not e!445012))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802737 (= res!546708 (validKeyInArray!0 (select (arr!20869 a!3170) j!153)))))

(declare-fun b!802738 () Bool)

(declare-fun e!445015 () Bool)

(declare-fun e!445013 () Bool)

(assert (=> b!802738 (= e!445015 e!445013)))

(declare-fun res!546711 () Bool)

(assert (=> b!802738 (=> (not res!546711) (not e!445013))))

(declare-datatypes ((SeekEntryResult!8416 0))(
  ( (MissingZero!8416 (index!36032 (_ BitVec 32))) (Found!8416 (index!36033 (_ BitVec 32))) (Intermediate!8416 (undefined!9228 Bool) (index!36034 (_ BitVec 32)) (x!67052 (_ BitVec 32))) (Undefined!8416) (MissingVacant!8416 (index!36035 (_ BitVec 32))) )
))
(declare-fun lt!358838 () SeekEntryResult!8416)

(declare-fun lt!358836 () SeekEntryResult!8416)

(assert (=> b!802738 (= res!546711 (and (= lt!358836 lt!358838) (= lt!358838 (Found!8416 j!153)) (not (= (select (arr!20869 a!3170) index!1236) (select (arr!20869 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43588 (_ BitVec 32)) SeekEntryResult!8416)

(assert (=> b!802738 (= lt!358838 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20869 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43588 (_ BitVec 32)) SeekEntryResult!8416)

(assert (=> b!802738 (= lt!358836 (seekEntryOrOpen!0 (select (arr!20869 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802739 () Bool)

(declare-fun res!546709 () Bool)

(assert (=> b!802739 (=> (not res!546709) (not e!445012))))

(assert (=> b!802739 (= res!546709 (and (= (size!21289 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21289 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21289 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802740 () Bool)

(declare-fun res!546715 () Bool)

(assert (=> b!802740 (=> (not res!546715) (not e!445014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43588 (_ BitVec 32)) Bool)

(assert (=> b!802740 (= res!546715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802741 () Bool)

(assert (=> b!802741 (= e!445012 e!445014)))

(declare-fun res!546707 () Bool)

(assert (=> b!802741 (=> (not res!546707) (not e!445014))))

(declare-fun lt!358835 () SeekEntryResult!8416)

(assert (=> b!802741 (= res!546707 (or (= lt!358835 (MissingZero!8416 i!1163)) (= lt!358835 (MissingVacant!8416 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!802741 (= lt!358835 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!802742 () Bool)

(declare-fun res!546713 () Bool)

(assert (=> b!802742 (=> (not res!546713) (not e!445014))))

(declare-datatypes ((List!14739 0))(
  ( (Nil!14736) (Cons!14735 (h!15870 (_ BitVec 64)) (t!21046 List!14739)) )
))
(declare-fun arrayNoDuplicates!0 (array!43588 (_ BitVec 32) List!14739) Bool)

(assert (=> b!802742 (= res!546713 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14736))))

(declare-fun b!802743 () Bool)

(declare-fun res!546717 () Bool)

(assert (=> b!802743 (=> (not res!546717) (not e!445012))))

(assert (=> b!802743 (= res!546717 (validKeyInArray!0 k0!2044))))

(declare-fun b!802744 () Bool)

(assert (=> b!802744 (= e!445013 (not true))))

(declare-fun lt!358841 () (_ BitVec 32))

(declare-fun lt!358840 () array!43588)

(declare-fun lt!358839 () (_ BitVec 64))

(assert (=> b!802744 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358841 vacantAfter!23 lt!358839 lt!358840 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358841 vacantBefore!23 (select (arr!20869 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27457 0))(
  ( (Unit!27458) )
))
(declare-fun lt!358837 () Unit!27457)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43588 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27457)

(assert (=> b!802744 (= lt!358837 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!358841 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802744 (= lt!358841 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!802745 () Bool)

(assert (=> b!802745 (= e!445014 e!445015)))

(declare-fun res!546710 () Bool)

(assert (=> b!802745 (=> (not res!546710) (not e!445015))))

(assert (=> b!802745 (= res!546710 (= (seekEntryOrOpen!0 lt!358839 lt!358840 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358839 lt!358840 mask!3266)))))

(assert (=> b!802745 (= lt!358839 (select (store (arr!20869 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802745 (= lt!358840 (array!43589 (store (arr!20869 a!3170) i!1163 k0!2044) (size!21289 a!3170)))))

(declare-fun b!802746 () Bool)

(declare-fun res!546712 () Bool)

(assert (=> b!802746 (=> (not res!546712) (not e!445012))))

(declare-fun arrayContainsKey!0 (array!43588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802746 (= res!546712 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68966 res!546716) b!802739))

(assert (= (and b!802739 res!546709) b!802737))

(assert (= (and b!802737 res!546708) b!802743))

(assert (= (and b!802743 res!546717) b!802746))

(assert (= (and b!802746 res!546712) b!802741))

(assert (= (and b!802741 res!546707) b!802740))

(assert (= (and b!802740 res!546715) b!802742))

(assert (= (and b!802742 res!546713) b!802736))

(assert (= (and b!802736 res!546714) b!802745))

(assert (= (and b!802745 res!546710) b!802738))

(assert (= (and b!802738 res!546711) b!802744))

(declare-fun m!744355 () Bool)

(assert (=> b!802736 m!744355))

(declare-fun m!744357 () Bool)

(assert (=> b!802736 m!744357))

(declare-fun m!744359 () Bool)

(assert (=> b!802745 m!744359))

(declare-fun m!744361 () Bool)

(assert (=> b!802745 m!744361))

(declare-fun m!744363 () Bool)

(assert (=> b!802745 m!744363))

(declare-fun m!744365 () Bool)

(assert (=> b!802745 m!744365))

(declare-fun m!744367 () Bool)

(assert (=> b!802744 m!744367))

(assert (=> b!802744 m!744367))

(declare-fun m!744369 () Bool)

(assert (=> b!802744 m!744369))

(declare-fun m!744371 () Bool)

(assert (=> b!802744 m!744371))

(declare-fun m!744373 () Bool)

(assert (=> b!802744 m!744373))

(declare-fun m!744375 () Bool)

(assert (=> b!802744 m!744375))

(declare-fun m!744377 () Bool)

(assert (=> start!68966 m!744377))

(declare-fun m!744379 () Bool)

(assert (=> start!68966 m!744379))

(declare-fun m!744381 () Bool)

(assert (=> b!802743 m!744381))

(declare-fun m!744383 () Bool)

(assert (=> b!802741 m!744383))

(declare-fun m!744385 () Bool)

(assert (=> b!802746 m!744385))

(declare-fun m!744387 () Bool)

(assert (=> b!802738 m!744387))

(assert (=> b!802738 m!744367))

(assert (=> b!802738 m!744367))

(declare-fun m!744389 () Bool)

(assert (=> b!802738 m!744389))

(assert (=> b!802738 m!744367))

(declare-fun m!744391 () Bool)

(assert (=> b!802738 m!744391))

(declare-fun m!744393 () Bool)

(assert (=> b!802742 m!744393))

(declare-fun m!744395 () Bool)

(assert (=> b!802740 m!744395))

(assert (=> b!802737 m!744367))

(assert (=> b!802737 m!744367))

(declare-fun m!744397 () Bool)

(assert (=> b!802737 m!744397))

(check-sat (not b!802746) (not b!802740) (not b!802745) (not b!802744) (not b!802743) (not b!802737) (not start!68966) (not b!802742) (not b!802741) (not b!802738))
(check-sat)
