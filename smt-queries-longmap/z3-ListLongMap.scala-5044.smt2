; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68942 () Bool)

(assert start!68942)

(declare-fun b!802308 () Bool)

(declare-fun res!546283 () Bool)

(declare-fun e!444816 () Bool)

(assert (=> b!802308 (=> (not res!546283) (not e!444816))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!802308 (= res!546283 (validKeyInArray!0 k0!2044))))

(declare-fun b!802309 () Bool)

(declare-fun res!546281 () Bool)

(assert (=> b!802309 (=> (not res!546281) (not e!444816))))

(declare-datatypes ((array!43564 0))(
  ( (array!43565 (arr!20857 (Array (_ BitVec 32) (_ BitVec 64))) (size!21277 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43564)

(declare-fun arrayContainsKey!0 (array!43564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!802309 (= res!546281 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!802310 () Bool)

(declare-fun res!546284 () Bool)

(declare-fun e!444820 () Bool)

(assert (=> b!802310 (=> (not res!546284) (not e!444820))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358569 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358574 () (_ BitVec 64))

(declare-fun lt!358571 () array!43564)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8404 0))(
  ( (MissingZero!8404 (index!35984 (_ BitVec 32))) (Found!8404 (index!35985 (_ BitVec 32))) (Intermediate!8404 (undefined!9216 Bool) (index!35986 (_ BitVec 32)) (x!67008 (_ BitVec 32))) (Undefined!8404) (MissingVacant!8404 (index!35987 (_ BitVec 32))) )
))
(declare-fun lt!358570 () SeekEntryResult!8404)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43564 (_ BitVec 32)) SeekEntryResult!8404)

(assert (=> b!802310 (= res!546284 (= lt!358570 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358569 vacantAfter!23 lt!358574 lt!358571 mask!3266)))))

(declare-fun b!802311 () Bool)

(declare-fun res!546286 () Bool)

(declare-fun e!444817 () Bool)

(assert (=> b!802311 (=> (not res!546286) (not e!444817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43564 (_ BitVec 32)) Bool)

(assert (=> b!802311 (= res!546286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!802312 () Bool)

(declare-fun res!546285 () Bool)

(assert (=> b!802312 (=> (not res!546285) (not e!444817))))

(declare-datatypes ((List!14727 0))(
  ( (Nil!14724) (Cons!14723 (h!15858 (_ BitVec 64)) (t!21034 List!14727)) )
))
(declare-fun arrayNoDuplicates!0 (array!43564 (_ BitVec 32) List!14727) Bool)

(assert (=> b!802312 (= res!546285 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14724))))

(declare-fun b!802313 () Bool)

(declare-fun e!444819 () Bool)

(assert (=> b!802313 (= e!444819 e!444820)))

(declare-fun res!546287 () Bool)

(assert (=> b!802313 (=> (not res!546287) (not e!444820))))

(assert (=> b!802313 (= res!546287 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358569 #b00000000000000000000000000000000) (bvslt lt!358569 (size!21277 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!802313 (= lt!358569 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!802314 () Bool)

(declare-fun e!444815 () Bool)

(assert (=> b!802314 (= e!444817 e!444815)))

(declare-fun res!546291 () Bool)

(assert (=> b!802314 (=> (not res!546291) (not e!444815))))

(assert (=> b!802314 (= res!546291 (= lt!358570 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358574 lt!358571 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43564 (_ BitVec 32)) SeekEntryResult!8404)

(assert (=> b!802314 (= lt!358570 (seekEntryOrOpen!0 lt!358574 lt!358571 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!802314 (= lt!358574 (select (store (arr!20857 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!802314 (= lt!358571 (array!43565 (store (arr!20857 a!3170) i!1163 k0!2044) (size!21277 a!3170)))))

(declare-fun b!802315 () Bool)

(assert (=> b!802315 (= e!444816 e!444817)))

(declare-fun res!546289 () Bool)

(assert (=> b!802315 (=> (not res!546289) (not e!444817))))

(declare-fun lt!358567 () SeekEntryResult!8404)

(assert (=> b!802315 (= res!546289 (or (= lt!358567 (MissingZero!8404 i!1163)) (= lt!358567 (MissingVacant!8404 i!1163))))))

(assert (=> b!802315 (= lt!358567 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!546279 () Bool)

(assert (=> start!68942 (=> (not res!546279) (not e!444816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68942 (= res!546279 (validMask!0 mask!3266))))

(assert (=> start!68942 e!444816))

(assert (=> start!68942 true))

(declare-fun array_inv!16716 (array!43564) Bool)

(assert (=> start!68942 (array_inv!16716 a!3170)))

(declare-fun b!802316 () Bool)

(declare-fun res!546290 () Bool)

(assert (=> b!802316 (=> (not res!546290) (not e!444816))))

(assert (=> b!802316 (= res!546290 (validKeyInArray!0 (select (arr!20857 a!3170) j!153)))))

(declare-fun b!802317 () Bool)

(declare-fun res!546288 () Bool)

(assert (=> b!802317 (=> (not res!546288) (not e!444817))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!802317 (= res!546288 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21277 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20857 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21277 a!3170)) (= (select (arr!20857 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!802318 () Bool)

(assert (=> b!802318 (= e!444815 e!444819)))

(declare-fun res!546280 () Bool)

(assert (=> b!802318 (=> (not res!546280) (not e!444819))))

(declare-fun lt!358568 () SeekEntryResult!8404)

(declare-fun lt!358573 () SeekEntryResult!8404)

(assert (=> b!802318 (= res!546280 (and (= lt!358573 lt!358568) (= lt!358568 (Found!8404 j!153)) (not (= (select (arr!20857 a!3170) index!1236) (select (arr!20857 a!3170) j!153)))))))

(assert (=> b!802318 (= lt!358568 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20857 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!802318 (= lt!358573 (seekEntryOrOpen!0 (select (arr!20857 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!802319 () Bool)

(declare-fun res!546282 () Bool)

(assert (=> b!802319 (=> (not res!546282) (not e!444816))))

(assert (=> b!802319 (= res!546282 (and (= (size!21277 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21277 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21277 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!802320 () Bool)

(assert (=> b!802320 (= e!444820 false)))

(declare-fun lt!358572 () SeekEntryResult!8404)

(assert (=> b!802320 (= lt!358572 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358569 vacantBefore!23 (select (arr!20857 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68942 res!546279) b!802319))

(assert (= (and b!802319 res!546282) b!802316))

(assert (= (and b!802316 res!546290) b!802308))

(assert (= (and b!802308 res!546283) b!802309))

(assert (= (and b!802309 res!546281) b!802315))

(assert (= (and b!802315 res!546289) b!802311))

(assert (= (and b!802311 res!546286) b!802312))

(assert (= (and b!802312 res!546285) b!802317))

(assert (= (and b!802317 res!546288) b!802314))

(assert (= (and b!802314 res!546291) b!802318))

(assert (= (and b!802318 res!546280) b!802313))

(assert (= (and b!802313 res!546287) b!802310))

(assert (= (and b!802310 res!546284) b!802320))

(declare-fun m!743839 () Bool)

(assert (=> b!802317 m!743839))

(declare-fun m!743841 () Bool)

(assert (=> b!802317 m!743841))

(declare-fun m!743843 () Bool)

(assert (=> b!802318 m!743843))

(declare-fun m!743845 () Bool)

(assert (=> b!802318 m!743845))

(assert (=> b!802318 m!743845))

(declare-fun m!743847 () Bool)

(assert (=> b!802318 m!743847))

(assert (=> b!802318 m!743845))

(declare-fun m!743849 () Bool)

(assert (=> b!802318 m!743849))

(declare-fun m!743851 () Bool)

(assert (=> b!802311 m!743851))

(declare-fun m!743853 () Bool)

(assert (=> b!802315 m!743853))

(declare-fun m!743855 () Bool)

(assert (=> b!802313 m!743855))

(assert (=> b!802320 m!743845))

(assert (=> b!802320 m!743845))

(declare-fun m!743857 () Bool)

(assert (=> b!802320 m!743857))

(declare-fun m!743859 () Bool)

(assert (=> b!802309 m!743859))

(declare-fun m!743861 () Bool)

(assert (=> b!802308 m!743861))

(declare-fun m!743863 () Bool)

(assert (=> start!68942 m!743863))

(declare-fun m!743865 () Bool)

(assert (=> start!68942 m!743865))

(declare-fun m!743867 () Bool)

(assert (=> b!802314 m!743867))

(declare-fun m!743869 () Bool)

(assert (=> b!802314 m!743869))

(declare-fun m!743871 () Bool)

(assert (=> b!802314 m!743871))

(declare-fun m!743873 () Bool)

(assert (=> b!802314 m!743873))

(assert (=> b!802316 m!743845))

(assert (=> b!802316 m!743845))

(declare-fun m!743875 () Bool)

(assert (=> b!802316 m!743875))

(declare-fun m!743877 () Bool)

(assert (=> b!802310 m!743877))

(declare-fun m!743879 () Bool)

(assert (=> b!802312 m!743879))

(check-sat (not b!802316) (not b!802310) (not b!802318) (not b!802320) (not b!802313) (not b!802309) (not b!802314) (not start!68942) (not b!802312) (not b!802311) (not b!802308) (not b!802315))
(check-sat)
