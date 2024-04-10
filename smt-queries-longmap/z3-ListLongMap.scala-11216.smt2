; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130930 () Bool)

(assert start!130930)

(declare-fun b!1535783 () Bool)

(declare-fun res!1052872 () Bool)

(declare-fun e!854901 () Bool)

(assert (=> b!1535783 (=> (not res!1052872) (not e!854901))))

(declare-datatypes ((array!102028 0))(
  ( (array!102029 (arr!49230 (Array (_ BitVec 32) (_ BitVec 64))) (size!49780 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102028)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535783 (= res!1052872 (and (= (size!49780 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49780 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49780 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535784 () Bool)

(declare-fun res!1052875 () Bool)

(assert (=> b!1535784 (=> (not res!1052875) (not e!854901))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535784 (= res!1052875 (not (= (select (arr!49230 a!2792) index!463) (select (arr!49230 a!2792) j!64))))))

(declare-fun b!1535785 () Bool)

(declare-fun res!1052873 () Bool)

(assert (=> b!1535785 (=> (not res!1052873) (not e!854901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102028 (_ BitVec 32)) Bool)

(assert (=> b!1535785 (= res!1052873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535786 () Bool)

(declare-fun res!1052870 () Bool)

(assert (=> b!1535786 (=> (not res!1052870) (not e!854901))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13362 0))(
  ( (MissingZero!13362 (index!55843 (_ BitVec 32))) (Found!13362 (index!55844 (_ BitVec 32))) (Intermediate!13362 (undefined!14174 Bool) (index!55845 (_ BitVec 32)) (x!137588 (_ BitVec 32))) (Undefined!13362) (MissingVacant!13362 (index!55846 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102028 (_ BitVec 32)) SeekEntryResult!13362)

(assert (=> b!1535786 (= res!1052870 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49230 a!2792) j!64) a!2792 mask!2480) (Found!13362 j!64)))))

(declare-fun res!1052876 () Bool)

(assert (=> start!130930 (=> (not res!1052876) (not e!854901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130930 (= res!1052876 (validMask!0 mask!2480))))

(assert (=> start!130930 e!854901))

(assert (=> start!130930 true))

(declare-fun array_inv!38258 (array!102028) Bool)

(assert (=> start!130930 (array_inv!38258 a!2792)))

(declare-fun b!1535787 () Bool)

(declare-fun res!1052877 () Bool)

(assert (=> b!1535787 (=> (not res!1052877) (not e!854901))))

(assert (=> b!1535787 (= res!1052877 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49780 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49780 a!2792)) (= (select (arr!49230 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535788 () Bool)

(declare-fun res!1052874 () Bool)

(assert (=> b!1535788 (=> (not res!1052874) (not e!854901))))

(declare-datatypes ((List!35704 0))(
  ( (Nil!35701) (Cons!35700 (h!37145 (_ BitVec 64)) (t!50398 List!35704)) )
))
(declare-fun arrayNoDuplicates!0 (array!102028 (_ BitVec 32) List!35704) Bool)

(assert (=> b!1535788 (= res!1052874 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35701))))

(declare-fun b!1535789 () Bool)

(declare-fun res!1052869 () Bool)

(assert (=> b!1535789 (=> (not res!1052869) (not e!854901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535789 (= res!1052869 (validKeyInArray!0 (select (arr!49230 a!2792) i!951)))))

(declare-fun b!1535790 () Bool)

(declare-fun res!1052878 () Bool)

(assert (=> b!1535790 (=> (not res!1052878) (not e!854901))))

(assert (=> b!1535790 (= res!1052878 (validKeyInArray!0 (select (arr!49230 a!2792) j!64)))))

(declare-fun b!1535791 () Bool)

(declare-fun e!854902 () Bool)

(assert (=> b!1535791 (= e!854901 e!854902)))

(declare-fun res!1052871 () Bool)

(assert (=> b!1535791 (=> (not res!1052871) (not e!854902))))

(declare-fun lt!664129 () (_ BitVec 32))

(assert (=> b!1535791 (= res!1052871 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664129 #b00000000000000000000000000000000) (bvslt lt!664129 (size!49780 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535791 (= lt!664129 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535792 () Bool)

(assert (=> b!1535792 (= e!854902 false)))

(declare-fun lt!664128 () SeekEntryResult!13362)

(assert (=> b!1535792 (= lt!664128 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664129 vacantIndex!5 (select (arr!49230 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130930 res!1052876) b!1535783))

(assert (= (and b!1535783 res!1052872) b!1535789))

(assert (= (and b!1535789 res!1052869) b!1535790))

(assert (= (and b!1535790 res!1052878) b!1535785))

(assert (= (and b!1535785 res!1052873) b!1535788))

(assert (= (and b!1535788 res!1052874) b!1535787))

(assert (= (and b!1535787 res!1052877) b!1535786))

(assert (= (and b!1535786 res!1052870) b!1535784))

(assert (= (and b!1535784 res!1052875) b!1535791))

(assert (= (and b!1535791 res!1052871) b!1535792))

(declare-fun m!1418255 () Bool)

(assert (=> start!130930 m!1418255))

(declare-fun m!1418257 () Bool)

(assert (=> start!130930 m!1418257))

(declare-fun m!1418259 () Bool)

(assert (=> b!1535784 m!1418259))

(declare-fun m!1418261 () Bool)

(assert (=> b!1535784 m!1418261))

(declare-fun m!1418263 () Bool)

(assert (=> b!1535785 m!1418263))

(declare-fun m!1418265 () Bool)

(assert (=> b!1535789 m!1418265))

(assert (=> b!1535789 m!1418265))

(declare-fun m!1418267 () Bool)

(assert (=> b!1535789 m!1418267))

(declare-fun m!1418269 () Bool)

(assert (=> b!1535787 m!1418269))

(assert (=> b!1535786 m!1418261))

(assert (=> b!1535786 m!1418261))

(declare-fun m!1418271 () Bool)

(assert (=> b!1535786 m!1418271))

(assert (=> b!1535790 m!1418261))

(assert (=> b!1535790 m!1418261))

(declare-fun m!1418273 () Bool)

(assert (=> b!1535790 m!1418273))

(declare-fun m!1418275 () Bool)

(assert (=> b!1535788 m!1418275))

(assert (=> b!1535792 m!1418261))

(assert (=> b!1535792 m!1418261))

(declare-fun m!1418277 () Bool)

(assert (=> b!1535792 m!1418277))

(declare-fun m!1418279 () Bool)

(assert (=> b!1535791 m!1418279))

(check-sat (not b!1535792) (not b!1535790) (not b!1535788) (not b!1535789) (not b!1535786) (not start!130930) (not b!1535785) (not b!1535791))
(check-sat)
