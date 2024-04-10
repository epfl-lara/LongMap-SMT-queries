; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130778 () Bool)

(assert start!130778)

(declare-fun b!1533751 () Bool)

(declare-fun res!1050838 () Bool)

(declare-fun e!854314 () Bool)

(assert (=> b!1533751 (=> (not res!1050838) (not e!854314))))

(declare-datatypes ((array!101876 0))(
  ( (array!101877 (arr!49154 (Array (_ BitVec 32) (_ BitVec 64))) (size!49704 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101876)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533751 (= res!1050838 (and (= (size!49704 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49704 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49704 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533752 () Bool)

(declare-fun res!1050842 () Bool)

(assert (=> b!1533752 (=> (not res!1050842) (not e!854314))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533752 (= res!1050842 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49704 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49704 a!2792)) (= (select (arr!49154 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533753 () Bool)

(declare-fun res!1050839 () Bool)

(assert (=> b!1533753 (=> (not res!1050839) (not e!854314))))

(declare-datatypes ((SeekEntryResult!13286 0))(
  ( (MissingZero!13286 (index!55539 (_ BitVec 32))) (Found!13286 (index!55540 (_ BitVec 32))) (Intermediate!13286 (undefined!14098 Bool) (index!55541 (_ BitVec 32)) (x!137312 (_ BitVec 32))) (Undefined!13286) (MissingVacant!13286 (index!55542 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101876 (_ BitVec 32)) SeekEntryResult!13286)

(assert (=> b!1533753 (= res!1050839 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49154 a!2792) j!64) a!2792 mask!2480) (Found!13286 j!64)))))

(declare-fun res!1050841 () Bool)

(assert (=> start!130778 (=> (not res!1050841) (not e!854314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130778 (= res!1050841 (validMask!0 mask!2480))))

(assert (=> start!130778 e!854314))

(assert (=> start!130778 true))

(declare-fun array_inv!38182 (array!101876) Bool)

(assert (=> start!130778 (array_inv!38182 a!2792)))

(declare-fun b!1533754 () Bool)

(declare-fun res!1050844 () Bool)

(assert (=> b!1533754 (=> (not res!1050844) (not e!854314))))

(declare-datatypes ((List!35628 0))(
  ( (Nil!35625) (Cons!35624 (h!37069 (_ BitVec 64)) (t!50322 List!35628)) )
))
(declare-fun arrayNoDuplicates!0 (array!101876 (_ BitVec 32) List!35628) Bool)

(assert (=> b!1533754 (= res!1050844 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35625))))

(declare-fun b!1533755 () Bool)

(declare-fun res!1050837 () Bool)

(assert (=> b!1533755 (=> (not res!1050837) (not e!854314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101876 (_ BitVec 32)) Bool)

(assert (=> b!1533755 (= res!1050837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533756 () Bool)

(declare-fun res!1050843 () Bool)

(assert (=> b!1533756 (=> (not res!1050843) (not e!854314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533756 (= res!1050843 (validKeyInArray!0 (select (arr!49154 a!2792) i!951)))))

(declare-fun b!1533757 () Bool)

(declare-fun res!1050840 () Bool)

(assert (=> b!1533757 (=> (not res!1050840) (not e!854314))))

(assert (=> b!1533757 (= res!1050840 (validKeyInArray!0 (select (arr!49154 a!2792) j!64)))))

(declare-fun b!1533758 () Bool)

(assert (=> b!1533758 (= e!854314 (and (= (select (arr!49154 a!2792) index!463) (select (arr!49154 a!2792) j!64)) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(assert (= (and start!130778 res!1050841) b!1533751))

(assert (= (and b!1533751 res!1050838) b!1533756))

(assert (= (and b!1533756 res!1050843) b!1533757))

(assert (= (and b!1533757 res!1050840) b!1533755))

(assert (= (and b!1533755 res!1050837) b!1533754))

(assert (= (and b!1533754 res!1050844) b!1533752))

(assert (= (and b!1533752 res!1050842) b!1533753))

(assert (= (and b!1533753 res!1050839) b!1533758))

(declare-fun m!1416447 () Bool)

(assert (=> b!1533755 m!1416447))

(declare-fun m!1416449 () Bool)

(assert (=> b!1533752 m!1416449))

(declare-fun m!1416451 () Bool)

(assert (=> b!1533756 m!1416451))

(assert (=> b!1533756 m!1416451))

(declare-fun m!1416453 () Bool)

(assert (=> b!1533756 m!1416453))

(declare-fun m!1416455 () Bool)

(assert (=> b!1533754 m!1416455))

(declare-fun m!1416457 () Bool)

(assert (=> b!1533757 m!1416457))

(assert (=> b!1533757 m!1416457))

(declare-fun m!1416459 () Bool)

(assert (=> b!1533757 m!1416459))

(declare-fun m!1416461 () Bool)

(assert (=> b!1533758 m!1416461))

(assert (=> b!1533758 m!1416457))

(assert (=> b!1533753 m!1416457))

(assert (=> b!1533753 m!1416457))

(declare-fun m!1416463 () Bool)

(assert (=> b!1533753 m!1416463))

(declare-fun m!1416465 () Bool)

(assert (=> start!130778 m!1416465))

(declare-fun m!1416467 () Bool)

(assert (=> start!130778 m!1416467))

(push 1)

(assert (not b!1533753))

