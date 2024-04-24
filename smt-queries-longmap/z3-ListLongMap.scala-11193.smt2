; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131172 () Bool)

(assert start!131172)

(declare-datatypes ((array!102007 0))(
  ( (array!102008 (arr!49213 (Array (_ BitVec 32) (_ BitVec 64))) (size!49764 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102007)

(declare-fun e!855768 () Bool)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun b!1536178 () Bool)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1536178 (= e!855768 (and (= (select (arr!49213 a!2792) index!463) (select (arr!49213 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1536179 () Bool)

(declare-fun res!1051779 () Bool)

(assert (=> b!1536179 (=> (not res!1051779) (not e!855768))))

(declare-datatypes ((List!35674 0))(
  ( (Nil!35671) (Cons!35670 (h!37133 (_ BitVec 64)) (t!50360 List!35674)) )
))
(declare-fun arrayNoDuplicates!0 (array!102007 (_ BitVec 32) List!35674) Bool)

(assert (=> b!1536179 (= res!1051779 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35671))))

(declare-fun b!1536180 () Bool)

(declare-fun res!1051781 () Bool)

(assert (=> b!1536180 (=> (not res!1051781) (not e!855768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536180 (= res!1051781 (validKeyInArray!0 (select (arr!49213 a!2792) j!64)))))

(declare-fun b!1536181 () Bool)

(declare-fun res!1051784 () Bool)

(assert (=> b!1536181 (=> (not res!1051784) (not e!855768))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13240 0))(
  ( (MissingZero!13240 (index!55355 (_ BitVec 32))) (Found!13240 (index!55356 (_ BitVec 32))) (Intermediate!13240 (undefined!14052 Bool) (index!55357 (_ BitVec 32)) (x!137329 (_ BitVec 32))) (Undefined!13240) (MissingVacant!13240 (index!55358 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102007 (_ BitVec 32)) SeekEntryResult!13240)

(assert (=> b!1536181 (= res!1051784 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49213 a!2792) j!64) a!2792 mask!2480) (Found!13240 j!64)))))

(declare-fun b!1536182 () Bool)

(declare-fun res!1051778 () Bool)

(assert (=> b!1536182 (=> (not res!1051778) (not e!855768))))

(assert (=> b!1536182 (= res!1051778 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49764 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49764 a!2792)) (= (select (arr!49213 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1051782 () Bool)

(assert (=> start!131172 (=> (not res!1051782) (not e!855768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131172 (= res!1051782 (validMask!0 mask!2480))))

(assert (=> start!131172 e!855768))

(assert (=> start!131172 true))

(declare-fun array_inv!38494 (array!102007) Bool)

(assert (=> start!131172 (array_inv!38494 a!2792)))

(declare-fun b!1536183 () Bool)

(declare-fun res!1051785 () Bool)

(assert (=> b!1536183 (=> (not res!1051785) (not e!855768))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536183 (= res!1051785 (validKeyInArray!0 (select (arr!49213 a!2792) i!951)))))

(declare-fun b!1536184 () Bool)

(declare-fun res!1051783 () Bool)

(assert (=> b!1536184 (=> (not res!1051783) (not e!855768))))

(assert (=> b!1536184 (= res!1051783 (and (= (size!49764 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49764 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49764 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536185 () Bool)

(declare-fun res!1051780 () Bool)

(assert (=> b!1536185 (=> (not res!1051780) (not e!855768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102007 (_ BitVec 32)) Bool)

(assert (=> b!1536185 (= res!1051780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131172 res!1051782) b!1536184))

(assert (= (and b!1536184 res!1051783) b!1536183))

(assert (= (and b!1536183 res!1051785) b!1536180))

(assert (= (and b!1536180 res!1051781) b!1536185))

(assert (= (and b!1536185 res!1051780) b!1536179))

(assert (= (and b!1536179 res!1051779) b!1536182))

(assert (= (and b!1536182 res!1051778) b!1536181))

(assert (= (and b!1536181 res!1051784) b!1536178))

(declare-fun m!1418731 () Bool)

(assert (=> b!1536183 m!1418731))

(assert (=> b!1536183 m!1418731))

(declare-fun m!1418733 () Bool)

(assert (=> b!1536183 m!1418733))

(declare-fun m!1418735 () Bool)

(assert (=> b!1536178 m!1418735))

(declare-fun m!1418737 () Bool)

(assert (=> b!1536178 m!1418737))

(declare-fun m!1418739 () Bool)

(assert (=> b!1536179 m!1418739))

(assert (=> b!1536180 m!1418737))

(assert (=> b!1536180 m!1418737))

(declare-fun m!1418741 () Bool)

(assert (=> b!1536180 m!1418741))

(declare-fun m!1418743 () Bool)

(assert (=> b!1536185 m!1418743))

(assert (=> b!1536181 m!1418737))

(assert (=> b!1536181 m!1418737))

(declare-fun m!1418745 () Bool)

(assert (=> b!1536181 m!1418745))

(declare-fun m!1418747 () Bool)

(assert (=> start!131172 m!1418747))

(declare-fun m!1418749 () Bool)

(assert (=> start!131172 m!1418749))

(declare-fun m!1418751 () Bool)

(assert (=> b!1536182 m!1418751))

(check-sat (not start!131172) (not b!1536185) (not b!1536180) (not b!1536181) (not b!1536183) (not b!1536179))
(check-sat)
