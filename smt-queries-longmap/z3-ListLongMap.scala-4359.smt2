; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60184 () Bool)

(assert start!60184)

(declare-fun b!672808 () Bool)

(declare-fun e!384306 () Bool)

(declare-fun e!384304 () Bool)

(assert (=> b!672808 (= e!384306 e!384304)))

(declare-fun res!439413 () Bool)

(assert (=> b!672808 (=> (not res!439413) (not e!384304))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672808 (= res!439413 (bvsle from!3004 i!1382))))

(declare-fun b!672809 () Bool)

(declare-fun res!439405 () Bool)

(declare-fun e!384301 () Bool)

(assert (=> b!672809 (=> (not res!439405) (not e!384301))))

(declare-datatypes ((array!39231 0))(
  ( (array!39232 (arr!18808 (Array (_ BitVec 32) (_ BitVec 64))) (size!19172 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39231)

(declare-datatypes ((List!12849 0))(
  ( (Nil!12846) (Cons!12845 (h!13890 (_ BitVec 64)) (t!19077 List!12849)) )
))
(declare-fun acc!681 () List!12849)

(declare-fun arrayNoDuplicates!0 (array!39231 (_ BitVec 32) List!12849) Bool)

(assert (=> b!672809 (= res!439405 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672810 () Bool)

(declare-fun e!384298 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3426 (List!12849 (_ BitVec 64)) Bool)

(assert (=> b!672810 (= e!384298 (contains!3426 acc!681 k0!2843))))

(declare-fun b!672811 () Bool)

(declare-fun res!439419 () Bool)

(assert (=> b!672811 (=> (not res!439419) (not e!384301))))

(assert (=> b!672811 (= res!439419 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19172 a!3626))))))

(declare-fun b!672812 () Bool)

(declare-fun res!439425 () Bool)

(assert (=> b!672812 (=> (not res!439425) (not e!384301))))

(assert (=> b!672812 (= res!439425 e!384306)))

(declare-fun res!439407 () Bool)

(assert (=> b!672812 (=> res!439407 e!384306)))

(assert (=> b!672812 (= res!439407 e!384298)))

(declare-fun res!439411 () Bool)

(assert (=> b!672812 (=> (not res!439411) (not e!384298))))

(assert (=> b!672812 (= res!439411 (bvsgt from!3004 i!1382))))

(declare-fun b!672813 () Bool)

(declare-fun res!439416 () Bool)

(assert (=> b!672813 (=> (not res!439416) (not e!384301))))

(assert (=> b!672813 (= res!439416 (not (contains!3426 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672814 () Bool)

(declare-datatypes ((Unit!23644 0))(
  ( (Unit!23645) )
))
(declare-fun e!384305 () Unit!23644)

(declare-fun Unit!23646 () Unit!23644)

(assert (=> b!672814 (= e!384305 Unit!23646)))

(declare-fun arrayContainsKey!0 (array!39231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672814 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312367 () Unit!23644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39231 (_ BitVec 64) (_ BitVec 32)) Unit!23644)

(assert (=> b!672814 (= lt!312367 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672814 false))

(declare-fun b!672815 () Bool)

(declare-fun e!384297 () Bool)

(assert (=> b!672815 (= e!384297 false)))

(declare-fun lt!312370 () Bool)

(declare-fun lt!312369 () List!12849)

(assert (=> b!672815 (= lt!312370 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312369))))

(declare-fun b!672816 () Bool)

(declare-fun res!439404 () Bool)

(assert (=> b!672816 (=> (not res!439404) (not e!384297))))

(assert (=> b!672816 (= res!439404 (not (contains!3426 lt!312369 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672817 () Bool)

(declare-fun res!439424 () Bool)

(assert (=> b!672817 (=> (not res!439424) (not e!384301))))

(assert (=> b!672817 (= res!439424 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19172 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672818 () Bool)

(declare-fun res!439417 () Bool)

(assert (=> b!672818 (=> (not res!439417) (not e!384301))))

(assert (=> b!672818 (= res!439417 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12846))))

(declare-fun b!672819 () Bool)

(declare-fun e!384302 () Bool)

(assert (=> b!672819 (= e!384301 e!384302)))

(declare-fun res!439422 () Bool)

(assert (=> b!672819 (=> (not res!439422) (not e!384302))))

(assert (=> b!672819 (= res!439422 (not (= (select (arr!18808 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312368 () Unit!23644)

(assert (=> b!672819 (= lt!312368 e!384305)))

(declare-fun c!77069 () Bool)

(assert (=> b!672819 (= c!77069 (= (select (arr!18808 a!3626) from!3004) k0!2843))))

(declare-fun res!439410 () Bool)

(assert (=> start!60184 (=> (not res!439410) (not e!384301))))

(assert (=> start!60184 (= res!439410 (and (bvslt (size!19172 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19172 a!3626))))))

(assert (=> start!60184 e!384301))

(assert (=> start!60184 true))

(declare-fun array_inv!14604 (array!39231) Bool)

(assert (=> start!60184 (array_inv!14604 a!3626)))

(declare-fun b!672820 () Bool)

(declare-fun res!439420 () Bool)

(assert (=> b!672820 (=> (not res!439420) (not e!384301))))

(assert (=> b!672820 (= res!439420 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672821 () Bool)

(assert (=> b!672821 (= e!384304 (not (contains!3426 acc!681 k0!2843)))))

(declare-fun b!672822 () Bool)

(declare-fun res!439423 () Bool)

(assert (=> b!672822 (=> (not res!439423) (not e!384297))))

(declare-fun e!384303 () Bool)

(assert (=> b!672822 (= res!439423 e!384303)))

(declare-fun res!439414 () Bool)

(assert (=> b!672822 (=> res!439414 e!384303)))

(declare-fun e!384299 () Bool)

(assert (=> b!672822 (= res!439414 e!384299)))

(declare-fun res!439408 () Bool)

(assert (=> b!672822 (=> (not res!439408) (not e!384299))))

(assert (=> b!672822 (= res!439408 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672823 () Bool)

(declare-fun res!439415 () Bool)

(assert (=> b!672823 (=> (not res!439415) (not e!384297))))

(declare-fun noDuplicate!673 (List!12849) Bool)

(assert (=> b!672823 (= res!439415 (noDuplicate!673 lt!312369))))

(declare-fun b!672824 () Bool)

(declare-fun res!439406 () Bool)

(assert (=> b!672824 (=> (not res!439406) (not e!384301))))

(assert (=> b!672824 (= res!439406 (noDuplicate!673 acc!681))))

(declare-fun b!672825 () Bool)

(declare-fun e!384296 () Bool)

(assert (=> b!672825 (= e!384296 (not (contains!3426 lt!312369 k0!2843)))))

(declare-fun b!672826 () Bool)

(declare-fun Unit!23647 () Unit!23644)

(assert (=> b!672826 (= e!384305 Unit!23647)))

(declare-fun b!672827 () Bool)

(assert (=> b!672827 (= e!384302 e!384297)))

(declare-fun res!439421 () Bool)

(assert (=> b!672827 (=> (not res!439421) (not e!384297))))

(assert (=> b!672827 (= res!439421 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!276 (List!12849 (_ BitVec 64)) List!12849)

(assert (=> b!672827 (= lt!312369 ($colon$colon!276 acc!681 (select (arr!18808 a!3626) from!3004)))))

(declare-fun b!672828 () Bool)

(assert (=> b!672828 (= e!384303 e!384296)))

(declare-fun res!439409 () Bool)

(assert (=> b!672828 (=> (not res!439409) (not e!384296))))

(assert (=> b!672828 (= res!439409 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672829 () Bool)

(declare-fun res!439426 () Bool)

(assert (=> b!672829 (=> (not res!439426) (not e!384301))))

(assert (=> b!672829 (= res!439426 (not (contains!3426 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672830 () Bool)

(assert (=> b!672830 (= e!384299 (contains!3426 lt!312369 k0!2843))))

(declare-fun b!672831 () Bool)

(declare-fun res!439418 () Bool)

(assert (=> b!672831 (=> (not res!439418) (not e!384301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672831 (= res!439418 (validKeyInArray!0 k0!2843))))

(declare-fun b!672832 () Bool)

(declare-fun res!439412 () Bool)

(assert (=> b!672832 (=> (not res!439412) (not e!384301))))

(assert (=> b!672832 (= res!439412 (validKeyInArray!0 (select (arr!18808 a!3626) from!3004)))))

(declare-fun b!672833 () Bool)

(declare-fun res!439427 () Bool)

(assert (=> b!672833 (=> (not res!439427) (not e!384297))))

(assert (=> b!672833 (= res!439427 (not (contains!3426 lt!312369 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60184 res!439410) b!672824))

(assert (= (and b!672824 res!439406) b!672829))

(assert (= (and b!672829 res!439426) b!672813))

(assert (= (and b!672813 res!439416) b!672812))

(assert (= (and b!672812 res!439411) b!672810))

(assert (= (and b!672812 (not res!439407)) b!672808))

(assert (= (and b!672808 res!439413) b!672821))

(assert (= (and b!672812 res!439425) b!672818))

(assert (= (and b!672818 res!439417) b!672809))

(assert (= (and b!672809 res!439405) b!672811))

(assert (= (and b!672811 res!439419) b!672831))

(assert (= (and b!672831 res!439418) b!672820))

(assert (= (and b!672820 res!439420) b!672817))

(assert (= (and b!672817 res!439424) b!672832))

(assert (= (and b!672832 res!439412) b!672819))

(assert (= (and b!672819 c!77069) b!672814))

(assert (= (and b!672819 (not c!77069)) b!672826))

(assert (= (and b!672819 res!439422) b!672827))

(assert (= (and b!672827 res!439421) b!672823))

(assert (= (and b!672823 res!439415) b!672833))

(assert (= (and b!672833 res!439427) b!672816))

(assert (= (and b!672816 res!439404) b!672822))

(assert (= (and b!672822 res!439408) b!672830))

(assert (= (and b!672822 (not res!439414)) b!672828))

(assert (= (and b!672828 res!439409) b!672825))

(assert (= (and b!672822 res!439423) b!672815))

(declare-fun m!641581 () Bool)

(assert (=> b!672815 m!641581))

(declare-fun m!641583 () Bool)

(assert (=> b!672829 m!641583))

(declare-fun m!641585 () Bool)

(assert (=> b!672827 m!641585))

(assert (=> b!672827 m!641585))

(declare-fun m!641587 () Bool)

(assert (=> b!672827 m!641587))

(assert (=> b!672819 m!641585))

(declare-fun m!641589 () Bool)

(assert (=> b!672824 m!641589))

(declare-fun m!641591 () Bool)

(assert (=> start!60184 m!641591))

(declare-fun m!641593 () Bool)

(assert (=> b!672809 m!641593))

(declare-fun m!641595 () Bool)

(assert (=> b!672823 m!641595))

(declare-fun m!641597 () Bool)

(assert (=> b!672833 m!641597))

(declare-fun m!641599 () Bool)

(assert (=> b!672820 m!641599))

(declare-fun m!641601 () Bool)

(assert (=> b!672816 m!641601))

(assert (=> b!672832 m!641585))

(assert (=> b!672832 m!641585))

(declare-fun m!641603 () Bool)

(assert (=> b!672832 m!641603))

(declare-fun m!641605 () Bool)

(assert (=> b!672821 m!641605))

(declare-fun m!641607 () Bool)

(assert (=> b!672813 m!641607))

(declare-fun m!641609 () Bool)

(assert (=> b!672814 m!641609))

(declare-fun m!641611 () Bool)

(assert (=> b!672814 m!641611))

(declare-fun m!641613 () Bool)

(assert (=> b!672818 m!641613))

(declare-fun m!641615 () Bool)

(assert (=> b!672830 m!641615))

(assert (=> b!672825 m!641615))

(declare-fun m!641617 () Bool)

(assert (=> b!672831 m!641617))

(assert (=> b!672810 m!641605))

(check-sat (not b!672814) (not b!672815) (not b!672818) (not b!672833) (not start!60184) (not b!672823) (not b!672829) (not b!672810) (not b!672821) (not b!672816) (not b!672827) (not b!672820) (not b!672830) (not b!672809) (not b!672832) (not b!672831) (not b!672824) (not b!672825) (not b!672813))
(check-sat)
