; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93238 () Bool)

(assert start!93238)

(declare-fun b!1057007 () Bool)

(declare-fun e!601064 () Bool)

(assert (=> b!1057007 (= e!601064 true)))

(declare-datatypes ((array!66617 0))(
  ( (array!66618 (arr!32031 (Array (_ BitVec 32) (_ BitVec 64))) (size!32569 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66617)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun lt!466119 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057007 (arrayContainsKey!0 a!3488 k0!2747 lt!466119)))

(declare-datatypes ((Unit!34517 0))(
  ( (Unit!34518) )
))
(declare-fun lt!466123 () Unit!34517)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66617 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34517)

(assert (=> b!1057007 (= lt!466123 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466119))))

(declare-fun lt!466120 () (_ BitVec 32))

(assert (=> b!1057007 (= lt!466119 (bvadd #b00000000000000000000000000000001 lt!466120))))

(declare-datatypes ((List!22402 0))(
  ( (Nil!22399) (Cons!22398 (h!23607 (_ BitVec 64)) (t!31700 List!22402)) )
))
(declare-fun arrayNoDuplicates!0 (array!66617 (_ BitVec 32) List!22402) Bool)

(assert (=> b!1057007 (arrayNoDuplicates!0 a!3488 lt!466120 Nil!22399)))

(declare-fun lt!466121 () Unit!34517)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66617 (_ BitVec 32) (_ BitVec 32)) Unit!34517)

(assert (=> b!1057007 (= lt!466121 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466120))))

(declare-fun b!1057008 () Bool)

(declare-fun e!601068 () Bool)

(assert (=> b!1057008 (= e!601068 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057009 () Bool)

(declare-fun e!601065 () Bool)

(declare-fun e!601067 () Bool)

(assert (=> b!1057009 (= e!601065 e!601067)))

(declare-fun res!705791 () Bool)

(assert (=> b!1057009 (=> (not res!705791) (not e!601067))))

(assert (=> b!1057009 (= res!705791 (not (= lt!466120 i!1381)))))

(declare-fun lt!466122 () array!66617)

(declare-fun arrayScanForKey!0 (array!66617 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057009 (= lt!466120 (arrayScanForKey!0 lt!466122 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057010 () Bool)

(declare-fun res!705799 () Bool)

(declare-fun e!601063 () Bool)

(assert (=> b!1057010 (=> (not res!705799) (not e!601063))))

(assert (=> b!1057010 (= res!705799 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22399))))

(declare-fun b!1057011 () Bool)

(declare-fun res!705792 () Bool)

(assert (=> b!1057011 (=> (not res!705792) (not e!601063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057011 (= res!705792 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057012 () Bool)

(assert (=> b!1057012 (= e!601063 e!601065)))

(declare-fun res!705798 () Bool)

(assert (=> b!1057012 (=> (not res!705798) (not e!601065))))

(assert (=> b!1057012 (= res!705798 (arrayContainsKey!0 lt!466122 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057012 (= lt!466122 (array!66618 (store (arr!32031 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32569 a!3488)))))

(declare-fun res!705795 () Bool)

(assert (=> start!93238 (=> (not res!705795) (not e!601063))))

(assert (=> start!93238 (= res!705795 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32569 a!3488)) (bvslt (size!32569 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93238 e!601063))

(assert (=> start!93238 true))

(declare-fun array_inv!24814 (array!66617) Bool)

(assert (=> start!93238 (array_inv!24814 a!3488)))

(declare-fun b!1057013 () Bool)

(assert (=> b!1057013 (= e!601067 (not e!601064))))

(declare-fun res!705794 () Bool)

(assert (=> b!1057013 (=> res!705794 e!601064)))

(assert (=> b!1057013 (= res!705794 (or (bvsgt lt!466120 i!1381) (bvsle i!1381 lt!466120)))))

(declare-fun e!601062 () Bool)

(assert (=> b!1057013 e!601062))

(declare-fun res!705797 () Bool)

(assert (=> b!1057013 (=> (not res!705797) (not e!601062))))

(assert (=> b!1057013 (= res!705797 (= (select (store (arr!32031 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466120) k0!2747))))

(declare-fun b!1057014 () Bool)

(assert (=> b!1057014 (= e!601062 e!601068)))

(declare-fun res!705796 () Bool)

(assert (=> b!1057014 (=> res!705796 e!601068)))

(assert (=> b!1057014 (= res!705796 (or (bvsgt lt!466120 i!1381) (bvsle i!1381 lt!466120)))))

(declare-fun b!1057015 () Bool)

(declare-fun res!705793 () Bool)

(assert (=> b!1057015 (=> (not res!705793) (not e!601063))))

(assert (=> b!1057015 (= res!705793 (= (select (arr!32031 a!3488) i!1381) k0!2747))))

(assert (= (and start!93238 res!705795) b!1057010))

(assert (= (and b!1057010 res!705799) b!1057011))

(assert (= (and b!1057011 res!705792) b!1057015))

(assert (= (and b!1057015 res!705793) b!1057012))

(assert (= (and b!1057012 res!705798) b!1057009))

(assert (= (and b!1057009 res!705791) b!1057013))

(assert (= (and b!1057013 res!705797) b!1057014))

(assert (= (and b!1057014 (not res!705796)) b!1057008))

(assert (= (and b!1057013 (not res!705794)) b!1057007))

(declare-fun m!976241 () Bool)

(assert (=> b!1057009 m!976241))

(declare-fun m!976243 () Bool)

(assert (=> b!1057010 m!976243))

(declare-fun m!976245 () Bool)

(assert (=> b!1057013 m!976245))

(declare-fun m!976247 () Bool)

(assert (=> b!1057013 m!976247))

(declare-fun m!976249 () Bool)

(assert (=> b!1057012 m!976249))

(assert (=> b!1057012 m!976245))

(declare-fun m!976251 () Bool)

(assert (=> b!1057007 m!976251))

(declare-fun m!976253 () Bool)

(assert (=> b!1057007 m!976253))

(declare-fun m!976255 () Bool)

(assert (=> b!1057007 m!976255))

(declare-fun m!976257 () Bool)

(assert (=> b!1057007 m!976257))

(declare-fun m!976259 () Bool)

(assert (=> b!1057015 m!976259))

(declare-fun m!976261 () Bool)

(assert (=> start!93238 m!976261))

(declare-fun m!976263 () Bool)

(assert (=> b!1057011 m!976263))

(declare-fun m!976265 () Bool)

(assert (=> b!1057008 m!976265))

(check-sat (not b!1057009) (not start!93238) (not b!1057008) (not b!1057010) (not b!1057007) (not b!1057012) (not b!1057011))
(check-sat)
