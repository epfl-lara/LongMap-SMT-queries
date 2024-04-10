; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68294 () Bool)

(assert start!68294)

(declare-fun b!793373 () Bool)

(declare-fun res!537894 () Bool)

(declare-fun e!440738 () Bool)

(assert (=> b!793373 (=> (not res!537894) (not e!440738))))

(declare-datatypes ((array!43084 0))(
  ( (array!43085 (arr!20622 (Array (_ BitVec 32) (_ BitVec 64))) (size!21043 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43084)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793373 (= res!537894 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793374 () Bool)

(declare-fun res!537897 () Bool)

(assert (=> b!793374 (=> (not res!537897) (not e!440738))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793374 (= res!537897 (validKeyInArray!0 (select (arr!20622 a!3170) j!153)))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun b!793375 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun e!440736 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793375 (= e!440736 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21043 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20622 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21043 a!3170)) (= (select (arr!20622 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20622 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!793376 () Bool)

(declare-fun res!537893 () Bool)

(assert (=> b!793376 (=> (not res!537893) (not e!440738))))

(assert (=> b!793376 (= res!537893 (validKeyInArray!0 k!2044))))

(declare-fun res!537895 () Bool)

(assert (=> start!68294 (=> (not res!537895) (not e!440738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68294 (= res!537895 (validMask!0 mask!3266))))

(assert (=> start!68294 e!440738))

(assert (=> start!68294 true))

(declare-fun array_inv!16418 (array!43084) Bool)

(assert (=> start!68294 (array_inv!16418 a!3170)))

(declare-fun b!793377 () Bool)

(declare-fun res!537898 () Bool)

(assert (=> b!793377 (=> (not res!537898) (not e!440736))))

(declare-datatypes ((List!14585 0))(
  ( (Nil!14582) (Cons!14581 (h!15710 (_ BitVec 64)) (t!20900 List!14585)) )
))
(declare-fun arrayNoDuplicates!0 (array!43084 (_ BitVec 32) List!14585) Bool)

(assert (=> b!793377 (= res!537898 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14582))))

(declare-fun b!793378 () Bool)

(assert (=> b!793378 (= e!440738 e!440736)))

(declare-fun res!537896 () Bool)

(assert (=> b!793378 (=> (not res!537896) (not e!440736))))

(declare-datatypes ((SeekEntryResult!8213 0))(
  ( (MissingZero!8213 (index!35220 (_ BitVec 32))) (Found!8213 (index!35221 (_ BitVec 32))) (Intermediate!8213 (undefined!9025 Bool) (index!35222 (_ BitVec 32)) (x!66163 (_ BitVec 32))) (Undefined!8213) (MissingVacant!8213 (index!35223 (_ BitVec 32))) )
))
(declare-fun lt!353696 () SeekEntryResult!8213)

(assert (=> b!793378 (= res!537896 (or (= lt!353696 (MissingZero!8213 i!1163)) (= lt!353696 (MissingVacant!8213 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43084 (_ BitVec 32)) SeekEntryResult!8213)

(assert (=> b!793378 (= lt!353696 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793379 () Bool)

(declare-fun res!537892 () Bool)

(assert (=> b!793379 (=> (not res!537892) (not e!440738))))

(assert (=> b!793379 (= res!537892 (and (= (size!21043 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21043 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21043 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793380 () Bool)

(declare-fun res!537899 () Bool)

(assert (=> b!793380 (=> (not res!537899) (not e!440736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43084 (_ BitVec 32)) Bool)

(assert (=> b!793380 (= res!537899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68294 res!537895) b!793379))

(assert (= (and b!793379 res!537892) b!793374))

(assert (= (and b!793374 res!537897) b!793376))

(assert (= (and b!793376 res!537893) b!793373))

(assert (= (and b!793373 res!537894) b!793378))

(assert (= (and b!793378 res!537896) b!793380))

(assert (= (and b!793380 res!537899) b!793377))

(assert (= (and b!793377 res!537898) b!793375))

(declare-fun m!733835 () Bool)

(assert (=> b!793375 m!733835))

(declare-fun m!733837 () Bool)

(assert (=> b!793375 m!733837))

(declare-fun m!733839 () Bool)

(assert (=> b!793375 m!733839))

(declare-fun m!733841 () Bool)

(assert (=> b!793375 m!733841))

(declare-fun m!733843 () Bool)

(assert (=> b!793374 m!733843))

(assert (=> b!793374 m!733843))

(declare-fun m!733845 () Bool)

(assert (=> b!793374 m!733845))

(declare-fun m!733847 () Bool)

(assert (=> b!793380 m!733847))

(declare-fun m!733849 () Bool)

(assert (=> b!793378 m!733849))

(declare-fun m!733851 () Bool)

(assert (=> b!793377 m!733851))

(declare-fun m!733853 () Bool)

(assert (=> b!793373 m!733853))

(declare-fun m!733855 () Bool)

(assert (=> start!68294 m!733855))

(declare-fun m!733857 () Bool)

(assert (=> start!68294 m!733857))

(declare-fun m!733859 () Bool)

(assert (=> b!793376 m!733859))

(push 1)

(assert (not b!793377))

(assert (not start!68294))

(assert (not b!793376))

(assert (not b!793374))

(assert (not b!793373))

(assert (not b!793380))

(assert (not b!793378))

