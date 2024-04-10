; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69006 () Bool)

(assert start!69006)

(declare-fun b!805029 () Bool)

(declare-fun e!445886 () Bool)

(declare-fun e!445883 () Bool)

(assert (=> b!805029 (= e!445886 e!445883)))

(declare-fun res!549551 () Bool)

(assert (=> b!805029 (=> (not res!549551) (not e!445883))))

(declare-datatypes ((SeekEntryResult!8569 0))(
  ( (MissingZero!8569 (index!36644 (_ BitVec 32))) (Found!8569 (index!36645 (_ BitVec 32))) (Intermediate!8569 (undefined!9381 Bool) (index!36646 (_ BitVec 32)) (x!67463 (_ BitVec 32))) (Undefined!8569) (MissingVacant!8569 (index!36647 (_ BitVec 32))) )
))
(declare-fun lt!360422 () SeekEntryResult!8569)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805029 (= res!549551 (or (= lt!360422 (MissingZero!8569 i!1163)) (= lt!360422 (MissingVacant!8569 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43796 0))(
  ( (array!43797 (arr!20978 (Array (_ BitVec 32) (_ BitVec 64))) (size!21399 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43796)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43796 (_ BitVec 32)) SeekEntryResult!8569)

(assert (=> b!805029 (= lt!360422 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805030 () Bool)

(declare-fun res!549554 () Bool)

(assert (=> b!805030 (=> (not res!549554) (not e!445883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43796 (_ BitVec 32)) Bool)

(assert (=> b!805030 (= res!549554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805031 () Bool)

(declare-fun res!549549 () Bool)

(assert (=> b!805031 (=> (not res!549549) (not e!445883))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805031 (= res!549549 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21399 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20978 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21399 a!3170)) (= (select (arr!20978 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805032 () Bool)

(declare-fun e!445885 () Bool)

(assert (=> b!805032 (= e!445883 e!445885)))

(declare-fun res!549557 () Bool)

(assert (=> b!805032 (=> (not res!549557) (not e!445885))))

(declare-fun lt!360424 () (_ BitVec 64))

(declare-fun lt!360423 () array!43796)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43796 (_ BitVec 32)) SeekEntryResult!8569)

(assert (=> b!805032 (= res!549557 (= (seekEntryOrOpen!0 lt!360424 lt!360423 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360424 lt!360423 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805032 (= lt!360424 (select (store (arr!20978 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805032 (= lt!360423 (array!43797 (store (arr!20978 a!3170) i!1163 k!2044) (size!21399 a!3170)))))

(declare-fun res!549553 () Bool)

(assert (=> start!69006 (=> (not res!549553) (not e!445886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69006 (= res!549553 (validMask!0 mask!3266))))

(assert (=> start!69006 e!445886))

(assert (=> start!69006 true))

(declare-fun array_inv!16774 (array!43796) Bool)

(assert (=> start!69006 (array_inv!16774 a!3170)))

(declare-fun b!805033 () Bool)

(declare-fun res!549555 () Bool)

(assert (=> b!805033 (=> (not res!549555) (not e!445886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805033 (= res!549555 (validKeyInArray!0 k!2044))))

(declare-fun b!805034 () Bool)

(declare-fun res!549550 () Bool)

(assert (=> b!805034 (=> (not res!549550) (not e!445886))))

(assert (=> b!805034 (= res!549550 (validKeyInArray!0 (select (arr!20978 a!3170) j!153)))))

(declare-fun b!805035 () Bool)

(declare-fun res!549552 () Bool)

(assert (=> b!805035 (=> (not res!549552) (not e!445883))))

(declare-datatypes ((List!14941 0))(
  ( (Nil!14938) (Cons!14937 (h!16066 (_ BitVec 64)) (t!21256 List!14941)) )
))
(declare-fun arrayNoDuplicates!0 (array!43796 (_ BitVec 32) List!14941) Bool)

(assert (=> b!805035 (= res!549552 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14938))))

(declare-fun b!805036 () Bool)

(assert (=> b!805036 (= e!445885 false)))

(declare-fun lt!360421 () SeekEntryResult!8569)

(assert (=> b!805036 (= lt!360421 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20978 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360425 () SeekEntryResult!8569)

(assert (=> b!805036 (= lt!360425 (seekEntryOrOpen!0 (select (arr!20978 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805037 () Bool)

(declare-fun res!549556 () Bool)

(assert (=> b!805037 (=> (not res!549556) (not e!445886))))

(declare-fun arrayContainsKey!0 (array!43796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805037 (= res!549556 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805038 () Bool)

(declare-fun res!549548 () Bool)

(assert (=> b!805038 (=> (not res!549548) (not e!445886))))

(assert (=> b!805038 (= res!549548 (and (= (size!21399 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21399 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21399 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69006 res!549553) b!805038))

(assert (= (and b!805038 res!549548) b!805034))

(assert (= (and b!805034 res!549550) b!805033))

(assert (= (and b!805033 res!549555) b!805037))

(assert (= (and b!805037 res!549556) b!805029))

(assert (= (and b!805029 res!549551) b!805030))

(assert (= (and b!805030 res!549554) b!805035))

(assert (= (and b!805035 res!549552) b!805031))

(assert (= (and b!805031 res!549549) b!805032))

(assert (= (and b!805032 res!549557) b!805036))

(declare-fun m!746923 () Bool)

(assert (=> b!805033 m!746923))

(declare-fun m!746925 () Bool)

(assert (=> b!805032 m!746925))

(declare-fun m!746927 () Bool)

(assert (=> b!805032 m!746927))

(declare-fun m!746929 () Bool)

(assert (=> b!805032 m!746929))

(declare-fun m!746931 () Bool)

(assert (=> b!805032 m!746931))

(declare-fun m!746933 () Bool)

(assert (=> b!805035 m!746933))

(declare-fun m!746935 () Bool)

(assert (=> b!805037 m!746935))

(declare-fun m!746937 () Bool)

(assert (=> b!805029 m!746937))

(declare-fun m!746939 () Bool)

(assert (=> b!805030 m!746939))

(declare-fun m!746941 () Bool)

(assert (=> start!69006 m!746941))

(declare-fun m!746943 () Bool)

(assert (=> start!69006 m!746943))

(declare-fun m!746945 () Bool)

(assert (=> b!805036 m!746945))

(assert (=> b!805036 m!746945))

(declare-fun m!746947 () Bool)

(assert (=> b!805036 m!746947))

(assert (=> b!805036 m!746945))

(declare-fun m!746949 () Bool)

(assert (=> b!805036 m!746949))

(declare-fun m!746951 () Bool)

(assert (=> b!805031 m!746951))

(declare-fun m!746953 () Bool)

(assert (=> b!805031 m!746953))

(assert (=> b!805034 m!746945))

(assert (=> b!805034 m!746945))

(declare-fun m!746955 () Bool)

(assert (=> b!805034 m!746955))

(push 1)

(assert (not b!805029))

(assert (not b!805033))

(assert (not b!805035))

(assert (not b!805036))

(assert (not b!805030))

(assert (not b!805032))

(assert (not b!805037))

