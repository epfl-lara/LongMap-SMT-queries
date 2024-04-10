; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26130 () Bool)

(assert start!26130)

(declare-fun b!269699 () Bool)

(declare-fun res!133849 () Bool)

(declare-fun e!173950 () Bool)

(assert (=> b!269699 (=> (not res!133849) (not e!173950))))

(declare-datatypes ((array!13227 0))(
  ( (array!13228 (arr!6263 (Array (_ BitVec 32) (_ BitVec 64))) (size!6615 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13227)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269699 (= res!133849 (and (= (size!6615 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6615 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6615 a!3325))))))

(declare-fun b!269700 () Bool)

(declare-datatypes ((Unit!8368 0))(
  ( (Unit!8369) )
))
(declare-fun e!173949 () Unit!8368)

(declare-fun Unit!8370 () Unit!8368)

(assert (=> b!269700 (= e!173949 Unit!8370)))

(declare-fun b!269701 () Bool)

(declare-fun res!133848 () Bool)

(assert (=> b!269701 (=> (not res!133848) (not e!173950))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269701 (= res!133848 (validKeyInArray!0 k!2581))))

(declare-fun b!269702 () Bool)

(declare-fun res!133854 () Bool)

(declare-fun e!173951 () Bool)

(assert (=> b!269702 (=> (not res!133854) (not e!173951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13227 (_ BitVec 32)) Bool)

(assert (=> b!269702 (= res!133854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269704 () Bool)

(declare-fun res!133847 () Bool)

(assert (=> b!269704 (=> (not res!133847) (not e!173950))))

(declare-fun arrayContainsKey!0 (array!13227 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269704 (= res!133847 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269705 () Bool)

(declare-fun res!133851 () Bool)

(assert (=> b!269705 (=> (not res!133851) (not e!173951))))

(assert (=> b!269705 (= res!133851 (= startIndex!26 i!1267))))

(declare-fun b!269706 () Bool)

(assert (=> b!269706 (= e!173951 false)))

(declare-fun lt!135275 () Unit!8368)

(assert (=> b!269706 (= lt!135275 e!173949)))

(declare-fun c!45477 () Bool)

(assert (=> b!269706 (= c!45477 (bvslt startIndex!26 (bvsub (size!6615 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269703 () Bool)

(declare-fun lt!135276 () Unit!8368)

(assert (=> b!269703 (= e!173949 lt!135276)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13227 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8368)

(assert (=> b!269703 (= lt!135276 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269703 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13228 (store (arr!6263 a!3325) i!1267 k!2581) (size!6615 a!3325)) mask!3868)))

(declare-fun res!133852 () Bool)

(assert (=> start!26130 (=> (not res!133852) (not e!173950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26130 (= res!133852 (validMask!0 mask!3868))))

(assert (=> start!26130 e!173950))

(declare-fun array_inv!4226 (array!13227) Bool)

(assert (=> start!26130 (array_inv!4226 a!3325)))

(assert (=> start!26130 true))

(declare-fun b!269707 () Bool)

(assert (=> b!269707 (= e!173950 e!173951)))

(declare-fun res!133853 () Bool)

(assert (=> b!269707 (=> (not res!133853) (not e!173951))))

(declare-datatypes ((SeekEntryResult!1421 0))(
  ( (MissingZero!1421 (index!7854 (_ BitVec 32))) (Found!1421 (index!7855 (_ BitVec 32))) (Intermediate!1421 (undefined!2233 Bool) (index!7856 (_ BitVec 32)) (x!26202 (_ BitVec 32))) (Undefined!1421) (MissingVacant!1421 (index!7857 (_ BitVec 32))) )
))
(declare-fun lt!135277 () SeekEntryResult!1421)

(assert (=> b!269707 (= res!133853 (or (= lt!135277 (MissingZero!1421 i!1267)) (= lt!135277 (MissingVacant!1421 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13227 (_ BitVec 32)) SeekEntryResult!1421)

(assert (=> b!269707 (= lt!135277 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269708 () Bool)

(declare-fun res!133850 () Bool)

(assert (=> b!269708 (=> (not res!133850) (not e!173950))))

(declare-datatypes ((List!4071 0))(
  ( (Nil!4068) (Cons!4067 (h!4734 (_ BitVec 64)) (t!9153 List!4071)) )
))
(declare-fun arrayNoDuplicates!0 (array!13227 (_ BitVec 32) List!4071) Bool)

(assert (=> b!269708 (= res!133850 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4068))))

(assert (= (and start!26130 res!133852) b!269699))

(assert (= (and b!269699 res!133849) b!269701))

(assert (= (and b!269701 res!133848) b!269708))

(assert (= (and b!269708 res!133850) b!269704))

(assert (= (and b!269704 res!133847) b!269707))

(assert (= (and b!269707 res!133853) b!269702))

(assert (= (and b!269702 res!133854) b!269705))

(assert (= (and b!269705 res!133851) b!269706))

(assert (= (and b!269706 c!45477) b!269703))

(assert (= (and b!269706 (not c!45477)) b!269700))

(declare-fun m!285471 () Bool)

(assert (=> b!269702 m!285471))

(declare-fun m!285473 () Bool)

(assert (=> start!26130 m!285473))

(declare-fun m!285475 () Bool)

(assert (=> start!26130 m!285475))

(declare-fun m!285477 () Bool)

(assert (=> b!269707 m!285477))

(declare-fun m!285479 () Bool)

(assert (=> b!269701 m!285479))

(declare-fun m!285481 () Bool)

(assert (=> b!269704 m!285481))

(declare-fun m!285483 () Bool)

(assert (=> b!269708 m!285483))

(declare-fun m!285485 () Bool)

(assert (=> b!269703 m!285485))

(declare-fun m!285487 () Bool)

(assert (=> b!269703 m!285487))

(declare-fun m!285489 () Bool)

(assert (=> b!269703 m!285489))

(push 1)

