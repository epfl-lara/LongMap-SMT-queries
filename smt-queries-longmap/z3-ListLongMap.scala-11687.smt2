; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136704 () Bool)

(assert start!136704)

(declare-fun b!1578417 () Bool)

(declare-fun res!1078411 () Bool)

(declare-fun e!880396 () Bool)

(assert (=> b!1578417 (=> (not res!1078411) (not e!880396))))

(declare-fun x!466 () (_ BitVec 32))

(declare-fun vacantSpotIndex!10 () (_ BitVec 32))

(declare-fun mask!918 () (_ BitVec 32))

(declare-fun ee!18 () (_ BitVec 32))

(declare-datatypes ((array!105739 0))(
  ( (array!105740 (arr!50981 (Array (_ BitVec 32) (_ BitVec 64))) (size!51531 (_ BitVec 32))) )
))
(declare-fun _keys!614 () array!105739)

(assert (=> b!1578417 (= res!1078411 (and (bvsge mask!918 #b00000000000000000000000000000000) (= (size!51531 _keys!614) (bvadd #b00000000000000000000000000000001 mask!918)) (bvsge ee!18 #b00000000000000000000000000000000) (bvslt ee!18 (bvadd #b00000000000000000000000000000001 mask!918)) (bvsle x!466 #b01111111111111111111111111111110) (bvsge x!466 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!10 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!10 (bvadd #b00000000000000000000000000000001 mask!918)) (= (select (arr!50981 _keys!614) vacantSpotIndex!10) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578419 () Bool)

(declare-fun res!1078410 () Bool)

(assert (=> b!1578419 (=> (not res!1078410) (not e!880396))))

(declare-fun k0!772 () (_ BitVec 64))

(assert (=> b!1578419 (= res!1078410 (and (bvslt x!466 #b01111111111111111111111111111110) (not (= (select (arr!50981 _keys!614) ee!18) k0!772)) (not (= (select (arr!50981 _keys!614) ee!18) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1578418 () Bool)

(declare-fun res!1078412 () Bool)

(assert (=> b!1578418 (=> (not res!1078412) (not e!880396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578418 (= res!1078412 (validKeyInArray!0 k0!772))))

(declare-datatypes ((SeekEntryResult!13768 0))(
  ( (MissingZero!13768 (index!57470 (_ BitVec 32))) (Found!13768 (index!57471 (_ BitVec 32))) (Intermediate!13768 (undefined!14580 Bool) (index!57472 (_ BitVec 32)) (x!142734 (_ BitVec 32))) (Undefined!13768) (MissingVacant!13768 (index!57473 (_ BitVec 32))) )
))
(declare-fun lt!676258 () SeekEntryResult!13768)

(declare-fun b!1578420 () Bool)

(get-info :version)

(assert (=> b!1578420 (= e!880396 (and (not ((_ is Undefined!13768) lt!676258)) (not ((_ is Found!13768) lt!676258)) ((_ is MissingVacant!13768) lt!676258) (= (index!57473 lt!676258) vacantSpotIndex!10) (or (bvslt (index!57473 lt!676258) #b00000000000000000000000000000000) (bvsge (index!57473 lt!676258) (size!51531 _keys!614)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105739 (_ BitVec 32)) SeekEntryResult!13768)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578420 (= lt!676258 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!466) (nextIndex!0 ee!18 x!466 mask!918) vacantSpotIndex!10 k0!772 _keys!614 mask!918))))

(declare-fun res!1078413 () Bool)

(assert (=> start!136704 (=> (not res!1078413) (not e!880396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136704 (= res!1078413 (validMask!0 mask!918))))

(assert (=> start!136704 e!880396))

(assert (=> start!136704 true))

(declare-fun array_inv!39708 (array!105739) Bool)

(assert (=> start!136704 (array_inv!39708 _keys!614)))

(assert (= (and start!136704 res!1078413) b!1578417))

(assert (= (and b!1578417 res!1078411) b!1578418))

(assert (= (and b!1578418 res!1078412) b!1578419))

(assert (= (and b!1578419 res!1078410) b!1578420))

(declare-fun m!1450509 () Bool)

(assert (=> b!1578417 m!1450509))

(declare-fun m!1450511 () Bool)

(assert (=> start!136704 m!1450511))

(declare-fun m!1450513 () Bool)

(assert (=> start!136704 m!1450513))

(declare-fun m!1450515 () Bool)

(assert (=> b!1578418 m!1450515))

(declare-fun m!1450517 () Bool)

(assert (=> b!1578420 m!1450517))

(assert (=> b!1578420 m!1450517))

(declare-fun m!1450519 () Bool)

(assert (=> b!1578420 m!1450519))

(declare-fun m!1450521 () Bool)

(assert (=> b!1578419 m!1450521))

(check-sat (not b!1578418) (not b!1578420) (not start!136704))
(check-sat)
