; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29998 () Bool)

(assert start!29998)

(declare-fun b!300914 () Bool)

(declare-fun res!158810 () Bool)

(declare-fun e!189952 () Bool)

(assert (=> b!300914 (=> (not res!158810) (not e!189952))))

(declare-datatypes ((array!15225 0))(
  ( (array!15226 (arr!7205 (Array (_ BitVec 32) (_ BitVec 64))) (size!7558 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15225)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300914 (= res!158810 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!300912 () Bool)

(declare-fun res!158809 () Bool)

(assert (=> b!300912 (=> (not res!158809) (not e!189952))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!300912 (= res!158809 (and (= (size!7558 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7558 a!3293))))))

(declare-fun b!300915 () Bool)

(assert (=> b!300915 (= e!189952 false)))

(declare-datatypes ((SeekEntryResult!2344 0))(
  ( (MissingZero!2344 (index!11552 (_ BitVec 32))) (Found!2344 (index!11553 (_ BitVec 32))) (Intermediate!2344 (undefined!3156 Bool) (index!11554 (_ BitVec 32)) (x!29843 (_ BitVec 32))) (Undefined!2344) (MissingVacant!2344 (index!11555 (_ BitVec 32))) )
))
(declare-fun lt!149555 () SeekEntryResult!2344)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15225 (_ BitVec 32)) SeekEntryResult!2344)

(assert (=> b!300915 (= lt!149555 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(declare-fun res!158808 () Bool)

(assert (=> start!29998 (=> (not res!158808) (not e!189952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29998 (= res!158808 (validMask!0 mask!3709))))

(assert (=> start!29998 e!189952))

(assert (=> start!29998 true))

(declare-fun array_inv!5177 (array!15225) Bool)

(assert (=> start!29998 (array_inv!5177 a!3293)))

(declare-fun b!300913 () Bool)

(declare-fun res!158811 () Bool)

(assert (=> b!300913 (=> (not res!158811) (not e!189952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300913 (= res!158811 (validKeyInArray!0 k!2441))))

(assert (= (and start!29998 res!158808) b!300912))

(assert (= (and b!300912 res!158809) b!300913))

(assert (= (and b!300913 res!158811) b!300914))

(assert (= (and b!300914 res!158810) b!300915))

(declare-fun m!312309 () Bool)

(assert (=> b!300914 m!312309))

(declare-fun m!312311 () Bool)

(assert (=> b!300915 m!312311))

(declare-fun m!312313 () Bool)

(assert (=> start!29998 m!312313))

(declare-fun m!312315 () Bool)

(assert (=> start!29998 m!312315))

(declare-fun m!312317 () Bool)

(assert (=> b!300913 m!312317))

(push 1)

(assert (not b!300915))

(assert (not start!29998))

(assert (not b!300914))

(assert (not b!300913))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

