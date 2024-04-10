; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28658 () Bool)

(assert start!28658)

(declare-fun b!292947 () Bool)

(declare-fun res!154004 () Bool)

(declare-fun e!185279 () Bool)

(assert (=> b!292947 (=> (not res!154004) (not e!185279))))

(declare-datatypes ((array!14837 0))(
  ( (array!14838 (arr!7041 (Array (_ BitVec 32) (_ BitVec 64))) (size!7393 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14837)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292947 (= res!154004 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!154003 () Bool)

(assert (=> start!28658 (=> (not res!154003) (not e!185279))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28658 (= res!154003 (validMask!0 mask!3809))))

(assert (=> start!28658 e!185279))

(assert (=> start!28658 true))

(declare-fun array_inv!5004 (array!14837) Bool)

(assert (=> start!28658 (array_inv!5004 a!3312)))

(declare-fun b!292948 () Bool)

(declare-fun res!154008 () Bool)

(assert (=> b!292948 (=> (not res!154008) (not e!185279))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292948 (= res!154008 (and (= (size!7393 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7393 a!3312))))))

(declare-fun b!292949 () Bool)

(declare-fun e!185277 () Bool)

(assert (=> b!292949 (= e!185277 false)))

(declare-fun lt!145183 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2190 0))(
  ( (MissingZero!2190 (index!10930 (_ BitVec 32))) (Found!2190 (index!10931 (_ BitVec 32))) (Intermediate!2190 (undefined!3002 Bool) (index!10932 (_ BitVec 32)) (x!29109 (_ BitVec 32))) (Undefined!2190) (MissingVacant!2190 (index!10933 (_ BitVec 32))) )
))
(declare-fun lt!145182 () SeekEntryResult!2190)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14837 (_ BitVec 32)) SeekEntryResult!2190)

(assert (=> b!292949 (= lt!145182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145183 k0!2524 (array!14838 (store (arr!7041 a!3312) i!1256 k0!2524) (size!7393 a!3312)) mask!3809))))

(declare-fun lt!145180 () SeekEntryResult!2190)

(assert (=> b!292949 (= lt!145180 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145183 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292949 (= lt!145183 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292950 () Bool)

(assert (=> b!292950 (= e!185279 e!185277)))

(declare-fun res!154005 () Bool)

(assert (=> b!292950 (=> (not res!154005) (not e!185277))))

(declare-fun lt!145181 () SeekEntryResult!2190)

(assert (=> b!292950 (= res!154005 (or (= lt!145181 (MissingZero!2190 i!1256)) (= lt!145181 (MissingVacant!2190 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14837 (_ BitVec 32)) SeekEntryResult!2190)

(assert (=> b!292950 (= lt!145181 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292951 () Bool)

(declare-fun res!154006 () Bool)

(assert (=> b!292951 (=> (not res!154006) (not e!185277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14837 (_ BitVec 32)) Bool)

(assert (=> b!292951 (= res!154006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292952 () Bool)

(declare-fun res!154007 () Bool)

(assert (=> b!292952 (=> (not res!154007) (not e!185279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292952 (= res!154007 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28658 res!154003) b!292948))

(assert (= (and b!292948 res!154008) b!292952))

(assert (= (and b!292952 res!154007) b!292947))

(assert (= (and b!292947 res!154004) b!292950))

(assert (= (and b!292950 res!154005) b!292951))

(assert (= (and b!292951 res!154006) b!292949))

(declare-fun m!306737 () Bool)

(assert (=> b!292951 m!306737))

(declare-fun m!306739 () Bool)

(assert (=> b!292952 m!306739))

(declare-fun m!306741 () Bool)

(assert (=> b!292947 m!306741))

(declare-fun m!306743 () Bool)

(assert (=> b!292949 m!306743))

(declare-fun m!306745 () Bool)

(assert (=> b!292949 m!306745))

(declare-fun m!306747 () Bool)

(assert (=> b!292949 m!306747))

(declare-fun m!306749 () Bool)

(assert (=> b!292949 m!306749))

(declare-fun m!306751 () Bool)

(assert (=> start!28658 m!306751))

(declare-fun m!306753 () Bool)

(assert (=> start!28658 m!306753))

(declare-fun m!306755 () Bool)

(assert (=> b!292950 m!306755))

(check-sat (not b!292947) (not b!292951) (not b!292949) (not b!292950) (not start!28658) (not b!292952))
(check-sat)
