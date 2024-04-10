; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26016 () Bool)

(assert start!26016)

(declare-fun b!268413 () Bool)

(declare-fun e!173372 () Bool)

(assert (=> b!268413 (= e!173372 false)))

(declare-fun lt!134868 () Bool)

(declare-datatypes ((array!13113 0))(
  ( (array!13114 (arr!6206 (Array (_ BitVec 32) (_ BitVec 64))) (size!6558 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13113)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13113 (_ BitVec 32)) Bool)

(assert (=> b!268413 (= lt!134868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268414 () Bool)

(declare-fun res!132695 () Bool)

(declare-fun e!173370 () Bool)

(assert (=> b!268414 (=> (not res!132695) (not e!173370))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268414 (= res!132695 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268415 () Bool)

(assert (=> b!268415 (= e!173370 e!173372)))

(declare-fun res!132693 () Bool)

(assert (=> b!268415 (=> (not res!132693) (not e!173372))))

(declare-datatypes ((SeekEntryResult!1364 0))(
  ( (MissingZero!1364 (index!7626 (_ BitVec 32))) (Found!1364 (index!7627 (_ BitVec 32))) (Intermediate!1364 (undefined!2176 Bool) (index!7628 (_ BitVec 32)) (x!25993 (_ BitVec 32))) (Undefined!1364) (MissingVacant!1364 (index!7629 (_ BitVec 32))) )
))
(declare-fun lt!134869 () SeekEntryResult!1364)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!268415 (= res!132693 (or (= lt!134869 (MissingZero!1364 i!1267)) (= lt!134869 (MissingVacant!1364 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13113 (_ BitVec 32)) SeekEntryResult!1364)

(assert (=> b!268415 (= lt!134869 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!132691 () Bool)

(assert (=> start!26016 (=> (not res!132691) (not e!173370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26016 (= res!132691 (validMask!0 mask!3868))))

(assert (=> start!26016 e!173370))

(declare-fun array_inv!4169 (array!13113) Bool)

(assert (=> start!26016 (array_inv!4169 a!3325)))

(assert (=> start!26016 true))

(declare-fun b!268416 () Bool)

(declare-fun res!132694 () Bool)

(assert (=> b!268416 (=> (not res!132694) (not e!173370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268416 (= res!132694 (validKeyInArray!0 k!2581))))

(declare-fun b!268417 () Bool)

(declare-fun res!132696 () Bool)

(assert (=> b!268417 (=> (not res!132696) (not e!173370))))

(declare-datatypes ((List!4014 0))(
  ( (Nil!4011) (Cons!4010 (h!4677 (_ BitVec 64)) (t!9096 List!4014)) )
))
(declare-fun arrayNoDuplicates!0 (array!13113 (_ BitVec 32) List!4014) Bool)

(assert (=> b!268417 (= res!132696 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4011))))

(declare-fun b!268418 () Bool)

(declare-fun res!132692 () Bool)

(assert (=> b!268418 (=> (not res!132692) (not e!173370))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268418 (= res!132692 (and (= (size!6558 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6558 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6558 a!3325))))))

(assert (= (and start!26016 res!132691) b!268418))

(assert (= (and b!268418 res!132692) b!268416))

(assert (= (and b!268416 res!132694) b!268417))

(assert (= (and b!268417 res!132696) b!268414))

(assert (= (and b!268414 res!132695) b!268415))

(assert (= (and b!268415 res!132693) b!268413))

(declare-fun m!284547 () Bool)

(assert (=> start!26016 m!284547))

(declare-fun m!284549 () Bool)

(assert (=> start!26016 m!284549))

(declare-fun m!284551 () Bool)

(assert (=> b!268414 m!284551))

(declare-fun m!284553 () Bool)

(assert (=> b!268416 m!284553))

(declare-fun m!284555 () Bool)

(assert (=> b!268417 m!284555))

(declare-fun m!284557 () Bool)

(assert (=> b!268413 m!284557))

(declare-fun m!284559 () Bool)

(assert (=> b!268415 m!284559))

(push 1)

