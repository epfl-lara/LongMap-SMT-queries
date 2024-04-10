; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27520 () Bool)

(assert start!27520)

(declare-fun b!284367 () Bool)

(declare-fun res!146875 () Bool)

(declare-fun e!180408 () Bool)

(assert (=> b!284367 (=> (not res!146875) (not e!180408))))

(declare-datatypes ((array!14170 0))(
  ( (array!14171 (arr!6724 (Array (_ BitVec 32) (_ BitVec 64))) (size!7076 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14170)

(declare-datatypes ((List!4532 0))(
  ( (Nil!4529) (Cons!4528 (h!5201 (_ BitVec 64)) (t!9614 List!4532)) )
))
(declare-fun arrayNoDuplicates!0 (array!14170 (_ BitVec 32) List!4532) Bool)

(assert (=> b!284367 (= res!146875 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4529))))

(declare-fun b!284368 () Bool)

(declare-fun e!180410 () Bool)

(assert (=> b!284368 (= e!180408 e!180410)))

(declare-fun res!146880 () Bool)

(assert (=> b!284368 (=> (not res!146880) (not e!180410))))

(declare-datatypes ((SeekEntryResult!1882 0))(
  ( (MissingZero!1882 (index!9698 (_ BitVec 32))) (Found!1882 (index!9699 (_ BitVec 32))) (Intermediate!1882 (undefined!2694 Bool) (index!9700 (_ BitVec 32)) (x!27905 (_ BitVec 32))) (Undefined!1882) (MissingVacant!1882 (index!9701 (_ BitVec 32))) )
))
(declare-fun lt!140497 () SeekEntryResult!1882)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!284368 (= res!146880 (or (= lt!140497 (MissingZero!1882 i!1267)) (= lt!140497 (MissingVacant!1882 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14170 (_ BitVec 32)) SeekEntryResult!1882)

(assert (=> b!284368 (= lt!140497 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!284369 () Bool)

(declare-fun res!146878 () Bool)

(assert (=> b!284369 (=> (not res!146878) (not e!180408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!284369 (= res!146878 (validKeyInArray!0 k!2581))))

(declare-fun b!284370 () Bool)

(assert (=> b!284370 (= e!180410 false)))

(declare-fun lt!140496 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14170 (_ BitVec 32)) Bool)

(assert (=> b!284370 (= lt!140496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!146877 () Bool)

(assert (=> start!27520 (=> (not res!146877) (not e!180408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27520 (= res!146877 (validMask!0 mask!3868))))

(assert (=> start!27520 e!180408))

(declare-fun array_inv!4687 (array!14170) Bool)

(assert (=> start!27520 (array_inv!4687 a!3325)))

(assert (=> start!27520 true))

(declare-fun b!284371 () Bool)

(declare-fun res!146876 () Bool)

(assert (=> b!284371 (=> (not res!146876) (not e!180408))))

(declare-fun arrayContainsKey!0 (array!14170 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!284371 (= res!146876 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!284372 () Bool)

(declare-fun res!146879 () Bool)

(assert (=> b!284372 (=> (not res!146879) (not e!180408))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!284372 (= res!146879 (and (= (size!7076 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7076 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7076 a!3325))))))

(assert (= (and start!27520 res!146877) b!284372))

(assert (= (and b!284372 res!146879) b!284369))

(assert (= (and b!284369 res!146878) b!284367))

(assert (= (and b!284367 res!146875) b!284371))

(assert (= (and b!284371 res!146876) b!284368))

(assert (= (and b!284368 res!146880) b!284370))

(declare-fun m!299407 () Bool)

(assert (=> b!284371 m!299407))

(declare-fun m!299409 () Bool)

(assert (=> start!27520 m!299409))

(declare-fun m!299411 () Bool)

(assert (=> start!27520 m!299411))

(declare-fun m!299413 () Bool)

(assert (=> b!284370 m!299413))

(declare-fun m!299415 () Bool)

(assert (=> b!284368 m!299415))

(declare-fun m!299417 () Bool)

(assert (=> b!284367 m!299417))

(declare-fun m!299419 () Bool)

(assert (=> b!284369 m!299419))

(push 1)

(assert (not start!27520))

(assert (not b!284370))

(assert (not b!284369))

(assert (not b!284371))

(assert (not b!284368))

(assert (not b!284367))

(check-sat)

