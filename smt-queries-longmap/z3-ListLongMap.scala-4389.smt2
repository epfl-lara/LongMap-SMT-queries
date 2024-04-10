; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60364 () Bool)

(assert start!60364)

(declare-fun b!678368 () Bool)

(declare-fun res!444776 () Bool)

(declare-fun e!386571 () Bool)

(assert (=> b!678368 (=> (not res!444776) (not e!386571))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678368 (= res!444776 (validKeyInArray!0 k0!2843))))

(declare-fun b!678369 () Bool)

(declare-datatypes ((array!39411 0))(
  ( (array!39412 (arr!18898 (Array (_ BitVec 32) (_ BitVec 64))) (size!19262 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39411)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!678369 (= e!386571 (bvslt (bvsub (size!19262 a!3626) from!3004) #b00000000000000000000000000000000))))

(declare-fun b!678370 () Bool)

(declare-fun res!444779 () Bool)

(assert (=> b!678370 (=> (not res!444779) (not e!386571))))

(declare-datatypes ((List!12939 0))(
  ( (Nil!12936) (Cons!12935 (h!13980 (_ BitVec 64)) (t!19167 List!12939)) )
))
(declare-fun acc!681 () List!12939)

(declare-fun noDuplicate!763 (List!12939) Bool)

(assert (=> b!678370 (= res!444779 (noDuplicate!763 acc!681))))

(declare-fun b!678371 () Bool)

(declare-fun res!444784 () Bool)

(assert (=> b!678371 (=> (not res!444784) (not e!386571))))

(declare-fun contains!3516 (List!12939 (_ BitVec 64)) Bool)

(assert (=> b!678371 (= res!444784 (not (contains!3516 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678372 () Bool)

(declare-fun e!386573 () Bool)

(declare-fun e!386570 () Bool)

(assert (=> b!678372 (= e!386573 e!386570)))

(declare-fun res!444782 () Bool)

(assert (=> b!678372 (=> (not res!444782) (not e!386570))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678372 (= res!444782 (bvsle from!3004 i!1382))))

(declare-fun b!678373 () Bool)

(declare-fun res!444785 () Bool)

(assert (=> b!678373 (=> (not res!444785) (not e!386571))))

(assert (=> b!678373 (= res!444785 e!386573)))

(declare-fun res!444786 () Bool)

(assert (=> b!678373 (=> res!444786 e!386573)))

(declare-fun e!386574 () Bool)

(assert (=> b!678373 (= res!444786 e!386574)))

(declare-fun res!444777 () Bool)

(assert (=> b!678373 (=> (not res!444777) (not e!386574))))

(assert (=> b!678373 (= res!444777 (bvsgt from!3004 i!1382))))

(declare-fun b!678374 () Bool)

(assert (=> b!678374 (= e!386574 (contains!3516 acc!681 k0!2843))))

(declare-fun b!678375 () Bool)

(declare-fun res!444787 () Bool)

(assert (=> b!678375 (=> (not res!444787) (not e!386571))))

(declare-fun arrayContainsKey!0 (array!39411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678375 (= res!444787 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678376 () Bool)

(declare-fun res!444783 () Bool)

(assert (=> b!678376 (=> (not res!444783) (not e!386571))))

(assert (=> b!678376 (= res!444783 (not (contains!3516 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678377 () Bool)

(assert (=> b!678377 (= e!386570 (not (contains!3516 acc!681 k0!2843)))))

(declare-fun b!678378 () Bool)

(declare-fun res!444788 () Bool)

(assert (=> b!678378 (=> (not res!444788) (not e!386571))))

(assert (=> b!678378 (= res!444788 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19262 a!3626))))))

(declare-fun res!444780 () Bool)

(assert (=> start!60364 (=> (not res!444780) (not e!386571))))

(assert (=> start!60364 (= res!444780 (and (bvslt (size!19262 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19262 a!3626))))))

(assert (=> start!60364 e!386571))

(assert (=> start!60364 true))

(declare-fun array_inv!14694 (array!39411) Bool)

(assert (=> start!60364 (array_inv!14694 a!3626)))

(declare-fun b!678379 () Bool)

(declare-fun res!444778 () Bool)

(assert (=> b!678379 (=> (not res!444778) (not e!386571))))

(declare-fun arrayNoDuplicates!0 (array!39411 (_ BitVec 32) List!12939) Bool)

(assert (=> b!678379 (= res!444778 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678380 () Bool)

(declare-fun res!444781 () Bool)

(assert (=> b!678380 (=> (not res!444781) (not e!386571))))

(assert (=> b!678380 (= res!444781 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12936))))

(assert (= (and start!60364 res!444780) b!678370))

(assert (= (and b!678370 res!444779) b!678376))

(assert (= (and b!678376 res!444783) b!678371))

(assert (= (and b!678371 res!444784) b!678373))

(assert (= (and b!678373 res!444777) b!678374))

(assert (= (and b!678373 (not res!444786)) b!678372))

(assert (= (and b!678372 res!444782) b!678377))

(assert (= (and b!678373 res!444785) b!678380))

(assert (= (and b!678380 res!444781) b!678379))

(assert (= (and b!678379 res!444778) b!678378))

(assert (= (and b!678378 res!444788) b!678368))

(assert (= (and b!678368 res!444776) b!678375))

(assert (= (and b!678375 res!444787) b!678369))

(declare-fun m!644183 () Bool)

(assert (=> b!678379 m!644183))

(declare-fun m!644185 () Bool)

(assert (=> b!678375 m!644185))

(declare-fun m!644187 () Bool)

(assert (=> b!678380 m!644187))

(declare-fun m!644189 () Bool)

(assert (=> b!678377 m!644189))

(declare-fun m!644191 () Bool)

(assert (=> b!678370 m!644191))

(declare-fun m!644193 () Bool)

(assert (=> b!678371 m!644193))

(assert (=> b!678374 m!644189))

(declare-fun m!644195 () Bool)

(assert (=> b!678376 m!644195))

(declare-fun m!644197 () Bool)

(assert (=> b!678368 m!644197))

(declare-fun m!644199 () Bool)

(assert (=> start!60364 m!644199))

(check-sat (not b!678370) (not b!678375) (not b!678377) (not b!678380) (not b!678376) (not start!60364) (not b!678379) (not b!678374) (not b!678368) (not b!678371))
(check-sat)
