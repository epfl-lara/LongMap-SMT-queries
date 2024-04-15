; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31980 () Bool)

(assert start!31980)

(declare-fun b!319218 () Bool)

(declare-fun res!173748 () Bool)

(declare-fun e!198254 () Bool)

(assert (=> b!319218 (=> (not res!173748) (not e!198254))))

(declare-datatypes ((array!16291 0))(
  ( (array!16292 (arr!7709 (Array (_ BitVec 32) (_ BitVec 64))) (size!8062 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16291)

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!319218 (= res!173748 (and (= (size!8062 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8062 a!3305))))))

(declare-fun b!319220 () Bool)

(declare-fun res!173751 () Bool)

(assert (=> b!319220 (=> (not res!173751) (not e!198254))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319220 (= res!173751 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173749 () Bool)

(assert (=> start!31980 (=> (not res!173749) (not e!198254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31980 (= res!173749 (validMask!0 mask!3777))))

(assert (=> start!31980 e!198254))

(assert (=> start!31980 true))

(declare-fun array_inv!5681 (array!16291) Bool)

(assert (=> start!31980 (array_inv!5681 a!3305)))

(declare-fun b!319221 () Bool)

(assert (=> b!319221 (= e!198254 false)))

(declare-datatypes ((SeekEntryResult!2839 0))(
  ( (MissingZero!2839 (index!13532 (_ BitVec 32))) (Found!2839 (index!13533 (_ BitVec 32))) (Intermediate!2839 (undefined!3651 Bool) (index!13534 (_ BitVec 32)) (x!31820 (_ BitVec 32))) (Undefined!2839) (MissingVacant!2839 (index!13535 (_ BitVec 32))) )
))
(declare-fun lt!155579 () SeekEntryResult!2839)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16291 (_ BitVec 32)) SeekEntryResult!2839)

(assert (=> b!319221 (= lt!155579 (seekEntryOrOpen!0 k!2497 a!3305 mask!3777))))

(declare-fun b!319219 () Bool)

(declare-fun res!173750 () Bool)

(assert (=> b!319219 (=> (not res!173750) (not e!198254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319219 (= res!173750 (validKeyInArray!0 k!2497))))

(assert (= (and start!31980 res!173749) b!319218))

(assert (= (and b!319218 res!173748) b!319219))

(assert (= (and b!319219 res!173750) b!319220))

(assert (= (and b!319220 res!173751) b!319221))

(declare-fun m!327357 () Bool)

(assert (=> b!319220 m!327357))

(declare-fun m!327359 () Bool)

(assert (=> start!31980 m!327359))

(declare-fun m!327361 () Bool)

(assert (=> start!31980 m!327361))

(declare-fun m!327363 () Bool)

(assert (=> b!319221 m!327363))

(declare-fun m!327365 () Bool)

(assert (=> b!319219 m!327365))

(push 1)

(assert (not start!31980))

(assert (not b!319220))

(assert (not b!319219))

(assert (not b!319221))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

