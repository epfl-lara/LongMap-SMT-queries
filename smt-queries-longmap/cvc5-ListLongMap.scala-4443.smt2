; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61760 () Bool)

(assert start!61760)

(declare-fun b!691035 () Bool)

(declare-fun res!455426 () Bool)

(declare-fun e!393381 () Bool)

(assert (=> b!691035 (=> (not res!455426) (not e!393381))))

(declare-datatypes ((List!13100 0))(
  ( (Nil!13097) (Cons!13096 (h!14141 (_ BitVec 64)) (t!19367 List!13100)) )
))
(declare-fun acc!681 () List!13100)

(declare-fun noDuplicate!924 (List!13100) Bool)

(assert (=> b!691035 (= res!455426 (noDuplicate!924 acc!681))))

(declare-fun b!691036 () Bool)

(declare-fun res!455415 () Bool)

(assert (=> b!691036 (=> (not res!455415) (not e!393381))))

(declare-fun contains!3677 (List!13100 (_ BitVec 64)) Bool)

(assert (=> b!691036 (= res!455415 (not (contains!3677 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691037 () Bool)

(declare-fun res!455414 () Bool)

(assert (=> b!691037 (=> (not res!455414) (not e!393381))))

(declare-datatypes ((array!39781 0))(
  ( (array!39782 (arr!19059 (Array (_ BitVec 32) (_ BitVec 64))) (size!19444 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39781)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691037 (= res!455414 (validKeyInArray!0 (select (arr!19059 a!3626) from!3004)))))

(declare-fun b!691038 () Bool)

(declare-fun res!455427 () Bool)

(assert (=> b!691038 (=> (not res!455427) (not e!393381))))

(declare-fun arrayNoDuplicates!0 (array!39781 (_ BitVec 32) List!13100) Bool)

(assert (=> b!691038 (= res!455427 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691039 () Bool)

(assert (=> b!691039 (= e!393381 (not true))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39781 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691039 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!691040 () Bool)

(declare-fun e!393380 () Bool)

(declare-fun e!393379 () Bool)

(assert (=> b!691040 (= e!393380 e!393379)))

(declare-fun res!455420 () Bool)

(assert (=> b!691040 (=> (not res!455420) (not e!393379))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691040 (= res!455420 (bvsle from!3004 i!1382))))

(declare-fun b!691041 () Bool)

(declare-fun res!455416 () Bool)

(assert (=> b!691041 (=> (not res!455416) (not e!393381))))

(assert (=> b!691041 (= res!455416 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19444 a!3626))))))

(declare-fun b!691034 () Bool)

(declare-fun res!455418 () Bool)

(assert (=> b!691034 (=> (not res!455418) (not e!393381))))

(assert (=> b!691034 (= res!455418 (validKeyInArray!0 k!2843))))

(declare-fun res!455423 () Bool)

(assert (=> start!61760 (=> (not res!455423) (not e!393381))))

(assert (=> start!61760 (= res!455423 (and (bvslt (size!19444 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19444 a!3626))))))

(assert (=> start!61760 e!393381))

(assert (=> start!61760 true))

(declare-fun array_inv!14855 (array!39781) Bool)

(assert (=> start!61760 (array_inv!14855 a!3626)))

(declare-fun b!691042 () Bool)

(declare-fun res!455424 () Bool)

(assert (=> b!691042 (=> (not res!455424) (not e!393381))))

(assert (=> b!691042 (= res!455424 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13097))))

(declare-fun b!691043 () Bool)

(declare-fun res!455429 () Bool)

(assert (=> b!691043 (=> (not res!455429) (not e!393381))))

(assert (=> b!691043 (= res!455429 (not (contains!3677 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691044 () Bool)

(declare-fun res!455421 () Bool)

(assert (=> b!691044 (=> (not res!455421) (not e!393381))))

(assert (=> b!691044 (= res!455421 e!393380)))

(declare-fun res!455428 () Bool)

(assert (=> b!691044 (=> res!455428 e!393380)))

(declare-fun e!393377 () Bool)

(assert (=> b!691044 (= res!455428 e!393377)))

(declare-fun res!455417 () Bool)

(assert (=> b!691044 (=> (not res!455417) (not e!393377))))

(assert (=> b!691044 (= res!455417 (bvsgt from!3004 i!1382))))

(declare-fun b!691045 () Bool)

(declare-fun res!455419 () Bool)

(assert (=> b!691045 (=> (not res!455419) (not e!393381))))

(assert (=> b!691045 (= res!455419 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19444 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!691046 () Bool)

(assert (=> b!691046 (= e!393379 (not (contains!3677 acc!681 k!2843)))))

(declare-fun b!691047 () Bool)

(declare-fun res!455425 () Bool)

(assert (=> b!691047 (=> (not res!455425) (not e!393381))))

(assert (=> b!691047 (= res!455425 (= (select (arr!19059 a!3626) from!3004) k!2843))))

(declare-fun b!691048 () Bool)

(assert (=> b!691048 (= e!393377 (contains!3677 acc!681 k!2843))))

(declare-fun b!691049 () Bool)

(declare-fun res!455422 () Bool)

(assert (=> b!691049 (=> (not res!455422) (not e!393381))))

(assert (=> b!691049 (= res!455422 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!61760 res!455423) b!691035))

(assert (= (and b!691035 res!455426) b!691043))

(assert (= (and b!691043 res!455429) b!691036))

(assert (= (and b!691036 res!455415) b!691044))

(assert (= (and b!691044 res!455417) b!691048))

(assert (= (and b!691044 (not res!455428)) b!691040))

(assert (= (and b!691040 res!455420) b!691046))

(assert (= (and b!691044 res!455421) b!691042))

(assert (= (and b!691042 res!455424) b!691038))

(assert (= (and b!691038 res!455427) b!691041))

(assert (= (and b!691041 res!455416) b!691034))

(assert (= (and b!691034 res!455418) b!691049))

(assert (= (and b!691049 res!455422) b!691045))

(assert (= (and b!691045 res!455419) b!691037))

(assert (= (and b!691037 res!455414) b!691047))

(assert (= (and b!691047 res!455425) b!691039))

(declare-fun m!654257 () Bool)

(assert (=> start!61760 m!654257))

(declare-fun m!654259 () Bool)

(assert (=> b!691047 m!654259))

(declare-fun m!654261 () Bool)

(assert (=> b!691036 m!654261))

(declare-fun m!654263 () Bool)

(assert (=> b!691035 m!654263))

(declare-fun m!654265 () Bool)

(assert (=> b!691034 m!654265))

(declare-fun m!654267 () Bool)

(assert (=> b!691046 m!654267))

(declare-fun m!654269 () Bool)

(assert (=> b!691043 m!654269))

(declare-fun m!654271 () Bool)

(assert (=> b!691049 m!654271))

(declare-fun m!654273 () Bool)

(assert (=> b!691039 m!654273))

(declare-fun m!654275 () Bool)

(assert (=> b!691042 m!654275))

(assert (=> b!691037 m!654259))

(assert (=> b!691037 m!654259))

(declare-fun m!654277 () Bool)

(assert (=> b!691037 m!654277))

(assert (=> b!691048 m!654267))

(declare-fun m!654279 () Bool)

(assert (=> b!691038 m!654279))

(push 1)

(assert (not b!691037))

(assert (not b!691049))

(assert (not b!691042))

(assert (not b!691043))

(assert (not start!61760))

(assert (not b!691046))

(assert (not b!691034))

(assert (not b!691035))

(assert (not b!691048))

(assert (not b!691036))

(assert (not b!691039))

(assert (not b!691038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

