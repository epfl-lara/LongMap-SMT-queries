; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130862 () Bool)

(assert start!130862)

(declare-fun b!1534763 () Bool)

(declare-fun res!1051849 () Bool)

(declare-fun e!854596 () Bool)

(assert (=> b!1534763 (=> (not res!1051849) (not e!854596))))

(declare-datatypes ((array!101960 0))(
  ( (array!101961 (arr!49196 (Array (_ BitVec 32) (_ BitVec 64))) (size!49746 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101960)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534763 (= res!1051849 (not (= (select (arr!49196 a!2792) index!463) (select (arr!49196 a!2792) j!64))))))

(declare-fun b!1534764 () Bool)

(declare-fun res!1051851 () Bool)

(assert (=> b!1534764 (=> (not res!1051851) (not e!854596))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101960 (_ BitVec 32)) Bool)

(assert (=> b!1534764 (= res!1051851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534765 () Bool)

(declare-fun res!1051855 () Bool)

(assert (=> b!1534765 (=> (not res!1051855) (not e!854596))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13328 0))(
  ( (MissingZero!13328 (index!55707 (_ BitVec 32))) (Found!13328 (index!55708 (_ BitVec 32))) (Intermediate!13328 (undefined!14140 Bool) (index!55709 (_ BitVec 32)) (x!137466 (_ BitVec 32))) (Undefined!13328) (MissingVacant!13328 (index!55710 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101960 (_ BitVec 32)) SeekEntryResult!13328)

(assert (=> b!1534765 (= res!1051855 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49196 a!2792) j!64) a!2792 mask!2480) (Found!13328 j!64)))))

(declare-fun res!1051856 () Bool)

(assert (=> start!130862 (=> (not res!1051856) (not e!854596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130862 (= res!1051856 (validMask!0 mask!2480))))

(assert (=> start!130862 e!854596))

(assert (=> start!130862 true))

(declare-fun array_inv!38224 (array!101960) Bool)

(assert (=> start!130862 (array_inv!38224 a!2792)))

(declare-fun b!1534766 () Bool)

(declare-fun res!1051857 () Bool)

(assert (=> b!1534766 (=> (not res!1051857) (not e!854596))))

(declare-datatypes ((List!35670 0))(
  ( (Nil!35667) (Cons!35666 (h!37111 (_ BitVec 64)) (t!50364 List!35670)) )
))
(declare-fun arrayNoDuplicates!0 (array!101960 (_ BitVec 32) List!35670) Bool)

(assert (=> b!1534766 (= res!1051857 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35667))))

(declare-fun b!1534767 () Bool)

(declare-fun res!1051853 () Bool)

(assert (=> b!1534767 (=> (not res!1051853) (not e!854596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534767 (= res!1051853 (validKeyInArray!0 (select (arr!49196 a!2792) j!64)))))

(declare-fun b!1534768 () Bool)

(declare-fun e!854594 () Bool)

(assert (=> b!1534768 (= e!854594 false)))

(declare-fun lt!663925 () SeekEntryResult!13328)

(declare-fun lt!663924 () (_ BitVec 32))

(assert (=> b!1534768 (= lt!663925 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663924 vacantIndex!5 (select (arr!49196 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534769 () Bool)

(declare-fun res!1051858 () Bool)

(assert (=> b!1534769 (=> (not res!1051858) (not e!854596))))

(assert (=> b!1534769 (= res!1051858 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49746 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49746 a!2792)) (= (select (arr!49196 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534770 () Bool)

(declare-fun res!1051850 () Bool)

(assert (=> b!1534770 (=> (not res!1051850) (not e!854596))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534770 (= res!1051850 (and (= (size!49746 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49746 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49746 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534771 () Bool)

(assert (=> b!1534771 (= e!854596 e!854594)))

(declare-fun res!1051852 () Bool)

(assert (=> b!1534771 (=> (not res!1051852) (not e!854594))))

(assert (=> b!1534771 (= res!1051852 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663924 #b00000000000000000000000000000000) (bvslt lt!663924 (size!49746 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534771 (= lt!663924 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534772 () Bool)

(declare-fun res!1051854 () Bool)

(assert (=> b!1534772 (=> (not res!1051854) (not e!854596))))

(assert (=> b!1534772 (= res!1051854 (validKeyInArray!0 (select (arr!49196 a!2792) i!951)))))

(assert (= (and start!130862 res!1051856) b!1534770))

(assert (= (and b!1534770 res!1051850) b!1534772))

(assert (= (and b!1534772 res!1051854) b!1534767))

(assert (= (and b!1534767 res!1051853) b!1534764))

(assert (= (and b!1534764 res!1051851) b!1534766))

(assert (= (and b!1534766 res!1051857) b!1534769))

(assert (= (and b!1534769 res!1051858) b!1534765))

(assert (= (and b!1534765 res!1051855) b!1534763))

(assert (= (and b!1534763 res!1051849) b!1534771))

(assert (= (and b!1534771 res!1051852) b!1534768))

(declare-fun m!1417371 () Bool)

(assert (=> b!1534769 m!1417371))

(declare-fun m!1417373 () Bool)

(assert (=> b!1534763 m!1417373))

(declare-fun m!1417375 () Bool)

(assert (=> b!1534763 m!1417375))

(declare-fun m!1417377 () Bool)

(assert (=> start!130862 m!1417377))

(declare-fun m!1417379 () Bool)

(assert (=> start!130862 m!1417379))

(assert (=> b!1534768 m!1417375))

(assert (=> b!1534768 m!1417375))

(declare-fun m!1417381 () Bool)

(assert (=> b!1534768 m!1417381))

(assert (=> b!1534767 m!1417375))

(assert (=> b!1534767 m!1417375))

(declare-fun m!1417383 () Bool)

(assert (=> b!1534767 m!1417383))

(declare-fun m!1417385 () Bool)

(assert (=> b!1534772 m!1417385))

(assert (=> b!1534772 m!1417385))

(declare-fun m!1417387 () Bool)

(assert (=> b!1534772 m!1417387))

(declare-fun m!1417389 () Bool)

(assert (=> b!1534766 m!1417389))

(declare-fun m!1417391 () Bool)

(assert (=> b!1534764 m!1417391))

(declare-fun m!1417393 () Bool)

(assert (=> b!1534771 m!1417393))

(assert (=> b!1534765 m!1417375))

(assert (=> b!1534765 m!1417375))

(declare-fun m!1417395 () Bool)

(assert (=> b!1534765 m!1417395))

(push 1)

