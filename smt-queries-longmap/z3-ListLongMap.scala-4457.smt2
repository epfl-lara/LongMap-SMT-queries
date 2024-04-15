; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62024 () Bool)

(assert start!62024)

(declare-fun b!693929 () Bool)

(declare-fun res!458151 () Bool)

(declare-fun e!394753 () Bool)

(assert (=> b!693929 (=> (not res!458151) (not e!394753))))

(declare-datatypes ((List!13180 0))(
  ( (Nil!13177) (Cons!13176 (h!14221 (_ BitVec 64)) (t!19450 List!13180)) )
))
(declare-fun lt!316619 () List!13180)

(declare-fun contains!3702 (List!13180 (_ BitVec 64)) Bool)

(assert (=> b!693929 (= res!458151 (not (contains!3702 lt!316619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693930 () Bool)

(declare-fun res!458159 () Bool)

(declare-fun e!394763 () Bool)

(assert (=> b!693930 (=> (not res!458159) (not e!394763))))

(declare-fun acc!681 () List!13180)

(assert (=> b!693930 (= res!458159 (not (contains!3702 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693931 () Bool)

(declare-fun e!394760 () Bool)

(assert (=> b!693931 (= e!394760 e!394753)))

(declare-fun res!458149 () Bool)

(assert (=> b!693931 (=> (not res!458149) (not e!394753))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!693931 (= res!458149 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39876 0))(
  ( (array!39877 (arr!19100 (Array (_ BitVec 32) (_ BitVec 64))) (size!19482 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39876)

(declare-fun $colon$colon!430 (List!13180 (_ BitVec 64)) List!13180)

(assert (=> b!693931 (= lt!316619 ($colon$colon!430 acc!681 (select (arr!19100 a!3626) from!3004)))))

(declare-fun b!693932 () Bool)

(declare-fun res!458168 () Bool)

(assert (=> b!693932 (=> (not res!458168) (not e!394763))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693932 (= res!458168 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19482 a!3626))))))

(declare-fun b!693933 () Bool)

(declare-fun res!458165 () Bool)

(assert (=> b!693933 (=> (not res!458165) (not e!394763))))

(declare-fun arrayNoDuplicates!0 (array!39876 (_ BitVec 32) List!13180) Bool)

(assert (=> b!693933 (= res!458165 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13177))))

(declare-fun b!693934 () Bool)

(declare-fun res!458164 () Bool)

(assert (=> b!693934 (=> (not res!458164) (not e!394763))))

(assert (=> b!693934 (= res!458164 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19482 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693935 () Bool)

(declare-fun res!458161 () Bool)

(assert (=> b!693935 (=> (not res!458161) (not e!394753))))

(declare-fun noDuplicate!971 (List!13180) Bool)

(assert (=> b!693935 (= res!458161 (noDuplicate!971 lt!316619))))

(declare-fun b!693936 () Bool)

(declare-fun res!458147 () Bool)

(assert (=> b!693936 (=> (not res!458147) (not e!394763))))

(assert (=> b!693936 (= res!458147 (noDuplicate!971 acc!681))))

(declare-fun b!693937 () Bool)

(declare-fun res!458157 () Bool)

(assert (=> b!693937 (=> (not res!458157) (not e!394763))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693937 (= res!458157 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693938 () Bool)

(declare-datatypes ((Unit!24500 0))(
  ( (Unit!24501) )
))
(declare-fun e!394756 () Unit!24500)

(declare-fun Unit!24502 () Unit!24500)

(assert (=> b!693938 (= e!394756 Unit!24502)))

(declare-fun res!458158 () Bool)

(assert (=> start!62024 (=> (not res!458158) (not e!394763))))

(assert (=> start!62024 (= res!458158 (and (bvslt (size!19482 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19482 a!3626))))))

(assert (=> start!62024 e!394763))

(assert (=> start!62024 true))

(declare-fun array_inv!14983 (array!39876) Bool)

(assert (=> start!62024 (array_inv!14983 a!3626)))

(declare-fun b!693939 () Bool)

(declare-fun e!394759 () Bool)

(declare-fun e!394762 () Bool)

(assert (=> b!693939 (= e!394759 e!394762)))

(declare-fun res!458162 () Bool)

(assert (=> b!693939 (=> (not res!458162) (not e!394762))))

(assert (=> b!693939 (= res!458162 (bvsle from!3004 i!1382))))

(declare-fun b!693940 () Bool)

(declare-fun res!458152 () Bool)

(assert (=> b!693940 (=> (not res!458152) (not e!394763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693940 (= res!458152 (validKeyInArray!0 k0!2843))))

(declare-fun b!693941 () Bool)

(declare-fun e!394758 () Bool)

(assert (=> b!693941 (= e!394758 (contains!3702 lt!316619 k0!2843))))

(declare-fun b!693942 () Bool)

(declare-fun Unit!24503 () Unit!24500)

(assert (=> b!693942 (= e!394756 Unit!24503)))

(assert (=> b!693942 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316618 () Unit!24500)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39876 (_ BitVec 64) (_ BitVec 32)) Unit!24500)

(assert (=> b!693942 (= lt!316618 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!693942 false))

(declare-fun b!693943 () Bool)

(declare-fun e!394757 () Bool)

(assert (=> b!693943 (= e!394757 (not (contains!3702 lt!316619 k0!2843)))))

(declare-fun b!693944 () Bool)

(declare-fun res!458160 () Bool)

(assert (=> b!693944 (=> (not res!458160) (not e!394763))))

(assert (=> b!693944 (= res!458160 (validKeyInArray!0 (select (arr!19100 a!3626) from!3004)))))

(declare-fun b!693945 () Bool)

(declare-fun res!458155 () Bool)

(assert (=> b!693945 (=> (not res!458155) (not e!394753))))

(assert (=> b!693945 (= res!458155 (not (contains!3702 lt!316619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693946 () Bool)

(declare-fun res!458150 () Bool)

(assert (=> b!693946 (=> (not res!458150) (not e!394763))))

(assert (=> b!693946 (= res!458150 (not (contains!3702 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693947 () Bool)

(assert (=> b!693947 (= e!394763 e!394760)))

(declare-fun res!458170 () Bool)

(assert (=> b!693947 (=> (not res!458170) (not e!394760))))

(assert (=> b!693947 (= res!458170 (not (= (select (arr!19100 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316620 () Unit!24500)

(assert (=> b!693947 (= lt!316620 e!394756)))

(declare-fun c!78258 () Bool)

(assert (=> b!693947 (= c!78258 (= (select (arr!19100 a!3626) from!3004) k0!2843))))

(declare-fun b!693948 () Bool)

(assert (=> b!693948 (= e!394753 false)))

(declare-fun lt!316617 () Bool)

(assert (=> b!693948 (= lt!316617 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316619))))

(declare-fun b!693949 () Bool)

(assert (=> b!693949 (= e!394762 (not (contains!3702 acc!681 k0!2843)))))

(declare-fun b!693950 () Bool)

(declare-fun e!394754 () Bool)

(assert (=> b!693950 (= e!394754 (contains!3702 acc!681 k0!2843))))

(declare-fun b!693951 () Bool)

(declare-fun e!394755 () Bool)

(assert (=> b!693951 (= e!394755 e!394757)))

(declare-fun res!458166 () Bool)

(assert (=> b!693951 (=> (not res!458166) (not e!394757))))

(assert (=> b!693951 (= res!458166 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693952 () Bool)

(declare-fun res!458169 () Bool)

(assert (=> b!693952 (=> (not res!458169) (not e!394763))))

(assert (=> b!693952 (= res!458169 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693953 () Bool)

(declare-fun res!458156 () Bool)

(assert (=> b!693953 (=> (not res!458156) (not e!394763))))

(assert (=> b!693953 (= res!458156 e!394759)))

(declare-fun res!458163 () Bool)

(assert (=> b!693953 (=> res!458163 e!394759)))

(assert (=> b!693953 (= res!458163 e!394754)))

(declare-fun res!458153 () Bool)

(assert (=> b!693953 (=> (not res!458153) (not e!394754))))

(assert (=> b!693953 (= res!458153 (bvsgt from!3004 i!1382))))

(declare-fun b!693954 () Bool)

(declare-fun res!458167 () Bool)

(assert (=> b!693954 (=> (not res!458167) (not e!394753))))

(assert (=> b!693954 (= res!458167 e!394755)))

(declare-fun res!458148 () Bool)

(assert (=> b!693954 (=> res!458148 e!394755)))

(assert (=> b!693954 (= res!458148 e!394758)))

(declare-fun res!458154 () Bool)

(assert (=> b!693954 (=> (not res!458154) (not e!394758))))

(assert (=> b!693954 (= res!458154 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!62024 res!458158) b!693936))

(assert (= (and b!693936 res!458147) b!693946))

(assert (= (and b!693946 res!458150) b!693930))

(assert (= (and b!693930 res!458159) b!693953))

(assert (= (and b!693953 res!458153) b!693950))

(assert (= (and b!693953 (not res!458163)) b!693939))

(assert (= (and b!693939 res!458162) b!693949))

(assert (= (and b!693953 res!458156) b!693933))

(assert (= (and b!693933 res!458165) b!693952))

(assert (= (and b!693952 res!458169) b!693932))

(assert (= (and b!693932 res!458168) b!693940))

(assert (= (and b!693940 res!458152) b!693937))

(assert (= (and b!693937 res!458157) b!693934))

(assert (= (and b!693934 res!458164) b!693944))

(assert (= (and b!693944 res!458160) b!693947))

(assert (= (and b!693947 c!78258) b!693942))

(assert (= (and b!693947 (not c!78258)) b!693938))

(assert (= (and b!693947 res!458170) b!693931))

(assert (= (and b!693931 res!458149) b!693935))

(assert (= (and b!693935 res!458161) b!693945))

(assert (= (and b!693945 res!458155) b!693929))

(assert (= (and b!693929 res!458151) b!693954))

(assert (= (and b!693954 res!458154) b!693941))

(assert (= (and b!693954 (not res!458148)) b!693951))

(assert (= (and b!693951 res!458166) b!693943))

(assert (= (and b!693954 res!458167) b!693948))

(declare-fun m!655383 () Bool)

(assert (=> b!693944 m!655383))

(assert (=> b!693944 m!655383))

(declare-fun m!655385 () Bool)

(assert (=> b!693944 m!655385))

(declare-fun m!655387 () Bool)

(assert (=> b!693946 m!655387))

(declare-fun m!655389 () Bool)

(assert (=> b!693941 m!655389))

(declare-fun m!655391 () Bool)

(assert (=> b!693949 m!655391))

(declare-fun m!655393 () Bool)

(assert (=> b!693952 m!655393))

(declare-fun m!655395 () Bool)

(assert (=> b!693940 m!655395))

(assert (=> b!693950 m!655391))

(declare-fun m!655397 () Bool)

(assert (=> b!693935 m!655397))

(declare-fun m!655399 () Bool)

(assert (=> b!693936 m!655399))

(declare-fun m!655401 () Bool)

(assert (=> b!693937 m!655401))

(assert (=> b!693931 m!655383))

(assert (=> b!693931 m!655383))

(declare-fun m!655403 () Bool)

(assert (=> b!693931 m!655403))

(assert (=> b!693943 m!655389))

(declare-fun m!655405 () Bool)

(assert (=> b!693930 m!655405))

(declare-fun m!655407 () Bool)

(assert (=> b!693948 m!655407))

(declare-fun m!655409 () Bool)

(assert (=> b!693933 m!655409))

(declare-fun m!655411 () Bool)

(assert (=> b!693929 m!655411))

(declare-fun m!655413 () Bool)

(assert (=> start!62024 m!655413))

(declare-fun m!655415 () Bool)

(assert (=> b!693945 m!655415))

(assert (=> b!693947 m!655383))

(declare-fun m!655417 () Bool)

(assert (=> b!693942 m!655417))

(declare-fun m!655419 () Bool)

(assert (=> b!693942 m!655419))

(check-sat (not b!693931) (not b!693952) (not b!693935) (not b!693944) (not b!693937) (not b!693929) (not b!693936) (not b!693940) (not b!693930) (not start!62024) (not b!693933) (not b!693946) (not b!693943) (not b!693948) (not b!693945) (not b!693950) (not b!693949) (not b!693941) (not b!693942))
(check-sat)
