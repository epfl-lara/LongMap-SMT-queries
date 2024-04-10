; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102672 () Bool)

(assert start!102672)

(declare-fun res!822373 () Bool)

(declare-fun e!699999 () Bool)

(assert (=> start!102672 (=> (not res!822373) (not e!699999))))

(declare-datatypes ((array!79562 0))(
  ( (array!79563 (arr!38390 (Array (_ BitVec 32) (_ BitVec 64))) (size!38926 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79562)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102672 (= res!822373 (and (bvslt (size!38926 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38926 a!3835))))))

(assert (=> start!102672 e!699999))

(declare-fun array_inv!29238 (array!79562) Bool)

(assert (=> start!102672 (array_inv!29238 a!3835)))

(assert (=> start!102672 true))

(declare-fun b!1234191 () Bool)

(declare-fun res!822372 () Bool)

(assert (=> b!1234191 (=> (not res!822372) (not e!699999))))

(declare-datatypes ((List!27163 0))(
  ( (Nil!27160) (Cons!27159 (h!28368 (_ BitVec 64)) (t!40626 List!27163)) )
))
(declare-fun acc!846 () List!27163)

(declare-fun noDuplicate!1822 (List!27163) Bool)

(assert (=> b!1234191 (= res!822372 (noDuplicate!1822 acc!846))))

(declare-fun b!1234192 () Bool)

(declare-fun res!822371 () Bool)

(assert (=> b!1234192 (=> (not res!822371) (not e!699999))))

(declare-fun contains!7225 (List!27163 (_ BitVec 64)) Bool)

(assert (=> b!1234192 (= res!822371 (not (contains!7225 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234193 () Bool)

(assert (=> b!1234193 (= e!699999 false)))

(declare-fun lt!559799 () Bool)

(assert (=> b!1234193 (= lt!559799 (contains!7225 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102672 res!822373) b!1234191))

(assert (= (and b!1234191 res!822372) b!1234192))

(assert (= (and b!1234192 res!822371) b!1234193))

(declare-fun m!1138201 () Bool)

(assert (=> start!102672 m!1138201))

(declare-fun m!1138203 () Bool)

(assert (=> b!1234191 m!1138203))

(declare-fun m!1138205 () Bool)

(assert (=> b!1234192 m!1138205))

(declare-fun m!1138207 () Bool)

(assert (=> b!1234193 m!1138207))

(push 1)

(assert (not b!1234193))

(assert (not start!102672))

(assert (not b!1234192))

(assert (not b!1234191))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

