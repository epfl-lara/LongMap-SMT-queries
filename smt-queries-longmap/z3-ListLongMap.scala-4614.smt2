; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64320 () Bool)

(assert start!64320)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40901 0))(
  ( (array!40902 (arr!19573 (Array (_ BitVec 32) (_ BitVec 64))) (size!19994 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40901)

(declare-fun b!722729 () Bool)

(declare-fun e!405035 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7173 0))(
  ( (MissingZero!7173 (index!31060 (_ BitVec 32))) (Found!7173 (index!31061 (_ BitVec 32))) (Intermediate!7173 (undefined!7985 Bool) (index!31062 (_ BitVec 32)) (x!62062 (_ BitVec 32))) (Undefined!7173) (MissingVacant!7173 (index!31063 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40901 (_ BitVec 32)) SeekEntryResult!7173)

(assert (=> b!722729 (= e!405035 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19573 a!3186) j!159) a!3186 mask!3328) (Found!7173 j!159)))))

(declare-fun b!722730 () Bool)

(declare-fun res!484399 () Bool)

(declare-fun e!405032 () Bool)

(assert (=> b!722730 (=> (not res!484399) (not e!405032))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722730 (= res!484399 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19994 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19994 a!3186))))))

(declare-fun b!722731 () Bool)

(declare-fun e!405031 () Bool)

(assert (=> b!722731 (= e!405031 e!405032)))

(declare-fun res!484408 () Bool)

(assert (=> b!722731 (=> (not res!484408) (not e!405032))))

(declare-fun lt!320408 () SeekEntryResult!7173)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722731 (= res!484408 (or (= lt!320408 (MissingZero!7173 i!1173)) (= lt!320408 (MissingVacant!7173 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40901 (_ BitVec 32)) SeekEntryResult!7173)

(assert (=> b!722731 (= lt!320408 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722732 () Bool)

(declare-fun res!484406 () Bool)

(assert (=> b!722732 (=> (not res!484406) (not e!405031))))

(declare-fun arrayContainsKey!0 (array!40901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722732 (= res!484406 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722733 () Bool)

(declare-fun lt!320404 () SeekEntryResult!7173)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40901 (_ BitVec 32)) SeekEntryResult!7173)

(assert (=> b!722733 (= e!405035 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19573 a!3186) j!159) a!3186 mask!3328) lt!320404))))

(declare-fun b!722734 () Bool)

(declare-fun res!484407 () Bool)

(assert (=> b!722734 (=> (not res!484407) (not e!405031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722734 (= res!484407 (validKeyInArray!0 (select (arr!19573 a!3186) j!159)))))

(declare-fun b!722735 () Bool)

(declare-fun res!484405 () Bool)

(assert (=> b!722735 (=> (not res!484405) (not e!405031))))

(assert (=> b!722735 (= res!484405 (and (= (size!19994 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19994 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19994 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722737 () Bool)

(declare-fun res!484409 () Bool)

(assert (=> b!722737 (=> (not res!484409) (not e!405032))))

(declare-datatypes ((List!13575 0))(
  ( (Nil!13572) (Cons!13571 (h!14625 (_ BitVec 64)) (t!19890 List!13575)) )
))
(declare-fun arrayNoDuplicates!0 (array!40901 (_ BitVec 32) List!13575) Bool)

(assert (=> b!722737 (= res!484409 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13572))))

(declare-fun b!722738 () Bool)

(declare-fun e!405033 () Bool)

(assert (=> b!722738 (= e!405033 false)))

(declare-fun lt!320403 () array!40901)

(declare-fun lt!320406 () SeekEntryResult!7173)

(declare-fun lt!320405 () (_ BitVec 64))

(assert (=> b!722738 (= lt!320406 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320405 lt!320403 mask!3328))))

(declare-fun lt!320407 () SeekEntryResult!7173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722738 (= lt!320407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320405 mask!3328) lt!320405 lt!320403 mask!3328))))

(assert (=> b!722738 (= lt!320405 (select (store (arr!19573 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722738 (= lt!320403 (array!40902 (store (arr!19573 a!3186) i!1173 k0!2102) (size!19994 a!3186)))))

(declare-fun b!722739 () Bool)

(declare-fun res!484398 () Bool)

(assert (=> b!722739 (=> (not res!484398) (not e!405033))))

(assert (=> b!722739 (= res!484398 e!405035)))

(declare-fun c!79537 () Bool)

(assert (=> b!722739 (= c!79537 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!722740 () Bool)

(assert (=> b!722740 (= e!405032 e!405033)))

(declare-fun res!484404 () Bool)

(assert (=> b!722740 (=> (not res!484404) (not e!405033))))

(assert (=> b!722740 (= res!484404 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19573 a!3186) j!159) mask!3328) (select (arr!19573 a!3186) j!159) a!3186 mask!3328) lt!320404))))

(assert (=> b!722740 (= lt!320404 (Intermediate!7173 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722741 () Bool)

(declare-fun res!484402 () Bool)

(assert (=> b!722741 (=> (not res!484402) (not e!405031))))

(assert (=> b!722741 (= res!484402 (validKeyInArray!0 k0!2102))))

(declare-fun b!722742 () Bool)

(declare-fun res!484400 () Bool)

(assert (=> b!722742 (=> (not res!484400) (not e!405033))))

(assert (=> b!722742 (= res!484400 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19573 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!484401 () Bool)

(assert (=> start!64320 (=> (not res!484401) (not e!405031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64320 (= res!484401 (validMask!0 mask!3328))))

(assert (=> start!64320 e!405031))

(assert (=> start!64320 true))

(declare-fun array_inv!15369 (array!40901) Bool)

(assert (=> start!64320 (array_inv!15369 a!3186)))

(declare-fun b!722736 () Bool)

(declare-fun res!484403 () Bool)

(assert (=> b!722736 (=> (not res!484403) (not e!405032))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40901 (_ BitVec 32)) Bool)

(assert (=> b!722736 (= res!484403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!64320 res!484401) b!722735))

(assert (= (and b!722735 res!484405) b!722734))

(assert (= (and b!722734 res!484407) b!722741))

(assert (= (and b!722741 res!484402) b!722732))

(assert (= (and b!722732 res!484406) b!722731))

(assert (= (and b!722731 res!484408) b!722736))

(assert (= (and b!722736 res!484403) b!722737))

(assert (= (and b!722737 res!484409) b!722730))

(assert (= (and b!722730 res!484399) b!722740))

(assert (= (and b!722740 res!484404) b!722742))

(assert (= (and b!722742 res!484400) b!722739))

(assert (= (and b!722739 c!79537) b!722733))

(assert (= (and b!722739 (not c!79537)) b!722729))

(assert (= (and b!722739 res!484398) b!722738))

(declare-fun m!677229 () Bool)

(assert (=> b!722738 m!677229))

(declare-fun m!677231 () Bool)

(assert (=> b!722738 m!677231))

(declare-fun m!677233 () Bool)

(assert (=> b!722738 m!677233))

(declare-fun m!677235 () Bool)

(assert (=> b!722738 m!677235))

(assert (=> b!722738 m!677231))

(declare-fun m!677237 () Bool)

(assert (=> b!722738 m!677237))

(declare-fun m!677239 () Bool)

(assert (=> b!722736 m!677239))

(declare-fun m!677241 () Bool)

(assert (=> b!722740 m!677241))

(assert (=> b!722740 m!677241))

(declare-fun m!677243 () Bool)

(assert (=> b!722740 m!677243))

(assert (=> b!722740 m!677243))

(assert (=> b!722740 m!677241))

(declare-fun m!677245 () Bool)

(assert (=> b!722740 m!677245))

(declare-fun m!677247 () Bool)

(assert (=> b!722732 m!677247))

(declare-fun m!677249 () Bool)

(assert (=> b!722742 m!677249))

(declare-fun m!677251 () Bool)

(assert (=> b!722741 m!677251))

(assert (=> b!722733 m!677241))

(assert (=> b!722733 m!677241))

(declare-fun m!677253 () Bool)

(assert (=> b!722733 m!677253))

(assert (=> b!722729 m!677241))

(assert (=> b!722729 m!677241))

(declare-fun m!677255 () Bool)

(assert (=> b!722729 m!677255))

(declare-fun m!677257 () Bool)

(assert (=> b!722737 m!677257))

(assert (=> b!722734 m!677241))

(assert (=> b!722734 m!677241))

(declare-fun m!677259 () Bool)

(assert (=> b!722734 m!677259))

(declare-fun m!677261 () Bool)

(assert (=> b!722731 m!677261))

(declare-fun m!677263 () Bool)

(assert (=> start!64320 m!677263))

(declare-fun m!677265 () Bool)

(assert (=> start!64320 m!677265))

(check-sat (not start!64320) (not b!722731) (not b!722736) (not b!722733) (not b!722734) (not b!722737) (not b!722729) (not b!722732) (not b!722740) (not b!722738) (not b!722741))
(check-sat)
