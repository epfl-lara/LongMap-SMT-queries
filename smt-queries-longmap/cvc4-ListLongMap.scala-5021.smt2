; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68640 () Bool)

(assert start!68640)

(declare-fun b!798810 () Bool)

(declare-fun res!543337 () Bool)

(declare-fun e!443042 () Bool)

(assert (=> b!798810 (=> (not res!543337) (not e!443042))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43430 0))(
  ( (array!43431 (arr!20795 (Array (_ BitVec 32) (_ BitVec 64))) (size!21216 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43430)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798810 (= res!543337 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21216 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20795 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21216 a!3170)) (= (select (arr!20795 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798811 () Bool)

(declare-fun e!443039 () Bool)

(assert (=> b!798811 (= e!443042 e!443039)))

(declare-fun res!543332 () Bool)

(assert (=> b!798811 (=> (not res!543332) (not e!443039))))

(declare-fun lt!356607 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!356608 () array!43430)

(declare-datatypes ((SeekEntryResult!8386 0))(
  ( (MissingZero!8386 (index!35912 (_ BitVec 32))) (Found!8386 (index!35913 (_ BitVec 32))) (Intermediate!8386 (undefined!9198 Bool) (index!35914 (_ BitVec 32)) (x!66792 (_ BitVec 32))) (Undefined!8386) (MissingVacant!8386 (index!35915 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43430 (_ BitVec 32)) SeekEntryResult!8386)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43430 (_ BitVec 32)) SeekEntryResult!8386)

(assert (=> b!798811 (= res!543332 (= (seekEntryOrOpen!0 lt!356607 lt!356608 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356607 lt!356608 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!798811 (= lt!356607 (select (store (arr!20795 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798811 (= lt!356608 (array!43431 (store (arr!20795 a!3170) i!1163 k!2044) (size!21216 a!3170)))))

(declare-fun b!798812 () Bool)

(declare-fun res!543330 () Bool)

(declare-fun e!443040 () Bool)

(assert (=> b!798812 (=> (not res!543330) (not e!443040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798812 (= res!543330 (validKeyInArray!0 (select (arr!20795 a!3170) j!153)))))

(declare-fun b!798813 () Bool)

(declare-fun res!543331 () Bool)

(assert (=> b!798813 (=> (not res!543331) (not e!443040))))

(declare-fun arrayContainsKey!0 (array!43430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798813 (= res!543331 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798814 () Bool)

(declare-fun res!543333 () Bool)

(assert (=> b!798814 (=> (not res!543333) (not e!443042))))

(declare-datatypes ((List!14758 0))(
  ( (Nil!14755) (Cons!14754 (h!15883 (_ BitVec 64)) (t!21073 List!14758)) )
))
(declare-fun arrayNoDuplicates!0 (array!43430 (_ BitVec 32) List!14758) Bool)

(assert (=> b!798814 (= res!543333 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14755))))

(declare-fun b!798815 () Bool)

(declare-fun res!543338 () Bool)

(assert (=> b!798815 (=> (not res!543338) (not e!443040))))

(assert (=> b!798815 (= res!543338 (and (= (size!21216 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21216 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21216 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798816 () Bool)

(declare-fun res!543336 () Bool)

(assert (=> b!798816 (=> (not res!543336) (not e!443042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43430 (_ BitVec 32)) Bool)

(assert (=> b!798816 (= res!543336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!543334 () Bool)

(assert (=> start!68640 (=> (not res!543334) (not e!443040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68640 (= res!543334 (validMask!0 mask!3266))))

(assert (=> start!68640 e!443040))

(assert (=> start!68640 true))

(declare-fun array_inv!16591 (array!43430) Bool)

(assert (=> start!68640 (array_inv!16591 a!3170)))

(declare-fun b!798817 () Bool)

(declare-fun res!543329 () Bool)

(assert (=> b!798817 (=> (not res!543329) (not e!443040))))

(assert (=> b!798817 (= res!543329 (validKeyInArray!0 k!2044))))

(declare-fun b!798818 () Bool)

(assert (=> b!798818 (= e!443039 false)))

(declare-fun lt!356609 () SeekEntryResult!8386)

(assert (=> b!798818 (= lt!356609 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20795 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!356605 () SeekEntryResult!8386)

(assert (=> b!798818 (= lt!356605 (seekEntryOrOpen!0 (select (arr!20795 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798819 () Bool)

(assert (=> b!798819 (= e!443040 e!443042)))

(declare-fun res!543335 () Bool)

(assert (=> b!798819 (=> (not res!543335) (not e!443042))))

(declare-fun lt!356606 () SeekEntryResult!8386)

(assert (=> b!798819 (= res!543335 (or (= lt!356606 (MissingZero!8386 i!1163)) (= lt!356606 (MissingVacant!8386 i!1163))))))

(assert (=> b!798819 (= lt!356606 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68640 res!543334) b!798815))

(assert (= (and b!798815 res!543338) b!798812))

(assert (= (and b!798812 res!543330) b!798817))

(assert (= (and b!798817 res!543329) b!798813))

(assert (= (and b!798813 res!543331) b!798819))

(assert (= (and b!798819 res!543335) b!798816))

(assert (= (and b!798816 res!543336) b!798814))

(assert (= (and b!798814 res!543333) b!798810))

(assert (= (and b!798810 res!543337) b!798811))

(assert (= (and b!798811 res!543332) b!798818))

(declare-fun m!739777 () Bool)

(assert (=> b!798814 m!739777))

(declare-fun m!739779 () Bool)

(assert (=> b!798816 m!739779))

(declare-fun m!739781 () Bool)

(assert (=> b!798819 m!739781))

(declare-fun m!739783 () Bool)

(assert (=> b!798817 m!739783))

(declare-fun m!739785 () Bool)

(assert (=> b!798813 m!739785))

(declare-fun m!739787 () Bool)

(assert (=> b!798812 m!739787))

(assert (=> b!798812 m!739787))

(declare-fun m!739789 () Bool)

(assert (=> b!798812 m!739789))

(declare-fun m!739791 () Bool)

(assert (=> b!798810 m!739791))

(declare-fun m!739793 () Bool)

(assert (=> b!798810 m!739793))

(declare-fun m!739795 () Bool)

(assert (=> start!68640 m!739795))

(declare-fun m!739797 () Bool)

(assert (=> start!68640 m!739797))

(assert (=> b!798818 m!739787))

(assert (=> b!798818 m!739787))

(declare-fun m!739799 () Bool)

(assert (=> b!798818 m!739799))

(assert (=> b!798818 m!739787))

(declare-fun m!739801 () Bool)

(assert (=> b!798818 m!739801))

(declare-fun m!739803 () Bool)

(assert (=> b!798811 m!739803))

(declare-fun m!739805 () Bool)

(assert (=> b!798811 m!739805))

(declare-fun m!739807 () Bool)

(assert (=> b!798811 m!739807))

(declare-fun m!739809 () Bool)

(assert (=> b!798811 m!739809))

(push 1)

(assert (not b!798812))

