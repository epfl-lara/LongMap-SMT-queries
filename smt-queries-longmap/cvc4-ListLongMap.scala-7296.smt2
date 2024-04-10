; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93238 () Bool)

(assert start!93238)

(declare-fun b!1057131 () Bool)

(declare-fun e!601133 () Bool)

(declare-fun e!601136 () Bool)

(assert (=> b!1057131 (= e!601133 e!601136)))

(declare-fun res!705839 () Bool)

(assert (=> b!1057131 (=> (not res!705839) (not e!601136))))

(declare-fun lt!466306 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1057131 (= res!705839 (not (= lt!466306 i!1381)))))

(declare-datatypes ((array!66676 0))(
  ( (array!66677 (arr!32061 (Array (_ BitVec 32) (_ BitVec 64))) (size!32597 (_ BitVec 32))) )
))
(declare-fun lt!466308 () array!66676)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66676 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057131 (= lt!466306 (arrayScanForKey!0 lt!466308 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057132 () Bool)

(declare-fun res!705837 () Bool)

(declare-fun e!601137 () Bool)

(assert (=> b!1057132 (=> (not res!705837) (not e!601137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057132 (= res!705837 (validKeyInArray!0 k!2747))))

(declare-fun b!1057133 () Bool)

(declare-fun e!601132 () Bool)

(declare-fun e!601135 () Bool)

(assert (=> b!1057133 (= e!601132 e!601135)))

(declare-fun res!705832 () Bool)

(assert (=> b!1057133 (=> res!705832 e!601135)))

(assert (=> b!1057133 (= res!705832 (or (bvsgt lt!466306 i!1381) (bvsle i!1381 lt!466306)))))

(declare-fun b!1057134 () Bool)

(declare-fun e!601134 () Bool)

(assert (=> b!1057134 (= e!601134 true)))

(declare-fun a!3488 () array!66676)

(declare-datatypes ((List!22373 0))(
  ( (Nil!22370) (Cons!22369 (h!23578 (_ BitVec 64)) (t!31680 List!22373)) )
))
(declare-fun arrayNoDuplicates!0 (array!66676 (_ BitVec 32) List!22373) Bool)

(assert (=> b!1057134 (arrayNoDuplicates!0 a!3488 lt!466306 Nil!22370)))

(declare-datatypes ((Unit!34644 0))(
  ( (Unit!34645) )
))
(declare-fun lt!466307 () Unit!34644)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66676 (_ BitVec 32) (_ BitVec 32)) Unit!34644)

(assert (=> b!1057134 (= lt!466307 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466306))))

(declare-fun b!1057135 () Bool)

(declare-fun res!705838 () Bool)

(assert (=> b!1057135 (=> (not res!705838) (not e!601137))))

(assert (=> b!1057135 (= res!705838 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22370))))

(declare-fun res!705836 () Bool)

(assert (=> start!93238 (=> (not res!705836) (not e!601137))))

(assert (=> start!93238 (= res!705836 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32597 a!3488)) (bvslt (size!32597 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93238 e!601137))

(assert (=> start!93238 true))

(declare-fun array_inv!24841 (array!66676) Bool)

(assert (=> start!93238 (array_inv!24841 a!3488)))

(declare-fun b!1057136 () Bool)

(declare-fun arrayContainsKey!0 (array!66676 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057136 (= e!601135 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1057137 () Bool)

(assert (=> b!1057137 (= e!601136 (not e!601134))))

(declare-fun res!705831 () Bool)

(assert (=> b!1057137 (=> res!705831 e!601134)))

(assert (=> b!1057137 (= res!705831 (or (bvsgt lt!466306 i!1381) (bvsle i!1381 lt!466306)))))

(assert (=> b!1057137 e!601132))

(declare-fun res!705833 () Bool)

(assert (=> b!1057137 (=> (not res!705833) (not e!601132))))

(assert (=> b!1057137 (= res!705833 (= (select (store (arr!32061 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466306) k!2747))))

(declare-fun b!1057138 () Bool)

(assert (=> b!1057138 (= e!601137 e!601133)))

(declare-fun res!705835 () Bool)

(assert (=> b!1057138 (=> (not res!705835) (not e!601133))))

(assert (=> b!1057138 (= res!705835 (arrayContainsKey!0 lt!466308 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057138 (= lt!466308 (array!66677 (store (arr!32061 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32597 a!3488)))))

(declare-fun b!1057139 () Bool)

(declare-fun res!705834 () Bool)

(assert (=> b!1057139 (=> (not res!705834) (not e!601137))))

(assert (=> b!1057139 (= res!705834 (= (select (arr!32061 a!3488) i!1381) k!2747))))

(assert (= (and start!93238 res!705836) b!1057135))

(assert (= (and b!1057135 res!705838) b!1057132))

(assert (= (and b!1057132 res!705837) b!1057139))

(assert (= (and b!1057139 res!705834) b!1057138))

(assert (= (and b!1057138 res!705835) b!1057131))

(assert (= (and b!1057131 res!705839) b!1057137))

(assert (= (and b!1057137 res!705833) b!1057133))

(assert (= (and b!1057133 (not res!705832)) b!1057136))

(assert (= (and b!1057137 (not res!705831)) b!1057134))

(declare-fun m!976843 () Bool)

(assert (=> b!1057132 m!976843))

(declare-fun m!976845 () Bool)

(assert (=> b!1057134 m!976845))

(declare-fun m!976847 () Bool)

(assert (=> b!1057134 m!976847))

(declare-fun m!976849 () Bool)

(assert (=> b!1057138 m!976849))

(declare-fun m!976851 () Bool)

(assert (=> b!1057138 m!976851))

(declare-fun m!976853 () Bool)

(assert (=> b!1057136 m!976853))

(declare-fun m!976855 () Bool)

(assert (=> b!1057139 m!976855))

(assert (=> b!1057137 m!976851))

(declare-fun m!976857 () Bool)

(assert (=> b!1057137 m!976857))

(declare-fun m!976859 () Bool)

(assert (=> start!93238 m!976859))

(declare-fun m!976861 () Bool)

(assert (=> b!1057135 m!976861))

(declare-fun m!976863 () Bool)

(assert (=> b!1057131 m!976863))

(push 1)

