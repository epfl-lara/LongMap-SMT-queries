; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26304 () Bool)

(assert start!26304)

(declare-fun b!272523 () Bool)

(declare-fun res!136513 () Bool)

(declare-fun e!174884 () Bool)

(assert (=> b!272523 (=> (not res!136513) (not e!174884))))

(declare-datatypes ((array!13401 0))(
  ( (array!13402 (arr!6350 (Array (_ BitVec 32) (_ BitVec 64))) (size!6702 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13401)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13401 (_ BitVec 32)) Bool)

(assert (=> b!272523 (= res!136513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272524 () Bool)

(declare-fun res!136516 () Bool)

(assert (=> b!272524 (=> (not res!136516) (not e!174884))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272524 (= res!136516 (validKeyInArray!0 (select (arr!6350 a!3325) startIndex!26)))))

(declare-fun b!272525 () Bool)

(declare-fun res!136514 () Bool)

(declare-fun e!174882 () Bool)

(assert (=> b!272525 (=> (not res!136514) (not e!174882))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!272525 (= res!136514 (validKeyInArray!0 k!2581))))

(declare-fun b!272526 () Bool)

(assert (=> b!272526 (= e!174884 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((List!4158 0))(
  ( (Nil!4155) (Cons!4154 (h!4821 (_ BitVec 64)) (t!9240 List!4158)) )
))
(declare-fun arrayNoDuplicates!0 (array!13401 (_ BitVec 32) List!4158) Bool)

(assert (=> b!272526 (arrayNoDuplicates!0 (array!13402 (store (arr!6350 a!3325) i!1267 k!2581) (size!6702 a!3325)) #b00000000000000000000000000000000 Nil!4155)))

(declare-datatypes ((Unit!8503 0))(
  ( (Unit!8504) )
))
(declare-fun lt!136021 () Unit!8503)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13401 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4158) Unit!8503)

(assert (=> b!272526 (= lt!136021 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4155))))

(declare-fun res!136518 () Bool)

(assert (=> start!26304 (=> (not res!136518) (not e!174882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26304 (= res!136518 (validMask!0 mask!3868))))

(assert (=> start!26304 e!174882))

(declare-fun array_inv!4313 (array!13401) Bool)

(assert (=> start!26304 (array_inv!4313 a!3325)))

(assert (=> start!26304 true))

(declare-fun b!272527 () Bool)

(declare-fun res!136520 () Bool)

(assert (=> b!272527 (=> (not res!136520) (not e!174882))))

(assert (=> b!272527 (= res!136520 (and (= (size!6702 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6702 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6702 a!3325))))))

(declare-fun b!272528 () Bool)

(declare-fun res!136521 () Bool)

(assert (=> b!272528 (=> (not res!136521) (not e!174884))))

(assert (=> b!272528 (= res!136521 (not (= startIndex!26 i!1267)))))

(declare-fun b!272529 () Bool)

(declare-fun res!136519 () Bool)

(assert (=> b!272529 (=> (not res!136519) (not e!174882))))

(assert (=> b!272529 (= res!136519 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4155))))

(declare-fun b!272530 () Bool)

(assert (=> b!272530 (= e!174882 e!174884)))

(declare-fun res!136517 () Bool)

(assert (=> b!272530 (=> (not res!136517) (not e!174884))))

(declare-datatypes ((SeekEntryResult!1508 0))(
  ( (MissingZero!1508 (index!8202 (_ BitVec 32))) (Found!1508 (index!8203 (_ BitVec 32))) (Intermediate!1508 (undefined!2320 Bool) (index!8204 (_ BitVec 32)) (x!26521 (_ BitVec 32))) (Undefined!1508) (MissingVacant!1508 (index!8205 (_ BitVec 32))) )
))
(declare-fun lt!136020 () SeekEntryResult!1508)

(assert (=> b!272530 (= res!136517 (or (= lt!136020 (MissingZero!1508 i!1267)) (= lt!136020 (MissingVacant!1508 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13401 (_ BitVec 32)) SeekEntryResult!1508)

(assert (=> b!272530 (= lt!136020 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!272531 () Bool)

(declare-fun res!136515 () Bool)

(assert (=> b!272531 (=> (not res!136515) (not e!174882))))

(declare-fun arrayContainsKey!0 (array!13401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272531 (= res!136515 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26304 res!136518) b!272527))

(assert (= (and b!272527 res!136520) b!272525))

(assert (= (and b!272525 res!136514) b!272529))

(assert (= (and b!272529 res!136519) b!272531))

(assert (= (and b!272531 res!136515) b!272530))

(assert (= (and b!272530 res!136517) b!272523))

(assert (= (and b!272523 res!136513) b!272528))

(assert (= (and b!272528 res!136521) b!272524))

(assert (= (and b!272524 res!136516) b!272526))

(declare-fun m!287613 () Bool)

(assert (=> start!26304 m!287613))

(declare-fun m!287615 () Bool)

(assert (=> start!26304 m!287615))

(declare-fun m!287617 () Bool)

(assert (=> b!272524 m!287617))

(assert (=> b!272524 m!287617))

(declare-fun m!287619 () Bool)

(assert (=> b!272524 m!287619))

(declare-fun m!287621 () Bool)

(assert (=> b!272530 m!287621))

(declare-fun m!287623 () Bool)

(assert (=> b!272531 m!287623))

(declare-fun m!287625 () Bool)

(assert (=> b!272526 m!287625))

(declare-fun m!287627 () Bool)

(assert (=> b!272526 m!287627))

(declare-fun m!287629 () Bool)

(assert (=> b!272526 m!287629))

(declare-fun m!287631 () Bool)

(assert (=> b!272525 m!287631))

(declare-fun m!287633 () Bool)

(assert (=> b!272529 m!287633))

(declare-fun m!287635 () Bool)

(assert (=> b!272523 m!287635))

(push 1)

