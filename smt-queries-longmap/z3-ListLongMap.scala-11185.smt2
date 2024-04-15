; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130692 () Bool)

(assert start!130692)

(declare-fun b!1533015 () Bool)

(declare-fun res!1050288 () Bool)

(declare-fun e!854008 () Bool)

(assert (=> b!1533015 (=> (not res!1050288) (not e!854008))))

(declare-datatypes ((array!101788 0))(
  ( (array!101789 (arr!49111 (Array (_ BitVec 32) (_ BitVec 64))) (size!49663 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101788)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101788 (_ BitVec 32)) Bool)

(assert (=> b!1533015 (= res!1050288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533016 () Bool)

(declare-fun res!1050286 () Bool)

(assert (=> b!1533016 (=> (not res!1050286) (not e!854008))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533016 (= res!1050286 (validKeyInArray!0 (select (arr!49111 a!2792) j!64)))))

(declare-fun b!1533017 () Bool)

(declare-fun res!1050290 () Bool)

(assert (=> b!1533017 (=> (not res!1050290) (not e!854008))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533017 (= res!1050290 (validKeyInArray!0 (select (arr!49111 a!2792) i!951)))))

(declare-fun b!1533018 () Bool)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1533018 (= e!854008 (and (= (select (arr!49111 a!2792) index!463) (select (arr!49111 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1533019 () Bool)

(declare-fun res!1050285 () Bool)

(assert (=> b!1533019 (=> (not res!1050285) (not e!854008))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1533019 (= res!1050285 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49663 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49663 a!2792)) (= (select (arr!49111 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533020 () Bool)

(declare-fun res!1050292 () Bool)

(assert (=> b!1533020 (=> (not res!1050292) (not e!854008))))

(assert (=> b!1533020 (= res!1050292 (and (= (size!49663 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49663 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49663 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1050289 () Bool)

(assert (=> start!130692 (=> (not res!1050289) (not e!854008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130692 (= res!1050289 (validMask!0 mask!2480))))

(assert (=> start!130692 e!854008))

(assert (=> start!130692 true))

(declare-fun array_inv!38344 (array!101788) Bool)

(assert (=> start!130692 (array_inv!38344 a!2792)))

(declare-fun b!1533021 () Bool)

(declare-fun res!1050291 () Bool)

(assert (=> b!1533021 (=> (not res!1050291) (not e!854008))))

(declare-datatypes ((List!35663 0))(
  ( (Nil!35660) (Cons!35659 (h!37105 (_ BitVec 64)) (t!50349 List!35663)) )
))
(declare-fun arrayNoDuplicates!0 (array!101788 (_ BitVec 32) List!35663) Bool)

(assert (=> b!1533021 (= res!1050291 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35660))))

(declare-fun b!1533022 () Bool)

(declare-fun res!1050287 () Bool)

(assert (=> b!1533022 (=> (not res!1050287) (not e!854008))))

(declare-datatypes ((SeekEntryResult!13268 0))(
  ( (MissingZero!13268 (index!55467 (_ BitVec 32))) (Found!13268 (index!55468 (_ BitVec 32))) (Intermediate!13268 (undefined!14080 Bool) (index!55469 (_ BitVec 32)) (x!137241 (_ BitVec 32))) (Undefined!13268) (MissingVacant!13268 (index!55470 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101788 (_ BitVec 32)) SeekEntryResult!13268)

(assert (=> b!1533022 (= res!1050287 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49111 a!2792) j!64) a!2792 mask!2480) (Found!13268 j!64)))))

(assert (= (and start!130692 res!1050289) b!1533020))

(assert (= (and b!1533020 res!1050292) b!1533017))

(assert (= (and b!1533017 res!1050290) b!1533016))

(assert (= (and b!1533016 res!1050286) b!1533015))

(assert (= (and b!1533015 res!1050288) b!1533021))

(assert (= (and b!1533021 res!1050291) b!1533019))

(assert (= (and b!1533019 res!1050285) b!1533022))

(assert (= (and b!1533022 res!1050287) b!1533018))

(declare-fun m!1415135 () Bool)

(assert (=> b!1533021 m!1415135))

(declare-fun m!1415137 () Bool)

(assert (=> b!1533017 m!1415137))

(assert (=> b!1533017 m!1415137))

(declare-fun m!1415139 () Bool)

(assert (=> b!1533017 m!1415139))

(declare-fun m!1415141 () Bool)

(assert (=> b!1533022 m!1415141))

(assert (=> b!1533022 m!1415141))

(declare-fun m!1415143 () Bool)

(assert (=> b!1533022 m!1415143))

(declare-fun m!1415145 () Bool)

(assert (=> b!1533015 m!1415145))

(assert (=> b!1533016 m!1415141))

(assert (=> b!1533016 m!1415141))

(declare-fun m!1415147 () Bool)

(assert (=> b!1533016 m!1415147))

(declare-fun m!1415149 () Bool)

(assert (=> b!1533018 m!1415149))

(assert (=> b!1533018 m!1415141))

(declare-fun m!1415151 () Bool)

(assert (=> b!1533019 m!1415151))

(declare-fun m!1415153 () Bool)

(assert (=> start!130692 m!1415153))

(declare-fun m!1415155 () Bool)

(assert (=> start!130692 m!1415155))

(check-sat (not b!1533015) (not b!1533017) (not b!1533016) (not b!1533021) (not start!130692) (not b!1533022))
(check-sat)
