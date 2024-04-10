; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32708 () Bool)

(assert start!32708)

(declare-fun res!179957 () Bool)

(declare-fun e!201170 () Bool)

(assert (=> start!32708 (=> (not res!179957) (not e!201170))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32708 (= res!179957 (validMask!0 mask!3777))))

(assert (=> start!32708 e!201170))

(declare-datatypes ((array!16745 0))(
  ( (array!16746 (arr!7927 (Array (_ BitVec 32) (_ BitVec 64))) (size!8279 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16745)

(declare-fun array_inv!5890 (array!16745) Bool)

(assert (=> start!32708 (array_inv!5890 a!3305)))

(assert (=> start!32708 true))

(declare-fun b!326921 () Bool)

(declare-fun res!179955 () Bool)

(assert (=> b!326921 (=> (not res!179955) (not e!201170))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3058 0))(
  ( (MissingZero!3058 (index!14408 (_ BitVec 32))) (Found!3058 (index!14409 (_ BitVec 32))) (Intermediate!3058 (undefined!3870 Bool) (index!14410 (_ BitVec 32)) (x!32648 (_ BitVec 32))) (Undefined!3058) (MissingVacant!3058 (index!14411 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16745 (_ BitVec 32)) SeekEntryResult!3058)

(assert (=> b!326921 (= res!179955 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!3058 i!1250)))))

(declare-fun b!326922 () Bool)

(declare-fun e!201171 () Bool)

(assert (=> b!326922 (= e!201170 e!201171)))

(declare-fun res!179956 () Bool)

(assert (=> b!326922 (=> (not res!179956) (not e!201171))))

(declare-fun lt!157421 () SeekEntryResult!3058)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16745 (_ BitVec 32)) SeekEntryResult!3058)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326922 (= res!179956 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!157421))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!326922 (= lt!157421 (Intermediate!3058 false resIndex!58 resX!58))))

(declare-fun b!326923 () Bool)

(declare-fun res!179954 () Bool)

(assert (=> b!326923 (=> (not res!179954) (not e!201171))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!326923 (= res!179954 (and (= (select (arr!7927 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8279 a!3305))))))

(declare-fun b!326924 () Bool)

(declare-fun res!179958 () Bool)

(assert (=> b!326924 (=> (not res!179958) (not e!201170))))

(declare-fun arrayContainsKey!0 (array!16745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!326924 (= res!179958 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!326925 () Bool)

(declare-fun res!179953 () Bool)

(assert (=> b!326925 (=> (not res!179953) (not e!201171))))

(assert (=> b!326925 (= res!179953 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7927 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!326926 () Bool)

(declare-fun res!179960 () Bool)

(assert (=> b!326926 (=> (not res!179960) (not e!201171))))

(assert (=> b!326926 (= res!179960 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!157421))))

(declare-fun b!326927 () Bool)

(declare-fun res!179961 () Bool)

(assert (=> b!326927 (=> (not res!179961) (not e!201170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!326927 (= res!179961 (validKeyInArray!0 k!2497))))

(declare-fun b!326928 () Bool)

(declare-fun res!179959 () Bool)

(assert (=> b!326928 (=> (not res!179959) (not e!201170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16745 (_ BitVec 32)) Bool)

(assert (=> b!326928 (= res!179959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!326929 () Bool)

(assert (=> b!326929 (= e!201171 false)))

(declare-datatypes ((Unit!10150 0))(
  ( (Unit!10151) )
))
(declare-fun lt!157422 () Unit!10150)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16745 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10150)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!326929 (= lt!157422 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!326930 () Bool)

(declare-fun res!179952 () Bool)

(assert (=> b!326930 (=> (not res!179952) (not e!201170))))

(assert (=> b!326930 (= res!179952 (and (= (size!8279 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8279 a!3305))))))

(assert (= (and start!32708 res!179957) b!326930))

(assert (= (and b!326930 res!179952) b!326927))

(assert (= (and b!326927 res!179961) b!326924))

(assert (= (and b!326924 res!179958) b!326921))

(assert (= (and b!326921 res!179955) b!326928))

(assert (= (and b!326928 res!179959) b!326922))

(assert (= (and b!326922 res!179956) b!326923))

(assert (= (and b!326923 res!179954) b!326926))

(assert (= (and b!326926 res!179960) b!326925))

(assert (= (and b!326925 res!179953) b!326929))

(declare-fun m!333405 () Bool)

(assert (=> b!326928 m!333405))

(declare-fun m!333407 () Bool)

(assert (=> b!326923 m!333407))

(declare-fun m!333409 () Bool)

(assert (=> b!326922 m!333409))

(assert (=> b!326922 m!333409))

(declare-fun m!333411 () Bool)

(assert (=> b!326922 m!333411))

(declare-fun m!333413 () Bool)

(assert (=> start!32708 m!333413))

(declare-fun m!333415 () Bool)

(assert (=> start!32708 m!333415))

(declare-fun m!333417 () Bool)

(assert (=> b!326929 m!333417))

(assert (=> b!326929 m!333417))

(declare-fun m!333419 () Bool)

(assert (=> b!326929 m!333419))

(declare-fun m!333421 () Bool)

(assert (=> b!326924 m!333421))

(declare-fun m!333423 () Bool)

(assert (=> b!326921 m!333423))

(declare-fun m!333425 () Bool)

(assert (=> b!326925 m!333425))

(declare-fun m!333427 () Bool)

(assert (=> b!326926 m!333427))

(declare-fun m!333429 () Bool)

(assert (=> b!326927 m!333429))

(push 1)

(assert (not start!32708))

(assert (not b!326926))

(assert (not b!326927))

(assert (not b!326922))

