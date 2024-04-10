; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121962 () Bool)

(assert start!121962)

(declare-fun b!1415394 () Bool)

(declare-fun res!951441 () Bool)

(declare-fun e!801072 () Bool)

(assert (=> b!1415394 (=> (not res!951441) (not e!801072))))

(declare-datatypes ((array!96648 0))(
  ( (array!96649 (arr!46655 (Array (_ BitVec 32) (_ BitVec 64))) (size!47205 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96648)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415394 (= res!951441 (validKeyInArray!0 (select (arr!46655 a!2901) i!1037)))))

(declare-fun b!1415395 () Bool)

(declare-fun e!801070 () Bool)

(declare-fun e!801074 () Bool)

(assert (=> b!1415395 (= e!801070 e!801074)))

(declare-fun res!951444 () Bool)

(assert (=> b!1415395 (=> res!951444 e!801074)))

(declare-datatypes ((SeekEntryResult!10966 0))(
  ( (MissingZero!10966 (index!46256 (_ BitVec 32))) (Found!10966 (index!46257 (_ BitVec 32))) (Intermediate!10966 (undefined!11778 Bool) (index!46258 (_ BitVec 32)) (x!127869 (_ BitVec 32))) (Undefined!10966) (MissingVacant!10966 (index!46259 (_ BitVec 32))) )
))
(declare-fun lt!624111 () SeekEntryResult!10966)

(declare-fun lt!624116 () SeekEntryResult!10966)

(assert (=> b!1415395 (= res!951444 (or (= lt!624111 lt!624116) (not (is-Intermediate!10966 lt!624116))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624113 () array!96648)

(declare-fun lt!624112 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96648 (_ BitVec 32)) SeekEntryResult!10966)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415395 (= lt!624116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624112 mask!2840) lt!624112 lt!624113 mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415395 (= lt!624112 (select (store (arr!46655 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415395 (= lt!624113 (array!96649 (store (arr!46655 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47205 a!2901)))))

(declare-fun b!1415396 () Bool)

(declare-fun res!951443 () Bool)

(assert (=> b!1415396 (=> (not res!951443) (not e!801072))))

(declare-datatypes ((List!33174 0))(
  ( (Nil!33171) (Cons!33170 (h!34457 (_ BitVec 64)) (t!47868 List!33174)) )
))
(declare-fun arrayNoDuplicates!0 (array!96648 (_ BitVec 32) List!33174) Bool)

(assert (=> b!1415396 (= res!951443 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33171))))

(declare-fun b!1415397 () Bool)

(declare-fun e!801069 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96648 (_ BitVec 32)) SeekEntryResult!10966)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96648 (_ BitVec 32)) SeekEntryResult!10966)

(assert (=> b!1415397 (= e!801069 (= (seekEntryOrOpen!0 lt!624112 lt!624113 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127869 lt!624116) (index!46258 lt!624116) (index!46258 lt!624116) (select (arr!46655 a!2901) j!112) lt!624113 mask!2840)))))

(declare-fun b!1415398 () Bool)

(declare-fun res!951440 () Bool)

(assert (=> b!1415398 (=> (not res!951440) (not e!801072))))

(assert (=> b!1415398 (= res!951440 (validKeyInArray!0 (select (arr!46655 a!2901) j!112)))))

(declare-fun b!1415399 () Bool)

(declare-fun e!801073 () Bool)

(assert (=> b!1415399 (= e!801073 (= (seekEntryOrOpen!0 (select (arr!46655 a!2901) j!112) a!2901 mask!2840) (Found!10966 j!112)))))

(declare-fun res!951436 () Bool)

(assert (=> start!121962 (=> (not res!951436) (not e!801072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121962 (= res!951436 (validMask!0 mask!2840))))

(assert (=> start!121962 e!801072))

(assert (=> start!121962 true))

(declare-fun array_inv!35683 (array!96648) Bool)

(assert (=> start!121962 (array_inv!35683 a!2901)))

(declare-fun b!1415400 () Bool)

(declare-fun res!951437 () Bool)

(assert (=> b!1415400 (=> (not res!951437) (not e!801072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96648 (_ BitVec 32)) Bool)

(assert (=> b!1415400 (= res!951437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1415401 () Bool)

(declare-fun res!951445 () Bool)

(assert (=> b!1415401 (=> (not res!951445) (not e!801072))))

(assert (=> b!1415401 (= res!951445 (and (= (size!47205 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47205 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47205 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1415402 () Bool)

(assert (=> b!1415402 (= e!801072 (not e!801070))))

(declare-fun res!951438 () Bool)

(assert (=> b!1415402 (=> res!951438 e!801070)))

(assert (=> b!1415402 (= res!951438 (or (not (is-Intermediate!10966 lt!624111)) (undefined!11778 lt!624111)))))

(assert (=> b!1415402 e!801073))

(declare-fun res!951439 () Bool)

(assert (=> b!1415402 (=> (not res!951439) (not e!801073))))

(assert (=> b!1415402 (= res!951439 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47906 0))(
  ( (Unit!47907) )
))
(declare-fun lt!624115 () Unit!47906)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47906)

(assert (=> b!1415402 (= lt!624115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624114 () (_ BitVec 32))

(assert (=> b!1415402 (= lt!624111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624114 (select (arr!46655 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415402 (= lt!624114 (toIndex!0 (select (arr!46655 a!2901) j!112) mask!2840))))

(declare-fun b!1415403 () Bool)

(assert (=> b!1415403 (= e!801074 (or (bvslt (x!127869 lt!624111) #b00000000000000000000000000000000) (bvsgt (x!127869 lt!624111) #b01111111111111111111111111111110) (bvslt (x!127869 lt!624116) #b00000000000000000000000000000000) (bvsgt (x!127869 lt!624116) #b01111111111111111111111111111110) (bvslt lt!624114 #b00000000000000000000000000000000) (bvsge lt!624114 (size!47205 a!2901)) (bvslt (index!46258 lt!624111) #b00000000000000000000000000000000) (bvsge (index!46258 lt!624111) (size!47205 a!2901)) (bvslt (index!46258 lt!624116) #b00000000000000000000000000000000) (bvsge (index!46258 lt!624116) (size!47205 a!2901)) (= lt!624111 (Intermediate!10966 false (index!46258 lt!624111) (x!127869 lt!624111)))))))

(assert (=> b!1415403 e!801069))

(declare-fun res!951442 () Bool)

(assert (=> b!1415403 (=> (not res!951442) (not e!801069))))

(assert (=> b!1415403 (= res!951442 (and (not (undefined!11778 lt!624116)) (= (index!46258 lt!624116) i!1037) (bvslt (x!127869 lt!624116) (x!127869 lt!624111)) (= (select (store (arr!46655 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46258 lt!624116)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624117 () Unit!47906)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47906)

(assert (=> b!1415403 (= lt!624117 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624114 (x!127869 lt!624111) (index!46258 lt!624111) (x!127869 lt!624116) (index!46258 lt!624116) (undefined!11778 lt!624116) mask!2840))))

(assert (= (and start!121962 res!951436) b!1415401))

(assert (= (and b!1415401 res!951445) b!1415394))

(assert (= (and b!1415394 res!951441) b!1415398))

(assert (= (and b!1415398 res!951440) b!1415400))

(assert (= (and b!1415400 res!951437) b!1415396))

(assert (= (and b!1415396 res!951443) b!1415402))

(assert (= (and b!1415402 res!951439) b!1415399))

(assert (= (and b!1415402 (not res!951438)) b!1415395))

(assert (= (and b!1415395 (not res!951444)) b!1415403))

(assert (= (and b!1415403 res!951442) b!1415397))

(declare-fun m!1305657 () Bool)

(assert (=> b!1415397 m!1305657))

(declare-fun m!1305659 () Bool)

(assert (=> b!1415397 m!1305659))

(assert (=> b!1415397 m!1305659))

(declare-fun m!1305661 () Bool)

(assert (=> b!1415397 m!1305661))

(assert (=> b!1415398 m!1305659))

(assert (=> b!1415398 m!1305659))

(declare-fun m!1305663 () Bool)

(assert (=> b!1415398 m!1305663))

(assert (=> b!1415402 m!1305659))

(declare-fun m!1305665 () Bool)

(assert (=> b!1415402 m!1305665))

(assert (=> b!1415402 m!1305659))

(assert (=> b!1415402 m!1305659))

(declare-fun m!1305667 () Bool)

(assert (=> b!1415402 m!1305667))

(declare-fun m!1305669 () Bool)

(assert (=> b!1415402 m!1305669))

(declare-fun m!1305671 () Bool)

(assert (=> b!1415402 m!1305671))

(assert (=> b!1415399 m!1305659))

(assert (=> b!1415399 m!1305659))

(declare-fun m!1305673 () Bool)

(assert (=> b!1415399 m!1305673))

(declare-fun m!1305675 () Bool)

(assert (=> b!1415403 m!1305675))

(declare-fun m!1305677 () Bool)

(assert (=> b!1415403 m!1305677))

(declare-fun m!1305679 () Bool)

(assert (=> b!1415403 m!1305679))

(declare-fun m!1305681 () Bool)

(assert (=> b!1415394 m!1305681))

(assert (=> b!1415394 m!1305681))

(declare-fun m!1305683 () Bool)

(assert (=> b!1415394 m!1305683))

(declare-fun m!1305685 () Bool)

(assert (=> b!1415396 m!1305685))

(declare-fun m!1305687 () Bool)

(assert (=> start!121962 m!1305687))

(declare-fun m!1305689 () Bool)

(assert (=> start!121962 m!1305689))

(declare-fun m!1305691 () Bool)

(assert (=> b!1415400 m!1305691))

(declare-fun m!1305693 () Bool)

(assert (=> b!1415395 m!1305693))

(assert (=> b!1415395 m!1305693))

(declare-fun m!1305695 () Bool)

(assert (=> b!1415395 m!1305695))

(assert (=> b!1415395 m!1305675))

(declare-fun m!1305697 () Bool)

(assert (=> b!1415395 m!1305697))

(push 1)

