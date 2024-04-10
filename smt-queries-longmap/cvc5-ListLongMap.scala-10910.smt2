; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127722 () Bool)

(assert start!127722)

(declare-fun b!1500791 () Bool)

(declare-fun res!1021868 () Bool)

(declare-fun e!839701 () Bool)

(assert (=> b!1500791 (=> (not res!1021868) (not e!839701))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100103 0))(
  ( (array!100104 (arr!48311 (Array (_ BitVec 32) (_ BitVec 64))) (size!48861 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100103)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500791 (= res!1021868 (and (= (size!48861 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48861 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48861 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500792 () Bool)

(declare-fun res!1021869 () Bool)

(assert (=> b!1500792 (=> (not res!1021869) (not e!839701))))

(declare-datatypes ((List!34803 0))(
  ( (Nil!34800) (Cons!34799 (h!36196 (_ BitVec 64)) (t!49497 List!34803)) )
))
(declare-fun arrayNoDuplicates!0 (array!100103 (_ BitVec 32) List!34803) Bool)

(assert (=> b!1500792 (= res!1021869 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34800))))

(declare-fun res!1021873 () Bool)

(assert (=> start!127722 (=> (not res!1021873) (not e!839701))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127722 (= res!1021873 (validMask!0 mask!2661))))

(assert (=> start!127722 e!839701))

(assert (=> start!127722 true))

(declare-fun array_inv!37339 (array!100103) Bool)

(assert (=> start!127722 (array_inv!37339 a!2850)))

(declare-fun b!1500793 () Bool)

(declare-fun res!1021874 () Bool)

(assert (=> b!1500793 (=> (not res!1021874) (not e!839701))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500793 (= res!1021874 (validKeyInArray!0 (select (arr!48311 a!2850) i!996)))))

(declare-fun b!1500794 () Bool)

(declare-fun res!1021876 () Bool)

(assert (=> b!1500794 (=> (not res!1021876) (not e!839701))))

(assert (=> b!1500794 (= res!1021876 (validKeyInArray!0 (select (arr!48311 a!2850) j!87)))))

(declare-fun b!1500795 () Bool)

(declare-fun res!1021870 () Bool)

(assert (=> b!1500795 (=> (not res!1021870) (not e!839701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100103 (_ BitVec 32)) Bool)

(assert (=> b!1500795 (= res!1021870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500796 () Bool)

(declare-fun res!1021872 () Bool)

(assert (=> b!1500796 (=> (not res!1021872) (not e!839701))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12521 0))(
  ( (MissingZero!12521 (index!52476 (_ BitVec 32))) (Found!12521 (index!52477 (_ BitVec 32))) (Intermediate!12521 (undefined!13333 Bool) (index!52478 (_ BitVec 32)) (x!134147 (_ BitVec 32))) (Undefined!12521) (MissingVacant!12521 (index!52479 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100103 (_ BitVec 32)) SeekEntryResult!12521)

(assert (=> b!1500796 (= res!1021872 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48311 a!2850) j!87) a!2850 mask!2661) (Found!12521 j!87)))))

(declare-fun b!1500797 () Bool)

(declare-fun e!839700 () Bool)

(assert (=> b!1500797 (= e!839701 e!839700)))

(declare-fun res!1021875 () Bool)

(assert (=> b!1500797 (=> (not res!1021875) (not e!839700))))

(declare-fun lt!653008 () (_ BitVec 32))

(assert (=> b!1500797 (= res!1021875 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653008 #b00000000000000000000000000000000) (bvslt lt!653008 (size!48861 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500797 (= lt!653008 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500798 () Bool)

(declare-fun res!1021871 () Bool)

(assert (=> b!1500798 (=> (not res!1021871) (not e!839701))))

(assert (=> b!1500798 (= res!1021871 (not (= (select (arr!48311 a!2850) index!625) (select (arr!48311 a!2850) j!87))))))

(declare-fun b!1500799 () Bool)

(declare-fun res!1021867 () Bool)

(assert (=> b!1500799 (=> (not res!1021867) (not e!839701))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500799 (= res!1021867 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48861 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48861 a!2850)) (= (select (arr!48311 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48311 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48861 a!2850))))))

(declare-fun b!1500800 () Bool)

(assert (=> b!1500800 (= e!839700 false)))

(declare-fun lt!653007 () SeekEntryResult!12521)

(assert (=> b!1500800 (= lt!653007 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653008 vacantBefore!10 (select (arr!48311 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127722 res!1021873) b!1500791))

(assert (= (and b!1500791 res!1021868) b!1500793))

(assert (= (and b!1500793 res!1021874) b!1500794))

(assert (= (and b!1500794 res!1021876) b!1500795))

(assert (= (and b!1500795 res!1021870) b!1500792))

(assert (= (and b!1500792 res!1021869) b!1500799))

(assert (= (and b!1500799 res!1021867) b!1500796))

(assert (= (and b!1500796 res!1021872) b!1500798))

(assert (= (and b!1500798 res!1021871) b!1500797))

(assert (= (and b!1500797 res!1021875) b!1500800))

(declare-fun m!1383985 () Bool)

(assert (=> b!1500796 m!1383985))

(assert (=> b!1500796 m!1383985))

(declare-fun m!1383987 () Bool)

(assert (=> b!1500796 m!1383987))

(declare-fun m!1383989 () Bool)

(assert (=> b!1500798 m!1383989))

(assert (=> b!1500798 m!1383985))

(declare-fun m!1383991 () Bool)

(assert (=> start!127722 m!1383991))

(declare-fun m!1383993 () Bool)

(assert (=> start!127722 m!1383993))

(declare-fun m!1383995 () Bool)

(assert (=> b!1500797 m!1383995))

(assert (=> b!1500794 m!1383985))

(assert (=> b!1500794 m!1383985))

(declare-fun m!1383997 () Bool)

(assert (=> b!1500794 m!1383997))

(assert (=> b!1500800 m!1383985))

(assert (=> b!1500800 m!1383985))

(declare-fun m!1383999 () Bool)

(assert (=> b!1500800 m!1383999))

(declare-fun m!1384001 () Bool)

(assert (=> b!1500795 m!1384001))

(declare-fun m!1384003 () Bool)

(assert (=> b!1500799 m!1384003))

(declare-fun m!1384005 () Bool)

(assert (=> b!1500799 m!1384005))

(declare-fun m!1384007 () Bool)

(assert (=> b!1500799 m!1384007))

(declare-fun m!1384009 () Bool)

(assert (=> b!1500792 m!1384009))

(declare-fun m!1384011 () Bool)

(assert (=> b!1500793 m!1384011))

(assert (=> b!1500793 m!1384011))

(declare-fun m!1384013 () Bool)

(assert (=> b!1500793 m!1384013))

(push 1)

