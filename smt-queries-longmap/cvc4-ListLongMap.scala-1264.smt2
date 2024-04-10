; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26146 () Bool)

(assert start!26146)

(declare-fun b!269939 () Bool)

(declare-fun res!134040 () Bool)

(declare-fun e!174061 () Bool)

(assert (=> b!269939 (=> (not res!134040) (not e!174061))))

(declare-datatypes ((array!13243 0))(
  ( (array!13244 (arr!6271 (Array (_ BitVec 32) (_ BitVec 64))) (size!6623 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13243)

(declare-datatypes ((List!4079 0))(
  ( (Nil!4076) (Cons!4075 (h!4742 (_ BitVec 64)) (t!9161 List!4079)) )
))
(declare-fun arrayNoDuplicates!0 (array!13243 (_ BitVec 32) List!4079) Bool)

(assert (=> b!269939 (= res!134040 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4076))))

(declare-fun b!269940 () Bool)

(declare-fun e!174062 () Bool)

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269940 (= e!174062 (not (bvsge mask!3868 #b00000000000000000000000000000000)))))

(declare-fun lt!135385 () array!13243)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1429 0))(
  ( (MissingZero!1429 (index!7886 (_ BitVec 32))) (Found!1429 (index!7887 (_ BitVec 32))) (Intermediate!1429 (undefined!2241 Bool) (index!7888 (_ BitVec 32)) (x!26226 (_ BitVec 32))) (Undefined!1429) (MissingVacant!1429 (index!7889 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13243 (_ BitVec 32)) SeekEntryResult!1429)

(assert (=> b!269940 (= (seekEntryOrOpen!0 k!2581 lt!135385 mask!3868) (Found!1429 i!1267))))

(declare-datatypes ((Unit!8392 0))(
  ( (Unit!8393) )
))
(declare-fun lt!135381 () Unit!8392)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13243 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8392)

(assert (=> b!269940 (= lt!135381 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135382 () Unit!8392)

(declare-fun e!174063 () Unit!8392)

(assert (=> b!269940 (= lt!135382 e!174063)))

(declare-fun c!45501 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!269940 (= c!45501 (bvslt startIndex!26 (bvsub (size!6623 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269941 () Bool)

(declare-fun e!174065 () Bool)

(assert (=> b!269941 (= e!174061 e!174065)))

(declare-fun res!134046 () Bool)

(assert (=> b!269941 (=> (not res!134046) (not e!174065))))

(declare-fun lt!135383 () SeekEntryResult!1429)

(assert (=> b!269941 (= res!134046 (or (= lt!135383 (MissingZero!1429 i!1267)) (= lt!135383 (MissingVacant!1429 i!1267))))))

(assert (=> b!269941 (= lt!135383 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!269942 () Bool)

(assert (=> b!269942 (= e!174065 e!174062)))

(declare-fun res!134045 () Bool)

(assert (=> b!269942 (=> (not res!134045) (not e!174062))))

(assert (=> b!269942 (= res!134045 (= startIndex!26 i!1267))))

(assert (=> b!269942 (= lt!135385 (array!13244 (store (arr!6271 a!3325) i!1267 k!2581) (size!6623 a!3325)))))

(declare-fun b!269943 () Bool)

(declare-fun res!134039 () Bool)

(assert (=> b!269943 (=> (not res!134039) (not e!174061))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269943 (= res!134039 (validKeyInArray!0 k!2581))))

(declare-fun b!269944 () Bool)

(declare-fun Unit!8394 () Unit!8392)

(assert (=> b!269944 (= e!174063 Unit!8394)))

(declare-fun res!134043 () Bool)

(assert (=> start!26146 (=> (not res!134043) (not e!174061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26146 (= res!134043 (validMask!0 mask!3868))))

(assert (=> start!26146 e!174061))

(declare-fun array_inv!4234 (array!13243) Bool)

(assert (=> start!26146 (array_inv!4234 a!3325)))

(assert (=> start!26146 true))

(declare-fun b!269945 () Bool)

(declare-fun res!134042 () Bool)

(assert (=> b!269945 (=> (not res!134042) (not e!174061))))

(declare-fun arrayContainsKey!0 (array!13243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269945 (= res!134042 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!269946 () Bool)

(declare-fun res!134041 () Bool)

(assert (=> b!269946 (=> (not res!134041) (not e!174061))))

(assert (=> b!269946 (= res!134041 (and (= (size!6623 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6623 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6623 a!3325))))))

(declare-fun b!269947 () Bool)

(declare-fun lt!135384 () Unit!8392)

(assert (=> b!269947 (= e!174063 lt!135384)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13243 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8392)

(assert (=> b!269947 (= lt!135384 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13243 (_ BitVec 32)) Bool)

(assert (=> b!269947 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135385 mask!3868)))

(declare-fun b!269948 () Bool)

(declare-fun res!134044 () Bool)

(assert (=> b!269948 (=> (not res!134044) (not e!174065))))

(assert (=> b!269948 (= res!134044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26146 res!134043) b!269946))

(assert (= (and b!269946 res!134041) b!269943))

(assert (= (and b!269943 res!134039) b!269939))

(assert (= (and b!269939 res!134040) b!269945))

(assert (= (and b!269945 res!134042) b!269941))

(assert (= (and b!269941 res!134046) b!269948))

(assert (= (and b!269948 res!134044) b!269942))

(assert (= (and b!269942 res!134045) b!269940))

(assert (= (and b!269940 c!45501) b!269947))

(assert (= (and b!269940 (not c!45501)) b!269944))

(declare-fun m!285651 () Bool)

(assert (=> b!269940 m!285651))

(declare-fun m!285653 () Bool)

(assert (=> b!269940 m!285653))

(declare-fun m!285655 () Bool)

(assert (=> start!26146 m!285655))

(declare-fun m!285657 () Bool)

(assert (=> start!26146 m!285657))

(declare-fun m!285659 () Bool)

(assert (=> b!269945 m!285659))

(declare-fun m!285661 () Bool)

(assert (=> b!269948 m!285661))

(declare-fun m!285663 () Bool)

(assert (=> b!269943 m!285663))

(declare-fun m!285665 () Bool)

(assert (=> b!269942 m!285665))

(declare-fun m!285667 () Bool)

(assert (=> b!269947 m!285667))

(declare-fun m!285669 () Bool)

(assert (=> b!269947 m!285669))

(declare-fun m!285671 () Bool)

(assert (=> b!269941 m!285671))

(declare-fun m!285673 () Bool)

(assert (=> b!269939 m!285673))

(push 1)

(assert (not b!269948))

(assert (not b!269945))

(assert (not b!269941))

(assert (not b!269940))

(assert (not b!269947))

(assert (not start!26146))

(assert (not b!269939))

(assert (not b!269943))

(check-sat)

