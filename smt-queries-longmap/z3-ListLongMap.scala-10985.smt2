; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128648 () Bool)

(assert start!128648)

(declare-fun b!1507907 () Bool)

(declare-fun e!842426 () Bool)

(declare-fun e!842425 () Bool)

(assert (=> b!1507907 (= e!842426 e!842425)))

(declare-fun res!1028122 () Bool)

(assert (=> b!1507907 (=> (not res!1028122) (not e!842425))))

(declare-datatypes ((SeekEntryResult!12705 0))(
  ( (MissingZero!12705 (index!53215 (_ BitVec 32))) (Found!12705 (index!53216 (_ BitVec 32))) (Intermediate!12705 (undefined!13517 Bool) (index!53217 (_ BitVec 32)) (x!134979 (_ BitVec 32))) (Undefined!12705) (MissingVacant!12705 (index!53218 (_ BitVec 32))) )
))
(declare-fun lt!654293 () SeekEntryResult!12705)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100543 0))(
  ( (array!100544 (arr!48511 (Array (_ BitVec 32) (_ BitVec 64))) (size!49063 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100543)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100543 (_ BitVec 32)) SeekEntryResult!12705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507907 (= res!1028122 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48511 a!2804) j!70) mask!2512) (select (arr!48511 a!2804) j!70) a!2804 mask!2512) lt!654293))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507907 (= lt!654293 (Intermediate!12705 false resIndex!21 resX!21))))

(declare-fun b!1507908 () Bool)

(declare-fun res!1028121 () Bool)

(assert (=> b!1507908 (=> (not res!1028121) (not e!842426))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507908 (= res!1028121 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49063 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49063 a!2804))))))

(declare-fun b!1507909 () Bool)

(declare-fun res!1028126 () Bool)

(assert (=> b!1507909 (=> (not res!1028126) (not e!842426))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507909 (= res!1028126 (and (= (size!49063 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49063 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49063 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507910 () Bool)

(declare-fun res!1028128 () Bool)

(assert (=> b!1507910 (=> (not res!1028128) (not e!842425))))

(assert (=> b!1507910 (= res!1028128 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48511 a!2804) j!70) a!2804 mask!2512) lt!654293))))

(declare-fun res!1028124 () Bool)

(assert (=> start!128648 (=> (not res!1028124) (not e!842426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128648 (= res!1028124 (validMask!0 mask!2512))))

(assert (=> start!128648 e!842426))

(assert (=> start!128648 true))

(declare-fun array_inv!37744 (array!100543) Bool)

(assert (=> start!128648 (array_inv!37744 a!2804)))

(declare-fun b!1507911 () Bool)

(assert (=> b!1507911 (= e!842425 false)))

(declare-fun lt!654294 () (_ BitVec 32))

(assert (=> b!1507911 (= lt!654294 (toIndex!0 (select (store (arr!48511 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1507912 () Bool)

(declare-fun res!1028123 () Bool)

(assert (=> b!1507912 (=> (not res!1028123) (not e!842426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507912 (= res!1028123 (validKeyInArray!0 (select (arr!48511 a!2804) i!961)))))

(declare-fun b!1507913 () Bool)

(declare-fun res!1028125 () Bool)

(assert (=> b!1507913 (=> (not res!1028125) (not e!842426))))

(assert (=> b!1507913 (= res!1028125 (validKeyInArray!0 (select (arr!48511 a!2804) j!70)))))

(declare-fun b!1507914 () Bool)

(declare-fun res!1028129 () Bool)

(assert (=> b!1507914 (=> (not res!1028129) (not e!842426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100543 (_ BitVec 32)) Bool)

(assert (=> b!1507914 (= res!1028129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507915 () Bool)

(declare-fun res!1028127 () Bool)

(assert (=> b!1507915 (=> (not res!1028127) (not e!842426))))

(declare-datatypes ((List!35072 0))(
  ( (Nil!35069) (Cons!35068 (h!36478 (_ BitVec 64)) (t!49758 List!35072)) )
))
(declare-fun arrayNoDuplicates!0 (array!100543 (_ BitVec 32) List!35072) Bool)

(assert (=> b!1507915 (= res!1028127 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35069))))

(assert (= (and start!128648 res!1028124) b!1507909))

(assert (= (and b!1507909 res!1028126) b!1507912))

(assert (= (and b!1507912 res!1028123) b!1507913))

(assert (= (and b!1507913 res!1028125) b!1507914))

(assert (= (and b!1507914 res!1028129) b!1507915))

(assert (= (and b!1507915 res!1028127) b!1507908))

(assert (= (and b!1507908 res!1028121) b!1507907))

(assert (= (and b!1507907 res!1028122) b!1507910))

(assert (= (and b!1507910 res!1028128) b!1507911))

(declare-fun m!1389839 () Bool)

(assert (=> b!1507915 m!1389839))

(declare-fun m!1389841 () Bool)

(assert (=> b!1507912 m!1389841))

(assert (=> b!1507912 m!1389841))

(declare-fun m!1389843 () Bool)

(assert (=> b!1507912 m!1389843))

(declare-fun m!1389845 () Bool)

(assert (=> b!1507913 m!1389845))

(assert (=> b!1507913 m!1389845))

(declare-fun m!1389847 () Bool)

(assert (=> b!1507913 m!1389847))

(assert (=> b!1507907 m!1389845))

(assert (=> b!1507907 m!1389845))

(declare-fun m!1389849 () Bool)

(assert (=> b!1507907 m!1389849))

(assert (=> b!1507907 m!1389849))

(assert (=> b!1507907 m!1389845))

(declare-fun m!1389851 () Bool)

(assert (=> b!1507907 m!1389851))

(declare-fun m!1389853 () Bool)

(assert (=> start!128648 m!1389853))

(declare-fun m!1389855 () Bool)

(assert (=> start!128648 m!1389855))

(declare-fun m!1389857 () Bool)

(assert (=> b!1507911 m!1389857))

(declare-fun m!1389859 () Bool)

(assert (=> b!1507911 m!1389859))

(assert (=> b!1507911 m!1389859))

(declare-fun m!1389861 () Bool)

(assert (=> b!1507911 m!1389861))

(assert (=> b!1507910 m!1389845))

(assert (=> b!1507910 m!1389845))

(declare-fun m!1389863 () Bool)

(assert (=> b!1507910 m!1389863))

(declare-fun m!1389865 () Bool)

(assert (=> b!1507914 m!1389865))

(check-sat (not b!1507907) (not start!128648) (not b!1507914) (not b!1507913) (not b!1507911) (not b!1507910) (not b!1507912) (not b!1507915))
(check-sat)
