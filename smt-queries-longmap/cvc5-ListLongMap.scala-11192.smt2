; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130784 () Bool)

(assert start!130784)

(declare-fun b!1533821 () Bool)

(declare-fun res!1050909 () Bool)

(declare-fun e!854332 () Bool)

(assert (=> b!1533821 (=> (not res!1050909) (not e!854332))))

(declare-datatypes ((array!101882 0))(
  ( (array!101883 (arr!49157 (Array (_ BitVec 32) (_ BitVec 64))) (size!49707 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101882)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533821 (= res!1050909 (validKeyInArray!0 (select (arr!49157 a!2792) i!951)))))

(declare-fun b!1533822 () Bool)

(assert (=> b!1533822 (= e!854332 false)))

(declare-datatypes ((SeekEntryResult!13289 0))(
  ( (MissingZero!13289 (index!55551 (_ BitVec 32))) (Found!13289 (index!55552 (_ BitVec 32))) (Intermediate!13289 (undefined!14101 Bool) (index!55553 (_ BitVec 32)) (x!137323 (_ BitVec 32))) (Undefined!13289) (MissingVacant!13289 (index!55554 (_ BitVec 32))) )
))
(declare-fun lt!663814 () SeekEntryResult!13289)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101882 (_ BitVec 32)) SeekEntryResult!13289)

(assert (=> b!1533822 (= lt!663814 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49157 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1533823 () Bool)

(declare-fun res!1050910 () Bool)

(assert (=> b!1533823 (=> (not res!1050910) (not e!854332))))

(assert (=> b!1533823 (= res!1050910 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49707 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49707 a!2792)) (= (select (arr!49157 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533824 () Bool)

(declare-fun res!1050911 () Bool)

(assert (=> b!1533824 (=> (not res!1050911) (not e!854332))))

(declare-datatypes ((List!35631 0))(
  ( (Nil!35628) (Cons!35627 (h!37072 (_ BitVec 64)) (t!50325 List!35631)) )
))
(declare-fun arrayNoDuplicates!0 (array!101882 (_ BitVec 32) List!35631) Bool)

(assert (=> b!1533824 (= res!1050911 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35628))))

(declare-fun b!1533825 () Bool)

(declare-fun res!1050907 () Bool)

(assert (=> b!1533825 (=> (not res!1050907) (not e!854332))))

(assert (=> b!1533825 (= res!1050907 (validKeyInArray!0 (select (arr!49157 a!2792) j!64)))))

(declare-fun res!1050912 () Bool)

(assert (=> start!130784 (=> (not res!1050912) (not e!854332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130784 (= res!1050912 (validMask!0 mask!2480))))

(assert (=> start!130784 e!854332))

(assert (=> start!130784 true))

(declare-fun array_inv!38185 (array!101882) Bool)

(assert (=> start!130784 (array_inv!38185 a!2792)))

(declare-fun b!1533826 () Bool)

(declare-fun res!1050913 () Bool)

(assert (=> b!1533826 (=> (not res!1050913) (not e!854332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101882 (_ BitVec 32)) Bool)

(assert (=> b!1533826 (= res!1050913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533827 () Bool)

(declare-fun res!1050908 () Bool)

(assert (=> b!1533827 (=> (not res!1050908) (not e!854332))))

(assert (=> b!1533827 (= res!1050908 (and (= (size!49707 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49707 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49707 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!130784 res!1050912) b!1533827))

(assert (= (and b!1533827 res!1050908) b!1533821))

(assert (= (and b!1533821 res!1050909) b!1533825))

(assert (= (and b!1533825 res!1050907) b!1533826))

(assert (= (and b!1533826 res!1050913) b!1533824))

(assert (= (and b!1533824 res!1050911) b!1533823))

(assert (= (and b!1533823 res!1050910) b!1533822))

(declare-fun m!1416513 () Bool)

(assert (=> b!1533824 m!1416513))

(declare-fun m!1416515 () Bool)

(assert (=> b!1533826 m!1416515))

(declare-fun m!1416517 () Bool)

(assert (=> b!1533825 m!1416517))

(assert (=> b!1533825 m!1416517))

(declare-fun m!1416519 () Bool)

(assert (=> b!1533825 m!1416519))

(declare-fun m!1416521 () Bool)

(assert (=> start!130784 m!1416521))

(declare-fun m!1416523 () Bool)

(assert (=> start!130784 m!1416523))

(declare-fun m!1416525 () Bool)

(assert (=> b!1533821 m!1416525))

(assert (=> b!1533821 m!1416525))

(declare-fun m!1416527 () Bool)

(assert (=> b!1533821 m!1416527))

(declare-fun m!1416529 () Bool)

(assert (=> b!1533823 m!1416529))

(assert (=> b!1533822 m!1416517))

(assert (=> b!1533822 m!1416517))

(declare-fun m!1416531 () Bool)

(assert (=> b!1533822 m!1416531))

(push 1)

(assert (not b!1533824))

(assert (not b!1533825))

(assert (not b!1533821))

(assert (not start!130784))

(assert (not b!1533822))

(assert (not b!1533826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

