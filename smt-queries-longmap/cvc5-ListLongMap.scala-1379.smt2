; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27126 () Bool)

(assert start!27126)

(declare-fun b!280527 () Bool)

(declare-fun res!143603 () Bool)

(declare-fun e!178571 () Bool)

(assert (=> b!280527 (=> (not res!143603) (not e!178571))))

(declare-datatypes ((array!13944 0))(
  ( (array!13945 (arr!6614 (Array (_ BitVec 32) (_ BitVec 64))) (size!6966 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13944)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!280527 (= res!143603 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!280528 () Bool)

(declare-fun res!143598 () Bool)

(declare-fun e!178570 () Bool)

(assert (=> b!280528 (=> (not res!143598) (not e!178570))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!280528 (= res!143598 (not (= startIndex!26 i!1267)))))

(declare-fun res!143596 () Bool)

(assert (=> start!27126 (=> (not res!143596) (not e!178571))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27126 (= res!143596 (validMask!0 mask!3868))))

(assert (=> start!27126 e!178571))

(declare-fun array_inv!4577 (array!13944) Bool)

(assert (=> start!27126 (array_inv!4577 a!3325)))

(assert (=> start!27126 true))

(declare-fun b!280529 () Bool)

(declare-fun res!143599 () Bool)

(assert (=> b!280529 (=> (not res!143599) (not e!178571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!280529 (= res!143599 (validKeyInArray!0 k!2581))))

(declare-fun b!280530 () Bool)

(declare-fun res!143597 () Bool)

(assert (=> b!280530 (=> (not res!143597) (not e!178570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13944 (_ BitVec 32)) Bool)

(assert (=> b!280530 (= res!143597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!280531 () Bool)

(assert (=> b!280531 (= e!178571 e!178570)))

(declare-fun res!143602 () Bool)

(assert (=> b!280531 (=> (not res!143602) (not e!178570))))

(declare-datatypes ((SeekEntryResult!1772 0))(
  ( (MissingZero!1772 (index!9258 (_ BitVec 32))) (Found!1772 (index!9259 (_ BitVec 32))) (Intermediate!1772 (undefined!2584 Bool) (index!9260 (_ BitVec 32)) (x!27498 (_ BitVec 32))) (Undefined!1772) (MissingVacant!1772 (index!9261 (_ BitVec 32))) )
))
(declare-fun lt!138846 () SeekEntryResult!1772)

(assert (=> b!280531 (= res!143602 (or (= lt!138846 (MissingZero!1772 i!1267)) (= lt!138846 (MissingVacant!1772 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13944 (_ BitVec 32)) SeekEntryResult!1772)

(assert (=> b!280531 (= lt!138846 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!280532 () Bool)

(assert (=> b!280532 (= e!178570 (not true))))

(declare-datatypes ((List!4422 0))(
  ( (Nil!4419) (Cons!4418 (h!5088 (_ BitVec 64)) (t!9504 List!4422)) )
))
(declare-fun arrayNoDuplicates!0 (array!13944 (_ BitVec 32) List!4422) Bool)

(assert (=> b!280532 (arrayNoDuplicates!0 (array!13945 (store (arr!6614 a!3325) i!1267 k!2581) (size!6966 a!3325)) #b00000000000000000000000000000000 Nil!4419)))

(declare-datatypes ((Unit!8828 0))(
  ( (Unit!8829) )
))
(declare-fun lt!138847 () Unit!8828)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13944 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4422) Unit!8828)

(assert (=> b!280532 (= lt!138847 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4419))))

(declare-fun b!280533 () Bool)

(declare-fun res!143604 () Bool)

(assert (=> b!280533 (=> (not res!143604) (not e!178571))))

(assert (=> b!280533 (= res!143604 (and (= (size!6966 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6966 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6966 a!3325))))))

(declare-fun b!280534 () Bool)

(declare-fun res!143601 () Bool)

(assert (=> b!280534 (=> (not res!143601) (not e!178571))))

(assert (=> b!280534 (= res!143601 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4419))))

(declare-fun b!280535 () Bool)

(declare-fun res!143600 () Bool)

(assert (=> b!280535 (=> (not res!143600) (not e!178570))))

(assert (=> b!280535 (= res!143600 (validKeyInArray!0 (select (arr!6614 a!3325) startIndex!26)))))

(assert (= (and start!27126 res!143596) b!280533))

(assert (= (and b!280533 res!143604) b!280529))

(assert (= (and b!280529 res!143599) b!280534))

(assert (= (and b!280534 res!143601) b!280527))

(assert (= (and b!280527 res!143603) b!280531))

(assert (= (and b!280531 res!143602) b!280530))

(assert (= (and b!280530 res!143597) b!280528))

(assert (= (and b!280528 res!143598) b!280535))

(assert (= (and b!280535 res!143600) b!280532))

(declare-fun m!294951 () Bool)

(assert (=> b!280532 m!294951))

(declare-fun m!294953 () Bool)

(assert (=> b!280532 m!294953))

(declare-fun m!294955 () Bool)

(assert (=> b!280532 m!294955))

(declare-fun m!294957 () Bool)

(assert (=> b!280531 m!294957))

(declare-fun m!294959 () Bool)

(assert (=> b!280534 m!294959))

(declare-fun m!294961 () Bool)

(assert (=> b!280535 m!294961))

(assert (=> b!280535 m!294961))

(declare-fun m!294963 () Bool)

(assert (=> b!280535 m!294963))

(declare-fun m!294965 () Bool)

(assert (=> start!27126 m!294965))

(declare-fun m!294967 () Bool)

(assert (=> start!27126 m!294967))

(declare-fun m!294969 () Bool)

(assert (=> b!280527 m!294969))

(declare-fun m!294971 () Bool)

(assert (=> b!280530 m!294971))

(declare-fun m!294973 () Bool)

(assert (=> b!280529 m!294973))

(push 1)

