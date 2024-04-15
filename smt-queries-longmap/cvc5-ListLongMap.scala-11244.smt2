; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131086 () Bool)

(assert start!131086)

(declare-fun b!1538021 () Bool)

(declare-fun res!1055186 () Bool)

(declare-fun e!855775 () Bool)

(assert (=> b!1538021 (=> (not res!1055186) (not e!855775))))

(declare-datatypes ((array!102149 0))(
  ( (array!102150 (arr!49290 (Array (_ BitVec 32) (_ BitVec 64))) (size!49842 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102149)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102149 (_ BitVec 32)) Bool)

(assert (=> b!1538021 (= res!1055186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538022 () Bool)

(declare-fun res!1055187 () Bool)

(assert (=> b!1538022 (=> (not res!1055187) (not e!855775))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538022 (= res!1055187 (and (= (size!49842 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49842 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49842 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1055184 () Bool)

(assert (=> start!131086 (=> (not res!1055184) (not e!855775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131086 (= res!1055184 (validMask!0 mask!2480))))

(assert (=> start!131086 e!855775))

(assert (=> start!131086 true))

(declare-fun array_inv!38523 (array!102149) Bool)

(assert (=> start!131086 (array_inv!38523 a!2792)))

(declare-fun b!1538023 () Bool)

(declare-fun res!1055185 () Bool)

(assert (=> b!1538023 (=> (not res!1055185) (not e!855775))))

(declare-datatypes ((List!35842 0))(
  ( (Nil!35839) (Cons!35838 (h!37284 (_ BitVec 64)) (t!50528 List!35842)) )
))
(declare-fun arrayNoDuplicates!0 (array!102149 (_ BitVec 32) List!35842) Bool)

(assert (=> b!1538023 (= res!1055185 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35839))))

(declare-fun b!1538024 () Bool)

(declare-fun res!1055183 () Bool)

(assert (=> b!1538024 (=> (not res!1055183) (not e!855775))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1538024 (= res!1055183 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49842 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49842 a!2792)) (= (select (arr!49290 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538025 () Bool)

(declare-fun res!1055191 () Bool)

(assert (=> b!1538025 (=> (not res!1055191) (not e!855775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538025 (= res!1055191 (validKeyInArray!0 (select (arr!49290 a!2792) j!64)))))

(declare-fun b!1538026 () Bool)

(assert (=> b!1538026 (= e!855775 false)))

(declare-fun lt!664602 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538026 (= lt!664602 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538027 () Bool)

(declare-fun res!1055189 () Bool)

(assert (=> b!1538027 (=> (not res!1055189) (not e!855775))))

(assert (=> b!1538027 (= res!1055189 (validKeyInArray!0 (select (arr!49290 a!2792) i!951)))))

(declare-fun b!1538028 () Bool)

(declare-fun res!1055188 () Bool)

(assert (=> b!1538028 (=> (not res!1055188) (not e!855775))))

(assert (=> b!1538028 (= res!1055188 (not (= (select (arr!49290 a!2792) index!463) (select (arr!49290 a!2792) j!64))))))

(declare-fun b!1538029 () Bool)

(declare-fun res!1055190 () Bool)

(assert (=> b!1538029 (=> (not res!1055190) (not e!855775))))

(declare-datatypes ((SeekEntryResult!13441 0))(
  ( (MissingZero!13441 (index!56159 (_ BitVec 32))) (Found!13441 (index!56160 (_ BitVec 32))) (Intermediate!13441 (undefined!14253 Bool) (index!56161 (_ BitVec 32)) (x!137889 (_ BitVec 32))) (Undefined!13441) (MissingVacant!13441 (index!56162 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102149 (_ BitVec 32)) SeekEntryResult!13441)

(assert (=> b!1538029 (= res!1055190 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49290 a!2792) j!64) a!2792 mask!2480) (Found!13441 j!64)))))

(assert (= (and start!131086 res!1055184) b!1538022))

(assert (= (and b!1538022 res!1055187) b!1538027))

(assert (= (and b!1538027 res!1055189) b!1538025))

(assert (= (and b!1538025 res!1055191) b!1538021))

(assert (= (and b!1538021 res!1055186) b!1538023))

(assert (= (and b!1538023 res!1055185) b!1538024))

(assert (= (and b!1538024 res!1055183) b!1538029))

(assert (= (and b!1538029 res!1055190) b!1538028))

(assert (= (and b!1538028 res!1055188) b!1538026))

(declare-fun m!1419887 () Bool)

(assert (=> b!1538023 m!1419887))

(declare-fun m!1419889 () Bool)

(assert (=> b!1538024 m!1419889))

(declare-fun m!1419891 () Bool)

(assert (=> b!1538021 m!1419891))

(declare-fun m!1419893 () Bool)

(assert (=> b!1538029 m!1419893))

(assert (=> b!1538029 m!1419893))

(declare-fun m!1419895 () Bool)

(assert (=> b!1538029 m!1419895))

(declare-fun m!1419897 () Bool)

(assert (=> b!1538026 m!1419897))

(declare-fun m!1419899 () Bool)

(assert (=> b!1538028 m!1419899))

(assert (=> b!1538028 m!1419893))

(declare-fun m!1419901 () Bool)

(assert (=> b!1538027 m!1419901))

(assert (=> b!1538027 m!1419901))

(declare-fun m!1419903 () Bool)

(assert (=> b!1538027 m!1419903))

(declare-fun m!1419905 () Bool)

(assert (=> start!131086 m!1419905))

(declare-fun m!1419907 () Bool)

(assert (=> start!131086 m!1419907))

(assert (=> b!1538025 m!1419893))

(assert (=> b!1538025 m!1419893))

(declare-fun m!1419909 () Bool)

(assert (=> b!1538025 m!1419909))

(push 1)

(assert (not b!1538021))

(assert (not b!1538025))

(assert (not b!1538029))

(assert (not b!1538027))

(assert (not b!1538023))

(assert (not start!131086))

(assert (not b!1538026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

