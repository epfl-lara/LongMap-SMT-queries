; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62142 () Bool)

(assert start!62142)

(declare-fun b!695832 () Bool)

(declare-fun res!459955 () Bool)

(declare-fun e!395672 () Bool)

(assert (=> b!695832 (=> (not res!459955) (not e!395672))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!695832 (= res!459955 (validKeyInArray!0 k!2843))))

(declare-fun res!459949 () Bool)

(assert (=> start!62142 (=> (not res!459949) (not e!395672))))

(declare-datatypes ((array!39943 0))(
  ( (array!39944 (arr!19132 (Array (_ BitVec 32) (_ BitVec 64))) (size!19514 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39943)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62142 (= res!459949 (and (bvslt (size!19514 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19514 a!3626))))))

(assert (=> start!62142 e!395672))

(assert (=> start!62142 true))

(declare-fun array_inv!15015 (array!39943) Bool)

(assert (=> start!62142 (array_inv!15015 a!3626)))

(declare-fun b!695833 () Bool)

(assert (=> b!695833 (= e!395672 false)))

(declare-fun lt!316839 () Bool)

(declare-fun e!395670 () Bool)

(assert (=> b!695833 (= lt!316839 e!395670)))

(declare-fun res!459952 () Bool)

(assert (=> b!695833 (=> res!459952 e!395670)))

(declare-fun e!395674 () Bool)

(assert (=> b!695833 (= res!459952 e!395674)))

(declare-fun res!459947 () Bool)

(assert (=> b!695833 (=> (not res!459947) (not e!395674))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695833 (= res!459947 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!695834 () Bool)

(declare-fun res!459957 () Bool)

(assert (=> b!695834 (=> (not res!459957) (not e!395672))))

(declare-datatypes ((List!13212 0))(
  ( (Nil!13209) (Cons!13208 (h!14253 (_ BitVec 64)) (t!19485 List!13212)) )
))
(declare-fun acc!681 () List!13212)

(declare-fun contains!3734 (List!13212 (_ BitVec 64)) Bool)

(assert (=> b!695834 (= res!459957 (not (contains!3734 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695835 () Bool)

(declare-fun res!459942 () Bool)

(assert (=> b!695835 (=> (not res!459942) (not e!395672))))

(assert (=> b!695835 (= res!459942 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!695836 () Bool)

(declare-fun e!395669 () Bool)

(assert (=> b!695836 (= e!395669 (contains!3734 acc!681 k!2843))))

(declare-fun b!695837 () Bool)

(declare-fun res!459943 () Bool)

(assert (=> b!695837 (=> (not res!459943) (not e!395672))))

(assert (=> b!695837 (= res!459943 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19514 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!695838 () Bool)

(declare-fun res!459954 () Bool)

(assert (=> b!695838 (=> (not res!459954) (not e!395672))))

(declare-fun e!395671 () Bool)

(assert (=> b!695838 (= res!459954 e!395671)))

(declare-fun res!459944 () Bool)

(assert (=> b!695838 (=> res!459944 e!395671)))

(assert (=> b!695838 (= res!459944 e!395669)))

(declare-fun res!459950 () Bool)

(assert (=> b!695838 (=> (not res!459950) (not e!395669))))

(assert (=> b!695838 (= res!459950 (bvsgt from!3004 i!1382))))

(declare-fun b!695839 () Bool)

(declare-fun res!459946 () Bool)

(assert (=> b!695839 (=> (not res!459946) (not e!395672))))

(assert (=> b!695839 (= res!459946 (not (contains!3734 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695840 () Bool)

(declare-fun e!395675 () Bool)

(assert (=> b!695840 (= e!395670 e!395675)))

(declare-fun res!459958 () Bool)

(assert (=> b!695840 (=> (not res!459958) (not e!395675))))

(assert (=> b!695840 (= res!459958 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!695841 () Bool)

(declare-fun res!459951 () Bool)

(assert (=> b!695841 (=> (not res!459951) (not e!395672))))

(assert (=> b!695841 (= res!459951 (not (validKeyInArray!0 (select (arr!19132 a!3626) from!3004))))))

(declare-fun b!695842 () Bool)

(assert (=> b!695842 (= e!395674 (contains!3734 acc!681 k!2843))))

(declare-fun b!695843 () Bool)

(declare-fun e!395668 () Bool)

(assert (=> b!695843 (= e!395668 (not (contains!3734 acc!681 k!2843)))))

(declare-fun b!695844 () Bool)

(declare-fun res!459953 () Bool)

(assert (=> b!695844 (=> (not res!459953) (not e!395672))))

(declare-fun arrayNoDuplicates!0 (array!39943 (_ BitVec 32) List!13212) Bool)

(assert (=> b!695844 (= res!459953 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13209))))

(declare-fun b!695845 () Bool)

(declare-fun res!459945 () Bool)

(assert (=> b!695845 (=> (not res!459945) (not e!395672))))

(assert (=> b!695845 (= res!459945 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!695846 () Bool)

(assert (=> b!695846 (= e!395675 (not (contains!3734 acc!681 k!2843)))))

(declare-fun b!695847 () Bool)

(assert (=> b!695847 (= e!395671 e!395668)))

(declare-fun res!459941 () Bool)

(assert (=> b!695847 (=> (not res!459941) (not e!395668))))

(assert (=> b!695847 (= res!459941 (bvsle from!3004 i!1382))))

(declare-fun b!695848 () Bool)

(declare-fun res!459940 () Bool)

(assert (=> b!695848 (=> (not res!459940) (not e!395672))))

(declare-fun noDuplicate!1003 (List!13212) Bool)

(assert (=> b!695848 (= res!459940 (noDuplicate!1003 acc!681))))

(declare-fun b!695849 () Bool)

(declare-fun res!459956 () Bool)

(assert (=> b!695849 (=> (not res!459956) (not e!395672))))

(assert (=> b!695849 (= res!459956 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19514 a!3626))))))

(declare-fun b!695850 () Bool)

(declare-fun res!459948 () Bool)

(assert (=> b!695850 (=> (not res!459948) (not e!395672))))

(declare-fun arrayContainsKey!0 (array!39943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!695850 (= res!459948 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!62142 res!459949) b!695848))

(assert (= (and b!695848 res!459940) b!695839))

(assert (= (and b!695839 res!459946) b!695834))

(assert (= (and b!695834 res!459957) b!695838))

(assert (= (and b!695838 res!459950) b!695836))

(assert (= (and b!695838 (not res!459944)) b!695847))

(assert (= (and b!695847 res!459941) b!695843))

(assert (= (and b!695838 res!459954) b!695844))

(assert (= (and b!695844 res!459953) b!695845))

(assert (= (and b!695845 res!459945) b!695849))

(assert (= (and b!695849 res!459956) b!695832))

(assert (= (and b!695832 res!459955) b!695850))

(assert (= (and b!695850 res!459948) b!695837))

(assert (= (and b!695837 res!459943) b!695841))

(assert (= (and b!695841 res!459951) b!695835))

(assert (= (and b!695835 res!459942) b!695833))

(assert (= (and b!695833 res!459947) b!695842))

(assert (= (and b!695833 (not res!459952)) b!695840))

(assert (= (and b!695840 res!459958) b!695846))

(declare-fun m!656471 () Bool)

(assert (=> b!695844 m!656471))

(declare-fun m!656473 () Bool)

(assert (=> b!695841 m!656473))

(assert (=> b!695841 m!656473))

(declare-fun m!656475 () Bool)

(assert (=> b!695841 m!656475))

(declare-fun m!656477 () Bool)

(assert (=> start!62142 m!656477))

(declare-fun m!656479 () Bool)

(assert (=> b!695845 m!656479))

(declare-fun m!656481 () Bool)

(assert (=> b!695839 m!656481))

(declare-fun m!656483 () Bool)

(assert (=> b!695832 m!656483))

(declare-fun m!656485 () Bool)

(assert (=> b!695843 m!656485))

(declare-fun m!656487 () Bool)

(assert (=> b!695834 m!656487))

(declare-fun m!656489 () Bool)

(assert (=> b!695850 m!656489))

(assert (=> b!695846 m!656485))

(declare-fun m!656491 () Bool)

(assert (=> b!695848 m!656491))

(assert (=> b!695836 m!656485))

(assert (=> b!695842 m!656485))

(push 1)

(assert (not b!695843))

(assert (not start!62142))

(assert (not b!695845))

(assert (not b!695848))

(assert (not b!695834))

(assert (not b!695842))

(assert (not b!695846))

(assert (not b!695832))

(assert (not b!695839))

(assert (not b!695841))

(assert (not b!695844))

(assert (not b!695836))

(assert (not b!695850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

