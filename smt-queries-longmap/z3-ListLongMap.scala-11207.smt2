; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131292 () Bool)

(assert start!131292)

(declare-fun res!1052891 () Bool)

(declare-fun e!856159 () Bool)

(assert (=> start!131292 (=> (not res!1052891) (not e!856159))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131292 (= res!1052891 (validMask!0 mask!2480))))

(assert (=> start!131292 e!856159))

(assert (=> start!131292 true))

(declare-datatypes ((array!102094 0))(
  ( (array!102095 (arr!49255 (Array (_ BitVec 32) (_ BitVec 64))) (size!49806 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102094)

(declare-fun array_inv!38536 (array!102094) Bool)

(assert (=> start!131292 (array_inv!38536 a!2792)))

(declare-fun b!1537379 () Bool)

(declare-fun res!1052895 () Bool)

(assert (=> b!1537379 (=> (not res!1052895) (not e!856159))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537379 (= res!1052895 (validKeyInArray!0 (select (arr!49255 a!2792) i!951)))))

(declare-fun b!1537380 () Bool)

(declare-fun e!856157 () Bool)

(assert (=> b!1537380 (= e!856159 e!856157)))

(declare-fun res!1052896 () Bool)

(assert (=> b!1537380 (=> (not res!1052896) (not e!856157))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664871 () (_ BitVec 32))

(assert (=> b!1537380 (= res!1052896 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664871 #b00000000000000000000000000000000) (bvslt lt!664871 (size!49806 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537380 (= lt!664871 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1537381 () Bool)

(declare-fun res!1052889 () Bool)

(assert (=> b!1537381 (=> (not res!1052889) (not e!856159))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1537381 (= res!1052889 (validKeyInArray!0 (select (arr!49255 a!2792) j!64)))))

(declare-fun b!1537382 () Bool)

(declare-fun res!1052897 () Bool)

(assert (=> b!1537382 (=> (not res!1052897) (not e!856159))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1537382 (= res!1052897 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49806 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49806 a!2792)) (= (select (arr!49255 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537383 () Bool)

(declare-fun res!1052890 () Bool)

(assert (=> b!1537383 (=> (not res!1052890) (not e!856159))))

(declare-datatypes ((List!35716 0))(
  ( (Nil!35713) (Cons!35712 (h!37175 (_ BitVec 64)) (t!50402 List!35716)) )
))
(declare-fun arrayNoDuplicates!0 (array!102094 (_ BitVec 32) List!35716) Bool)

(assert (=> b!1537383 (= res!1052890 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35713))))

(declare-fun b!1537384 () Bool)

(assert (=> b!1537384 (= e!856157 false)))

(declare-datatypes ((SeekEntryResult!13282 0))(
  ( (MissingZero!13282 (index!55523 (_ BitVec 32))) (Found!13282 (index!55524 (_ BitVec 32))) (Intermediate!13282 (undefined!14094 Bool) (index!55525 (_ BitVec 32)) (x!137486 (_ BitVec 32))) (Undefined!13282) (MissingVacant!13282 (index!55526 (_ BitVec 32))) )
))
(declare-fun lt!664872 () SeekEntryResult!13282)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102094 (_ BitVec 32)) SeekEntryResult!13282)

(assert (=> b!1537384 (= lt!664872 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664871 vacantIndex!5 (select (arr!49255 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537385 () Bool)

(declare-fun res!1052894 () Bool)

(assert (=> b!1537385 (=> (not res!1052894) (not e!856159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102094 (_ BitVec 32)) Bool)

(assert (=> b!1537385 (= res!1052894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537386 () Bool)

(declare-fun res!1052898 () Bool)

(assert (=> b!1537386 (=> (not res!1052898) (not e!856159))))

(assert (=> b!1537386 (= res!1052898 (not (= (select (arr!49255 a!2792) index!463) (select (arr!49255 a!2792) j!64))))))

(declare-fun b!1537387 () Bool)

(declare-fun res!1052892 () Bool)

(assert (=> b!1537387 (=> (not res!1052892) (not e!856159))))

(assert (=> b!1537387 (= res!1052892 (and (= (size!49806 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49806 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49806 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537388 () Bool)

(declare-fun res!1052893 () Bool)

(assert (=> b!1537388 (=> (not res!1052893) (not e!856159))))

(assert (=> b!1537388 (= res!1052893 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49255 a!2792) j!64) a!2792 mask!2480) (Found!13282 j!64)))))

(assert (= (and start!131292 res!1052891) b!1537387))

(assert (= (and b!1537387 res!1052892) b!1537379))

(assert (= (and b!1537379 res!1052895) b!1537381))

(assert (= (and b!1537381 res!1052889) b!1537385))

(assert (= (and b!1537385 res!1052894) b!1537383))

(assert (= (and b!1537383 res!1052890) b!1537382))

(assert (= (and b!1537382 res!1052897) b!1537388))

(assert (= (and b!1537388 res!1052893) b!1537386))

(assert (= (and b!1537386 res!1052898) b!1537380))

(assert (= (and b!1537380 res!1052896) b!1537384))

(declare-fun m!1419763 () Bool)

(assert (=> b!1537384 m!1419763))

(assert (=> b!1537384 m!1419763))

(declare-fun m!1419765 () Bool)

(assert (=> b!1537384 m!1419765))

(declare-fun m!1419767 () Bool)

(assert (=> b!1537383 m!1419767))

(declare-fun m!1419769 () Bool)

(assert (=> b!1537379 m!1419769))

(assert (=> b!1537379 m!1419769))

(declare-fun m!1419771 () Bool)

(assert (=> b!1537379 m!1419771))

(declare-fun m!1419773 () Bool)

(assert (=> b!1537386 m!1419773))

(assert (=> b!1537386 m!1419763))

(declare-fun m!1419775 () Bool)

(assert (=> b!1537382 m!1419775))

(declare-fun m!1419777 () Bool)

(assert (=> b!1537380 m!1419777))

(declare-fun m!1419779 () Bool)

(assert (=> b!1537385 m!1419779))

(assert (=> b!1537388 m!1419763))

(assert (=> b!1537388 m!1419763))

(declare-fun m!1419781 () Bool)

(assert (=> b!1537388 m!1419781))

(declare-fun m!1419783 () Bool)

(assert (=> start!131292 m!1419783))

(declare-fun m!1419785 () Bool)

(assert (=> start!131292 m!1419785))

(assert (=> b!1537381 m!1419763))

(assert (=> b!1537381 m!1419763))

(declare-fun m!1419787 () Bool)

(assert (=> b!1537381 m!1419787))

(check-sat (not b!1537379) (not b!1537385) (not b!1537380) (not start!131292) (not b!1537384) (not b!1537383) (not b!1537381) (not b!1537388))
(check-sat)
