; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130932 () Bool)

(assert start!130932)

(declare-fun b!1535813 () Bool)

(declare-fun res!1052905 () Bool)

(declare-fun e!854911 () Bool)

(assert (=> b!1535813 (=> (not res!1052905) (not e!854911))))

(declare-datatypes ((array!102030 0))(
  ( (array!102031 (arr!49231 (Array (_ BitVec 32) (_ BitVec 64))) (size!49781 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102030)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535813 (= res!1052905 (validKeyInArray!0 (select (arr!49231 a!2792) j!64)))))

(declare-fun b!1535814 () Bool)

(declare-fun res!1052900 () Bool)

(assert (=> b!1535814 (=> (not res!1052900) (not e!854911))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535814 (= res!1052900 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49781 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49781 a!2792)) (= (select (arr!49231 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535815 () Bool)

(declare-fun res!1052901 () Bool)

(assert (=> b!1535815 (=> (not res!1052901) (not e!854911))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535815 (= res!1052901 (and (= (size!49781 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49781 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49781 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535816 () Bool)

(declare-fun res!1052907 () Bool)

(assert (=> b!1535816 (=> (not res!1052907) (not e!854911))))

(assert (=> b!1535816 (= res!1052907 (validKeyInArray!0 (select (arr!49231 a!2792) i!951)))))

(declare-fun b!1535817 () Bool)

(declare-fun e!854910 () Bool)

(assert (=> b!1535817 (= e!854911 e!854910)))

(declare-fun res!1052906 () Bool)

(assert (=> b!1535817 (=> (not res!1052906) (not e!854910))))

(declare-fun lt!664135 () (_ BitVec 32))

(assert (=> b!1535817 (= res!1052906 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664135 #b00000000000000000000000000000000) (bvslt lt!664135 (size!49781 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535817 (= lt!664135 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535819 () Bool)

(assert (=> b!1535819 (= e!854910 false)))

(declare-datatypes ((SeekEntryResult!13363 0))(
  ( (MissingZero!13363 (index!55847 (_ BitVec 32))) (Found!13363 (index!55848 (_ BitVec 32))) (Intermediate!13363 (undefined!14175 Bool) (index!55849 (_ BitVec 32)) (x!137589 (_ BitVec 32))) (Undefined!13363) (MissingVacant!13363 (index!55850 (_ BitVec 32))) )
))
(declare-fun lt!664134 () SeekEntryResult!13363)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102030 (_ BitVec 32)) SeekEntryResult!13363)

(assert (=> b!1535819 (= lt!664134 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664135 vacantIndex!5 (select (arr!49231 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535820 () Bool)

(declare-fun res!1052904 () Bool)

(assert (=> b!1535820 (=> (not res!1052904) (not e!854911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102030 (_ BitVec 32)) Bool)

(assert (=> b!1535820 (= res!1052904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1052902 () Bool)

(assert (=> start!130932 (=> (not res!1052902) (not e!854911))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130932 (= res!1052902 (validMask!0 mask!2480))))

(assert (=> start!130932 e!854911))

(assert (=> start!130932 true))

(declare-fun array_inv!38259 (array!102030) Bool)

(assert (=> start!130932 (array_inv!38259 a!2792)))

(declare-fun b!1535818 () Bool)

(declare-fun res!1052908 () Bool)

(assert (=> b!1535818 (=> (not res!1052908) (not e!854911))))

(assert (=> b!1535818 (= res!1052908 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49231 a!2792) j!64) a!2792 mask!2480) (Found!13363 j!64)))))

(declare-fun b!1535821 () Bool)

(declare-fun res!1052899 () Bool)

(assert (=> b!1535821 (=> (not res!1052899) (not e!854911))))

(assert (=> b!1535821 (= res!1052899 (not (= (select (arr!49231 a!2792) index!463) (select (arr!49231 a!2792) j!64))))))

(declare-fun b!1535822 () Bool)

(declare-fun res!1052903 () Bool)

(assert (=> b!1535822 (=> (not res!1052903) (not e!854911))))

(declare-datatypes ((List!35705 0))(
  ( (Nil!35702) (Cons!35701 (h!37146 (_ BitVec 64)) (t!50399 List!35705)) )
))
(declare-fun arrayNoDuplicates!0 (array!102030 (_ BitVec 32) List!35705) Bool)

(assert (=> b!1535822 (= res!1052903 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35702))))

(assert (= (and start!130932 res!1052902) b!1535815))

(assert (= (and b!1535815 res!1052901) b!1535816))

(assert (= (and b!1535816 res!1052907) b!1535813))

(assert (= (and b!1535813 res!1052905) b!1535820))

(assert (= (and b!1535820 res!1052904) b!1535822))

(assert (= (and b!1535822 res!1052903) b!1535814))

(assert (= (and b!1535814 res!1052900) b!1535818))

(assert (= (and b!1535818 res!1052908) b!1535821))

(assert (= (and b!1535821 res!1052899) b!1535817))

(assert (= (and b!1535817 res!1052906) b!1535819))

(declare-fun m!1418281 () Bool)

(assert (=> start!130932 m!1418281))

(declare-fun m!1418283 () Bool)

(assert (=> start!130932 m!1418283))

(declare-fun m!1418285 () Bool)

(assert (=> b!1535822 m!1418285))

(declare-fun m!1418287 () Bool)

(assert (=> b!1535814 m!1418287))

(declare-fun m!1418289 () Bool)

(assert (=> b!1535816 m!1418289))

(assert (=> b!1535816 m!1418289))

(declare-fun m!1418291 () Bool)

(assert (=> b!1535816 m!1418291))

(declare-fun m!1418293 () Bool)

(assert (=> b!1535820 m!1418293))

(declare-fun m!1418295 () Bool)

(assert (=> b!1535813 m!1418295))

(assert (=> b!1535813 m!1418295))

(declare-fun m!1418297 () Bool)

(assert (=> b!1535813 m!1418297))

(assert (=> b!1535818 m!1418295))

(assert (=> b!1535818 m!1418295))

(declare-fun m!1418299 () Bool)

(assert (=> b!1535818 m!1418299))

(declare-fun m!1418301 () Bool)

(assert (=> b!1535821 m!1418301))

(assert (=> b!1535821 m!1418295))

(assert (=> b!1535819 m!1418295))

(assert (=> b!1535819 m!1418295))

(declare-fun m!1418303 () Bool)

(assert (=> b!1535819 m!1418303))

(declare-fun m!1418305 () Bool)

(assert (=> b!1535817 m!1418305))

(push 1)

(assert (not b!1535818))

(assert (not b!1535816))

(assert (not b!1535817))

(assert (not b!1535820))

(assert (not start!130932))

(assert (not b!1535822))

(assert (not b!1535819))

(assert (not b!1535813))

(check-sat)

