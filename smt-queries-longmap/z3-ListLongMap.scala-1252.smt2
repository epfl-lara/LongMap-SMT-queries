; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26072 () Bool)

(assert start!26072)

(declare-fun res!133083 () Bool)

(declare-fun e!173513 () Bool)

(assert (=> start!26072 (=> (not res!133083) (not e!173513))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26072 (= res!133083 (validMask!0 mask!3868))))

(assert (=> start!26072 e!173513))

(declare-datatypes ((array!13158 0))(
  ( (array!13159 (arr!6228 (Array (_ BitVec 32) (_ BitVec 64))) (size!6581 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13158)

(declare-fun array_inv!4200 (array!13158) Bool)

(assert (=> start!26072 (array_inv!4200 a!3325)))

(assert (=> start!26072 true))

(declare-fun b!268752 () Bool)

(declare-fun res!133082 () Bool)

(assert (=> b!268752 (=> (not res!133082) (not e!173513))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268752 (= res!133082 (validKeyInArray!0 k0!2581))))

(declare-fun b!268753 () Bool)

(declare-fun e!173512 () Bool)

(assert (=> b!268753 (= e!173512 false)))

(declare-fun lt!134849 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13158 (_ BitVec 32)) Bool)

(assert (=> b!268753 (= lt!134849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268754 () Bool)

(declare-fun res!133087 () Bool)

(assert (=> b!268754 (=> (not res!133087) (not e!173513))))

(declare-datatypes ((List!4009 0))(
  ( (Nil!4006) (Cons!4005 (h!4672 (_ BitVec 64)) (t!9082 List!4009)) )
))
(declare-fun arrayNoDuplicates!0 (array!13158 (_ BitVec 32) List!4009) Bool)

(assert (=> b!268754 (= res!133087 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4006))))

(declare-fun b!268755 () Bool)

(declare-fun res!133086 () Bool)

(assert (=> b!268755 (=> (not res!133086) (not e!173513))))

(declare-fun arrayContainsKey!0 (array!13158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268755 (= res!133086 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268756 () Bool)

(declare-fun res!133085 () Bool)

(assert (=> b!268756 (=> (not res!133085) (not e!173513))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268756 (= res!133085 (and (= (size!6581 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6581 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6581 a!3325))))))

(declare-fun b!268757 () Bool)

(assert (=> b!268757 (= e!173513 e!173512)))

(declare-fun res!133084 () Bool)

(assert (=> b!268757 (=> (not res!133084) (not e!173512))))

(declare-datatypes ((SeekEntryResult!1385 0))(
  ( (MissingZero!1385 (index!7710 (_ BitVec 32))) (Found!1385 (index!7711 (_ BitVec 32))) (Intermediate!1385 (undefined!2197 Bool) (index!7712 (_ BitVec 32)) (x!26085 (_ BitVec 32))) (Undefined!1385) (MissingVacant!1385 (index!7713 (_ BitVec 32))) )
))
(declare-fun lt!134850 () SeekEntryResult!1385)

(assert (=> b!268757 (= res!133084 (or (= lt!134850 (MissingZero!1385 i!1267)) (= lt!134850 (MissingVacant!1385 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13158 (_ BitVec 32)) SeekEntryResult!1385)

(assert (=> b!268757 (= lt!134850 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26072 res!133083) b!268756))

(assert (= (and b!268756 res!133085) b!268752))

(assert (= (and b!268752 res!133082) b!268754))

(assert (= (and b!268754 res!133087) b!268755))

(assert (= (and b!268755 res!133086) b!268757))

(assert (= (and b!268757 res!133084) b!268753))

(declare-fun m!284333 () Bool)

(assert (=> b!268757 m!284333))

(declare-fun m!284335 () Bool)

(assert (=> b!268755 m!284335))

(declare-fun m!284337 () Bool)

(assert (=> b!268752 m!284337))

(declare-fun m!284339 () Bool)

(assert (=> b!268754 m!284339))

(declare-fun m!284341 () Bool)

(assert (=> start!26072 m!284341))

(declare-fun m!284343 () Bool)

(assert (=> start!26072 m!284343))

(declare-fun m!284345 () Bool)

(assert (=> b!268753 m!284345))

(check-sat (not b!268752) (not b!268755) (not b!268757) (not b!268753) (not start!26072) (not b!268754))
(check-sat)
