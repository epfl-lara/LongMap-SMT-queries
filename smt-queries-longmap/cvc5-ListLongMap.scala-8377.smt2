; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101866 () Bool)

(assert start!101866)

(declare-fun b!1226818 () Bool)

(declare-fun res!815472 () Bool)

(declare-fun e!696667 () Bool)

(assert (=> b!1226818 (=> (not res!815472) (not e!696667))))

(declare-datatypes ((List!27001 0))(
  ( (Nil!26998) (Cons!26997 (h!28206 (_ BitVec 64)) (t!40464 List!27001)) )
))
(declare-fun acc!823 () List!27001)

(declare-fun contains!7063 (List!27001 (_ BitVec 64)) Bool)

(assert (=> b!1226818 (= res!815472 (not (contains!7063 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226819 () Bool)

(declare-fun res!815469 () Bool)

(assert (=> b!1226819 (=> (not res!815469) (not e!696667))))

(declare-fun noDuplicate!1660 (List!27001) Bool)

(assert (=> b!1226819 (= res!815469 (noDuplicate!1660 acc!823))))

(declare-fun res!815466 () Bool)

(assert (=> start!101866 (=> (not res!815466) (not e!696667))))

(declare-datatypes ((array!79205 0))(
  ( (array!79206 (arr!38228 (Array (_ BitVec 32) (_ BitVec 64))) (size!38764 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79205)

(assert (=> start!101866 (= res!815466 (bvslt (size!38764 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101866 e!696667))

(declare-fun array_inv!29076 (array!79205) Bool)

(assert (=> start!101866 (array_inv!29076 a!3806)))

(assert (=> start!101866 true))

(declare-fun b!1226820 () Bool)

(declare-fun res!815468 () Bool)

(assert (=> b!1226820 (=> (not res!815468) (not e!696667))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226820 (= res!815468 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1226821 () Bool)

(assert (=> b!1226821 (= e!696667 false)))

(declare-fun lt!558858 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79205 (_ BitVec 32) List!27001) Bool)

(assert (=> b!1226821 (= lt!558858 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1226822 () Bool)

(declare-fun res!815471 () Bool)

(assert (=> b!1226822 (=> (not res!815471) (not e!696667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226822 (= res!815471 (validKeyInArray!0 k!2913))))

(declare-fun b!1226823 () Bool)

(declare-fun res!815467 () Bool)

(assert (=> b!1226823 (=> (not res!815467) (not e!696667))))

(assert (=> b!1226823 (= res!815467 (not (contains!7063 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226824 () Bool)

(declare-fun res!815470 () Bool)

(assert (=> b!1226824 (=> (not res!815470) (not e!696667))))

(assert (=> b!1226824 (= res!815470 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38764 a!3806)) (bvslt from!3184 (size!38764 a!3806))))))

(assert (= (and start!101866 res!815466) b!1226822))

(assert (= (and b!1226822 res!815471) b!1226824))

(assert (= (and b!1226824 res!815470) b!1226819))

(assert (= (and b!1226819 res!815469) b!1226818))

(assert (= (and b!1226818 res!815472) b!1226823))

(assert (= (and b!1226823 res!815467) b!1226820))

(assert (= (and b!1226820 res!815468) b!1226821))

(declare-fun m!1131783 () Bool)

(assert (=> b!1226820 m!1131783))

(declare-fun m!1131785 () Bool)

(assert (=> b!1226822 m!1131785))

(declare-fun m!1131787 () Bool)

(assert (=> b!1226819 m!1131787))

(declare-fun m!1131789 () Bool)

(assert (=> b!1226823 m!1131789))

(declare-fun m!1131791 () Bool)

(assert (=> start!101866 m!1131791))

(declare-fun m!1131793 () Bool)

(assert (=> b!1226821 m!1131793))

(declare-fun m!1131795 () Bool)

(assert (=> b!1226818 m!1131795))

(push 1)

(assert (not b!1226819))

(assert (not b!1226823))

(assert (not b!1226818))

(assert (not start!101866))

(assert (not b!1226820))

(assert (not b!1226821))

(assert (not b!1226822))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

