; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26040 () Bool)

(assert start!26040)

(declare-fun res!132907 () Bool)

(declare-fun e!173480 () Bool)

(assert (=> start!26040 (=> (not res!132907) (not e!173480))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26040 (= res!132907 (validMask!0 mask!3868))))

(assert (=> start!26040 e!173480))

(declare-datatypes ((array!13137 0))(
  ( (array!13138 (arr!6218 (Array (_ BitVec 32) (_ BitVec 64))) (size!6570 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13137)

(declare-fun array_inv!4181 (array!13137) Bool)

(assert (=> start!26040 (array_inv!4181 a!3325)))

(assert (=> start!26040 true))

(declare-fun b!268629 () Bool)

(declare-fun e!173478 () Bool)

(assert (=> b!268629 (= e!173480 e!173478)))

(declare-fun res!132908 () Bool)

(assert (=> b!268629 (=> (not res!132908) (not e!173478))))

(declare-datatypes ((SeekEntryResult!1376 0))(
  ( (MissingZero!1376 (index!7674 (_ BitVec 32))) (Found!1376 (index!7675 (_ BitVec 32))) (Intermediate!1376 (undefined!2188 Bool) (index!7676 (_ BitVec 32)) (x!26037 (_ BitVec 32))) (Undefined!1376) (MissingVacant!1376 (index!7677 (_ BitVec 32))) )
))
(declare-fun lt!134940 () SeekEntryResult!1376)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268629 (= res!132908 (or (= lt!134940 (MissingZero!1376 i!1267)) (= lt!134940 (MissingVacant!1376 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13137 (_ BitVec 32)) SeekEntryResult!1376)

(assert (=> b!268629 (= lt!134940 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268630 () Bool)

(declare-fun res!132911 () Bool)

(assert (=> b!268630 (=> (not res!132911) (not e!173480))))

(declare-fun arrayContainsKey!0 (array!13137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268630 (= res!132911 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268631 () Bool)

(declare-fun res!132909 () Bool)

(assert (=> b!268631 (=> (not res!132909) (not e!173480))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268631 (= res!132909 (and (= (size!6570 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6570 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6570 a!3325))))))

(declare-fun b!268632 () Bool)

(declare-fun res!132912 () Bool)

(assert (=> b!268632 (=> (not res!132912) (not e!173480))))

(declare-datatypes ((List!4026 0))(
  ( (Nil!4023) (Cons!4022 (h!4689 (_ BitVec 64)) (t!9108 List!4026)) )
))
(declare-fun arrayNoDuplicates!0 (array!13137 (_ BitVec 32) List!4026) Bool)

(assert (=> b!268632 (= res!132912 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4023))))

(declare-fun b!268633 () Bool)

(declare-fun res!132910 () Bool)

(assert (=> b!268633 (=> (not res!132910) (not e!173480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268633 (= res!132910 (validKeyInArray!0 k!2581))))

(declare-fun b!268634 () Bool)

(assert (=> b!268634 (= e!173478 false)))

(declare-fun lt!134941 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13137 (_ BitVec 32)) Bool)

(assert (=> b!268634 (= lt!134941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26040 res!132907) b!268631))

(assert (= (and b!268631 res!132909) b!268633))

(assert (= (and b!268633 res!132910) b!268632))

(assert (= (and b!268632 res!132912) b!268630))

(assert (= (and b!268630 res!132911) b!268629))

(assert (= (and b!268629 res!132908) b!268634))

(declare-fun m!284715 () Bool)

(assert (=> start!26040 m!284715))

(declare-fun m!284717 () Bool)

(assert (=> start!26040 m!284717))

(declare-fun m!284719 () Bool)

(assert (=> b!268633 m!284719))

(declare-fun m!284721 () Bool)

(assert (=> b!268630 m!284721))

(declare-fun m!284723 () Bool)

(assert (=> b!268632 m!284723))

(declare-fun m!284725 () Bool)

(assert (=> b!268629 m!284725))

(declare-fun m!284727 () Bool)

(assert (=> b!268634 m!284727))

(push 1)

