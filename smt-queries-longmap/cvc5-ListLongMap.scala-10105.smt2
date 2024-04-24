; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119316 () Bool)

(assert start!119316)

(declare-fun res!930374 () Bool)

(declare-fun e!787885 () Bool)

(assert (=> start!119316 (=> (not res!930374) (not e!787885))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119316 (= res!930374 (validMask!0 mask!2840))))

(assert (=> start!119316 e!787885))

(assert (=> start!119316 true))

(declare-datatypes ((array!95175 0))(
  ( (array!95176 (arr!45951 (Array (_ BitVec 32) (_ BitVec 64))) (size!46502 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95175)

(declare-fun array_inv!35232 (array!95175) Bool)

(assert (=> start!119316 (array_inv!35232 a!2901)))

(declare-fun b!1390897 () Bool)

(declare-fun res!930376 () Bool)

(assert (=> b!1390897 (=> (not res!930376) (not e!787885))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1390897 (= res!930376 (and (= (size!46502 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46502 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46502 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390898 () Bool)

(declare-fun res!930377 () Bool)

(assert (=> b!1390898 (=> (not res!930377) (not e!787885))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390898 (= res!930377 (validKeyInArray!0 (select (arr!45951 a!2901) i!1037)))))

(declare-fun b!1390899 () Bool)

(declare-fun res!930375 () Bool)

(assert (=> b!1390899 (=> (not res!930375) (not e!787885))))

(assert (=> b!1390899 (= res!930375 (validKeyInArray!0 (select (arr!45951 a!2901) j!112)))))

(declare-fun b!1390900 () Bool)

(declare-fun res!930378 () Bool)

(assert (=> b!1390900 (=> (not res!930378) (not e!787885))))

(declare-datatypes ((List!32457 0))(
  ( (Nil!32454) (Cons!32453 (h!33679 (_ BitVec 64)) (t!47143 List!32457)) )
))
(declare-fun arrayNoDuplicates!0 (array!95175 (_ BitVec 32) List!32457) Bool)

(assert (=> b!1390900 (= res!930378 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32454))))

(declare-fun b!1390901 () Bool)

(assert (=> b!1390901 (= e!787885 false)))

(declare-datatypes ((SeekEntryResult!10171 0))(
  ( (MissingZero!10171 (index!43055 (_ BitVec 32))) (Found!10171 (index!43056 (_ BitVec 32))) (Intermediate!10171 (undefined!10983 Bool) (index!43057 (_ BitVec 32)) (x!124892 (_ BitVec 32))) (Undefined!10171) (MissingVacant!10171 (index!43058 (_ BitVec 32))) )
))
(declare-fun lt!611018 () SeekEntryResult!10171)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95175 (_ BitVec 32)) SeekEntryResult!10171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390901 (= lt!611018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45951 a!2901) j!112) mask!2840) (select (arr!45951 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390902 () Bool)

(declare-fun res!930379 () Bool)

(assert (=> b!1390902 (=> (not res!930379) (not e!787885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95175 (_ BitVec 32)) Bool)

(assert (=> b!1390902 (= res!930379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119316 res!930374) b!1390897))

(assert (= (and b!1390897 res!930376) b!1390898))

(assert (= (and b!1390898 res!930377) b!1390899))

(assert (= (and b!1390899 res!930375) b!1390902))

(assert (= (and b!1390902 res!930379) b!1390900))

(assert (= (and b!1390900 res!930378) b!1390901))

(declare-fun m!1276799 () Bool)

(assert (=> b!1390899 m!1276799))

(assert (=> b!1390899 m!1276799))

(declare-fun m!1276801 () Bool)

(assert (=> b!1390899 m!1276801))

(declare-fun m!1276803 () Bool)

(assert (=> start!119316 m!1276803))

(declare-fun m!1276805 () Bool)

(assert (=> start!119316 m!1276805))

(declare-fun m!1276807 () Bool)

(assert (=> b!1390902 m!1276807))

(assert (=> b!1390901 m!1276799))

(assert (=> b!1390901 m!1276799))

(declare-fun m!1276809 () Bool)

(assert (=> b!1390901 m!1276809))

(assert (=> b!1390901 m!1276809))

(assert (=> b!1390901 m!1276799))

(declare-fun m!1276811 () Bool)

(assert (=> b!1390901 m!1276811))

(declare-fun m!1276813 () Bool)

(assert (=> b!1390898 m!1276813))

(assert (=> b!1390898 m!1276813))

(declare-fun m!1276815 () Bool)

(assert (=> b!1390898 m!1276815))

(declare-fun m!1276817 () Bool)

(assert (=> b!1390900 m!1276817))

(push 1)

(assert (not b!1390901))

(assert (not b!1390899))

(assert (not b!1390898))

(assert (not b!1390900))

(assert (not b!1390902))

(assert (not start!119316))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

