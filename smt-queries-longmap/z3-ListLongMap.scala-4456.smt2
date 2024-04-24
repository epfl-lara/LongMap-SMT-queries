; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62088 () Bool)

(assert start!62088)

(declare-fun b!694215 () Bool)

(declare-fun res!458202 () Bool)

(declare-fun e!394993 () Bool)

(assert (=> b!694215 (=> (not res!458202) (not e!394993))))

(declare-fun e!394985 () Bool)

(assert (=> b!694215 (= res!458202 e!394985)))

(declare-fun res!458182 () Bool)

(assert (=> b!694215 (=> res!458182 e!394985)))

(declare-fun e!394992 () Bool)

(assert (=> b!694215 (= res!458182 e!394992)))

(declare-fun res!458190 () Bool)

(assert (=> b!694215 (=> (not res!458190) (not e!394992))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694215 (= res!458190 (bvsgt from!3004 i!1382))))

(declare-fun b!694216 () Bool)

(declare-fun e!394995 () Bool)

(declare-fun e!394986 () Bool)

(assert (=> b!694216 (= e!394995 e!394986)))

(declare-fun res!458187 () Bool)

(assert (=> b!694216 (=> (not res!458187) (not e!394986))))

(assert (=> b!694216 (= res!458187 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39867 0))(
  ( (array!39868 (arr!19093 (Array (_ BitVec 32) (_ BitVec 64))) (size!19476 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39867)

(declare-datatypes ((List!13041 0))(
  ( (Nil!13038) (Cons!13037 (h!14085 (_ BitVec 64)) (t!19312 List!13041)) )
))
(declare-fun lt!316939 () List!13041)

(declare-fun acc!681 () List!13041)

(declare-fun $colon$colon!425 (List!13041 (_ BitVec 64)) List!13041)

(assert (=> b!694216 (= lt!316939 ($colon$colon!425 acc!681 (select (arr!19093 a!3626) from!3004)))))

(declare-fun b!694217 () Bool)

(assert (=> b!694217 (= e!394993 e!394995)))

(declare-fun res!458184 () Bool)

(assert (=> b!694217 (=> (not res!458184) (not e!394995))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!694217 (= res!458184 (not (= (select (arr!19093 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!24489 0))(
  ( (Unit!24490) )
))
(declare-fun lt!316941 () Unit!24489)

(declare-fun e!394990 () Unit!24489)

(assert (=> b!694217 (= lt!316941 e!394990)))

(declare-fun c!78386 () Bool)

(assert (=> b!694217 (= c!78386 (= (select (arr!19093 a!3626) from!3004) k0!2843))))

(declare-fun b!694218 () Bool)

(declare-fun res!458193 () Bool)

(assert (=> b!694218 (=> (not res!458193) (not e!394993))))

(declare-fun arrayContainsKey!0 (array!39867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694218 (= res!458193 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694219 () Bool)

(declare-fun Unit!24491 () Unit!24489)

(assert (=> b!694219 (= e!394990 Unit!24491)))

(assert (=> b!694219 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316942 () Unit!24489)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39867 (_ BitVec 64) (_ BitVec 32)) Unit!24489)

(assert (=> b!694219 (= lt!316942 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!694219 false))

(declare-fun b!694220 () Bool)

(declare-fun e!394988 () Bool)

(declare-fun e!394987 () Bool)

(assert (=> b!694220 (= e!394988 e!394987)))

(declare-fun res!458195 () Bool)

(assert (=> b!694220 (=> (not res!458195) (not e!394987))))

(assert (=> b!694220 (= res!458195 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694221 () Bool)

(declare-fun res!458180 () Bool)

(assert (=> b!694221 (=> (not res!458180) (not e!394993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694221 (= res!458180 (validKeyInArray!0 k0!2843))))

(declare-fun res!458196 () Bool)

(assert (=> start!62088 (=> (not res!458196) (not e!394993))))

(assert (=> start!62088 (= res!458196 (and (bvslt (size!19476 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19476 a!3626))))))

(assert (=> start!62088 e!394993))

(assert (=> start!62088 true))

(declare-fun array_inv!14952 (array!39867) Bool)

(assert (=> start!62088 (array_inv!14952 a!3626)))

(declare-fun b!694222 () Bool)

(declare-fun res!458189 () Bool)

(assert (=> b!694222 (=> (not res!458189) (not e!394993))))

(declare-fun contains!3693 (List!13041 (_ BitVec 64)) Bool)

(assert (=> b!694222 (= res!458189 (not (contains!3693 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694223 () Bool)

(declare-fun res!458198 () Bool)

(assert (=> b!694223 (=> (not res!458198) (not e!394993))))

(declare-fun noDuplicate!967 (List!13041) Bool)

(assert (=> b!694223 (= res!458198 (noDuplicate!967 acc!681))))

(declare-fun b!694224 () Bool)

(declare-fun res!458181 () Bool)

(assert (=> b!694224 (=> (not res!458181) (not e!394993))))

(assert (=> b!694224 (= res!458181 (validKeyInArray!0 (select (arr!19093 a!3626) from!3004)))))

(declare-fun b!694225 () Bool)

(declare-fun res!458192 () Bool)

(assert (=> b!694225 (=> (not res!458192) (not e!394986))))

(assert (=> b!694225 (= res!458192 (not (contains!3693 lt!316939 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694226 () Bool)

(declare-fun res!458186 () Bool)

(assert (=> b!694226 (=> (not res!458186) (not e!394993))))

(declare-fun arrayNoDuplicates!0 (array!39867 (_ BitVec 32) List!13041) Bool)

(assert (=> b!694226 (= res!458186 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13038))))

(declare-fun b!694227 () Bool)

(declare-fun res!458203 () Bool)

(assert (=> b!694227 (=> (not res!458203) (not e!394993))))

(assert (=> b!694227 (= res!458203 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694228 () Bool)

(assert (=> b!694228 (= e!394992 (contains!3693 acc!681 k0!2843))))

(declare-fun b!694229 () Bool)

(assert (=> b!694229 (= e!394987 (not (contains!3693 lt!316939 k0!2843)))))

(declare-fun b!694230 () Bool)

(declare-fun res!458200 () Bool)

(assert (=> b!694230 (=> (not res!458200) (not e!394986))))

(assert (=> b!694230 (= res!458200 e!394988)))

(declare-fun res!458194 () Bool)

(assert (=> b!694230 (=> res!458194 e!394988)))

(declare-fun e!394989 () Bool)

(assert (=> b!694230 (= res!458194 e!394989)))

(declare-fun res!458191 () Bool)

(assert (=> b!694230 (=> (not res!458191) (not e!394989))))

(assert (=> b!694230 (= res!458191 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694231 () Bool)

(declare-fun Unit!24492 () Unit!24489)

(assert (=> b!694231 (= e!394990 Unit!24492)))

(declare-fun b!694232 () Bool)

(declare-fun res!458185 () Bool)

(assert (=> b!694232 (=> (not res!458185) (not e!394986))))

(assert (=> b!694232 (= res!458185 (noDuplicate!967 lt!316939))))

(declare-fun b!694233 () Bool)

(declare-fun res!458183 () Bool)

(assert (=> b!694233 (=> (not res!458183) (not e!394993))))

(assert (=> b!694233 (= res!458183 (not (contains!3693 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694234 () Bool)

(assert (=> b!694234 (= e!394989 (contains!3693 lt!316939 k0!2843))))

(declare-fun b!694235 () Bool)

(declare-fun res!458199 () Bool)

(assert (=> b!694235 (=> (not res!458199) (not e!394993))))

(assert (=> b!694235 (= res!458199 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19476 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694236 () Bool)

(assert (=> b!694236 (= e!394986 false)))

(declare-fun lt!316940 () Bool)

(assert (=> b!694236 (= lt!316940 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316939))))

(declare-fun b!694237 () Bool)

(declare-fun e!394994 () Bool)

(assert (=> b!694237 (= e!394994 (not (contains!3693 acc!681 k0!2843)))))

(declare-fun b!694238 () Bool)

(declare-fun res!458201 () Bool)

(assert (=> b!694238 (=> (not res!458201) (not e!394993))))

(assert (=> b!694238 (= res!458201 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19476 a!3626))))))

(declare-fun b!694239 () Bool)

(assert (=> b!694239 (= e!394985 e!394994)))

(declare-fun res!458197 () Bool)

(assert (=> b!694239 (=> (not res!458197) (not e!394994))))

(assert (=> b!694239 (= res!458197 (bvsle from!3004 i!1382))))

(declare-fun b!694240 () Bool)

(declare-fun res!458188 () Bool)

(assert (=> b!694240 (=> (not res!458188) (not e!394986))))

(assert (=> b!694240 (= res!458188 (not (contains!3693 lt!316939 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62088 res!458196) b!694223))

(assert (= (and b!694223 res!458198) b!694233))

(assert (= (and b!694233 res!458183) b!694222))

(assert (= (and b!694222 res!458189) b!694215))

(assert (= (and b!694215 res!458190) b!694228))

(assert (= (and b!694215 (not res!458182)) b!694239))

(assert (= (and b!694239 res!458197) b!694237))

(assert (= (and b!694215 res!458202) b!694226))

(assert (= (and b!694226 res!458186) b!694227))

(assert (= (and b!694227 res!458203) b!694238))

(assert (= (and b!694238 res!458201) b!694221))

(assert (= (and b!694221 res!458180) b!694218))

(assert (= (and b!694218 res!458193) b!694235))

(assert (= (and b!694235 res!458199) b!694224))

(assert (= (and b!694224 res!458181) b!694217))

(assert (= (and b!694217 c!78386) b!694219))

(assert (= (and b!694217 (not c!78386)) b!694231))

(assert (= (and b!694217 res!458184) b!694216))

(assert (= (and b!694216 res!458187) b!694232))

(assert (= (and b!694232 res!458185) b!694225))

(assert (= (and b!694225 res!458192) b!694240))

(assert (= (and b!694240 res!458188) b!694230))

(assert (= (and b!694230 res!458191) b!694234))

(assert (= (and b!694230 (not res!458194)) b!694220))

(assert (= (and b!694220 res!458195) b!694229))

(assert (= (and b!694230 res!458200) b!694236))

(declare-fun m!656749 () Bool)

(assert (=> b!694240 m!656749))

(declare-fun m!656751 () Bool)

(assert (=> b!694221 m!656751))

(declare-fun m!656753 () Bool)

(assert (=> b!694228 m!656753))

(assert (=> b!694237 m!656753))

(declare-fun m!656755 () Bool)

(assert (=> b!694227 m!656755))

(declare-fun m!656757 () Bool)

(assert (=> b!694234 m!656757))

(declare-fun m!656759 () Bool)

(assert (=> b!694224 m!656759))

(assert (=> b!694224 m!656759))

(declare-fun m!656761 () Bool)

(assert (=> b!694224 m!656761))

(declare-fun m!656763 () Bool)

(assert (=> b!694236 m!656763))

(declare-fun m!656765 () Bool)

(assert (=> b!694225 m!656765))

(declare-fun m!656767 () Bool)

(assert (=> b!694219 m!656767))

(declare-fun m!656769 () Bool)

(assert (=> b!694219 m!656769))

(assert (=> b!694217 m!656759))

(declare-fun m!656771 () Bool)

(assert (=> b!694226 m!656771))

(declare-fun m!656773 () Bool)

(assert (=> b!694222 m!656773))

(assert (=> b!694229 m!656757))

(assert (=> b!694216 m!656759))

(assert (=> b!694216 m!656759))

(declare-fun m!656775 () Bool)

(assert (=> b!694216 m!656775))

(declare-fun m!656777 () Bool)

(assert (=> b!694223 m!656777))

(declare-fun m!656779 () Bool)

(assert (=> b!694218 m!656779))

(declare-fun m!656781 () Bool)

(assert (=> b!694233 m!656781))

(declare-fun m!656783 () Bool)

(assert (=> start!62088 m!656783))

(declare-fun m!656785 () Bool)

(assert (=> b!694232 m!656785))

(check-sat (not b!694234) (not b!694229) (not b!694218) (not b!694222) (not b!694221) (not b!694216) (not b!694240) (not b!694227) (not b!694219) (not b!694223) (not b!694233) (not b!694226) (not b!694232) (not b!694236) (not start!62088) (not b!694225) (not b!694237) (not b!694228) (not b!694224))
(check-sat)
