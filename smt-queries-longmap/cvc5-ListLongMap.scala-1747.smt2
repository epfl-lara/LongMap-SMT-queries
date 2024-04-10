; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32002 () Bool)

(assert start!32002)

(declare-fun b!319554 () Bool)

(declare-fun res!173939 () Bool)

(declare-fun e!198454 () Bool)

(assert (=> b!319554 (=> (not res!173939) (not e!198454))))

(declare-datatypes ((array!16309 0))(
  ( (array!16310 (arr!7718 (Array (_ BitVec 32) (_ BitVec 64))) (size!8070 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16309)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319554 (= res!173939 (and (= (size!8070 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8070 a!3305))))))

(declare-fun b!319555 () Bool)

(declare-fun res!173943 () Bool)

(assert (=> b!319555 (=> (not res!173943) (not e!198454))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319555 (= res!173943 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319556 () Bool)

(assert (=> b!319556 (= e!198454 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun b!319557 () Bool)

(declare-fun res!173942 () Bool)

(assert (=> b!319557 (=> (not res!173942) (not e!198454))))

(declare-datatypes ((SeekEntryResult!2849 0))(
  ( (MissingZero!2849 (index!13572 (_ BitVec 32))) (Found!2849 (index!13573 (_ BitVec 32))) (Intermediate!2849 (undefined!3661 Bool) (index!13574 (_ BitVec 32)) (x!31851 (_ BitVec 32))) (Undefined!2849) (MissingVacant!2849 (index!13575 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16309 (_ BitVec 32)) SeekEntryResult!2849)

(assert (=> b!319557 (= res!173942 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2849 i!1250)))))

(declare-fun b!319558 () Bool)

(declare-fun res!173941 () Bool)

(assert (=> b!319558 (=> (not res!173941) (not e!198454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16309 (_ BitVec 32)) Bool)

(assert (=> b!319558 (= res!173941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319559 () Bool)

(declare-fun res!173938 () Bool)

(assert (=> b!319559 (=> (not res!173938) (not e!198454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319559 (= res!173938 (validKeyInArray!0 k!2497))))

(declare-fun res!173940 () Bool)

(assert (=> start!32002 (=> (not res!173940) (not e!198454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32002 (= res!173940 (validMask!0 mask!3777))))

(assert (=> start!32002 e!198454))

(assert (=> start!32002 true))

(declare-fun array_inv!5681 (array!16309) Bool)

(assert (=> start!32002 (array_inv!5681 a!3305)))

(assert (= (and start!32002 res!173940) b!319554))

(assert (= (and b!319554 res!173939) b!319559))

(assert (= (and b!319559 res!173938) b!319555))

(assert (= (and b!319555 res!173943) b!319557))

(assert (= (and b!319557 res!173942) b!319558))

(assert (= (and b!319558 res!173941) b!319556))

(declare-fun m!328127 () Bool)

(assert (=> b!319559 m!328127))

(declare-fun m!328129 () Bool)

(assert (=> b!319558 m!328129))

(declare-fun m!328131 () Bool)

(assert (=> start!32002 m!328131))

(declare-fun m!328133 () Bool)

(assert (=> start!32002 m!328133))

(declare-fun m!328135 () Bool)

(assert (=> b!319557 m!328135))

(declare-fun m!328137 () Bool)

(assert (=> b!319555 m!328137))

(push 1)

