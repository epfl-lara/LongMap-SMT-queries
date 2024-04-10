; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68360 () Bool)

(assert start!68360)

(declare-fun b!794286 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun e!441062 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794286 (= e!441062 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun b!794287 () Bool)

(declare-fun e!441065 () Bool)

(declare-fun e!441063 () Bool)

(assert (=> b!794287 (= e!441065 e!441063)))

(declare-fun res!538810 () Bool)

(assert (=> b!794287 (=> (not res!538810) (not e!441063))))

(declare-datatypes ((SeekEntryResult!8246 0))(
  ( (MissingZero!8246 (index!35352 (_ BitVec 32))) (Found!8246 (index!35353 (_ BitVec 32))) (Intermediate!8246 (undefined!9058 Bool) (index!35354 (_ BitVec 32)) (x!66284 (_ BitVec 32))) (Undefined!8246) (MissingVacant!8246 (index!35355 (_ BitVec 32))) )
))
(declare-fun lt!354069 () SeekEntryResult!8246)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794287 (= res!538810 (or (= lt!354069 (MissingZero!8246 i!1163)) (= lt!354069 (MissingVacant!8246 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43150 0))(
  ( (array!43151 (arr!20655 (Array (_ BitVec 32) (_ BitVec 64))) (size!21076 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43150)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43150 (_ BitVec 32)) SeekEntryResult!8246)

(assert (=> b!794287 (= lt!354069 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun res!538813 () Bool)

(assert (=> start!68360 (=> (not res!538813) (not e!441065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68360 (= res!538813 (validMask!0 mask!3266))))

(assert (=> start!68360 e!441065))

(assert (=> start!68360 true))

(declare-fun array_inv!16451 (array!43150) Bool)

(assert (=> start!68360 (array_inv!16451 a!3170)))

(declare-fun b!794288 () Bool)

(declare-fun res!538806 () Bool)

(assert (=> b!794288 (=> (not res!538806) (not e!441063))))

(declare-datatypes ((List!14618 0))(
  ( (Nil!14615) (Cons!14614 (h!15743 (_ BitVec 64)) (t!20933 List!14618)) )
))
(declare-fun arrayNoDuplicates!0 (array!43150 (_ BitVec 32) List!14618) Bool)

(assert (=> b!794288 (= res!538806 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14615))))

(declare-fun b!794289 () Bool)

(declare-fun res!538809 () Bool)

(assert (=> b!794289 (=> (not res!538809) (not e!441065))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794289 (= res!538809 (and (= (size!21076 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21076 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21076 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794290 () Bool)

(declare-fun res!538812 () Bool)

(assert (=> b!794290 (=> (not res!538812) (not e!441065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794290 (= res!538812 (validKeyInArray!0 k!2044))))

(declare-fun b!794291 () Bool)

(declare-fun res!538805 () Bool)

(assert (=> b!794291 (=> (not res!538805) (not e!441063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43150 (_ BitVec 32)) Bool)

(assert (=> b!794291 (= res!538805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794292 () Bool)

(declare-fun res!538808 () Bool)

(assert (=> b!794292 (=> (not res!538808) (not e!441065))))

(assert (=> b!794292 (= res!538808 (validKeyInArray!0 (select (arr!20655 a!3170) j!153)))))

(declare-fun b!794293 () Bool)

(declare-fun res!538814 () Bool)

(assert (=> b!794293 (=> (not res!538814) (not e!441063))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!794293 (= res!538814 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21076 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20655 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21076 a!3170)) (= (select (arr!20655 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794294 () Bool)

(assert (=> b!794294 (= e!441063 e!441062)))

(declare-fun res!538807 () Bool)

(assert (=> b!794294 (=> (not res!538807) (not e!441062))))

(declare-fun lt!354070 () array!43150)

(declare-fun lt!354071 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43150 (_ BitVec 32)) SeekEntryResult!8246)

(assert (=> b!794294 (= res!538807 (= (seekEntryOrOpen!0 lt!354071 lt!354070 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354071 lt!354070 mask!3266)))))

(assert (=> b!794294 (= lt!354071 (select (store (arr!20655 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794294 (= lt!354070 (array!43151 (store (arr!20655 a!3170) i!1163 k!2044) (size!21076 a!3170)))))

(declare-fun b!794295 () Bool)

(declare-fun res!538811 () Bool)

(assert (=> b!794295 (=> (not res!538811) (not e!441065))))

(declare-fun arrayContainsKey!0 (array!43150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794295 (= res!538811 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68360 res!538813) b!794289))

(assert (= (and b!794289 res!538809) b!794292))

(assert (= (and b!794292 res!538808) b!794290))

(assert (= (and b!794290 res!538812) b!794295))

(assert (= (and b!794295 res!538811) b!794287))

(assert (= (and b!794287 res!538810) b!794291))

(assert (= (and b!794291 res!538805) b!794288))

(assert (= (and b!794288 res!538806) b!794293))

(assert (= (and b!794293 res!538814) b!794294))

(assert (= (and b!794294 res!538807) b!794286))

(declare-fun m!734813 () Bool)

(assert (=> b!794287 m!734813))

(declare-fun m!734815 () Bool)

(assert (=> b!794295 m!734815))

(declare-fun m!734817 () Bool)

(assert (=> b!794288 m!734817))

(declare-fun m!734819 () Bool)

(assert (=> b!794290 m!734819))

(declare-fun m!734821 () Bool)

(assert (=> b!794291 m!734821))

(declare-fun m!734823 () Bool)

(assert (=> b!794292 m!734823))

(assert (=> b!794292 m!734823))

(declare-fun m!734825 () Bool)

(assert (=> b!794292 m!734825))

(declare-fun m!734827 () Bool)

(assert (=> b!794294 m!734827))

(declare-fun m!734829 () Bool)

(assert (=> b!794294 m!734829))

(declare-fun m!734831 () Bool)

(assert (=> b!794294 m!734831))

(declare-fun m!734833 () Bool)

(assert (=> b!794294 m!734833))

(declare-fun m!734835 () Bool)

(assert (=> start!68360 m!734835))

(declare-fun m!734837 () Bool)

(assert (=> start!68360 m!734837))

(declare-fun m!734839 () Bool)

(assert (=> b!794293 m!734839))

(declare-fun m!734841 () Bool)

(assert (=> b!794293 m!734841))

(push 1)

(assert (not start!68360))

(assert (not b!794288))

(assert (not b!794287))

(assert (not b!794292))

(assert (not b!794294))

(assert (not b!794295))

(assert (not b!794290))

(assert (not b!794291))

(check-sat)

(pop 1)

(push 1)

(check-sat)

