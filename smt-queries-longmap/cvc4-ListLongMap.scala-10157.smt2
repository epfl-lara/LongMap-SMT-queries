; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119710 () Bool)

(assert start!119710)

(declare-fun b!1394494 () Bool)

(declare-fun res!933908 () Bool)

(declare-fun e!789528 () Bool)

(assert (=> b!1394494 (=> (not res!933908) (not e!789528))))

(declare-datatypes ((array!95392 0))(
  ( (array!95393 (arr!46054 (Array (_ BitVec 32) (_ BitVec 64))) (size!46604 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95392)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394494 (= res!933908 (validKeyInArray!0 (select (arr!46054 a!2901) i!1037)))))

(declare-fun b!1394495 () Bool)

(declare-fun e!789530 () Bool)

(assert (=> b!1394495 (= e!789528 (not e!789530))))

(declare-fun res!933904 () Bool)

(assert (=> b!1394495 (=> res!933904 e!789530)))

(declare-datatypes ((SeekEntryResult!10371 0))(
  ( (MissingZero!10371 (index!43855 (_ BitVec 32))) (Found!10371 (index!43856 (_ BitVec 32))) (Intermediate!10371 (undefined!11183 Bool) (index!43857 (_ BitVec 32)) (x!125519 (_ BitVec 32))) (Undefined!10371) (MissingVacant!10371 (index!43858 (_ BitVec 32))) )
))
(declare-fun lt!612519 () SeekEntryResult!10371)

(assert (=> b!1394495 (= res!933904 (or (not (is-Intermediate!10371 lt!612519)) (undefined!11183 lt!612519)))))

(declare-fun lt!612516 () SeekEntryResult!10371)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394495 (= lt!612516 (Found!10371 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95392 (_ BitVec 32)) SeekEntryResult!10371)

(assert (=> b!1394495 (= lt!612516 (seekEntryOrOpen!0 (select (arr!46054 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95392 (_ BitVec 32)) Bool)

(assert (=> b!1394495 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46746 0))(
  ( (Unit!46747) )
))
(declare-fun lt!612513 () Unit!46746)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46746)

(assert (=> b!1394495 (= lt!612513 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!612517 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95392 (_ BitVec 32)) SeekEntryResult!10371)

(assert (=> b!1394495 (= lt!612519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612517 (select (arr!46054 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394495 (= lt!612517 (toIndex!0 (select (arr!46054 a!2901) j!112) mask!2840))))

(declare-fun b!1394496 () Bool)

(declare-fun res!933910 () Bool)

(assert (=> b!1394496 (=> (not res!933910) (not e!789528))))

(declare-datatypes ((List!32573 0))(
  ( (Nil!32570) (Cons!32569 (h!33802 (_ BitVec 64)) (t!47267 List!32573)) )
))
(declare-fun arrayNoDuplicates!0 (array!95392 (_ BitVec 32) List!32573) Bool)

(assert (=> b!1394496 (= res!933910 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32570))))

(declare-fun b!1394498 () Bool)

(declare-fun res!933907 () Bool)

(assert (=> b!1394498 (=> (not res!933907) (not e!789528))))

(assert (=> b!1394498 (= res!933907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394499 () Bool)

(declare-fun e!789527 () Bool)

(assert (=> b!1394499 (= e!789527 true)))

(declare-fun lt!612514 () (_ BitVec 64))

(declare-fun lt!612515 () array!95392)

(assert (=> b!1394499 (= lt!612516 (seekEntryOrOpen!0 lt!612514 lt!612515 mask!2840))))

(declare-fun lt!612518 () Unit!46746)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95392 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46746)

(assert (=> b!1394499 (= lt!612518 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612517 (x!125519 lt!612519) (index!43857 lt!612519) mask!2840))))

(declare-fun b!1394500 () Bool)

(declare-fun res!933902 () Bool)

(assert (=> b!1394500 (=> (not res!933902) (not e!789528))))

(assert (=> b!1394500 (= res!933902 (and (= (size!46604 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46604 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46604 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394501 () Bool)

(declare-fun res!933903 () Bool)

(assert (=> b!1394501 (=> (not res!933903) (not e!789528))))

(assert (=> b!1394501 (= res!933903 (validKeyInArray!0 (select (arr!46054 a!2901) j!112)))))

(declare-fun b!1394502 () Bool)

(assert (=> b!1394502 (= e!789530 e!789527)))

(declare-fun res!933905 () Bool)

(assert (=> b!1394502 (=> res!933905 e!789527)))

(assert (=> b!1394502 (= res!933905 (not (= lt!612519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612514 mask!2840) lt!612514 lt!612515 mask!2840))))))

(assert (=> b!1394502 (= lt!612514 (select (store (arr!46054 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394502 (= lt!612515 (array!95393 (store (arr!46054 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46604 a!2901)))))

(declare-fun b!1394497 () Bool)

(declare-fun res!933906 () Bool)

(assert (=> b!1394497 (=> res!933906 e!789527)))

(assert (=> b!1394497 (= res!933906 (or (bvslt (x!125519 lt!612519) #b00000000000000000000000000000000) (bvsgt (x!125519 lt!612519) #b01111111111111111111111111111110) (bvslt lt!612517 #b00000000000000000000000000000000) (bvsge lt!612517 (size!46604 a!2901)) (bvslt (index!43857 lt!612519) #b00000000000000000000000000000000) (bvsge (index!43857 lt!612519) (size!46604 a!2901)) (not (= lt!612519 (Intermediate!10371 false (index!43857 lt!612519) (x!125519 lt!612519))))))))

(declare-fun res!933909 () Bool)

(assert (=> start!119710 (=> (not res!933909) (not e!789528))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119710 (= res!933909 (validMask!0 mask!2840))))

(assert (=> start!119710 e!789528))

(assert (=> start!119710 true))

(declare-fun array_inv!35082 (array!95392) Bool)

(assert (=> start!119710 (array_inv!35082 a!2901)))

(assert (= (and start!119710 res!933909) b!1394500))

(assert (= (and b!1394500 res!933902) b!1394494))

(assert (= (and b!1394494 res!933908) b!1394501))

(assert (= (and b!1394501 res!933903) b!1394498))

(assert (= (and b!1394498 res!933907) b!1394496))

(assert (= (and b!1394496 res!933910) b!1394495))

(assert (= (and b!1394495 (not res!933904)) b!1394502))

(assert (= (and b!1394502 (not res!933905)) b!1394497))

(assert (= (and b!1394497 (not res!933906)) b!1394499))

(declare-fun m!1280839 () Bool)

(assert (=> b!1394501 m!1280839))

(assert (=> b!1394501 m!1280839))

(declare-fun m!1280841 () Bool)

(assert (=> b!1394501 m!1280841))

(declare-fun m!1280843 () Bool)

(assert (=> start!119710 m!1280843))

(declare-fun m!1280845 () Bool)

(assert (=> start!119710 m!1280845))

(declare-fun m!1280847 () Bool)

(assert (=> b!1394494 m!1280847))

(assert (=> b!1394494 m!1280847))

(declare-fun m!1280849 () Bool)

(assert (=> b!1394494 m!1280849))

(declare-fun m!1280851 () Bool)

(assert (=> b!1394499 m!1280851))

(declare-fun m!1280853 () Bool)

(assert (=> b!1394499 m!1280853))

(declare-fun m!1280855 () Bool)

(assert (=> b!1394496 m!1280855))

(declare-fun m!1280857 () Bool)

(assert (=> b!1394502 m!1280857))

(assert (=> b!1394502 m!1280857))

(declare-fun m!1280859 () Bool)

(assert (=> b!1394502 m!1280859))

(declare-fun m!1280861 () Bool)

(assert (=> b!1394502 m!1280861))

(declare-fun m!1280863 () Bool)

(assert (=> b!1394502 m!1280863))

(declare-fun m!1280865 () Bool)

(assert (=> b!1394498 m!1280865))

(assert (=> b!1394495 m!1280839))

(declare-fun m!1280867 () Bool)

(assert (=> b!1394495 m!1280867))

(assert (=> b!1394495 m!1280839))

(assert (=> b!1394495 m!1280839))

(declare-fun m!1280869 () Bool)

(assert (=> b!1394495 m!1280869))

(declare-fun m!1280871 () Bool)

(assert (=> b!1394495 m!1280871))

(assert (=> b!1394495 m!1280839))

(declare-fun m!1280873 () Bool)

(assert (=> b!1394495 m!1280873))

(declare-fun m!1280875 () Bool)

(assert (=> b!1394495 m!1280875))

(push 1)

