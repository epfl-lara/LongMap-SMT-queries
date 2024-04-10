; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62028 () Bool)

(assert start!62028)

(declare-fun b!693913 () Bool)

(declare-fun res!457998 () Bool)

(declare-fun e!394815 () Bool)

(assert (=> b!693913 (=> (not res!457998) (not e!394815))))

(declare-datatypes ((List!13138 0))(
  ( (Nil!13135) (Cons!13134 (h!14179 (_ BitVec 64)) (t!19417 List!13138)) )
))
(declare-fun acc!681 () List!13138)

(declare-fun contains!3715 (List!13138 (_ BitVec 64)) Bool)

(assert (=> b!693913 (= res!457998 (not (contains!3715 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693914 () Bool)

(declare-fun e!394819 () Bool)

(assert (=> b!693914 (= e!394815 e!394819)))

(declare-fun res!457995 () Bool)

(assert (=> b!693914 (=> (not res!457995) (not e!394819))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39869 0))(
  ( (array!39870 (arr!19097 (Array (_ BitVec 32) (_ BitVec 64))) (size!19482 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39869)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!693914 (= res!457995 (not (= (select (arr!19097 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!24506 0))(
  ( (Unit!24507) )
))
(declare-fun lt!316828 () Unit!24506)

(declare-fun e!394812 () Unit!24506)

(assert (=> b!693914 (= lt!316828 e!394812)))

(declare-fun c!78326 () Bool)

(assert (=> b!693914 (= c!78326 (= (select (arr!19097 a!3626) from!3004) k!2843))))

(declare-fun b!693915 () Bool)

(declare-fun res!458011 () Bool)

(assert (=> b!693915 (=> (not res!458011) (not e!394815))))

(declare-fun arrayNoDuplicates!0 (array!39869 (_ BitVec 32) List!13138) Bool)

(assert (=> b!693915 (= res!458011 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13135))))

(declare-fun b!693916 () Bool)

(declare-fun res!458018 () Bool)

(assert (=> b!693916 (=> (not res!458018) (not e!394815))))

(declare-fun noDuplicate!962 (List!13138) Bool)

(assert (=> b!693916 (= res!458018 (noDuplicate!962 acc!681))))

(declare-fun b!693917 () Bool)

(declare-fun res!458000 () Bool)

(assert (=> b!693917 (=> (not res!458000) (not e!394815))))

(declare-fun e!394817 () Bool)

(assert (=> b!693917 (= res!458000 e!394817)))

(declare-fun res!458006 () Bool)

(assert (=> b!693917 (=> res!458006 e!394817)))

(declare-fun e!394811 () Bool)

(assert (=> b!693917 (= res!458006 e!394811)))

(declare-fun res!458016 () Bool)

(assert (=> b!693917 (=> (not res!458016) (not e!394811))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693917 (= res!458016 (bvsgt from!3004 i!1382))))

(declare-fun b!693918 () Bool)

(declare-fun res!458010 () Bool)

(declare-fun e!394814 () Bool)

(assert (=> b!693918 (=> (not res!458010) (not e!394814))))

(declare-fun e!394820 () Bool)

(assert (=> b!693918 (= res!458010 e!394820)))

(declare-fun res!457996 () Bool)

(assert (=> b!693918 (=> res!457996 e!394820)))

(declare-fun e!394816 () Bool)

(assert (=> b!693918 (= res!457996 e!394816)))

(declare-fun res!458002 () Bool)

(assert (=> b!693918 (=> (not res!458002) (not e!394816))))

(assert (=> b!693918 (= res!458002 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693919 () Bool)

(declare-fun res!458013 () Bool)

(assert (=> b!693919 (=> (not res!458013) (not e!394815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693919 (= res!458013 (validKeyInArray!0 k!2843))))

(declare-fun b!693920 () Bool)

(declare-fun res!458005 () Bool)

(assert (=> b!693920 (=> (not res!458005) (not e!394815))))

(declare-fun arrayContainsKey!0 (array!39869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693920 (= res!458005 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693921 () Bool)

(declare-fun Unit!24508 () Unit!24506)

(assert (=> b!693921 (= e!394812 Unit!24508)))

(declare-fun b!693922 () Bool)

(declare-fun res!457997 () Bool)

(assert (=> b!693922 (=> (not res!457997) (not e!394814))))

(declare-fun lt!316827 () List!13138)

(assert (=> b!693922 (= res!457997 (not (contains!3715 lt!316827 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693923 () Bool)

(declare-fun e!394821 () Bool)

(assert (=> b!693923 (= e!394821 (not (contains!3715 lt!316827 k!2843)))))

(declare-fun b!693924 () Bool)

(declare-fun res!458008 () Bool)

(assert (=> b!693924 (=> (not res!458008) (not e!394815))))

(assert (=> b!693924 (= res!458008 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693925 () Bool)

(declare-fun res!458003 () Bool)

(assert (=> b!693925 (=> (not res!458003) (not e!394815))))

(assert (=> b!693925 (= res!458003 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19482 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693926 () Bool)

(declare-fun Unit!24509 () Unit!24506)

(assert (=> b!693926 (= e!394812 Unit!24509)))

(assert (=> b!693926 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316825 () Unit!24506)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39869 (_ BitVec 64) (_ BitVec 32)) Unit!24506)

(assert (=> b!693926 (= lt!316825 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!693926 false))

(declare-fun res!458012 () Bool)

(assert (=> start!62028 (=> (not res!458012) (not e!394815))))

(assert (=> start!62028 (= res!458012 (and (bvslt (size!19482 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19482 a!3626))))))

(assert (=> start!62028 e!394815))

(assert (=> start!62028 true))

(declare-fun array_inv!14893 (array!39869) Bool)

(assert (=> start!62028 (array_inv!14893 a!3626)))

(declare-fun b!693927 () Bool)

(assert (=> b!693927 (= e!394814 false)))

(declare-fun lt!316826 () Bool)

(assert (=> b!693927 (= lt!316826 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316827))))

(declare-fun b!693928 () Bool)

(declare-fun e!394813 () Bool)

(assert (=> b!693928 (= e!394817 e!394813)))

(declare-fun res!458004 () Bool)

(assert (=> b!693928 (=> (not res!458004) (not e!394813))))

(assert (=> b!693928 (= res!458004 (bvsle from!3004 i!1382))))

(declare-fun b!693929 () Bool)

(declare-fun res!458009 () Bool)

(assert (=> b!693929 (=> (not res!458009) (not e!394814))))

(assert (=> b!693929 (= res!458009 (noDuplicate!962 lt!316827))))

(declare-fun b!693930 () Bool)

(assert (=> b!693930 (= e!394820 e!394821)))

(declare-fun res!458001 () Bool)

(assert (=> b!693930 (=> (not res!458001) (not e!394821))))

(assert (=> b!693930 (= res!458001 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693931 () Bool)

(declare-fun res!457999 () Bool)

(assert (=> b!693931 (=> (not res!457999) (not e!394815))))

(assert (=> b!693931 (= res!457999 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19482 a!3626))))))

(declare-fun b!693932 () Bool)

(assert (=> b!693932 (= e!394811 (contains!3715 acc!681 k!2843))))

(declare-fun b!693933 () Bool)

(assert (=> b!693933 (= e!394816 (contains!3715 lt!316827 k!2843))))

(declare-fun b!693934 () Bool)

(declare-fun res!458017 () Bool)

(assert (=> b!693934 (=> (not res!458017) (not e!394815))))

(assert (=> b!693934 (= res!458017 (validKeyInArray!0 (select (arr!19097 a!3626) from!3004)))))

(declare-fun b!693935 () Bool)

(assert (=> b!693935 (= e!394813 (not (contains!3715 acc!681 k!2843)))))

(declare-fun b!693936 () Bool)

(assert (=> b!693936 (= e!394819 e!394814)))

(declare-fun res!458015 () Bool)

(assert (=> b!693936 (=> (not res!458015) (not e!394814))))

(assert (=> b!693936 (= res!458015 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!427 (List!13138 (_ BitVec 64)) List!13138)

(assert (=> b!693936 (= lt!316827 ($colon$colon!427 acc!681 (select (arr!19097 a!3626) from!3004)))))

(declare-fun b!693937 () Bool)

(declare-fun res!458014 () Bool)

(assert (=> b!693937 (=> (not res!458014) (not e!394815))))

(assert (=> b!693937 (= res!458014 (not (contains!3715 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693938 () Bool)

(declare-fun res!458007 () Bool)

(assert (=> b!693938 (=> (not res!458007) (not e!394814))))

(assert (=> b!693938 (= res!458007 (not (contains!3715 lt!316827 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62028 res!458012) b!693916))

(assert (= (and b!693916 res!458018) b!693937))

(assert (= (and b!693937 res!458014) b!693913))

(assert (= (and b!693913 res!457998) b!693917))

(assert (= (and b!693917 res!458016) b!693932))

(assert (= (and b!693917 (not res!458006)) b!693928))

(assert (= (and b!693928 res!458004) b!693935))

(assert (= (and b!693917 res!458000) b!693915))

(assert (= (and b!693915 res!458011) b!693924))

(assert (= (and b!693924 res!458008) b!693931))

(assert (= (and b!693931 res!457999) b!693919))

(assert (= (and b!693919 res!458013) b!693920))

(assert (= (and b!693920 res!458005) b!693925))

(assert (= (and b!693925 res!458003) b!693934))

(assert (= (and b!693934 res!458017) b!693914))

(assert (= (and b!693914 c!78326) b!693926))

(assert (= (and b!693914 (not c!78326)) b!693921))

(assert (= (and b!693914 res!457995) b!693936))

(assert (= (and b!693936 res!458015) b!693929))

(assert (= (and b!693929 res!458009) b!693922))

(assert (= (and b!693922 res!457997) b!693938))

(assert (= (and b!693938 res!458007) b!693918))

(assert (= (and b!693918 res!458002) b!693933))

(assert (= (and b!693918 (not res!457996)) b!693930))

(assert (= (and b!693930 res!458001) b!693923))

(assert (= (and b!693918 res!458010) b!693927))

(declare-fun m!656013 () Bool)

(assert (=> b!693932 m!656013))

(declare-fun m!656015 () Bool)

(assert (=> b!693913 m!656015))

(declare-fun m!656017 () Bool)

(assert (=> b!693916 m!656017))

(declare-fun m!656019 () Bool)

(assert (=> b!693933 m!656019))

(declare-fun m!656021 () Bool)

(assert (=> b!693915 m!656021))

(declare-fun m!656023 () Bool)

(assert (=> b!693937 m!656023))

(declare-fun m!656025 () Bool)

(assert (=> b!693926 m!656025))

(declare-fun m!656027 () Bool)

(assert (=> b!693926 m!656027))

(declare-fun m!656029 () Bool)

(assert (=> b!693938 m!656029))

(declare-fun m!656031 () Bool)

(assert (=> b!693936 m!656031))

(assert (=> b!693936 m!656031))

(declare-fun m!656033 () Bool)

(assert (=> b!693936 m!656033))

(declare-fun m!656035 () Bool)

(assert (=> b!693929 m!656035))

(assert (=> b!693914 m!656031))

(declare-fun m!656037 () Bool)

(assert (=> b!693924 m!656037))

(declare-fun m!656039 () Bool)

(assert (=> start!62028 m!656039))

(assert (=> b!693934 m!656031))

(assert (=> b!693934 m!656031))

(declare-fun m!656041 () Bool)

(assert (=> b!693934 m!656041))

(declare-fun m!656043 () Bool)

(assert (=> b!693920 m!656043))

(assert (=> b!693923 m!656019))

(declare-fun m!656045 () Bool)

(assert (=> b!693927 m!656045))

(assert (=> b!693935 m!656013))

(declare-fun m!656047 () Bool)

(assert (=> b!693922 m!656047))

(declare-fun m!656049 () Bool)

(assert (=> b!693919 m!656049))

(push 1)

