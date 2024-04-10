; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92374 () Bool)

(assert start!92374)

(declare-fun b!1050258 () Bool)

(declare-fun res!699393 () Bool)

(declare-fun e!595959 () Bool)

(assert (=> b!1050258 (=> (not res!699393) (not e!595959))))

(declare-datatypes ((array!66175 0))(
  ( (array!66176 (arr!31827 (Array (_ BitVec 32) (_ BitVec 64))) (size!32363 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66175)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050258 (= res!699393 (= (select (arr!31827 a!3488) i!1381) k!2747))))

(declare-fun b!1050259 () Bool)

(declare-fun res!699388 () Bool)

(assert (=> b!1050259 (=> (not res!699388) (not e!595959))))

(declare-datatypes ((List!22139 0))(
  ( (Nil!22136) (Cons!22135 (h!23344 (_ BitVec 64)) (t!31446 List!22139)) )
))
(declare-fun arrayNoDuplicates!0 (array!66175 (_ BitVec 32) List!22139) Bool)

(assert (=> b!1050259 (= res!699388 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22136))))

(declare-fun b!1050260 () Bool)

(declare-fun res!699391 () Bool)

(assert (=> b!1050260 (=> (not res!699391) (not e!595959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050260 (= res!699391 (validKeyInArray!0 k!2747))))

(declare-fun b!1050261 () Bool)

(declare-fun e!595963 () Bool)

(declare-fun e!595966 () Bool)

(assert (=> b!1050261 (= e!595963 e!595966)))

(declare-fun res!699394 () Bool)

(assert (=> b!1050261 (=> res!699394 e!595966)))

(declare-fun lt!463856 () (_ BitVec 32))

(assert (=> b!1050261 (= res!699394 (bvsle lt!463856 i!1381))))

(declare-fun b!1050262 () Bool)

(declare-fun arrayContainsKey!0 (array!66175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050262 (= e!595966 (arrayContainsKey!0 a!3488 k!2747 lt!463856))))

(declare-fun res!699387 () Bool)

(assert (=> start!92374 (=> (not res!699387) (not e!595959))))

(assert (=> start!92374 (= res!699387 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32363 a!3488)) (bvslt (size!32363 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92374 e!595959))

(assert (=> start!92374 true))

(declare-fun array_inv!24607 (array!66175) Bool)

(assert (=> start!92374 (array_inv!24607 a!3488)))

(declare-fun b!1050263 () Bool)

(declare-fun e!595964 () Bool)

(assert (=> b!1050263 (= e!595959 e!595964)))

(declare-fun res!699392 () Bool)

(assert (=> b!1050263 (=> (not res!699392) (not e!595964))))

(declare-fun lt!463857 () array!66175)

(assert (=> b!1050263 (= res!699392 (arrayContainsKey!0 lt!463857 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050263 (= lt!463857 (array!66176 (store (arr!31827 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32363 a!3488)))))

(declare-fun b!1050264 () Bool)

(declare-fun e!595961 () Bool)

(assert (=> b!1050264 (= e!595961 true)))

(declare-fun lt!463853 () Bool)

(declare-fun contains!6132 (List!22139 (_ BitVec 64)) Bool)

(assert (=> b!1050264 (= lt!463853 (contains!6132 Nil!22136 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050265 () Bool)

(declare-fun res!699395 () Bool)

(assert (=> b!1050265 (=> res!699395 e!595961)))

(declare-fun noDuplicate!1517 (List!22139) Bool)

(assert (=> b!1050265 (= res!699395 (not (noDuplicate!1517 Nil!22136)))))

(declare-fun b!1050266 () Bool)

(declare-fun e!595962 () Bool)

(assert (=> b!1050266 (= e!595964 e!595962)))

(declare-fun res!699385 () Bool)

(assert (=> b!1050266 (=> (not res!699385) (not e!595962))))

(assert (=> b!1050266 (= res!699385 (not (= lt!463856 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66175 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050266 (= lt!463856 (arrayScanForKey!0 lt!463857 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050267 () Bool)

(declare-fun e!595965 () Bool)

(assert (=> b!1050267 (= e!595965 e!595961)))

(declare-fun res!699386 () Bool)

(assert (=> b!1050267 (=> res!699386 e!595961)))

(assert (=> b!1050267 (= res!699386 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32363 a!3488)))))

(assert (=> b!1050267 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34374 0))(
  ( (Unit!34375) )
))
(declare-fun lt!463855 () Unit!34374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66175 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34374)

(assert (=> b!1050267 (= lt!463855 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463856 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1050267 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22136)))

(declare-fun lt!463854 () Unit!34374)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66175 (_ BitVec 32) (_ BitVec 32)) Unit!34374)

(assert (=> b!1050267 (= lt!463854 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050268 () Bool)

(declare-fun res!699390 () Bool)

(assert (=> b!1050268 (=> res!699390 e!595961)))

(assert (=> b!1050268 (= res!699390 (contains!6132 Nil!22136 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050269 () Bool)

(assert (=> b!1050269 (= e!595962 (not e!595965))))

(declare-fun res!699389 () Bool)

(assert (=> b!1050269 (=> res!699389 e!595965)))

(assert (=> b!1050269 (= res!699389 (bvsle lt!463856 i!1381))))

(assert (=> b!1050269 e!595963))

(declare-fun res!699384 () Bool)

(assert (=> b!1050269 (=> (not res!699384) (not e!595963))))

(assert (=> b!1050269 (= res!699384 (= (select (store (arr!31827 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463856) k!2747))))

(assert (= (and start!92374 res!699387) b!1050259))

(assert (= (and b!1050259 res!699388) b!1050260))

(assert (= (and b!1050260 res!699391) b!1050258))

(assert (= (and b!1050258 res!699393) b!1050263))

(assert (= (and b!1050263 res!699392) b!1050266))

(assert (= (and b!1050266 res!699385) b!1050269))

(assert (= (and b!1050269 res!699384) b!1050261))

(assert (= (and b!1050261 (not res!699394)) b!1050262))

(assert (= (and b!1050269 (not res!699389)) b!1050267))

(assert (= (and b!1050267 (not res!699386)) b!1050265))

(assert (= (and b!1050265 (not res!699395)) b!1050268))

(assert (= (and b!1050268 (not res!699390)) b!1050264))

(declare-fun m!970929 () Bool)

(assert (=> b!1050258 m!970929))

(declare-fun m!970931 () Bool)

(assert (=> b!1050259 m!970931))

(declare-fun m!970933 () Bool)

(assert (=> b!1050263 m!970933))

(declare-fun m!970935 () Bool)

(assert (=> b!1050263 m!970935))

(declare-fun m!970937 () Bool)

(assert (=> b!1050267 m!970937))

(declare-fun m!970939 () Bool)

(assert (=> b!1050267 m!970939))

(declare-fun m!970941 () Bool)

(assert (=> b!1050267 m!970941))

(declare-fun m!970943 () Bool)

(assert (=> b!1050267 m!970943))

(declare-fun m!970945 () Bool)

(assert (=> b!1050265 m!970945))

(declare-fun m!970947 () Bool)

(assert (=> b!1050264 m!970947))

(declare-fun m!970949 () Bool)

(assert (=> b!1050262 m!970949))

(assert (=> b!1050269 m!970935))

(declare-fun m!970951 () Bool)

(assert (=> b!1050269 m!970951))

(declare-fun m!970953 () Bool)

(assert (=> b!1050260 m!970953))

(declare-fun m!970955 () Bool)

(assert (=> b!1050266 m!970955))

(declare-fun m!970957 () Bool)

(assert (=> start!92374 m!970957))

(declare-fun m!970959 () Bool)

(assert (=> b!1050268 m!970959))

(push 1)

(assert (not start!92374))

(assert (not b!1050262))

(assert (not b!1050263))

(assert (not b!1050259))

(assert (not b!1050266))

(assert (not b!1050260))

(assert (not b!1050267))

(assert (not b!1050268))

(assert (not b!1050265))

(assert (not b!1050264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

