; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26116 () Bool)

(assert start!26116)

(declare-fun b!269489 () Bool)

(declare-fun e!173867 () Bool)

(assert (=> b!269489 (= e!173867 false)))

(declare-datatypes ((Unit!8347 0))(
  ( (Unit!8348) )
))
(declare-fun lt!135213 () Unit!8347)

(declare-fun e!173866 () Unit!8347)

(assert (=> b!269489 (= lt!135213 e!173866)))

(declare-fun c!45456 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13213 0))(
  ( (array!13214 (arr!6256 (Array (_ BitVec 32) (_ BitVec 64))) (size!6608 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13213)

(assert (=> b!269489 (= c!45456 (bvslt startIndex!26 (bvsub (size!6608 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269490 () Bool)

(declare-fun res!133681 () Bool)

(declare-fun e!173865 () Bool)

(assert (=> b!269490 (=> (not res!133681) (not e!173865))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269490 (= res!133681 (validKeyInArray!0 k!2581))))

(declare-fun b!269491 () Bool)

(assert (=> b!269491 (= e!173865 e!173867)))

(declare-fun res!133684 () Bool)

(assert (=> b!269491 (=> (not res!133684) (not e!173867))))

(declare-datatypes ((SeekEntryResult!1414 0))(
  ( (MissingZero!1414 (index!7826 (_ BitVec 32))) (Found!1414 (index!7827 (_ BitVec 32))) (Intermediate!1414 (undefined!2226 Bool) (index!7828 (_ BitVec 32)) (x!26171 (_ BitVec 32))) (Undefined!1414) (MissingVacant!1414 (index!7829 (_ BitVec 32))) )
))
(declare-fun lt!135214 () SeekEntryResult!1414)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!269491 (= res!133684 (or (= lt!135214 (MissingZero!1414 i!1267)) (= lt!135214 (MissingVacant!1414 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13213 (_ BitVec 32)) SeekEntryResult!1414)

(assert (=> b!269491 (= lt!135214 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269492 () Bool)

(declare-fun res!133686 () Bool)

(assert (=> b!269492 (=> (not res!133686) (not e!173867))))

(assert (=> b!269492 (= res!133686 (= startIndex!26 i!1267))))

(declare-fun b!269493 () Bool)

(declare-fun lt!135212 () Unit!8347)

(assert (=> b!269493 (= e!173866 lt!135212)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13213 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8347)

(assert (=> b!269493 (= lt!135212 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13213 (_ BitVec 32)) Bool)

(assert (=> b!269493 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13214 (store (arr!6256 a!3325) i!1267 k!2581) (size!6608 a!3325)) mask!3868)))

(declare-fun b!269494 () Bool)

(declare-fun res!133685 () Bool)

(assert (=> b!269494 (=> (not res!133685) (not e!173865))))

(declare-datatypes ((List!4064 0))(
  ( (Nil!4061) (Cons!4060 (h!4727 (_ BitVec 64)) (t!9146 List!4064)) )
))
(declare-fun arrayNoDuplicates!0 (array!13213 (_ BitVec 32) List!4064) Bool)

(assert (=> b!269494 (= res!133685 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4061))))

(declare-fun b!269495 () Bool)

(declare-fun Unit!8349 () Unit!8347)

(assert (=> b!269495 (= e!173866 Unit!8349)))

(declare-fun b!269496 () Bool)

(declare-fun res!133682 () Bool)

(assert (=> b!269496 (=> (not res!133682) (not e!173865))))

(assert (=> b!269496 (= res!133682 (and (= (size!6608 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6608 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6608 a!3325))))))

(declare-fun res!133679 () Bool)

(assert (=> start!26116 (=> (not res!133679) (not e!173865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26116 (= res!133679 (validMask!0 mask!3868))))

(assert (=> start!26116 e!173865))

(declare-fun array_inv!4219 (array!13213) Bool)

(assert (=> start!26116 (array_inv!4219 a!3325)))

(assert (=> start!26116 true))

(declare-fun b!269497 () Bool)

(declare-fun res!133680 () Bool)

(assert (=> b!269497 (=> (not res!133680) (not e!173865))))

(declare-fun arrayContainsKey!0 (array!13213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269497 (= res!133680 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269498 () Bool)

(declare-fun res!133683 () Bool)

(assert (=> b!269498 (=> (not res!133683) (not e!173867))))

(assert (=> b!269498 (= res!133683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26116 res!133679) b!269496))

(assert (= (and b!269496 res!133682) b!269490))

(assert (= (and b!269490 res!133681) b!269494))

(assert (= (and b!269494 res!133685) b!269497))

(assert (= (and b!269497 res!133680) b!269491))

(assert (= (and b!269491 res!133684) b!269498))

(assert (= (and b!269498 res!133683) b!269492))

(assert (= (and b!269492 res!133686) b!269489))

(assert (= (and b!269489 c!45456) b!269493))

(assert (= (and b!269489 (not c!45456)) b!269495))

(declare-fun m!285331 () Bool)

(assert (=> b!269494 m!285331))

(declare-fun m!285333 () Bool)

(assert (=> b!269497 m!285333))

(declare-fun m!285335 () Bool)

(assert (=> b!269498 m!285335))

(declare-fun m!285337 () Bool)

(assert (=> b!269491 m!285337))

(declare-fun m!285339 () Bool)

(assert (=> b!269493 m!285339))

(declare-fun m!285341 () Bool)

(assert (=> b!269493 m!285341))

(declare-fun m!285343 () Bool)

(assert (=> b!269493 m!285343))

(declare-fun m!285345 () Bool)

(assert (=> b!269490 m!285345))

(declare-fun m!285347 () Bool)

(assert (=> start!26116 m!285347))

(declare-fun m!285349 () Bool)

(assert (=> start!26116 m!285349))

(push 1)

(assert (not b!269493))

(assert (not b!269494))

(assert (not b!269490))

(assert (not b!269491))

(assert (not b!269498))

(assert (not b!269497))

(assert (not start!26116))

(check-sat)

