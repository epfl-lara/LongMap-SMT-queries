; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69216 () Bool)

(assert start!69216)

(declare-fun res!551756 () Bool)

(declare-fun e!447033 () Bool)

(assert (=> start!69216 (=> (not res!551756) (not e!447033))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69216 (= res!551756 (validMask!0 mask!3266))))

(assert (=> start!69216 e!447033))

(assert (=> start!69216 true))

(declare-datatypes ((array!43933 0))(
  ( (array!43934 (arr!21044 (Array (_ BitVec 32) (_ BitVec 64))) (size!21465 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43933)

(declare-fun array_inv!16927 (array!43933) Bool)

(assert (=> start!69216 (array_inv!16927 a!3170)))

(declare-fun b!807484 () Bool)

(declare-fun res!551750 () Bool)

(assert (=> b!807484 (=> (not res!551750) (not e!447033))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807484 (= res!551750 (and (= (size!21465 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21465 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21465 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807485 () Bool)

(declare-fun e!447030 () Bool)

(assert (=> b!807485 (= e!447033 e!447030)))

(declare-fun res!551748 () Bool)

(assert (=> b!807485 (=> (not res!551748) (not e!447030))))

(declare-datatypes ((SeekEntryResult!8632 0))(
  ( (MissingZero!8632 (index!36896 (_ BitVec 32))) (Found!8632 (index!36897 (_ BitVec 32))) (Intermediate!8632 (undefined!9444 Bool) (index!36898 (_ BitVec 32)) (x!67711 (_ BitVec 32))) (Undefined!8632) (MissingVacant!8632 (index!36899 (_ BitVec 32))) )
))
(declare-fun lt!361653 () SeekEntryResult!8632)

(assert (=> b!807485 (= res!551748 (or (= lt!361653 (MissingZero!8632 i!1163)) (= lt!361653 (MissingVacant!8632 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43933 (_ BitVec 32)) SeekEntryResult!8632)

(assert (=> b!807485 (= lt!361653 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807486 () Bool)

(declare-fun res!551757 () Bool)

(assert (=> b!807486 (=> (not res!551757) (not e!447030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43933 (_ BitVec 32)) Bool)

(assert (=> b!807486 (= res!551757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807487 () Bool)

(declare-fun e!447032 () Bool)

(assert (=> b!807487 (= e!447032 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361650 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807487 (= lt!361650 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807488 () Bool)

(declare-fun res!551749 () Bool)

(assert (=> b!807488 (=> (not res!551749) (not e!447030))))

(declare-datatypes ((List!15046 0))(
  ( (Nil!15043) (Cons!15042 (h!16171 (_ BitVec 64)) (t!21352 List!15046)) )
))
(declare-fun arrayNoDuplicates!0 (array!43933 (_ BitVec 32) List!15046) Bool)

(assert (=> b!807488 (= res!551749 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15043))))

(declare-fun b!807489 () Bool)

(declare-fun res!551753 () Bool)

(assert (=> b!807489 (=> (not res!551753) (not e!447033))))

(declare-fun arrayContainsKey!0 (array!43933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807489 (= res!551753 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807490 () Bool)

(declare-fun res!551754 () Bool)

(assert (=> b!807490 (=> (not res!551754) (not e!447033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807490 (= res!551754 (validKeyInArray!0 k0!2044))))

(declare-fun b!807491 () Bool)

(declare-fun res!551751 () Bool)

(assert (=> b!807491 (=> (not res!551751) (not e!447033))))

(assert (=> b!807491 (= res!551751 (validKeyInArray!0 (select (arr!21044 a!3170) j!153)))))

(declare-fun b!807492 () Bool)

(declare-fun e!447034 () Bool)

(assert (=> b!807492 (= e!447030 e!447034)))

(declare-fun res!551747 () Bool)

(assert (=> b!807492 (=> (not res!551747) (not e!447034))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361651 () array!43933)

(declare-fun lt!361655 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43933 (_ BitVec 32)) SeekEntryResult!8632)

(assert (=> b!807492 (= res!551747 (= (seekEntryOrOpen!0 lt!361655 lt!361651 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361655 lt!361651 mask!3266)))))

(assert (=> b!807492 (= lt!361655 (select (store (arr!21044 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807492 (= lt!361651 (array!43934 (store (arr!21044 a!3170) i!1163 k0!2044) (size!21465 a!3170)))))

(declare-fun b!807493 () Bool)

(assert (=> b!807493 (= e!447034 e!447032)))

(declare-fun res!551755 () Bool)

(assert (=> b!807493 (=> (not res!551755) (not e!447032))))

(declare-fun lt!361652 () SeekEntryResult!8632)

(declare-fun lt!361654 () SeekEntryResult!8632)

(assert (=> b!807493 (= res!551755 (and (= lt!361652 lt!361654) (= lt!361654 (Found!8632 j!153)) (not (= (select (arr!21044 a!3170) index!1236) (select (arr!21044 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807493 (= lt!361654 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21044 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807493 (= lt!361652 (seekEntryOrOpen!0 (select (arr!21044 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807494 () Bool)

(declare-fun res!551752 () Bool)

(assert (=> b!807494 (=> (not res!551752) (not e!447030))))

(assert (=> b!807494 (= res!551752 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21465 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21044 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21465 a!3170)) (= (select (arr!21044 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69216 res!551756) b!807484))

(assert (= (and b!807484 res!551750) b!807491))

(assert (= (and b!807491 res!551751) b!807490))

(assert (= (and b!807490 res!551754) b!807489))

(assert (= (and b!807489 res!551753) b!807485))

(assert (= (and b!807485 res!551748) b!807486))

(assert (= (and b!807486 res!551757) b!807488))

(assert (= (and b!807488 res!551749) b!807494))

(assert (= (and b!807494 res!551752) b!807492))

(assert (= (and b!807492 res!551747) b!807493))

(assert (= (and b!807493 res!551755) b!807487))

(declare-fun m!749071 () Bool)

(assert (=> b!807485 m!749071))

(declare-fun m!749073 () Bool)

(assert (=> b!807493 m!749073))

(declare-fun m!749075 () Bool)

(assert (=> b!807493 m!749075))

(assert (=> b!807493 m!749075))

(declare-fun m!749077 () Bool)

(assert (=> b!807493 m!749077))

(assert (=> b!807493 m!749075))

(declare-fun m!749079 () Bool)

(assert (=> b!807493 m!749079))

(declare-fun m!749081 () Bool)

(assert (=> start!69216 m!749081))

(declare-fun m!749083 () Bool)

(assert (=> start!69216 m!749083))

(declare-fun m!749085 () Bool)

(assert (=> b!807492 m!749085))

(declare-fun m!749087 () Bool)

(assert (=> b!807492 m!749087))

(declare-fun m!749089 () Bool)

(assert (=> b!807492 m!749089))

(declare-fun m!749091 () Bool)

(assert (=> b!807492 m!749091))

(declare-fun m!749093 () Bool)

(assert (=> b!807486 m!749093))

(declare-fun m!749095 () Bool)

(assert (=> b!807489 m!749095))

(declare-fun m!749097 () Bool)

(assert (=> b!807487 m!749097))

(declare-fun m!749099 () Bool)

(assert (=> b!807488 m!749099))

(declare-fun m!749101 () Bool)

(assert (=> b!807494 m!749101))

(declare-fun m!749103 () Bool)

(assert (=> b!807494 m!749103))

(declare-fun m!749105 () Bool)

(assert (=> b!807490 m!749105))

(assert (=> b!807491 m!749075))

(assert (=> b!807491 m!749075))

(declare-fun m!749107 () Bool)

(assert (=> b!807491 m!749107))

(check-sat (not b!807487) (not b!807492) (not b!807490) (not b!807493) (not start!69216) (not b!807491) (not b!807489) (not b!807485) (not b!807486) (not b!807488))
(check-sat)
