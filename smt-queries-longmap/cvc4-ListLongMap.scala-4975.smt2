; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68364 () Bool)

(assert start!68364)

(declare-fun b!794346 () Bool)

(declare-fun res!538874 () Bool)

(declare-fun e!441088 () Bool)

(assert (=> b!794346 (=> (not res!538874) (not e!441088))))

(declare-datatypes ((array!43154 0))(
  ( (array!43155 (arr!20657 (Array (_ BitVec 32) (_ BitVec 64))) (size!21078 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43154)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794346 (= res!538874 (validKeyInArray!0 (select (arr!20657 a!3170) j!153)))))

(declare-fun b!794347 () Bool)

(declare-fun e!441087 () Bool)

(assert (=> b!794347 (= e!441088 e!441087)))

(declare-fun res!538871 () Bool)

(assert (=> b!794347 (=> (not res!538871) (not e!441087))))

(declare-datatypes ((SeekEntryResult!8248 0))(
  ( (MissingZero!8248 (index!35360 (_ BitVec 32))) (Found!8248 (index!35361 (_ BitVec 32))) (Intermediate!8248 (undefined!9060 Bool) (index!35362 (_ BitVec 32)) (x!66286 (_ BitVec 32))) (Undefined!8248) (MissingVacant!8248 (index!35363 (_ BitVec 32))) )
))
(declare-fun lt!354087 () SeekEntryResult!8248)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794347 (= res!538871 (or (= lt!354087 (MissingZero!8248 i!1163)) (= lt!354087 (MissingVacant!8248 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43154 (_ BitVec 32)) SeekEntryResult!8248)

(assert (=> b!794347 (= lt!354087 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!794348 () Bool)

(declare-fun res!538870 () Bool)

(assert (=> b!794348 (=> (not res!538870) (not e!441087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43154 (_ BitVec 32)) Bool)

(assert (=> b!794348 (= res!538870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794349 () Bool)

(declare-fun res!538865 () Bool)

(assert (=> b!794349 (=> (not res!538865) (not e!441088))))

(assert (=> b!794349 (= res!538865 (and (= (size!21078 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21078 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21078 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794350 () Bool)

(declare-fun res!538867 () Bool)

(assert (=> b!794350 (=> (not res!538867) (not e!441087))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794350 (= res!538867 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21078 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20657 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21078 a!3170)) (= (select (arr!20657 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794351 () Bool)

(declare-fun res!538872 () Bool)

(assert (=> b!794351 (=> (not res!538872) (not e!441087))))

(declare-datatypes ((List!14620 0))(
  ( (Nil!14617) (Cons!14616 (h!15745 (_ BitVec 64)) (t!20935 List!14620)) )
))
(declare-fun arrayNoDuplicates!0 (array!43154 (_ BitVec 32) List!14620) Bool)

(assert (=> b!794351 (= res!538872 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14617))))

(declare-fun b!794352 () Bool)

(declare-fun res!538868 () Bool)

(assert (=> b!794352 (=> (not res!538868) (not e!441088))))

(assert (=> b!794352 (= res!538868 (validKeyInArray!0 k!2044))))

(declare-fun b!794353 () Bool)

(declare-fun e!441086 () Bool)

(assert (=> b!794353 (= e!441087 e!441086)))

(declare-fun res!538866 () Bool)

(assert (=> b!794353 (=> (not res!538866) (not e!441086))))

(declare-fun lt!354088 () (_ BitVec 64))

(declare-fun lt!354089 () array!43154)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43154 (_ BitVec 32)) SeekEntryResult!8248)

(assert (=> b!794353 (= res!538866 (= (seekEntryOrOpen!0 lt!354088 lt!354089 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354088 lt!354089 mask!3266)))))

(assert (=> b!794353 (= lt!354088 (select (store (arr!20657 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794353 (= lt!354089 (array!43155 (store (arr!20657 a!3170) i!1163 k!2044) (size!21078 a!3170)))))

(declare-fun b!794355 () Bool)

(declare-fun res!538873 () Bool)

(assert (=> b!794355 (=> (not res!538873) (not e!441088))))

(declare-fun arrayContainsKey!0 (array!43154 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794355 (= res!538873 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794354 () Bool)

(assert (=> b!794354 (= e!441086 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun res!538869 () Bool)

(assert (=> start!68364 (=> (not res!538869) (not e!441088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68364 (= res!538869 (validMask!0 mask!3266))))

(assert (=> start!68364 e!441088))

(assert (=> start!68364 true))

(declare-fun array_inv!16453 (array!43154) Bool)

(assert (=> start!68364 (array_inv!16453 a!3170)))

(assert (= (and start!68364 res!538869) b!794349))

(assert (= (and b!794349 res!538865) b!794346))

(assert (= (and b!794346 res!538874) b!794352))

(assert (= (and b!794352 res!538868) b!794355))

(assert (= (and b!794355 res!538873) b!794347))

(assert (= (and b!794347 res!538871) b!794348))

(assert (= (and b!794348 res!538870) b!794351))

(assert (= (and b!794351 res!538872) b!794350))

(assert (= (and b!794350 res!538867) b!794353))

(assert (= (and b!794353 res!538866) b!794354))

(declare-fun m!734873 () Bool)

(assert (=> b!794355 m!734873))

(declare-fun m!734875 () Bool)

(assert (=> b!794351 m!734875))

(declare-fun m!734877 () Bool)

(assert (=> b!794346 m!734877))

(assert (=> b!794346 m!734877))

(declare-fun m!734879 () Bool)

(assert (=> b!794346 m!734879))

(declare-fun m!734881 () Bool)

(assert (=> b!794347 m!734881))

(declare-fun m!734883 () Bool)

(assert (=> b!794352 m!734883))

(declare-fun m!734885 () Bool)

(assert (=> b!794353 m!734885))

(declare-fun m!734887 () Bool)

(assert (=> b!794353 m!734887))

(declare-fun m!734889 () Bool)

(assert (=> b!794353 m!734889))

(declare-fun m!734891 () Bool)

(assert (=> b!794353 m!734891))

(declare-fun m!734893 () Bool)

(assert (=> b!794348 m!734893))

(declare-fun m!734895 () Bool)

(assert (=> b!794350 m!734895))

(declare-fun m!734897 () Bool)

(assert (=> b!794350 m!734897))

(declare-fun m!734899 () Bool)

(assert (=> start!68364 m!734899))

(declare-fun m!734901 () Bool)

(assert (=> start!68364 m!734901))

(push 1)

(assert (not start!68364))

(assert (not b!794346))

(assert (not b!794352))

(assert (not b!794348))

(assert (not b!794355))

(assert (not b!794351))

(assert (not b!794347))

(assert (not b!794353))

(check-sat)

(pop 1)

(push 1)

(check-sat)

