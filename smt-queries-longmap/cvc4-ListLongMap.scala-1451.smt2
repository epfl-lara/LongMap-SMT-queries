; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28000 () Bool)

(assert start!28000)

(declare-fun res!149158 () Bool)

(declare-fun e!181961 () Bool)

(assert (=> start!28000 (=> (not res!149158) (not e!181961))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28000 (= res!149158 (validMask!0 mask!3809))))

(assert (=> start!28000 e!181961))

(assert (=> start!28000 true))

(declare-datatypes ((array!14404 0))(
  ( (array!14405 (arr!6832 (Array (_ BitVec 32) (_ BitVec 64))) (size!7184 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14404)

(declare-fun array_inv!4795 (array!14404) Bool)

(assert (=> start!28000 (array_inv!4795 a!3312)))

(declare-fun b!287268 () Bool)

(declare-fun res!149159 () Bool)

(assert (=> b!287268 (=> (not res!149159) (not e!181961))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!287268 (= res!149159 (validKeyInArray!0 k!2524))))

(declare-fun b!287269 () Bool)

(declare-fun res!149155 () Bool)

(declare-fun e!181960 () Bool)

(assert (=> b!287269 (=> (not res!149155) (not e!181960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14404 (_ BitVec 32)) Bool)

(assert (=> b!287269 (= res!149155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!287270 () Bool)

(declare-fun res!149157 () Bool)

(assert (=> b!287270 (=> (not res!149157) (not e!181961))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!287270 (= res!149157 (and (= (size!7184 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7184 a!3312))))))

(declare-fun b!287271 () Bool)

(assert (=> b!287271 (= e!181960 false)))

(declare-datatypes ((SeekEntryResult!1981 0))(
  ( (MissingZero!1981 (index!10094 (_ BitVec 32))) (Found!1981 (index!10095 (_ BitVec 32))) (Intermediate!1981 (undefined!2793 Bool) (index!10096 (_ BitVec 32)) (x!28310 (_ BitVec 32))) (Undefined!1981) (MissingVacant!1981 (index!10097 (_ BitVec 32))) )
))
(declare-fun lt!141445 () SeekEntryResult!1981)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14404 (_ BitVec 32)) SeekEntryResult!1981)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!287271 (= lt!141445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!287272 () Bool)

(assert (=> b!287272 (= e!181961 e!181960)))

(declare-fun res!149156 () Bool)

(assert (=> b!287272 (=> (not res!149156) (not e!181960))))

(declare-fun lt!141444 () SeekEntryResult!1981)

(assert (=> b!287272 (= res!149156 (or (= lt!141444 (MissingZero!1981 i!1256)) (= lt!141444 (MissingVacant!1981 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14404 (_ BitVec 32)) SeekEntryResult!1981)

(assert (=> b!287272 (= lt!141444 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!287273 () Bool)

(declare-fun res!149160 () Bool)

(assert (=> b!287273 (=> (not res!149160) (not e!181961))))

(declare-fun arrayContainsKey!0 (array!14404 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!287273 (= res!149160 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28000 res!149158) b!287270))

(assert (= (and b!287270 res!149157) b!287268))

(assert (= (and b!287268 res!149159) b!287273))

(assert (= (and b!287273 res!149160) b!287272))

(assert (= (and b!287272 res!149156) b!287269))

(assert (= (and b!287269 res!149155) b!287271))

(declare-fun m!301715 () Bool)

(assert (=> b!287269 m!301715))

(declare-fun m!301717 () Bool)

(assert (=> b!287273 m!301717))

(declare-fun m!301719 () Bool)

(assert (=> start!28000 m!301719))

(declare-fun m!301721 () Bool)

(assert (=> start!28000 m!301721))

(declare-fun m!301723 () Bool)

(assert (=> b!287271 m!301723))

(assert (=> b!287271 m!301723))

(declare-fun m!301725 () Bool)

(assert (=> b!287271 m!301725))

(declare-fun m!301727 () Bool)

(assert (=> b!287272 m!301727))

(declare-fun m!301729 () Bool)

(assert (=> b!287268 m!301729))

(push 1)

(assert (not b!287268))

(assert (not start!28000))

(assert (not b!287269))

(assert (not b!287272))

