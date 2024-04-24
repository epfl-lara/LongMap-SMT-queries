; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131494 () Bool)

(assert start!131494)

(declare-fun b!1540340 () Bool)

(declare-fun res!1055852 () Bool)

(declare-fun e!857302 () Bool)

(assert (=> b!1540340 (=> (not res!1055852) (not e!857302))))

(declare-datatypes ((array!102296 0))(
  ( (array!102297 (arr!49356 (Array (_ BitVec 32) (_ BitVec 64))) (size!49907 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102296)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540340 (= res!1055852 (validKeyInArray!0 (select (arr!49356 a!2792) i!951)))))

(declare-fun b!1540341 () Bool)

(declare-fun res!1055851 () Bool)

(assert (=> b!1540341 (=> (not res!1055851) (not e!857302))))

(declare-datatypes ((List!35817 0))(
  ( (Nil!35814) (Cons!35813 (h!37276 (_ BitVec 64)) (t!50503 List!35817)) )
))
(declare-fun arrayNoDuplicates!0 (array!102296 (_ BitVec 32) List!35817) Bool)

(assert (=> b!1540341 (= res!1055851 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35814))))

(declare-fun b!1540342 () Bool)

(declare-fun res!1055856 () Bool)

(assert (=> b!1540342 (=> (not res!1055856) (not e!857302))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1540342 (= res!1055856 (and (= (size!49907 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49907 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49907 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540343 () Bool)

(declare-fun res!1055855 () Bool)

(assert (=> b!1540343 (=> (not res!1055855) (not e!857302))))

(assert (=> b!1540343 (= res!1055855 (validKeyInArray!0 (select (arr!49356 a!2792) j!64)))))

(declare-fun b!1540344 () Bool)

(assert (=> b!1540344 (= e!857302 false)))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13377 0))(
  ( (MissingZero!13377 (index!55903 (_ BitVec 32))) (Found!13377 (index!55904 (_ BitVec 32))) (Intermediate!13377 (undefined!14189 Bool) (index!55905 (_ BitVec 32)) (x!137845 (_ BitVec 32))) (Undefined!13377) (MissingVacant!13377 (index!55906 (_ BitVec 32))) )
))
(declare-fun lt!665712 () SeekEntryResult!13377)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102296 (_ BitVec 32)) SeekEntryResult!13377)

(assert (=> b!1540344 (= lt!665712 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49356 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1055854 () Bool)

(assert (=> start!131494 (=> (not res!1055854) (not e!857302))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131494 (= res!1055854 (validMask!0 mask!2480))))

(assert (=> start!131494 e!857302))

(assert (=> start!131494 true))

(declare-fun array_inv!38637 (array!102296) Bool)

(assert (=> start!131494 (array_inv!38637 a!2792)))

(declare-fun b!1540345 () Bool)

(declare-fun res!1055850 () Bool)

(assert (=> b!1540345 (=> (not res!1055850) (not e!857302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102296 (_ BitVec 32)) Bool)

(assert (=> b!1540345 (= res!1055850 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540346 () Bool)

(declare-fun res!1055853 () Bool)

(assert (=> b!1540346 (=> (not res!1055853) (not e!857302))))

(assert (=> b!1540346 (= res!1055853 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49907 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49907 a!2792)) (= (select (arr!49356 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131494 res!1055854) b!1540342))

(assert (= (and b!1540342 res!1055856) b!1540340))

(assert (= (and b!1540340 res!1055852) b!1540343))

(assert (= (and b!1540343 res!1055855) b!1540345))

(assert (= (and b!1540345 res!1055850) b!1540341))

(assert (= (and b!1540341 res!1055851) b!1540346))

(assert (= (and b!1540346 res!1055853) b!1540344))

(declare-fun m!1422647 () Bool)

(assert (=> b!1540346 m!1422647))

(declare-fun m!1422649 () Bool)

(assert (=> b!1540345 m!1422649))

(declare-fun m!1422651 () Bool)

(assert (=> b!1540340 m!1422651))

(assert (=> b!1540340 m!1422651))

(declare-fun m!1422653 () Bool)

(assert (=> b!1540340 m!1422653))

(declare-fun m!1422655 () Bool)

(assert (=> b!1540341 m!1422655))

(declare-fun m!1422657 () Bool)

(assert (=> start!131494 m!1422657))

(declare-fun m!1422659 () Bool)

(assert (=> start!131494 m!1422659))

(declare-fun m!1422661 () Bool)

(assert (=> b!1540344 m!1422661))

(assert (=> b!1540344 m!1422661))

(declare-fun m!1422663 () Bool)

(assert (=> b!1540344 m!1422663))

(assert (=> b!1540343 m!1422661))

(assert (=> b!1540343 m!1422661))

(declare-fun m!1422665 () Bool)

(assert (=> b!1540343 m!1422665))

(push 1)

(assert (not b!1540341))

(assert (not b!1540345))

(assert (not start!131494))

(assert (not b!1540340))

(assert (not b!1540343))

(assert (not b!1540344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

