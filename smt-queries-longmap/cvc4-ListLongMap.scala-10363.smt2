; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121996 () Bool)

(assert start!121996)

(declare-fun b!1415930 () Bool)

(declare-fun e!801401 () Bool)

(declare-fun e!801404 () Bool)

(assert (=> b!1415930 (= e!801401 e!801404)))

(declare-fun res!951979 () Bool)

(assert (=> b!1415930 (=> res!951979 e!801404)))

(declare-datatypes ((SeekEntryResult!10983 0))(
  ( (MissingZero!10983 (index!46324 (_ BitVec 32))) (Found!10983 (index!46325 (_ BitVec 32))) (Intermediate!10983 (undefined!11795 Bool) (index!46326 (_ BitVec 32)) (x!127926 (_ BitVec 32))) (Undefined!10983) (MissingVacant!10983 (index!46327 (_ BitVec 32))) )
))
(declare-fun lt!624487 () SeekEntryResult!10983)

(declare-fun lt!624490 () SeekEntryResult!10983)

(assert (=> b!1415930 (= res!951979 (or (= lt!624487 lt!624490) (not (is-Intermediate!10983 lt!624490))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!624485 () (_ BitVec 64))

(declare-datatypes ((array!96682 0))(
  ( (array!96683 (arr!46672 (Array (_ BitVec 32) (_ BitVec 64))) (size!47222 (_ BitVec 32))) )
))
(declare-fun lt!624488 () array!96682)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96682 (_ BitVec 32)) SeekEntryResult!10983)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1415930 (= lt!624490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624485 mask!2840) lt!624485 lt!624488 mask!2840))))

(declare-fun a!2901 () array!96682)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1415930 (= lt!624485 (select (store (arr!46672 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1415930 (= lt!624488 (array!96683 (store (arr!46672 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47222 a!2901)))))

(declare-fun e!801407 () Bool)

(declare-fun b!1415931 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96682 (_ BitVec 32)) SeekEntryResult!10983)

(assert (=> b!1415931 (= e!801407 (= (seekEntryOrOpen!0 (select (arr!46672 a!2901) j!112) a!2901 mask!2840) (Found!10983 j!112)))))

(declare-fun b!1415932 () Bool)

(declare-fun e!801405 () Bool)

(assert (=> b!1415932 (= e!801405 true)))

(declare-fun lt!624491 () (_ BitVec 32))

(declare-fun lt!624489 () SeekEntryResult!10983)

(assert (=> b!1415932 (= lt!624489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624491 lt!624485 lt!624488 mask!2840))))

(declare-fun b!1415933 () Bool)

(declare-fun res!951973 () Bool)

(declare-fun e!801406 () Bool)

(assert (=> b!1415933 (=> (not res!951973) (not e!801406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1415933 (= res!951973 (validKeyInArray!0 (select (arr!46672 a!2901) i!1037)))))

(declare-fun b!1415935 () Bool)

(declare-fun res!951982 () Bool)

(assert (=> b!1415935 (=> (not res!951982) (not e!801406))))

(assert (=> b!1415935 (= res!951982 (validKeyInArray!0 (select (arr!46672 a!2901) j!112)))))

(declare-fun b!1415936 () Bool)

(assert (=> b!1415936 (= e!801406 (not e!801401))))

(declare-fun res!951981 () Bool)

(assert (=> b!1415936 (=> res!951981 e!801401)))

(assert (=> b!1415936 (= res!951981 (or (not (is-Intermediate!10983 lt!624487)) (undefined!11795 lt!624487)))))

(assert (=> b!1415936 e!801407))

(declare-fun res!951977 () Bool)

(assert (=> b!1415936 (=> (not res!951977) (not e!801407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96682 (_ BitVec 32)) Bool)

(assert (=> b!1415936 (= res!951977 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47940 0))(
  ( (Unit!47941) )
))
(declare-fun lt!624492 () Unit!47940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47940)

(assert (=> b!1415936 (= lt!624492 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1415936 (= lt!624487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624491 (select (arr!46672 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1415936 (= lt!624491 (toIndex!0 (select (arr!46672 a!2901) j!112) mask!2840))))

(declare-fun e!801402 () Bool)

(declare-fun b!1415937 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96682 (_ BitVec 32)) SeekEntryResult!10983)

(assert (=> b!1415937 (= e!801402 (= (seekEntryOrOpen!0 lt!624485 lt!624488 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!127926 lt!624490) (index!46326 lt!624490) (index!46326 lt!624490) (select (arr!46672 a!2901) j!112) lt!624488 mask!2840)))))

(declare-fun b!1415938 () Bool)

(assert (=> b!1415938 (= e!801404 e!801405)))

(declare-fun res!951980 () Bool)

(assert (=> b!1415938 (=> res!951980 e!801405)))

(assert (=> b!1415938 (= res!951980 (or (bvslt (x!127926 lt!624487) #b00000000000000000000000000000000) (bvsgt (x!127926 lt!624487) #b01111111111111111111111111111110) (bvslt (x!127926 lt!624490) #b00000000000000000000000000000000) (bvsgt (x!127926 lt!624490) #b01111111111111111111111111111110) (bvslt lt!624491 #b00000000000000000000000000000000) (bvsge lt!624491 (size!47222 a!2901)) (bvslt (index!46326 lt!624487) #b00000000000000000000000000000000) (bvsge (index!46326 lt!624487) (size!47222 a!2901)) (bvslt (index!46326 lt!624490) #b00000000000000000000000000000000) (bvsge (index!46326 lt!624490) (size!47222 a!2901)) (not (= lt!624487 (Intermediate!10983 false (index!46326 lt!624487) (x!127926 lt!624487)))) (not (= lt!624490 (Intermediate!10983 false (index!46326 lt!624490) (x!127926 lt!624490))))))))

(assert (=> b!1415938 e!801402))

(declare-fun res!951975 () Bool)

(assert (=> b!1415938 (=> (not res!951975) (not e!801402))))

(assert (=> b!1415938 (= res!951975 (and (not (undefined!11795 lt!624490)) (= (index!46326 lt!624490) i!1037) (bvslt (x!127926 lt!624490) (x!127926 lt!624487)) (= (select (store (arr!46672 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46326 lt!624490)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!624486 () Unit!47940)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47940)

(assert (=> b!1415938 (= lt!624486 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624491 (x!127926 lt!624487) (index!46326 lt!624487) (x!127926 lt!624490) (index!46326 lt!624490) (undefined!11795 lt!624490) mask!2840))))

(declare-fun b!1415934 () Bool)

(declare-fun res!951972 () Bool)

(assert (=> b!1415934 (=> (not res!951972) (not e!801406))))

(assert (=> b!1415934 (= res!951972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!951976 () Bool)

(assert (=> start!121996 (=> (not res!951976) (not e!801406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121996 (= res!951976 (validMask!0 mask!2840))))

(assert (=> start!121996 e!801406))

(assert (=> start!121996 true))

(declare-fun array_inv!35700 (array!96682) Bool)

(assert (=> start!121996 (array_inv!35700 a!2901)))

(declare-fun b!1415939 () Bool)

(declare-fun res!951974 () Bool)

(assert (=> b!1415939 (=> (not res!951974) (not e!801406))))

(declare-datatypes ((List!33191 0))(
  ( (Nil!33188) (Cons!33187 (h!34474 (_ BitVec 64)) (t!47885 List!33191)) )
))
(declare-fun arrayNoDuplicates!0 (array!96682 (_ BitVec 32) List!33191) Bool)

(assert (=> b!1415939 (= res!951974 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33188))))

(declare-fun b!1415940 () Bool)

(declare-fun res!951978 () Bool)

(assert (=> b!1415940 (=> (not res!951978) (not e!801406))))

(assert (=> b!1415940 (= res!951978 (and (= (size!47222 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47222 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47222 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!121996 res!951976) b!1415940))

(assert (= (and b!1415940 res!951978) b!1415933))

(assert (= (and b!1415933 res!951973) b!1415935))

(assert (= (and b!1415935 res!951982) b!1415934))

(assert (= (and b!1415934 res!951972) b!1415939))

(assert (= (and b!1415939 res!951974) b!1415936))

(assert (= (and b!1415936 res!951977) b!1415931))

(assert (= (and b!1415936 (not res!951981)) b!1415930))

(assert (= (and b!1415930 (not res!951979)) b!1415938))

(assert (= (and b!1415938 res!951975) b!1415937))

(assert (= (and b!1415938 (not res!951980)) b!1415932))

(declare-fun m!1306387 () Bool)

(assert (=> b!1415932 m!1306387))

(declare-fun m!1306389 () Bool)

(assert (=> b!1415936 m!1306389))

(declare-fun m!1306391 () Bool)

(assert (=> b!1415936 m!1306391))

(assert (=> b!1415936 m!1306389))

(assert (=> b!1415936 m!1306389))

(declare-fun m!1306393 () Bool)

(assert (=> b!1415936 m!1306393))

(declare-fun m!1306395 () Bool)

(assert (=> b!1415936 m!1306395))

(declare-fun m!1306397 () Bool)

(assert (=> b!1415936 m!1306397))

(assert (=> b!1415931 m!1306389))

(assert (=> b!1415931 m!1306389))

(declare-fun m!1306399 () Bool)

(assert (=> b!1415931 m!1306399))

(declare-fun m!1306401 () Bool)

(assert (=> start!121996 m!1306401))

(declare-fun m!1306403 () Bool)

(assert (=> start!121996 m!1306403))

(declare-fun m!1306405 () Bool)

(assert (=> b!1415938 m!1306405))

(declare-fun m!1306407 () Bool)

(assert (=> b!1415938 m!1306407))

(declare-fun m!1306409 () Bool)

(assert (=> b!1415938 m!1306409))

(declare-fun m!1306411 () Bool)

(assert (=> b!1415937 m!1306411))

(assert (=> b!1415937 m!1306389))

(assert (=> b!1415937 m!1306389))

(declare-fun m!1306413 () Bool)

(assert (=> b!1415937 m!1306413))

(assert (=> b!1415935 m!1306389))

(assert (=> b!1415935 m!1306389))

(declare-fun m!1306415 () Bool)

(assert (=> b!1415935 m!1306415))

(declare-fun m!1306417 () Bool)

(assert (=> b!1415930 m!1306417))

(assert (=> b!1415930 m!1306417))

(declare-fun m!1306419 () Bool)

(assert (=> b!1415930 m!1306419))

(assert (=> b!1415930 m!1306405))

(declare-fun m!1306421 () Bool)

(assert (=> b!1415930 m!1306421))

(declare-fun m!1306423 () Bool)

(assert (=> b!1415939 m!1306423))

(declare-fun m!1306425 () Bool)

(assert (=> b!1415933 m!1306425))

(assert (=> b!1415933 m!1306425))

(declare-fun m!1306427 () Bool)

(assert (=> b!1415933 m!1306427))

(declare-fun m!1306429 () Bool)

(assert (=> b!1415934 m!1306429))

(push 1)

