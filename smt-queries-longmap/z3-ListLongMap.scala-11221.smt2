; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131376 () Bool)

(assert start!131376)

(declare-fun b!1538668 () Bool)

(declare-fun res!1054185 () Bool)

(declare-fun e!856595 () Bool)

(assert (=> b!1538668 (=> (not res!1054185) (not e!856595))))

(declare-datatypes ((array!102178 0))(
  ( (array!102179 (arr!49297 (Array (_ BitVec 32) (_ BitVec 64))) (size!49848 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102178)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538668 (= res!1054185 (validKeyInArray!0 (select (arr!49297 a!2792) i!951)))))

(declare-fun b!1538669 () Bool)

(declare-fun res!1054182 () Bool)

(assert (=> b!1538669 (=> (not res!1054182) (not e!856595))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1538669 (= res!1054182 (validKeyInArray!0 (select (arr!49297 a!2792) j!64)))))

(declare-fun b!1538670 () Bool)

(declare-fun res!1054188 () Bool)

(assert (=> b!1538670 (=> (not res!1054188) (not e!856595))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538670 (= res!1054188 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49848 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49848 a!2792)) (= (select (arr!49297 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538671 () Bool)

(declare-fun res!1054181 () Bool)

(declare-fun e!856596 () Bool)

(assert (=> b!1538671 (=> (not res!1054181) (not e!856596))))

(assert (=> b!1538671 (= res!1054181 (not (= (select (arr!49297 a!2792) index!463) (select (arr!49297 a!2792) j!64))))))

(declare-fun res!1054178 () Bool)

(assert (=> start!131376 (=> (not res!1054178) (not e!856595))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131376 (= res!1054178 (validMask!0 mask!2480))))

(assert (=> start!131376 e!856595))

(assert (=> start!131376 true))

(declare-fun array_inv!38578 (array!102178) Bool)

(assert (=> start!131376 (array_inv!38578 a!2792)))

(declare-fun b!1538672 () Bool)

(assert (=> b!1538672 (= e!856595 e!856596)))

(declare-fun res!1054187 () Bool)

(assert (=> b!1538672 (=> (not res!1054187) (not e!856596))))

(declare-datatypes ((SeekEntryResult!13324 0))(
  ( (MissingZero!13324 (index!55691 (_ BitVec 32))) (Found!13324 (index!55692 (_ BitVec 32))) (Intermediate!13324 (undefined!14136 Bool) (index!55693 (_ BitVec 32)) (x!137640 (_ BitVec 32))) (Undefined!13324) (MissingVacant!13324 (index!55694 (_ BitVec 32))) )
))
(declare-fun lt!665182 () SeekEntryResult!13324)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102178 (_ BitVec 32)) SeekEntryResult!13324)

(assert (=> b!1538672 (= res!1054187 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49297 a!2792) j!64) a!2792 mask!2480) lt!665182))))

(assert (=> b!1538672 (= lt!665182 (Found!13324 j!64))))

(declare-fun b!1538673 () Bool)

(declare-fun e!856593 () Bool)

(assert (=> b!1538673 (= e!856593 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)))))))

(declare-fun lt!665181 () (_ BitVec 32))

(declare-fun lt!665183 () SeekEntryResult!13324)

(assert (=> b!1538673 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665181 vacantIndex!5 (select (store (arr!49297 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102179 (store (arr!49297 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49848 a!2792)) mask!2480) lt!665183)))

(declare-datatypes ((Unit!51257 0))(
  ( (Unit!51258) )
))
(declare-fun lt!665184 () Unit!51257)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51257)

(assert (=> b!1538673 (= lt!665184 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!665181 vacantIndex!5 mask!2480))))

(declare-fun b!1538674 () Bool)

(declare-fun e!856597 () Bool)

(assert (=> b!1538674 (= e!856596 e!856597)))

(declare-fun res!1054179 () Bool)

(assert (=> b!1538674 (=> (not res!1054179) (not e!856597))))

(assert (=> b!1538674 (= res!1054179 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665181 #b00000000000000000000000000000000) (bvslt lt!665181 (size!49848 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538674 (= lt!665181 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1538675 () Bool)

(assert (=> b!1538675 (= e!856597 e!856593)))

(declare-fun res!1054183 () Bool)

(assert (=> b!1538675 (=> (not res!1054183) (not e!856593))))

(assert (=> b!1538675 (= res!1054183 (= lt!665183 lt!665182))))

(assert (=> b!1538675 (= lt!665183 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665181 vacantIndex!5 (select (arr!49297 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538676 () Bool)

(declare-fun res!1054186 () Bool)

(assert (=> b!1538676 (=> (not res!1054186) (not e!856595))))

(assert (=> b!1538676 (= res!1054186 (and (= (size!49848 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49848 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49848 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538677 () Bool)

(declare-fun res!1054184 () Bool)

(assert (=> b!1538677 (=> (not res!1054184) (not e!856595))))

(declare-datatypes ((List!35758 0))(
  ( (Nil!35755) (Cons!35754 (h!37217 (_ BitVec 64)) (t!50444 List!35758)) )
))
(declare-fun arrayNoDuplicates!0 (array!102178 (_ BitVec 32) List!35758) Bool)

(assert (=> b!1538677 (= res!1054184 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35755))))

(declare-fun b!1538678 () Bool)

(declare-fun res!1054180 () Bool)

(assert (=> b!1538678 (=> (not res!1054180) (not e!856595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102178 (_ BitVec 32)) Bool)

(assert (=> b!1538678 (= res!1054180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131376 res!1054178) b!1538676))

(assert (= (and b!1538676 res!1054186) b!1538668))

(assert (= (and b!1538668 res!1054185) b!1538669))

(assert (= (and b!1538669 res!1054182) b!1538678))

(assert (= (and b!1538678 res!1054180) b!1538677))

(assert (= (and b!1538677 res!1054184) b!1538670))

(assert (= (and b!1538670 res!1054188) b!1538672))

(assert (= (and b!1538672 res!1054187) b!1538671))

(assert (= (and b!1538671 res!1054181) b!1538674))

(assert (= (and b!1538674 res!1054179) b!1538675))

(assert (= (and b!1538675 res!1054183) b!1538673))

(declare-fun m!1420927 () Bool)

(assert (=> b!1538668 m!1420927))

(assert (=> b!1538668 m!1420927))

(declare-fun m!1420929 () Bool)

(assert (=> b!1538668 m!1420929))

(declare-fun m!1420931 () Bool)

(assert (=> b!1538672 m!1420931))

(assert (=> b!1538672 m!1420931))

(declare-fun m!1420933 () Bool)

(assert (=> b!1538672 m!1420933))

(assert (=> b!1538669 m!1420931))

(assert (=> b!1538669 m!1420931))

(declare-fun m!1420935 () Bool)

(assert (=> b!1538669 m!1420935))

(declare-fun m!1420937 () Bool)

(assert (=> b!1538677 m!1420937))

(declare-fun m!1420939 () Bool)

(assert (=> b!1538671 m!1420939))

(assert (=> b!1538671 m!1420931))

(declare-fun m!1420941 () Bool)

(assert (=> b!1538678 m!1420941))

(declare-fun m!1420943 () Bool)

(assert (=> start!131376 m!1420943))

(declare-fun m!1420945 () Bool)

(assert (=> start!131376 m!1420945))

(assert (=> b!1538675 m!1420931))

(assert (=> b!1538675 m!1420931))

(declare-fun m!1420947 () Bool)

(assert (=> b!1538675 m!1420947))

(declare-fun m!1420949 () Bool)

(assert (=> b!1538673 m!1420949))

(declare-fun m!1420951 () Bool)

(assert (=> b!1538673 m!1420951))

(assert (=> b!1538673 m!1420951))

(declare-fun m!1420953 () Bool)

(assert (=> b!1538673 m!1420953))

(declare-fun m!1420955 () Bool)

(assert (=> b!1538673 m!1420955))

(declare-fun m!1420957 () Bool)

(assert (=> b!1538670 m!1420957))

(declare-fun m!1420959 () Bool)

(assert (=> b!1538674 m!1420959))

(check-sat (not b!1538669) (not b!1538678) (not b!1538674) (not start!131376) (not b!1538668) (not b!1538673) (not b!1538675) (not b!1538677) (not b!1538672))
(check-sat)
