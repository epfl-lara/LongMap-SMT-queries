; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121416 () Bool)

(assert start!121416)

(declare-fun b!1410659 () Bool)

(declare-fun res!947887 () Bool)

(declare-fun e!798302 () Bool)

(assert (=> b!1410659 (=> (not res!947887) (not e!798302))))

(declare-datatypes ((array!96417 0))(
  ( (array!96418 (arr!46547 (Array (_ BitVec 32) (_ BitVec 64))) (size!47097 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96417)

(declare-datatypes ((List!33066 0))(
  ( (Nil!33063) (Cons!33062 (h!34334 (_ BitVec 64)) (t!47760 List!33066)) )
))
(declare-fun arrayNoDuplicates!0 (array!96417 (_ BitVec 32) List!33066) Bool)

(assert (=> b!1410659 (= res!947887 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33063))))

(declare-fun b!1410660 () Bool)

(declare-fun res!947889 () Bool)

(assert (=> b!1410660 (=> (not res!947889) (not e!798302))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410660 (= res!947889 (validKeyInArray!0 (select (arr!46547 a!2901) i!1037)))))

(declare-fun b!1410662 () Bool)

(declare-fun e!798299 () Bool)

(assert (=> b!1410662 (= e!798302 (not e!798299))))

(declare-fun res!947891 () Bool)

(assert (=> b!1410662 (=> res!947891 e!798299)))

(declare-datatypes ((SeekEntryResult!10858 0))(
  ( (MissingZero!10858 (index!45809 (_ BitVec 32))) (Found!10858 (index!45810 (_ BitVec 32))) (Intermediate!10858 (undefined!11670 Bool) (index!45811 (_ BitVec 32)) (x!127413 (_ BitVec 32))) (Undefined!10858) (MissingVacant!10858 (index!45812 (_ BitVec 32))) )
))
(declare-fun lt!621275 () SeekEntryResult!10858)

(assert (=> b!1410662 (= res!947891 (or (not (is-Intermediate!10858 lt!621275)) (undefined!11670 lt!621275)))))

(declare-fun e!798300 () Bool)

(assert (=> b!1410662 e!798300))

(declare-fun res!947893 () Bool)

(assert (=> b!1410662 (=> (not res!947893) (not e!798300))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96417 (_ BitVec 32)) Bool)

(assert (=> b!1410662 (= res!947893 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47690 0))(
  ( (Unit!47691) )
))
(declare-fun lt!621273 () Unit!47690)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96417 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47690)

(assert (=> b!1410662 (= lt!621273 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621274 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96417 (_ BitVec 32)) SeekEntryResult!10858)

(assert (=> b!1410662 (= lt!621275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621274 (select (arr!46547 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410662 (= lt!621274 (toIndex!0 (select (arr!46547 a!2901) j!112) mask!2840))))

(declare-fun b!1410663 () Bool)

(declare-fun lt!621276 () SeekEntryResult!10858)

(assert (=> b!1410663 (= e!798299 (or (= lt!621275 lt!621276) (not (is-Intermediate!10858 lt!621276)) (bvslt (x!127413 lt!621275) #b00000000000000000000000000000000) (bvsgt (x!127413 lt!621275) #b01111111111111111111111111111110) (bvslt lt!621274 #b00000000000000000000000000000000) (bvsge lt!621274 (size!47097 a!2901)) (bvslt (index!45811 lt!621275) #b00000000000000000000000000000000) (bvsge (index!45811 lt!621275) (size!47097 a!2901)) (= lt!621275 (Intermediate!10858 false (index!45811 lt!621275) (x!127413 lt!621275)))))))

(assert (=> b!1410663 (= lt!621276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46547 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46547 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96418 (store (arr!46547 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47097 a!2901)) mask!2840))))

(declare-fun b!1410664 () Bool)

(declare-fun res!947892 () Bool)

(assert (=> b!1410664 (=> (not res!947892) (not e!798302))))

(assert (=> b!1410664 (= res!947892 (and (= (size!47097 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47097 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47097 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410665 () Bool)

(declare-fun res!947886 () Bool)

(assert (=> b!1410665 (=> (not res!947886) (not e!798302))))

(assert (=> b!1410665 (= res!947886 (validKeyInArray!0 (select (arr!46547 a!2901) j!112)))))

(declare-fun b!1410666 () Bool)

(declare-fun res!947888 () Bool)

(assert (=> b!1410666 (=> (not res!947888) (not e!798302))))

(assert (=> b!1410666 (= res!947888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!947890 () Bool)

(assert (=> start!121416 (=> (not res!947890) (not e!798302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121416 (= res!947890 (validMask!0 mask!2840))))

(assert (=> start!121416 e!798302))

(assert (=> start!121416 true))

(declare-fun array_inv!35575 (array!96417) Bool)

(assert (=> start!121416 (array_inv!35575 a!2901)))

(declare-fun b!1410661 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96417 (_ BitVec 32)) SeekEntryResult!10858)

(assert (=> b!1410661 (= e!798300 (= (seekEntryOrOpen!0 (select (arr!46547 a!2901) j!112) a!2901 mask!2840) (Found!10858 j!112)))))

(assert (= (and start!121416 res!947890) b!1410664))

(assert (= (and b!1410664 res!947892) b!1410660))

(assert (= (and b!1410660 res!947889) b!1410665))

(assert (= (and b!1410665 res!947886) b!1410666))

(assert (= (and b!1410666 res!947888) b!1410659))

(assert (= (and b!1410659 res!947887) b!1410662))

(assert (= (and b!1410662 res!947893) b!1410661))

(assert (= (and b!1410662 (not res!947891)) b!1410663))

(declare-fun m!1300263 () Bool)

(assert (=> b!1410665 m!1300263))

(assert (=> b!1410665 m!1300263))

(declare-fun m!1300265 () Bool)

(assert (=> b!1410665 m!1300265))

(assert (=> b!1410661 m!1300263))

(assert (=> b!1410661 m!1300263))

(declare-fun m!1300267 () Bool)

(assert (=> b!1410661 m!1300267))

(assert (=> b!1410662 m!1300263))

(declare-fun m!1300269 () Bool)

(assert (=> b!1410662 m!1300269))

(assert (=> b!1410662 m!1300263))

(assert (=> b!1410662 m!1300263))

(declare-fun m!1300271 () Bool)

(assert (=> b!1410662 m!1300271))

(declare-fun m!1300273 () Bool)

(assert (=> b!1410662 m!1300273))

(declare-fun m!1300275 () Bool)

(assert (=> b!1410662 m!1300275))

(declare-fun m!1300277 () Bool)

(assert (=> b!1410659 m!1300277))

(declare-fun m!1300279 () Bool)

(assert (=> b!1410660 m!1300279))

(assert (=> b!1410660 m!1300279))

(declare-fun m!1300281 () Bool)

(assert (=> b!1410660 m!1300281))

(declare-fun m!1300283 () Bool)

(assert (=> start!121416 m!1300283))

(declare-fun m!1300285 () Bool)

(assert (=> start!121416 m!1300285))

(declare-fun m!1300287 () Bool)

(assert (=> b!1410666 m!1300287))

(declare-fun m!1300289 () Bool)

(assert (=> b!1410663 m!1300289))

(declare-fun m!1300291 () Bool)

(assert (=> b!1410663 m!1300291))

(assert (=> b!1410663 m!1300291))

(declare-fun m!1300293 () Bool)

(assert (=> b!1410663 m!1300293))

(assert (=> b!1410663 m!1300293))

(assert (=> b!1410663 m!1300291))

(declare-fun m!1300295 () Bool)

(assert (=> b!1410663 m!1300295))

(push 1)

