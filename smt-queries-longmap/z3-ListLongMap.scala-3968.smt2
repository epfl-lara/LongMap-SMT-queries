; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53928 () Bool)

(assert start!53928)

(declare-fun b!587922 () Bool)

(declare-fun res!375460 () Bool)

(declare-fun e!335834 () Bool)

(assert (=> b!587922 (=> (not res!375460) (not e!335834))))

(declare-datatypes ((array!36717 0))(
  ( (array!36718 (arr!17629 (Array (_ BitVec 32) (_ BitVec 64))) (size!17993 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36717)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!587922 (= res!375460 (validKeyInArray!0 (select (arr!17629 a!2986) j!136)))))

(declare-fun b!587923 () Bool)

(declare-fun res!375458 () Bool)

(assert (=> b!587923 (=> (not res!375458) (not e!335834))))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!587923 (= res!375458 (validKeyInArray!0 k0!1786))))

(declare-fun b!587924 () Bool)

(declare-fun res!375461 () Bool)

(declare-fun e!335835 () Bool)

(assert (=> b!587924 (=> (not res!375461) (not e!335835))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6025 0))(
  ( (MissingZero!6025 (index!26330 (_ BitVec 32))) (Found!6025 (index!26331 (_ BitVec 32))) (Intermediate!6025 (undefined!6837 Bool) (index!26332 (_ BitVec 32)) (x!55290 (_ BitVec 32))) (Undefined!6025) (MissingVacant!6025 (index!26333 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36717 (_ BitVec 32)) SeekEntryResult!6025)

(assert (=> b!587924 (= res!375461 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17629 a!2986) j!136) a!2986 mask!3053) (Found!6025 j!136)))))

(declare-fun b!587925 () Bool)

(declare-fun res!375463 () Bool)

(assert (=> b!587925 (=> (not res!375463) (not e!335835))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36717 (_ BitVec 32)) Bool)

(assert (=> b!587925 (= res!375463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!587926 () Bool)

(assert (=> b!587926 (= e!335834 e!335835)))

(declare-fun res!375455 () Bool)

(assert (=> b!587926 (=> (not res!375455) (not e!335835))))

(declare-fun lt!266577 () SeekEntryResult!6025)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!587926 (= res!375455 (or (= lt!266577 (MissingZero!6025 i!1108)) (= lt!266577 (MissingVacant!6025 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36717 (_ BitVec 32)) SeekEntryResult!6025)

(assert (=> b!587926 (= lt!266577 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!375456 () Bool)

(assert (=> start!53928 (=> (not res!375456) (not e!335834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53928 (= res!375456 (validMask!0 mask!3053))))

(assert (=> start!53928 e!335834))

(assert (=> start!53928 true))

(declare-fun array_inv!13488 (array!36717) Bool)

(assert (=> start!53928 (array_inv!13488 a!2986)))

(declare-fun b!587927 () Bool)

(assert (=> b!587927 (= e!335835 (not true))))

(declare-fun lt!266578 () (_ BitVec 32))

(assert (=> b!587927 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266578 vacantSpotIndex!68 (select (arr!17629 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266578 vacantSpotIndex!68 (select (store (arr!17629 a!2986) i!1108 k0!1786) j!136) (array!36718 (store (arr!17629 a!2986) i!1108 k0!1786) (size!17993 a!2986)) mask!3053))))

(declare-datatypes ((Unit!18247 0))(
  ( (Unit!18248) )
))
(declare-fun lt!266576 () Unit!18247)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36717 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18247)

(assert (=> b!587927 (= lt!266576 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266578 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!587927 (= lt!266578 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!587928 () Bool)

(declare-fun res!375454 () Bool)

(assert (=> b!587928 (=> (not res!375454) (not e!335835))))

(assert (=> b!587928 (= res!375454 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17629 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17629 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!587929 () Bool)

(declare-fun res!375457 () Bool)

(assert (=> b!587929 (=> (not res!375457) (not e!335835))))

(assert (=> b!587929 (= res!375457 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17629 a!2986) index!984) (select (arr!17629 a!2986) j!136))) (not (= (select (arr!17629 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!587930 () Bool)

(declare-fun res!375462 () Bool)

(assert (=> b!587930 (=> (not res!375462) (not e!335834))))

(assert (=> b!587930 (= res!375462 (and (= (size!17993 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17993 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17993 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!587931 () Bool)

(declare-fun res!375459 () Bool)

(assert (=> b!587931 (=> (not res!375459) (not e!335834))))

(declare-fun arrayContainsKey!0 (array!36717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!587931 (= res!375459 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!587932 () Bool)

(declare-fun res!375453 () Bool)

(assert (=> b!587932 (=> (not res!375453) (not e!335835))))

(declare-datatypes ((List!11577 0))(
  ( (Nil!11574) (Cons!11573 (h!12621 (_ BitVec 64)) (t!17797 List!11577)) )
))
(declare-fun arrayNoDuplicates!0 (array!36717 (_ BitVec 32) List!11577) Bool)

(assert (=> b!587932 (= res!375453 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11574))))

(assert (= (and start!53928 res!375456) b!587930))

(assert (= (and b!587930 res!375462) b!587922))

(assert (= (and b!587922 res!375460) b!587923))

(assert (= (and b!587923 res!375458) b!587931))

(assert (= (and b!587931 res!375459) b!587926))

(assert (= (and b!587926 res!375455) b!587925))

(assert (= (and b!587925 res!375463) b!587932))

(assert (= (and b!587932 res!375453) b!587928))

(assert (= (and b!587928 res!375454) b!587924))

(assert (= (and b!587924 res!375461) b!587929))

(assert (= (and b!587929 res!375457) b!587927))

(declare-fun m!566519 () Bool)

(assert (=> b!587927 m!566519))

(declare-fun m!566521 () Bool)

(assert (=> b!587927 m!566521))

(declare-fun m!566523 () Bool)

(assert (=> b!587927 m!566523))

(declare-fun m!566525 () Bool)

(assert (=> b!587927 m!566525))

(declare-fun m!566527 () Bool)

(assert (=> b!587927 m!566527))

(assert (=> b!587927 m!566525))

(declare-fun m!566529 () Bool)

(assert (=> b!587927 m!566529))

(assert (=> b!587927 m!566523))

(declare-fun m!566531 () Bool)

(assert (=> b!587927 m!566531))

(assert (=> b!587924 m!566525))

(assert (=> b!587924 m!566525))

(declare-fun m!566533 () Bool)

(assert (=> b!587924 m!566533))

(declare-fun m!566535 () Bool)

(assert (=> b!587928 m!566535))

(assert (=> b!587928 m!566527))

(declare-fun m!566537 () Bool)

(assert (=> b!587928 m!566537))

(declare-fun m!566539 () Bool)

(assert (=> start!53928 m!566539))

(declare-fun m!566541 () Bool)

(assert (=> start!53928 m!566541))

(declare-fun m!566543 () Bool)

(assert (=> b!587932 m!566543))

(assert (=> b!587922 m!566525))

(assert (=> b!587922 m!566525))

(declare-fun m!566545 () Bool)

(assert (=> b!587922 m!566545))

(declare-fun m!566547 () Bool)

(assert (=> b!587926 m!566547))

(declare-fun m!566549 () Bool)

(assert (=> b!587925 m!566549))

(declare-fun m!566551 () Bool)

(assert (=> b!587929 m!566551))

(assert (=> b!587929 m!566525))

(declare-fun m!566553 () Bool)

(assert (=> b!587923 m!566553))

(declare-fun m!566555 () Bool)

(assert (=> b!587931 m!566555))

(check-sat (not b!587927) (not b!587932) (not b!587931) (not b!587922) (not b!587923) (not b!587926) (not b!587924) (not start!53928) (not b!587925))
(check-sat)
