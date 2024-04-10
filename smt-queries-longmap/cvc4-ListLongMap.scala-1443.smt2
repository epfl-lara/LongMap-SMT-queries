; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27862 () Bool)

(assert start!27862)

(declare-fun b!286539 () Bool)

(declare-fun res!148623 () Bool)

(declare-fun e!181555 () Bool)

(assert (=> b!286539 (=> (not res!148623) (not e!181555))))

(declare-datatypes ((array!14350 0))(
  ( (array!14351 (arr!6808 (Array (_ BitVec 32) (_ BitVec 64))) (size!7160 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14350)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286539 (= res!148623 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286540 () Bool)

(declare-fun res!148619 () Bool)

(assert (=> b!286540 (=> (not res!148619) (not e!181555))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286540 (= res!148619 (and (= (size!7160 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7160 a!3312))))))

(declare-fun b!286541 () Bool)

(declare-fun e!181554 () Bool)

(assert (=> b!286541 (= e!181555 e!181554)))

(declare-fun res!148621 () Bool)

(assert (=> b!286541 (=> (not res!148621) (not e!181554))))

(declare-datatypes ((SeekEntryResult!1957 0))(
  ( (MissingZero!1957 (index!9998 (_ BitVec 32))) (Found!1957 (index!9999 (_ BitVec 32))) (Intermediate!1957 (undefined!2769 Bool) (index!10000 (_ BitVec 32)) (x!28213 (_ BitVec 32))) (Undefined!1957) (MissingVacant!1957 (index!10001 (_ BitVec 32))) )
))
(declare-fun lt!141138 () SeekEntryResult!1957)

(assert (=> b!286541 (= res!148621 (or (= lt!141138 (MissingZero!1957 i!1256)) (= lt!141138 (MissingVacant!1957 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14350 (_ BitVec 32)) SeekEntryResult!1957)

(assert (=> b!286541 (= lt!141138 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!286542 () Bool)

(assert (=> b!286542 (= e!181554 false)))

(declare-fun lt!141139 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286542 (= lt!141139 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!148620 () Bool)

(assert (=> start!27862 (=> (not res!148620) (not e!181555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27862 (= res!148620 (validMask!0 mask!3809))))

(assert (=> start!27862 e!181555))

(assert (=> start!27862 true))

(declare-fun array_inv!4771 (array!14350) Bool)

(assert (=> start!27862 (array_inv!4771 a!3312)))

(declare-fun b!286543 () Bool)

(declare-fun res!148618 () Bool)

(assert (=> b!286543 (=> (not res!148618) (not e!181554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14350 (_ BitVec 32)) Bool)

(assert (=> b!286543 (= res!148618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286544 () Bool)

(declare-fun res!148622 () Bool)

(assert (=> b!286544 (=> (not res!148622) (not e!181555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286544 (= res!148622 (validKeyInArray!0 k!2524))))

(assert (= (and start!27862 res!148620) b!286540))

(assert (= (and b!286540 res!148619) b!286544))

(assert (= (and b!286544 res!148622) b!286539))

(assert (= (and b!286539 res!148623) b!286541))

(assert (= (and b!286541 res!148621) b!286543))

(assert (= (and b!286543 res!148618) b!286542))

(declare-fun m!301189 () Bool)

(assert (=> b!286541 m!301189))

(declare-fun m!301191 () Bool)

(assert (=> b!286543 m!301191))

(declare-fun m!301193 () Bool)

(assert (=> b!286542 m!301193))

(declare-fun m!301195 () Bool)

(assert (=> start!27862 m!301195))

(declare-fun m!301197 () Bool)

(assert (=> start!27862 m!301197))

(declare-fun m!301199 () Bool)

(assert (=> b!286539 m!301199))

(declare-fun m!301201 () Bool)

(assert (=> b!286544 m!301201))

(push 1)

(assert (not b!286541))

(assert (not b!286544))

