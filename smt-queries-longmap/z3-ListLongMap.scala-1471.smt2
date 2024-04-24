; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28204 () Bool)

(assert start!28204)

(declare-fun b!288948 () Bool)

(declare-fun e!182940 () Bool)

(declare-fun e!182939 () Bool)

(assert (=> b!288948 (= e!182940 e!182939)))

(declare-fun res!150549 () Bool)

(assert (=> b!288948 (=> (not res!150549) (not e!182939))))

(declare-datatypes ((SeekEntryResult!2003 0))(
  ( (MissingZero!2003 (index!10182 (_ BitVec 32))) (Found!2003 (index!10183 (_ BitVec 32))) (Intermediate!2003 (undefined!2815 Bool) (index!10184 (_ BitVec 32)) (x!28504 (_ BitVec 32))) (Undefined!2003) (MissingVacant!2003 (index!10185 (_ BitVec 32))) )
))
(declare-fun lt!142489 () SeekEntryResult!2003)

(declare-fun lt!142486 () Bool)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((array!14523 0))(
  ( (array!14524 (arr!6889 (Array (_ BitVec 32) (_ BitVec 64))) (size!7241 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14523)

(assert (=> b!288948 (= res!150549 (and (or lt!142486 (not (undefined!2815 lt!142489))) (or lt!142486 (not (= (select (arr!6889 a!3312) (index!10184 lt!142489)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142486 (not (= (select (arr!6889 a!3312) (index!10184 lt!142489)) k0!2524))) (not lt!142486)))))

(get-info :version)

(assert (=> b!288948 (= lt!142486 (not ((_ is Intermediate!2003) lt!142489)))))

(declare-fun res!150545 () Bool)

(declare-fun e!182938 () Bool)

(assert (=> start!28204 (=> (not res!150545) (not e!182938))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28204 (= res!150545 (validMask!0 mask!3809))))

(assert (=> start!28204 e!182938))

(assert (=> start!28204 true))

(declare-fun array_inv!4839 (array!14523) Bool)

(assert (=> start!28204 (array_inv!4839 a!3312)))

(declare-fun b!288949 () Bool)

(declare-fun res!150552 () Bool)

(assert (=> b!288949 (=> (not res!150552) (not e!182938))))

(declare-fun arrayContainsKey!0 (array!14523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288949 (= res!150552 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288950 () Bool)

(declare-fun res!150547 () Bool)

(assert (=> b!288950 (=> (not res!150547) (not e!182938))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288950 (= res!150547 (validKeyInArray!0 k0!2524))))

(declare-fun b!288951 () Bool)

(declare-fun res!150546 () Bool)

(assert (=> b!288951 (=> (not res!150546) (not e!182938))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288951 (= res!150546 (and (= (size!7241 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7241 a!3312))))))

(declare-fun b!288952 () Bool)

(declare-fun e!182941 () Bool)

(assert (=> b!288952 (= e!182941 e!182940)))

(declare-fun res!150550 () Bool)

(assert (=> b!288952 (=> (not res!150550) (not e!182940))))

(declare-fun lt!142488 () Bool)

(assert (=> b!288952 (= res!150550 lt!142488)))

(declare-fun lt!142490 () (_ BitVec 32))

(declare-fun lt!142487 () SeekEntryResult!2003)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14523 (_ BitVec 32)) SeekEntryResult!2003)

(assert (=> b!288952 (= lt!142487 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142490 k0!2524 (array!14524 (store (arr!6889 a!3312) i!1256 k0!2524) (size!7241 a!3312)) mask!3809))))

(assert (=> b!288952 (= lt!142489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142490 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288952 (= lt!142490 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288953 () Bool)

(assert (=> b!288953 (= e!182938 e!182941)))

(declare-fun res!150551 () Bool)

(assert (=> b!288953 (=> (not res!150551) (not e!182941))))

(declare-fun lt!142491 () SeekEntryResult!2003)

(assert (=> b!288953 (= res!150551 (or lt!142488 (= lt!142491 (MissingVacant!2003 i!1256))))))

(assert (=> b!288953 (= lt!142488 (= lt!142491 (MissingZero!2003 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14523 (_ BitVec 32)) SeekEntryResult!2003)

(assert (=> b!288953 (= lt!142491 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288954 () Bool)

(assert (=> b!288954 (= e!182939 (not true))))

(assert (=> b!288954 (and (= (select (arr!6889 a!3312) (index!10184 lt!142489)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10184 lt!142489) i!1256))))

(declare-fun b!288955 () Bool)

(declare-fun res!150548 () Bool)

(assert (=> b!288955 (=> (not res!150548) (not e!182941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14523 (_ BitVec 32)) Bool)

(assert (=> b!288955 (= res!150548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28204 res!150545) b!288951))

(assert (= (and b!288951 res!150546) b!288950))

(assert (= (and b!288950 res!150547) b!288949))

(assert (= (and b!288949 res!150552) b!288953))

(assert (= (and b!288953 res!150551) b!288955))

(assert (= (and b!288955 res!150548) b!288952))

(assert (= (and b!288952 res!150550) b!288948))

(assert (= (and b!288948 res!150549) b!288954))

(declare-fun m!303299 () Bool)

(assert (=> b!288954 m!303299))

(declare-fun m!303301 () Bool)

(assert (=> b!288949 m!303301))

(declare-fun m!303303 () Bool)

(assert (=> start!28204 m!303303))

(declare-fun m!303305 () Bool)

(assert (=> start!28204 m!303305))

(declare-fun m!303307 () Bool)

(assert (=> b!288955 m!303307))

(declare-fun m!303309 () Bool)

(assert (=> b!288952 m!303309))

(declare-fun m!303311 () Bool)

(assert (=> b!288952 m!303311))

(declare-fun m!303313 () Bool)

(assert (=> b!288952 m!303313))

(declare-fun m!303315 () Bool)

(assert (=> b!288952 m!303315))

(declare-fun m!303317 () Bool)

(assert (=> b!288950 m!303317))

(declare-fun m!303319 () Bool)

(assert (=> b!288953 m!303319))

(assert (=> b!288948 m!303299))

(check-sat (not b!288955) (not b!288949) (not b!288952) (not b!288950) (not b!288953) (not start!28204))
(check-sat)
