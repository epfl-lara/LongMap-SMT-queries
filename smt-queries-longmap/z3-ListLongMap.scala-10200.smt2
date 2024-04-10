; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120128 () Bool)

(assert start!120128)

(declare-fun res!937618 () Bool)

(declare-fun e!791833 () Bool)

(assert (=> start!120128 (=> (not res!937618) (not e!791833))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120128 (= res!937618 (validMask!0 mask!2840))))

(assert (=> start!120128 e!791833))

(assert (=> start!120128 true))

(declare-datatypes ((array!95657 0))(
  ( (array!95658 (arr!46182 (Array (_ BitVec 32) (_ BitVec 64))) (size!46732 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95657)

(declare-fun array_inv!35210 (array!95657) Bool)

(assert (=> start!120128 (array_inv!35210 a!2901)))

(declare-fun b!1398697 () Bool)

(declare-fun res!937612 () Bool)

(assert (=> b!1398697 (=> (not res!937612) (not e!791833))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398697 (= res!937612 (validKeyInArray!0 (select (arr!46182 a!2901) j!112)))))

(declare-fun b!1398698 () Bool)

(declare-fun res!937611 () Bool)

(assert (=> b!1398698 (=> (not res!937611) (not e!791833))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1398698 (= res!937611 (and (= (size!46732 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46732 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46732 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1398699 () Bool)

(declare-fun e!791836 () Bool)

(assert (=> b!1398699 (= e!791833 (not e!791836))))

(declare-fun res!937613 () Bool)

(assert (=> b!1398699 (=> res!937613 e!791836)))

(declare-datatypes ((SeekEntryResult!10499 0))(
  ( (MissingZero!10499 (index!44367 (_ BitVec 32))) (Found!10499 (index!44368 (_ BitVec 32))) (Intermediate!10499 (undefined!11311 Bool) (index!44369 (_ BitVec 32)) (x!126009 (_ BitVec 32))) (Undefined!10499) (MissingVacant!10499 (index!44370 (_ BitVec 32))) )
))
(declare-fun lt!615101 () SeekEntryResult!10499)

(get-info :version)

(assert (=> b!1398699 (= res!937613 (or (not ((_ is Intermediate!10499) lt!615101)) (undefined!11311 lt!615101)))))

(declare-fun e!791834 () Bool)

(assert (=> b!1398699 e!791834))

(declare-fun res!937614 () Bool)

(assert (=> b!1398699 (=> (not res!937614) (not e!791834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95657 (_ BitVec 32)) Bool)

(assert (=> b!1398699 (= res!937614 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47002 0))(
  ( (Unit!47003) )
))
(declare-fun lt!615097 () Unit!47002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47002)

(assert (=> b!1398699 (= lt!615097 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615099 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95657 (_ BitVec 32)) SeekEntryResult!10499)

(assert (=> b!1398699 (= lt!615101 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615099 (select (arr!46182 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398699 (= lt!615099 (toIndex!0 (select (arr!46182 a!2901) j!112) mask!2840))))

(declare-fun b!1398700 () Bool)

(declare-fun res!937615 () Bool)

(assert (=> b!1398700 (=> (not res!937615) (not e!791833))))

(assert (=> b!1398700 (= res!937615 (validKeyInArray!0 (select (arr!46182 a!2901) i!1037)))))

(declare-fun b!1398701 () Bool)

(declare-fun e!791835 () Bool)

(assert (=> b!1398701 (= e!791836 e!791835)))

(declare-fun res!937617 () Bool)

(assert (=> b!1398701 (=> res!937617 e!791835)))

(declare-fun lt!615098 () SeekEntryResult!10499)

(assert (=> b!1398701 (= res!937617 (or (= lt!615101 lt!615098) (not ((_ is Intermediate!10499) lt!615098))))))

(declare-fun lt!615100 () (_ BitVec 64))

(assert (=> b!1398701 (= lt!615098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615100 mask!2840) lt!615100 (array!95658 (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901)) mask!2840))))

(assert (=> b!1398701 (= lt!615100 (select (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398702 () Bool)

(assert (=> b!1398702 (= e!791835 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt (index!44369 lt!615098) #b00000000000000000000000000000000) (bvsge (index!44369 lt!615098) (bvadd #b00000000000000000000000000000001 mask!2840)) (and (bvsle (x!126009 lt!615098) #b01111111111111111111111111111110) (bvsge (x!126009 lt!615098) #b00000000000000000000000000000000))))))

(assert (=> b!1398702 (and (not (undefined!11311 lt!615098)) (= (index!44369 lt!615098) i!1037) (bvslt (x!126009 lt!615098) (x!126009 lt!615101)) (= (select (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44369 lt!615098)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615102 () Unit!47002)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47002)

(assert (=> b!1398702 (= lt!615102 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615099 (x!126009 lt!615101) (index!44369 lt!615101) (x!126009 lt!615098) (index!44369 lt!615098) (undefined!11311 lt!615098) mask!2840))))

(declare-fun b!1398703 () Bool)

(declare-fun res!937610 () Bool)

(assert (=> b!1398703 (=> (not res!937610) (not e!791833))))

(assert (=> b!1398703 (= res!937610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398704 () Bool)

(declare-fun res!937616 () Bool)

(assert (=> b!1398704 (=> (not res!937616) (not e!791833))))

(declare-datatypes ((List!32701 0))(
  ( (Nil!32698) (Cons!32697 (h!33939 (_ BitVec 64)) (t!47395 List!32701)) )
))
(declare-fun arrayNoDuplicates!0 (array!95657 (_ BitVec 32) List!32701) Bool)

(assert (=> b!1398704 (= res!937616 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32698))))

(declare-fun b!1398705 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95657 (_ BitVec 32)) SeekEntryResult!10499)

(assert (=> b!1398705 (= e!791834 (= (seekEntryOrOpen!0 (select (arr!46182 a!2901) j!112) a!2901 mask!2840) (Found!10499 j!112)))))

(assert (= (and start!120128 res!937618) b!1398698))

(assert (= (and b!1398698 res!937611) b!1398700))

(assert (= (and b!1398700 res!937615) b!1398697))

(assert (= (and b!1398697 res!937612) b!1398703))

(assert (= (and b!1398703 res!937610) b!1398704))

(assert (= (and b!1398704 res!937616) b!1398699))

(assert (= (and b!1398699 res!937614) b!1398705))

(assert (= (and b!1398699 (not res!937613)) b!1398701))

(assert (= (and b!1398701 (not res!937617)) b!1398702))

(declare-fun m!1285931 () Bool)

(assert (=> b!1398703 m!1285931))

(declare-fun m!1285933 () Bool)

(assert (=> b!1398704 m!1285933))

(declare-fun m!1285935 () Bool)

(assert (=> b!1398699 m!1285935))

(declare-fun m!1285937 () Bool)

(assert (=> b!1398699 m!1285937))

(assert (=> b!1398699 m!1285935))

(declare-fun m!1285939 () Bool)

(assert (=> b!1398699 m!1285939))

(declare-fun m!1285941 () Bool)

(assert (=> b!1398699 m!1285941))

(assert (=> b!1398699 m!1285935))

(declare-fun m!1285943 () Bool)

(assert (=> b!1398699 m!1285943))

(declare-fun m!1285945 () Bool)

(assert (=> start!120128 m!1285945))

(declare-fun m!1285947 () Bool)

(assert (=> start!120128 m!1285947))

(declare-fun m!1285949 () Bool)

(assert (=> b!1398701 m!1285949))

(declare-fun m!1285951 () Bool)

(assert (=> b!1398701 m!1285951))

(assert (=> b!1398701 m!1285949))

(declare-fun m!1285953 () Bool)

(assert (=> b!1398701 m!1285953))

(declare-fun m!1285955 () Bool)

(assert (=> b!1398701 m!1285955))

(assert (=> b!1398705 m!1285935))

(assert (=> b!1398705 m!1285935))

(declare-fun m!1285957 () Bool)

(assert (=> b!1398705 m!1285957))

(declare-fun m!1285959 () Bool)

(assert (=> b!1398700 m!1285959))

(assert (=> b!1398700 m!1285959))

(declare-fun m!1285961 () Bool)

(assert (=> b!1398700 m!1285961))

(assert (=> b!1398702 m!1285951))

(declare-fun m!1285963 () Bool)

(assert (=> b!1398702 m!1285963))

(declare-fun m!1285965 () Bool)

(assert (=> b!1398702 m!1285965))

(assert (=> b!1398697 m!1285935))

(assert (=> b!1398697 m!1285935))

(declare-fun m!1285967 () Bool)

(assert (=> b!1398697 m!1285967))

(check-sat (not b!1398702) (not b!1398697) (not b!1398699) (not b!1398700) (not b!1398701) (not b!1398703) (not b!1398704) (not b!1398705) (not start!120128))
(check-sat)
(get-model)

(declare-fun d!150943 () Bool)

(assert (=> d!150943 (= (validKeyInArray!0 (select (arr!46182 a!2901) i!1037)) (and (not (= (select (arr!46182 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46182 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1398700 d!150943))

(declare-fun b!1398745 () Bool)

(declare-fun e!791861 () SeekEntryResult!10499)

(declare-fun lt!615127 () SeekEntryResult!10499)

(assert (=> b!1398745 (= e!791861 (Found!10499 (index!44369 lt!615127)))))

(declare-fun e!791859 () SeekEntryResult!10499)

(declare-fun b!1398746 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95657 (_ BitVec 32)) SeekEntryResult!10499)

(assert (=> b!1398746 (= e!791859 (seekKeyOrZeroReturnVacant!0 (x!126009 lt!615127) (index!44369 lt!615127) (index!44369 lt!615127) (select (arr!46182 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1398747 () Bool)

(declare-fun c!130008 () Bool)

(declare-fun lt!615129 () (_ BitVec 64))

(assert (=> b!1398747 (= c!130008 (= lt!615129 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1398747 (= e!791861 e!791859)))

(declare-fun b!1398748 () Bool)

(assert (=> b!1398748 (= e!791859 (MissingZero!10499 (index!44369 lt!615127)))))

(declare-fun b!1398749 () Bool)

(declare-fun e!791860 () SeekEntryResult!10499)

(assert (=> b!1398749 (= e!791860 Undefined!10499)))

(declare-fun d!150945 () Bool)

(declare-fun lt!615128 () SeekEntryResult!10499)

(assert (=> d!150945 (and (or ((_ is Undefined!10499) lt!615128) (not ((_ is Found!10499) lt!615128)) (and (bvsge (index!44368 lt!615128) #b00000000000000000000000000000000) (bvslt (index!44368 lt!615128) (size!46732 a!2901)))) (or ((_ is Undefined!10499) lt!615128) ((_ is Found!10499) lt!615128) (not ((_ is MissingZero!10499) lt!615128)) (and (bvsge (index!44367 lt!615128) #b00000000000000000000000000000000) (bvslt (index!44367 lt!615128) (size!46732 a!2901)))) (or ((_ is Undefined!10499) lt!615128) ((_ is Found!10499) lt!615128) ((_ is MissingZero!10499) lt!615128) (not ((_ is MissingVacant!10499) lt!615128)) (and (bvsge (index!44370 lt!615128) #b00000000000000000000000000000000) (bvslt (index!44370 lt!615128) (size!46732 a!2901)))) (or ((_ is Undefined!10499) lt!615128) (ite ((_ is Found!10499) lt!615128) (= (select (arr!46182 a!2901) (index!44368 lt!615128)) (select (arr!46182 a!2901) j!112)) (ite ((_ is MissingZero!10499) lt!615128) (= (select (arr!46182 a!2901) (index!44367 lt!615128)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10499) lt!615128) (= (select (arr!46182 a!2901) (index!44370 lt!615128)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150945 (= lt!615128 e!791860)))

(declare-fun c!130006 () Bool)

(assert (=> d!150945 (= c!130006 (and ((_ is Intermediate!10499) lt!615127) (undefined!11311 lt!615127)))))

(assert (=> d!150945 (= lt!615127 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46182 a!2901) j!112) mask!2840) (select (arr!46182 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150945 (validMask!0 mask!2840)))

(assert (=> d!150945 (= (seekEntryOrOpen!0 (select (arr!46182 a!2901) j!112) a!2901 mask!2840) lt!615128)))

(declare-fun b!1398750 () Bool)

(assert (=> b!1398750 (= e!791860 e!791861)))

(assert (=> b!1398750 (= lt!615129 (select (arr!46182 a!2901) (index!44369 lt!615127)))))

(declare-fun c!130007 () Bool)

(assert (=> b!1398750 (= c!130007 (= lt!615129 (select (arr!46182 a!2901) j!112)))))

(assert (= (and d!150945 c!130006) b!1398749))

(assert (= (and d!150945 (not c!130006)) b!1398750))

(assert (= (and b!1398750 c!130007) b!1398745))

(assert (= (and b!1398750 (not c!130007)) b!1398747))

(assert (= (and b!1398747 c!130008) b!1398748))

(assert (= (and b!1398747 (not c!130008)) b!1398746))

(assert (=> b!1398746 m!1285935))

(declare-fun m!1286007 () Bool)

(assert (=> b!1398746 m!1286007))

(declare-fun m!1286009 () Bool)

(assert (=> d!150945 m!1286009))

(assert (=> d!150945 m!1285945))

(assert (=> d!150945 m!1285937))

(assert (=> d!150945 m!1285935))

(declare-fun m!1286011 () Bool)

(assert (=> d!150945 m!1286011))

(assert (=> d!150945 m!1285935))

(assert (=> d!150945 m!1285937))

(declare-fun m!1286013 () Bool)

(assert (=> d!150945 m!1286013))

(declare-fun m!1286015 () Bool)

(assert (=> d!150945 m!1286015))

(declare-fun m!1286017 () Bool)

(assert (=> b!1398750 m!1286017))

(assert (=> b!1398705 d!150945))

(declare-fun b!1398789 () Bool)

(declare-fun lt!615150 () SeekEntryResult!10499)

(assert (=> b!1398789 (and (bvsge (index!44369 lt!615150) #b00000000000000000000000000000000) (bvslt (index!44369 lt!615150) (size!46732 (array!95658 (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901)))))))

(declare-fun res!937658 () Bool)

(assert (=> b!1398789 (= res!937658 (= (select (arr!46182 (array!95658 (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901))) (index!44369 lt!615150)) lt!615100))))

(declare-fun e!791883 () Bool)

(assert (=> b!1398789 (=> res!937658 e!791883)))

(declare-fun e!791889 () Bool)

(assert (=> b!1398789 (= e!791889 e!791883)))

(declare-fun b!1398790 () Bool)

(assert (=> b!1398790 (and (bvsge (index!44369 lt!615150) #b00000000000000000000000000000000) (bvslt (index!44369 lt!615150) (size!46732 (array!95658 (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901)))))))

(declare-fun res!937660 () Bool)

(assert (=> b!1398790 (= res!937660 (= (select (arr!46182 (array!95658 (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901))) (index!44369 lt!615150)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1398790 (=> res!937660 e!791883)))

(declare-fun b!1398791 () Bool)

(declare-fun e!791885 () SeekEntryResult!10499)

(declare-fun e!791888 () SeekEntryResult!10499)

(assert (=> b!1398791 (= e!791885 e!791888)))

(declare-fun c!130023 () Bool)

(declare-fun lt!615149 () (_ BitVec 64))

(assert (=> b!1398791 (= c!130023 (or (= lt!615149 lt!615100) (= (bvadd lt!615149 lt!615149) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1398792 () Bool)

(declare-fun e!791886 () Bool)

(assert (=> b!1398792 (= e!791886 e!791889)))

(declare-fun res!937659 () Bool)

(assert (=> b!1398792 (= res!937659 (and ((_ is Intermediate!10499) lt!615150) (not (undefined!11311 lt!615150)) (bvslt (x!126009 lt!615150) #b01111111111111111111111111111110) (bvsge (x!126009 lt!615150) #b00000000000000000000000000000000) (bvsge (x!126009 lt!615150) #b00000000000000000000000000000000)))))

(assert (=> b!1398792 (=> (not res!937659) (not e!791889))))

(declare-fun d!150949 () Bool)

(assert (=> d!150949 e!791886))

(declare-fun c!130024 () Bool)

(assert (=> d!150949 (= c!130024 (and ((_ is Intermediate!10499) lt!615150) (undefined!11311 lt!615150)))))

(assert (=> d!150949 (= lt!615150 e!791885)))

(declare-fun c!130020 () Bool)

(assert (=> d!150949 (= c!130020 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150949 (= lt!615149 (select (arr!46182 (array!95658 (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901))) (toIndex!0 lt!615100 mask!2840)))))

(assert (=> d!150949 (validMask!0 mask!2840)))

(assert (=> d!150949 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615100 mask!2840) lt!615100 (array!95658 (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901)) mask!2840) lt!615150)))

(declare-fun b!1398793 () Bool)

(assert (=> b!1398793 (= e!791888 (Intermediate!10499 false (toIndex!0 lt!615100 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1398794 () Bool)

(assert (=> b!1398794 (and (bvsge (index!44369 lt!615150) #b00000000000000000000000000000000) (bvslt (index!44369 lt!615150) (size!46732 (array!95658 (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901)))))))

(assert (=> b!1398794 (= e!791883 (= (select (arr!46182 (array!95658 (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901))) (index!44369 lt!615150)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1398795 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398795 (= e!791888 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!615100 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!615100 (array!95658 (store (arr!46182 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46732 a!2901)) mask!2840))))

(declare-fun b!1398796 () Bool)

(assert (=> b!1398796 (= e!791885 (Intermediate!10499 true (toIndex!0 lt!615100 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1398797 () Bool)

(assert (=> b!1398797 (= e!791886 (bvsge (x!126009 lt!615150) #b01111111111111111111111111111110))))

(assert (= (and d!150949 c!130020) b!1398796))

(assert (= (and d!150949 (not c!130020)) b!1398791))

(assert (= (and b!1398791 c!130023) b!1398793))

(assert (= (and b!1398791 (not c!130023)) b!1398795))

(assert (= (and d!150949 c!130024) b!1398797))

(assert (= (and d!150949 (not c!130024)) b!1398792))

(assert (= (and b!1398792 res!937659) b!1398789))

(assert (= (and b!1398789 (not res!937658)) b!1398790))

(assert (= (and b!1398790 (not res!937660)) b!1398794))

(assert (=> b!1398795 m!1285949))

(declare-fun m!1286031 () Bool)

(assert (=> b!1398795 m!1286031))

(assert (=> b!1398795 m!1286031))

(declare-fun m!1286033 () Bool)

(assert (=> b!1398795 m!1286033))

(declare-fun m!1286035 () Bool)

(assert (=> b!1398794 m!1286035))

(assert (=> b!1398790 m!1286035))

(assert (=> b!1398789 m!1286035))

(assert (=> d!150949 m!1285949))

(declare-fun m!1286037 () Bool)

(assert (=> d!150949 m!1286037))

(assert (=> d!150949 m!1285945))

(assert (=> b!1398701 d!150949))

(declare-fun d!150961 () Bool)

(declare-fun lt!615159 () (_ BitVec 32))

(declare-fun lt!615158 () (_ BitVec 32))

(assert (=> d!150961 (= lt!615159 (bvmul (bvxor lt!615158 (bvlshr lt!615158 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150961 (= lt!615158 ((_ extract 31 0) (bvand (bvxor lt!615100 (bvlshr lt!615100 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150961 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!937661 (let ((h!33941 ((_ extract 31 0) (bvand (bvxor lt!615100 (bvlshr lt!615100 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126012 (bvmul (bvxor h!33941 (bvlshr h!33941 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126012 (bvlshr x!126012 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!937661 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!937661 #b00000000000000000000000000000000))))))

(assert (=> d!150961 (= (toIndex!0 lt!615100 mask!2840) (bvand (bvxor lt!615159 (bvlshr lt!615159 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1398701 d!150961))

(declare-fun d!150965 () Bool)

(assert (=> d!150965 (and (not (undefined!11311 lt!615098)) (= (index!44369 lt!615098) i!1037) (bvslt (x!126009 lt!615098) (x!126009 lt!615101)))))

(declare-fun lt!615165 () Unit!47002)

(declare-fun choose!62 (array!95657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47002)

(assert (=> d!150965 (= lt!615165 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615099 (x!126009 lt!615101) (index!44369 lt!615101) (x!126009 lt!615098) (index!44369 lt!615098) (undefined!11311 lt!615098) mask!2840))))

(assert (=> d!150965 (validMask!0 mask!2840)))

(assert (=> d!150965 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615099 (x!126009 lt!615101) (index!44369 lt!615101) (x!126009 lt!615098) (index!44369 lt!615098) (undefined!11311 lt!615098) mask!2840) lt!615165)))

(declare-fun bs!40722 () Bool)

(assert (= bs!40722 d!150965))

(declare-fun m!1286053 () Bool)

(assert (=> bs!40722 m!1286053))

(assert (=> bs!40722 m!1285945))

(assert (=> b!1398702 d!150965))

(declare-fun d!150969 () Bool)

(assert (=> d!150969 (= (validKeyInArray!0 (select (arr!46182 a!2901) j!112)) (and (not (= (select (arr!46182 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46182 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1398697 d!150969))

(declare-fun d!150971 () Bool)

(assert (=> d!150971 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120128 d!150971))

(declare-fun d!150977 () Bool)

(assert (=> d!150977 (= (array_inv!35210 a!2901) (bvsge (size!46732 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120128 d!150977))

(declare-fun b!1398864 () Bool)

(declare-fun e!791936 () Bool)

(declare-fun call!66877 () Bool)

(assert (=> b!1398864 (= e!791936 call!66877)))

(declare-fun d!150979 () Bool)

(declare-fun res!937685 () Bool)

(declare-fun e!791934 () Bool)

(assert (=> d!150979 (=> res!937685 e!791934)))

(assert (=> d!150979 (= res!937685 (bvsge #b00000000000000000000000000000000 (size!46732 a!2901)))))

(assert (=> d!150979 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!791934)))

(declare-fun bm!66874 () Bool)

(assert (=> bm!66874 (= call!66877 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1398865 () Bool)

(declare-fun e!791935 () Bool)

(assert (=> b!1398865 (= e!791936 e!791935)))

(declare-fun lt!615183 () (_ BitVec 64))

(assert (=> b!1398865 (= lt!615183 (select (arr!46182 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!615181 () Unit!47002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95657 (_ BitVec 64) (_ BitVec 32)) Unit!47002)

(assert (=> b!1398865 (= lt!615181 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615183 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1398865 (arrayContainsKey!0 a!2901 lt!615183 #b00000000000000000000000000000000)))

(declare-fun lt!615182 () Unit!47002)

(assert (=> b!1398865 (= lt!615182 lt!615181)))

(declare-fun res!937684 () Bool)

(assert (=> b!1398865 (= res!937684 (= (seekEntryOrOpen!0 (select (arr!46182 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10499 #b00000000000000000000000000000000)))))

(assert (=> b!1398865 (=> (not res!937684) (not e!791935))))

(declare-fun b!1398866 () Bool)

(assert (=> b!1398866 (= e!791935 call!66877)))

(declare-fun b!1398867 () Bool)

(assert (=> b!1398867 (= e!791934 e!791936)))

(declare-fun c!130047 () Bool)

(assert (=> b!1398867 (= c!130047 (validKeyInArray!0 (select (arr!46182 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150979 (not res!937685)) b!1398867))

(assert (= (and b!1398867 c!130047) b!1398865))

(assert (= (and b!1398867 (not c!130047)) b!1398864))

(assert (= (and b!1398865 res!937684) b!1398866))

(assert (= (or b!1398866 b!1398864) bm!66874))

(declare-fun m!1286079 () Bool)

(assert (=> bm!66874 m!1286079))

(declare-fun m!1286081 () Bool)

(assert (=> b!1398865 m!1286081))

(declare-fun m!1286083 () Bool)

(assert (=> b!1398865 m!1286083))

(declare-fun m!1286085 () Bool)

(assert (=> b!1398865 m!1286085))

(assert (=> b!1398865 m!1286081))

(declare-fun m!1286087 () Bool)

(assert (=> b!1398865 m!1286087))

(assert (=> b!1398867 m!1286081))

(assert (=> b!1398867 m!1286081))

(declare-fun m!1286089 () Bool)

(assert (=> b!1398867 m!1286089))

(assert (=> b!1398703 d!150979))

(declare-fun d!150989 () Bool)

(declare-fun res!937692 () Bool)

(declare-fun e!791946 () Bool)

(assert (=> d!150989 (=> res!937692 e!791946)))

(assert (=> d!150989 (= res!937692 (bvsge #b00000000000000000000000000000000 (size!46732 a!2901)))))

(assert (=> d!150989 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32698) e!791946)))

(declare-fun bm!66877 () Bool)

(declare-fun call!66880 () Bool)

(declare-fun c!130050 () Bool)

(assert (=> bm!66877 (= call!66880 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130050 (Cons!32697 (select (arr!46182 a!2901) #b00000000000000000000000000000000) Nil!32698) Nil!32698)))))

(declare-fun b!1398878 () Bool)

(declare-fun e!791948 () Bool)

(declare-fun contains!9783 (List!32701 (_ BitVec 64)) Bool)

(assert (=> b!1398878 (= e!791948 (contains!9783 Nil!32698 (select (arr!46182 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1398879 () Bool)

(declare-fun e!791947 () Bool)

(assert (=> b!1398879 (= e!791946 e!791947)))

(declare-fun res!937694 () Bool)

(assert (=> b!1398879 (=> (not res!937694) (not e!791947))))

(assert (=> b!1398879 (= res!937694 (not e!791948))))

(declare-fun res!937693 () Bool)

(assert (=> b!1398879 (=> (not res!937693) (not e!791948))))

(assert (=> b!1398879 (= res!937693 (validKeyInArray!0 (select (arr!46182 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1398880 () Bool)

(declare-fun e!791945 () Bool)

(assert (=> b!1398880 (= e!791947 e!791945)))

(assert (=> b!1398880 (= c!130050 (validKeyInArray!0 (select (arr!46182 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1398881 () Bool)

(assert (=> b!1398881 (= e!791945 call!66880)))

(declare-fun b!1398882 () Bool)

(assert (=> b!1398882 (= e!791945 call!66880)))

(assert (= (and d!150989 (not res!937692)) b!1398879))

(assert (= (and b!1398879 res!937693) b!1398878))

(assert (= (and b!1398879 res!937694) b!1398880))

(assert (= (and b!1398880 c!130050) b!1398882))

(assert (= (and b!1398880 (not c!130050)) b!1398881))

(assert (= (or b!1398882 b!1398881) bm!66877))

(assert (=> bm!66877 m!1286081))

(declare-fun m!1286093 () Bool)

(assert (=> bm!66877 m!1286093))

(assert (=> b!1398878 m!1286081))

(assert (=> b!1398878 m!1286081))

(declare-fun m!1286095 () Bool)

(assert (=> b!1398878 m!1286095))

(assert (=> b!1398879 m!1286081))

(assert (=> b!1398879 m!1286081))

(assert (=> b!1398879 m!1286089))

(assert (=> b!1398880 m!1286081))

(assert (=> b!1398880 m!1286081))

(assert (=> b!1398880 m!1286089))

(assert (=> b!1398704 d!150989))

(declare-fun b!1398887 () Bool)

(declare-fun e!791953 () Bool)

(declare-fun call!66881 () Bool)

(assert (=> b!1398887 (= e!791953 call!66881)))

(declare-fun d!150993 () Bool)

(declare-fun res!937698 () Bool)

(declare-fun e!791951 () Bool)

(assert (=> d!150993 (=> res!937698 e!791951)))

(assert (=> d!150993 (= res!937698 (bvsge j!112 (size!46732 a!2901)))))

(assert (=> d!150993 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!791951)))

(declare-fun bm!66878 () Bool)

(assert (=> bm!66878 (= call!66881 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1398888 () Bool)

(declare-fun e!791952 () Bool)

(assert (=> b!1398888 (= e!791953 e!791952)))

(declare-fun lt!615189 () (_ BitVec 64))

(assert (=> b!1398888 (= lt!615189 (select (arr!46182 a!2901) j!112))))

(declare-fun lt!615187 () Unit!47002)

(assert (=> b!1398888 (= lt!615187 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615189 j!112))))

(assert (=> b!1398888 (arrayContainsKey!0 a!2901 lt!615189 #b00000000000000000000000000000000)))

(declare-fun lt!615188 () Unit!47002)

(assert (=> b!1398888 (= lt!615188 lt!615187)))

(declare-fun res!937697 () Bool)

(assert (=> b!1398888 (= res!937697 (= (seekEntryOrOpen!0 (select (arr!46182 a!2901) j!112) a!2901 mask!2840) (Found!10499 j!112)))))

(assert (=> b!1398888 (=> (not res!937697) (not e!791952))))

(declare-fun b!1398889 () Bool)

(assert (=> b!1398889 (= e!791952 call!66881)))

(declare-fun b!1398891 () Bool)

(assert (=> b!1398891 (= e!791951 e!791953)))

(declare-fun c!130051 () Bool)

(assert (=> b!1398891 (= c!130051 (validKeyInArray!0 (select (arr!46182 a!2901) j!112)))))

(assert (= (and d!150993 (not res!937698)) b!1398891))

(assert (= (and b!1398891 c!130051) b!1398888))

(assert (= (and b!1398891 (not c!130051)) b!1398887))

(assert (= (and b!1398888 res!937697) b!1398889))

(assert (= (or b!1398889 b!1398887) bm!66878))

(declare-fun m!1286097 () Bool)

(assert (=> bm!66878 m!1286097))

(assert (=> b!1398888 m!1285935))

(declare-fun m!1286099 () Bool)

(assert (=> b!1398888 m!1286099))

(declare-fun m!1286101 () Bool)

(assert (=> b!1398888 m!1286101))

(assert (=> b!1398888 m!1285935))

(assert (=> b!1398888 m!1285957))

(assert (=> b!1398891 m!1285935))

(assert (=> b!1398891 m!1285935))

(assert (=> b!1398891 m!1285967))

(assert (=> b!1398699 d!150993))

(declare-fun d!150995 () Bool)

(assert (=> d!150995 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!615201 () Unit!47002)

(declare-fun choose!38 (array!95657 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47002)

(assert (=> d!150995 (= lt!615201 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150995 (validMask!0 mask!2840)))

(assert (=> d!150995 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!615201)))

(declare-fun bs!40724 () Bool)

(assert (= bs!40724 d!150995))

(assert (=> bs!40724 m!1285939))

(declare-fun m!1286109 () Bool)

(assert (=> bs!40724 m!1286109))

(assert (=> bs!40724 m!1285945))

(assert (=> b!1398699 d!150995))

(declare-fun b!1398899 () Bool)

(declare-fun lt!615207 () SeekEntryResult!10499)

(assert (=> b!1398899 (and (bvsge (index!44369 lt!615207) #b00000000000000000000000000000000) (bvslt (index!44369 lt!615207) (size!46732 a!2901)))))

(declare-fun res!937703 () Bool)

(assert (=> b!1398899 (= res!937703 (= (select (arr!46182 a!2901) (index!44369 lt!615207)) (select (arr!46182 a!2901) j!112)))))

(declare-fun e!791961 () Bool)

(assert (=> b!1398899 (=> res!937703 e!791961)))

(declare-fun e!791965 () Bool)

(assert (=> b!1398899 (= e!791965 e!791961)))

(declare-fun b!1398900 () Bool)

(assert (=> b!1398900 (and (bvsge (index!44369 lt!615207) #b00000000000000000000000000000000) (bvslt (index!44369 lt!615207) (size!46732 a!2901)))))

(declare-fun res!937705 () Bool)

(assert (=> b!1398900 (= res!937705 (= (select (arr!46182 a!2901) (index!44369 lt!615207)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1398900 (=> res!937705 e!791961)))

(declare-fun b!1398901 () Bool)

(declare-fun e!791962 () SeekEntryResult!10499)

(declare-fun e!791964 () SeekEntryResult!10499)

(assert (=> b!1398901 (= e!791962 e!791964)))

(declare-fun c!130056 () Bool)

(declare-fun lt!615202 () (_ BitVec 64))

(assert (=> b!1398901 (= c!130056 (or (= lt!615202 (select (arr!46182 a!2901) j!112)) (= (bvadd lt!615202 lt!615202) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1398902 () Bool)

(declare-fun e!791963 () Bool)

(assert (=> b!1398902 (= e!791963 e!791965)))

(declare-fun res!937704 () Bool)

(assert (=> b!1398902 (= res!937704 (and ((_ is Intermediate!10499) lt!615207) (not (undefined!11311 lt!615207)) (bvslt (x!126009 lt!615207) #b01111111111111111111111111111110) (bvsge (x!126009 lt!615207) #b00000000000000000000000000000000) (bvsge (x!126009 lt!615207) #b00000000000000000000000000000000)))))

(assert (=> b!1398902 (=> (not res!937704) (not e!791965))))

(declare-fun d!150999 () Bool)

(assert (=> d!150999 e!791963))

(declare-fun c!130057 () Bool)

(assert (=> d!150999 (= c!130057 (and ((_ is Intermediate!10499) lt!615207) (undefined!11311 lt!615207)))))

(assert (=> d!150999 (= lt!615207 e!791962)))

(declare-fun c!130055 () Bool)

(assert (=> d!150999 (= c!130055 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150999 (= lt!615202 (select (arr!46182 a!2901) lt!615099))))

(assert (=> d!150999 (validMask!0 mask!2840)))

(assert (=> d!150999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615099 (select (arr!46182 a!2901) j!112) a!2901 mask!2840) lt!615207)))

(declare-fun b!1398903 () Bool)

(assert (=> b!1398903 (= e!791964 (Intermediate!10499 false lt!615099 #b00000000000000000000000000000000))))

(declare-fun b!1398904 () Bool)

(assert (=> b!1398904 (and (bvsge (index!44369 lt!615207) #b00000000000000000000000000000000) (bvslt (index!44369 lt!615207) (size!46732 a!2901)))))

(assert (=> b!1398904 (= e!791961 (= (select (arr!46182 a!2901) (index!44369 lt!615207)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1398905 () Bool)

(assert (=> b!1398905 (= e!791964 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!615099 #b00000000000000000000000000000000 mask!2840) (select (arr!46182 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1398906 () Bool)

(assert (=> b!1398906 (= e!791962 (Intermediate!10499 true lt!615099 #b00000000000000000000000000000000))))

(declare-fun b!1398907 () Bool)

(assert (=> b!1398907 (= e!791963 (bvsge (x!126009 lt!615207) #b01111111111111111111111111111110))))

(assert (= (and d!150999 c!130055) b!1398906))

(assert (= (and d!150999 (not c!130055)) b!1398901))

(assert (= (and b!1398901 c!130056) b!1398903))

(assert (= (and b!1398901 (not c!130056)) b!1398905))

(assert (= (and d!150999 c!130057) b!1398907))

(assert (= (and d!150999 (not c!130057)) b!1398902))

(assert (= (and b!1398902 res!937704) b!1398899))

(assert (= (and b!1398899 (not res!937703)) b!1398900))

(assert (= (and b!1398900 (not res!937705)) b!1398904))

(declare-fun m!1286111 () Bool)

(assert (=> b!1398905 m!1286111))

(assert (=> b!1398905 m!1286111))

(assert (=> b!1398905 m!1285935))

(declare-fun m!1286113 () Bool)

(assert (=> b!1398905 m!1286113))

(declare-fun m!1286115 () Bool)

(assert (=> b!1398904 m!1286115))

(assert (=> b!1398900 m!1286115))

(assert (=> b!1398899 m!1286115))

(declare-fun m!1286117 () Bool)

(assert (=> d!150999 m!1286117))

(assert (=> d!150999 m!1285945))

(assert (=> b!1398699 d!150999))

(declare-fun d!151001 () Bool)

(declare-fun lt!615209 () (_ BitVec 32))

(declare-fun lt!615208 () (_ BitVec 32))

(assert (=> d!151001 (= lt!615209 (bvmul (bvxor lt!615208 (bvlshr lt!615208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151001 (= lt!615208 ((_ extract 31 0) (bvand (bvxor (select (arr!46182 a!2901) j!112) (bvlshr (select (arr!46182 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151001 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!937661 (let ((h!33941 ((_ extract 31 0) (bvand (bvxor (select (arr!46182 a!2901) j!112) (bvlshr (select (arr!46182 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126012 (bvmul (bvxor h!33941 (bvlshr h!33941 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126012 (bvlshr x!126012 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!937661 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!937661 #b00000000000000000000000000000000))))))

(assert (=> d!151001 (= (toIndex!0 (select (arr!46182 a!2901) j!112) mask!2840) (bvand (bvxor lt!615209 (bvlshr lt!615209 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1398699 d!151001))

(check-sat (not b!1398879) (not b!1398746) (not b!1398878) (not bm!66874) (not b!1398865) (not d!150999) (not bm!66877) (not b!1398880) (not d!150949) (not b!1398888) (not b!1398891) (not d!150965) (not d!150995) (not b!1398867) (not d!150945) (not b!1398795) (not bm!66878) (not b!1398905))
(check-sat)
