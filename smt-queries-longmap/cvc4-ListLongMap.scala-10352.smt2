; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121732 () Bool)

(assert start!121732)

(declare-fun b!1413933 () Bool)

(declare-fun res!950689 () Bool)

(declare-fun e!800201 () Bool)

(assert (=> b!1413933 (=> (not res!950689) (not e!800201))))

(declare-datatypes ((array!96607 0))(
  ( (array!96608 (arr!46639 (Array (_ BitVec 32) (_ BitVec 64))) (size!47189 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96607)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96607 (_ BitVec 32)) Bool)

(assert (=> b!1413933 (= res!950689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1413934 () Bool)

(declare-fun e!800199 () Bool)

(declare-fun e!800197 () Bool)

(assert (=> b!1413934 (= e!800199 e!800197)))

(declare-fun res!950694 () Bool)

(assert (=> b!1413934 (=> res!950694 e!800197)))

(declare-datatypes ((SeekEntryResult!10950 0))(
  ( (MissingZero!10950 (index!46183 (_ BitVec 32))) (Found!10950 (index!46184 (_ BitVec 32))) (Intermediate!10950 (undefined!11762 Bool) (index!46185 (_ BitVec 32)) (x!127769 (_ BitVec 32))) (Undefined!10950) (MissingVacant!10950 (index!46186 (_ BitVec 32))) )
))
(declare-fun lt!623307 () SeekEntryResult!10950)

(declare-fun lt!623310 () SeekEntryResult!10950)

(assert (=> b!1413934 (= res!950694 (or (= lt!623307 lt!623310) (not (is-Intermediate!10950 lt!623310))))))

(declare-fun lt!623308 () array!96607)

(declare-fun lt!623313 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96607 (_ BitVec 32)) SeekEntryResult!10950)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1413934 (= lt!623310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623313 mask!2840) lt!623313 lt!623308 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1413934 (= lt!623313 (select (store (arr!46639 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1413934 (= lt!623308 (array!96608 (store (arr!46639 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47189 a!2901)))))

(declare-fun b!1413935 () Bool)

(declare-fun res!950687 () Bool)

(assert (=> b!1413935 (=> (not res!950687) (not e!800201))))

(declare-datatypes ((List!33158 0))(
  ( (Nil!33155) (Cons!33154 (h!34432 (_ BitVec 64)) (t!47852 List!33158)) )
))
(declare-fun arrayNoDuplicates!0 (array!96607 (_ BitVec 32) List!33158) Bool)

(assert (=> b!1413935 (= res!950687 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33155))))

(declare-fun e!800196 () Bool)

(declare-fun b!1413936 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96607 (_ BitVec 32)) SeekEntryResult!10950)

(assert (=> b!1413936 (= e!800196 (= (seekEntryOrOpen!0 (select (arr!46639 a!2901) j!112) a!2901 mask!2840) (Found!10950 j!112)))))

(declare-fun b!1413937 () Bool)

(declare-fun res!950691 () Bool)

(assert (=> b!1413937 (=> (not res!950691) (not e!800201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1413937 (= res!950691 (validKeyInArray!0 (select (arr!46639 a!2901) j!112)))))

(declare-fun e!800200 () Bool)

(declare-fun b!1413938 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96607 (_ BitVec 32)) SeekEntryResult!10950)

(assert (=> b!1413938 (= e!800200 (= (seekEntryOrOpen!0 lt!623313 lt!623308 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127769 lt!623310) (index!46185 lt!623310) (index!46185 lt!623310) (select (arr!46639 a!2901) j!112) lt!623308 mask!2840)))))

(declare-fun b!1413939 () Bool)

(declare-fun res!950693 () Bool)

(assert (=> b!1413939 (=> (not res!950693) (not e!800201))))

(assert (=> b!1413939 (= res!950693 (and (= (size!47189 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47189 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47189 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!950690 () Bool)

(assert (=> start!121732 (=> (not res!950690) (not e!800201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121732 (= res!950690 (validMask!0 mask!2840))))

(assert (=> start!121732 e!800201))

(assert (=> start!121732 true))

(declare-fun array_inv!35667 (array!96607) Bool)

(assert (=> start!121732 (array_inv!35667 a!2901)))

(declare-fun b!1413940 () Bool)

(declare-fun res!950692 () Bool)

(assert (=> b!1413940 (=> (not res!950692) (not e!800201))))

(assert (=> b!1413940 (= res!950692 (validKeyInArray!0 (select (arr!46639 a!2901) i!1037)))))

(declare-fun b!1413941 () Bool)

(assert (=> b!1413941 (= e!800197 (or (bvslt (x!127769 lt!623307) #b00000000000000000000000000000000) (bvsgt (x!127769 lt!623307) #b01111111111111111111111111111110) (and (bvsge (x!127769 lt!623310) #b00000000000000000000000000000000) (bvsle (x!127769 lt!623310) #b01111111111111111111111111111110))))))

(assert (=> b!1413941 e!800200))

(declare-fun res!950688 () Bool)

(assert (=> b!1413941 (=> (not res!950688) (not e!800200))))

(assert (=> b!1413941 (= res!950688 (and (not (undefined!11762 lt!623310)) (= (index!46185 lt!623310) i!1037) (bvslt (x!127769 lt!623310) (x!127769 lt!623307)) (= (select (store (arr!46639 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46185 lt!623310)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47874 0))(
  ( (Unit!47875) )
))
(declare-fun lt!623311 () Unit!47874)

(declare-fun lt!623309 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47874)

(assert (=> b!1413941 (= lt!623311 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623309 (x!127769 lt!623307) (index!46185 lt!623307) (x!127769 lt!623310) (index!46185 lt!623310) (undefined!11762 lt!623310) mask!2840))))

(declare-fun b!1413942 () Bool)

(assert (=> b!1413942 (= e!800201 (not e!800199))))

(declare-fun res!950695 () Bool)

(assert (=> b!1413942 (=> res!950695 e!800199)))

(assert (=> b!1413942 (= res!950695 (or (not (is-Intermediate!10950 lt!623307)) (undefined!11762 lt!623307)))))

(assert (=> b!1413942 e!800196))

(declare-fun res!950686 () Bool)

(assert (=> b!1413942 (=> (not res!950686) (not e!800196))))

(assert (=> b!1413942 (= res!950686 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623312 () Unit!47874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47874)

(assert (=> b!1413942 (= lt!623312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1413942 (= lt!623307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623309 (select (arr!46639 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1413942 (= lt!623309 (toIndex!0 (select (arr!46639 a!2901) j!112) mask!2840))))

(assert (= (and start!121732 res!950690) b!1413939))

(assert (= (and b!1413939 res!950693) b!1413940))

(assert (= (and b!1413940 res!950692) b!1413937))

(assert (= (and b!1413937 res!950691) b!1413933))

(assert (= (and b!1413933 res!950689) b!1413935))

(assert (= (and b!1413935 res!950687) b!1413942))

(assert (= (and b!1413942 res!950686) b!1413936))

(assert (= (and b!1413942 (not res!950695)) b!1413934))

(assert (= (and b!1413934 (not res!950694)) b!1413941))

(assert (= (and b!1413941 res!950688) b!1413938))

(declare-fun m!1304319 () Bool)

(assert (=> b!1413933 m!1304319))

(declare-fun m!1304321 () Bool)

(assert (=> b!1413941 m!1304321))

(declare-fun m!1304323 () Bool)

(assert (=> b!1413941 m!1304323))

(declare-fun m!1304325 () Bool)

(assert (=> b!1413941 m!1304325))

(declare-fun m!1304327 () Bool)

(assert (=> b!1413937 m!1304327))

(assert (=> b!1413937 m!1304327))

(declare-fun m!1304329 () Bool)

(assert (=> b!1413937 m!1304329))

(declare-fun m!1304331 () Bool)

(assert (=> b!1413934 m!1304331))

(assert (=> b!1413934 m!1304331))

(declare-fun m!1304333 () Bool)

(assert (=> b!1413934 m!1304333))

(assert (=> b!1413934 m!1304321))

(declare-fun m!1304335 () Bool)

(assert (=> b!1413934 m!1304335))

(declare-fun m!1304337 () Bool)

(assert (=> b!1413940 m!1304337))

(assert (=> b!1413940 m!1304337))

(declare-fun m!1304339 () Bool)

(assert (=> b!1413940 m!1304339))

(declare-fun m!1304341 () Bool)

(assert (=> b!1413938 m!1304341))

(assert (=> b!1413938 m!1304327))

(assert (=> b!1413938 m!1304327))

(declare-fun m!1304343 () Bool)

(assert (=> b!1413938 m!1304343))

(assert (=> b!1413942 m!1304327))

(declare-fun m!1304345 () Bool)

(assert (=> b!1413942 m!1304345))

(assert (=> b!1413942 m!1304327))

(declare-fun m!1304347 () Bool)

(assert (=> b!1413942 m!1304347))

(assert (=> b!1413942 m!1304327))

(declare-fun m!1304349 () Bool)

(assert (=> b!1413942 m!1304349))

(declare-fun m!1304351 () Bool)

(assert (=> b!1413942 m!1304351))

(declare-fun m!1304353 () Bool)

(assert (=> start!121732 m!1304353))

(declare-fun m!1304355 () Bool)

(assert (=> start!121732 m!1304355))

(declare-fun m!1304357 () Bool)

(assert (=> b!1413935 m!1304357))

(assert (=> b!1413936 m!1304327))

(assert (=> b!1413936 m!1304327))

(declare-fun m!1304359 () Bool)

(assert (=> b!1413936 m!1304359))

(push 1)

(assert (not b!1413936))

(assert (not b!1413935))

(assert (not b!1413941))

(assert (not b!1413937))

(assert (not b!1413933))

(assert (not start!121732))

(assert (not b!1413934))

(assert (not b!1413938))

(assert (not b!1413942))

(assert (not b!1413940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1413998 () Bool)

(declare-fun e!800238 () Bool)

(declare-fun call!67123 () Bool)

(assert (=> b!1413998 (= e!800238 call!67123)))

(declare-fun b!1413999 () Bool)

(declare-fun e!800237 () Bool)

(assert (=> b!1413999 (= e!800237 e!800238)))

(declare-fun c!131118 () Bool)

(assert (=> b!1413999 (= c!131118 (validKeyInArray!0 (select (arr!46639 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414000 () Bool)

(assert (=> b!1414000 (= e!800238 call!67123)))

(declare-fun d!152229 () Bool)

(declare-fun res!950712 () Bool)

(declare-fun e!800240 () Bool)

(assert (=> d!152229 (=> res!950712 e!800240)))

(assert (=> d!152229 (= res!950712 (bvsge #b00000000000000000000000000000000 (size!47189 a!2901)))))

(assert (=> d!152229 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33155) e!800240)))

(declare-fun b!1414001 () Bool)

(declare-fun e!800239 () Bool)

(declare-fun contains!9817 (List!33158 (_ BitVec 64)) Bool)

(assert (=> b!1414001 (= e!800239 (contains!9817 Nil!33155 (select (arr!46639 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67120 () Bool)

(assert (=> bm!67120 (= call!67123 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131118 (Cons!33154 (select (arr!46639 a!2901) #b00000000000000000000000000000000) Nil!33155) Nil!33155)))))

(declare-fun b!1414002 () Bool)

(assert (=> b!1414002 (= e!800240 e!800237)))

(declare-fun res!950713 () Bool)

(assert (=> b!1414002 (=> (not res!950713) (not e!800237))))

(assert (=> b!1414002 (= res!950713 (not e!800239))))

(declare-fun res!950711 () Bool)

(assert (=> b!1414002 (=> (not res!950711) (not e!800239))))

(assert (=> b!1414002 (= res!950711 (validKeyInArray!0 (select (arr!46639 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152229 (not res!950712)) b!1414002))

(assert (= (and b!1414002 res!950711) b!1414001))

(assert (= (and b!1414002 res!950713) b!1413999))

(assert (= (and b!1413999 c!131118) b!1414000))

(assert (= (and b!1413999 (not c!131118)) b!1413998))

(assert (= (or b!1414000 b!1413998) bm!67120))

(declare-fun m!1304383 () Bool)

(assert (=> b!1413999 m!1304383))

(assert (=> b!1413999 m!1304383))

(declare-fun m!1304385 () Bool)

(assert (=> b!1413999 m!1304385))

(assert (=> b!1414001 m!1304383))

(assert (=> b!1414001 m!1304383))

(declare-fun m!1304387 () Bool)

(assert (=> b!1414001 m!1304387))

(assert (=> bm!67120 m!1304383))

(declare-fun m!1304389 () Bool)

(assert (=> bm!67120 m!1304389))

(assert (=> b!1414002 m!1304383))

(assert (=> b!1414002 m!1304383))

(assert (=> b!1414002 m!1304385))

(assert (=> b!1413935 d!152229))

(declare-fun d!152237 () Bool)

(assert (=> d!152237 (= (validKeyInArray!0 (select (arr!46639 a!2901) i!1037)) (and (not (= (select (arr!46639 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46639 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1413940 d!152237))

(declare-fun b!1414029 () Bool)

(declare-fun e!800257 () Bool)

(declare-fun e!800258 () Bool)

(assert (=> b!1414029 (= e!800257 e!800258)))

(declare-fun c!131129 () Bool)

(assert (=> b!1414029 (= c!131129 (validKeyInArray!0 (select (arr!46639 a!2901) j!112)))))

(declare-fun b!1414030 () Bool)

(declare-fun call!67126 () Bool)

(assert (=> b!1414030 (= e!800258 call!67126)))

(declare-fun b!1414031 () Bool)

(declare-fun e!800259 () Bool)

(assert (=> b!1414031 (= e!800258 e!800259)))

(declare-fun lt!623344 () (_ BitVec 64))

(assert (=> b!1414031 (= lt!623344 (select (arr!46639 a!2901) j!112))))

(declare-fun lt!623346 () Unit!47874)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96607 (_ BitVec 64) (_ BitVec 32)) Unit!47874)

(assert (=> b!1414031 (= lt!623346 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623344 j!112))))

(declare-fun arrayContainsKey!0 (array!96607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1414031 (arrayContainsKey!0 a!2901 lt!623344 #b00000000000000000000000000000000)))

(declare-fun lt!623345 () Unit!47874)

(assert (=> b!1414031 (= lt!623345 lt!623346)))

(declare-fun res!950721 () Bool)

(assert (=> b!1414031 (= res!950721 (= (seekEntryOrOpen!0 (select (arr!46639 a!2901) j!112) a!2901 mask!2840) (Found!10950 j!112)))))

(assert (=> b!1414031 (=> (not res!950721) (not e!800259))))

(declare-fun d!152239 () Bool)

(declare-fun res!950720 () Bool)

(assert (=> d!152239 (=> res!950720 e!800257)))

(assert (=> d!152239 (= res!950720 (bvsge j!112 (size!47189 a!2901)))))

(assert (=> d!152239 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800257)))

(declare-fun bm!67123 () Bool)

(assert (=> bm!67123 (= call!67126 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414032 () Bool)

(assert (=> b!1414032 (= e!800259 call!67126)))

(assert (= (and d!152239 (not res!950720)) b!1414029))

(assert (= (and b!1414029 c!131129) b!1414031))

(assert (= (and b!1414029 (not c!131129)) b!1414030))

(assert (= (and b!1414031 res!950721) b!1414032))

(assert (= (or b!1414032 b!1414030) bm!67123))

(assert (=> b!1414029 m!1304327))

(assert (=> b!1414029 m!1304327))

(assert (=> b!1414029 m!1304329))

(assert (=> b!1414031 m!1304327))

(declare-fun m!1304413 () Bool)

(assert (=> b!1414031 m!1304413))

(declare-fun m!1304415 () Bool)

(assert (=> b!1414031 m!1304415))

(assert (=> b!1414031 m!1304327))

(assert (=> b!1414031 m!1304359))

(declare-fun m!1304417 () Bool)

(assert (=> bm!67123 m!1304417))

(assert (=> b!1413942 d!152239))

(declare-fun d!152245 () Bool)

(assert (=> d!152245 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623362 () Unit!47874)

(declare-fun choose!38 (array!96607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47874)

(assert (=> d!152245 (= lt!623362 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152245 (validMask!0 mask!2840)))

(assert (=> d!152245 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623362)))

(declare-fun bs!41227 () Bool)

(assert (= bs!41227 d!152245))

(assert (=> bs!41227 m!1304351))

(declare-fun m!1304425 () Bool)

(assert (=> bs!41227 m!1304425))

(assert (=> bs!41227 m!1304353))

(assert (=> b!1413942 d!152245))

(declare-fun b!1414102 () Bool)

(declare-fun e!800302 () SeekEntryResult!10950)

(assert (=> b!1414102 (= e!800302 (Intermediate!10950 true lt!623309 #b00000000000000000000000000000000))))

(declare-fun b!1414103 () Bool)

(declare-fun lt!623383 () SeekEntryResult!10950)

(assert (=> b!1414103 (and (bvsge (index!46185 lt!623383) #b00000000000000000000000000000000) (bvslt (index!46185 lt!623383) (size!47189 a!2901)))))

(declare-fun res!950749 () Bool)

(assert (=> b!1414103 (= res!950749 (= (select (arr!46639 a!2901) (index!46185 lt!623383)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800300 () Bool)

(assert (=> b!1414103 (=> res!950749 e!800300)))

(declare-fun b!1414104 () Bool)

(declare-fun e!800303 () SeekEntryResult!10950)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414104 (= e!800303 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623309 #b00000000000000000000000000000000 mask!2840) (select (arr!46639 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414105 () Bool)

(declare-fun e!800304 () Bool)

(assert (=> b!1414105 (= e!800304 (bvsge (x!127769 lt!623383) #b01111111111111111111111111111110))))

(declare-fun b!1414106 () Bool)

(assert (=> b!1414106 (= e!800303 (Intermediate!10950 false lt!623309 #b00000000000000000000000000000000))))

(declare-fun b!1414107 () Bool)

(assert (=> b!1414107 (and (bvsge (index!46185 lt!623383) #b00000000000000000000000000000000) (bvslt (index!46185 lt!623383) (size!47189 a!2901)))))

(assert (=> b!1414107 (= e!800300 (= (select (arr!46639 a!2901) (index!46185 lt!623383)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!152249 () Bool)

(assert (=> d!152249 e!800304))

(declare-fun c!131153 () Bool)

(assert (=> d!152249 (= c!131153 (and (is-Intermediate!10950 lt!623383) (undefined!11762 lt!623383)))))

(assert (=> d!152249 (= lt!623383 e!800302)))

(declare-fun c!131154 () Bool)

(assert (=> d!152249 (= c!131154 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623382 () (_ BitVec 64))

(assert (=> d!152249 (= lt!623382 (select (arr!46639 a!2901) lt!623309))))

(assert (=> d!152249 (validMask!0 mask!2840)))

(assert (=> d!152249 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623309 (select (arr!46639 a!2901) j!112) a!2901 mask!2840) lt!623383)))

(declare-fun b!1414108 () Bool)

(assert (=> b!1414108 (and (bvsge (index!46185 lt!623383) #b00000000000000000000000000000000) (bvslt (index!46185 lt!623383) (size!47189 a!2901)))))

(declare-fun res!950750 () Bool)

(assert (=> b!1414108 (= res!950750 (= (select (arr!46639 a!2901) (index!46185 lt!623383)) (select (arr!46639 a!2901) j!112)))))

(assert (=> b!1414108 (=> res!950750 e!800300)))

(declare-fun e!800301 () Bool)

(assert (=> b!1414108 (= e!800301 e!800300)))

(declare-fun b!1414109 () Bool)

(assert (=> b!1414109 (= e!800302 e!800303)))

(declare-fun c!131152 () Bool)

(assert (=> b!1414109 (= c!131152 (or (= lt!623382 (select (arr!46639 a!2901) j!112)) (= (bvadd lt!623382 lt!623382) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414110 () Bool)

(assert (=> b!1414110 (= e!800304 e!800301)))

(declare-fun res!950748 () Bool)

(assert (=> b!1414110 (= res!950748 (and (is-Intermediate!10950 lt!623383) (not (undefined!11762 lt!623383)) (bvslt (x!127769 lt!623383) #b01111111111111111111111111111110) (bvsge (x!127769 lt!623383) #b00000000000000000000000000000000) (bvsge (x!127769 lt!623383) #b00000000000000000000000000000000)))))

(assert (=> b!1414110 (=> (not res!950748) (not e!800301))))

(assert (= (and d!152249 c!131154) b!1414102))

(assert (= (and d!152249 (not c!131154)) b!1414109))

(assert (= (and b!1414109 c!131152) b!1414106))

(assert (= (and b!1414109 (not c!131152)) b!1414104))

(assert (= (and d!152249 c!131153) b!1414105))

(assert (= (and d!152249 (not c!131153)) b!1414110))

(assert (= (and b!1414110 res!950748) b!1414108))

(assert (= (and b!1414108 (not res!950750)) b!1414103))

(assert (= (and b!1414103 (not res!950749)) b!1414107))

(declare-fun m!1304437 () Bool)

(assert (=> b!1414103 m!1304437))

(declare-fun m!1304439 () Bool)

(assert (=> b!1414104 m!1304439))

(assert (=> b!1414104 m!1304439))

(assert (=> b!1414104 m!1304327))

(declare-fun m!1304441 () Bool)

(assert (=> b!1414104 m!1304441))

(assert (=> b!1414107 m!1304437))

(assert (=> b!1414108 m!1304437))

(declare-fun m!1304443 () Bool)

(assert (=> d!152249 m!1304443))

(assert (=> d!152249 m!1304353))

(assert (=> b!1413942 d!152249))

(declare-fun d!152261 () Bool)

(declare-fun lt!623397 () (_ BitVec 32))

(declare-fun lt!623396 () (_ BitVec 32))

(assert (=> d!152261 (= lt!623397 (bvmul (bvxor lt!623396 (bvlshr lt!623396 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152261 (= lt!623396 ((_ extract 31 0) (bvand (bvxor (select (arr!46639 a!2901) j!112) (bvlshr (select (arr!46639 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152261 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950751 (let ((h!34434 ((_ extract 31 0) (bvand (bvxor (select (arr!46639 a!2901) j!112) (bvlshr (select (arr!46639 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127777 (bvmul (bvxor h!34434 (bvlshr h!34434 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127777 (bvlshr x!127777 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950751 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950751 #b00000000000000000000000000000000))))))

(assert (=> d!152261 (= (toIndex!0 (select (arr!46639 a!2901) j!112) mask!2840) (bvand (bvxor lt!623397 (bvlshr lt!623397 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1413942 d!152261))

(declare-fun d!152265 () Bool)

(assert (=> d!152265 (and (not (undefined!11762 lt!623310)) (= (index!46185 lt!623310) i!1037) (bvslt (x!127769 lt!623310) (x!127769 lt!623307)))))

(declare-fun lt!623409 () Unit!47874)

(declare-fun choose!62 (array!96607 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47874)

(assert (=> d!152265 (= lt!623409 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623309 (x!127769 lt!623307) (index!46185 lt!623307) (x!127769 lt!623310) (index!46185 lt!623310) (undefined!11762 lt!623310) mask!2840))))

(assert (=> d!152265 (validMask!0 mask!2840)))

(assert (=> d!152265 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623309 (x!127769 lt!623307) (index!46185 lt!623307) (x!127769 lt!623310) (index!46185 lt!623310) (undefined!11762 lt!623310) mask!2840) lt!623409)))

(declare-fun bs!41229 () Bool)

(assert (= bs!41229 d!152265))

(declare-fun m!1304459 () Bool)

(assert (=> bs!41229 m!1304459))

(assert (=> bs!41229 m!1304353))

(assert (=> b!1413941 d!152265))

(declare-fun b!1414181 () Bool)

(declare-fun e!800351 () SeekEntryResult!10950)

(declare-fun lt!623431 () SeekEntryResult!10950)

(assert (=> b!1414181 (= e!800351 (MissingZero!10950 (index!46185 lt!623431)))))

(declare-fun b!1414182 () Bool)

(declare-fun e!800350 () SeekEntryResult!10950)

(assert (=> b!1414182 (= e!800350 (Found!10950 (index!46185 lt!623431)))))

(declare-fun b!1414183 () Bool)

(declare-fun e!800352 () SeekEntryResult!10950)

(assert (=> b!1414183 (= e!800352 Undefined!10950)))

(declare-fun b!1414184 () Bool)

(assert (=> b!1414184 (= e!800352 e!800350)))

(declare-fun lt!623432 () (_ BitVec 64))

(assert (=> b!1414184 (= lt!623432 (select (arr!46639 a!2901) (index!46185 lt!623431)))))

(declare-fun c!131178 () Bool)

(assert (=> b!1414184 (= c!131178 (= lt!623432 (select (arr!46639 a!2901) j!112)))))

(declare-fun b!1414185 () Bool)

(assert (=> b!1414185 (= e!800351 (seekKeyOrZeroReturnVacant!0 (x!127769 lt!623431) (index!46185 lt!623431) (index!46185 lt!623431) (select (arr!46639 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!152271 () Bool)

(declare-fun lt!623430 () SeekEntryResult!10950)

(assert (=> d!152271 (and (or (is-Undefined!10950 lt!623430) (not (is-Found!10950 lt!623430)) (and (bvsge (index!46184 lt!623430) #b00000000000000000000000000000000) (bvslt (index!46184 lt!623430) (size!47189 a!2901)))) (or (is-Undefined!10950 lt!623430) (is-Found!10950 lt!623430) (not (is-MissingZero!10950 lt!623430)) (and (bvsge (index!46183 lt!623430) #b00000000000000000000000000000000) (bvslt (index!46183 lt!623430) (size!47189 a!2901)))) (or (is-Undefined!10950 lt!623430) (is-Found!10950 lt!623430) (is-MissingZero!10950 lt!623430) (not (is-MissingVacant!10950 lt!623430)) (and (bvsge (index!46186 lt!623430) #b00000000000000000000000000000000) (bvslt (index!46186 lt!623430) (size!47189 a!2901)))) (or (is-Undefined!10950 lt!623430) (ite (is-Found!10950 lt!623430) (= (select (arr!46639 a!2901) (index!46184 lt!623430)) (select (arr!46639 a!2901) j!112)) (ite (is-MissingZero!10950 lt!623430) (= (select (arr!46639 a!2901) (index!46183 lt!623430)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10950 lt!623430) (= (select (arr!46639 a!2901) (index!46186 lt!623430)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152271 (= lt!623430 e!800352)))

(declare-fun c!131177 () Bool)

(assert (=> d!152271 (= c!131177 (and (is-Intermediate!10950 lt!623431) (undefined!11762 lt!623431)))))

(assert (=> d!152271 (= lt!623431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46639 a!2901) j!112) mask!2840) (select (arr!46639 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152271 (validMask!0 mask!2840)))

(assert (=> d!152271 (= (seekEntryOrOpen!0 (select (arr!46639 a!2901) j!112) a!2901 mask!2840) lt!623430)))

(declare-fun b!1414186 () Bool)

(declare-fun c!131179 () Bool)

(assert (=> b!1414186 (= c!131179 (= lt!623432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414186 (= e!800350 e!800351)))

(assert (= (and d!152271 c!131177) b!1414183))

(assert (= (and d!152271 (not c!131177)) b!1414184))

(assert (= (and b!1414184 c!131178) b!1414182))

(assert (= (and b!1414184 (not c!131178)) b!1414186))

(assert (= (and b!1414186 c!131179) b!1414181))

(assert (= (and b!1414186 (not c!131179)) b!1414185))

(declare-fun m!1304495 () Bool)

(assert (=> b!1414184 m!1304495))

(assert (=> b!1414185 m!1304327))

(declare-fun m!1304497 () Bool)

(assert (=> b!1414185 m!1304497))

(assert (=> d!152271 m!1304353))

(declare-fun m!1304499 () Bool)

(assert (=> d!152271 m!1304499))

(declare-fun m!1304501 () Bool)

(assert (=> d!152271 m!1304501))

(declare-fun m!1304503 () Bool)

(assert (=> d!152271 m!1304503))

(assert (=> d!152271 m!1304345))

(assert (=> d!152271 m!1304327))

(declare-fun m!1304505 () Bool)

(assert (=> d!152271 m!1304505))

(assert (=> d!152271 m!1304327))

(assert (=> d!152271 m!1304345))

(assert (=> b!1413936 d!152271))

(declare-fun b!1414199 () Bool)

(declare-fun e!800360 () SeekEntryResult!10950)

(declare-fun lt!623440 () SeekEntryResult!10950)

(assert (=> b!1414199 (= e!800360 (MissingZero!10950 (index!46185 lt!623440)))))

(declare-fun b!1414200 () Bool)

(declare-fun e!800359 () SeekEntryResult!10950)

(assert (=> b!1414200 (= e!800359 (Found!10950 (index!46185 lt!623440)))))

(declare-fun b!1414201 () Bool)

(declare-fun e!800361 () SeekEntryResult!10950)

(assert (=> b!1414201 (= e!800361 Undefined!10950)))

(declare-fun b!1414202 () Bool)

(assert (=> b!1414202 (= e!800361 e!800359)))

(declare-fun lt!623441 () (_ BitVec 64))

(assert (=> b!1414202 (= lt!623441 (select (arr!46639 lt!623308) (index!46185 lt!623440)))))

(declare-fun c!131187 () Bool)

(assert (=> b!1414202 (= c!131187 (= lt!623441 lt!623313))))

(declare-fun b!1414203 () Bool)

(assert (=> b!1414203 (= e!800360 (seekKeyOrZeroReturnVacant!0 (x!127769 lt!623440) (index!46185 lt!623440) (index!46185 lt!623440) lt!623313 lt!623308 mask!2840))))

(declare-fun d!152293 () Bool)

(declare-fun lt!623439 () SeekEntryResult!10950)

(assert (=> d!152293 (and (or (is-Undefined!10950 lt!623439) (not (is-Found!10950 lt!623439)) (and (bvsge (index!46184 lt!623439) #b00000000000000000000000000000000) (bvslt (index!46184 lt!623439) (size!47189 lt!623308)))) (or (is-Undefined!10950 lt!623439) (is-Found!10950 lt!623439) (not (is-MissingZero!10950 lt!623439)) (and (bvsge (index!46183 lt!623439) #b00000000000000000000000000000000) (bvslt (index!46183 lt!623439) (size!47189 lt!623308)))) (or (is-Undefined!10950 lt!623439) (is-Found!10950 lt!623439) (is-MissingZero!10950 lt!623439) (not (is-MissingVacant!10950 lt!623439)) (and (bvsge (index!46186 lt!623439) #b00000000000000000000000000000000) (bvslt (index!46186 lt!623439) (size!47189 lt!623308)))) (or (is-Undefined!10950 lt!623439) (ite (is-Found!10950 lt!623439) (= (select (arr!46639 lt!623308) (index!46184 lt!623439)) lt!623313) (ite (is-MissingZero!10950 lt!623439) (= (select (arr!46639 lt!623308) (index!46183 lt!623439)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10950 lt!623439) (= (select (arr!46639 lt!623308) (index!46186 lt!623439)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152293 (= lt!623439 e!800361)))

(declare-fun c!131186 () Bool)

(assert (=> d!152293 (= c!131186 (and (is-Intermediate!10950 lt!623440) (undefined!11762 lt!623440)))))

(assert (=> d!152293 (= lt!623440 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623313 mask!2840) lt!623313 lt!623308 mask!2840))))

(assert (=> d!152293 (validMask!0 mask!2840)))

(assert (=> d!152293 (= (seekEntryOrOpen!0 lt!623313 lt!623308 mask!2840) lt!623439)))

(declare-fun b!1414204 () Bool)

(declare-fun c!131188 () Bool)

(assert (=> b!1414204 (= c!131188 (= lt!623441 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414204 (= e!800359 e!800360)))

(assert (= (and d!152293 c!131186) b!1414201))

(assert (= (and d!152293 (not c!131186)) b!1414202))

(assert (= (and b!1414202 c!131187) b!1414200))

(assert (= (and b!1414202 (not c!131187)) b!1414204))

(assert (= (and b!1414204 c!131188) b!1414199))

(assert (= (and b!1414204 (not c!131188)) b!1414203))

(declare-fun m!1304507 () Bool)

(assert (=> b!1414202 m!1304507))

(declare-fun m!1304509 () Bool)

(assert (=> b!1414203 m!1304509))

(assert (=> d!152293 m!1304353))

(declare-fun m!1304511 () Bool)

(assert (=> d!152293 m!1304511))

(declare-fun m!1304513 () Bool)

(assert (=> d!152293 m!1304513))

(declare-fun m!1304515 () Bool)

(assert (=> d!152293 m!1304515))

(assert (=> d!152293 m!1304331))

(assert (=> d!152293 m!1304333))

(assert (=> d!152293 m!1304331))

(assert (=> b!1413938 d!152293))

(declare-fun b!1414229 () Bool)

(declare-fun c!131202 () Bool)

(declare-fun lt!623453 () (_ BitVec 64))

(assert (=> b!1414229 (= c!131202 (= lt!623453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800376 () SeekEntryResult!10950)

(declare-fun e!800375 () SeekEntryResult!10950)

(assert (=> b!1414229 (= e!800376 e!800375)))

(declare-fun b!1414230 () Bool)

(assert (=> b!1414230 (= e!800376 (Found!10950 (index!46185 lt!623310)))))

(declare-fun b!1414231 () Bool)

(declare-fun e!800374 () SeekEntryResult!10950)

(assert (=> b!1414231 (= e!800374 Undefined!10950)))

(declare-fun b!1414232 () Bool)

(assert (=> b!1414232 (= e!800374 e!800376)))

(declare-fun c!131203 () Bool)

(assert (=> b!1414232 (= c!131203 (= lt!623453 (select (arr!46639 a!2901) j!112)))))

(declare-fun lt!623452 () SeekEntryResult!10950)

(declare-fun d!152295 () Bool)

(assert (=> d!152295 (and (or (is-Undefined!10950 lt!623452) (not (is-Found!10950 lt!623452)) (and (bvsge (index!46184 lt!623452) #b00000000000000000000000000000000) (bvslt (index!46184 lt!623452) (size!47189 lt!623308)))) (or (is-Undefined!10950 lt!623452) (is-Found!10950 lt!623452) (not (is-MissingVacant!10950 lt!623452)) (not (= (index!46186 lt!623452) (index!46185 lt!623310))) (and (bvsge (index!46186 lt!623452) #b00000000000000000000000000000000) (bvslt (index!46186 lt!623452) (size!47189 lt!623308)))) (or (is-Undefined!10950 lt!623452) (ite (is-Found!10950 lt!623452) (= (select (arr!46639 lt!623308) (index!46184 lt!623452)) (select (arr!46639 a!2901) j!112)) (and (is-MissingVacant!10950 lt!623452) (= (index!46186 lt!623452) (index!46185 lt!623310)) (= (select (arr!46639 lt!623308) (index!46186 lt!623452)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152295 (= lt!623452 e!800374)))

(declare-fun c!131201 () Bool)

(assert (=> d!152295 (= c!131201 (bvsge (x!127769 lt!623310) #b01111111111111111111111111111110))))

(assert (=> d!152295 (= lt!623453 (select (arr!46639 lt!623308) (index!46185 lt!623310)))))

(assert (=> d!152295 (validMask!0 mask!2840)))

(assert (=> d!152295 (= (seekKeyOrZeroReturnVacant!0 (x!127769 lt!623310) (index!46185 lt!623310) (index!46185 lt!623310) (select (arr!46639 a!2901) j!112) lt!623308 mask!2840) lt!623452)))

(declare-fun b!1414233 () Bool)

(assert (=> b!1414233 (= e!800375 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127769 lt!623310) #b00000000000000000000000000000001) (nextIndex!0 (index!46185 lt!623310) (x!127769 lt!623310) mask!2840) (index!46185 lt!623310) (select (arr!46639 a!2901) j!112) lt!623308 mask!2840))))

(declare-fun b!1414234 () Bool)

(assert (=> b!1414234 (= e!800375 (MissingVacant!10950 (index!46185 lt!623310)))))

(assert (= (and d!152295 c!131201) b!1414231))

(assert (= (and d!152295 (not c!131201)) b!1414232))

(assert (= (and b!1414232 c!131203) b!1414230))

(assert (= (and b!1414232 (not c!131203)) b!1414229))

(assert (= (and b!1414229 c!131202) b!1414234))

(assert (= (and b!1414229 (not c!131202)) b!1414233))

(declare-fun m!1304539 () Bool)

(assert (=> d!152295 m!1304539))

(declare-fun m!1304541 () Bool)

(assert (=> d!152295 m!1304541))

