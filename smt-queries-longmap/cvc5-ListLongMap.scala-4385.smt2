; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60338 () Bool)

(assert start!60338)

(declare-fun b!677925 () Bool)

(declare-fun res!444355 () Bool)

(declare-fun e!386370 () Bool)

(assert (=> b!677925 (=> (not res!444355) (not e!386370))))

(declare-datatypes ((List!12926 0))(
  ( (Nil!12923) (Cons!12922 (h!13967 (_ BitVec 64)) (t!19154 List!12926)) )
))
(declare-fun acc!681 () List!12926)

(declare-fun contains!3503 (List!12926 (_ BitVec 64)) Bool)

(assert (=> b!677925 (= res!444355 (not (contains!3503 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677926 () Bool)

(declare-fun res!444354 () Bool)

(assert (=> b!677926 (=> (not res!444354) (not e!386370))))

(declare-fun noDuplicate!750 (List!12926) Bool)

(assert (=> b!677926 (= res!444354 (noDuplicate!750 acc!681))))

(declare-fun b!677927 () Bool)

(declare-fun e!386368 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!677927 (= e!386368 (contains!3503 acc!681 k!2843))))

(declare-fun b!677928 () Bool)

(declare-fun e!386366 () Bool)

(assert (=> b!677928 (= e!386366 (not (contains!3503 acc!681 k!2843)))))

(declare-fun b!677929 () Bool)

(declare-fun res!444359 () Bool)

(assert (=> b!677929 (=> (not res!444359) (not e!386370))))

(declare-datatypes ((array!39385 0))(
  ( (array!39386 (arr!18885 (Array (_ BitVec 32) (_ BitVec 64))) (size!19249 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39385)

(declare-fun arrayNoDuplicates!0 (array!39385 (_ BitVec 32) List!12926) Bool)

(assert (=> b!677929 (= res!444359 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12923))))

(declare-fun b!677930 () Bool)

(assert (=> b!677930 (= e!386370 false)))

(declare-fun lt!312844 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!677930 (= lt!312844 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677931 () Bool)

(declare-fun res!444358 () Bool)

(assert (=> b!677931 (=> (not res!444358) (not e!386370))))

(declare-fun e!386367 () Bool)

(assert (=> b!677931 (= res!444358 e!386367)))

(declare-fun res!444353 () Bool)

(assert (=> b!677931 (=> res!444353 e!386367)))

(assert (=> b!677931 (= res!444353 e!386368)))

(declare-fun res!444351 () Bool)

(assert (=> b!677931 (=> (not res!444351) (not e!386368))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677931 (= res!444351 (bvsgt from!3004 i!1382))))

(declare-fun b!677932 () Bool)

(declare-fun res!444357 () Bool)

(assert (=> b!677932 (=> (not res!444357) (not e!386370))))

(assert (=> b!677932 (= res!444357 (not (contains!3503 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677933 () Bool)

(assert (=> b!677933 (= e!386367 e!386366)))

(declare-fun res!444356 () Bool)

(assert (=> b!677933 (=> (not res!444356) (not e!386366))))

(assert (=> b!677933 (= res!444356 (bvsle from!3004 i!1382))))

(declare-fun res!444352 () Bool)

(assert (=> start!60338 (=> (not res!444352) (not e!386370))))

(assert (=> start!60338 (= res!444352 (and (bvslt (size!19249 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19249 a!3626))))))

(assert (=> start!60338 e!386370))

(assert (=> start!60338 true))

(declare-fun array_inv!14681 (array!39385) Bool)

(assert (=> start!60338 (array_inv!14681 a!3626)))

(assert (= (and start!60338 res!444352) b!677926))

(assert (= (and b!677926 res!444354) b!677932))

(assert (= (and b!677932 res!444357) b!677925))

(assert (= (and b!677925 res!444355) b!677931))

(assert (= (and b!677931 res!444351) b!677927))

(assert (= (and b!677931 (not res!444353)) b!677933))

(assert (= (and b!677933 res!444356) b!677928))

(assert (= (and b!677931 res!444358) b!677929))

(assert (= (and b!677929 res!444359) b!677930))

(declare-fun m!643961 () Bool)

(assert (=> b!677930 m!643961))

(declare-fun m!643963 () Bool)

(assert (=> b!677925 m!643963))

(declare-fun m!643965 () Bool)

(assert (=> b!677929 m!643965))

(declare-fun m!643967 () Bool)

(assert (=> b!677928 m!643967))

(declare-fun m!643969 () Bool)

(assert (=> start!60338 m!643969))

(assert (=> b!677927 m!643967))

(declare-fun m!643971 () Bool)

(assert (=> b!677926 m!643971))

(declare-fun m!643973 () Bool)

(assert (=> b!677932 m!643973))

(push 1)

(assert (not b!677930))

(assert (not b!677928))

(assert (not b!677929))

(assert (not b!677927))

(assert (not b!677925))

(assert (not b!677926))

(assert (not b!677932))

(assert (not start!60338))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

