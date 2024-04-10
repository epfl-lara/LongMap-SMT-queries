; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131356 () Bool)

(assert start!131356)

(declare-fun b!1540045 () Bool)

(declare-fun res!1056745 () Bool)

(declare-fun e!856563 () Bool)

(assert (=> b!1540045 (=> (not res!1056745) (not e!856563))))

(declare-datatypes ((array!102304 0))(
  ( (array!102305 (arr!49362 (Array (_ BitVec 32) (_ BitVec 64))) (size!49912 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102304)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540045 (= res!1056745 (validKeyInArray!0 (select (arr!49362 a!2792) i!951)))))

(declare-fun b!1540046 () Bool)

(declare-fun res!1056740 () Bool)

(assert (=> b!1540046 (=> (not res!1056740) (not e!856563))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540046 (= res!1056740 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49912 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49912 a!2792)) (= (select (arr!49362 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540047 () Bool)

(declare-fun e!856561 () Bool)

(assert (=> b!1540047 (= e!856563 e!856561)))

(declare-fun res!1056744 () Bool)

(assert (=> b!1540047 (=> (not res!1056744) (not e!856561))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13488 0))(
  ( (MissingZero!13488 (index!56347 (_ BitVec 32))) (Found!13488 (index!56348 (_ BitVec 32))) (Intermediate!13488 (undefined!14300 Bool) (index!56349 (_ BitVec 32)) (x!138087 (_ BitVec 32))) (Undefined!13488) (MissingVacant!13488 (index!56350 (_ BitVec 32))) )
))
(declare-fun lt!665211 () SeekEntryResult!13488)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102304 (_ BitVec 32)) SeekEntryResult!13488)

(assert (=> b!1540047 (= res!1056744 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49362 a!2792) j!64) a!2792 mask!2480) lt!665211))))

(assert (=> b!1540047 (= lt!665211 (Found!13488 j!64))))

(declare-fun b!1540048 () Bool)

(declare-fun e!856564 () Bool)

(assert (=> b!1540048 (= e!856564 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!510)) (bvsub #b01111111111111111111111111111110 x!510)))))

(declare-fun res!1056739 () Bool)

(assert (=> start!131356 (=> (not res!1056739) (not e!856563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131356 (= res!1056739 (validMask!0 mask!2480))))

(assert (=> start!131356 e!856563))

(assert (=> start!131356 true))

(declare-fun array_inv!38390 (array!102304) Bool)

(assert (=> start!131356 (array_inv!38390 a!2792)))

(declare-fun b!1540049 () Bool)

(declare-fun res!1056741 () Bool)

(assert (=> b!1540049 (=> (not res!1056741) (not e!856563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102304 (_ BitVec 32)) Bool)

(assert (=> b!1540049 (= res!1056741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540050 () Bool)

(assert (=> b!1540050 (= e!856561 e!856564)))

(declare-fun res!1056743 () Bool)

(assert (=> b!1540050 (=> (not res!1056743) (not e!856564))))

(declare-fun lt!665212 () (_ BitVec 32))

(assert (=> b!1540050 (= res!1056743 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665212 #b00000000000000000000000000000000) (bvslt lt!665212 (size!49912 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540050 (= lt!665212 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540051 () Bool)

(declare-fun res!1056736 () Bool)

(assert (=> b!1540051 (=> (not res!1056736) (not e!856563))))

(assert (=> b!1540051 (= res!1056736 (validKeyInArray!0 (select (arr!49362 a!2792) j!64)))))

(declare-fun b!1540052 () Bool)

(declare-fun res!1056742 () Bool)

(assert (=> b!1540052 (=> (not res!1056742) (not e!856563))))

(assert (=> b!1540052 (= res!1056742 (and (= (size!49912 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49912 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49912 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540053 () Bool)

(declare-fun res!1056738 () Bool)

(assert (=> b!1540053 (=> (not res!1056738) (not e!856563))))

(declare-datatypes ((List!35836 0))(
  ( (Nil!35833) (Cons!35832 (h!37277 (_ BitVec 64)) (t!50530 List!35836)) )
))
(declare-fun arrayNoDuplicates!0 (array!102304 (_ BitVec 32) List!35836) Bool)

(assert (=> b!1540053 (= res!1056738 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35833))))

(declare-fun b!1540054 () Bool)

(declare-fun res!1056735 () Bool)

(assert (=> b!1540054 (=> (not res!1056735) (not e!856561))))

(assert (=> b!1540054 (= res!1056735 (not (= (select (arr!49362 a!2792) index!463) (select (arr!49362 a!2792) j!64))))))

(declare-fun b!1540055 () Bool)

(declare-fun res!1056737 () Bool)

(assert (=> b!1540055 (=> (not res!1056737) (not e!856564))))

(assert (=> b!1540055 (= res!1056737 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665212 vacantIndex!5 (select (arr!49362 a!2792) j!64) a!2792 mask!2480) lt!665211))))

(assert (= (and start!131356 res!1056739) b!1540052))

(assert (= (and b!1540052 res!1056742) b!1540045))

(assert (= (and b!1540045 res!1056745) b!1540051))

(assert (= (and b!1540051 res!1056736) b!1540049))

(assert (= (and b!1540049 res!1056741) b!1540053))

(assert (= (and b!1540053 res!1056738) b!1540046))

(assert (= (and b!1540046 res!1056740) b!1540047))

(assert (= (and b!1540047 res!1056744) b!1540054))

(assert (= (and b!1540054 res!1056735) b!1540050))

(assert (= (and b!1540050 res!1056743) b!1540055))

(assert (= (and b!1540055 res!1056737) b!1540048))

(declare-fun m!1422161 () Bool)

(assert (=> b!1540055 m!1422161))

(assert (=> b!1540055 m!1422161))

(declare-fun m!1422163 () Bool)

(assert (=> b!1540055 m!1422163))

(declare-fun m!1422165 () Bool)

(assert (=> b!1540053 m!1422165))

(declare-fun m!1422167 () Bool)

(assert (=> b!1540046 m!1422167))

(declare-fun m!1422169 () Bool)

(assert (=> b!1540049 m!1422169))

(declare-fun m!1422171 () Bool)

(assert (=> b!1540045 m!1422171))

(assert (=> b!1540045 m!1422171))

(declare-fun m!1422173 () Bool)

(assert (=> b!1540045 m!1422173))

(assert (=> b!1540047 m!1422161))

(assert (=> b!1540047 m!1422161))

(declare-fun m!1422175 () Bool)

(assert (=> b!1540047 m!1422175))

(declare-fun m!1422177 () Bool)

(assert (=> b!1540054 m!1422177))

(assert (=> b!1540054 m!1422161))

(declare-fun m!1422179 () Bool)

(assert (=> start!131356 m!1422179))

(declare-fun m!1422181 () Bool)

(assert (=> start!131356 m!1422181))

(declare-fun m!1422183 () Bool)

(assert (=> b!1540050 m!1422183))

(assert (=> b!1540051 m!1422161))

(assert (=> b!1540051 m!1422161))

(declare-fun m!1422185 () Bool)

(assert (=> b!1540051 m!1422185))

(check-sat (not b!1540049) (not start!131356) (not b!1540045) (not b!1540053) (not b!1540051) (not b!1540055) (not b!1540047) (not b!1540050))
(check-sat)
