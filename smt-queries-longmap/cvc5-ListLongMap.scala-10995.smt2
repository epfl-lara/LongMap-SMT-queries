; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128802 () Bool)

(assert start!128802)

(declare-fun b!1509255 () Bool)

(declare-fun res!1029164 () Bool)

(declare-fun e!843043 () Bool)

(assert (=> b!1509255 (=> (not res!1029164) (not e!843043))))

(declare-datatypes ((array!100658 0))(
  ( (array!100659 (arr!48566 (Array (_ BitVec 32) (_ BitVec 64))) (size!49116 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100658)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509255 (= res!1029164 (validKeyInArray!0 (select (arr!48566 a!2804) j!70)))))

(declare-fun b!1509256 () Bool)

(declare-fun res!1029166 () Bool)

(assert (=> b!1509256 (=> (not res!1029166) (not e!843043))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509256 (= res!1029166 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49116 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49116 a!2804))))))

(declare-fun b!1509257 () Bool)

(declare-fun res!1029160 () Bool)

(assert (=> b!1509257 (=> (not res!1029160) (not e!843043))))

(declare-datatypes ((List!35049 0))(
  ( (Nil!35046) (Cons!35045 (h!36457 (_ BitVec 64)) (t!49743 List!35049)) )
))
(declare-fun arrayNoDuplicates!0 (array!100658 (_ BitVec 32) List!35049) Bool)

(assert (=> b!1509257 (= res!1029160 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35046))))

(declare-fun b!1509258 () Bool)

(declare-fun res!1029158 () Bool)

(declare-fun e!843041 () Bool)

(assert (=> b!1509258 (=> (not res!1029158) (not e!843041))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12737 0))(
  ( (MissingZero!12737 (index!53343 (_ BitVec 32))) (Found!12737 (index!53344 (_ BitVec 32))) (Intermediate!12737 (undefined!13549 Bool) (index!53345 (_ BitVec 32)) (x!135103 (_ BitVec 32))) (Undefined!12737) (MissingVacant!12737 (index!53346 (_ BitVec 32))) )
))
(declare-fun lt!654843 () SeekEntryResult!12737)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100658 (_ BitVec 32)) SeekEntryResult!12737)

(assert (=> b!1509258 (= res!1029158 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48566 a!2804) j!70) a!2804 mask!2512) lt!654843))))

(declare-fun res!1029161 () Bool)

(assert (=> start!128802 (=> (not res!1029161) (not e!843043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128802 (= res!1029161 (validMask!0 mask!2512))))

(assert (=> start!128802 e!843043))

(assert (=> start!128802 true))

(declare-fun array_inv!37594 (array!100658) Bool)

(assert (=> start!128802 (array_inv!37594 a!2804)))

(declare-fun b!1509259 () Bool)

(declare-fun res!1029165 () Bool)

(assert (=> b!1509259 (=> (not res!1029165) (not e!843043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100658 (_ BitVec 32)) Bool)

(assert (=> b!1509259 (= res!1029165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509260 () Bool)

(declare-fun res!1029159 () Bool)

(assert (=> b!1509260 (=> (not res!1029159) (not e!843043))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509260 (= res!1029159 (validKeyInArray!0 (select (arr!48566 a!2804) i!961)))))

(declare-fun b!1509261 () Bool)

(assert (=> b!1509261 (= e!843043 e!843041)))

(declare-fun res!1029162 () Bool)

(assert (=> b!1509261 (=> (not res!1029162) (not e!843041))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509261 (= res!1029162 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48566 a!2804) j!70) mask!2512) (select (arr!48566 a!2804) j!70) a!2804 mask!2512) lt!654843))))

(assert (=> b!1509261 (= lt!654843 (Intermediate!12737 false resIndex!21 resX!21))))

(declare-fun b!1509262 () Bool)

(assert (=> b!1509262 (= e!843041 false)))

(declare-fun lt!654844 () SeekEntryResult!12737)

(assert (=> b!1509262 (= lt!654844 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48566 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48566 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100659 (store (arr!48566 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49116 a!2804)) mask!2512))))

(declare-fun b!1509263 () Bool)

(declare-fun res!1029163 () Bool)

(assert (=> b!1509263 (=> (not res!1029163) (not e!843043))))

(assert (=> b!1509263 (= res!1029163 (and (= (size!49116 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49116 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49116 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128802 res!1029161) b!1509263))

(assert (= (and b!1509263 res!1029163) b!1509260))

(assert (= (and b!1509260 res!1029159) b!1509255))

(assert (= (and b!1509255 res!1029164) b!1509259))

(assert (= (and b!1509259 res!1029165) b!1509257))

(assert (= (and b!1509257 res!1029160) b!1509256))

(assert (= (and b!1509256 res!1029166) b!1509261))

(assert (= (and b!1509261 res!1029162) b!1509258))

(assert (= (and b!1509258 res!1029158) b!1509262))

(declare-fun m!1391713 () Bool)

(assert (=> b!1509258 m!1391713))

(assert (=> b!1509258 m!1391713))

(declare-fun m!1391715 () Bool)

(assert (=> b!1509258 m!1391715))

(assert (=> b!1509261 m!1391713))

(assert (=> b!1509261 m!1391713))

(declare-fun m!1391717 () Bool)

(assert (=> b!1509261 m!1391717))

(assert (=> b!1509261 m!1391717))

(assert (=> b!1509261 m!1391713))

(declare-fun m!1391719 () Bool)

(assert (=> b!1509261 m!1391719))

(declare-fun m!1391721 () Bool)

(assert (=> b!1509257 m!1391721))

(declare-fun m!1391723 () Bool)

(assert (=> b!1509260 m!1391723))

(assert (=> b!1509260 m!1391723))

(declare-fun m!1391725 () Bool)

(assert (=> b!1509260 m!1391725))

(assert (=> b!1509255 m!1391713))

(assert (=> b!1509255 m!1391713))

(declare-fun m!1391727 () Bool)

(assert (=> b!1509255 m!1391727))

(declare-fun m!1391729 () Bool)

(assert (=> start!128802 m!1391729))

(declare-fun m!1391731 () Bool)

(assert (=> start!128802 m!1391731))

(declare-fun m!1391733 () Bool)

(assert (=> b!1509262 m!1391733))

(declare-fun m!1391735 () Bool)

(assert (=> b!1509262 m!1391735))

(assert (=> b!1509262 m!1391735))

(declare-fun m!1391737 () Bool)

(assert (=> b!1509262 m!1391737))

(assert (=> b!1509262 m!1391737))

(assert (=> b!1509262 m!1391735))

(declare-fun m!1391739 () Bool)

(assert (=> b!1509262 m!1391739))

(declare-fun m!1391741 () Bool)

(assert (=> b!1509259 m!1391741))

(push 1)

