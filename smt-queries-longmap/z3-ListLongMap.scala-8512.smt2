; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103844 () Bool)

(assert start!103844)

(declare-fun res!828928 () Bool)

(declare-fun e!704789 () Bool)

(assert (=> start!103844 (=> (not res!828928) (not e!704789))))

(declare-datatypes ((array!79957 0))(
  ( (array!79958 (arr!38574 (Array (_ BitVec 32) (_ BitVec 64))) (size!39110 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79957)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103844 (= res!828928 (and (bvslt (size!39110 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39110 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39110 a!3892))))))

(assert (=> start!103844 e!704789))

(declare-fun array_inv!29422 (array!79957) Bool)

(assert (=> start!103844 (array_inv!29422 a!3892)))

(assert (=> start!103844 true))

(declare-fun b!1243151 () Bool)

(declare-datatypes ((List!27377 0))(
  ( (Nil!27374) (Cons!27373 (h!28582 (_ BitVec 64)) (t!40846 List!27377)) )
))
(declare-fun noDuplicate!1976 (List!27377) Bool)

(assert (=> b!1243151 (= e!704789 (not (noDuplicate!1976 Nil!27374)))))

(assert (= (and start!103844 res!828928) b!1243151))

(declare-fun m!1145789 () Bool)

(assert (=> start!103844 m!1145789))

(declare-fun m!1145791 () Bool)

(assert (=> b!1243151 m!1145791))

(check-sat (not start!103844) (not b!1243151))
(check-sat)
(get-model)

(declare-fun d!137055 () Bool)

(assert (=> d!137055 (= (array_inv!29422 a!3892) (bvsge (size!39110 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!103844 d!137055))

(declare-fun d!137057 () Bool)

(declare-fun res!828936 () Bool)

(declare-fun e!704801 () Bool)

(assert (=> d!137057 (=> res!828936 e!704801)))

(get-info :version)

(assert (=> d!137057 (= res!828936 ((_ is Nil!27374) Nil!27374))))

(assert (=> d!137057 (= (noDuplicate!1976 Nil!27374) e!704801)))

(declare-fun b!1243159 () Bool)

(declare-fun e!704802 () Bool)

(assert (=> b!1243159 (= e!704801 e!704802)))

(declare-fun res!828937 () Bool)

(assert (=> b!1243159 (=> (not res!828937) (not e!704802))))

(declare-fun contains!7399 (List!27377 (_ BitVec 64)) Bool)

(assert (=> b!1243159 (= res!828937 (not (contains!7399 (t!40846 Nil!27374) (h!28582 Nil!27374))))))

(declare-fun b!1243160 () Bool)

(assert (=> b!1243160 (= e!704802 (noDuplicate!1976 (t!40846 Nil!27374)))))

(assert (= (and d!137057 (not res!828936)) b!1243159))

(assert (= (and b!1243159 res!828937) b!1243160))

(declare-fun m!1145797 () Bool)

(assert (=> b!1243159 m!1145797))

(declare-fun m!1145799 () Bool)

(assert (=> b!1243160 m!1145799))

(assert (=> b!1243151 d!137057))

(check-sat (not b!1243159) (not b!1243160))
(check-sat)
