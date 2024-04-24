; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26448 () Bool)

(assert start!26448)

(declare-fun b!274543 () Bool)

(declare-fun e!175767 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13544 0))(
  ( (array!13545 (arr!6421 (Array (_ BitVec 32) (_ BitVec 64))) (size!6773 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13544)

(assert (=> b!274543 (= e!175767 (bvsle startIndex!26 (size!6773 a!3325)))))

(declare-fun lt!137042 () array!13544)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13544 (_ BitVec 32)) Bool)

(assert (=> b!274543 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!137042 mask!3868)))

(declare-datatypes ((Unit!8627 0))(
  ( (Unit!8628) )
))
(declare-fun lt!137044 () Unit!8627)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13544 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8627)

(assert (=> b!274543 (= lt!137044 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274544 () Bool)

(declare-fun res!138511 () Bool)

(declare-fun e!175765 () Bool)

(assert (=> b!274544 (=> (not res!138511) (not e!175765))))

(declare-datatypes ((List!4142 0))(
  ( (Nil!4139) (Cons!4138 (h!4805 (_ BitVec 64)) (t!9216 List!4142)) )
))
(declare-fun arrayNoDuplicates!0 (array!13544 (_ BitVec 32) List!4142) Bool)

(assert (=> b!274544 (= res!138511 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4139))))

(declare-fun b!274545 () Bool)

(declare-fun res!138513 () Bool)

(assert (=> b!274545 (=> (not res!138513) (not e!175765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274545 (= res!138513 (validKeyInArray!0 k0!2581))))

(declare-fun b!274546 () Bool)

(declare-fun e!175766 () Bool)

(declare-fun e!175769 () Bool)

(assert (=> b!274546 (= e!175766 e!175769)))

(declare-fun res!138508 () Bool)

(assert (=> b!274546 (=> (not res!138508) (not e!175769))))

(assert (=> b!274546 (= res!138508 (not (= startIndex!26 i!1267)))))

(assert (=> b!274546 (= lt!137042 (array!13545 (store (arr!6421 a!3325) i!1267 k0!2581) (size!6773 a!3325)))))

(declare-fun res!138515 () Bool)

(assert (=> start!26448 (=> (not res!138515) (not e!175765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26448 (= res!138515 (validMask!0 mask!3868))))

(assert (=> start!26448 e!175765))

(declare-fun array_inv!4371 (array!13544) Bool)

(assert (=> start!26448 (array_inv!4371 a!3325)))

(assert (=> start!26448 true))

(declare-fun b!274547 () Bool)

(assert (=> b!274547 (= e!175769 (not e!175767))))

(declare-fun res!138509 () Bool)

(assert (=> b!274547 (=> res!138509 e!175767)))

(assert (=> b!274547 (= res!138509 (or (bvsge startIndex!26 (bvsub (size!6773 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274547 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!137041 () Unit!8627)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8627)

(assert (=> b!274547 (= lt!137041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1544 0))(
  ( (MissingZero!1544 (index!8346 (_ BitVec 32))) (Found!1544 (index!8347 (_ BitVec 32))) (Intermediate!1544 (undefined!2356 Bool) (index!8348 (_ BitVec 32)) (x!26749 (_ BitVec 32))) (Undefined!1544) (MissingVacant!1544 (index!8349 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13544 (_ BitVec 32)) SeekEntryResult!1544)

(assert (=> b!274547 (= (seekEntryOrOpen!0 (select (arr!6421 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6421 a!3325) i!1267 k0!2581) startIndex!26) lt!137042 mask!3868))))

(declare-fun lt!137043 () Unit!8627)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13544 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8627)

(assert (=> b!274547 (= lt!137043 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!274547 (arrayNoDuplicates!0 lt!137042 #b00000000000000000000000000000000 Nil!4139)))

(declare-fun lt!137045 () Unit!8627)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4142) Unit!8627)

(assert (=> b!274547 (= lt!137045 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4139))))

(declare-fun b!274548 () Bool)

(declare-fun res!138507 () Bool)

(assert (=> b!274548 (=> (not res!138507) (not e!175765))))

(declare-fun arrayContainsKey!0 (array!13544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274548 (= res!138507 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274549 () Bool)

(assert (=> b!274549 (= e!175765 e!175766)))

(declare-fun res!138510 () Bool)

(assert (=> b!274549 (=> (not res!138510) (not e!175766))))

(declare-fun lt!137046 () SeekEntryResult!1544)

(assert (=> b!274549 (= res!138510 (or (= lt!137046 (MissingZero!1544 i!1267)) (= lt!137046 (MissingVacant!1544 i!1267))))))

(assert (=> b!274549 (= lt!137046 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274550 () Bool)

(declare-fun res!138516 () Bool)

(assert (=> b!274550 (=> (not res!138516) (not e!175765))))

(assert (=> b!274550 (= res!138516 (and (= (size!6773 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6773 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6773 a!3325))))))

(declare-fun b!274551 () Bool)

(declare-fun res!138514 () Bool)

(assert (=> b!274551 (=> (not res!138514) (not e!175769))))

(assert (=> b!274551 (= res!138514 (validKeyInArray!0 (select (arr!6421 a!3325) startIndex!26)))))

(declare-fun b!274552 () Bool)

(declare-fun res!138512 () Bool)

(assert (=> b!274552 (=> (not res!138512) (not e!175766))))

(assert (=> b!274552 (= res!138512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26448 res!138515) b!274550))

(assert (= (and b!274550 res!138516) b!274545))

(assert (= (and b!274545 res!138513) b!274544))

(assert (= (and b!274544 res!138511) b!274548))

(assert (= (and b!274548 res!138507) b!274549))

(assert (= (and b!274549 res!138510) b!274552))

(assert (= (and b!274552 res!138512) b!274546))

(assert (= (and b!274546 res!138508) b!274551))

(assert (= (and b!274551 res!138514) b!274547))

(assert (= (and b!274547 (not res!138509)) b!274543))

(declare-fun m!290243 () Bool)

(assert (=> b!274548 m!290243))

(declare-fun m!290245 () Bool)

(assert (=> b!274549 m!290245))

(declare-fun m!290247 () Bool)

(assert (=> b!274543 m!290247))

(declare-fun m!290249 () Bool)

(assert (=> b!274543 m!290249))

(declare-fun m!290251 () Bool)

(assert (=> b!274545 m!290251))

(declare-fun m!290253 () Bool)

(assert (=> start!26448 m!290253))

(declare-fun m!290255 () Bool)

(assert (=> start!26448 m!290255))

(declare-fun m!290257 () Bool)

(assert (=> b!274546 m!290257))

(declare-fun m!290259 () Bool)

(assert (=> b!274544 m!290259))

(declare-fun m!290261 () Bool)

(assert (=> b!274551 m!290261))

(assert (=> b!274551 m!290261))

(declare-fun m!290263 () Bool)

(assert (=> b!274551 m!290263))

(declare-fun m!290265 () Bool)

(assert (=> b!274547 m!290265))

(declare-fun m!290267 () Bool)

(assert (=> b!274547 m!290267))

(declare-fun m!290269 () Bool)

(assert (=> b!274547 m!290269))

(assert (=> b!274547 m!290257))

(declare-fun m!290271 () Bool)

(assert (=> b!274547 m!290271))

(assert (=> b!274547 m!290261))

(declare-fun m!290273 () Bool)

(assert (=> b!274547 m!290273))

(assert (=> b!274547 m!290261))

(declare-fun m!290275 () Bool)

(assert (=> b!274547 m!290275))

(assert (=> b!274547 m!290269))

(declare-fun m!290277 () Bool)

(assert (=> b!274547 m!290277))

(declare-fun m!290279 () Bool)

(assert (=> b!274547 m!290279))

(declare-fun m!290281 () Bool)

(assert (=> b!274552 m!290281))

(check-sat (not b!274549) (not b!274547) (not start!26448) (not b!274552) (not b!274543) (not b!274545) (not b!274551) (not b!274544) (not b!274548))
(check-sat)
