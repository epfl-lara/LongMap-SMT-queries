; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102992 () Bool)

(assert start!102992)

(declare-fun b!1237248 () Bool)

(declare-fun e!701240 () Bool)

(assert (=> b!1237248 (= e!701240 (not true))))

(declare-datatypes ((List!27326 0))(
  ( (Nil!27323) (Cons!27322 (h!28531 (_ BitVec 64)) (t!40780 List!27326)) )
))
(declare-fun acc!846 () List!27326)

(declare-fun lt!560830 () List!27326)

(declare-fun subseq!580 (List!27326 List!27326) Bool)

(assert (=> b!1237248 (subseq!580 acc!846 lt!560830)))

(declare-datatypes ((Unit!40903 0))(
  ( (Unit!40904) )
))
(declare-fun lt!560831 () Unit!40903)

(declare-fun subseqTail!67 (List!27326 List!27326) Unit!40903)

(assert (=> b!1237248 (= lt!560831 (subseqTail!67 lt!560830 lt!560830))))

(assert (=> b!1237248 (subseq!580 lt!560830 lt!560830)))

(declare-fun lt!560829 () Unit!40903)

(declare-fun lemmaListSubSeqRefl!0 (List!27326) Unit!40903)

(assert (=> b!1237248 (= lt!560829 (lemmaListSubSeqRefl!0 lt!560830))))

(declare-datatypes ((array!79691 0))(
  ( (array!79692 (arr!38452 (Array (_ BitVec 32) (_ BitVec 64))) (size!38990 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79691)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1237248 (= lt!560830 (Cons!27322 (select (arr!38452 a!3835) from!3213) acc!846))))

(declare-fun b!1237249 () Bool)

(declare-fun res!825151 () Bool)

(assert (=> b!1237249 (=> (not res!825151) (not e!701240))))

(declare-fun contains!7298 (List!27326 (_ BitVec 64)) Bool)

(assert (=> b!1237249 (= res!825151 (not (contains!7298 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237250 () Bool)

(declare-fun res!825155 () Bool)

(assert (=> b!1237250 (=> (not res!825155) (not e!701240))))

(assert (=> b!1237250 (= res!825155 (not (contains!7298 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237251 () Bool)

(declare-fun res!825153 () Bool)

(assert (=> b!1237251 (=> (not res!825153) (not e!701240))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1237251 (= res!825153 (contains!7298 acc!846 k!2925))))

(declare-fun b!1237252 () Bool)

(declare-fun res!825156 () Bool)

(assert (=> b!1237252 (=> (not res!825156) (not e!701240))))

(assert (=> b!1237252 (= res!825156 (not (= from!3213 (bvsub (size!38990 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237253 () Bool)

(declare-fun res!825154 () Bool)

(assert (=> b!1237253 (=> (not res!825154) (not e!701240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237253 (= res!825154 (validKeyInArray!0 (select (arr!38452 a!3835) from!3213)))))

(declare-fun b!1237254 () Bool)

(declare-fun res!825152 () Bool)

(assert (=> b!1237254 (=> (not res!825152) (not e!701240))))

(declare-fun noDuplicate!1941 (List!27326) Bool)

(assert (=> b!1237254 (= res!825152 (noDuplicate!1941 acc!846))))

(declare-fun res!825158 () Bool)

(assert (=> start!102992 (=> (not res!825158) (not e!701240))))

(assert (=> start!102992 (= res!825158 (and (bvslt (size!38990 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38990 a!3835))))))

(assert (=> start!102992 e!701240))

(declare-fun array_inv!29435 (array!79691) Bool)

(assert (=> start!102992 (array_inv!29435 a!3835)))

(assert (=> start!102992 true))

(declare-fun b!1237247 () Bool)

(declare-fun res!825157 () Bool)

(assert (=> b!1237247 (=> (not res!825157) (not e!701240))))

(declare-fun arrayNoDuplicates!0 (array!79691 (_ BitVec 32) List!27326) Bool)

(assert (=> b!1237247 (= res!825157 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102992 res!825158) b!1237254))

(assert (= (and b!1237254 res!825152) b!1237250))

(assert (= (and b!1237250 res!825155) b!1237249))

(assert (= (and b!1237249 res!825151) b!1237247))

(assert (= (and b!1237247 res!825157) b!1237251))

(assert (= (and b!1237251 res!825153) b!1237252))

(assert (= (and b!1237252 res!825156) b!1237253))

(assert (= (and b!1237253 res!825154) b!1237248))

(declare-fun m!1140537 () Bool)

(assert (=> b!1237251 m!1140537))

(declare-fun m!1140539 () Bool)

(assert (=> b!1237253 m!1140539))

(assert (=> b!1237253 m!1140539))

(declare-fun m!1140541 () Bool)

(assert (=> b!1237253 m!1140541))

(declare-fun m!1140543 () Bool)

(assert (=> b!1237250 m!1140543))

(declare-fun m!1140545 () Bool)

(assert (=> b!1237248 m!1140545))

(declare-fun m!1140547 () Bool)

(assert (=> b!1237248 m!1140547))

(assert (=> b!1237248 m!1140539))

(declare-fun m!1140549 () Bool)

(assert (=> b!1237248 m!1140549))

(declare-fun m!1140551 () Bool)

(assert (=> b!1237248 m!1140551))

(declare-fun m!1140553 () Bool)

(assert (=> b!1237254 m!1140553))

(declare-fun m!1140555 () Bool)

(assert (=> b!1237249 m!1140555))

(declare-fun m!1140557 () Bool)

(assert (=> start!102992 m!1140557))

(declare-fun m!1140559 () Bool)

(assert (=> b!1237247 m!1140559))

(push 1)

(assert (not b!1237248))

(assert (not b!1237251))

(assert (not b!1237249))

(assert (not start!102992))

(assert (not b!1237254))

(assert (not b!1237250))

(assert (not b!1237253))

(assert (not b!1237247))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

