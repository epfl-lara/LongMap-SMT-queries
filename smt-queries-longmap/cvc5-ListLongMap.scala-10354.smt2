; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121872 () Bool)

(assert start!121872)

(declare-fun b!1414707 () Bool)

(declare-fun res!950994 () Bool)

(declare-fun e!800662 () Bool)

(assert (=> b!1414707 (=> (not res!950994) (not e!800662))))

(declare-datatypes ((array!96621 0))(
  ( (array!96622 (arr!46643 (Array (_ BitVec 32) (_ BitVec 64))) (size!47193 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96621)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414707 (= res!950994 (validKeyInArray!0 (select (arr!46643 a!2901) j!112)))))

(declare-fun b!1414708 () Bool)

(declare-fun res!950990 () Bool)

(assert (=> b!1414708 (=> (not res!950990) (not e!800662))))

(declare-datatypes ((List!33162 0))(
  ( (Nil!33159) (Cons!33158 (h!34442 (_ BitVec 64)) (t!47856 List!33162)) )
))
(declare-fun arrayNoDuplicates!0 (array!96621 (_ BitVec 32) List!33162) Bool)

(assert (=> b!1414708 (= res!950990 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33159))))

(declare-fun res!950987 () Bool)

(assert (=> start!121872 (=> (not res!950987) (not e!800662))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121872 (= res!950987 (validMask!0 mask!2840))))

(assert (=> start!121872 e!800662))

(assert (=> start!121872 true))

(declare-fun array_inv!35671 (array!96621) Bool)

(assert (=> start!121872 (array_inv!35671 a!2901)))

(declare-fun b!1414709 () Bool)

(declare-fun res!950992 () Bool)

(assert (=> b!1414709 (=> (not res!950992) (not e!800662))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1414709 (= res!950992 (and (= (size!47193 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47193 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47193 a!2901)) (not (= i!1037 j!112))))))

(declare-fun lt!623708 () array!96621)

(declare-fun e!800661 () Bool)

(declare-datatypes ((SeekEntryResult!10954 0))(
  ( (MissingZero!10954 (index!46205 (_ BitVec 32))) (Found!10954 (index!46206 (_ BitVec 32))) (Intermediate!10954 (undefined!11766 Bool) (index!46207 (_ BitVec 32)) (x!127813 (_ BitVec 32))) (Undefined!10954) (MissingVacant!10954 (index!46208 (_ BitVec 32))) )
))
(declare-fun lt!623705 () SeekEntryResult!10954)

(declare-fun b!1414710 () Bool)

(declare-fun lt!623707 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96621 (_ BitVec 32)) SeekEntryResult!10954)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96621 (_ BitVec 32)) SeekEntryResult!10954)

(assert (=> b!1414710 (= e!800661 (= (seekEntryOrOpen!0 lt!623707 lt!623708 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127813 lt!623705) (index!46207 lt!623705) (index!46207 lt!623705) (select (arr!46643 a!2901) j!112) lt!623708 mask!2840)))))

(declare-fun b!1414711 () Bool)

(declare-fun res!950993 () Bool)

(assert (=> b!1414711 (=> (not res!950993) (not e!800662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96621 (_ BitVec 32)) Bool)

(assert (=> b!1414711 (= res!950993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!800659 () Bool)

(declare-fun lt!623706 () SeekEntryResult!10954)

(declare-fun lt!623703 () (_ BitVec 32))

(declare-fun b!1414712 () Bool)

(assert (=> b!1414712 (= e!800659 (or (bvslt (x!127813 lt!623706) #b00000000000000000000000000000000) (bvsgt (x!127813 lt!623706) #b01111111111111111111111111111110) (bvslt (x!127813 lt!623705) #b00000000000000000000000000000000) (bvsgt (x!127813 lt!623705) #b01111111111111111111111111111110) (bvslt lt!623703 #b00000000000000000000000000000000) (bvsge lt!623703 (size!47193 a!2901)) (and (bvsge (index!46207 lt!623706) #b00000000000000000000000000000000) (bvslt (index!46207 lt!623706) (size!47193 a!2901)))))))

(assert (=> b!1414712 e!800661))

(declare-fun res!950986 () Bool)

(assert (=> b!1414712 (=> (not res!950986) (not e!800661))))

(assert (=> b!1414712 (= res!950986 (and (not (undefined!11766 lt!623705)) (= (index!46207 lt!623705) i!1037) (bvslt (x!127813 lt!623705) (x!127813 lt!623706)) (= (select (store (arr!46643 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46207 lt!623705)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47882 0))(
  ( (Unit!47883) )
))
(declare-fun lt!623709 () Unit!47882)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47882)

(assert (=> b!1414712 (= lt!623709 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623703 (x!127813 lt!623706) (index!46207 lt!623706) (x!127813 lt!623705) (index!46207 lt!623705) (undefined!11766 lt!623705) mask!2840))))

(declare-fun e!800660 () Bool)

(declare-fun b!1414713 () Bool)

(assert (=> b!1414713 (= e!800660 (= (seekEntryOrOpen!0 (select (arr!46643 a!2901) j!112) a!2901 mask!2840) (Found!10954 j!112)))))

(declare-fun b!1414714 () Bool)

(declare-fun res!950988 () Bool)

(assert (=> b!1414714 (=> (not res!950988) (not e!800662))))

(assert (=> b!1414714 (= res!950988 (validKeyInArray!0 (select (arr!46643 a!2901) i!1037)))))

(declare-fun b!1414715 () Bool)

(declare-fun e!800663 () Bool)

(assert (=> b!1414715 (= e!800663 e!800659)))

(declare-fun res!950995 () Bool)

(assert (=> b!1414715 (=> res!950995 e!800659)))

(assert (=> b!1414715 (= res!950995 (or (= lt!623706 lt!623705) (not (is-Intermediate!10954 lt!623705))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96621 (_ BitVec 32)) SeekEntryResult!10954)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414715 (= lt!623705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623707 mask!2840) lt!623707 lt!623708 mask!2840))))

(assert (=> b!1414715 (= lt!623707 (select (store (arr!46643 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414715 (= lt!623708 (array!96622 (store (arr!46643 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47193 a!2901)))))

(declare-fun b!1414716 () Bool)

(assert (=> b!1414716 (= e!800662 (not e!800663))))

(declare-fun res!950989 () Bool)

(assert (=> b!1414716 (=> res!950989 e!800663)))

(assert (=> b!1414716 (= res!950989 (or (not (is-Intermediate!10954 lt!623706)) (undefined!11766 lt!623706)))))

(assert (=> b!1414716 e!800660))

(declare-fun res!950991 () Bool)

(assert (=> b!1414716 (=> (not res!950991) (not e!800660))))

(assert (=> b!1414716 (= res!950991 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623704 () Unit!47882)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47882)

(assert (=> b!1414716 (= lt!623704 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1414716 (= lt!623706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623703 (select (arr!46643 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1414716 (= lt!623703 (toIndex!0 (select (arr!46643 a!2901) j!112) mask!2840))))

(assert (= (and start!121872 res!950987) b!1414709))

(assert (= (and b!1414709 res!950992) b!1414714))

(assert (= (and b!1414714 res!950988) b!1414707))

(assert (= (and b!1414707 res!950994) b!1414711))

(assert (= (and b!1414711 res!950993) b!1414708))

(assert (= (and b!1414708 res!950990) b!1414716))

(assert (= (and b!1414716 res!950991) b!1414713))

(assert (= (and b!1414716 (not res!950989)) b!1414715))

(assert (= (and b!1414715 (not res!950995)) b!1414712))

(assert (= (and b!1414712 res!950986) b!1414710))

(declare-fun m!1304931 () Bool)

(assert (=> b!1414712 m!1304931))

(declare-fun m!1304933 () Bool)

(assert (=> b!1414712 m!1304933))

(declare-fun m!1304935 () Bool)

(assert (=> b!1414712 m!1304935))

(declare-fun m!1304937 () Bool)

(assert (=> b!1414716 m!1304937))

(declare-fun m!1304939 () Bool)

(assert (=> b!1414716 m!1304939))

(assert (=> b!1414716 m!1304937))

(declare-fun m!1304941 () Bool)

(assert (=> b!1414716 m!1304941))

(assert (=> b!1414716 m!1304937))

(declare-fun m!1304943 () Bool)

(assert (=> b!1414716 m!1304943))

(declare-fun m!1304945 () Bool)

(assert (=> b!1414716 m!1304945))

(declare-fun m!1304947 () Bool)

(assert (=> b!1414708 m!1304947))

(declare-fun m!1304949 () Bool)

(assert (=> b!1414714 m!1304949))

(assert (=> b!1414714 m!1304949))

(declare-fun m!1304951 () Bool)

(assert (=> b!1414714 m!1304951))

(declare-fun m!1304953 () Bool)

(assert (=> b!1414710 m!1304953))

(assert (=> b!1414710 m!1304937))

(assert (=> b!1414710 m!1304937))

(declare-fun m!1304955 () Bool)

(assert (=> b!1414710 m!1304955))

(declare-fun m!1304957 () Bool)

(assert (=> start!121872 m!1304957))

(declare-fun m!1304959 () Bool)

(assert (=> start!121872 m!1304959))

(assert (=> b!1414707 m!1304937))

(assert (=> b!1414707 m!1304937))

(declare-fun m!1304961 () Bool)

(assert (=> b!1414707 m!1304961))

(declare-fun m!1304963 () Bool)

(assert (=> b!1414715 m!1304963))

(assert (=> b!1414715 m!1304963))

(declare-fun m!1304965 () Bool)

(assert (=> b!1414715 m!1304965))

(assert (=> b!1414715 m!1304931))

(declare-fun m!1304967 () Bool)

(assert (=> b!1414715 m!1304967))

(declare-fun m!1304969 () Bool)

(assert (=> b!1414711 m!1304969))

(assert (=> b!1414713 m!1304937))

(assert (=> b!1414713 m!1304937))

(declare-fun m!1304971 () Bool)

(assert (=> b!1414713 m!1304971))

(push 1)

(assert (not b!1414716))

(assert (not b!1414713))

(assert (not b!1414715))

(assert (not b!1414707))

(assert (not b!1414714))

(assert (not b!1414711))

(assert (not b!1414712))

(assert (not b!1414710))

(assert (not b!1414708))

(assert (not start!121872))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1414840 () Bool)

(declare-fun e!800737 () SeekEntryResult!10954)

(declare-fun e!800738 () SeekEntryResult!10954)

(assert (=> b!1414840 (= e!800737 e!800738)))

(declare-fun lt!623774 () (_ BitVec 64))

(declare-fun lt!623775 () SeekEntryResult!10954)

(assert (=> b!1414840 (= lt!623774 (select (arr!46643 lt!623708) (index!46207 lt!623775)))))

(declare-fun c!131366 () Bool)

(assert (=> b!1414840 (= c!131366 (= lt!623774 lt!623707))))

(declare-fun d!152421 () Bool)

(declare-fun lt!623773 () SeekEntryResult!10954)

(assert (=> d!152421 (and (or (is-Undefined!10954 lt!623773) (not (is-Found!10954 lt!623773)) (and (bvsge (index!46206 lt!623773) #b00000000000000000000000000000000) (bvslt (index!46206 lt!623773) (size!47193 lt!623708)))) (or (is-Undefined!10954 lt!623773) (is-Found!10954 lt!623773) (not (is-MissingZero!10954 lt!623773)) (and (bvsge (index!46205 lt!623773) #b00000000000000000000000000000000) (bvslt (index!46205 lt!623773) (size!47193 lt!623708)))) (or (is-Undefined!10954 lt!623773) (is-Found!10954 lt!623773) (is-MissingZero!10954 lt!623773) (not (is-MissingVacant!10954 lt!623773)) (and (bvsge (index!46208 lt!623773) #b00000000000000000000000000000000) (bvslt (index!46208 lt!623773) (size!47193 lt!623708)))) (or (is-Undefined!10954 lt!623773) (ite (is-Found!10954 lt!623773) (= (select (arr!46643 lt!623708) (index!46206 lt!623773)) lt!623707) (ite (is-MissingZero!10954 lt!623773) (= (select (arr!46643 lt!623708) (index!46205 lt!623773)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10954 lt!623773) (= (select (arr!46643 lt!623708) (index!46208 lt!623773)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152421 (= lt!623773 e!800737)))

(declare-fun c!131367 () Bool)

(assert (=> d!152421 (= c!131367 (and (is-Intermediate!10954 lt!623775) (undefined!11766 lt!623775)))))

(assert (=> d!152421 (= lt!623775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623707 mask!2840) lt!623707 lt!623708 mask!2840))))

(assert (=> d!152421 (validMask!0 mask!2840)))

(assert (=> d!152421 (= (seekEntryOrOpen!0 lt!623707 lt!623708 mask!2840) lt!623773)))

(declare-fun b!1414841 () Bool)

(declare-fun c!131365 () Bool)

(assert (=> b!1414841 (= c!131365 (= lt!623774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800736 () SeekEntryResult!10954)

(assert (=> b!1414841 (= e!800738 e!800736)))

(declare-fun b!1414842 () Bool)

(assert (=> b!1414842 (= e!800736 (seekKeyOrZeroReturnVacant!0 (x!127813 lt!623775) (index!46207 lt!623775) (index!46207 lt!623775) lt!623707 lt!623708 mask!2840))))

(declare-fun b!1414843 () Bool)

(assert (=> b!1414843 (= e!800736 (MissingZero!10954 (index!46207 lt!623775)))))

(declare-fun b!1414844 () Bool)

(assert (=> b!1414844 (= e!800738 (Found!10954 (index!46207 lt!623775)))))

(declare-fun b!1414845 () Bool)

(assert (=> b!1414845 (= e!800737 Undefined!10954)))

(assert (= (and d!152421 c!131367) b!1414845))

(assert (= (and d!152421 (not c!131367)) b!1414840))

(assert (= (and b!1414840 c!131366) b!1414844))

(assert (= (and b!1414840 (not c!131366)) b!1414841))

(assert (= (and b!1414841 c!131365) b!1414843))

(assert (= (and b!1414841 (not c!131365)) b!1414842))

(declare-fun m!1305085 () Bool)

(assert (=> b!1414840 m!1305085))

(assert (=> d!152421 m!1304963))

(assert (=> d!152421 m!1304963))

(assert (=> d!152421 m!1304965))

(assert (=> d!152421 m!1304957))

(declare-fun m!1305087 () Bool)

(assert (=> d!152421 m!1305087))

(declare-fun m!1305089 () Bool)

(assert (=> d!152421 m!1305089))

(declare-fun m!1305091 () Bool)

(assert (=> d!152421 m!1305091))

(declare-fun m!1305093 () Bool)

(assert (=> b!1414842 m!1305093))

(assert (=> b!1414710 d!152421))

(declare-fun d!152431 () Bool)

(declare-fun lt!623789 () SeekEntryResult!10954)

(assert (=> d!152431 (and (or (is-Undefined!10954 lt!623789) (not (is-Found!10954 lt!623789)) (and (bvsge (index!46206 lt!623789) #b00000000000000000000000000000000) (bvslt (index!46206 lt!623789) (size!47193 lt!623708)))) (or (is-Undefined!10954 lt!623789) (is-Found!10954 lt!623789) (not (is-MissingVacant!10954 lt!623789)) (not (= (index!46208 lt!623789) (index!46207 lt!623705))) (and (bvsge (index!46208 lt!623789) #b00000000000000000000000000000000) (bvslt (index!46208 lt!623789) (size!47193 lt!623708)))) (or (is-Undefined!10954 lt!623789) (ite (is-Found!10954 lt!623789) (= (select (arr!46643 lt!623708) (index!46206 lt!623789)) (select (arr!46643 a!2901) j!112)) (and (is-MissingVacant!10954 lt!623789) (= (index!46208 lt!623789) (index!46207 lt!623705)) (= (select (arr!46643 lt!623708) (index!46208 lt!623789)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!800763 () SeekEntryResult!10954)

(assert (=> d!152431 (= lt!623789 e!800763)))

(declare-fun c!131383 () Bool)

(assert (=> d!152431 (= c!131383 (bvsge (x!127813 lt!623705) #b01111111111111111111111111111110))))

(declare-fun lt!623790 () (_ BitVec 64))

(assert (=> d!152431 (= lt!623790 (select (arr!46643 lt!623708) (index!46207 lt!623705)))))

(assert (=> d!152431 (validMask!0 mask!2840)))

(assert (=> d!152431 (= (seekKeyOrZeroReturnVacant!0 (x!127813 lt!623705) (index!46207 lt!623705) (index!46207 lt!623705) (select (arr!46643 a!2901) j!112) lt!623708 mask!2840) lt!623789)))

(declare-fun b!1414885 () Bool)

(declare-fun e!800765 () SeekEntryResult!10954)

(assert (=> b!1414885 (= e!800765 (Found!10954 (index!46207 lt!623705)))))

(declare-fun b!1414886 () Bool)

(assert (=> b!1414886 (= e!800763 Undefined!10954)))

(declare-fun b!1414887 () Bool)

(declare-fun e!800764 () SeekEntryResult!10954)

(assert (=> b!1414887 (= e!800764 (MissingVacant!10954 (index!46207 lt!623705)))))

(declare-fun b!1414888 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414888 (= e!800764 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127813 lt!623705) #b00000000000000000000000000000001) (nextIndex!0 (index!46207 lt!623705) (x!127813 lt!623705) mask!2840) (index!46207 lt!623705) (select (arr!46643 a!2901) j!112) lt!623708 mask!2840))))

(declare-fun b!1414889 () Bool)

(declare-fun c!131385 () Bool)

(assert (=> b!1414889 (= c!131385 (= lt!623790 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414889 (= e!800765 e!800764)))

(declare-fun b!1414890 () Bool)

(assert (=> b!1414890 (= e!800763 e!800765)))

(declare-fun c!131384 () Bool)

(assert (=> b!1414890 (= c!131384 (= lt!623790 (select (arr!46643 a!2901) j!112)))))

(assert (= (and d!152431 c!131383) b!1414886))

(assert (= (and d!152431 (not c!131383)) b!1414890))

(assert (= (and b!1414890 c!131384) b!1414885))

(assert (= (and b!1414890 (not c!131384)) b!1414889))

(assert (= (and b!1414889 c!131385) b!1414887))

(assert (= (and b!1414889 (not c!131385)) b!1414888))

(declare-fun m!1305105 () Bool)

(assert (=> d!152431 m!1305105))

(declare-fun m!1305107 () Bool)

(assert (=> d!152431 m!1305107))

(declare-fun m!1305109 () Bool)

(assert (=> d!152431 m!1305109))

(assert (=> d!152431 m!1304957))

(declare-fun m!1305111 () Bool)

(assert (=> b!1414888 m!1305111))

(assert (=> b!1414888 m!1305111))

(assert (=> b!1414888 m!1304937))

(declare-fun m!1305113 () Bool)

(assert (=> b!1414888 m!1305113))

(assert (=> b!1414710 d!152431))

(declare-fun b!1414960 () Bool)

(declare-fun e!800803 () SeekEntryResult!10954)

(declare-fun e!800806 () SeekEntryResult!10954)

(assert (=> b!1414960 (= e!800803 e!800806)))

(declare-fun c!131415 () Bool)

(declare-fun lt!623817 () (_ BitVec 64))

(assert (=> b!1414960 (= c!131415 (or (= lt!623817 lt!623707) (= (bvadd lt!623817 lt!623817) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1414961 () Bool)

(declare-fun lt!623816 () SeekEntryResult!10954)

(assert (=> b!1414961 (and (bvsge (index!46207 lt!623816) #b00000000000000000000000000000000) (bvslt (index!46207 lt!623816) (size!47193 lt!623708)))))

(declare-fun res!951091 () Bool)

(assert (=> b!1414961 (= res!951091 (= (select (arr!46643 lt!623708) (index!46207 lt!623816)) lt!623707))))

(declare-fun e!800807 () Bool)

(assert (=> b!1414961 (=> res!951091 e!800807)))

(declare-fun e!800804 () Bool)

(assert (=> b!1414961 (= e!800804 e!800807)))

(declare-fun b!1414962 () Bool)

(declare-fun e!800805 () Bool)

(assert (=> b!1414962 (= e!800805 e!800804)))

(declare-fun res!951090 () Bool)

(assert (=> b!1414962 (= res!951090 (and (is-Intermediate!10954 lt!623816) (not (undefined!11766 lt!623816)) (bvslt (x!127813 lt!623816) #b01111111111111111111111111111110) (bvsge (x!127813 lt!623816) #b00000000000000000000000000000000) (bvsge (x!127813 lt!623816) #b00000000000000000000000000000000)))))

(assert (=> b!1414962 (=> (not res!951090) (not e!800804))))

(declare-fun b!1414963 () Bool)

(assert (=> b!1414963 (= e!800805 (bvsge (x!127813 lt!623816) #b01111111111111111111111111111110))))

(declare-fun b!1414964 () Bool)

(assert (=> b!1414964 (and (bvsge (index!46207 lt!623816) #b00000000000000000000000000000000) (bvslt (index!46207 lt!623816) (size!47193 lt!623708)))))

(assert (=> b!1414964 (= e!800807 (= (select (arr!46643 lt!623708) (index!46207 lt!623816)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1414965 () Bool)

(assert (=> b!1414965 (= e!800803 (Intermediate!10954 true (toIndex!0 lt!623707 mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!152439 () Bool)

(assert (=> d!152439 e!800805))

(declare-fun c!131414 () Bool)

(assert (=> d!152439 (= c!131414 (and (is-Intermediate!10954 lt!623816) (undefined!11766 lt!623816)))))

(assert (=> d!152439 (= lt!623816 e!800803)))

(declare-fun c!131413 () Bool)

(assert (=> d!152439 (= c!131413 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152439 (= lt!623817 (select (arr!46643 lt!623708) (toIndex!0 lt!623707 mask!2840)))))

(assert (=> d!152439 (validMask!0 mask!2840)))

(assert (=> d!152439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623707 mask!2840) lt!623707 lt!623708 mask!2840) lt!623816)))

(declare-fun b!1414966 () Bool)

(assert (=> b!1414966 (and (bvsge (index!46207 lt!623816) #b00000000000000000000000000000000) (bvslt (index!46207 lt!623816) (size!47193 lt!623708)))))

(declare-fun res!951092 () Bool)

(assert (=> b!1414966 (= res!951092 (= (select (arr!46643 lt!623708) (index!46207 lt!623816)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1414966 (=> res!951092 e!800807)))

(declare-fun b!1414967 () Bool)

(assert (=> b!1414967 (= e!800806 (Intermediate!10954 false (toIndex!0 lt!623707 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1414968 () Bool)

(assert (=> b!1414968 (= e!800806 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623707 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623707 lt!623708 mask!2840))))

(assert (= (and d!152439 c!131413) b!1414965))

(assert (= (and d!152439 (not c!131413)) b!1414960))

(assert (= (and b!1414960 c!131415) b!1414967))

(assert (= (and b!1414960 (not c!131415)) b!1414968))

(assert (= (and d!152439 c!131414) b!1414963))

(assert (= (and d!152439 (not c!131414)) b!1414962))

(assert (= (and b!1414962 res!951090) b!1414961))

(assert (= (and b!1414961 (not res!951091)) b!1414966))

(assert (= (and b!1414966 (not res!951092)) b!1414964))

(assert (=> b!1414968 m!1304963))

(declare-fun m!1305143 () Bool)

(assert (=> b!1414968 m!1305143))

(assert (=> b!1414968 m!1305143))

(declare-fun m!1305145 () Bool)

(assert (=> b!1414968 m!1305145))

(assert (=> d!152439 m!1304963))

(declare-fun m!1305147 () Bool)

(assert (=> d!152439 m!1305147))

(assert (=> d!152439 m!1304957))

(declare-fun m!1305151 () Bool)

(assert (=> b!1414961 m!1305151))

(assert (=> b!1414966 m!1305151))

(assert (=> b!1414964 m!1305151))

(assert (=> b!1414715 d!152439))

(declare-fun d!152451 () Bool)

(declare-fun lt!623832 () (_ BitVec 32))

(declare-fun lt!623831 () (_ BitVec 32))

(assert (=> d!152451 (= lt!623832 (bvmul (bvxor lt!623831 (bvlshr lt!623831 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152451 (= lt!623831 ((_ extract 31 0) (bvand (bvxor lt!623707 (bvlshr lt!623707 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152451 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951093 (let ((h!34446 ((_ extract 31 0) (bvand (bvxor lt!623707 (bvlshr lt!623707 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127823 (bvmul (bvxor h!34446 (bvlshr h!34446 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127823 (bvlshr x!127823 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951093 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951093 #b00000000000000000000000000000000))))))

(assert (=> d!152451 (= (toIndex!0 lt!623707 mask!2840) (bvand (bvxor lt!623832 (bvlshr lt!623832 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414715 d!152451))

(declare-fun d!152455 () Bool)

(assert (=> d!152455 (= (validKeyInArray!0 (select (arr!46643 a!2901) i!1037)) (and (not (= (select (arr!46643 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46643 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414714 d!152455))

(declare-fun b!1415018 () Bool)

(declare-fun e!800846 () Bool)

(declare-fun e!800843 () Bool)

(assert (=> b!1415018 (= e!800846 e!800843)))

(declare-fun c!131429 () Bool)

(assert (=> b!1415018 (= c!131429 (validKeyInArray!0 (select (arr!46643 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67173 () Bool)

(declare-fun call!67176 () Bool)

(assert (=> bm!67173 (= call!67176 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131429 (Cons!33158 (select (arr!46643 a!2901) #b00000000000000000000000000000000) Nil!33159) Nil!33159)))))

(declare-fun b!1415019 () Bool)

(declare-fun e!800845 () Bool)

(assert (=> b!1415019 (= e!800845 e!800846)))

(declare-fun res!951117 () Bool)

(assert (=> b!1415019 (=> (not res!951117) (not e!800846))))

(declare-fun e!800844 () Bool)

(assert (=> b!1415019 (= res!951117 (not e!800844))))

(declare-fun res!951116 () Bool)

(assert (=> b!1415019 (=> (not res!951116) (not e!800844))))

(assert (=> b!1415019 (= res!951116 (validKeyInArray!0 (select (arr!46643 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1415020 () Bool)

(assert (=> b!1415020 (= e!800843 call!67176)))

(declare-fun b!1415021 () Bool)

(assert (=> b!1415021 (= e!800843 call!67176)))

(declare-fun d!152457 () Bool)

(declare-fun res!951118 () Bool)

(assert (=> d!152457 (=> res!951118 e!800845)))

(assert (=> d!152457 (= res!951118 (bvsge #b00000000000000000000000000000000 (size!47193 a!2901)))))

(assert (=> d!152457 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33159) e!800845)))

(declare-fun b!1415017 () Bool)

(declare-fun contains!9824 (List!33162 (_ BitVec 64)) Bool)

(assert (=> b!1415017 (= e!800844 (contains!9824 Nil!33159 (select (arr!46643 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152457 (not res!951118)) b!1415019))

(assert (= (and b!1415019 res!951116) b!1415017))

(assert (= (and b!1415019 res!951117) b!1415018))

(assert (= (and b!1415018 c!131429) b!1415021))

(assert (= (and b!1415018 (not c!131429)) b!1415020))

(assert (= (or b!1415021 b!1415020) bm!67173))

(declare-fun m!1305193 () Bool)

(assert (=> b!1415018 m!1305193))

(assert (=> b!1415018 m!1305193))

(declare-fun m!1305195 () Bool)

(assert (=> b!1415018 m!1305195))

(assert (=> bm!67173 m!1305193))

(declare-fun m!1305197 () Bool)

(assert (=> bm!67173 m!1305197))

(assert (=> b!1415019 m!1305193))

(assert (=> b!1415019 m!1305193))

(assert (=> b!1415019 m!1305195))

(assert (=> b!1415017 m!1305193))

(assert (=> b!1415017 m!1305193))

(declare-fun m!1305199 () Bool)

(assert (=> b!1415017 m!1305199))

(assert (=> b!1414708 d!152457))

(declare-fun d!152471 () Bool)

(assert (=> d!152471 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121872 d!152471))

(declare-fun d!152477 () Bool)

(assert (=> d!152477 (= (array_inv!35671 a!2901) (bvsge (size!47193 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121872 d!152477))

(declare-fun b!1415031 () Bool)

(declare-fun e!800853 () SeekEntryResult!10954)

(declare-fun e!800854 () SeekEntryResult!10954)

(assert (=> b!1415031 (= e!800853 e!800854)))

(declare-fun lt!623862 () (_ BitVec 64))

(declare-fun lt!623863 () SeekEntryResult!10954)

(assert (=> b!1415031 (= lt!623862 (select (arr!46643 a!2901) (index!46207 lt!623863)))))

(declare-fun c!131434 () Bool)

(assert (=> b!1415031 (= c!131434 (= lt!623862 (select (arr!46643 a!2901) j!112)))))

(declare-fun d!152479 () Bool)

(declare-fun lt!623861 () SeekEntryResult!10954)

(assert (=> d!152479 (and (or (is-Undefined!10954 lt!623861) (not (is-Found!10954 lt!623861)) (and (bvsge (index!46206 lt!623861) #b00000000000000000000000000000000) (bvslt (index!46206 lt!623861) (size!47193 a!2901)))) (or (is-Undefined!10954 lt!623861) (is-Found!10954 lt!623861) (not (is-MissingZero!10954 lt!623861)) (and (bvsge (index!46205 lt!623861) #b00000000000000000000000000000000) (bvslt (index!46205 lt!623861) (size!47193 a!2901)))) (or (is-Undefined!10954 lt!623861) (is-Found!10954 lt!623861) (is-MissingZero!10954 lt!623861) (not (is-MissingVacant!10954 lt!623861)) (and (bvsge (index!46208 lt!623861) #b00000000000000000000000000000000) (bvslt (index!46208 lt!623861) (size!47193 a!2901)))) (or (is-Undefined!10954 lt!623861) (ite (is-Found!10954 lt!623861) (= (select (arr!46643 a!2901) (index!46206 lt!623861)) (select (arr!46643 a!2901) j!112)) (ite (is-MissingZero!10954 lt!623861) (= (select (arr!46643 a!2901) (index!46205 lt!623861)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10954 lt!623861) (= (select (arr!46643 a!2901) (index!46208 lt!623861)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152479 (= lt!623861 e!800853)))

(declare-fun c!131435 () Bool)

(assert (=> d!152479 (= c!131435 (and (is-Intermediate!10954 lt!623863) (undefined!11766 lt!623863)))))

(assert (=> d!152479 (= lt!623863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46643 a!2901) j!112) mask!2840) (select (arr!46643 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152479 (validMask!0 mask!2840)))

(assert (=> d!152479 (= (seekEntryOrOpen!0 (select (arr!46643 a!2901) j!112) a!2901 mask!2840) lt!623861)))

(declare-fun b!1415032 () Bool)

(declare-fun c!131433 () Bool)

(assert (=> b!1415032 (= c!131433 (= lt!623862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800852 () SeekEntryResult!10954)

(assert (=> b!1415032 (= e!800854 e!800852)))

(declare-fun b!1415033 () Bool)

(assert (=> b!1415033 (= e!800852 (seekKeyOrZeroReturnVacant!0 (x!127813 lt!623863) (index!46207 lt!623863) (index!46207 lt!623863) (select (arr!46643 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1415034 () Bool)

(assert (=> b!1415034 (= e!800852 (MissingZero!10954 (index!46207 lt!623863)))))

(declare-fun b!1415035 () Bool)

(assert (=> b!1415035 (= e!800854 (Found!10954 (index!46207 lt!623863)))))

(declare-fun b!1415036 () Bool)

(assert (=> b!1415036 (= e!800853 Undefined!10954)))

(assert (= (and d!152479 c!131435) b!1415036))

(assert (= (and d!152479 (not c!131435)) b!1415031))

(assert (= (and b!1415031 c!131434) b!1415035))

(assert (= (and b!1415031 (not c!131434)) b!1415032))

(assert (= (and b!1415032 c!131433) b!1415034))

(assert (= (and b!1415032 (not c!131433)) b!1415033))

(declare-fun m!1305211 () Bool)

(assert (=> b!1415031 m!1305211))

(assert (=> d!152479 m!1304937))

(assert (=> d!152479 m!1304941))

(assert (=> d!152479 m!1304941))

(assert (=> d!152479 m!1304937))

(declare-fun m!1305213 () Bool)

(assert (=> d!152479 m!1305213))

(assert (=> d!152479 m!1304957))

(declare-fun m!1305215 () Bool)

(assert (=> d!152479 m!1305215))

(declare-fun m!1305217 () Bool)

(assert (=> d!152479 m!1305217))

(declare-fun m!1305219 () Bool)

(assert (=> d!152479 m!1305219))

(assert (=> b!1415033 m!1304937))

(declare-fun m!1305221 () Bool)

(assert (=> b!1415033 m!1305221))

(assert (=> b!1414713 d!152479))

(declare-fun d!152481 () Bool)

(assert (=> d!152481 (= (validKeyInArray!0 (select (arr!46643 a!2901) j!112)) (and (not (= (select (arr!46643 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46643 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414707 d!152481))

(declare-fun d!152483 () Bool)

(assert (=> d!152483 (and (not (undefined!11766 lt!623705)) (= (index!46207 lt!623705) i!1037) (bvslt (x!127813 lt!623705) (x!127813 lt!623706)))))

(declare-fun lt!623870 () Unit!47882)

(declare-fun choose!62 (array!96621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47882)

(assert (=> d!152483 (= lt!623870 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623703 (x!127813 lt!623706) (index!46207 lt!623706) (x!127813 lt!623705) (index!46207 lt!623705) (undefined!11766 lt!623705) mask!2840))))

(assert (=> d!152483 (validMask!0 mask!2840)))

(assert (=> d!152483 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623703 (x!127813 lt!623706) (index!46207 lt!623706) (x!127813 lt!623705) (index!46207 lt!623705) (undefined!11766 lt!623705) mask!2840) lt!623870)))

(declare-fun bs!41246 () Bool)

(assert (= bs!41246 d!152483))

(declare-fun m!1305223 () Bool)

(assert (=> bs!41246 m!1305223))

(assert (=> bs!41246 m!1304957))

(assert (=> b!1414712 d!152483))

(declare-fun b!1415072 () Bool)

(declare-fun e!800876 () Bool)

(declare-fun e!800878 () Bool)

(assert (=> b!1415072 (= e!800876 e!800878)))

(declare-fun c!131447 () Bool)

(assert (=> b!1415072 (= c!131447 (validKeyInArray!0 (select (arr!46643 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1415073 () Bool)

(declare-fun call!67179 () Bool)

(assert (=> b!1415073 (= e!800878 call!67179)))

(declare-fun bm!67176 () Bool)

(assert (=> bm!67176 (= call!67179 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152485 () Bool)

(declare-fun res!951136 () Bool)

(assert (=> d!152485 (=> res!951136 e!800876)))

(assert (=> d!152485 (= res!951136 (bvsge #b00000000000000000000000000000000 (size!47193 a!2901)))))

(assert (=> d!152485 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800876)))

(declare-fun b!1415074 () Bool)

(declare-fun e!800877 () Bool)

(assert (=> b!1415074 (= e!800878 e!800877)))

(declare-fun lt!623885 () (_ BitVec 64))

(assert (=> b!1415074 (= lt!623885 (select (arr!46643 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623883 () Unit!47882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96621 (_ BitVec 64) (_ BitVec 32)) Unit!47882)

(assert (=> b!1415074 (= lt!623883 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623885 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1415074 (arrayContainsKey!0 a!2901 lt!623885 #b00000000000000000000000000000000)))

(declare-fun lt!623884 () Unit!47882)

(assert (=> b!1415074 (= lt!623884 lt!623883)))

(declare-fun res!951137 () Bool)

(assert (=> b!1415074 (= res!951137 (= (seekEntryOrOpen!0 (select (arr!46643 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10954 #b00000000000000000000000000000000)))))

(assert (=> b!1415074 (=> (not res!951137) (not e!800877))))

(declare-fun b!1415075 () Bool)

(assert (=> b!1415075 (= e!800877 call!67179)))

(assert (= (and d!152485 (not res!951136)) b!1415072))

(assert (= (and b!1415072 c!131447) b!1415074))

(assert (= (and b!1415072 (not c!131447)) b!1415073))

(assert (= (and b!1415074 res!951137) b!1415075))

(assert (= (or b!1415075 b!1415073) bm!67176))

(assert (=> b!1415072 m!1305193))

(assert (=> b!1415072 m!1305193))

(assert (=> b!1415072 m!1305195))

(declare-fun m!1305233 () Bool)

(assert (=> bm!67176 m!1305233))

(assert (=> b!1415074 m!1305193))

(declare-fun m!1305235 () Bool)

(assert (=> b!1415074 m!1305235))

(declare-fun m!1305237 () Bool)

(assert (=> b!1415074 m!1305237))

(assert (=> b!1415074 m!1305193))

(declare-fun m!1305239 () Bool)

(assert (=> b!1415074 m!1305239))

(assert (=> b!1414711 d!152485))

(declare-fun b!1415082 () Bool)

(declare-fun e!800882 () Bool)

(declare-fun e!800884 () Bool)

(assert (=> b!1415082 (= e!800882 e!800884)))

(declare-fun c!131451 () Bool)

(assert (=> b!1415082 (= c!131451 (validKeyInArray!0 (select (arr!46643 a!2901) j!112)))))

(declare-fun b!1415083 () Bool)

(declare-fun call!67180 () Bool)

(assert (=> b!1415083 (= e!800884 call!67180)))

(declare-fun bm!67177 () Bool)

(assert (=> bm!67177 (= call!67180 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152493 () Bool)

(declare-fun res!951138 () Bool)

(assert (=> d!152493 (=> res!951138 e!800882)))

(assert (=> d!152493 (= res!951138 (bvsge j!112 (size!47193 a!2901)))))

(assert (=> d!152493 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800882)))

(declare-fun b!1415084 () Bool)

(declare-fun e!800883 () Bool)

(assert (=> b!1415084 (= e!800884 e!800883)))

(declare-fun lt!623893 () (_ BitVec 64))

(assert (=> b!1415084 (= lt!623893 (select (arr!46643 a!2901) j!112))))

(declare-fun lt!623891 () Unit!47882)

(assert (=> b!1415084 (= lt!623891 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623893 j!112))))

(assert (=> b!1415084 (arrayContainsKey!0 a!2901 lt!623893 #b00000000000000000000000000000000)))

(declare-fun lt!623892 () Unit!47882)

(assert (=> b!1415084 (= lt!623892 lt!623891)))

(declare-fun res!951139 () Bool)

(assert (=> b!1415084 (= res!951139 (= (seekEntryOrOpen!0 (select (arr!46643 a!2901) j!112) a!2901 mask!2840) (Found!10954 j!112)))))

(assert (=> b!1415084 (=> (not res!951139) (not e!800883))))

(declare-fun b!1415085 () Bool)

(assert (=> b!1415085 (= e!800883 call!67180)))

(assert (= (and d!152493 (not res!951138)) b!1415082))

(assert (= (and b!1415082 c!131451) b!1415084))

(assert (= (and b!1415082 (not c!131451)) b!1415083))

(assert (= (and b!1415084 res!951139) b!1415085))

(assert (= (or b!1415085 b!1415083) bm!67177))

(assert (=> b!1415082 m!1304937))

(assert (=> b!1415082 m!1304937))

(assert (=> b!1415082 m!1304961))

(declare-fun m!1305241 () Bool)

(assert (=> bm!67177 m!1305241))

(assert (=> b!1415084 m!1304937))

(declare-fun m!1305243 () Bool)

(assert (=> b!1415084 m!1305243))

(declare-fun m!1305245 () Bool)

(assert (=> b!1415084 m!1305245))

(assert (=> b!1415084 m!1304937))

(assert (=> b!1415084 m!1304971))

(assert (=> b!1414716 d!152493))

(declare-fun d!152495 () Bool)

(assert (=> d!152495 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623900 () Unit!47882)

(declare-fun choose!38 (array!96621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47882)

(assert (=> d!152495 (= lt!623900 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152495 (validMask!0 mask!2840)))

(assert (=> d!152495 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623900)))

(declare-fun bs!41247 () Bool)

(assert (= bs!41247 d!152495))

(assert (=> bs!41247 m!1304945))

(declare-fun m!1305267 () Bool)

(assert (=> bs!41247 m!1305267))

(assert (=> bs!41247 m!1304957))

(assert (=> b!1414716 d!152495))

(declare-fun b!1415095 () Bool)

(declare-fun e!800890 () SeekEntryResult!10954)

(declare-fun e!800893 () SeekEntryResult!10954)

(assert (=> b!1415095 (= e!800890 e!800893)))

(declare-fun c!131457 () Bool)

(declare-fun lt!623902 () (_ BitVec 64))

(assert (=> b!1415095 (= c!131457 (or (= lt!623902 (select (arr!46643 a!2901) j!112)) (= (bvadd lt!623902 lt!623902) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1415096 () Bool)

(declare-fun lt!623901 () SeekEntryResult!10954)

(assert (=> b!1415096 (and (bvsge (index!46207 lt!623901) #b00000000000000000000000000000000) (bvslt (index!46207 lt!623901) (size!47193 a!2901)))))

(declare-fun res!951144 () Bool)

(assert (=> b!1415096 (= res!951144 (= (select (arr!46643 a!2901) (index!46207 lt!623901)) (select (arr!46643 a!2901) j!112)))))

(declare-fun e!800894 () Bool)

(assert (=> b!1415096 (=> res!951144 e!800894)))

(declare-fun e!800891 () Bool)

(assert (=> b!1415096 (= e!800891 e!800894)))

(declare-fun b!1415097 () Bool)

(declare-fun e!800892 () Bool)

(assert (=> b!1415097 (= e!800892 e!800891)))

(declare-fun res!951143 () Bool)

(assert (=> b!1415097 (= res!951143 (and (is-Intermediate!10954 lt!623901) (not (undefined!11766 lt!623901)) (bvslt (x!127813 lt!623901) #b01111111111111111111111111111110) (bvsge (x!127813 lt!623901) #b00000000000000000000000000000000) (bvsge (x!127813 lt!623901) #b00000000000000000000000000000000)))))

(assert (=> b!1415097 (=> (not res!951143) (not e!800891))))

(declare-fun b!1415098 () Bool)

(assert (=> b!1415098 (= e!800892 (bvsge (x!127813 lt!623901) #b01111111111111111111111111111110))))

(declare-fun b!1415099 () Bool)

(assert (=> b!1415099 (and (bvsge (index!46207 lt!623901) #b00000000000000000000000000000000) (bvslt (index!46207 lt!623901) (size!47193 a!2901)))))

(assert (=> b!1415099 (= e!800894 (= (select (arr!46643 a!2901) (index!46207 lt!623901)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1415100 () Bool)

(assert (=> b!1415100 (= e!800890 (Intermediate!10954 true lt!623703 #b00000000000000000000000000000000))))

(declare-fun d!152503 () Bool)

(assert (=> d!152503 e!800892))

(declare-fun c!131456 () Bool)

(assert (=> d!152503 (= c!131456 (and (is-Intermediate!10954 lt!623901) (undefined!11766 lt!623901)))))

(assert (=> d!152503 (= lt!623901 e!800890)))

(declare-fun c!131455 () Bool)

(assert (=> d!152503 (= c!131455 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152503 (= lt!623902 (select (arr!46643 a!2901) lt!623703))))

(assert (=> d!152503 (validMask!0 mask!2840)))

(assert (=> d!152503 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623703 (select (arr!46643 a!2901) j!112) a!2901 mask!2840) lt!623901)))

(declare-fun b!1415101 () Bool)

(assert (=> b!1415101 (and (bvsge (index!46207 lt!623901) #b00000000000000000000000000000000) (bvslt (index!46207 lt!623901) (size!47193 a!2901)))))

(declare-fun res!951145 () Bool)

(assert (=> b!1415101 (= res!951145 (= (select (arr!46643 a!2901) (index!46207 lt!623901)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1415101 (=> res!951145 e!800894)))

(declare-fun b!1415102 () Bool)

(assert (=> b!1415102 (= e!800893 (Intermediate!10954 false lt!623703 #b00000000000000000000000000000000))))

(declare-fun b!1415103 () Bool)

(assert (=> b!1415103 (= e!800893 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623703 #b00000000000000000000000000000000 mask!2840) (select (arr!46643 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152503 c!131455) b!1415100))

(assert (= (and d!152503 (not c!131455)) b!1415095))

(assert (= (and b!1415095 c!131457) b!1415102))

(assert (= (and b!1415095 (not c!131457)) b!1415103))

(assert (= (and d!152503 c!131456) b!1415098))

(assert (= (and d!152503 (not c!131456)) b!1415097))

(assert (= (and b!1415097 res!951143) b!1415096))

(assert (= (and b!1415096 (not res!951144)) b!1415101))

(assert (= (and b!1415101 (not res!951145)) b!1415099))

(declare-fun m!1305269 () Bool)

(assert (=> b!1415103 m!1305269))

(assert (=> b!1415103 m!1305269))

(assert (=> b!1415103 m!1304937))

(declare-fun m!1305271 () Bool)

(assert (=> b!1415103 m!1305271))

(declare-fun m!1305273 () Bool)

(assert (=> d!152503 m!1305273))

(assert (=> d!152503 m!1304957))

(declare-fun m!1305275 () Bool)

(assert (=> b!1415096 m!1305275))

(assert (=> b!1415101 m!1305275))

(assert (=> b!1415099 m!1305275))

(assert (=> b!1414716 d!152503))

(declare-fun d!152505 () Bool)

(declare-fun lt!623904 () (_ BitVec 32))

(declare-fun lt!623903 () (_ BitVec 32))

(assert (=> d!152505 (= lt!623904 (bvmul (bvxor lt!623903 (bvlshr lt!623903 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152505 (= lt!623903 ((_ extract 31 0) (bvand (bvxor (select (arr!46643 a!2901) j!112) (bvlshr (select (arr!46643 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152505 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951093 (let ((h!34446 ((_ extract 31 0) (bvand (bvxor (select (arr!46643 a!2901) j!112) (bvlshr (select (arr!46643 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127823 (bvmul (bvxor h!34446 (bvlshr h!34446 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127823 (bvlshr x!127823 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951093 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951093 #b00000000000000000000000000000000))))))

(assert (=> d!152505 (= (toIndex!0 (select (arr!46643 a!2901) j!112) mask!2840) (bvand (bvxor lt!623904 (bvlshr lt!623904 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414716 d!152505))

(push 1)

(assert (not b!1414888))

(assert (not d!152431))

(assert (not b!1415019))

(assert (not d!152421))

(assert (not d!152495))

(assert (not d!152483))

(assert (not d!152479))

(assert (not b!1414842))

(assert (not b!1415018))

(assert (not d!152503))

(assert (not b!1415084))

(assert (not bm!67176))

(assert (not b!1415072))

(assert (not bm!67173))

(assert (not bm!67177))

(assert (not b!1414968))

(assert (not b!1415017))

(assert (not b!1415033))

(assert (not d!152439))

(assert (not b!1415082))

(assert (not b!1415103))

(assert (not b!1415074))

(check-sat)

(pop 1)

(push 1)

(check-sat)

