; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31952 () Bool)

(assert start!31952)

(declare-fun res!173717 () Bool)

(declare-fun e!198345 () Bool)

(assert (=> start!31952 (=> (not res!173717) (not e!198345))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31952 (= res!173717 (validMask!0 mask!3777))))

(assert (=> start!31952 e!198345))

(assert (=> start!31952 true))

(declare-datatypes ((array!16272 0))(
  ( (array!16273 (arr!7700 (Array (_ BitVec 32) (_ BitVec 64))) (size!8052 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16272)

(declare-fun array_inv!5663 (array!16272) Bool)

(assert (=> start!31952 (array_inv!5663 a!3305)))

(declare-fun b!319332 () Bool)

(declare-fun res!173718 () Bool)

(assert (=> b!319332 (=> (not res!173718) (not e!198345))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319332 (= res!173718 (and (= (size!8052 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8052 a!3305))))))

(declare-fun b!319333 () Bool)

(declare-fun res!173716 () Bool)

(assert (=> b!319333 (=> (not res!173716) (not e!198345))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319333 (= res!173716 (validKeyInArray!0 k!2497))))

(declare-fun b!319334 () Bool)

(assert (=> b!319334 (= e!198345 (and (bvslt #b00000000000000000000000000000000 (size!8052 a!3305)) (bvsge (size!8052 a!3305) #b01111111111111111111111111111111)))))

(assert (= (and start!31952 res!173717) b!319332))

(assert (= (and b!319332 res!173718) b!319333))

(assert (= (and b!319333 res!173716) b!319334))

(declare-fun m!327965 () Bool)

(assert (=> start!31952 m!327965))

(declare-fun m!327967 () Bool)

(assert (=> start!31952 m!327967))

(declare-fun m!327969 () Bool)

(assert (=> b!319333 m!327969))

(push 1)

(assert (not b!319333))

(assert (not start!31952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

