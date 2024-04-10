; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93246 () Bool)

(assert start!93246)

(declare-fun b!1057239 () Bool)

(declare-fun e!601216 () Bool)

(declare-fun e!601217 () Bool)

(assert (=> b!1057239 (= e!601216 e!601217)))

(declare-fun res!705943 () Bool)

(assert (=> b!1057239 (=> (not res!705943) (not e!601217))))

(declare-fun lt!466366 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057239 (= res!705943 (not (= lt!466366 i!1381)))))

(declare-datatypes ((array!66684 0))(
  ( (array!66685 (arr!32065 (Array (_ BitVec 32) (_ BitVec 64))) (size!32601 (_ BitVec 32))) )
))
(declare-fun lt!466365 () array!66684)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66684 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057239 (= lt!466366 (arrayScanForKey!0 lt!466365 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057240 () Bool)

(declare-fun res!705945 () Bool)

(declare-fun e!601218 () Bool)

(assert (=> b!1057240 (=> (not res!705945) (not e!601218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057240 (= res!705945 (validKeyInArray!0 k!2747))))

(declare-fun b!1057241 () Bool)

(declare-fun res!705944 () Bool)

(assert (=> b!1057241 (=> (not res!705944) (not e!601218))))

(declare-fun a!3488 () array!66684)

(declare-datatypes ((List!22377 0))(
  ( (Nil!22374) (Cons!22373 (h!23582 (_ BitVec 64)) (t!31684 List!22377)) )
))
(declare-fun arrayNoDuplicates!0 (array!66684 (_ BitVec 32) List!22377) Bool)

(assert (=> b!1057241 (= res!705944 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22374))))

(declare-fun b!1057242 () Bool)

(declare-fun e!601222 () Bool)

(assert (=> b!1057242 (= e!601222 true)))

(declare-fun lt!466364 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057242 (arrayContainsKey!0 a!3488 k!2747 lt!466364)))

(declare-datatypes ((Unit!34652 0))(
  ( (Unit!34653) )
))
(declare-fun lt!466367 () Unit!34652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66684 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34652)

(assert (=> b!1057242 (= lt!466367 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466364))))

(assert (=> b!1057242 (= lt!466364 (bvadd #b00000000000000000000000000000001 lt!466366))))

(assert (=> b!1057242 (arrayNoDuplicates!0 a!3488 lt!466366 Nil!22374)))

(declare-fun lt!466368 () Unit!34652)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66684 (_ BitVec 32) (_ BitVec 32)) Unit!34652)

(assert (=> b!1057242 (= lt!466368 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466366))))

(declare-fun b!1057243 () Bool)

(declare-fun e!601220 () Bool)

(declare-fun e!601221 () Bool)

(assert (=> b!1057243 (= e!601220 e!601221)))

(declare-fun res!705946 () Bool)

(assert (=> b!1057243 (=> res!705946 e!601221)))

(assert (=> b!1057243 (= res!705946 (or (bvsgt lt!466366 i!1381) (bvsle i!1381 lt!466366)))))

(declare-fun b!1057244 () Bool)

(declare-fun res!705942 () Bool)

(assert (=> b!1057244 (=> (not res!705942) (not e!601218))))

(assert (=> b!1057244 (= res!705942 (= (select (arr!32065 a!3488) i!1381) k!2747))))

(declare-fun b!1057245 () Bool)

(assert (=> b!1057245 (= e!601221 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057247 () Bool)

(assert (=> b!1057247 (= e!601217 (not e!601222))))

(declare-fun res!705947 () Bool)

(assert (=> b!1057247 (=> res!705947 e!601222)))

(assert (=> b!1057247 (= res!705947 (or (bvsgt lt!466366 i!1381) (bvsle i!1381 lt!466366)))))

(assert (=> b!1057247 e!601220))

(declare-fun res!705939 () Bool)

(assert (=> b!1057247 (=> (not res!705939) (not e!601220))))

(assert (=> b!1057247 (= res!705939 (= (select (store (arr!32065 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466366) k!2747))))

(declare-fun res!705941 () Bool)

(assert (=> start!93246 (=> (not res!705941) (not e!601218))))

(assert (=> start!93246 (= res!705941 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32601 a!3488)) (bvslt (size!32601 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93246 e!601218))

(assert (=> start!93246 true))

(declare-fun array_inv!24845 (array!66684) Bool)

(assert (=> start!93246 (array_inv!24845 a!3488)))

(declare-fun b!1057246 () Bool)

(assert (=> b!1057246 (= e!601218 e!601216)))

(declare-fun res!705940 () Bool)

(assert (=> b!1057246 (=> (not res!705940) (not e!601216))))

(assert (=> b!1057246 (= res!705940 (arrayContainsKey!0 lt!466365 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057246 (= lt!466365 (array!66685 (store (arr!32065 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32601 a!3488)))))

(assert (= (and start!93246 res!705941) b!1057241))

(assert (= (and b!1057241 res!705944) b!1057240))

(assert (= (and b!1057240 res!705945) b!1057244))

(assert (= (and b!1057244 res!705942) b!1057246))

(assert (= (and b!1057246 res!705940) b!1057239))

(assert (= (and b!1057239 res!705943) b!1057247))

(assert (= (and b!1057247 res!705939) b!1057243))

(assert (= (and b!1057243 (not res!705946)) b!1057245))

(assert (= (and b!1057247 (not res!705947)) b!1057242))

(declare-fun m!976943 () Bool)

(assert (=> b!1057239 m!976943))

(declare-fun m!976945 () Bool)

(assert (=> b!1057240 m!976945))

(declare-fun m!976947 () Bool)

(assert (=> b!1057247 m!976947))

(declare-fun m!976949 () Bool)

(assert (=> b!1057247 m!976949))

(declare-fun m!976951 () Bool)

(assert (=> b!1057244 m!976951))

(declare-fun m!976953 () Bool)

(assert (=> start!93246 m!976953))

(declare-fun m!976955 () Bool)

(assert (=> b!1057241 m!976955))

(declare-fun m!976957 () Bool)

(assert (=> b!1057246 m!976957))

(assert (=> b!1057246 m!976947))

(declare-fun m!976959 () Bool)

(assert (=> b!1057245 m!976959))

(declare-fun m!976961 () Bool)

(assert (=> b!1057242 m!976961))

(declare-fun m!976963 () Bool)

(assert (=> b!1057242 m!976963))

(declare-fun m!976965 () Bool)

(assert (=> b!1057242 m!976965))

(declare-fun m!976967 () Bool)

(assert (=> b!1057242 m!976967))

(push 1)

