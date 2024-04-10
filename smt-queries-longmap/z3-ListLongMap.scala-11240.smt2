; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131074 () Bool)

(assert start!131074)

(declare-fun b!1537884 () Bool)

(declare-fun res!1054972 () Bool)

(declare-fun e!855787 () Bool)

(assert (=> b!1537884 (=> (not res!1054972) (not e!855787))))

(declare-datatypes ((array!102172 0))(
  ( (array!102173 (arr!49302 (Array (_ BitVec 32) (_ BitVec 64))) (size!49852 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102172)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537884 (= res!1054972 (validKeyInArray!0 (select (arr!49302 a!2792) j!64)))))

(declare-fun b!1537885 () Bool)

(declare-fun res!1054971 () Bool)

(assert (=> b!1537885 (=> (not res!1054971) (not e!855787))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102172 (_ BitVec 32)) Bool)

(assert (=> b!1537885 (= res!1054971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537886 () Bool)

(declare-fun res!1054973 () Bool)

(assert (=> b!1537886 (=> (not res!1054973) (not e!855787))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537886 (= res!1054973 (validKeyInArray!0 (select (arr!49302 a!2792) i!951)))))

(declare-fun b!1537887 () Bool)

(declare-fun res!1054975 () Bool)

(assert (=> b!1537887 (=> (not res!1054975) (not e!855787))))

(assert (=> b!1537887 (= res!1054975 (and (= (size!49852 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49852 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49852 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537883 () Bool)

(declare-fun res!1054974 () Bool)

(assert (=> b!1537883 (=> (not res!1054974) (not e!855787))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1537883 (= res!1054974 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49852 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49852 a!2792)) (= (select (arr!49302 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1054970 () Bool)

(assert (=> start!131074 (=> (not res!1054970) (not e!855787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131074 (= res!1054970 (validMask!0 mask!2480))))

(assert (=> start!131074 e!855787))

(assert (=> start!131074 true))

(declare-fun array_inv!38330 (array!102172) Bool)

(assert (=> start!131074 (array_inv!38330 a!2792)))

(declare-fun b!1537888 () Bool)

(declare-fun res!1054969 () Bool)

(assert (=> b!1537888 (=> (not res!1054969) (not e!855787))))

(declare-datatypes ((List!35776 0))(
  ( (Nil!35773) (Cons!35772 (h!37217 (_ BitVec 64)) (t!50470 List!35776)) )
))
(declare-fun arrayNoDuplicates!0 (array!102172 (_ BitVec 32) List!35776) Bool)

(assert (=> b!1537888 (= res!1054969 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35773))))

(declare-fun b!1537889 () Bool)

(assert (=> b!1537889 (= e!855787 false)))

(declare-datatypes ((SeekEntryResult!13428 0))(
  ( (MissingZero!13428 (index!56107 (_ BitVec 32))) (Found!13428 (index!56108 (_ BitVec 32))) (Intermediate!13428 (undefined!14240 Bool) (index!56109 (_ BitVec 32)) (x!137846 (_ BitVec 32))) (Undefined!13428) (MissingVacant!13428 (index!56110 (_ BitVec 32))) )
))
(declare-fun lt!664798 () SeekEntryResult!13428)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102172 (_ BitVec 32)) SeekEntryResult!13428)

(assert (=> b!1537889 (= lt!664798 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49302 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!131074 res!1054970) b!1537887))

(assert (= (and b!1537887 res!1054975) b!1537886))

(assert (= (and b!1537886 res!1054973) b!1537884))

(assert (= (and b!1537884 res!1054972) b!1537885))

(assert (= (and b!1537885 res!1054971) b!1537888))

(assert (= (and b!1537888 res!1054969) b!1537883))

(assert (= (and b!1537883 res!1054974) b!1537889))

(declare-fun m!1420391 () Bool)

(assert (=> b!1537884 m!1420391))

(assert (=> b!1537884 m!1420391))

(declare-fun m!1420393 () Bool)

(assert (=> b!1537884 m!1420393))

(declare-fun m!1420395 () Bool)

(assert (=> b!1537885 m!1420395))

(declare-fun m!1420397 () Bool)

(assert (=> b!1537883 m!1420397))

(declare-fun m!1420399 () Bool)

(assert (=> start!131074 m!1420399))

(declare-fun m!1420401 () Bool)

(assert (=> start!131074 m!1420401))

(declare-fun m!1420403 () Bool)

(assert (=> b!1537888 m!1420403))

(assert (=> b!1537889 m!1420391))

(assert (=> b!1537889 m!1420391))

(declare-fun m!1420405 () Bool)

(assert (=> b!1537889 m!1420405))

(declare-fun m!1420407 () Bool)

(assert (=> b!1537886 m!1420407))

(assert (=> b!1537886 m!1420407))

(declare-fun m!1420409 () Bool)

(assert (=> b!1537886 m!1420409))

(check-sat (not b!1537889) (not b!1537886) (not b!1537884) (not b!1537885) (not start!131074) (not b!1537888))
