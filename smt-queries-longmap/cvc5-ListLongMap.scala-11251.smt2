; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131174 () Bool)

(assert start!131174)

(declare-fun b!1538847 () Bool)

(declare-fun e!856086 () Bool)

(assert (=> b!1538847 (= e!856086 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664945 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538847 (= lt!664945 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538848 () Bool)

(declare-fun res!1055827 () Bool)

(assert (=> b!1538848 (=> (not res!1055827) (not e!856086))))

(declare-datatypes ((array!102239 0))(
  ( (array!102240 (arr!49334 (Array (_ BitVec 32) (_ BitVec 64))) (size!49884 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102239)

(declare-datatypes ((List!35808 0))(
  ( (Nil!35805) (Cons!35804 (h!37249 (_ BitVec 64)) (t!50502 List!35808)) )
))
(declare-fun arrayNoDuplicates!0 (array!102239 (_ BitVec 32) List!35808) Bool)

(assert (=> b!1538848 (= res!1055827 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35805))))

(declare-fun b!1538849 () Bool)

(declare-fun res!1055825 () Bool)

(assert (=> b!1538849 (=> (not res!1055825) (not e!856086))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538849 (= res!1055825 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49884 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49884 a!2792)) (= (select (arr!49334 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538850 () Bool)

(declare-fun res!1055832 () Bool)

(assert (=> b!1538850 (=> (not res!1055832) (not e!856086))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13460 0))(
  ( (MissingZero!13460 (index!56235 (_ BitVec 32))) (Found!13460 (index!56236 (_ BitVec 32))) (Intermediate!13460 (undefined!14272 Bool) (index!56237 (_ BitVec 32)) (x!137969 (_ BitVec 32))) (Undefined!13460) (MissingVacant!13460 (index!56238 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102239 (_ BitVec 32)) SeekEntryResult!13460)

(assert (=> b!1538850 (= res!1055832 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49334 a!2792) j!64) a!2792 mask!2480) (Found!13460 j!64)))))

(declare-fun b!1538851 () Bool)

(declare-fun res!1055831 () Bool)

(assert (=> b!1538851 (=> (not res!1055831) (not e!856086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102239 (_ BitVec 32)) Bool)

(assert (=> b!1538851 (= res!1055831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538852 () Bool)

(declare-fun res!1055826 () Bool)

(assert (=> b!1538852 (=> (not res!1055826) (not e!856086))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538852 (= res!1055826 (and (= (size!49884 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49884 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49884 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1055828 () Bool)

(assert (=> start!131174 (=> (not res!1055828) (not e!856086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131174 (= res!1055828 (validMask!0 mask!2480))))

(assert (=> start!131174 e!856086))

(assert (=> start!131174 true))

(declare-fun array_inv!38362 (array!102239) Bool)

(assert (=> start!131174 (array_inv!38362 a!2792)))

(declare-fun b!1538853 () Bool)

(declare-fun res!1055829 () Bool)

(assert (=> b!1538853 (=> (not res!1055829) (not e!856086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538853 (= res!1055829 (validKeyInArray!0 (select (arr!49334 a!2792) i!951)))))

(declare-fun b!1538854 () Bool)

(declare-fun res!1055833 () Bool)

(assert (=> b!1538854 (=> (not res!1055833) (not e!856086))))

(assert (=> b!1538854 (= res!1055833 (not (= (select (arr!49334 a!2792) index!463) (select (arr!49334 a!2792) j!64))))))

(declare-fun b!1538855 () Bool)

(declare-fun res!1055830 () Bool)

(assert (=> b!1538855 (=> (not res!1055830) (not e!856086))))

(assert (=> b!1538855 (= res!1055830 (validKeyInArray!0 (select (arr!49334 a!2792) j!64)))))

(assert (= (and start!131174 res!1055828) b!1538852))

(assert (= (and b!1538852 res!1055826) b!1538853))

(assert (= (and b!1538853 res!1055829) b!1538855))

(assert (= (and b!1538855 res!1055830) b!1538851))

(assert (= (and b!1538851 res!1055831) b!1538848))

(assert (= (and b!1538848 res!1055827) b!1538849))

(assert (= (and b!1538849 res!1055825) b!1538850))

(assert (= (and b!1538850 res!1055832) b!1538854))

(assert (= (and b!1538854 res!1055833) b!1538847))

(declare-fun m!1421235 () Bool)

(assert (=> b!1538849 m!1421235))

(declare-fun m!1421237 () Bool)

(assert (=> start!131174 m!1421237))

(declare-fun m!1421239 () Bool)

(assert (=> start!131174 m!1421239))

(declare-fun m!1421241 () Bool)

(assert (=> b!1538851 m!1421241))

(declare-fun m!1421243 () Bool)

(assert (=> b!1538850 m!1421243))

(assert (=> b!1538850 m!1421243))

(declare-fun m!1421245 () Bool)

(assert (=> b!1538850 m!1421245))

(declare-fun m!1421247 () Bool)

(assert (=> b!1538853 m!1421247))

(assert (=> b!1538853 m!1421247))

(declare-fun m!1421249 () Bool)

(assert (=> b!1538853 m!1421249))

(declare-fun m!1421251 () Bool)

(assert (=> b!1538848 m!1421251))

(declare-fun m!1421253 () Bool)

(assert (=> b!1538847 m!1421253))

(declare-fun m!1421255 () Bool)

(assert (=> b!1538854 m!1421255))

(assert (=> b!1538854 m!1421243))

(assert (=> b!1538855 m!1421243))

(assert (=> b!1538855 m!1421243))

(declare-fun m!1421257 () Bool)

(assert (=> b!1538855 m!1421257))

(push 1)

(assert (not b!1538847))

(assert (not start!131174))

(assert (not b!1538851))

(assert (not b!1538848))

(assert (not b!1538853))

(assert (not b!1538850))

(assert (not b!1538855))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

