; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134304 () Bool)

(assert start!134304)

(declare-fun b!1568496 () Bool)

(declare-fun res!1072183 () Bool)

(declare-fun e!874385 () Bool)

(assert (=> b!1568496 (=> (not res!1072183) (not e!874385))))

(declare-datatypes ((List!36709 0))(
  ( (Nil!36706) (Cons!36705 (h!38152 (_ BitVec 64)) (t!51617 List!36709)) )
))
(declare-fun acc!619 () List!36709)

(declare-fun contains!10411 (List!36709 (_ BitVec 64)) Bool)

(assert (=> b!1568496 (= res!1072183 (not (contains!10411 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568497 () Bool)

(declare-fun res!1072186 () Bool)

(assert (=> b!1568497 (=> (not res!1072186) (not e!874385))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104794 0))(
  ( (array!104795 (arr!50577 (Array (_ BitVec 32) (_ BitVec 64))) (size!51127 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104794)

(assert (=> b!1568497 (= res!1072186 (bvslt from!2856 (size!51127 a!3481)))))

(declare-fun b!1568499 () Bool)

(declare-fun e!874387 () Bool)

(assert (=> b!1568499 (= e!874385 e!874387)))

(declare-fun res!1072182 () Bool)

(assert (=> b!1568499 (=> (not res!1072182) (not e!874387))))

(declare-fun e!874386 () Bool)

(assert (=> b!1568499 (= res!1072182 e!874386)))

(declare-fun res!1072184 () Bool)

(assert (=> b!1568499 (=> res!1072184 e!874386)))

(declare-fun lt!673192 () Bool)

(assert (=> b!1568499 (= res!1072184 lt!673192)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568499 (= lt!673192 (not (validKeyInArray!0 (select (arr!50577 a!3481) from!2856))))))

(declare-fun b!1568500 () Bool)

(assert (=> b!1568500 (= e!874387 (and (not lt!673192) (bvsge (bvsub (size!51127 a!3481) (bvadd #b00000000000000000000000000000001 from!2856)) (bvsub (size!51127 a!3481) from!2856))))))

(declare-fun b!1568501 () Bool)

(declare-fun res!1072185 () Bool)

(assert (=> b!1568501 (=> (not res!1072185) (not e!874385))))

(declare-fun noDuplicate!2683 (List!36709) Bool)

(assert (=> b!1568501 (= res!1072185 (noDuplicate!2683 acc!619))))

(declare-fun b!1568502 () Bool)

(assert (=> b!1568502 (= e!874386 (not (contains!10411 acc!619 (select (arr!50577 a!3481) from!2856))))))

(declare-fun b!1568498 () Bool)

(declare-fun res!1072188 () Bool)

(assert (=> b!1568498 (=> (not res!1072188) (not e!874385))))

(assert (=> b!1568498 (= res!1072188 (not (contains!10411 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1072187 () Bool)

(assert (=> start!134304 (=> (not res!1072187) (not e!874385))))

(assert (=> start!134304 (= res!1072187 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51127 a!3481)) (bvslt (size!51127 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134304 e!874385))

(assert (=> start!134304 true))

(declare-fun array_inv!39304 (array!104794) Bool)

(assert (=> start!134304 (array_inv!39304 a!3481)))

(assert (= (and start!134304 res!1072187) b!1568501))

(assert (= (and b!1568501 res!1072185) b!1568496))

(assert (= (and b!1568496 res!1072183) b!1568498))

(assert (= (and b!1568498 res!1072188) b!1568497))

(assert (= (and b!1568497 res!1072186) b!1568499))

(assert (= (and b!1568499 (not res!1072184)) b!1568502))

(assert (= (and b!1568499 res!1072182) b!1568500))

(declare-fun m!1443143 () Bool)

(assert (=> b!1568496 m!1443143))

(declare-fun m!1443145 () Bool)

(assert (=> b!1568501 m!1443145))

(declare-fun m!1443147 () Bool)

(assert (=> b!1568498 m!1443147))

(declare-fun m!1443149 () Bool)

(assert (=> start!134304 m!1443149))

(declare-fun m!1443151 () Bool)

(assert (=> b!1568499 m!1443151))

(assert (=> b!1568499 m!1443151))

(declare-fun m!1443153 () Bool)

(assert (=> b!1568499 m!1443153))

(assert (=> b!1568502 m!1443151))

(assert (=> b!1568502 m!1443151))

(declare-fun m!1443155 () Bool)

(assert (=> b!1568502 m!1443155))

(push 1)

(assert (not start!134304))

(assert (not b!1568502))

(assert (not b!1568496))

(assert (not b!1568501))

(assert (not b!1568498))

(assert (not b!1568499))

(check-sat)

(pop 1)

(push 1)

(check-sat)

