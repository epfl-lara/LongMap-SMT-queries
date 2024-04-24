; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44264 () Bool)

(assert start!44264)

(declare-fun b!486811 () Bool)

(declare-fun res!290257 () Bool)

(declare-fun e!286519 () Bool)

(assert (=> b!486811 (=> (not res!290257) (not e!286519))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486811 (= res!290257 (validKeyInArray!0 k0!2280))))

(declare-fun b!486812 () Bool)

(declare-fun res!290256 () Bool)

(assert (=> b!486812 (=> (not res!290256) (not e!286519))))

(declare-datatypes ((array!31516 0))(
  ( (array!31517 (arr!15151 (Array (_ BitVec 32) (_ BitVec 64))) (size!15515 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31516)

(declare-fun arrayContainsKey!0 (array!31516 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486812 (= res!290256 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486813 () Bool)

(declare-fun res!290252 () Bool)

(declare-fun e!286521 () Bool)

(assert (=> b!486813 (=> (not res!290252) (not e!286521))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31516 (_ BitVec 32)) Bool)

(assert (=> b!486813 (= res!290252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290251 () Bool)

(assert (=> start!44264 (=> (not res!290251) (not e!286519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44264 (= res!290251 (validMask!0 mask!3524))))

(assert (=> start!44264 e!286519))

(assert (=> start!44264 true))

(declare-fun array_inv!11010 (array!31516) Bool)

(assert (=> start!44264 (array_inv!11010 a!3235)))

(declare-fun b!486814 () Bool)

(declare-fun res!290254 () Bool)

(assert (=> b!486814 (=> (not res!290254) (not e!286519))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486814 (= res!290254 (validKeyInArray!0 (select (arr!15151 a!3235) j!176)))))

(declare-fun b!486815 () Bool)

(declare-fun res!290255 () Bool)

(assert (=> b!486815 (=> (not res!290255) (not e!286519))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486815 (= res!290255 (and (= (size!15515 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15515 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15515 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486816 () Bool)

(assert (=> b!486816 (= e!286521 false)))

(declare-fun lt!219892 () Bool)

(declare-datatypes ((List!9216 0))(
  ( (Nil!9213) (Cons!9212 (h!10068 (_ BitVec 64)) (t!15436 List!9216)) )
))
(declare-fun arrayNoDuplicates!0 (array!31516 (_ BitVec 32) List!9216) Bool)

(assert (=> b!486816 (= lt!219892 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9213))))

(declare-fun b!486817 () Bool)

(assert (=> b!486817 (= e!286519 e!286521)))

(declare-fun res!290253 () Bool)

(assert (=> b!486817 (=> (not res!290253) (not e!286521))))

(declare-datatypes ((SeekEntryResult!3574 0))(
  ( (MissingZero!3574 (index!16475 (_ BitVec 32))) (Found!3574 (index!16476 (_ BitVec 32))) (Intermediate!3574 (undefined!4386 Bool) (index!16477 (_ BitVec 32)) (x!45751 (_ BitVec 32))) (Undefined!3574) (MissingVacant!3574 (index!16478 (_ BitVec 32))) )
))
(declare-fun lt!219891 () SeekEntryResult!3574)

(assert (=> b!486817 (= res!290253 (or (= lt!219891 (MissingZero!3574 i!1204)) (= lt!219891 (MissingVacant!3574 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31516 (_ BitVec 32)) SeekEntryResult!3574)

(assert (=> b!486817 (= lt!219891 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44264 res!290251) b!486815))

(assert (= (and b!486815 res!290255) b!486814))

(assert (= (and b!486814 res!290254) b!486811))

(assert (= (and b!486811 res!290257) b!486812))

(assert (= (and b!486812 res!290256) b!486817))

(assert (= (and b!486817 res!290253) b!486813))

(assert (= (and b!486813 res!290252) b!486816))

(declare-fun m!466933 () Bool)

(assert (=> b!486814 m!466933))

(assert (=> b!486814 m!466933))

(declare-fun m!466935 () Bool)

(assert (=> b!486814 m!466935))

(declare-fun m!466937 () Bool)

(assert (=> b!486816 m!466937))

(declare-fun m!466939 () Bool)

(assert (=> b!486812 m!466939))

(declare-fun m!466941 () Bool)

(assert (=> start!44264 m!466941))

(declare-fun m!466943 () Bool)

(assert (=> start!44264 m!466943))

(declare-fun m!466945 () Bool)

(assert (=> b!486817 m!466945))

(declare-fun m!466947 () Bool)

(assert (=> b!486811 m!466947))

(declare-fun m!466949 () Bool)

(assert (=> b!486813 m!466949))

(check-sat (not b!486813) (not b!486812) (not start!44264) (not b!486811) (not b!486814) (not b!486816) (not b!486817))
(check-sat)
