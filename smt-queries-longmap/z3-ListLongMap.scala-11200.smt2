; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130782 () Bool)

(assert start!130782)

(declare-fun b!1534041 () Bool)

(declare-fun res!1051312 () Bool)

(declare-fun e!854277 () Bool)

(assert (=> b!1534041 (=> (not res!1051312) (not e!854277))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101878 0))(
  ( (array!101879 (arr!49156 (Array (_ BitVec 32) (_ BitVec 64))) (size!49708 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101878)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534041 (= res!1051312 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49708 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49708 a!2792)) (= (select (arr!49156 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534042 () Bool)

(declare-fun res!1051317 () Bool)

(assert (=> b!1534042 (=> (not res!1051317) (not e!854277))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13313 0))(
  ( (MissingZero!13313 (index!55647 (_ BitVec 32))) (Found!13313 (index!55648 (_ BitVec 32))) (Intermediate!13313 (undefined!14125 Bool) (index!55649 (_ BitVec 32)) (x!137406 (_ BitVec 32))) (Undefined!13313) (MissingVacant!13313 (index!55650 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101878 (_ BitVec 32)) SeekEntryResult!13313)

(assert (=> b!1534042 (= res!1051317 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49156 a!2792) j!64) a!2792 mask!2480) (Found!13313 j!64)))))

(declare-fun b!1534043 () Bool)

(declare-fun res!1051316 () Bool)

(assert (=> b!1534043 (=> (not res!1051316) (not e!854277))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534043 (= res!1051316 (and (= (size!49708 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49708 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49708 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534044 () Bool)

(declare-fun res!1051318 () Bool)

(assert (=> b!1534044 (=> (not res!1051318) (not e!854277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101878 (_ BitVec 32)) Bool)

(assert (=> b!1534044 (= res!1051318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534045 () Bool)

(declare-fun res!1051314 () Bool)

(assert (=> b!1534045 (=> (not res!1051314) (not e!854277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534045 (= res!1051314 (validKeyInArray!0 (select (arr!49156 a!2792) j!64)))))

(declare-fun b!1534046 () Bool)

(declare-fun res!1051311 () Bool)

(assert (=> b!1534046 (=> (not res!1051311) (not e!854277))))

(declare-datatypes ((List!35708 0))(
  ( (Nil!35705) (Cons!35704 (h!37150 (_ BitVec 64)) (t!50394 List!35708)) )
))
(declare-fun arrayNoDuplicates!0 (array!101878 (_ BitVec 32) List!35708) Bool)

(assert (=> b!1534046 (= res!1051311 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35705))))

(declare-fun res!1051315 () Bool)

(assert (=> start!130782 (=> (not res!1051315) (not e!854277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130782 (= res!1051315 (validMask!0 mask!2480))))

(assert (=> start!130782 e!854277))

(assert (=> start!130782 true))

(declare-fun array_inv!38389 (array!101878) Bool)

(assert (=> start!130782 (array_inv!38389 a!2792)))

(declare-fun b!1534047 () Bool)

(assert (=> b!1534047 (= e!854277 (and (not (= (select (arr!49156 a!2792) index!463) (select (arr!49156 a!2792) j!64))) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1534048 () Bool)

(declare-fun res!1051313 () Bool)

(assert (=> b!1534048 (=> (not res!1051313) (not e!854277))))

(assert (=> b!1534048 (= res!1051313 (validKeyInArray!0 (select (arr!49156 a!2792) i!951)))))

(assert (= (and start!130782 res!1051315) b!1534043))

(assert (= (and b!1534043 res!1051316) b!1534048))

(assert (= (and b!1534048 res!1051313) b!1534045))

(assert (= (and b!1534045 res!1051314) b!1534044))

(assert (= (and b!1534044 res!1051318) b!1534046))

(assert (= (and b!1534046 res!1051311) b!1534041))

(assert (= (and b!1534041 res!1051312) b!1534042))

(assert (= (and b!1534042 res!1051317) b!1534047))

(declare-fun m!1416119 () Bool)

(assert (=> b!1534046 m!1416119))

(declare-fun m!1416121 () Bool)

(assert (=> b!1534041 m!1416121))

(declare-fun m!1416123 () Bool)

(assert (=> b!1534048 m!1416123))

(assert (=> b!1534048 m!1416123))

(declare-fun m!1416125 () Bool)

(assert (=> b!1534048 m!1416125))

(declare-fun m!1416127 () Bool)

(assert (=> b!1534045 m!1416127))

(assert (=> b!1534045 m!1416127))

(declare-fun m!1416129 () Bool)

(assert (=> b!1534045 m!1416129))

(declare-fun m!1416131 () Bool)

(assert (=> b!1534044 m!1416131))

(assert (=> b!1534042 m!1416127))

(assert (=> b!1534042 m!1416127))

(declare-fun m!1416133 () Bool)

(assert (=> b!1534042 m!1416133))

(declare-fun m!1416135 () Bool)

(assert (=> b!1534047 m!1416135))

(assert (=> b!1534047 m!1416127))

(declare-fun m!1416137 () Bool)

(assert (=> start!130782 m!1416137))

(declare-fun m!1416139 () Bool)

(assert (=> start!130782 m!1416139))

(check-sat (not b!1534045) (not b!1534042) (not b!1534048) (not b!1534044) (not start!130782) (not b!1534046))
(check-sat)
