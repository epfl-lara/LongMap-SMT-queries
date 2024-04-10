; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27202 () Bool)

(assert start!27202)

(declare-fun b!281553 () Bool)

(declare-fun e!178921 () Bool)

(declare-fun e!178922 () Bool)

(assert (=> b!281553 (= e!178921 e!178922)))

(declare-fun res!144623 () Bool)

(assert (=> b!281553 (=> (not res!144623) (not e!178922))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281553 (= res!144623 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!14020 0))(
  ( (array!14021 (arr!6652 (Array (_ BitVec 32) (_ BitVec 64))) (size!7004 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14020)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!139092 () array!14020)

(assert (=> b!281553 (= lt!139092 (array!14021 (store (arr!6652 a!3325) i!1267 k!2581) (size!7004 a!3325)))))

(declare-fun b!281554 () Bool)

(declare-fun res!144630 () Bool)

(declare-fun e!178919 () Bool)

(assert (=> b!281554 (=> (not res!144630) (not e!178919))))

(declare-fun arrayContainsKey!0 (array!14020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281554 (= res!144630 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281555 () Bool)

(assert (=> b!281555 (= e!178922 (not true))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1810 0))(
  ( (MissingZero!1810 (index!9410 (_ BitVec 32))) (Found!1810 (index!9411 (_ BitVec 32))) (Intermediate!1810 (undefined!2622 Bool) (index!9412 (_ BitVec 32)) (x!27632 (_ BitVec 32))) (Undefined!1810) (MissingVacant!1810 (index!9413 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14020 (_ BitVec 32)) SeekEntryResult!1810)

(assert (=> b!281555 (= (seekEntryOrOpen!0 (select (arr!6652 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6652 a!3325) i!1267 k!2581) startIndex!26) lt!139092 mask!3868))))

(declare-datatypes ((Unit!8904 0))(
  ( (Unit!8905) )
))
(declare-fun lt!139090 () Unit!8904)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14020 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8904)

(assert (=> b!281555 (= lt!139090 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4460 0))(
  ( (Nil!4457) (Cons!4456 (h!5126 (_ BitVec 64)) (t!9542 List!4460)) )
))
(declare-fun arrayNoDuplicates!0 (array!14020 (_ BitVec 32) List!4460) Bool)

(assert (=> b!281555 (arrayNoDuplicates!0 lt!139092 #b00000000000000000000000000000000 Nil!4457)))

(declare-fun lt!139093 () Unit!8904)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14020 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4460) Unit!8904)

(assert (=> b!281555 (= lt!139093 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4457))))

(declare-fun b!281556 () Bool)

(declare-fun res!144629 () Bool)

(assert (=> b!281556 (=> (not res!144629) (not e!178921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14020 (_ BitVec 32)) Bool)

(assert (=> b!281556 (= res!144629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281557 () Bool)

(declare-fun res!144626 () Bool)

(assert (=> b!281557 (=> (not res!144626) (not e!178919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281557 (= res!144626 (validKeyInArray!0 k!2581))))

(declare-fun b!281558 () Bool)

(declare-fun res!144627 () Bool)

(assert (=> b!281558 (=> (not res!144627) (not e!178922))))

(assert (=> b!281558 (= res!144627 (validKeyInArray!0 (select (arr!6652 a!3325) startIndex!26)))))

(declare-fun res!144625 () Bool)

(assert (=> start!27202 (=> (not res!144625) (not e!178919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27202 (= res!144625 (validMask!0 mask!3868))))

(assert (=> start!27202 e!178919))

(declare-fun array_inv!4615 (array!14020) Bool)

(assert (=> start!27202 (array_inv!4615 a!3325)))

(assert (=> start!27202 true))

(declare-fun b!281559 () Bool)

(declare-fun res!144622 () Bool)

(assert (=> b!281559 (=> (not res!144622) (not e!178919))))

(assert (=> b!281559 (= res!144622 (and (= (size!7004 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7004 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7004 a!3325))))))

(declare-fun b!281560 () Bool)

(declare-fun res!144628 () Bool)

(assert (=> b!281560 (=> (not res!144628) (not e!178919))))

(assert (=> b!281560 (= res!144628 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4457))))

(declare-fun b!281561 () Bool)

(assert (=> b!281561 (= e!178919 e!178921)))

(declare-fun res!144624 () Bool)

(assert (=> b!281561 (=> (not res!144624) (not e!178921))))

(declare-fun lt!139091 () SeekEntryResult!1810)

(assert (=> b!281561 (= res!144624 (or (= lt!139091 (MissingZero!1810 i!1267)) (= lt!139091 (MissingVacant!1810 i!1267))))))

(assert (=> b!281561 (= lt!139091 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27202 res!144625) b!281559))

(assert (= (and b!281559 res!144622) b!281557))

(assert (= (and b!281557 res!144626) b!281560))

(assert (= (and b!281560 res!144628) b!281554))

(assert (= (and b!281554 res!144630) b!281561))

(assert (= (and b!281561 res!144624) b!281556))

(assert (= (and b!281556 res!144629) b!281553))

(assert (= (and b!281553 res!144623) b!281558))

(assert (= (and b!281558 res!144627) b!281555))

(declare-fun m!295879 () Bool)

(assert (=> start!27202 m!295879))

(declare-fun m!295881 () Bool)

(assert (=> start!27202 m!295881))

(declare-fun m!295883 () Bool)

(assert (=> b!281556 m!295883))

(declare-fun m!295885 () Bool)

(assert (=> b!281558 m!295885))

(assert (=> b!281558 m!295885))

(declare-fun m!295887 () Bool)

(assert (=> b!281558 m!295887))

(declare-fun m!295889 () Bool)

(assert (=> b!281560 m!295889))

(declare-fun m!295891 () Bool)

(assert (=> b!281561 m!295891))

(declare-fun m!295893 () Bool)

(assert (=> b!281555 m!295893))

(declare-fun m!295895 () Bool)

(assert (=> b!281555 m!295895))

(assert (=> b!281555 m!295895))

(declare-fun m!295897 () Bool)

(assert (=> b!281555 m!295897))

(declare-fun m!295899 () Bool)

(assert (=> b!281555 m!295899))

(assert (=> b!281555 m!295885))

(declare-fun m!295901 () Bool)

(assert (=> b!281555 m!295901))

(declare-fun m!295903 () Bool)

(assert (=> b!281555 m!295903))

(assert (=> b!281555 m!295885))

(declare-fun m!295905 () Bool)

(assert (=> b!281555 m!295905))

(declare-fun m!295907 () Bool)

(assert (=> b!281554 m!295907))

(declare-fun m!295909 () Bool)

(assert (=> b!281557 m!295909))

(assert (=> b!281553 m!295899))

(push 1)

(assert (not b!281556))

(assert (not b!281561))

(assert (not b!281557))

(assert (not start!27202))

