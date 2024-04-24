; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60400 () Bool)

(assert start!60400)

(declare-fun b!678203 () Bool)

(declare-fun e!386538 () Bool)

(declare-fun e!386539 () Bool)

(assert (=> b!678203 (= e!386538 e!386539)))

(declare-fun res!444520 () Bool)

(assert (=> b!678203 (=> (not res!444520) (not e!386539))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678203 (= res!444520 (bvsle from!3004 i!1382))))

(declare-fun res!444522 () Bool)

(declare-fun e!386541 () Bool)

(assert (=> start!60400 (=> (not res!444522) (not e!386541))))

(declare-datatypes ((array!39385 0))(
  ( (array!39386 (arr!18882 (Array (_ BitVec 32) (_ BitVec 64))) (size!19246 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39385)

(assert (=> start!60400 (= res!444522 (and (bvslt (size!19246 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19246 a!3626))))))

(assert (=> start!60400 e!386541))

(assert (=> start!60400 true))

(declare-fun array_inv!14741 (array!39385) Bool)

(assert (=> start!60400 (array_inv!14741 a!3626)))

(declare-fun b!678204 () Bool)

(declare-datatypes ((List!12830 0))(
  ( (Nil!12827) (Cons!12826 (h!13874 (_ BitVec 64)) (t!19050 List!12830)) )
))
(declare-fun acc!681 () List!12830)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3482 (List!12830 (_ BitVec 64)) Bool)

(assert (=> b!678204 (= e!386539 (not (contains!3482 acc!681 k!2843)))))

(declare-fun b!678205 () Bool)

(declare-fun res!444526 () Bool)

(assert (=> b!678205 (=> (not res!444526) (not e!386541))))

(declare-fun arrayNoDuplicates!0 (array!39385 (_ BitVec 32) List!12830) Bool)

(assert (=> b!678205 (= res!444526 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12827))))

(declare-fun b!678206 () Bool)

(declare-fun e!386537 () Bool)

(assert (=> b!678206 (= e!386537 (contains!3482 acc!681 k!2843))))

(declare-fun b!678207 () Bool)

(declare-fun res!444524 () Bool)

(assert (=> b!678207 (=> (not res!444524) (not e!386541))))

(assert (=> b!678207 (= res!444524 (not (contains!3482 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678208 () Bool)

(assert (=> b!678208 (= e!386541 false)))

(declare-fun lt!312952 () Bool)

(assert (=> b!678208 (= lt!312952 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678209 () Bool)

(declare-fun res!444523 () Bool)

(assert (=> b!678209 (=> (not res!444523) (not e!386541))))

(assert (=> b!678209 (= res!444523 e!386538)))

(declare-fun res!444519 () Bool)

(assert (=> b!678209 (=> res!444519 e!386538)))

(assert (=> b!678209 (= res!444519 e!386537)))

(declare-fun res!444525 () Bool)

(assert (=> b!678209 (=> (not res!444525) (not e!386537))))

(assert (=> b!678209 (= res!444525 (bvsgt from!3004 i!1382))))

(declare-fun b!678210 () Bool)

(declare-fun res!444521 () Bool)

(assert (=> b!678210 (=> (not res!444521) (not e!386541))))

(declare-fun noDuplicate!756 (List!12830) Bool)

(assert (=> b!678210 (= res!444521 (noDuplicate!756 acc!681))))

(declare-fun b!678211 () Bool)

(declare-fun res!444518 () Bool)

(assert (=> b!678211 (=> (not res!444518) (not e!386541))))

(assert (=> b!678211 (= res!444518 (not (contains!3482 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60400 res!444522) b!678210))

(assert (= (and b!678210 res!444521) b!678207))

(assert (= (and b!678207 res!444524) b!678211))

(assert (= (and b!678211 res!444518) b!678209))

(assert (= (and b!678209 res!444525) b!678206))

(assert (= (and b!678209 (not res!444519)) b!678203))

(assert (= (and b!678203 res!444520) b!678204))

(assert (= (and b!678209 res!444523) b!678205))

(assert (= (and b!678205 res!444526) b!678208))

(declare-fun m!644687 () Bool)

(assert (=> b!678205 m!644687))

(declare-fun m!644689 () Bool)

(assert (=> b!678211 m!644689))

(declare-fun m!644691 () Bool)

(assert (=> start!60400 m!644691))

(declare-fun m!644693 () Bool)

(assert (=> b!678206 m!644693))

(assert (=> b!678204 m!644693))

(declare-fun m!644695 () Bool)

(assert (=> b!678208 m!644695))

(declare-fun m!644697 () Bool)

(assert (=> b!678207 m!644697))

(declare-fun m!644699 () Bool)

(assert (=> b!678210 m!644699))

(push 1)

(assert (not b!678204))

(assert (not b!678211))

(assert (not start!60400))

(assert (not b!678205))

(assert (not b!678206))

(assert (not b!678208))

(assert (not b!678207))

(assert (not b!678210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

