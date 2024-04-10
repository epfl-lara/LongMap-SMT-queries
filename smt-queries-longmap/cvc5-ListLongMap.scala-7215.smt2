; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92352 () Bool)

(assert start!92352)

(declare-fun b!1049862 () Bool)

(declare-fun e!595697 () Bool)

(declare-fun e!595696 () Bool)

(assert (=> b!1049862 (= e!595697 e!595696)))

(declare-fun res!698989 () Bool)

(assert (=> b!1049862 (=> (not res!698989) (not e!595696))))

(declare-datatypes ((array!66153 0))(
  ( (array!66154 (arr!31816 (Array (_ BitVec 32) (_ BitVec 64))) (size!32352 (_ BitVec 32))) )
))
(declare-fun lt!463691 () array!66153)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049862 (= res!698989 (arrayContainsKey!0 lt!463691 k!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66153)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049862 (= lt!463691 (array!66154 (store (arr!31816 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32352 a!3488)))))

(declare-fun b!1049863 () Bool)

(declare-fun res!698992 () Bool)

(declare-fun e!595702 () Bool)

(assert (=> b!1049863 (=> res!698992 e!595702)))

(declare-datatypes ((List!22128 0))(
  ( (Nil!22125) (Cons!22124 (h!23333 (_ BitVec 64)) (t!31435 List!22128)) )
))
(declare-fun contains!6121 (List!22128 (_ BitVec 64)) Bool)

(assert (=> b!1049863 (= res!698992 (contains!6121 Nil!22125 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049864 () Bool)

(declare-fun res!698988 () Bool)

(assert (=> b!1049864 (=> res!698988 e!595702)))

(declare-fun noDuplicate!1506 (List!22128) Bool)

(assert (=> b!1049864 (= res!698988 (not (noDuplicate!1506 Nil!22125)))))

(declare-fun res!698995 () Bool)

(assert (=> start!92352 (=> (not res!698995) (not e!595697))))

(assert (=> start!92352 (= res!698995 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32352 a!3488)) (bvslt (size!32352 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92352 e!595697))

(assert (=> start!92352 true))

(declare-fun array_inv!24596 (array!66153) Bool)

(assert (=> start!92352 (array_inv!24596 a!3488)))

(declare-fun e!595701 () Bool)

(declare-fun lt!463689 () (_ BitVec 32))

(declare-fun b!1049865 () Bool)

(assert (=> b!1049865 (= e!595701 (arrayContainsKey!0 a!3488 k!2747 lt!463689))))

(declare-fun b!1049866 () Bool)

(declare-fun res!698993 () Bool)

(assert (=> b!1049866 (=> (not res!698993) (not e!595697))))

(assert (=> b!1049866 (= res!698993 (= (select (arr!31816 a!3488) i!1381) k!2747))))

(declare-fun b!1049867 () Bool)

(declare-fun e!595700 () Bool)

(declare-fun e!595699 () Bool)

(assert (=> b!1049867 (= e!595700 (not e!595699))))

(declare-fun res!698994 () Bool)

(assert (=> b!1049867 (=> res!698994 e!595699)))

(assert (=> b!1049867 (= res!698994 (bvsle lt!463689 i!1381))))

(declare-fun e!595695 () Bool)

(assert (=> b!1049867 e!595695))

(declare-fun res!698990 () Bool)

(assert (=> b!1049867 (=> (not res!698990) (not e!595695))))

(assert (=> b!1049867 (= res!698990 (= (select (store (arr!31816 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463689) k!2747))))

(declare-fun b!1049868 () Bool)

(assert (=> b!1049868 (= e!595702 true)))

(declare-fun lt!463688 () Bool)

(assert (=> b!1049868 (= lt!463688 (contains!6121 Nil!22125 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1049869 () Bool)

(assert (=> b!1049869 (= e!595696 e!595700)))

(declare-fun res!698996 () Bool)

(assert (=> b!1049869 (=> (not res!698996) (not e!595700))))

(assert (=> b!1049869 (= res!698996 (not (= lt!463689 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66153 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049869 (= lt!463689 (arrayScanForKey!0 lt!463691 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1049870 () Bool)

(declare-fun res!698991 () Bool)

(assert (=> b!1049870 (=> (not res!698991) (not e!595697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049870 (= res!698991 (validKeyInArray!0 k!2747))))

(declare-fun b!1049871 () Bool)

(assert (=> b!1049871 (= e!595699 e!595702)))

(declare-fun res!698999 () Bool)

(assert (=> b!1049871 (=> res!698999 e!595702)))

(assert (=> b!1049871 (= res!698999 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32352 a!3488)))))

(assert (=> b!1049871 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34352 0))(
  ( (Unit!34353) )
))
(declare-fun lt!463690 () Unit!34352)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66153 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34352)

(assert (=> b!1049871 (= lt!463690 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463689 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66153 (_ BitVec 32) List!22128) Bool)

(assert (=> b!1049871 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22125)))

(declare-fun lt!463692 () Unit!34352)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66153 (_ BitVec 32) (_ BitVec 32)) Unit!34352)

(assert (=> b!1049871 (= lt!463692 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1049872 () Bool)

(assert (=> b!1049872 (= e!595695 e!595701)))

(declare-fun res!698998 () Bool)

(assert (=> b!1049872 (=> res!698998 e!595701)))

(assert (=> b!1049872 (= res!698998 (bvsle lt!463689 i!1381))))

(declare-fun b!1049873 () Bool)

(declare-fun res!698997 () Bool)

(assert (=> b!1049873 (=> (not res!698997) (not e!595697))))

(assert (=> b!1049873 (= res!698997 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22125))))

(assert (= (and start!92352 res!698995) b!1049873))

(assert (= (and b!1049873 res!698997) b!1049870))

(assert (= (and b!1049870 res!698991) b!1049866))

(assert (= (and b!1049866 res!698993) b!1049862))

(assert (= (and b!1049862 res!698989) b!1049869))

(assert (= (and b!1049869 res!698996) b!1049867))

(assert (= (and b!1049867 res!698990) b!1049872))

(assert (= (and b!1049872 (not res!698998)) b!1049865))

(assert (= (and b!1049867 (not res!698994)) b!1049871))

(assert (= (and b!1049871 (not res!698999)) b!1049864))

(assert (= (and b!1049864 (not res!698988)) b!1049863))

(assert (= (and b!1049863 (not res!698992)) b!1049868))

(declare-fun m!970577 () Bool)

(assert (=> b!1049862 m!970577))

(declare-fun m!970579 () Bool)

(assert (=> b!1049862 m!970579))

(declare-fun m!970581 () Bool)

(assert (=> b!1049870 m!970581))

(declare-fun m!970583 () Bool)

(assert (=> b!1049865 m!970583))

(declare-fun m!970585 () Bool)

(assert (=> start!92352 m!970585))

(declare-fun m!970587 () Bool)

(assert (=> b!1049871 m!970587))

(declare-fun m!970589 () Bool)

(assert (=> b!1049871 m!970589))

(declare-fun m!970591 () Bool)

(assert (=> b!1049871 m!970591))

(declare-fun m!970593 () Bool)

(assert (=> b!1049871 m!970593))

(declare-fun m!970595 () Bool)

(assert (=> b!1049873 m!970595))

(declare-fun m!970597 () Bool)

(assert (=> b!1049869 m!970597))

(declare-fun m!970599 () Bool)

(assert (=> b!1049868 m!970599))

(declare-fun m!970601 () Bool)

(assert (=> b!1049866 m!970601))

(declare-fun m!970603 () Bool)

(assert (=> b!1049864 m!970603))

(assert (=> b!1049867 m!970579))

(declare-fun m!970605 () Bool)

(assert (=> b!1049867 m!970605))

(declare-fun m!970607 () Bool)

(assert (=> b!1049863 m!970607))

(push 1)

(assert (not b!1049862))

(assert (not b!1049864))

(assert (not b!1049868))

(assert (not b!1049865))

(assert (not b!1049863))

(assert (not start!92352))

(assert (not b!1049870))

(assert (not b!1049869))

(assert (not b!1049871))

(assert (not b!1049873))

