; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45870 () Bool)

(assert start!45870)

(declare-fun b!507931 () Bool)

(declare-fun res!309036 () Bool)

(declare-fun e!297165 () Bool)

(assert (=> b!507931 (=> (not res!309036) (not e!297165))))

(declare-datatypes ((array!32636 0))(
  ( (array!32637 (arr!15698 (Array (_ BitVec 32) (_ BitVec 64))) (size!16063 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32636)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32636 (_ BitVec 32)) Bool)

(assert (=> b!507931 (= res!309036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!309035 () Bool)

(declare-fun e!297163 () Bool)

(assert (=> start!45870 (=> (not res!309035) (not e!297163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45870 (= res!309035 (validMask!0 mask!3524))))

(assert (=> start!45870 e!297163))

(assert (=> start!45870 true))

(declare-fun array_inv!11581 (array!32636) Bool)

(assert (=> start!45870 (array_inv!11581 a!3235)))

(declare-fun b!507932 () Bool)

(declare-fun res!309038 () Bool)

(assert (=> b!507932 (=> (not res!309038) (not e!297163))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507932 (= res!309038 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!507933 () Bool)

(declare-fun res!309032 () Bool)

(assert (=> b!507933 (=> (not res!309032) (not e!297163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507933 (= res!309032 (validKeyInArray!0 k0!2280))))

(declare-fun b!507934 () Bool)

(declare-fun res!309034 () Bool)

(assert (=> b!507934 (=> (not res!309034) (not e!297163))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507934 (= res!309034 (validKeyInArray!0 (select (arr!15698 a!3235) j!176)))))

(declare-fun b!507935 () Bool)

(declare-fun res!309037 () Bool)

(assert (=> b!507935 (=> (not res!309037) (not e!297163))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507935 (= res!309037 (and (= (size!16063 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16063 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16063 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507936 () Bool)

(assert (=> b!507936 (= e!297163 e!297165)))

(declare-fun res!309033 () Bool)

(assert (=> b!507936 (=> (not res!309033) (not e!297165))))

(declare-datatypes ((SeekEntryResult!4162 0))(
  ( (MissingZero!4162 (index!18836 (_ BitVec 32))) (Found!4162 (index!18837 (_ BitVec 32))) (Intermediate!4162 (undefined!4974 Bool) (index!18838 (_ BitVec 32)) (x!47830 (_ BitVec 32))) (Undefined!4162) (MissingVacant!4162 (index!18839 (_ BitVec 32))) )
))
(declare-fun lt!231940 () SeekEntryResult!4162)

(assert (=> b!507936 (= res!309033 (or (= lt!231940 (MissingZero!4162 i!1204)) (= lt!231940 (MissingVacant!4162 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32636 (_ BitVec 32)) SeekEntryResult!4162)

(assert (=> b!507936 (= lt!231940 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507937 () Bool)

(assert (=> b!507937 (= e!297165 false)))

(declare-fun lt!231939 () Bool)

(declare-datatypes ((List!9895 0))(
  ( (Nil!9892) (Cons!9891 (h!10768 (_ BitVec 64)) (t!16114 List!9895)) )
))
(declare-fun arrayNoDuplicates!0 (array!32636 (_ BitVec 32) List!9895) Bool)

(assert (=> b!507937 (= lt!231939 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9892))))

(assert (= (and start!45870 res!309035) b!507935))

(assert (= (and b!507935 res!309037) b!507934))

(assert (= (and b!507934 res!309034) b!507933))

(assert (= (and b!507933 res!309032) b!507932))

(assert (= (and b!507932 res!309038) b!507936))

(assert (= (and b!507936 res!309033) b!507931))

(assert (= (and b!507931 res!309036) b!507937))

(declare-fun m!488251 () Bool)

(assert (=> b!507932 m!488251))

(declare-fun m!488253 () Bool)

(assert (=> b!507936 m!488253))

(declare-fun m!488255 () Bool)

(assert (=> b!507931 m!488255))

(declare-fun m!488257 () Bool)

(assert (=> start!45870 m!488257))

(declare-fun m!488259 () Bool)

(assert (=> start!45870 m!488259))

(declare-fun m!488261 () Bool)

(assert (=> b!507933 m!488261))

(declare-fun m!488263 () Bool)

(assert (=> b!507934 m!488263))

(assert (=> b!507934 m!488263))

(declare-fun m!488265 () Bool)

(assert (=> b!507934 m!488265))

(declare-fun m!488267 () Bool)

(assert (=> b!507937 m!488267))

(check-sat (not b!507937) (not b!507932) (not start!45870) (not b!507934) (not b!507933) (not b!507936) (not b!507931))
(check-sat)
