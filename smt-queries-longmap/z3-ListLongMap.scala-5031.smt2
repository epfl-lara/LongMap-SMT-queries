; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68698 () Bool)

(assert start!68698)

(declare-fun b!799938 () Bool)

(declare-fun e!443564 () Bool)

(declare-fun e!443559 () Bool)

(assert (=> b!799938 (= e!443564 e!443559)))

(declare-fun res!544463 () Bool)

(assert (=> b!799938 (=> (not res!544463) (not e!443559))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!357301 () (_ BitVec 32))

(declare-datatypes ((array!43488 0))(
  ( (array!43489 (arr!20824 (Array (_ BitVec 32) (_ BitVec 64))) (size!21245 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43488)

(assert (=> b!799938 (= res!544463 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357301 #b00000000000000000000000000000000) (bvslt lt!357301 (size!21245 a!3170))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799938 (= lt!357301 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun res!544467 () Bool)

(declare-fun e!443562 () Bool)

(assert (=> start!68698 (=> (not res!544467) (not e!443562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68698 (= res!544467 (validMask!0 mask!3266))))

(assert (=> start!68698 e!443562))

(assert (=> start!68698 true))

(declare-fun array_inv!16620 (array!43488) Bool)

(assert (=> start!68698 (array_inv!16620 a!3170)))

(declare-fun b!799939 () Bool)

(declare-fun e!443563 () Bool)

(declare-fun e!443560 () Bool)

(assert (=> b!799939 (= e!443563 e!443560)))

(declare-fun res!544466 () Bool)

(assert (=> b!799939 (=> (not res!544466) (not e!443560))))

(declare-fun lt!357304 () array!43488)

(declare-fun lt!357300 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8415 0))(
  ( (MissingZero!8415 (index!36028 (_ BitVec 32))) (Found!8415 (index!36029 (_ BitVec 32))) (Intermediate!8415 (undefined!9227 Bool) (index!36030 (_ BitVec 32)) (x!66901 (_ BitVec 32))) (Undefined!8415) (MissingVacant!8415 (index!36031 (_ BitVec 32))) )
))
(declare-fun lt!357299 () SeekEntryResult!8415)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43488 (_ BitVec 32)) SeekEntryResult!8415)

(assert (=> b!799939 (= res!544466 (= lt!357299 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357300 lt!357304 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43488 (_ BitVec 32)) SeekEntryResult!8415)

(assert (=> b!799939 (= lt!357299 (seekEntryOrOpen!0 lt!357300 lt!357304 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!799939 (= lt!357300 (select (store (arr!20824 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799939 (= lt!357304 (array!43489 (store (arr!20824 a!3170) i!1163 k0!2044) (size!21245 a!3170)))))

(declare-fun b!799940 () Bool)

(assert (=> b!799940 (= e!443559 false)))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun lt!357298 () SeekEntryResult!8415)

(assert (=> b!799940 (= lt!357298 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357301 vacantBefore!23 (select (arr!20824 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799941 () Bool)

(declare-fun res!544464 () Bool)

(assert (=> b!799941 (=> (not res!544464) (not e!443562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799941 (= res!544464 (validKeyInArray!0 (select (arr!20824 a!3170) j!153)))))

(declare-fun b!799942 () Bool)

(declare-fun res!544461 () Bool)

(assert (=> b!799942 (=> (not res!544461) (not e!443563))))

(assert (=> b!799942 (= res!544461 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21245 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20824 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21245 a!3170)) (= (select (arr!20824 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799943 () Bool)

(declare-fun res!544469 () Bool)

(assert (=> b!799943 (=> (not res!544469) (not e!443563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43488 (_ BitVec 32)) Bool)

(assert (=> b!799943 (= res!544469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799944 () Bool)

(declare-fun res!544465 () Bool)

(assert (=> b!799944 (=> (not res!544465) (not e!443559))))

(assert (=> b!799944 (= res!544465 (= lt!357299 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357301 vacantAfter!23 lt!357300 lt!357304 mask!3266)))))

(declare-fun b!799945 () Bool)

(assert (=> b!799945 (= e!443560 e!443564)))

(declare-fun res!544460 () Bool)

(assert (=> b!799945 (=> (not res!544460) (not e!443564))))

(declare-fun lt!357303 () SeekEntryResult!8415)

(declare-fun lt!357305 () SeekEntryResult!8415)

(assert (=> b!799945 (= res!544460 (and (= lt!357305 lt!357303) (= lt!357303 (Found!8415 j!153)) (not (= (select (arr!20824 a!3170) index!1236) (select (arr!20824 a!3170) j!153)))))))

(assert (=> b!799945 (= lt!357303 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20824 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799945 (= lt!357305 (seekEntryOrOpen!0 (select (arr!20824 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799946 () Bool)

(declare-fun res!544458 () Bool)

(assert (=> b!799946 (=> (not res!544458) (not e!443562))))

(assert (=> b!799946 (= res!544458 (validKeyInArray!0 k0!2044))))

(declare-fun b!799947 () Bool)

(declare-fun res!544462 () Bool)

(assert (=> b!799947 (=> (not res!544462) (not e!443563))))

(declare-datatypes ((List!14787 0))(
  ( (Nil!14784) (Cons!14783 (h!15912 (_ BitVec 64)) (t!21102 List!14787)) )
))
(declare-fun arrayNoDuplicates!0 (array!43488 (_ BitVec 32) List!14787) Bool)

(assert (=> b!799947 (= res!544462 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14784))))

(declare-fun b!799948 () Bool)

(assert (=> b!799948 (= e!443562 e!443563)))

(declare-fun res!544459 () Bool)

(assert (=> b!799948 (=> (not res!544459) (not e!443563))))

(declare-fun lt!357302 () SeekEntryResult!8415)

(assert (=> b!799948 (= res!544459 (or (= lt!357302 (MissingZero!8415 i!1163)) (= lt!357302 (MissingVacant!8415 i!1163))))))

(assert (=> b!799948 (= lt!357302 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799949 () Bool)

(declare-fun res!544468 () Bool)

(assert (=> b!799949 (=> (not res!544468) (not e!443562))))

(assert (=> b!799949 (= res!544468 (and (= (size!21245 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21245 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21245 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799950 () Bool)

(declare-fun res!544457 () Bool)

(assert (=> b!799950 (=> (not res!544457) (not e!443562))))

(declare-fun arrayContainsKey!0 (array!43488 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799950 (= res!544457 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!68698 res!544467) b!799949))

(assert (= (and b!799949 res!544468) b!799941))

(assert (= (and b!799941 res!544464) b!799946))

(assert (= (and b!799946 res!544458) b!799950))

(assert (= (and b!799950 res!544457) b!799948))

(assert (= (and b!799948 res!544459) b!799943))

(assert (= (and b!799943 res!544469) b!799947))

(assert (= (and b!799947 res!544462) b!799942))

(assert (= (and b!799942 res!544461) b!799939))

(assert (= (and b!799939 res!544466) b!799945))

(assert (= (and b!799945 res!544460) b!799938))

(assert (= (and b!799938 res!544463) b!799944))

(assert (= (and b!799944 res!544465) b!799940))

(declare-fun m!740987 () Bool)

(assert (=> b!799944 m!740987))

(declare-fun m!740989 () Bool)

(assert (=> b!799941 m!740989))

(assert (=> b!799941 m!740989))

(declare-fun m!740991 () Bool)

(assert (=> b!799941 m!740991))

(declare-fun m!740993 () Bool)

(assert (=> b!799947 m!740993))

(declare-fun m!740995 () Bool)

(assert (=> b!799948 m!740995))

(declare-fun m!740997 () Bool)

(assert (=> b!799943 m!740997))

(declare-fun m!740999 () Bool)

(assert (=> b!799939 m!740999))

(declare-fun m!741001 () Bool)

(assert (=> b!799939 m!741001))

(declare-fun m!741003 () Bool)

(assert (=> b!799939 m!741003))

(declare-fun m!741005 () Bool)

(assert (=> b!799939 m!741005))

(assert (=> b!799940 m!740989))

(assert (=> b!799940 m!740989))

(declare-fun m!741007 () Bool)

(assert (=> b!799940 m!741007))

(declare-fun m!741009 () Bool)

(assert (=> b!799946 m!741009))

(declare-fun m!741011 () Bool)

(assert (=> b!799945 m!741011))

(assert (=> b!799945 m!740989))

(assert (=> b!799945 m!740989))

(declare-fun m!741013 () Bool)

(assert (=> b!799945 m!741013))

(assert (=> b!799945 m!740989))

(declare-fun m!741015 () Bool)

(assert (=> b!799945 m!741015))

(declare-fun m!741017 () Bool)

(assert (=> start!68698 m!741017))

(declare-fun m!741019 () Bool)

(assert (=> start!68698 m!741019))

(declare-fun m!741021 () Bool)

(assert (=> b!799938 m!741021))

(declare-fun m!741023 () Bool)

(assert (=> b!799942 m!741023))

(declare-fun m!741025 () Bool)

(assert (=> b!799942 m!741025))

(declare-fun m!741027 () Bool)

(assert (=> b!799950 m!741027))

(check-sat (not b!799944) (not b!799948) (not b!799943) (not b!799947) (not b!799941) (not start!68698) (not b!799950) (not b!799945) (not b!799938) (not b!799940) (not b!799946) (not b!799939))
(check-sat)
