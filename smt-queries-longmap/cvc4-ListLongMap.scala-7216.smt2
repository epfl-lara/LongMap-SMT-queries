; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92362 () Bool)

(assert start!92362)

(declare-fun e!595821 () Bool)

(declare-fun lt!463763 () (_ BitVec 32))

(declare-datatypes ((array!66163 0))(
  ( (array!66164 (arr!31821 (Array (_ BitVec 32) (_ BitVec 64))) (size!32357 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66163)

(declare-fun b!1050042 () Bool)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050042 (= e!595821 (arrayContainsKey!0 a!3488 k!2747 lt!463763))))

(declare-fun b!1050043 () Bool)

(declare-fun e!595820 () Bool)

(declare-fun e!595817 () Bool)

(assert (=> b!1050043 (= e!595820 e!595817)))

(declare-fun res!699168 () Bool)

(assert (=> b!1050043 (=> (not res!699168) (not e!595817))))

(declare-fun lt!463767 () array!66163)

(assert (=> b!1050043 (= res!699168 (arrayContainsKey!0 lt!463767 k!2747 #b00000000000000000000000000000000))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050043 (= lt!463767 (array!66164 (store (arr!31821 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32357 a!3488)))))

(declare-fun b!1050044 () Bool)

(declare-fun e!595816 () Bool)

(assert (=> b!1050044 (= e!595817 e!595816)))

(declare-fun res!699173 () Bool)

(assert (=> b!1050044 (=> (not res!699173) (not e!595816))))

(assert (=> b!1050044 (= res!699173 (not (= lt!463763 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66163 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050044 (= lt!463763 (arrayScanForKey!0 lt!463767 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050045 () Bool)

(declare-fun e!595822 () Bool)

(assert (=> b!1050045 (= e!595822 e!595821)))

(declare-fun res!699177 () Bool)

(assert (=> b!1050045 (=> res!699177 e!595821)))

(assert (=> b!1050045 (= res!699177 (bvsle lt!463763 i!1381))))

(declare-fun res!699174 () Bool)

(assert (=> start!92362 (=> (not res!699174) (not e!595820))))

(assert (=> start!92362 (= res!699174 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32357 a!3488)) (bvslt (size!32357 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92362 e!595820))

(assert (=> start!92362 true))

(declare-fun array_inv!24601 (array!66163) Bool)

(assert (=> start!92362 (array_inv!24601 a!3488)))

(declare-fun b!1050046 () Bool)

(declare-fun res!699171 () Bool)

(assert (=> b!1050046 (=> (not res!699171) (not e!595820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050046 (= res!699171 (validKeyInArray!0 k!2747))))

(declare-fun b!1050047 () Bool)

(declare-fun e!595818 () Bool)

(assert (=> b!1050047 (= e!595818 true)))

(declare-fun lt!463764 () Bool)

(declare-datatypes ((List!22133 0))(
  ( (Nil!22130) (Cons!22129 (h!23338 (_ BitVec 64)) (t!31440 List!22133)) )
))
(declare-fun contains!6126 (List!22133 (_ BitVec 64)) Bool)

(assert (=> b!1050047 (= lt!463764 (contains!6126 Nil!22130 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1050048 () Bool)

(declare-fun e!595815 () Bool)

(assert (=> b!1050048 (= e!595815 e!595818)))

(declare-fun res!699179 () Bool)

(assert (=> b!1050048 (=> res!699179 e!595818)))

(assert (=> b!1050048 (= res!699179 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32357 a!3488)))))

(assert (=> b!1050048 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34362 0))(
  ( (Unit!34363) )
))
(declare-fun lt!463765 () Unit!34362)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66163 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34362)

(assert (=> b!1050048 (= lt!463765 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!463763 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66163 (_ BitVec 32) List!22133) Bool)

(assert (=> b!1050048 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22130)))

(declare-fun lt!463766 () Unit!34362)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66163 (_ BitVec 32) (_ BitVec 32)) Unit!34362)

(assert (=> b!1050048 (= lt!463766 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050049 () Bool)

(assert (=> b!1050049 (= e!595816 (not e!595815))))

(declare-fun res!699169 () Bool)

(assert (=> b!1050049 (=> res!699169 e!595815)))

(assert (=> b!1050049 (= res!699169 (bvsle lt!463763 i!1381))))

(assert (=> b!1050049 e!595822))

(declare-fun res!699170 () Bool)

(assert (=> b!1050049 (=> (not res!699170) (not e!595822))))

(assert (=> b!1050049 (= res!699170 (= (select (store (arr!31821 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463763) k!2747))))

(declare-fun b!1050050 () Bool)

(declare-fun res!699175 () Bool)

(assert (=> b!1050050 (=> res!699175 e!595818)))

(declare-fun noDuplicate!1511 (List!22133) Bool)

(assert (=> b!1050050 (= res!699175 (not (noDuplicate!1511 Nil!22130)))))

(declare-fun b!1050051 () Bool)

(declare-fun res!699172 () Bool)

(assert (=> b!1050051 (=> (not res!699172) (not e!595820))))

(assert (=> b!1050051 (= res!699172 (= (select (arr!31821 a!3488) i!1381) k!2747))))

(declare-fun b!1050052 () Bool)

(declare-fun res!699176 () Bool)

(assert (=> b!1050052 (=> (not res!699176) (not e!595820))))

(assert (=> b!1050052 (= res!699176 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22130))))

(declare-fun b!1050053 () Bool)

(declare-fun res!699178 () Bool)

(assert (=> b!1050053 (=> res!699178 e!595818)))

(assert (=> b!1050053 (= res!699178 (contains!6126 Nil!22130 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92362 res!699174) b!1050052))

(assert (= (and b!1050052 res!699176) b!1050046))

(assert (= (and b!1050046 res!699171) b!1050051))

(assert (= (and b!1050051 res!699172) b!1050043))

(assert (= (and b!1050043 res!699168) b!1050044))

(assert (= (and b!1050044 res!699173) b!1050049))

(assert (= (and b!1050049 res!699170) b!1050045))

(assert (= (and b!1050045 (not res!699177)) b!1050042))

(assert (= (and b!1050049 (not res!699169)) b!1050048))

(assert (= (and b!1050048 (not res!699179)) b!1050050))

(assert (= (and b!1050050 (not res!699175)) b!1050053))

(assert (= (and b!1050053 (not res!699178)) b!1050047))

(declare-fun m!970737 () Bool)

(assert (=> b!1050053 m!970737))

(declare-fun m!970739 () Bool)

(assert (=> b!1050043 m!970739))

(declare-fun m!970741 () Bool)

(assert (=> b!1050043 m!970741))

(assert (=> b!1050049 m!970741))

(declare-fun m!970743 () Bool)

(assert (=> b!1050049 m!970743))

(declare-fun m!970745 () Bool)

(assert (=> b!1050046 m!970745))

(declare-fun m!970747 () Bool)

(assert (=> b!1050051 m!970747))

(declare-fun m!970749 () Bool)

(assert (=> b!1050052 m!970749))

(declare-fun m!970751 () Bool)

(assert (=> b!1050047 m!970751))

(declare-fun m!970753 () Bool)

(assert (=> start!92362 m!970753))

(declare-fun m!970755 () Bool)

(assert (=> b!1050042 m!970755))

(declare-fun m!970757 () Bool)

(assert (=> b!1050048 m!970757))

(declare-fun m!970759 () Bool)

(assert (=> b!1050048 m!970759))

(declare-fun m!970761 () Bool)

(assert (=> b!1050048 m!970761))

(declare-fun m!970763 () Bool)

(assert (=> b!1050048 m!970763))

(declare-fun m!970765 () Bool)

(assert (=> b!1050050 m!970765))

(declare-fun m!970767 () Bool)

(assert (=> b!1050044 m!970767))

(push 1)

(assert (not b!1050052))

(assert (not b!1050043))

(assert (not b!1050050))

(assert (not b!1050048))

(assert (not b!1050053))

(assert (not b!1050046))

(assert (not b!1050047))

(assert (not b!1050042))

(assert (not b!1050044))

(assert (not start!92362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

