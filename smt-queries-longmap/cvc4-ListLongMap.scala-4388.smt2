; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60360 () Bool)

(assert start!60360)

(declare-fun b!678286 () Bool)

(declare-fun e!386541 () Bool)

(declare-fun e!386539 () Bool)

(assert (=> b!678286 (= e!386541 e!386539)))

(declare-fun res!444702 () Bool)

(assert (=> b!678286 (=> (not res!444702) (not e!386539))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678286 (= res!444702 (bvsle from!3004 i!1382))))

(declare-fun b!678287 () Bool)

(declare-fun res!444707 () Bool)

(declare-fun e!386540 () Bool)

(assert (=> b!678287 (=> (not res!444707) (not e!386540))))

(declare-datatypes ((List!12937 0))(
  ( (Nil!12934) (Cons!12933 (h!13978 (_ BitVec 64)) (t!19165 List!12937)) )
))
(declare-fun acc!681 () List!12937)

(declare-fun contains!3514 (List!12937 (_ BitVec 64)) Bool)

(assert (=> b!678287 (= res!444707 (not (contains!3514 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678289 () Bool)

(declare-datatypes ((Unit!23792 0))(
  ( (Unit!23793) )
))
(declare-fun e!386542 () Unit!23792)

(declare-fun Unit!23794 () Unit!23792)

(assert (=> b!678289 (= e!386542 Unit!23794)))

(declare-datatypes ((array!39407 0))(
  ( (array!39408 (arr!18896 (Array (_ BitVec 32) (_ BitVec 64))) (size!19260 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39407)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678289 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312886 () Unit!23792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39407 (_ BitVec 64) (_ BitVec 32)) Unit!23792)

(assert (=> b!678289 (= lt!312886 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!678289 false))

(declare-fun b!678290 () Bool)

(declare-fun res!444703 () Bool)

(assert (=> b!678290 (=> (not res!444703) (not e!386540))))

(assert (=> b!678290 (= res!444703 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19260 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!678291 () Bool)

(declare-fun res!444710 () Bool)

(assert (=> b!678291 (=> (not res!444710) (not e!386540))))

(declare-fun noDuplicate!761 (List!12937) Bool)

(assert (=> b!678291 (= res!444710 (noDuplicate!761 acc!681))))

(declare-fun b!678292 () Bool)

(declare-fun Unit!23795 () Unit!23792)

(assert (=> b!678292 (= e!386542 Unit!23795)))

(declare-fun b!678293 () Bool)

(declare-fun res!444706 () Bool)

(assert (=> b!678293 (=> (not res!444706) (not e!386540))))

(assert (=> b!678293 (= res!444706 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678294 () Bool)

(declare-fun res!444701 () Bool)

(assert (=> b!678294 (=> (not res!444701) (not e!386540))))

(assert (=> b!678294 (= res!444701 e!386541)))

(declare-fun res!444697 () Bool)

(assert (=> b!678294 (=> res!444697 e!386541)))

(declare-fun e!386544 () Bool)

(assert (=> b!678294 (= res!444697 e!386544)))

(declare-fun res!444698 () Bool)

(assert (=> b!678294 (=> (not res!444698) (not e!386544))))

(assert (=> b!678294 (= res!444698 (bvsgt from!3004 i!1382))))

(declare-fun b!678295 () Bool)

(declare-fun res!444699 () Bool)

(assert (=> b!678295 (=> (not res!444699) (not e!386540))))

(declare-fun arrayNoDuplicates!0 (array!39407 (_ BitVec 32) List!12937) Bool)

(assert (=> b!678295 (= res!444699 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678296 () Bool)

(assert (=> b!678296 (= e!386544 (contains!3514 acc!681 k!2843))))

(declare-fun b!678297 () Bool)

(declare-fun res!444709 () Bool)

(assert (=> b!678297 (=> (not res!444709) (not e!386540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678297 (= res!444709 (validKeyInArray!0 k!2843))))

(declare-fun b!678298 () Bool)

(declare-fun res!444705 () Bool)

(assert (=> b!678298 (=> (not res!444705) (not e!386540))))

(assert (=> b!678298 (= res!444705 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12934))))

(declare-fun res!444696 () Bool)

(assert (=> start!60360 (=> (not res!444696) (not e!386540))))

(assert (=> start!60360 (= res!444696 (and (bvslt (size!19260 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19260 a!3626))))))

(assert (=> start!60360 e!386540))

(assert (=> start!60360 true))

(declare-fun array_inv!14692 (array!39407) Bool)

(assert (=> start!60360 (array_inv!14692 a!3626)))

(declare-fun b!678288 () Bool)

(declare-fun res!444700 () Bool)

(assert (=> b!678288 (=> (not res!444700) (not e!386540))))

(assert (=> b!678288 (= res!444700 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19260 a!3626))))))

(declare-fun b!678299 () Bool)

(declare-fun res!444704 () Bool)

(assert (=> b!678299 (=> (not res!444704) (not e!386540))))

(assert (=> b!678299 (= res!444704 (validKeyInArray!0 (select (arr!18896 a!3626) from!3004)))))

(declare-fun b!678300 () Bool)

(assert (=> b!678300 (= e!386539 (not (contains!3514 acc!681 k!2843)))))

(declare-fun b!678301 () Bool)

(declare-fun res!444708 () Bool)

(assert (=> b!678301 (=> (not res!444708) (not e!386540))))

(assert (=> b!678301 (= res!444708 (not (contains!3514 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678302 () Bool)

(assert (=> b!678302 (= e!386540 (= (select (arr!18896 a!3626) from!3004) k!2843))))

(declare-fun lt!312885 () Unit!23792)

(assert (=> b!678302 (= lt!312885 e!386542)))

(declare-fun c!77162 () Bool)

(assert (=> b!678302 (= c!77162 (= (select (arr!18896 a!3626) from!3004) k!2843))))

(assert (= (and start!60360 res!444696) b!678291))

(assert (= (and b!678291 res!444710) b!678287))

(assert (= (and b!678287 res!444707) b!678301))

(assert (= (and b!678301 res!444708) b!678294))

(assert (= (and b!678294 res!444698) b!678296))

(assert (= (and b!678294 (not res!444697)) b!678286))

(assert (= (and b!678286 res!444702) b!678300))

(assert (= (and b!678294 res!444701) b!678298))

(assert (= (and b!678298 res!444705) b!678295))

(assert (= (and b!678295 res!444699) b!678288))

(assert (= (and b!678288 res!444700) b!678297))

(assert (= (and b!678297 res!444709) b!678293))

(assert (= (and b!678293 res!444706) b!678290))

(assert (= (and b!678290 res!444703) b!678299))

(assert (= (and b!678299 res!444704) b!678302))

(assert (= (and b!678302 c!77162) b!678289))

(assert (= (and b!678302 (not c!77162)) b!678292))

(declare-fun m!644139 () Bool)

(assert (=> b!678302 m!644139))

(declare-fun m!644141 () Bool)

(assert (=> b!678287 m!644141))

(declare-fun m!644143 () Bool)

(assert (=> b!678300 m!644143))

(assert (=> b!678299 m!644139))

(assert (=> b!678299 m!644139))

(declare-fun m!644145 () Bool)

(assert (=> b!678299 m!644145))

(declare-fun m!644147 () Bool)

(assert (=> b!678301 m!644147))

(declare-fun m!644149 () Bool)

(assert (=> start!60360 m!644149))

(declare-fun m!644151 () Bool)

(assert (=> b!678298 m!644151))

(assert (=> b!678296 m!644143))

(declare-fun m!644153 () Bool)

(assert (=> b!678295 m!644153))

(declare-fun m!644155 () Bool)

(assert (=> b!678291 m!644155))

(declare-fun m!644157 () Bool)

(assert (=> b!678289 m!644157))

(declare-fun m!644159 () Bool)

(assert (=> b!678289 m!644159))

(declare-fun m!644161 () Bool)

(assert (=> b!678293 m!644161))

(declare-fun m!644163 () Bool)

(assert (=> b!678297 m!644163))

(push 1)

(assert (not b!678299))

(assert (not b!678300))

(assert (not b!678287))

(assert (not b!678297))

(assert (not b!678289))

(assert (not b!678301))

(assert (not b!678295))

(assert (not b!678291))

(assert (not b!678296))

(assert (not start!60360))

(assert (not b!678293))

(assert (not b!678298))

(check-sat)

