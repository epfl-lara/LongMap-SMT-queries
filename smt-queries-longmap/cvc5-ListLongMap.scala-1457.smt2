; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28080 () Bool)

(assert start!28080)

(declare-fun b!287745 () Bool)

(declare-fun res!149511 () Bool)

(declare-fun e!182222 () Bool)

(assert (=> b!287745 (=> (not res!149511) (not e!182222))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14439 0))(
  ( (array!14440 (arr!6848 (Array (_ BitVec 32) (_ BitVec 64))) (size!7200 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14439)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!287745 (= res!149511 (and (= (size!7200 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7200 a!3312))))))

(declare-fun b!287746 () Bool)

(declare-fun res!149514 () Bool)

(assert (=> b!287746 (=> (not res!149514) (not e!182222))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287746 (= res!149514 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!287747 () Bool)

(declare-fun e!182220 () Bool)

(assert (=> b!287747 (= e!182220 false)))

(declare-datatypes ((SeekEntryResult!1997 0))(
  ( (MissingZero!1997 (index!10158 (_ BitVec 32))) (Found!1997 (index!10159 (_ BitVec 32))) (Intermediate!1997 (undefined!2809 Bool) (index!10160 (_ BitVec 32)) (x!28380 (_ BitVec 32))) (Undefined!1997) (MissingVacant!1997 (index!10161 (_ BitVec 32))) )
))
(declare-fun lt!141644 () SeekEntryResult!1997)

(declare-fun lt!141646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14439 (_ BitVec 32)) SeekEntryResult!1997)

(assert (=> b!287747 (= lt!141644 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141646 k!2524 (array!14440 (store (arr!6848 a!3312) i!1256 k!2524) (size!7200 a!3312)) mask!3809))))

(declare-fun lt!141643 () SeekEntryResult!1997)

(assert (=> b!287747 (= lt!141643 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141646 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287747 (= lt!141646 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!149510 () Bool)

(assert (=> start!28080 (=> (not res!149510) (not e!182222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28080 (= res!149510 (validMask!0 mask!3809))))

(assert (=> start!28080 e!182222))

(assert (=> start!28080 true))

(declare-fun array_inv!4811 (array!14439) Bool)

(assert (=> start!28080 (array_inv!4811 a!3312)))

(declare-fun b!287748 () Bool)

(declare-fun res!149512 () Bool)

(assert (=> b!287748 (=> (not res!149512) (not e!182220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14439 (_ BitVec 32)) Bool)

(assert (=> b!287748 (= res!149512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287749 () Bool)

(assert (=> b!287749 (= e!182222 e!182220)))

(declare-fun res!149509 () Bool)

(assert (=> b!287749 (=> (not res!149509) (not e!182220))))

(declare-fun lt!141645 () SeekEntryResult!1997)

(assert (=> b!287749 (= res!149509 (or (= lt!141645 (MissingZero!1997 i!1256)) (= lt!141645 (MissingVacant!1997 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14439 (_ BitVec 32)) SeekEntryResult!1997)

(assert (=> b!287749 (= lt!141645 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287750 () Bool)

(declare-fun res!149513 () Bool)

(assert (=> b!287750 (=> (not res!149513) (not e!182222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287750 (= res!149513 (validKeyInArray!0 k!2524))))

(assert (= (and start!28080 res!149510) b!287745))

(assert (= (and b!287745 res!149511) b!287750))

(assert (= (and b!287750 res!149513) b!287746))

(assert (= (and b!287746 res!149514) b!287749))

(assert (= (and b!287749 res!149509) b!287748))

(assert (= (and b!287748 res!149512) b!287747))

(declare-fun m!302073 () Bool)

(assert (=> b!287747 m!302073))

(declare-fun m!302075 () Bool)

(assert (=> b!287747 m!302075))

(declare-fun m!302077 () Bool)

(assert (=> b!287747 m!302077))

(declare-fun m!302079 () Bool)

(assert (=> b!287747 m!302079))

(declare-fun m!302081 () Bool)

(assert (=> b!287749 m!302081))

(declare-fun m!302083 () Bool)

(assert (=> b!287750 m!302083))

(declare-fun m!302085 () Bool)

(assert (=> b!287748 m!302085))

(declare-fun m!302087 () Bool)

(assert (=> start!28080 m!302087))

(declare-fun m!302089 () Bool)

(assert (=> start!28080 m!302089))

(declare-fun m!302091 () Bool)

(assert (=> b!287746 m!302091))

(push 1)

