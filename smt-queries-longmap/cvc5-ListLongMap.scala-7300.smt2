; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93538 () Bool)

(assert start!93538)

(declare-fun b!1058878 () Bool)

(declare-fun res!706732 () Bool)

(declare-fun e!602320 () Bool)

(assert (=> b!1058878 (=> (not res!706732) (not e!602320))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058878 (= res!706732 (validKeyInArray!0 k!2747))))

(declare-fun lt!467030 () (_ BitVec 32))

(declare-fun e!602317 () Bool)

(declare-datatypes ((array!66752 0))(
  ( (array!66753 (arr!32091 (Array (_ BitVec 32) (_ BitVec 64))) (size!32628 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66752)

(declare-fun lt!467029 () (_ BitVec 32))

(declare-fun b!1058879 () Bool)

(assert (=> b!1058879 (= e!602317 (or (bvslt lt!467029 #b00000000000000000000000000000000) (bvslt lt!467030 (size!32628 a!3488))))))

(declare-fun arrayContainsKey!0 (array!66752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058879 (arrayContainsKey!0 a!3488 k!2747 lt!467030)))

(declare-datatypes ((Unit!34673 0))(
  ( (Unit!34674) )
))
(declare-fun lt!467027 () Unit!34673)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66752 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34673)

(assert (=> b!1058879 (= lt!467027 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!467030))))

(assert (=> b!1058879 (= lt!467030 (bvadd #b00000000000000000000000000000001 lt!467029))))

(declare-datatypes ((List!22373 0))(
  ( (Nil!22370) (Cons!22369 (h!23587 (_ BitVec 64)) (t!31672 List!22373)) )
))
(declare-fun arrayNoDuplicates!0 (array!66752 (_ BitVec 32) List!22373) Bool)

(assert (=> b!1058879 (arrayNoDuplicates!0 a!3488 lt!467029 Nil!22370)))

(declare-fun lt!467028 () Unit!34673)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66752 (_ BitVec 32) (_ BitVec 32)) Unit!34673)

(assert (=> b!1058879 (= lt!467028 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467029))))

(declare-fun b!1058880 () Bool)

(declare-fun e!602315 () Bool)

(declare-fun e!602314 () Bool)

(assert (=> b!1058880 (= e!602315 e!602314)))

(declare-fun res!706733 () Bool)

(assert (=> b!1058880 (=> (not res!706733) (not e!602314))))

(assert (=> b!1058880 (= res!706733 (not (= lt!467029 i!1381)))))

(declare-fun lt!467026 () array!66752)

(declare-fun arrayScanForKey!0 (array!66752 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058880 (= lt!467029 (arrayScanForKey!0 lt!467026 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058881 () Bool)

(assert (=> b!1058881 (= e!602314 (not e!602317))))

(declare-fun res!706737 () Bool)

(assert (=> b!1058881 (=> res!706737 e!602317)))

(assert (=> b!1058881 (= res!706737 (or (bvsgt lt!467029 i!1381) (bvsle i!1381 lt!467029)))))

(declare-fun e!602319 () Bool)

(assert (=> b!1058881 e!602319))

(declare-fun res!706738 () Bool)

(assert (=> b!1058881 (=> (not res!706738) (not e!602319))))

(assert (=> b!1058881 (= res!706738 (= (select (store (arr!32091 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467029) k!2747))))

(declare-fun e!602318 () Bool)

(declare-fun b!1058882 () Bool)

(assert (=> b!1058882 (= e!602318 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1058883 () Bool)

(assert (=> b!1058883 (= e!602319 e!602318)))

(declare-fun res!706735 () Bool)

(assert (=> b!1058883 (=> res!706735 e!602318)))

(assert (=> b!1058883 (= res!706735 (or (bvsgt lt!467029 i!1381) (bvsle i!1381 lt!467029)))))

(declare-fun b!1058884 () Bool)

(declare-fun res!706731 () Bool)

(assert (=> b!1058884 (=> (not res!706731) (not e!602320))))

(assert (=> b!1058884 (= res!706731 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22370))))

(declare-fun b!1058885 () Bool)

(declare-fun res!706736 () Bool)

(assert (=> b!1058885 (=> (not res!706736) (not e!602320))))

(assert (=> b!1058885 (= res!706736 (= (select (arr!32091 a!3488) i!1381) k!2747))))

(declare-fun b!1058886 () Bool)

(assert (=> b!1058886 (= e!602320 e!602315)))

(declare-fun res!706739 () Bool)

(assert (=> b!1058886 (=> (not res!706739) (not e!602315))))

(assert (=> b!1058886 (= res!706739 (arrayContainsKey!0 lt!467026 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058886 (= lt!467026 (array!66753 (store (arr!32091 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32628 a!3488)))))

(declare-fun res!706734 () Bool)

(assert (=> start!93538 (=> (not res!706734) (not e!602320))))

(assert (=> start!93538 (= res!706734 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32628 a!3488)) (bvslt (size!32628 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93538 e!602320))

(assert (=> start!93538 true))

(declare-fun array_inv!24873 (array!66752) Bool)

(assert (=> start!93538 (array_inv!24873 a!3488)))

(assert (= (and start!93538 res!706734) b!1058884))

(assert (= (and b!1058884 res!706731) b!1058878))

(assert (= (and b!1058878 res!706732) b!1058885))

(assert (= (and b!1058885 res!706736) b!1058886))

(assert (= (and b!1058886 res!706739) b!1058880))

(assert (= (and b!1058880 res!706733) b!1058881))

(assert (= (and b!1058881 res!706738) b!1058883))

(assert (= (and b!1058883 (not res!706735)) b!1058882))

(assert (= (and b!1058881 (not res!706737)) b!1058879))

(declare-fun m!978921 () Bool)

(assert (=> b!1058886 m!978921))

(declare-fun m!978923 () Bool)

(assert (=> b!1058886 m!978923))

(declare-fun m!978925 () Bool)

(assert (=> b!1058879 m!978925))

(declare-fun m!978927 () Bool)

(assert (=> b!1058879 m!978927))

(declare-fun m!978929 () Bool)

(assert (=> b!1058879 m!978929))

(declare-fun m!978931 () Bool)

(assert (=> b!1058879 m!978931))

(declare-fun m!978933 () Bool)

(assert (=> b!1058884 m!978933))

(declare-fun m!978935 () Bool)

(assert (=> start!93538 m!978935))

(declare-fun m!978937 () Bool)

(assert (=> b!1058880 m!978937))

(declare-fun m!978939 () Bool)

(assert (=> b!1058878 m!978939))

(declare-fun m!978941 () Bool)

(assert (=> b!1058885 m!978941))

(declare-fun m!978943 () Bool)

(assert (=> b!1058882 m!978943))

(assert (=> b!1058881 m!978923))

(declare-fun m!978945 () Bool)

(assert (=> b!1058881 m!978945))

(push 1)

(assert (not b!1058884))

(assert (not b!1058878))

(assert (not b!1058886))

(assert (not b!1058880))

(assert (not b!1058882))

(assert (not b!1058879))

(assert (not start!93538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

