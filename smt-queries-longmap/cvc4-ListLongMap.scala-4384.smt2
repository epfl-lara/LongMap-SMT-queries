; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60336 () Bool)

(assert start!60336)

(declare-fun b!677894 () Bool)

(declare-fun res!444330 () Bool)

(declare-fun e!386352 () Bool)

(assert (=> b!677894 (=> (not res!444330) (not e!386352))))

(declare-datatypes ((array!39383 0))(
  ( (array!39384 (arr!18884 (Array (_ BitVec 32) (_ BitVec 64))) (size!19248 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39383)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39383 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677894 (= res!444330 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677895 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!677895 (= e!386352 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19248 a!3626)) (bvsgt from!3004 (size!19248 a!3626))))))

(declare-fun b!677896 () Bool)

(declare-fun res!444331 () Bool)

(assert (=> b!677896 (=> (not res!444331) (not e!386352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677896 (= res!444331 (validKeyInArray!0 k!2843))))

(declare-fun b!677897 () Bool)

(declare-fun res!444320 () Bool)

(assert (=> b!677897 (=> (not res!444320) (not e!386352))))

(declare-datatypes ((List!12925 0))(
  ( (Nil!12922) (Cons!12921 (h!13966 (_ BitVec 64)) (t!19153 List!12925)) )
))
(declare-fun arrayNoDuplicates!0 (array!39383 (_ BitVec 32) List!12925) Bool)

(assert (=> b!677897 (= res!444320 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12922))))

(declare-fun b!677898 () Bool)

(declare-fun res!444326 () Bool)

(assert (=> b!677898 (=> (not res!444326) (not e!386352))))

(declare-fun acc!681 () List!12925)

(assert (=> b!677898 (= res!444326 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677899 () Bool)

(declare-fun res!444327 () Bool)

(assert (=> b!677899 (=> (not res!444327) (not e!386352))))

(declare-fun e!386354 () Bool)

(assert (=> b!677899 (= res!444327 e!386354)))

(declare-fun res!444332 () Bool)

(assert (=> b!677899 (=> res!444332 e!386354)))

(declare-fun e!386355 () Bool)

(assert (=> b!677899 (= res!444332 e!386355)))

(declare-fun res!444325 () Bool)

(assert (=> b!677899 (=> (not res!444325) (not e!386355))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677899 (= res!444325 (bvsgt from!3004 i!1382))))

(declare-fun b!677900 () Bool)

(declare-fun contains!3502 (List!12925 (_ BitVec 64)) Bool)

(assert (=> b!677900 (= e!386355 (contains!3502 acc!681 k!2843))))

(declare-fun b!677901 () Bool)

(declare-fun e!386351 () Bool)

(assert (=> b!677901 (= e!386351 (not (contains!3502 acc!681 k!2843)))))

(declare-fun b!677902 () Bool)

(assert (=> b!677902 (= e!386354 e!386351)))

(declare-fun res!444329 () Bool)

(assert (=> b!677902 (=> (not res!444329) (not e!386351))))

(assert (=> b!677902 (= res!444329 (bvsle from!3004 i!1382))))

(declare-fun res!444328 () Bool)

(assert (=> start!60336 (=> (not res!444328) (not e!386352))))

(assert (=> start!60336 (= res!444328 (and (bvslt (size!19248 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19248 a!3626))))))

(assert (=> start!60336 e!386352))

(assert (=> start!60336 true))

(declare-fun array_inv!14680 (array!39383) Bool)

(assert (=> start!60336 (array_inv!14680 a!3626)))

(declare-fun b!677903 () Bool)

(declare-fun res!444323 () Bool)

(assert (=> b!677903 (=> (not res!444323) (not e!386352))))

(assert (=> b!677903 (= res!444323 (not (contains!3502 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677904 () Bool)

(declare-fun res!444321 () Bool)

(assert (=> b!677904 (=> (not res!444321) (not e!386352))))

(assert (=> b!677904 (= res!444321 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19248 a!3626))))))

(declare-fun b!677905 () Bool)

(declare-fun res!444322 () Bool)

(assert (=> b!677905 (=> (not res!444322) (not e!386352))))

(declare-fun noDuplicate!749 (List!12925) Bool)

(assert (=> b!677905 (= res!444322 (noDuplicate!749 acc!681))))

(declare-fun b!677906 () Bool)

(declare-fun res!444324 () Bool)

(assert (=> b!677906 (=> (not res!444324) (not e!386352))))

(assert (=> b!677906 (= res!444324 (not (contains!3502 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60336 res!444328) b!677905))

(assert (= (and b!677905 res!444322) b!677906))

(assert (= (and b!677906 res!444324) b!677903))

(assert (= (and b!677903 res!444323) b!677899))

(assert (= (and b!677899 res!444325) b!677900))

(assert (= (and b!677899 (not res!444332)) b!677902))

(assert (= (and b!677902 res!444329) b!677901))

(assert (= (and b!677899 res!444327) b!677897))

(assert (= (and b!677897 res!444320) b!677898))

(assert (= (and b!677898 res!444326) b!677904))

(assert (= (and b!677904 res!444321) b!677896))

(assert (= (and b!677896 res!444331) b!677894))

(assert (= (and b!677894 res!444330) b!677895))

(declare-fun m!643943 () Bool)

(assert (=> b!677894 m!643943))

(declare-fun m!643945 () Bool)

(assert (=> b!677900 m!643945))

(declare-fun m!643947 () Bool)

(assert (=> b!677896 m!643947))

(declare-fun m!643949 () Bool)

(assert (=> b!677898 m!643949))

(declare-fun m!643951 () Bool)

(assert (=> b!677897 m!643951))

(declare-fun m!643953 () Bool)

(assert (=> b!677903 m!643953))

(declare-fun m!643955 () Bool)

(assert (=> b!677906 m!643955))

(assert (=> b!677901 m!643945))

(declare-fun m!643957 () Bool)

(assert (=> start!60336 m!643957))

(declare-fun m!643959 () Bool)

(assert (=> b!677905 m!643959))

(push 1)

(assert (not b!677896))

(assert (not b!677901))

(assert (not b!677905))

(assert (not b!677903))

(assert (not b!677894))

(assert (not b!677897))

(assert (not b!677898))

(assert (not b!677900))

(assert (not b!677906))

(assert (not start!60336))

(check-sat)

(pop 1)

(push 1)

(check-sat)

