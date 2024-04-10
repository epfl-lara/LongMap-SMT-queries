; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119704 () Bool)

(assert start!119704)

(declare-fun b!1394413 () Bool)

(declare-fun e!789494 () Bool)

(declare-fun e!789491 () Bool)

(assert (=> b!1394413 (= e!789494 e!789491)))

(declare-fun res!933821 () Bool)

(assert (=> b!1394413 (=> res!933821 e!789491)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10368 0))(
  ( (MissingZero!10368 (index!43843 (_ BitVec 32))) (Found!10368 (index!43844 (_ BitVec 32))) (Intermediate!10368 (undefined!11180 Bool) (index!43845 (_ BitVec 32)) (x!125508 (_ BitVec 32))) (Undefined!10368) (MissingVacant!10368 (index!43846 (_ BitVec 32))) )
))
(declare-fun lt!612452 () SeekEntryResult!10368)

(declare-datatypes ((array!95386 0))(
  ( (array!95387 (arr!46051 (Array (_ BitVec 32) (_ BitVec 64))) (size!46601 (_ BitVec 32))) )
))
(declare-fun lt!612451 () array!95386)

(declare-fun lt!612453 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95386 (_ BitVec 32)) SeekEntryResult!10368)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394413 (= res!933821 (not (= lt!612452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612453 mask!2840) lt!612453 lt!612451 mask!2840))))))

(declare-fun a!2901 () array!95386)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394413 (= lt!612453 (select (store (arr!46051 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394413 (= lt!612451 (array!95387 (store (arr!46051 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46601 a!2901)))))

(declare-fun b!1394414 () Bool)

(declare-fun res!933828 () Bool)

(declare-fun e!789493 () Bool)

(assert (=> b!1394414 (=> (not res!933828) (not e!789493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394414 (= res!933828 (validKeyInArray!0 (select (arr!46051 a!2901) i!1037)))))

(declare-fun res!933822 () Bool)

(assert (=> start!119704 (=> (not res!933822) (not e!789493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119704 (= res!933822 (validMask!0 mask!2840))))

(assert (=> start!119704 e!789493))

(assert (=> start!119704 true))

(declare-fun array_inv!35079 (array!95386) Bool)

(assert (=> start!119704 (array_inv!35079 a!2901)))

(declare-fun b!1394415 () Bool)

(assert (=> b!1394415 (= e!789491 true)))

(declare-fun lt!612454 () SeekEntryResult!10368)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95386 (_ BitVec 32)) SeekEntryResult!10368)

(assert (=> b!1394415 (= lt!612454 (seekEntryOrOpen!0 lt!612453 lt!612451 mask!2840))))

(declare-fun lt!612455 () (_ BitVec 32))

(declare-datatypes ((Unit!46740 0))(
  ( (Unit!46741) )
))
(declare-fun lt!612456 () Unit!46740)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46740)

(assert (=> b!1394415 (= lt!612456 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612455 (x!125508 lt!612452) (index!43845 lt!612452) mask!2840))))

(declare-fun b!1394416 () Bool)

(declare-fun res!933823 () Bool)

(assert (=> b!1394416 (=> res!933823 e!789491)))

(assert (=> b!1394416 (= res!933823 (or (bvslt (x!125508 lt!612452) #b00000000000000000000000000000000) (bvsgt (x!125508 lt!612452) #b01111111111111111111111111111110) (bvslt lt!612455 #b00000000000000000000000000000000) (bvsge lt!612455 (size!46601 a!2901)) (bvslt (index!43845 lt!612452) #b00000000000000000000000000000000) (bvsge (index!43845 lt!612452) (size!46601 a!2901)) (not (= lt!612452 (Intermediate!10368 false (index!43845 lt!612452) (x!125508 lt!612452))))))))

(declare-fun b!1394417 () Bool)

(declare-fun res!933829 () Bool)

(assert (=> b!1394417 (=> (not res!933829) (not e!789493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95386 (_ BitVec 32)) Bool)

(assert (=> b!1394417 (= res!933829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394418 () Bool)

(assert (=> b!1394418 (= e!789493 (not e!789494))))

(declare-fun res!933826 () Bool)

(assert (=> b!1394418 (=> res!933826 e!789494)))

(assert (=> b!1394418 (= res!933826 (or (not (is-Intermediate!10368 lt!612452)) (undefined!11180 lt!612452)))))

(assert (=> b!1394418 (= lt!612454 (Found!10368 j!112))))

(assert (=> b!1394418 (= lt!612454 (seekEntryOrOpen!0 (select (arr!46051 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394418 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612450 () Unit!46740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46740)

(assert (=> b!1394418 (= lt!612450 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394418 (= lt!612452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612455 (select (arr!46051 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394418 (= lt!612455 (toIndex!0 (select (arr!46051 a!2901) j!112) mask!2840))))

(declare-fun b!1394419 () Bool)

(declare-fun res!933827 () Bool)

(assert (=> b!1394419 (=> (not res!933827) (not e!789493))))

(assert (=> b!1394419 (= res!933827 (and (= (size!46601 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46601 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46601 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394420 () Bool)

(declare-fun res!933824 () Bool)

(assert (=> b!1394420 (=> (not res!933824) (not e!789493))))

(assert (=> b!1394420 (= res!933824 (validKeyInArray!0 (select (arr!46051 a!2901) j!112)))))

(declare-fun b!1394421 () Bool)

(declare-fun res!933825 () Bool)

(assert (=> b!1394421 (=> (not res!933825) (not e!789493))))

(declare-datatypes ((List!32570 0))(
  ( (Nil!32567) (Cons!32566 (h!33799 (_ BitVec 64)) (t!47264 List!32570)) )
))
(declare-fun arrayNoDuplicates!0 (array!95386 (_ BitVec 32) List!32570) Bool)

(assert (=> b!1394421 (= res!933825 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32567))))

(assert (= (and start!119704 res!933822) b!1394419))

(assert (= (and b!1394419 res!933827) b!1394414))

(assert (= (and b!1394414 res!933828) b!1394420))

(assert (= (and b!1394420 res!933824) b!1394417))

(assert (= (and b!1394417 res!933829) b!1394421))

(assert (= (and b!1394421 res!933825) b!1394418))

(assert (= (and b!1394418 (not res!933826)) b!1394413))

(assert (= (and b!1394413 (not res!933821)) b!1394416))

(assert (= (and b!1394416 (not res!933823)) b!1394415))

(declare-fun m!1280725 () Bool)

(assert (=> b!1394413 m!1280725))

(assert (=> b!1394413 m!1280725))

(declare-fun m!1280727 () Bool)

(assert (=> b!1394413 m!1280727))

(declare-fun m!1280729 () Bool)

(assert (=> b!1394413 m!1280729))

(declare-fun m!1280731 () Bool)

(assert (=> b!1394413 m!1280731))

(declare-fun m!1280733 () Bool)

(assert (=> b!1394420 m!1280733))

(assert (=> b!1394420 m!1280733))

(declare-fun m!1280735 () Bool)

(assert (=> b!1394420 m!1280735))

(declare-fun m!1280737 () Bool)

(assert (=> start!119704 m!1280737))

(declare-fun m!1280739 () Bool)

(assert (=> start!119704 m!1280739))

(assert (=> b!1394418 m!1280733))

(declare-fun m!1280741 () Bool)

(assert (=> b!1394418 m!1280741))

(assert (=> b!1394418 m!1280733))

(declare-fun m!1280743 () Bool)

(assert (=> b!1394418 m!1280743))

(assert (=> b!1394418 m!1280733))

(declare-fun m!1280745 () Bool)

(assert (=> b!1394418 m!1280745))

(assert (=> b!1394418 m!1280733))

(declare-fun m!1280747 () Bool)

(assert (=> b!1394418 m!1280747))

(declare-fun m!1280749 () Bool)

(assert (=> b!1394418 m!1280749))

(declare-fun m!1280751 () Bool)

(assert (=> b!1394417 m!1280751))

(declare-fun m!1280753 () Bool)

(assert (=> b!1394414 m!1280753))

(assert (=> b!1394414 m!1280753))

(declare-fun m!1280755 () Bool)

(assert (=> b!1394414 m!1280755))

(declare-fun m!1280757 () Bool)

(assert (=> b!1394415 m!1280757))

(declare-fun m!1280759 () Bool)

(assert (=> b!1394415 m!1280759))

(declare-fun m!1280761 () Bool)

(assert (=> b!1394421 m!1280761))

(push 1)

