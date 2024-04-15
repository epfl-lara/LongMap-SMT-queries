; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60320 () Bool)

(assert start!60320)

(declare-fun b!677520 () Bool)

(declare-fun e!386135 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39378 0))(
  ( (array!39379 (arr!18881 (Array (_ BitVec 32) (_ BitVec 64))) (size!19246 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39378)

(assert (=> b!677520 (= e!386135 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19246 a!3626)) (bvsgt from!3004 (size!19246 a!3626))))))

(declare-fun b!677521 () Bool)

(declare-fun res!444113 () Bool)

(assert (=> b!677521 (=> (not res!444113) (not e!386135))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677521 (= res!444113 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677522 () Bool)

(declare-fun res!444115 () Bool)

(assert (=> b!677522 (=> (not res!444115) (not e!386135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677522 (= res!444115 (validKeyInArray!0 k0!2843))))

(declare-fun b!677524 () Bool)

(declare-fun res!444107 () Bool)

(assert (=> b!677524 (=> (not res!444107) (not e!386135))))

(declare-fun e!386132 () Bool)

(assert (=> b!677524 (= res!444107 e!386132)))

(declare-fun res!444108 () Bool)

(assert (=> b!677524 (=> res!444108 e!386132)))

(declare-fun e!386131 () Bool)

(assert (=> b!677524 (= res!444108 e!386131)))

(declare-fun res!444109 () Bool)

(assert (=> b!677524 (=> (not res!444109) (not e!386131))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677524 (= res!444109 (bvsgt from!3004 i!1382))))

(declare-fun b!677525 () Bool)

(declare-fun res!444111 () Bool)

(assert (=> b!677525 (=> (not res!444111) (not e!386135))))

(declare-datatypes ((List!12961 0))(
  ( (Nil!12958) (Cons!12957 (h!14002 (_ BitVec 64)) (t!19180 List!12961)) )
))
(declare-fun arrayNoDuplicates!0 (array!39378 (_ BitVec 32) List!12961) Bool)

(assert (=> b!677525 (= res!444111 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12958))))

(declare-fun b!677526 () Bool)

(declare-fun e!386134 () Bool)

(assert (=> b!677526 (= e!386132 e!386134)))

(declare-fun res!444116 () Bool)

(assert (=> b!677526 (=> (not res!444116) (not e!386134))))

(assert (=> b!677526 (= res!444116 (bvsle from!3004 i!1382))))

(declare-fun b!677527 () Bool)

(declare-fun acc!681 () List!12961)

(declare-fun contains!3483 (List!12961 (_ BitVec 64)) Bool)

(assert (=> b!677527 (= e!386134 (not (contains!3483 acc!681 k0!2843)))))

(declare-fun b!677528 () Bool)

(declare-fun res!444118 () Bool)

(assert (=> b!677528 (=> (not res!444118) (not e!386135))))

(assert (=> b!677528 (= res!444118 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19246 a!3626))))))

(declare-fun b!677529 () Bool)

(declare-fun res!444106 () Bool)

(assert (=> b!677529 (=> (not res!444106) (not e!386135))))

(assert (=> b!677529 (= res!444106 (not (contains!3483 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677530 () Bool)

(declare-fun res!444110 () Bool)

(assert (=> b!677530 (=> (not res!444110) (not e!386135))))

(declare-fun noDuplicate!752 (List!12961) Bool)

(assert (=> b!677530 (= res!444110 (noDuplicate!752 acc!681))))

(declare-fun b!677523 () Bool)

(declare-fun res!444112 () Bool)

(assert (=> b!677523 (=> (not res!444112) (not e!386135))))

(assert (=> b!677523 (= res!444112 (not (contains!3483 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!444117 () Bool)

(assert (=> start!60320 (=> (not res!444117) (not e!386135))))

(assert (=> start!60320 (= res!444117 (and (bvslt (size!19246 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19246 a!3626))))))

(assert (=> start!60320 e!386135))

(assert (=> start!60320 true))

(declare-fun array_inv!14764 (array!39378) Bool)

(assert (=> start!60320 (array_inv!14764 a!3626)))

(declare-fun b!677531 () Bool)

(assert (=> b!677531 (= e!386131 (contains!3483 acc!681 k0!2843))))

(declare-fun b!677532 () Bool)

(declare-fun res!444114 () Bool)

(assert (=> b!677532 (=> (not res!444114) (not e!386135))))

(assert (=> b!677532 (= res!444114 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60320 res!444117) b!677530))

(assert (= (and b!677530 res!444110) b!677529))

(assert (= (and b!677529 res!444106) b!677523))

(assert (= (and b!677523 res!444112) b!677524))

(assert (= (and b!677524 res!444109) b!677531))

(assert (= (and b!677524 (not res!444108)) b!677526))

(assert (= (and b!677526 res!444116) b!677527))

(assert (= (and b!677524 res!444107) b!677525))

(assert (= (and b!677525 res!444111) b!677532))

(assert (= (and b!677532 res!444114) b!677528))

(assert (= (and b!677528 res!444118) b!677522))

(assert (= (and b!677522 res!444115) b!677521))

(assert (= (and b!677521 res!444113) b!677520))

(declare-fun m!643125 () Bool)

(assert (=> start!60320 m!643125))

(declare-fun m!643127 () Bool)

(assert (=> b!677523 m!643127))

(declare-fun m!643129 () Bool)

(assert (=> b!677532 m!643129))

(declare-fun m!643131 () Bool)

(assert (=> b!677525 m!643131))

(declare-fun m!643133 () Bool)

(assert (=> b!677531 m!643133))

(declare-fun m!643135 () Bool)

(assert (=> b!677530 m!643135))

(declare-fun m!643137 () Bool)

(assert (=> b!677521 m!643137))

(declare-fun m!643139 () Bool)

(assert (=> b!677522 m!643139))

(declare-fun m!643141 () Bool)

(assert (=> b!677529 m!643141))

(assert (=> b!677527 m!643133))

(check-sat (not b!677521) (not b!677527) (not start!60320) (not b!677529) (not b!677531) (not b!677523) (not b!677532) (not b!677530) (not b!677522) (not b!677525))
(check-sat)
