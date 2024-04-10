; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92536 () Bool)

(assert start!92536)

(declare-fun res!701694 () Bool)

(declare-fun e!597618 () Bool)

(assert (=> start!92536 (=> (not res!701694) (not e!597618))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66337 0))(
  ( (array!66338 (arr!31908 (Array (_ BitVec 32) (_ BitVec 64))) (size!32444 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66337)

(assert (=> start!92536 (= res!701694 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32444 a!3488)) (bvslt (size!32444 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92536 e!597618))

(assert (=> start!92536 true))

(declare-fun array_inv!24688 (array!66337) Bool)

(assert (=> start!92536 (array_inv!24688 a!3488)))

(declare-fun b!1052565 () Bool)

(declare-fun e!597619 () Bool)

(declare-fun e!597616 () Bool)

(assert (=> b!1052565 (= e!597619 e!597616)))

(declare-fun res!701699 () Bool)

(assert (=> b!1052565 (=> res!701699 e!597616)))

(declare-fun lt!464835 () (_ BitVec 32))

(assert (=> b!1052565 (= res!701699 (or (bvsgt lt!464835 i!1381) (bvsle i!1381 lt!464835)))))

(declare-fun b!1052566 () Bool)

(declare-fun res!701693 () Bool)

(assert (=> b!1052566 (=> (not res!701693) (not e!597618))))

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1052566 (= res!701693 (= (select (arr!31908 a!3488) i!1381) k!2747))))

(declare-fun b!1052567 () Bool)

(declare-fun e!597621 () Bool)

(declare-fun e!597617 () Bool)

(assert (=> b!1052567 (= e!597621 (not e!597617))))

(declare-fun res!701697 () Bool)

(assert (=> b!1052567 (=> res!701697 e!597617)))

(assert (=> b!1052567 (= res!701697 (or (bvsgt lt!464835 i!1381) (bvsle i!1381 lt!464835)))))

(assert (=> b!1052567 e!597619))

(declare-fun res!701692 () Bool)

(assert (=> b!1052567 (=> (not res!701692) (not e!597619))))

(assert (=> b!1052567 (= res!701692 (= (select (store (arr!31908 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464835) k!2747))))

(declare-fun b!1052568 () Bool)

(declare-fun res!701698 () Bool)

(assert (=> b!1052568 (=> (not res!701698) (not e!597618))))

(declare-datatypes ((List!22220 0))(
  ( (Nil!22217) (Cons!22216 (h!23425 (_ BitVec 64)) (t!31527 List!22220)) )
))
(declare-fun arrayNoDuplicates!0 (array!66337 (_ BitVec 32) List!22220) Bool)

(assert (=> b!1052568 (= res!701698 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22217))))

(declare-fun b!1052569 () Bool)

(declare-fun res!701691 () Bool)

(assert (=> b!1052569 (=> (not res!701691) (not e!597618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052569 (= res!701691 (validKeyInArray!0 k!2747))))

(declare-fun b!1052570 () Bool)

(declare-fun e!597622 () Bool)

(assert (=> b!1052570 (= e!597618 e!597622)))

(declare-fun res!701696 () Bool)

(assert (=> b!1052570 (=> (not res!701696) (not e!597622))))

(declare-fun lt!464836 () array!66337)

(declare-fun arrayContainsKey!0 (array!66337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052570 (= res!701696 (arrayContainsKey!0 lt!464836 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052570 (= lt!464836 (array!66338 (store (arr!31908 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32444 a!3488)))))

(declare-fun b!1052571 () Bool)

(assert (=> b!1052571 (= e!597622 e!597621)))

(declare-fun res!701695 () Bool)

(assert (=> b!1052571 (=> (not res!701695) (not e!597621))))

(assert (=> b!1052571 (= res!701695 (not (= lt!464835 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66337 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052571 (= lt!464835 (arrayScanForKey!0 lt!464836 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052572 () Bool)

(assert (=> b!1052572 (= e!597616 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1052573 () Bool)

(assert (=> b!1052573 (= e!597617 true)))

(assert (=> b!1052573 (not (= (select (arr!31908 a!3488) lt!464835) k!2747))))

(declare-datatypes ((Unit!34488 0))(
  ( (Unit!34489) )
))
(declare-fun lt!464838 () Unit!34488)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66337 (_ BitVec 64) (_ BitVec 32) List!22220) Unit!34488)

(assert (=> b!1052573 (= lt!464838 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!464835 Nil!22217))))

(declare-fun lt!464837 () (_ BitVec 32))

(assert (=> b!1052573 (arrayContainsKey!0 a!3488 k!2747 lt!464837)))

(declare-fun lt!464834 () Unit!34488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66337 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34488)

(assert (=> b!1052573 (= lt!464834 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!464837))))

(assert (=> b!1052573 (= lt!464837 (bvadd #b00000000000000000000000000000001 lt!464835))))

(assert (=> b!1052573 (arrayNoDuplicates!0 a!3488 lt!464835 Nil!22217)))

(declare-fun lt!464833 () Unit!34488)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66337 (_ BitVec 32) (_ BitVec 32)) Unit!34488)

(assert (=> b!1052573 (= lt!464833 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464835))))

(assert (= (and start!92536 res!701694) b!1052568))

(assert (= (and b!1052568 res!701698) b!1052569))

(assert (= (and b!1052569 res!701691) b!1052566))

(assert (= (and b!1052566 res!701693) b!1052570))

(assert (= (and b!1052570 res!701696) b!1052571))

(assert (= (and b!1052571 res!701695) b!1052567))

(assert (= (and b!1052567 res!701692) b!1052565))

(assert (= (and b!1052565 (not res!701699)) b!1052572))

(assert (= (and b!1052567 (not res!701697)) b!1052573))

(declare-fun m!972947 () Bool)

(assert (=> b!1052569 m!972947))

(declare-fun m!972949 () Bool)

(assert (=> b!1052571 m!972949))

(declare-fun m!972951 () Bool)

(assert (=> start!92536 m!972951))

(declare-fun m!972953 () Bool)

(assert (=> b!1052572 m!972953))

(declare-fun m!972955 () Bool)

(assert (=> b!1052567 m!972955))

(declare-fun m!972957 () Bool)

(assert (=> b!1052567 m!972957))

(declare-fun m!972959 () Bool)

(assert (=> b!1052568 m!972959))

(declare-fun m!972961 () Bool)

(assert (=> b!1052566 m!972961))

(declare-fun m!972963 () Bool)

(assert (=> b!1052573 m!972963))

(declare-fun m!972965 () Bool)

(assert (=> b!1052573 m!972965))

(declare-fun m!972967 () Bool)

(assert (=> b!1052573 m!972967))

(declare-fun m!972969 () Bool)

(assert (=> b!1052573 m!972969))

(declare-fun m!972971 () Bool)

(assert (=> b!1052573 m!972971))

(declare-fun m!972973 () Bool)

(assert (=> b!1052573 m!972973))

(declare-fun m!972975 () Bool)

(assert (=> b!1052570 m!972975))

(assert (=> b!1052570 m!972955))

(push 1)

