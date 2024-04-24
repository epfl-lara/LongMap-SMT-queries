; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64236 () Bool)

(assert start!64236)

(declare-fun b!720945 () Bool)

(declare-fun e!404410 () Bool)

(assert (=> b!720945 (= e!404410 false)))

(declare-datatypes ((array!40807 0))(
  ( (array!40808 (arr!19525 (Array (_ BitVec 32) (_ BitVec 64))) (size!19945 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40807)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!319985 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720945 (= lt!319985 (toIndex!0 (select (store (arr!19525 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun e!404411 () Bool)

(declare-fun b!720946 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7081 0))(
  ( (MissingZero!7081 (index!30692 (_ BitVec 32))) (Found!7081 (index!30693 (_ BitVec 32))) (Intermediate!7081 (undefined!7893 Bool) (index!30694 (_ BitVec 32)) (x!61852 (_ BitVec 32))) (Undefined!7081) (MissingVacant!7081 (index!30695 (_ BitVec 32))) )
))
(declare-fun lt!319984 () SeekEntryResult!7081)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40807 (_ BitVec 32)) SeekEntryResult!7081)

(assert (=> b!720946 (= e!404411 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19525 a!3186) j!159) a!3186 mask!3328) lt!319984))))

(declare-fun b!720947 () Bool)

(declare-fun res!482945 () Bool)

(declare-fun e!404408 () Bool)

(assert (=> b!720947 (=> (not res!482945) (not e!404408))))

(declare-fun arrayContainsKey!0 (array!40807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720947 (= res!482945 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720948 () Bool)

(declare-fun res!482946 () Bool)

(declare-fun e!404412 () Bool)

(assert (=> b!720948 (=> (not res!482946) (not e!404412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40807 (_ BitVec 32)) Bool)

(assert (=> b!720948 (= res!482946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720949 () Bool)

(declare-fun res!482936 () Bool)

(assert (=> b!720949 (=> (not res!482936) (not e!404410))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!720949 (= res!482936 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19525 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720950 () Bool)

(assert (=> b!720950 (= e!404412 e!404410)))

(declare-fun res!482947 () Bool)

(assert (=> b!720950 (=> (not res!482947) (not e!404410))))

(assert (=> b!720950 (= res!482947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19525 a!3186) j!159) mask!3328) (select (arr!19525 a!3186) j!159) a!3186 mask!3328) lt!319984))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720950 (= lt!319984 (Intermediate!7081 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720951 () Bool)

(declare-fun res!482944 () Bool)

(assert (=> b!720951 (=> (not res!482944) (not e!404412))))

(assert (=> b!720951 (= res!482944 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19945 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19945 a!3186))))))

(declare-fun b!720952 () Bool)

(declare-fun res!482942 () Bool)

(assert (=> b!720952 (=> (not res!482942) (not e!404408))))

(assert (=> b!720952 (= res!482942 (and (= (size!19945 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19945 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19945 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!482943 () Bool)

(assert (=> start!64236 (=> (not res!482943) (not e!404408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64236 (= res!482943 (validMask!0 mask!3328))))

(assert (=> start!64236 e!404408))

(assert (=> start!64236 true))

(declare-fun array_inv!15384 (array!40807) Bool)

(assert (=> start!64236 (array_inv!15384 a!3186)))

(declare-fun b!720953 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40807 (_ BitVec 32)) SeekEntryResult!7081)

(assert (=> b!720953 (= e!404411 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19525 a!3186) j!159) a!3186 mask!3328) (Found!7081 j!159)))))

(declare-fun b!720954 () Bool)

(declare-fun res!482941 () Bool)

(assert (=> b!720954 (=> (not res!482941) (not e!404412))))

(declare-datatypes ((List!13434 0))(
  ( (Nil!13431) (Cons!13430 (h!14484 (_ BitVec 64)) (t!19741 List!13434)) )
))
(declare-fun arrayNoDuplicates!0 (array!40807 (_ BitVec 32) List!13434) Bool)

(assert (=> b!720954 (= res!482941 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13431))))

(declare-fun b!720955 () Bool)

(assert (=> b!720955 (= e!404408 e!404412)))

(declare-fun res!482938 () Bool)

(assert (=> b!720955 (=> (not res!482938) (not e!404412))))

(declare-fun lt!319986 () SeekEntryResult!7081)

(assert (=> b!720955 (= res!482938 (or (= lt!319986 (MissingZero!7081 i!1173)) (= lt!319986 (MissingVacant!7081 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40807 (_ BitVec 32)) SeekEntryResult!7081)

(assert (=> b!720955 (= lt!319986 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720956 () Bool)

(declare-fun res!482940 () Bool)

(assert (=> b!720956 (=> (not res!482940) (not e!404408))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720956 (= res!482940 (validKeyInArray!0 k0!2102))))

(declare-fun b!720957 () Bool)

(declare-fun res!482939 () Bool)

(assert (=> b!720957 (=> (not res!482939) (not e!404408))))

(assert (=> b!720957 (= res!482939 (validKeyInArray!0 (select (arr!19525 a!3186) j!159)))))

(declare-fun b!720958 () Bool)

(declare-fun res!482937 () Bool)

(assert (=> b!720958 (=> (not res!482937) (not e!404410))))

(assert (=> b!720958 (= res!482937 e!404411)))

(declare-fun c!79376 () Bool)

(assert (=> b!720958 (= c!79376 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64236 res!482943) b!720952))

(assert (= (and b!720952 res!482942) b!720957))

(assert (= (and b!720957 res!482939) b!720956))

(assert (= (and b!720956 res!482940) b!720947))

(assert (= (and b!720947 res!482945) b!720955))

(assert (= (and b!720955 res!482938) b!720948))

(assert (= (and b!720948 res!482946) b!720954))

(assert (= (and b!720954 res!482941) b!720951))

(assert (= (and b!720951 res!482944) b!720950))

(assert (= (and b!720950 res!482947) b!720949))

(assert (= (and b!720949 res!482936) b!720958))

(assert (= (and b!720958 c!79376) b!720946))

(assert (= (and b!720958 (not c!79376)) b!720953))

(assert (= (and b!720958 res!482937) b!720945))

(declare-fun m!676509 () Bool)

(assert (=> start!64236 m!676509))

(declare-fun m!676511 () Bool)

(assert (=> start!64236 m!676511))

(declare-fun m!676513 () Bool)

(assert (=> b!720956 m!676513))

(declare-fun m!676515 () Bool)

(assert (=> b!720950 m!676515))

(assert (=> b!720950 m!676515))

(declare-fun m!676517 () Bool)

(assert (=> b!720950 m!676517))

(assert (=> b!720950 m!676517))

(assert (=> b!720950 m!676515))

(declare-fun m!676519 () Bool)

(assert (=> b!720950 m!676519))

(declare-fun m!676521 () Bool)

(assert (=> b!720948 m!676521))

(assert (=> b!720946 m!676515))

(assert (=> b!720946 m!676515))

(declare-fun m!676523 () Bool)

(assert (=> b!720946 m!676523))

(assert (=> b!720957 m!676515))

(assert (=> b!720957 m!676515))

(declare-fun m!676525 () Bool)

(assert (=> b!720957 m!676525))

(declare-fun m!676527 () Bool)

(assert (=> b!720947 m!676527))

(declare-fun m!676529 () Bool)

(assert (=> b!720954 m!676529))

(assert (=> b!720953 m!676515))

(assert (=> b!720953 m!676515))

(declare-fun m!676531 () Bool)

(assert (=> b!720953 m!676531))

(declare-fun m!676533 () Bool)

(assert (=> b!720955 m!676533))

(declare-fun m!676535 () Bool)

(assert (=> b!720945 m!676535))

(declare-fun m!676537 () Bool)

(assert (=> b!720945 m!676537))

(assert (=> b!720945 m!676537))

(declare-fun m!676539 () Bool)

(assert (=> b!720945 m!676539))

(declare-fun m!676541 () Bool)

(assert (=> b!720949 m!676541))

(check-sat (not b!720954) (not start!64236) (not b!720947) (not b!720953) (not b!720945) (not b!720957) (not b!720946) (not b!720948) (not b!720950) (not b!720956) (not b!720955))
(check-sat)
