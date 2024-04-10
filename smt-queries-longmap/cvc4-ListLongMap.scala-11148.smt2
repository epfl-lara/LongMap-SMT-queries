; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130254 () Bool)

(assert start!130254)

(declare-fun e!852206 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101604 0))(
  ( (array!101605 (arr!49027 (Array (_ BitVec 32) (_ BitVec 64))) (size!49577 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101604)

(declare-fun b!1529136 () Bool)

(declare-datatypes ((SeekEntryResult!13192 0))(
  ( (MissingZero!13192 (index!55163 (_ BitVec 32))) (Found!13192 (index!55164 (_ BitVec 32))) (Intermediate!13192 (undefined!14004 Bool) (index!55165 (_ BitVec 32)) (x!136847 (_ BitVec 32))) (Undefined!13192) (MissingVacant!13192 (index!55166 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101604 (_ BitVec 32)) SeekEntryResult!13192)

(assert (=> b!1529136 (= e!852206 (= (seekEntry!0 (select (arr!49027 a!2804) j!70) a!2804 mask!2512) (Found!13192 j!70)))))

(declare-fun b!1529137 () Bool)

(declare-fun e!852207 () Bool)

(assert (=> b!1529137 (= e!852207 true)))

(declare-fun lt!662335 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529137 (= lt!662335 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529138 () Bool)

(declare-fun res!1046846 () Bool)

(declare-fun e!852208 () Bool)

(assert (=> b!1529138 (=> (not res!1046846) (not e!852208))))

(declare-fun lt!662332 () SeekEntryResult!13192)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101604 (_ BitVec 32)) SeekEntryResult!13192)

(assert (=> b!1529138 (= res!1046846 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49027 a!2804) j!70) a!2804 mask!2512) lt!662332))))

(declare-fun b!1529139 () Bool)

(declare-fun res!1046843 () Bool)

(declare-fun e!852204 () Bool)

(assert (=> b!1529139 (=> (not res!1046843) (not e!852204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101604 (_ BitVec 32)) Bool)

(assert (=> b!1529139 (= res!1046843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529140 () Bool)

(declare-fun res!1046845 () Bool)

(assert (=> b!1529140 (=> (not res!1046845) (not e!852204))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529140 (= res!1046845 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49577 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49577 a!2804))))))

(declare-fun b!1529141 () Bool)

(declare-fun res!1046844 () Bool)

(assert (=> b!1529141 (=> (not res!1046844) (not e!852204))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529141 (= res!1046844 (validKeyInArray!0 (select (arr!49027 a!2804) i!961)))))

(declare-fun res!1046850 () Bool)

(assert (=> start!130254 (=> (not res!1046850) (not e!852204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130254 (= res!1046850 (validMask!0 mask!2512))))

(assert (=> start!130254 e!852204))

(assert (=> start!130254 true))

(declare-fun array_inv!38055 (array!101604) Bool)

(assert (=> start!130254 (array_inv!38055 a!2804)))

(declare-fun b!1529142 () Bool)

(declare-fun res!1046852 () Bool)

(assert (=> b!1529142 (=> (not res!1046852) (not e!852208))))

(declare-fun lt!662334 () SeekEntryResult!13192)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529142 (= res!1046852 (= lt!662334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49027 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49027 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101605 (store (arr!49027 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49577 a!2804)) mask!2512)))))

(declare-fun b!1529143 () Bool)

(assert (=> b!1529143 (= e!852204 e!852208)))

(declare-fun res!1046851 () Bool)

(assert (=> b!1529143 (=> (not res!1046851) (not e!852208))))

(assert (=> b!1529143 (= res!1046851 (= lt!662334 lt!662332))))

(assert (=> b!1529143 (= lt!662332 (Intermediate!13192 false resIndex!21 resX!21))))

(assert (=> b!1529143 (= lt!662334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49027 a!2804) j!70) mask!2512) (select (arr!49027 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529144 () Bool)

(declare-fun res!1046847 () Bool)

(assert (=> b!1529144 (=> (not res!1046847) (not e!852204))))

(assert (=> b!1529144 (= res!1046847 (validKeyInArray!0 (select (arr!49027 a!2804) j!70)))))

(declare-fun b!1529145 () Bool)

(assert (=> b!1529145 (= e!852208 (not e!852207))))

(declare-fun res!1046848 () Bool)

(assert (=> b!1529145 (=> res!1046848 e!852207)))

(assert (=> b!1529145 (= res!1046848 (or (not (= (select (arr!49027 a!2804) j!70) (select (store (arr!49027 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529145 e!852206))

(declare-fun res!1046854 () Bool)

(assert (=> b!1529145 (=> (not res!1046854) (not e!852206))))

(assert (=> b!1529145 (= res!1046854 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51168 0))(
  ( (Unit!51169) )
))
(declare-fun lt!662333 () Unit!51168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51168)

(assert (=> b!1529145 (= lt!662333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529146 () Bool)

(declare-fun res!1046849 () Bool)

(assert (=> b!1529146 (=> (not res!1046849) (not e!852204))))

(declare-datatypes ((List!35510 0))(
  ( (Nil!35507) (Cons!35506 (h!36942 (_ BitVec 64)) (t!50204 List!35510)) )
))
(declare-fun arrayNoDuplicates!0 (array!101604 (_ BitVec 32) List!35510) Bool)

(assert (=> b!1529146 (= res!1046849 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35507))))

(declare-fun b!1529147 () Bool)

(declare-fun res!1046853 () Bool)

(assert (=> b!1529147 (=> (not res!1046853) (not e!852204))))

(assert (=> b!1529147 (= res!1046853 (and (= (size!49577 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49577 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49577 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130254 res!1046850) b!1529147))

(assert (= (and b!1529147 res!1046853) b!1529141))

(assert (= (and b!1529141 res!1046844) b!1529144))

(assert (= (and b!1529144 res!1046847) b!1529139))

(assert (= (and b!1529139 res!1046843) b!1529146))

(assert (= (and b!1529146 res!1046849) b!1529140))

(assert (= (and b!1529140 res!1046845) b!1529143))

(assert (= (and b!1529143 res!1046851) b!1529138))

(assert (= (and b!1529138 res!1046846) b!1529142))

(assert (= (and b!1529142 res!1046852) b!1529145))

(assert (= (and b!1529145 res!1046854) b!1529136))

(assert (= (and b!1529145 (not res!1046848)) b!1529137))

(declare-fun m!1412065 () Bool)

(assert (=> b!1529143 m!1412065))

(assert (=> b!1529143 m!1412065))

(declare-fun m!1412067 () Bool)

(assert (=> b!1529143 m!1412067))

(assert (=> b!1529143 m!1412067))

(assert (=> b!1529143 m!1412065))

(declare-fun m!1412069 () Bool)

(assert (=> b!1529143 m!1412069))

(declare-fun m!1412071 () Bool)

(assert (=> b!1529141 m!1412071))

(assert (=> b!1529141 m!1412071))

(declare-fun m!1412073 () Bool)

(assert (=> b!1529141 m!1412073))

(declare-fun m!1412075 () Bool)

(assert (=> b!1529137 m!1412075))

(declare-fun m!1412077 () Bool)

(assert (=> b!1529146 m!1412077))

(declare-fun m!1412079 () Bool)

(assert (=> b!1529139 m!1412079))

(assert (=> b!1529145 m!1412065))

(declare-fun m!1412081 () Bool)

(assert (=> b!1529145 m!1412081))

(declare-fun m!1412083 () Bool)

(assert (=> b!1529145 m!1412083))

(declare-fun m!1412085 () Bool)

(assert (=> b!1529145 m!1412085))

(declare-fun m!1412087 () Bool)

(assert (=> b!1529145 m!1412087))

(declare-fun m!1412089 () Bool)

(assert (=> start!130254 m!1412089))

(declare-fun m!1412091 () Bool)

(assert (=> start!130254 m!1412091))

(assert (=> b!1529138 m!1412065))

(assert (=> b!1529138 m!1412065))

(declare-fun m!1412093 () Bool)

(assert (=> b!1529138 m!1412093))

(assert (=> b!1529136 m!1412065))

(assert (=> b!1529136 m!1412065))

(declare-fun m!1412095 () Bool)

(assert (=> b!1529136 m!1412095))

(assert (=> b!1529142 m!1412083))

(assert (=> b!1529142 m!1412085))

(assert (=> b!1529142 m!1412085))

(declare-fun m!1412097 () Bool)

(assert (=> b!1529142 m!1412097))

(assert (=> b!1529142 m!1412097))

(assert (=> b!1529142 m!1412085))

(declare-fun m!1412099 () Bool)

(assert (=> b!1529142 m!1412099))

(assert (=> b!1529144 m!1412065))

(assert (=> b!1529144 m!1412065))

(declare-fun m!1412101 () Bool)

(assert (=> b!1529144 m!1412101))

(push 1)

