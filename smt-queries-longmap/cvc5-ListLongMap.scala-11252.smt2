; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131602 () Bool)

(assert start!131602)

(declare-fun b!1541418 () Bool)

(declare-fun res!1056820 () Bool)

(declare-fun e!857626 () Bool)

(assert (=> b!1541418 (=> (not res!1056820) (not e!857626))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102371 0))(
  ( (array!102372 (arr!49392 (Array (_ BitVec 32) (_ BitVec 64))) (size!49943 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102371)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13413 0))(
  ( (MissingZero!13413 (index!56047 (_ BitVec 32))) (Found!13413 (index!56048 (_ BitVec 32))) (Intermediate!13413 (undefined!14225 Bool) (index!56049 (_ BitVec 32)) (x!137980 (_ BitVec 32))) (Undefined!13413) (MissingVacant!13413 (index!56050 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102371 (_ BitVec 32)) SeekEntryResult!13413)

(assert (=> b!1541418 (= res!1056820 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49392 a!2792) j!64) a!2792 mask!2480) (Found!13413 j!64)))))

(declare-fun b!1541419 () Bool)

(declare-fun res!1056822 () Bool)

(assert (=> b!1541419 (=> (not res!1056822) (not e!857626))))

(declare-datatypes ((List!35853 0))(
  ( (Nil!35850) (Cons!35849 (h!37312 (_ BitVec 64)) (t!50539 List!35853)) )
))
(declare-fun arrayNoDuplicates!0 (array!102371 (_ BitVec 32) List!35853) Bool)

(assert (=> b!1541419 (= res!1056822 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35850))))

(declare-fun b!1541420 () Bool)

(assert (=> b!1541420 (= e!857626 false)))

(declare-fun lt!665871 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1541420 (= lt!665871 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1541421 () Bool)

(declare-fun res!1056827 () Bool)

(assert (=> b!1541421 (=> (not res!1056827) (not e!857626))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1541421 (= res!1056827 (and (= (size!49943 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49943 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49943 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1056823 () Bool)

(assert (=> start!131602 (=> (not res!1056823) (not e!857626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131602 (= res!1056823 (validMask!0 mask!2480))))

(assert (=> start!131602 e!857626))

(assert (=> start!131602 true))

(declare-fun array_inv!38673 (array!102371) Bool)

(assert (=> start!131602 (array_inv!38673 a!2792)))

(declare-fun b!1541422 () Bool)

(declare-fun res!1056826 () Bool)

(assert (=> b!1541422 (=> (not res!1056826) (not e!857626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541422 (= res!1056826 (validKeyInArray!0 (select (arr!49392 a!2792) j!64)))))

(declare-fun b!1541423 () Bool)

(declare-fun res!1056828 () Bool)

(assert (=> b!1541423 (=> (not res!1056828) (not e!857626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102371 (_ BitVec 32)) Bool)

(assert (=> b!1541423 (= res!1056828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1541424 () Bool)

(declare-fun res!1056825 () Bool)

(assert (=> b!1541424 (=> (not res!1056825) (not e!857626))))

(assert (=> b!1541424 (= res!1056825 (validKeyInArray!0 (select (arr!49392 a!2792) i!951)))))

(declare-fun b!1541425 () Bool)

(declare-fun res!1056824 () Bool)

(assert (=> b!1541425 (=> (not res!1056824) (not e!857626))))

(assert (=> b!1541425 (= res!1056824 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49943 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49943 a!2792)) (= (select (arr!49392 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1541426 () Bool)

(declare-fun res!1056821 () Bool)

(assert (=> b!1541426 (=> (not res!1056821) (not e!857626))))

(assert (=> b!1541426 (= res!1056821 (not (= (select (arr!49392 a!2792) index!463) (select (arr!49392 a!2792) j!64))))))

(assert (= (and start!131602 res!1056823) b!1541421))

(assert (= (and b!1541421 res!1056827) b!1541424))

(assert (= (and b!1541424 res!1056825) b!1541422))

(assert (= (and b!1541422 res!1056826) b!1541423))

(assert (= (and b!1541423 res!1056828) b!1541419))

(assert (= (and b!1541419 res!1056822) b!1541425))

(assert (= (and b!1541425 res!1056824) b!1541418))

(assert (= (and b!1541418 res!1056820) b!1541426))

(assert (= (and b!1541426 res!1056821) b!1541420))

(declare-fun m!1423591 () Bool)

(assert (=> b!1541424 m!1423591))

(assert (=> b!1541424 m!1423591))

(declare-fun m!1423593 () Bool)

(assert (=> b!1541424 m!1423593))

(declare-fun m!1423595 () Bool)

(assert (=> b!1541419 m!1423595))

(declare-fun m!1423597 () Bool)

(assert (=> b!1541422 m!1423597))

(assert (=> b!1541422 m!1423597))

(declare-fun m!1423599 () Bool)

(assert (=> b!1541422 m!1423599))

(declare-fun m!1423601 () Bool)

(assert (=> b!1541423 m!1423601))

(assert (=> b!1541418 m!1423597))

(assert (=> b!1541418 m!1423597))

(declare-fun m!1423603 () Bool)

(assert (=> b!1541418 m!1423603))

(declare-fun m!1423605 () Bool)

(assert (=> b!1541426 m!1423605))

(assert (=> b!1541426 m!1423597))

(declare-fun m!1423607 () Bool)

(assert (=> b!1541425 m!1423607))

(declare-fun m!1423609 () Bool)

(assert (=> b!1541420 m!1423609))

(declare-fun m!1423611 () Bool)

(assert (=> start!131602 m!1423611))

(declare-fun m!1423613 () Bool)

(assert (=> start!131602 m!1423613))

(push 1)

(assert (not b!1541418))

(assert (not start!131602))

(assert (not b!1541419))

(assert (not b!1541424))

(assert (not b!1541422))

(assert (not b!1541420))

(assert (not b!1541423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

