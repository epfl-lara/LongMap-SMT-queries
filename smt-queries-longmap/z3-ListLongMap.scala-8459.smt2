; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102890 () Bool)

(assert start!102890)

(declare-fun b!1236577 () Bool)

(declare-fun res!824564 () Bool)

(declare-fun e!700880 () Bool)

(assert (=> b!1236577 (=> (not res!824564) (not e!700880))))

(declare-datatypes ((List!27248 0))(
  ( (Nil!27245) (Cons!27244 (h!28453 (_ BitVec 64)) (t!40711 List!27248)) )
))
(declare-fun acc!846 () List!27248)

(declare-fun noDuplicate!1907 (List!27248) Bool)

(assert (=> b!1236577 (= res!824564 (noDuplicate!1907 acc!846))))

(declare-fun b!1236578 () Bool)

(declare-fun res!824566 () Bool)

(assert (=> b!1236578 (=> (not res!824566) (not e!700880))))

(declare-datatypes ((array!79735 0))(
  ( (array!79736 (arr!38475 (Array (_ BitVec 32) (_ BitVec 64))) (size!39011 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79735)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236578 (= res!824566 (validKeyInArray!0 (select (arr!38475 a!3835) from!3213)))))

(declare-fun b!1236580 () Bool)

(declare-fun res!824562 () Bool)

(assert (=> b!1236580 (=> (not res!824562) (not e!700880))))

(declare-fun contains!7310 (List!27248 (_ BitVec 64)) Bool)

(assert (=> b!1236580 (= res!824562 (not (contains!7310 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236581 () Bool)

(declare-fun res!824565 () Bool)

(assert (=> b!1236581 (=> (not res!824565) (not e!700880))))

(assert (=> b!1236581 (= res!824565 (not (contains!7310 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236582 () Bool)

(declare-fun res!824563 () Bool)

(assert (=> b!1236582 (=> (not res!824563) (not e!700880))))

(assert (=> b!1236582 (= res!824563 (not (= from!3213 (bvsub (size!39011 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236583 () Bool)

(declare-fun res!824559 () Bool)

(assert (=> b!1236583 (=> (not res!824559) (not e!700880))))

(declare-fun arrayNoDuplicates!0 (array!79735 (_ BitVec 32) List!27248) Bool)

(assert (=> b!1236583 (= res!824559 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236584 () Bool)

(assert (=> b!1236584 (= e!700880 (not true))))

(declare-fun lt!560821 () List!27248)

(declare-fun subseq!564 (List!27248 List!27248) Bool)

(assert (=> b!1236584 (subseq!564 lt!560821 lt!560821)))

(declare-datatypes ((Unit!41014 0))(
  ( (Unit!41015) )
))
(declare-fun lt!560822 () Unit!41014)

(declare-fun lemmaListSubSeqRefl!0 (List!27248) Unit!41014)

(assert (=> b!1236584 (= lt!560822 (lemmaListSubSeqRefl!0 lt!560821))))

(assert (=> b!1236584 (= lt!560821 (Cons!27244 (select (arr!38475 a!3835) from!3213) acc!846))))

(declare-fun b!1236579 () Bool)

(declare-fun res!824561 () Bool)

(assert (=> b!1236579 (=> (not res!824561) (not e!700880))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236579 (= res!824561 (contains!7310 acc!846 k0!2925))))

(declare-fun res!824560 () Bool)

(assert (=> start!102890 (=> (not res!824560) (not e!700880))))

(assert (=> start!102890 (= res!824560 (and (bvslt (size!39011 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39011 a!3835))))))

(assert (=> start!102890 e!700880))

(declare-fun array_inv!29323 (array!79735) Bool)

(assert (=> start!102890 (array_inv!29323 a!3835)))

(assert (=> start!102890 true))

(assert (= (and start!102890 res!824560) b!1236577))

(assert (= (and b!1236577 res!824564) b!1236581))

(assert (= (and b!1236581 res!824565) b!1236580))

(assert (= (and b!1236580 res!824562) b!1236583))

(assert (= (and b!1236583 res!824559) b!1236579))

(assert (= (and b!1236579 res!824561) b!1236582))

(assert (= (and b!1236582 res!824563) b!1236578))

(assert (= (and b!1236578 res!824566) b!1236584))

(declare-fun m!1140351 () Bool)

(assert (=> start!102890 m!1140351))

(declare-fun m!1140353 () Bool)

(assert (=> b!1236578 m!1140353))

(assert (=> b!1236578 m!1140353))

(declare-fun m!1140355 () Bool)

(assert (=> b!1236578 m!1140355))

(declare-fun m!1140357 () Bool)

(assert (=> b!1236583 m!1140357))

(declare-fun m!1140359 () Bool)

(assert (=> b!1236581 m!1140359))

(declare-fun m!1140361 () Bool)

(assert (=> b!1236580 m!1140361))

(declare-fun m!1140363 () Bool)

(assert (=> b!1236584 m!1140363))

(declare-fun m!1140365 () Bool)

(assert (=> b!1236584 m!1140365))

(assert (=> b!1236584 m!1140353))

(declare-fun m!1140367 () Bool)

(assert (=> b!1236579 m!1140367))

(declare-fun m!1140369 () Bool)

(assert (=> b!1236577 m!1140369))

(check-sat (not b!1236581) (not b!1236584) (not start!102890) (not b!1236580) (not b!1236583) (not b!1236578) (not b!1236577) (not b!1236579))
