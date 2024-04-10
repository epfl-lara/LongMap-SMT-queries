; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93432 () Bool)

(assert start!93432)

(declare-fun b!1058259 () Bool)

(declare-fun res!706836 () Bool)

(declare-fun e!602022 () Bool)

(assert (=> b!1058259 (=> (not res!706836) (not e!602022))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058259 (= res!706836 (validKeyInArray!0 k!2747))))

(declare-fun b!1058261 () Bool)

(declare-fun e!602016 () Bool)

(declare-fun e!602017 () Bool)

(assert (=> b!1058261 (= e!602016 e!602017)))

(declare-fun res!706843 () Bool)

(assert (=> b!1058261 (=> (not res!706843) (not e!602017))))

(declare-fun lt!466784 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058261 (= res!706843 (not (= lt!466784 i!1381)))))

(declare-datatypes ((array!66735 0))(
  ( (array!66736 (arr!32086 (Array (_ BitVec 32) (_ BitVec 64))) (size!32622 (_ BitVec 32))) )
))
(declare-fun lt!466785 () array!66735)

(declare-fun arrayScanForKey!0 (array!66735 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058261 (= lt!466784 (arrayScanForKey!0 lt!466785 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058262 () Bool)

(declare-fun res!706834 () Bool)

(assert (=> b!1058262 (=> (not res!706834) (not e!602022))))

(declare-fun a!3488 () array!66735)

(assert (=> b!1058262 (= res!706834 (= (select (arr!32086 a!3488) i!1381) k!2747))))

(declare-fun b!1058263 () Bool)

(declare-fun res!706833 () Bool)

(declare-fun e!602023 () Bool)

(assert (=> b!1058263 (=> res!706833 e!602023)))

(declare-datatypes ((List!22398 0))(
  ( (Nil!22395) (Cons!22394 (h!23603 (_ BitVec 64)) (t!31705 List!22398)) )
))
(declare-fun contains!6210 (List!22398 (_ BitVec 64)) Bool)

(assert (=> b!1058263 (= res!706833 (contains!6210 Nil!22395 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058264 () Bool)

(assert (=> b!1058264 (= e!602022 e!602016)))

(declare-fun res!706838 () Bool)

(assert (=> b!1058264 (=> (not res!706838) (not e!602016))))

(declare-fun arrayContainsKey!0 (array!66735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058264 (= res!706838 (arrayContainsKey!0 lt!466785 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058264 (= lt!466785 (array!66736 (store (arr!32086 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32622 a!3488)))))

(declare-fun b!1058265 () Bool)

(declare-fun res!706844 () Bool)

(assert (=> b!1058265 (=> (not res!706844) (not e!602022))))

(declare-fun arrayNoDuplicates!0 (array!66735 (_ BitVec 32) List!22398) Bool)

(assert (=> b!1058265 (= res!706844 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22395))))

(declare-fun b!1058266 () Bool)

(declare-fun e!602018 () Bool)

(declare-fun e!602019 () Bool)

(assert (=> b!1058266 (= e!602018 e!602019)))

(declare-fun res!706835 () Bool)

(assert (=> b!1058266 (=> res!706835 e!602019)))

(assert (=> b!1058266 (= res!706835 (or (bvsgt lt!466784 i!1381) (bvsle i!1381 lt!466784)))))

(declare-fun b!1058267 () Bool)

(assert (=> b!1058267 (= e!602023 true)))

(declare-fun lt!466783 () Bool)

(assert (=> b!1058267 (= lt!466783 (contains!6210 Nil!22395 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058268 () Bool)

(declare-fun e!602021 () Bool)

(assert (=> b!1058268 (= e!602021 e!602023)))

(declare-fun res!706837 () Bool)

(assert (=> b!1058268 (=> res!706837 e!602023)))

(declare-fun lt!466788 () (_ BitVec 32))

(assert (=> b!1058268 (= res!706837 (or (bvslt lt!466784 #b00000000000000000000000000000000) (bvsge lt!466788 (size!32622 a!3488)) (bvsge lt!466784 (size!32622 a!3488))))))

(assert (=> b!1058268 (arrayContainsKey!0 a!3488 k!2747 lt!466788)))

(declare-datatypes ((Unit!34694 0))(
  ( (Unit!34695) )
))
(declare-fun lt!466787 () Unit!34694)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66735 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34694)

(assert (=> b!1058268 (= lt!466787 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466788))))

(assert (=> b!1058268 (= lt!466788 (bvadd #b00000000000000000000000000000001 lt!466784))))

(assert (=> b!1058268 (arrayNoDuplicates!0 a!3488 lt!466784 Nil!22395)))

(declare-fun lt!466786 () Unit!34694)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66735 (_ BitVec 32) (_ BitVec 32)) Unit!34694)

(assert (=> b!1058268 (= lt!466786 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466784))))

(declare-fun b!1058260 () Bool)

(assert (=> b!1058260 (= e!602019 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun res!706839 () Bool)

(assert (=> start!93432 (=> (not res!706839) (not e!602022))))

(assert (=> start!93432 (= res!706839 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32622 a!3488)) (bvslt (size!32622 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93432 e!602022))

(assert (=> start!93432 true))

(declare-fun array_inv!24866 (array!66735) Bool)

(assert (=> start!93432 (array_inv!24866 a!3488)))

(declare-fun b!1058269 () Bool)

(assert (=> b!1058269 (= e!602017 (not e!602021))))

(declare-fun res!706840 () Bool)

(assert (=> b!1058269 (=> res!706840 e!602021)))

(assert (=> b!1058269 (= res!706840 (or (bvsgt lt!466784 i!1381) (bvsle i!1381 lt!466784)))))

(assert (=> b!1058269 e!602018))

(declare-fun res!706841 () Bool)

(assert (=> b!1058269 (=> (not res!706841) (not e!602018))))

(assert (=> b!1058269 (= res!706841 (= (select (store (arr!32086 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466784) k!2747))))

(declare-fun b!1058270 () Bool)

(declare-fun res!706842 () Bool)

(assert (=> b!1058270 (=> res!706842 e!602023)))

(declare-fun noDuplicate!1566 (List!22398) Bool)

(assert (=> b!1058270 (= res!706842 (not (noDuplicate!1566 Nil!22395)))))

(assert (= (and start!93432 res!706839) b!1058265))

(assert (= (and b!1058265 res!706844) b!1058259))

(assert (= (and b!1058259 res!706836) b!1058262))

(assert (= (and b!1058262 res!706834) b!1058264))

(assert (= (and b!1058264 res!706838) b!1058261))

(assert (= (and b!1058261 res!706843) b!1058269))

(assert (= (and b!1058269 res!706841) b!1058266))

(assert (= (and b!1058266 (not res!706835)) b!1058260))

(assert (= (and b!1058269 (not res!706840)) b!1058268))

(assert (= (and b!1058268 (not res!706837)) b!1058270))

(assert (= (and b!1058270 (not res!706842)) b!1058263))

(assert (= (and b!1058263 (not res!706833)) b!1058267))

(declare-fun m!977891 () Bool)

(assert (=> b!1058265 m!977891))

(declare-fun m!977893 () Bool)

(assert (=> b!1058263 m!977893))

(declare-fun m!977895 () Bool)

(assert (=> b!1058268 m!977895))

(declare-fun m!977897 () Bool)

(assert (=> b!1058268 m!977897))

(declare-fun m!977899 () Bool)

(assert (=> b!1058268 m!977899))

(declare-fun m!977901 () Bool)

(assert (=> b!1058268 m!977901))

(declare-fun m!977903 () Bool)

(assert (=> b!1058260 m!977903))

(declare-fun m!977905 () Bool)

(assert (=> b!1058267 m!977905))

(declare-fun m!977907 () Bool)

(assert (=> start!93432 m!977907))

(declare-fun m!977909 () Bool)

(assert (=> b!1058261 m!977909))

(declare-fun m!977911 () Bool)

(assert (=> b!1058259 m!977911))

(declare-fun m!977913 () Bool)

(assert (=> b!1058264 m!977913))

(declare-fun m!977915 () Bool)

(assert (=> b!1058264 m!977915))

(declare-fun m!977917 () Bool)

(assert (=> b!1058262 m!977917))

(assert (=> b!1058269 m!977915))

(declare-fun m!977919 () Bool)

(assert (=> b!1058269 m!977919))

(declare-fun m!977921 () Bool)

(assert (=> b!1058270 m!977921))

(push 1)

