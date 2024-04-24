; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131064 () Bool)

(assert start!131064)

(declare-fun b!1535076 () Bool)

(declare-fun res!1050677 () Bool)

(declare-fun e!855445 () Bool)

(assert (=> b!1535076 (=> (not res!1050677) (not e!855445))))

(declare-datatypes ((array!101899 0))(
  ( (array!101900 (arr!49159 (Array (_ BitVec 32) (_ BitVec 64))) (size!49710 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101899)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101899 (_ BitVec 32)) Bool)

(assert (=> b!1535076 (= res!1050677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535077 () Bool)

(declare-fun res!1050681 () Bool)

(assert (=> b!1535077 (=> (not res!1050681) (not e!855445))))

(declare-datatypes ((List!35620 0))(
  ( (Nil!35617) (Cons!35616 (h!37079 (_ BitVec 64)) (t!50306 List!35620)) )
))
(declare-fun arrayNoDuplicates!0 (array!101899 (_ BitVec 32) List!35620) Bool)

(assert (=> b!1535077 (= res!1050681 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35617))))

(declare-fun b!1535078 () Bool)

(declare-fun res!1050676 () Bool)

(assert (=> b!1535078 (=> (not res!1050676) (not e!855445))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535078 (= res!1050676 (validKeyInArray!0 (select (arr!49159 a!2792) i!951)))))

(declare-fun res!1050679 () Bool)

(assert (=> start!131064 (=> (not res!1050679) (not e!855445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131064 (= res!1050679 (validMask!0 mask!2480))))

(assert (=> start!131064 e!855445))

(assert (=> start!131064 true))

(declare-fun array_inv!38440 (array!101899) Bool)

(assert (=> start!131064 (array_inv!38440 a!2792)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun b!1535079 () Bool)

(assert (=> b!1535079 (= e!855445 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49710 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49710 a!2792)) (= (select (arr!49159 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2480 #b00000000000000000000000000000000)))))

(declare-fun b!1535080 () Bool)

(declare-fun res!1050680 () Bool)

(assert (=> b!1535080 (=> (not res!1050680) (not e!855445))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535080 (= res!1050680 (validKeyInArray!0 (select (arr!49159 a!2792) j!64)))))

(declare-fun b!1535081 () Bool)

(declare-fun res!1050678 () Bool)

(assert (=> b!1535081 (=> (not res!1050678) (not e!855445))))

(assert (=> b!1535081 (= res!1050678 (and (= (size!49710 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49710 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49710 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131064 res!1050679) b!1535081))

(assert (= (and b!1535081 res!1050678) b!1535078))

(assert (= (and b!1535078 res!1050676) b!1535080))

(assert (= (and b!1535080 res!1050680) b!1535076))

(assert (= (and b!1535076 res!1050677) b!1535077))

(assert (= (and b!1535077 res!1050681) b!1535079))

(declare-fun m!1417645 () Bool)

(assert (=> start!131064 m!1417645))

(declare-fun m!1417647 () Bool)

(assert (=> start!131064 m!1417647))

(declare-fun m!1417649 () Bool)

(assert (=> b!1535080 m!1417649))

(assert (=> b!1535080 m!1417649))

(declare-fun m!1417651 () Bool)

(assert (=> b!1535080 m!1417651))

(declare-fun m!1417653 () Bool)

(assert (=> b!1535079 m!1417653))

(declare-fun m!1417655 () Bool)

(assert (=> b!1535078 m!1417655))

(assert (=> b!1535078 m!1417655))

(declare-fun m!1417657 () Bool)

(assert (=> b!1535078 m!1417657))

(declare-fun m!1417659 () Bool)

(assert (=> b!1535077 m!1417659))

(declare-fun m!1417661 () Bool)

(assert (=> b!1535076 m!1417661))

(check-sat (not b!1535076) (not b!1535080) (not b!1535077) (not start!131064) (not b!1535078))
(check-sat)
