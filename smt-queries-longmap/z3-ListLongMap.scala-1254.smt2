; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26084 () Bool)

(assert start!26084)

(declare-fun b!269025 () Bool)

(declare-fun res!133305 () Bool)

(declare-fun e!173677 () Bool)

(assert (=> b!269025 (=> (not res!133305) (not e!173677))))

(declare-datatypes ((array!13181 0))(
  ( (array!13182 (arr!6240 (Array (_ BitVec 32) (_ BitVec 64))) (size!6592 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13181)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269025 (= res!133305 (and (= (size!6592 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6592 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6592 a!3325))))))

(declare-fun b!269026 () Bool)

(declare-fun res!133308 () Bool)

(assert (=> b!269026 (=> (not res!133308) (not e!173677))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269026 (= res!133308 (validKeyInArray!0 k0!2581))))

(declare-fun b!269027 () Bool)

(declare-fun e!173678 () Bool)

(assert (=> b!269027 (= e!173677 e!173678)))

(declare-fun res!133303 () Bool)

(assert (=> b!269027 (=> (not res!133303) (not e!173678))))

(declare-datatypes ((SeekEntryResult!1398 0))(
  ( (MissingZero!1398 (index!7762 (_ BitVec 32))) (Found!1398 (index!7763 (_ BitVec 32))) (Intermediate!1398 (undefined!2210 Bool) (index!7764 (_ BitVec 32)) (x!26115 (_ BitVec 32))) (Undefined!1398) (MissingVacant!1398 (index!7765 (_ BitVec 32))) )
))
(declare-fun lt!135073 () SeekEntryResult!1398)

(assert (=> b!269027 (= res!133303 (or (= lt!135073 (MissingZero!1398 i!1267)) (= lt!135073 (MissingVacant!1398 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13181 (_ BitVec 32)) SeekEntryResult!1398)

(assert (=> b!269027 (= lt!135073 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!133306 () Bool)

(assert (=> start!26084 (=> (not res!133306) (not e!173677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26084 (= res!133306 (validMask!0 mask!3868))))

(assert (=> start!26084 e!173677))

(declare-fun array_inv!4203 (array!13181) Bool)

(assert (=> start!26084 (array_inv!4203 a!3325)))

(assert (=> start!26084 true))

(declare-fun b!269028 () Bool)

(assert (=> b!269028 (= e!173678 false)))

(declare-fun lt!135072 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13181 (_ BitVec 32)) Bool)

(assert (=> b!269028 (= lt!135072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269029 () Bool)

(declare-fun res!133304 () Bool)

(assert (=> b!269029 (=> (not res!133304) (not e!173677))))

(declare-fun arrayContainsKey!0 (array!13181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269029 (= res!133304 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269030 () Bool)

(declare-fun res!133307 () Bool)

(assert (=> b!269030 (=> (not res!133307) (not e!173677))))

(declare-datatypes ((List!4048 0))(
  ( (Nil!4045) (Cons!4044 (h!4711 (_ BitVec 64)) (t!9130 List!4048)) )
))
(declare-fun arrayNoDuplicates!0 (array!13181 (_ BitVec 32) List!4048) Bool)

(assert (=> b!269030 (= res!133307 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4045))))

(assert (= (and start!26084 res!133306) b!269025))

(assert (= (and b!269025 res!133305) b!269026))

(assert (= (and b!269026 res!133308) b!269030))

(assert (= (and b!269030 res!133307) b!269029))

(assert (= (and b!269029 res!133304) b!269027))

(assert (= (and b!269027 res!133303) b!269028))

(declare-fun m!285023 () Bool)

(assert (=> b!269027 m!285023))

(declare-fun m!285025 () Bool)

(assert (=> b!269030 m!285025))

(declare-fun m!285027 () Bool)

(assert (=> b!269026 m!285027))

(declare-fun m!285029 () Bool)

(assert (=> b!269028 m!285029))

(declare-fun m!285031 () Bool)

(assert (=> start!26084 m!285031))

(declare-fun m!285033 () Bool)

(assert (=> start!26084 m!285033))

(declare-fun m!285035 () Bool)

(assert (=> b!269029 m!285035))

(check-sat (not b!269028) (not b!269030) (not start!26084) (not b!269026) (not b!269027) (not b!269029))
(check-sat)
