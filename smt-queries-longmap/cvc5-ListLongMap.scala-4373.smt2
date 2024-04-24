; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60328 () Bool)

(assert start!60328)

(declare-fun b!676158 () Bool)

(declare-fun e!385724 () Bool)

(declare-datatypes ((List!12794 0))(
  ( (Nil!12791) (Cons!12790 (h!13838 (_ BitVec 64)) (t!19014 List!12794)) )
))
(declare-fun acc!681 () List!12794)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3446 (List!12794 (_ BitVec 64)) Bool)

(assert (=> b!676158 (= e!385724 (contains!3446 acc!681 k!2843))))

(declare-fun b!676159 () Bool)

(declare-fun res!442488 () Bool)

(declare-fun e!385726 () Bool)

(assert (=> b!676159 (=> (not res!442488) (not e!385726))))

(declare-fun noDuplicate!720 (List!12794) Bool)

(assert (=> b!676159 (= res!442488 (noDuplicate!720 acc!681))))

(declare-fun b!676160 () Bool)

(declare-fun res!442490 () Bool)

(assert (=> b!676160 (=> (not res!442490) (not e!385726))))

(assert (=> b!676160 (= res!442490 (not (contains!3446 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676161 () Bool)

(declare-fun res!442485 () Bool)

(assert (=> b!676161 (=> (not res!442485) (not e!385726))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39313 0))(
  ( (array!39314 (arr!18846 (Array (_ BitVec 32) (_ BitVec 64))) (size!19210 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39313)

(assert (=> b!676161 (= res!442485 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19210 a!3626))))))

(declare-fun b!676162 () Bool)

(assert (=> b!676162 (= e!385726 false)))

(declare-fun lt!312853 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39313 (_ BitVec 32) List!12794) Bool)

(assert (=> b!676162 (= lt!312853 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676163 () Bool)

(declare-fun res!442482 () Bool)

(assert (=> b!676163 (=> (not res!442482) (not e!385726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676163 (= res!442482 (not (validKeyInArray!0 (select (arr!18846 a!3626) from!3004))))))

(declare-fun b!676164 () Bool)

(declare-fun e!385731 () Bool)

(declare-fun e!385730 () Bool)

(assert (=> b!676164 (= e!385731 e!385730)))

(declare-fun res!442479 () Bool)

(assert (=> b!676164 (=> (not res!442479) (not e!385730))))

(assert (=> b!676164 (= res!442479 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676165 () Bool)

(declare-fun res!442487 () Bool)

(assert (=> b!676165 (=> (not res!442487) (not e!385726))))

(assert (=> b!676165 (= res!442487 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676167 () Bool)

(declare-fun e!385729 () Bool)

(assert (=> b!676167 (= e!385729 (not (contains!3446 acc!681 k!2843)))))

(declare-fun b!676168 () Bool)

(declare-fun res!442481 () Bool)

(assert (=> b!676168 (=> (not res!442481) (not e!385726))))

(assert (=> b!676168 (= res!442481 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12791))))

(declare-fun b!676169 () Bool)

(declare-fun res!442478 () Bool)

(assert (=> b!676169 (=> (not res!442478) (not e!385726))))

(declare-fun e!385727 () Bool)

(assert (=> b!676169 (= res!442478 e!385727)))

(declare-fun res!442475 () Bool)

(assert (=> b!676169 (=> res!442475 e!385727)))

(assert (=> b!676169 (= res!442475 e!385724)))

(declare-fun res!442486 () Bool)

(assert (=> b!676169 (=> (not res!442486) (not e!385724))))

(assert (=> b!676169 (= res!442486 (bvsgt from!3004 i!1382))))

(declare-fun b!676170 () Bool)

(declare-fun res!442473 () Bool)

(assert (=> b!676170 (=> (not res!442473) (not e!385726))))

(assert (=> b!676170 (= res!442473 (validKeyInArray!0 k!2843))))

(declare-fun b!676171 () Bool)

(assert (=> b!676171 (= e!385727 e!385729)))

(declare-fun res!442476 () Bool)

(assert (=> b!676171 (=> (not res!442476) (not e!385729))))

(assert (=> b!676171 (= res!442476 (bvsle from!3004 i!1382))))

(declare-fun b!676172 () Bool)

(declare-fun res!442477 () Bool)

(assert (=> b!676172 (=> (not res!442477) (not e!385726))))

(assert (=> b!676172 (= res!442477 (not (contains!3446 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676173 () Bool)

(assert (=> b!676173 (= e!385730 (not (contains!3446 acc!681 k!2843)))))

(declare-fun b!676174 () Bool)

(declare-fun res!442474 () Bool)

(assert (=> b!676174 (=> (not res!442474) (not e!385726))))

(assert (=> b!676174 (= res!442474 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19210 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676175 () Bool)

(declare-fun res!442492 () Bool)

(assert (=> b!676175 (=> (not res!442492) (not e!385726))))

(declare-fun arrayContainsKey!0 (array!39313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676175 (= res!442492 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676166 () Bool)

(declare-fun res!442489 () Bool)

(assert (=> b!676166 (=> (not res!442489) (not e!385726))))

(assert (=> b!676166 (= res!442489 e!385731)))

(declare-fun res!442480 () Bool)

(assert (=> b!676166 (=> res!442480 e!385731)))

(declare-fun e!385725 () Bool)

(assert (=> b!676166 (= res!442480 e!385725)))

(declare-fun res!442484 () Bool)

(assert (=> b!676166 (=> (not res!442484) (not e!385725))))

(assert (=> b!676166 (= res!442484 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!442483 () Bool)

(assert (=> start!60328 (=> (not res!442483) (not e!385726))))

(assert (=> start!60328 (= res!442483 (and (bvslt (size!19210 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19210 a!3626))))))

(assert (=> start!60328 e!385726))

(assert (=> start!60328 true))

(declare-fun array_inv!14705 (array!39313) Bool)

(assert (=> start!60328 (array_inv!14705 a!3626)))

(declare-fun b!676176 () Bool)

(declare-fun res!442491 () Bool)

(assert (=> b!676176 (=> (not res!442491) (not e!385726))))

(assert (=> b!676176 (= res!442491 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676177 () Bool)

(assert (=> b!676177 (= e!385725 (contains!3446 acc!681 k!2843))))

(assert (= (and start!60328 res!442483) b!676159))

(assert (= (and b!676159 res!442488) b!676160))

(assert (= (and b!676160 res!442490) b!676172))

(assert (= (and b!676172 res!442477) b!676169))

(assert (= (and b!676169 res!442486) b!676158))

(assert (= (and b!676169 (not res!442475)) b!676171))

(assert (= (and b!676171 res!442476) b!676167))

(assert (= (and b!676169 res!442478) b!676168))

(assert (= (and b!676168 res!442481) b!676176))

(assert (= (and b!676176 res!442491) b!676161))

(assert (= (and b!676161 res!442485) b!676170))

(assert (= (and b!676170 res!442473) b!676175))

(assert (= (and b!676175 res!442492) b!676174))

(assert (= (and b!676174 res!442474) b!676163))

(assert (= (and b!676163 res!442482) b!676165))

(assert (= (and b!676165 res!442487) b!676166))

(assert (= (and b!676166 res!442484) b!676177))

(assert (= (and b!676166 (not res!442480)) b!676164))

(assert (= (and b!676164 res!442479) b!676173))

(assert (= (and b!676166 res!442489) b!676162))

(declare-fun m!643789 () Bool)

(assert (=> b!676162 m!643789))

(declare-fun m!643791 () Bool)

(assert (=> b!676170 m!643791))

(declare-fun m!643793 () Bool)

(assert (=> b!676160 m!643793))

(declare-fun m!643795 () Bool)

(assert (=> b!676173 m!643795))

(declare-fun m!643797 () Bool)

(assert (=> start!60328 m!643797))

(declare-fun m!643799 () Bool)

(assert (=> b!676163 m!643799))

(assert (=> b!676163 m!643799))

(declare-fun m!643801 () Bool)

(assert (=> b!676163 m!643801))

(assert (=> b!676177 m!643795))

(assert (=> b!676167 m!643795))

(declare-fun m!643803 () Bool)

(assert (=> b!676176 m!643803))

(declare-fun m!643805 () Bool)

(assert (=> b!676168 m!643805))

(assert (=> b!676158 m!643795))

(declare-fun m!643807 () Bool)

(assert (=> b!676159 m!643807))

(declare-fun m!643809 () Bool)

(assert (=> b!676175 m!643809))

(declare-fun m!643811 () Bool)

(assert (=> b!676172 m!643811))

(push 1)

(assert (not b!676159))

(assert (not b!676177))

(assert (not b!676170))

(assert (not b!676158))

(assert (not b!676172))

(assert (not b!676173))

(assert (not b!676163))

(assert (not b!676160))

(assert (not b!676162))

(assert (not start!60328))

(assert (not b!676176))

(assert (not b!676167))

(assert (not b!676175))

(assert (not b!676168))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

