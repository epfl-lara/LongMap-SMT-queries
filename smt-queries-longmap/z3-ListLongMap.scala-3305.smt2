; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45762 () Bool)

(assert start!45762)

(declare-fun b!506283 () Bool)

(declare-fun e!296310 () Bool)

(assert (=> b!506283 (= e!296310 true)))

(assert (=> b!506283 false))

(declare-fun b!506284 () Bool)

(declare-fun res!307386 () Bool)

(declare-fun e!296308 () Bool)

(assert (=> b!506284 (=> (not res!307386) (not e!296308))))

(declare-datatypes ((array!32528 0))(
  ( (array!32529 (arr!15644 (Array (_ BitVec 32) (_ BitVec 64))) (size!16009 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32528)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32528 (_ BitVec 32)) Bool)

(assert (=> b!506284 (= res!307386 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506285 () Bool)

(declare-fun e!296307 () Bool)

(assert (=> b!506285 (= e!296308 (not e!296307))))

(declare-fun res!307391 () Bool)

(assert (=> b!506285 (=> res!307391 e!296307)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!230923 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4108 0))(
  ( (MissingZero!4108 (index!18620 (_ BitVec 32))) (Found!4108 (index!18621 (_ BitVec 32))) (Intermediate!4108 (undefined!4920 Bool) (index!18622 (_ BitVec 32)) (x!47632 (_ BitVec 32))) (Undefined!4108) (MissingVacant!4108 (index!18623 (_ BitVec 32))) )
))
(declare-fun lt!230924 () SeekEntryResult!4108)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32528 (_ BitVec 32)) SeekEntryResult!4108)

(assert (=> b!506285 (= res!307391 (= lt!230924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230923 (select (store (arr!15644 a!3235) i!1204 k0!2280) j!176) (array!32529 (store (arr!15644 a!3235) i!1204 k0!2280) (size!16009 a!3235)) mask!3524)))))

(declare-fun lt!230925 () (_ BitVec 32))

(assert (=> b!506285 (= lt!230924 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230925 (select (arr!15644 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506285 (= lt!230923 (toIndex!0 (select (store (arr!15644 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506285 (= lt!230925 (toIndex!0 (select (arr!15644 a!3235) j!176) mask!3524))))

(declare-fun e!296306 () Bool)

(assert (=> b!506285 e!296306))

(declare-fun res!307389 () Bool)

(assert (=> b!506285 (=> (not res!307389) (not e!296306))))

(assert (=> b!506285 (= res!307389 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15490 0))(
  ( (Unit!15491) )
))
(declare-fun lt!230926 () Unit!15490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15490)

(assert (=> b!506285 (= lt!230926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!307390 () Bool)

(declare-fun e!296305 () Bool)

(assert (=> start!45762 (=> (not res!307390) (not e!296305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45762 (= res!307390 (validMask!0 mask!3524))))

(assert (=> start!45762 e!296305))

(assert (=> start!45762 true))

(declare-fun array_inv!11527 (array!32528) Bool)

(assert (=> start!45762 (array_inv!11527 a!3235)))

(declare-fun b!506286 () Bool)

(assert (=> b!506286 (= e!296307 e!296310)))

(declare-fun res!307385 () Bool)

(assert (=> b!506286 (=> res!307385 e!296310)))

(declare-fun lt!230921 () Bool)

(assert (=> b!506286 (= res!307385 (or (and (not lt!230921) (undefined!4920 lt!230924)) (and (not lt!230921) (not (undefined!4920 lt!230924)))))))

(get-info :version)

(assert (=> b!506286 (= lt!230921 (not ((_ is Intermediate!4108) lt!230924)))))

(declare-fun b!506287 () Bool)

(declare-fun res!307392 () Bool)

(assert (=> b!506287 (=> (not res!307392) (not e!296305))))

(declare-fun arrayContainsKey!0 (array!32528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506287 (= res!307392 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506288 () Bool)

(declare-fun res!307393 () Bool)

(assert (=> b!506288 (=> (not res!307393) (not e!296305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506288 (= res!307393 (validKeyInArray!0 (select (arr!15644 a!3235) j!176)))))

(declare-fun b!506289 () Bool)

(assert (=> b!506289 (= e!296305 e!296308)))

(declare-fun res!307394 () Bool)

(assert (=> b!506289 (=> (not res!307394) (not e!296308))))

(declare-fun lt!230922 () SeekEntryResult!4108)

(assert (=> b!506289 (= res!307394 (or (= lt!230922 (MissingZero!4108 i!1204)) (= lt!230922 (MissingVacant!4108 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32528 (_ BitVec 32)) SeekEntryResult!4108)

(assert (=> b!506289 (= lt!230922 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506290 () Bool)

(assert (=> b!506290 (= e!296306 (= (seekEntryOrOpen!0 (select (arr!15644 a!3235) j!176) a!3235 mask!3524) (Found!4108 j!176)))))

(declare-fun b!506291 () Bool)

(declare-fun res!307387 () Bool)

(assert (=> b!506291 (=> (not res!307387) (not e!296305))))

(assert (=> b!506291 (= res!307387 (validKeyInArray!0 k0!2280))))

(declare-fun b!506292 () Bool)

(declare-fun res!307384 () Bool)

(assert (=> b!506292 (=> (not res!307384) (not e!296305))))

(assert (=> b!506292 (= res!307384 (and (= (size!16009 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16009 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16009 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506293 () Bool)

(declare-fun res!307388 () Bool)

(assert (=> b!506293 (=> (not res!307388) (not e!296308))))

(declare-datatypes ((List!9841 0))(
  ( (Nil!9838) (Cons!9837 (h!10714 (_ BitVec 64)) (t!16060 List!9841)) )
))
(declare-fun arrayNoDuplicates!0 (array!32528 (_ BitVec 32) List!9841) Bool)

(assert (=> b!506293 (= res!307388 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9838))))

(assert (= (and start!45762 res!307390) b!506292))

(assert (= (and b!506292 res!307384) b!506288))

(assert (= (and b!506288 res!307393) b!506291))

(assert (= (and b!506291 res!307387) b!506287))

(assert (= (and b!506287 res!307392) b!506289))

(assert (= (and b!506289 res!307394) b!506284))

(assert (= (and b!506284 res!307386) b!506293))

(assert (= (and b!506293 res!307388) b!506285))

(assert (= (and b!506285 res!307389) b!506290))

(assert (= (and b!506285 (not res!307391)) b!506286))

(assert (= (and b!506286 (not res!307385)) b!506283))

(declare-fun m!486475 () Bool)

(assert (=> b!506284 m!486475))

(declare-fun m!486477 () Bool)

(assert (=> b!506293 m!486477))

(declare-fun m!486479 () Bool)

(assert (=> b!506288 m!486479))

(assert (=> b!506288 m!486479))

(declare-fun m!486481 () Bool)

(assert (=> b!506288 m!486481))

(assert (=> b!506290 m!486479))

(assert (=> b!506290 m!486479))

(declare-fun m!486483 () Bool)

(assert (=> b!506290 m!486483))

(declare-fun m!486485 () Bool)

(assert (=> b!506285 m!486485))

(declare-fun m!486487 () Bool)

(assert (=> b!506285 m!486487))

(declare-fun m!486489 () Bool)

(assert (=> b!506285 m!486489))

(assert (=> b!506285 m!486479))

(declare-fun m!486491 () Bool)

(assert (=> b!506285 m!486491))

(assert (=> b!506285 m!486479))

(declare-fun m!486493 () Bool)

(assert (=> b!506285 m!486493))

(assert (=> b!506285 m!486479))

(assert (=> b!506285 m!486489))

(declare-fun m!486495 () Bool)

(assert (=> b!506285 m!486495))

(assert (=> b!506285 m!486489))

(declare-fun m!486497 () Bool)

(assert (=> b!506285 m!486497))

(declare-fun m!486499 () Bool)

(assert (=> b!506285 m!486499))

(declare-fun m!486501 () Bool)

(assert (=> b!506289 m!486501))

(declare-fun m!486503 () Bool)

(assert (=> b!506287 m!486503))

(declare-fun m!486505 () Bool)

(assert (=> b!506291 m!486505))

(declare-fun m!486507 () Bool)

(assert (=> start!45762 m!486507))

(declare-fun m!486509 () Bool)

(assert (=> start!45762 m!486509))

(check-sat (not b!506291) (not b!506290) (not b!506289) (not b!506293) (not b!506285) (not b!506287) (not start!45762) (not b!506288) (not b!506284))
(check-sat)
