; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131068 () Bool)

(assert start!131068)

(declare-fun b!1537820 () Bool)

(declare-fun res!1054906 () Bool)

(declare-fun e!855769 () Bool)

(assert (=> b!1537820 (=> (not res!1054906) (not e!855769))))

(declare-datatypes ((array!102166 0))(
  ( (array!102167 (arr!49299 (Array (_ BitVec 32) (_ BitVec 64))) (size!49849 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102166)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537820 (= res!1054906 (validKeyInArray!0 (select (arr!49299 a!2792) j!64)))))

(declare-fun b!1537821 () Bool)

(declare-fun res!1054909 () Bool)

(assert (=> b!1537821 (=> (not res!1054909) (not e!855769))))

(declare-datatypes ((List!35773 0))(
  ( (Nil!35770) (Cons!35769 (h!37214 (_ BitVec 64)) (t!50467 List!35773)) )
))
(declare-fun arrayNoDuplicates!0 (array!102166 (_ BitVec 32) List!35773) Bool)

(assert (=> b!1537821 (= res!1054909 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35770))))

(declare-fun b!1537822 () Bool)

(assert (=> b!1537822 (= e!855769 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13425 0))(
  ( (MissingZero!13425 (index!56095 (_ BitVec 32))) (Found!13425 (index!56096 (_ BitVec 32))) (Intermediate!13425 (undefined!14237 Bool) (index!56097 (_ BitVec 32)) (x!137835 (_ BitVec 32))) (Undefined!13425) (MissingVacant!13425 (index!56098 (_ BitVec 32))) )
))
(declare-fun lt!664789 () SeekEntryResult!13425)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102166 (_ BitVec 32)) SeekEntryResult!13425)

(assert (=> b!1537822 (= lt!664789 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49299 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537823 () Bool)

(declare-fun res!1054908 () Bool)

(assert (=> b!1537823 (=> (not res!1054908) (not e!855769))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537823 (= res!1054908 (and (= (size!49849 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49849 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49849 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054910 () Bool)

(assert (=> start!131068 (=> (not res!1054910) (not e!855769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131068 (= res!1054910 (validMask!0 mask!2480))))

(assert (=> start!131068 e!855769))

(assert (=> start!131068 true))

(declare-fun array_inv!38327 (array!102166) Bool)

(assert (=> start!131068 (array_inv!38327 a!2792)))

(declare-fun b!1537824 () Bool)

(declare-fun res!1054907 () Bool)

(assert (=> b!1537824 (=> (not res!1054907) (not e!855769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102166 (_ BitVec 32)) Bool)

(assert (=> b!1537824 (= res!1054907 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537825 () Bool)

(declare-fun res!1054911 () Bool)

(assert (=> b!1537825 (=> (not res!1054911) (not e!855769))))

(assert (=> b!1537825 (= res!1054911 (validKeyInArray!0 (select (arr!49299 a!2792) i!951)))))

(declare-fun b!1537826 () Bool)

(declare-fun res!1054912 () Bool)

(assert (=> b!1537826 (=> (not res!1054912) (not e!855769))))

(assert (=> b!1537826 (= res!1054912 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49849 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49849 a!2792)) (= (select (arr!49299 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131068 res!1054910) b!1537823))

(assert (= (and b!1537823 res!1054908) b!1537825))

(assert (= (and b!1537825 res!1054911) b!1537820))

(assert (= (and b!1537820 res!1054906) b!1537824))

(assert (= (and b!1537824 res!1054907) b!1537821))

(assert (= (and b!1537821 res!1054909) b!1537826))

(assert (= (and b!1537826 res!1054912) b!1537822))

(declare-fun m!1420331 () Bool)

(assert (=> b!1537820 m!1420331))

(assert (=> b!1537820 m!1420331))

(declare-fun m!1420333 () Bool)

(assert (=> b!1537820 m!1420333))

(declare-fun m!1420335 () Bool)

(assert (=> b!1537825 m!1420335))

(assert (=> b!1537825 m!1420335))

(declare-fun m!1420337 () Bool)

(assert (=> b!1537825 m!1420337))

(declare-fun m!1420339 () Bool)

(assert (=> b!1537824 m!1420339))

(declare-fun m!1420341 () Bool)

(assert (=> b!1537826 m!1420341))

(declare-fun m!1420343 () Bool)

(assert (=> b!1537821 m!1420343))

(assert (=> b!1537822 m!1420331))

(assert (=> b!1537822 m!1420331))

(declare-fun m!1420345 () Bool)

(assert (=> b!1537822 m!1420345))

(declare-fun m!1420347 () Bool)

(assert (=> start!131068 m!1420347))

(declare-fun m!1420349 () Bool)

(assert (=> start!131068 m!1420349))

(check-sat (not b!1537820) (not start!131068) (not b!1537821) (not b!1537824) (not b!1537825) (not b!1537822))
