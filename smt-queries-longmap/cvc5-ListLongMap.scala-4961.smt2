; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68260 () Bool)

(assert start!68260)

(declare-fun res!537630 () Bool)

(declare-fun e!440519 () Bool)

(assert (=> start!68260 (=> (not res!537630) (not e!440519))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68260 (= res!537630 (validMask!0 mask!3266))))

(assert (=> start!68260 e!440519))

(assert (=> start!68260 true))

(declare-datatypes ((array!43067 0))(
  ( (array!43068 (arr!20614 (Array (_ BitVec 32) (_ BitVec 64))) (size!21035 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43067)

(declare-fun array_inv!16497 (array!43067) Bool)

(assert (=> start!68260 (array_inv!16497 a!3170)))

(declare-fun b!792964 () Bool)

(declare-fun e!440520 () Bool)

(assert (=> b!792964 (= e!440519 e!440520)))

(declare-fun res!537624 () Bool)

(assert (=> b!792964 (=> (not res!537624) (not e!440520))))

(declare-datatypes ((SeekEntryResult!8202 0))(
  ( (MissingZero!8202 (index!35176 (_ BitVec 32))) (Found!8202 (index!35177 (_ BitVec 32))) (Intermediate!8202 (undefined!9014 Bool) (index!35178 (_ BitVec 32)) (x!66123 (_ BitVec 32))) (Undefined!8202) (MissingVacant!8202 (index!35179 (_ BitVec 32))) )
))
(declare-fun lt!353426 () SeekEntryResult!8202)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!792964 (= res!537624 (or (= lt!353426 (MissingZero!8202 i!1163)) (= lt!353426 (MissingVacant!8202 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43067 (_ BitVec 32)) SeekEntryResult!8202)

(assert (=> b!792964 (= lt!353426 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792965 () Bool)

(declare-fun res!537627 () Bool)

(assert (=> b!792965 (=> (not res!537627) (not e!440519))))

(declare-fun arrayContainsKey!0 (array!43067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792965 (= res!537627 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792966 () Bool)

(declare-fun res!537626 () Bool)

(assert (=> b!792966 (=> (not res!537626) (not e!440520))))

(declare-datatypes ((List!14616 0))(
  ( (Nil!14613) (Cons!14612 (h!15741 (_ BitVec 64)) (t!20922 List!14616)) )
))
(declare-fun arrayNoDuplicates!0 (array!43067 (_ BitVec 32) List!14616) Bool)

(assert (=> b!792966 (= res!537626 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14613))))

(declare-fun b!792967 () Bool)

(declare-fun res!537629 () Bool)

(assert (=> b!792967 (=> (not res!537629) (not e!440519))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792967 (= res!537629 (and (= (size!21035 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21035 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21035 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792968 () Bool)

(declare-fun res!537625 () Bool)

(assert (=> b!792968 (=> (not res!537625) (not e!440519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792968 (= res!537625 (validKeyInArray!0 k!2044))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!792969 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!792969 (= e!440520 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21035 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20614 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21035 a!3170)) (= (select (arr!20614 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!792970 () Bool)

(declare-fun res!537623 () Bool)

(assert (=> b!792970 (=> (not res!537623) (not e!440520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43067 (_ BitVec 32)) Bool)

(assert (=> b!792970 (= res!537623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792971 () Bool)

(declare-fun res!537628 () Bool)

(assert (=> b!792971 (=> (not res!537628) (not e!440519))))

(assert (=> b!792971 (= res!537628 (validKeyInArray!0 (select (arr!20614 a!3170) j!153)))))

(assert (= (and start!68260 res!537630) b!792967))

(assert (= (and b!792967 res!537629) b!792971))

(assert (= (and b!792971 res!537628) b!792968))

(assert (= (and b!792968 res!537625) b!792965))

(assert (= (and b!792965 res!537627) b!792964))

(assert (= (and b!792964 res!537624) b!792970))

(assert (= (and b!792970 res!537623) b!792966))

(assert (= (and b!792966 res!537626) b!792969))

(declare-fun m!732951 () Bool)

(assert (=> b!792968 m!732951))

(declare-fun m!732953 () Bool)

(assert (=> b!792966 m!732953))

(declare-fun m!732955 () Bool)

(assert (=> b!792964 m!732955))

(declare-fun m!732957 () Bool)

(assert (=> b!792970 m!732957))

(declare-fun m!732959 () Bool)

(assert (=> start!68260 m!732959))

(declare-fun m!732961 () Bool)

(assert (=> start!68260 m!732961))

(declare-fun m!732963 () Bool)

(assert (=> b!792971 m!732963))

(assert (=> b!792971 m!732963))

(declare-fun m!732965 () Bool)

(assert (=> b!792971 m!732965))

(declare-fun m!732967 () Bool)

(assert (=> b!792969 m!732967))

(declare-fun m!732969 () Bool)

(assert (=> b!792969 m!732969))

(declare-fun m!732971 () Bool)

(assert (=> b!792965 m!732971))

(push 1)

(assert (not b!792966))

(assert (not b!792971))

(assert (not b!792970))

(assert (not start!68260))

(assert (not b!792968))

(assert (not b!792964))

(assert (not b!792965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

