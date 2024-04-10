; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120346 () Bool)

(assert start!120346)

(declare-fun b!1400717 () Bool)

(declare-fun res!939232 () Bool)

(declare-fun e!793075 () Bool)

(assert (=> b!1400717 (=> (not res!939232) (not e!793075))))

(declare-datatypes ((array!95755 0))(
  ( (array!95756 (arr!46228 (Array (_ BitVec 32) (_ BitVec 64))) (size!46778 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95755)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400717 (= res!939232 (validKeyInArray!0 (select (arr!46228 a!2901) j!112)))))

(declare-fun b!1400719 () Bool)

(declare-fun e!793077 () Bool)

(assert (=> b!1400719 (= e!793075 (not e!793077))))

(declare-fun res!939233 () Bool)

(assert (=> b!1400719 (=> res!939233 e!793077)))

(declare-datatypes ((SeekEntryResult!10545 0))(
  ( (MissingZero!10545 (index!44557 (_ BitVec 32))) (Found!10545 (index!44558 (_ BitVec 32))) (Intermediate!10545 (undefined!11357 Bool) (index!44559 (_ BitVec 32)) (x!126196 (_ BitVec 32))) (Undefined!10545) (MissingVacant!10545 (index!44560 (_ BitVec 32))) )
))
(declare-fun lt!616411 () SeekEntryResult!10545)

(assert (=> b!1400719 (= res!939233 (or (not (is-Intermediate!10545 lt!616411)) (undefined!11357 lt!616411)))))

(declare-fun e!793079 () Bool)

(assert (=> b!1400719 e!793079))

(declare-fun res!939231 () Bool)

(assert (=> b!1400719 (=> (not res!939231) (not e!793079))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95755 (_ BitVec 32)) Bool)

(assert (=> b!1400719 (= res!939231 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47094 0))(
  ( (Unit!47095) )
))
(declare-fun lt!616410 () Unit!47094)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47094)

(assert (=> b!1400719 (= lt!616410 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616408 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95755 (_ BitVec 32)) SeekEntryResult!10545)

(assert (=> b!1400719 (= lt!616411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616408 (select (arr!46228 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400719 (= lt!616408 (toIndex!0 (select (arr!46228 a!2901) j!112) mask!2840))))

(declare-fun b!1400720 () Bool)

(declare-fun res!939234 () Bool)

(assert (=> b!1400720 (=> (not res!939234) (not e!793075))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400720 (= res!939234 (and (= (size!46778 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46778 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46778 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400721 () Bool)

(declare-fun e!793073 () Bool)

(assert (=> b!1400721 (= e!793073 true)))

(declare-fun lt!616413 () (_ BitVec 64))

(declare-fun lt!616412 () array!95755)

(declare-fun lt!616406 () SeekEntryResult!10545)

(assert (=> b!1400721 (= lt!616406 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616408 lt!616413 lt!616412 mask!2840))))

(declare-fun b!1400722 () Bool)

(declare-fun res!939236 () Bool)

(assert (=> b!1400722 (=> (not res!939236) (not e!793075))))

(assert (=> b!1400722 (= res!939236 (validKeyInArray!0 (select (arr!46228 a!2901) i!1037)))))

(declare-fun b!1400723 () Bool)

(declare-fun e!793078 () Bool)

(assert (=> b!1400723 (= e!793077 e!793078)))

(declare-fun res!939229 () Bool)

(assert (=> b!1400723 (=> res!939229 e!793078)))

(declare-fun lt!616407 () SeekEntryResult!10545)

(assert (=> b!1400723 (= res!939229 (or (= lt!616411 lt!616407) (not (is-Intermediate!10545 lt!616407))))))

(assert (=> b!1400723 (= lt!616407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616413 mask!2840) lt!616413 lt!616412 mask!2840))))

(assert (=> b!1400723 (= lt!616413 (select (store (arr!46228 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400723 (= lt!616412 (array!95756 (store (arr!46228 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46778 a!2901)))))

(declare-fun b!1400724 () Bool)

(declare-fun e!793076 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95755 (_ BitVec 32)) SeekEntryResult!10545)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95755 (_ BitVec 32)) SeekEntryResult!10545)

(assert (=> b!1400724 (= e!793076 (= (seekEntryOrOpen!0 lt!616413 lt!616412 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126196 lt!616407) (index!44559 lt!616407) (index!44559 lt!616407) (select (arr!46228 a!2901) j!112) lt!616412 mask!2840)))))

(declare-fun b!1400725 () Bool)

(assert (=> b!1400725 (= e!793079 (= (seekEntryOrOpen!0 (select (arr!46228 a!2901) j!112) a!2901 mask!2840) (Found!10545 j!112)))))

(declare-fun b!1400718 () Bool)

(declare-fun res!939238 () Bool)

(assert (=> b!1400718 (=> (not res!939238) (not e!793075))))

(assert (=> b!1400718 (= res!939238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!939237 () Bool)

(assert (=> start!120346 (=> (not res!939237) (not e!793075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120346 (= res!939237 (validMask!0 mask!2840))))

(assert (=> start!120346 e!793075))

(assert (=> start!120346 true))

(declare-fun array_inv!35256 (array!95755) Bool)

(assert (=> start!120346 (array_inv!35256 a!2901)))

(declare-fun b!1400726 () Bool)

(declare-fun res!939228 () Bool)

(assert (=> b!1400726 (=> (not res!939228) (not e!793075))))

(declare-datatypes ((List!32747 0))(
  ( (Nil!32744) (Cons!32743 (h!33991 (_ BitVec 64)) (t!47441 List!32747)) )
))
(declare-fun arrayNoDuplicates!0 (array!95755 (_ BitVec 32) List!32747) Bool)

(assert (=> b!1400726 (= res!939228 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32744))))

(declare-fun b!1400727 () Bool)

(assert (=> b!1400727 (= e!793078 e!793073)))

(declare-fun res!939230 () Bool)

(assert (=> b!1400727 (=> res!939230 e!793073)))

(assert (=> b!1400727 (= res!939230 (or (bvslt (x!126196 lt!616411) #b00000000000000000000000000000000) (bvsgt (x!126196 lt!616411) #b01111111111111111111111111111110) (bvslt (x!126196 lt!616407) #b00000000000000000000000000000000) (bvsgt (x!126196 lt!616407) #b01111111111111111111111111111110) (bvslt lt!616408 #b00000000000000000000000000000000) (bvsge lt!616408 (size!46778 a!2901)) (bvslt (index!44559 lt!616411) #b00000000000000000000000000000000) (bvsge (index!44559 lt!616411) (size!46778 a!2901)) (bvslt (index!44559 lt!616407) #b00000000000000000000000000000000) (bvsge (index!44559 lt!616407) (size!46778 a!2901)) (not (= lt!616411 (Intermediate!10545 false (index!44559 lt!616411) (x!126196 lt!616411)))) (not (= lt!616407 (Intermediate!10545 false (index!44559 lt!616407) (x!126196 lt!616407))))))))

(assert (=> b!1400727 e!793076))

(declare-fun res!939235 () Bool)

(assert (=> b!1400727 (=> (not res!939235) (not e!793076))))

(assert (=> b!1400727 (= res!939235 (and (not (undefined!11357 lt!616407)) (= (index!44559 lt!616407) i!1037) (bvslt (x!126196 lt!616407) (x!126196 lt!616411)) (= (select (store (arr!46228 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44559 lt!616407)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616409 () Unit!47094)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47094)

(assert (=> b!1400727 (= lt!616409 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616408 (x!126196 lt!616411) (index!44559 lt!616411) (x!126196 lt!616407) (index!44559 lt!616407) (undefined!11357 lt!616407) mask!2840))))

(assert (= (and start!120346 res!939237) b!1400720))

(assert (= (and b!1400720 res!939234) b!1400722))

(assert (= (and b!1400722 res!939236) b!1400717))

(assert (= (and b!1400717 res!939232) b!1400718))

(assert (= (and b!1400718 res!939238) b!1400726))

(assert (= (and b!1400726 res!939228) b!1400719))

(assert (= (and b!1400719 res!939231) b!1400725))

(assert (= (and b!1400719 (not res!939233)) b!1400723))

(assert (= (and b!1400723 (not res!939229)) b!1400727))

(assert (= (and b!1400727 res!939235) b!1400724))

(assert (= (and b!1400727 (not res!939230)) b!1400721))

(declare-fun m!1288261 () Bool)

(assert (=> b!1400718 m!1288261))

(declare-fun m!1288263 () Bool)

(assert (=> b!1400721 m!1288263))

(declare-fun m!1288265 () Bool)

(assert (=> b!1400727 m!1288265))

(declare-fun m!1288267 () Bool)

(assert (=> b!1400727 m!1288267))

(declare-fun m!1288269 () Bool)

(assert (=> b!1400727 m!1288269))

(declare-fun m!1288271 () Bool)

(assert (=> b!1400717 m!1288271))

(assert (=> b!1400717 m!1288271))

(declare-fun m!1288273 () Bool)

(assert (=> b!1400717 m!1288273))

(declare-fun m!1288275 () Bool)

(assert (=> b!1400723 m!1288275))

(assert (=> b!1400723 m!1288275))

(declare-fun m!1288277 () Bool)

(assert (=> b!1400723 m!1288277))

(assert (=> b!1400723 m!1288265))

(declare-fun m!1288279 () Bool)

(assert (=> b!1400723 m!1288279))

(declare-fun m!1288281 () Bool)

(assert (=> start!120346 m!1288281))

(declare-fun m!1288283 () Bool)

(assert (=> start!120346 m!1288283))

(declare-fun m!1288285 () Bool)

(assert (=> b!1400722 m!1288285))

(assert (=> b!1400722 m!1288285))

(declare-fun m!1288287 () Bool)

(assert (=> b!1400722 m!1288287))

(declare-fun m!1288289 () Bool)

(assert (=> b!1400726 m!1288289))

(declare-fun m!1288291 () Bool)

(assert (=> b!1400724 m!1288291))

(assert (=> b!1400724 m!1288271))

(assert (=> b!1400724 m!1288271))

(declare-fun m!1288293 () Bool)

(assert (=> b!1400724 m!1288293))

(assert (=> b!1400719 m!1288271))

(declare-fun m!1288295 () Bool)

(assert (=> b!1400719 m!1288295))

(assert (=> b!1400719 m!1288271))

(assert (=> b!1400719 m!1288271))

(declare-fun m!1288297 () Bool)

(assert (=> b!1400719 m!1288297))

(declare-fun m!1288299 () Bool)

(assert (=> b!1400719 m!1288299))

(declare-fun m!1288301 () Bool)

(assert (=> b!1400719 m!1288301))

(assert (=> b!1400725 m!1288271))

(assert (=> b!1400725 m!1288271))

(declare-fun m!1288303 () Bool)

(assert (=> b!1400725 m!1288303))

(push 1)

