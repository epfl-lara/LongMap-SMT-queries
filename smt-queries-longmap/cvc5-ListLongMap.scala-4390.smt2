; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60368 () Bool)

(assert start!60368)

(declare-fun b!678438 () Bool)

(declare-fun e!386603 () Bool)

(declare-fun e!386601 () Bool)

(assert (=> b!678438 (= e!386603 e!386601)))

(declare-fun res!444847 () Bool)

(assert (=> b!678438 (=> (not res!444847) (not e!386601))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678438 (= res!444847 (bvsle from!3004 i!1382))))

(declare-fun b!678439 () Bool)

(declare-fun res!444853 () Bool)

(declare-fun e!386600 () Bool)

(assert (=> b!678439 (=> (not res!444853) (not e!386600))))

(declare-datatypes ((List!12941 0))(
  ( (Nil!12938) (Cons!12937 (h!13982 (_ BitVec 64)) (t!19169 List!12941)) )
))
(declare-fun acc!681 () List!12941)

(declare-fun noDuplicate!765 (List!12941) Bool)

(assert (=> b!678439 (= res!444853 (noDuplicate!765 acc!681))))

(declare-fun b!678440 () Bool)

(declare-fun e!386604 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3518 (List!12941 (_ BitVec 64)) Bool)

(assert (=> b!678440 (= e!386604 (contains!3518 acc!681 k!2843))))

(declare-fun b!678441 () Bool)

(declare-fun res!444846 () Bool)

(assert (=> b!678441 (=> (not res!444846) (not e!386600))))

(assert (=> b!678441 (= res!444846 e!386603)))

(declare-fun res!444848 () Bool)

(assert (=> b!678441 (=> res!444848 e!386603)))

(assert (=> b!678441 (= res!444848 e!386604)))

(declare-fun res!444851 () Bool)

(assert (=> b!678441 (=> (not res!444851) (not e!386604))))

(assert (=> b!678441 (= res!444851 (bvsgt from!3004 i!1382))))

(declare-fun b!678442 () Bool)

(declare-fun res!444849 () Bool)

(assert (=> b!678442 (=> (not res!444849) (not e!386600))))

(declare-datatypes ((array!39415 0))(
  ( (array!39416 (arr!18900 (Array (_ BitVec 32) (_ BitVec 64))) (size!19264 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39415)

(declare-fun arrayNoDuplicates!0 (array!39415 (_ BitVec 32) List!12941) Bool)

(assert (=> b!678442 (= res!444849 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12938))))

(declare-fun b!678443 () Bool)

(declare-fun res!444854 () Bool)

(assert (=> b!678443 (=> (not res!444854) (not e!386600))))

(assert (=> b!678443 (= res!444854 (not (contains!3518 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678444 () Bool)

(assert (=> b!678444 (= e!386600 false)))

(declare-fun lt!312889 () Bool)

(assert (=> b!678444 (= lt!312889 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!444850 () Bool)

(assert (=> start!60368 (=> (not res!444850) (not e!386600))))

(assert (=> start!60368 (= res!444850 (and (bvslt (size!19264 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19264 a!3626))))))

(assert (=> start!60368 e!386600))

(assert (=> start!60368 true))

(declare-fun array_inv!14696 (array!39415) Bool)

(assert (=> start!60368 (array_inv!14696 a!3626)))

(declare-fun b!678445 () Bool)

(assert (=> b!678445 (= e!386601 (not (contains!3518 acc!681 k!2843)))))

(declare-fun b!678446 () Bool)

(declare-fun res!444852 () Bool)

(assert (=> b!678446 (=> (not res!444852) (not e!386600))))

(assert (=> b!678446 (= res!444852 (not (contains!3518 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60368 res!444850) b!678439))

(assert (= (and b!678439 res!444853) b!678443))

(assert (= (and b!678443 res!444854) b!678446))

(assert (= (and b!678446 res!444852) b!678441))

(assert (= (and b!678441 res!444851) b!678440))

(assert (= (and b!678441 (not res!444848)) b!678438))

(assert (= (and b!678438 res!444847) b!678445))

(assert (= (and b!678441 res!444846) b!678442))

(assert (= (and b!678442 res!444849) b!678444))

(declare-fun m!644219 () Bool)

(assert (=> b!678442 m!644219))

(declare-fun m!644221 () Bool)

(assert (=> b!678440 m!644221))

(declare-fun m!644223 () Bool)

(assert (=> b!678444 m!644223))

(declare-fun m!644225 () Bool)

(assert (=> start!60368 m!644225))

(declare-fun m!644227 () Bool)

(assert (=> b!678443 m!644227))

(declare-fun m!644229 () Bool)

(assert (=> b!678446 m!644229))

(declare-fun m!644231 () Bool)

(assert (=> b!678439 m!644231))

(assert (=> b!678445 m!644221))

(push 1)

(assert (not b!678444))

(assert (not b!678445))

(assert (not b!678442))

(assert (not b!678443))

(assert (not b!678440))

(assert (not b!678439))

(assert (not start!60368))

(assert (not b!678446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

