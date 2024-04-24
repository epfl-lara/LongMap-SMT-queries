; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68918 () Bool)

(assert start!68918)

(declare-fun b!801840 () Bool)

(declare-fun e!444604 () Bool)

(assert (=> b!801840 (= e!444604 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43540 0))(
  ( (array!43541 (arr!20845 (Array (_ BitVec 32) (_ BitVec 64))) (size!21265 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43540)

(declare-fun j!153 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8392 0))(
  ( (MissingZero!8392 (index!35936 (_ BitVec 32))) (Found!8392 (index!35937 (_ BitVec 32))) (Intermediate!8392 (undefined!9204 Bool) (index!35938 (_ BitVec 32)) (x!66964 (_ BitVec 32))) (Undefined!8392) (MissingVacant!8392 (index!35939 (_ BitVec 32))) )
))
(declare-fun lt!358285 () SeekEntryResult!8392)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!358286 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43540 (_ BitVec 32)) SeekEntryResult!8392)

(assert (=> b!801840 (= lt!358285 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358286 vacantBefore!23 (select (arr!20845 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801841 () Bool)

(declare-fun res!545819 () Bool)

(declare-fun e!444600 () Bool)

(assert (=> b!801841 (=> (not res!545819) (not e!444600))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801841 (= res!545819 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21265 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20845 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21265 a!3170)) (= (select (arr!20845 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801842 () Bool)

(declare-fun e!444603 () Bool)

(assert (=> b!801842 (= e!444603 e!444600)))

(declare-fun res!545820 () Bool)

(assert (=> b!801842 (=> (not res!545820) (not e!444600))))

(declare-fun lt!358281 () SeekEntryResult!8392)

(assert (=> b!801842 (= res!545820 (or (= lt!358281 (MissingZero!8392 i!1163)) (= lt!358281 (MissingVacant!8392 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43540 (_ BitVec 32)) SeekEntryResult!8392)

(assert (=> b!801842 (= lt!358281 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801843 () Bool)

(declare-fun res!545822 () Bool)

(assert (=> b!801843 (=> (not res!545822) (not e!444603))))

(assert (=> b!801843 (= res!545822 (and (= (size!21265 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21265 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21265 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801844 () Bool)

(declare-fun res!545813 () Bool)

(assert (=> b!801844 (=> (not res!545813) (not e!444600))))

(declare-datatypes ((List!14715 0))(
  ( (Nil!14712) (Cons!14711 (h!15846 (_ BitVec 64)) (t!21022 List!14715)) )
))
(declare-fun arrayNoDuplicates!0 (array!43540 (_ BitVec 32) List!14715) Bool)

(assert (=> b!801844 (= res!545813 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14712))))

(declare-fun b!801845 () Bool)

(declare-fun res!545823 () Bool)

(assert (=> b!801845 (=> (not res!545823) (not e!444600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43540 (_ BitVec 32)) Bool)

(assert (=> b!801845 (= res!545823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!545811 () Bool)

(assert (=> start!68918 (=> (not res!545811) (not e!444603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68918 (= res!545811 (validMask!0 mask!3266))))

(assert (=> start!68918 e!444603))

(assert (=> start!68918 true))

(declare-fun array_inv!16704 (array!43540) Bool)

(assert (=> start!68918 (array_inv!16704 a!3170)))

(declare-fun b!801846 () Bool)

(declare-fun res!545816 () Bool)

(assert (=> b!801846 (=> (not res!545816) (not e!444604))))

(declare-fun lt!358280 () SeekEntryResult!8392)

(declare-fun lt!358279 () array!43540)

(declare-fun lt!358284 () (_ BitVec 64))

(assert (=> b!801846 (= res!545816 (= lt!358280 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358286 vacantAfter!23 lt!358284 lt!358279 mask!3266)))))

(declare-fun b!801847 () Bool)

(declare-fun e!444602 () Bool)

(assert (=> b!801847 (= e!444600 e!444602)))

(declare-fun res!545815 () Bool)

(assert (=> b!801847 (=> (not res!545815) (not e!444602))))

(assert (=> b!801847 (= res!545815 (= lt!358280 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358284 lt!358279 mask!3266)))))

(assert (=> b!801847 (= lt!358280 (seekEntryOrOpen!0 lt!358284 lt!358279 mask!3266))))

(assert (=> b!801847 (= lt!358284 (select (store (arr!20845 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801847 (= lt!358279 (array!43541 (store (arr!20845 a!3170) i!1163 k0!2044) (size!21265 a!3170)))))

(declare-fun b!801848 () Bool)

(declare-fun res!545812 () Bool)

(assert (=> b!801848 (=> (not res!545812) (not e!444603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801848 (= res!545812 (validKeyInArray!0 (select (arr!20845 a!3170) j!153)))))

(declare-fun b!801849 () Bool)

(declare-fun res!545818 () Bool)

(assert (=> b!801849 (=> (not res!545818) (not e!444603))))

(declare-fun arrayContainsKey!0 (array!43540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801849 (= res!545818 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801850 () Bool)

(declare-fun e!444601 () Bool)

(assert (=> b!801850 (= e!444601 e!444604)))

(declare-fun res!545817 () Bool)

(assert (=> b!801850 (=> (not res!545817) (not e!444604))))

(assert (=> b!801850 (= res!545817 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358286 #b00000000000000000000000000000000) (bvslt lt!358286 (size!21265 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801850 (= lt!358286 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!801851 () Bool)

(declare-fun res!545814 () Bool)

(assert (=> b!801851 (=> (not res!545814) (not e!444603))))

(assert (=> b!801851 (= res!545814 (validKeyInArray!0 k0!2044))))

(declare-fun b!801852 () Bool)

(assert (=> b!801852 (= e!444602 e!444601)))

(declare-fun res!545821 () Bool)

(assert (=> b!801852 (=> (not res!545821) (not e!444601))))

(declare-fun lt!358282 () SeekEntryResult!8392)

(declare-fun lt!358283 () SeekEntryResult!8392)

(assert (=> b!801852 (= res!545821 (and (= lt!358282 lt!358283) (= lt!358283 (Found!8392 j!153)) (not (= (select (arr!20845 a!3170) index!1236) (select (arr!20845 a!3170) j!153)))))))

(assert (=> b!801852 (= lt!358283 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20845 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801852 (= lt!358282 (seekEntryOrOpen!0 (select (arr!20845 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68918 res!545811) b!801843))

(assert (= (and b!801843 res!545822) b!801848))

(assert (= (and b!801848 res!545812) b!801851))

(assert (= (and b!801851 res!545814) b!801849))

(assert (= (and b!801849 res!545818) b!801842))

(assert (= (and b!801842 res!545820) b!801845))

(assert (= (and b!801845 res!545823) b!801844))

(assert (= (and b!801844 res!545813) b!801841))

(assert (= (and b!801841 res!545819) b!801847))

(assert (= (and b!801847 res!545815) b!801852))

(assert (= (and b!801852 res!545821) b!801850))

(assert (= (and b!801850 res!545817) b!801846))

(assert (= (and b!801846 res!545816) b!801840))

(declare-fun m!743335 () Bool)

(assert (=> b!801847 m!743335))

(declare-fun m!743337 () Bool)

(assert (=> b!801847 m!743337))

(declare-fun m!743339 () Bool)

(assert (=> b!801847 m!743339))

(declare-fun m!743341 () Bool)

(assert (=> b!801847 m!743341))

(declare-fun m!743343 () Bool)

(assert (=> b!801842 m!743343))

(declare-fun m!743345 () Bool)

(assert (=> b!801846 m!743345))

(declare-fun m!743347 () Bool)

(assert (=> b!801841 m!743347))

(declare-fun m!743349 () Bool)

(assert (=> b!801841 m!743349))

(declare-fun m!743351 () Bool)

(assert (=> b!801848 m!743351))

(assert (=> b!801848 m!743351))

(declare-fun m!743353 () Bool)

(assert (=> b!801848 m!743353))

(declare-fun m!743355 () Bool)

(assert (=> start!68918 m!743355))

(declare-fun m!743357 () Bool)

(assert (=> start!68918 m!743357))

(declare-fun m!743359 () Bool)

(assert (=> b!801845 m!743359))

(assert (=> b!801840 m!743351))

(assert (=> b!801840 m!743351))

(declare-fun m!743361 () Bool)

(assert (=> b!801840 m!743361))

(declare-fun m!743363 () Bool)

(assert (=> b!801850 m!743363))

(declare-fun m!743365 () Bool)

(assert (=> b!801849 m!743365))

(declare-fun m!743367 () Bool)

(assert (=> b!801852 m!743367))

(assert (=> b!801852 m!743351))

(assert (=> b!801852 m!743351))

(declare-fun m!743369 () Bool)

(assert (=> b!801852 m!743369))

(assert (=> b!801852 m!743351))

(declare-fun m!743371 () Bool)

(assert (=> b!801852 m!743371))

(declare-fun m!743373 () Bool)

(assert (=> b!801844 m!743373))

(declare-fun m!743375 () Bool)

(assert (=> b!801851 m!743375))

(check-sat (not b!801840) (not b!801851) (not b!801846) (not b!801845) (not b!801852) (not start!68918) (not b!801850) (not b!801847) (not b!801844) (not b!801842) (not b!801849) (not b!801848))
(check-sat)
