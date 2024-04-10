; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103006 () Bool)

(assert start!103006)

(declare-fun b!1237459 () Bool)

(declare-fun res!825330 () Bool)

(declare-fun e!701309 () Bool)

(assert (=> b!1237459 (=> (not res!825330) (not e!701309))))

(declare-datatypes ((array!79782 0))(
  ( (array!79783 (arr!38497 (Array (_ BitVec 32) (_ BitVec 64))) (size!39033 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79782)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237459 (= res!825330 (validKeyInArray!0 (select (arr!38497 a!3835) from!3213)))))

(declare-fun b!1237460 () Bool)

(declare-fun res!825332 () Bool)

(assert (=> b!1237460 (=> (not res!825332) (not e!701309))))

(assert (=> b!1237460 (= res!825332 (not (= from!3213 (bvsub (size!39033 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237461 () Bool)

(declare-fun res!825328 () Bool)

(assert (=> b!1237461 (=> (not res!825328) (not e!701309))))

(declare-datatypes ((List!27270 0))(
  ( (Nil!27267) (Cons!27266 (h!28475 (_ BitVec 64)) (t!40733 List!27270)) )
))
(declare-fun acc!846 () List!27270)

(declare-fun arrayNoDuplicates!0 (array!79782 (_ BitVec 32) List!27270) Bool)

(assert (=> b!1237461 (= res!825328 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237462 () Bool)

(declare-fun res!825334 () Bool)

(assert (=> b!1237462 (=> (not res!825334) (not e!701309))))

(declare-fun noDuplicate!1929 (List!27270) Bool)

(assert (=> b!1237462 (= res!825334 (noDuplicate!1929 acc!846))))

(declare-fun b!1237463 () Bool)

(declare-fun res!825331 () Bool)

(assert (=> b!1237463 (=> (not res!825331) (not e!701309))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7332 (List!27270 (_ BitVec 64)) Bool)

(assert (=> b!1237463 (= res!825331 (contains!7332 acc!846 k!2925))))

(declare-fun b!1237464 () Bool)

(assert (=> b!1237464 (= e!701309 (not true))))

(declare-fun lt!561058 () List!27270)

(declare-fun subseq!586 (List!27270 List!27270) Bool)

(assert (=> b!1237464 (subseq!586 acc!846 lt!561058)))

(declare-datatypes ((Unit!41070 0))(
  ( (Unit!41071) )
))
(declare-fun lt!561059 () Unit!41070)

(declare-fun subseqTail!73 (List!27270 List!27270) Unit!41070)

(assert (=> b!1237464 (= lt!561059 (subseqTail!73 lt!561058 lt!561058))))

(assert (=> b!1237464 (subseq!586 lt!561058 lt!561058)))

(declare-fun lt!561057 () Unit!41070)

(declare-fun lemmaListSubSeqRefl!0 (List!27270) Unit!41070)

(assert (=> b!1237464 (= lt!561057 (lemmaListSubSeqRefl!0 lt!561058))))

(assert (=> b!1237464 (= lt!561058 (Cons!27266 (select (arr!38497 a!3835) from!3213) acc!846))))

(declare-fun res!825333 () Bool)

(assert (=> start!103006 (=> (not res!825333) (not e!701309))))

(assert (=> start!103006 (= res!825333 (and (bvslt (size!39033 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39033 a!3835))))))

(assert (=> start!103006 e!701309))

(declare-fun array_inv!29345 (array!79782) Bool)

(assert (=> start!103006 (array_inv!29345 a!3835)))

(assert (=> start!103006 true))

(declare-fun b!1237465 () Bool)

(declare-fun res!825327 () Bool)

(assert (=> b!1237465 (=> (not res!825327) (not e!701309))))

(assert (=> b!1237465 (= res!825327 (not (contains!7332 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237466 () Bool)

(declare-fun res!825329 () Bool)

(assert (=> b!1237466 (=> (not res!825329) (not e!701309))))

(assert (=> b!1237466 (= res!825329 (not (contains!7332 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103006 res!825333) b!1237462))

(assert (= (and b!1237462 res!825334) b!1237466))

(assert (= (and b!1237466 res!825329) b!1237465))

(assert (= (and b!1237465 res!825327) b!1237461))

(assert (= (and b!1237461 res!825328) b!1237463))

(assert (= (and b!1237463 res!825331) b!1237460))

(assert (= (and b!1237460 res!825332) b!1237459))

(assert (= (and b!1237459 res!825330) b!1237464))

(declare-fun m!1141177 () Bool)

(assert (=> b!1237462 m!1141177))

(declare-fun m!1141179 () Bool)

(assert (=> b!1237461 m!1141179))

(declare-fun m!1141181 () Bool)

(assert (=> start!103006 m!1141181))

(declare-fun m!1141183 () Bool)

(assert (=> b!1237465 m!1141183))

(declare-fun m!1141185 () Bool)

(assert (=> b!1237464 m!1141185))

(declare-fun m!1141187 () Bool)

(assert (=> b!1237464 m!1141187))

(declare-fun m!1141189 () Bool)

(assert (=> b!1237464 m!1141189))

(declare-fun m!1141191 () Bool)

(assert (=> b!1237464 m!1141191))

(declare-fun m!1141193 () Bool)

(assert (=> b!1237464 m!1141193))

(declare-fun m!1141195 () Bool)

(assert (=> b!1237463 m!1141195))

(declare-fun m!1141197 () Bool)

(assert (=> b!1237466 m!1141197))

(assert (=> b!1237459 m!1141193))

(assert (=> b!1237459 m!1141193))

(declare-fun m!1141199 () Bool)

(assert (=> b!1237459 m!1141199))

(push 1)

(assert (not b!1237465))

(assert (not b!1237463))

(assert (not b!1237466))

(assert (not b!1237461))

(assert (not b!1237462))

(assert (not b!1237459))

(assert (not b!1237464))

(assert (not start!103006))

(check-sat)

(pop 1)

