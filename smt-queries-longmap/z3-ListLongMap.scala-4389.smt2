; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60350 () Bool)

(assert start!60350)

(declare-fun b!678033 () Bool)

(declare-fun e!386366 () Bool)

(declare-datatypes ((List!12976 0))(
  ( (Nil!12973) (Cons!12972 (h!14017 (_ BitVec 64)) (t!19195 List!12976)) )
))
(declare-fun acc!681 () List!12976)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3498 (List!12976 (_ BitVec 64)) Bool)

(assert (=> b!678033 (= e!386366 (contains!3498 acc!681 k0!2843))))

(declare-fun b!678034 () Bool)

(declare-fun res!444606 () Bool)

(declare-fun e!386365 () Bool)

(assert (=> b!678034 (=> (not res!444606) (not e!386365))))

(declare-fun e!386368 () Bool)

(assert (=> b!678034 (= res!444606 e!386368)))

(declare-fun res!444609 () Bool)

(assert (=> b!678034 (=> res!444609 e!386368)))

(assert (=> b!678034 (= res!444609 e!386366)))

(declare-fun res!444601 () Bool)

(assert (=> b!678034 (=> (not res!444601) (not e!386366))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678034 (= res!444601 (bvsgt from!3004 i!1382))))

(declare-fun b!678035 () Bool)

(declare-datatypes ((array!39408 0))(
  ( (array!39409 (arr!18896 (Array (_ BitVec 32) (_ BitVec 64))) (size!19261 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39408)

(assert (=> b!678035 (= e!386365 (bvslt (bvsub (size!19261 a!3626) from!3004) #b00000000000000000000000000000000))))

(declare-fun b!678036 () Bool)

(declare-fun e!386367 () Bool)

(assert (=> b!678036 (= e!386368 e!386367)))

(declare-fun res!444605 () Bool)

(assert (=> b!678036 (=> (not res!444605) (not e!386367))))

(assert (=> b!678036 (= res!444605 (bvsle from!3004 i!1382))))

(declare-fun b!678037 () Bool)

(declare-fun res!444608 () Bool)

(assert (=> b!678037 (=> (not res!444608) (not e!386365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678037 (= res!444608 (validKeyInArray!0 k0!2843))))

(declare-fun b!678038 () Bool)

(declare-fun res!444610 () Bool)

(assert (=> b!678038 (=> (not res!444610) (not e!386365))))

(assert (=> b!678038 (= res!444610 (not (contains!3498 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678039 () Bool)

(declare-fun res!444611 () Bool)

(assert (=> b!678039 (=> (not res!444611) (not e!386365))))

(declare-fun arrayContainsKey!0 (array!39408 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678039 (= res!444611 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678041 () Bool)

(declare-fun res!444607 () Bool)

(assert (=> b!678041 (=> (not res!444607) (not e!386365))))

(declare-fun noDuplicate!767 (List!12976) Bool)

(assert (=> b!678041 (= res!444607 (noDuplicate!767 acc!681))))

(declare-fun b!678042 () Bool)

(declare-fun res!444612 () Bool)

(assert (=> b!678042 (=> (not res!444612) (not e!386365))))

(declare-fun arrayNoDuplicates!0 (array!39408 (_ BitVec 32) List!12976) Bool)

(assert (=> b!678042 (= res!444612 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12973))))

(declare-fun b!678043 () Bool)

(declare-fun res!444604 () Bool)

(assert (=> b!678043 (=> (not res!444604) (not e!386365))))

(assert (=> b!678043 (= res!444604 (not (contains!3498 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678044 () Bool)

(declare-fun res!444613 () Bool)

(assert (=> b!678044 (=> (not res!444613) (not e!386365))))

(assert (=> b!678044 (= res!444613 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678045 () Bool)

(declare-fun res!444602 () Bool)

(assert (=> b!678045 (=> (not res!444602) (not e!386365))))

(assert (=> b!678045 (= res!444602 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19261 a!3626))))))

(declare-fun b!678040 () Bool)

(assert (=> b!678040 (= e!386367 (not (contains!3498 acc!681 k0!2843)))))

(declare-fun res!444603 () Bool)

(assert (=> start!60350 (=> (not res!444603) (not e!386365))))

(assert (=> start!60350 (= res!444603 (and (bvslt (size!19261 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19261 a!3626))))))

(assert (=> start!60350 e!386365))

(assert (=> start!60350 true))

(declare-fun array_inv!14779 (array!39408) Bool)

(assert (=> start!60350 (array_inv!14779 a!3626)))

(assert (= (and start!60350 res!444603) b!678041))

(assert (= (and b!678041 res!444607) b!678038))

(assert (= (and b!678038 res!444610) b!678043))

(assert (= (and b!678043 res!444604) b!678034))

(assert (= (and b!678034 res!444601) b!678033))

(assert (= (and b!678034 (not res!444609)) b!678036))

(assert (= (and b!678036 res!444605) b!678040))

(assert (= (and b!678034 res!444606) b!678042))

(assert (= (and b!678042 res!444612) b!678044))

(assert (= (and b!678044 res!444613) b!678045))

(assert (= (and b!678045 res!444602) b!678037))

(assert (= (and b!678037 res!444608) b!678039))

(assert (= (and b!678039 res!444611) b!678035))

(declare-fun m!643383 () Bool)

(assert (=> b!678041 m!643383))

(declare-fun m!643385 () Bool)

(assert (=> b!678040 m!643385))

(declare-fun m!643387 () Bool)

(assert (=> b!678038 m!643387))

(declare-fun m!643389 () Bool)

(assert (=> b!678037 m!643389))

(declare-fun m!643391 () Bool)

(assert (=> b!678042 m!643391))

(declare-fun m!643393 () Bool)

(assert (=> b!678039 m!643393))

(assert (=> b!678033 m!643385))

(declare-fun m!643395 () Bool)

(assert (=> b!678044 m!643395))

(declare-fun m!643397 () Bool)

(assert (=> b!678043 m!643397))

(declare-fun m!643399 () Bool)

(assert (=> start!60350 m!643399))

(check-sat (not b!678042) (not start!60350) (not b!678039) (not b!678038) (not b!678043) (not b!678037) (not b!678041) (not b!678044) (not b!678033) (not b!678040))
(check-sat)
