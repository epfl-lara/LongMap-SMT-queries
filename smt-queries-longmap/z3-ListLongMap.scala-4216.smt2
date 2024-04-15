; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57800 () Bool)

(assert start!57800)

(declare-fun b!639123 () Bool)

(declare-fun res!413833 () Bool)

(declare-fun e!365767 () Bool)

(assert (=> b!639123 (=> (not res!413833) (not e!365767))))

(declare-datatypes ((array!38313 0))(
  ( (array!38314 (arr!18377 (Array (_ BitVec 32) (_ BitVec 64))) (size!18742 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38313)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38313 (_ BitVec 32)) Bool)

(assert (=> b!639123 (= res!413833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!639124 () Bool)

(declare-fun res!413834 () Bool)

(declare-fun e!365758 () Bool)

(assert (=> b!639124 (=> (not res!413834) (not e!365758))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!639124 (= res!413834 (validKeyInArray!0 k0!1786))))

(declare-fun b!639125 () Bool)

(declare-fun e!365765 () Bool)

(declare-fun e!365768 () Bool)

(assert (=> b!639125 (= e!365765 e!365768)))

(declare-fun res!413832 () Bool)

(assert (=> b!639125 (=> res!413832 e!365768)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!295543 () (_ BitVec 64))

(declare-fun lt!295548 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!639125 (= res!413832 (or (not (= (select (arr!18377 a!2986) j!136) lt!295548)) (not (= (select (arr!18377 a!2986) j!136) lt!295543)) (bvsge j!136 index!984)))))

(declare-fun e!365761 () Bool)

(assert (=> b!639125 e!365761))

(declare-fun res!413842 () Bool)

(assert (=> b!639125 (=> (not res!413842) (not e!365761))))

(assert (=> b!639125 (= res!413842 (= lt!295543 (select (arr!18377 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!639125 (= lt!295543 (select (store (arr!18377 a!2986) i!1108 k0!1786) index!984))))

(declare-fun res!413829 () Bool)

(assert (=> start!57800 (=> (not res!413829) (not e!365758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57800 (= res!413829 (validMask!0 mask!3053))))

(assert (=> start!57800 e!365758))

(assert (=> start!57800 true))

(declare-fun array_inv!14260 (array!38313) Bool)

(assert (=> start!57800 (array_inv!14260 a!2986)))

(declare-fun b!639126 () Bool)

(declare-datatypes ((Unit!21584 0))(
  ( (Unit!21585) )
))
(declare-fun e!365757 () Unit!21584)

(declare-fun Unit!21586 () Unit!21584)

(assert (=> b!639126 (= e!365757 Unit!21586)))

(declare-fun b!639127 () Bool)

(declare-fun res!413840 () Bool)

(assert (=> b!639127 (=> (not res!413840) (not e!365758))))

(declare-fun arrayContainsKey!0 (array!38313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!639127 (= res!413840 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!639128 () Bool)

(declare-fun e!365766 () Bool)

(declare-fun e!365760 () Bool)

(assert (=> b!639128 (= e!365766 e!365760)))

(declare-fun res!413839 () Bool)

(assert (=> b!639128 (=> (not res!413839) (not e!365760))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6814 0))(
  ( (MissingZero!6814 (index!29573 (_ BitVec 32))) (Found!6814 (index!29574 (_ BitVec 32))) (Intermediate!6814 (undefined!7626 Bool) (index!29575 (_ BitVec 32)) (x!58340 (_ BitVec 32))) (Undefined!6814) (MissingVacant!6814 (index!29576 (_ BitVec 32))) )
))
(declare-fun lt!295545 () SeekEntryResult!6814)

(assert (=> b!639128 (= res!413839 (and (= lt!295545 (Found!6814 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18377 a!2986) index!984) (select (arr!18377 a!2986) j!136))) (not (= (select (arr!18377 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38313 (_ BitVec 32)) SeekEntryResult!6814)

(assert (=> b!639128 (= lt!295545 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18377 a!2986) j!136) a!2986 mask!3053))))

(declare-fun lt!295549 () array!38313)

(declare-fun b!639129 () Bool)

(declare-fun e!365759 () Bool)

(assert (=> b!639129 (= e!365759 (arrayContainsKey!0 lt!295549 (select (arr!18377 a!2986) j!136) index!984))))

(declare-fun b!639130 () Bool)

(assert (=> b!639130 (= e!365758 e!365767)))

(declare-fun res!413831 () Bool)

(assert (=> b!639130 (=> (not res!413831) (not e!365767))))

(declare-fun lt!295547 () SeekEntryResult!6814)

(assert (=> b!639130 (= res!413831 (or (= lt!295547 (MissingZero!6814 i!1108)) (= lt!295547 (MissingVacant!6814 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38313 (_ BitVec 32)) SeekEntryResult!6814)

(assert (=> b!639130 (= lt!295547 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!639131 () Bool)

(declare-fun e!365763 () Bool)

(assert (=> b!639131 (= e!365763 e!365759)))

(declare-fun res!413843 () Bool)

(assert (=> b!639131 (=> (not res!413843) (not e!365759))))

(assert (=> b!639131 (= res!413843 (arrayContainsKey!0 lt!295549 (select (arr!18377 a!2986) j!136) j!136))))

(declare-fun b!639132 () Bool)

(assert (=> b!639132 (= e!365761 e!365763)))

(declare-fun res!413836 () Bool)

(assert (=> b!639132 (=> res!413836 e!365763)))

(assert (=> b!639132 (= res!413836 (or (not (= (select (arr!18377 a!2986) j!136) lt!295548)) (not (= (select (arr!18377 a!2986) j!136) lt!295543)) (bvsge j!136 index!984)))))

(declare-fun b!639133 () Bool)

(declare-fun e!365762 () Bool)

(declare-fun lt!295554 () SeekEntryResult!6814)

(assert (=> b!639133 (= e!365762 (= lt!295545 lt!295554))))

(declare-fun b!639134 () Bool)

(assert (=> b!639134 (= e!365768 (or (bvsge (size!18742 a!2986) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!18742 a!2986)) (bvsle j!136 (size!18742 a!2986))))))

(declare-datatypes ((List!12457 0))(
  ( (Nil!12454) (Cons!12453 (h!13498 (_ BitVec 64)) (t!18676 List!12457)) )
))
(declare-fun arrayNoDuplicates!0 (array!38313 (_ BitVec 32) List!12457) Bool)

(assert (=> b!639134 (arrayNoDuplicates!0 lt!295549 #b00000000000000000000000000000000 Nil!12454)))

(declare-fun lt!295546 () Unit!21584)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38313 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12457) Unit!21584)

(assert (=> b!639134 (= lt!295546 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12454))))

(assert (=> b!639134 (arrayContainsKey!0 lt!295549 (select (arr!18377 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!295550 () Unit!21584)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38313 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21584)

(assert (=> b!639134 (= lt!295550 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!295549 (select (arr!18377 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!639135 () Bool)

(assert (=> b!639135 (= e!365760 (not e!365765))))

(declare-fun res!413838 () Bool)

(assert (=> b!639135 (=> res!413838 e!365765)))

(declare-fun lt!295553 () SeekEntryResult!6814)

(assert (=> b!639135 (= res!413838 (not (= lt!295553 (Found!6814 index!984))))))

(declare-fun lt!295544 () Unit!21584)

(assert (=> b!639135 (= lt!295544 e!365757)))

(declare-fun c!73014 () Bool)

(assert (=> b!639135 (= c!73014 (= lt!295553 Undefined!6814))))

(assert (=> b!639135 (= lt!295553 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!295548 lt!295549 mask!3053))))

(assert (=> b!639135 e!365762))

(declare-fun res!413841 () Bool)

(assert (=> b!639135 (=> (not res!413841) (not e!365762))))

(declare-fun lt!295552 () (_ BitVec 32))

(assert (=> b!639135 (= res!413841 (= lt!295554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295552 vacantSpotIndex!68 lt!295548 lt!295549 mask!3053)))))

(assert (=> b!639135 (= lt!295554 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!295552 vacantSpotIndex!68 (select (arr!18377 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!639135 (= lt!295548 (select (store (arr!18377 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!295551 () Unit!21584)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21584)

(assert (=> b!639135 (= lt!295551 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!295552 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!639135 (= lt!295552 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!639136 () Bool)

(assert (=> b!639136 (= e!365767 e!365766)))

(declare-fun res!413835 () Bool)

(assert (=> b!639136 (=> (not res!413835) (not e!365766))))

(assert (=> b!639136 (= res!413835 (= (select (store (arr!18377 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!639136 (= lt!295549 (array!38314 (store (arr!18377 a!2986) i!1108 k0!1786) (size!18742 a!2986)))))

(declare-fun b!639137 () Bool)

(declare-fun res!413830 () Bool)

(assert (=> b!639137 (=> (not res!413830) (not e!365758))))

(assert (=> b!639137 (= res!413830 (validKeyInArray!0 (select (arr!18377 a!2986) j!136)))))

(declare-fun b!639138 () Bool)

(declare-fun res!413844 () Bool)

(assert (=> b!639138 (=> (not res!413844) (not e!365758))))

(assert (=> b!639138 (= res!413844 (and (= (size!18742 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18742 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18742 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!639139 () Bool)

(declare-fun res!413845 () Bool)

(assert (=> b!639139 (=> (not res!413845) (not e!365767))))

(assert (=> b!639139 (= res!413845 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18377 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!639140 () Bool)

(declare-fun res!413837 () Bool)

(assert (=> b!639140 (=> (not res!413837) (not e!365767))))

(assert (=> b!639140 (= res!413837 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12454))))

(declare-fun b!639141 () Bool)

(declare-fun Unit!21587 () Unit!21584)

(assert (=> b!639141 (= e!365757 Unit!21587)))

(assert (=> b!639141 false))

(assert (= (and start!57800 res!413829) b!639138))

(assert (= (and b!639138 res!413844) b!639137))

(assert (= (and b!639137 res!413830) b!639124))

(assert (= (and b!639124 res!413834) b!639127))

(assert (= (and b!639127 res!413840) b!639130))

(assert (= (and b!639130 res!413831) b!639123))

(assert (= (and b!639123 res!413833) b!639140))

(assert (= (and b!639140 res!413837) b!639139))

(assert (= (and b!639139 res!413845) b!639136))

(assert (= (and b!639136 res!413835) b!639128))

(assert (= (and b!639128 res!413839) b!639135))

(assert (= (and b!639135 res!413841) b!639133))

(assert (= (and b!639135 c!73014) b!639141))

(assert (= (and b!639135 (not c!73014)) b!639126))

(assert (= (and b!639135 (not res!413838)) b!639125))

(assert (= (and b!639125 res!413842) b!639132))

(assert (= (and b!639132 (not res!413836)) b!639131))

(assert (= (and b!639131 res!413843) b!639129))

(assert (= (and b!639125 (not res!413832)) b!639134))

(declare-fun m!612501 () Bool)

(assert (=> b!639140 m!612501))

(declare-fun m!612503 () Bool)

(assert (=> b!639135 m!612503))

(declare-fun m!612505 () Bool)

(assert (=> b!639135 m!612505))

(declare-fun m!612507 () Bool)

(assert (=> b!639135 m!612507))

(declare-fun m!612509 () Bool)

(assert (=> b!639135 m!612509))

(declare-fun m!612511 () Bool)

(assert (=> b!639135 m!612511))

(assert (=> b!639135 m!612507))

(declare-fun m!612513 () Bool)

(assert (=> b!639135 m!612513))

(declare-fun m!612515 () Bool)

(assert (=> b!639135 m!612515))

(declare-fun m!612517 () Bool)

(assert (=> b!639135 m!612517))

(assert (=> b!639136 m!612509))

(declare-fun m!612519 () Bool)

(assert (=> b!639136 m!612519))

(assert (=> b!639134 m!612507))

(assert (=> b!639134 m!612507))

(declare-fun m!612521 () Bool)

(assert (=> b!639134 m!612521))

(declare-fun m!612523 () Bool)

(assert (=> b!639134 m!612523))

(assert (=> b!639134 m!612507))

(declare-fun m!612525 () Bool)

(assert (=> b!639134 m!612525))

(declare-fun m!612527 () Bool)

(assert (=> b!639134 m!612527))

(declare-fun m!612529 () Bool)

(assert (=> b!639124 m!612529))

(assert (=> b!639125 m!612507))

(assert (=> b!639125 m!612509))

(declare-fun m!612531 () Bool)

(assert (=> b!639125 m!612531))

(assert (=> b!639132 m!612507))

(declare-fun m!612533 () Bool)

(assert (=> b!639139 m!612533))

(assert (=> b!639131 m!612507))

(assert (=> b!639131 m!612507))

(declare-fun m!612535 () Bool)

(assert (=> b!639131 m!612535))

(assert (=> b!639137 m!612507))

(assert (=> b!639137 m!612507))

(declare-fun m!612537 () Bool)

(assert (=> b!639137 m!612537))

(declare-fun m!612539 () Bool)

(assert (=> b!639130 m!612539))

(declare-fun m!612541 () Bool)

(assert (=> start!57800 m!612541))

(declare-fun m!612543 () Bool)

(assert (=> start!57800 m!612543))

(declare-fun m!612545 () Bool)

(assert (=> b!639127 m!612545))

(declare-fun m!612547 () Bool)

(assert (=> b!639123 m!612547))

(declare-fun m!612549 () Bool)

(assert (=> b!639128 m!612549))

(assert (=> b!639128 m!612507))

(assert (=> b!639128 m!612507))

(declare-fun m!612551 () Bool)

(assert (=> b!639128 m!612551))

(assert (=> b!639129 m!612507))

(assert (=> b!639129 m!612507))

(declare-fun m!612553 () Bool)

(assert (=> b!639129 m!612553))

(check-sat (not start!57800) (not b!639131) (not b!639137) (not b!639123) (not b!639135) (not b!639128) (not b!639130) (not b!639124) (not b!639134) (not b!639127) (not b!639129) (not b!639140))
(check-sat)
