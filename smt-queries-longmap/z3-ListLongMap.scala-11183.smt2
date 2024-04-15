; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130680 () Bool)

(assert start!130680)

(declare-fun res!1050153 () Bool)

(declare-fun e!853971 () Bool)

(assert (=> start!130680 (=> (not res!1050153) (not e!853971))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130680 (= res!1050153 (validMask!0 mask!2480))))

(assert (=> start!130680 e!853971))

(assert (=> start!130680 true))

(declare-datatypes ((array!101776 0))(
  ( (array!101777 (arr!49105 (Array (_ BitVec 32) (_ BitVec 64))) (size!49657 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101776)

(declare-fun array_inv!38338 (array!101776) Bool)

(assert (=> start!130680 (array_inv!38338 a!2792)))

(declare-fun b!1532880 () Bool)

(declare-fun res!1050152 () Bool)

(assert (=> b!1532880 (=> (not res!1050152) (not e!853971))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1532880 (= res!1050152 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49657 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49657 a!2792)) (= (select (arr!49105 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1532881 () Bool)

(declare-fun res!1050150 () Bool)

(assert (=> b!1532881 (=> (not res!1050150) (not e!853971))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532881 (= res!1050150 (validKeyInArray!0 (select (arr!49105 a!2792) i!951)))))

(declare-fun b!1532882 () Bool)

(declare-fun res!1050155 () Bool)

(assert (=> b!1532882 (=> (not res!1050155) (not e!853971))))

(declare-datatypes ((List!35657 0))(
  ( (Nil!35654) (Cons!35653 (h!37099 (_ BitVec 64)) (t!50343 List!35657)) )
))
(declare-fun arrayNoDuplicates!0 (array!101776 (_ BitVec 32) List!35657) Bool)

(assert (=> b!1532882 (= res!1050155 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35654))))

(declare-fun b!1532883 () Bool)

(declare-fun res!1050156 () Bool)

(assert (=> b!1532883 (=> (not res!1050156) (not e!853971))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13262 0))(
  ( (MissingZero!13262 (index!55443 (_ BitVec 32))) (Found!13262 (index!55444 (_ BitVec 32))) (Intermediate!13262 (undefined!14074 Bool) (index!55445 (_ BitVec 32)) (x!137219 (_ BitVec 32))) (Undefined!13262) (MissingVacant!13262 (index!55446 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101776 (_ BitVec 32)) SeekEntryResult!13262)

(assert (=> b!1532883 (= res!1050156 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49105 a!2792) j!64) a!2792 mask!2480) (Found!13262 j!64)))))

(declare-fun b!1532884 () Bool)

(declare-fun res!1050151 () Bool)

(assert (=> b!1532884 (=> (not res!1050151) (not e!853971))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101776 (_ BitVec 32)) Bool)

(assert (=> b!1532884 (= res!1050151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1532885 () Bool)

(assert (=> b!1532885 (= e!853971 (and (= (select (arr!49105 a!2792) index!463) (select (arr!49105 a!2792) j!64)) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1532886 () Bool)

(declare-fun res!1050154 () Bool)

(assert (=> b!1532886 (=> (not res!1050154) (not e!853971))))

(assert (=> b!1532886 (= res!1050154 (and (= (size!49657 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49657 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49657 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532887 () Bool)

(declare-fun res!1050157 () Bool)

(assert (=> b!1532887 (=> (not res!1050157) (not e!853971))))

(assert (=> b!1532887 (= res!1050157 (validKeyInArray!0 (select (arr!49105 a!2792) j!64)))))

(assert (= (and start!130680 res!1050153) b!1532886))

(assert (= (and b!1532886 res!1050154) b!1532881))

(assert (= (and b!1532881 res!1050150) b!1532887))

(assert (= (and b!1532887 res!1050157) b!1532884))

(assert (= (and b!1532884 res!1050151) b!1532882))

(assert (= (and b!1532882 res!1050155) b!1532880))

(assert (= (and b!1532880 res!1050152) b!1532883))

(assert (= (and b!1532883 res!1050156) b!1532885))

(declare-fun m!1415009 () Bool)

(assert (=> b!1532884 m!1415009))

(declare-fun m!1415011 () Bool)

(assert (=> b!1532880 m!1415011))

(declare-fun m!1415013 () Bool)

(assert (=> b!1532885 m!1415013))

(declare-fun m!1415015 () Bool)

(assert (=> b!1532885 m!1415015))

(declare-fun m!1415017 () Bool)

(assert (=> start!130680 m!1415017))

(declare-fun m!1415019 () Bool)

(assert (=> start!130680 m!1415019))

(assert (=> b!1532887 m!1415015))

(assert (=> b!1532887 m!1415015))

(declare-fun m!1415021 () Bool)

(assert (=> b!1532887 m!1415021))

(assert (=> b!1532883 m!1415015))

(assert (=> b!1532883 m!1415015))

(declare-fun m!1415023 () Bool)

(assert (=> b!1532883 m!1415023))

(declare-fun m!1415025 () Bool)

(assert (=> b!1532881 m!1415025))

(assert (=> b!1532881 m!1415025))

(declare-fun m!1415027 () Bool)

(assert (=> b!1532881 m!1415027))

(declare-fun m!1415029 () Bool)

(assert (=> b!1532882 m!1415029))

(check-sat (not b!1532884) (not b!1532883) (not start!130680) (not b!1532887) (not b!1532881) (not b!1532882))
(check-sat)
