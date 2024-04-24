; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27922 () Bool)

(assert start!27922)

(declare-fun b!286928 () Bool)

(declare-fun res!148915 () Bool)

(declare-fun e!181768 () Bool)

(assert (=> b!286928 (=> (not res!148915) (not e!181768))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14376 0))(
  ( (array!14377 (arr!6820 (Array (_ BitVec 32) (_ BitVec 64))) (size!7172 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14376)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286928 (= res!148915 (and (= (size!7172 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7172 a!3312))))))

(declare-fun res!148913 () Bool)

(assert (=> start!27922 (=> (not res!148913) (not e!181768))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27922 (= res!148913 (validMask!0 mask!3809))))

(assert (=> start!27922 e!181768))

(assert (=> start!27922 true))

(declare-fun array_inv!4770 (array!14376) Bool)

(assert (=> start!27922 (array_inv!4770 a!3312)))

(declare-fun b!286929 () Bool)

(declare-fun e!181769 () Bool)

(assert (=> b!286929 (= e!181769 false)))

(declare-fun lt!141347 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286929 (= lt!141347 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286930 () Bool)

(declare-fun res!148914 () Bool)

(assert (=> b!286930 (=> (not res!148914) (not e!181769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14376 (_ BitVec 32)) Bool)

(assert (=> b!286930 (= res!148914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286931 () Bool)

(assert (=> b!286931 (= e!181768 e!181769)))

(declare-fun res!148917 () Bool)

(assert (=> b!286931 (=> (not res!148917) (not e!181769))))

(declare-datatypes ((SeekEntryResult!1934 0))(
  ( (MissingZero!1934 (index!9906 (_ BitVec 32))) (Found!1934 (index!9907 (_ BitVec 32))) (Intermediate!1934 (undefined!2746 Bool) (index!9908 (_ BitVec 32)) (x!28233 (_ BitVec 32))) (Undefined!1934) (MissingVacant!1934 (index!9909 (_ BitVec 32))) )
))
(declare-fun lt!141348 () SeekEntryResult!1934)

(assert (=> b!286931 (= res!148917 (or (= lt!141348 (MissingZero!1934 i!1256)) (= lt!141348 (MissingVacant!1934 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14376 (_ BitVec 32)) SeekEntryResult!1934)

(assert (=> b!286931 (= lt!141348 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286932 () Bool)

(declare-fun res!148916 () Bool)

(assert (=> b!286932 (=> (not res!148916) (not e!181768))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286932 (= res!148916 (validKeyInArray!0 k0!2524))))

(declare-fun b!286933 () Bool)

(declare-fun res!148912 () Bool)

(assert (=> b!286933 (=> (not res!148912) (not e!181768))))

(declare-fun arrayContainsKey!0 (array!14376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286933 (= res!148912 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27922 res!148913) b!286928))

(assert (= (and b!286928 res!148915) b!286932))

(assert (= (and b!286932 res!148916) b!286933))

(assert (= (and b!286933 res!148912) b!286931))

(assert (= (and b!286931 res!148917) b!286930))

(assert (= (and b!286930 res!148914) b!286929))

(declare-fun m!301655 () Bool)

(assert (=> b!286932 m!301655))

(declare-fun m!301657 () Bool)

(assert (=> b!286929 m!301657))

(declare-fun m!301659 () Bool)

(assert (=> b!286933 m!301659))

(declare-fun m!301661 () Bool)

(assert (=> b!286930 m!301661))

(declare-fun m!301663 () Bool)

(assert (=> start!27922 m!301663))

(declare-fun m!301665 () Bool)

(assert (=> start!27922 m!301665))

(declare-fun m!301667 () Bool)

(assert (=> b!286931 m!301667))

(check-sat (not b!286932) (not b!286930) (not b!286929) (not b!286933) (not start!27922) (not b!286931))
(check-sat)
