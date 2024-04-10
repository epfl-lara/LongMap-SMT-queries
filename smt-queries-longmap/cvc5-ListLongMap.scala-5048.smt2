; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68798 () Bool)

(assert start!68798)

(declare-fun b!801848 () Bool)

(declare-fun e!444443 () Bool)

(assert (=> b!801848 (= e!444443 (not true))))

(declare-fun lt!358481 () (_ BitVec 32))

(declare-fun lt!358480 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43588 0))(
  ( (array!43589 (arr!20874 (Array (_ BitVec 32) (_ BitVec 64))) (size!21295 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43588)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!358483 () array!43588)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8465 0))(
  ( (MissingZero!8465 (index!36228 (_ BitVec 32))) (Found!8465 (index!36229 (_ BitVec 32))) (Intermediate!8465 (undefined!9277 Bool) (index!36230 (_ BitVec 32)) (x!67087 (_ BitVec 32))) (Undefined!8465) (MissingVacant!8465 (index!36231 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43588 (_ BitVec 32)) SeekEntryResult!8465)

(assert (=> b!801848 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358481 vacantAfter!23 lt!358480 lt!358483 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358481 vacantBefore!23 (select (arr!20874 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27470 0))(
  ( (Unit!27471) )
))
(declare-fun lt!358484 () Unit!27470)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43588 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27470)

(assert (=> b!801848 (= lt!358484 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!358481 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801848 (= lt!358481 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801849 () Bool)

(declare-fun res!546376 () Bool)

(declare-fun e!444440 () Bool)

(assert (=> b!801849 (=> (not res!546376) (not e!444440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801849 (= res!546376 (validKeyInArray!0 (select (arr!20874 a!3170) j!153)))))

(declare-fun b!801850 () Bool)

(declare-fun res!546368 () Bool)

(declare-fun e!444442 () Bool)

(assert (=> b!801850 (=> (not res!546368) (not e!444442))))

(assert (=> b!801850 (= res!546368 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21295 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20874 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21295 a!3170)) (= (select (arr!20874 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801851 () Bool)

(declare-fun res!546377 () Bool)

(assert (=> b!801851 (=> (not res!546377) (not e!444442))))

(declare-datatypes ((List!14837 0))(
  ( (Nil!14834) (Cons!14833 (h!15962 (_ BitVec 64)) (t!21152 List!14837)) )
))
(declare-fun arrayNoDuplicates!0 (array!43588 (_ BitVec 32) List!14837) Bool)

(assert (=> b!801851 (= res!546377 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14834))))

(declare-fun b!801852 () Bool)

(declare-fun res!546369 () Bool)

(assert (=> b!801852 (=> (not res!546369) (not e!444440))))

(declare-fun arrayContainsKey!0 (array!43588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801852 (= res!546369 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun res!546374 () Bool)

(assert (=> start!68798 (=> (not res!546374) (not e!444440))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68798 (= res!546374 (validMask!0 mask!3266))))

(assert (=> start!68798 e!444440))

(assert (=> start!68798 true))

(declare-fun array_inv!16670 (array!43588) Bool)

(assert (=> start!68798 (array_inv!16670 a!3170)))

(declare-fun b!801853 () Bool)

(declare-fun res!546367 () Bool)

(assert (=> b!801853 (=> (not res!546367) (not e!444442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43588 (_ BitVec 32)) Bool)

(assert (=> b!801853 (= res!546367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801854 () Bool)

(declare-fun e!444441 () Bool)

(assert (=> b!801854 (= e!444442 e!444441)))

(declare-fun res!546371 () Bool)

(assert (=> b!801854 (=> (not res!546371) (not e!444441))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43588 (_ BitVec 32)) SeekEntryResult!8465)

(assert (=> b!801854 (= res!546371 (= (seekEntryOrOpen!0 lt!358480 lt!358483 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358480 lt!358483 mask!3266)))))

(assert (=> b!801854 (= lt!358480 (select (store (arr!20874 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801854 (= lt!358483 (array!43589 (store (arr!20874 a!3170) i!1163 k!2044) (size!21295 a!3170)))))

(declare-fun b!801855 () Bool)

(assert (=> b!801855 (= e!444440 e!444442)))

(declare-fun res!546375 () Bool)

(assert (=> b!801855 (=> (not res!546375) (not e!444442))))

(declare-fun lt!358478 () SeekEntryResult!8465)

(assert (=> b!801855 (= res!546375 (or (= lt!358478 (MissingZero!8465 i!1163)) (= lt!358478 (MissingVacant!8465 i!1163))))))

(assert (=> b!801855 (= lt!358478 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801856 () Bool)

(declare-fun res!546373 () Bool)

(assert (=> b!801856 (=> (not res!546373) (not e!444440))))

(assert (=> b!801856 (= res!546373 (validKeyInArray!0 k!2044))))

(declare-fun b!801857 () Bool)

(declare-fun res!546370 () Bool)

(assert (=> b!801857 (=> (not res!546370) (not e!444440))))

(assert (=> b!801857 (= res!546370 (and (= (size!21295 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21295 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21295 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801858 () Bool)

(assert (=> b!801858 (= e!444441 e!444443)))

(declare-fun res!546372 () Bool)

(assert (=> b!801858 (=> (not res!546372) (not e!444443))))

(declare-fun lt!358479 () SeekEntryResult!8465)

(declare-fun lt!358482 () SeekEntryResult!8465)

(assert (=> b!801858 (= res!546372 (and (= lt!358479 lt!358482) (= lt!358482 (Found!8465 j!153)) (not (= (select (arr!20874 a!3170) index!1236) (select (arr!20874 a!3170) j!153)))))))

(assert (=> b!801858 (= lt!358482 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20874 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801858 (= lt!358479 (seekEntryOrOpen!0 (select (arr!20874 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68798 res!546374) b!801857))

(assert (= (and b!801857 res!546370) b!801849))

(assert (= (and b!801849 res!546376) b!801856))

(assert (= (and b!801856 res!546373) b!801852))

(assert (= (and b!801852 res!546369) b!801855))

(assert (= (and b!801855 res!546375) b!801853))

(assert (= (and b!801853 res!546367) b!801851))

(assert (= (and b!801851 res!546377) b!801850))

(assert (= (and b!801850 res!546368) b!801854))

(assert (= (and b!801854 res!546371) b!801858))

(assert (= (and b!801858 res!546372) b!801848))

(declare-fun m!743099 () Bool)

(assert (=> b!801855 m!743099))

(declare-fun m!743101 () Bool)

(assert (=> b!801856 m!743101))

(declare-fun m!743103 () Bool)

(assert (=> b!801850 m!743103))

(declare-fun m!743105 () Bool)

(assert (=> b!801850 m!743105))

(declare-fun m!743107 () Bool)

(assert (=> b!801851 m!743107))

(declare-fun m!743109 () Bool)

(assert (=> start!68798 m!743109))

(declare-fun m!743111 () Bool)

(assert (=> start!68798 m!743111))

(declare-fun m!743113 () Bool)

(assert (=> b!801852 m!743113))

(declare-fun m!743115 () Bool)

(assert (=> b!801858 m!743115))

(declare-fun m!743117 () Bool)

(assert (=> b!801858 m!743117))

(assert (=> b!801858 m!743117))

(declare-fun m!743119 () Bool)

(assert (=> b!801858 m!743119))

(assert (=> b!801858 m!743117))

(declare-fun m!743121 () Bool)

(assert (=> b!801858 m!743121))

(assert (=> b!801848 m!743117))

(declare-fun m!743123 () Bool)

(assert (=> b!801848 m!743123))

(assert (=> b!801848 m!743117))

(declare-fun m!743125 () Bool)

(assert (=> b!801848 m!743125))

(declare-fun m!743127 () Bool)

(assert (=> b!801848 m!743127))

(declare-fun m!743129 () Bool)

(assert (=> b!801848 m!743129))

(declare-fun m!743131 () Bool)

(assert (=> b!801854 m!743131))

(declare-fun m!743133 () Bool)

(assert (=> b!801854 m!743133))

(declare-fun m!743135 () Bool)

(assert (=> b!801854 m!743135))

(declare-fun m!743137 () Bool)

(assert (=> b!801854 m!743137))

(assert (=> b!801849 m!743117))

(assert (=> b!801849 m!743117))

(declare-fun m!743139 () Bool)

(assert (=> b!801849 m!743139))

(declare-fun m!743141 () Bool)

(assert (=> b!801853 m!743141))

(push 1)

