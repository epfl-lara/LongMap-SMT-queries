; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60322 () Bool)

(assert start!60322)

(declare-fun res!443943 () Bool)

(declare-fun e!386213 () Bool)

(assert (=> start!60322 (=> (not res!443943) (not e!386213))))

(declare-datatypes ((array!39369 0))(
  ( (array!39370 (arr!18877 (Array (_ BitVec 32) (_ BitVec 64))) (size!19241 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39369)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60322 (= res!443943 (and (bvslt (size!19241 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19241 a!3626))))))

(assert (=> start!60322 e!386213))

(assert (=> start!60322 true))

(declare-fun array_inv!14673 (array!39369) Bool)

(assert (=> start!60322 (array_inv!14673 a!3626)))

(declare-fun b!677517 () Bool)

(declare-fun res!443960 () Bool)

(assert (=> b!677517 (=> (not res!443960) (not e!386213))))

(declare-datatypes ((List!12918 0))(
  ( (Nil!12915) (Cons!12914 (h!13959 (_ BitVec 64)) (t!19146 List!12918)) )
))
(declare-fun acc!681 () List!12918)

(declare-fun arrayNoDuplicates!0 (array!39369 (_ BitVec 32) List!12918) Bool)

(assert (=> b!677517 (= res!443960 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677518 () Bool)

(declare-fun res!443962 () Bool)

(assert (=> b!677518 (=> (not res!443962) (not e!386213))))

(declare-fun e!386211 () Bool)

(assert (=> b!677518 (= res!443962 e!386211)))

(declare-fun res!443957 () Bool)

(assert (=> b!677518 (=> res!443957 e!386211)))

(declare-fun e!386209 () Bool)

(assert (=> b!677518 (= res!443957 e!386209)))

(declare-fun res!443947 () Bool)

(assert (=> b!677518 (=> (not res!443947) (not e!386209))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677518 (= res!443947 (bvsgt from!3004 i!1382))))

(declare-fun b!677519 () Bool)

(declare-fun res!443945 () Bool)

(assert (=> b!677519 (=> (not res!443945) (not e!386213))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39369 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677519 (= res!443945 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677520 () Bool)

(declare-fun e!386212 () Bool)

(assert (=> b!677520 (= e!386211 e!386212)))

(declare-fun res!443950 () Bool)

(assert (=> b!677520 (=> (not res!443950) (not e!386212))))

(assert (=> b!677520 (= res!443950 (bvsle from!3004 i!1382))))

(declare-fun b!677521 () Bool)

(declare-fun res!443949 () Bool)

(assert (=> b!677521 (=> (not res!443949) (not e!386213))))

(declare-fun noDuplicate!742 (List!12918) Bool)

(assert (=> b!677521 (= res!443949 (noDuplicate!742 acc!681))))

(declare-fun b!677522 () Bool)

(declare-fun res!443946 () Bool)

(assert (=> b!677522 (=> (not res!443946) (not e!386213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677522 (= res!443946 (validKeyInArray!0 k0!2843))))

(declare-fun b!677523 () Bool)

(declare-fun res!443952 () Bool)

(assert (=> b!677523 (=> (not res!443952) (not e!386213))))

(declare-fun contains!3495 (List!12918 (_ BitVec 64)) Bool)

(assert (=> b!677523 (= res!443952 (not (contains!3495 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677524 () Bool)

(assert (=> b!677524 (= e!386212 (not (contains!3495 acc!681 k0!2843)))))

(declare-fun b!677525 () Bool)

(declare-fun res!443951 () Bool)

(assert (=> b!677525 (=> (not res!443951) (not e!386213))))

(declare-fun e!386208 () Bool)

(assert (=> b!677525 (= res!443951 e!386208)))

(declare-fun res!443958 () Bool)

(assert (=> b!677525 (=> res!443958 e!386208)))

(declare-fun e!386214 () Bool)

(assert (=> b!677525 (= res!443958 e!386214)))

(declare-fun res!443956 () Bool)

(assert (=> b!677525 (=> (not res!443956) (not e!386214))))

(assert (=> b!677525 (= res!443956 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677526 () Bool)

(declare-fun res!443948 () Bool)

(assert (=> b!677526 (=> (not res!443948) (not e!386213))))

(assert (=> b!677526 (= res!443948 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12915))))

(declare-fun b!677527 () Bool)

(assert (=> b!677527 (= e!386214 (contains!3495 acc!681 k0!2843))))

(declare-fun b!677528 () Bool)

(declare-fun res!443944 () Bool)

(assert (=> b!677528 (=> (not res!443944) (not e!386213))))

(assert (=> b!677528 (= res!443944 (not (contains!3495 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677529 () Bool)

(declare-fun res!443959 () Bool)

(assert (=> b!677529 (=> (not res!443959) (not e!386213))))

(assert (=> b!677529 (= res!443959 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677530 () Bool)

(declare-fun res!443954 () Bool)

(assert (=> b!677530 (=> (not res!443954) (not e!386213))))

(assert (=> b!677530 (= res!443954 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19241 a!3626))))))

(declare-fun b!677531 () Bool)

(declare-fun res!443961 () Bool)

(assert (=> b!677531 (=> (not res!443961) (not e!386213))))

(assert (=> b!677531 (= res!443961 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!677532 () Bool)

(declare-fun res!443955 () Bool)

(assert (=> b!677532 (=> (not res!443955) (not e!386213))))

(assert (=> b!677532 (= res!443955 (not (validKeyInArray!0 (select (arr!18877 a!3626) from!3004))))))

(declare-fun b!677533 () Bool)

(declare-fun e!386207 () Bool)

(assert (=> b!677533 (= e!386207 (not (contains!3495 acc!681 k0!2843)))))

(declare-fun b!677534 () Bool)

(assert (=> b!677534 (= e!386209 (contains!3495 acc!681 k0!2843))))

(declare-fun b!677535 () Bool)

(assert (=> b!677535 (= e!386213 (not true))))

(assert (=> b!677535 (arrayNoDuplicates!0 (array!39370 (store (arr!18877 a!3626) i!1382 k0!2843) (size!19241 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-datatypes ((Unit!23774 0))(
  ( (Unit!23775) )
))
(declare-fun lt!312829 () Unit!23774)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39369 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12918) Unit!23774)

(assert (=> b!677535 (= lt!312829 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!677536 () Bool)

(assert (=> b!677536 (= e!386208 e!386207)))

(declare-fun res!443953 () Bool)

(assert (=> b!677536 (=> (not res!443953) (not e!386207))))

(assert (=> b!677536 (= res!443953 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!677537 () Bool)

(declare-fun res!443963 () Bool)

(assert (=> b!677537 (=> (not res!443963) (not e!386213))))

(assert (=> b!677537 (= res!443963 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19241 a!3626)) (not (= from!3004 i!1382))))))

(assert (= (and start!60322 res!443943) b!677521))

(assert (= (and b!677521 res!443949) b!677528))

(assert (= (and b!677528 res!443944) b!677523))

(assert (= (and b!677523 res!443952) b!677518))

(assert (= (and b!677518 res!443947) b!677534))

(assert (= (and b!677518 (not res!443957)) b!677520))

(assert (= (and b!677520 res!443950) b!677524))

(assert (= (and b!677518 res!443962) b!677526))

(assert (= (and b!677526 res!443948) b!677529))

(assert (= (and b!677529 res!443959) b!677530))

(assert (= (and b!677530 res!443954) b!677522))

(assert (= (and b!677522 res!443946) b!677519))

(assert (= (and b!677519 res!443945) b!677537))

(assert (= (and b!677537 res!443963) b!677532))

(assert (= (and b!677532 res!443955) b!677531))

(assert (= (and b!677531 res!443961) b!677525))

(assert (= (and b!677525 res!443956) b!677527))

(assert (= (and b!677525 (not res!443958)) b!677536))

(assert (= (and b!677536 res!443953) b!677533))

(assert (= (and b!677525 res!443951) b!677517))

(assert (= (and b!677517 res!443960) b!677535))

(declare-fun m!643757 () Bool)

(assert (=> b!677532 m!643757))

(assert (=> b!677532 m!643757))

(declare-fun m!643759 () Bool)

(assert (=> b!677532 m!643759))

(declare-fun m!643761 () Bool)

(assert (=> b!677526 m!643761))

(declare-fun m!643763 () Bool)

(assert (=> b!677519 m!643763))

(declare-fun m!643765 () Bool)

(assert (=> b!677529 m!643765))

(declare-fun m!643767 () Bool)

(assert (=> b!677517 m!643767))

(declare-fun m!643769 () Bool)

(assert (=> b!677528 m!643769))

(declare-fun m!643771 () Bool)

(assert (=> b!677535 m!643771))

(declare-fun m!643773 () Bool)

(assert (=> b!677535 m!643773))

(declare-fun m!643775 () Bool)

(assert (=> b!677535 m!643775))

(declare-fun m!643777 () Bool)

(assert (=> b!677523 m!643777))

(declare-fun m!643779 () Bool)

(assert (=> b!677524 m!643779))

(declare-fun m!643781 () Bool)

(assert (=> b!677521 m!643781))

(declare-fun m!643783 () Bool)

(assert (=> b!677522 m!643783))

(assert (=> b!677527 m!643779))

(assert (=> b!677534 m!643779))

(declare-fun m!643785 () Bool)

(assert (=> start!60322 m!643785))

(assert (=> b!677533 m!643779))

(check-sat (not b!677519) (not b!677527) (not b!677523) (not b!677522) (not b!677532) (not start!60322) (not b!677533) (not b!677521) (not b!677529) (not b!677534) (not b!677517) (not b!677528) (not b!677526) (not b!677535) (not b!677524))
(check-sat)
