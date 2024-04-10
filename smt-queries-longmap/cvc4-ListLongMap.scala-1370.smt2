; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26920 () Bool)

(assert start!26920)

(declare-fun b!279041 () Bool)

(declare-fun e!177904 () Bool)

(declare-datatypes ((List!4397 0))(
  ( (Nil!4394) (Cons!4393 (h!5063 (_ BitVec 64)) (t!9479 List!4397)) )
))
(declare-fun noDuplicate!151 (List!4397) Bool)

(assert (=> b!279041 (= e!177904 (not (noDuplicate!151 Nil!4394)))))

(declare-fun b!279042 () Bool)

(declare-fun res!142382 () Bool)

(assert (=> b!279042 (=> (not res!142382) (not e!177904))))

(declare-datatypes ((array!13885 0))(
  ( (array!13886 (arr!6589 (Array (_ BitVec 32) (_ BitVec 64))) (size!6941 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13885)

(assert (=> b!279042 (= res!142382 (and (bvslt (size!6941 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6941 a!3325))))))

(declare-fun b!279043 () Bool)

(declare-fun res!142385 () Bool)

(declare-fun e!177905 () Bool)

(assert (=> b!279043 (=> (not res!142385) (not e!177905))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279043 (= res!142385 (validKeyInArray!0 k!2581))))

(declare-fun b!279044 () Bool)

(assert (=> b!279044 (= e!177905 e!177904)))

(declare-fun res!142383 () Bool)

(assert (=> b!279044 (=> (not res!142383) (not e!177904))))

(declare-datatypes ((SeekEntryResult!1747 0))(
  ( (MissingZero!1747 (index!9158 (_ BitVec 32))) (Found!1747 (index!9159 (_ BitVec 32))) (Intermediate!1747 (undefined!2559 Bool) (index!9160 (_ BitVec 32)) (x!27401 (_ BitVec 32))) (Undefined!1747) (MissingVacant!1747 (index!9161 (_ BitVec 32))) )
))
(declare-fun lt!138526 () SeekEntryResult!1747)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279044 (= res!142383 (or (= lt!138526 (MissingZero!1747 i!1267)) (= lt!138526 (MissingVacant!1747 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13885 (_ BitVec 32)) SeekEntryResult!1747)

(assert (=> b!279044 (= lt!138526 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!279045 () Bool)

(declare-fun res!142387 () Bool)

(assert (=> b!279045 (=> (not res!142387) (not e!177905))))

(declare-fun arrayContainsKey!0 (array!13885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279045 (= res!142387 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279046 () Bool)

(declare-fun res!142380 () Bool)

(assert (=> b!279046 (=> (not res!142380) (not e!177904))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!279046 (= res!142380 (validKeyInArray!0 (select (arr!6589 a!3325) startIndex!26)))))

(declare-fun b!279047 () Bool)

(declare-fun res!142381 () Bool)

(assert (=> b!279047 (=> (not res!142381) (not e!177905))))

(assert (=> b!279047 (= res!142381 (and (= (size!6941 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6941 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6941 a!3325))))))

(declare-fun b!279048 () Bool)

(declare-fun res!142388 () Bool)

(assert (=> b!279048 (=> (not res!142388) (not e!177905))))

(declare-fun arrayNoDuplicates!0 (array!13885 (_ BitVec 32) List!4397) Bool)

(assert (=> b!279048 (= res!142388 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4394))))

(declare-fun res!142386 () Bool)

(assert (=> start!26920 (=> (not res!142386) (not e!177905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26920 (= res!142386 (validMask!0 mask!3868))))

(assert (=> start!26920 e!177905))

(declare-fun array_inv!4552 (array!13885) Bool)

(assert (=> start!26920 (array_inv!4552 a!3325)))

(assert (=> start!26920 true))

(declare-fun b!279049 () Bool)

(declare-fun res!142384 () Bool)

(assert (=> b!279049 (=> (not res!142384) (not e!177904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13885 (_ BitVec 32)) Bool)

(assert (=> b!279049 (= res!142384 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279050 () Bool)

(declare-fun res!142389 () Bool)

(assert (=> b!279050 (=> (not res!142389) (not e!177904))))

(assert (=> b!279050 (= res!142389 (not (= startIndex!26 i!1267)))))

(assert (= (and start!26920 res!142386) b!279047))

(assert (= (and b!279047 res!142381) b!279043))

(assert (= (and b!279043 res!142385) b!279048))

(assert (= (and b!279048 res!142388) b!279045))

(assert (= (and b!279045 res!142387) b!279044))

(assert (= (and b!279044 res!142383) b!279049))

(assert (= (and b!279049 res!142384) b!279050))

(assert (= (and b!279050 res!142389) b!279046))

(assert (= (and b!279046 res!142380) b!279042))

(assert (= (and b!279042 res!142382) b!279041))

(declare-fun m!293923 () Bool)

(assert (=> b!279046 m!293923))

(assert (=> b!279046 m!293923))

(declare-fun m!293925 () Bool)

(assert (=> b!279046 m!293925))

(declare-fun m!293927 () Bool)

(assert (=> b!279043 m!293927))

(declare-fun m!293929 () Bool)

(assert (=> b!279045 m!293929))

(declare-fun m!293931 () Bool)

(assert (=> start!26920 m!293931))

(declare-fun m!293933 () Bool)

(assert (=> start!26920 m!293933))

(declare-fun m!293935 () Bool)

(assert (=> b!279048 m!293935))

(declare-fun m!293937 () Bool)

(assert (=> b!279049 m!293937))

(declare-fun m!293939 () Bool)

(assert (=> b!279041 m!293939))

(declare-fun m!293941 () Bool)

(assert (=> b!279044 m!293941))

(push 1)

(assert (not b!279046))

(assert (not b!279041))

(assert (not b!279045))

(assert (not b!279049))

(assert (not b!279048))

(assert (not b!279043))

(assert (not b!279044))

(assert (not start!26920))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64987 () Bool)

(assert (=> d!64987 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26920 d!64987))

(declare-fun d!64997 () Bool)

(assert (=> d!64997 (= (array_inv!4552 a!3325) (bvsge (size!6941 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26920 d!64997))

(declare-fun b!279077 () Bool)

(declare-fun e!177928 () Bool)

(declare-fun e!177931 () Bool)

(assert (=> b!279077 (= e!177928 e!177931)))

(declare-fun c!45887 () Bool)

(assert (=> b!279077 (= c!45887 (validKeyInArray!0 (select (arr!6589 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64999 () Bool)

(declare-fun res!142409 () Bool)

(declare-fun e!177929 () Bool)

(assert (=> d!64999 (=> res!142409 e!177929)))

(assert (=> d!64999 (= res!142409 (bvsge #b00000000000000000000000000000000 (size!6941 a!3325)))))

(assert (=> d!64999 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4394) e!177929)))

(declare-fun b!279078 () Bool)

(assert (=> b!279078 (= e!177929 e!177928)))

(declare-fun res!142410 () Bool)

(assert (=> b!279078 (=> (not res!142410) (not e!177928))))

(declare-fun e!177930 () Bool)

(assert (=> b!279078 (= res!142410 (not e!177930))))

(declare-fun res!142408 () Bool)

(assert (=> b!279078 (=> (not res!142408) (not e!177930))))

(assert (=> b!279078 (= res!142408 (validKeyInArray!0 (select (arr!6589 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25407 () Bool)

(declare-fun call!25410 () Bool)

(assert (=> bm!25407 (= call!25410 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45887 (Cons!4393 (select (arr!6589 a!3325) #b00000000000000000000000000000000) Nil!4394) Nil!4394)))))

(declare-fun b!279079 () Bool)

(assert (=> b!279079 (= e!177931 call!25410)))

(declare-fun b!279080 () Bool)

(declare-fun contains!1969 (List!4397 (_ BitVec 64)) Bool)

(assert (=> b!279080 (= e!177930 (contains!1969 Nil!4394 (select (arr!6589 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279081 () Bool)

(assert (=> b!279081 (= e!177931 call!25410)))

(assert (= (and d!64999 (not res!142409)) b!279078))

(assert (= (and b!279078 res!142408) b!279080))

(assert (= (and b!279078 res!142410) b!279077))

(assert (= (and b!279077 c!45887) b!279081))

(assert (= (and b!279077 (not c!45887)) b!279079))

(assert (= (or b!279081 b!279079) bm!25407))

(declare-fun m!293947 () Bool)

(assert (=> b!279077 m!293947))

(assert (=> b!279077 m!293947))

(declare-fun m!293949 () Bool)

(assert (=> b!279077 m!293949))

(assert (=> b!279078 m!293947))

(assert (=> b!279078 m!293947))

(assert (=> b!279078 m!293949))

(assert (=> bm!25407 m!293947))

(declare-fun m!293951 () Bool)

(assert (=> bm!25407 m!293951))

(assert (=> b!279080 m!293947))

(assert (=> b!279080 m!293947))

(declare-fun m!293953 () Bool)

(assert (=> b!279080 m!293953))

(assert (=> b!279048 d!64999))

(declare-fun d!65005 () Bool)

(assert (=> d!65005 (= (validKeyInArray!0 k!2581) (and (not (= k!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279043 d!65005))

(declare-fun d!65007 () Bool)

(declare-fun res!142428 () Bool)

(declare-fun e!177964 () Bool)

(assert (=> d!65007 (=> res!142428 e!177964)))

(assert (=> d!65007 (= res!142428 (bvsge #b00000000000000000000000000000000 (size!6941 a!3325)))))

(assert (=> d!65007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177964)))

(declare-fun b!279127 () Bool)

(declare-fun e!177965 () Bool)

(declare-fun e!177963 () Bool)

(assert (=> b!279127 (= e!177965 e!177963)))

(declare-fun lt!138549 () (_ BitVec 64))

(assert (=> b!279127 (= lt!138549 (select (arr!6589 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8810 0))(
  ( (Unit!8811) )
))
(declare-fun lt!138548 () Unit!8810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13885 (_ BitVec 64) (_ BitVec 32)) Unit!8810)

(assert (=> b!279127 (= lt!138548 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138549 #b00000000000000000000000000000000))))

(assert (=> b!279127 (arrayContainsKey!0 a!3325 lt!138549 #b00000000000000000000000000000000)))

(declare-fun lt!138550 () Unit!8810)

(assert (=> b!279127 (= lt!138550 lt!138548)))

(declare-fun res!142429 () Bool)

(assert (=> b!279127 (= res!142429 (= (seekEntryOrOpen!0 (select (arr!6589 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1747 #b00000000000000000000000000000000)))))

(assert (=> b!279127 (=> (not res!142429) (not e!177963))))

(declare-fun bm!25411 () Bool)

(declare-fun call!25414 () Bool)

(assert (=> bm!25411 (= call!25414 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!279128 () Bool)

(assert (=> b!279128 (= e!177963 call!25414)))

(declare-fun b!279129 () Bool)

(assert (=> b!279129 (= e!177964 e!177965)))

(declare-fun c!45902 () Bool)

(assert (=> b!279129 (= c!45902 (validKeyInArray!0 (select (arr!6589 a!3325) #b00000000000000000000000000000000)))))

