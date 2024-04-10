; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103910 () Bool)

(assert start!103910)

(declare-fun b!1243753 () Bool)

(declare-fun res!829536 () Bool)

(declare-fun e!705019 () Bool)

(assert (=> b!1243753 (=> (not res!829536) (not e!705019))))

(declare-datatypes ((array!80002 0))(
  ( (array!80003 (arr!38594 (Array (_ BitVec 32) (_ BitVec 64))) (size!39130 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80002)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243753 (= res!829536 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39130 a!3892)) (not (= newFrom!287 (size!39130 a!3892)))))))

(declare-fun b!1243754 () Bool)

(declare-fun e!705020 () Bool)

(assert (=> b!1243754 (= e!705019 e!705020)))

(declare-fun res!829532 () Bool)

(assert (=> b!1243754 (=> (not res!829532) (not e!705020))))

(assert (=> b!1243754 (= res!829532 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27397 0))(
  ( (Nil!27394) (Cons!27393 (h!28602 (_ BitVec 64)) (t!40866 List!27397)) )
))
(declare-fun lt!562475 () List!27397)

(assert (=> b!1243754 (= lt!562475 (Cons!27393 (select (arr!38594 a!3892) from!3270) Nil!27394))))

(declare-fun b!1243756 () Bool)

(declare-fun res!829530 () Bool)

(assert (=> b!1243756 (=> (not res!829530) (not e!705020))))

(declare-fun noDuplicate!1996 (List!27397) Bool)

(assert (=> b!1243756 (= res!829530 (noDuplicate!1996 lt!562475))))

(declare-fun b!1243757 () Bool)

(declare-fun res!829538 () Bool)

(assert (=> b!1243757 (=> (not res!829538) (not e!705020))))

(declare-fun contains!7418 (List!27397 (_ BitVec 64)) Bool)

(assert (=> b!1243757 (= res!829538 (not (contains!7418 Nil!27394 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243758 () Bool)

(declare-fun res!829534 () Bool)

(assert (=> b!1243758 (=> (not res!829534) (not e!705020))))

(declare-fun subseq!644 (List!27397 List!27397) Bool)

(assert (=> b!1243758 (= res!829534 (subseq!644 Nil!27394 lt!562475))))

(declare-fun b!1243759 () Bool)

(declare-fun res!829540 () Bool)

(assert (=> b!1243759 (=> (not res!829540) (not e!705020))))

(assert (=> b!1243759 (= res!829540 (not (contains!7418 lt!562475 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243760 () Bool)

(declare-fun res!829533 () Bool)

(assert (=> b!1243760 (=> (not res!829533) (not e!705020))))

(assert (=> b!1243760 (= res!829533 (not (contains!7418 Nil!27394 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243761 () Bool)

(declare-fun res!829535 () Bool)

(assert (=> b!1243761 (=> (not res!829535) (not e!705019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243761 (= res!829535 (validKeyInArray!0 (select (arr!38594 a!3892) from!3270)))))

(declare-fun b!1243762 () Bool)

(declare-fun res!829531 () Bool)

(assert (=> b!1243762 (=> (not res!829531) (not e!705020))))

(assert (=> b!1243762 (= res!829531 (not (contains!7418 lt!562475 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243763 () Bool)

(declare-fun res!829537 () Bool)

(assert (=> b!1243763 (=> (not res!829537) (not e!705019))))

(declare-fun arrayNoDuplicates!0 (array!80002 (_ BitVec 32) List!27397) Bool)

(assert (=> b!1243763 (= res!829537 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27394))))

(declare-fun b!1243755 () Bool)

(assert (=> b!1243755 (= e!705020 false)))

(declare-fun lt!562474 () Bool)

(assert (=> b!1243755 (= lt!562474 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562475))))

(declare-datatypes ((Unit!41297 0))(
  ( (Unit!41298) )
))
(declare-fun lt!562473 () Unit!41297)

(declare-fun noDuplicateSubseq!98 (List!27397 List!27397) Unit!41297)

(assert (=> b!1243755 (= lt!562473 (noDuplicateSubseq!98 Nil!27394 lt!562475))))

(declare-fun res!829539 () Bool)

(assert (=> start!103910 (=> (not res!829539) (not e!705019))))

(assert (=> start!103910 (= res!829539 (and (bvslt (size!39130 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39130 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39130 a!3892))))))

(assert (=> start!103910 e!705019))

(declare-fun array_inv!29442 (array!80002) Bool)

(assert (=> start!103910 (array_inv!29442 a!3892)))

(assert (=> start!103910 true))

(assert (= (and start!103910 res!829539) b!1243763))

(assert (= (and b!1243763 res!829537) b!1243753))

(assert (= (and b!1243753 res!829536) b!1243761))

(assert (= (and b!1243761 res!829535) b!1243754))

(assert (= (and b!1243754 res!829532) b!1243756))

(assert (= (and b!1243756 res!829530) b!1243762))

(assert (= (and b!1243762 res!829531) b!1243759))

(assert (= (and b!1243759 res!829540) b!1243760))

(assert (= (and b!1243760 res!829533) b!1243757))

(assert (= (and b!1243757 res!829538) b!1243758))

(assert (= (and b!1243758 res!829534) b!1243755))

(declare-fun m!1146227 () Bool)

(assert (=> b!1243754 m!1146227))

(declare-fun m!1146229 () Bool)

(assert (=> b!1243757 m!1146229))

(declare-fun m!1146231 () Bool)

(assert (=> b!1243760 m!1146231))

(declare-fun m!1146233 () Bool)

(assert (=> b!1243762 m!1146233))

(declare-fun m!1146235 () Bool)

(assert (=> b!1243755 m!1146235))

(declare-fun m!1146237 () Bool)

(assert (=> b!1243755 m!1146237))

(declare-fun m!1146239 () Bool)

(assert (=> b!1243759 m!1146239))

(assert (=> b!1243761 m!1146227))

(assert (=> b!1243761 m!1146227))

(declare-fun m!1146241 () Bool)

(assert (=> b!1243761 m!1146241))

(declare-fun m!1146243 () Bool)

(assert (=> start!103910 m!1146243))

(declare-fun m!1146245 () Bool)

(assert (=> b!1243756 m!1146245))

(declare-fun m!1146247 () Bool)

(assert (=> b!1243763 m!1146247))

(declare-fun m!1146249 () Bool)

(assert (=> b!1243758 m!1146249))

(push 1)

