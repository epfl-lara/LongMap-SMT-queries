; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120328 () Bool)

(assert start!120328)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95737 0))(
  ( (array!95738 (arr!46219 (Array (_ BitVec 32) (_ BitVec 64))) (size!46769 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95737)

(declare-fun b!1400420 () Bool)

(declare-fun e!792889 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10536 0))(
  ( (MissingZero!10536 (index!44521 (_ BitVec 32))) (Found!10536 (index!44522 (_ BitVec 32))) (Intermediate!10536 (undefined!11348 Bool) (index!44523 (_ BitVec 32)) (x!126163 (_ BitVec 32))) (Undefined!10536) (MissingVacant!10536 (index!44524 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95737 (_ BitVec 32)) SeekEntryResult!10536)

(assert (=> b!1400420 (= e!792889 (= (seekEntryOrOpen!0 (select (arr!46219 a!2901) j!112) a!2901 mask!2840) (Found!10536 j!112)))))

(declare-fun b!1400421 () Bool)

(declare-fun res!938931 () Bool)

(declare-fun e!792890 () Bool)

(assert (=> b!1400421 (=> (not res!938931) (not e!792890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400421 (= res!938931 (validKeyInArray!0 (select (arr!46219 a!2901) j!112)))))

(declare-fun b!1400422 () Bool)

(declare-fun res!938932 () Bool)

(assert (=> b!1400422 (=> (not res!938932) (not e!792890))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400422 (= res!938932 (validKeyInArray!0 (select (arr!46219 a!2901) i!1037)))))

(declare-fun b!1400423 () Bool)

(declare-fun res!938940 () Bool)

(assert (=> b!1400423 (=> (not res!938940) (not e!792890))))

(declare-datatypes ((List!32738 0))(
  ( (Nil!32735) (Cons!32734 (h!33982 (_ BitVec 64)) (t!47432 List!32738)) )
))
(declare-fun arrayNoDuplicates!0 (array!95737 (_ BitVec 32) List!32738) Bool)

(assert (=> b!1400423 (= res!938940 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32735))))

(declare-fun b!1400424 () Bool)

(declare-fun e!792886 () Bool)

(assert (=> b!1400424 (= e!792886 true)))

(declare-fun lt!616193 () (_ BitVec 64))

(declare-fun lt!616190 () array!95737)

(declare-fun lt!616191 () SeekEntryResult!10536)

(declare-fun lt!616196 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95737 (_ BitVec 32)) SeekEntryResult!10536)

(assert (=> b!1400424 (= lt!616191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616196 lt!616193 lt!616190 mask!2840))))

(declare-fun b!1400425 () Bool)

(declare-fun e!792887 () Bool)

(assert (=> b!1400425 (= e!792887 e!792886)))

(declare-fun res!938937 () Bool)

(assert (=> b!1400425 (=> res!938937 e!792886)))

(declare-fun lt!616195 () SeekEntryResult!10536)

(declare-fun lt!616197 () SeekEntryResult!10536)

(assert (=> b!1400425 (= res!938937 (or (bvslt (x!126163 lt!616195) #b00000000000000000000000000000000) (bvsgt (x!126163 lt!616195) #b01111111111111111111111111111110) (bvslt (x!126163 lt!616197) #b00000000000000000000000000000000) (bvsgt (x!126163 lt!616197) #b01111111111111111111111111111110) (bvslt lt!616196 #b00000000000000000000000000000000) (bvsge lt!616196 (size!46769 a!2901)) (bvslt (index!44523 lt!616195) #b00000000000000000000000000000000) (bvsge (index!44523 lt!616195) (size!46769 a!2901)) (bvslt (index!44523 lt!616197) #b00000000000000000000000000000000) (bvsge (index!44523 lt!616197) (size!46769 a!2901)) (not (= lt!616195 (Intermediate!10536 false (index!44523 lt!616195) (x!126163 lt!616195)))) (not (= lt!616197 (Intermediate!10536 false (index!44523 lt!616197) (x!126163 lt!616197))))))))

(declare-fun e!792884 () Bool)

(assert (=> b!1400425 e!792884))

(declare-fun res!938935 () Bool)

(assert (=> b!1400425 (=> (not res!938935) (not e!792884))))

(assert (=> b!1400425 (= res!938935 (and (not (undefined!11348 lt!616197)) (= (index!44523 lt!616197) i!1037) (bvslt (x!126163 lt!616197) (x!126163 lt!616195)) (= (select (store (arr!46219 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44523 lt!616197)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47076 0))(
  ( (Unit!47077) )
))
(declare-fun lt!616194 () Unit!47076)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47076)

(assert (=> b!1400425 (= lt!616194 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616196 (x!126163 lt!616195) (index!44523 lt!616195) (x!126163 lt!616197) (index!44523 lt!616197) (undefined!11348 lt!616197) mask!2840))))

(declare-fun b!1400426 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95737 (_ BitVec 32)) SeekEntryResult!10536)

(assert (=> b!1400426 (= e!792884 (= (seekEntryOrOpen!0 lt!616193 lt!616190 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126163 lt!616197) (index!44523 lt!616197) (index!44523 lt!616197) (select (arr!46219 a!2901) j!112) lt!616190 mask!2840)))))

(declare-fun b!1400427 () Bool)

(declare-fun res!938934 () Bool)

(assert (=> b!1400427 (=> (not res!938934) (not e!792890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95737 (_ BitVec 32)) Bool)

(assert (=> b!1400427 (= res!938934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!938933 () Bool)

(assert (=> start!120328 (=> (not res!938933) (not e!792890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120328 (= res!938933 (validMask!0 mask!2840))))

(assert (=> start!120328 e!792890))

(assert (=> start!120328 true))

(declare-fun array_inv!35247 (array!95737) Bool)

(assert (=> start!120328 (array_inv!35247 a!2901)))

(declare-fun b!1400428 () Bool)

(declare-fun e!792885 () Bool)

(assert (=> b!1400428 (= e!792890 (not e!792885))))

(declare-fun res!938941 () Bool)

(assert (=> b!1400428 (=> res!938941 e!792885)))

(assert (=> b!1400428 (= res!938941 (or (not (is-Intermediate!10536 lt!616195)) (undefined!11348 lt!616195)))))

(assert (=> b!1400428 e!792889))

(declare-fun res!938938 () Bool)

(assert (=> b!1400428 (=> (not res!938938) (not e!792889))))

(assert (=> b!1400428 (= res!938938 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616192 () Unit!47076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47076)

(assert (=> b!1400428 (= lt!616192 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400428 (= lt!616195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616196 (select (arr!46219 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400428 (= lt!616196 (toIndex!0 (select (arr!46219 a!2901) j!112) mask!2840))))

(declare-fun b!1400429 () Bool)

(assert (=> b!1400429 (= e!792885 e!792887)))

(declare-fun res!938939 () Bool)

(assert (=> b!1400429 (=> res!938939 e!792887)))

(assert (=> b!1400429 (= res!938939 (or (= lt!616195 lt!616197) (not (is-Intermediate!10536 lt!616197))))))

(assert (=> b!1400429 (= lt!616197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616193 mask!2840) lt!616193 lt!616190 mask!2840))))

(assert (=> b!1400429 (= lt!616193 (select (store (arr!46219 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400429 (= lt!616190 (array!95738 (store (arr!46219 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46769 a!2901)))))

(declare-fun b!1400430 () Bool)

(declare-fun res!938936 () Bool)

(assert (=> b!1400430 (=> (not res!938936) (not e!792890))))

(assert (=> b!1400430 (= res!938936 (and (= (size!46769 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46769 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46769 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120328 res!938933) b!1400430))

(assert (= (and b!1400430 res!938936) b!1400422))

(assert (= (and b!1400422 res!938932) b!1400421))

(assert (= (and b!1400421 res!938931) b!1400427))

(assert (= (and b!1400427 res!938934) b!1400423))

(assert (= (and b!1400423 res!938940) b!1400428))

(assert (= (and b!1400428 res!938938) b!1400420))

(assert (= (and b!1400428 (not res!938941)) b!1400429))

(assert (= (and b!1400429 (not res!938939)) b!1400425))

(assert (= (and b!1400425 res!938935) b!1400426))

(assert (= (and b!1400425 (not res!938937)) b!1400424))

(declare-fun m!1287865 () Bool)

(assert (=> b!1400420 m!1287865))

(assert (=> b!1400420 m!1287865))

(declare-fun m!1287867 () Bool)

(assert (=> b!1400420 m!1287867))

(declare-fun m!1287869 () Bool)

(assert (=> b!1400424 m!1287869))

(assert (=> b!1400421 m!1287865))

(assert (=> b!1400421 m!1287865))

(declare-fun m!1287871 () Bool)

(assert (=> b!1400421 m!1287871))

(declare-fun m!1287873 () Bool)

(assert (=> b!1400422 m!1287873))

(assert (=> b!1400422 m!1287873))

(declare-fun m!1287875 () Bool)

(assert (=> b!1400422 m!1287875))

(declare-fun m!1287877 () Bool)

(assert (=> b!1400426 m!1287877))

(assert (=> b!1400426 m!1287865))

(assert (=> b!1400426 m!1287865))

(declare-fun m!1287879 () Bool)

(assert (=> b!1400426 m!1287879))

(declare-fun m!1287881 () Bool)

(assert (=> start!120328 m!1287881))

(declare-fun m!1287883 () Bool)

(assert (=> start!120328 m!1287883))

(declare-fun m!1287885 () Bool)

(assert (=> b!1400425 m!1287885))

(declare-fun m!1287887 () Bool)

(assert (=> b!1400425 m!1287887))

(declare-fun m!1287889 () Bool)

(assert (=> b!1400425 m!1287889))

(declare-fun m!1287891 () Bool)

(assert (=> b!1400423 m!1287891))

(assert (=> b!1400428 m!1287865))

(declare-fun m!1287893 () Bool)

(assert (=> b!1400428 m!1287893))

(assert (=> b!1400428 m!1287865))

(assert (=> b!1400428 m!1287865))

(declare-fun m!1287895 () Bool)

(assert (=> b!1400428 m!1287895))

(declare-fun m!1287897 () Bool)

(assert (=> b!1400428 m!1287897))

(declare-fun m!1287899 () Bool)

(assert (=> b!1400428 m!1287899))

(declare-fun m!1287901 () Bool)

(assert (=> b!1400429 m!1287901))

(assert (=> b!1400429 m!1287901))

(declare-fun m!1287903 () Bool)

(assert (=> b!1400429 m!1287903))

(assert (=> b!1400429 m!1287885))

(declare-fun m!1287905 () Bool)

(assert (=> b!1400429 m!1287905))

(declare-fun m!1287907 () Bool)

(assert (=> b!1400427 m!1287907))

(push 1)

