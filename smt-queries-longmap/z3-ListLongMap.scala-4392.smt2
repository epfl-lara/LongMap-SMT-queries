; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60474 () Bool)

(assert start!60474)

(declare-fun res!445289 () Bool)

(declare-fun e!386953 () Bool)

(assert (=> start!60474 (=> (not res!445289) (not e!386953))))

(declare-datatypes ((array!39426 0))(
  ( (array!39427 (arr!18901 (Array (_ BitVec 32) (_ BitVec 64))) (size!19265 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39426)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60474 (= res!445289 (and (bvslt (size!19265 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19265 a!3626))))))

(assert (=> start!60474 e!386953))

(assert (=> start!60474 true))

(declare-fun array_inv!14760 (array!39426) Bool)

(assert (=> start!60474 (array_inv!14760 a!3626)))

(declare-fun b!679011 () Bool)

(declare-fun e!386951 () Bool)

(declare-datatypes ((List!12849 0))(
  ( (Nil!12846) (Cons!12845 (h!13893 (_ BitVec 64)) (t!19069 List!12849)) )
))
(declare-fun acc!681 () List!12849)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3501 (List!12849 (_ BitVec 64)) Bool)

(assert (=> b!679011 (= e!386951 (contains!3501 acc!681 k0!2843))))

(declare-fun b!679012 () Bool)

(declare-fun res!445291 () Bool)

(assert (=> b!679012 (=> (not res!445291) (not e!386953))))

(assert (=> b!679012 (= res!445291 (not (contains!3501 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679013 () Bool)

(declare-fun res!445284 () Bool)

(assert (=> b!679013 (=> (not res!445284) (not e!386953))))

(assert (=> b!679013 (= res!445284 (not (contains!3501 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679014 () Bool)

(declare-fun res!445296 () Bool)

(assert (=> b!679014 (=> (not res!445296) (not e!386953))))

(declare-fun noDuplicate!775 (List!12849) Bool)

(assert (=> b!679014 (= res!445296 (noDuplicate!775 acc!681))))

(declare-fun b!679015 () Bool)

(declare-fun res!445285 () Bool)

(assert (=> b!679015 (=> (not res!445285) (not e!386953))))

(declare-fun arrayNoDuplicates!0 (array!39426 (_ BitVec 32) List!12849) Bool)

(assert (=> b!679015 (= res!445285 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12846))))

(declare-fun b!679016 () Bool)

(declare-fun res!445292 () Bool)

(assert (=> b!679016 (=> (not res!445292) (not e!386953))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679016 (= res!445292 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19265 a!3626))))))

(declare-fun b!679017 () Bool)

(declare-fun res!445288 () Bool)

(assert (=> b!679017 (=> (not res!445288) (not e!386953))))

(declare-fun e!386954 () Bool)

(assert (=> b!679017 (= res!445288 e!386954)))

(declare-fun res!445293 () Bool)

(assert (=> b!679017 (=> res!445293 e!386954)))

(assert (=> b!679017 (= res!445293 e!386951)))

(declare-fun res!445286 () Bool)

(assert (=> b!679017 (=> (not res!445286) (not e!386951))))

(assert (=> b!679017 (= res!445286 (bvsgt from!3004 i!1382))))

(declare-fun b!679018 () Bool)

(declare-fun res!445297 () Bool)

(assert (=> b!679018 (=> (not res!445297) (not e!386953))))

(assert (=> b!679018 (= res!445297 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19265 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679019 () Bool)

(declare-fun res!445295 () Bool)

(assert (=> b!679019 (=> (not res!445295) (not e!386953))))

(assert (=> b!679019 (= res!445295 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679020 () Bool)

(declare-fun res!445294 () Bool)

(assert (=> b!679020 (=> (not res!445294) (not e!386953))))

(declare-fun arrayContainsKey!0 (array!39426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679020 (= res!445294 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679021 () Bool)

(assert (=> b!679021 (= e!386953 (not true))))

(assert (=> b!679021 (arrayContainsKey!0 (array!39427 (store (arr!18901 a!3626) i!1382 k0!2843) (size!19265 a!3626)) k0!2843 from!3004)))

(declare-fun b!679022 () Bool)

(declare-fun e!386955 () Bool)

(assert (=> b!679022 (= e!386954 e!386955)))

(declare-fun res!445290 () Bool)

(assert (=> b!679022 (=> (not res!445290) (not e!386955))))

(assert (=> b!679022 (= res!445290 (bvsle from!3004 i!1382))))

(declare-fun b!679023 () Bool)

(assert (=> b!679023 (= e!386955 (not (contains!3501 acc!681 k0!2843)))))

(declare-fun b!679024 () Bool)

(declare-fun res!445287 () Bool)

(assert (=> b!679024 (=> (not res!445287) (not e!386953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679024 (= res!445287 (validKeyInArray!0 k0!2843))))

(assert (= (and start!60474 res!445289) b!679014))

(assert (= (and b!679014 res!445296) b!679013))

(assert (= (and b!679013 res!445284) b!679012))

(assert (= (and b!679012 res!445291) b!679017))

(assert (= (and b!679017 res!445286) b!679011))

(assert (= (and b!679017 (not res!445293)) b!679022))

(assert (= (and b!679022 res!445290) b!679023))

(assert (= (and b!679017 res!445288) b!679015))

(assert (= (and b!679015 res!445285) b!679019))

(assert (= (and b!679019 res!445295) b!679016))

(assert (= (and b!679016 res!445292) b!679024))

(assert (= (and b!679024 res!445287) b!679020))

(assert (= (and b!679020 res!445294) b!679018))

(assert (= (and b!679018 res!445297) b!679021))

(declare-fun m!645145 () Bool)

(assert (=> b!679019 m!645145))

(declare-fun m!645147 () Bool)

(assert (=> b!679023 m!645147))

(declare-fun m!645149 () Bool)

(assert (=> start!60474 m!645149))

(declare-fun m!645151 () Bool)

(assert (=> b!679015 m!645151))

(declare-fun m!645153 () Bool)

(assert (=> b!679021 m!645153))

(declare-fun m!645155 () Bool)

(assert (=> b!679021 m!645155))

(assert (=> b!679011 m!645147))

(declare-fun m!645157 () Bool)

(assert (=> b!679012 m!645157))

(declare-fun m!645159 () Bool)

(assert (=> b!679024 m!645159))

(declare-fun m!645161 () Bool)

(assert (=> b!679013 m!645161))

(declare-fun m!645163 () Bool)

(assert (=> b!679014 m!645163))

(declare-fun m!645165 () Bool)

(assert (=> b!679020 m!645165))

(check-sat (not b!679024) (not b!679020) (not start!60474) (not b!679023) (not b!679013) (not b!679015) (not b!679012) (not b!679014) (not b!679019) (not b!679011) (not b!679021))
(check-sat)
