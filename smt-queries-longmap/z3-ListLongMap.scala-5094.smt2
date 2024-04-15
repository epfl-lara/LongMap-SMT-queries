; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69150 () Bool)

(assert start!69150)

(declare-fun res!550652 () Bool)

(declare-fun e!446526 () Bool)

(assert (=> start!69150 (=> (not res!550652) (not e!446526))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69150 (= res!550652 (validMask!0 mask!3266))))

(assert (=> start!69150 e!446526))

(assert (=> start!69150 true))

(declare-datatypes ((array!43867 0))(
  ( (array!43868 (arr!21011 (Array (_ BitVec 32) (_ BitVec 64))) (size!21432 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43867)

(declare-fun array_inv!16894 (array!43867) Bool)

(assert (=> start!69150 (array_inv!16894 a!3170)))

(declare-fun b!806386 () Bool)

(declare-fun res!550654 () Bool)

(assert (=> b!806386 (=> (not res!550654) (not e!446526))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806386 (= res!550654 (and (= (size!21432 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21432 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21432 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806387 () Bool)

(declare-fun e!446527 () Bool)

(assert (=> b!806387 (= e!446527 (not true))))

(declare-datatypes ((SeekEntryResult!8599 0))(
  ( (MissingZero!8599 (index!36764 (_ BitVec 32))) (Found!8599 (index!36765 (_ BitVec 32))) (Intermediate!8599 (undefined!9411 Bool) (index!36766 (_ BitVec 32)) (x!67590 (_ BitVec 32))) (Undefined!8599) (MissingVacant!8599 (index!36767 (_ BitVec 32))) )
))
(declare-fun lt!361028 () SeekEntryResult!8599)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806387 (= lt!361028 (Found!8599 index!1236))))

(declare-fun b!806388 () Bool)

(declare-fun res!550659 () Bool)

(declare-fun e!446529 () Bool)

(assert (=> b!806388 (=> (not res!550659) (not e!446529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43867 (_ BitVec 32)) Bool)

(assert (=> b!806388 (= res!550659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806389 () Bool)

(declare-fun res!550649 () Bool)

(assert (=> b!806389 (=> (not res!550649) (not e!446529))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806389 (= res!550649 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21432 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21011 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21432 a!3170)) (= (select (arr!21011 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806390 () Bool)

(declare-fun res!550657 () Bool)

(assert (=> b!806390 (=> (not res!550657) (not e!446526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806390 (= res!550657 (validKeyInArray!0 (select (arr!21011 a!3170) j!153)))))

(declare-fun b!806391 () Bool)

(declare-fun res!550656 () Bool)

(assert (=> b!806391 (=> (not res!550656) (not e!446529))))

(declare-datatypes ((List!15013 0))(
  ( (Nil!15010) (Cons!15009 (h!16138 (_ BitVec 64)) (t!21319 List!15013)) )
))
(declare-fun arrayNoDuplicates!0 (array!43867 (_ BitVec 32) List!15013) Bool)

(assert (=> b!806391 (= res!550656 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15010))))

(declare-fun b!806392 () Bool)

(declare-fun e!446530 () Bool)

(assert (=> b!806392 (= e!446530 e!446527)))

(declare-fun res!550650 () Bool)

(assert (=> b!806392 (=> (not res!550650) (not e!446527))))

(declare-fun lt!361023 () SeekEntryResult!8599)

(declare-fun lt!361024 () SeekEntryResult!8599)

(assert (=> b!806392 (= res!550650 (and (= lt!361023 lt!361024) (= lt!361024 (Found!8599 j!153)) (= (select (arr!21011 a!3170) index!1236) (select (arr!21011 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43867 (_ BitVec 32)) SeekEntryResult!8599)

(assert (=> b!806392 (= lt!361024 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21011 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43867 (_ BitVec 32)) SeekEntryResult!8599)

(assert (=> b!806392 (= lt!361023 (seekEntryOrOpen!0 (select (arr!21011 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806393 () Bool)

(assert (=> b!806393 (= e!446526 e!446529)))

(declare-fun res!550651 () Bool)

(assert (=> b!806393 (=> (not res!550651) (not e!446529))))

(declare-fun lt!361027 () SeekEntryResult!8599)

(assert (=> b!806393 (= res!550651 (or (= lt!361027 (MissingZero!8599 i!1163)) (= lt!361027 (MissingVacant!8599 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!806393 (= lt!361027 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806394 () Bool)

(assert (=> b!806394 (= e!446529 e!446530)))

(declare-fun res!550653 () Bool)

(assert (=> b!806394 (=> (not res!550653) (not e!446530))))

(declare-fun lt!361022 () SeekEntryResult!8599)

(assert (=> b!806394 (= res!550653 (= lt!361022 lt!361028))))

(declare-fun lt!361026 () array!43867)

(declare-fun lt!361025 () (_ BitVec 64))

(assert (=> b!806394 (= lt!361028 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361025 lt!361026 mask!3266))))

(assert (=> b!806394 (= lt!361022 (seekEntryOrOpen!0 lt!361025 lt!361026 mask!3266))))

(assert (=> b!806394 (= lt!361025 (select (store (arr!21011 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806394 (= lt!361026 (array!43868 (store (arr!21011 a!3170) i!1163 k0!2044) (size!21432 a!3170)))))

(declare-fun b!806395 () Bool)

(declare-fun res!550655 () Bool)

(assert (=> b!806395 (=> (not res!550655) (not e!446526))))

(declare-fun arrayContainsKey!0 (array!43867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806395 (= res!550655 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806396 () Bool)

(declare-fun res!550658 () Bool)

(assert (=> b!806396 (=> (not res!550658) (not e!446526))))

(assert (=> b!806396 (= res!550658 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69150 res!550652) b!806386))

(assert (= (and b!806386 res!550654) b!806390))

(assert (= (and b!806390 res!550657) b!806396))

(assert (= (and b!806396 res!550658) b!806395))

(assert (= (and b!806395 res!550655) b!806393))

(assert (= (and b!806393 res!550651) b!806388))

(assert (= (and b!806388 res!550659) b!806391))

(assert (= (and b!806391 res!550656) b!806389))

(assert (= (and b!806389 res!550649) b!806394))

(assert (= (and b!806394 res!550653) b!806392))

(assert (= (and b!806392 res!550650) b!806387))

(declare-fun m!747835 () Bool)

(assert (=> b!806395 m!747835))

(declare-fun m!747837 () Bool)

(assert (=> b!806394 m!747837))

(declare-fun m!747839 () Bool)

(assert (=> b!806394 m!747839))

(declare-fun m!747841 () Bool)

(assert (=> b!806394 m!747841))

(declare-fun m!747843 () Bool)

(assert (=> b!806394 m!747843))

(declare-fun m!747845 () Bool)

(assert (=> b!806392 m!747845))

(declare-fun m!747847 () Bool)

(assert (=> b!806392 m!747847))

(assert (=> b!806392 m!747847))

(declare-fun m!747849 () Bool)

(assert (=> b!806392 m!747849))

(assert (=> b!806392 m!747847))

(declare-fun m!747851 () Bool)

(assert (=> b!806392 m!747851))

(assert (=> b!806390 m!747847))

(assert (=> b!806390 m!747847))

(declare-fun m!747853 () Bool)

(assert (=> b!806390 m!747853))

(declare-fun m!747855 () Bool)

(assert (=> start!69150 m!747855))

(declare-fun m!747857 () Bool)

(assert (=> start!69150 m!747857))

(declare-fun m!747859 () Bool)

(assert (=> b!806391 m!747859))

(declare-fun m!747861 () Bool)

(assert (=> b!806396 m!747861))

(declare-fun m!747863 () Bool)

(assert (=> b!806393 m!747863))

(declare-fun m!747865 () Bool)

(assert (=> b!806388 m!747865))

(declare-fun m!747867 () Bool)

(assert (=> b!806389 m!747867))

(declare-fun m!747869 () Bool)

(assert (=> b!806389 m!747869))

(check-sat (not b!806394) (not b!806395) (not b!806392) (not start!69150) (not b!806391) (not b!806388) (not b!806390) (not b!806396) (not b!806393))
(check-sat)
