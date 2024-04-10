; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131134 () Bool)

(assert start!131134)

(declare-fun b!1538307 () Bool)

(declare-fun e!855966 () Bool)

(assert (=> b!1538307 (= e!855966 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664885 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538307 (= lt!664885 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538308 () Bool)

(declare-fun res!1055293 () Bool)

(assert (=> b!1538308 (=> (not res!1055293) (not e!855966))))

(declare-datatypes ((array!102199 0))(
  ( (array!102200 (arr!49314 (Array (_ BitVec 32) (_ BitVec 64))) (size!49864 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102199)

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1538308 (= res!1055293 (not (= (select (arr!49314 a!2792) index!463) (select (arr!49314 a!2792) j!64))))))

(declare-fun b!1538309 () Bool)

(declare-fun res!1055292 () Bool)

(assert (=> b!1538309 (=> (not res!1055292) (not e!855966))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538309 (= res!1055292 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49864 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49864 a!2792)) (= (select (arr!49314 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538310 () Bool)

(declare-fun res!1055286 () Bool)

(assert (=> b!1538310 (=> (not res!1055286) (not e!855966))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538310 (= res!1055286 (and (= (size!49864 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49864 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49864 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538311 () Bool)

(declare-fun res!1055287 () Bool)

(assert (=> b!1538311 (=> (not res!1055287) (not e!855966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538311 (= res!1055287 (validKeyInArray!0 (select (arr!49314 a!2792) j!64)))))

(declare-fun b!1538313 () Bool)

(declare-fun res!1055285 () Bool)

(assert (=> b!1538313 (=> (not res!1055285) (not e!855966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102199 (_ BitVec 32)) Bool)

(assert (=> b!1538313 (= res!1055285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538314 () Bool)

(declare-fun res!1055291 () Bool)

(assert (=> b!1538314 (=> (not res!1055291) (not e!855966))))

(declare-datatypes ((List!35788 0))(
  ( (Nil!35785) (Cons!35784 (h!37229 (_ BitVec 64)) (t!50482 List!35788)) )
))
(declare-fun arrayNoDuplicates!0 (array!102199 (_ BitVec 32) List!35788) Bool)

(assert (=> b!1538314 (= res!1055291 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35785))))

(declare-fun b!1538315 () Bool)

(declare-fun res!1055289 () Bool)

(assert (=> b!1538315 (=> (not res!1055289) (not e!855966))))

(declare-datatypes ((SeekEntryResult!13440 0))(
  ( (MissingZero!13440 (index!56155 (_ BitVec 32))) (Found!13440 (index!56156 (_ BitVec 32))) (Intermediate!13440 (undefined!14252 Bool) (index!56157 (_ BitVec 32)) (x!137893 (_ BitVec 32))) (Undefined!13440) (MissingVacant!13440 (index!56158 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102199 (_ BitVec 32)) SeekEntryResult!13440)

(assert (=> b!1538315 (= res!1055289 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49314 a!2792) j!64) a!2792 mask!2480) (Found!13440 j!64)))))

(declare-fun res!1055288 () Bool)

(assert (=> start!131134 (=> (not res!1055288) (not e!855966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131134 (= res!1055288 (validMask!0 mask!2480))))

(assert (=> start!131134 e!855966))

(assert (=> start!131134 true))

(declare-fun array_inv!38342 (array!102199) Bool)

(assert (=> start!131134 (array_inv!38342 a!2792)))

(declare-fun b!1538312 () Bool)

(declare-fun res!1055290 () Bool)

(assert (=> b!1538312 (=> (not res!1055290) (not e!855966))))

(assert (=> b!1538312 (= res!1055290 (validKeyInArray!0 (select (arr!49314 a!2792) i!951)))))

(assert (= (and start!131134 res!1055288) b!1538310))

(assert (= (and b!1538310 res!1055286) b!1538312))

(assert (= (and b!1538312 res!1055290) b!1538311))

(assert (= (and b!1538311 res!1055287) b!1538313))

(assert (= (and b!1538313 res!1055285) b!1538314))

(assert (= (and b!1538314 res!1055291) b!1538309))

(assert (= (and b!1538309 res!1055292) b!1538315))

(assert (= (and b!1538315 res!1055289) b!1538308))

(assert (= (and b!1538308 res!1055293) b!1538307))

(declare-fun m!1420755 () Bool)

(assert (=> b!1538315 m!1420755))

(assert (=> b!1538315 m!1420755))

(declare-fun m!1420757 () Bool)

(assert (=> b!1538315 m!1420757))

(declare-fun m!1420759 () Bool)

(assert (=> b!1538308 m!1420759))

(assert (=> b!1538308 m!1420755))

(assert (=> b!1538311 m!1420755))

(assert (=> b!1538311 m!1420755))

(declare-fun m!1420761 () Bool)

(assert (=> b!1538311 m!1420761))

(declare-fun m!1420763 () Bool)

(assert (=> b!1538307 m!1420763))

(declare-fun m!1420765 () Bool)

(assert (=> b!1538309 m!1420765))

(declare-fun m!1420767 () Bool)

(assert (=> b!1538314 m!1420767))

(declare-fun m!1420769 () Bool)

(assert (=> start!131134 m!1420769))

(declare-fun m!1420771 () Bool)

(assert (=> start!131134 m!1420771))

(declare-fun m!1420773 () Bool)

(assert (=> b!1538312 m!1420773))

(assert (=> b!1538312 m!1420773))

(declare-fun m!1420775 () Bool)

(assert (=> b!1538312 m!1420775))

(declare-fun m!1420777 () Bool)

(assert (=> b!1538313 m!1420777))

(check-sat (not b!1538313) (not b!1538307) (not b!1538315) (not b!1538311) (not b!1538314) (not start!131134) (not b!1538312))
