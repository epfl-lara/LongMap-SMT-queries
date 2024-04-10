; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102448 () Bool)

(assert start!102448)

(declare-fun b!1232282 () Bool)

(declare-fun e!698946 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1232282 (= e!698946 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(declare-fun e!698945 () Bool)

(assert (=> b!1232282 e!698945))

(declare-fun res!820665 () Bool)

(assert (=> b!1232282 (=> (not res!820665) (not e!698945))))

(declare-datatypes ((array!79479 0))(
  ( (array!79480 (arr!38353 (Array (_ BitVec 32) (_ BitVec 64))) (size!38889 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79479)

(declare-datatypes ((List!27126 0))(
  ( (Nil!27123) (Cons!27122 (h!28331 (_ BitVec 64)) (t!40589 List!27126)) )
))
(declare-fun arrayNoDuplicates!0 (array!79479 (_ BitVec 32) List!27126) Bool)

(assert (=> b!1232282 (= res!820665 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27123))))

(declare-fun acc!823 () List!27126)

(declare-datatypes ((Unit!40812 0))(
  ( (Unit!40813) )
))
(declare-fun lt!559502 () Unit!40812)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79479 List!27126 List!27126 (_ BitVec 32)) Unit!40812)

(assert (=> b!1232282 (= lt!559502 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27123 from!3184))))

(assert (=> b!1232282 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27122 (select (arr!38353 a!3806) from!3184) acc!823))))

(declare-fun b!1232283 () Bool)

(declare-fun res!820667 () Bool)

(assert (=> b!1232283 (=> (not res!820667) (not e!698946))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232283 (= res!820667 (validKeyInArray!0 (select (arr!38353 a!3806) from!3184)))))

(declare-fun b!1232284 () Bool)

(declare-fun res!820669 () Bool)

(assert (=> b!1232284 (=> (not res!820669) (not e!698946))))

(declare-fun contains!7188 (List!27126 (_ BitVec 64)) Bool)

(assert (=> b!1232284 (= res!820669 (not (contains!7188 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232285 () Bool)

(declare-fun res!820663 () Bool)

(assert (=> b!1232285 (=> (not res!820663) (not e!698946))))

(assert (=> b!1232285 (= res!820663 (not (contains!7188 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232286 () Bool)

(declare-fun res!820662 () Bool)

(assert (=> b!1232286 (=> (not res!820662) (not e!698946))))

(assert (=> b!1232286 (= res!820662 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38889 a!3806)) (bvslt from!3184 (size!38889 a!3806))))))

(declare-fun b!1232287 () Bool)

(declare-fun res!820660 () Bool)

(assert (=> b!1232287 (=> (not res!820660) (not e!698946))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1232287 (= res!820660 (validKeyInArray!0 k!2913))))

(declare-fun b!1232288 () Bool)

(assert (=> b!1232288 (= e!698945 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27122 (select (arr!38353 a!3806) from!3184) Nil!27123)))))

(declare-fun b!1232289 () Bool)

(declare-fun res!820666 () Bool)

(assert (=> b!1232289 (=> (not res!820666) (not e!698946))))

(declare-fun noDuplicate!1785 (List!27126) Bool)

(assert (=> b!1232289 (= res!820666 (noDuplicate!1785 acc!823))))

(declare-fun b!1232290 () Bool)

(declare-fun res!820668 () Bool)

(assert (=> b!1232290 (=> (not res!820668) (not e!698946))))

(declare-fun arrayContainsKey!0 (array!79479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232290 (= res!820668 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232291 () Bool)

(declare-fun res!820664 () Bool)

(assert (=> b!1232291 (=> (not res!820664) (not e!698946))))

(assert (=> b!1232291 (= res!820664 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!820661 () Bool)

(assert (=> start!102448 (=> (not res!820661) (not e!698946))))

(assert (=> start!102448 (= res!820661 (bvslt (size!38889 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102448 e!698946))

(declare-fun array_inv!29201 (array!79479) Bool)

(assert (=> start!102448 (array_inv!29201 a!3806)))

(assert (=> start!102448 true))

(assert (= (and start!102448 res!820661) b!1232287))

(assert (= (and b!1232287 res!820660) b!1232286))

(assert (= (and b!1232286 res!820662) b!1232289))

(assert (= (and b!1232289 res!820666) b!1232284))

(assert (= (and b!1232284 res!820669) b!1232285))

(assert (= (and b!1232285 res!820663) b!1232290))

(assert (= (and b!1232290 res!820668) b!1232291))

(assert (= (and b!1232291 res!820664) b!1232283))

(assert (= (and b!1232283 res!820667) b!1232282))

(assert (= (and b!1232282 res!820665) b!1232288))

(declare-fun m!1136291 () Bool)

(assert (=> b!1232285 m!1136291))

(declare-fun m!1136293 () Bool)

(assert (=> b!1232290 m!1136293))

(declare-fun m!1136295 () Bool)

(assert (=> b!1232287 m!1136295))

(declare-fun m!1136297 () Bool)

(assert (=> b!1232289 m!1136297))

(declare-fun m!1136299 () Bool)

(assert (=> b!1232291 m!1136299))

(declare-fun m!1136301 () Bool)

(assert (=> b!1232288 m!1136301))

(declare-fun m!1136303 () Bool)

(assert (=> b!1232288 m!1136303))

(declare-fun m!1136305 () Bool)

(assert (=> b!1232284 m!1136305))

(declare-fun m!1136307 () Bool)

(assert (=> b!1232282 m!1136307))

(declare-fun m!1136309 () Bool)

(assert (=> b!1232282 m!1136309))

(assert (=> b!1232282 m!1136301))

(declare-fun m!1136311 () Bool)

(assert (=> b!1232282 m!1136311))

(assert (=> b!1232283 m!1136301))

(assert (=> b!1232283 m!1136301))

(declare-fun m!1136313 () Bool)

(assert (=> b!1232283 m!1136313))

(declare-fun m!1136315 () Bool)

(assert (=> start!102448 m!1136315))

(push 1)

(assert (not start!102448))

(assert (not b!1232290))

(assert (not b!1232287))

(assert (not b!1232288))

(assert (not b!1232283))

