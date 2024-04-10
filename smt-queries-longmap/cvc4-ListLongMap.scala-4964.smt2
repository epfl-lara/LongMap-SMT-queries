; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68298 () Bool)

(assert start!68298)

(declare-fun b!793421 () Bool)

(declare-fun res!537947 () Bool)

(declare-fun e!440754 () Bool)

(assert (=> b!793421 (=> (not res!537947) (not e!440754))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793421 (= res!537947 (validKeyInArray!0 k!2044))))

(declare-fun e!440755 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43088 0))(
  ( (array!43089 (arr!20624 (Array (_ BitVec 32) (_ BitVec 64))) (size!21045 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43088)

(declare-fun b!793422 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793422 (= e!440755 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21045 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20624 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21045 a!3170)) (= (select (arr!20624 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20624 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!793423 () Bool)

(declare-fun res!537945 () Bool)

(assert (=> b!793423 (=> (not res!537945) (not e!440755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43088 (_ BitVec 32)) Bool)

(assert (=> b!793423 (= res!537945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!537942 () Bool)

(assert (=> start!68298 (=> (not res!537942) (not e!440754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68298 (= res!537942 (validMask!0 mask!3266))))

(assert (=> start!68298 e!440754))

(assert (=> start!68298 true))

(declare-fun array_inv!16420 (array!43088) Bool)

(assert (=> start!68298 (array_inv!16420 a!3170)))

(declare-fun b!793424 () Bool)

(declare-fun res!537944 () Bool)

(assert (=> b!793424 (=> (not res!537944) (not e!440754))))

(declare-fun arrayContainsKey!0 (array!43088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793424 (= res!537944 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793425 () Bool)

(declare-fun res!537943 () Bool)

(assert (=> b!793425 (=> (not res!537943) (not e!440755))))

(declare-datatypes ((List!14587 0))(
  ( (Nil!14584) (Cons!14583 (h!15712 (_ BitVec 64)) (t!20902 List!14587)) )
))
(declare-fun arrayNoDuplicates!0 (array!43088 (_ BitVec 32) List!14587) Bool)

(assert (=> b!793425 (= res!537943 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14584))))

(declare-fun b!793426 () Bool)

(declare-fun res!537946 () Bool)

(assert (=> b!793426 (=> (not res!537946) (not e!440754))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793426 (= res!537946 (and (= (size!21045 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21045 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21045 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793427 () Bool)

(assert (=> b!793427 (= e!440754 e!440755)))

(declare-fun res!537940 () Bool)

(assert (=> b!793427 (=> (not res!537940) (not e!440755))))

(declare-datatypes ((SeekEntryResult!8215 0))(
  ( (MissingZero!8215 (index!35228 (_ BitVec 32))) (Found!8215 (index!35229 (_ BitVec 32))) (Intermediate!8215 (undefined!9027 Bool) (index!35230 (_ BitVec 32)) (x!66165 (_ BitVec 32))) (Undefined!8215) (MissingVacant!8215 (index!35231 (_ BitVec 32))) )
))
(declare-fun lt!353702 () SeekEntryResult!8215)

(assert (=> b!793427 (= res!537940 (or (= lt!353702 (MissingZero!8215 i!1163)) (= lt!353702 (MissingVacant!8215 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43088 (_ BitVec 32)) SeekEntryResult!8215)

(assert (=> b!793427 (= lt!353702 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793428 () Bool)

(declare-fun res!537941 () Bool)

(assert (=> b!793428 (=> (not res!537941) (not e!440754))))

(assert (=> b!793428 (= res!537941 (validKeyInArray!0 (select (arr!20624 a!3170) j!153)))))

(assert (= (and start!68298 res!537942) b!793426))

(assert (= (and b!793426 res!537946) b!793428))

(assert (= (and b!793428 res!537941) b!793421))

(assert (= (and b!793421 res!537947) b!793424))

(assert (= (and b!793424 res!537944) b!793427))

(assert (= (and b!793427 res!537940) b!793423))

(assert (= (and b!793423 res!537945) b!793425))

(assert (= (and b!793425 res!537943) b!793422))

(declare-fun m!733887 () Bool)

(assert (=> b!793428 m!733887))

(assert (=> b!793428 m!733887))

(declare-fun m!733889 () Bool)

(assert (=> b!793428 m!733889))

(declare-fun m!733891 () Bool)

(assert (=> b!793427 m!733891))

(declare-fun m!733893 () Bool)

(assert (=> start!68298 m!733893))

(declare-fun m!733895 () Bool)

(assert (=> start!68298 m!733895))

(declare-fun m!733897 () Bool)

(assert (=> b!793422 m!733897))

(declare-fun m!733899 () Bool)

(assert (=> b!793422 m!733899))

(declare-fun m!733901 () Bool)

(assert (=> b!793422 m!733901))

(declare-fun m!733903 () Bool)

(assert (=> b!793422 m!733903))

(declare-fun m!733905 () Bool)

(assert (=> b!793423 m!733905))

(declare-fun m!733907 () Bool)

(assert (=> b!793421 m!733907))

(declare-fun m!733909 () Bool)

(assert (=> b!793425 m!733909))

(declare-fun m!733911 () Bool)

(assert (=> b!793424 m!733911))

(push 1)

(assert (not b!793424))

(assert (not b!793427))

(assert (not b!793428))

(assert (not b!793421))

(assert (not b!793425))

(assert (not b!793423))

(assert (not start!68298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

