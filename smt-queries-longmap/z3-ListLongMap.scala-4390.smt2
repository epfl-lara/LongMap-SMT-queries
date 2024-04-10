; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60370 () Bool)

(assert start!60370)

(declare-fun b!678465 () Bool)

(declare-fun res!444881 () Bool)

(declare-fun e!386616 () Bool)

(assert (=> b!678465 (=> (not res!444881) (not e!386616))))

(declare-datatypes ((array!39417 0))(
  ( (array!39418 (arr!18901 (Array (_ BitVec 32) (_ BitVec 64))) (size!19265 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39417)

(declare-datatypes ((List!12942 0))(
  ( (Nil!12939) (Cons!12938 (h!13983 (_ BitVec 64)) (t!19170 List!12942)) )
))
(declare-fun arrayNoDuplicates!0 (array!39417 (_ BitVec 32) List!12942) Bool)

(assert (=> b!678465 (= res!444881 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12939))))

(declare-fun b!678466 () Bool)

(declare-fun res!444876 () Bool)

(assert (=> b!678466 (=> (not res!444876) (not e!386616))))

(declare-fun acc!681 () List!12942)

(declare-fun contains!3519 (List!12942 (_ BitVec 64)) Bool)

(assert (=> b!678466 (= res!444876 (not (contains!3519 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678467 () Bool)

(declare-fun res!444874 () Bool)

(assert (=> b!678467 (=> (not res!444874) (not e!386616))))

(declare-fun noDuplicate!766 (List!12942) Bool)

(assert (=> b!678467 (= res!444874 (noDuplicate!766 acc!681))))

(declare-fun b!678468 () Bool)

(declare-fun res!444880 () Bool)

(assert (=> b!678468 (=> (not res!444880) (not e!386616))))

(declare-fun e!386615 () Bool)

(assert (=> b!678468 (= res!444880 e!386615)))

(declare-fun res!444873 () Bool)

(assert (=> b!678468 (=> res!444873 e!386615)))

(declare-fun e!386619 () Bool)

(assert (=> b!678468 (= res!444873 e!386619)))

(declare-fun res!444877 () Bool)

(assert (=> b!678468 (=> (not res!444877) (not e!386619))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678468 (= res!444877 (bvsgt from!3004 i!1382))))

(declare-fun res!444878 () Bool)

(assert (=> start!60370 (=> (not res!444878) (not e!386616))))

(assert (=> start!60370 (= res!444878 (and (bvslt (size!19265 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19265 a!3626))))))

(assert (=> start!60370 e!386616))

(assert (=> start!60370 true))

(declare-fun array_inv!14697 (array!39417) Bool)

(assert (=> start!60370 (array_inv!14697 a!3626)))

(declare-fun b!678469 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!678469 (= e!386619 (contains!3519 acc!681 k0!2843))))

(declare-fun b!678470 () Bool)

(declare-fun e!386617 () Bool)

(assert (=> b!678470 (= e!386615 e!386617)))

(declare-fun res!444875 () Bool)

(assert (=> b!678470 (=> (not res!444875) (not e!386617))))

(assert (=> b!678470 (= res!444875 (bvsle from!3004 i!1382))))

(declare-fun b!678471 () Bool)

(declare-fun res!444879 () Bool)

(assert (=> b!678471 (=> (not res!444879) (not e!386616))))

(assert (=> b!678471 (= res!444879 (not (contains!3519 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678472 () Bool)

(assert (=> b!678472 (= e!386617 (not (contains!3519 acc!681 k0!2843)))))

(declare-fun b!678473 () Bool)

(assert (=> b!678473 (= e!386616 false)))

(declare-fun lt!312892 () Bool)

(assert (=> b!678473 (= lt!312892 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60370 res!444878) b!678467))

(assert (= (and b!678467 res!444874) b!678471))

(assert (= (and b!678471 res!444879) b!678466))

(assert (= (and b!678466 res!444876) b!678468))

(assert (= (and b!678468 res!444877) b!678469))

(assert (= (and b!678468 (not res!444873)) b!678470))

(assert (= (and b!678470 res!444875) b!678472))

(assert (= (and b!678468 res!444880) b!678465))

(assert (= (and b!678465 res!444881) b!678473))

(declare-fun m!644233 () Bool)

(assert (=> b!678466 m!644233))

(declare-fun m!644235 () Bool)

(assert (=> b!678469 m!644235))

(declare-fun m!644237 () Bool)

(assert (=> b!678473 m!644237))

(declare-fun m!644239 () Bool)

(assert (=> b!678467 m!644239))

(declare-fun m!644241 () Bool)

(assert (=> b!678471 m!644241))

(declare-fun m!644243 () Bool)

(assert (=> start!60370 m!644243))

(declare-fun m!644245 () Bool)

(assert (=> b!678465 m!644245))

(assert (=> b!678472 m!644235))

(check-sat (not b!678466) (not b!678465) (not b!678469) (not start!60370) (not b!678473) (not b!678471) (not b!678472) (not b!678467))
