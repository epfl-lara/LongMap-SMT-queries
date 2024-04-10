; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62040 () Bool)

(assert start!62040)

(declare-fun b!694381 () Bool)

(declare-fun e!395013 () Bool)

(declare-datatypes ((List!13144 0))(
  ( (Nil!13141) (Cons!13140 (h!14185 (_ BitVec 64)) (t!19423 List!13144)) )
))
(declare-fun acc!681 () List!13144)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3721 (List!13144 (_ BitVec 64)) Bool)

(assert (=> b!694381 (= e!395013 (contains!3721 acc!681 k!2843))))

(declare-fun b!694382 () Bool)

(declare-fun e!395017 () Bool)

(declare-fun e!395018 () Bool)

(assert (=> b!694382 (= e!395017 e!395018)))

(declare-fun res!458443 () Bool)

(assert (=> b!694382 (=> (not res!458443) (not e!395018))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39881 0))(
  ( (array!39882 (arr!19103 (Array (_ BitVec 32) (_ BitVec 64))) (size!19488 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39881)

(assert (=> b!694382 (= res!458443 (not (= (select (arr!19103 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!24530 0))(
  ( (Unit!24531) )
))
(declare-fun lt!316899 () Unit!24530)

(declare-fun e!395019 () Unit!24530)

(assert (=> b!694382 (= lt!316899 e!395019)))

(declare-fun c!78344 () Bool)

(assert (=> b!694382 (= c!78344 (= (select (arr!19103 a!3626) from!3004) k!2843))))

(declare-fun b!694383 () Bool)

(declare-fun res!458446 () Bool)

(assert (=> b!694383 (=> (not res!458446) (not e!395017))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!694383 (= res!458446 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19488 a!3626))))))

(declare-fun b!694384 () Bool)

(declare-fun res!458436 () Bool)

(assert (=> b!694384 (=> (not res!458436) (not e!395017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!694384 (= res!458436 (validKeyInArray!0 k!2843))))

(declare-fun res!458429 () Bool)

(assert (=> start!62040 (=> (not res!458429) (not e!395017))))

(assert (=> start!62040 (= res!458429 (and (bvslt (size!19488 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19488 a!3626))))))

(assert (=> start!62040 e!395017))

(assert (=> start!62040 true))

(declare-fun array_inv!14899 (array!39881) Bool)

(assert (=> start!62040 (array_inv!14899 a!3626)))

(declare-fun b!694385 () Bool)

(declare-fun res!458445 () Bool)

(assert (=> b!694385 (=> (not res!458445) (not e!395017))))

(declare-fun e!395012 () Bool)

(assert (=> b!694385 (= res!458445 e!395012)))

(declare-fun res!458438 () Bool)

(assert (=> b!694385 (=> res!458438 e!395012)))

(assert (=> b!694385 (= res!458438 e!395013)))

(declare-fun res!458435 () Bool)

(assert (=> b!694385 (=> (not res!458435) (not e!395013))))

(assert (=> b!694385 (= res!458435 (bvsgt from!3004 i!1382))))

(declare-fun b!694386 () Bool)

(declare-fun res!458437 () Bool)

(assert (=> b!694386 (=> (not res!458437) (not e!395017))))

(declare-fun arrayContainsKey!0 (array!39881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!694386 (= res!458437 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!694387 () Bool)

(declare-fun res!458439 () Bool)

(assert (=> b!694387 (=> (not res!458439) (not e!395017))))

(assert (=> b!694387 (= res!458439 (not (contains!3721 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694388 () Bool)

(declare-fun e!395015 () Bool)

(assert (=> b!694388 (= e!395015 (not (contains!3721 acc!681 k!2843)))))

(declare-fun b!694389 () Bool)

(declare-fun res!458441 () Bool)

(assert (=> b!694389 (=> (not res!458441) (not e!395017))))

(assert (=> b!694389 (= res!458441 (validKeyInArray!0 (select (arr!19103 a!3626) from!3004)))))

(declare-fun b!694390 () Bool)

(declare-fun e!395011 () Bool)

(assert (=> b!694390 (= e!395011 false)))

(declare-fun lt!316897 () List!13144)

(declare-fun lt!316898 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39881 (_ BitVec 32) List!13144) Bool)

(assert (=> b!694390 (= lt!316898 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316897))))

(declare-fun b!694391 () Bool)

(declare-fun res!458434 () Bool)

(assert (=> b!694391 (=> (not res!458434) (not e!395017))))

(assert (=> b!694391 (= res!458434 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13141))))

(declare-fun b!694392 () Bool)

(declare-fun res!458447 () Bool)

(assert (=> b!694392 (=> (not res!458447) (not e!395017))))

(assert (=> b!694392 (= res!458447 (not (contains!3721 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694393 () Bool)

(declare-fun e!395010 () Bool)

(assert (=> b!694393 (= e!395010 (contains!3721 lt!316897 k!2843))))

(declare-fun b!694394 () Bool)

(declare-fun Unit!24532 () Unit!24530)

(assert (=> b!694394 (= e!395019 Unit!24532)))

(declare-fun b!694395 () Bool)

(declare-fun Unit!24533 () Unit!24530)

(assert (=> b!694395 (= e!395019 Unit!24533)))

(assert (=> b!694395 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316900 () Unit!24530)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39881 (_ BitVec 64) (_ BitVec 32)) Unit!24530)

(assert (=> b!694395 (= lt!316900 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!694395 false))

(declare-fun b!694396 () Bool)

(declare-fun res!458433 () Bool)

(assert (=> b!694396 (=> (not res!458433) (not e!395017))))

(declare-fun noDuplicate!968 (List!13144) Bool)

(assert (=> b!694396 (= res!458433 (noDuplicate!968 acc!681))))

(declare-fun b!694397 () Bool)

(declare-fun res!458432 () Bool)

(assert (=> b!694397 (=> (not res!458432) (not e!395011))))

(assert (=> b!694397 (= res!458432 (noDuplicate!968 lt!316897))))

(declare-fun b!694398 () Bool)

(declare-fun res!458428 () Bool)

(assert (=> b!694398 (=> (not res!458428) (not e!395017))))

(assert (=> b!694398 (= res!458428 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19488 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!694399 () Bool)

(assert (=> b!694399 (= e!395012 e!395015)))

(declare-fun res!458450 () Bool)

(assert (=> b!694399 (=> (not res!458450) (not e!395015))))

(assert (=> b!694399 (= res!458450 (bvsle from!3004 i!1382))))

(declare-fun b!694400 () Bool)

(declare-fun e!395016 () Bool)

(assert (=> b!694400 (= e!395016 (not (contains!3721 lt!316897 k!2843)))))

(declare-fun b!694401 () Bool)

(declare-fun e!395009 () Bool)

(assert (=> b!694401 (= e!395009 e!395016)))

(declare-fun res!458448 () Bool)

(assert (=> b!694401 (=> (not res!458448) (not e!395016))))

(assert (=> b!694401 (= res!458448 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694402 () Bool)

(declare-fun res!458442 () Bool)

(assert (=> b!694402 (=> (not res!458442) (not e!395011))))

(assert (=> b!694402 (= res!458442 (not (contains!3721 lt!316897 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694403 () Bool)

(assert (=> b!694403 (= e!395018 e!395011)))

(declare-fun res!458440 () Bool)

(assert (=> b!694403 (=> (not res!458440) (not e!395011))))

(assert (=> b!694403 (= res!458440 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!433 (List!13144 (_ BitVec 64)) List!13144)

(assert (=> b!694403 (= lt!316897 ($colon$colon!433 acc!681 (select (arr!19103 a!3626) from!3004)))))

(declare-fun b!694404 () Bool)

(declare-fun res!458449 () Bool)

(assert (=> b!694404 (=> (not res!458449) (not e!395011))))

(assert (=> b!694404 (= res!458449 (not (contains!3721 lt!316897 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!694405 () Bool)

(declare-fun res!458427 () Bool)

(assert (=> b!694405 (=> (not res!458427) (not e!395011))))

(assert (=> b!694405 (= res!458427 e!395009)))

(declare-fun res!458431 () Bool)

(assert (=> b!694405 (=> res!458431 e!395009)))

(assert (=> b!694405 (= res!458431 e!395010)))

(declare-fun res!458444 () Bool)

(assert (=> b!694405 (=> (not res!458444) (not e!395010))))

(assert (=> b!694405 (= res!458444 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!694406 () Bool)

(declare-fun res!458430 () Bool)

(assert (=> b!694406 (=> (not res!458430) (not e!395017))))

(assert (=> b!694406 (= res!458430 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!62040 res!458429) b!694396))

(assert (= (and b!694396 res!458433) b!694387))

(assert (= (and b!694387 res!458439) b!694392))

(assert (= (and b!694392 res!458447) b!694385))

(assert (= (and b!694385 res!458435) b!694381))

(assert (= (and b!694385 (not res!458438)) b!694399))

(assert (= (and b!694399 res!458450) b!694388))

(assert (= (and b!694385 res!458445) b!694391))

(assert (= (and b!694391 res!458434) b!694406))

(assert (= (and b!694406 res!458430) b!694383))

(assert (= (and b!694383 res!458446) b!694384))

(assert (= (and b!694384 res!458436) b!694386))

(assert (= (and b!694386 res!458437) b!694398))

(assert (= (and b!694398 res!458428) b!694389))

(assert (= (and b!694389 res!458441) b!694382))

(assert (= (and b!694382 c!78344) b!694395))

(assert (= (and b!694382 (not c!78344)) b!694394))

(assert (= (and b!694382 res!458443) b!694403))

(assert (= (and b!694403 res!458440) b!694397))

(assert (= (and b!694397 res!458432) b!694404))

(assert (= (and b!694404 res!458449) b!694402))

(assert (= (and b!694402 res!458442) b!694405))

(assert (= (and b!694405 res!458444) b!694393))

(assert (= (and b!694405 (not res!458431)) b!694401))

(assert (= (and b!694401 res!458448) b!694400))

(assert (= (and b!694405 res!458427) b!694390))

(declare-fun m!656241 () Bool)

(assert (=> b!694404 m!656241))

(declare-fun m!656243 () Bool)

(assert (=> b!694386 m!656243))

(declare-fun m!656245 () Bool)

(assert (=> b!694393 m!656245))

(assert (=> b!694400 m!656245))

(declare-fun m!656247 () Bool)

(assert (=> b!694402 m!656247))

(declare-fun m!656249 () Bool)

(assert (=> b!694384 m!656249))

(declare-fun m!656251 () Bool)

(assert (=> b!694387 m!656251))

(declare-fun m!656253 () Bool)

(assert (=> b!694388 m!656253))

(declare-fun m!656255 () Bool)

(assert (=> start!62040 m!656255))

(declare-fun m!656257 () Bool)

(assert (=> b!694382 m!656257))

(declare-fun m!656259 () Bool)

(assert (=> b!694406 m!656259))

(declare-fun m!656261 () Bool)

(assert (=> b!694390 m!656261))

(declare-fun m!656263 () Bool)

(assert (=> b!694396 m!656263))

(assert (=> b!694381 m!656253))

(declare-fun m!656265 () Bool)

(assert (=> b!694392 m!656265))

(assert (=> b!694389 m!656257))

(assert (=> b!694389 m!656257))

(declare-fun m!656267 () Bool)

(assert (=> b!694389 m!656267))

(assert (=> b!694403 m!656257))

(assert (=> b!694403 m!656257))

(declare-fun m!656269 () Bool)

(assert (=> b!694403 m!656269))

(declare-fun m!656271 () Bool)

(assert (=> b!694395 m!656271))

(declare-fun m!656273 () Bool)

(assert (=> b!694395 m!656273))

(declare-fun m!656275 () Bool)

(assert (=> b!694391 m!656275))

(declare-fun m!656277 () Bool)

(assert (=> b!694397 m!656277))

(push 1)

