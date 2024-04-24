; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69158 () Bool)

(assert start!69158)

(declare-fun b!805677 () Bool)

(declare-fun res!549648 () Bool)

(declare-fun e!446362 () Bool)

(assert (=> b!805677 (=> (not res!549648) (not e!446362))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43780 0))(
  ( (array!43781 (arr!20965 (Array (_ BitVec 32) (_ BitVec 64))) (size!21385 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43780)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!805677 (= res!549648 (and (= (size!21385 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21385 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21385 a!3170)) (not (= i!1163 j!153))))))

(declare-fun res!549656 () Bool)

(assert (=> start!69158 (=> (not res!549656) (not e!446362))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69158 (= res!549656 (validMask!0 mask!3266))))

(assert (=> start!69158 e!446362))

(assert (=> start!69158 true))

(declare-fun array_inv!16824 (array!43780) Bool)

(assert (=> start!69158 (array_inv!16824 a!3170)))

(declare-fun b!805678 () Bool)

(declare-fun res!549653 () Bool)

(declare-fun e!446360 () Bool)

(assert (=> b!805678 (=> (not res!549653) (not e!446360))))

(declare-datatypes ((List!14835 0))(
  ( (Nil!14832) (Cons!14831 (h!15966 (_ BitVec 64)) (t!21142 List!14835)) )
))
(declare-fun arrayNoDuplicates!0 (array!43780 (_ BitVec 32) List!14835) Bool)

(assert (=> b!805678 (= res!549653 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14832))))

(declare-fun b!805679 () Bool)

(declare-fun e!446359 () Bool)

(assert (=> b!805679 (= e!446360 e!446359)))

(declare-fun res!549651 () Bool)

(assert (=> b!805679 (=> (not res!549651) (not e!446359))))

(declare-fun lt!360658 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360660 () array!43780)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8512 0))(
  ( (MissingZero!8512 (index!36416 (_ BitVec 32))) (Found!8512 (index!36417 (_ BitVec 32))) (Intermediate!8512 (undefined!9324 Bool) (index!36418 (_ BitVec 32)) (x!67404 (_ BitVec 32))) (Undefined!8512) (MissingVacant!8512 (index!36419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43780 (_ BitVec 32)) SeekEntryResult!8512)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43780 (_ BitVec 32)) SeekEntryResult!8512)

(assert (=> b!805679 (= res!549651 (= (seekEntryOrOpen!0 lt!360658 lt!360660 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360658 lt!360660 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!805679 (= lt!360658 (select (store (arr!20965 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805679 (= lt!360660 (array!43781 (store (arr!20965 a!3170) i!1163 k0!2044) (size!21385 a!3170)))))

(declare-fun b!805680 () Bool)

(declare-fun res!549652 () Bool)

(assert (=> b!805680 (=> (not res!549652) (not e!446360))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43780 (_ BitVec 32)) Bool)

(assert (=> b!805680 (= res!549652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805681 () Bool)

(assert (=> b!805681 (= e!446359 false)))

(declare-fun lt!360659 () SeekEntryResult!8512)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805681 (= lt!360659 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20965 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360661 () SeekEntryResult!8512)

(assert (=> b!805681 (= lt!360661 (seekEntryOrOpen!0 (select (arr!20965 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805682 () Bool)

(declare-fun res!549655 () Bool)

(assert (=> b!805682 (=> (not res!549655) (not e!446362))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805682 (= res!549655 (validKeyInArray!0 k0!2044))))

(declare-fun b!805683 () Bool)

(assert (=> b!805683 (= e!446362 e!446360)))

(declare-fun res!549650 () Bool)

(assert (=> b!805683 (=> (not res!549650) (not e!446360))))

(declare-fun lt!360662 () SeekEntryResult!8512)

(assert (=> b!805683 (= res!549650 (or (= lt!360662 (MissingZero!8512 i!1163)) (= lt!360662 (MissingVacant!8512 i!1163))))))

(assert (=> b!805683 (= lt!360662 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805684 () Bool)

(declare-fun res!549657 () Bool)

(assert (=> b!805684 (=> (not res!549657) (not e!446362))))

(assert (=> b!805684 (= res!549657 (validKeyInArray!0 (select (arr!20965 a!3170) j!153)))))

(declare-fun b!805685 () Bool)

(declare-fun res!549649 () Bool)

(assert (=> b!805685 (=> (not res!549649) (not e!446362))))

(declare-fun arrayContainsKey!0 (array!43780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805685 (= res!549649 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805686 () Bool)

(declare-fun res!549654 () Bool)

(assert (=> b!805686 (=> (not res!549654) (not e!446360))))

(assert (=> b!805686 (= res!549654 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21385 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20965 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21385 a!3170)) (= (select (arr!20965 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69158 res!549656) b!805677))

(assert (= (and b!805677 res!549648) b!805684))

(assert (= (and b!805684 res!549657) b!805682))

(assert (= (and b!805682 res!549655) b!805685))

(assert (= (and b!805685 res!549649) b!805683))

(assert (= (and b!805683 res!549650) b!805680))

(assert (= (and b!805680 res!549652) b!805678))

(assert (= (and b!805678 res!549653) b!805686))

(assert (= (and b!805686 res!549654) b!805679))

(assert (= (and b!805679 res!549651) b!805681))

(declare-fun m!747907 () Bool)

(assert (=> b!805684 m!747907))

(assert (=> b!805684 m!747907))

(declare-fun m!747909 () Bool)

(assert (=> b!805684 m!747909))

(assert (=> b!805681 m!747907))

(assert (=> b!805681 m!747907))

(declare-fun m!747911 () Bool)

(assert (=> b!805681 m!747911))

(assert (=> b!805681 m!747907))

(declare-fun m!747913 () Bool)

(assert (=> b!805681 m!747913))

(declare-fun m!747915 () Bool)

(assert (=> b!805680 m!747915))

(declare-fun m!747917 () Bool)

(assert (=> b!805682 m!747917))

(declare-fun m!747919 () Bool)

(assert (=> b!805686 m!747919))

(declare-fun m!747921 () Bool)

(assert (=> b!805686 m!747921))

(declare-fun m!747923 () Bool)

(assert (=> b!805679 m!747923))

(declare-fun m!747925 () Bool)

(assert (=> b!805679 m!747925))

(declare-fun m!747927 () Bool)

(assert (=> b!805679 m!747927))

(declare-fun m!747929 () Bool)

(assert (=> b!805679 m!747929))

(declare-fun m!747931 () Bool)

(assert (=> start!69158 m!747931))

(declare-fun m!747933 () Bool)

(assert (=> start!69158 m!747933))

(declare-fun m!747935 () Bool)

(assert (=> b!805678 m!747935))

(declare-fun m!747937 () Bool)

(assert (=> b!805683 m!747937))

(declare-fun m!747939 () Bool)

(assert (=> b!805685 m!747939))

(check-sat (not b!805685) (not start!69158) (not b!805681) (not b!805683) (not b!805684) (not b!805680) (not b!805682) (not b!805678) (not b!805679))
(check-sat)
