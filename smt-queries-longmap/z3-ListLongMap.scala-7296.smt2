; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93232 () Bool)

(assert start!93232)

(declare-fun b!1056926 () Bool)

(declare-fun e!600999 () Bool)

(declare-fun e!601004 () Bool)

(assert (=> b!1056926 (= e!600999 e!601004)))

(declare-fun res!705718 () Bool)

(assert (=> b!1056926 (=> (not res!705718) (not e!601004))))

(declare-datatypes ((array!66611 0))(
  ( (array!66612 (arr!32028 (Array (_ BitVec 32) (_ BitVec 64))) (size!32566 (_ BitVec 32))) )
))
(declare-fun lt!466089 () array!66611)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66611 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056926 (= res!705718 (arrayContainsKey!0 lt!466089 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66611)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1056926 (= lt!466089 (array!66612 (store (arr!32028 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32566 a!3488)))))

(declare-fun b!1056927 () Bool)

(declare-fun res!705710 () Bool)

(assert (=> b!1056927 (=> (not res!705710) (not e!600999))))

(assert (=> b!1056927 (= res!705710 (= (select (arr!32028 a!3488) i!1381) k0!2747))))

(declare-fun b!1056928 () Bool)

(declare-fun e!601000 () Bool)

(assert (=> b!1056928 (= e!601000 true)))

(declare-fun lt!466090 () (_ BitVec 32))

(declare-datatypes ((List!22399 0))(
  ( (Nil!22396) (Cons!22395 (h!23604 (_ BitVec 64)) (t!31697 List!22399)) )
))
(declare-fun arrayNoDuplicates!0 (array!66611 (_ BitVec 32) List!22399) Bool)

(assert (=> b!1056928 (arrayNoDuplicates!0 a!3488 lt!466090 Nil!22396)))

(declare-datatypes ((Unit!34511 0))(
  ( (Unit!34512) )
))
(declare-fun lt!466088 () Unit!34511)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66611 (_ BitVec 32) (_ BitVec 32)) Unit!34511)

(assert (=> b!1056928 (= lt!466088 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466090))))

(declare-fun res!705712 () Bool)

(assert (=> start!93232 (=> (not res!705712) (not e!600999))))

(assert (=> start!93232 (= res!705712 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32566 a!3488)) (bvslt (size!32566 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93232 e!600999))

(assert (=> start!93232 true))

(declare-fun array_inv!24811 (array!66611) Bool)

(assert (=> start!93232 (array_inv!24811 a!3488)))

(declare-fun b!1056929 () Bool)

(declare-fun e!601003 () Bool)

(declare-fun e!601002 () Bool)

(assert (=> b!1056929 (= e!601003 e!601002)))

(declare-fun res!705713 () Bool)

(assert (=> b!1056929 (=> res!705713 e!601002)))

(assert (=> b!1056929 (= res!705713 (or (bvsgt lt!466090 i!1381) (bvsle i!1381 lt!466090)))))

(declare-fun b!1056930 () Bool)

(declare-fun res!705715 () Bool)

(assert (=> b!1056930 (=> (not res!705715) (not e!600999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056930 (= res!705715 (validKeyInArray!0 k0!2747))))

(declare-fun b!1056931 () Bool)

(declare-fun e!601005 () Bool)

(assert (=> b!1056931 (= e!601005 (not e!601000))))

(declare-fun res!705716 () Bool)

(assert (=> b!1056931 (=> res!705716 e!601000)))

(assert (=> b!1056931 (= res!705716 (or (bvsgt lt!466090 i!1381) (bvsle i!1381 lt!466090)))))

(assert (=> b!1056931 e!601003))

(declare-fun res!705711 () Bool)

(assert (=> b!1056931 (=> (not res!705711) (not e!601003))))

(assert (=> b!1056931 (= res!705711 (= (select (store (arr!32028 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466090) k0!2747))))

(declare-fun b!1056932 () Bool)

(assert (=> b!1056932 (= e!601004 e!601005)))

(declare-fun res!705717 () Bool)

(assert (=> b!1056932 (=> (not res!705717) (not e!601005))))

(assert (=> b!1056932 (= res!705717 (not (= lt!466090 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66611 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056932 (= lt!466090 (arrayScanForKey!0 lt!466089 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056933 () Bool)

(assert (=> b!1056933 (= e!601002 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1056934 () Bool)

(declare-fun res!705714 () Bool)

(assert (=> b!1056934 (=> (not res!705714) (not e!600999))))

(assert (=> b!1056934 (= res!705714 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22396))))

(assert (= (and start!93232 res!705712) b!1056934))

(assert (= (and b!1056934 res!705714) b!1056930))

(assert (= (and b!1056930 res!705715) b!1056927))

(assert (= (and b!1056927 res!705710) b!1056926))

(assert (= (and b!1056926 res!705718) b!1056932))

(assert (= (and b!1056932 res!705717) b!1056931))

(assert (= (and b!1056931 res!705711) b!1056929))

(assert (= (and b!1056929 (not res!705713)) b!1056933))

(assert (= (and b!1056931 (not res!705716)) b!1056928))

(declare-fun m!976175 () Bool)

(assert (=> b!1056934 m!976175))

(declare-fun m!976177 () Bool)

(assert (=> b!1056927 m!976177))

(declare-fun m!976179 () Bool)

(assert (=> b!1056933 m!976179))

(declare-fun m!976181 () Bool)

(assert (=> b!1056930 m!976181))

(declare-fun m!976183 () Bool)

(assert (=> start!93232 m!976183))

(declare-fun m!976185 () Bool)

(assert (=> b!1056926 m!976185))

(declare-fun m!976187 () Bool)

(assert (=> b!1056926 m!976187))

(declare-fun m!976189 () Bool)

(assert (=> b!1056932 m!976189))

(declare-fun m!976191 () Bool)

(assert (=> b!1056928 m!976191))

(declare-fun m!976193 () Bool)

(assert (=> b!1056928 m!976193))

(assert (=> b!1056931 m!976187))

(declare-fun m!976195 () Bool)

(assert (=> b!1056931 m!976195))

(check-sat (not b!1056932) (not b!1056926) (not b!1056933) (not b!1056930) (not start!93232) (not b!1056928) (not b!1056934))
(check-sat)
