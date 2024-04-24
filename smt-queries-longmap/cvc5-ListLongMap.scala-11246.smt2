; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131566 () Bool)

(assert start!131566)

(declare-fun b!1540932 () Bool)

(declare-fun res!1056339 () Bool)

(declare-fun e!857517 () Bool)

(assert (=> b!1540932 (=> (not res!1056339) (not e!857517))))

(declare-datatypes ((array!102335 0))(
  ( (array!102336 (arr!49374 (Array (_ BitVec 32) (_ BitVec 64))) (size!49925 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102335)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540932 (= res!1056339 (validKeyInArray!0 (select (arr!49374 a!2792) i!951)))))

(declare-fun b!1540934 () Bool)

(declare-fun res!1056341 () Bool)

(assert (=> b!1540934 (=> (not res!1056341) (not e!857517))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540934 (= res!1056341 (not (= (select (arr!49374 a!2792) index!463) (select (arr!49374 a!2792) j!64))))))

(declare-fun b!1540935 () Bool)

(declare-fun res!1056340 () Bool)

(assert (=> b!1540935 (=> (not res!1056340) (not e!857517))))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1540935 (= res!1056340 (and (= (size!49925 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49925 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49925 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540936 () Bool)

(declare-fun res!1056335 () Bool)

(assert (=> b!1540936 (=> (not res!1056335) (not e!857517))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13395 0))(
  ( (MissingZero!13395 (index!55975 (_ BitVec 32))) (Found!13395 (index!55976 (_ BitVec 32))) (Intermediate!13395 (undefined!14207 Bool) (index!55977 (_ BitVec 32)) (x!137914 (_ BitVec 32))) (Undefined!13395) (MissingVacant!13395 (index!55978 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102335 (_ BitVec 32)) SeekEntryResult!13395)

(assert (=> b!1540936 (= res!1056335 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49374 a!2792) j!64) a!2792 mask!2480) (Found!13395 j!64)))))

(declare-fun b!1540937 () Bool)

(declare-fun res!1056342 () Bool)

(assert (=> b!1540937 (=> (not res!1056342) (not e!857517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102335 (_ BitVec 32)) Bool)

(assert (=> b!1540937 (= res!1056342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540938 () Bool)

(declare-fun res!1056338 () Bool)

(assert (=> b!1540938 (=> (not res!1056338) (not e!857517))))

(declare-datatypes ((List!35835 0))(
  ( (Nil!35832) (Cons!35831 (h!37294 (_ BitVec 64)) (t!50521 List!35835)) )
))
(declare-fun arrayNoDuplicates!0 (array!102335 (_ BitVec 32) List!35835) Bool)

(assert (=> b!1540938 (= res!1056338 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35832))))

(declare-fun b!1540939 () Bool)

(assert (=> b!1540939 (= e!857517 false)))

(declare-fun lt!665817 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540939 (= lt!665817 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1540940 () Bool)

(declare-fun res!1056337 () Bool)

(assert (=> b!1540940 (=> (not res!1056337) (not e!857517))))

(assert (=> b!1540940 (= res!1056337 (validKeyInArray!0 (select (arr!49374 a!2792) j!64)))))

(declare-fun b!1540933 () Bool)

(declare-fun res!1056336 () Bool)

(assert (=> b!1540933 (=> (not res!1056336) (not e!857517))))

(assert (=> b!1540933 (= res!1056336 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49925 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49925 a!2792)) (= (select (arr!49374 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1056334 () Bool)

(assert (=> start!131566 (=> (not res!1056334) (not e!857517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131566 (= res!1056334 (validMask!0 mask!2480))))

(assert (=> start!131566 e!857517))

(assert (=> start!131566 true))

(declare-fun array_inv!38655 (array!102335) Bool)

(assert (=> start!131566 (array_inv!38655 a!2792)))

(assert (= (and start!131566 res!1056334) b!1540935))

(assert (= (and b!1540935 res!1056340) b!1540932))

(assert (= (and b!1540932 res!1056339) b!1540940))

(assert (= (and b!1540940 res!1056337) b!1540937))

(assert (= (and b!1540937 res!1056342) b!1540938))

(assert (= (and b!1540938 res!1056338) b!1540933))

(assert (= (and b!1540933 res!1056336) b!1540936))

(assert (= (and b!1540936 res!1056335) b!1540934))

(assert (= (and b!1540934 res!1056341) b!1540939))

(declare-fun m!1423159 () Bool)

(assert (=> b!1540933 m!1423159))

(declare-fun m!1423161 () Bool)

(assert (=> b!1540937 m!1423161))

(declare-fun m!1423163 () Bool)

(assert (=> b!1540932 m!1423163))

(assert (=> b!1540932 m!1423163))

(declare-fun m!1423165 () Bool)

(assert (=> b!1540932 m!1423165))

(declare-fun m!1423167 () Bool)

(assert (=> b!1540939 m!1423167))

(declare-fun m!1423169 () Bool)

(assert (=> b!1540936 m!1423169))

(assert (=> b!1540936 m!1423169))

(declare-fun m!1423171 () Bool)

(assert (=> b!1540936 m!1423171))

(declare-fun m!1423173 () Bool)

(assert (=> b!1540934 m!1423173))

(assert (=> b!1540934 m!1423169))

(declare-fun m!1423175 () Bool)

(assert (=> start!131566 m!1423175))

(declare-fun m!1423177 () Bool)

(assert (=> start!131566 m!1423177))

(declare-fun m!1423179 () Bool)

(assert (=> b!1540938 m!1423179))

(assert (=> b!1540940 m!1423169))

(assert (=> b!1540940 m!1423169))

(declare-fun m!1423181 () Bool)

(assert (=> b!1540940 m!1423181))

(push 1)

(assert (not b!1540937))

(assert (not b!1540938))

(assert (not b!1540936))

(assert (not b!1540939))

(assert (not b!1540940))

(assert (not start!131566))

(assert (not b!1540932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

