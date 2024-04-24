; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60418 () Bool)

(assert start!60418)

(declare-fun b!678510 () Bool)

(declare-fun e!386682 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39403 0))(
  ( (array!39404 (arr!18891 (Array (_ BitVec 32) (_ BitVec 64))) (size!19255 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39403)

(assert (=> b!678510 (= e!386682 (= (select (arr!18891 a!3626) from!3004) k!2843))))

(declare-datatypes ((Unit!23771 0))(
  ( (Unit!23772) )
))
(declare-fun lt!312987 () Unit!23771)

(declare-fun e!386680 () Unit!23771)

(assert (=> b!678510 (= lt!312987 e!386680)))

(declare-fun c!77219 () Bool)

(assert (=> b!678510 (= c!77219 (= (select (arr!18891 a!3626) from!3004) k!2843))))

(declare-fun b!678512 () Bool)

(declare-fun res!444821 () Bool)

(assert (=> b!678512 (=> (not res!444821) (not e!386682))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678512 (= res!444821 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19255 a!3626))))))

(declare-fun b!678513 () Bool)

(declare-fun res!444819 () Bool)

(assert (=> b!678513 (=> (not res!444819) (not e!386682))))

(declare-fun e!386681 () Bool)

(assert (=> b!678513 (= res!444819 e!386681)))

(declare-fun res!444822 () Bool)

(assert (=> b!678513 (=> res!444822 e!386681)))

(declare-fun e!386683 () Bool)

(assert (=> b!678513 (= res!444822 e!386683)))

(declare-fun res!444811 () Bool)

(assert (=> b!678513 (=> (not res!444811) (not e!386683))))

(assert (=> b!678513 (= res!444811 (bvsgt from!3004 i!1382))))

(declare-fun b!678514 () Bool)

(declare-fun res!444818 () Bool)

(assert (=> b!678514 (=> (not res!444818) (not e!386682))))

(assert (=> b!678514 (= res!444818 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19255 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!678515 () Bool)

(declare-fun e!386685 () Bool)

(declare-datatypes ((List!12839 0))(
  ( (Nil!12836) (Cons!12835 (h!13883 (_ BitVec 64)) (t!19059 List!12839)) )
))
(declare-fun acc!681 () List!12839)

(declare-fun contains!3491 (List!12839 (_ BitVec 64)) Bool)

(assert (=> b!678515 (= e!386685 (not (contains!3491 acc!681 k!2843)))))

(declare-fun b!678516 () Bool)

(declare-fun Unit!23773 () Unit!23771)

(assert (=> b!678516 (= e!386680 Unit!23773)))

(declare-fun b!678517 () Bool)

(declare-fun res!444813 () Bool)

(assert (=> b!678517 (=> (not res!444813) (not e!386682))))

(declare-fun arrayContainsKey!0 (array!39403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678517 (= res!444813 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678518 () Bool)

(declare-fun res!444810 () Bool)

(assert (=> b!678518 (=> (not res!444810) (not e!386682))))

(declare-fun arrayNoDuplicates!0 (array!39403 (_ BitVec 32) List!12839) Bool)

(assert (=> b!678518 (= res!444810 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678519 () Bool)

(declare-fun res!444823 () Bool)

(assert (=> b!678519 (=> (not res!444823) (not e!386682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678519 (= res!444823 (validKeyInArray!0 k!2843))))

(declare-fun b!678520 () Bool)

(declare-fun res!444814 () Bool)

(assert (=> b!678520 (=> (not res!444814) (not e!386682))))

(assert (=> b!678520 (= res!444814 (validKeyInArray!0 (select (arr!18891 a!3626) from!3004)))))

(declare-fun b!678511 () Bool)

(assert (=> b!678511 (= e!386683 (contains!3491 acc!681 k!2843))))

(declare-fun res!444817 () Bool)

(assert (=> start!60418 (=> (not res!444817) (not e!386682))))

(assert (=> start!60418 (= res!444817 (and (bvslt (size!19255 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19255 a!3626))))))

(assert (=> start!60418 e!386682))

(assert (=> start!60418 true))

(declare-fun array_inv!14750 (array!39403) Bool)

(assert (=> start!60418 (array_inv!14750 a!3626)))

(declare-fun b!678521 () Bool)

(declare-fun res!444809 () Bool)

(assert (=> b!678521 (=> (not res!444809) (not e!386682))))

(assert (=> b!678521 (= res!444809 (not (contains!3491 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678522 () Bool)

(declare-fun res!444815 () Bool)

(assert (=> b!678522 (=> (not res!444815) (not e!386682))))

(assert (=> b!678522 (= res!444815 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12836))))

(declare-fun b!678523 () Bool)

(declare-fun res!444820 () Bool)

(assert (=> b!678523 (=> (not res!444820) (not e!386682))))

(declare-fun noDuplicate!765 (List!12839) Bool)

(assert (=> b!678523 (= res!444820 (noDuplicate!765 acc!681))))

(declare-fun b!678524 () Bool)

(assert (=> b!678524 (= e!386681 e!386685)))

(declare-fun res!444812 () Bool)

(assert (=> b!678524 (=> (not res!444812) (not e!386685))))

(assert (=> b!678524 (= res!444812 (bvsle from!3004 i!1382))))

(declare-fun b!678525 () Bool)

(declare-fun res!444816 () Bool)

(assert (=> b!678525 (=> (not res!444816) (not e!386682))))

(assert (=> b!678525 (= res!444816 (not (contains!3491 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678526 () Bool)

(declare-fun Unit!23774 () Unit!23771)

(assert (=> b!678526 (= e!386680 Unit!23774)))

(assert (=> b!678526 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312988 () Unit!23771)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39403 (_ BitVec 64) (_ BitVec 32)) Unit!23771)

(assert (=> b!678526 (= lt!312988 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!678526 false))

(assert (= (and start!60418 res!444817) b!678523))

(assert (= (and b!678523 res!444820) b!678521))

(assert (= (and b!678521 res!444809) b!678525))

(assert (= (and b!678525 res!444816) b!678513))

(assert (= (and b!678513 res!444811) b!678511))

(assert (= (and b!678513 (not res!444822)) b!678524))

(assert (= (and b!678524 res!444812) b!678515))

(assert (= (and b!678513 res!444819) b!678522))

(assert (= (and b!678522 res!444815) b!678518))

(assert (= (and b!678518 res!444810) b!678512))

(assert (= (and b!678512 res!444821) b!678519))

(assert (= (and b!678519 res!444823) b!678517))

(assert (= (and b!678517 res!444813) b!678514))

(assert (= (and b!678514 res!444818) b!678520))

(assert (= (and b!678520 res!444814) b!678510))

(assert (= (and b!678510 c!77219) b!678526))

(assert (= (and b!678510 (not c!77219)) b!678516))

(declare-fun m!644837 () Bool)

(assert (=> b!678523 m!644837))

(declare-fun m!644839 () Bool)

(assert (=> b!678526 m!644839))

(declare-fun m!644841 () Bool)

(assert (=> b!678526 m!644841))

(declare-fun m!644843 () Bool)

(assert (=> b!678522 m!644843))

(declare-fun m!644845 () Bool)

(assert (=> b!678520 m!644845))

(assert (=> b!678520 m!644845))

(declare-fun m!644847 () Bool)

(assert (=> b!678520 m!644847))

(declare-fun m!644849 () Bool)

(assert (=> start!60418 m!644849))

(assert (=> b!678510 m!644845))

(declare-fun m!644851 () Bool)

(assert (=> b!678515 m!644851))

(declare-fun m!644853 () Bool)

(assert (=> b!678521 m!644853))

(declare-fun m!644855 () Bool)

(assert (=> b!678525 m!644855))

(declare-fun m!644857 () Bool)

(assert (=> b!678518 m!644857))

(declare-fun m!644859 () Bool)

(assert (=> b!678519 m!644859))

(declare-fun m!644861 () Bool)

(assert (=> b!678517 m!644861))

(assert (=> b!678511 m!644851))

(push 1)

(assert (not b!678519))

(assert (not b!678515))

(assert (not b!678511))

(assert (not b!678520))

(assert (not b!678521))

(assert (not b!678523))

(assert (not b!678522))

(assert (not b!678525))

(assert (not b!678517))

(assert (not b!678518))

(assert (not b!678526))

(assert (not start!60418))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

