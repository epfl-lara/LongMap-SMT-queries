; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68330 () Bool)

(assert start!68330)

(declare-fun b!793861 () Bool)

(declare-fun res!538385 () Bool)

(declare-fun e!440907 () Bool)

(assert (=> b!793861 (=> (not res!538385) (not e!440907))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43120 0))(
  ( (array!43121 (arr!20640 (Array (_ BitVec 32) (_ BitVec 64))) (size!21061 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43120)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793861 (= res!538385 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21061 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20640 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21061 a!3170)) (= (select (arr!20640 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!793862 () Bool)

(assert (=> b!793862 (= e!440907 false)))

(declare-fun lt!353887 () (_ BitVec 64))

(declare-fun lt!353884 () array!43120)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8231 0))(
  ( (MissingZero!8231 (index!35292 (_ BitVec 32))) (Found!8231 (index!35293 (_ BitVec 32))) (Intermediate!8231 (undefined!9043 Bool) (index!35294 (_ BitVec 32)) (x!66229 (_ BitVec 32))) (Undefined!8231) (MissingVacant!8231 (index!35295 (_ BitVec 32))) )
))
(declare-fun lt!353885 () SeekEntryResult!8231)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43120 (_ BitVec 32)) SeekEntryResult!8231)

(assert (=> b!793862 (= lt!353885 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!353887 lt!353884 mask!3266))))

(declare-fun lt!353886 () SeekEntryResult!8231)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43120 (_ BitVec 32)) SeekEntryResult!8231)

(assert (=> b!793862 (= lt!353886 (seekEntryOrOpen!0 lt!353887 lt!353884 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!793862 (= lt!353887 (select (store (arr!20640 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!793862 (= lt!353884 (array!43121 (store (arr!20640 a!3170) i!1163 k!2044) (size!21061 a!3170)))))

(declare-fun res!538383 () Bool)

(declare-fun e!440909 () Bool)

(assert (=> start!68330 (=> (not res!538383) (not e!440909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68330 (= res!538383 (validMask!0 mask!3266))))

(assert (=> start!68330 e!440909))

(assert (=> start!68330 true))

(declare-fun array_inv!16436 (array!43120) Bool)

(assert (=> start!68330 (array_inv!16436 a!3170)))

(declare-fun b!793863 () Bool)

(declare-fun res!538380 () Bool)

(assert (=> b!793863 (=> (not res!538380) (not e!440909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793863 (= res!538380 (validKeyInArray!0 k!2044))))

(declare-fun b!793864 () Bool)

(declare-fun res!538382 () Bool)

(assert (=> b!793864 (=> (not res!538382) (not e!440909))))

(assert (=> b!793864 (= res!538382 (validKeyInArray!0 (select (arr!20640 a!3170) j!153)))))

(declare-fun b!793865 () Bool)

(declare-fun res!538384 () Bool)

(assert (=> b!793865 (=> (not res!538384) (not e!440909))))

(declare-fun arrayContainsKey!0 (array!43120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793865 (= res!538384 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793866 () Bool)

(declare-fun res!538387 () Bool)

(assert (=> b!793866 (=> (not res!538387) (not e!440907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43120 (_ BitVec 32)) Bool)

(assert (=> b!793866 (= res!538387 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793867 () Bool)

(declare-fun res!538381 () Bool)

(assert (=> b!793867 (=> (not res!538381) (not e!440909))))

(assert (=> b!793867 (= res!538381 (and (= (size!21061 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21061 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21061 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793868 () Bool)

(declare-fun res!538388 () Bool)

(assert (=> b!793868 (=> (not res!538388) (not e!440907))))

(declare-datatypes ((List!14603 0))(
  ( (Nil!14600) (Cons!14599 (h!15728 (_ BitVec 64)) (t!20918 List!14603)) )
))
(declare-fun arrayNoDuplicates!0 (array!43120 (_ BitVec 32) List!14603) Bool)

(assert (=> b!793868 (= res!538388 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14600))))

(declare-fun b!793869 () Bool)

(assert (=> b!793869 (= e!440909 e!440907)))

(declare-fun res!538386 () Bool)

(assert (=> b!793869 (=> (not res!538386) (not e!440907))))

(declare-fun lt!353888 () SeekEntryResult!8231)

(assert (=> b!793869 (= res!538386 (or (= lt!353888 (MissingZero!8231 i!1163)) (= lt!353888 (MissingVacant!8231 i!1163))))))

(assert (=> b!793869 (= lt!353888 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68330 res!538383) b!793867))

(assert (= (and b!793867 res!538381) b!793864))

(assert (= (and b!793864 res!538382) b!793863))

(assert (= (and b!793863 res!538380) b!793865))

(assert (= (and b!793865 res!538384) b!793869))

(assert (= (and b!793869 res!538386) b!793866))

(assert (= (and b!793866 res!538387) b!793868))

(assert (= (and b!793868 res!538388) b!793861))

(assert (= (and b!793861 res!538385) b!793862))

(declare-fun m!734363 () Bool)

(assert (=> b!793861 m!734363))

(declare-fun m!734365 () Bool)

(assert (=> b!793861 m!734365))

(declare-fun m!734367 () Bool)

(assert (=> b!793865 m!734367))

(declare-fun m!734369 () Bool)

(assert (=> b!793863 m!734369))

(declare-fun m!734371 () Bool)

(assert (=> b!793862 m!734371))

(declare-fun m!734373 () Bool)

(assert (=> b!793862 m!734373))

(declare-fun m!734375 () Bool)

(assert (=> b!793862 m!734375))

(declare-fun m!734377 () Bool)

(assert (=> b!793862 m!734377))

(declare-fun m!734379 () Bool)

(assert (=> start!68330 m!734379))

(declare-fun m!734381 () Bool)

(assert (=> start!68330 m!734381))

(declare-fun m!734383 () Bool)

(assert (=> b!793864 m!734383))

(assert (=> b!793864 m!734383))

(declare-fun m!734385 () Bool)

(assert (=> b!793864 m!734385))

(declare-fun m!734387 () Bool)

(assert (=> b!793866 m!734387))

(declare-fun m!734389 () Bool)

(assert (=> b!793869 m!734389))

(declare-fun m!734391 () Bool)

(assert (=> b!793868 m!734391))

(push 1)

(assert (not b!793864))

(assert (not b!793865))

(assert (not b!793863))

(assert (not b!793866))

(assert (not start!68330))

(assert (not b!793868))

(assert (not b!793869))

(assert (not b!793862))

(check-sat)

(pop 1)

