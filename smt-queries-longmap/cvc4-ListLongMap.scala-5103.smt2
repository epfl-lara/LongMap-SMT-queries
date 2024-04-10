; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69228 () Bool)

(assert start!69228)

(declare-fun b!807602 () Bool)

(declare-fun e!447128 () Bool)

(declare-fun e!447124 () Bool)

(assert (=> b!807602 (= e!447128 e!447124)))

(declare-fun res!551727 () Bool)

(assert (=> b!807602 (=> (not res!551727) (not e!447124))))

(declare-datatypes ((SeekEntryResult!8632 0))(
  ( (MissingZero!8632 (index!36896 (_ BitVec 32))) (Found!8632 (index!36897 (_ BitVec 32))) (Intermediate!8632 (undefined!9444 Bool) (index!36898 (_ BitVec 32)) (x!67700 (_ BitVec 32))) (Undefined!8632) (MissingVacant!8632 (index!36899 (_ BitVec 32))) )
))
(declare-fun lt!361819 () SeekEntryResult!8632)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807602 (= res!551727 (or (= lt!361819 (MissingZero!8632 i!1163)) (= lt!361819 (MissingVacant!8632 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43928 0))(
  ( (array!43929 (arr!21041 (Array (_ BitVec 32) (_ BitVec 64))) (size!21462 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43928)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43928 (_ BitVec 32)) SeekEntryResult!8632)

(assert (=> b!807602 (= lt!361819 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!807603 () Bool)

(declare-fun e!447127 () Bool)

(assert (=> b!807603 (= e!447127 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361823 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807603 (= lt!361823 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807604 () Bool)

(declare-fun res!551733 () Bool)

(assert (=> b!807604 (=> (not res!551733) (not e!447128))))

(declare-fun arrayContainsKey!0 (array!43928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807604 (= res!551733 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807606 () Bool)

(declare-fun res!551735 () Bool)

(assert (=> b!807606 (=> (not res!551735) (not e!447128))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807606 (= res!551735 (validKeyInArray!0 (select (arr!21041 a!3170) j!153)))))

(declare-fun b!807607 () Bool)

(declare-fun e!447125 () Bool)

(assert (=> b!807607 (= e!447124 e!447125)))

(declare-fun res!551730 () Bool)

(assert (=> b!807607 (=> (not res!551730) (not e!447125))))

(declare-fun lt!361821 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361822 () array!43928)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43928 (_ BitVec 32)) SeekEntryResult!8632)

(assert (=> b!807607 (= res!551730 (= (seekEntryOrOpen!0 lt!361821 lt!361822 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361821 lt!361822 mask!3266)))))

(assert (=> b!807607 (= lt!361821 (select (store (arr!21041 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!807607 (= lt!361822 (array!43929 (store (arr!21041 a!3170) i!1163 k!2044) (size!21462 a!3170)))))

(declare-fun b!807608 () Bool)

(declare-fun res!551732 () Bool)

(assert (=> b!807608 (=> (not res!551732) (not e!447128))))

(assert (=> b!807608 (= res!551732 (and (= (size!21462 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21462 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21462 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807609 () Bool)

(declare-fun res!551726 () Bool)

(assert (=> b!807609 (=> (not res!551726) (not e!447128))))

(assert (=> b!807609 (= res!551726 (validKeyInArray!0 k!2044))))

(declare-fun b!807610 () Bool)

(declare-fun res!551729 () Bool)

(assert (=> b!807610 (=> (not res!551729) (not e!447124))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807610 (= res!551729 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21462 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21041 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21462 a!3170)) (= (select (arr!21041 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807605 () Bool)

(declare-fun res!551731 () Bool)

(assert (=> b!807605 (=> (not res!551731) (not e!447124))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43928 (_ BitVec 32)) Bool)

(assert (=> b!807605 (= res!551731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!551728 () Bool)

(assert (=> start!69228 (=> (not res!551728) (not e!447128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69228 (= res!551728 (validMask!0 mask!3266))))

(assert (=> start!69228 e!447128))

(assert (=> start!69228 true))

(declare-fun array_inv!16837 (array!43928) Bool)

(assert (=> start!69228 (array_inv!16837 a!3170)))

(declare-fun b!807611 () Bool)

(assert (=> b!807611 (= e!447125 e!447127)))

(declare-fun res!551734 () Bool)

(assert (=> b!807611 (=> (not res!551734) (not e!447127))))

(declare-fun lt!361818 () SeekEntryResult!8632)

(declare-fun lt!361820 () SeekEntryResult!8632)

(assert (=> b!807611 (= res!551734 (and (= lt!361820 lt!361818) (= lt!361818 (Found!8632 j!153)) (not (= (select (arr!21041 a!3170) index!1236) (select (arr!21041 a!3170) j!153)))))))

(assert (=> b!807611 (= lt!361818 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21041 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807611 (= lt!361820 (seekEntryOrOpen!0 (select (arr!21041 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807612 () Bool)

(declare-fun res!551725 () Bool)

(assert (=> b!807612 (=> (not res!551725) (not e!447124))))

(declare-datatypes ((List!15004 0))(
  ( (Nil!15001) (Cons!15000 (h!16129 (_ BitVec 64)) (t!21319 List!15004)) )
))
(declare-fun arrayNoDuplicates!0 (array!43928 (_ BitVec 32) List!15004) Bool)

(assert (=> b!807612 (= res!551725 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15001))))

(assert (= (and start!69228 res!551728) b!807608))

(assert (= (and b!807608 res!551732) b!807606))

(assert (= (and b!807606 res!551735) b!807609))

(assert (= (and b!807609 res!551726) b!807604))

(assert (= (and b!807604 res!551733) b!807602))

(assert (= (and b!807602 res!551727) b!807605))

(assert (= (and b!807605 res!551731) b!807612))

(assert (= (and b!807612 res!551725) b!807610))

(assert (= (and b!807610 res!551729) b!807607))

(assert (= (and b!807607 res!551730) b!807611))

(assert (= (and b!807611 res!551734) b!807603))

(declare-fun m!749661 () Bool)

(assert (=> b!807607 m!749661))

(declare-fun m!749663 () Bool)

(assert (=> b!807607 m!749663))

(declare-fun m!749665 () Bool)

(assert (=> b!807607 m!749665))

(declare-fun m!749667 () Bool)

(assert (=> b!807607 m!749667))

(declare-fun m!749669 () Bool)

(assert (=> b!807606 m!749669))

(assert (=> b!807606 m!749669))

(declare-fun m!749671 () Bool)

(assert (=> b!807606 m!749671))

(declare-fun m!749673 () Bool)

(assert (=> b!807612 m!749673))

(declare-fun m!749675 () Bool)

(assert (=> b!807605 m!749675))

(declare-fun m!749677 () Bool)

(assert (=> start!69228 m!749677))

(declare-fun m!749679 () Bool)

(assert (=> start!69228 m!749679))

(declare-fun m!749681 () Bool)

(assert (=> b!807610 m!749681))

(declare-fun m!749683 () Bool)

(assert (=> b!807610 m!749683))

(declare-fun m!749685 () Bool)

(assert (=> b!807604 m!749685))

(declare-fun m!749687 () Bool)

(assert (=> b!807611 m!749687))

(assert (=> b!807611 m!749669))

(assert (=> b!807611 m!749669))

(declare-fun m!749689 () Bool)

(assert (=> b!807611 m!749689))

(assert (=> b!807611 m!749669))

(declare-fun m!749691 () Bool)

(assert (=> b!807611 m!749691))

(declare-fun m!749693 () Bool)

(assert (=> b!807602 m!749693))

(declare-fun m!749695 () Bool)

(assert (=> b!807603 m!749695))

(declare-fun m!749697 () Bool)

(assert (=> b!807609 m!749697))

(push 1)

(assert (not b!807611))

