; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128638 () Bool)

(assert start!128638)

(declare-fun b!1507798 () Bool)

(declare-fun e!842436 () Bool)

(assert (=> b!1507798 (= e!842436 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100572 0))(
  ( (array!100573 (arr!48526 (Array (_ BitVec 32) (_ BitVec 64))) (size!49076 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100572)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12697 0))(
  ( (MissingZero!12697 (index!53183 (_ BitVec 32))) (Found!12697 (index!53184 (_ BitVec 32))) (Intermediate!12697 (undefined!13509 Bool) (index!53185 (_ BitVec 32)) (x!134939 (_ BitVec 32))) (Undefined!12697) (MissingVacant!12697 (index!53186 (_ BitVec 32))) )
))
(declare-fun lt!654487 () SeekEntryResult!12697)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100572 (_ BitVec 32)) SeekEntryResult!12697)

(assert (=> b!1507798 (= lt!654487 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48526 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507799 () Bool)

(declare-fun res!1027917 () Bool)

(assert (=> b!1507799 (=> (not res!1027917) (not e!842436))))

(declare-datatypes ((List!35009 0))(
  ( (Nil!35006) (Cons!35005 (h!36411 (_ BitVec 64)) (t!49703 List!35009)) )
))
(declare-fun arrayNoDuplicates!0 (array!100572 (_ BitVec 32) List!35009) Bool)

(assert (=> b!1507799 (= res!1027917 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35006))))

(declare-fun b!1507800 () Bool)

(declare-fun res!1027914 () Bool)

(assert (=> b!1507800 (=> (not res!1027914) (not e!842436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100572 (_ BitVec 32)) Bool)

(assert (=> b!1507800 (= res!1027914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507801 () Bool)

(declare-fun res!1027913 () Bool)

(assert (=> b!1507801 (=> (not res!1027913) (not e!842436))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507801 (= res!1027913 (and (= (size!49076 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49076 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49076 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507802 () Bool)

(declare-fun res!1027911 () Bool)

(assert (=> b!1507802 (=> (not res!1027911) (not e!842436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507802 (= res!1027911 (validKeyInArray!0 (select (arr!48526 a!2804) i!961)))))

(declare-fun b!1507803 () Bool)

(declare-fun res!1027916 () Bool)

(assert (=> b!1507803 (=> (not res!1027916) (not e!842436))))

(assert (=> b!1507803 (= res!1027916 (validKeyInArray!0 (select (arr!48526 a!2804) j!70)))))

(declare-fun b!1507804 () Bool)

(declare-fun res!1027918 () Bool)

(assert (=> b!1507804 (=> (not res!1027918) (not e!842436))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1507804 (= res!1027918 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49076 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49076 a!2804))))))

(declare-fun b!1507805 () Bool)

(declare-fun res!1027912 () Bool)

(assert (=> b!1507805 (=> (not res!1027912) (not e!842436))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507805 (= res!1027912 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48526 a!2804) j!70) mask!2512) (select (arr!48526 a!2804) j!70) a!2804 mask!2512) (Intermediate!12697 false resIndex!21 resX!21)))))

(declare-fun res!1027915 () Bool)

(assert (=> start!128638 (=> (not res!1027915) (not e!842436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128638 (= res!1027915 (validMask!0 mask!2512))))

(assert (=> start!128638 e!842436))

(assert (=> start!128638 true))

(declare-fun array_inv!37554 (array!100572) Bool)

(assert (=> start!128638 (array_inv!37554 a!2804)))

(assert (= (and start!128638 res!1027915) b!1507801))

(assert (= (and b!1507801 res!1027913) b!1507802))

(assert (= (and b!1507802 res!1027911) b!1507803))

(assert (= (and b!1507803 res!1027916) b!1507800))

(assert (= (and b!1507800 res!1027914) b!1507799))

(assert (= (and b!1507799 res!1027917) b!1507804))

(assert (= (and b!1507804 res!1027918) b!1507805))

(assert (= (and b!1507805 res!1027912) b!1507798))

(declare-fun m!1390431 () Bool)

(assert (=> b!1507803 m!1390431))

(assert (=> b!1507803 m!1390431))

(declare-fun m!1390433 () Bool)

(assert (=> b!1507803 m!1390433))

(assert (=> b!1507798 m!1390431))

(assert (=> b!1507798 m!1390431))

(declare-fun m!1390435 () Bool)

(assert (=> b!1507798 m!1390435))

(assert (=> b!1507805 m!1390431))

(assert (=> b!1507805 m!1390431))

(declare-fun m!1390437 () Bool)

(assert (=> b!1507805 m!1390437))

(assert (=> b!1507805 m!1390437))

(assert (=> b!1507805 m!1390431))

(declare-fun m!1390439 () Bool)

(assert (=> b!1507805 m!1390439))

(declare-fun m!1390441 () Bool)

(assert (=> b!1507802 m!1390441))

(assert (=> b!1507802 m!1390441))

(declare-fun m!1390443 () Bool)

(assert (=> b!1507802 m!1390443))

(declare-fun m!1390445 () Bool)

(assert (=> b!1507799 m!1390445))

(declare-fun m!1390447 () Bool)

(assert (=> b!1507800 m!1390447))

(declare-fun m!1390449 () Bool)

(assert (=> start!128638 m!1390449))

(declare-fun m!1390451 () Bool)

(assert (=> start!128638 m!1390451))

(push 1)

(assert (not b!1507803))

(assert (not b!1507798))

(assert (not b!1507802))

(assert (not b!1507800))

(assert (not b!1507805))

(assert (not b!1507799))

(assert (not start!128638))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

