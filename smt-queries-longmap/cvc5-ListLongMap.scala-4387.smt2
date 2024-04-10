; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60350 () Bool)

(assert start!60350)

(declare-fun res!444519 () Bool)

(declare-fun e!386460 () Bool)

(assert (=> start!60350 (=> (not res!444519) (not e!386460))))

(declare-datatypes ((array!39397 0))(
  ( (array!39398 (arr!18891 (Array (_ BitVec 32) (_ BitVec 64))) (size!19255 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39397)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60350 (= res!444519 (and (bvslt (size!19255 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19255 a!3626))))))

(assert (=> start!60350 e!386460))

(assert (=> start!60350 true))

(declare-fun array_inv!14687 (array!39397) Bool)

(assert (=> start!60350 (array_inv!14687 a!3626)))

(declare-fun b!678087 () Bool)

(declare-fun res!444515 () Bool)

(assert (=> b!678087 (=> (not res!444515) (not e!386460))))

(declare-datatypes ((List!12932 0))(
  ( (Nil!12929) (Cons!12928 (h!13973 (_ BitVec 64)) (t!19160 List!12932)) )
))
(declare-fun acc!681 () List!12932)

(declare-fun contains!3509 (List!12932 (_ BitVec 64)) Bool)

(assert (=> b!678087 (= res!444515 (not (contains!3509 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678088 () Bool)

(declare-fun res!444518 () Bool)

(assert (=> b!678088 (=> (not res!444518) (not e!386460))))

(declare-fun e!386456 () Bool)

(assert (=> b!678088 (= res!444518 e!386456)))

(declare-fun res!444517 () Bool)

(assert (=> b!678088 (=> res!444517 e!386456)))

(declare-fun e!386458 () Bool)

(assert (=> b!678088 (= res!444517 e!386458)))

(declare-fun res!444513 () Bool)

(assert (=> b!678088 (=> (not res!444513) (not e!386458))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678088 (= res!444513 (bvsgt from!3004 i!1382))))

(declare-fun b!678089 () Bool)

(declare-fun e!386459 () Bool)

(assert (=> b!678089 (= e!386456 e!386459)))

(declare-fun res!444516 () Bool)

(assert (=> b!678089 (=> (not res!444516) (not e!386459))))

(assert (=> b!678089 (= res!444516 (bvsle from!3004 i!1382))))

(declare-fun b!678090 () Bool)

(assert (=> b!678090 (= e!386460 false)))

(declare-fun lt!312862 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39397 (_ BitVec 32) List!12932) Bool)

(assert (=> b!678090 (= lt!312862 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678091 () Bool)

(declare-fun res!444520 () Bool)

(assert (=> b!678091 (=> (not res!444520) (not e!386460))))

(declare-fun noDuplicate!756 (List!12932) Bool)

(assert (=> b!678091 (= res!444520 (noDuplicate!756 acc!681))))

(declare-fun b!678092 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!678092 (= e!386459 (not (contains!3509 acc!681 k!2843)))))

(declare-fun b!678093 () Bool)

(assert (=> b!678093 (= e!386458 (contains!3509 acc!681 k!2843))))

(declare-fun b!678094 () Bool)

(declare-fun res!444514 () Bool)

(assert (=> b!678094 (=> (not res!444514) (not e!386460))))

(assert (=> b!678094 (= res!444514 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12929))))

(declare-fun b!678095 () Bool)

(declare-fun res!444521 () Bool)

(assert (=> b!678095 (=> (not res!444521) (not e!386460))))

(assert (=> b!678095 (= res!444521 (not (contains!3509 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60350 res!444519) b!678091))

(assert (= (and b!678091 res!444520) b!678087))

(assert (= (and b!678087 res!444515) b!678095))

(assert (= (and b!678095 res!444521) b!678088))

(assert (= (and b!678088 res!444513) b!678093))

(assert (= (and b!678088 (not res!444517)) b!678089))

(assert (= (and b!678089 res!444516) b!678092))

(assert (= (and b!678088 res!444518) b!678094))

(assert (= (and b!678094 res!444514) b!678090))

(declare-fun m!644045 () Bool)

(assert (=> b!678095 m!644045))

(declare-fun m!644047 () Bool)

(assert (=> b!678092 m!644047))

(declare-fun m!644049 () Bool)

(assert (=> start!60350 m!644049))

(declare-fun m!644051 () Bool)

(assert (=> b!678091 m!644051))

(assert (=> b!678093 m!644047))

(declare-fun m!644053 () Bool)

(assert (=> b!678090 m!644053))

(declare-fun m!644055 () Bool)

(assert (=> b!678094 m!644055))

(declare-fun m!644057 () Bool)

(assert (=> b!678087 m!644057))

(push 1)

(assert (not b!678094))

(assert (not b!678090))

(assert (not b!678093))

(assert (not b!678091))

(assert (not b!678095))

(assert (not b!678092))

(assert (not start!60350))

(assert (not b!678087))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

