; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121300 () Bool)

(assert start!121300)

(declare-datatypes ((array!96403 0))(
  ( (array!96404 (arr!46543 (Array (_ BitVec 32) (_ BitVec 64))) (size!47093 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96403)

(declare-datatypes ((SeekEntryResult!10854 0))(
  ( (MissingZero!10854 (index!45793 (_ BitVec 32))) (Found!10854 (index!45794 (_ BitVec 32))) (Intermediate!10854 (undefined!11666 Bool) (index!45795 (_ BitVec 32)) (x!127381 (_ BitVec 32))) (Undefined!10854) (MissingVacant!10854 (index!45796 (_ BitVec 32))) )
))
(declare-fun lt!620987 () SeekEntryResult!10854)

(declare-fun e!797934 () Bool)

(declare-fun b!1410053 () Bool)

(declare-fun lt!620985 () SeekEntryResult!10854)

(declare-fun lt!620988 () (_ BitVec 32))

(assert (=> b!1410053 (= e!797934 (or (= lt!620985 lt!620987) (not (is-Intermediate!10854 lt!620987)) (bvslt (x!127381 lt!620985) #b00000000000000000000000000000000) (bvsgt (x!127381 lt!620985) #b01111111111111111111111111111110) (and (bvsge lt!620988 #b00000000000000000000000000000000) (bvslt lt!620988 (size!47093 a!2901)))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96403 (_ BitVec 32)) SeekEntryResult!10854)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410053 (= lt!620987 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96404 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901)) mask!2840))))

(declare-fun b!1410054 () Bool)

(declare-fun e!797933 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96403 (_ BitVec 32)) SeekEntryResult!10854)

(assert (=> b!1410054 (= e!797933 (= (seekEntryOrOpen!0 (select (arr!46543 a!2901) j!112) a!2901 mask!2840) (Found!10854 j!112)))))

(declare-fun b!1410055 () Bool)

(declare-fun res!947616 () Bool)

(declare-fun e!797936 () Bool)

(assert (=> b!1410055 (=> (not res!947616) (not e!797936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410055 (= res!947616 (validKeyInArray!0 (select (arr!46543 a!2901) j!112)))))

(declare-fun b!1410056 () Bool)

(declare-fun res!947617 () Bool)

(assert (=> b!1410056 (=> (not res!947617) (not e!797936))))

(assert (=> b!1410056 (= res!947617 (and (= (size!47093 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47093 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47093 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410057 () Bool)

(declare-fun res!947612 () Bool)

(assert (=> b!1410057 (=> (not res!947612) (not e!797936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96403 (_ BitVec 32)) Bool)

(assert (=> b!1410057 (= res!947612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410058 () Bool)

(assert (=> b!1410058 (= e!797936 (not e!797934))))

(declare-fun res!947615 () Bool)

(assert (=> b!1410058 (=> res!947615 e!797934)))

(assert (=> b!1410058 (= res!947615 (or (not (is-Intermediate!10854 lt!620985)) (undefined!11666 lt!620985)))))

(assert (=> b!1410058 e!797933))

(declare-fun res!947614 () Bool)

(assert (=> b!1410058 (=> (not res!947614) (not e!797933))))

(assert (=> b!1410058 (= res!947614 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47682 0))(
  ( (Unit!47683) )
))
(declare-fun lt!620986 () Unit!47682)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47682)

(assert (=> b!1410058 (= lt!620986 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1410058 (= lt!620985 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620988 (select (arr!46543 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1410058 (= lt!620988 (toIndex!0 (select (arr!46543 a!2901) j!112) mask!2840))))

(declare-fun res!947613 () Bool)

(assert (=> start!121300 (=> (not res!947613) (not e!797936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121300 (= res!947613 (validMask!0 mask!2840))))

(assert (=> start!121300 e!797936))

(assert (=> start!121300 true))

(declare-fun array_inv!35571 (array!96403) Bool)

(assert (=> start!121300 (array_inv!35571 a!2901)))

(declare-fun b!1410059 () Bool)

(declare-fun res!947611 () Bool)

(assert (=> b!1410059 (=> (not res!947611) (not e!797936))))

(declare-datatypes ((List!33062 0))(
  ( (Nil!33059) (Cons!33058 (h!34324 (_ BitVec 64)) (t!47756 List!33062)) )
))
(declare-fun arrayNoDuplicates!0 (array!96403 (_ BitVec 32) List!33062) Bool)

(assert (=> b!1410059 (= res!947611 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33059))))

(declare-fun b!1410060 () Bool)

(declare-fun res!947610 () Bool)

(assert (=> b!1410060 (=> (not res!947610) (not e!797936))))

(assert (=> b!1410060 (= res!947610 (validKeyInArray!0 (select (arr!46543 a!2901) i!1037)))))

(assert (= (and start!121300 res!947613) b!1410056))

(assert (= (and b!1410056 res!947617) b!1410060))

(assert (= (and b!1410060 res!947610) b!1410055))

(assert (= (and b!1410055 res!947616) b!1410057))

(assert (= (and b!1410057 res!947612) b!1410059))

(assert (= (and b!1410059 res!947611) b!1410058))

(assert (= (and b!1410058 res!947614) b!1410054))

(assert (= (and b!1410058 (not res!947615)) b!1410053))

(declare-fun m!1299815 () Bool)

(assert (=> b!1410055 m!1299815))

(assert (=> b!1410055 m!1299815))

(declare-fun m!1299817 () Bool)

(assert (=> b!1410055 m!1299817))

(declare-fun m!1299819 () Bool)

(assert (=> b!1410059 m!1299819))

(assert (=> b!1410058 m!1299815))

(declare-fun m!1299821 () Bool)

(assert (=> b!1410058 m!1299821))

(assert (=> b!1410058 m!1299815))

(assert (=> b!1410058 m!1299815))

(declare-fun m!1299823 () Bool)

(assert (=> b!1410058 m!1299823))

(declare-fun m!1299825 () Bool)

(assert (=> b!1410058 m!1299825))

(declare-fun m!1299827 () Bool)

(assert (=> b!1410058 m!1299827))

(declare-fun m!1299829 () Bool)

(assert (=> b!1410060 m!1299829))

(assert (=> b!1410060 m!1299829))

(declare-fun m!1299831 () Bool)

(assert (=> b!1410060 m!1299831))

(declare-fun m!1299833 () Bool)

(assert (=> start!121300 m!1299833))

(declare-fun m!1299835 () Bool)

(assert (=> start!121300 m!1299835))

(assert (=> b!1410054 m!1299815))

(assert (=> b!1410054 m!1299815))

(declare-fun m!1299837 () Bool)

(assert (=> b!1410054 m!1299837))

(declare-fun m!1299839 () Bool)

(assert (=> b!1410057 m!1299839))

(declare-fun m!1299841 () Bool)

(assert (=> b!1410053 m!1299841))

(declare-fun m!1299843 () Bool)

(assert (=> b!1410053 m!1299843))

(assert (=> b!1410053 m!1299843))

(declare-fun m!1299845 () Bool)

(assert (=> b!1410053 m!1299845))

(assert (=> b!1410053 m!1299845))

(assert (=> b!1410053 m!1299843))

(declare-fun m!1299847 () Bool)

(assert (=> b!1410053 m!1299847))

(push 1)

(assert (not b!1410054))

(assert (not b!1410058))

(assert (not b!1410053))

(assert (not b!1410055))

(assert (not b!1410057))

(assert (not b!1410060))

(assert (not start!121300))

(assert (not b!1410059))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151813 () Bool)

(assert (=> d!151813 (= (validKeyInArray!0 (select (arr!46543 a!2901) i!1037)) (and (not (= (select (arr!46543 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46543 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410060 d!151813))

(declare-fun d!151815 () Bool)

(assert (=> d!151815 (= (validKeyInArray!0 (select (arr!46543 a!2901) j!112)) (and (not (= (select (arr!46543 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46543 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410055 d!151815))

(declare-fun b!1410124 () Bool)

(declare-fun c!130712 () Bool)

(declare-fun lt!621026 () (_ BitVec 64))

(assert (=> b!1410124 (= c!130712 (= lt!621026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797978 () SeekEntryResult!10854)

(declare-fun e!797977 () SeekEntryResult!10854)

(assert (=> b!1410124 (= e!797978 e!797977)))

(declare-fun d!151817 () Bool)

(declare-fun lt!621025 () SeekEntryResult!10854)

(assert (=> d!151817 (and (or (is-Undefined!10854 lt!621025) (not (is-Found!10854 lt!621025)) (and (bvsge (index!45794 lt!621025) #b00000000000000000000000000000000) (bvslt (index!45794 lt!621025) (size!47093 a!2901)))) (or (is-Undefined!10854 lt!621025) (is-Found!10854 lt!621025) (not (is-MissingZero!10854 lt!621025)) (and (bvsge (index!45793 lt!621025) #b00000000000000000000000000000000) (bvslt (index!45793 lt!621025) (size!47093 a!2901)))) (or (is-Undefined!10854 lt!621025) (is-Found!10854 lt!621025) (is-MissingZero!10854 lt!621025) (not (is-MissingVacant!10854 lt!621025)) (and (bvsge (index!45796 lt!621025) #b00000000000000000000000000000000) (bvslt (index!45796 lt!621025) (size!47093 a!2901)))) (or (is-Undefined!10854 lt!621025) (ite (is-Found!10854 lt!621025) (= (select (arr!46543 a!2901) (index!45794 lt!621025)) (select (arr!46543 a!2901) j!112)) (ite (is-MissingZero!10854 lt!621025) (= (select (arr!46543 a!2901) (index!45793 lt!621025)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10854 lt!621025) (= (select (arr!46543 a!2901) (index!45796 lt!621025)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!797976 () SeekEntryResult!10854)

(assert (=> d!151817 (= lt!621025 e!797976)))

(declare-fun c!130713 () Bool)

(declare-fun lt!621027 () SeekEntryResult!10854)

(assert (=> d!151817 (= c!130713 (and (is-Intermediate!10854 lt!621027) (undefined!11666 lt!621027)))))

(assert (=> d!151817 (= lt!621027 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46543 a!2901) j!112) mask!2840) (select (arr!46543 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151817 (validMask!0 mask!2840)))

(assert (=> d!151817 (= (seekEntryOrOpen!0 (select (arr!46543 a!2901) j!112) a!2901 mask!2840) lt!621025)))

(declare-fun b!1410125 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96403 (_ BitVec 32)) SeekEntryResult!10854)

(assert (=> b!1410125 (= e!797977 (seekKeyOrZeroReturnVacant!0 (x!127381 lt!621027) (index!45795 lt!621027) (index!45795 lt!621027) (select (arr!46543 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410126 () Bool)

(assert (=> b!1410126 (= e!797978 (Found!10854 (index!45795 lt!621027)))))

(declare-fun b!1410127 () Bool)

(assert (=> b!1410127 (= e!797976 Undefined!10854)))

(declare-fun b!1410128 () Bool)

(assert (=> b!1410128 (= e!797976 e!797978)))

(assert (=> b!1410128 (= lt!621026 (select (arr!46543 a!2901) (index!45795 lt!621027)))))

(declare-fun c!130711 () Bool)

(assert (=> b!1410128 (= c!130711 (= lt!621026 (select (arr!46543 a!2901) j!112)))))

(declare-fun b!1410129 () Bool)

(assert (=> b!1410129 (= e!797977 (MissingZero!10854 (index!45795 lt!621027)))))

(assert (= (and d!151817 c!130713) b!1410127))

(assert (= (and d!151817 (not c!130713)) b!1410128))

(assert (= (and b!1410128 c!130711) b!1410126))

(assert (= (and b!1410128 (not c!130711)) b!1410124))

(assert (= (and b!1410124 c!130712) b!1410129))

(assert (= (and b!1410124 (not c!130712)) b!1410125))

(assert (=> d!151817 m!1299815))

(assert (=> d!151817 m!1299821))

(assert (=> d!151817 m!1299833))

(assert (=> d!151817 m!1299821))

(assert (=> d!151817 m!1299815))

(declare-fun m!1299881 () Bool)

(assert (=> d!151817 m!1299881))

(declare-fun m!1299883 () Bool)

(assert (=> d!151817 m!1299883))

(declare-fun m!1299885 () Bool)

(assert (=> d!151817 m!1299885))

(declare-fun m!1299887 () Bool)

(assert (=> d!151817 m!1299887))

(assert (=> b!1410125 m!1299815))

(declare-fun m!1299889 () Bool)

(assert (=> b!1410125 m!1299889))

(declare-fun m!1299891 () Bool)

(assert (=> b!1410128 m!1299891))

(assert (=> b!1410054 d!151817))

(declare-fun d!151829 () Bool)

(assert (=> d!151829 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121300 d!151829))

(declare-fun d!151831 () Bool)

(assert (=> d!151831 (= (array_inv!35571 a!2901) (bvsge (size!47093 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121300 d!151831))

(declare-fun b!1410187 () Bool)

(declare-fun e!798013 () Bool)

(declare-fun e!798014 () Bool)

(assert (=> b!1410187 (= e!798013 e!798014)))

(declare-fun lt!621056 () (_ BitVec 64))

(assert (=> b!1410187 (= lt!621056 (select (arr!46543 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!621055 () Unit!47682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96403 (_ BitVec 64) (_ BitVec 32)) Unit!47682)

(assert (=> b!1410187 (= lt!621055 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621056 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1410187 (arrayContainsKey!0 a!2901 lt!621056 #b00000000000000000000000000000000)))

(declare-fun lt!621057 () Unit!47682)

(assert (=> b!1410187 (= lt!621057 lt!621055)))

(declare-fun res!947656 () Bool)

(assert (=> b!1410187 (= res!947656 (= (seekEntryOrOpen!0 (select (arr!46543 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10854 #b00000000000000000000000000000000)))))

(assert (=> b!1410187 (=> (not res!947656) (not e!798014))))

(declare-fun b!1410188 () Bool)

(declare-fun call!67043 () Bool)

(assert (=> b!1410188 (= e!798014 call!67043)))

(declare-fun d!151833 () Bool)

(declare-fun res!947655 () Bool)

(declare-fun e!798012 () Bool)

(assert (=> d!151833 (=> res!947655 e!798012)))

(assert (=> d!151833 (= res!947655 (bvsge #b00000000000000000000000000000000 (size!47093 a!2901)))))

(assert (=> d!151833 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!798012)))

(declare-fun b!1410189 () Bool)

(assert (=> b!1410189 (= e!798013 call!67043)))

(declare-fun b!1410190 () Bool)

(assert (=> b!1410190 (= e!798012 e!798013)))

(declare-fun c!130735 () Bool)

(assert (=> b!1410190 (= c!130735 (validKeyInArray!0 (select (arr!46543 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67040 () Bool)

(assert (=> bm!67040 (= call!67043 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151833 (not res!947655)) b!1410190))

(assert (= (and b!1410190 c!130735) b!1410187))

(assert (= (and b!1410190 (not c!130735)) b!1410189))

(assert (= (and b!1410187 res!947656) b!1410188))

(assert (= (or b!1410188 b!1410189) bm!67040))

(declare-fun m!1299921 () Bool)

(assert (=> b!1410187 m!1299921))

(declare-fun m!1299923 () Bool)

(assert (=> b!1410187 m!1299923))

(declare-fun m!1299925 () Bool)

(assert (=> b!1410187 m!1299925))

(assert (=> b!1410187 m!1299921))

(declare-fun m!1299927 () Bool)

(assert (=> b!1410187 m!1299927))

(assert (=> b!1410190 m!1299921))

(assert (=> b!1410190 m!1299921))

(declare-fun m!1299929 () Bool)

(assert (=> b!1410190 m!1299929))

(declare-fun m!1299931 () Bool)

(assert (=> bm!67040 m!1299931))

(assert (=> b!1410057 d!151833))

(declare-fun b!1410214 () Bool)

(declare-fun e!798032 () Bool)

(declare-fun e!798031 () Bool)

(assert (=> b!1410214 (= e!798032 e!798031)))

(declare-fun c!130742 () Bool)

(assert (=> b!1410214 (= c!130742 (validKeyInArray!0 (select (arr!46543 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151845 () Bool)

(declare-fun res!947671 () Bool)

(declare-fun e!798034 () Bool)

(assert (=> d!151845 (=> res!947671 e!798034)))

(assert (=> d!151845 (= res!947671 (bvsge #b00000000000000000000000000000000 (size!47093 a!2901)))))

(assert (=> d!151845 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33059) e!798034)))

(declare-fun b!1410215 () Bool)

(assert (=> b!1410215 (= e!798034 e!798032)))

(declare-fun res!947670 () Bool)

(assert (=> b!1410215 (=> (not res!947670) (not e!798032))))

(declare-fun e!798033 () Bool)

(assert (=> b!1410215 (= res!947670 (not e!798033))))

(declare-fun res!947669 () Bool)

(assert (=> b!1410215 (=> (not res!947669) (not e!798033))))

(assert (=> b!1410215 (= res!947669 (validKeyInArray!0 (select (arr!46543 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410216 () Bool)

(declare-fun contains!9806 (List!33062 (_ BitVec 64)) Bool)

(assert (=> b!1410216 (= e!798033 (contains!9806 Nil!33059 (select (arr!46543 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410217 () Bool)

(declare-fun call!67047 () Bool)

(assert (=> b!1410217 (= e!798031 call!67047)))

(declare-fun b!1410218 () Bool)

(assert (=> b!1410218 (= e!798031 call!67047)))

(declare-fun bm!67044 () Bool)

(assert (=> bm!67044 (= call!67047 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130742 (Cons!33058 (select (arr!46543 a!2901) #b00000000000000000000000000000000) Nil!33059) Nil!33059)))))

(assert (= (and d!151845 (not res!947671)) b!1410215))

(assert (= (and b!1410215 res!947669) b!1410216))

(assert (= (and b!1410215 res!947670) b!1410214))

(assert (= (and b!1410214 c!130742) b!1410218))

(assert (= (and b!1410214 (not c!130742)) b!1410217))

(assert (= (or b!1410218 b!1410217) bm!67044))

(assert (=> b!1410214 m!1299921))

(assert (=> b!1410214 m!1299921))

(assert (=> b!1410214 m!1299929))

(assert (=> b!1410215 m!1299921))

(assert (=> b!1410215 m!1299921))

(assert (=> b!1410215 m!1299929))

(assert (=> b!1410216 m!1299921))

(assert (=> b!1410216 m!1299921))

(declare-fun m!1299947 () Bool)

(assert (=> b!1410216 m!1299947))

(assert (=> bm!67044 m!1299921))

(declare-fun m!1299949 () Bool)

(assert (=> bm!67044 m!1299949))

(assert (=> b!1410059 d!151845))

(declare-fun b!1410219 () Bool)

(declare-fun e!798036 () Bool)

(declare-fun e!798037 () Bool)

(assert (=> b!1410219 (= e!798036 e!798037)))

(declare-fun lt!621072 () (_ BitVec 64))

(assert (=> b!1410219 (= lt!621072 (select (arr!46543 a!2901) j!112))))

(declare-fun lt!621071 () Unit!47682)

(assert (=> b!1410219 (= lt!621071 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621072 j!112))))

(assert (=> b!1410219 (arrayContainsKey!0 a!2901 lt!621072 #b00000000000000000000000000000000)))

(declare-fun lt!621073 () Unit!47682)

(assert (=> b!1410219 (= lt!621073 lt!621071)))

(declare-fun res!947673 () Bool)

(assert (=> b!1410219 (= res!947673 (= (seekEntryOrOpen!0 (select (arr!46543 a!2901) j!112) a!2901 mask!2840) (Found!10854 j!112)))))

(assert (=> b!1410219 (=> (not res!947673) (not e!798037))))

(declare-fun b!1410220 () Bool)

(declare-fun call!67048 () Bool)

(assert (=> b!1410220 (= e!798037 call!67048)))

(declare-fun d!151859 () Bool)

(declare-fun res!947672 () Bool)

(declare-fun e!798035 () Bool)

(assert (=> d!151859 (=> res!947672 e!798035)))

(assert (=> d!151859 (= res!947672 (bvsge j!112 (size!47093 a!2901)))))

(assert (=> d!151859 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!798035)))

(declare-fun b!1410221 () Bool)

(assert (=> b!1410221 (= e!798036 call!67048)))

(declare-fun b!1410222 () Bool)

(assert (=> b!1410222 (= e!798035 e!798036)))

(declare-fun c!130743 () Bool)

(assert (=> b!1410222 (= c!130743 (validKeyInArray!0 (select (arr!46543 a!2901) j!112)))))

(declare-fun bm!67045 () Bool)

(assert (=> bm!67045 (= call!67048 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151859 (not res!947672)) b!1410222))

(assert (= (and b!1410222 c!130743) b!1410219))

(assert (= (and b!1410222 (not c!130743)) b!1410221))

(assert (= (and b!1410219 res!947673) b!1410220))

(assert (= (or b!1410220 b!1410221) bm!67045))

(assert (=> b!1410219 m!1299815))

(declare-fun m!1299951 () Bool)

(assert (=> b!1410219 m!1299951))

(declare-fun m!1299953 () Bool)

(assert (=> b!1410219 m!1299953))

(assert (=> b!1410219 m!1299815))

(assert (=> b!1410219 m!1299837))

(assert (=> b!1410222 m!1299815))

(assert (=> b!1410222 m!1299815))

(assert (=> b!1410222 m!1299817))

(declare-fun m!1299955 () Bool)

(assert (=> bm!67045 m!1299955))

(assert (=> b!1410058 d!151859))

(declare-fun d!151861 () Bool)

(assert (=> d!151861 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!621081 () Unit!47682)

(declare-fun choose!38 (array!96403 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47682)

(assert (=> d!151861 (= lt!621081 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151861 (validMask!0 mask!2840)))

(assert (=> d!151861 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!621081)))

(declare-fun bs!41113 () Bool)

(assert (= bs!41113 d!151861))

(assert (=> bs!41113 m!1299827))

(declare-fun m!1299967 () Bool)

(assert (=> bs!41113 m!1299967))

(assert (=> bs!41113 m!1299833))

(assert (=> b!1410058 d!151861))

(declare-fun b!1410283 () Bool)

(declare-fun lt!621097 () SeekEntryResult!10854)

(assert (=> b!1410283 (and (bvsge (index!45795 lt!621097) #b00000000000000000000000000000000) (bvslt (index!45795 lt!621097) (size!47093 a!2901)))))

(declare-fun res!947694 () Bool)

(assert (=> b!1410283 (= res!947694 (= (select (arr!46543 a!2901) (index!45795 lt!621097)) (select (arr!46543 a!2901) j!112)))))

(declare-fun e!798078 () Bool)

(assert (=> b!1410283 (=> res!947694 e!798078)))

(declare-fun e!798074 () Bool)

(assert (=> b!1410283 (= e!798074 e!798078)))

(declare-fun b!1410284 () Bool)

(declare-fun e!798077 () SeekEntryResult!10854)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410284 (= e!798077 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!620988 #b00000000000000000000000000000000 mask!2840) (select (arr!46543 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410285 () Bool)

(assert (=> b!1410285 (= e!798077 (Intermediate!10854 false lt!620988 #b00000000000000000000000000000000))))

(declare-fun b!1410286 () Bool)

(assert (=> b!1410286 (and (bvsge (index!45795 lt!621097) #b00000000000000000000000000000000) (bvslt (index!45795 lt!621097) (size!47093 a!2901)))))

(assert (=> b!1410286 (= e!798078 (= (select (arr!46543 a!2901) (index!45795 lt!621097)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410287 () Bool)

(declare-fun e!798076 () Bool)

(assert (=> b!1410287 (= e!798076 e!798074)))

(declare-fun res!947692 () Bool)

(assert (=> b!1410287 (= res!947692 (and (is-Intermediate!10854 lt!621097) (not (undefined!11666 lt!621097)) (bvslt (x!127381 lt!621097) #b01111111111111111111111111111110) (bvsge (x!127381 lt!621097) #b00000000000000000000000000000000) (bvsge (x!127381 lt!621097) #b00000000000000000000000000000000)))))

(assert (=> b!1410287 (=> (not res!947692) (not e!798074))))

(declare-fun b!1410288 () Bool)

(assert (=> b!1410288 (= e!798076 (bvsge (x!127381 lt!621097) #b01111111111111111111111111111110))))

(declare-fun b!1410290 () Bool)

(declare-fun e!798075 () SeekEntryResult!10854)

(assert (=> b!1410290 (= e!798075 e!798077)))

(declare-fun lt!621098 () (_ BitVec 64))

(declare-fun c!130767 () Bool)

(assert (=> b!1410290 (= c!130767 (or (= lt!621098 (select (arr!46543 a!2901) j!112)) (= (bvadd lt!621098 lt!621098) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410291 () Bool)

(assert (=> b!1410291 (and (bvsge (index!45795 lt!621097) #b00000000000000000000000000000000) (bvslt (index!45795 lt!621097) (size!47093 a!2901)))))

(declare-fun res!947693 () Bool)

(assert (=> b!1410291 (= res!947693 (= (select (arr!46543 a!2901) (index!45795 lt!621097)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410291 (=> res!947693 e!798078)))

(declare-fun b!1410289 () Bool)

(assert (=> b!1410289 (= e!798075 (Intermediate!10854 true lt!620988 #b00000000000000000000000000000000))))

(declare-fun d!151871 () Bool)

(assert (=> d!151871 e!798076))

(declare-fun c!130766 () Bool)

(assert (=> d!151871 (= c!130766 (and (is-Intermediate!10854 lt!621097) (undefined!11666 lt!621097)))))

(assert (=> d!151871 (= lt!621097 e!798075)))

(declare-fun c!130765 () Bool)

(assert (=> d!151871 (= c!130765 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151871 (= lt!621098 (select (arr!46543 a!2901) lt!620988))))

(assert (=> d!151871 (validMask!0 mask!2840)))

(assert (=> d!151871 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620988 (select (arr!46543 a!2901) j!112) a!2901 mask!2840) lt!621097)))

(assert (= (and d!151871 c!130765) b!1410289))

(assert (= (and d!151871 (not c!130765)) b!1410290))

(assert (= (and b!1410290 c!130767) b!1410285))

(assert (= (and b!1410290 (not c!130767)) b!1410284))

(assert (= (and d!151871 c!130766) b!1410288))

(assert (= (and d!151871 (not c!130766)) b!1410287))

(assert (= (and b!1410287 res!947692) b!1410283))

(assert (= (and b!1410283 (not res!947694)) b!1410291))

(assert (= (and b!1410291 (not res!947693)) b!1410286))

(declare-fun m!1299985 () Bool)

(assert (=> b!1410291 m!1299985))

(assert (=> b!1410283 m!1299985))

(assert (=> b!1410286 m!1299985))

(declare-fun m!1299987 () Bool)

(assert (=> b!1410284 m!1299987))

(assert (=> b!1410284 m!1299987))

(assert (=> b!1410284 m!1299815))

(declare-fun m!1299989 () Bool)

(assert (=> b!1410284 m!1299989))

(declare-fun m!1299991 () Bool)

(assert (=> d!151871 m!1299991))

(assert (=> d!151871 m!1299833))

(assert (=> b!1410058 d!151871))

(declare-fun d!151879 () Bool)

(declare-fun lt!621104 () (_ BitVec 32))

(declare-fun lt!621103 () (_ BitVec 32))

(assert (=> d!151879 (= lt!621104 (bvmul (bvxor lt!621103 (bvlshr lt!621103 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151879 (= lt!621103 ((_ extract 31 0) (bvand (bvxor (select (arr!46543 a!2901) j!112) (bvlshr (select (arr!46543 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151879 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947695 (let ((h!34327 ((_ extract 31 0) (bvand (bvxor (select (arr!46543 a!2901) j!112) (bvlshr (select (arr!46543 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127387 (bvmul (bvxor h!34327 (bvlshr h!34327 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127387 (bvlshr x!127387 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947695 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947695 #b00000000000000000000000000000000))))))

(assert (=> d!151879 (= (toIndex!0 (select (arr!46543 a!2901) j!112) mask!2840) (bvand (bvxor lt!621104 (bvlshr lt!621104 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410058 d!151879))

(declare-fun b!1410302 () Bool)

(declare-fun lt!621105 () SeekEntryResult!10854)

(assert (=> b!1410302 (and (bvsge (index!45795 lt!621105) #b00000000000000000000000000000000) (bvslt (index!45795 lt!621105) (size!47093 (array!96404 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901)))))))

(declare-fun res!947704 () Bool)

(assert (=> b!1410302 (= res!947704 (= (select (arr!46543 (array!96404 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901))) (index!45795 lt!621105)) (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!798091 () Bool)

(assert (=> b!1410302 (=> res!947704 e!798091)))

(declare-fun e!798087 () Bool)

(assert (=> b!1410302 (= e!798087 e!798091)))

(declare-fun e!798090 () SeekEntryResult!10854)

(declare-fun b!1410303 () Bool)

(assert (=> b!1410303 (= e!798090 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96404 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901)) mask!2840))))

(declare-fun b!1410304 () Bool)

(assert (=> b!1410304 (= e!798090 (Intermediate!10854 false (toIndex!0 (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410305 () Bool)

(assert (=> b!1410305 (and (bvsge (index!45795 lt!621105) #b00000000000000000000000000000000) (bvslt (index!45795 lt!621105) (size!47093 (array!96404 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901)))))))

(assert (=> b!1410305 (= e!798091 (= (select (arr!46543 (array!96404 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901))) (index!45795 lt!621105)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1410306 () Bool)

(declare-fun e!798089 () Bool)

(assert (=> b!1410306 (= e!798089 e!798087)))

(declare-fun res!947702 () Bool)

(assert (=> b!1410306 (= res!947702 (and (is-Intermediate!10854 lt!621105) (not (undefined!11666 lt!621105)) (bvslt (x!127381 lt!621105) #b01111111111111111111111111111110) (bvsge (x!127381 lt!621105) #b00000000000000000000000000000000) (bvsge (x!127381 lt!621105) #b00000000000000000000000000000000)))))

(assert (=> b!1410306 (=> (not res!947702) (not e!798087))))

(declare-fun b!1410307 () Bool)

(assert (=> b!1410307 (= e!798089 (bvsge (x!127381 lt!621105) #b01111111111111111111111111111110))))

(declare-fun b!1410309 () Bool)

(declare-fun e!798088 () SeekEntryResult!10854)

(assert (=> b!1410309 (= e!798088 e!798090)))

(declare-fun lt!621106 () (_ BitVec 64))

(declare-fun c!130772 () Bool)

(assert (=> b!1410309 (= c!130772 (or (= lt!621106 (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!621106 lt!621106) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410310 () Bool)

(assert (=> b!1410310 (and (bvsge (index!45795 lt!621105) #b00000000000000000000000000000000) (bvslt (index!45795 lt!621105) (size!47093 (array!96404 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901)))))))

(declare-fun res!947703 () Bool)

(assert (=> b!1410310 (= res!947703 (= (select (arr!46543 (array!96404 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901))) (index!45795 lt!621105)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410310 (=> res!947703 e!798091)))

(declare-fun b!1410308 () Bool)

(assert (=> b!1410308 (= e!798088 (Intermediate!10854 true (toIndex!0 (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151881 () Bool)

(assert (=> d!151881 e!798089))

(declare-fun c!130771 () Bool)

(assert (=> d!151881 (= c!130771 (and (is-Intermediate!10854 lt!621105) (undefined!11666 lt!621105)))))

(assert (=> d!151881 (= lt!621105 e!798088)))

(declare-fun c!130770 () Bool)

(assert (=> d!151881 (= c!130770 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151881 (= lt!621106 (select (arr!46543 (array!96404 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901))) (toIndex!0 (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151881 (validMask!0 mask!2840)))

(assert (=> d!151881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96404 (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47093 a!2901)) mask!2840) lt!621105)))

(assert (= (and d!151881 c!130770) b!1410308))

(assert (= (and d!151881 (not c!130770)) b!1410309))

(assert (= (and b!1410309 c!130772) b!1410304))

(assert (= (and b!1410309 (not c!130772)) b!1410303))

(assert (= (and d!151881 c!130771) b!1410307))

(assert (= (and d!151881 (not c!130771)) b!1410306))

(assert (= (and b!1410306 res!947702) b!1410302))

(assert (= (and b!1410302 (not res!947704)) b!1410310))

(assert (= (and b!1410310 (not res!947703)) b!1410305))

(declare-fun m!1299993 () Bool)

(assert (=> b!1410310 m!1299993))

(assert (=> b!1410302 m!1299993))

(assert (=> b!1410305 m!1299993))

(assert (=> b!1410303 m!1299845))

(declare-fun m!1299995 () Bool)

(assert (=> b!1410303 m!1299995))

(assert (=> b!1410303 m!1299995))

(assert (=> b!1410303 m!1299843))

(declare-fun m!1299997 () Bool)

(assert (=> b!1410303 m!1299997))

(assert (=> d!151881 m!1299845))

(declare-fun m!1299999 () Bool)

(assert (=> d!151881 m!1299999))

(assert (=> d!151881 m!1299833))

(assert (=> b!1410053 d!151881))

(declare-fun d!151883 () Bool)

(declare-fun lt!621108 () (_ BitVec 32))

(declare-fun lt!621107 () (_ BitVec 32))

(assert (=> d!151883 (= lt!621108 (bvmul (bvxor lt!621107 (bvlshr lt!621107 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151883 (= lt!621107 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151883 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947695 (let ((h!34327 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46543 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127387 (bvmul (bvxor h!34327 (bvlshr h!34327 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127387 (bvlshr x!127387 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947695 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947695 #b00000000000000000000000000000000))))))

