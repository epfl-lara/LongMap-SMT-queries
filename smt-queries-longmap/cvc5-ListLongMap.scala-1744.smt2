; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31974 () Bool)

(assert start!31974)

(declare-fun res!173838 () Bool)

(declare-fun e!198378 () Bool)

(assert (=> start!31974 (=> (not res!173838) (not e!198378))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31974 (= res!173838 (validMask!0 mask!3777))))

(assert (=> start!31974 e!198378))

(assert (=> start!31974 true))

(declare-datatypes ((array!16294 0))(
  ( (array!16295 (arr!7710 (Array (_ BitVec 32) (_ BitVec 64))) (size!8062 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16294)

(declare-fun array_inv!5660 (array!16294) Bool)

(assert (=> start!31974 (array_inv!5660 a!3305)))

(declare-fun b!319404 () Bool)

(declare-fun res!173841 () Bool)

(assert (=> b!319404 (=> (not res!173841) (not e!198378))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319404 (= res!173841 (and (= (size!8062 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8062 a!3305))))))

(declare-fun b!319405 () Bool)

(declare-fun res!173839 () Bool)

(assert (=> b!319405 (=> (not res!173839) (not e!198378))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319405 (= res!173839 (validKeyInArray!0 k!2497))))

(declare-fun b!319407 () Bool)

(assert (=> b!319407 (= e!198378 false)))

(declare-datatypes ((SeekEntryResult!2806 0))(
  ( (MissingZero!2806 (index!13400 (_ BitVec 32))) (Found!2806 (index!13401 (_ BitVec 32))) (Intermediate!2806 (undefined!3618 Bool) (index!13402 (_ BitVec 32)) (x!31781 (_ BitVec 32))) (Undefined!2806) (MissingVacant!2806 (index!13403 (_ BitVec 32))) )
))
(declare-fun lt!155823 () SeekEntryResult!2806)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16294 (_ BitVec 32)) SeekEntryResult!2806)

(assert (=> b!319407 (= lt!155823 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(declare-fun b!319406 () Bool)

(declare-fun res!173840 () Bool)

(assert (=> b!319406 (=> (not res!173840) (not e!198378))))

(declare-fun arrayContainsKey!0 (array!16294 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319406 (= res!173840 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(assert (= (and start!31974 res!173838) b!319404))

(assert (= (and b!319404 res!173841) b!319405))

(assert (= (and b!319405 res!173839) b!319406))

(assert (= (and b!319406 res!173840) b!319407))

(declare-fun m!328233 () Bool)

(assert (=> start!31974 m!328233))

(declare-fun m!328235 () Bool)

(assert (=> start!31974 m!328235))

(declare-fun m!328237 () Bool)

(assert (=> b!319405 m!328237))

(declare-fun m!328239 () Bool)

(assert (=> b!319407 m!328239))

(declare-fun m!328241 () Bool)

(assert (=> b!319406 m!328241))

(push 1)

(assert (not b!319405))

(assert (not b!319406))

(assert (not start!31974))

(assert (not b!319407))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

