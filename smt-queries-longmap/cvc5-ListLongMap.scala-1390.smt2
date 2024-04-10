; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27192 () Bool)

(assert start!27192)

(declare-fun b!281418 () Bool)

(declare-fun res!144495 () Bool)

(declare-fun e!178866 () Bool)

(assert (=> b!281418 (=> (not res!144495) (not e!178866))))

(declare-datatypes ((array!14010 0))(
  ( (array!14011 (arr!6647 (Array (_ BitVec 32) (_ BitVec 64))) (size!6999 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14010)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14010 (_ BitVec 32)) Bool)

(assert (=> b!281418 (= res!144495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281420 () Bool)

(declare-fun res!144492 () Bool)

(assert (=> b!281420 (=> (not res!144492) (not e!178866))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281420 (= res!144492 (validKeyInArray!0 (select (arr!6647 a!3325) startIndex!26)))))

(declare-fun b!281421 () Bool)

(declare-fun res!144494 () Bool)

(declare-fun e!178867 () Bool)

(assert (=> b!281421 (=> (not res!144494) (not e!178867))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!281421 (= res!144494 (validKeyInArray!0 k!2581))))

(declare-fun b!281422 () Bool)

(assert (=> b!281422 (= e!178867 e!178866)))

(declare-fun res!144489 () Bool)

(assert (=> b!281422 (=> (not res!144489) (not e!178866))))

(declare-datatypes ((SeekEntryResult!1805 0))(
  ( (MissingZero!1805 (index!9390 (_ BitVec 32))) (Found!1805 (index!9391 (_ BitVec 32))) (Intermediate!1805 (undefined!2617 Bool) (index!9392 (_ BitVec 32)) (x!27619 (_ BitVec 32))) (Undefined!1805) (MissingVacant!1805 (index!9393 (_ BitVec 32))) )
))
(declare-fun lt!139044 () SeekEntryResult!1805)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281422 (= res!144489 (or (= lt!139044 (MissingZero!1805 i!1267)) (= lt!139044 (MissingVacant!1805 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14010 (_ BitVec 32)) SeekEntryResult!1805)

(assert (=> b!281422 (= lt!139044 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281423 () Bool)

(declare-fun res!144488 () Bool)

(assert (=> b!281423 (=> (not res!144488) (not e!178866))))

(assert (=> b!281423 (= res!144488 (not (= startIndex!26 i!1267)))))

(declare-fun b!281424 () Bool)

(assert (=> b!281424 (= e!178866 (not true))))

(declare-datatypes ((List!4455 0))(
  ( (Nil!4452) (Cons!4451 (h!5121 (_ BitVec 64)) (t!9537 List!4455)) )
))
(declare-fun arrayNoDuplicates!0 (array!14010 (_ BitVec 32) List!4455) Bool)

(assert (=> b!281424 (arrayNoDuplicates!0 (array!14011 (store (arr!6647 a!3325) i!1267 k!2581) (size!6999 a!3325)) #b00000000000000000000000000000000 Nil!4452)))

(declare-datatypes ((Unit!8894 0))(
  ( (Unit!8895) )
))
(declare-fun lt!139045 () Unit!8894)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14010 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4455) Unit!8894)

(assert (=> b!281424 (= lt!139045 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4452))))

(declare-fun b!281425 () Bool)

(declare-fun res!144487 () Bool)

(assert (=> b!281425 (=> (not res!144487) (not e!178867))))

(assert (=> b!281425 (= res!144487 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4452))))

(declare-fun b!281426 () Bool)

(declare-fun res!144490 () Bool)

(assert (=> b!281426 (=> (not res!144490) (not e!178867))))

(assert (=> b!281426 (= res!144490 (and (= (size!6999 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6999 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6999 a!3325))))))

(declare-fun res!144493 () Bool)

(assert (=> start!27192 (=> (not res!144493) (not e!178867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27192 (= res!144493 (validMask!0 mask!3868))))

(assert (=> start!27192 e!178867))

(declare-fun array_inv!4610 (array!14010) Bool)

(assert (=> start!27192 (array_inv!4610 a!3325)))

(assert (=> start!27192 true))

(declare-fun b!281419 () Bool)

(declare-fun res!144491 () Bool)

(assert (=> b!281419 (=> (not res!144491) (not e!178867))))

(declare-fun arrayContainsKey!0 (array!14010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281419 (= res!144491 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27192 res!144493) b!281426))

(assert (= (and b!281426 res!144490) b!281421))

(assert (= (and b!281421 res!144494) b!281425))

(assert (= (and b!281425 res!144487) b!281419))

(assert (= (and b!281419 res!144491) b!281422))

(assert (= (and b!281422 res!144489) b!281418))

(assert (= (and b!281418 res!144495) b!281423))

(assert (= (and b!281423 res!144488) b!281420))

(assert (= (and b!281420 res!144492) b!281424))

(declare-fun m!295743 () Bool)

(assert (=> b!281421 m!295743))

(declare-fun m!295745 () Bool)

(assert (=> start!27192 m!295745))

(declare-fun m!295747 () Bool)

(assert (=> start!27192 m!295747))

(declare-fun m!295749 () Bool)

(assert (=> b!281424 m!295749))

(declare-fun m!295751 () Bool)

(assert (=> b!281424 m!295751))

(declare-fun m!295753 () Bool)

(assert (=> b!281424 m!295753))

(declare-fun m!295755 () Bool)

(assert (=> b!281425 m!295755))

(declare-fun m!295757 () Bool)

(assert (=> b!281418 m!295757))

(declare-fun m!295759 () Bool)

(assert (=> b!281422 m!295759))

(declare-fun m!295761 () Bool)

(assert (=> b!281419 m!295761))

(declare-fun m!295763 () Bool)

(assert (=> b!281420 m!295763))

(assert (=> b!281420 m!295763))

(declare-fun m!295765 () Bool)

(assert (=> b!281420 m!295765))

(push 1)

