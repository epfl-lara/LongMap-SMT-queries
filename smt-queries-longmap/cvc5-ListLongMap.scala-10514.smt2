; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123924 () Bool)

(assert start!123924)

(declare-fun b!1435897 () Bool)

(declare-fun e!810331 () Bool)

(declare-datatypes ((List!33624 0))(
  ( (Nil!33621) (Cons!33620 (h!34955 (_ BitVec 64)) (t!48318 List!33624)) )
))
(declare-fun noDuplicate!2612 (List!33624) Bool)

(assert (=> b!1435897 (= e!810331 (not (noDuplicate!2612 Nil!33621)))))

(declare-fun b!1435898 () Bool)

(declare-fun res!968886 () Bool)

(assert (=> b!1435898 (=> (not res!968886) (not e!810331))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97647 0))(
  ( (array!97648 (arr!47123 (Array (_ BitVec 32) (_ BitVec 64))) (size!47673 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97647)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1435898 (= res!968886 (and (= (size!47673 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47673 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47673 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1435899 () Bool)

(declare-fun res!968890 () Bool)

(assert (=> b!1435899 (=> (not res!968890) (not e!810331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435899 (= res!968890 (validKeyInArray!0 (select (arr!47123 a!2862) i!1006)))))

(declare-fun res!968888 () Bool)

(assert (=> start!123924 (=> (not res!968888) (not e!810331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123924 (= res!968888 (validMask!0 mask!2687))))

(assert (=> start!123924 e!810331))

(assert (=> start!123924 true))

(declare-fun array_inv!36151 (array!97647) Bool)

(assert (=> start!123924 (array_inv!36151 a!2862)))

(declare-fun b!1435900 () Bool)

(declare-fun res!968885 () Bool)

(assert (=> b!1435900 (=> (not res!968885) (not e!810331))))

(assert (=> b!1435900 (= res!968885 (validKeyInArray!0 (select (arr!47123 a!2862) j!93)))))

(declare-fun b!1435901 () Bool)

(declare-fun res!968887 () Bool)

(assert (=> b!1435901 (=> (not res!968887) (not e!810331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97647 (_ BitVec 32)) Bool)

(assert (=> b!1435901 (= res!968887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1435902 () Bool)

(declare-fun res!968889 () Bool)

(assert (=> b!1435902 (=> (not res!968889) (not e!810331))))

(assert (=> b!1435902 (= res!968889 (and (bvsle #b00000000000000000000000000000000 (size!47673 a!2862)) (bvslt (size!47673 a!2862) #b01111111111111111111111111111111)))))

(assert (= (and start!123924 res!968888) b!1435898))

(assert (= (and b!1435898 res!968886) b!1435899))

(assert (= (and b!1435899 res!968890) b!1435900))

(assert (= (and b!1435900 res!968885) b!1435901))

(assert (= (and b!1435901 res!968887) b!1435902))

(assert (= (and b!1435902 res!968889) b!1435897))

(declare-fun m!1325259 () Bool)

(assert (=> b!1435897 m!1325259))

(declare-fun m!1325261 () Bool)

(assert (=> b!1435901 m!1325261))

(declare-fun m!1325263 () Bool)

(assert (=> start!123924 m!1325263))

(declare-fun m!1325265 () Bool)

(assert (=> start!123924 m!1325265))

(declare-fun m!1325267 () Bool)

(assert (=> b!1435899 m!1325267))

(assert (=> b!1435899 m!1325267))

(declare-fun m!1325269 () Bool)

(assert (=> b!1435899 m!1325269))

(declare-fun m!1325271 () Bool)

(assert (=> b!1435900 m!1325271))

(assert (=> b!1435900 m!1325271))

(declare-fun m!1325273 () Bool)

(assert (=> b!1435900 m!1325273))

(push 1)

(assert (not b!1435897))

(assert (not b!1435899))

(assert (not start!123924))

(assert (not b!1435901))

(assert (not b!1435900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154453 () Bool)

(declare-fun res!968943 () Bool)

(declare-fun e!810364 () Bool)

(assert (=> d!154453 (=> res!968943 e!810364)))

(assert (=> d!154453 (= res!968943 (is-Nil!33621 Nil!33621))))

(assert (=> d!154453 (= (noDuplicate!2612 Nil!33621) e!810364)))

(declare-fun b!1435961 () Bool)

(declare-fun e!810365 () Bool)

(assert (=> b!1435961 (= e!810364 e!810365)))

(declare-fun res!968944 () Bool)

(assert (=> b!1435961 (=> (not res!968944) (not e!810365))))

(declare-fun contains!9879 (List!33624 (_ BitVec 64)) Bool)

(assert (=> b!1435961 (= res!968944 (not (contains!9879 (t!48318 Nil!33621) (h!34955 Nil!33621))))))

(declare-fun b!1435962 () Bool)

(assert (=> b!1435962 (= e!810365 (noDuplicate!2612 (t!48318 Nil!33621)))))

(assert (= (and d!154453 (not res!968943)) b!1435961))

(assert (= (and b!1435961 res!968944) b!1435962))

(declare-fun m!1325323 () Bool)

(assert (=> b!1435961 m!1325323))

(declare-fun m!1325325 () Bool)

(assert (=> b!1435962 m!1325325))

(assert (=> b!1435897 d!154453))

(declare-fun d!154457 () Bool)

(assert (=> d!154457 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!123924 d!154457))

(declare-fun d!154465 () Bool)

(assert (=> d!154465 (= (array_inv!36151 a!2862) (bvsge (size!47673 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!123924 d!154465))

(declare-fun d!154467 () Bool)

(assert (=> d!154467 (= (validKeyInArray!0 (select (arr!47123 a!2862) i!1006)) (and (not (= (select (arr!47123 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47123 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435899 d!154467))

(declare-fun d!154469 () Bool)

(assert (=> d!154469 (= (validKeyInArray!0 (select (arr!47123 a!2862) j!93)) (and (not (= (select (arr!47123 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47123 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1435900 d!154469))

(declare-fun b!1435989 () Bool)

(declare-fun e!810389 () Bool)

(declare-fun call!67579 () Bool)

(assert (=> b!1435989 (= e!810389 call!67579)))

(declare-fun b!1435990 () Bool)

(declare-fun e!810387 () Bool)

(assert (=> b!1435990 (= e!810387 call!67579)))

(declare-fun b!1435991 () Bool)

(declare-fun e!810388 () Bool)

(assert (=> b!1435991 (= e!810388 e!810387)))

(declare-fun c!133017 () Bool)

(assert (=> b!1435991 (= c!133017 (validKeyInArray!0 (select (arr!47123 a!2862) #b00000000000000000000000000000000)))))

