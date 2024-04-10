; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128796 () Bool)

(assert start!128796)

(declare-fun b!1509174 () Bool)

(declare-fun res!1029082 () Bool)

(declare-fun e!843016 () Bool)

(assert (=> b!1509174 (=> (not res!1029082) (not e!843016))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100652 0))(
  ( (array!100653 (arr!48563 (Array (_ BitVec 32) (_ BitVec 64))) (size!49113 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100652)

(assert (=> b!1509174 (= res!1029082 (and (= (size!49113 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49113 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49113 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1029084 () Bool)

(assert (=> start!128796 (=> (not res!1029084) (not e!843016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128796 (= res!1029084 (validMask!0 mask!2512))))

(assert (=> start!128796 e!843016))

(assert (=> start!128796 true))

(declare-fun array_inv!37591 (array!100652) Bool)

(assert (=> start!128796 (array_inv!37591 a!2804)))

(declare-fun b!1509175 () Bool)

(declare-fun res!1029077 () Bool)

(assert (=> b!1509175 (=> (not res!1029077) (not e!843016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100652 (_ BitVec 32)) Bool)

(assert (=> b!1509175 (= res!1029077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509176 () Bool)

(declare-fun res!1029081 () Bool)

(declare-fun e!843015 () Bool)

(assert (=> b!1509176 (=> (not res!1029081) (not e!843015))))

(declare-datatypes ((SeekEntryResult!12734 0))(
  ( (MissingZero!12734 (index!53331 (_ BitVec 32))) (Found!12734 (index!53332 (_ BitVec 32))) (Intermediate!12734 (undefined!13546 Bool) (index!53333 (_ BitVec 32)) (x!135092 (_ BitVec 32))) (Undefined!12734) (MissingVacant!12734 (index!53334 (_ BitVec 32))) )
))
(declare-fun lt!654826 () SeekEntryResult!12734)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100652 (_ BitVec 32)) SeekEntryResult!12734)

(assert (=> b!1509176 (= res!1029081 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48563 a!2804) j!70) a!2804 mask!2512) lt!654826))))

(declare-fun b!1509177 () Bool)

(declare-fun res!1029085 () Bool)

(assert (=> b!1509177 (=> (not res!1029085) (not e!843016))))

(declare-datatypes ((List!35046 0))(
  ( (Nil!35043) (Cons!35042 (h!36454 (_ BitVec 64)) (t!49740 List!35046)) )
))
(declare-fun arrayNoDuplicates!0 (array!100652 (_ BitVec 32) List!35046) Bool)

(assert (=> b!1509177 (= res!1029085 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35043))))

(declare-fun b!1509178 () Bool)

(assert (=> b!1509178 (= e!843015 false)))

(declare-fun lt!654825 () SeekEntryResult!12734)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509178 (= lt!654825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48563 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48563 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100653 (store (arr!48563 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49113 a!2804)) mask!2512))))

(declare-fun b!1509179 () Bool)

(declare-fun res!1029078 () Bool)

(assert (=> b!1509179 (=> (not res!1029078) (not e!843016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509179 (= res!1029078 (validKeyInArray!0 (select (arr!48563 a!2804) j!70)))))

(declare-fun b!1509180 () Bool)

(assert (=> b!1509180 (= e!843016 e!843015)))

(declare-fun res!1029080 () Bool)

(assert (=> b!1509180 (=> (not res!1029080) (not e!843015))))

(assert (=> b!1509180 (= res!1029080 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48563 a!2804) j!70) mask!2512) (select (arr!48563 a!2804) j!70) a!2804 mask!2512) lt!654826))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509180 (= lt!654826 (Intermediate!12734 false resIndex!21 resX!21))))

(declare-fun b!1509181 () Bool)

(declare-fun res!1029083 () Bool)

(assert (=> b!1509181 (=> (not res!1029083) (not e!843016))))

(assert (=> b!1509181 (= res!1029083 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49113 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49113 a!2804))))))

(declare-fun b!1509182 () Bool)

(declare-fun res!1029079 () Bool)

(assert (=> b!1509182 (=> (not res!1029079) (not e!843016))))

(assert (=> b!1509182 (= res!1029079 (validKeyInArray!0 (select (arr!48563 a!2804) i!961)))))

(assert (= (and start!128796 res!1029084) b!1509174))

(assert (= (and b!1509174 res!1029082) b!1509182))

(assert (= (and b!1509182 res!1029079) b!1509179))

(assert (= (and b!1509179 res!1029078) b!1509175))

(assert (= (and b!1509175 res!1029077) b!1509177))

(assert (= (and b!1509177 res!1029085) b!1509181))

(assert (= (and b!1509181 res!1029083) b!1509180))

(assert (= (and b!1509180 res!1029080) b!1509176))

(assert (= (and b!1509176 res!1029081) b!1509178))

(declare-fun m!1391623 () Bool)

(assert (=> b!1509175 m!1391623))

(declare-fun m!1391625 () Bool)

(assert (=> b!1509179 m!1391625))

(assert (=> b!1509179 m!1391625))

(declare-fun m!1391627 () Bool)

(assert (=> b!1509179 m!1391627))

(declare-fun m!1391629 () Bool)

(assert (=> start!128796 m!1391629))

(declare-fun m!1391631 () Bool)

(assert (=> start!128796 m!1391631))

(assert (=> b!1509180 m!1391625))

(assert (=> b!1509180 m!1391625))

(declare-fun m!1391633 () Bool)

(assert (=> b!1509180 m!1391633))

(assert (=> b!1509180 m!1391633))

(assert (=> b!1509180 m!1391625))

(declare-fun m!1391635 () Bool)

(assert (=> b!1509180 m!1391635))

(declare-fun m!1391637 () Bool)

(assert (=> b!1509178 m!1391637))

(declare-fun m!1391639 () Bool)

(assert (=> b!1509178 m!1391639))

(assert (=> b!1509178 m!1391639))

(declare-fun m!1391641 () Bool)

(assert (=> b!1509178 m!1391641))

(assert (=> b!1509178 m!1391641))

(assert (=> b!1509178 m!1391639))

(declare-fun m!1391643 () Bool)

(assert (=> b!1509178 m!1391643))

(declare-fun m!1391645 () Bool)

(assert (=> b!1509177 m!1391645))

(assert (=> b!1509176 m!1391625))

(assert (=> b!1509176 m!1391625))

(declare-fun m!1391647 () Bool)

(assert (=> b!1509176 m!1391647))

(declare-fun m!1391649 () Bool)

(assert (=> b!1509182 m!1391649))

(assert (=> b!1509182 m!1391649))

(declare-fun m!1391651 () Bool)

(assert (=> b!1509182 m!1391651))

(push 1)

