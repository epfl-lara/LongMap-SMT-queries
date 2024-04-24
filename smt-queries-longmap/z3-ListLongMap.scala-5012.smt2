; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68706 () Bool)

(assert start!68706)

(declare-fun b!798521 () Bool)

(declare-fun e!443045 () Bool)

(assert (=> b!798521 (= e!443045 (not true))))

(declare-datatypes ((SeekEntryResult!8308 0))(
  ( (MissingZero!8308 (index!35600 (_ BitVec 32))) (Found!8308 (index!35601 (_ BitVec 32))) (Intermediate!8308 (undefined!9120 Bool) (index!35602 (_ BitVec 32)) (x!66653 (_ BitVec 32))) (Undefined!8308) (MissingVacant!8308 (index!35603 (_ BitVec 32))) )
))
(declare-fun lt!356326 () SeekEntryResult!8308)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798521 (= lt!356326 (Found!8308 index!1236))))

(declare-fun b!798522 () Bool)

(declare-fun res!542673 () Bool)

(declare-fun e!443043 () Bool)

(assert (=> b!798522 (=> (not res!542673) (not e!443043))))

(declare-datatypes ((array!43370 0))(
  ( (array!43371 (arr!20761 (Array (_ BitVec 32) (_ BitVec 64))) (size!21181 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43370)

(declare-datatypes ((List!14631 0))(
  ( (Nil!14628) (Cons!14627 (h!15762 (_ BitVec 64)) (t!20938 List!14631)) )
))
(declare-fun arrayNoDuplicates!0 (array!43370 (_ BitVec 32) List!14631) Bool)

(assert (=> b!798522 (= res!542673 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14628))))

(declare-fun b!798523 () Bool)

(declare-fun e!443046 () Bool)

(assert (=> b!798523 (= e!443043 e!443046)))

(declare-fun res!542674 () Bool)

(assert (=> b!798523 (=> (not res!542674) (not e!443046))))

(declare-fun lt!356321 () SeekEntryResult!8308)

(assert (=> b!798523 (= res!542674 (= lt!356321 lt!356326))))

(declare-fun lt!356324 () (_ BitVec 64))

(declare-fun lt!356325 () array!43370)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43370 (_ BitVec 32)) SeekEntryResult!8308)

(assert (=> b!798523 (= lt!356326 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356324 lt!356325 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43370 (_ BitVec 32)) SeekEntryResult!8308)

(assert (=> b!798523 (= lt!356321 (seekEntryOrOpen!0 lt!356324 lt!356325 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798523 (= lt!356324 (select (store (arr!20761 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798523 (= lt!356325 (array!43371 (store (arr!20761 a!3170) i!1163 k0!2044) (size!21181 a!3170)))))

(declare-fun b!798524 () Bool)

(declare-fun res!542676 () Bool)

(assert (=> b!798524 (=> (not res!542676) (not e!443043))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!798524 (= res!542676 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21181 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20761 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21181 a!3170)) (= (select (arr!20761 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798525 () Bool)

(declare-fun res!542668 () Bool)

(declare-fun e!443047 () Bool)

(assert (=> b!798525 (=> (not res!542668) (not e!443047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798525 (= res!542668 (validKeyInArray!0 (select (arr!20761 a!3170) j!153)))))

(declare-fun b!798526 () Bool)

(assert (=> b!798526 (= e!443047 e!443043)))

(declare-fun res!542666 () Bool)

(assert (=> b!798526 (=> (not res!542666) (not e!443043))))

(declare-fun lt!356322 () SeekEntryResult!8308)

(assert (=> b!798526 (= res!542666 (or (= lt!356322 (MissingZero!8308 i!1163)) (= lt!356322 (MissingVacant!8308 i!1163))))))

(assert (=> b!798526 (= lt!356322 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798527 () Bool)

(declare-fun res!542669 () Bool)

(assert (=> b!798527 (=> (not res!542669) (not e!443047))))

(assert (=> b!798527 (= res!542669 (and (= (size!21181 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21181 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21181 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798528 () Bool)

(assert (=> b!798528 (= e!443046 e!443045)))

(declare-fun res!542671 () Bool)

(assert (=> b!798528 (=> (not res!542671) (not e!443045))))

(declare-fun lt!356320 () SeekEntryResult!8308)

(declare-fun lt!356323 () SeekEntryResult!8308)

(assert (=> b!798528 (= res!542671 (and (= lt!356320 lt!356323) (= lt!356323 (Found!8308 j!153)) (= (select (arr!20761 a!3170) index!1236) (select (arr!20761 a!3170) j!153))))))

(assert (=> b!798528 (= lt!356323 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20761 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798528 (= lt!356320 (seekEntryOrOpen!0 (select (arr!20761 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!542667 () Bool)

(assert (=> start!68706 (=> (not res!542667) (not e!443047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68706 (= res!542667 (validMask!0 mask!3266))))

(assert (=> start!68706 e!443047))

(assert (=> start!68706 true))

(declare-fun array_inv!16620 (array!43370) Bool)

(assert (=> start!68706 (array_inv!16620 a!3170)))

(declare-fun b!798529 () Bool)

(declare-fun res!542670 () Bool)

(assert (=> b!798529 (=> (not res!542670) (not e!443043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43370 (_ BitVec 32)) Bool)

(assert (=> b!798529 (= res!542670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798530 () Bool)

(declare-fun res!542675 () Bool)

(assert (=> b!798530 (=> (not res!542675) (not e!443047))))

(declare-fun arrayContainsKey!0 (array!43370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798530 (= res!542675 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798531 () Bool)

(declare-fun res!542672 () Bool)

(assert (=> b!798531 (=> (not res!542672) (not e!443047))))

(assert (=> b!798531 (= res!542672 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68706 res!542667) b!798527))

(assert (= (and b!798527 res!542669) b!798525))

(assert (= (and b!798525 res!542668) b!798531))

(assert (= (and b!798531 res!542672) b!798530))

(assert (= (and b!798530 res!542675) b!798526))

(assert (= (and b!798526 res!542666) b!798529))

(assert (= (and b!798529 res!542670) b!798522))

(assert (= (and b!798522 res!542673) b!798524))

(assert (= (and b!798524 res!542676) b!798523))

(assert (= (and b!798523 res!542674) b!798528))

(assert (= (and b!798528 res!542671) b!798521))

(declare-fun m!739823 () Bool)

(assert (=> b!798526 m!739823))

(declare-fun m!739825 () Bool)

(assert (=> start!68706 m!739825))

(declare-fun m!739827 () Bool)

(assert (=> start!68706 m!739827))

(declare-fun m!739829 () Bool)

(assert (=> b!798529 m!739829))

(declare-fun m!739831 () Bool)

(assert (=> b!798522 m!739831))

(declare-fun m!739833 () Bool)

(assert (=> b!798525 m!739833))

(assert (=> b!798525 m!739833))

(declare-fun m!739835 () Bool)

(assert (=> b!798525 m!739835))

(declare-fun m!739837 () Bool)

(assert (=> b!798523 m!739837))

(declare-fun m!739839 () Bool)

(assert (=> b!798523 m!739839))

(declare-fun m!739841 () Bool)

(assert (=> b!798523 m!739841))

(declare-fun m!739843 () Bool)

(assert (=> b!798523 m!739843))

(declare-fun m!739845 () Bool)

(assert (=> b!798531 m!739845))

(declare-fun m!739847 () Bool)

(assert (=> b!798524 m!739847))

(declare-fun m!739849 () Bool)

(assert (=> b!798524 m!739849))

(declare-fun m!739851 () Bool)

(assert (=> b!798530 m!739851))

(declare-fun m!739853 () Bool)

(assert (=> b!798528 m!739853))

(assert (=> b!798528 m!739833))

(assert (=> b!798528 m!739833))

(declare-fun m!739855 () Bool)

(assert (=> b!798528 m!739855))

(assert (=> b!798528 m!739833))

(declare-fun m!739857 () Bool)

(assert (=> b!798528 m!739857))

(check-sat (not b!798528) (not b!798531) (not b!798530) (not b!798526) (not b!798523) (not start!68706) (not b!798525) (not b!798522) (not b!798529))
(check-sat)
