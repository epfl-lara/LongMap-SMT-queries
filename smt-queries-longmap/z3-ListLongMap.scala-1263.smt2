; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26136 () Bool)

(assert start!26136)

(declare-fun b!269836 () Bool)

(declare-fun res!133944 () Bool)

(declare-fun e!174012 () Bool)

(assert (=> b!269836 (=> (not res!133944) (not e!174012))))

(declare-datatypes ((array!13232 0))(
  ( (array!13233 (arr!6265 (Array (_ BitVec 32) (_ BitVec 64))) (size!6617 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13232)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269836 (= res!133944 (and (= (size!6617 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6617 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6617 a!3325))))))

(declare-fun b!269837 () Bool)

(declare-fun res!133946 () Bool)

(assert (=> b!269837 (=> (not res!133946) (not e!174012))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269837 (= res!133946 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269838 () Bool)

(declare-fun e!174013 () Bool)

(assert (=> b!269838 (= e!174013 (not true))))

(declare-fun lt!135368 () array!13232)

(declare-datatypes ((SeekEntryResult!1388 0))(
  ( (MissingZero!1388 (index!7722 (_ BitVec 32))) (Found!1388 (index!7723 (_ BitVec 32))) (Intermediate!1388 (undefined!2200 Bool) (index!7724 (_ BitVec 32)) (x!26177 (_ BitVec 32))) (Undefined!1388) (MissingVacant!1388 (index!7725 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13232 (_ BitVec 32)) SeekEntryResult!1388)

(assert (=> b!269838 (= (seekEntryOrOpen!0 k0!2581 lt!135368 mask!3868) (Found!1388 i!1267))))

(declare-datatypes ((Unit!8357 0))(
  ( (Unit!8358) )
))
(declare-fun lt!135366 () Unit!8357)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13232 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8357)

(assert (=> b!269838 (= lt!135366 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135365 () Unit!8357)

(declare-fun e!174011 () Unit!8357)

(assert (=> b!269838 (= lt!135365 e!174011)))

(declare-fun c!45499 () Bool)

(assert (=> b!269838 (= c!45499 (bvslt startIndex!26 (bvsub (size!6617 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269839 () Bool)

(declare-fun res!133947 () Bool)

(assert (=> b!269839 (=> (not res!133947) (not e!174012))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269839 (= res!133947 (validKeyInArray!0 k0!2581))))

(declare-fun res!133941 () Bool)

(assert (=> start!26136 (=> (not res!133941) (not e!174012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26136 (= res!133941 (validMask!0 mask!3868))))

(assert (=> start!26136 e!174012))

(declare-fun array_inv!4215 (array!13232) Bool)

(assert (=> start!26136 (array_inv!4215 a!3325)))

(assert (=> start!26136 true))

(declare-fun b!269840 () Bool)

(declare-fun e!174010 () Bool)

(assert (=> b!269840 (= e!174010 e!174013)))

(declare-fun res!133943 () Bool)

(assert (=> b!269840 (=> (not res!133943) (not e!174013))))

(assert (=> b!269840 (= res!133943 (= startIndex!26 i!1267))))

(assert (=> b!269840 (= lt!135368 (array!13233 (store (arr!6265 a!3325) i!1267 k0!2581) (size!6617 a!3325)))))

(declare-fun b!269841 () Bool)

(assert (=> b!269841 (= e!174012 e!174010)))

(declare-fun res!133942 () Bool)

(assert (=> b!269841 (=> (not res!133942) (not e!174010))))

(declare-fun lt!135367 () SeekEntryResult!1388)

(assert (=> b!269841 (= res!133942 (or (= lt!135367 (MissingZero!1388 i!1267)) (= lt!135367 (MissingVacant!1388 i!1267))))))

(assert (=> b!269841 (= lt!135367 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269842 () Bool)

(declare-fun lt!135369 () Unit!8357)

(assert (=> b!269842 (= e!174011 lt!135369)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13232 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8357)

(assert (=> b!269842 (= lt!135369 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13232 (_ BitVec 32)) Bool)

(assert (=> b!269842 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135368 mask!3868)))

(declare-fun b!269843 () Bool)

(declare-fun Unit!8359 () Unit!8357)

(assert (=> b!269843 (= e!174011 Unit!8359)))

(declare-fun b!269844 () Bool)

(declare-fun res!133940 () Bool)

(assert (=> b!269844 (=> (not res!133940) (not e!174012))))

(declare-datatypes ((List!3986 0))(
  ( (Nil!3983) (Cons!3982 (h!4649 (_ BitVec 64)) (t!9060 List!3986)) )
))
(declare-fun arrayNoDuplicates!0 (array!13232 (_ BitVec 32) List!3986) Bool)

(assert (=> b!269844 (= res!133940 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3983))))

(declare-fun b!269845 () Bool)

(declare-fun res!133945 () Bool)

(assert (=> b!269845 (=> (not res!133945) (not e!174010))))

(assert (=> b!269845 (= res!133945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26136 res!133941) b!269836))

(assert (= (and b!269836 res!133944) b!269839))

(assert (= (and b!269839 res!133947) b!269844))

(assert (= (and b!269844 res!133940) b!269837))

(assert (= (and b!269837 res!133946) b!269841))

(assert (= (and b!269841 res!133942) b!269845))

(assert (= (and b!269845 res!133945) b!269840))

(assert (= (and b!269840 res!133943) b!269838))

(assert (= (and b!269838 c!45499) b!269842))

(assert (= (and b!269838 (not c!45499)) b!269843))

(declare-fun m!285737 () Bool)

(assert (=> start!26136 m!285737))

(declare-fun m!285739 () Bool)

(assert (=> start!26136 m!285739))

(declare-fun m!285741 () Bool)

(assert (=> b!269837 m!285741))

(declare-fun m!285743 () Bool)

(assert (=> b!269840 m!285743))

(declare-fun m!285745 () Bool)

(assert (=> b!269844 m!285745))

(declare-fun m!285747 () Bool)

(assert (=> b!269839 m!285747))

(declare-fun m!285749 () Bool)

(assert (=> b!269842 m!285749))

(declare-fun m!285751 () Bool)

(assert (=> b!269842 m!285751))

(declare-fun m!285753 () Bool)

(assert (=> b!269841 m!285753))

(declare-fun m!285755 () Bool)

(assert (=> b!269838 m!285755))

(declare-fun m!285757 () Bool)

(assert (=> b!269838 m!285757))

(declare-fun m!285759 () Bool)

(assert (=> b!269845 m!285759))

(check-sat (not b!269845) (not b!269839) (not b!269837) (not b!269842) (not b!269841) (not b!269838) (not b!269844) (not start!26136))
(check-sat)
