; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68866 () Bool)

(assert start!68866)

(declare-fun b!803002 () Bool)

(declare-fun e!444983 () Bool)

(declare-fun e!444981 () Bool)

(assert (=> b!803002 (= e!444983 e!444981)))

(declare-fun res!547524 () Bool)

(assert (=> b!803002 (=> (not res!547524) (not e!444981))))

(declare-datatypes ((SeekEntryResult!8499 0))(
  ( (MissingZero!8499 (index!36364 (_ BitVec 32))) (Found!8499 (index!36365 (_ BitVec 32))) (Intermediate!8499 (undefined!9311 Bool) (index!36366 (_ BitVec 32)) (x!67209 (_ BitVec 32))) (Undefined!8499) (MissingVacant!8499 (index!36367 (_ BitVec 32))) )
))
(declare-fun lt!359265 () SeekEntryResult!8499)

(declare-fun lt!359269 () SeekEntryResult!8499)

(assert (=> b!803002 (= res!547524 (= lt!359265 lt!359269))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!43656 0))(
  ( (array!43657 (arr!20908 (Array (_ BitVec 32) (_ BitVec 64))) (size!21329 (_ BitVec 32))) )
))
(declare-fun lt!359261 () array!43656)

(declare-fun lt!359263 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43656 (_ BitVec 32)) SeekEntryResult!8499)

(assert (=> b!803002 (= lt!359269 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359263 lt!359261 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43656 (_ BitVec 32)) SeekEntryResult!8499)

(assert (=> b!803002 (= lt!359265 (seekEntryOrOpen!0 lt!359263 lt!359261 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43656)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803002 (= lt!359263 (select (store (arr!20908 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803002 (= lt!359261 (array!43657 (store (arr!20908 a!3170) i!1163 k0!2044) (size!21329 a!3170)))))

(declare-fun b!803003 () Bool)

(declare-fun res!547529 () Bool)

(declare-fun e!444984 () Bool)

(assert (=> b!803003 (=> (not res!547529) (not e!444984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803003 (= res!547529 (validKeyInArray!0 k0!2044))))

(declare-fun b!803004 () Bool)

(declare-fun e!444986 () Bool)

(assert (=> b!803004 (= e!444981 e!444986)))

(declare-fun res!547531 () Bool)

(assert (=> b!803004 (=> (not res!547531) (not e!444986))))

(declare-fun lt!359262 () SeekEntryResult!8499)

(declare-fun lt!359270 () SeekEntryResult!8499)

(assert (=> b!803004 (= res!547531 (= lt!359262 lt!359270))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!803004 (= lt!359270 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20908 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803004 (= lt!359262 (seekEntryOrOpen!0 (select (arr!20908 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!547530 () Bool)

(assert (=> start!68866 (=> (not res!547530) (not e!444984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68866 (= res!547530 (validMask!0 mask!3266))))

(assert (=> start!68866 e!444984))

(assert (=> start!68866 true))

(declare-fun array_inv!16704 (array!43656) Bool)

(assert (=> start!68866 (array_inv!16704 a!3170)))

(declare-fun b!803005 () Bool)

(declare-fun res!547527 () Bool)

(assert (=> b!803005 (=> (not res!547527) (not e!444983))))

(assert (=> b!803005 (= res!547527 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21329 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20908 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21329 a!3170)) (= (select (arr!20908 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803006 () Bool)

(assert (=> b!803006 (= e!444984 e!444983)))

(declare-fun res!547525 () Bool)

(assert (=> b!803006 (=> (not res!547525) (not e!444983))))

(declare-fun lt!359268 () SeekEntryResult!8499)

(assert (=> b!803006 (= res!547525 (or (= lt!359268 (MissingZero!8499 i!1163)) (= lt!359268 (MissingVacant!8499 i!1163))))))

(assert (=> b!803006 (= lt!359268 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803007 () Bool)

(declare-fun res!547522 () Bool)

(assert (=> b!803007 (=> (not res!547522) (not e!444983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43656 (_ BitVec 32)) Bool)

(assert (=> b!803007 (= res!547522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803008 () Bool)

(declare-fun lt!359266 () SeekEntryResult!8499)

(declare-fun e!444985 () Bool)

(assert (=> b!803008 (= e!444985 (not (or (not (= lt!359269 lt!359266)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun lt!359264 () (_ BitVec 32))

(assert (=> b!803008 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359264 vacantAfter!23 lt!359263 lt!359261 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359264 vacantBefore!23 (select (arr!20908 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27538 0))(
  ( (Unit!27539) )
))
(declare-fun lt!359267 () Unit!27538)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43656 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27538)

(assert (=> b!803008 (= lt!359267 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359264 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803008 (= lt!359264 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803009 () Bool)

(declare-fun res!547521 () Bool)

(assert (=> b!803009 (=> (not res!547521) (not e!444984))))

(assert (=> b!803009 (= res!547521 (and (= (size!21329 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21329 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21329 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803010 () Bool)

(declare-fun res!547532 () Bool)

(assert (=> b!803010 (=> (not res!547532) (not e!444983))))

(declare-datatypes ((List!14871 0))(
  ( (Nil!14868) (Cons!14867 (h!15996 (_ BitVec 64)) (t!21186 List!14871)) )
))
(declare-fun arrayNoDuplicates!0 (array!43656 (_ BitVec 32) List!14871) Bool)

(assert (=> b!803010 (= res!547532 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14868))))

(declare-fun b!803011 () Bool)

(declare-fun res!547528 () Bool)

(assert (=> b!803011 (=> (not res!547528) (not e!444984))))

(assert (=> b!803011 (= res!547528 (validKeyInArray!0 (select (arr!20908 a!3170) j!153)))))

(declare-fun b!803012 () Bool)

(declare-fun res!547523 () Bool)

(assert (=> b!803012 (=> (not res!547523) (not e!444984))))

(declare-fun arrayContainsKey!0 (array!43656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803012 (= res!547523 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803013 () Bool)

(assert (=> b!803013 (= e!444986 e!444985)))

(declare-fun res!547526 () Bool)

(assert (=> b!803013 (=> (not res!547526) (not e!444985))))

(assert (=> b!803013 (= res!547526 (and (= lt!359270 lt!359266) (not (= (select (arr!20908 a!3170) index!1236) (select (arr!20908 a!3170) j!153)))))))

(assert (=> b!803013 (= lt!359266 (Found!8499 j!153))))

(assert (= (and start!68866 res!547530) b!803009))

(assert (= (and b!803009 res!547521) b!803011))

(assert (= (and b!803011 res!547528) b!803003))

(assert (= (and b!803003 res!547529) b!803012))

(assert (= (and b!803012 res!547523) b!803006))

(assert (= (and b!803006 res!547525) b!803007))

(assert (= (and b!803007 res!547522) b!803010))

(assert (= (and b!803010 res!547532) b!803005))

(assert (= (and b!803005 res!547527) b!803002))

(assert (= (and b!803002 res!547524) b!803004))

(assert (= (and b!803004 res!547531) b!803013))

(assert (= (and b!803013 res!547526) b!803008))

(declare-fun m!744613 () Bool)

(assert (=> b!803006 m!744613))

(declare-fun m!744615 () Bool)

(assert (=> b!803010 m!744615))

(declare-fun m!744617 () Bool)

(assert (=> b!803002 m!744617))

(declare-fun m!744619 () Bool)

(assert (=> b!803002 m!744619))

(declare-fun m!744621 () Bool)

(assert (=> b!803002 m!744621))

(declare-fun m!744623 () Bool)

(assert (=> b!803002 m!744623))

(declare-fun m!744625 () Bool)

(assert (=> b!803007 m!744625))

(declare-fun m!744627 () Bool)

(assert (=> b!803005 m!744627))

(declare-fun m!744629 () Bool)

(assert (=> b!803005 m!744629))

(declare-fun m!744631 () Bool)

(assert (=> b!803013 m!744631))

(declare-fun m!744633 () Bool)

(assert (=> b!803013 m!744633))

(declare-fun m!744635 () Bool)

(assert (=> start!68866 m!744635))

(declare-fun m!744637 () Bool)

(assert (=> start!68866 m!744637))

(declare-fun m!744639 () Bool)

(assert (=> b!803003 m!744639))

(declare-fun m!744641 () Bool)

(assert (=> b!803012 m!744641))

(assert (=> b!803011 m!744633))

(assert (=> b!803011 m!744633))

(declare-fun m!744643 () Bool)

(assert (=> b!803011 m!744643))

(assert (=> b!803008 m!744633))

(declare-fun m!744645 () Bool)

(assert (=> b!803008 m!744645))

(declare-fun m!744647 () Bool)

(assert (=> b!803008 m!744647))

(declare-fun m!744649 () Bool)

(assert (=> b!803008 m!744649))

(assert (=> b!803008 m!744633))

(declare-fun m!744651 () Bool)

(assert (=> b!803008 m!744651))

(assert (=> b!803004 m!744633))

(assert (=> b!803004 m!744633))

(declare-fun m!744653 () Bool)

(assert (=> b!803004 m!744653))

(assert (=> b!803004 m!744633))

(declare-fun m!744655 () Bool)

(assert (=> b!803004 m!744655))

(check-sat (not b!803012) (not b!803010) (not b!803004) (not b!803007) (not b!803008) (not b!803011) (not b!803006) (not b!803003) (not start!68866) (not b!803002))
(check-sat)
