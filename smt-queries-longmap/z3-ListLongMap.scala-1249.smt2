; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26052 () Bool)

(assert start!26052)

(declare-fun b!268784 () Bool)

(declare-fun res!133037 () Bool)

(declare-fun e!173557 () Bool)

(assert (=> b!268784 (=> (not res!133037) (not e!173557))))

(declare-datatypes ((array!13148 0))(
  ( (array!13149 (arr!6223 (Array (_ BitVec 32) (_ BitVec 64))) (size!6575 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13148)

(declare-datatypes ((List!3944 0))(
  ( (Nil!3941) (Cons!3940 (h!4607 (_ BitVec 64)) (t!9018 List!3944)) )
))
(declare-fun arrayNoDuplicates!0 (array!13148 (_ BitVec 32) List!3944) Bool)

(assert (=> b!268784 (= res!133037 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3941))))

(declare-fun b!268785 () Bool)

(declare-fun res!133040 () Bool)

(assert (=> b!268785 (=> (not res!133040) (not e!173557))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268785 (= res!133040 (validKeyInArray!0 k0!2581))))

(declare-fun b!268786 () Bool)

(declare-fun e!173556 () Bool)

(assert (=> b!268786 (= e!173556 false)))

(declare-fun lt!135036 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13148 (_ BitVec 32)) Bool)

(assert (=> b!268786 (= lt!135036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268787 () Bool)

(assert (=> b!268787 (= e!173557 e!173556)))

(declare-fun res!133038 () Bool)

(assert (=> b!268787 (=> (not res!133038) (not e!173556))))

(declare-datatypes ((SeekEntryResult!1346 0))(
  ( (MissingZero!1346 (index!7554 (_ BitVec 32))) (Found!1346 (index!7555 (_ BitVec 32))) (Intermediate!1346 (undefined!2158 Bool) (index!7556 (_ BitVec 32)) (x!26023 (_ BitVec 32))) (Undefined!1346) (MissingVacant!1346 (index!7557 (_ BitVec 32))) )
))
(declare-fun lt!135035 () SeekEntryResult!1346)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268787 (= res!133038 (or (= lt!135035 (MissingZero!1346 i!1267)) (= lt!135035 (MissingVacant!1346 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13148 (_ BitVec 32)) SeekEntryResult!1346)

(assert (=> b!268787 (= lt!135035 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268788 () Bool)

(declare-fun res!133036 () Bool)

(assert (=> b!268788 (=> (not res!133036) (not e!173557))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268788 (= res!133036 (and (= (size!6575 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6575 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6575 a!3325))))))

(declare-fun b!268789 () Bool)

(declare-fun res!133039 () Bool)

(assert (=> b!268789 (=> (not res!133039) (not e!173557))))

(declare-fun arrayContainsKey!0 (array!13148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268789 (= res!133039 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!133041 () Bool)

(assert (=> start!26052 (=> (not res!133041) (not e!173557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26052 (= res!133041 (validMask!0 mask!3868))))

(assert (=> start!26052 e!173557))

(declare-fun array_inv!4173 (array!13148) Bool)

(assert (=> start!26052 (array_inv!4173 a!3325)))

(assert (=> start!26052 true))

(assert (= (and start!26052 res!133041) b!268788))

(assert (= (and b!268788 res!133036) b!268785))

(assert (= (and b!268785 res!133040) b!268784))

(assert (= (and b!268784 res!133037) b!268789))

(assert (= (and b!268789 res!133039) b!268787))

(assert (= (and b!268787 res!133038) b!268786))

(declare-fun m!285005 () Bool)

(assert (=> b!268789 m!285005))

(declare-fun m!285007 () Bool)

(assert (=> b!268786 m!285007))

(declare-fun m!285009 () Bool)

(assert (=> start!26052 m!285009))

(declare-fun m!285011 () Bool)

(assert (=> start!26052 m!285011))

(declare-fun m!285013 () Bool)

(assert (=> b!268787 m!285013))

(declare-fun m!285015 () Bool)

(assert (=> b!268785 m!285015))

(declare-fun m!285017 () Bool)

(assert (=> b!268784 m!285017))

(check-sat (not b!268786) (not b!268784) (not b!268789) (not b!268787) (not b!268785) (not start!26052))
(check-sat)
