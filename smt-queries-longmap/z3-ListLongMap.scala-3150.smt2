; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44372 () Bool)

(assert start!44372)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!286932 () Bool)

(declare-datatypes ((array!31578 0))(
  ( (array!31579 (arr!15181 (Array (_ BitVec 32) (_ BitVec 64))) (size!15545 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31578)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!487662 () Bool)

(declare-datatypes ((SeekEntryResult!3648 0))(
  ( (MissingZero!3648 (index!16771 (_ BitVec 32))) (Found!3648 (index!16772 (_ BitVec 32))) (Intermediate!3648 (undefined!4460 Bool) (index!16773 (_ BitVec 32)) (x!45892 (_ BitVec 32))) (Undefined!3648) (MissingVacant!3648 (index!16774 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31578 (_ BitVec 32)) SeekEntryResult!3648)

(assert (=> b!487662 (= e!286932 (= (seekEntryOrOpen!0 (select (arr!15181 a!3235) j!176) a!3235 mask!3524) (Found!3648 j!176)))))

(declare-fun b!487663 () Bool)

(declare-fun e!286933 () Bool)

(declare-fun e!286934 () Bool)

(assert (=> b!487663 (= e!286933 e!286934)))

(declare-fun res!290941 () Bool)

(assert (=> b!487663 (=> (not res!290941) (not e!286934))))

(declare-fun lt!220117 () SeekEntryResult!3648)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487663 (= res!290941 (or (= lt!220117 (MissingZero!3648 i!1204)) (= lt!220117 (MissingVacant!3648 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!487663 (= lt!220117 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487664 () Bool)

(declare-fun res!290938 () Bool)

(assert (=> b!487664 (=> (not res!290938) (not e!286933))))

(declare-fun arrayContainsKey!0 (array!31578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487664 (= res!290938 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487665 () Bool)

(declare-fun res!290936 () Bool)

(assert (=> b!487665 (=> (not res!290936) (not e!286933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487665 (= res!290936 (validKeyInArray!0 (select (arr!15181 a!3235) j!176)))))

(declare-fun b!487666 () Bool)

(assert (=> b!487666 (= e!286934 (not true))))

(declare-fun lt!220116 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487666 (= lt!220116 (toIndex!0 (select (arr!15181 a!3235) j!176) mask!3524))))

(assert (=> b!487666 e!286932))

(declare-fun res!290939 () Bool)

(assert (=> b!487666 (=> (not res!290939) (not e!286932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31578 (_ BitVec 32)) Bool)

(assert (=> b!487666 (= res!290939 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14242 0))(
  ( (Unit!14243) )
))
(declare-fun lt!220115 () Unit!14242)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14242)

(assert (=> b!487666 (= lt!220115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487668 () Bool)

(declare-fun res!290937 () Bool)

(assert (=> b!487668 (=> (not res!290937) (not e!286933))))

(assert (=> b!487668 (= res!290937 (and (= (size!15545 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15545 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15545 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487669 () Bool)

(declare-fun res!290940 () Bool)

(assert (=> b!487669 (=> (not res!290940) (not e!286933))))

(assert (=> b!487669 (= res!290940 (validKeyInArray!0 k0!2280))))

(declare-fun b!487670 () Bool)

(declare-fun res!290934 () Bool)

(assert (=> b!487670 (=> (not res!290934) (not e!286934))))

(declare-datatypes ((List!9339 0))(
  ( (Nil!9336) (Cons!9335 (h!10191 (_ BitVec 64)) (t!15567 List!9339)) )
))
(declare-fun arrayNoDuplicates!0 (array!31578 (_ BitVec 32) List!9339) Bool)

(assert (=> b!487670 (= res!290934 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9336))))

(declare-fun res!290935 () Bool)

(assert (=> start!44372 (=> (not res!290935) (not e!286933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44372 (= res!290935 (validMask!0 mask!3524))))

(assert (=> start!44372 e!286933))

(assert (=> start!44372 true))

(declare-fun array_inv!10977 (array!31578) Bool)

(assert (=> start!44372 (array_inv!10977 a!3235)))

(declare-fun b!487667 () Bool)

(declare-fun res!290942 () Bool)

(assert (=> b!487667 (=> (not res!290942) (not e!286934))))

(assert (=> b!487667 (= res!290942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44372 res!290935) b!487668))

(assert (= (and b!487668 res!290937) b!487665))

(assert (= (and b!487665 res!290936) b!487669))

(assert (= (and b!487669 res!290940) b!487664))

(assert (= (and b!487664 res!290938) b!487663))

(assert (= (and b!487663 res!290941) b!487667))

(assert (= (and b!487667 res!290942) b!487670))

(assert (= (and b!487670 res!290934) b!487666))

(assert (= (and b!487666 res!290939) b!487662))

(declare-fun m!467453 () Bool)

(assert (=> b!487670 m!467453))

(declare-fun m!467455 () Bool)

(assert (=> start!44372 m!467455))

(declare-fun m!467457 () Bool)

(assert (=> start!44372 m!467457))

(declare-fun m!467459 () Bool)

(assert (=> b!487663 m!467459))

(declare-fun m!467461 () Bool)

(assert (=> b!487662 m!467461))

(assert (=> b!487662 m!467461))

(declare-fun m!467463 () Bool)

(assert (=> b!487662 m!467463))

(declare-fun m!467465 () Bool)

(assert (=> b!487667 m!467465))

(declare-fun m!467467 () Bool)

(assert (=> b!487664 m!467467))

(assert (=> b!487666 m!467461))

(assert (=> b!487666 m!467461))

(declare-fun m!467469 () Bool)

(assert (=> b!487666 m!467469))

(declare-fun m!467471 () Bool)

(assert (=> b!487666 m!467471))

(declare-fun m!467473 () Bool)

(assert (=> b!487666 m!467473))

(assert (=> b!487665 m!467461))

(assert (=> b!487665 m!467461))

(declare-fun m!467475 () Bool)

(assert (=> b!487665 m!467475))

(declare-fun m!467477 () Bool)

(assert (=> b!487669 m!467477))

(check-sat (not b!487664) (not b!487669) (not start!44372) (not b!487663) (not b!487667) (not b!487666) (not b!487662) (not b!487665) (not b!487670))
(check-sat)
