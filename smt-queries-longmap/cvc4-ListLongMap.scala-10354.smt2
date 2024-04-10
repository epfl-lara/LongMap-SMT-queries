; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121876 () Bool)

(assert start!121876)

(declare-fun res!951047 () Bool)

(declare-fun e!800698 () Bool)

(assert (=> start!121876 (=> (not res!951047) (not e!800698))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121876 (= res!951047 (validMask!0 mask!2840))))

(assert (=> start!121876 e!800698))

(assert (=> start!121876 true))

(declare-datatypes ((array!96625 0))(
  ( (array!96626 (arr!46645 (Array (_ BitVec 32) (_ BitVec 64))) (size!47195 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96625)

(declare-fun array_inv!35673 (array!96625) Bool)

(assert (=> start!121876 (array_inv!35673 a!2901)))

(declare-fun b!1414767 () Bool)

(declare-fun res!951049 () Bool)

(assert (=> b!1414767 (=> (not res!951049) (not e!800698))))

(declare-datatypes ((List!33164 0))(
  ( (Nil!33161) (Cons!33160 (h!34444 (_ BitVec 64)) (t!47858 List!33164)) )
))
(declare-fun arrayNoDuplicates!0 (array!96625 (_ BitVec 32) List!33164) Bool)

(assert (=> b!1414767 (= res!951049 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33161))))

(declare-fun b!1414768 () Bool)

(declare-fun e!800696 () Bool)

(declare-fun e!800699 () Bool)

(assert (=> b!1414768 (= e!800696 e!800699)))

(declare-fun res!951046 () Bool)

(assert (=> b!1414768 (=> res!951046 e!800699)))

(declare-datatypes ((SeekEntryResult!10956 0))(
  ( (MissingZero!10956 (index!46213 (_ BitVec 32))) (Found!10956 (index!46214 (_ BitVec 32))) (Intermediate!10956 (undefined!11768 Bool) (index!46215 (_ BitVec 32)) (x!127815 (_ BitVec 32))) (Undefined!10956) (MissingVacant!10956 (index!46216 (_ BitVec 32))) )
))
(declare-fun lt!623751 () SeekEntryResult!10956)

(declare-fun lt!623745 () SeekEntryResult!10956)

(assert (=> b!1414768 (= res!951046 (or (= lt!623751 lt!623745) (not (is-Intermediate!10956 lt!623745))))))

(declare-fun lt!623750 () (_ BitVec 64))

(declare-fun lt!623746 () array!96625)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96625 (_ BitVec 32)) SeekEntryResult!10956)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414768 (= lt!623745 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623750 mask!2840) lt!623750 lt!623746 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1414768 (= lt!623750 (select (store (arr!46645 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1414768 (= lt!623746 (array!96626 (store (arr!46645 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47195 a!2901)))))

(declare-fun b!1414769 () Bool)

(declare-fun res!951055 () Bool)

(assert (=> b!1414769 (=> (not res!951055) (not e!800698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1414769 (= res!951055 (validKeyInArray!0 (select (arr!46645 a!2901) j!112)))))

(declare-fun b!1414770 () Bool)

(declare-fun res!951054 () Bool)

(assert (=> b!1414770 (=> (not res!951054) (not e!800698))))

(assert (=> b!1414770 (= res!951054 (and (= (size!47195 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47195 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47195 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1414771 () Bool)

(declare-fun res!951051 () Bool)

(assert (=> b!1414771 (=> (not res!951051) (not e!800698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96625 (_ BitVec 32)) Bool)

(assert (=> b!1414771 (= res!951051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1414772 () Bool)

(declare-fun e!800694 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96625 (_ BitVec 32)) SeekEntryResult!10956)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96625 (_ BitVec 32)) SeekEntryResult!10956)

(assert (=> b!1414772 (= e!800694 (= (seekEntryOrOpen!0 lt!623750 lt!623746 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127815 lt!623745) (index!46215 lt!623745) (index!46215 lt!623745) (select (arr!46645 a!2901) j!112) lt!623746 mask!2840)))))

(declare-fun lt!623748 () (_ BitVec 32))

(declare-fun b!1414773 () Bool)

(assert (=> b!1414773 (= e!800699 (or (bvslt (x!127815 lt!623751) #b00000000000000000000000000000000) (bvsgt (x!127815 lt!623751) #b01111111111111111111111111111110) (bvslt (x!127815 lt!623745) #b00000000000000000000000000000000) (bvsgt (x!127815 lt!623745) #b01111111111111111111111111111110) (bvslt lt!623748 #b00000000000000000000000000000000) (bvsge lt!623748 (size!47195 a!2901)) (and (bvsge (index!46215 lt!623751) #b00000000000000000000000000000000) (bvslt (index!46215 lt!623751) (size!47195 a!2901)))))))

(assert (=> b!1414773 e!800694))

(declare-fun res!951053 () Bool)

(assert (=> b!1414773 (=> (not res!951053) (not e!800694))))

(assert (=> b!1414773 (= res!951053 (and (not (undefined!11768 lt!623745)) (= (index!46215 lt!623745) i!1037) (bvslt (x!127815 lt!623745) (x!127815 lt!623751)) (= (select (store (arr!46645 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46215 lt!623745)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47886 0))(
  ( (Unit!47887) )
))
(declare-fun lt!623747 () Unit!47886)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47886)

(assert (=> b!1414773 (= lt!623747 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!623748 (x!127815 lt!623751) (index!46215 lt!623751) (x!127815 lt!623745) (index!46215 lt!623745) (undefined!11768 lt!623745) mask!2840))))

(declare-fun e!800695 () Bool)

(declare-fun b!1414774 () Bool)

(assert (=> b!1414774 (= e!800695 (= (seekEntryOrOpen!0 (select (arr!46645 a!2901) j!112) a!2901 mask!2840) (Found!10956 j!112)))))

(declare-fun b!1414775 () Bool)

(assert (=> b!1414775 (= e!800698 (not e!800696))))

(declare-fun res!951050 () Bool)

(assert (=> b!1414775 (=> res!951050 e!800696)))

(assert (=> b!1414775 (= res!951050 (or (not (is-Intermediate!10956 lt!623751)) (undefined!11768 lt!623751)))))

(assert (=> b!1414775 e!800695))

(declare-fun res!951052 () Bool)

(assert (=> b!1414775 (=> (not res!951052) (not e!800695))))

(assert (=> b!1414775 (= res!951052 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!623749 () Unit!47886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47886)

(assert (=> b!1414775 (= lt!623749 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1414775 (= lt!623751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623748 (select (arr!46645 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1414775 (= lt!623748 (toIndex!0 (select (arr!46645 a!2901) j!112) mask!2840))))

(declare-fun b!1414776 () Bool)

(declare-fun res!951048 () Bool)

(assert (=> b!1414776 (=> (not res!951048) (not e!800698))))

(assert (=> b!1414776 (= res!951048 (validKeyInArray!0 (select (arr!46645 a!2901) i!1037)))))

(assert (= (and start!121876 res!951047) b!1414770))

(assert (= (and b!1414770 res!951054) b!1414776))

(assert (= (and b!1414776 res!951048) b!1414769))

(assert (= (and b!1414769 res!951055) b!1414771))

(assert (= (and b!1414771 res!951051) b!1414767))

(assert (= (and b!1414767 res!951049) b!1414775))

(assert (= (and b!1414775 res!951052) b!1414774))

(assert (= (and b!1414775 (not res!951050)) b!1414768))

(assert (= (and b!1414768 (not res!951046)) b!1414773))

(assert (= (and b!1414773 res!951053) b!1414772))

(declare-fun m!1305015 () Bool)

(assert (=> b!1414768 m!1305015))

(assert (=> b!1414768 m!1305015))

(declare-fun m!1305017 () Bool)

(assert (=> b!1414768 m!1305017))

(declare-fun m!1305019 () Bool)

(assert (=> b!1414768 m!1305019))

(declare-fun m!1305021 () Bool)

(assert (=> b!1414768 m!1305021))

(declare-fun m!1305023 () Bool)

(assert (=> b!1414769 m!1305023))

(assert (=> b!1414769 m!1305023))

(declare-fun m!1305025 () Bool)

(assert (=> b!1414769 m!1305025))

(assert (=> b!1414773 m!1305019))

(declare-fun m!1305027 () Bool)

(assert (=> b!1414773 m!1305027))

(declare-fun m!1305029 () Bool)

(assert (=> b!1414773 m!1305029))

(assert (=> b!1414774 m!1305023))

(assert (=> b!1414774 m!1305023))

(declare-fun m!1305031 () Bool)

(assert (=> b!1414774 m!1305031))

(declare-fun m!1305033 () Bool)

(assert (=> b!1414771 m!1305033))

(declare-fun m!1305035 () Bool)

(assert (=> b!1414776 m!1305035))

(assert (=> b!1414776 m!1305035))

(declare-fun m!1305037 () Bool)

(assert (=> b!1414776 m!1305037))

(declare-fun m!1305039 () Bool)

(assert (=> start!121876 m!1305039))

(declare-fun m!1305041 () Bool)

(assert (=> start!121876 m!1305041))

(declare-fun m!1305043 () Bool)

(assert (=> b!1414767 m!1305043))

(assert (=> b!1414775 m!1305023))

(declare-fun m!1305045 () Bool)

(assert (=> b!1414775 m!1305045))

(assert (=> b!1414775 m!1305023))

(assert (=> b!1414775 m!1305023))

(declare-fun m!1305047 () Bool)

(assert (=> b!1414775 m!1305047))

(declare-fun m!1305049 () Bool)

(assert (=> b!1414775 m!1305049))

(declare-fun m!1305051 () Bool)

(assert (=> b!1414775 m!1305051))

(declare-fun m!1305053 () Bool)

(assert (=> b!1414772 m!1305053))

(assert (=> b!1414772 m!1305023))

(assert (=> b!1414772 m!1305023))

(declare-fun m!1305055 () Bool)

(assert (=> b!1414772 m!1305055))

(push 1)

(assert (not start!121876))

(assert (not b!1414771))

(assert (not b!1414768))

(assert (not b!1414775))

(assert (not b!1414774))

(assert (not b!1414772))

(assert (not b!1414769))

(assert (not b!1414767))

(assert (not b!1414773))

(assert (not b!1414776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1414835 () Bool)

(declare-fun e!800733 () Bool)

(declare-fun e!800735 () Bool)

(assert (=> b!1414835 (= e!800733 e!800735)))

(declare-fun res!951064 () Bool)

(assert (=> b!1414835 (=> (not res!951064) (not e!800735))))

(declare-fun e!800734 () Bool)

(assert (=> b!1414835 (= res!951064 (not e!800734))))

(declare-fun res!951062 () Bool)

(assert (=> b!1414835 (=> (not res!951062) (not e!800734))))

(assert (=> b!1414835 (= res!951062 (validKeyInArray!0 (select (arr!46645 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67159 () Bool)

(declare-fun call!67162 () Bool)

(declare-fun c!131364 () Bool)

(assert (=> bm!67159 (= call!67162 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131364 (Cons!33160 (select (arr!46645 a!2901) #b00000000000000000000000000000000) Nil!33161) Nil!33161)))))

(declare-fun b!1414836 () Bool)

(declare-fun contains!9823 (List!33164 (_ BitVec 64)) Bool)

(assert (=> b!1414836 (= e!800734 (contains!9823 Nil!33161 (select (arr!46645 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!152423 () Bool)

(declare-fun res!951063 () Bool)

(assert (=> d!152423 (=> res!951063 e!800733)))

(assert (=> d!152423 (= res!951063 (bvsge #b00000000000000000000000000000000 (size!47195 a!2901)))))

(assert (=> d!152423 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33161) e!800733)))

(declare-fun b!1414837 () Bool)

(declare-fun e!800732 () Bool)

(assert (=> b!1414837 (= e!800732 call!67162)))

(declare-fun b!1414838 () Bool)

(assert (=> b!1414838 (= e!800732 call!67162)))

(declare-fun b!1414839 () Bool)

(assert (=> b!1414839 (= e!800735 e!800732)))

(assert (=> b!1414839 (= c!131364 (validKeyInArray!0 (select (arr!46645 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152423 (not res!951063)) b!1414835))

(assert (= (and b!1414835 res!951062) b!1414836))

(assert (= (and b!1414835 res!951064) b!1414839))

(assert (= (and b!1414839 c!131364) b!1414837))

(assert (= (and b!1414839 (not c!131364)) b!1414838))

(assert (= (or b!1414837 b!1414838) bm!67159))

(declare-fun m!1305077 () Bool)

(assert (=> b!1414835 m!1305077))

(assert (=> b!1414835 m!1305077))

(declare-fun m!1305079 () Bool)

(assert (=> b!1414835 m!1305079))

(assert (=> bm!67159 m!1305077))

(declare-fun m!1305081 () Bool)

(assert (=> bm!67159 m!1305081))

(assert (=> b!1414836 m!1305077))

(assert (=> b!1414836 m!1305077))

(declare-fun m!1305083 () Bool)

(assert (=> b!1414836 m!1305083))

(assert (=> b!1414839 m!1305077))

(assert (=> b!1414839 m!1305077))

(assert (=> b!1414839 m!1305079))

(assert (=> b!1414767 d!152423))

(declare-fun b!1414891 () Bool)

(declare-fun c!131387 () Bool)

(declare-fun lt!623791 () (_ BitVec 64))

(assert (=> b!1414891 (= c!131387 (= lt!623791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800767 () SeekEntryResult!10956)

(declare-fun e!800766 () SeekEntryResult!10956)

(assert (=> b!1414891 (= e!800767 e!800766)))

(declare-fun d!152427 () Bool)

(declare-fun lt!623793 () SeekEntryResult!10956)

(assert (=> d!152427 (and (or (is-Undefined!10956 lt!623793) (not (is-Found!10956 lt!623793)) (and (bvsge (index!46214 lt!623793) #b00000000000000000000000000000000) (bvslt (index!46214 lt!623793) (size!47195 lt!623746)))) (or (is-Undefined!10956 lt!623793) (is-Found!10956 lt!623793) (not (is-MissingZero!10956 lt!623793)) (and (bvsge (index!46213 lt!623793) #b00000000000000000000000000000000) (bvslt (index!46213 lt!623793) (size!47195 lt!623746)))) (or (is-Undefined!10956 lt!623793) (is-Found!10956 lt!623793) (is-MissingZero!10956 lt!623793) (not (is-MissingVacant!10956 lt!623793)) (and (bvsge (index!46216 lt!623793) #b00000000000000000000000000000000) (bvslt (index!46216 lt!623793) (size!47195 lt!623746)))) (or (is-Undefined!10956 lt!623793) (ite (is-Found!10956 lt!623793) (= (select (arr!46645 lt!623746) (index!46214 lt!623793)) lt!623750) (ite (is-MissingZero!10956 lt!623793) (= (select (arr!46645 lt!623746) (index!46213 lt!623793)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10956 lt!623793) (= (select (arr!46645 lt!623746) (index!46216 lt!623793)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!800768 () SeekEntryResult!10956)

(assert (=> d!152427 (= lt!623793 e!800768)))

(declare-fun c!131388 () Bool)

(declare-fun lt!623792 () SeekEntryResult!10956)

(assert (=> d!152427 (= c!131388 (and (is-Intermediate!10956 lt!623792) (undefined!11768 lt!623792)))))

(assert (=> d!152427 (= lt!623792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623750 mask!2840) lt!623750 lt!623746 mask!2840))))

(assert (=> d!152427 (validMask!0 mask!2840)))

(assert (=> d!152427 (= (seekEntryOrOpen!0 lt!623750 lt!623746 mask!2840) lt!623793)))

(declare-fun b!1414892 () Bool)

(assert (=> b!1414892 (= e!800766 (MissingZero!10956 (index!46215 lt!623792)))))

(declare-fun b!1414893 () Bool)

(assert (=> b!1414893 (= e!800767 (Found!10956 (index!46215 lt!623792)))))

(declare-fun b!1414894 () Bool)

(assert (=> b!1414894 (= e!800768 Undefined!10956)))

(declare-fun b!1414895 () Bool)

(assert (=> b!1414895 (= e!800768 e!800767)))

(assert (=> b!1414895 (= lt!623791 (select (arr!46645 lt!623746) (index!46215 lt!623792)))))

(declare-fun c!131386 () Bool)

(assert (=> b!1414895 (= c!131386 (= lt!623791 lt!623750))))

(declare-fun b!1414896 () Bool)

(assert (=> b!1414896 (= e!800766 (seekKeyOrZeroReturnVacant!0 (x!127815 lt!623792) (index!46215 lt!623792) (index!46215 lt!623792) lt!623750 lt!623746 mask!2840))))

(assert (= (and d!152427 c!131388) b!1414894))

(assert (= (and d!152427 (not c!131388)) b!1414895))

(assert (= (and b!1414895 c!131386) b!1414893))

(assert (= (and b!1414895 (not c!131386)) b!1414891))

(assert (= (and b!1414891 c!131387) b!1414892))

(assert (= (and b!1414891 (not c!131387)) b!1414896))

(declare-fun m!1305115 () Bool)

(assert (=> d!152427 m!1305115))

(declare-fun m!1305117 () Bool)

(assert (=> d!152427 m!1305117))

(declare-fun m!1305119 () Bool)

(assert (=> d!152427 m!1305119))

(assert (=> d!152427 m!1305039))

(assert (=> d!152427 m!1305015))

(assert (=> d!152427 m!1305017))

(assert (=> d!152427 m!1305015))

(declare-fun m!1305121 () Bool)

(assert (=> b!1414895 m!1305121))

(declare-fun m!1305123 () Bool)

(assert (=> b!1414896 m!1305123))

(assert (=> b!1414772 d!152427))

(declare-fun b!1414954 () Bool)

(declare-fun c!131411 () Bool)

(declare-fun lt!623808 () (_ BitVec 64))

(assert (=> b!1414954 (= c!131411 (= lt!623808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800800 () SeekEntryResult!10956)

(declare-fun e!800801 () SeekEntryResult!10956)

(assert (=> b!1414954 (= e!800800 e!800801)))

(declare-fun b!1414955 () Bool)

(assert (=> b!1414955 (= e!800800 (Found!10956 (index!46215 lt!623745)))))

(declare-fun b!1414956 () Bool)

(declare-fun e!800802 () SeekEntryResult!10956)

(assert (=> b!1414956 (= e!800802 Undefined!10956)))

(declare-fun d!152441 () Bool)

(declare-fun lt!623809 () SeekEntryResult!10956)

(assert (=> d!152441 (and (or (is-Undefined!10956 lt!623809) (not (is-Found!10956 lt!623809)) (and (bvsge (index!46214 lt!623809) #b00000000000000000000000000000000) (bvslt (index!46214 lt!623809) (size!47195 lt!623746)))) (or (is-Undefined!10956 lt!623809) (is-Found!10956 lt!623809) (not (is-MissingVacant!10956 lt!623809)) (not (= (index!46216 lt!623809) (index!46215 lt!623745))) (and (bvsge (index!46216 lt!623809) #b00000000000000000000000000000000) (bvslt (index!46216 lt!623809) (size!47195 lt!623746)))) (or (is-Undefined!10956 lt!623809) (ite (is-Found!10956 lt!623809) (= (select (arr!46645 lt!623746) (index!46214 lt!623809)) (select (arr!46645 a!2901) j!112)) (and (is-MissingVacant!10956 lt!623809) (= (index!46216 lt!623809) (index!46215 lt!623745)) (= (select (arr!46645 lt!623746) (index!46216 lt!623809)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!152441 (= lt!623809 e!800802)))

(declare-fun c!131410 () Bool)

(assert (=> d!152441 (= c!131410 (bvsge (x!127815 lt!623745) #b01111111111111111111111111111110))))

(assert (=> d!152441 (= lt!623808 (select (arr!46645 lt!623746) (index!46215 lt!623745)))))

(assert (=> d!152441 (validMask!0 mask!2840)))

(assert (=> d!152441 (= (seekKeyOrZeroReturnVacant!0 (x!127815 lt!623745) (index!46215 lt!623745) (index!46215 lt!623745) (select (arr!46645 a!2901) j!112) lt!623746 mask!2840) lt!623809)))

(declare-fun b!1414957 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1414957 (= e!800801 (seekKeyOrZeroReturnVacant!0 (bvadd (x!127815 lt!623745) #b00000000000000000000000000000001) (nextIndex!0 (index!46215 lt!623745) (x!127815 lt!623745) mask!2840) (index!46215 lt!623745) (select (arr!46645 a!2901) j!112) lt!623746 mask!2840))))

(declare-fun b!1414958 () Bool)

(assert (=> b!1414958 (= e!800802 e!800800)))

(declare-fun c!131412 () Bool)

(assert (=> b!1414958 (= c!131412 (= lt!623808 (select (arr!46645 a!2901) j!112)))))

(declare-fun b!1414959 () Bool)

(assert (=> b!1414959 (= e!800801 (MissingVacant!10956 (index!46215 lt!623745)))))

(assert (= (and d!152441 c!131410) b!1414956))

(assert (= (and d!152441 (not c!131410)) b!1414958))

(assert (= (and b!1414958 c!131412) b!1414955))

(assert (= (and b!1414958 (not c!131412)) b!1414954))

(assert (= (and b!1414954 c!131411) b!1414959))

(assert (= (and b!1414954 (not c!131411)) b!1414957))

(declare-fun m!1305133 () Bool)

(assert (=> d!152441 m!1305133))

(declare-fun m!1305135 () Bool)

(assert (=> d!152441 m!1305135))

(declare-fun m!1305137 () Bool)

(assert (=> d!152441 m!1305137))

(assert (=> d!152441 m!1305039))

(declare-fun m!1305139 () Bool)

(assert (=> b!1414957 m!1305139))

(assert (=> b!1414957 m!1305139))

(assert (=> b!1414957 m!1305023))

(declare-fun m!1305141 () Bool)

(assert (=> b!1414957 m!1305141))

(assert (=> b!1414772 d!152441))

(declare-fun b!1414983 () Bool)

(declare-fun e!800817 () Bool)

(declare-fun e!800818 () Bool)

(assert (=> b!1414983 (= e!800817 e!800818)))

(declare-fun c!131421 () Bool)

(assert (=> b!1414983 (= c!131421 (validKeyInArray!0 (select (arr!46645 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1414984 () Bool)

(declare-fun e!800819 () Bool)

(assert (=> b!1414984 (= e!800818 e!800819)))

(declare-fun lt!623835 () (_ BitVec 64))

(assert (=> b!1414984 (= lt!623835 (select (arr!46645 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!623833 () Unit!47886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96625 (_ BitVec 64) (_ BitVec 32)) Unit!47886)

(assert (=> b!1414984 (= lt!623833 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623835 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96625 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1414984 (arrayContainsKey!0 a!2901 lt!623835 #b00000000000000000000000000000000)))

(declare-fun lt!623834 () Unit!47886)

(assert (=> b!1414984 (= lt!623834 lt!623833)))

(declare-fun res!951099 () Bool)

(assert (=> b!1414984 (= res!951099 (= (seekEntryOrOpen!0 (select (arr!46645 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10956 #b00000000000000000000000000000000)))))

(assert (=> b!1414984 (=> (not res!951099) (not e!800819))))

(declare-fun b!1414985 () Bool)

(declare-fun call!67168 () Bool)

(assert (=> b!1414985 (= e!800819 call!67168)))

(declare-fun d!152445 () Bool)

(declare-fun res!951098 () Bool)

(assert (=> d!152445 (=> res!951098 e!800817)))

(assert (=> d!152445 (= res!951098 (bvsge #b00000000000000000000000000000000 (size!47195 a!2901)))))

(assert (=> d!152445 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!800817)))

(declare-fun bm!67165 () Bool)

(assert (=> bm!67165 (= call!67168 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414986 () Bool)

(assert (=> b!1414986 (= e!800818 call!67168)))

(assert (= (and d!152445 (not res!951098)) b!1414983))

(assert (= (and b!1414983 c!131421) b!1414984))

(assert (= (and b!1414983 (not c!131421)) b!1414986))

(assert (= (and b!1414984 res!951099) b!1414985))

(assert (= (or b!1414985 b!1414986) bm!67165))

(assert (=> b!1414983 m!1305077))

(assert (=> b!1414983 m!1305077))

(assert (=> b!1414983 m!1305079))

(assert (=> b!1414984 m!1305077))

(declare-fun m!1305163 () Bool)

(assert (=> b!1414984 m!1305163))

(declare-fun m!1305165 () Bool)

(assert (=> b!1414984 m!1305165))

(assert (=> b!1414984 m!1305077))

(declare-fun m!1305167 () Bool)

(assert (=> b!1414984 m!1305167))

(declare-fun m!1305169 () Bool)

(assert (=> bm!67165 m!1305169))

(assert (=> b!1414771 d!152445))

(declare-fun d!152459 () Bool)

(assert (=> d!152459 (= (validKeyInArray!0 (select (arr!46645 a!2901) i!1037)) (and (not (= (select (arr!46645 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46645 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414776 d!152459))

(declare-fun b!1414995 () Bool)

(declare-fun e!800826 () Bool)

(declare-fun e!800827 () Bool)

(assert (=> b!1414995 (= e!800826 e!800827)))

(declare-fun c!131424 () Bool)

(assert (=> b!1414995 (= c!131424 (validKeyInArray!0 (select (arr!46645 a!2901) j!112)))))

(declare-fun b!1414996 () Bool)

(declare-fun e!800828 () Bool)

(assert (=> b!1414996 (= e!800827 e!800828)))

(declare-fun lt!623844 () (_ BitVec 64))

(assert (=> b!1414996 (= lt!623844 (select (arr!46645 a!2901) j!112))))

(declare-fun lt!623842 () Unit!47886)

(assert (=> b!1414996 (= lt!623842 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!623844 j!112))))

(assert (=> b!1414996 (arrayContainsKey!0 a!2901 lt!623844 #b00000000000000000000000000000000)))

(declare-fun lt!623843 () Unit!47886)

(assert (=> b!1414996 (= lt!623843 lt!623842)))

(declare-fun res!951105 () Bool)

(assert (=> b!1414996 (= res!951105 (= (seekEntryOrOpen!0 (select (arr!46645 a!2901) j!112) a!2901 mask!2840) (Found!10956 j!112)))))

(assert (=> b!1414996 (=> (not res!951105) (not e!800828))))

(declare-fun b!1414997 () Bool)

(declare-fun call!67171 () Bool)

(assert (=> b!1414997 (= e!800828 call!67171)))

(declare-fun d!152461 () Bool)

(declare-fun res!951104 () Bool)

(assert (=> d!152461 (=> res!951104 e!800826)))

(assert (=> d!152461 (= res!951104 (bvsge j!112 (size!47195 a!2901)))))

(assert (=> d!152461 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!800826)))

(declare-fun bm!67168 () Bool)

(assert (=> bm!67168 (= call!67171 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1414998 () Bool)

(assert (=> b!1414998 (= e!800827 call!67171)))

(assert (= (and d!152461 (not res!951104)) b!1414995))

(assert (= (and b!1414995 c!131424) b!1414996))

(assert (= (and b!1414995 (not c!131424)) b!1414998))

(assert (= (and b!1414996 res!951105) b!1414997))

(assert (= (or b!1414997 b!1414998) bm!67168))

(assert (=> b!1414995 m!1305023))

(assert (=> b!1414995 m!1305023))

(assert (=> b!1414995 m!1305025))

(assert (=> b!1414996 m!1305023))

(declare-fun m!1305171 () Bool)

(assert (=> b!1414996 m!1305171))

(declare-fun m!1305173 () Bool)

(assert (=> b!1414996 m!1305173))

(assert (=> b!1414996 m!1305023))

(assert (=> b!1414996 m!1305031))

(declare-fun m!1305175 () Bool)

(assert (=> bm!67168 m!1305175))

(assert (=> b!1414775 d!152461))

(declare-fun d!152463 () Bool)

(assert (=> d!152463 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!623853 () Unit!47886)

(declare-fun choose!38 (array!96625 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47886)

(assert (=> d!152463 (= lt!623853 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152463 (validMask!0 mask!2840)))

(assert (=> d!152463 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!623853)))

(declare-fun bs!41244 () Bool)

(assert (= bs!41244 d!152463))

(assert (=> bs!41244 m!1305051))

(declare-fun m!1305191 () Bool)

(assert (=> bs!41244 m!1305191))

(assert (=> bs!41244 m!1305039))

(assert (=> b!1414775 d!152463))

(declare-fun b!1415055 () Bool)

(declare-fun e!800866 () SeekEntryResult!10956)

(assert (=> b!1415055 (= e!800866 (Intermediate!10956 true lt!623748 #b00000000000000000000000000000000))))

(declare-fun b!1415056 () Bool)

(declare-fun e!800869 () Bool)

(declare-fun e!800868 () Bool)

(assert (=> b!1415056 (= e!800869 e!800868)))

(declare-fun res!951128 () Bool)

(declare-fun lt!623871 () SeekEntryResult!10956)

(assert (=> b!1415056 (= res!951128 (and (is-Intermediate!10956 lt!623871) (not (undefined!11768 lt!623871)) (bvslt (x!127815 lt!623871) #b01111111111111111111111111111110) (bvsge (x!127815 lt!623871) #b00000000000000000000000000000000) (bvsge (x!127815 lt!623871) #b00000000000000000000000000000000)))))

(assert (=> b!1415056 (=> (not res!951128) (not e!800868))))

(declare-fun b!1415057 () Bool)

(assert (=> b!1415057 (and (bvsge (index!46215 lt!623871) #b00000000000000000000000000000000) (bvslt (index!46215 lt!623871) (size!47195 a!2901)))))

(declare-fun e!800865 () Bool)

(assert (=> b!1415057 (= e!800865 (= (select (arr!46645 a!2901) (index!46215 lt!623871)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800867 () SeekEntryResult!10956)

(declare-fun b!1415059 () Bool)

(assert (=> b!1415059 (= e!800867 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!623748 #b00000000000000000000000000000000 mask!2840) (select (arr!46645 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1415060 () Bool)

(assert (=> b!1415060 (and (bvsge (index!46215 lt!623871) #b00000000000000000000000000000000) (bvslt (index!46215 lt!623871) (size!47195 a!2901)))))

(declare-fun res!951130 () Bool)

(assert (=> b!1415060 (= res!951130 (= (select (arr!46645 a!2901) (index!46215 lt!623871)) (select (arr!46645 a!2901) j!112)))))

(assert (=> b!1415060 (=> res!951130 e!800865)))

(assert (=> b!1415060 (= e!800868 e!800865)))

(declare-fun b!1415061 () Bool)

(assert (=> b!1415061 (= e!800867 (Intermediate!10956 false lt!623748 #b00000000000000000000000000000000))))

(declare-fun b!1415062 () Bool)

(assert (=> b!1415062 (= e!800869 (bvsge (x!127815 lt!623871) #b01111111111111111111111111111110))))

(declare-fun b!1415063 () Bool)

(assert (=> b!1415063 (= e!800866 e!800867)))

(declare-fun c!131443 () Bool)

(declare-fun lt!623872 () (_ BitVec 64))

(assert (=> b!1415063 (= c!131443 (or (= lt!623872 (select (arr!46645 a!2901) j!112)) (= (bvadd lt!623872 lt!623872) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1415058 () Bool)

(assert (=> b!1415058 (and (bvsge (index!46215 lt!623871) #b00000000000000000000000000000000) (bvslt (index!46215 lt!623871) (size!47195 a!2901)))))

(declare-fun res!951129 () Bool)

(assert (=> b!1415058 (= res!951129 (= (select (arr!46645 a!2901) (index!46215 lt!623871)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1415058 (=> res!951129 e!800865)))

(declare-fun d!152469 () Bool)

(assert (=> d!152469 e!800869))

(declare-fun c!131444 () Bool)

(assert (=> d!152469 (= c!131444 (and (is-Intermediate!10956 lt!623871) (undefined!11768 lt!623871)))))

(assert (=> d!152469 (= lt!623871 e!800866)))

(declare-fun c!131442 () Bool)

(assert (=> d!152469 (= c!131442 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152469 (= lt!623872 (select (arr!46645 a!2901) lt!623748))))

(assert (=> d!152469 (validMask!0 mask!2840)))

(assert (=> d!152469 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!623748 (select (arr!46645 a!2901) j!112) a!2901 mask!2840) lt!623871)))

(assert (= (and d!152469 c!131442) b!1415055))

(assert (= (and d!152469 (not c!131442)) b!1415063))

(assert (= (and b!1415063 c!131443) b!1415061))

(assert (= (and b!1415063 (not c!131443)) b!1415059))

(assert (= (and d!152469 c!131444) b!1415062))

(assert (= (and d!152469 (not c!131444)) b!1415056))

(assert (= (and b!1415056 res!951128) b!1415060))

(assert (= (and b!1415060 (not res!951130)) b!1415058))

(assert (= (and b!1415058 (not res!951129)) b!1415057))

(declare-fun m!1305225 () Bool)

(assert (=> b!1415059 m!1305225))

(assert (=> b!1415059 m!1305225))

(assert (=> b!1415059 m!1305023))

(declare-fun m!1305227 () Bool)

(assert (=> b!1415059 m!1305227))

(declare-fun m!1305229 () Bool)

(assert (=> b!1415058 m!1305229))

(assert (=> b!1415060 m!1305229))

(assert (=> b!1415057 m!1305229))

(declare-fun m!1305231 () Bool)

(assert (=> d!152469 m!1305231))

(assert (=> d!152469 m!1305039))

(assert (=> b!1414775 d!152469))

(declare-fun d!152487 () Bool)

(declare-fun lt!623887 () (_ BitVec 32))

(declare-fun lt!623886 () (_ BitVec 32))

(assert (=> d!152487 (= lt!623887 (bvmul (bvxor lt!623886 (bvlshr lt!623886 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152487 (= lt!623886 ((_ extract 31 0) (bvand (bvxor (select (arr!46645 a!2901) j!112) (bvlshr (select (arr!46645 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152487 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!951131 (let ((h!34447 ((_ extract 31 0) (bvand (bvxor (select (arr!46645 a!2901) j!112) (bvlshr (select (arr!46645 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127826 (bvmul (bvxor h!34447 (bvlshr h!34447 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127826 (bvlshr x!127826 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!951131 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!951131 #b00000000000000000000000000000000))))))

(assert (=> d!152487 (= (toIndex!0 (select (arr!46645 a!2901) j!112) mask!2840) (bvand (bvxor lt!623887 (bvlshr lt!623887 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1414775 d!152487))

(declare-fun d!152489 () Bool)

(assert (=> d!152489 (= (validKeyInArray!0 (select (arr!46645 a!2901) j!112)) (and (not (= (select (arr!46645 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46645 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1414769 d!152489))

(declare-fun b!1415076 () Bool)

(declare-fun c!131449 () Bool)

(declare-fun lt!623888 () (_ BitVec 64))

(assert (=> b!1415076 (= c!131449 (= lt!623888 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!800880 () SeekEntryResult!10956)

(declare-fun e!800879 () SeekEntryResult!10956)

(assert (=> b!1415076 (= e!800880 e!800879)))

(declare-fun d!152491 () Bool)

(declare-fun lt!623890 () SeekEntryResult!10956)

(assert (=> d!152491 (and (or (is-Undefined!10956 lt!623890) (not (is-Found!10956 lt!623890)) (and (bvsge (index!46214 lt!623890) #b00000000000000000000000000000000) (bvslt (index!46214 lt!623890) (size!47195 a!2901)))) (or (is-Undefined!10956 lt!623890) (is-Found!10956 lt!623890) (not (is-MissingZero!10956 lt!623890)) (and (bvsge (index!46213 lt!623890) #b00000000000000000000000000000000) (bvslt (index!46213 lt!623890) (size!47195 a!2901)))) (or (is-Undefined!10956 lt!623890) (is-Found!10956 lt!623890) (is-MissingZero!10956 lt!623890) (not (is-MissingVacant!10956 lt!623890)) (and (bvsge (index!46216 lt!623890) #b00000000000000000000000000000000) (bvslt (index!46216 lt!623890) (size!47195 a!2901)))) (or (is-Undefined!10956 lt!623890) (ite (is-Found!10956 lt!623890) (= (select (arr!46645 a!2901) (index!46214 lt!623890)) (select (arr!46645 a!2901) j!112)) (ite (is-MissingZero!10956 lt!623890) (= (select (arr!46645 a!2901) (index!46213 lt!623890)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10956 lt!623890) (= (select (arr!46645 a!2901) (index!46216 lt!623890)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!800881 () SeekEntryResult!10956)

(assert (=> d!152491 (= lt!623890 e!800881)))

(declare-fun c!131450 () Bool)

(declare-fun lt!623889 () SeekEntryResult!10956)

(assert (=> d!152491 (= c!131450 (and (is-Intermediate!10956 lt!623889) (undefined!11768 lt!623889)))))

(assert (=> d!152491 (= lt!623889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46645 a!2901) j!112) mask!2840) (select (arr!46645 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152491 (validMask!0 mask!2840)))

(assert (=> d!152491 (= (seekEntryOrOpen!0 (select (arr!46645 a!2901) j!112) a!2901 mask!2840) lt!623890)))

(declare-fun b!1415077 () Bool)

(assert (=> b!1415077 (= e!800879 (MissingZero!10956 (index!46215 lt!623889)))))

(declare-fun b!1415078 () Bool)

(assert (=> b!1415078 (= e!800880 (Found!10956 (index!46215 lt!623889)))))

(declare-fun b!1415079 () Bool)

(assert (=> b!1415079 (= e!800881 Undefined!10956)))

(declare-fun b!1415080 () Bool)

(assert (=> b!1415080 (= e!800881 e!800880)))

(assert (=> b!1415080 (= lt!623888 (select (arr!46645 a!2901) (index!46215 lt!623889)))))

(declare-fun c!131448 () Bool)

(assert (=> b!1415080 (= c!131448 (= lt!623888 (select (arr!46645 a!2901) j!112)))))

(declare-fun b!1415081 () Bool)

(assert (=> b!1415081 (= e!800879 (seekKeyOrZeroReturnVacant!0 (x!127815 lt!623889) (index!46215 lt!623889) (index!46215 lt!623889) (select (arr!46645 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152491 c!131450) b!1415079))

(assert (= (and d!152491 (not c!131450)) b!1415080))

(assert (= (and b!1415080 c!131448) b!1415078))

(assert (= (and b!1415080 (not c!131448)) b!1415076))

(assert (= (and b!1415076 c!131449) b!1415077))

(assert (= (and b!1415076 (not c!131449)) b!1415081))

(declare-fun m!1305247 () Bool)

(assert (=> d!152491 m!1305247))

(declare-fun m!1305249 () Bool)

(assert (=> d!152491 m!1305249))

(declare-fun m!1305251 () Bool)

(assert (=> d!152491 m!1305251))

(assert (=> d!152491 m!1305039))

(assert (=> d!152491 m!1305045))

(assert (=> d!152491 m!1305023))

(declare-fun m!1305253 () Bool)

(assert (=> d!152491 m!1305253))

(assert (=> d!152491 m!1305023))

(assert (=> d!152491 m!1305045))

(declare-fun m!1305255 () Bool)

(assert (=> b!1415080 m!1305255))

(assert (=> b!1415081 m!1305023))

(declare-fun m!1305257 () Bool)

(assert (=> b!1415081 m!1305257))

(assert (=> b!1414774 d!152491))

(declare-fun b!1415086 () Bool)

(declare-fun e!800886 () SeekEntryResult!10956)

(assert (=> b!1415086 (= e!800886 (Intermediate!10956 true (toIndex!0 lt!623750 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1415087 () Bool)

(declare-fun e!800889 () Bool)

(declare-fun e!800888 () Bool)

(assert (=> b!1415087 (= e!800889 e!800888)))

(declare-fun res!951140 () Bool)

(declare-fun lt!623894 () SeekEntryResult!10956)

(assert (=> b!1415087 (= res!951140 (and (is-Intermediate!10956 lt!623894) (not (undefined!11768 lt!623894)) (bvslt (x!127815 lt!623894) #b01111111111111111111111111111110) (bvsge (x!127815 lt!623894) #b00000000000000000000000000000000) (bvsge (x!127815 lt!623894) #b00000000000000000000000000000000)))))

(assert (=> b!1415087 (=> (not res!951140) (not e!800888))))

(declare-fun b!1415088 () Bool)

(assert (=> b!1415088 (and (bvsge (index!46215 lt!623894) #b00000000000000000000000000000000) (bvslt (index!46215 lt!623894) (size!47195 lt!623746)))))

(declare-fun e!800885 () Bool)

(assert (=> b!1415088 (= e!800885 (= (select (arr!46645 lt!623746) (index!46215 lt!623894)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1415090 () Bool)

(declare-fun e!800887 () SeekEntryResult!10956)

(assert (=> b!1415090 (= e!800887 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!623750 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!623750 lt!623746 mask!2840))))

(declare-fun b!1415091 () Bool)

(assert (=> b!1415091 (and (bvsge (index!46215 lt!623894) #b00000000000000000000000000000000) (bvslt (index!46215 lt!623894) (size!47195 lt!623746)))))

(declare-fun res!951142 () Bool)

(assert (=> b!1415091 (= res!951142 (= (select (arr!46645 lt!623746) (index!46215 lt!623894)) lt!623750))))

(assert (=> b!1415091 (=> res!951142 e!800885)))

(assert (=> b!1415091 (= e!800888 e!800885)))

(declare-fun b!1415092 () Bool)

(assert (=> b!1415092 (= e!800887 (Intermediate!10956 false (toIndex!0 lt!623750 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1415093 () Bool)

(assert (=> b!1415093 (= e!800889 (bvsge (x!127815 lt!623894) #b01111111111111111111111111111110))))

(declare-fun b!1415094 () Bool)

(assert (=> b!1415094 (= e!800886 e!800887)))

(declare-fun c!131453 () Bool)

(declare-fun lt!623895 () (_ BitVec 64))

(assert (=> b!1415094 (= c!131453 (or (= lt!623895 lt!623750) (= (bvadd lt!623895 lt!623895) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1415089 () Bool)

(assert (=> b!1415089 (and (bvsge (index!46215 lt!623894) #b00000000000000000000000000000000) (bvslt (index!46215 lt!623894) (size!47195 lt!623746)))))

(declare-fun res!951141 () Bool)

(assert (=> b!1415089 (= res!951141 (= (select (arr!46645 lt!623746) (index!46215 lt!623894)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1415089 (=> res!951141 e!800885)))

(declare-fun d!152497 () Bool)

(assert (=> d!152497 e!800889))

(declare-fun c!131454 () Bool)

(assert (=> d!152497 (= c!131454 (and (is-Intermediate!10956 lt!623894) (undefined!11768 lt!623894)))))

(assert (=> d!152497 (= lt!623894 e!800886)))

(declare-fun c!131452 () Bool)

(assert (=> d!152497 (= c!131452 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152497 (= lt!623895 (select (arr!46645 lt!623746) (toIndex!0 lt!623750 mask!2840)))))

(assert (=> d!152497 (validMask!0 mask!2840)))

(assert (=> d!152497 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!623750 mask!2840) lt!623750 lt!623746 mask!2840) lt!623894)))

(assert (= (and d!152497 c!131452) b!1415086))

(assert (= (and d!152497 (not c!131452)) b!1415094))

(assert (= (and b!1415094 c!131453) b!1415092))

(assert (= (and b!1415094 (not c!131453)) b!1415090))

(assert (= (and d!152497 c!131454) b!1415093))

(assert (= (and d!152497 (not c!131454)) b!1415087))

(assert (= (and b!1415087 res!951140) b!1415091))

(assert (= (and b!1415091 (not res!951142)) b!1415089))

