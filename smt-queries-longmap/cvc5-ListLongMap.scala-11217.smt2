; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130934 () Bool)

(assert start!130934)

(declare-fun b!1535843 () Bool)

(declare-fun e!854920 () Bool)

(assert (=> b!1535843 (= e!854920 false)))

(declare-datatypes ((array!102032 0))(
  ( (array!102033 (arr!49232 (Array (_ BitVec 32) (_ BitVec 64))) (size!49782 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102032)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun lt!664141 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13364 0))(
  ( (MissingZero!13364 (index!55851 (_ BitVec 32))) (Found!13364 (index!55852 (_ BitVec 32))) (Intermediate!13364 (undefined!14176 Bool) (index!55853 (_ BitVec 32)) (x!137598 (_ BitVec 32))) (Undefined!13364) (MissingVacant!13364 (index!55854 (_ BitVec 32))) )
))
(declare-fun lt!664140 () SeekEntryResult!13364)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102032 (_ BitVec 32)) SeekEntryResult!13364)

(assert (=> b!1535843 (= lt!664140 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664141 vacantIndex!5 (select (arr!49232 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535844 () Bool)

(declare-fun e!854919 () Bool)

(assert (=> b!1535844 (= e!854919 e!854920)))

(declare-fun res!1052929 () Bool)

(assert (=> b!1535844 (=> (not res!1052929) (not e!854920))))

(assert (=> b!1535844 (= res!1052929 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664141 #b00000000000000000000000000000000) (bvslt lt!664141 (size!49782 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535844 (= lt!664141 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535845 () Bool)

(declare-fun res!1052937 () Bool)

(assert (=> b!1535845 (=> (not res!1052937) (not e!854919))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535845 (= res!1052937 (and (= (size!49782 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49782 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49782 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535846 () Bool)

(declare-fun res!1052935 () Bool)

(assert (=> b!1535846 (=> (not res!1052935) (not e!854919))))

(declare-datatypes ((List!35706 0))(
  ( (Nil!35703) (Cons!35702 (h!37147 (_ BitVec 64)) (t!50400 List!35706)) )
))
(declare-fun arrayNoDuplicates!0 (array!102032 (_ BitVec 32) List!35706) Bool)

(assert (=> b!1535846 (= res!1052935 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35703))))

(declare-fun b!1535847 () Bool)

(declare-fun res!1052930 () Bool)

(assert (=> b!1535847 (=> (not res!1052930) (not e!854919))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535847 (= res!1052930 (validKeyInArray!0 (select (arr!49232 a!2792) j!64)))))

(declare-fun b!1535848 () Bool)

(declare-fun res!1052938 () Bool)

(assert (=> b!1535848 (=> (not res!1052938) (not e!854919))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102032 (_ BitVec 32)) Bool)

(assert (=> b!1535848 (= res!1052938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535849 () Bool)

(declare-fun res!1052932 () Bool)

(assert (=> b!1535849 (=> (not res!1052932) (not e!854919))))

(assert (=> b!1535849 (= res!1052932 (not (= (select (arr!49232 a!2792) index!463) (select (arr!49232 a!2792) j!64))))))

(declare-fun res!1052936 () Bool)

(assert (=> start!130934 (=> (not res!1052936) (not e!854919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130934 (= res!1052936 (validMask!0 mask!2480))))

(assert (=> start!130934 e!854919))

(assert (=> start!130934 true))

(declare-fun array_inv!38260 (array!102032) Bool)

(assert (=> start!130934 (array_inv!38260 a!2792)))

(declare-fun b!1535850 () Bool)

(declare-fun res!1052933 () Bool)

(assert (=> b!1535850 (=> (not res!1052933) (not e!854919))))

(assert (=> b!1535850 (= res!1052933 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49782 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49782 a!2792)) (= (select (arr!49232 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535851 () Bool)

(declare-fun res!1052931 () Bool)

(assert (=> b!1535851 (=> (not res!1052931) (not e!854919))))

(assert (=> b!1535851 (= res!1052931 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49232 a!2792) j!64) a!2792 mask!2480) (Found!13364 j!64)))))

(declare-fun b!1535852 () Bool)

(declare-fun res!1052934 () Bool)

(assert (=> b!1535852 (=> (not res!1052934) (not e!854919))))

(assert (=> b!1535852 (= res!1052934 (validKeyInArray!0 (select (arr!49232 a!2792) i!951)))))

(assert (= (and start!130934 res!1052936) b!1535845))

(assert (= (and b!1535845 res!1052937) b!1535852))

(assert (= (and b!1535852 res!1052934) b!1535847))

(assert (= (and b!1535847 res!1052930) b!1535848))

(assert (= (and b!1535848 res!1052938) b!1535846))

(assert (= (and b!1535846 res!1052935) b!1535850))

(assert (= (and b!1535850 res!1052933) b!1535851))

(assert (= (and b!1535851 res!1052931) b!1535849))

(assert (= (and b!1535849 res!1052932) b!1535844))

(assert (= (and b!1535844 res!1052929) b!1535843))

(declare-fun m!1418307 () Bool)

(assert (=> b!1535850 m!1418307))

(declare-fun m!1418309 () Bool)

(assert (=> b!1535846 m!1418309))

(declare-fun m!1418311 () Bool)

(assert (=> b!1535851 m!1418311))

(assert (=> b!1535851 m!1418311))

(declare-fun m!1418313 () Bool)

(assert (=> b!1535851 m!1418313))

(declare-fun m!1418315 () Bool)

(assert (=> start!130934 m!1418315))

(declare-fun m!1418317 () Bool)

(assert (=> start!130934 m!1418317))

(declare-fun m!1418319 () Bool)

(assert (=> b!1535844 m!1418319))

(assert (=> b!1535847 m!1418311))

(assert (=> b!1535847 m!1418311))

(declare-fun m!1418321 () Bool)

(assert (=> b!1535847 m!1418321))

(assert (=> b!1535843 m!1418311))

(assert (=> b!1535843 m!1418311))

(declare-fun m!1418323 () Bool)

(assert (=> b!1535843 m!1418323))

(declare-fun m!1418325 () Bool)

(assert (=> b!1535852 m!1418325))

(assert (=> b!1535852 m!1418325))

(declare-fun m!1418327 () Bool)

(assert (=> b!1535852 m!1418327))

(declare-fun m!1418329 () Bool)

(assert (=> b!1535848 m!1418329))

(declare-fun m!1418331 () Bool)

(assert (=> b!1535849 m!1418331))

(assert (=> b!1535849 m!1418311))

(push 1)

