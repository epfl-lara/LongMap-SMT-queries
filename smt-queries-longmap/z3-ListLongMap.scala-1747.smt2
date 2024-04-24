; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31988 () Bool)

(assert start!31988)

(declare-fun b!319501 () Bool)

(declare-fun e!198420 () Bool)

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!319501 (= e!198420 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun b!319502 () Bool)

(declare-fun res!173937 () Bool)

(assert (=> b!319502 (=> (not res!173937) (not e!198420))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319502 (= res!173937 (validKeyInArray!0 k0!2497))))

(declare-fun res!173939 () Bool)

(assert (=> start!31988 (=> (not res!173939) (not e!198420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31988 (= res!173939 (validMask!0 mask!3777))))

(assert (=> start!31988 e!198420))

(assert (=> start!31988 true))

(declare-datatypes ((array!16308 0))(
  ( (array!16309 (arr!7717 (Array (_ BitVec 32) (_ BitVec 64))) (size!8069 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16308)

(declare-fun array_inv!5667 (array!16308) Bool)

(assert (=> start!31988 (array_inv!5667 a!3305)))

(declare-fun b!319503 () Bool)

(declare-fun res!173936 () Bool)

(assert (=> b!319503 (=> (not res!173936) (not e!198420))))

(declare-fun arrayContainsKey!0 (array!16308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319503 (= res!173936 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319504 () Bool)

(declare-fun res!173940 () Bool)

(assert (=> b!319504 (=> (not res!173940) (not e!198420))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2813 0))(
  ( (MissingZero!2813 (index!13428 (_ BitVec 32))) (Found!2813 (index!13429 (_ BitVec 32))) (Intermediate!2813 (undefined!3625 Bool) (index!13430 (_ BitVec 32)) (x!31812 (_ BitVec 32))) (Undefined!2813) (MissingVacant!2813 (index!13431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16308 (_ BitVec 32)) SeekEntryResult!2813)

(assert (=> b!319504 (= res!173940 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2813 i!1250)))))

(declare-fun b!319505 () Bool)

(declare-fun res!173935 () Bool)

(assert (=> b!319505 (=> (not res!173935) (not e!198420))))

(assert (=> b!319505 (= res!173935 (and (= (size!8069 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8069 a!3305))))))

(declare-fun b!319506 () Bool)

(declare-fun res!173938 () Bool)

(assert (=> b!319506 (=> (not res!173938) (not e!198420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16308 (_ BitVec 32)) Bool)

(assert (=> b!319506 (= res!173938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!31988 res!173939) b!319505))

(assert (= (and b!319505 res!173935) b!319502))

(assert (= (and b!319502 res!173937) b!319503))

(assert (= (and b!319503 res!173936) b!319504))

(assert (= (and b!319504 res!173940) b!319506))

(assert (= (and b!319506 res!173938) b!319501))

(declare-fun m!328303 () Bool)

(assert (=> b!319504 m!328303))

(declare-fun m!328305 () Bool)

(assert (=> b!319506 m!328305))

(declare-fun m!328307 () Bool)

(assert (=> start!31988 m!328307))

(declare-fun m!328309 () Bool)

(assert (=> start!31988 m!328309))

(declare-fun m!328311 () Bool)

(assert (=> b!319502 m!328311))

(declare-fun m!328313 () Bool)

(assert (=> b!319503 m!328313))

(check-sat (not b!319504) (not b!319506) (not start!31988) (not b!319503) (not b!319502))
(check-sat)
