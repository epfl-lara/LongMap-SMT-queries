; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44268 () Bool)

(assert start!44268)

(declare-fun b!486809 () Bool)

(declare-fun res!290196 () Bool)

(declare-fun e!286533 () Bool)

(assert (=> b!486809 (=> (not res!290196) (not e!286533))))

(declare-datatypes ((array!31519 0))(
  ( (array!31520 (arr!15153 (Array (_ BitVec 32) (_ BitVec 64))) (size!15517 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31519)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31519 (_ BitVec 32)) Bool)

(assert (=> b!486809 (= res!290196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!486810 () Bool)

(assert (=> b!486810 (= e!286533 false)))

(declare-fun lt!219861 () Bool)

(declare-datatypes ((List!9311 0))(
  ( (Nil!9308) (Cons!9307 (h!10163 (_ BitVec 64)) (t!15539 List!9311)) )
))
(declare-fun arrayNoDuplicates!0 (array!31519 (_ BitVec 32) List!9311) Bool)

(assert (=> b!486810 (= lt!219861 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9308))))

(declare-fun b!486811 () Bool)

(declare-fun res!290199 () Bool)

(declare-fun e!286532 () Bool)

(assert (=> b!486811 (=> (not res!290199) (not e!286532))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486811 (= res!290199 (validKeyInArray!0 (select (arr!15153 a!3235) j!176)))))

(declare-fun b!486812 () Bool)

(assert (=> b!486812 (= e!286532 e!286533)))

(declare-fun res!290201 () Bool)

(assert (=> b!486812 (=> (not res!290201) (not e!286533))))

(declare-datatypes ((SeekEntryResult!3620 0))(
  ( (MissingZero!3620 (index!16659 (_ BitVec 32))) (Found!3620 (index!16660 (_ BitVec 32))) (Intermediate!3620 (undefined!4432 Bool) (index!16661 (_ BitVec 32)) (x!45792 (_ BitVec 32))) (Undefined!3620) (MissingVacant!3620 (index!16662 (_ BitVec 32))) )
))
(declare-fun lt!219862 () SeekEntryResult!3620)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486812 (= res!290201 (or (= lt!219862 (MissingZero!3620 i!1204)) (= lt!219862 (MissingVacant!3620 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31519 (_ BitVec 32)) SeekEntryResult!3620)

(assert (=> b!486812 (= lt!219862 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!486813 () Bool)

(declare-fun res!290197 () Bool)

(assert (=> b!486813 (=> (not res!290197) (not e!286532))))

(assert (=> b!486813 (= res!290197 (validKeyInArray!0 k!2280))))

(declare-fun res!290195 () Bool)

(assert (=> start!44268 (=> (not res!290195) (not e!286532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44268 (= res!290195 (validMask!0 mask!3524))))

(assert (=> start!44268 e!286532))

(assert (=> start!44268 true))

(declare-fun array_inv!10949 (array!31519) Bool)

(assert (=> start!44268 (array_inv!10949 a!3235)))

(declare-fun b!486814 () Bool)

(declare-fun res!290198 () Bool)

(assert (=> b!486814 (=> (not res!290198) (not e!286532))))

(declare-fun arrayContainsKey!0 (array!31519 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486814 (= res!290198 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486815 () Bool)

(declare-fun res!290200 () Bool)

(assert (=> b!486815 (=> (not res!290200) (not e!286532))))

(assert (=> b!486815 (= res!290200 (and (= (size!15517 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15517 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15517 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44268 res!290195) b!486815))

(assert (= (and b!486815 res!290200) b!486811))

(assert (= (and b!486811 res!290199) b!486813))

(assert (= (and b!486813 res!290197) b!486814))

(assert (= (and b!486814 res!290198) b!486812))

(assert (= (and b!486812 res!290201) b!486809))

(assert (= (and b!486809 res!290196) b!486810))

(declare-fun m!466695 () Bool)

(assert (=> start!44268 m!466695))

(declare-fun m!466697 () Bool)

(assert (=> start!44268 m!466697))

(declare-fun m!466699 () Bool)

(assert (=> b!486814 m!466699))

(declare-fun m!466701 () Bool)

(assert (=> b!486809 m!466701))

(declare-fun m!466703 () Bool)

(assert (=> b!486811 m!466703))

(assert (=> b!486811 m!466703))

(declare-fun m!466705 () Bool)

(assert (=> b!486811 m!466705))

(declare-fun m!466707 () Bool)

(assert (=> b!486813 m!466707))

(declare-fun m!466709 () Bool)

(assert (=> b!486810 m!466709))

(declare-fun m!466711 () Bool)

(assert (=> b!486812 m!466711))

(push 1)

(assert (not b!486813))

(assert (not b!486811))

(assert (not b!486812))

(assert (not start!44268))

(assert (not b!486810))

(assert (not b!486814))

(assert (not b!486809))

(check-sat)

(pop 1)

(push 1)

