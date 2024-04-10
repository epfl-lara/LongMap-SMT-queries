; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130794 () Bool)

(assert start!130794)

(declare-fun b!1533935 () Bool)

(declare-fun res!1051022 () Bool)

(declare-fun e!854361 () Bool)

(assert (=> b!1533935 (=> (not res!1051022) (not e!854361))))

(declare-datatypes ((array!101892 0))(
  ( (array!101893 (arr!49162 (Array (_ BitVec 32) (_ BitVec 64))) (size!49712 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101892)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533935 (= res!1051022 (and (= (size!49712 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49712 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49712 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533936 () Bool)

(declare-fun res!1051021 () Bool)

(assert (=> b!1533936 (=> (not res!1051021) (not e!854361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533936 (= res!1051021 (validKeyInArray!0 (select (arr!49162 a!2792) i!951)))))

(declare-fun b!1533937 () Bool)

(declare-fun res!1051024 () Bool)

(assert (=> b!1533937 (=> (not res!1051024) (not e!854361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101892 (_ BitVec 32)) Bool)

(assert (=> b!1533937 (= res!1051024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533934 () Bool)

(declare-fun res!1051026 () Bool)

(assert (=> b!1533934 (=> (not res!1051026) (not e!854361))))

(assert (=> b!1533934 (= res!1051026 (validKeyInArray!0 (select (arr!49162 a!2792) j!64)))))

(declare-fun res!1051023 () Bool)

(assert (=> start!130794 (=> (not res!1051023) (not e!854361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130794 (= res!1051023 (validMask!0 mask!2480))))

(assert (=> start!130794 e!854361))

(assert (=> start!130794 true))

(declare-fun array_inv!38190 (array!101892) Bool)

(assert (=> start!130794 (array_inv!38190 a!2792)))

(declare-fun b!1533938 () Bool)

(declare-fun res!1051025 () Bool)

(assert (=> b!1533938 (=> (not res!1051025) (not e!854361))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13294 0))(
  ( (MissingZero!13294 (index!55571 (_ BitVec 32))) (Found!13294 (index!55572 (_ BitVec 32))) (Intermediate!13294 (undefined!14106 Bool) (index!55573 (_ BitVec 32)) (x!137336 (_ BitVec 32))) (Undefined!13294) (MissingVacant!13294 (index!55574 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101892 (_ BitVec 32)) SeekEntryResult!13294)

(assert (=> b!1533938 (= res!1051025 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49162 a!2792) j!64) a!2792 mask!2480) (Found!13294 j!64)))))

(declare-fun b!1533939 () Bool)

(assert (=> b!1533939 (= e!854361 (and (= (select (arr!49162 a!2792) index!463) (select (arr!49162 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1533940 () Bool)

(declare-fun res!1051020 () Bool)

(assert (=> b!1533940 (=> (not res!1051020) (not e!854361))))

(declare-datatypes ((List!35636 0))(
  ( (Nil!35633) (Cons!35632 (h!37077 (_ BitVec 64)) (t!50330 List!35636)) )
))
(declare-fun arrayNoDuplicates!0 (array!101892 (_ BitVec 32) List!35636) Bool)

(assert (=> b!1533940 (= res!1051020 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35633))))

(declare-fun b!1533941 () Bool)

(declare-fun res!1051027 () Bool)

(assert (=> b!1533941 (=> (not res!1051027) (not e!854361))))

(assert (=> b!1533941 (= res!1051027 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49712 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49712 a!2792)) (= (select (arr!49162 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130794 res!1051023) b!1533935))

(assert (= (and b!1533935 res!1051022) b!1533936))

(assert (= (and b!1533936 res!1051021) b!1533934))

(assert (= (and b!1533934 res!1051026) b!1533937))

(assert (= (and b!1533937 res!1051024) b!1533940))

(assert (= (and b!1533940 res!1051020) b!1533941))

(assert (= (and b!1533941 res!1051027) b!1533938))

(assert (= (and b!1533938 res!1051025) b!1533939))

(declare-fun m!1416617 () Bool)

(assert (=> b!1533936 m!1416617))

(assert (=> b!1533936 m!1416617))

(declare-fun m!1416619 () Bool)

(assert (=> b!1533936 m!1416619))

(declare-fun m!1416621 () Bool)

(assert (=> start!130794 m!1416621))

(declare-fun m!1416623 () Bool)

(assert (=> start!130794 m!1416623))

(declare-fun m!1416625 () Bool)

(assert (=> b!1533934 m!1416625))

(assert (=> b!1533934 m!1416625))

(declare-fun m!1416627 () Bool)

(assert (=> b!1533934 m!1416627))

(declare-fun m!1416629 () Bool)

(assert (=> b!1533940 m!1416629))

(assert (=> b!1533938 m!1416625))

(assert (=> b!1533938 m!1416625))

(declare-fun m!1416631 () Bool)

(assert (=> b!1533938 m!1416631))

(declare-fun m!1416633 () Bool)

(assert (=> b!1533937 m!1416633))

(declare-fun m!1416635 () Bool)

(assert (=> b!1533939 m!1416635))

(assert (=> b!1533939 m!1416625))

(declare-fun m!1416637 () Bool)

(assert (=> b!1533941 m!1416637))

(push 1)

(assert (not b!1533936))

(assert (not b!1533940))

(assert (not start!130794))

(assert (not b!1533934))

(assert (not b!1533937))

(assert (not b!1533938))

(check-sat)

(pop 1)

(push 1)

(check-sat)

