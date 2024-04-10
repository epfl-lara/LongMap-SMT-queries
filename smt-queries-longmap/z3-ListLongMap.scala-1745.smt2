; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31992 () Bool)

(assert start!31992)

(declare-fun b!319484 () Bool)

(declare-fun e!198423 () Bool)

(assert (=> b!319484 (= e!198423 false)))

(declare-datatypes ((array!16299 0))(
  ( (array!16300 (arr!7713 (Array (_ BitVec 32) (_ BitVec 64))) (size!8065 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16299)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2844 0))(
  ( (MissingZero!2844 (index!13552 (_ BitVec 32))) (Found!2844 (index!13553 (_ BitVec 32))) (Intermediate!2844 (undefined!3656 Bool) (index!13554 (_ BitVec 32)) (x!31830 (_ BitVec 32))) (Undefined!2844) (MissingVacant!2844 (index!13555 (_ BitVec 32))) )
))
(declare-fun lt!155811 () SeekEntryResult!2844)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16299 (_ BitVec 32)) SeekEntryResult!2844)

(assert (=> b!319484 (= lt!155811 (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777))))

(declare-fun b!319482 () Bool)

(declare-fun res!173867 () Bool)

(assert (=> b!319482 (=> (not res!173867) (not e!198423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319482 (= res!173867 (validKeyInArray!0 k0!2497))))

(declare-fun b!319481 () Bool)

(declare-fun res!173868 () Bool)

(assert (=> b!319481 (=> (not res!173868) (not e!198423))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!319481 (= res!173868 (and (= (size!8065 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8065 a!3305))))))

(declare-fun b!319483 () Bool)

(declare-fun res!173865 () Bool)

(assert (=> b!319483 (=> (not res!173865) (not e!198423))))

(declare-fun arrayContainsKey!0 (array!16299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319483 (= res!173865 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!173866 () Bool)

(assert (=> start!31992 (=> (not res!173866) (not e!198423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31992 (= res!173866 (validMask!0 mask!3777))))

(assert (=> start!31992 e!198423))

(assert (=> start!31992 true))

(declare-fun array_inv!5676 (array!16299) Bool)

(assert (=> start!31992 (array_inv!5676 a!3305)))

(assert (= (and start!31992 res!173866) b!319481))

(assert (= (and b!319481 res!173868) b!319482))

(assert (= (and b!319482 res!173867) b!319483))

(assert (= (and b!319483 res!173865) b!319484))

(declare-fun m!328077 () Bool)

(assert (=> b!319484 m!328077))

(declare-fun m!328079 () Bool)

(assert (=> b!319482 m!328079))

(declare-fun m!328081 () Bool)

(assert (=> b!319483 m!328081))

(declare-fun m!328083 () Bool)

(assert (=> start!31992 m!328083))

(declare-fun m!328085 () Bool)

(assert (=> start!31992 m!328085))

(check-sat (not b!319484) (not start!31992) (not b!319483) (not b!319482))
(check-sat)
