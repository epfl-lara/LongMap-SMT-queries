; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69222 () Bool)

(assert start!69222)

(declare-fun b!807583 () Bool)

(declare-fun res!551852 () Bool)

(declare-fun e!447079 () Bool)

(assert (=> b!807583 (=> (not res!551852) (not e!447079))))

(declare-datatypes ((array!43939 0))(
  ( (array!43940 (arr!21047 (Array (_ BitVec 32) (_ BitVec 64))) (size!21468 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43939)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43939 (_ BitVec 32)) Bool)

(assert (=> b!807583 (= res!551852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807584 () Bool)

(declare-fun res!551849 () Bool)

(assert (=> b!807584 (=> (not res!551849) (not e!447079))))

(declare-datatypes ((List!15049 0))(
  ( (Nil!15046) (Cons!15045 (h!16174 (_ BitVec 64)) (t!21355 List!15049)) )
))
(declare-fun arrayNoDuplicates!0 (array!43939 (_ BitVec 32) List!15049) Bool)

(assert (=> b!807584 (= res!551849 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15046))))

(declare-fun b!807585 () Bool)

(declare-fun res!551846 () Bool)

(declare-fun e!447076 () Bool)

(assert (=> b!807585 (=> (not res!551846) (not e!447076))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807585 (= res!551846 (validKeyInArray!0 k0!2044))))

(declare-fun b!807586 () Bool)

(declare-fun e!447075 () Bool)

(assert (=> b!807586 (= e!447075 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!361704 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807586 (= lt!361704 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807588 () Bool)

(declare-fun e!447077 () Bool)

(assert (=> b!807588 (= e!447077 e!447075)))

(declare-fun res!551854 () Bool)

(assert (=> b!807588 (=> (not res!551854) (not e!447075))))

(declare-datatypes ((SeekEntryResult!8635 0))(
  ( (MissingZero!8635 (index!36908 (_ BitVec 32))) (Found!8635 (index!36909 (_ BitVec 32))) (Intermediate!8635 (undefined!9447 Bool) (index!36910 (_ BitVec 32)) (x!67722 (_ BitVec 32))) (Undefined!8635) (MissingVacant!8635 (index!36911 (_ BitVec 32))) )
))
(declare-fun lt!361705 () SeekEntryResult!8635)

(declare-fun lt!361707 () SeekEntryResult!8635)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!807588 (= res!551854 (and (= lt!361705 lt!361707) (= lt!361707 (Found!8635 j!153)) (not (= (select (arr!21047 a!3170) index!1236) (select (arr!21047 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43939 (_ BitVec 32)) SeekEntryResult!8635)

(assert (=> b!807588 (= lt!361707 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21047 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43939 (_ BitVec 32)) SeekEntryResult!8635)

(assert (=> b!807588 (= lt!361705 (seekEntryOrOpen!0 (select (arr!21047 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807589 () Bool)

(assert (=> b!807589 (= e!447076 e!447079)))

(declare-fun res!551855 () Bool)

(assert (=> b!807589 (=> (not res!551855) (not e!447079))))

(declare-fun lt!361706 () SeekEntryResult!8635)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807589 (= res!551855 (or (= lt!361706 (MissingZero!8635 i!1163)) (= lt!361706 (MissingVacant!8635 i!1163))))))

(assert (=> b!807589 (= lt!361706 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!807590 () Bool)

(declare-fun res!551847 () Bool)

(assert (=> b!807590 (=> (not res!551847) (not e!447076))))

(assert (=> b!807590 (= res!551847 (and (= (size!21468 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21468 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21468 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807591 () Bool)

(declare-fun res!551850 () Bool)

(assert (=> b!807591 (=> (not res!551850) (not e!447079))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!807591 (= res!551850 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21468 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21047 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21468 a!3170)) (= (select (arr!21047 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807592 () Bool)

(declare-fun res!551853 () Bool)

(assert (=> b!807592 (=> (not res!551853) (not e!447076))))

(assert (=> b!807592 (= res!551853 (validKeyInArray!0 (select (arr!21047 a!3170) j!153)))))

(declare-fun b!807593 () Bool)

(declare-fun res!551851 () Bool)

(assert (=> b!807593 (=> (not res!551851) (not e!447076))))

(declare-fun arrayContainsKey!0 (array!43939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807593 (= res!551851 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!551856 () Bool)

(assert (=> start!69222 (=> (not res!551856) (not e!447076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69222 (= res!551856 (validMask!0 mask!3266))))

(assert (=> start!69222 e!447076))

(assert (=> start!69222 true))

(declare-fun array_inv!16930 (array!43939) Bool)

(assert (=> start!69222 (array_inv!16930 a!3170)))

(declare-fun b!807587 () Bool)

(assert (=> b!807587 (= e!447079 e!447077)))

(declare-fun res!551848 () Bool)

(assert (=> b!807587 (=> (not res!551848) (not e!447077))))

(declare-fun lt!361709 () array!43939)

(declare-fun lt!361708 () (_ BitVec 64))

(assert (=> b!807587 (= res!551848 (= (seekEntryOrOpen!0 lt!361708 lt!361709 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361708 lt!361709 mask!3266)))))

(assert (=> b!807587 (= lt!361708 (select (store (arr!21047 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807587 (= lt!361709 (array!43940 (store (arr!21047 a!3170) i!1163 k0!2044) (size!21468 a!3170)))))

(assert (= (and start!69222 res!551856) b!807590))

(assert (= (and b!807590 res!551847) b!807592))

(assert (= (and b!807592 res!551853) b!807585))

(assert (= (and b!807585 res!551846) b!807593))

(assert (= (and b!807593 res!551851) b!807589))

(assert (= (and b!807589 res!551855) b!807583))

(assert (= (and b!807583 res!551852) b!807584))

(assert (= (and b!807584 res!551849) b!807591))

(assert (= (and b!807591 res!551850) b!807587))

(assert (= (and b!807587 res!551848) b!807588))

(assert (= (and b!807588 res!551854) b!807586))

(declare-fun m!749185 () Bool)

(assert (=> b!807583 m!749185))

(declare-fun m!749187 () Bool)

(assert (=> b!807588 m!749187))

(declare-fun m!749189 () Bool)

(assert (=> b!807588 m!749189))

(assert (=> b!807588 m!749189))

(declare-fun m!749191 () Bool)

(assert (=> b!807588 m!749191))

(assert (=> b!807588 m!749189))

(declare-fun m!749193 () Bool)

(assert (=> b!807588 m!749193))

(declare-fun m!749195 () Bool)

(assert (=> b!807591 m!749195))

(declare-fun m!749197 () Bool)

(assert (=> b!807591 m!749197))

(declare-fun m!749199 () Bool)

(assert (=> b!807593 m!749199))

(declare-fun m!749201 () Bool)

(assert (=> b!807589 m!749201))

(declare-fun m!749203 () Bool)

(assert (=> b!807585 m!749203))

(assert (=> b!807592 m!749189))

(assert (=> b!807592 m!749189))

(declare-fun m!749205 () Bool)

(assert (=> b!807592 m!749205))

(declare-fun m!749207 () Bool)

(assert (=> b!807586 m!749207))

(declare-fun m!749209 () Bool)

(assert (=> b!807584 m!749209))

(declare-fun m!749211 () Bool)

(assert (=> b!807587 m!749211))

(declare-fun m!749213 () Bool)

(assert (=> b!807587 m!749213))

(declare-fun m!749215 () Bool)

(assert (=> b!807587 m!749215))

(declare-fun m!749217 () Bool)

(assert (=> b!807587 m!749217))

(declare-fun m!749219 () Bool)

(assert (=> start!69222 m!749219))

(declare-fun m!749221 () Bool)

(assert (=> start!69222 m!749221))

(check-sat (not b!807589) (not start!69222) (not b!807593) (not b!807583) (not b!807588) (not b!807586) (not b!807585) (not b!807584) (not b!807587) (not b!807592))
(check-sat)
