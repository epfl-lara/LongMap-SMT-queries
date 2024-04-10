; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31946 () Bool)

(assert start!31946)

(declare-fun res!173690 () Bool)

(declare-fun e!198327 () Bool)

(assert (=> start!31946 (=> (not res!173690) (not e!198327))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31946 (= res!173690 (validMask!0 mask!3777))))

(assert (=> start!31946 e!198327))

(assert (=> start!31946 true))

(declare-datatypes ((array!16266 0))(
  ( (array!16267 (arr!7697 (Array (_ BitVec 32) (_ BitVec 64))) (size!8049 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16266)

(declare-fun array_inv!5660 (array!16266) Bool)

(assert (=> start!31946 (array_inv!5660 a!3305)))

(declare-fun b!319305 () Bool)

(declare-fun res!173689 () Bool)

(assert (=> b!319305 (=> (not res!173689) (not e!198327))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319305 (= res!173689 (and (= (size!8049 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8049 a!3305))))))

(declare-fun b!319306 () Bool)

(declare-fun res!173691 () Bool)

(assert (=> b!319306 (=> (not res!173691) (not e!198327))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319306 (= res!173691 (validKeyInArray!0 k!2497))))

(declare-fun b!319307 () Bool)

(assert (=> b!319307 (= e!198327 (bvsge #b00000000000000000000000000000000 (size!8049 a!3305)))))

(assert (= (and start!31946 res!173690) b!319305))

(assert (= (and b!319305 res!173689) b!319306))

(assert (= (and b!319306 res!173691) b!319307))

(declare-fun m!327947 () Bool)

(assert (=> start!31946 m!327947))

(declare-fun m!327949 () Bool)

(assert (=> start!31946 m!327949))

(declare-fun m!327951 () Bool)

(assert (=> b!319306 m!327951))

(push 1)

(assert (not start!31946))

(assert (not b!319306))

(check-sat)

(pop 1)

(push 1)

(check-sat)

