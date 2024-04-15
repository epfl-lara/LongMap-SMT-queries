; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45948 () Bool)

(assert start!45948)

(declare-fun b!508487 () Bool)

(declare-fun res!309477 () Bool)

(declare-fun e!297444 () Bool)

(assert (=> b!508487 (=> (not res!309477) (not e!297444))))

(declare-datatypes ((array!32669 0))(
  ( (array!32670 (arr!15713 (Array (_ BitVec 32) (_ BitVec 64))) (size!16078 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32669)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508487 (= res!309477 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508488 () Bool)

(declare-fun res!309478 () Bool)

(declare-fun e!297447 () Bool)

(assert (=> b!508488 (=> (not res!309478) (not e!297447))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32669 (_ BitVec 32)) Bool)

(assert (=> b!508488 (= res!309478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!508489 () Bool)

(assert (=> b!508489 (= e!297447 (not true))))

(declare-fun lt!232114 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!508489 (= lt!232114 (toIndex!0 (select (arr!15713 a!3235) j!176) mask!3524))))

(declare-fun e!297446 () Bool)

(assert (=> b!508489 e!297446))

(declare-fun res!309481 () Bool)

(assert (=> b!508489 (=> (not res!309481) (not e!297446))))

(assert (=> b!508489 (= res!309481 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15598 0))(
  ( (Unit!15599) )
))
(declare-fun lt!232113 () Unit!15598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15598)

(assert (=> b!508489 (= lt!232113 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508490 () Bool)

(declare-datatypes ((SeekEntryResult!4177 0))(
  ( (MissingZero!4177 (index!18896 (_ BitVec 32))) (Found!4177 (index!18897 (_ BitVec 32))) (Intermediate!4177 (undefined!4989 Bool) (index!18898 (_ BitVec 32)) (x!47885 (_ BitVec 32))) (Undefined!4177) (MissingVacant!4177 (index!18899 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32669 (_ BitVec 32)) SeekEntryResult!4177)

(assert (=> b!508490 (= e!297446 (= (seekEntryOrOpen!0 (select (arr!15713 a!3235) j!176) a!3235 mask!3524) (Found!4177 j!176)))))

(declare-fun res!309482 () Bool)

(assert (=> start!45948 (=> (not res!309482) (not e!297444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45948 (= res!309482 (validMask!0 mask!3524))))

(assert (=> start!45948 e!297444))

(assert (=> start!45948 true))

(declare-fun array_inv!11596 (array!32669) Bool)

(assert (=> start!45948 (array_inv!11596 a!3235)))

(declare-fun b!508491 () Bool)

(declare-fun res!309474 () Bool)

(assert (=> b!508491 (=> (not res!309474) (not e!297447))))

(declare-datatypes ((List!9910 0))(
  ( (Nil!9907) (Cons!9906 (h!10783 (_ BitVec 64)) (t!16129 List!9910)) )
))
(declare-fun arrayNoDuplicates!0 (array!32669 (_ BitVec 32) List!9910) Bool)

(assert (=> b!508491 (= res!309474 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9907))))

(declare-fun b!508492 () Bool)

(declare-fun res!309480 () Bool)

(assert (=> b!508492 (=> (not res!309480) (not e!297444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508492 (= res!309480 (validKeyInArray!0 (select (arr!15713 a!3235) j!176)))))

(declare-fun b!508493 () Bool)

(declare-fun res!309475 () Bool)

(assert (=> b!508493 (=> (not res!309475) (not e!297444))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508493 (= res!309475 (and (= (size!16078 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16078 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16078 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508494 () Bool)

(declare-fun res!309476 () Bool)

(assert (=> b!508494 (=> (not res!309476) (not e!297444))))

(assert (=> b!508494 (= res!309476 (validKeyInArray!0 k0!2280))))

(declare-fun b!508495 () Bool)

(assert (=> b!508495 (= e!297444 e!297447)))

(declare-fun res!309479 () Bool)

(assert (=> b!508495 (=> (not res!309479) (not e!297447))))

(declare-fun lt!232112 () SeekEntryResult!4177)

(assert (=> b!508495 (= res!309479 (or (= lt!232112 (MissingZero!4177 i!1204)) (= lt!232112 (MissingVacant!4177 i!1204))))))

(assert (=> b!508495 (= lt!232112 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45948 res!309482) b!508493))

(assert (= (and b!508493 res!309475) b!508492))

(assert (= (and b!508492 res!309480) b!508494))

(assert (= (and b!508494 res!309476) b!508487))

(assert (= (and b!508487 res!309477) b!508495))

(assert (= (and b!508495 res!309479) b!508488))

(assert (= (and b!508488 res!309478) b!508491))

(assert (= (and b!508491 res!309474) b!508489))

(assert (= (and b!508489 res!309481) b!508490))

(declare-fun m!488749 () Bool)

(assert (=> b!508490 m!488749))

(assert (=> b!508490 m!488749))

(declare-fun m!488751 () Bool)

(assert (=> b!508490 m!488751))

(declare-fun m!488753 () Bool)

(assert (=> b!508488 m!488753))

(declare-fun m!488755 () Bool)

(assert (=> b!508491 m!488755))

(declare-fun m!488757 () Bool)

(assert (=> b!508495 m!488757))

(declare-fun m!488759 () Bool)

(assert (=> b!508487 m!488759))

(assert (=> b!508492 m!488749))

(assert (=> b!508492 m!488749))

(declare-fun m!488761 () Bool)

(assert (=> b!508492 m!488761))

(assert (=> b!508489 m!488749))

(assert (=> b!508489 m!488749))

(declare-fun m!488763 () Bool)

(assert (=> b!508489 m!488763))

(declare-fun m!488765 () Bool)

(assert (=> b!508489 m!488765))

(declare-fun m!488767 () Bool)

(assert (=> b!508489 m!488767))

(declare-fun m!488769 () Bool)

(assert (=> start!45948 m!488769))

(declare-fun m!488771 () Bool)

(assert (=> start!45948 m!488771))

(declare-fun m!488773 () Bool)

(assert (=> b!508494 m!488773))

(check-sat (not b!508491) (not start!45948) (not b!508487) (not b!508489) (not b!508495) (not b!508488) (not b!508492) (not b!508494) (not b!508490))
(check-sat)
