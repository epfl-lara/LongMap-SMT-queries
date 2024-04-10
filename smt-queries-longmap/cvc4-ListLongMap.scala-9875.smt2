; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116940 () Bool)

(assert start!116940)

(declare-fun res!920391 () Bool)

(declare-fun e!780405 () Bool)

(assert (=> start!116940 (=> (not res!920391) (not e!780405))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93609 0))(
  ( (array!93610 (arr!45208 (Array (_ BitVec 32) (_ BitVec 64))) (size!45758 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93609)

(assert (=> start!116940 (= res!920391 (and (bvslt (size!45758 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45758 a!4212))))))

(assert (=> start!116940 e!780405))

(declare-fun array_inv!34236 (array!93609) Bool)

(assert (=> start!116940 (array_inv!34236 a!4212)))

(assert (=> start!116940 true))

(declare-fun b!1377669 () Bool)

(declare-fun res!920392 () Bool)

(assert (=> b!1377669 (=> (not res!920392) (not e!780405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377669 (= res!920392 (not (validKeyInArray!0 (select (arr!45208 a!4212) to!375))))))

(declare-fun b!1377670 () Bool)

(assert (=> b!1377670 (= e!780405 (or (bvslt (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsgt to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(assert (= (and start!116940 res!920391) b!1377669))

(assert (= (and b!1377669 res!920392) b!1377670))

(declare-fun m!1262063 () Bool)

(assert (=> start!116940 m!1262063))

(declare-fun m!1262065 () Bool)

(assert (=> b!1377669 m!1262065))

(assert (=> b!1377669 m!1262065))

(declare-fun m!1262067 () Bool)

(assert (=> b!1377669 m!1262067))

(push 1)

(assert (not start!116940))

(assert (not b!1377669))

(check-sat)

(pop 1)

(push 1)

(check-sat)

