; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130014 () Bool)

(assert start!130014)

(declare-fun b!1525917 () Bool)

(declare-fun res!1044145 () Bool)

(declare-fun e!850532 () Bool)

(assert (=> b!1525917 (=> (not res!1044145) (not e!850532))))

(declare-datatypes ((array!101425 0))(
  ( (array!101426 (arr!48940 (Array (_ BitVec 32) (_ BitVec 64))) (size!49492 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101425)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525917 (= res!1044145 (validKeyInArray!0 (select (arr!48940 a!2804) i!961)))))

(declare-fun b!1525918 () Bool)

(declare-fun e!850534 () Bool)

(assert (=> b!1525918 (= e!850532 e!850534)))

(declare-fun res!1044138 () Bool)

(assert (=> b!1525918 (=> (not res!1044138) (not e!850534))))

(declare-datatypes ((SeekEntryResult!13128 0))(
  ( (MissingZero!13128 (index!54907 (_ BitVec 32))) (Found!13128 (index!54908 (_ BitVec 32))) (Intermediate!13128 (undefined!13940 Bool) (index!54909 (_ BitVec 32)) (x!136609 (_ BitVec 32))) (Undefined!13128) (MissingVacant!13128 (index!54910 (_ BitVec 32))) )
))
(declare-fun lt!660715 () SeekEntryResult!13128)

(declare-fun lt!660713 () SeekEntryResult!13128)

(assert (=> b!1525918 (= res!1044138 (= lt!660715 lt!660713))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525918 (= lt!660713 (Intermediate!13128 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101425 (_ BitVec 32)) SeekEntryResult!13128)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525918 (= lt!660715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48940 a!2804) j!70) mask!2512) (select (arr!48940 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525919 () Bool)

(declare-fun res!1044140 () Bool)

(assert (=> b!1525919 (=> (not res!1044140) (not e!850532))))

(assert (=> b!1525919 (= res!1044140 (and (= (size!49492 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49492 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49492 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525920 () Bool)

(declare-fun res!1044147 () Bool)

(declare-fun e!850533 () Bool)

(assert (=> b!1525920 (=> (not res!1044147) (not e!850533))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101425 (_ BitVec 32)) SeekEntryResult!13128)

(assert (=> b!1525920 (= res!1044147 (= (seekEntry!0 (select (arr!48940 a!2804) j!70) a!2804 mask!2512) (Found!13128 j!70)))))

(declare-fun lt!660717 () (_ BitVec 64))

(declare-fun b!1525921 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun e!850529 () Bool)

(declare-fun lt!660714 () array!101425)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101425 (_ BitVec 32)) SeekEntryResult!13128)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101425 (_ BitVec 32)) SeekEntryResult!13128)

(assert (=> b!1525921 (= e!850529 (= (seekEntryOrOpen!0 lt!660717 lt!660714 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660717 lt!660714 mask!2512)))))

(declare-fun res!1044139 () Bool)

(assert (=> start!130014 (=> (not res!1044139) (not e!850532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130014 (= res!1044139 (validMask!0 mask!2512))))

(assert (=> start!130014 e!850532))

(assert (=> start!130014 true))

(declare-fun array_inv!38173 (array!101425) Bool)

(assert (=> start!130014 (array_inv!38173 a!2804)))

(declare-fun b!1525922 () Bool)

(declare-fun res!1044141 () Bool)

(assert (=> b!1525922 (=> (not res!1044141) (not e!850532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101425 (_ BitVec 32)) Bool)

(assert (=> b!1525922 (= res!1044141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525923 () Bool)

(declare-fun res!1044136 () Bool)

(assert (=> b!1525923 (=> (not res!1044136) (not e!850532))))

(assert (=> b!1525923 (= res!1044136 (validKeyInArray!0 (select (arr!48940 a!2804) j!70)))))

(declare-fun b!1525924 () Bool)

(declare-fun res!1044137 () Bool)

(assert (=> b!1525924 (=> (not res!1044137) (not e!850534))))

(assert (=> b!1525924 (= res!1044137 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48940 a!2804) j!70) a!2804 mask!2512) lt!660713))))

(declare-fun b!1525925 () Bool)

(declare-fun res!1044143 () Bool)

(assert (=> b!1525925 (=> (not res!1044143) (not e!850532))))

(declare-datatypes ((List!35501 0))(
  ( (Nil!35498) (Cons!35497 (h!36931 (_ BitVec 64)) (t!50187 List!35501)) )
))
(declare-fun arrayNoDuplicates!0 (array!101425 (_ BitVec 32) List!35501) Bool)

(assert (=> b!1525925 (= res!1044143 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35498))))

(declare-fun b!1525926 () Bool)

(declare-fun e!850531 () Bool)

(assert (=> b!1525926 (= e!850531 (not true))))

(assert (=> b!1525926 e!850533))

(declare-fun res!1044142 () Bool)

(assert (=> b!1525926 (=> (not res!1044142) (not e!850533))))

(assert (=> b!1525926 (= res!1044142 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50879 0))(
  ( (Unit!50880) )
))
(declare-fun lt!660716 () Unit!50879)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50879)

(assert (=> b!1525926 (= lt!660716 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525927 () Bool)

(declare-fun e!850530 () Bool)

(assert (=> b!1525927 (= e!850533 e!850530)))

(declare-fun res!1044135 () Bool)

(assert (=> b!1525927 (=> res!1044135 e!850530)))

(assert (=> b!1525927 (= res!1044135 (or (not (= (select (arr!48940 a!2804) j!70) lt!660717)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48940 a!2804) index!487) (select (arr!48940 a!2804) j!70)) (not (= (select (arr!48940 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525928 () Bool)

(assert (=> b!1525928 (= e!850534 e!850531)))

(declare-fun res!1044144 () Bool)

(assert (=> b!1525928 (=> (not res!1044144) (not e!850531))))

(assert (=> b!1525928 (= res!1044144 (= lt!660715 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660717 mask!2512) lt!660717 lt!660714 mask!2512)))))

(assert (=> b!1525928 (= lt!660717 (select (store (arr!48940 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525928 (= lt!660714 (array!101426 (store (arr!48940 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49492 a!2804)))))

(declare-fun b!1525929 () Bool)

(assert (=> b!1525929 (= e!850530 e!850529)))

(declare-fun res!1044148 () Bool)

(assert (=> b!1525929 (=> (not res!1044148) (not e!850529))))

(assert (=> b!1525929 (= res!1044148 (= (seekEntryOrOpen!0 (select (arr!48940 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48940 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525930 () Bool)

(declare-fun res!1044146 () Bool)

(assert (=> b!1525930 (=> (not res!1044146) (not e!850532))))

(assert (=> b!1525930 (= res!1044146 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49492 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49492 a!2804))))))

(assert (= (and start!130014 res!1044139) b!1525919))

(assert (= (and b!1525919 res!1044140) b!1525917))

(assert (= (and b!1525917 res!1044145) b!1525923))

(assert (= (and b!1525923 res!1044136) b!1525922))

(assert (= (and b!1525922 res!1044141) b!1525925))

(assert (= (and b!1525925 res!1044143) b!1525930))

(assert (= (and b!1525930 res!1044146) b!1525918))

(assert (= (and b!1525918 res!1044138) b!1525924))

(assert (= (and b!1525924 res!1044137) b!1525928))

(assert (= (and b!1525928 res!1044144) b!1525926))

(assert (= (and b!1525926 res!1044142) b!1525920))

(assert (= (and b!1525920 res!1044147) b!1525927))

(assert (= (and b!1525927 (not res!1044135)) b!1525929))

(assert (= (and b!1525929 res!1044148) b!1525921))

(declare-fun m!1408121 () Bool)

(assert (=> b!1525927 m!1408121))

(declare-fun m!1408123 () Bool)

(assert (=> b!1525927 m!1408123))

(assert (=> b!1525923 m!1408121))

(assert (=> b!1525923 m!1408121))

(declare-fun m!1408125 () Bool)

(assert (=> b!1525923 m!1408125))

(declare-fun m!1408127 () Bool)

(assert (=> b!1525925 m!1408127))

(assert (=> b!1525918 m!1408121))

(assert (=> b!1525918 m!1408121))

(declare-fun m!1408129 () Bool)

(assert (=> b!1525918 m!1408129))

(assert (=> b!1525918 m!1408129))

(assert (=> b!1525918 m!1408121))

(declare-fun m!1408131 () Bool)

(assert (=> b!1525918 m!1408131))

(declare-fun m!1408133 () Bool)

(assert (=> b!1525921 m!1408133))

(declare-fun m!1408135 () Bool)

(assert (=> b!1525921 m!1408135))

(declare-fun m!1408137 () Bool)

(assert (=> b!1525917 m!1408137))

(assert (=> b!1525917 m!1408137))

(declare-fun m!1408139 () Bool)

(assert (=> b!1525917 m!1408139))

(assert (=> b!1525929 m!1408121))

(assert (=> b!1525929 m!1408121))

(declare-fun m!1408141 () Bool)

(assert (=> b!1525929 m!1408141))

(assert (=> b!1525929 m!1408121))

(declare-fun m!1408143 () Bool)

(assert (=> b!1525929 m!1408143))

(declare-fun m!1408145 () Bool)

(assert (=> b!1525926 m!1408145))

(declare-fun m!1408147 () Bool)

(assert (=> b!1525926 m!1408147))

(assert (=> b!1525924 m!1408121))

(assert (=> b!1525924 m!1408121))

(declare-fun m!1408149 () Bool)

(assert (=> b!1525924 m!1408149))

(declare-fun m!1408151 () Bool)

(assert (=> start!130014 m!1408151))

(declare-fun m!1408153 () Bool)

(assert (=> start!130014 m!1408153))

(declare-fun m!1408155 () Bool)

(assert (=> b!1525922 m!1408155))

(declare-fun m!1408157 () Bool)

(assert (=> b!1525928 m!1408157))

(assert (=> b!1525928 m!1408157))

(declare-fun m!1408159 () Bool)

(assert (=> b!1525928 m!1408159))

(declare-fun m!1408161 () Bool)

(assert (=> b!1525928 m!1408161))

(declare-fun m!1408163 () Bool)

(assert (=> b!1525928 m!1408163))

(assert (=> b!1525920 m!1408121))

(assert (=> b!1525920 m!1408121))

(declare-fun m!1408165 () Bool)

(assert (=> b!1525920 m!1408165))

(check-sat (not b!1525917) (not b!1525926) (not b!1525929) (not b!1525925) (not b!1525920) (not b!1525922) (not b!1525921) (not b!1525923) (not start!130014) (not b!1525928) (not b!1525924) (not b!1525918))
(check-sat)
