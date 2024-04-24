; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68544 () Bool)

(assert start!68544)

(declare-fun res!539991 () Bool)

(declare-fun e!441828 () Bool)

(assert (=> start!68544 (=> (not res!539991) (not e!441828))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68544 (= res!539991 (validMask!0 mask!3266))))

(assert (=> start!68544 e!441828))

(assert (=> start!68544 true))

(declare-datatypes ((array!43208 0))(
  ( (array!43209 (arr!20680 (Array (_ BitVec 32) (_ BitVec 64))) (size!21100 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43208)

(declare-fun array_inv!16539 (array!43208) Bool)

(assert (=> start!68544 (array_inv!16539 a!3170)))

(declare-fun b!795846 () Bool)

(declare-fun res!540000 () Bool)

(assert (=> b!795846 (=> (not res!540000) (not e!441828))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!795846 (= res!540000 (and (= (size!21100 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21100 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21100 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795847 () Bool)

(declare-fun res!539999 () Bool)

(declare-fun e!441826 () Bool)

(assert (=> b!795847 (=> (not res!539999) (not e!441826))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795847 (= res!539999 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21100 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20680 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21100 a!3170)) (= (select (arr!20680 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795848 () Bool)

(declare-fun res!539992 () Bool)

(assert (=> b!795848 (=> (not res!539992) (not e!441826))))

(declare-datatypes ((List!14550 0))(
  ( (Nil!14547) (Cons!14546 (h!15681 (_ BitVec 64)) (t!20857 List!14550)) )
))
(declare-fun arrayNoDuplicates!0 (array!43208 (_ BitVec 32) List!14550) Bool)

(assert (=> b!795848 (= res!539992 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14547))))

(declare-fun b!795849 () Bool)

(declare-fun res!539996 () Bool)

(assert (=> b!795849 (=> (not res!539996) (not e!441826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43208 (_ BitVec 32)) Bool)

(assert (=> b!795849 (= res!539996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795850 () Bool)

(assert (=> b!795850 (= e!441828 e!441826)))

(declare-fun res!539995 () Bool)

(assert (=> b!795850 (=> (not res!539995) (not e!441826))))

(declare-datatypes ((SeekEntryResult!8227 0))(
  ( (MissingZero!8227 (index!35276 (_ BitVec 32))) (Found!8227 (index!35277 (_ BitVec 32))) (Intermediate!8227 (undefined!9039 Bool) (index!35278 (_ BitVec 32)) (x!66356 (_ BitVec 32))) (Undefined!8227) (MissingVacant!8227 (index!35279 (_ BitVec 32))) )
))
(declare-fun lt!354727 () SeekEntryResult!8227)

(assert (=> b!795850 (= res!539995 (or (= lt!354727 (MissingZero!8227 i!1163)) (= lt!354727 (MissingVacant!8227 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43208 (_ BitVec 32)) SeekEntryResult!8227)

(assert (=> b!795850 (= lt!354727 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!795851 () Bool)

(declare-fun res!539998 () Bool)

(assert (=> b!795851 (=> (not res!539998) (not e!441828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795851 (= res!539998 (validKeyInArray!0 (select (arr!20680 a!3170) j!153)))))

(declare-fun b!795852 () Bool)

(declare-fun res!539997 () Bool)

(assert (=> b!795852 (=> (not res!539997) (not e!441828))))

(assert (=> b!795852 (= res!539997 (validKeyInArray!0 k0!2044))))

(declare-fun b!795853 () Bool)

(declare-fun e!441827 () Bool)

(assert (=> b!795853 (= e!441827 false)))

(declare-fun lt!354724 () SeekEntryResult!8227)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43208 (_ BitVec 32)) SeekEntryResult!8227)

(assert (=> b!795853 (= lt!354724 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20680 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354725 () SeekEntryResult!8227)

(assert (=> b!795853 (= lt!354725 (seekEntryOrOpen!0 (select (arr!20680 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795854 () Bool)

(assert (=> b!795854 (= e!441826 e!441827)))

(declare-fun res!539994 () Bool)

(assert (=> b!795854 (=> (not res!539994) (not e!441827))))

(declare-fun lt!354723 () array!43208)

(declare-fun lt!354726 () (_ BitVec 64))

(assert (=> b!795854 (= res!539994 (= (seekEntryOrOpen!0 lt!354726 lt!354723 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354726 lt!354723 mask!3266)))))

(assert (=> b!795854 (= lt!354726 (select (store (arr!20680 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!795854 (= lt!354723 (array!43209 (store (arr!20680 a!3170) i!1163 k0!2044) (size!21100 a!3170)))))

(declare-fun b!795855 () Bool)

(declare-fun res!539993 () Bool)

(assert (=> b!795855 (=> (not res!539993) (not e!441828))))

(declare-fun arrayContainsKey!0 (array!43208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795855 (= res!539993 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68544 res!539991) b!795846))

(assert (= (and b!795846 res!540000) b!795851))

(assert (= (and b!795851 res!539998) b!795852))

(assert (= (and b!795852 res!539997) b!795855))

(assert (= (and b!795855 res!539993) b!795850))

(assert (= (and b!795850 res!539995) b!795849))

(assert (= (and b!795849 res!539996) b!795848))

(assert (= (and b!795848 res!539992) b!795847))

(assert (= (and b!795847 res!539999) b!795854))

(assert (= (and b!795854 res!539994) b!795853))

(declare-fun m!736877 () Bool)

(assert (=> b!795851 m!736877))

(assert (=> b!795851 m!736877))

(declare-fun m!736879 () Bool)

(assert (=> b!795851 m!736879))

(assert (=> b!795853 m!736877))

(assert (=> b!795853 m!736877))

(declare-fun m!736881 () Bool)

(assert (=> b!795853 m!736881))

(assert (=> b!795853 m!736877))

(declare-fun m!736883 () Bool)

(assert (=> b!795853 m!736883))

(declare-fun m!736885 () Bool)

(assert (=> b!795847 m!736885))

(declare-fun m!736887 () Bool)

(assert (=> b!795847 m!736887))

(declare-fun m!736889 () Bool)

(assert (=> b!795848 m!736889))

(declare-fun m!736891 () Bool)

(assert (=> start!68544 m!736891))

(declare-fun m!736893 () Bool)

(assert (=> start!68544 m!736893))

(declare-fun m!736895 () Bool)

(assert (=> b!795849 m!736895))

(declare-fun m!736897 () Bool)

(assert (=> b!795850 m!736897))

(declare-fun m!736899 () Bool)

(assert (=> b!795855 m!736899))

(declare-fun m!736901 () Bool)

(assert (=> b!795852 m!736901))

(declare-fun m!736903 () Bool)

(assert (=> b!795854 m!736903))

(declare-fun m!736905 () Bool)

(assert (=> b!795854 m!736905))

(declare-fun m!736907 () Bool)

(assert (=> b!795854 m!736907))

(declare-fun m!736909 () Bool)

(assert (=> b!795854 m!736909))

(check-sat (not b!795848) (not b!795851) (not b!795854) (not b!795850) (not start!68544) (not b!795853) (not b!795852) (not b!795855) (not b!795849))
(check-sat)
