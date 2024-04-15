; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59756 () Bool)

(assert start!59756)

(declare-fun b!659915 () Bool)

(declare-fun res!428142 () Bool)

(declare-fun e!379196 () Bool)

(assert (=> b!659915 (=> (not res!428142) (not e!379196))))

(declare-datatypes ((List!12679 0))(
  ( (Nil!12676) (Cons!12675 (h!13720 (_ BitVec 64)) (t!18898 List!12679)) )
))
(declare-fun acc!681 () List!12679)

(declare-fun contains!3201 (List!12679 (_ BitVec 64)) Bool)

(assert (=> b!659915 (= res!428142 (not (contains!3201 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659916 () Bool)

(declare-fun res!428139 () Bool)

(assert (=> b!659916 (=> (not res!428139) (not e!379196))))

(assert (=> b!659916 (= res!428139 (not (contains!3201 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659917 () Bool)

(declare-fun res!428143 () Bool)

(assert (=> b!659917 (=> (not res!428143) (not e!379196))))

(declare-fun e!379194 () Bool)

(assert (=> b!659917 (= res!428143 e!379194)))

(declare-fun res!428140 () Bool)

(assert (=> b!659917 (=> res!428140 e!379194)))

(declare-fun e!379195 () Bool)

(assert (=> b!659917 (= res!428140 e!379195)))

(declare-fun res!428145 () Bool)

(assert (=> b!659917 (=> (not res!428145) (not e!379195))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659917 (= res!428145 (bvsgt from!3004 i!1382))))

(declare-fun b!659918 () Bool)

(declare-fun e!379192 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!659918 (= e!379192 (not (contains!3201 acc!681 k0!2843)))))

(declare-fun res!428144 () Bool)

(assert (=> start!59756 (=> (not res!428144) (not e!379196))))

(declare-datatypes ((array!38814 0))(
  ( (array!38815 (arr!18599 (Array (_ BitVec 32) (_ BitVec 64))) (size!18964 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38814)

(assert (=> start!59756 (= res!428144 (and (bvslt (size!18964 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18964 a!3626))))))

(assert (=> start!59756 e!379196))

(assert (=> start!59756 true))

(declare-fun array_inv!14482 (array!38814) Bool)

(assert (=> start!59756 (array_inv!14482 a!3626)))

(declare-fun b!659919 () Bool)

(assert (=> b!659919 (= e!379195 (contains!3201 acc!681 k0!2843))))

(declare-fun b!659920 () Bool)

(assert (=> b!659920 (= e!379194 e!379192)))

(declare-fun res!428141 () Bool)

(assert (=> b!659920 (=> (not res!428141) (not e!379192))))

(assert (=> b!659920 (= res!428141 (bvsle from!3004 i!1382))))

(declare-fun b!659921 () Bool)

(assert (=> b!659921 (= e!379196 false)))

(declare-fun lt!308502 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38814 (_ BitVec 32) List!12679) Bool)

(assert (=> b!659921 (= lt!308502 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12676))))

(declare-fun b!659922 () Bool)

(declare-fun res!428146 () Bool)

(assert (=> b!659922 (=> (not res!428146) (not e!379196))))

(declare-fun noDuplicate!470 (List!12679) Bool)

(assert (=> b!659922 (= res!428146 (noDuplicate!470 acc!681))))

(assert (= (and start!59756 res!428144) b!659922))

(assert (= (and b!659922 res!428146) b!659916))

(assert (= (and b!659916 res!428139) b!659915))

(assert (= (and b!659915 res!428142) b!659917))

(assert (= (and b!659917 res!428145) b!659919))

(assert (= (and b!659917 (not res!428140)) b!659920))

(assert (= (and b!659920 res!428141) b!659918))

(assert (= (and b!659917 res!428143) b!659921))

(declare-fun m!632223 () Bool)

(assert (=> b!659916 m!632223))

(declare-fun m!632225 () Bool)

(assert (=> b!659915 m!632225))

(declare-fun m!632227 () Bool)

(assert (=> b!659922 m!632227))

(declare-fun m!632229 () Bool)

(assert (=> start!59756 m!632229))

(declare-fun m!632231 () Bool)

(assert (=> b!659921 m!632231))

(declare-fun m!632233 () Bool)

(assert (=> b!659918 m!632233))

(assert (=> b!659919 m!632233))

(check-sat (not b!659921) (not b!659915) (not b!659916) (not b!659918) (not b!659922) (not b!659919) (not start!59756))
(check-sat)
