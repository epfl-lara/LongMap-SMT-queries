; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44276 () Bool)

(assert start!44276)

(declare-fun b!486939 () Bool)

(declare-fun res!290382 () Bool)

(declare-fun e!286573 () Bool)

(assert (=> b!486939 (=> (not res!290382) (not e!286573))))

(declare-datatypes ((array!31528 0))(
  ( (array!31529 (arr!15157 (Array (_ BitVec 32) (_ BitVec 64))) (size!15521 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31528)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31528 (_ BitVec 32)) Bool)

(assert (=> b!486939 (= res!290382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290379 () Bool)

(declare-fun e!286575 () Bool)

(assert (=> start!44276 (=> (not res!290379) (not e!286575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44276 (= res!290379 (validMask!0 mask!3524))))

(assert (=> start!44276 e!286575))

(assert (=> start!44276 true))

(declare-fun array_inv!11016 (array!31528) Bool)

(assert (=> start!44276 (array_inv!11016 a!3235)))

(declare-fun b!486940 () Bool)

(declare-fun res!290386 () Bool)

(assert (=> b!486940 (=> (not res!290386) (not e!286575))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486940 (= res!290386 (and (= (size!15521 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15521 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15521 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486941 () Bool)

(declare-fun res!290385 () Bool)

(assert (=> b!486941 (=> (not res!290385) (not e!286575))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486941 (= res!290385 (validKeyInArray!0 k0!2280))))

(declare-fun b!486942 () Bool)

(assert (=> b!486942 (= e!286575 e!286573)))

(declare-fun res!290384 () Bool)

(assert (=> b!486942 (=> (not res!290384) (not e!286573))))

(declare-datatypes ((SeekEntryResult!3580 0))(
  ( (MissingZero!3580 (index!16499 (_ BitVec 32))) (Found!3580 (index!16500 (_ BitVec 32))) (Intermediate!3580 (undefined!4392 Bool) (index!16501 (_ BitVec 32)) (x!45773 (_ BitVec 32))) (Undefined!3580) (MissingVacant!3580 (index!16502 (_ BitVec 32))) )
))
(declare-fun lt!219927 () SeekEntryResult!3580)

(assert (=> b!486942 (= res!290384 (or (= lt!219927 (MissingZero!3580 i!1204)) (= lt!219927 (MissingVacant!3580 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31528 (_ BitVec 32)) SeekEntryResult!3580)

(assert (=> b!486942 (= lt!219927 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486943 () Bool)

(declare-fun res!290383 () Bool)

(assert (=> b!486943 (=> (not res!290383) (not e!286575))))

(assert (=> b!486943 (= res!290383 (validKeyInArray!0 (select (arr!15157 a!3235) j!176)))))

(declare-fun b!486944 () Bool)

(declare-fun res!290380 () Bool)

(assert (=> b!486944 (=> (not res!290380) (not e!286573))))

(declare-datatypes ((List!9222 0))(
  ( (Nil!9219) (Cons!9218 (h!10074 (_ BitVec 64)) (t!15442 List!9222)) )
))
(declare-fun arrayNoDuplicates!0 (array!31528 (_ BitVec 32) List!9222) Bool)

(assert (=> b!486944 (= res!290380 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9219))))

(declare-fun b!486945 () Bool)

(assert (=> b!486945 (= e!286573 (not true))))

(assert (=> b!486945 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14167 0))(
  ( (Unit!14168) )
))
(declare-fun lt!219928 () Unit!14167)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31528 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14167)

(assert (=> b!486945 (= lt!219928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!486946 () Bool)

(declare-fun res!290381 () Bool)

(assert (=> b!486946 (=> (not res!290381) (not e!286575))))

(declare-fun arrayContainsKey!0 (array!31528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486946 (= res!290381 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44276 res!290379) b!486940))

(assert (= (and b!486940 res!290386) b!486943))

(assert (= (and b!486943 res!290383) b!486941))

(assert (= (and b!486941 res!290385) b!486946))

(assert (= (and b!486946 res!290381) b!486942))

(assert (= (and b!486942 res!290384) b!486939))

(assert (= (and b!486939 res!290382) b!486944))

(assert (= (and b!486944 res!290380) b!486945))

(declare-fun m!467041 () Bool)

(assert (=> b!486942 m!467041))

(declare-fun m!467043 () Bool)

(assert (=> b!486939 m!467043))

(declare-fun m!467045 () Bool)

(assert (=> b!486945 m!467045))

(declare-fun m!467047 () Bool)

(assert (=> b!486945 m!467047))

(declare-fun m!467049 () Bool)

(assert (=> b!486943 m!467049))

(assert (=> b!486943 m!467049))

(declare-fun m!467051 () Bool)

(assert (=> b!486943 m!467051))

(declare-fun m!467053 () Bool)

(assert (=> start!44276 m!467053))

(declare-fun m!467055 () Bool)

(assert (=> start!44276 m!467055))

(declare-fun m!467057 () Bool)

(assert (=> b!486944 m!467057))

(declare-fun m!467059 () Bool)

(assert (=> b!486941 m!467059))

(declare-fun m!467061 () Bool)

(assert (=> b!486946 m!467061))

(check-sat (not start!44276) (not b!486942) (not b!486941) (not b!486943) (not b!486944) (not b!486945) (not b!486946) (not b!486939))
(check-sat)
