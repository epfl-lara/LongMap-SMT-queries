; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59754 () Bool)

(assert start!59754)

(declare-fun b!659891 () Bool)

(declare-fun e!379180 () Bool)

(declare-datatypes ((List!12678 0))(
  ( (Nil!12675) (Cons!12674 (h!13719 (_ BitVec 64)) (t!18897 List!12678)) )
))
(declare-fun acc!681 () List!12678)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3200 (List!12678 (_ BitVec 64)) Bool)

(assert (=> b!659891 (= e!379180 (not (contains!3200 acc!681 k!2843)))))

(declare-fun b!659892 () Bool)

(declare-fun res!428122 () Bool)

(declare-fun e!379177 () Bool)

(assert (=> b!659892 (=> (not res!428122) (not e!379177))))

(declare-fun noDuplicate!469 (List!12678) Bool)

(assert (=> b!659892 (= res!428122 (noDuplicate!469 acc!681))))

(declare-fun b!659893 () Bool)

(declare-fun res!428121 () Bool)

(assert (=> b!659893 (=> (not res!428121) (not e!379177))))

(assert (=> b!659893 (= res!428121 (not (contains!3200 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659894 () Bool)

(declare-fun e!379179 () Bool)

(assert (=> b!659894 (= e!379179 (contains!3200 acc!681 k!2843))))

(declare-fun res!428118 () Bool)

(assert (=> start!59754 (=> (not res!428118) (not e!379177))))

(declare-datatypes ((array!38812 0))(
  ( (array!38813 (arr!18598 (Array (_ BitVec 32) (_ BitVec 64))) (size!18963 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38812)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59754 (= res!428118 (and (bvslt (size!18963 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18963 a!3626))))))

(assert (=> start!59754 e!379177))

(assert (=> start!59754 true))

(declare-fun array_inv!14481 (array!38812) Bool)

(assert (=> start!59754 (array_inv!14481 a!3626)))

(declare-fun b!659895 () Bool)

(assert (=> b!659895 (= e!379177 false)))

(declare-fun lt!308499 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38812 (_ BitVec 32) List!12678) Bool)

(assert (=> b!659895 (= lt!308499 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12675))))

(declare-fun b!659896 () Bool)

(declare-fun res!428115 () Bool)

(assert (=> b!659896 (=> (not res!428115) (not e!379177))))

(assert (=> b!659896 (= res!428115 (not (contains!3200 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659897 () Bool)

(declare-fun e!379178 () Bool)

(assert (=> b!659897 (= e!379178 e!379180)))

(declare-fun res!428119 () Bool)

(assert (=> b!659897 (=> (not res!428119) (not e!379180))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659897 (= res!428119 (bvsle from!3004 i!1382))))

(declare-fun b!659898 () Bool)

(declare-fun res!428116 () Bool)

(assert (=> b!659898 (=> (not res!428116) (not e!379177))))

(assert (=> b!659898 (= res!428116 e!379178)))

(declare-fun res!428120 () Bool)

(assert (=> b!659898 (=> res!428120 e!379178)))

(assert (=> b!659898 (= res!428120 e!379179)))

(declare-fun res!428117 () Bool)

(assert (=> b!659898 (=> (not res!428117) (not e!379179))))

(assert (=> b!659898 (= res!428117 (bvsgt from!3004 i!1382))))

(assert (= (and start!59754 res!428118) b!659892))

(assert (= (and b!659892 res!428122) b!659893))

(assert (= (and b!659893 res!428121) b!659896))

(assert (= (and b!659896 res!428115) b!659898))

(assert (= (and b!659898 res!428117) b!659894))

(assert (= (and b!659898 (not res!428120)) b!659897))

(assert (= (and b!659897 res!428119) b!659891))

(assert (= (and b!659898 res!428116) b!659895))

(declare-fun m!632211 () Bool)

(assert (=> b!659891 m!632211))

(declare-fun m!632213 () Bool)

(assert (=> start!59754 m!632213))

(declare-fun m!632215 () Bool)

(assert (=> b!659895 m!632215))

(assert (=> b!659894 m!632211))

(declare-fun m!632217 () Bool)

(assert (=> b!659896 m!632217))

(declare-fun m!632219 () Bool)

(assert (=> b!659893 m!632219))

(declare-fun m!632221 () Bool)

(assert (=> b!659892 m!632221))

(push 1)

(assert (not b!659892))

(assert (not b!659891))

(assert (not b!659893))

(assert (not b!659895))

(assert (not start!59754))

(assert (not b!659896))

(assert (not b!659894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

