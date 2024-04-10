; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68268 () Bool)

(assert start!68268)

(declare-fun b!793079 () Bool)

(declare-fun res!537603 () Bool)

(declare-fun e!440619 () Bool)

(assert (=> b!793079 (=> (not res!537603) (not e!440619))))

(declare-datatypes ((array!43058 0))(
  ( (array!43059 (arr!20609 (Array (_ BitVec 32) (_ BitVec 64))) (size!21030 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43058)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43058 (_ BitVec 32)) Bool)

(assert (=> b!793079 (= res!537603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!537598 () Bool)

(declare-fun e!440620 () Bool)

(assert (=> start!68268 (=> (not res!537598) (not e!440620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68268 (= res!537598 (validMask!0 mask!3266))))

(assert (=> start!68268 e!440620))

(assert (=> start!68268 true))

(declare-fun array_inv!16405 (array!43058) Bool)

(assert (=> start!68268 (array_inv!16405 a!3170)))

(declare-fun b!793080 () Bool)

(declare-fun res!537604 () Bool)

(assert (=> b!793080 (=> (not res!537604) (not e!440620))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793080 (= res!537604 (validKeyInArray!0 (select (arr!20609 a!3170) j!153)))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun b!793081 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793081 (= e!440619 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21030 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20609 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21030 a!3170)) (= (select (arr!20609 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!793082 () Bool)

(declare-fun res!537599 () Bool)

(assert (=> b!793082 (=> (not res!537599) (not e!440620))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!793082 (= res!537599 (validKeyInArray!0 k!2044))))

(declare-fun b!793083 () Bool)

(declare-fun res!537602 () Bool)

(assert (=> b!793083 (=> (not res!537602) (not e!440619))))

(declare-datatypes ((List!14572 0))(
  ( (Nil!14569) (Cons!14568 (h!15697 (_ BitVec 64)) (t!20887 List!14572)) )
))
(declare-fun arrayNoDuplicates!0 (array!43058 (_ BitVec 32) List!14572) Bool)

(assert (=> b!793083 (= res!537602 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14569))))

(declare-fun b!793084 () Bool)

(assert (=> b!793084 (= e!440620 e!440619)))

(declare-fun res!537605 () Bool)

(assert (=> b!793084 (=> (not res!537605) (not e!440619))))

(declare-datatypes ((SeekEntryResult!8200 0))(
  ( (MissingZero!8200 (index!35168 (_ BitVec 32))) (Found!8200 (index!35169 (_ BitVec 32))) (Intermediate!8200 (undefined!9012 Bool) (index!35170 (_ BitVec 32)) (x!66110 (_ BitVec 32))) (Undefined!8200) (MissingVacant!8200 (index!35171 (_ BitVec 32))) )
))
(declare-fun lt!353639 () SeekEntryResult!8200)

(assert (=> b!793084 (= res!537605 (or (= lt!353639 (MissingZero!8200 i!1163)) (= lt!353639 (MissingVacant!8200 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43058 (_ BitVec 32)) SeekEntryResult!8200)

(assert (=> b!793084 (= lt!353639 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793085 () Bool)

(declare-fun res!537600 () Bool)

(assert (=> b!793085 (=> (not res!537600) (not e!440620))))

(declare-fun arrayContainsKey!0 (array!43058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793085 (= res!537600 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793086 () Bool)

(declare-fun res!537601 () Bool)

(assert (=> b!793086 (=> (not res!537601) (not e!440620))))

(assert (=> b!793086 (= res!537601 (and (= (size!21030 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21030 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21030 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68268 res!537598) b!793086))

(assert (= (and b!793086 res!537601) b!793080))

(assert (= (and b!793080 res!537604) b!793082))

(assert (= (and b!793082 res!537599) b!793085))

(assert (= (and b!793085 res!537600) b!793084))

(assert (= (and b!793084 res!537605) b!793079))

(assert (= (and b!793079 res!537603) b!793083))

(assert (= (and b!793083 res!537602) b!793081))

(declare-fun m!733573 () Bool)

(assert (=> b!793084 m!733573))

(declare-fun m!733575 () Bool)

(assert (=> b!793085 m!733575))

(declare-fun m!733577 () Bool)

(assert (=> b!793082 m!733577))

(declare-fun m!733579 () Bool)

(assert (=> start!68268 m!733579))

(declare-fun m!733581 () Bool)

(assert (=> start!68268 m!733581))

(declare-fun m!733583 () Bool)

(assert (=> b!793079 m!733583))

(declare-fun m!733585 () Bool)

(assert (=> b!793083 m!733585))

(declare-fun m!733587 () Bool)

(assert (=> b!793081 m!733587))

(declare-fun m!733589 () Bool)

(assert (=> b!793081 m!733589))

(declare-fun m!733591 () Bool)

(assert (=> b!793080 m!733591))

(assert (=> b!793080 m!733591))

(declare-fun m!733593 () Bool)

(assert (=> b!793080 m!733593))

(push 1)

(assert (not b!793083))

(assert (not b!793079))

(assert (not b!793084))

(assert (not b!793085))

(assert (not b!793080))

(assert (not start!68268))

(assert (not b!793082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

