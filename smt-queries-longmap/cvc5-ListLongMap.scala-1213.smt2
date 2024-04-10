; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25744 () Bool)

(assert start!25744)

(declare-fun b!266931 () Bool)

(declare-fun e!172628 () Bool)

(declare-fun e!172626 () Bool)

(assert (=> b!266931 (= e!172628 e!172626)))

(declare-fun res!131230 () Bool)

(assert (=> b!266931 (=> (not res!131230) (not e!172626))))

(declare-datatypes ((SeekEntryResult!1307 0))(
  ( (MissingZero!1307 (index!7398 (_ BitVec 32))) (Found!1307 (index!7399 (_ BitVec 32))) (Intermediate!1307 (undefined!2119 Bool) (index!7400 (_ BitVec 32)) (x!25696 (_ BitVec 32))) (Undefined!1307) (MissingVacant!1307 (index!7401 (_ BitVec 32))) )
))
(declare-fun lt!134569 () SeekEntryResult!1307)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266931 (= res!131230 (or (= lt!134569 (MissingZero!1307 i!1355)) (= lt!134569 (MissingVacant!1307 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12923 0))(
  ( (array!12924 (arr!6116 (Array (_ BitVec 32) (_ BitVec 64))) (size!6468 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12923)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12923 (_ BitVec 32)) SeekEntryResult!1307)

(assert (=> b!266931 (= lt!134569 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266932 () Bool)

(assert (=> b!266932 (= e!172626 false)))

(declare-fun lt!134568 () Bool)

(declare-datatypes ((List!3930 0))(
  ( (Nil!3927) (Cons!3926 (h!4593 (_ BitVec 64)) (t!9012 List!3930)) )
))
(declare-fun arrayNoDuplicates!0 (array!12923 (_ BitVec 32) List!3930) Bool)

(assert (=> b!266932 (= lt!134568 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3927))))

(declare-fun res!131227 () Bool)

(assert (=> start!25744 (=> (not res!131227) (not e!172628))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25744 (= res!131227 (validMask!0 mask!4002))))

(assert (=> start!25744 e!172628))

(assert (=> start!25744 true))

(declare-fun array_inv!4079 (array!12923) Bool)

(assert (=> start!25744 (array_inv!4079 a!3436)))

(declare-fun b!266933 () Bool)

(declare-fun res!131231 () Bool)

(assert (=> b!266933 (=> (not res!131231) (not e!172628))))

(declare-fun arrayContainsKey!0 (array!12923 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266933 (= res!131231 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266934 () Bool)

(declare-fun res!131232 () Bool)

(assert (=> b!266934 (=> (not res!131232) (not e!172626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12923 (_ BitVec 32)) Bool)

(assert (=> b!266934 (= res!131232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266935 () Bool)

(declare-fun res!131228 () Bool)

(assert (=> b!266935 (=> (not res!131228) (not e!172628))))

(assert (=> b!266935 (= res!131228 (and (= (size!6468 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6468 a!3436))))))

(declare-fun b!266936 () Bool)

(declare-fun res!131229 () Bool)

(assert (=> b!266936 (=> (not res!131229) (not e!172628))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266936 (= res!131229 (validKeyInArray!0 k!2698))))

(assert (= (and start!25744 res!131227) b!266935))

(assert (= (and b!266935 res!131228) b!266936))

(assert (= (and b!266936 res!131229) b!266933))

(assert (= (and b!266933 res!131231) b!266931))

(assert (= (and b!266931 res!131230) b!266934))

(assert (= (and b!266934 res!131232) b!266932))

(declare-fun m!283413 () Bool)

(assert (=> b!266933 m!283413))

(declare-fun m!283415 () Bool)

(assert (=> start!25744 m!283415))

(declare-fun m!283417 () Bool)

(assert (=> start!25744 m!283417))

(declare-fun m!283419 () Bool)

(assert (=> b!266931 m!283419))

(declare-fun m!283421 () Bool)

(assert (=> b!266934 m!283421))

(declare-fun m!283423 () Bool)

(assert (=> b!266936 m!283423))

(declare-fun m!283425 () Bool)

(assert (=> b!266932 m!283425))

(push 1)

