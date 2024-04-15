; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60270 () Bool)

(assert start!60270)

(declare-fun b!675998 () Bool)

(declare-fun e!385542 () Bool)

(declare-fun e!385538 () Bool)

(assert (=> b!675998 (= e!385542 e!385538)))

(declare-fun res!442589 () Bool)

(assert (=> b!675998 (=> (not res!442589) (not e!385538))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!675998 (= res!442589 (bvsle from!3004 i!1382))))

(declare-fun b!675999 () Bool)

(declare-fun e!385543 () Bool)

(assert (=> b!675999 (= e!385543 false)))

(declare-fun lt!312513 () Bool)

(declare-datatypes ((array!39328 0))(
  ( (array!39329 (arr!18856 (Array (_ BitVec 32) (_ BitVec 64))) (size!19221 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39328)

(declare-datatypes ((List!12936 0))(
  ( (Nil!12933) (Cons!12932 (h!13977 (_ BitVec 64)) (t!19155 List!12936)) )
))
(declare-fun acc!681 () List!12936)

(declare-fun arrayNoDuplicates!0 (array!39328 (_ BitVec 32) List!12936) Bool)

(assert (=> b!675999 (= lt!312513 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676000 () Bool)

(declare-fun e!385541 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3458 (List!12936 (_ BitVec 64)) Bool)

(assert (=> b!676000 (= e!385541 (contains!3458 acc!681 k!2843))))

(declare-fun b!676001 () Bool)

(declare-fun e!385544 () Bool)

(assert (=> b!676001 (= e!385544 (contains!3458 acc!681 k!2843))))

(declare-fun b!676002 () Bool)

(assert (=> b!676002 (= e!385538 (not (contains!3458 acc!681 k!2843)))))

(declare-fun b!676003 () Bool)

(declare-fun res!442585 () Bool)

(assert (=> b!676003 (=> (not res!442585) (not e!385543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676003 (= res!442585 (validKeyInArray!0 k!2843))))

(declare-fun b!676004 () Bool)

(declare-fun res!442587 () Bool)

(assert (=> b!676004 (=> (not res!442587) (not e!385543))))

(assert (=> b!676004 (= res!442587 e!385542)))

(declare-fun res!442593 () Bool)

(assert (=> b!676004 (=> res!442593 e!385542)))

(assert (=> b!676004 (= res!442593 e!385544)))

(declare-fun res!442590 () Bool)

(assert (=> b!676004 (=> (not res!442590) (not e!385544))))

(assert (=> b!676004 (= res!442590 (bvsgt from!3004 i!1382))))

(declare-fun b!676005 () Bool)

(declare-fun res!442595 () Bool)

(assert (=> b!676005 (=> (not res!442595) (not e!385543))))

(declare-fun arrayContainsKey!0 (array!39328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676005 (= res!442595 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676006 () Bool)

(declare-fun res!442603 () Bool)

(assert (=> b!676006 (=> (not res!442603) (not e!385543))))

(assert (=> b!676006 (= res!442603 (not (contains!3458 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676007 () Bool)

(declare-fun res!442601 () Bool)

(assert (=> b!676007 (=> (not res!442601) (not e!385543))))

(assert (=> b!676007 (= res!442601 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676008 () Bool)

(declare-fun res!442599 () Bool)

(assert (=> b!676008 (=> (not res!442599) (not e!385543))))

(declare-fun e!385537 () Bool)

(assert (=> b!676008 (= res!442599 e!385537)))

(declare-fun res!442598 () Bool)

(assert (=> b!676008 (=> res!442598 e!385537)))

(assert (=> b!676008 (= res!442598 e!385541)))

(declare-fun res!442592 () Bool)

(assert (=> b!676008 (=> (not res!442592) (not e!385541))))

(assert (=> b!676008 (= res!442592 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!442584 () Bool)

(assert (=> start!60270 (=> (not res!442584) (not e!385543))))

(assert (=> start!60270 (= res!442584 (and (bvslt (size!19221 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19221 a!3626))))))

(assert (=> start!60270 e!385543))

(assert (=> start!60270 true))

(declare-fun array_inv!14739 (array!39328) Bool)

(assert (=> start!60270 (array_inv!14739 a!3626)))

(declare-fun b!676009 () Bool)

(declare-fun res!442588 () Bool)

(assert (=> b!676009 (=> (not res!442588) (not e!385543))))

(assert (=> b!676009 (= res!442588 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676010 () Bool)

(declare-fun e!385539 () Bool)

(assert (=> b!676010 (= e!385539 (not (contains!3458 acc!681 k!2843)))))

(declare-fun b!676011 () Bool)

(declare-fun res!442602 () Bool)

(assert (=> b!676011 (=> (not res!442602) (not e!385543))))

(assert (=> b!676011 (= res!442602 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19221 a!3626))))))

(declare-fun b!676012 () Bool)

(declare-fun res!442594 () Bool)

(assert (=> b!676012 (=> (not res!442594) (not e!385543))))

(assert (=> b!676012 (= res!442594 (not (validKeyInArray!0 (select (arr!18856 a!3626) from!3004))))))

(declare-fun b!676013 () Bool)

(declare-fun res!442586 () Bool)

(assert (=> b!676013 (=> (not res!442586) (not e!385543))))

(assert (=> b!676013 (= res!442586 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19221 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676014 () Bool)

(declare-fun res!442596 () Bool)

(assert (=> b!676014 (=> (not res!442596) (not e!385543))))

(assert (=> b!676014 (= res!442596 (not (contains!3458 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676015 () Bool)

(declare-fun res!442591 () Bool)

(assert (=> b!676015 (=> (not res!442591) (not e!385543))))

(declare-fun noDuplicate!727 (List!12936) Bool)

(assert (=> b!676015 (= res!442591 (noDuplicate!727 acc!681))))

(declare-fun b!676016 () Bool)

(declare-fun res!442597 () Bool)

(assert (=> b!676016 (=> (not res!442597) (not e!385543))))

(assert (=> b!676016 (= res!442597 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12933))))

(declare-fun b!676017 () Bool)

(assert (=> b!676017 (= e!385537 e!385539)))

(declare-fun res!442600 () Bool)

(assert (=> b!676017 (=> (not res!442600) (not e!385539))))

(assert (=> b!676017 (= res!442600 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60270 res!442584) b!676015))

(assert (= (and b!676015 res!442591) b!676006))

(assert (= (and b!676006 res!442603) b!676014))

(assert (= (and b!676014 res!442596) b!676004))

(assert (= (and b!676004 res!442590) b!676001))

(assert (= (and b!676004 (not res!442593)) b!675998))

(assert (= (and b!675998 res!442589) b!676002))

(assert (= (and b!676004 res!442587) b!676016))

(assert (= (and b!676016 res!442597) b!676007))

(assert (= (and b!676007 res!442601) b!676011))

(assert (= (and b!676011 res!442602) b!676003))

(assert (= (and b!676003 res!442585) b!676005))

(assert (= (and b!676005 res!442595) b!676013))

(assert (= (and b!676013 res!442586) b!676012))

(assert (= (and b!676012 res!442594) b!676009))

(assert (= (and b!676009 res!442588) b!676008))

(assert (= (and b!676008 res!442592) b!676000))

(assert (= (and b!676008 (not res!442598)) b!676017))

(assert (= (and b!676017 res!442600) b!676010))

(assert (= (and b!676008 res!442599) b!675999))

(declare-fun m!642453 () Bool)

(assert (=> b!676015 m!642453))

(declare-fun m!642455 () Bool)

(assert (=> b!676003 m!642455))

(declare-fun m!642457 () Bool)

(assert (=> b!676010 m!642457))

(assert (=> b!676000 m!642457))

(declare-fun m!642459 () Bool)

(assert (=> b!676014 m!642459))

(assert (=> b!676001 m!642457))

(assert (=> b!676002 m!642457))

(declare-fun m!642461 () Bool)

(assert (=> b!675999 m!642461))

(declare-fun m!642463 () Bool)

(assert (=> b!676005 m!642463))

(declare-fun m!642465 () Bool)

(assert (=> b!676006 m!642465))

(declare-fun m!642467 () Bool)

(assert (=> b!676016 m!642467))

(declare-fun m!642469 () Bool)

(assert (=> b!676012 m!642469))

(assert (=> b!676012 m!642469))

(declare-fun m!642471 () Bool)

(assert (=> b!676012 m!642471))

(declare-fun m!642473 () Bool)

(assert (=> start!60270 m!642473))

(declare-fun m!642475 () Bool)

(assert (=> b!676007 m!642475))

(push 1)

(assert (not b!676016))

(assert (not b!676002))

(assert (not b!676010))

(assert (not b!676005))

(assert (not b!676001))

(assert (not b!676006))

(assert (not b!676014))

(assert (not start!60270))

(assert (not b!676000))

(assert (not b!676003))

(assert (not b!676007))

(assert (not b!676012))

(assert (not b!676015))

(assert (not b!675999))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

