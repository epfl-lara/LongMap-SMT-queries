; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128640 () Bool)

(assert start!128640)

(declare-fun b!1507822 () Bool)

(declare-fun res!1027935 () Bool)

(declare-fun e!842442 () Bool)

(assert (=> b!1507822 (=> (not res!1027935) (not e!842442))))

(declare-datatypes ((array!100574 0))(
  ( (array!100575 (arr!48527 (Array (_ BitVec 32) (_ BitVec 64))) (size!49077 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100574)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507822 (= res!1027935 (validKeyInArray!0 (select (arr!48527 a!2804) i!961)))))

(declare-fun res!1027936 () Bool)

(assert (=> start!128640 (=> (not res!1027936) (not e!842442))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128640 (= res!1027936 (validMask!0 mask!2512))))

(assert (=> start!128640 e!842442))

(assert (=> start!128640 true))

(declare-fun array_inv!37555 (array!100574) Bool)

(assert (=> start!128640 (array_inv!37555 a!2804)))

(declare-fun b!1507823 () Bool)

(declare-fun res!1027940 () Bool)

(assert (=> b!1507823 (=> (not res!1027940) (not e!842442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100574 (_ BitVec 32)) Bool)

(assert (=> b!1507823 (= res!1027940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507824 () Bool)

(declare-fun res!1027938 () Bool)

(assert (=> b!1507824 (=> (not res!1027938) (not e!842442))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1507824 (= res!1027938 (validKeyInArray!0 (select (arr!48527 a!2804) j!70)))))

(declare-fun b!1507825 () Bool)

(declare-fun res!1027941 () Bool)

(assert (=> b!1507825 (=> (not res!1027941) (not e!842442))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507825 (= res!1027941 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49077 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49077 a!2804))))))

(declare-fun b!1507826 () Bool)

(assert (=> b!1507826 (= e!842442 false)))

(declare-datatypes ((SeekEntryResult!12698 0))(
  ( (MissingZero!12698 (index!53187 (_ BitVec 32))) (Found!12698 (index!53188 (_ BitVec 32))) (Intermediate!12698 (undefined!13510 Bool) (index!53189 (_ BitVec 32)) (x!134948 (_ BitVec 32))) (Undefined!12698) (MissingVacant!12698 (index!53190 (_ BitVec 32))) )
))
(declare-fun lt!654490 () SeekEntryResult!12698)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100574 (_ BitVec 32)) SeekEntryResult!12698)

(assert (=> b!1507826 (= lt!654490 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48527 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507827 () Bool)

(declare-fun res!1027937 () Bool)

(assert (=> b!1507827 (=> (not res!1027937) (not e!842442))))

(declare-datatypes ((List!35010 0))(
  ( (Nil!35007) (Cons!35006 (h!36412 (_ BitVec 64)) (t!49704 List!35010)) )
))
(declare-fun arrayNoDuplicates!0 (array!100574 (_ BitVec 32) List!35010) Bool)

(assert (=> b!1507827 (= res!1027937 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35007))))

(declare-fun b!1507828 () Bool)

(declare-fun res!1027942 () Bool)

(assert (=> b!1507828 (=> (not res!1027942) (not e!842442))))

(assert (=> b!1507828 (= res!1027942 (and (= (size!49077 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49077 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49077 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507829 () Bool)

(declare-fun res!1027939 () Bool)

(assert (=> b!1507829 (=> (not res!1027939) (not e!842442))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507829 (= res!1027939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48527 a!2804) j!70) mask!2512) (select (arr!48527 a!2804) j!70) a!2804 mask!2512) (Intermediate!12698 false resIndex!21 resX!21)))))

(assert (= (and start!128640 res!1027936) b!1507828))

(assert (= (and b!1507828 res!1027942) b!1507822))

(assert (= (and b!1507822 res!1027935) b!1507824))

(assert (= (and b!1507824 res!1027938) b!1507823))

(assert (= (and b!1507823 res!1027940) b!1507827))

(assert (= (and b!1507827 res!1027937) b!1507825))

(assert (= (and b!1507825 res!1027941) b!1507829))

(assert (= (and b!1507829 res!1027939) b!1507826))

(declare-fun m!1390453 () Bool)

(assert (=> b!1507826 m!1390453))

(assert (=> b!1507826 m!1390453))

(declare-fun m!1390455 () Bool)

(assert (=> b!1507826 m!1390455))

(declare-fun m!1390457 () Bool)

(assert (=> start!128640 m!1390457))

(declare-fun m!1390459 () Bool)

(assert (=> start!128640 m!1390459))

(declare-fun m!1390461 () Bool)

(assert (=> b!1507823 m!1390461))

(declare-fun m!1390463 () Bool)

(assert (=> b!1507822 m!1390463))

(assert (=> b!1507822 m!1390463))

(declare-fun m!1390465 () Bool)

(assert (=> b!1507822 m!1390465))

(assert (=> b!1507824 m!1390453))

(assert (=> b!1507824 m!1390453))

(declare-fun m!1390467 () Bool)

(assert (=> b!1507824 m!1390467))

(declare-fun m!1390469 () Bool)

(assert (=> b!1507827 m!1390469))

(assert (=> b!1507829 m!1390453))

(assert (=> b!1507829 m!1390453))

(declare-fun m!1390471 () Bool)

(assert (=> b!1507829 m!1390471))

(assert (=> b!1507829 m!1390471))

(assert (=> b!1507829 m!1390453))

(declare-fun m!1390473 () Bool)

(assert (=> b!1507829 m!1390473))

(push 1)

(assert (not start!128640))

(assert (not b!1507824))

(assert (not b!1507827))

(assert (not b!1507822))

(assert (not b!1507826))

(assert (not b!1507823))

(assert (not b!1507829))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

