; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45286 () Bool)

(assert start!45286)

(declare-fun b!497566 () Bool)

(declare-fun res!299948 () Bool)

(declare-fun e!291643 () Bool)

(assert (=> b!497566 (=> (not res!299948) (not e!291643))))

(declare-datatypes ((array!32174 0))(
  ( (array!32175 (arr!15470 (Array (_ BitVec 32) (_ BitVec 64))) (size!15834 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32174)

(declare-datatypes ((List!9628 0))(
  ( (Nil!9625) (Cons!9624 (h!10495 (_ BitVec 64)) (t!15856 List!9628)) )
))
(declare-fun arrayNoDuplicates!0 (array!32174 (_ BitVec 32) List!9628) Bool)

(assert (=> b!497566 (= res!299948 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9625))))

(declare-fun b!497567 () Bool)

(declare-fun res!299937 () Bool)

(declare-fun e!291644 () Bool)

(assert (=> b!497567 (=> (not res!299937) (not e!291644))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497567 (= res!299937 (and (= (size!15834 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15834 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15834 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497568 () Bool)

(declare-fun e!291645 () Bool)

(assert (=> b!497568 (= e!291645 false)))

(declare-fun b!497569 () Bool)

(declare-fun e!291642 () Bool)

(assert (=> b!497569 (= e!291643 (not e!291642))))

(declare-fun res!299944 () Bool)

(assert (=> b!497569 (=> res!299944 e!291642)))

(declare-datatypes ((SeekEntryResult!3937 0))(
  ( (MissingZero!3937 (index!17927 (_ BitVec 32))) (Found!3937 (index!17928 (_ BitVec 32))) (Intermediate!3937 (undefined!4749 Bool) (index!17929 (_ BitVec 32)) (x!46973 (_ BitVec 32))) (Undefined!3937) (MissingVacant!3937 (index!17930 (_ BitVec 32))) )
))
(declare-fun lt!225276 () SeekEntryResult!3937)

(declare-fun lt!225278 () array!32174)

(declare-fun lt!225281 () (_ BitVec 64))

(declare-fun lt!225283 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32174 (_ BitVec 32)) SeekEntryResult!3937)

(assert (=> b!497569 (= res!299944 (= lt!225276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225283 lt!225281 lt!225278 mask!3524)))))

(declare-fun lt!225279 () (_ BitVec 32))

(assert (=> b!497569 (= lt!225276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225279 (select (arr!15470 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497569 (= lt!225283 (toIndex!0 lt!225281 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!497569 (= lt!225281 (select (store (arr!15470 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!497569 (= lt!225279 (toIndex!0 (select (arr!15470 a!3235) j!176) mask!3524))))

(assert (=> b!497569 (= lt!225278 (array!32175 (store (arr!15470 a!3235) i!1204 k!2280) (size!15834 a!3235)))))

(declare-fun e!291640 () Bool)

(assert (=> b!497569 e!291640))

(declare-fun res!299947 () Bool)

(assert (=> b!497569 (=> (not res!299947) (not e!291640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32174 (_ BitVec 32)) Bool)

(assert (=> b!497569 (= res!299947 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14824 0))(
  ( (Unit!14825) )
))
(declare-fun lt!225280 () Unit!14824)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14824)

(assert (=> b!497569 (= lt!225280 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497570 () Bool)

(assert (=> b!497570 (= e!291642 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!497570 (and (or (= (select (arr!15470 a!3235) (index!17929 lt!225276)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15470 a!3235) (index!17929 lt!225276)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15470 a!3235) (index!17929 lt!225276)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15470 a!3235) (index!17929 lt!225276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225282 () Unit!14824)

(declare-fun e!291641 () Unit!14824)

(assert (=> b!497570 (= lt!225282 e!291641)))

(declare-fun c!59090 () Bool)

(assert (=> b!497570 (= c!59090 (= (select (arr!15470 a!3235) (index!17929 lt!225276)) (select (arr!15470 a!3235) j!176)))))

(assert (=> b!497570 (and (bvslt (x!46973 lt!225276) #b01111111111111111111111111111110) (or (= (select (arr!15470 a!3235) (index!17929 lt!225276)) (select (arr!15470 a!3235) j!176)) (= (select (arr!15470 a!3235) (index!17929 lt!225276)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15470 a!3235) (index!17929 lt!225276)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497571 () Bool)

(declare-fun Unit!14826 () Unit!14824)

(assert (=> b!497571 (= e!291641 Unit!14826)))

(declare-fun lt!225277 () Unit!14824)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32174 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14824)

(assert (=> b!497571 (= lt!225277 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225279 #b00000000000000000000000000000000 (index!17929 lt!225276) (x!46973 lt!225276) mask!3524))))

(declare-fun res!299945 () Bool)

(assert (=> b!497571 (= res!299945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225279 lt!225281 lt!225278 mask!3524) (Intermediate!3937 false (index!17929 lt!225276) (x!46973 lt!225276))))))

(assert (=> b!497571 (=> (not res!299945) (not e!291645))))

(assert (=> b!497571 e!291645))

(declare-fun b!497572 () Bool)

(declare-fun res!299943 () Bool)

(assert (=> b!497572 (=> (not res!299943) (not e!291644))))

(declare-fun arrayContainsKey!0 (array!32174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497572 (= res!299943 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497573 () Bool)

(declare-fun res!299940 () Bool)

(assert (=> b!497573 (=> (not res!299940) (not e!291644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497573 (= res!299940 (validKeyInArray!0 (select (arr!15470 a!3235) j!176)))))

(declare-fun res!299946 () Bool)

(assert (=> start!45286 (=> (not res!299946) (not e!291644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45286 (= res!299946 (validMask!0 mask!3524))))

(assert (=> start!45286 e!291644))

(assert (=> start!45286 true))

(declare-fun array_inv!11266 (array!32174) Bool)

(assert (=> start!45286 (array_inv!11266 a!3235)))

(declare-fun b!497574 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32174 (_ BitVec 32)) SeekEntryResult!3937)

(assert (=> b!497574 (= e!291640 (= (seekEntryOrOpen!0 (select (arr!15470 a!3235) j!176) a!3235 mask!3524) (Found!3937 j!176)))))

(declare-fun b!497575 () Bool)

(assert (=> b!497575 (= e!291644 e!291643)))

(declare-fun res!299942 () Bool)

(assert (=> b!497575 (=> (not res!299942) (not e!291643))))

(declare-fun lt!225275 () SeekEntryResult!3937)

(assert (=> b!497575 (= res!299942 (or (= lt!225275 (MissingZero!3937 i!1204)) (= lt!225275 (MissingVacant!3937 i!1204))))))

(assert (=> b!497575 (= lt!225275 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497576 () Bool)

(declare-fun res!299938 () Bool)

(assert (=> b!497576 (=> (not res!299938) (not e!291643))))

(assert (=> b!497576 (= res!299938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497577 () Bool)

(declare-fun res!299941 () Bool)

(assert (=> b!497577 (=> res!299941 e!291642)))

(assert (=> b!497577 (= res!299941 (or (undefined!4749 lt!225276) (not (is-Intermediate!3937 lt!225276))))))

(declare-fun b!497578 () Bool)

(declare-fun res!299939 () Bool)

(assert (=> b!497578 (=> (not res!299939) (not e!291644))))

(assert (=> b!497578 (= res!299939 (validKeyInArray!0 k!2280))))

(declare-fun b!497579 () Bool)

(declare-fun Unit!14827 () Unit!14824)

(assert (=> b!497579 (= e!291641 Unit!14827)))

(assert (= (and start!45286 res!299946) b!497567))

(assert (= (and b!497567 res!299937) b!497573))

(assert (= (and b!497573 res!299940) b!497578))

(assert (= (and b!497578 res!299939) b!497572))

(assert (= (and b!497572 res!299943) b!497575))

(assert (= (and b!497575 res!299942) b!497576))

(assert (= (and b!497576 res!299938) b!497566))

(assert (= (and b!497566 res!299948) b!497569))

(assert (= (and b!497569 res!299947) b!497574))

(assert (= (and b!497569 (not res!299944)) b!497577))

(assert (= (and b!497577 (not res!299941)) b!497570))

(assert (= (and b!497570 c!59090) b!497571))

(assert (= (and b!497570 (not c!59090)) b!497579))

(assert (= (and b!497571 res!299945) b!497568))

(declare-fun m!478953 () Bool)

(assert (=> b!497572 m!478953))

(declare-fun m!478955 () Bool)

(assert (=> b!497566 m!478955))

(declare-fun m!478957 () Bool)

(assert (=> b!497576 m!478957))

(declare-fun m!478959 () Bool)

(assert (=> b!497574 m!478959))

(assert (=> b!497574 m!478959))

(declare-fun m!478961 () Bool)

(assert (=> b!497574 m!478961))

(declare-fun m!478963 () Bool)

(assert (=> b!497578 m!478963))

(assert (=> b!497573 m!478959))

(assert (=> b!497573 m!478959))

(declare-fun m!478965 () Bool)

(assert (=> b!497573 m!478965))

(declare-fun m!478967 () Bool)

(assert (=> b!497575 m!478967))

(declare-fun m!478969 () Bool)

(assert (=> b!497570 m!478969))

(assert (=> b!497570 m!478959))

(assert (=> b!497569 m!478959))

(declare-fun m!478971 () Bool)

(assert (=> b!497569 m!478971))

(declare-fun m!478973 () Bool)

(assert (=> b!497569 m!478973))

(declare-fun m!478975 () Bool)

(assert (=> b!497569 m!478975))

(declare-fun m!478977 () Bool)

(assert (=> b!497569 m!478977))

(assert (=> b!497569 m!478959))

(declare-fun m!478979 () Bool)

(assert (=> b!497569 m!478979))

(assert (=> b!497569 m!478959))

(declare-fun m!478981 () Bool)

(assert (=> b!497569 m!478981))

(declare-fun m!478983 () Bool)

(assert (=> b!497569 m!478983))

(declare-fun m!478985 () Bool)

(assert (=> b!497569 m!478985))

(declare-fun m!478987 () Bool)

(assert (=> start!45286 m!478987))

(declare-fun m!478989 () Bool)

(assert (=> start!45286 m!478989))

(declare-fun m!478991 () Bool)

(assert (=> b!497571 m!478991))

(declare-fun m!478993 () Bool)

(assert (=> b!497571 m!478993))

(push 1)

