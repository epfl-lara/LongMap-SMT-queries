; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131304 () Bool)

(assert start!131304)

(declare-fun b!1539699 () Bool)

(declare-fun res!1056579 () Bool)

(declare-fun e!856353 () Bool)

(assert (=> b!1539699 (=> (not res!1056579) (not e!856353))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102250 0))(
  ( (array!102251 (arr!49336 (Array (_ BitVec 32) (_ BitVec 64))) (size!49888 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102250)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13487 0))(
  ( (MissingZero!13487 (index!56343 (_ BitVec 32))) (Found!13487 (index!56344 (_ BitVec 32))) (Intermediate!13487 (undefined!14299 Bool) (index!56345 (_ BitVec 32)) (x!138081 (_ BitVec 32))) (Undefined!13487) (MissingVacant!13487 (index!56346 (_ BitVec 32))) )
))
(declare-fun lt!664919 () SeekEntryResult!13487)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun lt!664920 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102250 (_ BitVec 32)) SeekEntryResult!13487)

(assert (=> b!1539699 (= res!1056579 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664920 vacantIndex!5 (select (arr!49336 a!2792) j!64) a!2792 mask!2480) lt!664919))))

(declare-fun b!1539700 () Bool)

(declare-fun res!1056574 () Bool)

(declare-fun e!856352 () Bool)

(assert (=> b!1539700 (=> (not res!1056574) (not e!856352))))

(declare-datatypes ((List!35888 0))(
  ( (Nil!35885) (Cons!35884 (h!37330 (_ BitVec 64)) (t!50574 List!35888)) )
))
(declare-fun arrayNoDuplicates!0 (array!102250 (_ BitVec 32) List!35888) Bool)

(assert (=> b!1539700 (= res!1056574 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35885))))

(declare-fun b!1539701 () Bool)

(declare-fun res!1056573 () Bool)

(declare-fun e!856351 () Bool)

(assert (=> b!1539701 (=> (not res!1056573) (not e!856351))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539701 (= res!1056573 (not (= (select (arr!49336 a!2792) index!463) (select (arr!49336 a!2792) j!64))))))

(declare-fun b!1539702 () Bool)

(assert (=> b!1539702 (= e!856353 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!510)) (bvsub #b01111111111111111111111111111110 x!510)))))

(declare-fun res!1056575 () Bool)

(assert (=> start!131304 (=> (not res!1056575) (not e!856352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131304 (= res!1056575 (validMask!0 mask!2480))))

(assert (=> start!131304 e!856352))

(assert (=> start!131304 true))

(declare-fun array_inv!38569 (array!102250) Bool)

(assert (=> start!131304 (array_inv!38569 a!2792)))

(declare-fun b!1539703 () Bool)

(assert (=> b!1539703 (= e!856352 e!856351)))

(declare-fun res!1056582 () Bool)

(assert (=> b!1539703 (=> (not res!1056582) (not e!856351))))

(assert (=> b!1539703 (= res!1056582 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49336 a!2792) j!64) a!2792 mask!2480) lt!664919))))

(assert (=> b!1539703 (= lt!664919 (Found!13487 j!64))))

(declare-fun b!1539704 () Bool)

(declare-fun res!1056576 () Bool)

(assert (=> b!1539704 (=> (not res!1056576) (not e!856352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539704 (= res!1056576 (validKeyInArray!0 (select (arr!49336 a!2792) j!64)))))

(declare-fun b!1539705 () Bool)

(declare-fun res!1056581 () Bool)

(assert (=> b!1539705 (=> (not res!1056581) (not e!856352))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539705 (= res!1056581 (validKeyInArray!0 (select (arr!49336 a!2792) i!951)))))

(declare-fun b!1539706 () Bool)

(declare-fun res!1056578 () Bool)

(assert (=> b!1539706 (=> (not res!1056578) (not e!856352))))

(assert (=> b!1539706 (= res!1056578 (and (= (size!49888 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49888 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49888 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539707 () Bool)

(declare-fun res!1056583 () Bool)

(assert (=> b!1539707 (=> (not res!1056583) (not e!856352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102250 (_ BitVec 32)) Bool)

(assert (=> b!1539707 (= res!1056583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539708 () Bool)

(declare-fun res!1056580 () Bool)

(assert (=> b!1539708 (=> (not res!1056580) (not e!856352))))

(assert (=> b!1539708 (= res!1056580 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49888 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49888 a!2792)) (= (select (arr!49336 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1539709 () Bool)

(assert (=> b!1539709 (= e!856351 e!856353)))

(declare-fun res!1056577 () Bool)

(assert (=> b!1539709 (=> (not res!1056577) (not e!856353))))

(assert (=> b!1539709 (= res!1056577 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664920 #b00000000000000000000000000000000) (bvslt lt!664920 (size!49888 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539709 (= lt!664920 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!131304 res!1056575) b!1539706))

(assert (= (and b!1539706 res!1056578) b!1539705))

(assert (= (and b!1539705 res!1056581) b!1539704))

(assert (= (and b!1539704 res!1056576) b!1539707))

(assert (= (and b!1539707 res!1056583) b!1539700))

(assert (= (and b!1539700 res!1056574) b!1539708))

(assert (= (and b!1539708 res!1056580) b!1539703))

(assert (= (and b!1539703 res!1056582) b!1539701))

(assert (= (and b!1539701 res!1056573) b!1539709))

(assert (= (and b!1539709 res!1056577) b!1539699))

(assert (= (and b!1539699 res!1056579) b!1539702))

(declare-fun m!1421243 () Bool)

(assert (=> start!131304 m!1421243))

(declare-fun m!1421245 () Bool)

(assert (=> start!131304 m!1421245))

(declare-fun m!1421247 () Bool)

(assert (=> b!1539701 m!1421247))

(declare-fun m!1421249 () Bool)

(assert (=> b!1539701 m!1421249))

(declare-fun m!1421251 () Bool)

(assert (=> b!1539705 m!1421251))

(assert (=> b!1539705 m!1421251))

(declare-fun m!1421253 () Bool)

(assert (=> b!1539705 m!1421253))

(assert (=> b!1539704 m!1421249))

(assert (=> b!1539704 m!1421249))

(declare-fun m!1421255 () Bool)

(assert (=> b!1539704 m!1421255))

(declare-fun m!1421257 () Bool)

(assert (=> b!1539709 m!1421257))

(assert (=> b!1539699 m!1421249))

(assert (=> b!1539699 m!1421249))

(declare-fun m!1421259 () Bool)

(assert (=> b!1539699 m!1421259))

(assert (=> b!1539703 m!1421249))

(assert (=> b!1539703 m!1421249))

(declare-fun m!1421261 () Bool)

(assert (=> b!1539703 m!1421261))

(declare-fun m!1421263 () Bool)

(assert (=> b!1539707 m!1421263))

(declare-fun m!1421265 () Bool)

(assert (=> b!1539700 m!1421265))

(declare-fun m!1421267 () Bool)

(assert (=> b!1539708 m!1421267))

(check-sat (not b!1539704) (not b!1539707) (not b!1539703) (not start!131304) (not b!1539709) (not b!1539700) (not b!1539699) (not b!1539705))
(check-sat)
