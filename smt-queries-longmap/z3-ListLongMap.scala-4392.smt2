; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60418 () Bool)

(assert start!60418)

(declare-fun b!678829 () Bool)

(declare-fun res!445217 () Bool)

(declare-fun e!386827 () Bool)

(assert (=> b!678829 (=> (not res!445217) (not e!386827))))

(declare-datatypes ((array!39432 0))(
  ( (array!39433 (arr!18907 (Array (_ BitVec 32) (_ BitVec 64))) (size!19271 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39432)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678829 (= res!445217 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!445222 () Bool)

(assert (=> start!60418 (=> (not res!445222) (not e!386827))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60418 (= res!445222 (and (bvslt (size!19271 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19271 a!3626))))))

(assert (=> start!60418 e!386827))

(assert (=> start!60418 true))

(declare-fun array_inv!14703 (array!39432) Bool)

(assert (=> start!60418 (array_inv!14703 a!3626)))

(declare-fun b!678830 () Bool)

(declare-fun e!386825 () Bool)

(declare-datatypes ((List!12948 0))(
  ( (Nil!12945) (Cons!12944 (h!13989 (_ BitVec 64)) (t!19176 List!12948)) )
))
(declare-fun acc!681 () List!12948)

(declare-fun contains!3525 (List!12948 (_ BitVec 64)) Bool)

(assert (=> b!678830 (= e!386825 (contains!3525 acc!681 k0!2843))))

(declare-fun b!678831 () Bool)

(declare-fun res!445218 () Bool)

(assert (=> b!678831 (=> (not res!445218) (not e!386827))))

(declare-fun arrayNoDuplicates!0 (array!39432 (_ BitVec 32) List!12948) Bool)

(assert (=> b!678831 (= res!445218 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12945))))

(declare-fun b!678832 () Bool)

(declare-fun res!445223 () Bool)

(assert (=> b!678832 (=> (not res!445223) (not e!386827))))

(declare-fun noDuplicate!772 (List!12948) Bool)

(assert (=> b!678832 (= res!445223 (noDuplicate!772 acc!681))))

(declare-fun b!678833 () Bool)

(declare-fun res!445214 () Bool)

(assert (=> b!678833 (=> (not res!445214) (not e!386827))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678833 (= res!445214 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19271 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!678834 () Bool)

(declare-fun res!445219 () Bool)

(assert (=> b!678834 (=> (not res!445219) (not e!386827))))

(assert (=> b!678834 (= res!445219 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19271 a!3626))))))

(declare-fun b!678835 () Bool)

(declare-fun res!445225 () Bool)

(assert (=> b!678835 (=> (not res!445225) (not e!386827))))

(assert (=> b!678835 (= res!445225 (not (contains!3525 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678836 () Bool)

(declare-fun e!386828 () Bool)

(declare-fun e!386826 () Bool)

(assert (=> b!678836 (= e!386828 e!386826)))

(declare-fun res!445221 () Bool)

(assert (=> b!678836 (=> (not res!445221) (not e!386826))))

(assert (=> b!678836 (= res!445221 (bvsle from!3004 i!1382))))

(declare-fun b!678837 () Bool)

(declare-fun res!445220 () Bool)

(assert (=> b!678837 (=> (not res!445220) (not e!386827))))

(assert (=> b!678837 (= res!445220 (not (contains!3525 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678838 () Bool)

(declare-fun res!445213 () Bool)

(assert (=> b!678838 (=> (not res!445213) (not e!386827))))

(assert (=> b!678838 (= res!445213 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678839 () Bool)

(declare-fun res!445215 () Bool)

(assert (=> b!678839 (=> (not res!445215) (not e!386827))))

(assert (=> b!678839 (= res!445215 e!386828)))

(declare-fun res!445226 () Bool)

(assert (=> b!678839 (=> res!445226 e!386828)))

(assert (=> b!678839 (= res!445226 e!386825)))

(declare-fun res!445224 () Bool)

(assert (=> b!678839 (=> (not res!445224) (not e!386825))))

(assert (=> b!678839 (= res!445224 (bvsgt from!3004 i!1382))))

(declare-fun b!678840 () Bool)

(declare-fun res!445216 () Bool)

(assert (=> b!678840 (=> (not res!445216) (not e!386827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678840 (= res!445216 (validKeyInArray!0 k0!2843))))

(declare-fun b!678841 () Bool)

(assert (=> b!678841 (= e!386826 (not (contains!3525 acc!681 k0!2843)))))

(declare-fun b!678842 () Bool)

(assert (=> b!678842 (= e!386827 (not true))))

(assert (=> b!678842 (arrayContainsKey!0 (array!39433 (store (arr!18907 a!3626) i!1382 k0!2843) (size!19271 a!3626)) k0!2843 from!3004)))

(assert (= (and start!60418 res!445222) b!678832))

(assert (= (and b!678832 res!445223) b!678837))

(assert (= (and b!678837 res!445220) b!678835))

(assert (= (and b!678835 res!445225) b!678839))

(assert (= (and b!678839 res!445224) b!678830))

(assert (= (and b!678839 (not res!445226)) b!678836))

(assert (= (and b!678836 res!445221) b!678841))

(assert (= (and b!678839 res!445215) b!678831))

(assert (= (and b!678831 res!445218) b!678838))

(assert (= (and b!678838 res!445213) b!678834))

(assert (= (and b!678834 res!445219) b!678840))

(assert (= (and b!678840 res!445216) b!678829))

(assert (= (and b!678829 res!445217) b!678833))

(assert (= (and b!678833 res!445214) b!678842))

(declare-fun m!644469 () Bool)

(assert (=> b!678837 m!644469))

(declare-fun m!644471 () Bool)

(assert (=> b!678838 m!644471))

(declare-fun m!644473 () Bool)

(assert (=> b!678841 m!644473))

(declare-fun m!644475 () Bool)

(assert (=> b!678840 m!644475))

(declare-fun m!644477 () Bool)

(assert (=> b!678842 m!644477))

(declare-fun m!644479 () Bool)

(assert (=> b!678842 m!644479))

(assert (=> b!678830 m!644473))

(declare-fun m!644481 () Bool)

(assert (=> start!60418 m!644481))

(declare-fun m!644483 () Bool)

(assert (=> b!678831 m!644483))

(declare-fun m!644485 () Bool)

(assert (=> b!678829 m!644485))

(declare-fun m!644487 () Bool)

(assert (=> b!678832 m!644487))

(declare-fun m!644489 () Bool)

(assert (=> b!678835 m!644489))

(check-sat (not start!60418) (not b!678835) (not b!678837) (not b!678841) (not b!678831) (not b!678840) (not b!678830) (not b!678829) (not b!678842) (not b!678832) (not b!678838))
