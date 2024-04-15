; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68658 () Bool)

(assert start!68658)

(declare-fun res!543969 () Bool)

(declare-fun e!443228 () Bool)

(assert (=> start!68658 (=> (not res!543969) (not e!443228))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68658 (= res!543969 (validMask!0 mask!3266))))

(assert (=> start!68658 e!443228))

(assert (=> start!68658 true))

(declare-datatypes ((array!43465 0))(
  ( (array!43466 (arr!20813 (Array (_ BitVec 32) (_ BitVec 64))) (size!21234 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43465)

(declare-fun array_inv!16696 (array!43465) Bool)

(assert (=> start!68658 (array_inv!16696 a!3170)))

(declare-fun b!799298 () Bool)

(declare-fun e!443230 () Bool)

(declare-fun e!443226 () Bool)

(assert (=> b!799298 (= e!443230 e!443226)))

(declare-fun res!543962 () Bool)

(assert (=> b!799298 (=> (not res!543962) (not e!443226))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356818 () array!43465)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!356819 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8401 0))(
  ( (MissingZero!8401 (index!35972 (_ BitVec 32))) (Found!8401 (index!35973 (_ BitVec 32))) (Intermediate!8401 (undefined!9213 Bool) (index!35974 (_ BitVec 32)) (x!66858 (_ BitVec 32))) (Undefined!8401) (MissingVacant!8401 (index!35975 (_ BitVec 32))) )
))
(declare-fun lt!356821 () SeekEntryResult!8401)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43465 (_ BitVec 32)) SeekEntryResult!8401)

(assert (=> b!799298 (= res!543962 (= lt!356821 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356819 lt!356818 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43465 (_ BitVec 32)) SeekEntryResult!8401)

(assert (=> b!799298 (= lt!356821 (seekEntryOrOpen!0 lt!356819 lt!356818 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799298 (= lt!356819 (select (store (arr!20813 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799298 (= lt!356818 (array!43466 (store (arr!20813 a!3170) i!1163 k0!2044) (size!21234 a!3170)))))

(declare-fun b!799299 () Bool)

(declare-fun res!543959 () Bool)

(assert (=> b!799299 (=> (not res!543959) (not e!443228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799299 (= res!543959 (validKeyInArray!0 (select (arr!20813 a!3170) j!153)))))

(declare-fun b!799300 () Bool)

(declare-fun res!543964 () Bool)

(declare-fun e!443229 () Bool)

(assert (=> b!799300 (=> (not res!543964) (not e!443229))))

(declare-fun lt!356820 () (_ BitVec 32))

(assert (=> b!799300 (= res!543964 (= lt!356821 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356820 vacantAfter!23 lt!356819 lt!356818 mask!3266)))))

(declare-fun b!799301 () Bool)

(declare-fun res!543965 () Bool)

(assert (=> b!799301 (=> (not res!543965) (not e!443230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43465 (_ BitVec 32)) Bool)

(assert (=> b!799301 (= res!543965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799302 () Bool)

(declare-fun e!443225 () Bool)

(assert (=> b!799302 (= e!443226 e!443225)))

(declare-fun res!543958 () Bool)

(assert (=> b!799302 (=> (not res!543958) (not e!443225))))

(declare-fun lt!356822 () SeekEntryResult!8401)

(declare-fun lt!356823 () SeekEntryResult!8401)

(assert (=> b!799302 (= res!543958 (and (= lt!356823 lt!356822) (= lt!356822 (Found!8401 j!153)) (not (= (select (arr!20813 a!3170) index!1236) (select (arr!20813 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799302 (= lt!356822 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20813 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799302 (= lt!356823 (seekEntryOrOpen!0 (select (arr!20813 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799303 () Bool)

(declare-fun res!543968 () Bool)

(assert (=> b!799303 (=> (not res!543968) (not e!443230))))

(assert (=> b!799303 (= res!543968 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21234 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20813 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21234 a!3170)) (= (select (arr!20813 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799304 () Bool)

(declare-fun res!543963 () Bool)

(assert (=> b!799304 (=> (not res!543963) (not e!443228))))

(assert (=> b!799304 (= res!543963 (validKeyInArray!0 k0!2044))))

(declare-fun b!799305 () Bool)

(assert (=> b!799305 (= e!443228 e!443230)))

(declare-fun res!543960 () Bool)

(assert (=> b!799305 (=> (not res!543960) (not e!443230))))

(declare-fun lt!356824 () SeekEntryResult!8401)

(assert (=> b!799305 (= res!543960 (or (= lt!356824 (MissingZero!8401 i!1163)) (= lt!356824 (MissingVacant!8401 i!1163))))))

(assert (=> b!799305 (= lt!356824 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799306 () Bool)

(assert (=> b!799306 (= e!443229 false)))

(declare-fun lt!356825 () SeekEntryResult!8401)

(assert (=> b!799306 (= lt!356825 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356820 vacantBefore!23 (select (arr!20813 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799307 () Bool)

(declare-fun res!543961 () Bool)

(assert (=> b!799307 (=> (not res!543961) (not e!443228))))

(assert (=> b!799307 (= res!543961 (and (= (size!21234 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21234 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21234 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799308 () Bool)

(declare-fun res!543966 () Bool)

(assert (=> b!799308 (=> (not res!543966) (not e!443230))))

(declare-datatypes ((List!14815 0))(
  ( (Nil!14812) (Cons!14811 (h!15940 (_ BitVec 64)) (t!21121 List!14815)) )
))
(declare-fun arrayNoDuplicates!0 (array!43465 (_ BitVec 32) List!14815) Bool)

(assert (=> b!799308 (= res!543966 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14812))))

(declare-fun b!799309 () Bool)

(declare-fun res!543967 () Bool)

(assert (=> b!799309 (=> (not res!543967) (not e!443228))))

(declare-fun arrayContainsKey!0 (array!43465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799309 (= res!543967 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799310 () Bool)

(assert (=> b!799310 (= e!443225 e!443229)))

(declare-fun res!543957 () Bool)

(assert (=> b!799310 (=> (not res!543957) (not e!443229))))

(assert (=> b!799310 (= res!543957 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356820 #b00000000000000000000000000000000) (bvslt lt!356820 (size!21234 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799310 (= lt!356820 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68658 res!543969) b!799307))

(assert (= (and b!799307 res!543961) b!799299))

(assert (= (and b!799299 res!543959) b!799304))

(assert (= (and b!799304 res!543963) b!799309))

(assert (= (and b!799309 res!543967) b!799305))

(assert (= (and b!799305 res!543960) b!799301))

(assert (= (and b!799301 res!543965) b!799308))

(assert (= (and b!799308 res!543966) b!799303))

(assert (= (and b!799303 res!543968) b!799298))

(assert (= (and b!799298 res!543962) b!799302))

(assert (= (and b!799302 res!543958) b!799310))

(assert (= (and b!799310 res!543957) b!799300))

(assert (= (and b!799300 res!543964) b!799306))

(declare-fun m!739825 () Bool)

(assert (=> b!799304 m!739825))

(declare-fun m!739827 () Bool)

(assert (=> start!68658 m!739827))

(declare-fun m!739829 () Bool)

(assert (=> start!68658 m!739829))

(declare-fun m!739831 () Bool)

(assert (=> b!799302 m!739831))

(declare-fun m!739833 () Bool)

(assert (=> b!799302 m!739833))

(assert (=> b!799302 m!739833))

(declare-fun m!739835 () Bool)

(assert (=> b!799302 m!739835))

(assert (=> b!799302 m!739833))

(declare-fun m!739837 () Bool)

(assert (=> b!799302 m!739837))

(declare-fun m!739839 () Bool)

(assert (=> b!799300 m!739839))

(assert (=> b!799299 m!739833))

(assert (=> b!799299 m!739833))

(declare-fun m!739841 () Bool)

(assert (=> b!799299 m!739841))

(declare-fun m!739843 () Bool)

(assert (=> b!799309 m!739843))

(declare-fun m!739845 () Bool)

(assert (=> b!799308 m!739845))

(declare-fun m!739847 () Bool)

(assert (=> b!799298 m!739847))

(declare-fun m!739849 () Bool)

(assert (=> b!799298 m!739849))

(declare-fun m!739851 () Bool)

(assert (=> b!799298 m!739851))

(declare-fun m!739853 () Bool)

(assert (=> b!799298 m!739853))

(assert (=> b!799306 m!739833))

(assert (=> b!799306 m!739833))

(declare-fun m!739855 () Bool)

(assert (=> b!799306 m!739855))

(declare-fun m!739857 () Bool)

(assert (=> b!799305 m!739857))

(declare-fun m!739859 () Bool)

(assert (=> b!799310 m!739859))

(declare-fun m!739861 () Bool)

(assert (=> b!799301 m!739861))

(declare-fun m!739863 () Bool)

(assert (=> b!799303 m!739863))

(declare-fun m!739865 () Bool)

(assert (=> b!799303 m!739865))

(check-sat (not b!799298) (not b!799302) (not b!799308) (not b!799305) (not b!799304) (not b!799306) (not b!799300) (not b!799299) (not b!799309) (not start!68658) (not b!799301) (not b!799310))
(check-sat)
