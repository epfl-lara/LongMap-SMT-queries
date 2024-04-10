; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102866 () Bool)

(assert start!102866)

(declare-fun b!1236373 () Bool)

(declare-fun e!700809 () Bool)

(assert (=> b!1236373 (= e!700809 false)))

(declare-fun lt!560789 () Bool)

(declare-datatypes ((List!27236 0))(
  ( (Nil!27233) (Cons!27232 (h!28441 (_ BitVec 64)) (t!40699 List!27236)) )
))
(declare-fun acc!846 () List!27236)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7298 (List!27236 (_ BitVec 64)) Bool)

(assert (=> b!1236373 (= lt!560789 (contains!7298 acc!846 k0!2925))))

(declare-fun b!1236374 () Bool)

(declare-fun res!824359 () Bool)

(assert (=> b!1236374 (=> (not res!824359) (not e!700809))))

(assert (=> b!1236374 (= res!824359 (not (contains!7298 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236375 () Bool)

(declare-fun res!824358 () Bool)

(assert (=> b!1236375 (=> (not res!824358) (not e!700809))))

(assert (=> b!1236375 (= res!824358 (not (contains!7298 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824355 () Bool)

(assert (=> start!102866 (=> (not res!824355) (not e!700809))))

(declare-datatypes ((array!79711 0))(
  ( (array!79712 (arr!38463 (Array (_ BitVec 32) (_ BitVec 64))) (size!38999 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79711)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102866 (= res!824355 (and (bvslt (size!38999 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38999 a!3835))))))

(assert (=> start!102866 e!700809))

(declare-fun array_inv!29311 (array!79711) Bool)

(assert (=> start!102866 (array_inv!29311 a!3835)))

(assert (=> start!102866 true))

(declare-fun b!1236376 () Bool)

(declare-fun res!824356 () Bool)

(assert (=> b!1236376 (=> (not res!824356) (not e!700809))))

(declare-fun arrayNoDuplicates!0 (array!79711 (_ BitVec 32) List!27236) Bool)

(assert (=> b!1236376 (= res!824356 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236377 () Bool)

(declare-fun res!824357 () Bool)

(assert (=> b!1236377 (=> (not res!824357) (not e!700809))))

(declare-fun noDuplicate!1895 (List!27236) Bool)

(assert (=> b!1236377 (= res!824357 (noDuplicate!1895 acc!846))))

(assert (= (and start!102866 res!824355) b!1236377))

(assert (= (and b!1236377 res!824357) b!1236374))

(assert (= (and b!1236374 res!824359) b!1236375))

(assert (= (and b!1236375 res!824358) b!1236376))

(assert (= (and b!1236376 res!824356) b!1236373))

(declare-fun m!1140199 () Bool)

(assert (=> b!1236376 m!1140199))

(declare-fun m!1140201 () Bool)

(assert (=> start!102866 m!1140201))

(declare-fun m!1140203 () Bool)

(assert (=> b!1236374 m!1140203))

(declare-fun m!1140205 () Bool)

(assert (=> b!1236373 m!1140205))

(declare-fun m!1140207 () Bool)

(assert (=> b!1236377 m!1140207))

(declare-fun m!1140209 () Bool)

(assert (=> b!1236375 m!1140209))

(check-sat (not b!1236377) (not start!102866) (not b!1236375) (not b!1236374) (not b!1236376) (not b!1236373))
(check-sat)
