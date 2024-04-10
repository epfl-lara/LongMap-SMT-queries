; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31988 () Bool)

(assert start!31988)

(declare-fun b!319459 () Bool)

(declare-fun res!173844 () Bool)

(declare-fun e!198411 () Bool)

(assert (=> b!319459 (=> (not res!173844) (not e!198411))))

(declare-datatypes ((array!16295 0))(
  ( (array!16296 (arr!7711 (Array (_ BitVec 32) (_ BitVec 64))) (size!8063 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16295)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319459 (= res!173844 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173842 () Bool)

(assert (=> start!31988 (=> (not res!173842) (not e!198411))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31988 (= res!173842 (validMask!0 mask!3777))))

(assert (=> start!31988 e!198411))

(assert (=> start!31988 true))

(declare-fun array_inv!5674 (array!16295) Bool)

(assert (=> start!31988 (array_inv!5674 a!3305)))

(declare-fun b!319457 () Bool)

(declare-fun res!173843 () Bool)

(assert (=> b!319457 (=> (not res!173843) (not e!198411))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319457 (= res!173843 (and (= (size!8063 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8063 a!3305))))))

(declare-fun b!319458 () Bool)

(declare-fun res!173841 () Bool)

(assert (=> b!319458 (=> (not res!173841) (not e!198411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319458 (= res!173841 (validKeyInArray!0 k!2497))))

(declare-fun b!319460 () Bool)

(assert (=> b!319460 (= e!198411 false)))

(declare-datatypes ((SeekEntryResult!2842 0))(
  ( (MissingZero!2842 (index!13544 (_ BitVec 32))) (Found!2842 (index!13545 (_ BitVec 32))) (Intermediate!2842 (undefined!3654 Bool) (index!13546 (_ BitVec 32)) (x!31820 (_ BitVec 32))) (Undefined!2842) (MissingVacant!2842 (index!13547 (_ BitVec 32))) )
))
(declare-fun lt!155805 () SeekEntryResult!2842)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16295 (_ BitVec 32)) SeekEntryResult!2842)

(assert (=> b!319460 (= lt!155805 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(assert (= (and start!31988 res!173842) b!319457))

(assert (= (and b!319457 res!173843) b!319458))

(assert (= (and b!319458 res!173841) b!319459))

(assert (= (and b!319459 res!173844) b!319460))

(declare-fun m!328057 () Bool)

(assert (=> b!319459 m!328057))

(declare-fun m!328059 () Bool)

(assert (=> start!31988 m!328059))

(declare-fun m!328061 () Bool)

(assert (=> start!31988 m!328061))

(declare-fun m!328063 () Bool)

(assert (=> b!319458 m!328063))

(declare-fun m!328065 () Bool)

(assert (=> b!319460 m!328065))

(push 1)

(assert (not b!319460))

(assert (not b!319459))

(assert (not start!31988))

(assert (not b!319458))

(check-sat)

