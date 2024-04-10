; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26738 () Bool)

(assert start!26738)

(declare-fun b!277748 () Bool)

(declare-fun res!141584 () Bool)

(declare-fun e!177178 () Bool)

(assert (=> b!277748 (=> (not res!141584) (not e!177178))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277748 (= res!141584 (validKeyInArray!0 k0!2581))))

(declare-fun b!277749 () Bool)

(declare-fun res!141585 () Bool)

(declare-fun e!177179 () Bool)

(assert (=> b!277749 (=> (not res!141585) (not e!177179))))

(declare-datatypes ((array!13835 0))(
  ( (array!13836 (arr!6567 (Array (_ BitVec 32) (_ BitVec 64))) (size!6919 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13835)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13835 (_ BitVec 32)) Bool)

(assert (=> b!277749 (= res!141585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277750 () Bool)

(assert (=> b!277750 (= e!177178 e!177179)))

(declare-fun res!141586 () Bool)

(assert (=> b!277750 (=> (not res!141586) (not e!177179))))

(declare-datatypes ((SeekEntryResult!1725 0))(
  ( (MissingZero!1725 (index!9070 (_ BitVec 32))) (Found!1725 (index!9071 (_ BitVec 32))) (Intermediate!1725 (undefined!2537 Bool) (index!9072 (_ BitVec 32)) (x!27314 (_ BitVec 32))) (Undefined!1725) (MissingVacant!1725 (index!9073 (_ BitVec 32))) )
))
(declare-fun lt!138043 () SeekEntryResult!1725)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277750 (= res!141586 (or (= lt!138043 (MissingZero!1725 i!1267)) (= lt!138043 (MissingVacant!1725 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13835 (_ BitVec 32)) SeekEntryResult!1725)

(assert (=> b!277750 (= lt!138043 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!277752 () Bool)

(declare-datatypes ((Unit!8776 0))(
  ( (Unit!8777) )
))
(declare-fun e!177182 () Unit!8776)

(declare-fun Unit!8778 () Unit!8776)

(assert (=> b!277752 (= e!177182 Unit!8778)))

(declare-fun b!277753 () Bool)

(declare-fun res!141587 () Bool)

(assert (=> b!277753 (=> (not res!141587) (not e!177178))))

(declare-fun arrayContainsKey!0 (array!13835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277753 (= res!141587 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277754 () Bool)

(declare-fun lt!138040 () Unit!8776)

(assert (=> b!277754 (= e!177182 lt!138040)))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13835 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8776)

(assert (=> b!277754 (= lt!138040 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!138041 () array!13835)

(assert (=> b!277754 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!138041 mask!3868)))

(declare-fun res!141591 () Bool)

(assert (=> start!26738 (=> (not res!141591) (not e!177178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26738 (= res!141591 (validMask!0 mask!3868))))

(assert (=> start!26738 e!177178))

(declare-fun array_inv!4530 (array!13835) Bool)

(assert (=> start!26738 (array_inv!4530 a!3325)))

(assert (=> start!26738 true))

(declare-fun b!277751 () Bool)

(declare-fun e!177181 () Bool)

(assert (=> b!277751 (= e!177179 e!177181)))

(declare-fun res!141589 () Bool)

(assert (=> b!277751 (=> (not res!141589) (not e!177181))))

(assert (=> b!277751 (= res!141589 (= startIndex!26 i!1267))))

(assert (=> b!277751 (= lt!138041 (array!13836 (store (arr!6567 a!3325) i!1267 k0!2581) (size!6919 a!3325)))))

(declare-fun b!277755 () Bool)

(declare-fun res!141588 () Bool)

(assert (=> b!277755 (=> (not res!141588) (not e!177178))))

(assert (=> b!277755 (= res!141588 (and (= (size!6919 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6919 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6919 a!3325))))))

(declare-fun b!277756 () Bool)

(assert (=> b!277756 (= e!177181 (not true))))

(assert (=> b!277756 (= (seekEntryOrOpen!0 k0!2581 lt!138041 mask!3868) (Found!1725 i!1267))))

(declare-fun lt!138039 () Unit!8776)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13835 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8776)

(assert (=> b!277756 (= lt!138039 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!138042 () Unit!8776)

(assert (=> b!277756 (= lt!138042 e!177182)))

(declare-fun c!45633 () Bool)

(assert (=> b!277756 (= c!45633 (bvslt startIndex!26 (bvsub (size!6919 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277757 () Bool)

(declare-fun res!141590 () Bool)

(assert (=> b!277757 (=> (not res!141590) (not e!177178))))

(declare-datatypes ((List!4375 0))(
  ( (Nil!4372) (Cons!4371 (h!5038 (_ BitVec 64)) (t!9457 List!4375)) )
))
(declare-fun arrayNoDuplicates!0 (array!13835 (_ BitVec 32) List!4375) Bool)

(assert (=> b!277757 (= res!141590 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4372))))

(assert (= (and start!26738 res!141591) b!277755))

(assert (= (and b!277755 res!141588) b!277748))

(assert (= (and b!277748 res!141584) b!277757))

(assert (= (and b!277757 res!141590) b!277753))

(assert (= (and b!277753 res!141587) b!277750))

(assert (= (and b!277750 res!141586) b!277749))

(assert (= (and b!277749 res!141585) b!277751))

(assert (= (and b!277751 res!141589) b!277756))

(assert (= (and b!277756 c!45633) b!277754))

(assert (= (and b!277756 (not c!45633)) b!277752))

(declare-fun m!292695 () Bool)

(assert (=> b!277754 m!292695))

(declare-fun m!292697 () Bool)

(assert (=> b!277754 m!292697))

(declare-fun m!292699 () Bool)

(assert (=> b!277756 m!292699))

(declare-fun m!292701 () Bool)

(assert (=> b!277756 m!292701))

(declare-fun m!292703 () Bool)

(assert (=> b!277751 m!292703))

(declare-fun m!292705 () Bool)

(assert (=> start!26738 m!292705))

(declare-fun m!292707 () Bool)

(assert (=> start!26738 m!292707))

(declare-fun m!292709 () Bool)

(assert (=> b!277753 m!292709))

(declare-fun m!292711 () Bool)

(assert (=> b!277748 m!292711))

(declare-fun m!292713 () Bool)

(assert (=> b!277750 m!292713))

(declare-fun m!292715 () Bool)

(assert (=> b!277757 m!292715))

(declare-fun m!292717 () Bool)

(assert (=> b!277749 m!292717))

(check-sat (not start!26738) (not b!277754) (not b!277750) (not b!277756) (not b!277748) (not b!277753) (not b!277757) (not b!277749))
(check-sat)
