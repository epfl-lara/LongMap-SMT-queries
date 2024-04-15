; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130224 () Bool)

(assert start!130224)

(declare-fun b!1529183 () Bool)

(declare-fun res!1047077 () Bool)

(declare-fun e!852158 () Bool)

(assert (=> b!1529183 (=> (not res!1047077) (not e!852158))))

(declare-datatypes ((array!101572 0))(
  ( (array!101573 (arr!49012 (Array (_ BitVec 32) (_ BitVec 64))) (size!49564 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101572)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101572 (_ BitVec 32)) Bool)

(assert (=> b!1529183 (= res!1047077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529184 () Bool)

(declare-fun e!852159 () Bool)

(declare-fun e!852157 () Bool)

(assert (=> b!1529184 (= e!852159 (not e!852157))))

(declare-fun res!1047074 () Bool)

(assert (=> b!1529184 (=> res!1047074 e!852157)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529184 (= res!1047074 (or (not (= (select (arr!49012 a!2804) j!70) (select (store (arr!49012 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852160 () Bool)

(assert (=> b!1529184 e!852160))

(declare-fun res!1047075 () Bool)

(assert (=> b!1529184 (=> (not res!1047075) (not e!852160))))

(assert (=> b!1529184 (= res!1047075 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51023 0))(
  ( (Unit!51024) )
))
(declare-fun lt!662169 () Unit!51023)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101572 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51023)

(assert (=> b!1529184 (= lt!662169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529185 () Bool)

(declare-fun res!1047083 () Bool)

(assert (=> b!1529185 (=> (not res!1047083) (not e!852158))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529185 (= res!1047083 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49564 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49564 a!2804))))))

(declare-fun b!1529186 () Bool)

(assert (=> b!1529186 (= e!852158 e!852159)))

(declare-fun res!1047078 () Bool)

(assert (=> b!1529186 (=> (not res!1047078) (not e!852159))))

(declare-datatypes ((SeekEntryResult!13200 0))(
  ( (MissingZero!13200 (index!55195 (_ BitVec 32))) (Found!13200 (index!55196 (_ BitVec 32))) (Intermediate!13200 (undefined!14012 Bool) (index!55197 (_ BitVec 32)) (x!136882 (_ BitVec 32))) (Undefined!13200) (MissingVacant!13200 (index!55198 (_ BitVec 32))) )
))
(declare-fun lt!662167 () SeekEntryResult!13200)

(declare-fun lt!662166 () SeekEntryResult!13200)

(assert (=> b!1529186 (= res!1047078 (= lt!662167 lt!662166))))

(assert (=> b!1529186 (= lt!662166 (Intermediate!13200 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101572 (_ BitVec 32)) SeekEntryResult!13200)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529186 (= lt!662167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49012 a!2804) j!70) mask!2512) (select (arr!49012 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529187 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101572 (_ BitVec 32)) SeekEntryResult!13200)

(assert (=> b!1529187 (= e!852160 (= (seekEntry!0 (select (arr!49012 a!2804) j!70) a!2804 mask!2512) (Found!13200 j!70)))))

(declare-fun b!1529188 () Bool)

(declare-fun res!1047084 () Bool)

(assert (=> b!1529188 (=> (not res!1047084) (not e!852158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529188 (= res!1047084 (validKeyInArray!0 (select (arr!49012 a!2804) i!961)))))

(declare-fun b!1529189 () Bool)

(declare-fun res!1047081 () Bool)

(assert (=> b!1529189 (=> (not res!1047081) (not e!852159))))

(assert (=> b!1529189 (= res!1047081 (= lt!662167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49012 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49012 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101573 (store (arr!49012 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49564 a!2804)) mask!2512)))))

(declare-fun b!1529191 () Bool)

(declare-fun res!1047082 () Bool)

(assert (=> b!1529191 (=> (not res!1047082) (not e!852158))))

(assert (=> b!1529191 (= res!1047082 (validKeyInArray!0 (select (arr!49012 a!2804) j!70)))))

(declare-fun b!1529192 () Bool)

(declare-fun res!1047079 () Bool)

(assert (=> b!1529192 (=> (not res!1047079) (not e!852159))))

(assert (=> b!1529192 (= res!1047079 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49012 a!2804) j!70) a!2804 mask!2512) lt!662166))))

(declare-fun b!1529193 () Bool)

(declare-fun res!1047080 () Bool)

(assert (=> b!1529193 (=> (not res!1047080) (not e!852158))))

(assert (=> b!1529193 (= res!1047080 (and (= (size!49564 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49564 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49564 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529194 () Bool)

(declare-fun res!1047076 () Bool)

(assert (=> b!1529194 (=> (not res!1047076) (not e!852158))))

(declare-datatypes ((List!35573 0))(
  ( (Nil!35570) (Cons!35569 (h!37006 (_ BitVec 64)) (t!50259 List!35573)) )
))
(declare-fun arrayNoDuplicates!0 (array!101572 (_ BitVec 32) List!35573) Bool)

(assert (=> b!1529194 (= res!1047076 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35570))))

(declare-fun res!1047085 () Bool)

(assert (=> start!130224 (=> (not res!1047085) (not e!852158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130224 (= res!1047085 (validMask!0 mask!2512))))

(assert (=> start!130224 e!852158))

(assert (=> start!130224 true))

(declare-fun array_inv!38245 (array!101572) Bool)

(assert (=> start!130224 (array_inv!38245 a!2804)))

(declare-fun b!1529190 () Bool)

(assert (=> b!1529190 (= e!852157 true)))

(declare-fun lt!662168 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529190 (= lt!662168 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130224 res!1047085) b!1529193))

(assert (= (and b!1529193 res!1047080) b!1529188))

(assert (= (and b!1529188 res!1047084) b!1529191))

(assert (= (and b!1529191 res!1047082) b!1529183))

(assert (= (and b!1529183 res!1047077) b!1529194))

(assert (= (and b!1529194 res!1047076) b!1529185))

(assert (= (and b!1529185 res!1047083) b!1529186))

(assert (= (and b!1529186 res!1047078) b!1529192))

(assert (= (and b!1529192 res!1047079) b!1529189))

(assert (= (and b!1529189 res!1047081) b!1529184))

(assert (= (and b!1529184 res!1047075) b!1529187))

(assert (= (and b!1529184 (not res!1047074)) b!1529190))

(declare-fun m!1411553 () Bool)

(assert (=> b!1529190 m!1411553))

(declare-fun m!1411555 () Bool)

(assert (=> b!1529191 m!1411555))

(assert (=> b!1529191 m!1411555))

(declare-fun m!1411557 () Bool)

(assert (=> b!1529191 m!1411557))

(declare-fun m!1411559 () Bool)

(assert (=> b!1529194 m!1411559))

(declare-fun m!1411561 () Bool)

(assert (=> b!1529188 m!1411561))

(assert (=> b!1529188 m!1411561))

(declare-fun m!1411563 () Bool)

(assert (=> b!1529188 m!1411563))

(declare-fun m!1411565 () Bool)

(assert (=> b!1529189 m!1411565))

(declare-fun m!1411567 () Bool)

(assert (=> b!1529189 m!1411567))

(assert (=> b!1529189 m!1411567))

(declare-fun m!1411569 () Bool)

(assert (=> b!1529189 m!1411569))

(assert (=> b!1529189 m!1411569))

(assert (=> b!1529189 m!1411567))

(declare-fun m!1411571 () Bool)

(assert (=> b!1529189 m!1411571))

(assert (=> b!1529192 m!1411555))

(assert (=> b!1529192 m!1411555))

(declare-fun m!1411573 () Bool)

(assert (=> b!1529192 m!1411573))

(assert (=> b!1529184 m!1411555))

(declare-fun m!1411575 () Bool)

(assert (=> b!1529184 m!1411575))

(assert (=> b!1529184 m!1411565))

(assert (=> b!1529184 m!1411567))

(declare-fun m!1411577 () Bool)

(assert (=> b!1529184 m!1411577))

(declare-fun m!1411579 () Bool)

(assert (=> b!1529183 m!1411579))

(assert (=> b!1529187 m!1411555))

(assert (=> b!1529187 m!1411555))

(declare-fun m!1411581 () Bool)

(assert (=> b!1529187 m!1411581))

(assert (=> b!1529186 m!1411555))

(assert (=> b!1529186 m!1411555))

(declare-fun m!1411583 () Bool)

(assert (=> b!1529186 m!1411583))

(assert (=> b!1529186 m!1411583))

(assert (=> b!1529186 m!1411555))

(declare-fun m!1411585 () Bool)

(assert (=> b!1529186 m!1411585))

(declare-fun m!1411587 () Bool)

(assert (=> start!130224 m!1411587))

(declare-fun m!1411589 () Bool)

(assert (=> start!130224 m!1411589))

(check-sat (not b!1529194) (not b!1529189) (not b!1529188) (not b!1529192) (not b!1529184) (not b!1529191) (not b!1529187) (not b!1529186) (not start!130224) (not b!1529183) (not b!1529190))
(check-sat)
