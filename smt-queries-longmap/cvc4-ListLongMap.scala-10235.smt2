; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120466 () Bool)

(assert start!120466)

(declare-fun b!1402653 () Bool)

(declare-fun res!941164 () Bool)

(declare-fun e!794247 () Bool)

(assert (=> b!1402653 (=> (not res!941164) (not e!794247))))

(declare-datatypes ((array!95875 0))(
  ( (array!95876 (arr!46288 (Array (_ BitVec 32) (_ BitVec 64))) (size!46838 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95875)

(declare-datatypes ((List!32807 0))(
  ( (Nil!32804) (Cons!32803 (h!34051 (_ BitVec 64)) (t!47501 List!32807)) )
))
(declare-fun arrayNoDuplicates!0 (array!95875 (_ BitVec 32) List!32807) Bool)

(assert (=> b!1402653 (= res!941164 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32804))))

(declare-fun b!1402654 () Bool)

(declare-fun e!794249 () Bool)

(assert (=> b!1402654 (= e!794247 (not e!794249))))

(declare-fun res!941171 () Bool)

(assert (=> b!1402654 (=> res!941171 e!794249)))

(declare-datatypes ((SeekEntryResult!10605 0))(
  ( (MissingZero!10605 (index!44797 (_ BitVec 32))) (Found!10605 (index!44798 (_ BitVec 32))) (Intermediate!10605 (undefined!11417 Bool) (index!44799 (_ BitVec 32)) (x!126416 (_ BitVec 32))) (Undefined!10605) (MissingVacant!10605 (index!44800 (_ BitVec 32))) )
))
(declare-fun lt!617935 () SeekEntryResult!10605)

(assert (=> b!1402654 (= res!941171 (or (not (is-Intermediate!10605 lt!617935)) (undefined!11417 lt!617935)))))

(declare-fun lt!617936 () SeekEntryResult!10605)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402654 (= lt!617936 (Found!10605 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95875 (_ BitVec 32)) SeekEntryResult!10605)

(assert (=> b!1402654 (= lt!617936 (seekEntryOrOpen!0 (select (arr!46288 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95875 (_ BitVec 32)) Bool)

(assert (=> b!1402654 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47214 0))(
  ( (Unit!47215) )
))
(declare-fun lt!617934 () Unit!47214)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95875 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47214)

(assert (=> b!1402654 (= lt!617934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617939 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95875 (_ BitVec 32)) SeekEntryResult!10605)

(assert (=> b!1402654 (= lt!617935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617939 (select (arr!46288 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402654 (= lt!617939 (toIndex!0 (select (arr!46288 a!2901) j!112) mask!2840))))

(declare-fun b!1402655 () Bool)

(declare-fun e!794245 () Bool)

(declare-fun e!794246 () Bool)

(assert (=> b!1402655 (= e!794245 e!794246)))

(declare-fun res!941173 () Bool)

(assert (=> b!1402655 (=> res!941173 e!794246)))

(declare-fun lt!617937 () SeekEntryResult!10605)

(assert (=> b!1402655 (= res!941173 (or (bvslt (x!126416 lt!617935) #b00000000000000000000000000000000) (bvsgt (x!126416 lt!617935) #b01111111111111111111111111111110) (bvslt (x!126416 lt!617937) #b00000000000000000000000000000000) (bvsgt (x!126416 lt!617937) #b01111111111111111111111111111110) (bvslt lt!617939 #b00000000000000000000000000000000) (bvsge lt!617939 (size!46838 a!2901)) (bvslt (index!44799 lt!617935) #b00000000000000000000000000000000) (bvsge (index!44799 lt!617935) (size!46838 a!2901)) (bvslt (index!44799 lt!617937) #b00000000000000000000000000000000) (bvsge (index!44799 lt!617937) (size!46838 a!2901)) (not (= lt!617935 (Intermediate!10605 false (index!44799 lt!617935) (x!126416 lt!617935)))) (not (= lt!617937 (Intermediate!10605 false (index!44799 lt!617937) (x!126416 lt!617937))))))))

(declare-fun lt!617938 () array!95875)

(declare-fun lt!617941 () SeekEntryResult!10605)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95875 (_ BitVec 32)) SeekEntryResult!10605)

(assert (=> b!1402655 (= lt!617941 (seekKeyOrZeroReturnVacant!0 (x!126416 lt!617937) (index!44799 lt!617937) (index!44799 lt!617937) (select (arr!46288 a!2901) j!112) lt!617938 mask!2840))))

(declare-fun lt!617942 () (_ BitVec 64))

(assert (=> b!1402655 (= lt!617941 (seekEntryOrOpen!0 lt!617942 lt!617938 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402655 (and (not (undefined!11417 lt!617937)) (= (index!44799 lt!617937) i!1037) (bvslt (x!126416 lt!617937) (x!126416 lt!617935)) (= (select (store (arr!46288 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44799 lt!617937)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617940 () Unit!47214)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95875 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47214)

(assert (=> b!1402655 (= lt!617940 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617939 (x!126416 lt!617935) (index!44799 lt!617935) (x!126416 lt!617937) (index!44799 lt!617937) (undefined!11417 lt!617937) mask!2840))))

(declare-fun b!1402656 () Bool)

(declare-fun res!941168 () Bool)

(assert (=> b!1402656 (=> (not res!941168) (not e!794247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402656 (= res!941168 (validKeyInArray!0 (select (arr!46288 a!2901) i!1037)))))

(declare-fun b!1402657 () Bool)

(declare-fun res!941170 () Bool)

(assert (=> b!1402657 (=> res!941170 e!794246)))

(assert (=> b!1402657 (= res!941170 (not (= lt!617937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617939 lt!617942 lt!617938 mask!2840))))))

(declare-fun b!1402659 () Bool)

(declare-fun res!941166 () Bool)

(assert (=> b!1402659 (=> (not res!941166) (not e!794247))))

(assert (=> b!1402659 (= res!941166 (and (= (size!46838 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46838 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46838 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402660 () Bool)

(assert (=> b!1402660 (= e!794249 e!794245)))

(declare-fun res!941172 () Bool)

(assert (=> b!1402660 (=> res!941172 e!794245)))

(assert (=> b!1402660 (= res!941172 (or (= lt!617935 lt!617937) (not (is-Intermediate!10605 lt!617937))))))

(assert (=> b!1402660 (= lt!617937 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617942 mask!2840) lt!617942 lt!617938 mask!2840))))

(assert (=> b!1402660 (= lt!617942 (select (store (arr!46288 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402660 (= lt!617938 (array!95876 (store (arr!46288 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46838 a!2901)))))

(declare-fun b!1402658 () Bool)

(declare-fun res!941167 () Bool)

(assert (=> b!1402658 (=> (not res!941167) (not e!794247))))

(assert (=> b!1402658 (= res!941167 (validKeyInArray!0 (select (arr!46288 a!2901) j!112)))))

(declare-fun res!941165 () Bool)

(assert (=> start!120466 (=> (not res!941165) (not e!794247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120466 (= res!941165 (validMask!0 mask!2840))))

(assert (=> start!120466 e!794247))

(assert (=> start!120466 true))

(declare-fun array_inv!35316 (array!95875) Bool)

(assert (=> start!120466 (array_inv!35316 a!2901)))

(declare-fun b!1402661 () Bool)

(assert (=> b!1402661 (= e!794246 true)))

(assert (=> b!1402661 (= lt!617936 lt!617941)))

(declare-fun lt!617943 () Unit!47214)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95875 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47214)

(assert (=> b!1402661 (= lt!617943 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617939 (x!126416 lt!617935) (index!44799 lt!617935) (x!126416 lt!617937) (index!44799 lt!617937) mask!2840))))

(declare-fun b!1402662 () Bool)

(declare-fun res!941169 () Bool)

(assert (=> b!1402662 (=> (not res!941169) (not e!794247))))

(assert (=> b!1402662 (= res!941169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120466 res!941165) b!1402659))

(assert (= (and b!1402659 res!941166) b!1402656))

(assert (= (and b!1402656 res!941168) b!1402658))

(assert (= (and b!1402658 res!941167) b!1402662))

(assert (= (and b!1402662 res!941169) b!1402653))

(assert (= (and b!1402653 res!941164) b!1402654))

(assert (= (and b!1402654 (not res!941171)) b!1402660))

(assert (= (and b!1402660 (not res!941172)) b!1402655))

(assert (= (and b!1402655 (not res!941173)) b!1402657))

(assert (= (and b!1402657 (not res!941170)) b!1402661))

(declare-fun m!1290929 () Bool)

(assert (=> b!1402661 m!1290929))

(declare-fun m!1290931 () Bool)

(assert (=> b!1402654 m!1290931))

(declare-fun m!1290933 () Bool)

(assert (=> b!1402654 m!1290933))

(assert (=> b!1402654 m!1290931))

(declare-fun m!1290935 () Bool)

(assert (=> b!1402654 m!1290935))

(assert (=> b!1402654 m!1290931))

(declare-fun m!1290937 () Bool)

(assert (=> b!1402654 m!1290937))

(assert (=> b!1402654 m!1290931))

(declare-fun m!1290939 () Bool)

(assert (=> b!1402654 m!1290939))

(declare-fun m!1290941 () Bool)

(assert (=> b!1402654 m!1290941))

(declare-fun m!1290943 () Bool)

(assert (=> b!1402657 m!1290943))

(declare-fun m!1290945 () Bool)

(assert (=> b!1402655 m!1290945))

(assert (=> b!1402655 m!1290931))

(declare-fun m!1290947 () Bool)

(assert (=> b!1402655 m!1290947))

(assert (=> b!1402655 m!1290931))

(declare-fun m!1290949 () Bool)

(assert (=> b!1402655 m!1290949))

(declare-fun m!1290951 () Bool)

(assert (=> b!1402655 m!1290951))

(declare-fun m!1290953 () Bool)

(assert (=> b!1402655 m!1290953))

(assert (=> b!1402658 m!1290931))

(assert (=> b!1402658 m!1290931))

(declare-fun m!1290955 () Bool)

(assert (=> b!1402658 m!1290955))

(declare-fun m!1290957 () Bool)

(assert (=> start!120466 m!1290957))

(declare-fun m!1290959 () Bool)

(assert (=> start!120466 m!1290959))

(declare-fun m!1290961 () Bool)

(assert (=> b!1402660 m!1290961))

(assert (=> b!1402660 m!1290961))

(declare-fun m!1290963 () Bool)

(assert (=> b!1402660 m!1290963))

(assert (=> b!1402660 m!1290953))

(declare-fun m!1290965 () Bool)

(assert (=> b!1402660 m!1290965))

(declare-fun m!1290967 () Bool)

(assert (=> b!1402656 m!1290967))

(assert (=> b!1402656 m!1290967))

(declare-fun m!1290969 () Bool)

(assert (=> b!1402656 m!1290969))

(declare-fun m!1290971 () Bool)

(assert (=> b!1402653 m!1290971))

(declare-fun m!1290973 () Bool)

(assert (=> b!1402662 m!1290973))

(push 1)

