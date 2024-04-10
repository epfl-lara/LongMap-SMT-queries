; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130926 () Bool)

(assert start!130926)

(declare-fun b!1535723 () Bool)

(declare-fun res!1052816 () Bool)

(declare-fun e!854882 () Bool)

(assert (=> b!1535723 (=> (not res!1052816) (not e!854882))))

(declare-datatypes ((array!102024 0))(
  ( (array!102025 (arr!49228 (Array (_ BitVec 32) (_ BitVec 64))) (size!49778 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102024)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102024 (_ BitVec 32)) Bool)

(assert (=> b!1535723 (= res!1052816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535724 () Bool)

(declare-fun e!854884 () Bool)

(assert (=> b!1535724 (= e!854884 false)))

(declare-fun lt!664116 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13360 0))(
  ( (MissingZero!13360 (index!55835 (_ BitVec 32))) (Found!13360 (index!55836 (_ BitVec 32))) (Intermediate!13360 (undefined!14172 Bool) (index!55837 (_ BitVec 32)) (x!137578 (_ BitVec 32))) (Undefined!13360) (MissingVacant!13360 (index!55838 (_ BitVec 32))) )
))
(declare-fun lt!664117 () SeekEntryResult!13360)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102024 (_ BitVec 32)) SeekEntryResult!13360)

(assert (=> b!1535724 (= lt!664117 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664116 vacantIndex!5 (select (arr!49228 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535725 () Bool)

(declare-fun res!1052811 () Bool)

(assert (=> b!1535725 (=> (not res!1052811) (not e!854882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535725 (= res!1052811 (validKeyInArray!0 (select (arr!49228 a!2792) j!64)))))

(declare-fun res!1052810 () Bool)

(assert (=> start!130926 (=> (not res!1052810) (not e!854882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130926 (= res!1052810 (validMask!0 mask!2480))))

(assert (=> start!130926 e!854882))

(assert (=> start!130926 true))

(declare-fun array_inv!38256 (array!102024) Bool)

(assert (=> start!130926 (array_inv!38256 a!2792)))

(declare-fun b!1535726 () Bool)

(declare-fun res!1052815 () Bool)

(assert (=> b!1535726 (=> (not res!1052815) (not e!854882))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535726 (= res!1052815 (and (= (size!49778 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49778 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49778 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535727 () Bool)

(declare-fun res!1052818 () Bool)

(assert (=> b!1535727 (=> (not res!1052818) (not e!854882))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535727 (= res!1052818 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49228 a!2792) j!64) a!2792 mask!2480) (Found!13360 j!64)))))

(declare-fun b!1535728 () Bool)

(declare-fun res!1052813 () Bool)

(assert (=> b!1535728 (=> (not res!1052813) (not e!854882))))

(declare-datatypes ((List!35702 0))(
  ( (Nil!35699) (Cons!35698 (h!37143 (_ BitVec 64)) (t!50396 List!35702)) )
))
(declare-fun arrayNoDuplicates!0 (array!102024 (_ BitVec 32) List!35702) Bool)

(assert (=> b!1535728 (= res!1052813 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35699))))

(declare-fun b!1535729 () Bool)

(declare-fun res!1052809 () Bool)

(assert (=> b!1535729 (=> (not res!1052809) (not e!854882))))

(assert (=> b!1535729 (= res!1052809 (validKeyInArray!0 (select (arr!49228 a!2792) i!951)))))

(declare-fun b!1535730 () Bool)

(declare-fun res!1052817 () Bool)

(assert (=> b!1535730 (=> (not res!1052817) (not e!854882))))

(assert (=> b!1535730 (= res!1052817 (not (= (select (arr!49228 a!2792) index!463) (select (arr!49228 a!2792) j!64))))))

(declare-fun b!1535731 () Bool)

(declare-fun res!1052812 () Bool)

(assert (=> b!1535731 (=> (not res!1052812) (not e!854882))))

(assert (=> b!1535731 (= res!1052812 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49778 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49778 a!2792)) (= (select (arr!49228 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535732 () Bool)

(assert (=> b!1535732 (= e!854882 e!854884)))

(declare-fun res!1052814 () Bool)

(assert (=> b!1535732 (=> (not res!1052814) (not e!854884))))

(assert (=> b!1535732 (= res!1052814 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664116 #b00000000000000000000000000000000) (bvslt lt!664116 (size!49778 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535732 (= lt!664116 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130926 res!1052810) b!1535726))

(assert (= (and b!1535726 res!1052815) b!1535729))

(assert (= (and b!1535729 res!1052809) b!1535725))

(assert (= (and b!1535725 res!1052811) b!1535723))

(assert (= (and b!1535723 res!1052816) b!1535728))

(assert (= (and b!1535728 res!1052813) b!1535731))

(assert (= (and b!1535731 res!1052812) b!1535727))

(assert (= (and b!1535727 res!1052818) b!1535730))

(assert (= (and b!1535730 res!1052817) b!1535732))

(assert (= (and b!1535732 res!1052814) b!1535724))

(declare-fun m!1418203 () Bool)

(assert (=> b!1535725 m!1418203))

(assert (=> b!1535725 m!1418203))

(declare-fun m!1418205 () Bool)

(assert (=> b!1535725 m!1418205))

(declare-fun m!1418207 () Bool)

(assert (=> b!1535728 m!1418207))

(declare-fun m!1418209 () Bool)

(assert (=> start!130926 m!1418209))

(declare-fun m!1418211 () Bool)

(assert (=> start!130926 m!1418211))

(declare-fun m!1418213 () Bool)

(assert (=> b!1535731 m!1418213))

(declare-fun m!1418215 () Bool)

(assert (=> b!1535730 m!1418215))

(assert (=> b!1535730 m!1418203))

(declare-fun m!1418217 () Bool)

(assert (=> b!1535723 m!1418217))

(assert (=> b!1535727 m!1418203))

(assert (=> b!1535727 m!1418203))

(declare-fun m!1418219 () Bool)

(assert (=> b!1535727 m!1418219))

(declare-fun m!1418221 () Bool)

(assert (=> b!1535729 m!1418221))

(assert (=> b!1535729 m!1418221))

(declare-fun m!1418223 () Bool)

(assert (=> b!1535729 m!1418223))

(declare-fun m!1418225 () Bool)

(assert (=> b!1535732 m!1418225))

(assert (=> b!1535724 m!1418203))

(assert (=> b!1535724 m!1418203))

(declare-fun m!1418227 () Bool)

(assert (=> b!1535724 m!1418227))

(push 1)

(assert (not start!130926))

(assert (not b!1535728))

(assert (not b!1535723))

(assert (not b!1535724))

(assert (not b!1535725))

(assert (not b!1535732))

(assert (not b!1535727))

(assert (not b!1535729))

(check-sat)

