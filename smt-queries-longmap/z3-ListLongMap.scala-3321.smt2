; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45860 () Bool)

(assert start!45860)

(declare-fun b!507999 () Bool)

(declare-fun res!309013 () Bool)

(declare-fun e!297244 () Bool)

(assert (=> b!507999 (=> (not res!309013) (not e!297244))))

(declare-datatypes ((array!32617 0))(
  ( (array!32618 (arr!15688 (Array (_ BitVec 32) (_ BitVec 64))) (size!16052 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32617)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507999 (= res!309013 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508000 () Bool)

(declare-fun res!309017 () Bool)

(assert (=> b!508000 (=> (not res!309017) (not e!297244))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508000 (= res!309017 (validKeyInArray!0 (select (arr!15688 a!3235) j!176)))))

(declare-fun b!508001 () Bool)

(declare-fun e!297245 () Bool)

(assert (=> b!508001 (= e!297244 e!297245)))

(declare-fun res!309019 () Bool)

(assert (=> b!508001 (=> (not res!309019) (not e!297245))))

(declare-datatypes ((SeekEntryResult!4111 0))(
  ( (MissingZero!4111 (index!18632 (_ BitVec 32))) (Found!4111 (index!18633 (_ BitVec 32))) (Intermediate!4111 (undefined!4923 Bool) (index!18634 (_ BitVec 32)) (x!47765 (_ BitVec 32))) (Undefined!4111) (MissingVacant!4111 (index!18635 (_ BitVec 32))) )
))
(declare-fun lt!232165 () SeekEntryResult!4111)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508001 (= res!309019 (or (= lt!232165 (MissingZero!4111 i!1204)) (= lt!232165 (MissingVacant!4111 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32617 (_ BitVec 32)) SeekEntryResult!4111)

(assert (=> b!508001 (= lt!232165 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508002 () Bool)

(declare-fun res!309018 () Bool)

(assert (=> b!508002 (=> (not res!309018) (not e!297244))))

(assert (=> b!508002 (= res!309018 (validKeyInArray!0 k0!2280))))

(declare-fun b!508003 () Bool)

(declare-fun res!309015 () Bool)

(assert (=> b!508003 (=> (not res!309015) (not e!297245))))

(declare-datatypes ((List!9753 0))(
  ( (Nil!9750) (Cons!9749 (h!10626 (_ BitVec 64)) (t!15973 List!9753)) )
))
(declare-fun arrayNoDuplicates!0 (array!32617 (_ BitVec 32) List!9753) Bool)

(assert (=> b!508003 (= res!309015 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9750))))

(declare-fun b!508004 () Bool)

(declare-fun res!309016 () Bool)

(assert (=> b!508004 (=> (not res!309016) (not e!297245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32617 (_ BitVec 32)) Bool)

(assert (=> b!508004 (= res!309016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!309012 () Bool)

(assert (=> start!45860 (=> (not res!309012) (not e!297244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45860 (= res!309012 (validMask!0 mask!3524))))

(assert (=> start!45860 e!297244))

(assert (=> start!45860 true))

(declare-fun array_inv!11547 (array!32617) Bool)

(assert (=> start!45860 (array_inv!11547 a!3235)))

(declare-fun b!508005 () Bool)

(assert (=> b!508005 (= e!297245 (bvsgt #b00000000000000000000000000000000 (size!16052 a!3235)))))

(declare-fun b!508006 () Bool)

(declare-fun res!309014 () Bool)

(assert (=> b!508006 (=> (not res!309014) (not e!297244))))

(assert (=> b!508006 (= res!309014 (and (= (size!16052 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16052 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16052 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45860 res!309012) b!508006))

(assert (= (and b!508006 res!309014) b!508000))

(assert (= (and b!508000 res!309017) b!508002))

(assert (= (and b!508002 res!309018) b!507999))

(assert (= (and b!507999 res!309013) b!508001))

(assert (= (and b!508001 res!309019) b!508004))

(assert (= (and b!508004 res!309016) b!508003))

(assert (= (and b!508003 res!309015) b!508005))

(declare-fun m!489079 () Bool)

(assert (=> b!508001 m!489079))

(declare-fun m!489081 () Bool)

(assert (=> start!45860 m!489081))

(declare-fun m!489083 () Bool)

(assert (=> start!45860 m!489083))

(declare-fun m!489085 () Bool)

(assert (=> b!508000 m!489085))

(assert (=> b!508000 m!489085))

(declare-fun m!489087 () Bool)

(assert (=> b!508000 m!489087))

(declare-fun m!489089 () Bool)

(assert (=> b!508003 m!489089))

(declare-fun m!489091 () Bool)

(assert (=> b!508002 m!489091))

(declare-fun m!489093 () Bool)

(assert (=> b!507999 m!489093))

(declare-fun m!489095 () Bool)

(assert (=> b!508004 m!489095))

(check-sat (not b!508000) (not b!508004) (not b!508002) (not b!507999) (not b!508001) (not start!45860) (not b!508003))
(check-sat)
