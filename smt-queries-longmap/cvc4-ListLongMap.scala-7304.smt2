; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93430 () Bool)

(assert start!93430)

(declare-fun res!706797 () Bool)

(declare-fun e!601998 () Bool)

(assert (=> start!93430 (=> (not res!706797) (not e!601998))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66733 0))(
  ( (array!66734 (arr!32085 (Array (_ BitVec 32) (_ BitVec 64))) (size!32621 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66733)

(assert (=> start!93430 (= res!706797 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32621 a!3488)) (bvslt (size!32621 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93430 e!601998))

(assert (=> start!93430 true))

(declare-fun array_inv!24865 (array!66733) Bool)

(assert (=> start!93430 (array_inv!24865 a!3488)))

(declare-fun b!1058223 () Bool)

(declare-fun res!706803 () Bool)

(declare-fun e!601997 () Bool)

(assert (=> b!1058223 (=> res!706803 e!601997)))

(declare-datatypes ((List!22397 0))(
  ( (Nil!22394) (Cons!22393 (h!23602 (_ BitVec 64)) (t!31704 List!22397)) )
))
(declare-fun contains!6209 (List!22397 (_ BitVec 64)) Bool)

(assert (=> b!1058223 (= res!706803 (contains!6209 Nil!22394 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058224 () Bool)

(declare-fun res!706800 () Bool)

(assert (=> b!1058224 (=> res!706800 e!601997)))

(declare-fun noDuplicate!1565 (List!22397) Bool)

(assert (=> b!1058224 (= res!706800 (not (noDuplicate!1565 Nil!22394)))))

(declare-fun b!1058225 () Bool)

(declare-fun e!601993 () Bool)

(assert (=> b!1058225 (= e!601993 e!601997)))

(declare-fun res!706798 () Bool)

(assert (=> b!1058225 (=> res!706798 e!601997)))

(declare-fun lt!466765 () (_ BitVec 32))

(declare-fun lt!466766 () (_ BitVec 32))

(assert (=> b!1058225 (= res!706798 (or (bvslt lt!466766 #b00000000000000000000000000000000) (bvsge lt!466765 (size!32621 a!3488)) (bvsge lt!466766 (size!32621 a!3488))))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058225 (arrayContainsKey!0 a!3488 k!2747 lt!466765)))

(declare-datatypes ((Unit!34692 0))(
  ( (Unit!34693) )
))
(declare-fun lt!466768 () Unit!34692)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66733 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34692)

(assert (=> b!1058225 (= lt!466768 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466765))))

(assert (=> b!1058225 (= lt!466765 (bvadd #b00000000000000000000000000000001 lt!466766))))

(declare-fun arrayNoDuplicates!0 (array!66733 (_ BitVec 32) List!22397) Bool)

(assert (=> b!1058225 (arrayNoDuplicates!0 a!3488 lt!466766 Nil!22394)))

(declare-fun lt!466770 () Unit!34692)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66733 (_ BitVec 32) (_ BitVec 32)) Unit!34692)

(assert (=> b!1058225 (= lt!466770 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466766))))

(declare-fun b!1058226 () Bool)

(declare-fun e!601996 () Bool)

(assert (=> b!1058226 (= e!601998 e!601996)))

(declare-fun res!706804 () Bool)

(assert (=> b!1058226 (=> (not res!706804) (not e!601996))))

(declare-fun lt!466769 () array!66733)

(assert (=> b!1058226 (= res!706804 (arrayContainsKey!0 lt!466769 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058226 (= lt!466769 (array!66734 (store (arr!32085 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32621 a!3488)))))

(declare-fun e!601992 () Bool)

(declare-fun b!1058227 () Bool)

(assert (=> b!1058227 (= e!601992 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1058228 () Bool)

(declare-fun res!706808 () Bool)

(assert (=> b!1058228 (=> (not res!706808) (not e!601998))))

(assert (=> b!1058228 (= res!706808 (= (select (arr!32085 a!3488) i!1381) k!2747))))

(declare-fun b!1058229 () Bool)

(declare-fun res!706799 () Bool)

(assert (=> b!1058229 (=> (not res!706799) (not e!601998))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058229 (= res!706799 (validKeyInArray!0 k!2747))))

(declare-fun b!1058230 () Bool)

(declare-fun e!601999 () Bool)

(assert (=> b!1058230 (= e!601996 e!601999)))

(declare-fun res!706806 () Bool)

(assert (=> b!1058230 (=> (not res!706806) (not e!601999))))

(assert (=> b!1058230 (= res!706806 (not (= lt!466766 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66733 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058230 (= lt!466766 (arrayScanForKey!0 lt!466769 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058231 () Bool)

(assert (=> b!1058231 (= e!601999 (not e!601993))))

(declare-fun res!706805 () Bool)

(assert (=> b!1058231 (=> res!706805 e!601993)))

(assert (=> b!1058231 (= res!706805 (or (bvsgt lt!466766 i!1381) (bvsle i!1381 lt!466766)))))

(declare-fun e!601994 () Bool)

(assert (=> b!1058231 e!601994))

(declare-fun res!706802 () Bool)

(assert (=> b!1058231 (=> (not res!706802) (not e!601994))))

(assert (=> b!1058231 (= res!706802 (= (select (store (arr!32085 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466766) k!2747))))

(declare-fun b!1058232 () Bool)

(declare-fun res!706801 () Bool)

(assert (=> b!1058232 (=> (not res!706801) (not e!601998))))

(assert (=> b!1058232 (= res!706801 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22394))))

(declare-fun b!1058233 () Bool)

(assert (=> b!1058233 (= e!601997 true)))

(declare-fun lt!466767 () Bool)

(assert (=> b!1058233 (= lt!466767 (contains!6209 Nil!22394 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058234 () Bool)

(assert (=> b!1058234 (= e!601994 e!601992)))

(declare-fun res!706807 () Bool)

(assert (=> b!1058234 (=> res!706807 e!601992)))

(assert (=> b!1058234 (= res!706807 (or (bvsgt lt!466766 i!1381) (bvsle i!1381 lt!466766)))))

(assert (= (and start!93430 res!706797) b!1058232))

(assert (= (and b!1058232 res!706801) b!1058229))

(assert (= (and b!1058229 res!706799) b!1058228))

(assert (= (and b!1058228 res!706808) b!1058226))

(assert (= (and b!1058226 res!706804) b!1058230))

(assert (= (and b!1058230 res!706806) b!1058231))

(assert (= (and b!1058231 res!706802) b!1058234))

(assert (= (and b!1058234 (not res!706807)) b!1058227))

(assert (= (and b!1058231 (not res!706805)) b!1058225))

(assert (= (and b!1058225 (not res!706798)) b!1058224))

(assert (= (and b!1058224 (not res!706800)) b!1058223))

(assert (= (and b!1058223 (not res!706803)) b!1058233))

(declare-fun m!977859 () Bool)

(assert (=> start!93430 m!977859))

(declare-fun m!977861 () Bool)

(assert (=> b!1058226 m!977861))

(declare-fun m!977863 () Bool)

(assert (=> b!1058226 m!977863))

(declare-fun m!977865 () Bool)

(assert (=> b!1058225 m!977865))

(declare-fun m!977867 () Bool)

(assert (=> b!1058225 m!977867))

(declare-fun m!977869 () Bool)

(assert (=> b!1058225 m!977869))

(declare-fun m!977871 () Bool)

(assert (=> b!1058225 m!977871))

(declare-fun m!977873 () Bool)

(assert (=> b!1058228 m!977873))

(declare-fun m!977875 () Bool)

(assert (=> b!1058224 m!977875))

(declare-fun m!977877 () Bool)

(assert (=> b!1058223 m!977877))

(declare-fun m!977879 () Bool)

(assert (=> b!1058230 m!977879))

(declare-fun m!977881 () Bool)

(assert (=> b!1058229 m!977881))

(declare-fun m!977883 () Bool)

(assert (=> b!1058227 m!977883))

(assert (=> b!1058231 m!977863))

(declare-fun m!977885 () Bool)

(assert (=> b!1058231 m!977885))

(declare-fun m!977887 () Bool)

(assert (=> b!1058233 m!977887))

(declare-fun m!977889 () Bool)

(assert (=> b!1058232 m!977889))

(push 1)

(assert (not b!1058225))

(assert (not b!1058230))

