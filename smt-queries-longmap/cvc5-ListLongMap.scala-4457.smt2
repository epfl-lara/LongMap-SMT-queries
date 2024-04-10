; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62036 () Bool)

(assert start!62036)

(declare-fun b!694225 () Bool)

(declare-fun e!394951 () Bool)

(declare-datatypes ((List!13142 0))(
  ( (Nil!13139) (Cons!13138 (h!14183 (_ BitVec 64)) (t!19421 List!13142)) )
))
(declare-fun lt!316873 () List!13142)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3719 (List!13142 (_ BitVec 64)) Bool)

(assert (=> b!694225 (= e!394951 (not (contains!3719 lt!316873 k!2843)))))

(declare-fun b!694226 () Bool)

(declare-fun res!458295 () Bool)

(declare-fun e!394953 () Bool)

(assert (=> b!694226 (=> (not res!458295) (not e!394953))))

(declare-fun acc!681 () List!13142)

(declare-fun noDuplicate!966 (List!13142) Bool)

(assert (=> b!694226 (= res!458295 (noDuplicate!966 acc!681))))

(declare-fun b!694227 () Bool)

(declare-fun e!394947 () Bool)

(assert (=> b!694227 (= e!394947 (contains!3719 acc!681 k!2843))))

(declare-fun b!694228 () Bool)

(declare-fun res!458287 () Bool)

(assert (=> b!694228 (=> (not res!458287) (not e!394953))))

(declare-datatypes ((array!39877 0))(
  ( (array!39878 (arr!19101 (Array (_ BitVec 32) (_ BitVec 64))) (size!19486 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39877)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39877 (_ BitVec 32) List!13142) Bool)

(assert (=> b!694228 (= res!458287 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!694229 () Bool)

(declare-fun res!458296 () Bool)

(assert (=> b!694229 (=> (not res!458296) (not e!394953))))

(assert (=> b!694229 (= res!458296 (not (contains!3719 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694230 () Bool)

(declare-fun res!458285 () Bool)

(assert (=> b!694230 (=> (not res!458285) (not e!394953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694230 (= res!458285 (validKeyInArray!0 (select (arr!19101 a!3626) from!3004)))))

(declare-fun b!694231 () Bool)

(declare-fun res!458304 () Bool)

(assert (=> b!694231 (=> (not res!458304) (not e!394953))))

(declare-fun arrayContainsKey!0 (array!39877 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694231 (= res!458304 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694232 () Bool)

(declare-fun e!394946 () Bool)

(assert (=> b!694232 (= e!394946 false)))

(declare-fun lt!316874 () Bool)

(assert (=> b!694232 (= lt!316874 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316873))))

(declare-fun b!694233 () Bool)

(declare-fun e!394950 () Bool)

(assert (=> b!694233 (= e!394950 (not (contains!3719 acc!681 k!2843)))))

(declare-fun b!694234 () Bool)

(declare-fun res!458301 () Bool)

(assert (=> b!694234 (=> (not res!458301) (not e!394946))))

(declare-fun e!394943 () Bool)

(assert (=> b!694234 (= res!458301 e!394943)))

(declare-fun res!458293 () Bool)

(assert (=> b!694234 (=> res!458293 e!394943)))

(declare-fun e!394948 () Bool)

(assert (=> b!694234 (= res!458293 e!394948)))

(declare-fun res!458292 () Bool)

(assert (=> b!694234 (=> (not res!458292) (not e!394948))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694234 (= res!458292 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694235 () Bool)

(declare-fun e!394949 () Bool)

(assert (=> b!694235 (= e!394953 e!394949)))

(declare-fun res!458302 () Bool)

(assert (=> b!694235 (=> (not res!458302) (not e!394949))))

(assert (=> b!694235 (= res!458302 (not (= (select (arr!19101 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!24522 0))(
  ( (Unit!24523) )
))
(declare-fun lt!316876 () Unit!24522)

(declare-fun e!394952 () Unit!24522)

(assert (=> b!694235 (= lt!316876 e!394952)))

(declare-fun c!78338 () Bool)

(assert (=> b!694235 (= c!78338 (= (select (arr!19101 a!3626) from!3004) k!2843))))

(declare-fun b!694236 () Bool)

(declare-fun res!458298 () Bool)

(assert (=> b!694236 (=> (not res!458298) (not e!394946))))

(assert (=> b!694236 (= res!458298 (noDuplicate!966 lt!316873))))

(declare-fun b!694237 () Bool)

(declare-fun res!458284 () Bool)

(assert (=> b!694237 (=> (not res!458284) (not e!394953))))

(assert (=> b!694237 (= res!458284 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13139))))

(declare-fun b!694238 () Bool)

(declare-fun res!458291 () Bool)

(assert (=> b!694238 (=> (not res!458291) (not e!394953))))

(assert (=> b!694238 (= res!458291 (validKeyInArray!0 k!2843))))

(declare-fun b!694239 () Bool)

(declare-fun Unit!24524 () Unit!24522)

(assert (=> b!694239 (= e!394952 Unit!24524)))

(assert (=> b!694239 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316875 () Unit!24522)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39877 (_ BitVec 64) (_ BitVec 32)) Unit!24522)

(assert (=> b!694239 (= lt!316875 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!694239 false))

(declare-fun b!694240 () Bool)

(declare-fun res!458300 () Bool)

(assert (=> b!694240 (=> (not res!458300) (not e!394953))))

(assert (=> b!694240 (= res!458300 (not (contains!3719 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694241 () Bool)

(declare-fun res!458283 () Bool)

(assert (=> b!694241 (=> (not res!458283) (not e!394953))))

(declare-fun e!394945 () Bool)

(assert (=> b!694241 (= res!458283 e!394945)))

(declare-fun res!458286 () Bool)

(assert (=> b!694241 (=> res!458286 e!394945)))

(assert (=> b!694241 (= res!458286 e!394947)))

(declare-fun res!458297 () Bool)

(assert (=> b!694241 (=> (not res!458297) (not e!394947))))

(assert (=> b!694241 (= res!458297 (bvsgt from!3004 i!1382))))

(declare-fun b!694242 () Bool)

(declare-fun res!458294 () Bool)

(assert (=> b!694242 (=> (not res!458294) (not e!394946))))

(assert (=> b!694242 (= res!458294 (not (contains!3719 lt!316873 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694243 () Bool)

(declare-fun res!458299 () Bool)

(assert (=> b!694243 (=> (not res!458299) (not e!394953))))

(assert (=> b!694243 (= res!458299 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19486 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694244 () Bool)

(assert (=> b!694244 (= e!394945 e!394950)))

(declare-fun res!458303 () Bool)

(assert (=> b!694244 (=> (not res!458303) (not e!394950))))

(assert (=> b!694244 (= res!458303 (bvsle from!3004 i!1382))))

(declare-fun b!694245 () Bool)

(assert (=> b!694245 (= e!394943 e!394951)))

(declare-fun res!458289 () Bool)

(assert (=> b!694245 (=> (not res!458289) (not e!394951))))

(assert (=> b!694245 (= res!458289 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694246 () Bool)

(declare-fun res!458305 () Bool)

(assert (=> b!694246 (=> (not res!458305) (not e!394946))))

(assert (=> b!694246 (= res!458305 (not (contains!3719 lt!316873 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694247 () Bool)

(declare-fun Unit!24525 () Unit!24522)

(assert (=> b!694247 (= e!394952 Unit!24525)))

(declare-fun b!694248 () Bool)

(assert (=> b!694248 (= e!394948 (contains!3719 lt!316873 k!2843))))

(declare-fun res!458306 () Bool)

(assert (=> start!62036 (=> (not res!458306) (not e!394953))))

(assert (=> start!62036 (= res!458306 (and (bvslt (size!19486 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19486 a!3626))))))

(assert (=> start!62036 e!394953))

(assert (=> start!62036 true))

(declare-fun array_inv!14897 (array!39877) Bool)

(assert (=> start!62036 (array_inv!14897 a!3626)))

(declare-fun b!694249 () Bool)

(declare-fun res!458288 () Bool)

(assert (=> b!694249 (=> (not res!458288) (not e!394953))))

(assert (=> b!694249 (= res!458288 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19486 a!3626))))))

(declare-fun b!694250 () Bool)

(assert (=> b!694250 (= e!394949 e!394946)))

(declare-fun res!458290 () Bool)

(assert (=> b!694250 (=> (not res!458290) (not e!394946))))

(assert (=> b!694250 (= res!458290 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!431 (List!13142 (_ BitVec 64)) List!13142)

(assert (=> b!694250 (= lt!316873 ($colon$colon!431 acc!681 (select (arr!19101 a!3626) from!3004)))))

(assert (= (and start!62036 res!458306) b!694226))

(assert (= (and b!694226 res!458295) b!694240))

(assert (= (and b!694240 res!458300) b!694229))

(assert (= (and b!694229 res!458296) b!694241))

(assert (= (and b!694241 res!458297) b!694227))

(assert (= (and b!694241 (not res!458286)) b!694244))

(assert (= (and b!694244 res!458303) b!694233))

(assert (= (and b!694241 res!458283) b!694237))

(assert (= (and b!694237 res!458284) b!694228))

(assert (= (and b!694228 res!458287) b!694249))

(assert (= (and b!694249 res!458288) b!694238))

(assert (= (and b!694238 res!458291) b!694231))

(assert (= (and b!694231 res!458304) b!694243))

(assert (= (and b!694243 res!458299) b!694230))

(assert (= (and b!694230 res!458285) b!694235))

(assert (= (and b!694235 c!78338) b!694239))

(assert (= (and b!694235 (not c!78338)) b!694247))

(assert (= (and b!694235 res!458302) b!694250))

(assert (= (and b!694250 res!458290) b!694236))

(assert (= (and b!694236 res!458298) b!694246))

(assert (= (and b!694246 res!458305) b!694242))

(assert (= (and b!694242 res!458294) b!694234))

(assert (= (and b!694234 res!458292) b!694248))

(assert (= (and b!694234 (not res!458293)) b!694245))

(assert (= (and b!694245 res!458289) b!694225))

(assert (= (and b!694234 res!458301) b!694232))

(declare-fun m!656165 () Bool)

(assert (=> b!694240 m!656165))

(declare-fun m!656167 () Bool)

(assert (=> b!694235 m!656167))

(declare-fun m!656169 () Bool)

(assert (=> b!694225 m!656169))

(declare-fun m!656171 () Bool)

(assert (=> b!694239 m!656171))

(declare-fun m!656173 () Bool)

(assert (=> b!694239 m!656173))

(declare-fun m!656175 () Bool)

(assert (=> b!694229 m!656175))

(declare-fun m!656177 () Bool)

(assert (=> b!694231 m!656177))

(declare-fun m!656179 () Bool)

(assert (=> b!694236 m!656179))

(declare-fun m!656181 () Bool)

(assert (=> b!694227 m!656181))

(declare-fun m!656183 () Bool)

(assert (=> b!694226 m!656183))

(declare-fun m!656185 () Bool)

(assert (=> b!694228 m!656185))

(declare-fun m!656187 () Bool)

(assert (=> b!694238 m!656187))

(assert (=> b!694250 m!656167))

(assert (=> b!694250 m!656167))

(declare-fun m!656189 () Bool)

(assert (=> b!694250 m!656189))

(declare-fun m!656191 () Bool)

(assert (=> b!694232 m!656191))

(assert (=> b!694233 m!656181))

(declare-fun m!656193 () Bool)

(assert (=> b!694246 m!656193))

(assert (=> b!694248 m!656169))

(assert (=> b!694230 m!656167))

(assert (=> b!694230 m!656167))

(declare-fun m!656195 () Bool)

(assert (=> b!694230 m!656195))

(declare-fun m!656197 () Bool)

(assert (=> b!694242 m!656197))

(declare-fun m!656199 () Bool)

(assert (=> b!694237 m!656199))

(declare-fun m!656201 () Bool)

(assert (=> start!62036 m!656201))

(push 1)

