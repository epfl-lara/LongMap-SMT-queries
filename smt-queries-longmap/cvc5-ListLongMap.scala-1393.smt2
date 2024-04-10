; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27210 () Bool)

(assert start!27210)

(declare-fun b!281661 () Bool)

(declare-fun e!178967 () Bool)

(declare-datatypes ((array!14028 0))(
  ( (array!14029 (arr!6656 (Array (_ BitVec 32) (_ BitVec 64))) (size!7008 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14028)

(assert (=> b!281661 (= e!178967 (not (bvsle #b00000000000000000000000000000000 (size!7008 a!3325))))))

(declare-fun lt!139138 () array!14028)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1814 0))(
  ( (MissingZero!1814 (index!9426 (_ BitVec 32))) (Found!1814 (index!9427 (_ BitVec 32))) (Intermediate!1814 (undefined!2626 Bool) (index!9428 (_ BitVec 32)) (x!27652 (_ BitVec 32))) (Undefined!1814) (MissingVacant!1814 (index!9429 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14028 (_ BitVec 32)) SeekEntryResult!1814)

(assert (=> b!281661 (= (seekEntryOrOpen!0 (select (arr!6656 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6656 a!3325) i!1267 k!2581) startIndex!26) lt!139138 mask!3868))))

(declare-datatypes ((Unit!8912 0))(
  ( (Unit!8913) )
))
(declare-fun lt!139140 () Unit!8912)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14028 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8912)

(assert (=> b!281661 (= lt!139140 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4464 0))(
  ( (Nil!4461) (Cons!4460 (h!5130 (_ BitVec 64)) (t!9546 List!4464)) )
))
(declare-fun arrayNoDuplicates!0 (array!14028 (_ BitVec 32) List!4464) Bool)

(assert (=> b!281661 (arrayNoDuplicates!0 lt!139138 #b00000000000000000000000000000000 Nil!4461)))

(declare-fun lt!139141 () Unit!8912)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14028 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4464) Unit!8912)

(assert (=> b!281661 (= lt!139141 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4461))))

(declare-fun b!281662 () Bool)

(declare-fun res!144737 () Bool)

(declare-fun e!178968 () Bool)

(assert (=> b!281662 (=> (not res!144737) (not e!178968))))

(assert (=> b!281662 (= res!144737 (and (= (size!7008 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7008 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7008 a!3325))))))

(declare-fun b!281663 () Bool)

(declare-fun res!144735 () Bool)

(assert (=> b!281663 (=> (not res!144735) (not e!178968))))

(declare-fun arrayContainsKey!0 (array!14028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281663 (= res!144735 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281664 () Bool)

(declare-fun res!144733 () Bool)

(assert (=> b!281664 (=> (not res!144733) (not e!178967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281664 (= res!144733 (validKeyInArray!0 (select (arr!6656 a!3325) startIndex!26)))))

(declare-fun b!281665 () Bool)

(declare-fun res!144736 () Bool)

(declare-fun e!178969 () Bool)

(assert (=> b!281665 (=> (not res!144736) (not e!178969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14028 (_ BitVec 32)) Bool)

(assert (=> b!281665 (= res!144736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281666 () Bool)

(assert (=> b!281666 (= e!178969 e!178967)))

(declare-fun res!144734 () Bool)

(assert (=> b!281666 (=> (not res!144734) (not e!178967))))

(assert (=> b!281666 (= res!144734 (not (= startIndex!26 i!1267)))))

(assert (=> b!281666 (= lt!139138 (array!14029 (store (arr!6656 a!3325) i!1267 k!2581) (size!7008 a!3325)))))

(declare-fun res!144732 () Bool)

(assert (=> start!27210 (=> (not res!144732) (not e!178968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27210 (= res!144732 (validMask!0 mask!3868))))

(assert (=> start!27210 e!178968))

(declare-fun array_inv!4619 (array!14028) Bool)

(assert (=> start!27210 (array_inv!4619 a!3325)))

(assert (=> start!27210 true))

(declare-fun b!281667 () Bool)

(declare-fun res!144730 () Bool)

(assert (=> b!281667 (=> (not res!144730) (not e!178968))))

(assert (=> b!281667 (= res!144730 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4461))))

(declare-fun b!281668 () Bool)

(assert (=> b!281668 (= e!178968 e!178969)))

(declare-fun res!144738 () Bool)

(assert (=> b!281668 (=> (not res!144738) (not e!178969))))

(declare-fun lt!139139 () SeekEntryResult!1814)

(assert (=> b!281668 (= res!144738 (or (= lt!139139 (MissingZero!1814 i!1267)) (= lt!139139 (MissingVacant!1814 i!1267))))))

(assert (=> b!281668 (= lt!139139 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281669 () Bool)

(declare-fun res!144731 () Bool)

(assert (=> b!281669 (=> (not res!144731) (not e!178968))))

(assert (=> b!281669 (= res!144731 (validKeyInArray!0 k!2581))))

(assert (= (and start!27210 res!144732) b!281662))

(assert (= (and b!281662 res!144737) b!281669))

(assert (= (and b!281669 res!144731) b!281667))

(assert (= (and b!281667 res!144730) b!281663))

(assert (= (and b!281663 res!144735) b!281668))

(assert (= (and b!281668 res!144738) b!281665))

(assert (= (and b!281665 res!144736) b!281666))

(assert (= (and b!281666 res!144734) b!281664))

(assert (= (and b!281664 res!144733) b!281661))

(declare-fun m!296007 () Bool)

(assert (=> start!27210 m!296007))

(declare-fun m!296009 () Bool)

(assert (=> start!27210 m!296009))

(declare-fun m!296011 () Bool)

(assert (=> b!281664 m!296011))

(assert (=> b!281664 m!296011))

(declare-fun m!296013 () Bool)

(assert (=> b!281664 m!296013))

(declare-fun m!296015 () Bool)

(assert (=> b!281667 m!296015))

(declare-fun m!296017 () Bool)

(assert (=> b!281661 m!296017))

(declare-fun m!296019 () Bool)

(assert (=> b!281661 m!296019))

(declare-fun m!296021 () Bool)

(assert (=> b!281661 m!296021))

(assert (=> b!281661 m!296011))

(declare-fun m!296023 () Bool)

(assert (=> b!281661 m!296023))

(declare-fun m!296025 () Bool)

(assert (=> b!281661 m!296025))

(assert (=> b!281661 m!296011))

(declare-fun m!296027 () Bool)

(assert (=> b!281661 m!296027))

(assert (=> b!281661 m!296019))

(declare-fun m!296029 () Bool)

(assert (=> b!281661 m!296029))

(declare-fun m!296031 () Bool)

(assert (=> b!281663 m!296031))

(declare-fun m!296033 () Bool)

(assert (=> b!281669 m!296033))

(assert (=> b!281666 m!296021))

(declare-fun m!296035 () Bool)

(assert (=> b!281665 m!296035))

(declare-fun m!296037 () Bool)

(assert (=> b!281668 m!296037))

(push 1)

