; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92356 () Bool)

(assert start!92356)

(declare-fun b!1049934 () Bool)

(declare-fun res!699062 () Bool)

(declare-fun e!595748 () Bool)

(assert (=> b!1049934 (=> res!699062 e!595748)))

(declare-datatypes ((List!22130 0))(
  ( (Nil!22127) (Cons!22126 (h!23335 (_ BitVec 64)) (t!31437 List!22130)) )
))
(declare-fun noDuplicate!1508 (List!22130) Bool)

(assert (=> b!1049934 (= res!699062 (not (noDuplicate!1508 Nil!22127)))))

(declare-fun b!1049935 () Bool)

(declare-fun e!595747 () Bool)

(declare-fun e!595749 () Bool)

(assert (=> b!1049935 (= e!595747 e!595749)))

(declare-fun res!699060 () Bool)

(assert (=> b!1049935 (=> (not res!699060) (not e!595749))))

(declare-datatypes ((array!66157 0))(
  ( (array!66158 (arr!31818 (Array (_ BitVec 32) (_ BitVec 64))) (size!32354 (_ BitVec 32))) )
))
(declare-fun lt!463718 () array!66157)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049935 (= res!699060 (arrayContainsKey!0 lt!463718 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66157)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049935 (= lt!463718 (array!66158 (store (arr!31818 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32354 a!3488)))))

(declare-fun b!1049936 () Bool)

(declare-fun res!699065 () Bool)

(assert (=> b!1049936 (=> (not res!699065) (not e!595747))))

(declare-fun arrayNoDuplicates!0 (array!66157 (_ BitVec 32) List!22130) Bool)

(assert (=> b!1049936 (= res!699065 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22127))))

(declare-fun e!595746 () Bool)

(declare-fun lt!463722 () (_ BitVec 32))

(declare-fun b!1049937 () Bool)

(assert (=> b!1049937 (= e!595746 (arrayContainsKey!0 a!3488 k!2747 lt!463722))))

(declare-fun b!1049938 () Bool)

(declare-fun e!595750 () Bool)

(assert (=> b!1049938 (= e!595750 e!595746)))

(declare-fun res!699067 () Bool)

(assert (=> b!1049938 (=> res!699067 e!595746)))

(assert (=> b!1049938 (= res!699067 (bvsle lt!463722 i!1381))))

(declare-fun b!1049939 () Bool)

(declare-fun res!699064 () Bool)

(assert (=> b!1049939 (=> (not res!699064) (not e!595747))))

(assert (=> b!1049939 (= res!699064 (= (select (arr!31818 a!3488) i!1381) k!2747))))

(declare-fun b!1049940 () Bool)

(declare-fun e!595744 () Bool)

(assert (=> b!1049940 (= e!595749 e!595744)))

(declare-fun res!699061 () Bool)

(assert (=> b!1049940 (=> (not res!699061) (not e!595744))))

(assert (=> b!1049940 (= res!699061 (not (= lt!463722 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66157 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049940 (= lt!463722 (arrayScanForKey!0 lt!463718 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049941 () Bool)

(assert (=> b!1049941 (= e!595748 true)))

(declare-fun lt!463719 () Bool)

(declare-fun contains!6123 (List!22130 (_ BitVec 64)) Bool)

(assert (=> b!1049941 (= lt!463719 (contains!6123 Nil!22127 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049942 () Bool)

(declare-fun res!699063 () Bool)

(assert (=> b!1049942 (=> (not res!699063) (not e!595747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049942 (= res!699063 (validKeyInArray!0 k!2747))))

(declare-fun b!1049943 () Bool)

(declare-fun e!595743 () Bool)

(assert (=> b!1049943 (= e!595744 (not e!595743))))

(declare-fun res!699068 () Bool)

(assert (=> b!1049943 (=> res!699068 e!595743)))

(assert (=> b!1049943 (= res!699068 (bvsle lt!463722 i!1381))))

(assert (=> b!1049943 e!595750))

(declare-fun res!699071 () Bool)

(assert (=> b!1049943 (=> (not res!699071) (not e!595750))))

(assert (=> b!1049943 (= res!699071 (= (select (store (arr!31818 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463722) k!2747))))

(declare-fun res!699069 () Bool)

(assert (=> start!92356 (=> (not res!699069) (not e!595747))))

(assert (=> start!92356 (= res!699069 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32354 a!3488)) (bvslt (size!32354 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92356 e!595747))

(assert (=> start!92356 true))

(declare-fun array_inv!24598 (array!66157) Bool)

(assert (=> start!92356 (array_inv!24598 a!3488)))

(declare-fun b!1049944 () Bool)

(assert (=> b!1049944 (= e!595743 e!595748)))

(declare-fun res!699066 () Bool)

(assert (=> b!1049944 (=> res!699066 e!595748)))

(assert (=> b!1049944 (= res!699066 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32354 a!3488)))))

(assert (=> b!1049944 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34356 0))(
  ( (Unit!34357) )
))
(declare-fun lt!463721 () Unit!34356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66157 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34356)

(assert (=> b!1049944 (= lt!463721 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463722 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1049944 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22127)))

(declare-fun lt!463720 () Unit!34356)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66157 (_ BitVec 32) (_ BitVec 32)) Unit!34356)

(assert (=> b!1049944 (= lt!463720 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049945 () Bool)

(declare-fun res!699070 () Bool)

(assert (=> b!1049945 (=> res!699070 e!595748)))

(assert (=> b!1049945 (= res!699070 (contains!6123 Nil!22127 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92356 res!699069) b!1049936))

(assert (= (and b!1049936 res!699065) b!1049942))

(assert (= (and b!1049942 res!699063) b!1049939))

(assert (= (and b!1049939 res!699064) b!1049935))

(assert (= (and b!1049935 res!699060) b!1049940))

(assert (= (and b!1049940 res!699061) b!1049943))

(assert (= (and b!1049943 res!699071) b!1049938))

(assert (= (and b!1049938 (not res!699067)) b!1049937))

(assert (= (and b!1049943 (not res!699068)) b!1049944))

(assert (= (and b!1049944 (not res!699066)) b!1049934))

(assert (= (and b!1049934 (not res!699062)) b!1049945))

(assert (= (and b!1049945 (not res!699070)) b!1049941))

(declare-fun m!970641 () Bool)

(assert (=> b!1049943 m!970641))

(declare-fun m!970643 () Bool)

(assert (=> b!1049943 m!970643))

(declare-fun m!970645 () Bool)

(assert (=> b!1049936 m!970645))

(declare-fun m!970647 () Bool)

(assert (=> b!1049935 m!970647))

(assert (=> b!1049935 m!970641))

(declare-fun m!970649 () Bool)

(assert (=> b!1049941 m!970649))

(declare-fun m!970651 () Bool)

(assert (=> b!1049937 m!970651))

(declare-fun m!970653 () Bool)

(assert (=> b!1049945 m!970653))

(declare-fun m!970655 () Bool)

(assert (=> b!1049939 m!970655))

(declare-fun m!970657 () Bool)

(assert (=> b!1049934 m!970657))

(declare-fun m!970659 () Bool)

(assert (=> start!92356 m!970659))

(declare-fun m!970661 () Bool)

(assert (=> b!1049944 m!970661))

(declare-fun m!970663 () Bool)

(assert (=> b!1049944 m!970663))

(declare-fun m!970665 () Bool)

(assert (=> b!1049944 m!970665))

(declare-fun m!970667 () Bool)

(assert (=> b!1049944 m!970667))

(declare-fun m!970669 () Bool)

(assert (=> b!1049940 m!970669))

(declare-fun m!970671 () Bool)

(assert (=> b!1049942 m!970671))

(push 1)

(assert (not b!1049941))

(assert (not b!1049942))

(assert (not b!1049934))

(assert (not b!1049940))

(assert (not b!1049935))

(assert (not b!1049937))

(assert (not b!1049944))

(assert (not b!1049945))

(assert (not b!1049936))

(assert (not start!92356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

