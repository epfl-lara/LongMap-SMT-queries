; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130856 () Bool)

(assert start!130856)

(declare-fun b!1534673 () Bool)

(declare-fun res!1051765 () Bool)

(declare-fun e!854569 () Bool)

(assert (=> b!1534673 (=> (not res!1051765) (not e!854569))))

(declare-datatypes ((array!101954 0))(
  ( (array!101955 (arr!49193 (Array (_ BitVec 32) (_ BitVec 64))) (size!49743 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101954)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534673 (= res!1051765 (validKeyInArray!0 (select (arr!49193 a!2792) i!951)))))

(declare-fun b!1534674 () Bool)

(declare-fun e!854568 () Bool)

(assert (=> b!1534674 (= e!854569 e!854568)))

(declare-fun res!1051759 () Bool)

(assert (=> b!1534674 (=> (not res!1051759) (not e!854568))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!663907 () (_ BitVec 32))

(assert (=> b!1534674 (= res!1051759 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663907 #b00000000000000000000000000000000) (bvslt lt!663907 (size!49743 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534674 (= lt!663907 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534675 () Bool)

(declare-fun res!1051760 () Bool)

(assert (=> b!1534675 (=> (not res!1051760) (not e!854569))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534675 (= res!1051760 (validKeyInArray!0 (select (arr!49193 a!2792) j!64)))))

(declare-fun res!1051762 () Bool)

(assert (=> start!130856 (=> (not res!1051762) (not e!854569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130856 (= res!1051762 (validMask!0 mask!2480))))

(assert (=> start!130856 e!854569))

(assert (=> start!130856 true))

(declare-fun array_inv!38221 (array!101954) Bool)

(assert (=> start!130856 (array_inv!38221 a!2792)))

(declare-fun b!1534676 () Bool)

(declare-fun res!1051761 () Bool)

(assert (=> b!1534676 (=> (not res!1051761) (not e!854569))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13325 0))(
  ( (MissingZero!13325 (index!55695 (_ BitVec 32))) (Found!13325 (index!55696 (_ BitVec 32))) (Intermediate!13325 (undefined!14137 Bool) (index!55697 (_ BitVec 32)) (x!137455 (_ BitVec 32))) (Undefined!13325) (MissingVacant!13325 (index!55698 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101954 (_ BitVec 32)) SeekEntryResult!13325)

(assert (=> b!1534676 (= res!1051761 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49193 a!2792) j!64) a!2792 mask!2480) (Found!13325 j!64)))))

(declare-fun b!1534677 () Bool)

(declare-fun res!1051767 () Bool)

(assert (=> b!1534677 (=> (not res!1051767) (not e!854569))))

(assert (=> b!1534677 (= res!1051767 (not (= (select (arr!49193 a!2792) index!463) (select (arr!49193 a!2792) j!64))))))

(declare-fun b!1534678 () Bool)

(declare-fun res!1051768 () Bool)

(assert (=> b!1534678 (=> (not res!1051768) (not e!854569))))

(assert (=> b!1534678 (= res!1051768 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49743 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49743 a!2792)) (= (select (arr!49193 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534679 () Bool)

(declare-fun res!1051764 () Bool)

(assert (=> b!1534679 (=> (not res!1051764) (not e!854569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101954 (_ BitVec 32)) Bool)

(assert (=> b!1534679 (= res!1051764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534680 () Bool)

(declare-fun res!1051763 () Bool)

(assert (=> b!1534680 (=> (not res!1051763) (not e!854569))))

(declare-datatypes ((List!35667 0))(
  ( (Nil!35664) (Cons!35663 (h!37108 (_ BitVec 64)) (t!50361 List!35667)) )
))
(declare-fun arrayNoDuplicates!0 (array!101954 (_ BitVec 32) List!35667) Bool)

(assert (=> b!1534680 (= res!1051763 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35664))))

(declare-fun b!1534681 () Bool)

(declare-fun res!1051766 () Bool)

(assert (=> b!1534681 (=> (not res!1051766) (not e!854569))))

(assert (=> b!1534681 (= res!1051766 (and (= (size!49743 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49743 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49743 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534682 () Bool)

(assert (=> b!1534682 (= e!854568 false)))

(declare-fun lt!663906 () SeekEntryResult!13325)

(assert (=> b!1534682 (= lt!663906 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663907 vacantIndex!5 (select (arr!49193 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130856 res!1051762) b!1534681))

(assert (= (and b!1534681 res!1051766) b!1534673))

(assert (= (and b!1534673 res!1051765) b!1534675))

(assert (= (and b!1534675 res!1051760) b!1534679))

(assert (= (and b!1534679 res!1051764) b!1534680))

(assert (= (and b!1534680 res!1051763) b!1534678))

(assert (= (and b!1534678 res!1051768) b!1534676))

(assert (= (and b!1534676 res!1051761) b!1534677))

(assert (= (and b!1534677 res!1051767) b!1534674))

(assert (= (and b!1534674 res!1051759) b!1534682))

(declare-fun m!1417293 () Bool)

(assert (=> b!1534674 m!1417293))

(declare-fun m!1417295 () Bool)

(assert (=> b!1534678 m!1417295))

(declare-fun m!1417297 () Bool)

(assert (=> b!1534680 m!1417297))

(declare-fun m!1417299 () Bool)

(assert (=> b!1534675 m!1417299))

(assert (=> b!1534675 m!1417299))

(declare-fun m!1417301 () Bool)

(assert (=> b!1534675 m!1417301))

(declare-fun m!1417303 () Bool)

(assert (=> b!1534679 m!1417303))

(declare-fun m!1417305 () Bool)

(assert (=> start!130856 m!1417305))

(declare-fun m!1417307 () Bool)

(assert (=> start!130856 m!1417307))

(assert (=> b!1534682 m!1417299))

(assert (=> b!1534682 m!1417299))

(declare-fun m!1417309 () Bool)

(assert (=> b!1534682 m!1417309))

(declare-fun m!1417311 () Bool)

(assert (=> b!1534677 m!1417311))

(assert (=> b!1534677 m!1417299))

(declare-fun m!1417313 () Bool)

(assert (=> b!1534673 m!1417313))

(assert (=> b!1534673 m!1417313))

(declare-fun m!1417315 () Bool)

(assert (=> b!1534673 m!1417315))

(assert (=> b!1534676 m!1417299))

(assert (=> b!1534676 m!1417299))

(declare-fun m!1417317 () Bool)

(assert (=> b!1534676 m!1417317))

(push 1)

