; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120130 () Bool)

(assert start!120130)

(declare-fun b!1398724 () Bool)

(declare-fun e!791852 () Bool)

(declare-fun e!791848 () Bool)

(assert (=> b!1398724 (= e!791852 e!791848)))

(declare-fun res!937642 () Bool)

(assert (=> b!1398724 (=> res!937642 e!791848)))

(declare-datatypes ((SeekEntryResult!10500 0))(
  ( (MissingZero!10500 (index!44371 (_ BitVec 32))) (Found!10500 (index!44372 (_ BitVec 32))) (Intermediate!10500 (undefined!11312 Bool) (index!44373 (_ BitVec 32)) (x!126010 (_ BitVec 32))) (Undefined!10500) (MissingVacant!10500 (index!44374 (_ BitVec 32))) )
))
(declare-fun lt!615120 () SeekEntryResult!10500)

(declare-fun lt!615118 () SeekEntryResult!10500)

(assert (=> b!1398724 (= res!937642 (or (= lt!615120 lt!615118) (not (is-Intermediate!10500 lt!615118))))))

(declare-datatypes ((array!95659 0))(
  ( (array!95660 (arr!46183 (Array (_ BitVec 32) (_ BitVec 64))) (size!46733 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95659)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!615117 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95659 (_ BitVec 32)) SeekEntryResult!10500)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398724 (= lt!615118 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615117 mask!2840) lt!615117 (array!95660 (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46733 a!2901)) mask!2840))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1398724 (= lt!615117 (select (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(declare-fun b!1398725 () Bool)

(declare-fun res!937637 () Bool)

(declare-fun e!791849 () Bool)

(assert (=> b!1398725 (=> (not res!937637) (not e!791849))))

(assert (=> b!1398725 (= res!937637 (and (= (size!46733 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46733 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46733 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!937639 () Bool)

(assert (=> start!120130 (=> (not res!937639) (not e!791849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120130 (= res!937639 (validMask!0 mask!2840))))

(assert (=> start!120130 e!791849))

(assert (=> start!120130 true))

(declare-fun array_inv!35211 (array!95659) Bool)

(assert (=> start!120130 (array_inv!35211 a!2901)))

(declare-fun b!1398726 () Bool)

(declare-fun res!937640 () Bool)

(assert (=> b!1398726 (=> (not res!937640) (not e!791849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1398726 (= res!937640 (validKeyInArray!0 (select (arr!46183 a!2901) i!1037)))))

(declare-fun b!1398727 () Bool)

(assert (=> b!1398727 (= e!791848 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvslt (index!44373 lt!615118) #b00000000000000000000000000000000) (bvsge (index!44373 lt!615118) (bvadd #b00000000000000000000000000000001 mask!2840)) (and (bvsle (x!126010 lt!615118) #b01111111111111111111111111111110) (bvsge (x!126010 lt!615118) #b00000000000000000000000000000000))))))

(assert (=> b!1398727 (and (not (undefined!11312 lt!615118)) (= (index!44373 lt!615118) i!1037) (bvslt (x!126010 lt!615118) (x!126010 lt!615120)) (= (select (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44373 lt!615118)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!47004 0))(
  ( (Unit!47005) )
))
(declare-fun lt!615119 () Unit!47004)

(declare-fun lt!615116 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47004)

(assert (=> b!1398727 (= lt!615119 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615116 (x!126010 lt!615120) (index!44373 lt!615120) (x!126010 lt!615118) (index!44373 lt!615118) (undefined!11312 lt!615118) mask!2840))))

(declare-fun b!1398728 () Bool)

(assert (=> b!1398728 (= e!791849 (not e!791852))))

(declare-fun res!937645 () Bool)

(assert (=> b!1398728 (=> res!937645 e!791852)))

(assert (=> b!1398728 (= res!937645 (or (not (is-Intermediate!10500 lt!615120)) (undefined!11312 lt!615120)))))

(declare-fun e!791850 () Bool)

(assert (=> b!1398728 e!791850))

(declare-fun res!937644 () Bool)

(assert (=> b!1398728 (=> (not res!937644) (not e!791850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95659 (_ BitVec 32)) Bool)

(assert (=> b!1398728 (= res!937644 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615115 () Unit!47004)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47004)

(assert (=> b!1398728 (= lt!615115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1398728 (= lt!615120 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615116 (select (arr!46183 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1398728 (= lt!615116 (toIndex!0 (select (arr!46183 a!2901) j!112) mask!2840))))

(declare-fun b!1398729 () Bool)

(declare-fun res!937641 () Bool)

(assert (=> b!1398729 (=> (not res!937641) (not e!791849))))

(assert (=> b!1398729 (= res!937641 (validKeyInArray!0 (select (arr!46183 a!2901) j!112)))))

(declare-fun b!1398730 () Bool)

(declare-fun res!937643 () Bool)

(assert (=> b!1398730 (=> (not res!937643) (not e!791849))))

(assert (=> b!1398730 (= res!937643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1398731 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95659 (_ BitVec 32)) SeekEntryResult!10500)

(assert (=> b!1398731 (= e!791850 (= (seekEntryOrOpen!0 (select (arr!46183 a!2901) j!112) a!2901 mask!2840) (Found!10500 j!112)))))

(declare-fun b!1398732 () Bool)

(declare-fun res!937638 () Bool)

(assert (=> b!1398732 (=> (not res!937638) (not e!791849))))

(declare-datatypes ((List!32702 0))(
  ( (Nil!32699) (Cons!32698 (h!33940 (_ BitVec 64)) (t!47396 List!32702)) )
))
(declare-fun arrayNoDuplicates!0 (array!95659 (_ BitVec 32) List!32702) Bool)

(assert (=> b!1398732 (= res!937638 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32699))))

(assert (= (and start!120130 res!937639) b!1398725))

(assert (= (and b!1398725 res!937637) b!1398726))

(assert (= (and b!1398726 res!937640) b!1398729))

(assert (= (and b!1398729 res!937641) b!1398730))

(assert (= (and b!1398730 res!937643) b!1398732))

(assert (= (and b!1398732 res!937638) b!1398728))

(assert (= (and b!1398728 res!937644) b!1398731))

(assert (= (and b!1398728 (not res!937645)) b!1398724))

(assert (= (and b!1398724 (not res!937642)) b!1398727))

(declare-fun m!1285969 () Bool)

(assert (=> b!1398729 m!1285969))

(assert (=> b!1398729 m!1285969))

(declare-fun m!1285971 () Bool)

(assert (=> b!1398729 m!1285971))

(declare-fun m!1285973 () Bool)

(assert (=> b!1398724 m!1285973))

(declare-fun m!1285975 () Bool)

(assert (=> b!1398724 m!1285975))

(assert (=> b!1398724 m!1285973))

(declare-fun m!1285977 () Bool)

(assert (=> b!1398724 m!1285977))

(declare-fun m!1285979 () Bool)

(assert (=> b!1398724 m!1285979))

(declare-fun m!1285981 () Bool)

(assert (=> b!1398726 m!1285981))

(assert (=> b!1398726 m!1285981))

(declare-fun m!1285983 () Bool)

(assert (=> b!1398726 m!1285983))

(declare-fun m!1285985 () Bool)

(assert (=> b!1398732 m!1285985))

(assert (=> b!1398731 m!1285969))

(assert (=> b!1398731 m!1285969))

(declare-fun m!1285987 () Bool)

(assert (=> b!1398731 m!1285987))

(assert (=> b!1398728 m!1285969))

(declare-fun m!1285989 () Bool)

(assert (=> b!1398728 m!1285989))

(assert (=> b!1398728 m!1285969))

(declare-fun m!1285991 () Bool)

(assert (=> b!1398728 m!1285991))

(assert (=> b!1398728 m!1285969))

(declare-fun m!1285993 () Bool)

(assert (=> b!1398728 m!1285993))

(declare-fun m!1285995 () Bool)

(assert (=> b!1398728 m!1285995))

(declare-fun m!1285997 () Bool)

(assert (=> b!1398730 m!1285997))

(assert (=> b!1398727 m!1285975))

(declare-fun m!1285999 () Bool)

(assert (=> b!1398727 m!1285999))

(declare-fun m!1286001 () Bool)

(assert (=> b!1398727 m!1286001))

(declare-fun m!1286003 () Bool)

(assert (=> start!120130 m!1286003))

(declare-fun m!1286005 () Bool)

(assert (=> start!120130 m!1286005))

(push 1)

(assert (not b!1398726))

(assert (not b!1398730))

(assert (not b!1398727))

(assert (not b!1398728))

(assert (not b!1398724))

(assert (not b!1398729))

(assert (not start!120130))

(assert (not b!1398731))

(assert (not b!1398732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!150953 () Bool)

(assert (=> d!150953 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120130 d!150953))

(declare-fun d!150955 () Bool)

(assert (=> d!150955 (= (array_inv!35211 a!2901) (bvsge (size!46733 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120130 d!150955))

(declare-fun d!150957 () Bool)

(assert (=> d!150957 (= (validKeyInArray!0 (select (arr!46183 a!2901) i!1037)) (and (not (= (select (arr!46183 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46183 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1398726 d!150957))

(declare-fun b!1398820 () Bool)

(declare-fun e!791902 () SeekEntryResult!10500)

(assert (=> b!1398820 (= e!791902 Undefined!10500)))

(declare-fun d!150959 () Bool)

(declare-fun lt!615172 () SeekEntryResult!10500)

(assert (=> d!150959 (and (or (is-Undefined!10500 lt!615172) (not (is-Found!10500 lt!615172)) (and (bvsge (index!44372 lt!615172) #b00000000000000000000000000000000) (bvslt (index!44372 lt!615172) (size!46733 a!2901)))) (or (is-Undefined!10500 lt!615172) (is-Found!10500 lt!615172) (not (is-MissingZero!10500 lt!615172)) (and (bvsge (index!44371 lt!615172) #b00000000000000000000000000000000) (bvslt (index!44371 lt!615172) (size!46733 a!2901)))) (or (is-Undefined!10500 lt!615172) (is-Found!10500 lt!615172) (is-MissingZero!10500 lt!615172) (not (is-MissingVacant!10500 lt!615172)) (and (bvsge (index!44374 lt!615172) #b00000000000000000000000000000000) (bvslt (index!44374 lt!615172) (size!46733 a!2901)))) (or (is-Undefined!10500 lt!615172) (ite (is-Found!10500 lt!615172) (= (select (arr!46183 a!2901) (index!44372 lt!615172)) (select (arr!46183 a!2901) j!112)) (ite (is-MissingZero!10500 lt!615172) (= (select (arr!46183 a!2901) (index!44371 lt!615172)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10500 lt!615172) (= (select (arr!46183 a!2901) (index!44374 lt!615172)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150959 (= lt!615172 e!791902)))

(declare-fun c!130038 () Bool)

(declare-fun lt!615174 () SeekEntryResult!10500)

(assert (=> d!150959 (= c!130038 (and (is-Intermediate!10500 lt!615174) (undefined!11312 lt!615174)))))

(assert (=> d!150959 (= lt!615174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46183 a!2901) j!112) mask!2840) (select (arr!46183 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150959 (validMask!0 mask!2840)))

(assert (=> d!150959 (= (seekEntryOrOpen!0 (select (arr!46183 a!2901) j!112) a!2901 mask!2840) lt!615172)))

(declare-fun b!1398821 () Bool)

(declare-fun e!791903 () SeekEntryResult!10500)

(assert (=> b!1398821 (= e!791903 (MissingZero!10500 (index!44373 lt!615174)))))

(declare-fun b!1398822 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95659 (_ BitVec 32)) SeekEntryResult!10500)

(assert (=> b!1398822 (= e!791903 (seekKeyOrZeroReturnVacant!0 (x!126010 lt!615174) (index!44373 lt!615174) (index!44373 lt!615174) (select (arr!46183 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1398823 () Bool)

(declare-fun c!130036 () Bool)

(declare-fun lt!615173 () (_ BitVec 64))

(assert (=> b!1398823 (= c!130036 (= lt!615173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!791901 () SeekEntryResult!10500)

(assert (=> b!1398823 (= e!791901 e!791903)))

(declare-fun b!1398824 () Bool)

(assert (=> b!1398824 (= e!791901 (Found!10500 (index!44373 lt!615174)))))

(declare-fun b!1398825 () Bool)

(assert (=> b!1398825 (= e!791902 e!791901)))

(assert (=> b!1398825 (= lt!615173 (select (arr!46183 a!2901) (index!44373 lt!615174)))))

(declare-fun c!130037 () Bool)

(assert (=> b!1398825 (= c!130037 (= lt!615173 (select (arr!46183 a!2901) j!112)))))

(assert (= (and d!150959 c!130038) b!1398820))

(assert (= (and d!150959 (not c!130038)) b!1398825))

(assert (= (and b!1398825 c!130037) b!1398824))

(assert (= (and b!1398825 (not c!130037)) b!1398823))

(assert (= (and b!1398823 c!130036) b!1398821))

(assert (= (and b!1398823 (not c!130036)) b!1398822))

(assert (=> d!150959 m!1286003))

(declare-fun m!1286055 () Bool)

(assert (=> d!150959 m!1286055))

(declare-fun m!1286057 () Bool)

(assert (=> d!150959 m!1286057))

(assert (=> d!150959 m!1285969))

(assert (=> d!150959 m!1285989))

(assert (=> d!150959 m!1285989))

(assert (=> d!150959 m!1285969))

(declare-fun m!1286059 () Bool)

(assert (=> d!150959 m!1286059))

(declare-fun m!1286061 () Bool)

(assert (=> d!150959 m!1286061))

(assert (=> b!1398822 m!1285969))

(declare-fun m!1286063 () Bool)

(assert (=> b!1398822 m!1286063))

(declare-fun m!1286065 () Bool)

(assert (=> b!1398825 m!1286065))

(assert (=> b!1398731 d!150959))

(declare-fun b!1398859 () Bool)

(declare-fun e!791932 () Bool)

(declare-fun call!66876 () Bool)

(assert (=> b!1398859 (= e!791932 call!66876)))

(declare-fun d!150983 () Bool)

(declare-fun res!937682 () Bool)

(declare-fun e!791931 () Bool)

(assert (=> d!150983 (=> res!937682 e!791931)))

(assert (=> d!150983 (= res!937682 (bvsge #b00000000000000000000000000000000 (size!46733 a!2901)))))

(assert (=> d!150983 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32699) e!791931)))

(declare-fun b!1398860 () Bool)

(assert (=> b!1398860 (= e!791932 call!66876)))

(declare-fun b!1398861 () Bool)

(declare-fun e!791933 () Bool)

(assert (=> b!1398861 (= e!791931 e!791933)))

(declare-fun res!937681 () Bool)

(assert (=> b!1398861 (=> (not res!937681) (not e!791933))))

(declare-fun e!791930 () Bool)

(assert (=> b!1398861 (= res!937681 (not e!791930))))

(declare-fun res!937683 () Bool)

(assert (=> b!1398861 (=> (not res!937683) (not e!791930))))

(assert (=> b!1398861 (= res!937683 (validKeyInArray!0 (select (arr!46183 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1398862 () Bool)

(declare-fun contains!9785 (List!32702 (_ BitVec 64)) Bool)

(assert (=> b!1398862 (= e!791930 (contains!9785 Nil!32699 (select (arr!46183 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66873 () Bool)

(declare-fun c!130046 () Bool)

(assert (=> bm!66873 (= call!66876 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130046 (Cons!32698 (select (arr!46183 a!2901) #b00000000000000000000000000000000) Nil!32699) Nil!32699)))))

(declare-fun b!1398863 () Bool)

(assert (=> b!1398863 (= e!791933 e!791932)))

(assert (=> b!1398863 (= c!130046 (validKeyInArray!0 (select (arr!46183 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150983 (not res!937682)) b!1398861))

(assert (= (and b!1398861 res!937683) b!1398862))

(assert (= (and b!1398861 res!937681) b!1398863))

(assert (= (and b!1398863 c!130046) b!1398860))

(assert (= (and b!1398863 (not c!130046)) b!1398859))

(assert (= (or b!1398860 b!1398859) bm!66873))

(declare-fun m!1286071 () Bool)

(assert (=> b!1398861 m!1286071))

(assert (=> b!1398861 m!1286071))

(declare-fun m!1286073 () Bool)

(assert (=> b!1398861 m!1286073))

(assert (=> b!1398862 m!1286071))

(assert (=> b!1398862 m!1286071))

(declare-fun m!1286075 () Bool)

(assert (=> b!1398862 m!1286075))

(assert (=> bm!66873 m!1286071))

(declare-fun m!1286077 () Bool)

(assert (=> bm!66873 m!1286077))

(assert (=> b!1398863 m!1286071))

(assert (=> b!1398863 m!1286071))

(assert (=> b!1398863 m!1286073))

(assert (=> b!1398732 d!150983))

(declare-fun d!150987 () Bool)

(assert (=> d!150987 (and (not (undefined!11312 lt!615118)) (= (index!44373 lt!615118) i!1037) (bvslt (x!126010 lt!615118) (x!126010 lt!615120)))))

(declare-fun lt!615186 () Unit!47004)

(declare-fun choose!62 (array!95659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47004)

(assert (=> d!150987 (= lt!615186 (choose!62 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615116 (x!126010 lt!615120) (index!44373 lt!615120) (x!126010 lt!615118) (index!44373 lt!615118) (undefined!11312 lt!615118) mask!2840))))

(assert (=> d!150987 (validMask!0 mask!2840)))

(assert (=> d!150987 (= (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615116 (x!126010 lt!615120) (index!44373 lt!615120) (x!126010 lt!615118) (index!44373 lt!615118) (undefined!11312 lt!615118) mask!2840) lt!615186)))

(declare-fun bs!40723 () Bool)

(assert (= bs!40723 d!150987))

(declare-fun m!1286091 () Bool)

(assert (=> bs!40723 m!1286091))

(assert (=> bs!40723 m!1286003))

(assert (=> b!1398727 d!150987))

(declare-fun b!1398895 () Bool)

(declare-fun e!791960 () Bool)

(declare-fun call!66884 () Bool)

(assert (=> b!1398895 (= e!791960 call!66884)))

(declare-fun bm!66881 () Bool)

(assert (=> bm!66881 (= call!66884 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1398896 () Bool)

(declare-fun e!791959 () Bool)

(assert (=> b!1398896 (= e!791960 e!791959)))

(declare-fun lt!615197 () (_ BitVec 64))

(assert (=> b!1398896 (= lt!615197 (select (arr!46183 a!2901) j!112))))

(declare-fun lt!615198 () Unit!47004)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95659 (_ BitVec 64) (_ BitVec 32)) Unit!47004)

(assert (=> b!1398896 (= lt!615198 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!615197 j!112))))

(declare-fun arrayContainsKey!0 (array!95659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1398896 (arrayContainsKey!0 a!2901 lt!615197 #b00000000000000000000000000000000)))

(declare-fun lt!615196 () Unit!47004)

(assert (=> b!1398896 (= lt!615196 lt!615198)))

(declare-fun res!937701 () Bool)

(assert (=> b!1398896 (= res!937701 (= (seekEntryOrOpen!0 (select (arr!46183 a!2901) j!112) a!2901 mask!2840) (Found!10500 j!112)))))

(assert (=> b!1398896 (=> (not res!937701) (not e!791959))))

(declare-fun d!150991 () Bool)

(declare-fun res!937702 () Bool)

(declare-fun e!791958 () Bool)

(assert (=> d!150991 (=> res!937702 e!791958)))

(assert (=> d!150991 (= res!937702 (bvsge j!112 (size!46733 a!2901)))))

(assert (=> d!150991 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!791958)))

(declare-fun b!1398897 () Bool)

(assert (=> b!1398897 (= e!791958 e!791960)))

(declare-fun c!130054 () Bool)

(assert (=> b!1398897 (= c!130054 (validKeyInArray!0 (select (arr!46183 a!2901) j!112)))))

(declare-fun b!1398898 () Bool)

(assert (=> b!1398898 (= e!791959 call!66884)))

(assert (= (and d!150991 (not res!937702)) b!1398897))

(assert (= (and b!1398897 c!130054) b!1398896))

(assert (= (and b!1398897 (not c!130054)) b!1398895))

(assert (= (and b!1398896 res!937701) b!1398898))

(assert (= (or b!1398898 b!1398895) bm!66881))

(declare-fun m!1286103 () Bool)

(assert (=> bm!66881 m!1286103))

(assert (=> b!1398896 m!1285969))

(declare-fun m!1286105 () Bool)

(assert (=> b!1398896 m!1286105))

(declare-fun m!1286107 () Bool)

(assert (=> b!1398896 m!1286107))

(assert (=> b!1398896 m!1285969))

(assert (=> b!1398896 m!1285987))

(assert (=> b!1398897 m!1285969))

(assert (=> b!1398897 m!1285969))

(assert (=> b!1398897 m!1285971))

(assert (=> b!1398728 d!150991))

(declare-fun d!150997 () Bool)

(assert (=> d!150997 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!615212 () Unit!47004)

(declare-fun choose!38 (array!95659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47004)

(assert (=> d!150997 (= lt!615212 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150997 (validMask!0 mask!2840)))

(assert (=> d!150997 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!615212)))

(declare-fun bs!40725 () Bool)

(assert (= bs!40725 d!150997))

(assert (=> bs!40725 m!1285995))

(declare-fun m!1286119 () Bool)

(assert (=> bs!40725 m!1286119))

(assert (=> bs!40725 m!1286003))

(assert (=> b!1398728 d!150997))

(declare-fun b!1398966 () Bool)

(declare-fun e!791999 () SeekEntryResult!10500)

(assert (=> b!1398966 (= e!791999 (Intermediate!10500 false lt!615116 #b00000000000000000000000000000000))))

(declare-fun b!1398967 () Bool)

(declare-fun e!792002 () Bool)

(declare-fun e!792003 () Bool)

(assert (=> b!1398967 (= e!792002 e!792003)))

(declare-fun res!937727 () Bool)

(declare-fun lt!615236 () SeekEntryResult!10500)

(assert (=> b!1398967 (= res!937727 (and (is-Intermediate!10500 lt!615236) (not (undefined!11312 lt!615236)) (bvslt (x!126010 lt!615236) #b01111111111111111111111111111110) (bvsge (x!126010 lt!615236) #b00000000000000000000000000000000) (bvsge (x!126010 lt!615236) #b00000000000000000000000000000000)))))

(assert (=> b!1398967 (=> (not res!937727) (not e!792003))))

(declare-fun b!1398968 () Bool)

(assert (=> b!1398968 (= e!792002 (bvsge (x!126010 lt!615236) #b01111111111111111111111111111110))))

(declare-fun b!1398969 () Bool)

(assert (=> b!1398969 (and (bvsge (index!44373 lt!615236) #b00000000000000000000000000000000) (bvslt (index!44373 lt!615236) (size!46733 a!2901)))))

(declare-fun e!792001 () Bool)

(assert (=> b!1398969 (= e!792001 (= (select (arr!46183 a!2901) (index!44373 lt!615236)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1398970 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1398970 (= e!791999 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!615116 #b00000000000000000000000000000000 mask!2840) (select (arr!46183 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1398971 () Bool)

(declare-fun e!792000 () SeekEntryResult!10500)

(assert (=> b!1398971 (= e!792000 (Intermediate!10500 true lt!615116 #b00000000000000000000000000000000))))

(declare-fun b!1398972 () Bool)

(assert (=> b!1398972 (and (bvsge (index!44373 lt!615236) #b00000000000000000000000000000000) (bvslt (index!44373 lt!615236) (size!46733 a!2901)))))

(declare-fun res!937728 () Bool)

(assert (=> b!1398972 (= res!937728 (= (select (arr!46183 a!2901) (index!44373 lt!615236)) (select (arr!46183 a!2901) j!112)))))

(assert (=> b!1398972 (=> res!937728 e!792001)))

(assert (=> b!1398972 (= e!792003 e!792001)))

(declare-fun d!151003 () Bool)

(assert (=> d!151003 e!792002))

(declare-fun c!130078 () Bool)

(assert (=> d!151003 (= c!130078 (and (is-Intermediate!10500 lt!615236) (undefined!11312 lt!615236)))))

(assert (=> d!151003 (= lt!615236 e!792000)))

(declare-fun c!130079 () Bool)

(assert (=> d!151003 (= c!130079 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!615235 () (_ BitVec 64))

(assert (=> d!151003 (= lt!615235 (select (arr!46183 a!2901) lt!615116))))

(assert (=> d!151003 (validMask!0 mask!2840)))

(assert (=> d!151003 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615116 (select (arr!46183 a!2901) j!112) a!2901 mask!2840) lt!615236)))

(declare-fun b!1398973 () Bool)

(assert (=> b!1398973 (and (bvsge (index!44373 lt!615236) #b00000000000000000000000000000000) (bvslt (index!44373 lt!615236) (size!46733 a!2901)))))

(declare-fun res!937729 () Bool)

(assert (=> b!1398973 (= res!937729 (= (select (arr!46183 a!2901) (index!44373 lt!615236)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1398973 (=> res!937729 e!792001)))

(declare-fun b!1398974 () Bool)

(assert (=> b!1398974 (= e!792000 e!791999)))

(declare-fun c!130077 () Bool)

(assert (=> b!1398974 (= c!130077 (or (= lt!615235 (select (arr!46183 a!2901) j!112)) (= (bvadd lt!615235 lt!615235) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!151003 c!130079) b!1398971))

(assert (= (and d!151003 (not c!130079)) b!1398974))

(assert (= (and b!1398974 c!130077) b!1398966))

(assert (= (and b!1398974 (not c!130077)) b!1398970))

(assert (= (and d!151003 c!130078) b!1398968))

(assert (= (and d!151003 (not c!130078)) b!1398967))

(assert (= (and b!1398967 res!937727) b!1398972))

(assert (= (and b!1398972 (not res!937728)) b!1398973))

(assert (= (and b!1398973 (not res!937729)) b!1398969))

(declare-fun m!1286145 () Bool)

(assert (=> d!151003 m!1286145))

(assert (=> d!151003 m!1286003))

(declare-fun m!1286147 () Bool)

(assert (=> b!1398970 m!1286147))

(assert (=> b!1398970 m!1286147))

(assert (=> b!1398970 m!1285969))

(declare-fun m!1286149 () Bool)

(assert (=> b!1398970 m!1286149))

(declare-fun m!1286151 () Bool)

(assert (=> b!1398973 m!1286151))

(assert (=> b!1398969 m!1286151))

(assert (=> b!1398972 m!1286151))

(assert (=> b!1398728 d!151003))

(declare-fun d!151017 () Bool)

(declare-fun lt!615242 () (_ BitVec 32))

(declare-fun lt!615241 () (_ BitVec 32))

(assert (=> d!151017 (= lt!615242 (bvmul (bvxor lt!615241 (bvlshr lt!615241 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151017 (= lt!615241 ((_ extract 31 0) (bvand (bvxor (select (arr!46183 a!2901) j!112) (bvlshr (select (arr!46183 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151017 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!937730 (let ((h!33943 ((_ extract 31 0) (bvand (bvxor (select (arr!46183 a!2901) j!112) (bvlshr (select (arr!46183 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126019 (bvmul (bvxor h!33943 (bvlshr h!33943 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126019 (bvlshr x!126019 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!937730 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!937730 #b00000000000000000000000000000000))))))

(assert (=> d!151017 (= (toIndex!0 (select (arr!46183 a!2901) j!112) mask!2840) (bvand (bvxor lt!615242 (bvlshr lt!615242 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1398728 d!151017))

(declare-fun b!1398975 () Bool)

(declare-fun e!792004 () SeekEntryResult!10500)

(assert (=> b!1398975 (= e!792004 (Intermediate!10500 false (toIndex!0 lt!615117 mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1398976 () Bool)

(declare-fun e!792007 () Bool)

(declare-fun e!792008 () Bool)

(assert (=> b!1398976 (= e!792007 e!792008)))

(declare-fun res!937731 () Bool)

(declare-fun lt!615244 () SeekEntryResult!10500)

(assert (=> b!1398976 (= res!937731 (and (is-Intermediate!10500 lt!615244) (not (undefined!11312 lt!615244)) (bvslt (x!126010 lt!615244) #b01111111111111111111111111111110) (bvsge (x!126010 lt!615244) #b00000000000000000000000000000000) (bvsge (x!126010 lt!615244) #b00000000000000000000000000000000)))))

(assert (=> b!1398976 (=> (not res!937731) (not e!792008))))

(declare-fun b!1398977 () Bool)

(assert (=> b!1398977 (= e!792007 (bvsge (x!126010 lt!615244) #b01111111111111111111111111111110))))

(declare-fun b!1398978 () Bool)

(assert (=> b!1398978 (and (bvsge (index!44373 lt!615244) #b00000000000000000000000000000000) (bvslt (index!44373 lt!615244) (size!46733 (array!95660 (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46733 a!2901)))))))

(declare-fun e!792006 () Bool)

(assert (=> b!1398978 (= e!792006 (= (select (arr!46183 (array!95660 (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46733 a!2901))) (index!44373 lt!615244)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1398979 () Bool)

(assert (=> b!1398979 (= e!792004 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!615117 mask!2840) #b00000000000000000000000000000000 mask!2840) lt!615117 (array!95660 (store (arr!46183 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46733 a!2901)) mask!2840))))

