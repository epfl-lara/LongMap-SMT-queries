; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68730 () Bool)

(assert start!68730)

(declare-fun b!800562 () Bool)

(declare-fun e!443848 () Bool)

(assert (=> b!800562 (= e!443848 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43520 0))(
  ( (array!43521 (arr!20840 (Array (_ BitVec 32) (_ BitVec 64))) (size!21261 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43520)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!357686 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8431 0))(
  ( (MissingZero!8431 (index!36092 (_ BitVec 32))) (Found!8431 (index!36093 (_ BitVec 32))) (Intermediate!8431 (undefined!9243 Bool) (index!36094 (_ BitVec 32)) (x!66957 (_ BitVec 32))) (Undefined!8431) (MissingVacant!8431 (index!36095 (_ BitVec 32))) )
))
(declare-fun lt!357683 () SeekEntryResult!8431)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43520 (_ BitVec 32)) SeekEntryResult!8431)

(assert (=> b!800562 (= lt!357683 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357686 vacantBefore!23 (select (arr!20840 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800563 () Bool)

(declare-fun e!443852 () Bool)

(declare-fun e!443849 () Bool)

(assert (=> b!800563 (= e!443852 e!443849)))

(declare-fun res!545084 () Bool)

(assert (=> b!800563 (=> (not res!545084) (not e!443849))))

(declare-fun lt!357684 () SeekEntryResult!8431)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!800563 (= res!545084 (or (= lt!357684 (MissingZero!8431 i!1163)) (= lt!357684 (MissingVacant!8431 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43520 (_ BitVec 32)) SeekEntryResult!8431)

(assert (=> b!800563 (= lt!357684 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!800564 () Bool)

(declare-fun e!443850 () Bool)

(declare-fun e!443847 () Bool)

(assert (=> b!800564 (= e!443850 e!443847)))

(declare-fun res!545088 () Bool)

(assert (=> b!800564 (=> (not res!545088) (not e!443847))))

(declare-fun lt!357685 () SeekEntryResult!8431)

(declare-fun lt!357687 () SeekEntryResult!8431)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!800564 (= res!545088 (and (= lt!357685 lt!357687) (= lt!357687 (Found!8431 j!153)) (not (= (select (arr!20840 a!3170) index!1236) (select (arr!20840 a!3170) j!153)))))))

(assert (=> b!800564 (= lt!357687 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20840 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!800564 (= lt!357685 (seekEntryOrOpen!0 (select (arr!20840 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!800565 () Bool)

(declare-fun res!545087 () Bool)

(assert (=> b!800565 (=> (not res!545087) (not e!443848))))

(declare-fun lt!357688 () SeekEntryResult!8431)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!357689 () (_ BitVec 64))

(declare-fun lt!357682 () array!43520)

(assert (=> b!800565 (= res!545087 (= lt!357688 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357686 vacantAfter!23 lt!357689 lt!357682 mask!3266)))))

(declare-fun res!545092 () Bool)

(assert (=> start!68730 (=> (not res!545092) (not e!443852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68730 (= res!545092 (validMask!0 mask!3266))))

(assert (=> start!68730 e!443852))

(assert (=> start!68730 true))

(declare-fun array_inv!16636 (array!43520) Bool)

(assert (=> start!68730 (array_inv!16636 a!3170)))

(declare-fun b!800566 () Bool)

(declare-fun res!545091 () Bool)

(assert (=> b!800566 (=> (not res!545091) (not e!443852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!800566 (= res!545091 (validKeyInArray!0 (select (arr!20840 a!3170) j!153)))))

(declare-fun b!800567 () Bool)

(assert (=> b!800567 (= e!443849 e!443850)))

(declare-fun res!545081 () Bool)

(assert (=> b!800567 (=> (not res!545081) (not e!443850))))

(assert (=> b!800567 (= res!545081 (= lt!357688 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357689 lt!357682 mask!3266)))))

(assert (=> b!800567 (= lt!357688 (seekEntryOrOpen!0 lt!357689 lt!357682 mask!3266))))

(assert (=> b!800567 (= lt!357689 (select (store (arr!20840 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!800567 (= lt!357682 (array!43521 (store (arr!20840 a!3170) i!1163 k!2044) (size!21261 a!3170)))))

(declare-fun b!800568 () Bool)

(declare-fun res!545089 () Bool)

(assert (=> b!800568 (=> (not res!545089) (not e!443852))))

(assert (=> b!800568 (= res!545089 (validKeyInArray!0 k!2044))))

(declare-fun b!800569 () Bool)

(declare-fun res!545093 () Bool)

(assert (=> b!800569 (=> (not res!545093) (not e!443849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43520 (_ BitVec 32)) Bool)

(assert (=> b!800569 (= res!545093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!800570 () Bool)

(declare-fun res!545082 () Bool)

(assert (=> b!800570 (=> (not res!545082) (not e!443852))))

(declare-fun arrayContainsKey!0 (array!43520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!800570 (= res!545082 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!800571 () Bool)

(declare-fun res!545085 () Bool)

(assert (=> b!800571 (=> (not res!545085) (not e!443852))))

(assert (=> b!800571 (= res!545085 (and (= (size!21261 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21261 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21261 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!800572 () Bool)

(declare-fun res!545083 () Bool)

(assert (=> b!800572 (=> (not res!545083) (not e!443849))))

(assert (=> b!800572 (= res!545083 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21261 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20840 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21261 a!3170)) (= (select (arr!20840 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!800573 () Bool)

(declare-fun res!545090 () Bool)

(assert (=> b!800573 (=> (not res!545090) (not e!443849))))

(declare-datatypes ((List!14803 0))(
  ( (Nil!14800) (Cons!14799 (h!15928 (_ BitVec 64)) (t!21118 List!14803)) )
))
(declare-fun arrayNoDuplicates!0 (array!43520 (_ BitVec 32) List!14803) Bool)

(assert (=> b!800573 (= res!545090 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14800))))

(declare-fun b!800574 () Bool)

(assert (=> b!800574 (= e!443847 e!443848)))

(declare-fun res!545086 () Bool)

(assert (=> b!800574 (=> (not res!545086) (not e!443848))))

(assert (=> b!800574 (= res!545086 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357686 #b00000000000000000000000000000000) (bvslt lt!357686 (size!21261 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!800574 (= lt!357686 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68730 res!545092) b!800571))

(assert (= (and b!800571 res!545085) b!800566))

(assert (= (and b!800566 res!545091) b!800568))

(assert (= (and b!800568 res!545089) b!800570))

(assert (= (and b!800570 res!545082) b!800563))

(assert (= (and b!800563 res!545084) b!800569))

(assert (= (and b!800569 res!545093) b!800573))

(assert (= (and b!800573 res!545090) b!800572))

(assert (= (and b!800572 res!545083) b!800567))

(assert (= (and b!800567 res!545081) b!800564))

(assert (= (and b!800564 res!545088) b!800574))

(assert (= (and b!800574 res!545086) b!800565))

(assert (= (and b!800565 res!545087) b!800562))

(declare-fun m!741659 () Bool)

(assert (=> b!800574 m!741659))

(declare-fun m!741661 () Bool)

(assert (=> b!800566 m!741661))

(assert (=> b!800566 m!741661))

(declare-fun m!741663 () Bool)

(assert (=> b!800566 m!741663))

(declare-fun m!741665 () Bool)

(assert (=> start!68730 m!741665))

(declare-fun m!741667 () Bool)

(assert (=> start!68730 m!741667))

(declare-fun m!741669 () Bool)

(assert (=> b!800568 m!741669))

(declare-fun m!741671 () Bool)

(assert (=> b!800572 m!741671))

(declare-fun m!741673 () Bool)

(assert (=> b!800572 m!741673))

(declare-fun m!741675 () Bool)

(assert (=> b!800570 m!741675))

(declare-fun m!741677 () Bool)

(assert (=> b!800567 m!741677))

(declare-fun m!741679 () Bool)

(assert (=> b!800567 m!741679))

(declare-fun m!741681 () Bool)

(assert (=> b!800567 m!741681))

(declare-fun m!741683 () Bool)

(assert (=> b!800567 m!741683))

(declare-fun m!741685 () Bool)

(assert (=> b!800565 m!741685))

(assert (=> b!800562 m!741661))

(assert (=> b!800562 m!741661))

(declare-fun m!741687 () Bool)

(assert (=> b!800562 m!741687))

(declare-fun m!741689 () Bool)

(assert (=> b!800569 m!741689))

(declare-fun m!741691 () Bool)

(assert (=> b!800563 m!741691))

(declare-fun m!741693 () Bool)

(assert (=> b!800564 m!741693))

(assert (=> b!800564 m!741661))

(assert (=> b!800564 m!741661))

(declare-fun m!741695 () Bool)

(assert (=> b!800564 m!741695))

(assert (=> b!800564 m!741661))

(declare-fun m!741697 () Bool)

(assert (=> b!800564 m!741697))

(declare-fun m!741699 () Bool)

(assert (=> b!800573 m!741699))

(push 1)

(assert (not b!800574))

(assert (not b!800569))

(assert (not b!800573))

(assert (not b!800563))

(assert (not b!800570))

(assert (not b!800564))

(assert (