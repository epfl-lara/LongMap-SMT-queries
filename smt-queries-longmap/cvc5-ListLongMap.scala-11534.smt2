; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134288 () Bool)

(assert start!134288)

(declare-datatypes ((array!104778 0))(
  ( (array!104779 (arr!50569 (Array (_ BitVec 32) (_ BitVec 64))) (size!51119 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104778)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun e!874306 () Bool)

(declare-fun b!1568344 () Bool)

(declare-datatypes ((List!36701 0))(
  ( (Nil!36698) (Cons!36697 (h!38144 (_ BitVec 64)) (t!51609 List!36701)) )
))
(declare-fun acc!619 () List!36701)

(declare-fun contains!10403 (List!36701 (_ BitVec 64)) Bool)

(assert (=> b!1568344 (= e!874306 (not (contains!10403 acc!619 (select (arr!50569 a!3481) from!2856))))))

(declare-fun b!1568345 () Bool)

(declare-fun res!1072035 () Bool)

(declare-fun e!874307 () Bool)

(assert (=> b!1568345 (=> (not res!1072035) (not e!874307))))

(declare-fun noDuplicate!2675 (List!36701) Bool)

(assert (=> b!1568345 (= res!1072035 (noDuplicate!2675 acc!619))))

(declare-fun b!1568346 () Bool)

(declare-fun res!1072030 () Bool)

(assert (=> b!1568346 (=> (not res!1072030) (not e!874307))))

(assert (=> b!1568346 (= res!1072030 (bvslt from!2856 (size!51119 a!3481)))))

(declare-fun b!1568347 () Bool)

(declare-fun res!1072032 () Bool)

(assert (=> b!1568347 (=> (not res!1072032) (not e!874307))))

(assert (=> b!1568347 (= res!1072032 (not (contains!10403 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568348 () Bool)

(declare-fun res!1072034 () Bool)

(assert (=> b!1568348 (=> (not res!1072034) (not e!874307))))

(assert (=> b!1568348 (= res!1072034 (not (contains!10403 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568349 () Bool)

(assert (=> b!1568349 (= e!874307 false)))

(declare-fun lt!673168 () Bool)

(assert (=> b!1568349 (= lt!673168 e!874306)))

(declare-fun res!1072033 () Bool)

(assert (=> b!1568349 (=> res!1072033 e!874306)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568349 (= res!1072033 (not (validKeyInArray!0 (select (arr!50569 a!3481) from!2856))))))

(declare-fun res!1072031 () Bool)

(assert (=> start!134288 (=> (not res!1072031) (not e!874307))))

(assert (=> start!134288 (= res!1072031 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51119 a!3481)) (bvslt (size!51119 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134288 e!874307))

(assert (=> start!134288 true))

(declare-fun array_inv!39296 (array!104778) Bool)

(assert (=> start!134288 (array_inv!39296 a!3481)))

(assert (= (and start!134288 res!1072031) b!1568345))

(assert (= (and b!1568345 res!1072035) b!1568348))

(assert (= (and b!1568348 res!1072034) b!1568347))

(assert (= (and b!1568347 res!1072032) b!1568346))

(assert (= (and b!1568346 res!1072030) b!1568349))

(assert (= (and b!1568349 (not res!1072033)) b!1568344))

(declare-fun m!1443031 () Bool)

(assert (=> b!1568348 m!1443031))

(declare-fun m!1443033 () Bool)

(assert (=> b!1568345 m!1443033))

(declare-fun m!1443035 () Bool)

(assert (=> b!1568347 m!1443035))

(declare-fun m!1443037 () Bool)

(assert (=> b!1568344 m!1443037))

(assert (=> b!1568344 m!1443037))

(declare-fun m!1443039 () Bool)

(assert (=> b!1568344 m!1443039))

(declare-fun m!1443041 () Bool)

(assert (=> start!134288 m!1443041))

(assert (=> b!1568349 m!1443037))

(assert (=> b!1568349 m!1443037))

(declare-fun m!1443043 () Bool)

(assert (=> b!1568349 m!1443043))

(push 1)

(assert (not b!1568344))

(assert (not b!1568345))

(assert (not b!1568347))

(assert (not b!1568349))

(assert (not start!134288))

(assert (not b!1568348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

