; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130730 () Bool)

(assert start!130730)

(declare-fun e!854170 () Bool)

(declare-datatypes ((array!101828 0))(
  ( (array!101829 (arr!49130 (Array (_ BitVec 32) (_ BitVec 64))) (size!49680 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101828)

(declare-fun b!1533193 () Bool)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1533193 (= e!854170 (and (= (select (arr!49130 a!2792) index!463) (select (arr!49130 a!2792) j!64)) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1533194 () Bool)

(declare-fun res!1050280 () Bool)

(assert (=> b!1533194 (=> (not res!1050280) (not e!854170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101828 (_ BitVec 32)) Bool)

(assert (=> b!1533194 (= res!1050280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533195 () Bool)

(declare-fun res!1050283 () Bool)

(assert (=> b!1533195 (=> (not res!1050283) (not e!854170))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1533195 (= res!1050283 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49680 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49680 a!2792)) (= (select (arr!49130 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533196 () Bool)

(declare-fun res!1050285 () Bool)

(assert (=> b!1533196 (=> (not res!1050285) (not e!854170))))

(declare-datatypes ((List!35604 0))(
  ( (Nil!35601) (Cons!35600 (h!37045 (_ BitVec 64)) (t!50298 List!35604)) )
))
(declare-fun arrayNoDuplicates!0 (array!101828 (_ BitVec 32) List!35604) Bool)

(assert (=> b!1533196 (= res!1050285 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35601))))

(declare-fun b!1533198 () Bool)

(declare-fun res!1050281 () Bool)

(assert (=> b!1533198 (=> (not res!1050281) (not e!854170))))

(declare-datatypes ((SeekEntryResult!13262 0))(
  ( (MissingZero!13262 (index!55443 (_ BitVec 32))) (Found!13262 (index!55444 (_ BitVec 32))) (Intermediate!13262 (undefined!14074 Bool) (index!55445 (_ BitVec 32)) (x!137224 (_ BitVec 32))) (Undefined!13262) (MissingVacant!13262 (index!55446 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101828 (_ BitVec 32)) SeekEntryResult!13262)

(assert (=> b!1533198 (= res!1050281 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49130 a!2792) j!64) a!2792 mask!2480) (Found!13262 j!64)))))

(declare-fun b!1533199 () Bool)

(declare-fun res!1050282 () Bool)

(assert (=> b!1533199 (=> (not res!1050282) (not e!854170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533199 (= res!1050282 (validKeyInArray!0 (select (arr!49130 a!2792) j!64)))))

(declare-fun b!1533200 () Bool)

(declare-fun res!1050284 () Bool)

(assert (=> b!1533200 (=> (not res!1050284) (not e!854170))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533200 (= res!1050284 (and (= (size!49680 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49680 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49680 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533197 () Bool)

(declare-fun res!1050279 () Bool)

(assert (=> b!1533197 (=> (not res!1050279) (not e!854170))))

(assert (=> b!1533197 (= res!1050279 (validKeyInArray!0 (select (arr!49130 a!2792) i!951)))))

(declare-fun res!1050286 () Bool)

(assert (=> start!130730 (=> (not res!1050286) (not e!854170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130730 (= res!1050286 (validMask!0 mask!2480))))

(assert (=> start!130730 e!854170))

(assert (=> start!130730 true))

(declare-fun array_inv!38158 (array!101828) Bool)

(assert (=> start!130730 (array_inv!38158 a!2792)))

(assert (= (and start!130730 res!1050286) b!1533200))

(assert (= (and b!1533200 res!1050284) b!1533197))

(assert (= (and b!1533197 res!1050279) b!1533199))

(assert (= (and b!1533199 res!1050282) b!1533194))

(assert (= (and b!1533194 res!1050280) b!1533196))

(assert (= (and b!1533196 res!1050285) b!1533195))

(assert (= (and b!1533195 res!1050283) b!1533198))

(assert (= (and b!1533198 res!1050281) b!1533193))

(declare-fun m!1415901 () Bool)

(assert (=> b!1533198 m!1415901))

(assert (=> b!1533198 m!1415901))

(declare-fun m!1415903 () Bool)

(assert (=> b!1533198 m!1415903))

(declare-fun m!1415905 () Bool)

(assert (=> b!1533196 m!1415905))

(declare-fun m!1415907 () Bool)

(assert (=> start!130730 m!1415907))

(declare-fun m!1415909 () Bool)

(assert (=> start!130730 m!1415909))

(declare-fun m!1415911 () Bool)

(assert (=> b!1533195 m!1415911))

(assert (=> b!1533199 m!1415901))

(assert (=> b!1533199 m!1415901))

(declare-fun m!1415913 () Bool)

(assert (=> b!1533199 m!1415913))

(declare-fun m!1415915 () Bool)

(assert (=> b!1533194 m!1415915))

(declare-fun m!1415917 () Bool)

(assert (=> b!1533193 m!1415917))

(assert (=> b!1533193 m!1415901))

(declare-fun m!1415919 () Bool)

(assert (=> b!1533197 m!1415919))

(assert (=> b!1533197 m!1415919))

(declare-fun m!1415921 () Bool)

(assert (=> b!1533197 m!1415921))

(push 1)

(assert (not b!1533194))

