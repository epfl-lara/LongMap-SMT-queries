; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56670 () Bool)

(assert start!56670)

(declare-fun b!627558 () Bool)

(declare-fun res!405163 () Bool)

(declare-fun e!359359 () Bool)

(assert (=> b!627558 (=> (not res!405163) (not e!359359))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37905 0))(
  ( (array!37906 (arr!18190 (Array (_ BitVec 32) (_ BitVec 64))) (size!18554 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37905)

(declare-datatypes ((SeekEntryResult!6586 0))(
  ( (MissingZero!6586 (index!28628 (_ BitVec 32))) (Found!6586 (index!28629 (_ BitVec 32))) (Intermediate!6586 (undefined!7398 Bool) (index!28630 (_ BitVec 32)) (x!57521 (_ BitVec 32))) (Undefined!6586) (MissingVacant!6586 (index!28631 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37905 (_ BitVec 32)) SeekEntryResult!6586)

(assert (=> b!627558 (= res!405163 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18190 a!2986) j!136) a!2986 mask!3053) (Found!6586 j!136)))))

(declare-fun b!627559 () Bool)

(declare-fun res!405155 () Bool)

(assert (=> b!627559 (=> (not res!405155) (not e!359359))))

(declare-datatypes ((List!12138 0))(
  ( (Nil!12135) (Cons!12134 (h!13182 (_ BitVec 64)) (t!18358 List!12138)) )
))
(declare-fun arrayNoDuplicates!0 (array!37905 (_ BitVec 32) List!12138) Bool)

(assert (=> b!627559 (= res!405155 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12135))))

(declare-fun b!627560 () Bool)

(declare-fun e!359361 () Bool)

(assert (=> b!627560 (= e!359361 e!359359)))

(declare-fun res!405157 () Bool)

(assert (=> b!627560 (=> (not res!405157) (not e!359359))))

(declare-fun lt!290364 () SeekEntryResult!6586)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!627560 (= res!405157 (or (= lt!290364 (MissingZero!6586 i!1108)) (= lt!290364 (MissingVacant!6586 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37905 (_ BitVec 32)) SeekEntryResult!6586)

(assert (=> b!627560 (= lt!290364 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!627561 () Bool)

(declare-fun res!405161 () Bool)

(assert (=> b!627561 (=> (not res!405161) (not e!359361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!627561 (= res!405161 (validKeyInArray!0 k0!1786))))

(declare-fun b!627562 () Bool)

(assert (=> b!627562 (= e!359359 false)))

(declare-fun lt!290365 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!627562 (= lt!290365 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!405162 () Bool)

(assert (=> start!56670 (=> (not res!405162) (not e!359361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56670 (= res!405162 (validMask!0 mask!3053))))

(assert (=> start!56670 e!359361))

(assert (=> start!56670 true))

(declare-fun array_inv!14049 (array!37905) Bool)

(assert (=> start!56670 (array_inv!14049 a!2986)))

(declare-fun b!627563 () Bool)

(declare-fun res!405160 () Bool)

(assert (=> b!627563 (=> (not res!405160) (not e!359361))))

(assert (=> b!627563 (= res!405160 (validKeyInArray!0 (select (arr!18190 a!2986) j!136)))))

(declare-fun b!627564 () Bool)

(declare-fun res!405156 () Bool)

(assert (=> b!627564 (=> (not res!405156) (not e!359359))))

(assert (=> b!627564 (= res!405156 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18190 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18190 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!627565 () Bool)

(declare-fun res!405154 () Bool)

(assert (=> b!627565 (=> (not res!405154) (not e!359359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37905 (_ BitVec 32)) Bool)

(assert (=> b!627565 (= res!405154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!627566 () Bool)

(declare-fun res!405159 () Bool)

(assert (=> b!627566 (=> (not res!405159) (not e!359359))))

(assert (=> b!627566 (= res!405159 (and (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18190 a!2986) index!984) (select (arr!18190 a!2986) j!136))) (not (= (select (arr!18190 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun b!627567 () Bool)

(declare-fun res!405153 () Bool)

(assert (=> b!627567 (=> (not res!405153) (not e!359361))))

(declare-fun arrayContainsKey!0 (array!37905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!627567 (= res!405153 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!627568 () Bool)

(declare-fun res!405158 () Bool)

(assert (=> b!627568 (=> (not res!405158) (not e!359361))))

(assert (=> b!627568 (= res!405158 (and (= (size!18554 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18554 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18554 a!2986)) (not (= i!1108 j!136))))))

(assert (= (and start!56670 res!405162) b!627568))

(assert (= (and b!627568 res!405158) b!627563))

(assert (= (and b!627563 res!405160) b!627561))

(assert (= (and b!627561 res!405161) b!627567))

(assert (= (and b!627567 res!405153) b!627560))

(assert (= (and b!627560 res!405157) b!627565))

(assert (= (and b!627565 res!405154) b!627559))

(assert (= (and b!627559 res!405155) b!627564))

(assert (= (and b!627564 res!405156) b!627558))

(assert (= (and b!627558 res!405163) b!627566))

(assert (= (and b!627566 res!405159) b!627562))

(declare-fun m!603157 () Bool)

(assert (=> b!627564 m!603157))

(declare-fun m!603159 () Bool)

(assert (=> b!627564 m!603159))

(declare-fun m!603161 () Bool)

(assert (=> b!627564 m!603161))

(declare-fun m!603163 () Bool)

(assert (=> b!627558 m!603163))

(assert (=> b!627558 m!603163))

(declare-fun m!603165 () Bool)

(assert (=> b!627558 m!603165))

(declare-fun m!603167 () Bool)

(assert (=> b!627562 m!603167))

(declare-fun m!603169 () Bool)

(assert (=> b!627566 m!603169))

(assert (=> b!627566 m!603163))

(declare-fun m!603171 () Bool)

(assert (=> start!56670 m!603171))

(declare-fun m!603173 () Bool)

(assert (=> start!56670 m!603173))

(declare-fun m!603175 () Bool)

(assert (=> b!627559 m!603175))

(assert (=> b!627563 m!603163))

(assert (=> b!627563 m!603163))

(declare-fun m!603177 () Bool)

(assert (=> b!627563 m!603177))

(declare-fun m!603179 () Bool)

(assert (=> b!627567 m!603179))

(declare-fun m!603181 () Bool)

(assert (=> b!627561 m!603181))

(declare-fun m!603183 () Bool)

(assert (=> b!627565 m!603183))

(declare-fun m!603185 () Bool)

(assert (=> b!627560 m!603185))

(check-sat (not b!627561) (not b!627563) (not b!627558) (not b!627560) (not b!627559) (not start!56670) (not b!627567) (not b!627562) (not b!627565))
(check-sat)
