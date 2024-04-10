; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121622 () Bool)

(assert start!121622)

(declare-fun b!1412946 () Bool)

(declare-fun res!949943 () Bool)

(declare-fun e!799609 () Bool)

(assert (=> b!1412946 (=> (not res!949943) (not e!799609))))

(declare-datatypes ((array!96560 0))(
  ( (array!96561 (arr!46617 (Array (_ BitVec 32) (_ BitVec 64))) (size!47167 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96560)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1412946 (= res!949943 (validKeyInArray!0 (select (arr!46617 a!2901) j!112)))))

(declare-fun b!1412947 () Bool)

(declare-fun e!799608 () Bool)

(assert (=> b!1412947 (= e!799608 true)))

(declare-fun e!799610 () Bool)

(assert (=> b!1412947 e!799610))

(declare-fun res!949937 () Bool)

(assert (=> b!1412947 (=> (not res!949937) (not e!799610))))

(declare-datatypes ((SeekEntryResult!10928 0))(
  ( (MissingZero!10928 (index!46092 (_ BitVec 32))) (Found!10928 (index!46093 (_ BitVec 32))) (Intermediate!10928 (undefined!11740 Bool) (index!46094 (_ BitVec 32)) (x!127679 (_ BitVec 32))) (Undefined!10928) (MissingVacant!10928 (index!46095 (_ BitVec 32))) )
))
(declare-fun lt!622693 () SeekEntryResult!10928)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lt!622692 () SeekEntryResult!10928)

(assert (=> b!1412947 (= res!949937 (and (not (undefined!11740 lt!622692)) (= (index!46094 lt!622692) i!1037) (bvslt (x!127679 lt!622692) (x!127679 lt!622693)) (= (select (store (arr!46617 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46094 lt!622692)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!622691 () (_ BitVec 32))

(declare-datatypes ((Unit!47830 0))(
  ( (Unit!47831) )
))
(declare-fun lt!622689 () Unit!47830)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47830)

(assert (=> b!1412947 (= lt!622689 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!622691 (x!127679 lt!622693) (index!46094 lt!622693) (x!127679 lt!622692) (index!46094 lt!622692) (undefined!11740 lt!622692) mask!2840))))

(declare-fun b!1412948 () Bool)

(declare-fun res!949936 () Bool)

(assert (=> b!1412948 (=> (not res!949936) (not e!799609))))

(assert (=> b!1412948 (= res!949936 (validKeyInArray!0 (select (arr!46617 a!2901) i!1037)))))

(declare-fun lt!622695 () (_ BitVec 64))

(declare-fun b!1412949 () Bool)

(declare-fun lt!622694 () array!96560)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96560 (_ BitVec 32)) SeekEntryResult!10928)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96560 (_ BitVec 32)) SeekEntryResult!10928)

(assert (=> b!1412949 (= e!799610 (= (seekEntryOrOpen!0 lt!622695 lt!622694 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127679 lt!622692) (index!46094 lt!622692) (index!46094 lt!622692) (select (arr!46617 a!2901) j!112) lt!622694 mask!2840)))))

(declare-fun b!1412950 () Bool)

(declare-fun e!799607 () Bool)

(assert (=> b!1412950 (= e!799609 (not e!799607))))

(declare-fun res!949939 () Bool)

(assert (=> b!1412950 (=> res!949939 e!799607)))

(get-info :version)

(assert (=> b!1412950 (= res!949939 (or (not ((_ is Intermediate!10928) lt!622693)) (undefined!11740 lt!622693)))))

(declare-fun e!799606 () Bool)

(assert (=> b!1412950 e!799606))

(declare-fun res!949945 () Bool)

(assert (=> b!1412950 (=> (not res!949945) (not e!799606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96560 (_ BitVec 32)) Bool)

(assert (=> b!1412950 (= res!949945 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!622690 () Unit!47830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96560 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47830)

(assert (=> b!1412950 (= lt!622690 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96560 (_ BitVec 32)) SeekEntryResult!10928)

(assert (=> b!1412950 (= lt!622693 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!622691 (select (arr!46617 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1412950 (= lt!622691 (toIndex!0 (select (arr!46617 a!2901) j!112) mask!2840))))

(declare-fun b!1412952 () Bool)

(assert (=> b!1412952 (= e!799606 (= (seekEntryOrOpen!0 (select (arr!46617 a!2901) j!112) a!2901 mask!2840) (Found!10928 j!112)))))

(declare-fun b!1412953 () Bool)

(declare-fun res!949940 () Bool)

(assert (=> b!1412953 (=> (not res!949940) (not e!799609))))

(assert (=> b!1412953 (= res!949940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1412954 () Bool)

(declare-fun res!949941 () Bool)

(assert (=> b!1412954 (=> (not res!949941) (not e!799609))))

(assert (=> b!1412954 (= res!949941 (and (= (size!47167 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47167 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47167 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1412955 () Bool)

(declare-fun res!949944 () Bool)

(assert (=> b!1412955 (=> (not res!949944) (not e!799609))))

(declare-datatypes ((List!33136 0))(
  ( (Nil!33133) (Cons!33132 (h!34407 (_ BitVec 64)) (t!47830 List!33136)) )
))
(declare-fun arrayNoDuplicates!0 (array!96560 (_ BitVec 32) List!33136) Bool)

(assert (=> b!1412955 (= res!949944 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33133))))

(declare-fun res!949938 () Bool)

(assert (=> start!121622 (=> (not res!949938) (not e!799609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121622 (= res!949938 (validMask!0 mask!2840))))

(assert (=> start!121622 e!799609))

(assert (=> start!121622 true))

(declare-fun array_inv!35645 (array!96560) Bool)

(assert (=> start!121622 (array_inv!35645 a!2901)))

(declare-fun b!1412951 () Bool)

(assert (=> b!1412951 (= e!799607 e!799608)))

(declare-fun res!949942 () Bool)

(assert (=> b!1412951 (=> res!949942 e!799608)))

(assert (=> b!1412951 (= res!949942 (or (= lt!622693 lt!622692) (not ((_ is Intermediate!10928) lt!622692))))))

(assert (=> b!1412951 (= lt!622692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!622695 mask!2840) lt!622695 lt!622694 mask!2840))))

(assert (=> b!1412951 (= lt!622695 (select (store (arr!46617 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1412951 (= lt!622694 (array!96561 (store (arr!46617 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47167 a!2901)))))

(assert (= (and start!121622 res!949938) b!1412954))

(assert (= (and b!1412954 res!949941) b!1412948))

(assert (= (and b!1412948 res!949936) b!1412946))

(assert (= (and b!1412946 res!949943) b!1412953))

(assert (= (and b!1412953 res!949940) b!1412955))

(assert (= (and b!1412955 res!949944) b!1412950))

(assert (= (and b!1412950 res!949945) b!1412952))

(assert (= (and b!1412950 (not res!949939)) b!1412951))

(assert (= (and b!1412951 (not res!949942)) b!1412947))

(assert (= (and b!1412947 res!949937) b!1412949))

(declare-fun m!1303173 () Bool)

(assert (=> b!1412946 m!1303173))

(assert (=> b!1412946 m!1303173))

(declare-fun m!1303175 () Bool)

(assert (=> b!1412946 m!1303175))

(declare-fun m!1303177 () Bool)

(assert (=> b!1412953 m!1303177))

(assert (=> b!1412952 m!1303173))

(assert (=> b!1412952 m!1303173))

(declare-fun m!1303179 () Bool)

(assert (=> b!1412952 m!1303179))

(declare-fun m!1303181 () Bool)

(assert (=> b!1412948 m!1303181))

(assert (=> b!1412948 m!1303181))

(declare-fun m!1303183 () Bool)

(assert (=> b!1412948 m!1303183))

(declare-fun m!1303185 () Bool)

(assert (=> start!121622 m!1303185))

(declare-fun m!1303187 () Bool)

(assert (=> start!121622 m!1303187))

(declare-fun m!1303189 () Bool)

(assert (=> b!1412955 m!1303189))

(declare-fun m!1303191 () Bool)

(assert (=> b!1412947 m!1303191))

(declare-fun m!1303193 () Bool)

(assert (=> b!1412947 m!1303193))

(declare-fun m!1303195 () Bool)

(assert (=> b!1412947 m!1303195))

(declare-fun m!1303197 () Bool)

(assert (=> b!1412951 m!1303197))

(assert (=> b!1412951 m!1303197))

(declare-fun m!1303199 () Bool)

(assert (=> b!1412951 m!1303199))

(assert (=> b!1412951 m!1303191))

(declare-fun m!1303201 () Bool)

(assert (=> b!1412951 m!1303201))

(declare-fun m!1303203 () Bool)

(assert (=> b!1412949 m!1303203))

(assert (=> b!1412949 m!1303173))

(assert (=> b!1412949 m!1303173))

(declare-fun m!1303205 () Bool)

(assert (=> b!1412949 m!1303205))

(assert (=> b!1412950 m!1303173))

(declare-fun m!1303207 () Bool)

(assert (=> b!1412950 m!1303207))

(assert (=> b!1412950 m!1303173))

(declare-fun m!1303209 () Bool)

(assert (=> b!1412950 m!1303209))

(assert (=> b!1412950 m!1303173))

(declare-fun m!1303211 () Bool)

(assert (=> b!1412950 m!1303211))

(declare-fun m!1303213 () Bool)

(assert (=> b!1412950 m!1303213))

(check-sat (not b!1412953) (not b!1412950) (not start!121622) (not b!1412951) (not b!1412949) (not b!1412952) (not b!1412955) (not b!1412947) (not b!1412946) (not b!1412948))
(check-sat)
