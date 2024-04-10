; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27858 () Bool)

(assert start!27858)

(declare-fun b!286503 () Bool)

(declare-fun e!181537 () Bool)

(declare-fun e!181538 () Bool)

(assert (=> b!286503 (= e!181537 e!181538)))

(declare-fun res!148583 () Bool)

(assert (=> b!286503 (=> (not res!148583) (not e!181538))))

(declare-datatypes ((SeekEntryResult!1955 0))(
  ( (MissingZero!1955 (index!9990 (_ BitVec 32))) (Found!1955 (index!9991 (_ BitVec 32))) (Intermediate!1955 (undefined!2767 Bool) (index!9992 (_ BitVec 32)) (x!28211 (_ BitVec 32))) (Undefined!1955) (MissingVacant!1955 (index!9993 (_ BitVec 32))) )
))
(declare-fun lt!141127 () SeekEntryResult!1955)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286503 (= res!148583 (or (= lt!141127 (MissingZero!1955 i!1256)) (= lt!141127 (MissingVacant!1955 i!1256))))))

(declare-datatypes ((array!14346 0))(
  ( (array!14347 (arr!6806 (Array (_ BitVec 32) (_ BitVec 64))) (size!7158 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14346)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14346 (_ BitVec 32)) SeekEntryResult!1955)

(assert (=> b!286503 (= lt!141127 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286504 () Bool)

(declare-fun res!148587 () Bool)

(assert (=> b!286504 (=> (not res!148587) (not e!181537))))

(declare-fun arrayContainsKey!0 (array!14346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286504 (= res!148587 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286505 () Bool)

(declare-fun res!148582 () Bool)

(assert (=> b!286505 (=> (not res!148582) (not e!181538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14346 (_ BitVec 32)) Bool)

(assert (=> b!286505 (= res!148582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286506 () Bool)

(assert (=> b!286506 (= e!181538 false)))

(declare-fun lt!141126 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286506 (= lt!141126 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!286508 () Bool)

(declare-fun res!148585 () Bool)

(assert (=> b!286508 (=> (not res!148585) (not e!181537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286508 (= res!148585 (validKeyInArray!0 k!2524))))

(declare-fun b!286507 () Bool)

(declare-fun res!148584 () Bool)

(assert (=> b!286507 (=> (not res!148584) (not e!181537))))

(assert (=> b!286507 (= res!148584 (and (= (size!7158 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7158 a!3312))))))

(declare-fun res!148586 () Bool)

(assert (=> start!27858 (=> (not res!148586) (not e!181537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27858 (= res!148586 (validMask!0 mask!3809))))

(assert (=> start!27858 e!181537))

(assert (=> start!27858 true))

(declare-fun array_inv!4769 (array!14346) Bool)

(assert (=> start!27858 (array_inv!4769 a!3312)))

(assert (= (and start!27858 res!148586) b!286507))

(assert (= (and b!286507 res!148584) b!286508))

(assert (= (and b!286508 res!148585) b!286504))

(assert (= (and b!286504 res!148587) b!286503))

(assert (= (and b!286503 res!148583) b!286505))

(assert (= (and b!286505 res!148582) b!286506))

(declare-fun m!301161 () Bool)

(assert (=> b!286508 m!301161))

(declare-fun m!301163 () Bool)

(assert (=> b!286505 m!301163))

(declare-fun m!301165 () Bool)

(assert (=> start!27858 m!301165))

(declare-fun m!301167 () Bool)

(assert (=> start!27858 m!301167))

(declare-fun m!301169 () Bool)

(assert (=> b!286506 m!301169))

(declare-fun m!301171 () Bool)

(assert (=> b!286503 m!301171))

(declare-fun m!301173 () Bool)

(assert (=> b!286504 m!301173))

(push 1)

(assert (not start!27858))

(assert (not b!286504))

(assert (not b!286508))

(assert (not b!286506))

(assert (not b!286503))

