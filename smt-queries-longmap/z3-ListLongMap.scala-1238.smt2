; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25988 () Bool)

(assert start!25988)

(declare-fun b!267995 () Bool)

(declare-datatypes ((array!13074 0))(
  ( (array!13075 (arr!6186 (Array (_ BitVec 32) (_ BitVec 64))) (size!6539 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13074)

(declare-fun e!173142 () Bool)

(declare-datatypes ((SeekEntryResult!1343 0))(
  ( (MissingZero!1343 (index!7542 (_ BitVec 32))) (Found!1343 (index!7543 (_ BitVec 32))) (Intermediate!1343 (undefined!2155 Bool) (index!7544 (_ BitVec 32)) (x!25931 (_ BitVec 32))) (Undefined!1343) (MissingVacant!1343 (index!7545 (_ BitVec 32))) )
))
(declare-fun lt!134613 () SeekEntryResult!1343)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!267995 (= e!173142 (and (or (= lt!134613 (MissingZero!1343 i!1267)) (= lt!134613 (MissingVacant!1343 i!1267))) (bvsgt #b00000000000000000000000000000000 (size!6539 a!3325))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13074 (_ BitVec 32)) SeekEntryResult!1343)

(assert (=> b!267995 (= lt!134613 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!267996 () Bool)

(declare-fun res!132327 () Bool)

(assert (=> b!267996 (=> (not res!132327) (not e!173142))))

(declare-fun arrayContainsKey!0 (array!13074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267996 (= res!132327 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!267997 () Bool)

(declare-fun res!132324 () Bool)

(assert (=> b!267997 (=> (not res!132324) (not e!173142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267997 (= res!132324 (validKeyInArray!0 k0!2581))))

(declare-fun b!267998 () Bool)

(declare-fun res!132326 () Bool)

(assert (=> b!267998 (=> (not res!132326) (not e!173142))))

(declare-datatypes ((List!3967 0))(
  ( (Nil!3964) (Cons!3963 (h!4630 (_ BitVec 64)) (t!9040 List!3967)) )
))
(declare-fun arrayNoDuplicates!0 (array!13074 (_ BitVec 32) List!3967) Bool)

(assert (=> b!267998 (= res!132326 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3964))))

(declare-fun b!267994 () Bool)

(declare-fun res!132325 () Bool)

(assert (=> b!267994 (=> (not res!132325) (not e!173142))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!267994 (= res!132325 (and (= (size!6539 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6539 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6539 a!3325))))))

(declare-fun res!132328 () Bool)

(assert (=> start!25988 (=> (not res!132328) (not e!173142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25988 (= res!132328 (validMask!0 mask!3868))))

(assert (=> start!25988 e!173142))

(declare-fun array_inv!4158 (array!13074) Bool)

(assert (=> start!25988 (array_inv!4158 a!3325)))

(assert (=> start!25988 true))

(assert (= (and start!25988 res!132328) b!267994))

(assert (= (and b!267994 res!132325) b!267997))

(assert (= (and b!267997 res!132324) b!267998))

(assert (= (and b!267998 res!132326) b!267996))

(assert (= (and b!267996 res!132327) b!267995))

(declare-fun m!283751 () Bool)

(assert (=> b!267995 m!283751))

(declare-fun m!283753 () Bool)

(assert (=> start!25988 m!283753))

(declare-fun m!283755 () Bool)

(assert (=> start!25988 m!283755))

(declare-fun m!283757 () Bool)

(assert (=> b!267998 m!283757))

(declare-fun m!283759 () Bool)

(assert (=> b!267996 m!283759))

(declare-fun m!283761 () Bool)

(assert (=> b!267997 m!283761))

(check-sat (not b!267996) (not b!267997) (not start!25988) (not b!267998) (not b!267995))
(check-sat)
