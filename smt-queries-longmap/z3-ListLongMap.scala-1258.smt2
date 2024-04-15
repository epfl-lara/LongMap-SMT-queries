; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26108 () Bool)

(assert start!26108)

(declare-fun b!269192 () Bool)

(declare-fun res!133468 () Bool)

(declare-fun e!173703 () Bool)

(assert (=> b!269192 (=> (not res!133468) (not e!173703))))

(declare-datatypes ((array!13194 0))(
  ( (array!13195 (arr!6246 (Array (_ BitVec 32) (_ BitVec 64))) (size!6599 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13194)

(declare-datatypes ((List!4027 0))(
  ( (Nil!4024) (Cons!4023 (h!4690 (_ BitVec 64)) (t!9100 List!4027)) )
))
(declare-fun arrayNoDuplicates!0 (array!13194 (_ BitVec 32) List!4027) Bool)

(assert (=> b!269192 (= res!133468 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4024))))

(declare-fun b!269193 () Bool)

(declare-fun res!133469 () Bool)

(assert (=> b!269193 (=> (not res!133469) (not e!173703))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!269193 (= res!133469 (validKeyInArray!0 k0!2581))))

(declare-fun b!269194 () Bool)

(declare-fun res!133465 () Bool)

(assert (=> b!269194 (=> (not res!133465) (not e!173703))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!269194 (= res!133465 (and (= (size!6599 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6599 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6599 a!3325))))))

(declare-fun b!269195 () Bool)

(declare-datatypes ((Unit!8286 0))(
  ( (Unit!8287) )
))
(declare-fun e!173704 () Unit!8286)

(declare-fun Unit!8288 () Unit!8286)

(assert (=> b!269195 (= e!173704 Unit!8288)))

(declare-fun b!269196 () Bool)

(declare-fun e!173705 () Bool)

(assert (=> b!269196 (= e!173703 e!173705)))

(declare-fun res!133464 () Bool)

(assert (=> b!269196 (=> (not res!133464) (not e!173705))))

(declare-datatypes ((SeekEntryResult!1403 0))(
  ( (MissingZero!1403 (index!7782 (_ BitVec 32))) (Found!1403 (index!7783 (_ BitVec 32))) (Intermediate!1403 (undefined!2215 Bool) (index!7784 (_ BitVec 32)) (x!26151 (_ BitVec 32))) (Undefined!1403) (MissingVacant!1403 (index!7785 (_ BitVec 32))) )
))
(declare-fun lt!134988 () SeekEntryResult!1403)

(assert (=> b!269196 (= res!133464 (or (= lt!134988 (MissingZero!1403 i!1267)) (= lt!134988 (MissingVacant!1403 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13194 (_ BitVec 32)) SeekEntryResult!1403)

(assert (=> b!269196 (= lt!134988 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!269197 () Bool)

(declare-fun res!133467 () Bool)

(assert (=> b!269197 (=> (not res!133467) (not e!173705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13194 (_ BitVec 32)) Bool)

(assert (=> b!269197 (= res!133467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!269198 () Bool)

(assert (=> b!269198 (= e!173705 false)))

(declare-fun lt!134986 () Unit!8286)

(assert (=> b!269198 (= lt!134986 e!173704)))

(declare-fun c!45415 () Bool)

(assert (=> b!269198 (= c!45415 (bvslt startIndex!26 (bvsub (size!6599 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!269200 () Bool)

(declare-fun res!133466 () Bool)

(assert (=> b!269200 (=> (not res!133466) (not e!173705))))

(assert (=> b!269200 (= res!133466 (= startIndex!26 i!1267))))

(declare-fun b!269201 () Bool)

(declare-fun res!133471 () Bool)

(assert (=> b!269201 (=> (not res!133471) (not e!173703))))

(declare-fun arrayContainsKey!0 (array!13194 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!269201 (= res!133471 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!133470 () Bool)

(assert (=> start!26108 (=> (not res!133470) (not e!173703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26108 (= res!133470 (validMask!0 mask!3868))))

(assert (=> start!26108 e!173703))

(declare-fun array_inv!4218 (array!13194) Bool)

(assert (=> start!26108 (array_inv!4218 a!3325)))

(assert (=> start!26108 true))

(declare-fun b!269199 () Bool)

(declare-fun lt!134987 () Unit!8286)

(assert (=> b!269199 (= e!173704 lt!134987)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13194 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8286)

(assert (=> b!269199 (= lt!134987 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!269199 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13195 (store (arr!6246 a!3325) i!1267 k0!2581) (size!6599 a!3325)) mask!3868)))

(assert (= (and start!26108 res!133470) b!269194))

(assert (= (and b!269194 res!133465) b!269193))

(assert (= (and b!269193 res!133469) b!269192))

(assert (= (and b!269192 res!133468) b!269201))

(assert (= (and b!269201 res!133471) b!269196))

(assert (= (and b!269196 res!133464) b!269197))

(assert (= (and b!269197 res!133467) b!269200))

(assert (= (and b!269200 res!133466) b!269198))

(assert (= (and b!269198 c!45415) b!269199))

(assert (= (and b!269198 (not c!45415)) b!269195))

(declare-fun m!284639 () Bool)

(assert (=> b!269192 m!284639))

(declare-fun m!284641 () Bool)

(assert (=> b!269196 m!284641))

(declare-fun m!284643 () Bool)

(assert (=> b!269201 m!284643))

(declare-fun m!284645 () Bool)

(assert (=> b!269193 m!284645))

(declare-fun m!284647 () Bool)

(assert (=> b!269197 m!284647))

(declare-fun m!284649 () Bool)

(assert (=> b!269199 m!284649))

(declare-fun m!284651 () Bool)

(assert (=> b!269199 m!284651))

(declare-fun m!284653 () Bool)

(assert (=> b!269199 m!284653))

(declare-fun m!284655 () Bool)

(assert (=> start!26108 m!284655))

(declare-fun m!284657 () Bool)

(assert (=> start!26108 m!284657))

(check-sat (not b!269196) (not b!269199) (not start!26108) (not b!269192) (not b!269197) (not b!269193) (not b!269201))
(check-sat)
