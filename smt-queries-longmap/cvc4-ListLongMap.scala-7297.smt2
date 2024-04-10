; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93244 () Bool)

(assert start!93244)

(declare-fun b!1057212 () Bool)

(declare-fun e!601196 () Bool)

(declare-fun e!601200 () Bool)

(assert (=> b!1057212 (= e!601196 (not e!601200))))

(declare-fun res!705912 () Bool)

(assert (=> b!1057212 (=> res!705912 e!601200)))

(declare-fun lt!466353 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057212 (= res!705912 (or (bvsgt lt!466353 i!1381) (bvsle i!1381 lt!466353)))))

(declare-fun e!601201 () Bool)

(assert (=> b!1057212 e!601201))

(declare-fun res!705913 () Bool)

(assert (=> b!1057212 (=> (not res!705913) (not e!601201))))

(declare-datatypes ((array!66682 0))(
  ( (array!66683 (arr!32064 (Array (_ BitVec 32) (_ BitVec 64))) (size!32600 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66682)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1057212 (= res!705913 (= (select (store (arr!32064 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466353) k!2747))))

(declare-fun b!1057213 () Bool)

(declare-fun res!705918 () Bool)

(declare-fun e!601197 () Bool)

(assert (=> b!1057213 (=> (not res!705918) (not e!601197))))

(assert (=> b!1057213 (= res!705918 (= (select (arr!32064 a!3488) i!1381) k!2747))))

(declare-fun b!1057214 () Bool)

(declare-fun e!601199 () Bool)

(declare-fun arrayContainsKey!0 (array!66682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057214 (= e!601199 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057215 () Bool)

(declare-fun res!705919 () Bool)

(assert (=> b!1057215 (=> (not res!705919) (not e!601197))))

(declare-datatypes ((List!22376 0))(
  ( (Nil!22373) (Cons!22372 (h!23581 (_ BitVec 64)) (t!31683 List!22376)) )
))
(declare-fun arrayNoDuplicates!0 (array!66682 (_ BitVec 32) List!22376) Bool)

(assert (=> b!1057215 (= res!705919 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22373))))

(declare-fun b!1057217 () Bool)

(declare-fun res!705920 () Bool)

(assert (=> b!1057217 (=> (not res!705920) (not e!601197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057217 (= res!705920 (validKeyInArray!0 k!2747))))

(declare-fun b!1057218 () Bool)

(assert (=> b!1057218 (= e!601201 e!601199)))

(declare-fun res!705917 () Bool)

(assert (=> b!1057218 (=> res!705917 e!601199)))

(assert (=> b!1057218 (= res!705917 (or (bvsgt lt!466353 i!1381) (bvsle i!1381 lt!466353)))))

(declare-fun b!1057219 () Bool)

(declare-fun e!601195 () Bool)

(assert (=> b!1057219 (= e!601197 e!601195)))

(declare-fun res!705914 () Bool)

(assert (=> b!1057219 (=> (not res!705914) (not e!601195))))

(declare-fun lt!466350 () array!66682)

(assert (=> b!1057219 (= res!705914 (arrayContainsKey!0 lt!466350 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057219 (= lt!466350 (array!66683 (store (arr!32064 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32600 a!3488)))))

(declare-fun b!1057220 () Bool)

(assert (=> b!1057220 (= e!601195 e!601196)))

(declare-fun res!705916 () Bool)

(assert (=> b!1057220 (=> (not res!705916) (not e!601196))))

(assert (=> b!1057220 (= res!705916 (not (= lt!466353 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66682 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057220 (= lt!466353 (arrayScanForKey!0 lt!466350 k!2747 #b00000000000000000000000000000000))))

(declare-fun res!705915 () Bool)

(assert (=> start!93244 (=> (not res!705915) (not e!601197))))

(assert (=> start!93244 (= res!705915 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32600 a!3488)) (bvslt (size!32600 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93244 e!601197))

(assert (=> start!93244 true))

(declare-fun array_inv!24844 (array!66682) Bool)

(assert (=> start!93244 (array_inv!24844 a!3488)))

(declare-fun b!1057216 () Bool)

(assert (=> b!1057216 (= e!601200 true)))

(declare-fun lt!466352 () (_ BitVec 32))

(assert (=> b!1057216 (arrayContainsKey!0 a!3488 k!2747 lt!466352)))

(declare-datatypes ((Unit!34650 0))(
  ( (Unit!34651) )
))
(declare-fun lt!466349 () Unit!34650)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66682 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34650)

(assert (=> b!1057216 (= lt!466349 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466352))))

(assert (=> b!1057216 (= lt!466352 (bvadd #b00000000000000000000000000000001 lt!466353))))

(assert (=> b!1057216 (arrayNoDuplicates!0 a!3488 lt!466353 Nil!22373)))

(declare-fun lt!466351 () Unit!34650)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66682 (_ BitVec 32) (_ BitVec 32)) Unit!34650)

(assert (=> b!1057216 (= lt!466351 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466353))))

(assert (= (and start!93244 res!705915) b!1057215))

(assert (= (and b!1057215 res!705919) b!1057217))

(assert (= (and b!1057217 res!705920) b!1057213))

(assert (= (and b!1057213 res!705918) b!1057219))

(assert (= (and b!1057219 res!705914) b!1057220))

(assert (= (and b!1057220 res!705916) b!1057212))

(assert (= (and b!1057212 res!705913) b!1057218))

(assert (= (and b!1057218 (not res!705917)) b!1057214))

(assert (= (and b!1057212 (not res!705912)) b!1057216))

(declare-fun m!976917 () Bool)

(assert (=> b!1057214 m!976917))

(declare-fun m!976919 () Bool)

(assert (=> b!1057217 m!976919))

(declare-fun m!976921 () Bool)

(assert (=> b!1057213 m!976921))

(declare-fun m!976923 () Bool)

(assert (=> start!93244 m!976923))

(declare-fun m!976925 () Bool)

(assert (=> b!1057215 m!976925))

(declare-fun m!976927 () Bool)

(assert (=> b!1057220 m!976927))

(declare-fun m!976929 () Bool)

(assert (=> b!1057219 m!976929))

(declare-fun m!976931 () Bool)

(assert (=> b!1057219 m!976931))

(assert (=> b!1057212 m!976931))

(declare-fun m!976933 () Bool)

(assert (=> b!1057212 m!976933))

(declare-fun m!976935 () Bool)

(assert (=> b!1057216 m!976935))

(declare-fun m!976937 () Bool)

(assert (=> b!1057216 m!976937))

(declare-fun m!976939 () Bool)

(assert (=> b!1057216 m!976939))

(declare-fun m!976941 () Bool)

(assert (=> b!1057216 m!976941))

(push 1)

(assert (not b!1057217))

