; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102880 () Bool)

(assert start!102880)

(declare-fun b!1236487 () Bool)

(declare-fun res!824471 () Bool)

(declare-fun e!700850 () Bool)

(assert (=> b!1236487 (=> (not res!824471) (not e!700850))))

(declare-datatypes ((List!27243 0))(
  ( (Nil!27240) (Cons!27239 (h!28448 (_ BitVec 64)) (t!40706 List!27243)) )
))
(declare-fun acc!846 () List!27243)

(declare-fun contains!7305 (List!27243 (_ BitVec 64)) Bool)

(assert (=> b!1236487 (= res!824471 (not (contains!7305 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236488 () Bool)

(declare-fun res!824472 () Bool)

(assert (=> b!1236488 (=> (not res!824472) (not e!700850))))

(declare-fun noDuplicate!1902 (List!27243) Bool)

(assert (=> b!1236488 (= res!824472 (noDuplicate!1902 acc!846))))

(declare-fun b!1236489 () Bool)

(declare-fun res!824470 () Bool)

(assert (=> b!1236489 (=> (not res!824470) (not e!700850))))

(assert (=> b!1236489 (= res!824470 (not (contains!7305 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236490 () Bool)

(assert (=> b!1236490 (= e!700850 false)))

(declare-fun lt!560801 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236490 (= lt!560801 (contains!7305 acc!846 k!2925))))

(declare-fun res!824469 () Bool)

(assert (=> start!102880 (=> (not res!824469) (not e!700850))))

(declare-datatypes ((array!79725 0))(
  ( (array!79726 (arr!38470 (Array (_ BitVec 32) (_ BitVec 64))) (size!39006 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79725)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102880 (= res!824469 (and (bvslt (size!39006 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39006 a!3835))))))

(assert (=> start!102880 e!700850))

(declare-fun array_inv!29318 (array!79725) Bool)

(assert (=> start!102880 (array_inv!29318 a!3835)))

(assert (=> start!102880 true))

(declare-fun b!1236491 () Bool)

(declare-fun res!824473 () Bool)

(assert (=> b!1236491 (=> (not res!824473) (not e!700850))))

(declare-fun arrayNoDuplicates!0 (array!79725 (_ BitVec 32) List!27243) Bool)

(assert (=> b!1236491 (= res!824473 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102880 res!824469) b!1236488))

(assert (= (and b!1236488 res!824472) b!1236487))

(assert (= (and b!1236487 res!824471) b!1236489))

(assert (= (and b!1236489 res!824470) b!1236491))

(assert (= (and b!1236491 res!824473) b!1236490))

(declare-fun m!1140283 () Bool)

(assert (=> b!1236491 m!1140283))

(declare-fun m!1140285 () Bool)

(assert (=> start!102880 m!1140285))

(declare-fun m!1140287 () Bool)

(assert (=> b!1236490 m!1140287))

(declare-fun m!1140289 () Bool)

(assert (=> b!1236488 m!1140289))

(declare-fun m!1140291 () Bool)

(assert (=> b!1236489 m!1140291))

(declare-fun m!1140293 () Bool)

(assert (=> b!1236487 m!1140293))

(push 1)

(assert (not b!1236488))

(assert (not b!1236491))

(assert (not b!1236487))

(assert (not b!1236489))

(assert (not b!1236490))

(assert (not start!102880))

(check-sat)

