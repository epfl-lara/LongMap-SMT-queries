; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28002 () Bool)

(assert start!28002)

(declare-fun res!149173 () Bool)

(declare-fun e!181968 () Bool)

(assert (=> start!28002 (=> (not res!149173) (not e!181968))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28002 (= res!149173 (validMask!0 mask!3809))))

(assert (=> start!28002 e!181968))

(assert (=> start!28002 true))

(declare-datatypes ((array!14406 0))(
  ( (array!14407 (arr!6833 (Array (_ BitVec 32) (_ BitVec 64))) (size!7185 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14406)

(declare-fun array_inv!4796 (array!14406) Bool)

(assert (=> start!28002 (array_inv!4796 a!3312)))

(declare-fun b!287286 () Bool)

(declare-fun res!149178 () Bool)

(assert (=> b!287286 (=> (not res!149178) (not e!181968))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287286 (= res!149178 (validKeyInArray!0 k!2524))))

(declare-fun b!287287 () Bool)

(declare-fun res!149177 () Bool)

(declare-fun e!181969 () Bool)

(assert (=> b!287287 (=> (not res!149177) (not e!181969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14406 (_ BitVec 32)) Bool)

(assert (=> b!287287 (= res!149177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287288 () Bool)

(declare-fun res!149175 () Bool)

(assert (=> b!287288 (=> (not res!149175) (not e!181968))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287288 (= res!149175 (and (= (size!7185 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7185 a!3312))))))

(declare-fun b!287289 () Bool)

(assert (=> b!287289 (= e!181968 e!181969)))

(declare-fun res!149176 () Bool)

(assert (=> b!287289 (=> (not res!149176) (not e!181969))))

(declare-datatypes ((SeekEntryResult!1982 0))(
  ( (MissingZero!1982 (index!10098 (_ BitVec 32))) (Found!1982 (index!10099 (_ BitVec 32))) (Intermediate!1982 (undefined!2794 Bool) (index!10100 (_ BitVec 32)) (x!28319 (_ BitVec 32))) (Undefined!1982) (MissingVacant!1982 (index!10101 (_ BitVec 32))) )
))
(declare-fun lt!141451 () SeekEntryResult!1982)

(assert (=> b!287289 (= res!149176 (or (= lt!141451 (MissingZero!1982 i!1256)) (= lt!141451 (MissingVacant!1982 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14406 (_ BitVec 32)) SeekEntryResult!1982)

(assert (=> b!287289 (= lt!141451 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287290 () Bool)

(assert (=> b!287290 (= e!181969 (bvslt mask!3809 #b00000000000000000000000000000000))))

(declare-fun lt!141450 () SeekEntryResult!1982)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14406 (_ BitVec 32)) SeekEntryResult!1982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287290 (= lt!141450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!287291 () Bool)

(declare-fun res!149174 () Bool)

(assert (=> b!287291 (=> (not res!149174) (not e!181968))))

(declare-fun arrayContainsKey!0 (array!14406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287291 (= res!149174 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28002 res!149173) b!287288))

(assert (= (and b!287288 res!149175) b!287286))

(assert (= (and b!287286 res!149178) b!287291))

(assert (= (and b!287291 res!149174) b!287289))

(assert (= (and b!287289 res!149176) b!287287))

(assert (= (and b!287287 res!149177) b!287290))

(declare-fun m!301731 () Bool)

(assert (=> start!28002 m!301731))

(declare-fun m!301733 () Bool)

(assert (=> start!28002 m!301733))

(declare-fun m!301735 () Bool)

(assert (=> b!287287 m!301735))

(declare-fun m!301737 () Bool)

(assert (=> b!287291 m!301737))

(declare-fun m!301739 () Bool)

(assert (=> b!287290 m!301739))

(assert (=> b!287290 m!301739))

(declare-fun m!301741 () Bool)

(assert (=> b!287290 m!301741))

(declare-fun m!301743 () Bool)

(assert (=> b!287289 m!301743))

(declare-fun m!301745 () Bool)

(assert (=> b!287286 m!301745))

(push 1)

(assert (not b!287286))

(assert (not start!28002))

(assert (not b!287287))

(assert (not b!287291))

(assert (not b!287289))

(assert (not b!287290))

(check-sat)

(pop 1)

