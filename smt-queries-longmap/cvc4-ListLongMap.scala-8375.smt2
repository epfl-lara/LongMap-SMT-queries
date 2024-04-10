; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101858 () Bool)

(assert start!101858)

(declare-fun b!1226718 () Bool)

(declare-fun res!815370 () Bool)

(declare-fun e!696643 () Bool)

(assert (=> b!1226718 (=> (not res!815370) (not e!696643))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226718 (= res!815370 (validKeyInArray!0 k!2913))))

(declare-fun b!1226719 () Bool)

(assert (=> b!1226719 (= e!696643 false)))

(declare-fun lt!558855 () Bool)

(declare-datatypes ((List!26997 0))(
  ( (Nil!26994) (Cons!26993 (h!28202 (_ BitVec 64)) (t!40460 List!26997)) )
))
(declare-fun acc!823 () List!26997)

(declare-fun contains!7059 (List!26997 (_ BitVec 64)) Bool)

(assert (=> b!1226719 (= lt!558855 (contains!7059 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226720 () Bool)

(declare-fun res!815367 () Bool)

(assert (=> b!1226720 (=> (not res!815367) (not e!696643))))

(declare-fun noDuplicate!1656 (List!26997) Bool)

(assert (=> b!1226720 (= res!815367 (noDuplicate!1656 acc!823))))

(declare-fun b!1226721 () Bool)

(declare-fun res!815366 () Bool)

(assert (=> b!1226721 (=> (not res!815366) (not e!696643))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79197 0))(
  ( (array!79198 (arr!38224 (Array (_ BitVec 32) (_ BitVec 64))) (size!38760 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79197)

(assert (=> b!1226721 (= res!815366 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38760 a!3806)) (bvslt from!3184 (size!38760 a!3806))))))

(declare-fun res!815368 () Bool)

(assert (=> start!101858 (=> (not res!815368) (not e!696643))))

(assert (=> start!101858 (= res!815368 (bvslt (size!38760 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101858 e!696643))

(declare-fun array_inv!29072 (array!79197) Bool)

(assert (=> start!101858 (array_inv!29072 a!3806)))

(assert (=> start!101858 true))

(declare-fun b!1226722 () Bool)

(declare-fun res!815369 () Bool)

(assert (=> b!1226722 (=> (not res!815369) (not e!696643))))

(assert (=> b!1226722 (= res!815369 (not (contains!7059 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101858 res!815368) b!1226718))

(assert (= (and b!1226718 res!815370) b!1226721))

(assert (= (and b!1226721 res!815366) b!1226720))

(assert (= (and b!1226720 res!815367) b!1226722))

(assert (= (and b!1226722 res!815369) b!1226719))

(declare-fun m!1131719 () Bool)

(assert (=> b!1226719 m!1131719))

(declare-fun m!1131721 () Bool)

(assert (=> start!101858 m!1131721))

(declare-fun m!1131723 () Bool)

(assert (=> b!1226722 m!1131723))

(declare-fun m!1131725 () Bool)

(assert (=> b!1226720 m!1131725))

(declare-fun m!1131727 () Bool)

(assert (=> b!1226718 m!1131727))

(push 1)

(assert (not b!1226722))

(assert (not b!1226720))

(assert (not b!1226718))

(assert (not b!1226719))

(assert (not start!101858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

