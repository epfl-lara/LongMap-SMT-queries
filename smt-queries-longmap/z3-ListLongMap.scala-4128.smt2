; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56298 () Bool)

(assert start!56298)

(declare-fun b!624145 () Bool)

(declare-fun e!357905 () Bool)

(assert (=> b!624145 (= e!357905 false)))

(declare-fun lt!289356 () Bool)

(declare-datatypes ((array!37737 0))(
  ( (array!37738 (arr!18113 (Array (_ BitVec 32) (_ BitVec 64))) (size!18478 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37737)

(declare-datatypes ((List!12193 0))(
  ( (Nil!12190) (Cons!12189 (h!13234 (_ BitVec 64)) (t!18412 List!12193)) )
))
(declare-fun arrayNoDuplicates!0 (array!37737 (_ BitVec 32) List!12193) Bool)

(assert (=> b!624145 (= lt!289356 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12190))))

(declare-fun b!624146 () Bool)

(declare-fun res!402438 () Bool)

(declare-fun e!357906 () Bool)

(assert (=> b!624146 (=> (not res!402438) (not e!357906))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!37737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624146 (= res!402438 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!402441 () Bool)

(assert (=> start!56298 (=> (not res!402441) (not e!357906))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56298 (= res!402441 (validMask!0 mask!3053))))

(assert (=> start!56298 e!357906))

(assert (=> start!56298 true))

(declare-fun array_inv!13996 (array!37737) Bool)

(assert (=> start!56298 (array_inv!13996 a!2986)))

(declare-fun b!624147 () Bool)

(declare-fun res!402440 () Bool)

(assert (=> b!624147 (=> (not res!402440) (not e!357906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624147 (= res!402440 (validKeyInArray!0 k0!1786))))

(declare-fun b!624148 () Bool)

(declare-fun res!402439 () Bool)

(assert (=> b!624148 (=> (not res!402439) (not e!357905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37737 (_ BitVec 32)) Bool)

(assert (=> b!624148 (= res!402439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!624149 () Bool)

(declare-fun res!402443 () Bool)

(assert (=> b!624149 (=> (not res!402443) (not e!357906))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!624149 (= res!402443 (and (= (size!18478 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18478 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18478 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624150 () Bool)

(assert (=> b!624150 (= e!357906 e!357905)))

(declare-fun res!402442 () Bool)

(assert (=> b!624150 (=> (not res!402442) (not e!357905))))

(declare-datatypes ((SeekEntryResult!6550 0))(
  ( (MissingZero!6550 (index!28484 (_ BitVec 32))) (Found!6550 (index!28485 (_ BitVec 32))) (Intermediate!6550 (undefined!7362 Bool) (index!28486 (_ BitVec 32)) (x!57252 (_ BitVec 32))) (Undefined!6550) (MissingVacant!6550 (index!28487 (_ BitVec 32))) )
))
(declare-fun lt!289357 () SeekEntryResult!6550)

(assert (=> b!624150 (= res!402442 (or (= lt!289357 (MissingZero!6550 i!1108)) (= lt!289357 (MissingVacant!6550 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37737 (_ BitVec 32)) SeekEntryResult!6550)

(assert (=> b!624150 (= lt!289357 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624151 () Bool)

(declare-fun res!402437 () Bool)

(assert (=> b!624151 (=> (not res!402437) (not e!357906))))

(assert (=> b!624151 (= res!402437 (validKeyInArray!0 (select (arr!18113 a!2986) j!136)))))

(assert (= (and start!56298 res!402441) b!624149))

(assert (= (and b!624149 res!402443) b!624151))

(assert (= (and b!624151 res!402437) b!624147))

(assert (= (and b!624147 res!402440) b!624146))

(assert (= (and b!624146 res!402438) b!624150))

(assert (= (and b!624150 res!402442) b!624148))

(assert (= (and b!624148 res!402439) b!624145))

(declare-fun m!599353 () Bool)

(assert (=> start!56298 m!599353))

(declare-fun m!599355 () Bool)

(assert (=> start!56298 m!599355))

(declare-fun m!599357 () Bool)

(assert (=> b!624150 m!599357))

(declare-fun m!599359 () Bool)

(assert (=> b!624146 m!599359))

(declare-fun m!599361 () Bool)

(assert (=> b!624145 m!599361))

(declare-fun m!599363 () Bool)

(assert (=> b!624151 m!599363))

(assert (=> b!624151 m!599363))

(declare-fun m!599365 () Bool)

(assert (=> b!624151 m!599365))

(declare-fun m!599367 () Bool)

(assert (=> b!624147 m!599367))

(declare-fun m!599369 () Bool)

(assert (=> b!624148 m!599369))

(check-sat (not b!624147) (not start!56298) (not b!624148) (not b!624145) (not b!624150) (not b!624151) (not b!624146))
(check-sat)
