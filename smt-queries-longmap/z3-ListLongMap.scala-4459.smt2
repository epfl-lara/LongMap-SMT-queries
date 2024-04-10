; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62050 () Bool)

(assert start!62050)

(declare-fun b!694785 () Bool)

(declare-fun res!458822 () Bool)

(declare-fun e!395176 () Bool)

(assert (=> b!694785 (=> (not res!458822) (not e!395176))))

(declare-datatypes ((array!39891 0))(
  ( (array!39892 (arr!19108 (Array (_ BitVec 32) (_ BitVec 64))) (size!19493 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39891)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13149 0))(
  ( (Nil!13146) (Cons!13145 (h!14190 (_ BitVec 64)) (t!19428 List!13149)) )
))
(declare-fun acc!681 () List!13149)

(declare-fun arrayNoDuplicates!0 (array!39891 (_ BitVec 32) List!13149) Bool)

(assert (=> b!694785 (= res!458822 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694786 () Bool)

(declare-fun res!458811 () Bool)

(assert (=> b!694786 (=> (not res!458811) (not e!395176))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694786 (= res!458811 (validKeyInArray!0 k0!2843))))

(declare-fun b!694787 () Bool)

(declare-fun e!395183 () Bool)

(declare-fun lt!316949 () List!13149)

(declare-fun contains!3726 (List!13149 (_ BitVec 64)) Bool)

(assert (=> b!694787 (= e!395183 (not (contains!3726 lt!316949 k0!2843)))))

(declare-fun b!694788 () Bool)

(declare-fun res!458821 () Bool)

(assert (=> b!694788 (=> (not res!458821) (not e!395176))))

(declare-fun noDuplicate!973 (List!13149) Bool)

(assert (=> b!694788 (= res!458821 (noDuplicate!973 acc!681))))

(declare-fun b!694789 () Bool)

(declare-fun res!458806 () Bool)

(declare-fun e!395181 () Bool)

(assert (=> b!694789 (=> (not res!458806) (not e!395181))))

(assert (=> b!694789 (= res!458806 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316949))))

(declare-fun b!694790 () Bool)

(declare-fun e!395175 () Bool)

(assert (=> b!694790 (= e!395175 (contains!3726 acc!681 k0!2843))))

(declare-fun b!694791 () Bool)

(declare-fun res!458820 () Bool)

(assert (=> b!694791 (=> (not res!458820) (not e!395176))))

(declare-fun arrayContainsKey!0 (array!39891 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694791 (= res!458820 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694792 () Bool)

(declare-fun res!458805 () Bool)

(assert (=> b!694792 (=> (not res!458805) (not e!395176))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694792 (= res!458805 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19493 a!3626))))))

(declare-fun b!694793 () Bool)

(declare-fun e!395180 () Bool)

(assert (=> b!694793 (= e!395180 e!395181)))

(declare-fun res!458819 () Bool)

(assert (=> b!694793 (=> (not res!458819) (not e!395181))))

(assert (=> b!694793 (= res!458819 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!438 (List!13149 (_ BitVec 64)) List!13149)

(assert (=> b!694793 (= lt!316949 ($colon$colon!438 acc!681 (select (arr!19108 a!3626) from!3004)))))

(declare-fun b!694795 () Bool)

(declare-fun e!395182 () Bool)

(declare-fun e!395179 () Bool)

(assert (=> b!694795 (= e!395182 e!395179)))

(declare-fun res!458823 () Bool)

(assert (=> b!694795 (=> (not res!458823) (not e!395179))))

(assert (=> b!694795 (= res!458823 (bvsle from!3004 i!1382))))

(declare-fun b!694796 () Bool)

(declare-datatypes ((Unit!24550 0))(
  ( (Unit!24551) )
))
(declare-fun e!395177 () Unit!24550)

(declare-fun Unit!24552 () Unit!24550)

(assert (=> b!694796 (= e!395177 Unit!24552)))

(assert (=> b!694796 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316948 () Unit!24550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39891 (_ BitVec 64) (_ BitVec 32)) Unit!24550)

(assert (=> b!694796 (= lt!316948 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!694796 false))

(declare-fun b!694797 () Bool)

(declare-fun e!395174 () Bool)

(assert (=> b!694797 (= e!395174 (contains!3726 lt!316949 k0!2843))))

(declare-fun b!694798 () Bool)

(assert (=> b!694798 (= e!395181 (not true))))

(assert (=> b!694798 (arrayNoDuplicates!0 (array!39892 (store (arr!19108 a!3626) i!1382 k0!2843) (size!19493 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!316949)))

(declare-fun lt!316951 () Unit!24550)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39891 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13149) Unit!24550)

(assert (=> b!694798 (= lt!316951 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316949))))

(declare-fun b!694799 () Bool)

(declare-fun Unit!24553 () Unit!24550)

(assert (=> b!694799 (= e!395177 Unit!24553)))

(declare-fun b!694800 () Bool)

(declare-fun res!458813 () Bool)

(assert (=> b!694800 (=> (not res!458813) (not e!395181))))

(declare-fun e!395184 () Bool)

(assert (=> b!694800 (= res!458813 e!395184)))

(declare-fun res!458825 () Bool)

(assert (=> b!694800 (=> res!458825 e!395184)))

(assert (=> b!694800 (= res!458825 e!395174)))

(declare-fun res!458801 () Bool)

(assert (=> b!694800 (=> (not res!458801) (not e!395174))))

(assert (=> b!694800 (= res!458801 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694801 () Bool)

(declare-fun res!458808 () Bool)

(assert (=> b!694801 (=> (not res!458808) (not e!395176))))

(assert (=> b!694801 (= res!458808 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19493 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694802 () Bool)

(assert (=> b!694802 (= e!395179 (not (contains!3726 acc!681 k0!2843)))))

(declare-fun b!694803 () Bool)

(declare-fun res!458803 () Bool)

(assert (=> b!694803 (=> (not res!458803) (not e!395176))))

(assert (=> b!694803 (= res!458803 e!395182)))

(declare-fun res!458802 () Bool)

(assert (=> b!694803 (=> res!458802 e!395182)))

(assert (=> b!694803 (= res!458802 e!395175)))

(declare-fun res!458817 () Bool)

(assert (=> b!694803 (=> (not res!458817) (not e!395175))))

(assert (=> b!694803 (= res!458817 (bvsgt from!3004 i!1382))))

(declare-fun b!694804 () Bool)

(declare-fun res!458818 () Bool)

(assert (=> b!694804 (=> (not res!458818) (not e!395176))))

(assert (=> b!694804 (= res!458818 (validKeyInArray!0 (select (arr!19108 a!3626) from!3004)))))

(declare-fun b!694805 () Bool)

(declare-fun res!458807 () Bool)

(assert (=> b!694805 (=> (not res!458807) (not e!395181))))

(assert (=> b!694805 (= res!458807 (not (contains!3726 lt!316949 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694806 () Bool)

(declare-fun res!458810 () Bool)

(assert (=> b!694806 (=> (not res!458810) (not e!395181))))

(assert (=> b!694806 (= res!458810 (noDuplicate!973 lt!316949))))

(declare-fun b!694807 () Bool)

(assert (=> b!694807 (= e!395184 e!395183)))

(declare-fun res!458809 () Bool)

(assert (=> b!694807 (=> (not res!458809) (not e!395183))))

(assert (=> b!694807 (= res!458809 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694808 () Bool)

(declare-fun res!458824 () Bool)

(assert (=> b!694808 (=> (not res!458824) (not e!395176))))

(assert (=> b!694808 (= res!458824 (not (contains!3726 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694809 () Bool)

(assert (=> b!694809 (= e!395176 e!395180)))

(declare-fun res!458812 () Bool)

(assert (=> b!694809 (=> (not res!458812) (not e!395180))))

(assert (=> b!694809 (= res!458812 (not (= (select (arr!19108 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316950 () Unit!24550)

(assert (=> b!694809 (= lt!316950 e!395177)))

(declare-fun c!78359 () Bool)

(assert (=> b!694809 (= c!78359 (= (select (arr!19108 a!3626) from!3004) k0!2843))))

(declare-fun b!694810 () Bool)

(declare-fun res!458815 () Bool)

(assert (=> b!694810 (=> (not res!458815) (not e!395176))))

(assert (=> b!694810 (= res!458815 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13146))))

(declare-fun b!694811 () Bool)

(declare-fun res!458816 () Bool)

(assert (=> b!694811 (=> (not res!458816) (not e!395181))))

(assert (=> b!694811 (= res!458816 (not (contains!3726 lt!316949 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694794 () Bool)

(declare-fun res!458804 () Bool)

(assert (=> b!694794 (=> (not res!458804) (not e!395176))))

(assert (=> b!694794 (= res!458804 (not (contains!3726 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!458814 () Bool)

(assert (=> start!62050 (=> (not res!458814) (not e!395176))))

(assert (=> start!62050 (= res!458814 (and (bvslt (size!19493 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19493 a!3626))))))

(assert (=> start!62050 e!395176))

(assert (=> start!62050 true))

(declare-fun array_inv!14904 (array!39891) Bool)

(assert (=> start!62050 (array_inv!14904 a!3626)))

(assert (= (and start!62050 res!458814) b!694788))

(assert (= (and b!694788 res!458821) b!694794))

(assert (= (and b!694794 res!458804) b!694808))

(assert (= (and b!694808 res!458824) b!694803))

(assert (= (and b!694803 res!458817) b!694790))

(assert (= (and b!694803 (not res!458802)) b!694795))

(assert (= (and b!694795 res!458823) b!694802))

(assert (= (and b!694803 res!458803) b!694810))

(assert (= (and b!694810 res!458815) b!694785))

(assert (= (and b!694785 res!458822) b!694792))

(assert (= (and b!694792 res!458805) b!694786))

(assert (= (and b!694786 res!458811) b!694791))

(assert (= (and b!694791 res!458820) b!694801))

(assert (= (and b!694801 res!458808) b!694804))

(assert (= (and b!694804 res!458818) b!694809))

(assert (= (and b!694809 c!78359) b!694796))

(assert (= (and b!694809 (not c!78359)) b!694799))

(assert (= (and b!694809 res!458812) b!694793))

(assert (= (and b!694793 res!458819) b!694806))

(assert (= (and b!694806 res!458810) b!694811))

(assert (= (and b!694811 res!458816) b!694805))

(assert (= (and b!694805 res!458807) b!694800))

(assert (= (and b!694800 res!458801) b!694797))

(assert (= (and b!694800 (not res!458825)) b!694807))

(assert (= (and b!694807 res!458809) b!694787))

(assert (= (and b!694800 res!458813) b!694789))

(assert (= (and b!694789 res!458806) b!694798))

(declare-fun m!656437 () Bool)

(assert (=> start!62050 m!656437))

(declare-fun m!656439 () Bool)

(assert (=> b!694808 m!656439))

(declare-fun m!656441 () Bool)

(assert (=> b!694798 m!656441))

(declare-fun m!656443 () Bool)

(assert (=> b!694798 m!656443))

(declare-fun m!656445 () Bool)

(assert (=> b!694798 m!656445))

(declare-fun m!656447 () Bool)

(assert (=> b!694802 m!656447))

(declare-fun m!656449 () Bool)

(assert (=> b!694787 m!656449))

(declare-fun m!656451 () Bool)

(assert (=> b!694805 m!656451))

(assert (=> b!694797 m!656449))

(declare-fun m!656453 () Bool)

(assert (=> b!694793 m!656453))

(assert (=> b!694793 m!656453))

(declare-fun m!656455 () Bool)

(assert (=> b!694793 m!656455))

(declare-fun m!656457 () Bool)

(assert (=> b!694786 m!656457))

(declare-fun m!656459 () Bool)

(assert (=> b!694796 m!656459))

(declare-fun m!656461 () Bool)

(assert (=> b!694796 m!656461))

(declare-fun m!656463 () Bool)

(assert (=> b!694810 m!656463))

(declare-fun m!656465 () Bool)

(assert (=> b!694811 m!656465))

(declare-fun m!656467 () Bool)

(assert (=> b!694794 m!656467))

(assert (=> b!694790 m!656447))

(assert (=> b!694804 m!656453))

(assert (=> b!694804 m!656453))

(declare-fun m!656469 () Bool)

(assert (=> b!694804 m!656469))

(declare-fun m!656471 () Bool)

(assert (=> b!694789 m!656471))

(declare-fun m!656473 () Bool)

(assert (=> b!694788 m!656473))

(declare-fun m!656475 () Bool)

(assert (=> b!694785 m!656475))

(declare-fun m!656477 () Bool)

(assert (=> b!694791 m!656477))

(assert (=> b!694809 m!656453))

(declare-fun m!656479 () Bool)

(assert (=> b!694806 m!656479))

(check-sat (not b!694789) (not start!62050) (not b!694802) (not b!694793) (not b!694804) (not b!694805) (not b!694810) (not b!694808) (not b!694788) (not b!694787) (not b!694797) (not b!694785) (not b!694806) (not b!694790) (not b!694794) (not b!694786) (not b!694811) (not b!694798) (not b!694796) (not b!694791))
(check-sat)
