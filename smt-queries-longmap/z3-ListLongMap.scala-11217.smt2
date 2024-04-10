; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130936 () Bool)

(assert start!130936)

(declare-fun b!1535873 () Bool)

(declare-fun res!1052965 () Bool)

(declare-fun e!854929 () Bool)

(assert (=> b!1535873 (=> (not res!1052965) (not e!854929))))

(declare-datatypes ((array!102034 0))(
  ( (array!102035 (arr!49233 (Array (_ BitVec 32) (_ BitVec 64))) (size!49783 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102034)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535873 (= res!1052965 (validKeyInArray!0 (select (arr!49233 a!2792) i!951)))))

(declare-fun b!1535874 () Bool)

(declare-fun res!1052967 () Bool)

(assert (=> b!1535874 (=> (not res!1052967) (not e!854929))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1535874 (= res!1052967 (validKeyInArray!0 (select (arr!49233 a!2792) j!64)))))

(declare-fun b!1535875 () Bool)

(declare-fun res!1052960 () Bool)

(assert (=> b!1535875 (=> (not res!1052960) (not e!854929))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102034 (_ BitVec 32)) Bool)

(assert (=> b!1535875 (= res!1052960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1052968 () Bool)

(assert (=> start!130936 (=> (not res!1052968) (not e!854929))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130936 (= res!1052968 (validMask!0 mask!2480))))

(assert (=> start!130936 e!854929))

(assert (=> start!130936 true))

(declare-fun array_inv!38261 (array!102034) Bool)

(assert (=> start!130936 (array_inv!38261 a!2792)))

(declare-fun b!1535876 () Bool)

(declare-fun res!1052966 () Bool)

(assert (=> b!1535876 (=> (not res!1052966) (not e!854929))))

(assert (=> b!1535876 (= res!1052966 (and (= (size!49783 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49783 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49783 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535877 () Bool)

(declare-fun res!1052964 () Bool)

(assert (=> b!1535877 (=> (not res!1052964) (not e!854929))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535877 (= res!1052964 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49783 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49783 a!2792)) (= (select (arr!49233 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535878 () Bool)

(declare-fun e!854927 () Bool)

(assert (=> b!1535878 (= e!854929 e!854927)))

(declare-fun res!1052962 () Bool)

(assert (=> b!1535878 (=> (not res!1052962) (not e!854927))))

(declare-fun lt!664146 () (_ BitVec 32))

(assert (=> b!1535878 (= res!1052962 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664146 #b00000000000000000000000000000000) (bvslt lt!664146 (size!49783 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535878 (= lt!664146 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535879 () Bool)

(declare-fun res!1052961 () Bool)

(assert (=> b!1535879 (=> (not res!1052961) (not e!854929))))

(declare-datatypes ((SeekEntryResult!13365 0))(
  ( (MissingZero!13365 (index!55855 (_ BitVec 32))) (Found!13365 (index!55856 (_ BitVec 32))) (Intermediate!13365 (undefined!14177 Bool) (index!55857 (_ BitVec 32)) (x!137599 (_ BitVec 32))) (Undefined!13365) (MissingVacant!13365 (index!55858 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102034 (_ BitVec 32)) SeekEntryResult!13365)

(assert (=> b!1535879 (= res!1052961 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49233 a!2792) j!64) a!2792 mask!2480) (Found!13365 j!64)))))

(declare-fun b!1535880 () Bool)

(assert (=> b!1535880 (= e!854927 false)))

(declare-fun lt!664147 () SeekEntryResult!13365)

(assert (=> b!1535880 (= lt!664147 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664146 vacantIndex!5 (select (arr!49233 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535881 () Bool)

(declare-fun res!1052959 () Bool)

(assert (=> b!1535881 (=> (not res!1052959) (not e!854929))))

(assert (=> b!1535881 (= res!1052959 (not (= (select (arr!49233 a!2792) index!463) (select (arr!49233 a!2792) j!64))))))

(declare-fun b!1535882 () Bool)

(declare-fun res!1052963 () Bool)

(assert (=> b!1535882 (=> (not res!1052963) (not e!854929))))

(declare-datatypes ((List!35707 0))(
  ( (Nil!35704) (Cons!35703 (h!37148 (_ BitVec 64)) (t!50401 List!35707)) )
))
(declare-fun arrayNoDuplicates!0 (array!102034 (_ BitVec 32) List!35707) Bool)

(assert (=> b!1535882 (= res!1052963 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35704))))

(assert (= (and start!130936 res!1052968) b!1535876))

(assert (= (and b!1535876 res!1052966) b!1535873))

(assert (= (and b!1535873 res!1052965) b!1535874))

(assert (= (and b!1535874 res!1052967) b!1535875))

(assert (= (and b!1535875 res!1052960) b!1535882))

(assert (= (and b!1535882 res!1052963) b!1535877))

(assert (= (and b!1535877 res!1052964) b!1535879))

(assert (= (and b!1535879 res!1052961) b!1535881))

(assert (= (and b!1535881 res!1052959) b!1535878))

(assert (= (and b!1535878 res!1052962) b!1535880))

(declare-fun m!1418333 () Bool)

(assert (=> b!1535873 m!1418333))

(assert (=> b!1535873 m!1418333))

(declare-fun m!1418335 () Bool)

(assert (=> b!1535873 m!1418335))

(declare-fun m!1418337 () Bool)

(assert (=> start!130936 m!1418337))

(declare-fun m!1418339 () Bool)

(assert (=> start!130936 m!1418339))

(declare-fun m!1418341 () Bool)

(assert (=> b!1535880 m!1418341))

(assert (=> b!1535880 m!1418341))

(declare-fun m!1418343 () Bool)

(assert (=> b!1535880 m!1418343))

(declare-fun m!1418345 () Bool)

(assert (=> b!1535875 m!1418345))

(declare-fun m!1418347 () Bool)

(assert (=> b!1535882 m!1418347))

(declare-fun m!1418349 () Bool)

(assert (=> b!1535877 m!1418349))

(declare-fun m!1418351 () Bool)

(assert (=> b!1535881 m!1418351))

(assert (=> b!1535881 m!1418341))

(assert (=> b!1535879 m!1418341))

(assert (=> b!1535879 m!1418341))

(declare-fun m!1418353 () Bool)

(assert (=> b!1535879 m!1418353))

(declare-fun m!1418355 () Bool)

(assert (=> b!1535878 m!1418355))

(assert (=> b!1535874 m!1418341))

(assert (=> b!1535874 m!1418341))

(declare-fun m!1418357 () Bool)

(assert (=> b!1535874 m!1418357))

(check-sat (not b!1535874) (not b!1535879) (not b!1535878) (not b!1535880) (not b!1535873) (not start!130936) (not b!1535882) (not b!1535875))
(check-sat)
