; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102884 () Bool)

(assert start!102884)

(declare-fun res!824503 () Bool)

(declare-fun e!700862 () Bool)

(assert (=> start!102884 (=> (not res!824503) (not e!700862))))

(declare-datatypes ((array!79729 0))(
  ( (array!79730 (arr!38472 (Array (_ BitVec 32) (_ BitVec 64))) (size!39008 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79729)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102884 (= res!824503 (and (bvslt (size!39008 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39008 a!3835))))))

(assert (=> start!102884 e!700862))

(declare-fun array_inv!29320 (array!79729) Bool)

(assert (=> start!102884 (array_inv!29320 a!3835)))

(assert (=> start!102884 true))

(declare-fun b!1236517 () Bool)

(declare-fun res!824500 () Bool)

(assert (=> b!1236517 (=> (not res!824500) (not e!700862))))

(declare-datatypes ((List!27245 0))(
  ( (Nil!27242) (Cons!27241 (h!28450 (_ BitVec 64)) (t!40708 List!27245)) )
))
(declare-fun acc!846 () List!27245)

(declare-fun noDuplicate!1904 (List!27245) Bool)

(assert (=> b!1236517 (= res!824500 (noDuplicate!1904 acc!846))))

(declare-fun b!1236518 () Bool)

(declare-fun res!824499 () Bool)

(assert (=> b!1236518 (=> (not res!824499) (not e!700862))))

(declare-fun contains!7307 (List!27245 (_ BitVec 64)) Bool)

(assert (=> b!1236518 (= res!824499 (not (contains!7307 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236519 () Bool)

(declare-fun res!824502 () Bool)

(assert (=> b!1236519 (=> (not res!824502) (not e!700862))))

(assert (=> b!1236519 (= res!824502 (not (contains!7307 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236520 () Bool)

(declare-fun res!824501 () Bool)

(assert (=> b!1236520 (=> (not res!824501) (not e!700862))))

(declare-fun arrayNoDuplicates!0 (array!79729 (_ BitVec 32) List!27245) Bool)

(assert (=> b!1236520 (= res!824501 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236521 () Bool)

(assert (=> b!1236521 (= e!700862 false)))

(declare-fun lt!560807 () Bool)

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236521 (= lt!560807 (contains!7307 acc!846 k0!2925))))

(assert (= (and start!102884 res!824503) b!1236517))

(assert (= (and b!1236517 res!824500) b!1236519))

(assert (= (and b!1236519 res!824502) b!1236518))

(assert (= (and b!1236518 res!824499) b!1236520))

(assert (= (and b!1236520 res!824501) b!1236521))

(declare-fun m!1140307 () Bool)

(assert (=> b!1236521 m!1140307))

(declare-fun m!1140309 () Bool)

(assert (=> start!102884 m!1140309))

(declare-fun m!1140311 () Bool)

(assert (=> b!1236518 m!1140311))

(declare-fun m!1140313 () Bool)

(assert (=> b!1236520 m!1140313))

(declare-fun m!1140315 () Bool)

(assert (=> b!1236517 m!1140315))

(declare-fun m!1140317 () Bool)

(assert (=> b!1236519 m!1140317))

(check-sat (not b!1236521) (not b!1236517) (not b!1236518) (not b!1236520) (not start!102884) (not b!1236519))
(check-sat)
