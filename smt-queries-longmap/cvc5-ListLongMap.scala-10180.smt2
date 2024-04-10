; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120006 () Bool)

(assert start!120006)

(declare-fun b!1397041 () Bool)

(declare-fun e!790912 () Bool)

(assert (=> b!1397041 (= e!790912 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10438 0))(
  ( (MissingZero!10438 (index!44123 (_ BitVec 32))) (Found!10438 (index!44124 (_ BitVec 32))) (Intermediate!10438 (undefined!11250 Bool) (index!44125 (_ BitVec 32)) (x!125788 (_ BitVec 32))) (Undefined!10438) (MissingVacant!10438 (index!44126 (_ BitVec 32))) )
))
(declare-fun lt!613897 () SeekEntryResult!10438)

(declare-fun lt!613899 () (_ BitVec 32))

(declare-fun lt!613893 () (_ BitVec 64))

(declare-datatypes ((array!95535 0))(
  ( (array!95536 (arr!46121 (Array (_ BitVec 32) (_ BitVec 64))) (size!46671 (_ BitVec 32))) )
))
(declare-fun lt!613898 () array!95535)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95535 (_ BitVec 32)) SeekEntryResult!10438)

(assert (=> b!1397041 (= lt!613897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613899 lt!613893 lt!613898 mask!2840))))

(declare-fun res!935959 () Bool)

(declare-fun e!790909 () Bool)

(assert (=> start!120006 (=> (not res!935959) (not e!790909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120006 (= res!935959 (validMask!0 mask!2840))))

(assert (=> start!120006 e!790909))

(assert (=> start!120006 true))

(declare-fun a!2901 () array!95535)

(declare-fun array_inv!35149 (array!95535) Bool)

(assert (=> start!120006 (array_inv!35149 a!2901)))

(declare-fun b!1397042 () Bool)

(declare-fun res!935954 () Bool)

(assert (=> b!1397042 (=> (not res!935954) (not e!790909))))

(declare-datatypes ((List!32640 0))(
  ( (Nil!32637) (Cons!32636 (h!33878 (_ BitVec 64)) (t!47334 List!32640)) )
))
(declare-fun arrayNoDuplicates!0 (array!95535 (_ BitVec 32) List!32640) Bool)

(assert (=> b!1397042 (= res!935954 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32637))))

(declare-fun b!1397043 () Bool)

(declare-fun res!935958 () Bool)

(assert (=> b!1397043 (=> (not res!935958) (not e!790909))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397043 (= res!935958 (validKeyInArray!0 (select (arr!46121 a!2901) i!1037)))))

(declare-fun b!1397044 () Bool)

(declare-fun res!935960 () Bool)

(assert (=> b!1397044 (=> (not res!935960) (not e!790909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95535 (_ BitVec 32)) Bool)

(assert (=> b!1397044 (= res!935960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397045 () Bool)

(declare-fun res!935955 () Bool)

(assert (=> b!1397045 (=> (not res!935955) (not e!790909))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397045 (= res!935955 (and (= (size!46671 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46671 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46671 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!790913 () Bool)

(declare-fun b!1397046 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95535 (_ BitVec 32)) SeekEntryResult!10438)

(assert (=> b!1397046 (= e!790913 (= (seekEntryOrOpen!0 (select (arr!46121 a!2901) j!112) a!2901 mask!2840) (Found!10438 j!112)))))

(declare-fun b!1397047 () Bool)

(declare-fun e!790910 () Bool)

(assert (=> b!1397047 (= e!790910 e!790912)))

(declare-fun res!935962 () Bool)

(assert (=> b!1397047 (=> res!935962 e!790912)))

(declare-fun lt!613894 () SeekEntryResult!10438)

(declare-fun lt!613896 () SeekEntryResult!10438)

(assert (=> b!1397047 (= res!935962 (or (= lt!613894 lt!613896) (not (is-Intermediate!10438 lt!613896)) (bvslt (x!125788 lt!613894) #b00000000000000000000000000000000) (bvsgt (x!125788 lt!613894) #b01111111111111111111111111111110) (bvslt lt!613899 #b00000000000000000000000000000000) (bvsge lt!613899 (size!46671 a!2901)) (bvslt (index!44125 lt!613894) #b00000000000000000000000000000000) (bvsge (index!44125 lt!613894) (size!46671 a!2901)) (not (= lt!613894 (Intermediate!10438 false (index!44125 lt!613894) (x!125788 lt!613894)))) (not (= lt!613896 (Intermediate!10438 (undefined!11250 lt!613896) (index!44125 lt!613896) (x!125788 lt!613896))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397047 (= lt!613896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613893 mask!2840) lt!613893 lt!613898 mask!2840))))

(assert (=> b!1397047 (= lt!613893 (select (store (arr!46121 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397047 (= lt!613898 (array!95536 (store (arr!46121 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46671 a!2901)))))

(declare-fun b!1397048 () Bool)

(declare-fun res!935956 () Bool)

(assert (=> b!1397048 (=> (not res!935956) (not e!790909))))

(assert (=> b!1397048 (= res!935956 (validKeyInArray!0 (select (arr!46121 a!2901) j!112)))))

(declare-fun b!1397049 () Bool)

(assert (=> b!1397049 (= e!790909 (not e!790910))))

(declare-fun res!935961 () Bool)

(assert (=> b!1397049 (=> res!935961 e!790910)))

(assert (=> b!1397049 (= res!935961 (or (not (is-Intermediate!10438 lt!613894)) (undefined!11250 lt!613894)))))

(assert (=> b!1397049 e!790913))

(declare-fun res!935957 () Bool)

(assert (=> b!1397049 (=> (not res!935957) (not e!790913))))

(assert (=> b!1397049 (= res!935957 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46880 0))(
  ( (Unit!46881) )
))
(declare-fun lt!613895 () Unit!46880)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46880)

(assert (=> b!1397049 (= lt!613895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397049 (= lt!613894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613899 (select (arr!46121 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397049 (= lt!613899 (toIndex!0 (select (arr!46121 a!2901) j!112) mask!2840))))

(assert (= (and start!120006 res!935959) b!1397045))

(assert (= (and b!1397045 res!935955) b!1397043))

(assert (= (and b!1397043 res!935958) b!1397048))

(assert (= (and b!1397048 res!935956) b!1397044))

(assert (= (and b!1397044 res!935960) b!1397042))

(assert (= (and b!1397042 res!935954) b!1397049))

(assert (= (and b!1397049 res!935957) b!1397046))

(assert (= (and b!1397049 (not res!935961)) b!1397047))

(assert (= (and b!1397047 (not res!935962)) b!1397041))

(declare-fun m!1283679 () Bool)

(assert (=> b!1397044 m!1283679))

(declare-fun m!1283681 () Bool)

(assert (=> start!120006 m!1283681))

(declare-fun m!1283683 () Bool)

(assert (=> start!120006 m!1283683))

(declare-fun m!1283685 () Bool)

(assert (=> b!1397046 m!1283685))

(assert (=> b!1397046 m!1283685))

(declare-fun m!1283687 () Bool)

(assert (=> b!1397046 m!1283687))

(declare-fun m!1283689 () Bool)

(assert (=> b!1397041 m!1283689))

(declare-fun m!1283691 () Bool)

(assert (=> b!1397047 m!1283691))

(assert (=> b!1397047 m!1283691))

(declare-fun m!1283693 () Bool)

(assert (=> b!1397047 m!1283693))

(declare-fun m!1283695 () Bool)

(assert (=> b!1397047 m!1283695))

(declare-fun m!1283697 () Bool)

(assert (=> b!1397047 m!1283697))

(declare-fun m!1283699 () Bool)

(assert (=> b!1397042 m!1283699))

(assert (=> b!1397049 m!1283685))

(declare-fun m!1283701 () Bool)

(assert (=> b!1397049 m!1283701))

(assert (=> b!1397049 m!1283685))

(declare-fun m!1283703 () Bool)

(assert (=> b!1397049 m!1283703))

(assert (=> b!1397049 m!1283685))

(declare-fun m!1283705 () Bool)

(assert (=> b!1397049 m!1283705))

(declare-fun m!1283707 () Bool)

(assert (=> b!1397049 m!1283707))

(declare-fun m!1283709 () Bool)

(assert (=> b!1397043 m!1283709))

(assert (=> b!1397043 m!1283709))

(declare-fun m!1283711 () Bool)

(assert (=> b!1397043 m!1283711))

(assert (=> b!1397048 m!1283685))

(assert (=> b!1397048 m!1283685))

(declare-fun m!1283713 () Bool)

(assert (=> b!1397048 m!1283713))

(push 1)

