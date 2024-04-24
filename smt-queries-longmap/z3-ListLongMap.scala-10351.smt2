; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121844 () Bool)

(assert start!121844)

(declare-fun b!1414596 () Bool)

(declare-fun res!950911 () Bool)

(declare-fun e!800650 () Bool)

(assert (=> b!1414596 (=> (not res!950911) (not e!800650))))

(declare-datatypes ((array!96704 0))(
  ( (array!96705 (arr!46687 (Array (_ BitVec 32) (_ BitVec 64))) (size!47238 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96704)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414596 (= res!950911 (validKeyInArray!0 (select (arr!46687 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1414597 () Bool)

(declare-datatypes ((SeekEntryResult!10901 0))(
  ( (MissingZero!10901 (index!45984 (_ BitVec 32))) (Found!10901 (index!45985 (_ BitVec 32))) (Intermediate!10901 (undefined!11713 Bool) (index!45986 (_ BitVec 32)) (x!127719 (_ BitVec 32))) (Undefined!10901) (MissingVacant!10901 (index!45987 (_ BitVec 32))) )
))
(declare-fun lt!623450 () SeekEntryResult!10901)

(declare-fun e!800652 () Bool)

(declare-fun lt!623449 () (_ BitVec 64))

(declare-fun lt!623444 () array!96704)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96704 (_ BitVec 32)) SeekEntryResult!10901)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96704 (_ BitVec 32)) SeekEntryResult!10901)

(assert (=> b!1414597 (= e!800652 (= (seekEntryOrOpen!0 lt!623449 lt!623444 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127719 lt!623450) (index!45986 lt!623450) (index!45986 lt!623450) (select (arr!46687 a!2901) j!112) lt!623444 mask!2840)))))

(declare-fun b!1414598 () Bool)

(declare-fun res!950903 () Bool)

(assert (=> b!1414598 (=> (not res!950903) (not e!800650))))

(declare-datatypes ((List!33193 0))(
  ( (Nil!33190) (Cons!33189 (h!34472 (_ BitVec 64)) (t!47879 List!33193)) )
))
(declare-fun arrayNoDuplicates!0 (array!96704 (_ BitVec 32) List!33193) Bool)

(assert (=> b!1414598 (= res!950903 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33190))))

(declare-fun b!1414599 () Bool)

(declare-fun res!950910 () Bool)

(assert (=> b!1414599 (=> (not res!950910) (not e!800650))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1414599 (= res!950910 (and (= (size!47238 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47238 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47238 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1414600 () Bool)

(declare-fun res!950907 () Bool)

(assert (=> b!1414600 (=> (not res!950907) (not e!800650))))

(assert (=> b!1414600 (= res!950907 (validKeyInArray!0 (select (arr!46687 a!2901) i!1037)))))

(declare-fun e!800649 () Bool)

(declare-fun b!1414601 () Bool)

(assert (=> b!1414601 (= e!800649 (= (seekEntryOrOpen!0 (select (arr!46687 a!2901) j!112) a!2901 mask!2840) (Found!10901 j!112)))))

(declare-fun b!1414602 () Bool)

(declare-fun e!800653 () Bool)

(declare-fun lt!623445 () SeekEntryResult!10901)

(assert (=> b!1414602 (= e!800653 (and (bvsge (x!127719 lt!623445) #b00000000000000000000000000000000) (bvsle (x!127719 lt!623445) #b01111111111111111111111111111110)))))

(assert (=> b!1414602 e!800652))

(declare-fun res!950906 () Bool)

(assert (=> b!1414602 (=> (not res!950906) (not e!800652))))

(assert (=> b!1414602 (= res!950906 (and (not (undefined!11713 lt!623450)) (= (index!45986 lt!623450) i!1037) (bvslt (x!127719 lt!623450) (x!127719 lt!623445)) (= (select (store (arr!46687 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!45986 lt!623450)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!623447 () (_ BitVec 32))

(declare-datatypes ((Unit!47803 0))(
  ( (Unit!47804) )
))
(declare-fun lt!623448 () Unit!47803)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47803)

(assert (=> b!1414602 (= lt!623448 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623447 (x!127719 lt!623445) (index!45986 lt!623445) (x!127719 lt!623450) (index!45986 lt!623450) (undefined!11713 lt!623450) mask!2840))))

(declare-fun b!1414603 () Bool)

(declare-fun e!800654 () Bool)

(assert (=> b!1414603 (= e!800650 (not e!800654))))

(declare-fun res!950908 () Bool)

(assert (=> b!1414603 (=> res!950908 e!800654)))

(get-info :version)

(assert (=> b!1414603 (= res!950908 (or (not ((_ is Intermediate!10901) lt!623445)) (undefined!11713 lt!623445)))))

(assert (=> b!1414603 e!800649))

(declare-fun res!950902 () Bool)

(assert (=> b!1414603 (=> (not res!950902) (not e!800649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96704 (_ BitVec 32)) Bool)

(assert (=> b!1414603 (= res!950902 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623446 () Unit!47803)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47803)

(assert (=> b!1414603 (= lt!623446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96704 (_ BitVec 32)) SeekEntryResult!10901)

(assert (=> b!1414603 (= lt!623445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623447 (select (arr!46687 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414603 (= lt!623447 (toIndex!0 (select (arr!46687 a!2901) j!112) mask!2840))))

(declare-fun res!950909 () Bool)

(assert (=> start!121844 (=> (not res!950909) (not e!800650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121844 (= res!950909 (validMask!0 mask!2840))))

(assert (=> start!121844 e!800650))

(assert (=> start!121844 true))

(declare-fun array_inv!35968 (array!96704) Bool)

(assert (=> start!121844 (array_inv!35968 a!2901)))

(declare-fun b!1414604 () Bool)

(declare-fun res!950905 () Bool)

(assert (=> b!1414604 (=> (not res!950905) (not e!800650))))

(assert (=> b!1414604 (= res!950905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414605 () Bool)

(assert (=> b!1414605 (= e!800654 e!800653)))

(declare-fun res!950904 () Bool)

(assert (=> b!1414605 (=> res!950904 e!800653)))

(assert (=> b!1414605 (= res!950904 (or (= lt!623445 lt!623450) (not ((_ is Intermediate!10901) lt!623450))))))

(assert (=> b!1414605 (= lt!623450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623449 mask!2840) lt!623449 lt!623444 mask!2840))))

(assert (=> b!1414605 (= lt!623449 (select (store (arr!46687 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414605 (= lt!623444 (array!96705 (store (arr!46687 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901)))))

(assert (= (and start!121844 res!950909) b!1414599))

(assert (= (and b!1414599 res!950910) b!1414600))

(assert (= (and b!1414600 res!950907) b!1414596))

(assert (= (and b!1414596 res!950911) b!1414604))

(assert (= (and b!1414604 res!950905) b!1414598))

(assert (= (and b!1414598 res!950903) b!1414603))

(assert (= (and b!1414603 res!950902) b!1414601))

(assert (= (and b!1414603 (not res!950908)) b!1414605))

(assert (= (and b!1414605 (not res!950904)) b!1414602))

(assert (= (and b!1414602 res!950906) b!1414597))

(declare-fun m!1305259 () Bool)

(assert (=> b!1414596 m!1305259))

(assert (=> b!1414596 m!1305259))

(declare-fun m!1305261 () Bool)

(assert (=> b!1414596 m!1305261))

(assert (=> b!1414601 m!1305259))

(assert (=> b!1414601 m!1305259))

(declare-fun m!1305263 () Bool)

(assert (=> b!1414601 m!1305263))

(assert (=> b!1414603 m!1305259))

(declare-fun m!1305265 () Bool)

(assert (=> b!1414603 m!1305265))

(assert (=> b!1414603 m!1305259))

(assert (=> b!1414603 m!1305259))

(declare-fun m!1305267 () Bool)

(assert (=> b!1414603 m!1305267))

(declare-fun m!1305269 () Bool)

(assert (=> b!1414603 m!1305269))

(declare-fun m!1305271 () Bool)

(assert (=> b!1414603 m!1305271))

(declare-fun m!1305273 () Bool)

(assert (=> b!1414602 m!1305273))

(declare-fun m!1305275 () Bool)

(assert (=> b!1414602 m!1305275))

(declare-fun m!1305277 () Bool)

(assert (=> b!1414602 m!1305277))

(declare-fun m!1305279 () Bool)

(assert (=> b!1414600 m!1305279))

(assert (=> b!1414600 m!1305279))

(declare-fun m!1305281 () Bool)

(assert (=> b!1414600 m!1305281))

(declare-fun m!1305283 () Bool)

(assert (=> b!1414598 m!1305283))

(declare-fun m!1305285 () Bool)

(assert (=> b!1414605 m!1305285))

(assert (=> b!1414605 m!1305285))

(declare-fun m!1305287 () Bool)

(assert (=> b!1414605 m!1305287))

(assert (=> b!1414605 m!1305273))

(declare-fun m!1305289 () Bool)

(assert (=> b!1414605 m!1305289))

(declare-fun m!1305291 () Bool)

(assert (=> b!1414597 m!1305291))

(assert (=> b!1414597 m!1305259))

(assert (=> b!1414597 m!1305259))

(declare-fun m!1305293 () Bool)

(assert (=> b!1414597 m!1305293))

(declare-fun m!1305295 () Bool)

(assert (=> b!1414604 m!1305295))

(declare-fun m!1305297 () Bool)

(assert (=> start!121844 m!1305297))

(declare-fun m!1305299 () Bool)

(assert (=> start!121844 m!1305299))

(check-sat (not b!1414598) (not b!1414600) (not b!1414597) (not b!1414601) (not b!1414603) (not start!121844) (not b!1414604) (not b!1414596) (not b!1414602) (not b!1414605))
(check-sat)
(get-model)

(declare-fun b!1414674 () Bool)

(declare-fun e!800698 () Bool)

(declare-fun call!67158 () Bool)

(assert (=> b!1414674 (= e!800698 call!67158)))

(declare-fun b!1414675 () Bool)

(declare-fun e!800697 () Bool)

(assert (=> b!1414675 (= e!800698 e!800697)))

(declare-fun lt!623500 () (_ BitVec 64))

(assert (=> b!1414675 (= lt!623500 (select (arr!46687 a!2901) j!112))))

(declare-fun lt!623499 () Unit!47803)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96704 (_ BitVec 64) (_ BitVec 32)) Unit!47803)

(assert (=> b!1414675 (= lt!623499 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623500 j!112))))

(declare-fun arrayContainsKey!0 (array!96704 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1414675 (arrayContainsKey!0 a!2901 lt!623500 #b00000000000000000000000000000000)))

(declare-fun lt!623501 () Unit!47803)

(assert (=> b!1414675 (= lt!623501 lt!623499)))

(declare-fun res!950976 () Bool)

(assert (=> b!1414675 (= res!950976 (= (seekEntryOrOpen!0 (select (arr!46687 a!2901) j!112) a!2901 mask!2840) (Found!10901 j!112)))))

(assert (=> b!1414675 (=> (not res!950976) (not e!800697))))

(declare-fun b!1414676 () Bool)

(assert (=> b!1414676 (= e!800697 call!67158)))

(declare-fun bm!67155 () Bool)

(assert (=> bm!67155 (= call!67158 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414677 () Bool)

(declare-fun e!800699 () Bool)

(assert (=> b!1414677 (= e!800699 e!800698)))

(declare-fun c!131329 () Bool)

(assert (=> b!1414677 (= c!131329 (validKeyInArray!0 (select (arr!46687 a!2901) j!112)))))

(declare-fun d!152465 () Bool)

(declare-fun res!950977 () Bool)

(assert (=> d!152465 (=> res!950977 e!800699)))

(assert (=> d!152465 (= res!950977 (bvsge j!112 (size!47238 a!2901)))))

(assert (=> d!152465 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800699)))

(assert (= (and d!152465 (not res!950977)) b!1414677))

(assert (= (and b!1414677 c!131329) b!1414675))

(assert (= (and b!1414677 (not c!131329)) b!1414674))

(assert (= (and b!1414675 res!950976) b!1414676))

(assert (= (or b!1414676 b!1414674) bm!67155))

(assert (=> b!1414675 m!1305259))

(declare-fun m!1305385 () Bool)

(assert (=> b!1414675 m!1305385))

(declare-fun m!1305387 () Bool)

(assert (=> b!1414675 m!1305387))

(assert (=> b!1414675 m!1305259))

(assert (=> b!1414675 m!1305263))

(declare-fun m!1305389 () Bool)

(assert (=> bm!67155 m!1305389))

(assert (=> b!1414677 m!1305259))

(assert (=> b!1414677 m!1305259))

(assert (=> b!1414677 m!1305261))

(assert (=> b!1414603 d!152465))

(declare-fun d!152467 () Bool)

(assert (=> d!152467 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623504 () Unit!47803)

(declare-fun choose!38 (array!96704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47803)

(assert (=> d!152467 (= lt!623504 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152467 (validMask!0 mask!2840)))

(assert (=> d!152467 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623504)))

(declare-fun bs!41221 () Bool)

(assert (= bs!41221 d!152467))

(assert (=> bs!41221 m!1305271))

(declare-fun m!1305391 () Bool)

(assert (=> bs!41221 m!1305391))

(assert (=> bs!41221 m!1305297))

(assert (=> b!1414603 d!152467))

(declare-fun b!1414708 () Bool)

(declare-fun e!800723 () SeekEntryResult!10901)

(assert (=> b!1414708 (= e!800723 (Intermediate!10901 false lt!623447 #b00000000000000000000000000000000))))

(declare-fun b!1414709 () Bool)

(declare-fun lt!623519 () SeekEntryResult!10901)

(assert (=> b!1414709 (and (bvsge (index!45986 lt!623519) #b00000000000000000000000000000000) (bvslt (index!45986 lt!623519) (size!47238 a!2901)))))

(declare-fun res!950990 () Bool)

(assert (=> b!1414709 (= res!950990 (= (select (arr!46687 a!2901) (index!45986 lt!623519)) (select (arr!46687 a!2901) j!112)))))

(declare-fun e!800719 () Bool)

(assert (=> b!1414709 (=> res!950990 e!800719)))

(declare-fun e!800720 () Bool)

(assert (=> b!1414709 (= e!800720 e!800719)))

(declare-fun b!1414710 () Bool)

(declare-fun e!800721 () Bool)

(assert (=> b!1414710 (= e!800721 e!800720)))

(declare-fun res!950991 () Bool)

(assert (=> b!1414710 (= res!950991 (and ((_ is Intermediate!10901) lt!623519) (not (undefined!11713 lt!623519)) (bvslt (x!127719 lt!623519) #b01111111111111111111111111111110) (bvsge (x!127719 lt!623519) #b00000000000000000000000000000000) (bvsge (x!127719 lt!623519) #b00000000000000000000000000000000)))))

(assert (=> b!1414710 (=> (not res!950991) (not e!800720))))

(declare-fun b!1414711 () Bool)

(assert (=> b!1414711 (and (bvsge (index!45986 lt!623519) #b00000000000000000000000000000000) (bvslt (index!45986 lt!623519) (size!47238 a!2901)))))

(declare-fun res!950992 () Bool)

(assert (=> b!1414711 (= res!950992 (= (select (arr!46687 a!2901) (index!45986 lt!623519)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414711 (=> res!950992 e!800719)))

(declare-fun d!152469 () Bool)

(assert (=> d!152469 e!800721))

(declare-fun c!131339 () Bool)

(assert (=> d!152469 (= c!131339 (and ((_ is Intermediate!10901) lt!623519) (undefined!11713 lt!623519)))))

(declare-fun e!800722 () SeekEntryResult!10901)

(assert (=> d!152469 (= lt!623519 e!800722)))

(declare-fun c!131341 () Bool)

(assert (=> d!152469 (= c!131341 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623518 () (_ BitVec 64))

(assert (=> d!152469 (= lt!623518 (select (arr!46687 a!2901) lt!623447))))

(assert (=> d!152469 (validMask!0 mask!2840)))

(assert (=> d!152469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623447 (select (arr!46687 a!2901) j!112) a!2901 mask!2840) lt!623519)))

(declare-fun b!1414712 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414712 (= e!800723 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623447 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46687 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1414713 () Bool)

(assert (=> b!1414713 (= e!800721 (bvsge (x!127719 lt!623519) #b01111111111111111111111111111110))))

(declare-fun b!1414714 () Bool)

(assert (=> b!1414714 (and (bvsge (index!45986 lt!623519) #b00000000000000000000000000000000) (bvslt (index!45986 lt!623519) (size!47238 a!2901)))))

(assert (=> b!1414714 (= e!800719 (= (select (arr!46687 a!2901) (index!45986 lt!623519)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414715 () Bool)

(assert (=> b!1414715 (= e!800722 (Intermediate!10901 true lt!623447 #b00000000000000000000000000000000))))

(declare-fun b!1414716 () Bool)

(assert (=> b!1414716 (= e!800722 e!800723)))

(declare-fun c!131340 () Bool)

(assert (=> b!1414716 (= c!131340 (or (= lt!623518 (select (arr!46687 a!2901) j!112)) (= (bvadd lt!623518 lt!623518) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!152469 c!131341) b!1414715))

(assert (= (and d!152469 (not c!131341)) b!1414716))

(assert (= (and b!1414716 c!131340) b!1414708))

(assert (= (and b!1414716 (not c!131340)) b!1414712))

(assert (= (and d!152469 c!131339) b!1414713))

(assert (= (and d!152469 (not c!131339)) b!1414710))

(assert (= (and b!1414710 res!950991) b!1414709))

(assert (= (and b!1414709 (not res!950990)) b!1414711))

(assert (= (and b!1414711 (not res!950992)) b!1414714))

(declare-fun m!1305405 () Bool)

(assert (=> b!1414711 m!1305405))

(declare-fun m!1305407 () Bool)

(assert (=> b!1414712 m!1305407))

(assert (=> b!1414712 m!1305407))

(assert (=> b!1414712 m!1305259))

(declare-fun m!1305409 () Bool)

(assert (=> b!1414712 m!1305409))

(assert (=> b!1414709 m!1305405))

(declare-fun m!1305411 () Bool)

(assert (=> d!152469 m!1305411))

(assert (=> d!152469 m!1305297))

(assert (=> b!1414714 m!1305405))

(assert (=> b!1414603 d!152469))

(declare-fun d!152479 () Bool)

(declare-fun lt!623525 () (_ BitVec 32))

(declare-fun lt!623524 () (_ BitVec 32))

(assert (=> d!152479 (= lt!623525 (bvmul (bvxor lt!623524 (bvlshr lt!623524 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152479 (= lt!623524 ((_ extract 31 0) (bvand (bvxor (select (arr!46687 a!2901) j!112) (bvlshr (select (arr!46687 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152479 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950993 (let ((h!34475 ((_ extract 31 0) (bvand (bvxor (select (arr!46687 a!2901) j!112) (bvlshr (select (arr!46687 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127723 (bvmul (bvxor h!34475 (bvlshr h!34475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127723 (bvlshr x!127723 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950993 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950993 #b00000000000000000000000000000000))))))

(assert (=> d!152479 (= (toIndex!0 (select (arr!46687 a!2901) j!112) mask!2840) (bvand (bvxor lt!623525 (bvlshr lt!623525 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414603 d!152479))

(declare-fun b!1414780 () Bool)

(declare-fun c!131369 () Bool)

(declare-fun lt!623551 () (_ BitVec 64))

(assert (=> b!1414780 (= c!131369 (= lt!623551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800762 () SeekEntryResult!10901)

(declare-fun e!800760 () SeekEntryResult!10901)

(assert (=> b!1414780 (= e!800762 e!800760)))

(declare-fun b!1414781 () Bool)

(declare-fun lt!623550 () SeekEntryResult!10901)

(assert (=> b!1414781 (= e!800762 (Found!10901 (index!45986 lt!623550)))))

(declare-fun b!1414782 () Bool)

(declare-fun e!800761 () SeekEntryResult!10901)

(assert (=> b!1414782 (= e!800761 e!800762)))

(assert (=> b!1414782 (= lt!623551 (select (arr!46687 lt!623444) (index!45986 lt!623550)))))

(declare-fun c!131370 () Bool)

(assert (=> b!1414782 (= c!131370 (= lt!623551 lt!623449))))

(declare-fun b!1414783 () Bool)

(assert (=> b!1414783 (= e!800760 (seekKeyOrZeroReturnVacant!0 (x!127719 lt!623550) (index!45986 lt!623550) (index!45986 lt!623550) lt!623449 lt!623444 mask!2840))))

(declare-fun d!152481 () Bool)

(declare-fun lt!623552 () SeekEntryResult!10901)

(assert (=> d!152481 (and (or ((_ is Undefined!10901) lt!623552) (not ((_ is Found!10901) lt!623552)) (and (bvsge (index!45985 lt!623552) #b00000000000000000000000000000000) (bvslt (index!45985 lt!623552) (size!47238 lt!623444)))) (or ((_ is Undefined!10901) lt!623552) ((_ is Found!10901) lt!623552) (not ((_ is MissingZero!10901) lt!623552)) (and (bvsge (index!45984 lt!623552) #b00000000000000000000000000000000) (bvslt (index!45984 lt!623552) (size!47238 lt!623444)))) (or ((_ is Undefined!10901) lt!623552) ((_ is Found!10901) lt!623552) ((_ is MissingZero!10901) lt!623552) (not ((_ is MissingVacant!10901) lt!623552)) (and (bvsge (index!45987 lt!623552) #b00000000000000000000000000000000) (bvslt (index!45987 lt!623552) (size!47238 lt!623444)))) (or ((_ is Undefined!10901) lt!623552) (ite ((_ is Found!10901) lt!623552) (= (select (arr!46687 lt!623444) (index!45985 lt!623552)) lt!623449) (ite ((_ is MissingZero!10901) lt!623552) (= (select (arr!46687 lt!623444) (index!45984 lt!623552)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10901) lt!623552) (= (select (arr!46687 lt!623444) (index!45987 lt!623552)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152481 (= lt!623552 e!800761)))

(declare-fun c!131371 () Bool)

(assert (=> d!152481 (= c!131371 (and ((_ is Intermediate!10901) lt!623550) (undefined!11713 lt!623550)))))

(assert (=> d!152481 (= lt!623550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623449 mask!2840) lt!623449 lt!623444 mask!2840))))

(assert (=> d!152481 (validMask!0 mask!2840)))

(assert (=> d!152481 (= (seekEntryOrOpen!0 lt!623449 lt!623444 mask!2840) lt!623552)))

(declare-fun b!1414784 () Bool)

(assert (=> b!1414784 (= e!800761 Undefined!10901)))

(declare-fun b!1414785 () Bool)

(assert (=> b!1414785 (= e!800760 (MissingZero!10901 (index!45986 lt!623550)))))

(assert (= (and d!152481 c!131371) b!1414784))

(assert (= (and d!152481 (not c!131371)) b!1414782))

(assert (= (and b!1414782 c!131370) b!1414781))

(assert (= (and b!1414782 (not c!131370)) b!1414780))

(assert (= (and b!1414780 c!131369) b!1414785))

(assert (= (and b!1414780 (not c!131369)) b!1414783))

(declare-fun m!1305443 () Bool)

(assert (=> b!1414782 m!1305443))

(declare-fun m!1305445 () Bool)

(assert (=> b!1414783 m!1305445))

(assert (=> d!152481 m!1305297))

(declare-fun m!1305447 () Bool)

(assert (=> d!152481 m!1305447))

(assert (=> d!152481 m!1305285))

(declare-fun m!1305449 () Bool)

(assert (=> d!152481 m!1305449))

(declare-fun m!1305451 () Bool)

(assert (=> d!152481 m!1305451))

(assert (=> d!152481 m!1305285))

(assert (=> d!152481 m!1305287))

(assert (=> b!1414597 d!152481))

(declare-fun b!1414832 () Bool)

(declare-fun e!800791 () SeekEntryResult!10901)

(declare-fun e!800792 () SeekEntryResult!10901)

(assert (=> b!1414832 (= e!800791 e!800792)))

(declare-fun c!131392 () Bool)

(declare-fun lt!623581 () (_ BitVec 64))

(assert (=> b!1414832 (= c!131392 (= lt!623581 (select (arr!46687 a!2901) j!112)))))

(declare-fun b!1414833 () Bool)

(assert (=> b!1414833 (= e!800792 (Found!10901 (index!45986 lt!623450)))))

(declare-fun lt!623582 () SeekEntryResult!10901)

(declare-fun d!152491 () Bool)

(assert (=> d!152491 (and (or ((_ is Undefined!10901) lt!623582) (not ((_ is Found!10901) lt!623582)) (and (bvsge (index!45985 lt!623582) #b00000000000000000000000000000000) (bvslt (index!45985 lt!623582) (size!47238 lt!623444)))) (or ((_ is Undefined!10901) lt!623582) ((_ is Found!10901) lt!623582) (not ((_ is MissingVacant!10901) lt!623582)) (not (= (index!45987 lt!623582) (index!45986 lt!623450))) (and (bvsge (index!45987 lt!623582) #b00000000000000000000000000000000) (bvslt (index!45987 lt!623582) (size!47238 lt!623444)))) (or ((_ is Undefined!10901) lt!623582) (ite ((_ is Found!10901) lt!623582) (= (select (arr!46687 lt!623444) (index!45985 lt!623582)) (select (arr!46687 a!2901) j!112)) (and ((_ is MissingVacant!10901) lt!623582) (= (index!45987 lt!623582) (index!45986 lt!623450)) (= (select (arr!46687 lt!623444) (index!45987 lt!623582)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152491 (= lt!623582 e!800791)))

(declare-fun c!131393 () Bool)

(assert (=> d!152491 (= c!131393 (bvsge (x!127719 lt!623450) #b01111111111111111111111111111110))))

(assert (=> d!152491 (= lt!623581 (select (arr!46687 lt!623444) (index!45986 lt!623450)))))

(assert (=> d!152491 (validMask!0 mask!2840)))

(assert (=> d!152491 (= (seekKeyOrZeroReturnVacant!0 (x!127719 lt!623450) (index!45986 lt!623450) (index!45986 lt!623450) (select (arr!46687 a!2901) j!112) lt!623444 mask!2840) lt!623582)))

(declare-fun b!1414834 () Bool)

(assert (=> b!1414834 (= e!800791 Undefined!10901)))

(declare-fun b!1414835 () Bool)

(declare-fun c!131391 () Bool)

(assert (=> b!1414835 (= c!131391 (= lt!623581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800790 () SeekEntryResult!10901)

(assert (=> b!1414835 (= e!800792 e!800790)))

(declare-fun b!1414836 () Bool)

(assert (=> b!1414836 (= e!800790 (MissingVacant!10901 (index!45986 lt!623450)))))

(declare-fun b!1414837 () Bool)

(assert (=> b!1414837 (= e!800790 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127719 lt!623450) #b00000000000000000000000000000001) (nextIndex!0 (index!45986 lt!623450) (bvadd (x!127719 lt!623450) #b00000000000000000000000000000001) mask!2840) (index!45986 lt!623450) (select (arr!46687 a!2901) j!112) lt!623444 mask!2840))))

(assert (= (and d!152491 c!131393) b!1414834))

(assert (= (and d!152491 (not c!131393)) b!1414832))

(assert (= (and b!1414832 c!131392) b!1414833))

(assert (= (and b!1414832 (not c!131392)) b!1414835))

(assert (= (and b!1414835 c!131391) b!1414836))

(assert (= (and b!1414835 (not c!131391)) b!1414837))

(declare-fun m!1305481 () Bool)

(assert (=> d!152491 m!1305481))

(declare-fun m!1305483 () Bool)

(assert (=> d!152491 m!1305483))

(declare-fun m!1305485 () Bool)

(assert (=> d!152491 m!1305485))

(assert (=> d!152491 m!1305297))

(declare-fun m!1305487 () Bool)

(assert (=> b!1414837 m!1305487))

(assert (=> b!1414837 m!1305487))

(assert (=> b!1414837 m!1305259))

(declare-fun m!1305489 () Bool)

(assert (=> b!1414837 m!1305489))

(assert (=> b!1414597 d!152491))

(declare-fun d!152507 () Bool)

(assert (=> d!152507 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121844 d!152507))

(declare-fun d!152515 () Bool)

(assert (=> d!152515 (= (array_inv!35968 a!2901) (bvsge (size!47238 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121844 d!152515))

(declare-fun d!152517 () Bool)

(assert (=> d!152517 (and (not (undefined!11713 lt!623450)) (= (index!45986 lt!623450) i!1037) (bvslt (x!127719 lt!623450) (x!127719 lt!623445)))))

(declare-fun lt!623588 () Unit!47803)

(declare-fun choose!62 (array!96704 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47803)

(assert (=> d!152517 (= lt!623588 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623447 (x!127719 lt!623445) (index!45986 lt!623445) (x!127719 lt!623450) (index!45986 lt!623450) (undefined!11713 lt!623450) mask!2840))))

(assert (=> d!152517 (validMask!0 mask!2840)))

(assert (=> d!152517 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623447 (x!127719 lt!623445) (index!45986 lt!623445) (x!127719 lt!623450) (index!45986 lt!623450) (undefined!11713 lt!623450) mask!2840) lt!623588)))

(declare-fun bs!41225 () Bool)

(assert (= bs!41225 d!152517))

(declare-fun m!1305493 () Bool)

(assert (=> bs!41225 m!1305493))

(assert (=> bs!41225 m!1305297))

(assert (=> b!1414602 d!152517))

(declare-fun d!152519 () Bool)

(assert (=> d!152519 (= (validKeyInArray!0 (select (arr!46687 a!2901) j!112)) (and (not (= (select (arr!46687 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46687 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414596 d!152519))

(declare-fun b!1414838 () Bool)

(declare-fun c!131394 () Bool)

(declare-fun lt!623590 () (_ BitVec 64))

(assert (=> b!1414838 (= c!131394 (= lt!623590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800795 () SeekEntryResult!10901)

(declare-fun e!800793 () SeekEntryResult!10901)

(assert (=> b!1414838 (= e!800795 e!800793)))

(declare-fun b!1414839 () Bool)

(declare-fun lt!623589 () SeekEntryResult!10901)

(assert (=> b!1414839 (= e!800795 (Found!10901 (index!45986 lt!623589)))))

(declare-fun b!1414840 () Bool)

(declare-fun e!800794 () SeekEntryResult!10901)

(assert (=> b!1414840 (= e!800794 e!800795)))

(assert (=> b!1414840 (= lt!623590 (select (arr!46687 a!2901) (index!45986 lt!623589)))))

(declare-fun c!131395 () Bool)

(assert (=> b!1414840 (= c!131395 (= lt!623590 (select (arr!46687 a!2901) j!112)))))

(declare-fun b!1414841 () Bool)

(assert (=> b!1414841 (= e!800793 (seekKeyOrZeroReturnVacant!0 (x!127719 lt!623589) (index!45986 lt!623589) (index!45986 lt!623589) (select (arr!46687 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!152521 () Bool)

(declare-fun lt!623591 () SeekEntryResult!10901)

(assert (=> d!152521 (and (or ((_ is Undefined!10901) lt!623591) (not ((_ is Found!10901) lt!623591)) (and (bvsge (index!45985 lt!623591) #b00000000000000000000000000000000) (bvslt (index!45985 lt!623591) (size!47238 a!2901)))) (or ((_ is Undefined!10901) lt!623591) ((_ is Found!10901) lt!623591) (not ((_ is MissingZero!10901) lt!623591)) (and (bvsge (index!45984 lt!623591) #b00000000000000000000000000000000) (bvslt (index!45984 lt!623591) (size!47238 a!2901)))) (or ((_ is Undefined!10901) lt!623591) ((_ is Found!10901) lt!623591) ((_ is MissingZero!10901) lt!623591) (not ((_ is MissingVacant!10901) lt!623591)) (and (bvsge (index!45987 lt!623591) #b00000000000000000000000000000000) (bvslt (index!45987 lt!623591) (size!47238 a!2901)))) (or ((_ is Undefined!10901) lt!623591) (ite ((_ is Found!10901) lt!623591) (= (select (arr!46687 a!2901) (index!45985 lt!623591)) (select (arr!46687 a!2901) j!112)) (ite ((_ is MissingZero!10901) lt!623591) (= (select (arr!46687 a!2901) (index!45984 lt!623591)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10901) lt!623591) (= (select (arr!46687 a!2901) (index!45987 lt!623591)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152521 (= lt!623591 e!800794)))

(declare-fun c!131396 () Bool)

(assert (=> d!152521 (= c!131396 (and ((_ is Intermediate!10901) lt!623589) (undefined!11713 lt!623589)))))

(assert (=> d!152521 (= lt!623589 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46687 a!2901) j!112) mask!2840) (select (arr!46687 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152521 (validMask!0 mask!2840)))

(assert (=> d!152521 (= (seekEntryOrOpen!0 (select (arr!46687 a!2901) j!112) a!2901 mask!2840) lt!623591)))

(declare-fun b!1414842 () Bool)

(assert (=> b!1414842 (= e!800794 Undefined!10901)))

(declare-fun b!1414843 () Bool)

(assert (=> b!1414843 (= e!800793 (MissingZero!10901 (index!45986 lt!623589)))))

(assert (= (and d!152521 c!131396) b!1414842))

(assert (= (and d!152521 (not c!131396)) b!1414840))

(assert (= (and b!1414840 c!131395) b!1414839))

(assert (= (and b!1414840 (not c!131395)) b!1414838))

(assert (= (and b!1414838 c!131394) b!1414843))

(assert (= (and b!1414838 (not c!131394)) b!1414841))

(declare-fun m!1305495 () Bool)

(assert (=> b!1414840 m!1305495))

(assert (=> b!1414841 m!1305259))

(declare-fun m!1305497 () Bool)

(assert (=> b!1414841 m!1305497))

(assert (=> d!152521 m!1305297))

(declare-fun m!1305499 () Bool)

(assert (=> d!152521 m!1305499))

(assert (=> d!152521 m!1305259))

(assert (=> d!152521 m!1305265))

(declare-fun m!1305501 () Bool)

(assert (=> d!152521 m!1305501))

(declare-fun m!1305503 () Bool)

(assert (=> d!152521 m!1305503))

(assert (=> d!152521 m!1305265))

(assert (=> d!152521 m!1305259))

(declare-fun m!1305505 () Bool)

(assert (=> d!152521 m!1305505))

(assert (=> b!1414601 d!152521))

(declare-fun d!152523 () Bool)

(assert (=> d!152523 (= (validKeyInArray!0 (select (arr!46687 a!2901) i!1037)) (and (not (= (select (arr!46687 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46687 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414600 d!152523))

(declare-fun b!1414852 () Bool)

(declare-fun e!800804 () SeekEntryResult!10901)

(assert (=> b!1414852 (= e!800804 (Intermediate!10901 false (toIndex!0 lt!623449 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414853 () Bool)

(declare-fun lt!623597 () SeekEntryResult!10901)

(assert (=> b!1414853 (and (bvsge (index!45986 lt!623597) #b00000000000000000000000000000000) (bvslt (index!45986 lt!623597) (size!47238 lt!623444)))))

(declare-fun res!951011 () Bool)

(assert (=> b!1414853 (= res!951011 (= (select (arr!46687 lt!623444) (index!45986 lt!623597)) lt!623449))))

(declare-fun e!800800 () Bool)

(assert (=> b!1414853 (=> res!951011 e!800800)))

(declare-fun e!800801 () Bool)

(assert (=> b!1414853 (= e!800801 e!800800)))

(declare-fun b!1414854 () Bool)

(declare-fun e!800802 () Bool)

(assert (=> b!1414854 (= e!800802 e!800801)))

(declare-fun res!951012 () Bool)

(assert (=> b!1414854 (= res!951012 (and ((_ is Intermediate!10901) lt!623597) (not (undefined!11713 lt!623597)) (bvslt (x!127719 lt!623597) #b01111111111111111111111111111110) (bvsge (x!127719 lt!623597) #b00000000000000000000000000000000) (bvsge (x!127719 lt!623597) #b00000000000000000000000000000000)))))

(assert (=> b!1414854 (=> (not res!951012) (not e!800801))))

(declare-fun b!1414855 () Bool)

(assert (=> b!1414855 (and (bvsge (index!45986 lt!623597) #b00000000000000000000000000000000) (bvslt (index!45986 lt!623597) (size!47238 lt!623444)))))

(declare-fun res!951013 () Bool)

(assert (=> b!1414855 (= res!951013 (= (select (arr!46687 lt!623444) (index!45986 lt!623597)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414855 (=> res!951013 e!800800)))

(declare-fun d!152525 () Bool)

(assert (=> d!152525 e!800802))

(declare-fun c!131401 () Bool)

(assert (=> d!152525 (= c!131401 (and ((_ is Intermediate!10901) lt!623597) (undefined!11713 lt!623597)))))

(declare-fun e!800803 () SeekEntryResult!10901)

(assert (=> d!152525 (= lt!623597 e!800803)))

(declare-fun c!131403 () Bool)

(assert (=> d!152525 (= c!131403 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!623596 () (_ BitVec 64))

(assert (=> d!152525 (= lt!623596 (select (arr!46687 lt!623444) (toIndex!0 lt!623449 mask!2840)))))

(assert (=> d!152525 (validMask!0 mask!2840)))

(assert (=> d!152525 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623449 mask!2840) lt!623449 lt!623444 mask!2840) lt!623597)))

(declare-fun b!1414856 () Bool)

(assert (=> b!1414856 (= e!800804 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623449 mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) lt!623449 lt!623444 mask!2840))))

(declare-fun b!1414857 () Bool)

(assert (=> b!1414857 (= e!800802 (bvsge (x!127719 lt!623597) #b01111111111111111111111111111110))))

(declare-fun b!1414858 () Bool)

(assert (=> b!1414858 (and (bvsge (index!45986 lt!623597) #b00000000000000000000000000000000) (bvslt (index!45986 lt!623597) (size!47238 lt!623444)))))

(assert (=> b!1414858 (= e!800800 (= (select (arr!46687 lt!623444) (index!45986 lt!623597)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414859 () Bool)

(assert (=> b!1414859 (= e!800803 (Intermediate!10901 true (toIndex!0 lt!623449 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414860 () Bool)

(assert (=> b!1414860 (= e!800803 e!800804)))

(declare-fun c!131402 () Bool)

(assert (=> b!1414860 (= c!131402 (or (= lt!623596 lt!623449) (= (bvadd lt!623596 lt!623596) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!152525 c!131403) b!1414859))

(assert (= (and d!152525 (not c!131403)) b!1414860))

(assert (= (and b!1414860 c!131402) b!1414852))

(assert (= (and b!1414860 (not c!131402)) b!1414856))

(assert (= (and d!152525 c!131401) b!1414857))

(assert (= (and d!152525 (not c!131401)) b!1414854))

(assert (= (and b!1414854 res!951012) b!1414853))

(assert (= (and b!1414853 (not res!951011)) b!1414855))

(assert (= (and b!1414855 (not res!951013)) b!1414858))

(declare-fun m!1305507 () Bool)

(assert (=> b!1414855 m!1305507))

(assert (=> b!1414856 m!1305285))

(declare-fun m!1305509 () Bool)

(assert (=> b!1414856 m!1305509))

(assert (=> b!1414856 m!1305509))

(declare-fun m!1305511 () Bool)

(assert (=> b!1414856 m!1305511))

(assert (=> b!1414853 m!1305507))

(assert (=> d!152525 m!1305285))

(declare-fun m!1305513 () Bool)

(assert (=> d!152525 m!1305513))

(assert (=> d!152525 m!1305297))

(assert (=> b!1414858 m!1305507))

(assert (=> b!1414605 d!152525))

(declare-fun d!152527 () Bool)

(declare-fun lt!623599 () (_ BitVec 32))

(declare-fun lt!623598 () (_ BitVec 32))

(assert (=> d!152527 (= lt!623599 (bvmul (bvxor lt!623598 (bvlshr lt!623598 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152527 (= lt!623598 ((_ extract 31 0) (bvand (bvxor lt!623449 (bvlshr lt!623449 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152527 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!950993 (let ((h!34475 ((_ extract 31 0) (bvand (bvxor lt!623449 (bvlshr lt!623449 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127723 (bvmul (bvxor h!34475 (bvlshr h!34475 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127723 (bvlshr x!127723 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!950993 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!950993 #b00000000000000000000000000000000))))))

(assert (=> d!152527 (= (toIndex!0 lt!623449 mask!2840) (bvand (bvxor lt!623599 (bvlshr lt!623599 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414605 d!152527))

(declare-fun b!1414871 () Bool)

(declare-fun e!800812 () Bool)

(declare-fun call!67169 () Bool)

(assert (=> b!1414871 (= e!800812 call!67169)))

(declare-fun b!1414872 () Bool)

(declare-fun e!800811 () Bool)

(assert (=> b!1414872 (= e!800812 e!800811)))

(declare-fun lt!623601 () (_ BitVec 64))

(assert (=> b!1414872 (= lt!623601 (select (arr!46687 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623600 () Unit!47803)

(assert (=> b!1414872 (= lt!623600 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623601 #b00000000000000000000000000000000))))

(assert (=> b!1414872 (arrayContainsKey!0 a!2901 lt!623601 #b00000000000000000000000000000000)))

(declare-fun lt!623602 () Unit!47803)

(assert (=> b!1414872 (= lt!623602 lt!623600)))

(declare-fun res!951020 () Bool)

(assert (=> b!1414872 (= res!951020 (= (seekEntryOrOpen!0 (select (arr!46687 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10901 #b00000000000000000000000000000000)))))

(assert (=> b!1414872 (=> (not res!951020) (not e!800811))))

(declare-fun b!1414873 () Bool)

(assert (=> b!1414873 (= e!800811 call!67169)))

(declare-fun bm!67166 () Bool)

(assert (=> bm!67166 (= call!67169 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414874 () Bool)

(declare-fun e!800813 () Bool)

(assert (=> b!1414874 (= e!800813 e!800812)))

(declare-fun c!131406 () Bool)

(assert (=> b!1414874 (= c!131406 (validKeyInArray!0 (select (arr!46687 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152529 () Bool)

(declare-fun res!951021 () Bool)

(assert (=> d!152529 (=> res!951021 e!800813)))

(assert (=> d!152529 (= res!951021 (bvsge #b00000000000000000000000000000000 (size!47238 a!2901)))))

(assert (=> d!152529 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800813)))

(assert (= (and d!152529 (not res!951021)) b!1414874))

(assert (= (and b!1414874 c!131406) b!1414872))

(assert (= (and b!1414874 (not c!131406)) b!1414871))

(assert (= (and b!1414872 res!951020) b!1414873))

(assert (= (or b!1414873 b!1414871) bm!67166))

(declare-fun m!1305515 () Bool)

(assert (=> b!1414872 m!1305515))

(declare-fun m!1305517 () Bool)

(assert (=> b!1414872 m!1305517))

(declare-fun m!1305519 () Bool)

(assert (=> b!1414872 m!1305519))

(assert (=> b!1414872 m!1305515))

(declare-fun m!1305521 () Bool)

(assert (=> b!1414872 m!1305521))

(declare-fun m!1305523 () Bool)

(assert (=> bm!67166 m!1305523))

(assert (=> b!1414874 m!1305515))

(assert (=> b!1414874 m!1305515))

(declare-fun m!1305525 () Bool)

(assert (=> b!1414874 m!1305525))

(assert (=> b!1414604 d!152529))

(declare-fun b!1414908 () Bool)

(declare-fun e!800835 () Bool)

(declare-fun contains!9857 (List!33193 (_ BitVec 64)) Bool)

(assert (=> b!1414908 (= e!800835 (contains!9857 Nil!33190 (select (arr!46687 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414909 () Bool)

(declare-fun e!800837 () Bool)

(declare-fun e!800836 () Bool)

(assert (=> b!1414909 (= e!800837 e!800836)))

(declare-fun c!131418 () Bool)

(assert (=> b!1414909 (= c!131418 (validKeyInArray!0 (select (arr!46687 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414910 () Bool)

(declare-fun call!67172 () Bool)

(assert (=> b!1414910 (= e!800836 call!67172)))

(declare-fun d!152531 () Bool)

(declare-fun res!951034 () Bool)

(declare-fun e!800838 () Bool)

(assert (=> d!152531 (=> res!951034 e!800838)))

(assert (=> d!152531 (= res!951034 (bvsge #b00000000000000000000000000000000 (size!47238 a!2901)))))

(assert (=> d!152531 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33190) e!800838)))

(declare-fun b!1414911 () Bool)

(assert (=> b!1414911 (= e!800838 e!800837)))

(declare-fun res!951036 () Bool)

(assert (=> b!1414911 (=> (not res!951036) (not e!800837))))

(assert (=> b!1414911 (= res!951036 (not e!800835))))

(declare-fun res!951035 () Bool)

(assert (=> b!1414911 (=> (not res!951035) (not e!800835))))

(assert (=> b!1414911 (= res!951035 (validKeyInArray!0 (select (arr!46687 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414912 () Bool)

(assert (=> b!1414912 (= e!800836 call!67172)))

(declare-fun bm!67169 () Bool)

(assert (=> bm!67169 (= call!67172 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131418 (Cons!33189 (select (arr!46687 a!2901) #b00000000000000000000000000000000) Nil!33190) Nil!33190)))))

(assert (= (and d!152531 (not res!951034)) b!1414911))

(assert (= (and b!1414911 res!951035) b!1414908))

(assert (= (and b!1414911 res!951036) b!1414909))

(assert (= (and b!1414909 c!131418) b!1414910))

(assert (= (and b!1414909 (not c!131418)) b!1414912))

(assert (= (or b!1414910 b!1414912) bm!67169))

(assert (=> b!1414908 m!1305515))

(assert (=> b!1414908 m!1305515))

(declare-fun m!1305535 () Bool)

(assert (=> b!1414908 m!1305535))

(assert (=> b!1414909 m!1305515))

(assert (=> b!1414909 m!1305515))

(assert (=> b!1414909 m!1305525))

(assert (=> b!1414911 m!1305515))

(assert (=> b!1414911 m!1305515))

(assert (=> b!1414911 m!1305525))

(assert (=> bm!67169 m!1305515))

(declare-fun m!1305537 () Bool)

(assert (=> bm!67169 m!1305537))

(assert (=> b!1414598 d!152531))

(check-sat (not d!152467) (not b!1414909) (not bm!67169) (not b!1414837) (not b!1414675) (not bm!67155) (not d!152517) (not b!1414911) (not b!1414841) (not b!1414874) (not b!1414856) (not d!152521) (not d!152481) (not bm!67166) (not b!1414677) (not b!1414783) (not d!152525) (not d!152491) (not b!1414712) (not d!152469) (not b!1414872) (not b!1414908))
(check-sat)
