; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130850 () Bool)

(assert start!130850)

(declare-fun b!1535020 () Bool)

(declare-fun res!1052293 () Bool)

(declare-fun e!854569 () Bool)

(assert (=> b!1535020 (=> (not res!1052293) (not e!854569))))

(declare-datatypes ((array!101946 0))(
  ( (array!101947 (arr!49190 (Array (_ BitVec 32) (_ BitVec 64))) (size!49742 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101946)

(declare-datatypes ((List!35742 0))(
  ( (Nil!35739) (Cons!35738 (h!37184 (_ BitVec 64)) (t!50428 List!35742)) )
))
(declare-fun arrayNoDuplicates!0 (array!101946 (_ BitVec 32) List!35742) Bool)

(assert (=> b!1535020 (= res!1052293 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35739))))

(declare-fun b!1535021 () Bool)

(declare-fun res!1052294 () Bool)

(assert (=> b!1535021 (=> (not res!1052294) (not e!854569))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535021 (= res!1052294 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49742 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49742 a!2792)) (= (select (arr!49190 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535022 () Bool)

(declare-fun e!854568 () Bool)

(assert (=> b!1535022 (= e!854569 e!854568)))

(declare-fun res!1052296 () Bool)

(assert (=> b!1535022 (=> (not res!1052296) (not e!854568))))

(declare-fun lt!663753 () (_ BitVec 32))

(assert (=> b!1535022 (= res!1052296 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663753 #b00000000000000000000000000000000) (bvslt lt!663753 (size!49742 a!2792))))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535022 (= lt!663753 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535023 () Bool)

(declare-fun res!1052292 () Bool)

(assert (=> b!1535023 (=> (not res!1052292) (not e!854569))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535023 (= res!1052292 (and (= (size!49742 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49742 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49742 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535024 () Bool)

(declare-fun res!1052299 () Bool)

(assert (=> b!1535024 (=> (not res!1052299) (not e!854569))))

(declare-datatypes ((SeekEntryResult!13347 0))(
  ( (MissingZero!13347 (index!55783 (_ BitVec 32))) (Found!13347 (index!55784 (_ BitVec 32))) (Intermediate!13347 (undefined!14159 Bool) (index!55785 (_ BitVec 32)) (x!137528 (_ BitVec 32))) (Undefined!13347) (MissingVacant!13347 (index!55786 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101946 (_ BitVec 32)) SeekEntryResult!13347)

(assert (=> b!1535024 (= res!1052299 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49190 a!2792) j!64) a!2792 mask!2480) (Found!13347 j!64)))))

(declare-fun b!1535025 () Bool)

(declare-fun res!1052295 () Bool)

(assert (=> b!1535025 (=> (not res!1052295) (not e!854569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535025 (= res!1052295 (validKeyInArray!0 (select (arr!49190 a!2792) j!64)))))

(declare-fun b!1535026 () Bool)

(declare-fun res!1052290 () Bool)

(assert (=> b!1535026 (=> (not res!1052290) (not e!854569))))

(assert (=> b!1535026 (= res!1052290 (not (= (select (arr!49190 a!2792) index!463) (select (arr!49190 a!2792) j!64))))))

(declare-fun b!1535028 () Bool)

(declare-fun res!1052297 () Bool)

(assert (=> b!1535028 (=> (not res!1052297) (not e!854569))))

(assert (=> b!1535028 (= res!1052297 (validKeyInArray!0 (select (arr!49190 a!2792) i!951)))))

(declare-fun b!1535029 () Bool)

(declare-fun res!1052291 () Bool)

(assert (=> b!1535029 (=> (not res!1052291) (not e!854569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101946 (_ BitVec 32)) Bool)

(assert (=> b!1535029 (= res!1052291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535027 () Bool)

(assert (=> b!1535027 (= e!854568 false)))

(declare-fun lt!663752 () SeekEntryResult!13347)

(assert (=> b!1535027 (= lt!663752 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663753 vacantIndex!5 (select (arr!49190 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1052298 () Bool)

(assert (=> start!130850 (=> (not res!1052298) (not e!854569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130850 (= res!1052298 (validMask!0 mask!2480))))

(assert (=> start!130850 e!854569))

(assert (=> start!130850 true))

(declare-fun array_inv!38423 (array!101946) Bool)

(assert (=> start!130850 (array_inv!38423 a!2792)))

(assert (= (and start!130850 res!1052298) b!1535023))

(assert (= (and b!1535023 res!1052292) b!1535028))

(assert (= (and b!1535028 res!1052297) b!1535025))

(assert (= (and b!1535025 res!1052295) b!1535029))

(assert (= (and b!1535029 res!1052291) b!1535020))

(assert (= (and b!1535020 res!1052293) b!1535021))

(assert (= (and b!1535021 res!1052294) b!1535024))

(assert (= (and b!1535024 res!1052299) b!1535026))

(assert (= (and b!1535026 res!1052290) b!1535022))

(assert (= (and b!1535022 res!1052296) b!1535027))

(declare-fun m!1416973 () Bool)

(assert (=> b!1535026 m!1416973))

(declare-fun m!1416975 () Bool)

(assert (=> b!1535026 m!1416975))

(declare-fun m!1416977 () Bool)

(assert (=> b!1535022 m!1416977))

(declare-fun m!1416979 () Bool)

(assert (=> b!1535020 m!1416979))

(declare-fun m!1416981 () Bool)

(assert (=> b!1535021 m!1416981))

(assert (=> b!1535027 m!1416975))

(assert (=> b!1535027 m!1416975))

(declare-fun m!1416983 () Bool)

(assert (=> b!1535027 m!1416983))

(assert (=> b!1535025 m!1416975))

(assert (=> b!1535025 m!1416975))

(declare-fun m!1416985 () Bool)

(assert (=> b!1535025 m!1416985))

(assert (=> b!1535024 m!1416975))

(assert (=> b!1535024 m!1416975))

(declare-fun m!1416987 () Bool)

(assert (=> b!1535024 m!1416987))

(declare-fun m!1416989 () Bool)

(assert (=> start!130850 m!1416989))

(declare-fun m!1416991 () Bool)

(assert (=> start!130850 m!1416991))

(declare-fun m!1416993 () Bool)

(assert (=> b!1535029 m!1416993))

(declare-fun m!1416995 () Bool)

(assert (=> b!1535028 m!1416995))

(assert (=> b!1535028 m!1416995))

(declare-fun m!1416997 () Bool)

(assert (=> b!1535028 m!1416997))

(push 1)

(assert (not start!130850))

(assert (not b!1535020))

(assert (not b!1535027))

(assert (not b!1535024))

(assert (not b!1535025))

(assert (not b!1535028))

(assert (not b!1535029))

(assert (not b!1535022))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

