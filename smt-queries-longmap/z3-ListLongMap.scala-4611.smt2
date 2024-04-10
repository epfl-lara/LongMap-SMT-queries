; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64302 () Bool)

(assert start!64302)

(declare-fun b!722347 () Bool)

(declare-fun res!484082 () Bool)

(declare-fun e!404896 () Bool)

(assert (=> b!722347 (=> (not res!484082) (not e!404896))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40883 0))(
  ( (array!40884 (arr!19564 (Array (_ BitVec 32) (_ BitVec 64))) (size!19985 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40883)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722347 (= res!484082 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19985 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19985 a!3186))))))

(declare-fun b!722348 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!404898 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7164 0))(
  ( (MissingZero!7164 (index!31024 (_ BitVec 32))) (Found!7164 (index!31025 (_ BitVec 32))) (Intermediate!7164 (undefined!7976 Bool) (index!31026 (_ BitVec 32)) (x!62029 (_ BitVec 32))) (Undefined!7164) (MissingVacant!7164 (index!31027 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40883 (_ BitVec 32)) SeekEntryResult!7164)

(assert (=> b!722348 (= e!404898 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19564 a!3186) j!159) a!3186 mask!3328) (Found!7164 j!159)))))

(declare-fun b!722350 () Bool)

(declare-fun res!484075 () Bool)

(declare-fun e!404900 () Bool)

(assert (=> b!722350 (=> (not res!484075) (not e!404900))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722350 (= res!484075 (validKeyInArray!0 (select (arr!19564 a!3186) j!159)))))

(declare-fun b!722351 () Bool)

(declare-fun lt!320257 () SeekEntryResult!7164)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40883 (_ BitVec 32)) SeekEntryResult!7164)

(assert (=> b!722351 (= e!404898 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19564 a!3186) j!159) a!3186 mask!3328) lt!320257))))

(declare-fun b!722352 () Bool)

(declare-fun res!484078 () Bool)

(declare-fun e!404899 () Bool)

(assert (=> b!722352 (=> (not res!484078) (not e!404899))))

(assert (=> b!722352 (= res!484078 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!722353 () Bool)

(declare-fun res!484081 () Bool)

(assert (=> b!722353 (=> (not res!484081) (not e!404899))))

(assert (=> b!722353 (= res!484081 e!404898)))

(declare-fun c!79510 () Bool)

(assert (=> b!722353 (= c!79510 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722354 () Bool)

(declare-fun res!484071 () Bool)

(assert (=> b!722354 (=> (not res!484071) (not e!404899))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722354 (= res!484071 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19564 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!722355 () Bool)

(declare-fun res!484077 () Bool)

(assert (=> b!722355 (=> (not res!484077) (not e!404900))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!722355 (= res!484077 (validKeyInArray!0 k0!2102))))

(declare-fun b!722356 () Bool)

(assert (=> b!722356 (= e!404899 (not (validKeyInArray!0 (select (store (arr!19564 a!3186) i!1173 k0!2102) j!159))))))

(declare-fun b!722357 () Bool)

(assert (=> b!722357 (= e!404896 e!404899)))

(declare-fun res!484076 () Bool)

(assert (=> b!722357 (=> (not res!484076) (not e!404899))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722357 (= res!484076 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19564 a!3186) j!159) mask!3328) (select (arr!19564 a!3186) j!159) a!3186 mask!3328) lt!320257))))

(assert (=> b!722357 (= lt!320257 (Intermediate!7164 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722358 () Bool)

(declare-fun res!484070 () Bool)

(assert (=> b!722358 (=> (not res!484070) (not e!404896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40883 (_ BitVec 32)) Bool)

(assert (=> b!722358 (= res!484070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722359 () Bool)

(declare-fun res!484080 () Bool)

(assert (=> b!722359 (=> (not res!484080) (not e!404900))))

(assert (=> b!722359 (= res!484080 (and (= (size!19985 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19985 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19985 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!484079 () Bool)

(assert (=> start!64302 (=> (not res!484079) (not e!404900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64302 (= res!484079 (validMask!0 mask!3328))))

(assert (=> start!64302 e!404900))

(assert (=> start!64302 true))

(declare-fun array_inv!15360 (array!40883) Bool)

(assert (=> start!64302 (array_inv!15360 a!3186)))

(declare-fun b!722349 () Bool)

(declare-fun res!484072 () Bool)

(assert (=> b!722349 (=> (not res!484072) (not e!404900))))

(declare-fun arrayContainsKey!0 (array!40883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722349 (= res!484072 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722360 () Bool)

(assert (=> b!722360 (= e!404900 e!404896)))

(declare-fun res!484074 () Bool)

(assert (=> b!722360 (=> (not res!484074) (not e!404896))))

(declare-fun lt!320258 () SeekEntryResult!7164)

(assert (=> b!722360 (= res!484074 (or (= lt!320258 (MissingZero!7164 i!1173)) (= lt!320258 (MissingVacant!7164 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40883 (_ BitVec 32)) SeekEntryResult!7164)

(assert (=> b!722360 (= lt!320258 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722361 () Bool)

(declare-fun res!484073 () Bool)

(assert (=> b!722361 (=> (not res!484073) (not e!404896))))

(declare-datatypes ((List!13566 0))(
  ( (Nil!13563) (Cons!13562 (h!14616 (_ BitVec 64)) (t!19881 List!13566)) )
))
(declare-fun arrayNoDuplicates!0 (array!40883 (_ BitVec 32) List!13566) Bool)

(assert (=> b!722361 (= res!484073 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13563))))

(assert (= (and start!64302 res!484079) b!722359))

(assert (= (and b!722359 res!484080) b!722350))

(assert (= (and b!722350 res!484075) b!722355))

(assert (= (and b!722355 res!484077) b!722349))

(assert (= (and b!722349 res!484072) b!722360))

(assert (= (and b!722360 res!484074) b!722358))

(assert (= (and b!722358 res!484070) b!722361))

(assert (= (and b!722361 res!484073) b!722347))

(assert (= (and b!722347 res!484082) b!722357))

(assert (= (and b!722357 res!484076) b!722354))

(assert (= (and b!722354 res!484071) b!722353))

(assert (= (and b!722353 c!79510) b!722351))

(assert (= (and b!722353 (not c!79510)) b!722348))

(assert (= (and b!722353 res!484081) b!722352))

(assert (= (and b!722352 res!484078) b!722356))

(declare-fun m!676895 () Bool)

(assert (=> b!722350 m!676895))

(assert (=> b!722350 m!676895))

(declare-fun m!676897 () Bool)

(assert (=> b!722350 m!676897))

(declare-fun m!676899 () Bool)

(assert (=> b!722349 m!676899))

(declare-fun m!676901 () Bool)

(assert (=> b!722358 m!676901))

(declare-fun m!676903 () Bool)

(assert (=> b!722361 m!676903))

(declare-fun m!676905 () Bool)

(assert (=> b!722360 m!676905))

(assert (=> b!722348 m!676895))

(assert (=> b!722348 m!676895))

(declare-fun m!676907 () Bool)

(assert (=> b!722348 m!676907))

(declare-fun m!676909 () Bool)

(assert (=> b!722354 m!676909))

(assert (=> b!722351 m!676895))

(assert (=> b!722351 m!676895))

(declare-fun m!676911 () Bool)

(assert (=> b!722351 m!676911))

(declare-fun m!676913 () Bool)

(assert (=> start!64302 m!676913))

(declare-fun m!676915 () Bool)

(assert (=> start!64302 m!676915))

(declare-fun m!676917 () Bool)

(assert (=> b!722355 m!676917))

(declare-fun m!676919 () Bool)

(assert (=> b!722356 m!676919))

(declare-fun m!676921 () Bool)

(assert (=> b!722356 m!676921))

(assert (=> b!722356 m!676921))

(declare-fun m!676923 () Bool)

(assert (=> b!722356 m!676923))

(assert (=> b!722357 m!676895))

(assert (=> b!722357 m!676895))

(declare-fun m!676925 () Bool)

(assert (=> b!722357 m!676925))

(assert (=> b!722357 m!676925))

(assert (=> b!722357 m!676895))

(declare-fun m!676927 () Bool)

(assert (=> b!722357 m!676927))

(check-sat (not b!722351) (not b!722350) (not b!722356) (not b!722361) (not b!722355) (not b!722358) (not b!722348) (not b!722349) (not start!64302) (not b!722357) (not b!722360))
(check-sat)
