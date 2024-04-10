; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69168 () Bool)

(assert start!69168)

(declare-fun b!806604 () Bool)

(declare-fun res!550728 () Bool)

(declare-fun e!446665 () Bool)

(assert (=> b!806604 (=> (not res!550728) (not e!446665))))

(declare-datatypes ((array!43868 0))(
  ( (array!43869 (arr!21011 (Array (_ BitVec 32) (_ BitVec 64))) (size!21432 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43868)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806604 (= res!550728 (validKeyInArray!0 (select (arr!21011 a!3170) j!153)))))

(declare-fun b!806605 () Bool)

(declare-fun e!446666 () Bool)

(assert (=> b!806605 (= e!446666 (not true))))

(declare-datatypes ((SeekEntryResult!8602 0))(
  ( (MissingZero!8602 (index!36776 (_ BitVec 32))) (Found!8602 (index!36777 (_ BitVec 32))) (Intermediate!8602 (undefined!9414 Bool) (index!36778 (_ BitVec 32)) (x!67590 (_ BitVec 32))) (Undefined!8602) (MissingVacant!8602 (index!36779 (_ BitVec 32))) )
))
(declare-fun lt!361242 () SeekEntryResult!8602)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806605 (= lt!361242 (Found!8602 index!1236))))

(declare-fun b!806606 () Bool)

(declare-fun e!446667 () Bool)

(declare-fun e!446669 () Bool)

(assert (=> b!806606 (= e!446667 e!446669)))

(declare-fun res!550727 () Bool)

(assert (=> b!806606 (=> (not res!550727) (not e!446669))))

(declare-fun lt!361246 () SeekEntryResult!8602)

(assert (=> b!806606 (= res!550727 (= lt!361246 lt!361242))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361241 () array!43868)

(declare-fun lt!361243 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43868 (_ BitVec 32)) SeekEntryResult!8602)

(assert (=> b!806606 (= lt!361242 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361243 lt!361241 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43868 (_ BitVec 32)) SeekEntryResult!8602)

(assert (=> b!806606 (= lt!361246 (seekEntryOrOpen!0 lt!361243 lt!361241 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806606 (= lt!361243 (select (store (arr!21011 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!806606 (= lt!361241 (array!43869 (store (arr!21011 a!3170) i!1163 k!2044) (size!21432 a!3170)))))

(declare-fun b!806607 () Bool)

(declare-fun res!550735 () Bool)

(assert (=> b!806607 (=> (not res!550735) (not e!446667))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806607 (= res!550735 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21432 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21011 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21432 a!3170)) (= (select (arr!21011 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806608 () Bool)

(assert (=> b!806608 (= e!446669 e!446666)))

(declare-fun res!550736 () Bool)

(assert (=> b!806608 (=> (not res!550736) (not e!446666))))

(declare-fun lt!361245 () SeekEntryResult!8602)

(declare-fun lt!361247 () SeekEntryResult!8602)

(assert (=> b!806608 (= res!550736 (and (= lt!361247 lt!361245) (= lt!361245 (Found!8602 j!153)) (= (select (arr!21011 a!3170) index!1236) (select (arr!21011 a!3170) j!153))))))

(assert (=> b!806608 (= lt!361245 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21011 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806608 (= lt!361247 (seekEntryOrOpen!0 (select (arr!21011 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806609 () Bool)

(declare-fun res!550734 () Bool)

(assert (=> b!806609 (=> (not res!550734) (not e!446665))))

(declare-fun arrayContainsKey!0 (array!43868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806609 (= res!550734 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!806610 () Bool)

(assert (=> b!806610 (= e!446665 e!446667)))

(declare-fun res!550731 () Bool)

(assert (=> b!806610 (=> (not res!550731) (not e!446667))))

(declare-fun lt!361244 () SeekEntryResult!8602)

(assert (=> b!806610 (= res!550731 (or (= lt!361244 (MissingZero!8602 i!1163)) (= lt!361244 (MissingVacant!8602 i!1163))))))

(assert (=> b!806610 (= lt!361244 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!806611 () Bool)

(declare-fun res!550733 () Bool)

(assert (=> b!806611 (=> (not res!550733) (not e!446665))))

(assert (=> b!806611 (= res!550733 (validKeyInArray!0 k!2044))))

(declare-fun res!550726 () Bool)

(assert (=> start!69168 (=> (not res!550726) (not e!446665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69168 (= res!550726 (validMask!0 mask!3266))))

(assert (=> start!69168 e!446665))

(assert (=> start!69168 true))

(declare-fun array_inv!16807 (array!43868) Bool)

(assert (=> start!69168 (array_inv!16807 a!3170)))

(declare-fun b!806603 () Bool)

(declare-fun res!550729 () Bool)

(assert (=> b!806603 (=> (not res!550729) (not e!446667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43868 (_ BitVec 32)) Bool)

(assert (=> b!806603 (= res!550729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806612 () Bool)

(declare-fun res!550732 () Bool)

(assert (=> b!806612 (=> (not res!550732) (not e!446667))))

(declare-datatypes ((List!14974 0))(
  ( (Nil!14971) (Cons!14970 (h!16099 (_ BitVec 64)) (t!21289 List!14974)) )
))
(declare-fun arrayNoDuplicates!0 (array!43868 (_ BitVec 32) List!14974) Bool)

(assert (=> b!806612 (= res!550732 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14971))))

(declare-fun b!806613 () Bool)

(declare-fun res!550730 () Bool)

(assert (=> b!806613 (=> (not res!550730) (not e!446665))))

(assert (=> b!806613 (= res!550730 (and (= (size!21432 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21432 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21432 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69168 res!550726) b!806613))

(assert (= (and b!806613 res!550730) b!806604))

(assert (= (and b!806604 res!550728) b!806611))

(assert (= (and b!806611 res!550733) b!806609))

(assert (= (and b!806609 res!550734) b!806610))

(assert (= (and b!806610 res!550731) b!806603))

(assert (= (and b!806603 res!550729) b!806612))

(assert (= (and b!806612 res!550732) b!806607))

(assert (= (and b!806607 res!550735) b!806606))

(assert (= (and b!806606 res!550727) b!806608))

(assert (= (and b!806608 res!550736) b!806605))

(declare-fun m!748541 () Bool)

(assert (=> start!69168 m!748541))

(declare-fun m!748543 () Bool)

(assert (=> start!69168 m!748543))

(declare-fun m!748545 () Bool)

(assert (=> b!806609 m!748545))

(declare-fun m!748547 () Bool)

(assert (=> b!806604 m!748547))

(assert (=> b!806604 m!748547))

(declare-fun m!748549 () Bool)

(assert (=> b!806604 m!748549))

(declare-fun m!748551 () Bool)

(assert (=> b!806603 m!748551))

(declare-fun m!748553 () Bool)

(assert (=> b!806608 m!748553))

(assert (=> b!806608 m!748547))

(assert (=> b!806608 m!748547))

(declare-fun m!748555 () Bool)

(assert (=> b!806608 m!748555))

(assert (=> b!806608 m!748547))

(declare-fun m!748557 () Bool)

(assert (=> b!806608 m!748557))

(declare-fun m!748559 () Bool)

(assert (=> b!806606 m!748559))

(declare-fun m!748561 () Bool)

(assert (=> b!806606 m!748561))

(declare-fun m!748563 () Bool)

(assert (=> b!806606 m!748563))

(declare-fun m!748565 () Bool)

(assert (=> b!806606 m!748565))

(declare-fun m!748567 () Bool)

(assert (=> b!806607 m!748567))

(declare-fun m!748569 () Bool)

(assert (=> b!806607 m!748569))

(declare-fun m!748571 () Bool)

(assert (=> b!806612 m!748571))

(declare-fun m!748573 () Bool)

(assert (=> b!806610 m!748573))

(declare-fun m!748575 () Bool)

(assert (=> b!806611 m!748575))

(push 1)

