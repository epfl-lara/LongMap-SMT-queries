; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68474 () Bool)

(assert start!68474)

(declare-fun b!796017 () Bool)

(declare-fun res!540539 () Bool)

(declare-fun e!441740 () Bool)

(assert (=> b!796017 (=> (not res!540539) (not e!441740))))

(declare-datatypes ((array!43264 0))(
  ( (array!43265 (arr!20712 (Array (_ BitVec 32) (_ BitVec 64))) (size!21133 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43264)

(declare-datatypes ((List!14675 0))(
  ( (Nil!14672) (Cons!14671 (h!15800 (_ BitVec 64)) (t!20990 List!14675)) )
))
(declare-fun arrayNoDuplicates!0 (array!43264 (_ BitVec 32) List!14675) Bool)

(assert (=> b!796017 (= res!540539 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14672))))

(declare-fun b!796018 () Bool)

(declare-fun res!540537 () Bool)

(declare-fun e!441741 () Bool)

(assert (=> b!796018 (=> (not res!540537) (not e!441741))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796018 (= res!540537 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796019 () Bool)

(assert (=> b!796019 (= e!441741 e!441740)))

(declare-fun res!540544 () Bool)

(assert (=> b!796019 (=> (not res!540544) (not e!441740))))

(declare-datatypes ((SeekEntryResult!8303 0))(
  ( (MissingZero!8303 (index!35580 (_ BitVec 32))) (Found!8303 (index!35581 (_ BitVec 32))) (Intermediate!8303 (undefined!9115 Bool) (index!35582 (_ BitVec 32)) (x!66493 (_ BitVec 32))) (Undefined!8303) (MissingVacant!8303 (index!35583 (_ BitVec 32))) )
))
(declare-fun lt!354860 () SeekEntryResult!8303)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796019 (= res!540544 (or (= lt!354860 (MissingZero!8303 i!1163)) (= lt!354860 (MissingVacant!8303 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43264 (_ BitVec 32)) SeekEntryResult!8303)

(assert (=> b!796019 (= lt!354860 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796020 () Bool)

(declare-fun e!441742 () Bool)

(assert (=> b!796020 (= e!441740 e!441742)))

(declare-fun res!540545 () Bool)

(assert (=> b!796020 (=> (not res!540545) (not e!441742))))

(declare-fun lt!354864 () SeekEntryResult!8303)

(declare-fun lt!354861 () SeekEntryResult!8303)

(assert (=> b!796020 (= res!540545 (= lt!354864 lt!354861))))

(declare-fun lt!354863 () (_ BitVec 64))

(declare-fun lt!354866 () array!43264)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43264 (_ BitVec 32)) SeekEntryResult!8303)

(assert (=> b!796020 (= lt!354861 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354863 lt!354866 mask!3266))))

(assert (=> b!796020 (= lt!354864 (seekEntryOrOpen!0 lt!354863 lt!354866 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796020 (= lt!354863 (select (store (arr!20712 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796020 (= lt!354866 (array!43265 (store (arr!20712 a!3170) i!1163 k!2044) (size!21133 a!3170)))))

(declare-fun b!796021 () Bool)

(declare-fun res!540540 () Bool)

(assert (=> b!796021 (=> (not res!540540) (not e!441741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796021 (= res!540540 (validKeyInArray!0 k!2044))))

(declare-fun b!796022 () Bool)

(declare-fun e!441739 () Bool)

(assert (=> b!796022 (= e!441739 (not true))))

(assert (=> b!796022 (= lt!354861 (Found!8303 index!1236))))

(declare-fun b!796023 () Bool)

(declare-fun res!540541 () Bool)

(assert (=> b!796023 (=> (not res!540541) (not e!441740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43264 (_ BitVec 32)) Bool)

(assert (=> b!796023 (= res!540541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796024 () Bool)

(declare-fun res!540536 () Bool)

(assert (=> b!796024 (=> (not res!540536) (not e!441740))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796024 (= res!540536 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21133 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20712 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21133 a!3170)) (= (select (arr!20712 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796025 () Bool)

(assert (=> b!796025 (= e!441742 e!441739)))

(declare-fun res!540538 () Bool)

(assert (=> b!796025 (=> (not res!540538) (not e!441739))))

(declare-fun lt!354865 () SeekEntryResult!8303)

(declare-fun lt!354862 () SeekEntryResult!8303)

(assert (=> b!796025 (= res!540538 (and (= lt!354865 lt!354862) (= lt!354862 (Found!8303 j!153)) (= (select (arr!20712 a!3170) index!1236) (select (arr!20712 a!3170) j!153))))))

(assert (=> b!796025 (= lt!354862 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20712 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796025 (= lt!354865 (seekEntryOrOpen!0 (select (arr!20712 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796026 () Bool)

(declare-fun res!540535 () Bool)

(assert (=> b!796026 (=> (not res!540535) (not e!441741))))

(assert (=> b!796026 (= res!540535 (and (= (size!21133 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21133 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21133 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!540543 () Bool)

(assert (=> start!68474 (=> (not res!540543) (not e!441741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68474 (= res!540543 (validMask!0 mask!3266))))

(assert (=> start!68474 e!441741))

(assert (=> start!68474 true))

(declare-fun array_inv!16508 (array!43264) Bool)

(assert (=> start!68474 (array_inv!16508 a!3170)))

(declare-fun b!796016 () Bool)

(declare-fun res!540542 () Bool)

(assert (=> b!796016 (=> (not res!540542) (not e!441741))))

(assert (=> b!796016 (= res!540542 (validKeyInArray!0 (select (arr!20712 a!3170) j!153)))))

(assert (= (and start!68474 res!540543) b!796026))

(assert (= (and b!796026 res!540535) b!796016))

(assert (= (and b!796016 res!540542) b!796021))

(assert (= (and b!796021 res!540540) b!796018))

(assert (= (and b!796018 res!540537) b!796019))

(assert (= (and b!796019 res!540544) b!796023))

(assert (= (and b!796023 res!540541) b!796017))

(assert (= (and b!796017 res!540539) b!796024))

(assert (= (and b!796024 res!540536) b!796020))

(assert (= (and b!796020 res!540545) b!796025))

(assert (= (and b!796025 res!540538) b!796022))

(declare-fun m!736763 () Bool)

(assert (=> b!796020 m!736763))

(declare-fun m!736765 () Bool)

(assert (=> b!796020 m!736765))

(declare-fun m!736767 () Bool)

(assert (=> b!796020 m!736767))

(declare-fun m!736769 () Bool)

(assert (=> b!796020 m!736769))

(declare-fun m!736771 () Bool)

(assert (=> b!796017 m!736771))

(declare-fun m!736773 () Bool)

(assert (=> b!796016 m!736773))

(assert (=> b!796016 m!736773))

(declare-fun m!736775 () Bool)

(assert (=> b!796016 m!736775))

(declare-fun m!736777 () Bool)

(assert (=> b!796021 m!736777))

(declare-fun m!736779 () Bool)

(assert (=> b!796025 m!736779))

(assert (=> b!796025 m!736773))

(assert (=> b!796025 m!736773))

(declare-fun m!736781 () Bool)

(assert (=> b!796025 m!736781))

(assert (=> b!796025 m!736773))

(declare-fun m!736783 () Bool)

(assert (=> b!796025 m!736783))

(declare-fun m!736785 () Bool)

(assert (=> b!796023 m!736785))

(declare-fun m!736787 () Bool)

(assert (=> start!68474 m!736787))

(declare-fun m!736789 () Bool)

(assert (=> start!68474 m!736789))

(declare-fun m!736791 () Bool)

(assert (=> b!796024 m!736791))

(declare-fun m!736793 () Bool)

(assert (=> b!796024 m!736793))

(declare-fun m!736795 () Bool)

(assert (=> b!796019 m!736795))

(declare-fun m!736797 () Bool)

(assert (=> b!796018 m!736797))

(push 1)

