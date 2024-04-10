; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25784 () Bool)

(assert start!25784)

(declare-fun b!267326 () Bool)

(declare-fun res!131627 () Bool)

(declare-fun e!172806 () Bool)

(assert (=> b!267326 (=> (not res!131627) (not e!172806))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267326 (= res!131627 (validKeyInArray!0 k!2698))))

(declare-fun b!267327 () Bool)

(declare-fun e!172808 () Bool)

(assert (=> b!267327 (= e!172806 e!172808)))

(declare-fun res!131628 () Bool)

(assert (=> b!267327 (=> (not res!131628) (not e!172808))))

(declare-datatypes ((SeekEntryResult!1327 0))(
  ( (MissingZero!1327 (index!7478 (_ BitVec 32))) (Found!1327 (index!7479 (_ BitVec 32))) (Intermediate!1327 (undefined!2139 Bool) (index!7480 (_ BitVec 32)) (x!25764 (_ BitVec 32))) (Undefined!1327) (MissingVacant!1327 (index!7481 (_ BitVec 32))) )
))
(declare-fun lt!134688 () SeekEntryResult!1327)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267327 (= res!131628 (or (= lt!134688 (MissingZero!1327 i!1355)) (= lt!134688 (MissingVacant!1327 i!1355))))))

(declare-datatypes ((array!12963 0))(
  ( (array!12964 (arr!6136 (Array (_ BitVec 32) (_ BitVec 64))) (size!6488 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12963)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12963 (_ BitVec 32)) SeekEntryResult!1327)

(assert (=> b!267327 (= lt!134688 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!267328 () Bool)

(declare-fun res!131626 () Bool)

(assert (=> b!267328 (=> (not res!131626) (not e!172808))))

(declare-datatypes ((List!3950 0))(
  ( (Nil!3947) (Cons!3946 (h!4613 (_ BitVec 64)) (t!9032 List!3950)) )
))
(declare-fun arrayNoDuplicates!0 (array!12963 (_ BitVec 32) List!3950) Bool)

(assert (=> b!267328 (= res!131626 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3947))))

(declare-fun b!267329 () Bool)

(assert (=> b!267329 (= e!172808 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12963 (_ BitVec 32)) Bool)

(assert (=> b!267329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12964 (store (arr!6136 a!3436) i!1355 k!2698) (size!6488 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8303 0))(
  ( (Unit!8304) )
))
(declare-fun lt!134689 () Unit!8303)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12963 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8303)

(assert (=> b!267329 (= lt!134689 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!267330 () Bool)

(declare-fun res!131623 () Bool)

(assert (=> b!267330 (=> (not res!131623) (not e!172806))))

(assert (=> b!267330 (= res!131623 (and (= (size!6488 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6488 a!3436))))))

(declare-fun res!131624 () Bool)

(assert (=> start!25784 (=> (not res!131624) (not e!172806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25784 (= res!131624 (validMask!0 mask!4002))))

(assert (=> start!25784 e!172806))

(assert (=> start!25784 true))

(declare-fun array_inv!4099 (array!12963) Bool)

(assert (=> start!25784 (array_inv!4099 a!3436)))

(declare-fun b!267325 () Bool)

(declare-fun res!131621 () Bool)

(assert (=> b!267325 (=> (not res!131621) (not e!172806))))

(declare-fun arrayContainsKey!0 (array!12963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267325 (= res!131621 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267331 () Bool)

(declare-fun res!131622 () Bool)

(assert (=> b!267331 (=> (not res!131622) (not e!172808))))

(assert (=> b!267331 (= res!131622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267332 () Bool)

(declare-fun res!131625 () Bool)

(assert (=> b!267332 (=> (not res!131625) (not e!172808))))

(assert (=> b!267332 (= res!131625 (bvslt #b00000000000000000000000000000000 (size!6488 a!3436)))))

(assert (= (and start!25784 res!131624) b!267330))

(assert (= (and b!267330 res!131623) b!267326))

(assert (= (and b!267326 res!131627) b!267325))

(assert (= (and b!267325 res!131621) b!267327))

(assert (= (and b!267327 res!131628) b!267331))

(assert (= (and b!267331 res!131622) b!267328))

(assert (= (and b!267328 res!131626) b!267332))

(assert (= (and b!267332 res!131625) b!267329))

(declare-fun m!283723 () Bool)

(assert (=> b!267328 m!283723))

(declare-fun m!283725 () Bool)

(assert (=> b!267327 m!283725))

(declare-fun m!283727 () Bool)

(assert (=> b!267326 m!283727))

(declare-fun m!283729 () Bool)

(assert (=> b!267329 m!283729))

(declare-fun m!283731 () Bool)

(assert (=> b!267329 m!283731))

(declare-fun m!283733 () Bool)

(assert (=> b!267329 m!283733))

(declare-fun m!283735 () Bool)

(assert (=> b!267331 m!283735))

(declare-fun m!283737 () Bool)

(assert (=> start!25784 m!283737))

(declare-fun m!283739 () Bool)

(assert (=> start!25784 m!283739))

(declare-fun m!283741 () Bool)

(assert (=> b!267325 m!283741))

(push 1)

