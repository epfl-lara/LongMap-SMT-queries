; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46008 () Bool)

(assert start!46008)

(declare-fun b!509406 () Bool)

(declare-fun res!310255 () Bool)

(declare-fun e!297907 () Bool)

(assert (=> b!509406 (=> (not res!310255) (not e!297907))))

(declare-datatypes ((array!32719 0))(
  ( (array!32720 (arr!15738 (Array (_ BitVec 32) (_ BitVec 64))) (size!16102 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32719)

(declare-datatypes ((List!9896 0))(
  ( (Nil!9893) (Cons!9892 (h!10769 (_ BitVec 64)) (t!16124 List!9896)) )
))
(declare-fun arrayNoDuplicates!0 (array!32719 (_ BitVec 32) List!9896) Bool)

(assert (=> b!509406 (= res!310255 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9893))))

(declare-fun b!509407 () Bool)

(declare-fun res!310251 () Bool)

(declare-fun e!297906 () Bool)

(assert (=> b!509407 (=> (not res!310251) (not e!297906))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509407 (= res!310251 (and (= (size!16102 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16102 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16102 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509408 () Bool)

(declare-fun res!310252 () Bool)

(assert (=> b!509408 (=> (not res!310252) (not e!297907))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32719 (_ BitVec 32)) Bool)

(assert (=> b!509408 (= res!310252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!297909 () Bool)

(declare-fun b!509409 () Bool)

(declare-datatypes ((SeekEntryResult!4205 0))(
  ( (MissingZero!4205 (index!19008 (_ BitVec 32))) (Found!4205 (index!19009 (_ BitVec 32))) (Intermediate!4205 (undefined!5017 Bool) (index!19010 (_ BitVec 32)) (x!47982 (_ BitVec 32))) (Undefined!4205) (MissingVacant!4205 (index!19011 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32719 (_ BitVec 32)) SeekEntryResult!4205)

(assert (=> b!509409 (= e!297909 (= (seekEntryOrOpen!0 (select (arr!15738 a!3235) j!176) a!3235 mask!3524) (Found!4205 j!176)))))

(declare-fun b!509410 () Bool)

(assert (=> b!509410 (= e!297906 e!297907)))

(declare-fun res!310259 () Bool)

(assert (=> b!509410 (=> (not res!310259) (not e!297907))))

(declare-fun lt!232698 () SeekEntryResult!4205)

(assert (=> b!509410 (= res!310259 (or (= lt!232698 (MissingZero!4205 i!1204)) (= lt!232698 (MissingVacant!4205 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!509410 (= lt!232698 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509411 () Bool)

(declare-fun res!310256 () Bool)

(assert (=> b!509411 (=> (not res!310256) (not e!297906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509411 (= res!310256 (validKeyInArray!0 (select (arr!15738 a!3235) j!176)))))

(declare-fun res!310258 () Bool)

(assert (=> start!46008 (=> (not res!310258) (not e!297906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46008 (= res!310258 (validMask!0 mask!3524))))

(assert (=> start!46008 e!297906))

(assert (=> start!46008 true))

(declare-fun array_inv!11534 (array!32719) Bool)

(assert (=> start!46008 (array_inv!11534 a!3235)))

(declare-fun b!509412 () Bool)

(declare-fun res!310257 () Bool)

(assert (=> b!509412 (=> (not res!310257) (not e!297906))))

(declare-fun arrayContainsKey!0 (array!32719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509412 (= res!310257 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509413 () Bool)

(declare-fun res!310253 () Bool)

(assert (=> b!509413 (=> (not res!310253) (not e!297906))))

(assert (=> b!509413 (= res!310253 (validKeyInArray!0 k!2280))))

(declare-fun b!509414 () Bool)

(assert (=> b!509414 (= e!297907 (not true))))

(declare-fun lt!232696 () (_ BitVec 32))

(declare-fun lt!232695 () SeekEntryResult!4205)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32719 (_ BitVec 32)) SeekEntryResult!4205)

(assert (=> b!509414 (= lt!232695 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232696 (select (store (arr!15738 a!3235) i!1204 k!2280) j!176) (array!32720 (store (arr!15738 a!3235) i!1204 k!2280) (size!16102 a!3235)) mask!3524))))

(declare-fun lt!232699 () SeekEntryResult!4205)

(declare-fun lt!232694 () (_ BitVec 32))

(assert (=> b!509414 (= lt!232699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232694 (select (arr!15738 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509414 (= lt!232696 (toIndex!0 (select (store (arr!15738 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509414 (= lt!232694 (toIndex!0 (select (arr!15738 a!3235) j!176) mask!3524))))

(assert (=> b!509414 e!297909))

(declare-fun res!310254 () Bool)

(assert (=> b!509414 (=> (not res!310254) (not e!297909))))

(assert (=> b!509414 (= res!310254 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15668 0))(
  ( (Unit!15669) )
))
(declare-fun lt!232697 () Unit!15668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15668)

(assert (=> b!509414 (= lt!232697 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46008 res!310258) b!509407))

(assert (= (and b!509407 res!310251) b!509411))

(assert (= (and b!509411 res!310256) b!509413))

(assert (= (and b!509413 res!310253) b!509412))

(assert (= (and b!509412 res!310257) b!509410))

(assert (= (and b!509410 res!310259) b!509408))

(assert (= (and b!509408 res!310252) b!509406))

(assert (= (and b!509406 res!310255) b!509414))

(assert (= (and b!509414 res!310254) b!509409))

(declare-fun m!490281 () Bool)

(assert (=> b!509409 m!490281))

(assert (=> b!509409 m!490281))

(declare-fun m!490283 () Bool)

(assert (=> b!509409 m!490283))

(declare-fun m!490285 () Bool)

(assert (=> b!509412 m!490285))

(declare-fun m!490287 () Bool)

(assert (=> b!509413 m!490287))

(declare-fun m!490289 () Bool)

(assert (=> b!509414 m!490289))

(declare-fun m!490291 () Bool)

(assert (=> b!509414 m!490291))

(assert (=> b!509414 m!490291))

(declare-fun m!490293 () Bool)

(assert (=> b!509414 m!490293))

(assert (=> b!509414 m!490281))

(declare-fun m!490295 () Bool)

(assert (=> b!509414 m!490295))

(assert (=> b!509414 m!490281))

(declare-fun m!490297 () Bool)

(assert (=> b!509414 m!490297))

(assert (=> b!509414 m!490291))

(declare-fun m!490299 () Bool)

(assert (=> b!509414 m!490299))

(declare-fun m!490301 () Bool)

(assert (=> b!509414 m!490301))

(assert (=> b!509414 m!490281))

(declare-fun m!490303 () Bool)

(assert (=> b!509414 m!490303))

(declare-fun m!490305 () Bool)

(assert (=> b!509408 m!490305))

(assert (=> b!509411 m!490281))

(assert (=> b!509411 m!490281))

(declare-fun m!490307 () Bool)

(assert (=> b!509411 m!490307))

(declare-fun m!490309 () Bool)

(assert (=> b!509406 m!490309))

(declare-fun m!490311 () Bool)

(assert (=> start!46008 m!490311))

(declare-fun m!490313 () Bool)

(assert (=> start!46008 m!490313))

(declare-fun m!490315 () Bool)

(assert (=> b!509410 m!490315))

(push 1)

