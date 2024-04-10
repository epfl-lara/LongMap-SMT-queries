; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68264 () Bool)

(assert start!68264)

(declare-fun b!793031 () Bool)

(declare-fun res!537557 () Bool)

(declare-fun e!440603 () Bool)

(assert (=> b!793031 (=> (not res!537557) (not e!440603))))

(declare-datatypes ((array!43054 0))(
  ( (array!43055 (arr!20607 (Array (_ BitVec 32) (_ BitVec 64))) (size!21028 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43054)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793031 (= res!537557 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793032 () Bool)

(declare-fun res!537550 () Bool)

(assert (=> b!793032 (=> (not res!537550) (not e!440603))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793032 (= res!537550 (validKeyInArray!0 (select (arr!20607 a!3170) j!153)))))

(declare-fun b!793033 () Bool)

(declare-fun e!440602 () Bool)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793033 (= e!440602 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21028 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20607 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21028 a!3170)) (= (select (arr!20607 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(declare-fun b!793034 () Bool)

(declare-fun res!537556 () Bool)

(assert (=> b!793034 (=> (not res!537556) (not e!440603))))

(assert (=> b!793034 (= res!537556 (validKeyInArray!0 k!2044))))

(declare-fun b!793035 () Bool)

(declare-fun res!537554 () Bool)

(assert (=> b!793035 (=> (not res!537554) (not e!440603))))

(assert (=> b!793035 (= res!537554 (and (= (size!21028 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21028 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21028 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793036 () Bool)

(declare-fun res!537553 () Bool)

(assert (=> b!793036 (=> (not res!537553) (not e!440602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43054 (_ BitVec 32)) Bool)

(assert (=> b!793036 (= res!537553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!537552 () Bool)

(assert (=> start!68264 (=> (not res!537552) (not e!440603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68264 (= res!537552 (validMask!0 mask!3266))))

(assert (=> start!68264 e!440603))

(assert (=> start!68264 true))

(declare-fun array_inv!16403 (array!43054) Bool)

(assert (=> start!68264 (array_inv!16403 a!3170)))

(declare-fun b!793037 () Bool)

(assert (=> b!793037 (= e!440603 e!440602)))

(declare-fun res!537551 () Bool)

(assert (=> b!793037 (=> (not res!537551) (not e!440602))))

(declare-datatypes ((SeekEntryResult!8198 0))(
  ( (MissingZero!8198 (index!35160 (_ BitVec 32))) (Found!8198 (index!35161 (_ BitVec 32))) (Intermediate!8198 (undefined!9010 Bool) (index!35162 (_ BitVec 32)) (x!66108 (_ BitVec 32))) (Undefined!8198) (MissingVacant!8198 (index!35163 (_ BitVec 32))) )
))
(declare-fun lt!353633 () SeekEntryResult!8198)

(assert (=> b!793037 (= res!537551 (or (= lt!353633 (MissingZero!8198 i!1163)) (= lt!353633 (MissingVacant!8198 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43054 (_ BitVec 32)) SeekEntryResult!8198)

(assert (=> b!793037 (= lt!353633 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!793038 () Bool)

(declare-fun res!537555 () Bool)

(assert (=> b!793038 (=> (not res!537555) (not e!440602))))

(declare-datatypes ((List!14570 0))(
  ( (Nil!14567) (Cons!14566 (h!15695 (_ BitVec 64)) (t!20885 List!14570)) )
))
(declare-fun arrayNoDuplicates!0 (array!43054 (_ BitVec 32) List!14570) Bool)

(assert (=> b!793038 (= res!537555 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14567))))

(assert (= (and start!68264 res!537552) b!793035))

(assert (= (and b!793035 res!537554) b!793032))

(assert (= (and b!793032 res!537550) b!793034))

(assert (= (and b!793034 res!537556) b!793031))

(assert (= (and b!793031 res!537557) b!793037))

(assert (= (and b!793037 res!537551) b!793036))

(assert (= (and b!793036 res!537553) b!793038))

(assert (= (and b!793038 res!537555) b!793033))

(declare-fun m!733529 () Bool)

(assert (=> b!793036 m!733529))

(declare-fun m!733531 () Bool)

(assert (=> b!793038 m!733531))

(declare-fun m!733533 () Bool)

(assert (=> start!68264 m!733533))

(declare-fun m!733535 () Bool)

(assert (=> start!68264 m!733535))

(declare-fun m!733537 () Bool)

(assert (=> b!793031 m!733537))

(declare-fun m!733539 () Bool)

(assert (=> b!793034 m!733539))

(declare-fun m!733541 () Bool)

(assert (=> b!793037 m!733541))

(declare-fun m!733543 () Bool)

(assert (=> b!793033 m!733543))

(declare-fun m!733545 () Bool)

(assert (=> b!793033 m!733545))

(declare-fun m!733547 () Bool)

(assert (=> b!793032 m!733547))

(assert (=> b!793032 m!733547))

(declare-fun m!733549 () Bool)

(assert (=> b!793032 m!733549))

(push 1)

(assert (not b!793031))

(assert (not b!793032))

(assert (not b!793037))

(assert (not b!793038))

(assert (not start!68264))

(assert (not b!793036))

(assert (not b!793034))

(check-sat)

(pop 1)

(push 1)

(check-sat)

