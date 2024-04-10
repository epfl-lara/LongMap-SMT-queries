; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93444 () Bool)

(assert start!93444)

(declare-fun b!1058442 () Bool)

(declare-fun e!602149 () Bool)

(declare-fun e!602152 () Bool)

(assert (=> b!1058442 (= e!602149 (not e!602152))))

(declare-fun res!707022 () Bool)

(assert (=> b!1058442 (=> res!707022 e!602152)))

(declare-fun lt!466891 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058442 (= res!707022 (or (bvsgt lt!466891 i!1381) (bvsle i!1381 lt!466891)))))

(declare-fun e!602151 () Bool)

(assert (=> b!1058442 e!602151))

(declare-fun res!707024 () Bool)

(assert (=> b!1058442 (=> (not res!707024) (not e!602151))))

(declare-datatypes ((array!66747 0))(
  ( (array!66748 (arr!32092 (Array (_ BitVec 32) (_ BitVec 64))) (size!32628 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66747)

(declare-fun k!2747 () (_ BitVec 64))

(assert (=> b!1058442 (= res!707024 (= (select (store (arr!32092 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466891) k!2747))))

(declare-fun e!602154 () Bool)

(declare-fun b!1058443 () Bool)

(declare-fun arrayContainsKey!0 (array!66747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058443 (= e!602154 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1058444 () Bool)

(declare-fun res!707021 () Bool)

(declare-fun e!602153 () Bool)

(assert (=> b!1058444 (=> (not res!707021) (not e!602153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058444 (= res!707021 (validKeyInArray!0 k!2747))))

(declare-fun b!1058445 () Bool)

(declare-fun e!602150 () Bool)

(assert (=> b!1058445 (= e!602153 e!602150)))

(declare-fun res!707019 () Bool)

(assert (=> b!1058445 (=> (not res!707019) (not e!602150))))

(declare-fun lt!466892 () array!66747)

(assert (=> b!1058445 (= res!707019 (arrayContainsKey!0 lt!466892 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058445 (= lt!466892 (array!66748 (store (arr!32092 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32628 a!3488)))))

(declare-fun b!1058446 () Bool)

(assert (=> b!1058446 (= e!602151 e!602154)))

(declare-fun res!707018 () Bool)

(assert (=> b!1058446 (=> res!707018 e!602154)))

(assert (=> b!1058446 (= res!707018 (or (bvsgt lt!466891 i!1381) (bvsle i!1381 lt!466891)))))

(declare-fun b!1058447 () Bool)

(assert (=> b!1058447 (= e!602150 e!602149)))

(declare-fun res!707020 () Bool)

(assert (=> b!1058447 (=> (not res!707020) (not e!602149))))

(assert (=> b!1058447 (= res!707020 (not (= lt!466891 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66747 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058447 (= lt!466891 (arrayScanForKey!0 lt!466892 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058448 () Bool)

(declare-fun res!707016 () Bool)

(assert (=> b!1058448 (=> (not res!707016) (not e!602153))))

(declare-datatypes ((List!22404 0))(
  ( (Nil!22401) (Cons!22400 (h!23609 (_ BitVec 64)) (t!31711 List!22404)) )
))
(declare-fun arrayNoDuplicates!0 (array!66747 (_ BitVec 32) List!22404) Bool)

(assert (=> b!1058448 (= res!707016 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22401))))

(declare-fun res!707017 () Bool)

(assert (=> start!93444 (=> (not res!707017) (not e!602153))))

(assert (=> start!93444 (= res!707017 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32628 a!3488)) (bvslt (size!32628 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93444 e!602153))

(assert (=> start!93444 true))

(declare-fun array_inv!24872 (array!66747) Bool)

(assert (=> start!93444 (array_inv!24872 a!3488)))

(declare-fun b!1058449 () Bool)

(assert (=> b!1058449 (= e!602152 true)))

(assert (=> b!1058449 (not (= (select (arr!32092 a!3488) lt!466891) k!2747))))

(declare-datatypes ((Unit!34706 0))(
  ( (Unit!34707) )
))
(declare-fun lt!466894 () Unit!34706)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66747 (_ BitVec 64) (_ BitVec 32) List!22404) Unit!34706)

(assert (=> b!1058449 (= lt!466894 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k!2747 lt!466891 Nil!22401))))

(declare-fun lt!466893 () (_ BitVec 32))

(assert (=> b!1058449 (arrayContainsKey!0 a!3488 k!2747 lt!466893)))

(declare-fun lt!466895 () Unit!34706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66747 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34706)

(assert (=> b!1058449 (= lt!466895 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466893))))

(assert (=> b!1058449 (= lt!466893 (bvadd #b00000000000000000000000000000001 lt!466891))))

(assert (=> b!1058449 (arrayNoDuplicates!0 a!3488 lt!466891 Nil!22401)))

(declare-fun lt!466896 () Unit!34706)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66747 (_ BitVec 32) (_ BitVec 32)) Unit!34706)

(assert (=> b!1058449 (= lt!466896 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466891))))

(declare-fun b!1058450 () Bool)

(declare-fun res!707023 () Bool)

(assert (=> b!1058450 (=> (not res!707023) (not e!602153))))

(assert (=> b!1058450 (= res!707023 (= (select (arr!32092 a!3488) i!1381) k!2747))))

(assert (= (and start!93444 res!707017) b!1058448))

(assert (= (and b!1058448 res!707016) b!1058444))

(assert (= (and b!1058444 res!707021) b!1058450))

(assert (= (and b!1058450 res!707023) b!1058445))

(assert (= (and b!1058445 res!707019) b!1058447))

(assert (= (and b!1058447 res!707020) b!1058442))

(assert (= (and b!1058442 res!707024) b!1058446))

(assert (= (and b!1058446 (not res!707018)) b!1058443))

(assert (= (and b!1058442 (not res!707022)) b!1058449))

(declare-fun m!978077 () Bool)

(assert (=> b!1058448 m!978077))

(declare-fun m!978079 () Bool)

(assert (=> b!1058442 m!978079))

(declare-fun m!978081 () Bool)

(assert (=> b!1058442 m!978081))

(declare-fun m!978083 () Bool)

(assert (=> b!1058450 m!978083))

(declare-fun m!978085 () Bool)

(assert (=> b!1058449 m!978085))

(declare-fun m!978087 () Bool)

(assert (=> b!1058449 m!978087))

(declare-fun m!978089 () Bool)

(assert (=> b!1058449 m!978089))

(declare-fun m!978091 () Bool)

(assert (=> b!1058449 m!978091))

(declare-fun m!978093 () Bool)

(assert (=> b!1058449 m!978093))

(declare-fun m!978095 () Bool)

(assert (=> b!1058449 m!978095))

(declare-fun m!978097 () Bool)

(assert (=> b!1058444 m!978097))

(declare-fun m!978099 () Bool)

(assert (=> b!1058443 m!978099))

(declare-fun m!978101 () Bool)

(assert (=> start!93444 m!978101))

(declare-fun m!978103 () Bool)

(assert (=> b!1058447 m!978103))

(declare-fun m!978105 () Bool)

(assert (=> b!1058445 m!978105))

(assert (=> b!1058445 m!978079))

(push 1)

