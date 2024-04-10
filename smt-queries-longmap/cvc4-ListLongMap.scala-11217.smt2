; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130938 () Bool)

(assert start!130938)

(declare-fun b!1535903 () Bool)

(declare-fun res!1052993 () Bool)

(declare-fun e!854938 () Bool)

(assert (=> b!1535903 (=> (not res!1052993) (not e!854938))))

(declare-datatypes ((array!102036 0))(
  ( (array!102037 (arr!49234 (Array (_ BitVec 32) (_ BitVec 64))) (size!49784 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102036)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102036 (_ BitVec 32)) Bool)

(assert (=> b!1535903 (= res!1052993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535904 () Bool)

(declare-fun res!1052990 () Bool)

(assert (=> b!1535904 (=> (not res!1052990) (not e!854938))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13366 0))(
  ( (MissingZero!13366 (index!55859 (_ BitVec 32))) (Found!13366 (index!55860 (_ BitVec 32))) (Intermediate!13366 (undefined!14178 Bool) (index!55861 (_ BitVec 32)) (x!137600 (_ BitVec 32))) (Undefined!13366) (MissingVacant!13366 (index!55862 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102036 (_ BitVec 32)) SeekEntryResult!13366)

(assert (=> b!1535904 (= res!1052990 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49234 a!2792) j!64) a!2792 mask!2480) (Found!13366 j!64)))))

(declare-fun b!1535905 () Bool)

(declare-fun res!1052996 () Bool)

(assert (=> b!1535905 (=> (not res!1052996) (not e!854938))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535905 (= res!1052996 (validKeyInArray!0 (select (arr!49234 a!2792) i!951)))))

(declare-fun b!1535906 () Bool)

(declare-fun e!854937 () Bool)

(assert (=> b!1535906 (= e!854938 e!854937)))

(declare-fun res!1052997 () Bool)

(assert (=> b!1535906 (=> (not res!1052997) (not e!854937))))

(declare-fun lt!664152 () (_ BitVec 32))

(assert (=> b!1535906 (= res!1052997 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664152 #b00000000000000000000000000000000) (bvslt lt!664152 (size!49784 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535906 (= lt!664152 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535907 () Bool)

(declare-fun res!1052994 () Bool)

(assert (=> b!1535907 (=> (not res!1052994) (not e!854938))))

(declare-datatypes ((List!35708 0))(
  ( (Nil!35705) (Cons!35704 (h!37149 (_ BitVec 64)) (t!50402 List!35708)) )
))
(declare-fun arrayNoDuplicates!0 (array!102036 (_ BitVec 32) List!35708) Bool)

(assert (=> b!1535907 (= res!1052994 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35705))))

(declare-fun res!1052995 () Bool)

(assert (=> start!130938 (=> (not res!1052995) (not e!854938))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130938 (= res!1052995 (validMask!0 mask!2480))))

(assert (=> start!130938 e!854938))

(assert (=> start!130938 true))

(declare-fun array_inv!38262 (array!102036) Bool)

(assert (=> start!130938 (array_inv!38262 a!2792)))

(declare-fun b!1535908 () Bool)

(declare-fun res!1052991 () Bool)

(assert (=> b!1535908 (=> (not res!1052991) (not e!854938))))

(assert (=> b!1535908 (= res!1052991 (validKeyInArray!0 (select (arr!49234 a!2792) j!64)))))

(declare-fun b!1535909 () Bool)

(declare-fun res!1052992 () Bool)

(assert (=> b!1535909 (=> (not res!1052992) (not e!854938))))

(assert (=> b!1535909 (= res!1052992 (not (= (select (arr!49234 a!2792) index!463) (select (arr!49234 a!2792) j!64))))))

(declare-fun b!1535910 () Bool)

(declare-fun res!1052998 () Bool)

(assert (=> b!1535910 (=> (not res!1052998) (not e!854938))))

(assert (=> b!1535910 (= res!1052998 (and (= (size!49784 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49784 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49784 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535911 () Bool)

(assert (=> b!1535911 (= e!854937 false)))

(declare-fun lt!664153 () SeekEntryResult!13366)

(assert (=> b!1535911 (= lt!664153 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664152 vacantIndex!5 (select (arr!49234 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535912 () Bool)

(declare-fun res!1052989 () Bool)

(assert (=> b!1535912 (=> (not res!1052989) (not e!854938))))

(assert (=> b!1535912 (= res!1052989 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49784 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49784 a!2792)) (= (select (arr!49234 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130938 res!1052995) b!1535910))

(assert (= (and b!1535910 res!1052998) b!1535905))

(assert (= (and b!1535905 res!1052996) b!1535908))

(assert (= (and b!1535908 res!1052991) b!1535903))

(assert (= (and b!1535903 res!1052993) b!1535907))

(assert (= (and b!1535907 res!1052994) b!1535912))

(assert (= (and b!1535912 res!1052989) b!1535904))

(assert (= (and b!1535904 res!1052990) b!1535909))

(assert (= (and b!1535909 res!1052992) b!1535906))

(assert (= (and b!1535906 res!1052997) b!1535911))

(declare-fun m!1418359 () Bool)

(assert (=> b!1535903 m!1418359))

(declare-fun m!1418361 () Bool)

(assert (=> b!1535906 m!1418361))

(declare-fun m!1418363 () Bool)

(assert (=> start!130938 m!1418363))

(declare-fun m!1418365 () Bool)

(assert (=> start!130938 m!1418365))

(declare-fun m!1418367 () Bool)

(assert (=> b!1535905 m!1418367))

(assert (=> b!1535905 m!1418367))

(declare-fun m!1418369 () Bool)

(assert (=> b!1535905 m!1418369))

(declare-fun m!1418371 () Bool)

(assert (=> b!1535908 m!1418371))

(assert (=> b!1535908 m!1418371))

(declare-fun m!1418373 () Bool)

(assert (=> b!1535908 m!1418373))

(declare-fun m!1418375 () Bool)

(assert (=> b!1535909 m!1418375))

(assert (=> b!1535909 m!1418371))

(assert (=> b!1535911 m!1418371))

(assert (=> b!1535911 m!1418371))

(declare-fun m!1418377 () Bool)

(assert (=> b!1535911 m!1418377))

(assert (=> b!1535904 m!1418371))

(assert (=> b!1535904 m!1418371))

(declare-fun m!1418379 () Bool)

(assert (=> b!1535904 m!1418379))

(declare-fun m!1418381 () Bool)

(assert (=> b!1535912 m!1418381))

(declare-fun m!1418383 () Bool)

(assert (=> b!1535907 m!1418383))

(push 1)

(assert (not b!1535906))

(assert (not b!1535905))

(assert (not b!1535911))

(assert (not b!1535907))

(assert (not start!130938))

(assert (not b!1535903))

(assert (not b!1535904))

(assert (not b!1535908))

(check-sat)

