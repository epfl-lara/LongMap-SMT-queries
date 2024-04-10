; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69232 () Bool)

(assert start!69232)

(declare-fun b!807668 () Bool)

(declare-fun res!551794 () Bool)

(declare-fun e!447154 () Bool)

(assert (=> b!807668 (=> (not res!551794) (not e!447154))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43932 0))(
  ( (array!43933 (arr!21043 (Array (_ BitVec 32) (_ BitVec 64))) (size!21464 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43932)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!807668 (= res!551794 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21464 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21043 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21464 a!3170)) (= (select (arr!21043 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807669 () Bool)

(declare-fun e!447157 () Bool)

(assert (=> b!807669 (= e!447157 e!447154)))

(declare-fun res!551801 () Bool)

(assert (=> b!807669 (=> (not res!551801) (not e!447154))))

(declare-datatypes ((SeekEntryResult!8634 0))(
  ( (MissingZero!8634 (index!36904 (_ BitVec 32))) (Found!8634 (index!36905 (_ BitVec 32))) (Intermediate!8634 (undefined!9446 Bool) (index!36906 (_ BitVec 32)) (x!67710 (_ BitVec 32))) (Undefined!8634) (MissingVacant!8634 (index!36907 (_ BitVec 32))) )
))
(declare-fun lt!361856 () SeekEntryResult!8634)

(assert (=> b!807669 (= res!551801 (or (= lt!361856 (MissingZero!8634 i!1163)) (= lt!361856 (MissingVacant!8634 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43932 (_ BitVec 32)) SeekEntryResult!8634)

(assert (=> b!807669 (= lt!361856 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807670 () Bool)

(declare-fun res!551791 () Bool)

(assert (=> b!807670 (=> (not res!551791) (not e!447154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43932 (_ BitVec 32)) Bool)

(assert (=> b!807670 (= res!551791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807671 () Bool)

(declare-fun e!447155 () Bool)

(declare-fun e!447156 () Bool)

(assert (=> b!807671 (= e!447155 e!447156)))

(declare-fun res!551792 () Bool)

(assert (=> b!807671 (=> (not res!551792) (not e!447156))))

(declare-fun lt!361859 () SeekEntryResult!8634)

(declare-fun lt!361854 () SeekEntryResult!8634)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807671 (= res!551792 (and (= lt!361859 lt!361854) (= lt!361854 (Found!8634 j!153)) (not (= (select (arr!21043 a!3170) index!1236) (select (arr!21043 a!3170) j!153)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43932 (_ BitVec 32)) SeekEntryResult!8634)

(assert (=> b!807671 (= lt!361854 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21043 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807671 (= lt!361859 (seekEntryOrOpen!0 (select (arr!21043 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807672 () Bool)

(declare-fun res!551799 () Bool)

(assert (=> b!807672 (=> (not res!551799) (not e!447157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807672 (= res!551799 (validKeyInArray!0 k0!2044))))

(declare-fun b!807673 () Bool)

(declare-fun res!551798 () Bool)

(assert (=> b!807673 (=> (not res!551798) (not e!447157))))

(declare-fun arrayContainsKey!0 (array!43932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807673 (= res!551798 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!551793 () Bool)

(assert (=> start!69232 (=> (not res!551793) (not e!447157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69232 (= res!551793 (validMask!0 mask!3266))))

(assert (=> start!69232 e!447157))

(assert (=> start!69232 true))

(declare-fun array_inv!16839 (array!43932) Bool)

(assert (=> start!69232 (array_inv!16839 a!3170)))

(declare-fun b!807674 () Bool)

(declare-fun res!551796 () Bool)

(assert (=> b!807674 (=> (not res!551796) (not e!447154))))

(declare-datatypes ((List!15006 0))(
  ( (Nil!15003) (Cons!15002 (h!16131 (_ BitVec 64)) (t!21321 List!15006)) )
))
(declare-fun arrayNoDuplicates!0 (array!43932 (_ BitVec 32) List!15006) Bool)

(assert (=> b!807674 (= res!551796 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15003))))

(declare-fun b!807675 () Bool)

(declare-fun res!551795 () Bool)

(assert (=> b!807675 (=> (not res!551795) (not e!447157))))

(assert (=> b!807675 (= res!551795 (and (= (size!21464 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21464 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21464 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807676 () Bool)

(assert (=> b!807676 (= e!447156 false)))

(declare-fun lt!361855 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807676 (= lt!361855 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807677 () Bool)

(assert (=> b!807677 (= e!447154 e!447155)))

(declare-fun res!551797 () Bool)

(assert (=> b!807677 (=> (not res!551797) (not e!447155))))

(declare-fun lt!361858 () (_ BitVec 64))

(declare-fun lt!361857 () array!43932)

(assert (=> b!807677 (= res!551797 (= (seekEntryOrOpen!0 lt!361858 lt!361857 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361858 lt!361857 mask!3266)))))

(assert (=> b!807677 (= lt!361858 (select (store (arr!21043 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807677 (= lt!361857 (array!43933 (store (arr!21043 a!3170) i!1163 k0!2044) (size!21464 a!3170)))))

(declare-fun b!807678 () Bool)

(declare-fun res!551800 () Bool)

(assert (=> b!807678 (=> (not res!551800) (not e!447157))))

(assert (=> b!807678 (= res!551800 (validKeyInArray!0 (select (arr!21043 a!3170) j!153)))))

(assert (= (and start!69232 res!551793) b!807675))

(assert (= (and b!807675 res!551795) b!807678))

(assert (= (and b!807678 res!551800) b!807672))

(assert (= (and b!807672 res!551799) b!807673))

(assert (= (and b!807673 res!551798) b!807669))

(assert (= (and b!807669 res!551801) b!807670))

(assert (= (and b!807670 res!551791) b!807674))

(assert (= (and b!807674 res!551796) b!807668))

(assert (= (and b!807668 res!551794) b!807677))

(assert (= (and b!807677 res!551797) b!807671))

(assert (= (and b!807671 res!551792) b!807676))

(declare-fun m!749737 () Bool)

(assert (=> b!807677 m!749737))

(declare-fun m!749739 () Bool)

(assert (=> b!807677 m!749739))

(declare-fun m!749741 () Bool)

(assert (=> b!807677 m!749741))

(declare-fun m!749743 () Bool)

(assert (=> b!807677 m!749743))

(declare-fun m!749745 () Bool)

(assert (=> b!807678 m!749745))

(assert (=> b!807678 m!749745))

(declare-fun m!749747 () Bool)

(assert (=> b!807678 m!749747))

(declare-fun m!749749 () Bool)

(assert (=> b!807676 m!749749))

(declare-fun m!749751 () Bool)

(assert (=> start!69232 m!749751))

(declare-fun m!749753 () Bool)

(assert (=> start!69232 m!749753))

(declare-fun m!749755 () Bool)

(assert (=> b!807668 m!749755))

(declare-fun m!749757 () Bool)

(assert (=> b!807668 m!749757))

(declare-fun m!749759 () Bool)

(assert (=> b!807669 m!749759))

(declare-fun m!749761 () Bool)

(assert (=> b!807673 m!749761))

(declare-fun m!749763 () Bool)

(assert (=> b!807670 m!749763))

(declare-fun m!749765 () Bool)

(assert (=> b!807674 m!749765))

(declare-fun m!749767 () Bool)

(assert (=> b!807671 m!749767))

(assert (=> b!807671 m!749745))

(assert (=> b!807671 m!749745))

(declare-fun m!749769 () Bool)

(assert (=> b!807671 m!749769))

(assert (=> b!807671 m!749745))

(declare-fun m!749771 () Bool)

(assert (=> b!807671 m!749771))

(declare-fun m!749773 () Bool)

(assert (=> b!807672 m!749773))

(check-sat (not b!807670) (not b!807672) (not b!807676) (not b!807673) (not b!807677) (not b!807671) (not b!807669) (not b!807678) (not start!69232) (not b!807674))
(check-sat)
