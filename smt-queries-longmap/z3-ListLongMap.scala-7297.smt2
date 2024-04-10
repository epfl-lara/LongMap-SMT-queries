; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93242 () Bool)

(assert start!93242)

(declare-fun b!1057185 () Bool)

(declare-fun res!705889 () Bool)

(declare-fun e!601179 () Bool)

(assert (=> b!1057185 (=> (not res!705889) (not e!601179))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1057185 (= res!705889 (validKeyInArray!0 k0!2747))))

(declare-fun b!1057186 () Bool)

(declare-fun e!601174 () Bool)

(declare-datatypes ((array!66680 0))(
  ( (array!66681 (arr!32063 (Array (_ BitVec 32) (_ BitVec 64))) (size!32599 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66680)

(declare-fun i!1381 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!66680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1057186 (= e!601174 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1057187 () Bool)

(declare-fun e!601178 () Bool)

(assert (=> b!1057187 (= e!601179 e!601178)))

(declare-fun res!705891 () Bool)

(assert (=> b!1057187 (=> (not res!705891) (not e!601178))))

(declare-fun lt!466336 () array!66680)

(assert (=> b!1057187 (= res!705891 (arrayContainsKey!0 lt!466336 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1057187 (= lt!466336 (array!66681 (store (arr!32063 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32599 a!3488)))))

(declare-fun b!1057188 () Bool)

(declare-fun e!601177 () Bool)

(assert (=> b!1057188 (= e!601178 e!601177)))

(declare-fun res!705890 () Bool)

(assert (=> b!1057188 (=> (not res!705890) (not e!601177))))

(declare-fun lt!466338 () (_ BitVec 32))

(assert (=> b!1057188 (= res!705890 (not (= lt!466338 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66680 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1057188 (= lt!466338 (arrayScanForKey!0 lt!466336 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1057189 () Bool)

(declare-fun e!601176 () Bool)

(assert (=> b!1057189 (= e!601176 true)))

(declare-fun lt!466335 () (_ BitVec 32))

(assert (=> b!1057189 (arrayContainsKey!0 a!3488 k0!2747 lt!466335)))

(declare-datatypes ((Unit!34648 0))(
  ( (Unit!34649) )
))
(declare-fun lt!466337 () Unit!34648)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66680 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34648)

(assert (=> b!1057189 (= lt!466337 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!466335))))

(assert (=> b!1057189 (= lt!466335 (bvadd #b00000000000000000000000000000001 lt!466338))))

(declare-datatypes ((List!22375 0))(
  ( (Nil!22372) (Cons!22371 (h!23580 (_ BitVec 64)) (t!31682 List!22375)) )
))
(declare-fun arrayNoDuplicates!0 (array!66680 (_ BitVec 32) List!22375) Bool)

(assert (=> b!1057189 (arrayNoDuplicates!0 a!3488 lt!466338 Nil!22372)))

(declare-fun lt!466334 () Unit!34648)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66680 (_ BitVec 32) (_ BitVec 32)) Unit!34648)

(assert (=> b!1057189 (= lt!466334 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466338))))

(declare-fun b!1057190 () Bool)

(declare-fun res!705886 () Bool)

(assert (=> b!1057190 (=> (not res!705886) (not e!601179))))

(assert (=> b!1057190 (= res!705886 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22372))))

(declare-fun b!1057191 () Bool)

(declare-fun e!601180 () Bool)

(assert (=> b!1057191 (= e!601180 e!601174)))

(declare-fun res!705888 () Bool)

(assert (=> b!1057191 (=> res!705888 e!601174)))

(assert (=> b!1057191 (= res!705888 (or (bvsgt lt!466338 i!1381) (bvsle i!1381 lt!466338)))))

(declare-fun b!1057192 () Bool)

(assert (=> b!1057192 (= e!601177 (not e!601176))))

(declare-fun res!705892 () Bool)

(assert (=> b!1057192 (=> res!705892 e!601176)))

(assert (=> b!1057192 (= res!705892 (or (bvsgt lt!466338 i!1381) (bvsle i!1381 lt!466338)))))

(assert (=> b!1057192 e!601180))

(declare-fun res!705885 () Bool)

(assert (=> b!1057192 (=> (not res!705885) (not e!601180))))

(assert (=> b!1057192 (= res!705885 (= (select (store (arr!32063 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466338) k0!2747))))

(declare-fun res!705893 () Bool)

(assert (=> start!93242 (=> (not res!705893) (not e!601179))))

(assert (=> start!93242 (= res!705893 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32599 a!3488)) (bvslt (size!32599 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93242 e!601179))

(assert (=> start!93242 true))

(declare-fun array_inv!24843 (array!66680) Bool)

(assert (=> start!93242 (array_inv!24843 a!3488)))

(declare-fun b!1057193 () Bool)

(declare-fun res!705887 () Bool)

(assert (=> b!1057193 (=> (not res!705887) (not e!601179))))

(assert (=> b!1057193 (= res!705887 (= (select (arr!32063 a!3488) i!1381) k0!2747))))

(assert (= (and start!93242 res!705893) b!1057190))

(assert (= (and b!1057190 res!705886) b!1057185))

(assert (= (and b!1057185 res!705889) b!1057193))

(assert (= (and b!1057193 res!705887) b!1057187))

(assert (= (and b!1057187 res!705891) b!1057188))

(assert (= (and b!1057188 res!705890) b!1057192))

(assert (= (and b!1057192 res!705885) b!1057191))

(assert (= (and b!1057191 (not res!705888)) b!1057186))

(assert (= (and b!1057192 (not res!705892)) b!1057189))

(declare-fun m!976891 () Bool)

(assert (=> b!1057188 m!976891))

(declare-fun m!976893 () Bool)

(assert (=> b!1057192 m!976893))

(declare-fun m!976895 () Bool)

(assert (=> b!1057192 m!976895))

(declare-fun m!976897 () Bool)

(assert (=> b!1057190 m!976897))

(declare-fun m!976899 () Bool)

(assert (=> b!1057185 m!976899))

(declare-fun m!976901 () Bool)

(assert (=> b!1057193 m!976901))

(declare-fun m!976903 () Bool)

(assert (=> b!1057189 m!976903))

(declare-fun m!976905 () Bool)

(assert (=> b!1057189 m!976905))

(declare-fun m!976907 () Bool)

(assert (=> b!1057189 m!976907))

(declare-fun m!976909 () Bool)

(assert (=> b!1057189 m!976909))

(declare-fun m!976911 () Bool)

(assert (=> b!1057186 m!976911))

(declare-fun m!976913 () Bool)

(assert (=> b!1057187 m!976913))

(assert (=> b!1057187 m!976893))

(declare-fun m!976915 () Bool)

(assert (=> start!93242 m!976915))

(check-sat (not b!1057186) (not b!1057188) (not b!1057187) (not b!1057190) (not start!93242) (not b!1057189) (not b!1057185))
(check-sat)
