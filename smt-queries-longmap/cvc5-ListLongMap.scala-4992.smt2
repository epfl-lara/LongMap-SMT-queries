; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68446 () Bool)

(assert start!68446)

(declare-datatypes ((SeekEntryResult!8295 0))(
  ( (MissingZero!8295 (index!35548 (_ BitVec 32))) (Found!8295 (index!35549 (_ BitVec 32))) (Intermediate!8295 (undefined!9107 Bool) (index!35550 (_ BitVec 32)) (x!66464 (_ BitVec 32))) (Undefined!8295) (MissingVacant!8295 (index!35551 (_ BitVec 32))) )
))
(declare-fun lt!354559 () SeekEntryResult!8295)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43253 0))(
  ( (array!43254 (arr!20707 (Array (_ BitVec 32) (_ BitVec 64))) (size!21128 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43253)

(declare-fun lt!354558 () SeekEntryResult!8295)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun e!441527 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun b!795635 () Bool)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!795635 (= e!441527 (and (= lt!354558 lt!354559) (= lt!354559 (Found!8295 j!153)) (= (select (arr!20707 a!3170) index!1236) (select (arr!20707 a!3170) j!153)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20707 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43253 (_ BitVec 32)) SeekEntryResult!8295)

(assert (=> b!795635 (= lt!354559 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20707 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43253 (_ BitVec 32)) SeekEntryResult!8295)

(assert (=> b!795635 (= lt!354558 (seekEntryOrOpen!0 (select (arr!20707 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!795636 () Bool)

(declare-fun res!540303 () Bool)

(declare-fun e!441529 () Bool)

(assert (=> b!795636 (=> (not res!540303) (not e!441529))))

(assert (=> b!795636 (= res!540303 (and (= (size!21128 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21128 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21128 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795637 () Bool)

(declare-fun res!540294 () Bool)

(assert (=> b!795637 (=> (not res!540294) (not e!441529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795637 (= res!540294 (validKeyInArray!0 k!2044))))

(declare-fun b!795638 () Bool)

(declare-fun res!540297 () Bool)

(assert (=> b!795638 (=> (not res!540297) (not e!441529))))

(declare-fun arrayContainsKey!0 (array!43253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795638 (= res!540297 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795639 () Bool)

(declare-fun res!540302 () Bool)

(declare-fun e!441528 () Bool)

(assert (=> b!795639 (=> (not res!540302) (not e!441528))))

(declare-datatypes ((List!14709 0))(
  ( (Nil!14706) (Cons!14705 (h!15834 (_ BitVec 64)) (t!21015 List!14709)) )
))
(declare-fun arrayNoDuplicates!0 (array!43253 (_ BitVec 32) List!14709) Bool)

(assert (=> b!795639 (= res!540302 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14706))))

(declare-fun b!795640 () Bool)

(assert (=> b!795640 (= e!441529 e!441528)))

(declare-fun res!540300 () Bool)

(assert (=> b!795640 (=> (not res!540300) (not e!441528))))

(declare-fun lt!354556 () SeekEntryResult!8295)

(assert (=> b!795640 (= res!540300 (or (= lt!354556 (MissingZero!8295 i!1163)) (= lt!354556 (MissingVacant!8295 i!1163))))))

(assert (=> b!795640 (= lt!354556 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795641 () Bool)

(declare-fun res!540295 () Bool)

(assert (=> b!795641 (=> (not res!540295) (not e!441529))))

(assert (=> b!795641 (= res!540295 (validKeyInArray!0 (select (arr!20707 a!3170) j!153)))))

(declare-fun b!795643 () Bool)

(assert (=> b!795643 (= e!441528 e!441527)))

(declare-fun res!540301 () Bool)

(assert (=> b!795643 (=> (not res!540301) (not e!441527))))

(declare-fun lt!354557 () array!43253)

(declare-fun lt!354560 () (_ BitVec 64))

(assert (=> b!795643 (= res!540301 (= (seekEntryOrOpen!0 lt!354560 lt!354557 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354560 lt!354557 mask!3266)))))

(assert (=> b!795643 (= lt!354560 (select (store (arr!20707 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795643 (= lt!354557 (array!43254 (store (arr!20707 a!3170) i!1163 k!2044) (size!21128 a!3170)))))

(declare-fun b!795644 () Bool)

(declare-fun res!540296 () Bool)

(assert (=> b!795644 (=> (not res!540296) (not e!441528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43253 (_ BitVec 32)) Bool)

(assert (=> b!795644 (= res!540296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795642 () Bool)

(declare-fun res!540299 () Bool)

(assert (=> b!795642 (=> (not res!540299) (not e!441528))))

(assert (=> b!795642 (= res!540299 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21128 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20707 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21128 a!3170)) (= (select (arr!20707 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!540298 () Bool)

(assert (=> start!68446 (=> (not res!540298) (not e!441529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68446 (= res!540298 (validMask!0 mask!3266))))

(assert (=> start!68446 e!441529))

(assert (=> start!68446 true))

(declare-fun array_inv!16590 (array!43253) Bool)

(assert (=> start!68446 (array_inv!16590 a!3170)))

(assert (= (and start!68446 res!540298) b!795636))

(assert (= (and b!795636 res!540303) b!795641))

(assert (= (and b!795641 res!540295) b!795637))

(assert (= (and b!795637 res!540294) b!795638))

(assert (= (and b!795638 res!540297) b!795640))

(assert (= (and b!795640 res!540300) b!795644))

(assert (= (and b!795644 res!540296) b!795639))

(assert (= (and b!795639 res!540302) b!795642))

(assert (= (and b!795642 res!540299) b!795643))

(assert (= (and b!795643 res!540301) b!795635))

(declare-fun m!735863 () Bool)

(assert (=> b!795639 m!735863))

(declare-fun m!735865 () Bool)

(assert (=> b!795638 m!735865))

(declare-fun m!735867 () Bool)

(assert (=> b!795635 m!735867))

(declare-fun m!735869 () Bool)

(assert (=> b!795635 m!735869))

(declare-fun m!735871 () Bool)

(assert (=> b!795635 m!735871))

(assert (=> b!795635 m!735867))

(declare-fun m!735873 () Bool)

(assert (=> b!795635 m!735873))

(assert (=> b!795635 m!735867))

(declare-fun m!735875 () Bool)

(assert (=> b!795635 m!735875))

(declare-fun m!735877 () Bool)

(assert (=> b!795635 m!735877))

(assert (=> b!795641 m!735867))

(assert (=> b!795641 m!735867))

(declare-fun m!735879 () Bool)

(assert (=> b!795641 m!735879))

(declare-fun m!735881 () Bool)

(assert (=> b!795642 m!735881))

(declare-fun m!735883 () Bool)

(assert (=> b!795642 m!735883))

(declare-fun m!735885 () Bool)

(assert (=> b!795643 m!735885))

(declare-fun m!735887 () Bool)

(assert (=> b!795643 m!735887))

(assert (=> b!795643 m!735877))

(declare-fun m!735889 () Bool)

(assert (=> b!795643 m!735889))

(declare-fun m!735891 () Bool)

(assert (=> b!795640 m!735891))

(declare-fun m!735893 () Bool)

(assert (=> b!795637 m!735893))

(declare-fun m!735895 () Bool)

(assert (=> start!68446 m!735895))

(declare-fun m!735897 () Bool)

(assert (=> start!68446 m!735897))

(declare-fun m!735899 () Bool)

(assert (=> b!795644 m!735899))

(push 1)

(assert (not start!68446))

(assert (not b!795637))

(assert (not b!795643))

(assert (not b!795635))

(assert (not b!795641))

(assert (not b!795640))

(assert (not b!795638))

(assert (not b!795639))

(assert (not b!795644))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

