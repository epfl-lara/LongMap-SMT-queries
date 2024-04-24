; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131790 () Bool)

(assert start!131790)

(declare-fun b!1542844 () Bool)

(declare-fun res!1057965 () Bool)

(declare-fun e!858234 () Bool)

(assert (=> b!1542844 (=> (not res!1057965) (not e!858234))))

(declare-datatypes ((array!102446 0))(
  ( (array!102447 (arr!49426 (Array (_ BitVec 32) (_ BitVec 64))) (size!49977 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102446)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102446 (_ BitVec 32)) Bool)

(assert (=> b!1542844 (= res!1057965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1542845 () Bool)

(declare-fun res!1057959 () Bool)

(assert (=> b!1542845 (=> (not res!1057959) (not e!858234))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1542845 (= res!1057959 (and (= (size!49977 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49977 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49977 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1542846 () Bool)

(declare-fun e!858235 () Bool)

(declare-fun e!858233 () Bool)

(assert (=> b!1542846 (= e!858235 e!858233)))

(declare-fun res!1057967 () Bool)

(assert (=> b!1542846 (=> (not res!1057967) (not e!858233))))

(declare-datatypes ((SeekEntryResult!13447 0))(
  ( (MissingZero!13447 (index!56183 (_ BitVec 32))) (Found!13447 (index!56184 (_ BitVec 32))) (Intermediate!13447 (undefined!14259 Bool) (index!56185 (_ BitVec 32)) (x!138127 (_ BitVec 32))) (Undefined!13447) (MissingVacant!13447 (index!56186 (_ BitVec 32))) )
))
(declare-fun lt!666244 () SeekEntryResult!13447)

(declare-fun lt!666246 () SeekEntryResult!13447)

(assert (=> b!1542846 (= res!1057967 (= lt!666244 lt!666246))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!666243 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102446 (_ BitVec 32)) SeekEntryResult!13447)

(assert (=> b!1542846 (= lt!666244 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666243 vacantIndex!5 (select (arr!49426 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1542847 () Bool)

(declare-fun res!1057963 () Bool)

(assert (=> b!1542847 (=> (not res!1057963) (not e!858234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1542847 (= res!1057963 (validKeyInArray!0 (select (arr!49426 a!2792) i!951)))))

(declare-fun b!1542848 () Bool)

(declare-fun res!1057968 () Bool)

(assert (=> b!1542848 (=> (not res!1057968) (not e!858234))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1542848 (= res!1057968 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49977 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49977 a!2792)) (= (select (arr!49426 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1542850 () Bool)

(declare-fun res!1057961 () Bool)

(assert (=> b!1542850 (=> (not res!1057961) (not e!858234))))

(assert (=> b!1542850 (= res!1057961 (validKeyInArray!0 (select (arr!49426 a!2792) j!64)))))

(declare-fun b!1542851 () Bool)

(assert (=> b!1542851 (= e!858233 (not true))))

(assert (=> b!1542851 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!666243 vacantIndex!5 (select (store (arr!49426 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102447 (store (arr!49426 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49977 a!2792)) mask!2480) lt!666244)))

(declare-datatypes ((Unit!51367 0))(
  ( (Unit!51368) )
))
(declare-fun lt!666245 () Unit!51367)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51367)

(assert (=> b!1542851 (= lt!666245 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!666243 vacantIndex!5 mask!2480))))

(declare-fun b!1542852 () Bool)

(declare-fun res!1057962 () Bool)

(assert (=> b!1542852 (=> (not res!1057962) (not e!858234))))

(declare-datatypes ((List!35887 0))(
  ( (Nil!35884) (Cons!35883 (h!37346 (_ BitVec 64)) (t!50573 List!35887)) )
))
(declare-fun arrayNoDuplicates!0 (array!102446 (_ BitVec 32) List!35887) Bool)

(assert (=> b!1542852 (= res!1057962 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35884))))

(declare-fun b!1542849 () Bool)

(declare-fun res!1057966 () Bool)

(declare-fun e!858231 () Bool)

(assert (=> b!1542849 (=> (not res!1057966) (not e!858231))))

(assert (=> b!1542849 (= res!1057966 (not (= (select (arr!49426 a!2792) index!463) (select (arr!49426 a!2792) j!64))))))

(declare-fun res!1057958 () Bool)

(assert (=> start!131790 (=> (not res!1057958) (not e!858234))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131790 (= res!1057958 (validMask!0 mask!2480))))

(assert (=> start!131790 e!858234))

(assert (=> start!131790 true))

(declare-fun array_inv!38707 (array!102446) Bool)

(assert (=> start!131790 (array_inv!38707 a!2792)))

(declare-fun b!1542853 () Bool)

(assert (=> b!1542853 (= e!858231 e!858235)))

(declare-fun res!1057960 () Bool)

(assert (=> b!1542853 (=> (not res!1057960) (not e!858235))))

(assert (=> b!1542853 (= res!1057960 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!666243 #b00000000000000000000000000000000) (bvslt lt!666243 (size!49977 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1542853 (= lt!666243 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1542854 () Bool)

(assert (=> b!1542854 (= e!858234 e!858231)))

(declare-fun res!1057964 () Bool)

(assert (=> b!1542854 (=> (not res!1057964) (not e!858231))))

(assert (=> b!1542854 (= res!1057964 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49426 a!2792) j!64) a!2792 mask!2480) lt!666246))))

(assert (=> b!1542854 (= lt!666246 (Found!13447 j!64))))

(assert (= (and start!131790 res!1057958) b!1542845))

(assert (= (and b!1542845 res!1057959) b!1542847))

(assert (= (and b!1542847 res!1057963) b!1542850))

(assert (= (and b!1542850 res!1057961) b!1542844))

(assert (= (and b!1542844 res!1057965) b!1542852))

(assert (= (and b!1542852 res!1057962) b!1542848))

(assert (= (and b!1542848 res!1057968) b!1542854))

(assert (= (and b!1542854 res!1057964) b!1542849))

(assert (= (and b!1542849 res!1057966) b!1542853))

(assert (= (and b!1542853 res!1057960) b!1542846))

(assert (= (and b!1542846 res!1057967) b!1542851))

(declare-fun m!1424771 () Bool)

(assert (=> b!1542850 m!1424771))

(assert (=> b!1542850 m!1424771))

(declare-fun m!1424773 () Bool)

(assert (=> b!1542850 m!1424773))

(assert (=> b!1542854 m!1424771))

(assert (=> b!1542854 m!1424771))

(declare-fun m!1424775 () Bool)

(assert (=> b!1542854 m!1424775))

(declare-fun m!1424777 () Bool)

(assert (=> b!1542851 m!1424777))

(declare-fun m!1424779 () Bool)

(assert (=> b!1542851 m!1424779))

(assert (=> b!1542851 m!1424779))

(declare-fun m!1424781 () Bool)

(assert (=> b!1542851 m!1424781))

(declare-fun m!1424783 () Bool)

(assert (=> b!1542851 m!1424783))

(declare-fun m!1424785 () Bool)

(assert (=> b!1542852 m!1424785))

(assert (=> b!1542846 m!1424771))

(assert (=> b!1542846 m!1424771))

(declare-fun m!1424787 () Bool)

(assert (=> b!1542846 m!1424787))

(declare-fun m!1424789 () Bool)

(assert (=> b!1542848 m!1424789))

(declare-fun m!1424791 () Bool)

(assert (=> start!131790 m!1424791))

(declare-fun m!1424793 () Bool)

(assert (=> start!131790 m!1424793))

(declare-fun m!1424795 () Bool)

(assert (=> b!1542847 m!1424795))

(assert (=> b!1542847 m!1424795))

(declare-fun m!1424797 () Bool)

(assert (=> b!1542847 m!1424797))

(declare-fun m!1424799 () Bool)

(assert (=> b!1542853 m!1424799))

(declare-fun m!1424801 () Bool)

(assert (=> b!1542844 m!1424801))

(declare-fun m!1424803 () Bool)

(assert (=> b!1542849 m!1424803))

(assert (=> b!1542849 m!1424771))

(check-sat (not b!1542844) (not b!1542850) (not start!131790) (not b!1542853) (not b!1542851) (not b!1542854) (not b!1542852) (not b!1542846) (not b!1542847))
(check-sat)
