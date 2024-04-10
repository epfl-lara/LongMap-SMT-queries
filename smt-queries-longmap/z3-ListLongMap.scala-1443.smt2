; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27860 () Bool)

(assert start!27860)

(declare-fun b!286521 () Bool)

(declare-fun e!181547 () Bool)

(assert (=> b!286521 (= e!181547 false)))

(declare-fun lt!141132 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286521 (= lt!141132 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286522 () Bool)

(declare-fun res!148601 () Bool)

(declare-fun e!181546 () Bool)

(assert (=> b!286522 (=> (not res!148601) (not e!181546))))

(declare-datatypes ((array!14348 0))(
  ( (array!14349 (arr!6807 (Array (_ BitVec 32) (_ BitVec 64))) (size!7159 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14348)

(declare-fun arrayContainsKey!0 (array!14348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286522 (= res!148601 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148603 () Bool)

(assert (=> start!27860 (=> (not res!148603) (not e!181546))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27860 (= res!148603 (validMask!0 mask!3809))))

(assert (=> start!27860 e!181546))

(assert (=> start!27860 true))

(declare-fun array_inv!4770 (array!14348) Bool)

(assert (=> start!27860 (array_inv!4770 a!3312)))

(declare-fun b!286523 () Bool)

(declare-fun res!148602 () Bool)

(assert (=> b!286523 (=> (not res!148602) (not e!181547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14348 (_ BitVec 32)) Bool)

(assert (=> b!286523 (= res!148602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286524 () Bool)

(assert (=> b!286524 (= e!181546 e!181547)))

(declare-fun res!148604 () Bool)

(assert (=> b!286524 (=> (not res!148604) (not e!181547))))

(declare-datatypes ((SeekEntryResult!1956 0))(
  ( (MissingZero!1956 (index!9994 (_ BitVec 32))) (Found!1956 (index!9995 (_ BitVec 32))) (Intermediate!1956 (undefined!2768 Bool) (index!9996 (_ BitVec 32)) (x!28212 (_ BitVec 32))) (Undefined!1956) (MissingVacant!1956 (index!9997 (_ BitVec 32))) )
))
(declare-fun lt!141133 () SeekEntryResult!1956)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286524 (= res!148604 (or (= lt!141133 (MissingZero!1956 i!1256)) (= lt!141133 (MissingVacant!1956 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14348 (_ BitVec 32)) SeekEntryResult!1956)

(assert (=> b!286524 (= lt!141133 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286525 () Bool)

(declare-fun res!148600 () Bool)

(assert (=> b!286525 (=> (not res!148600) (not e!181546))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286525 (= res!148600 (validKeyInArray!0 k0!2524))))

(declare-fun b!286526 () Bool)

(declare-fun res!148605 () Bool)

(assert (=> b!286526 (=> (not res!148605) (not e!181546))))

(assert (=> b!286526 (= res!148605 (and (= (size!7159 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7159 a!3312))))))

(assert (= (and start!27860 res!148603) b!286526))

(assert (= (and b!286526 res!148605) b!286525))

(assert (= (and b!286525 res!148600) b!286522))

(assert (= (and b!286522 res!148601) b!286524))

(assert (= (and b!286524 res!148604) b!286523))

(assert (= (and b!286523 res!148602) b!286521))

(declare-fun m!301175 () Bool)

(assert (=> b!286525 m!301175))

(declare-fun m!301177 () Bool)

(assert (=> start!27860 m!301177))

(declare-fun m!301179 () Bool)

(assert (=> start!27860 m!301179))

(declare-fun m!301181 () Bool)

(assert (=> b!286524 m!301181))

(declare-fun m!301183 () Bool)

(assert (=> b!286522 m!301183))

(declare-fun m!301185 () Bool)

(assert (=> b!286523 m!301185))

(declare-fun m!301187 () Bool)

(assert (=> b!286521 m!301187))

(check-sat (not b!286524) (not b!286522) (not b!286523) (not start!27860) (not b!286525) (not b!286521))
(check-sat)
