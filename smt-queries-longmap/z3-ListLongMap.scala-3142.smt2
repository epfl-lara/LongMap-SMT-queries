; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44276 () Bool)

(assert start!44276)

(declare-fun b!486893 () Bool)

(declare-fun e!286567 () Bool)

(assert (=> b!486893 (= e!286567 false)))

(declare-fun lt!219886 () Bool)

(declare-datatypes ((array!31527 0))(
  ( (array!31528 (arr!15157 (Array (_ BitVec 32) (_ BitVec 64))) (size!15521 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31527)

(declare-datatypes ((List!9315 0))(
  ( (Nil!9312) (Cons!9311 (h!10167 (_ BitVec 64)) (t!15543 List!9315)) )
))
(declare-fun arrayNoDuplicates!0 (array!31527 (_ BitVec 32) List!9315) Bool)

(assert (=> b!486893 (= lt!219886 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9312))))

(declare-fun b!486894 () Bool)

(declare-fun res!290281 () Bool)

(declare-fun e!286569 () Bool)

(assert (=> b!486894 (=> (not res!290281) (not e!286569))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486894 (= res!290281 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!290284 () Bool)

(assert (=> start!44276 (=> (not res!290284) (not e!286569))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44276 (= res!290284 (validMask!0 mask!3524))))

(assert (=> start!44276 e!286569))

(assert (=> start!44276 true))

(declare-fun array_inv!10953 (array!31527) Bool)

(assert (=> start!44276 (array_inv!10953 a!3235)))

(declare-fun b!486895 () Bool)

(declare-fun res!290285 () Bool)

(assert (=> b!486895 (=> (not res!290285) (not e!286569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486895 (= res!290285 (validKeyInArray!0 k0!2280))))

(declare-fun b!486896 () Bool)

(assert (=> b!486896 (= e!286569 e!286567)))

(declare-fun res!290283 () Bool)

(assert (=> b!486896 (=> (not res!290283) (not e!286567))))

(declare-datatypes ((SeekEntryResult!3624 0))(
  ( (MissingZero!3624 (index!16675 (_ BitVec 32))) (Found!3624 (index!16676 (_ BitVec 32))) (Intermediate!3624 (undefined!4436 Bool) (index!16677 (_ BitVec 32)) (x!45804 (_ BitVec 32))) (Undefined!3624) (MissingVacant!3624 (index!16678 (_ BitVec 32))) )
))
(declare-fun lt!219885 () SeekEntryResult!3624)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486896 (= res!290283 (or (= lt!219885 (MissingZero!3624 i!1204)) (= lt!219885 (MissingVacant!3624 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31527 (_ BitVec 32)) SeekEntryResult!3624)

(assert (=> b!486896 (= lt!219885 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486897 () Bool)

(declare-fun res!290280 () Bool)

(assert (=> b!486897 (=> (not res!290280) (not e!286569))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486897 (= res!290280 (validKeyInArray!0 (select (arr!15157 a!3235) j!176)))))

(declare-fun b!486898 () Bool)

(declare-fun res!290279 () Bool)

(assert (=> b!486898 (=> (not res!290279) (not e!286569))))

(assert (=> b!486898 (= res!290279 (and (= (size!15521 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15521 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15521 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486899 () Bool)

(declare-fun res!290282 () Bool)

(assert (=> b!486899 (=> (not res!290282) (not e!286567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31527 (_ BitVec 32)) Bool)

(assert (=> b!486899 (= res!290282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!44276 res!290284) b!486898))

(assert (= (and b!486898 res!290279) b!486897))

(assert (= (and b!486897 res!290280) b!486895))

(assert (= (and b!486895 res!290285) b!486894))

(assert (= (and b!486894 res!290281) b!486896))

(assert (= (and b!486896 res!290283) b!486899))

(assert (= (and b!486899 res!290282) b!486893))

(declare-fun m!466767 () Bool)

(assert (=> b!486894 m!466767))

(declare-fun m!466769 () Bool)

(assert (=> b!486895 m!466769))

(declare-fun m!466771 () Bool)

(assert (=> b!486893 m!466771))

(declare-fun m!466773 () Bool)

(assert (=> b!486896 m!466773))

(declare-fun m!466775 () Bool)

(assert (=> start!44276 m!466775))

(declare-fun m!466777 () Bool)

(assert (=> start!44276 m!466777))

(declare-fun m!466779 () Bool)

(assert (=> b!486897 m!466779))

(assert (=> b!486897 m!466779))

(declare-fun m!466781 () Bool)

(assert (=> b!486897 m!466781))

(declare-fun m!466783 () Bool)

(assert (=> b!486899 m!466783))

(check-sat (not b!486899) (not b!486893) (not start!44276) (not b!486894) (not b!486896) (not b!486897) (not b!486895))
(check-sat)
