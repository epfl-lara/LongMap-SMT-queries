; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32706 () Bool)

(assert start!32706)

(declare-fun b!326891 () Bool)

(declare-fun res!179930 () Bool)

(declare-fun e!201163 () Bool)

(assert (=> b!326891 (=> (not res!179930) (not e!201163))))

(declare-datatypes ((array!16743 0))(
  ( (array!16744 (arr!7926 (Array (_ BitVec 32) (_ BitVec 64))) (size!8278 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16743)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!326891 (= res!179930 (and (= (size!8278 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8278 a!3305))))))

(declare-fun b!326892 () Bool)

(declare-fun res!179929 () Bool)

(declare-fun e!201161 () Bool)

(assert (=> b!326892 (=> (not res!179929) (not e!201161))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3057 0))(
  ( (MissingZero!3057 (index!14404 (_ BitVec 32))) (Found!3057 (index!14405 (_ BitVec 32))) (Intermediate!3057 (undefined!3869 Bool) (index!14406 (_ BitVec 32)) (x!32647 (_ BitVec 32))) (Undefined!3057) (MissingVacant!3057 (index!14407 (_ BitVec 32))) )
))
(declare-fun lt!157415 () SeekEntryResult!3057)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16743 (_ BitVec 32)) SeekEntryResult!3057)

(assert (=> b!326892 (= res!179929 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!157415))))

(declare-fun b!326893 () Bool)

(assert (=> b!326893 (= e!201163 e!201161)))

(declare-fun res!179928 () Bool)

(assert (=> b!326893 (=> (not res!179928) (not e!201161))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326893 (= res!179928 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157415))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326893 (= lt!157415 (Intermediate!3057 false resIndex!58 resX!58))))

(declare-fun b!326894 () Bool)

(declare-fun res!179931 () Bool)

(assert (=> b!326894 (=> (not res!179931) (not e!201161))))

(assert (=> b!326894 (= res!179931 (and (= (select (arr!7926 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8278 a!3305))))))

(declare-fun b!326895 () Bool)

(declare-fun res!179923 () Bool)

(assert (=> b!326895 (=> (not res!179923) (not e!201163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16743 (_ BitVec 32)) Bool)

(assert (=> b!326895 (= res!179923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326896 () Bool)

(declare-fun res!179925 () Bool)

(assert (=> b!326896 (=> (not res!179925) (not e!201163))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326896 (= res!179925 (validKeyInArray!0 k0!2497))))

(declare-fun b!326897 () Bool)

(declare-fun res!179926 () Bool)

(assert (=> b!326897 (=> (not res!179926) (not e!201161))))

(assert (=> b!326897 (= res!179926 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7926 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun res!179927 () Bool)

(assert (=> start!32706 (=> (not res!179927) (not e!201163))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32706 (= res!179927 (validMask!0 mask!3777))))

(assert (=> start!32706 e!201163))

(declare-fun array_inv!5889 (array!16743) Bool)

(assert (=> start!32706 (array_inv!5889 a!3305)))

(assert (=> start!32706 true))

(declare-fun b!326898 () Bool)

(declare-fun res!179922 () Bool)

(assert (=> b!326898 (=> (not res!179922) (not e!201163))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16743 (_ BitVec 32)) SeekEntryResult!3057)

(assert (=> b!326898 (= res!179922 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3057 i!1250)))))

(declare-fun b!326899 () Bool)

(declare-fun res!179924 () Bool)

(assert (=> b!326899 (=> (not res!179924) (not e!201163))))

(declare-fun arrayContainsKey!0 (array!16743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326899 (= res!179924 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326900 () Bool)

(assert (=> b!326900 (= e!201161 false)))

(declare-datatypes ((Unit!10148 0))(
  ( (Unit!10149) )
))
(declare-fun lt!157416 () Unit!10148)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16743 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10148)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326900 (= lt!157416 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(assert (= (and start!32706 res!179927) b!326891))

(assert (= (and b!326891 res!179930) b!326896))

(assert (= (and b!326896 res!179925) b!326899))

(assert (= (and b!326899 res!179924) b!326898))

(assert (= (and b!326898 res!179922) b!326895))

(assert (= (and b!326895 res!179923) b!326893))

(assert (= (and b!326893 res!179928) b!326894))

(assert (= (and b!326894 res!179931) b!326892))

(assert (= (and b!326892 res!179929) b!326897))

(assert (= (and b!326897 res!179926) b!326900))

(declare-fun m!333379 () Bool)

(assert (=> b!326898 m!333379))

(declare-fun m!333381 () Bool)

(assert (=> b!326899 m!333381))

(declare-fun m!333383 () Bool)

(assert (=> start!32706 m!333383))

(declare-fun m!333385 () Bool)

(assert (=> start!32706 m!333385))

(declare-fun m!333387 () Bool)

(assert (=> b!326900 m!333387))

(assert (=> b!326900 m!333387))

(declare-fun m!333389 () Bool)

(assert (=> b!326900 m!333389))

(declare-fun m!333391 () Bool)

(assert (=> b!326895 m!333391))

(declare-fun m!333393 () Bool)

(assert (=> b!326892 m!333393))

(declare-fun m!333395 () Bool)

(assert (=> b!326896 m!333395))

(declare-fun m!333397 () Bool)

(assert (=> b!326893 m!333397))

(assert (=> b!326893 m!333397))

(declare-fun m!333399 () Bool)

(assert (=> b!326893 m!333399))

(declare-fun m!333401 () Bool)

(assert (=> b!326897 m!333401))

(declare-fun m!333403 () Bool)

(assert (=> b!326894 m!333403))

(check-sat (not b!326893) (not start!32706) (not b!326895) (not b!326892) (not b!326900) (not b!326896) (not b!326898) (not b!326899))
(check-sat)
