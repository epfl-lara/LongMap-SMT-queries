; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131088 () Bool)

(assert start!131088)

(declare-fun b!1535274 () Bool)

(declare-fun res!1050875 () Bool)

(declare-fun e!855517 () Bool)

(assert (=> b!1535274 (=> (not res!1050875) (not e!855517))))

(declare-datatypes ((array!101923 0))(
  ( (array!101924 (arr!49171 (Array (_ BitVec 32) (_ BitVec 64))) (size!49722 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101923)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101923 (_ BitVec 32)) Bool)

(assert (=> b!1535274 (= res!1050875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535275 () Bool)

(declare-fun res!1050876 () Bool)

(assert (=> b!1535275 (=> (not res!1050876) (not e!855517))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535275 (= res!1050876 (validKeyInArray!0 (select (arr!49171 a!2792) j!64)))))

(declare-fun b!1535276 () Bool)

(declare-fun res!1050878 () Bool)

(assert (=> b!1535276 (=> (not res!1050878) (not e!855517))))

(declare-datatypes ((List!35632 0))(
  ( (Nil!35629) (Cons!35628 (h!37091 (_ BitVec 64)) (t!50318 List!35632)) )
))
(declare-fun arrayNoDuplicates!0 (array!101923 (_ BitVec 32) List!35632) Bool)

(assert (=> b!1535276 (= res!1050878 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35629))))

(declare-fun b!1535277 () Bool)

(declare-fun res!1050877 () Bool)

(assert (=> b!1535277 (=> (not res!1050877) (not e!855517))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535277 (= res!1050877 (and (= (size!49722 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49722 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49722 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1050879 () Bool)

(assert (=> start!131088 (=> (not res!1050879) (not e!855517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131088 (= res!1050879 (validMask!0 mask!2480))))

(assert (=> start!131088 e!855517))

(assert (=> start!131088 true))

(declare-fun array_inv!38452 (array!101923) Bool)

(assert (=> start!131088 (array_inv!38452 a!2792)))

(declare-fun b!1535278 () Bool)

(declare-fun res!1050874 () Bool)

(assert (=> b!1535278 (=> (not res!1050874) (not e!855517))))

(assert (=> b!1535278 (= res!1050874 (validKeyInArray!0 (select (arr!49171 a!2792) i!951)))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun b!1535279 () Bool)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535279 (= e!855517 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49722 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49722 a!2792)) (= (select (arr!49171 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(assert (= (and start!131088 res!1050879) b!1535277))

(assert (= (and b!1535277 res!1050877) b!1535278))

(assert (= (and b!1535278 res!1050874) b!1535275))

(assert (= (and b!1535275 res!1050876) b!1535274))

(assert (= (and b!1535274 res!1050875) b!1535276))

(assert (= (and b!1535276 res!1050878) b!1535279))

(declare-fun m!1417849 () Bool)

(assert (=> b!1535278 m!1417849))

(assert (=> b!1535278 m!1417849))

(declare-fun m!1417851 () Bool)

(assert (=> b!1535278 m!1417851))

(declare-fun m!1417853 () Bool)

(assert (=> b!1535276 m!1417853))

(declare-fun m!1417855 () Bool)

(assert (=> b!1535274 m!1417855))

(declare-fun m!1417857 () Bool)

(assert (=> b!1535279 m!1417857))

(declare-fun m!1417859 () Bool)

(assert (=> start!131088 m!1417859))

(declare-fun m!1417861 () Bool)

(assert (=> start!131088 m!1417861))

(declare-fun m!1417863 () Bool)

(assert (=> b!1535275 m!1417863))

(assert (=> b!1535275 m!1417863))

(declare-fun m!1417865 () Bool)

(assert (=> b!1535275 m!1417865))

(check-sat (not b!1535278) (not start!131088) (not b!1535276) (not b!1535274) (not b!1535275))
(check-sat)
