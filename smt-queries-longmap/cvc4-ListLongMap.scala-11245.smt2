; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131142 () Bool)

(assert start!131142)

(declare-fun b!1538415 () Bool)

(declare-fun res!1055396 () Bool)

(declare-fun e!855990 () Bool)

(assert (=> b!1538415 (=> (not res!1055396) (not e!855990))))

(declare-datatypes ((array!102207 0))(
  ( (array!102208 (arr!49318 (Array (_ BitVec 32) (_ BitVec 64))) (size!49868 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102207)

(declare-datatypes ((List!35792 0))(
  ( (Nil!35789) (Cons!35788 (h!37233 (_ BitVec 64)) (t!50486 List!35792)) )
))
(declare-fun arrayNoDuplicates!0 (array!102207 (_ BitVec 32) List!35792) Bool)

(assert (=> b!1538415 (= res!1055396 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35789))))

(declare-fun res!1055393 () Bool)

(assert (=> start!131142 (=> (not res!1055393) (not e!855990))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131142 (= res!1055393 (validMask!0 mask!2480))))

(assert (=> start!131142 e!855990))

(assert (=> start!131142 true))

(declare-fun array_inv!38346 (array!102207) Bool)

(assert (=> start!131142 (array_inv!38346 a!2792)))

(declare-fun b!1538416 () Bool)

(declare-fun res!1055398 () Bool)

(assert (=> b!1538416 (=> (not res!1055398) (not e!855990))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538416 (= res!1055398 (validKeyInArray!0 (select (arr!49318 a!2792) i!951)))))

(declare-fun b!1538417 () Bool)

(assert (=> b!1538417 (= e!855990 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664897 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538417 (= lt!664897 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538418 () Bool)

(declare-fun res!1055394 () Bool)

(assert (=> b!1538418 (=> (not res!1055394) (not e!855990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102207 (_ BitVec 32)) Bool)

(assert (=> b!1538418 (= res!1055394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538419 () Bool)

(declare-fun res!1055401 () Bool)

(assert (=> b!1538419 (=> (not res!1055401) (not e!855990))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1538419 (= res!1055401 (and (= (size!49868 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49868 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49868 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538420 () Bool)

(declare-fun res!1055400 () Bool)

(assert (=> b!1538420 (=> (not res!1055400) (not e!855990))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13444 0))(
  ( (MissingZero!13444 (index!56171 (_ BitVec 32))) (Found!13444 (index!56172 (_ BitVec 32))) (Intermediate!13444 (undefined!14256 Bool) (index!56173 (_ BitVec 32)) (x!137905 (_ BitVec 32))) (Undefined!13444) (MissingVacant!13444 (index!56174 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102207 (_ BitVec 32)) SeekEntryResult!13444)

(assert (=> b!1538420 (= res!1055400 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49318 a!2792) j!64) a!2792 mask!2480) (Found!13444 j!64)))))

(declare-fun b!1538421 () Bool)

(declare-fun res!1055395 () Bool)

(assert (=> b!1538421 (=> (not res!1055395) (not e!855990))))

(assert (=> b!1538421 (= res!1055395 (validKeyInArray!0 (select (arr!49318 a!2792) j!64)))))

(declare-fun b!1538422 () Bool)

(declare-fun res!1055397 () Bool)

(assert (=> b!1538422 (=> (not res!1055397) (not e!855990))))

(assert (=> b!1538422 (= res!1055397 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49868 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49868 a!2792)) (= (select (arr!49318 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538423 () Bool)

(declare-fun res!1055399 () Bool)

(assert (=> b!1538423 (=> (not res!1055399) (not e!855990))))

(assert (=> b!1538423 (= res!1055399 (not (= (select (arr!49318 a!2792) index!463) (select (arr!49318 a!2792) j!64))))))

(assert (= (and start!131142 res!1055393) b!1538419))

(assert (= (and b!1538419 res!1055401) b!1538416))

(assert (= (and b!1538416 res!1055398) b!1538421))

(assert (= (and b!1538421 res!1055395) b!1538418))

(assert (= (and b!1538418 res!1055394) b!1538415))

(assert (= (and b!1538415 res!1055396) b!1538422))

(assert (= (and b!1538422 res!1055397) b!1538420))

(assert (= (and b!1538420 res!1055400) b!1538423))

(assert (= (and b!1538423 res!1055399) b!1538417))

(declare-fun m!1420851 () Bool)

(assert (=> b!1538418 m!1420851))

(declare-fun m!1420853 () Bool)

(assert (=> b!1538415 m!1420853))

(declare-fun m!1420855 () Bool)

(assert (=> b!1538423 m!1420855))

(declare-fun m!1420857 () Bool)

(assert (=> b!1538423 m!1420857))

(declare-fun m!1420859 () Bool)

(assert (=> b!1538422 m!1420859))

(declare-fun m!1420861 () Bool)

(assert (=> b!1538417 m!1420861))

(declare-fun m!1420863 () Bool)

(assert (=> start!131142 m!1420863))

(declare-fun m!1420865 () Bool)

(assert (=> start!131142 m!1420865))

(declare-fun m!1420867 () Bool)

(assert (=> b!1538416 m!1420867))

(assert (=> b!1538416 m!1420867))

(declare-fun m!1420869 () Bool)

(assert (=> b!1538416 m!1420869))

(assert (=> b!1538421 m!1420857))

(assert (=> b!1538421 m!1420857))

(declare-fun m!1420871 () Bool)

(assert (=> b!1538421 m!1420871))

(assert (=> b!1538420 m!1420857))

(assert (=> b!1538420 m!1420857))

(declare-fun m!1420873 () Bool)

(assert (=> b!1538420 m!1420873))

(push 1)

(assert (not start!131142))

(assert (not b!1538415))

(assert (not b!1538420))

(assert (not b!1538416))

(assert (not b!1538421))

(assert (not b!1538418))

(assert (not b!1538417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

