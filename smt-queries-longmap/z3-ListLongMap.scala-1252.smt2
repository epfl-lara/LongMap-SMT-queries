; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26072 () Bool)

(assert start!26072)

(declare-fun b!268917 () Bool)

(declare-fun res!133199 () Bool)

(declare-fun e!173623 () Bool)

(assert (=> b!268917 (=> (not res!133199) (not e!173623))))

(declare-datatypes ((array!13169 0))(
  ( (array!13170 (arr!6234 (Array (_ BitVec 32) (_ BitVec 64))) (size!6586 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13169)

(declare-datatypes ((List!4042 0))(
  ( (Nil!4039) (Cons!4038 (h!4705 (_ BitVec 64)) (t!9124 List!4042)) )
))
(declare-fun arrayNoDuplicates!0 (array!13169 (_ BitVec 32) List!4042) Bool)

(assert (=> b!268917 (= res!133199 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4039))))

(declare-fun b!268918 () Bool)

(declare-fun res!133197 () Bool)

(assert (=> b!268918 (=> (not res!133197) (not e!173623))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!268918 (= res!133197 (and (= (size!6586 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6586 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6586 a!3325))))))

(declare-fun res!133200 () Bool)

(assert (=> start!26072 (=> (not res!133200) (not e!173623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26072 (= res!133200 (validMask!0 mask!3868))))

(assert (=> start!26072 e!173623))

(declare-fun array_inv!4197 (array!13169) Bool)

(assert (=> start!26072 (array_inv!4197 a!3325)))

(assert (=> start!26072 true))

(declare-fun b!268919 () Bool)

(declare-fun res!133198 () Bool)

(assert (=> b!268919 (=> (not res!133198) (not e!173623))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268919 (= res!133198 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268920 () Bool)

(declare-fun e!173624 () Bool)

(assert (=> b!268920 (= e!173623 e!173624)))

(declare-fun res!133195 () Bool)

(assert (=> b!268920 (=> (not res!133195) (not e!173624))))

(declare-datatypes ((SeekEntryResult!1392 0))(
  ( (MissingZero!1392 (index!7738 (_ BitVec 32))) (Found!1392 (index!7739 (_ BitVec 32))) (Intermediate!1392 (undefined!2204 Bool) (index!7740 (_ BitVec 32)) (x!26093 (_ BitVec 32))) (Undefined!1392) (MissingVacant!1392 (index!7741 (_ BitVec 32))) )
))
(declare-fun lt!135036 () SeekEntryResult!1392)

(assert (=> b!268920 (= res!133195 (or (= lt!135036 (MissingZero!1392 i!1267)) (= lt!135036 (MissingVacant!1392 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13169 (_ BitVec 32)) SeekEntryResult!1392)

(assert (=> b!268920 (= lt!135036 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!268921 () Bool)

(declare-fun res!133196 () Bool)

(assert (=> b!268921 (=> (not res!133196) (not e!173623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268921 (= res!133196 (validKeyInArray!0 k0!2581))))

(declare-fun b!268922 () Bool)

(assert (=> b!268922 (= e!173624 false)))

(declare-fun lt!135037 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13169 (_ BitVec 32)) Bool)

(assert (=> b!268922 (= lt!135037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26072 res!133200) b!268918))

(assert (= (and b!268918 res!133197) b!268921))

(assert (= (and b!268921 res!133196) b!268917))

(assert (= (and b!268917 res!133199) b!268919))

(assert (= (and b!268919 res!133198) b!268920))

(assert (= (and b!268920 res!133195) b!268922))

(declare-fun m!284939 () Bool)

(assert (=> start!26072 m!284939))

(declare-fun m!284941 () Bool)

(assert (=> start!26072 m!284941))

(declare-fun m!284943 () Bool)

(assert (=> b!268920 m!284943))

(declare-fun m!284945 () Bool)

(assert (=> b!268921 m!284945))

(declare-fun m!284947 () Bool)

(assert (=> b!268917 m!284947))

(declare-fun m!284949 () Bool)

(assert (=> b!268922 m!284949))

(declare-fun m!284951 () Bool)

(assert (=> b!268919 m!284951))

(check-sat (not b!268920) (not b!268921) (not start!26072) (not b!268919) (not b!268922) (not b!268917))
(check-sat)
