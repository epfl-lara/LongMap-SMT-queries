; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65424 () Bool)

(assert start!65424)

(declare-fun b!742086 () Bool)

(declare-fun e!414882 () Bool)

(assert (=> b!742086 (= e!414882 (not true))))

(declare-fun e!414885 () Bool)

(assert (=> b!742086 e!414885))

(declare-fun res!498968 () Bool)

(assert (=> b!742086 (=> (not res!498968) (not e!414885))))

(declare-datatypes ((array!41467 0))(
  ( (array!41468 (arr!19843 (Array (_ BitVec 32) (_ BitVec 64))) (size!20263 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41467)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41467 (_ BitVec 32)) Bool)

(assert (=> b!742086 (= res!498968 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25357 0))(
  ( (Unit!25358) )
))
(declare-fun lt!329684 () Unit!25357)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41467 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25357)

(assert (=> b!742086 (= lt!329684 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742087 () Bool)

(declare-fun e!414883 () Bool)

(assert (=> b!742087 (= e!414885 e!414883)))

(declare-fun res!498975 () Bool)

(assert (=> b!742087 (=> (not res!498975) (not e!414883))))

(declare-datatypes ((SeekEntryResult!7399 0))(
  ( (MissingZero!7399 (index!31964 (_ BitVec 32))) (Found!7399 (index!31965 (_ BitVec 32))) (Intermediate!7399 (undefined!8211 Bool) (index!31966 (_ BitVec 32)) (x!63105 (_ BitVec 32))) (Undefined!7399) (MissingVacant!7399 (index!31967 (_ BitVec 32))) )
))
(declare-fun lt!329686 () SeekEntryResult!7399)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41467 (_ BitVec 32)) SeekEntryResult!7399)

(assert (=> b!742087 (= res!498975 (= (seekEntryOrOpen!0 (select (arr!19843 a!3186) j!159) a!3186 mask!3328) lt!329686))))

(assert (=> b!742087 (= lt!329686 (Found!7399 j!159))))

(declare-fun b!742088 () Bool)

(declare-fun res!498971 () Bool)

(declare-fun e!414880 () Bool)

(assert (=> b!742088 (=> (not res!498971) (not e!414880))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742088 (= res!498971 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742089 () Bool)

(declare-fun res!498972 () Bool)

(declare-fun e!414878 () Bool)

(assert (=> b!742089 (=> (not res!498972) (not e!414878))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742089 (= res!498972 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19843 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!742090 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41467 (_ BitVec 32)) SeekEntryResult!7399)

(assert (=> b!742090 (= e!414883 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19843 a!3186) j!159) a!3186 mask!3328) lt!329686))))

(declare-fun e!414879 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!329683 () SeekEntryResult!7399)

(declare-fun b!742091 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41467 (_ BitVec 32)) SeekEntryResult!7399)

(assert (=> b!742091 (= e!414879 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19843 a!3186) j!159) a!3186 mask!3328) lt!329683))))

(declare-fun b!742092 () Bool)

(declare-fun res!498978 () Bool)

(declare-fun e!414881 () Bool)

(assert (=> b!742092 (=> (not res!498978) (not e!414881))))

(declare-datatypes ((List!13752 0))(
  ( (Nil!13749) (Cons!13748 (h!14826 (_ BitVec 64)) (t!20059 List!13752)) )
))
(declare-fun arrayNoDuplicates!0 (array!41467 (_ BitVec 32) List!13752) Bool)

(assert (=> b!742092 (= res!498978 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13749))))

(declare-fun b!742093 () Bool)

(declare-fun res!498976 () Bool)

(assert (=> b!742093 (=> (not res!498976) (not e!414881))))

(assert (=> b!742093 (= res!498976 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20263 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20263 a!3186))))))

(declare-fun b!742095 () Bool)

(assert (=> b!742095 (= e!414879 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19843 a!3186) j!159) a!3186 mask!3328) (Found!7399 j!159)))))

(declare-fun b!742096 () Bool)

(declare-fun res!498973 () Bool)

(assert (=> b!742096 (=> (not res!498973) (not e!414878))))

(assert (=> b!742096 (= res!498973 e!414879)))

(declare-fun c!81944 () Bool)

(assert (=> b!742096 (= c!81944 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742097 () Bool)

(assert (=> b!742097 (= e!414881 e!414878)))

(declare-fun res!498966 () Bool)

(assert (=> b!742097 (=> (not res!498966) (not e!414878))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742097 (= res!498966 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19843 a!3186) j!159) mask!3328) (select (arr!19843 a!3186) j!159) a!3186 mask!3328) lt!329683))))

(assert (=> b!742097 (= lt!329683 (Intermediate!7399 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742098 () Bool)

(assert (=> b!742098 (= e!414880 e!414881)))

(declare-fun res!498977 () Bool)

(assert (=> b!742098 (=> (not res!498977) (not e!414881))))

(declare-fun lt!329685 () SeekEntryResult!7399)

(assert (=> b!742098 (= res!498977 (or (= lt!329685 (MissingZero!7399 i!1173)) (= lt!329685 (MissingVacant!7399 i!1173))))))

(assert (=> b!742098 (= lt!329685 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742099 () Bool)

(declare-fun res!498979 () Bool)

(assert (=> b!742099 (=> (not res!498979) (not e!414880))))

(assert (=> b!742099 (= res!498979 (and (= (size!20263 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20263 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20263 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742100 () Bool)

(declare-fun res!498967 () Bool)

(assert (=> b!742100 (=> (not res!498967) (not e!414880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742100 (= res!498967 (validKeyInArray!0 (select (arr!19843 a!3186) j!159)))))

(declare-fun b!742101 () Bool)

(assert (=> b!742101 (= e!414878 e!414882)))

(declare-fun res!498969 () Bool)

(assert (=> b!742101 (=> (not res!498969) (not e!414882))))

(declare-fun lt!329687 () array!41467)

(declare-fun lt!329688 () (_ BitVec 64))

(assert (=> b!742101 (= res!498969 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329688 mask!3328) lt!329688 lt!329687 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329688 lt!329687 mask!3328)))))

(assert (=> b!742101 (= lt!329688 (select (store (arr!19843 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742101 (= lt!329687 (array!41468 (store (arr!19843 a!3186) i!1173 k0!2102) (size!20263 a!3186)))))

(declare-fun b!742102 () Bool)

(declare-fun res!498974 () Bool)

(assert (=> b!742102 (=> (not res!498974) (not e!414881))))

(assert (=> b!742102 (= res!498974 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742094 () Bool)

(declare-fun res!498965 () Bool)

(assert (=> b!742094 (=> (not res!498965) (not e!414880))))

(assert (=> b!742094 (= res!498965 (validKeyInArray!0 k0!2102))))

(declare-fun res!498970 () Bool)

(assert (=> start!65424 (=> (not res!498970) (not e!414880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65424 (= res!498970 (validMask!0 mask!3328))))

(assert (=> start!65424 e!414880))

(assert (=> start!65424 true))

(declare-fun array_inv!15702 (array!41467) Bool)

(assert (=> start!65424 (array_inv!15702 a!3186)))

(assert (= (and start!65424 res!498970) b!742099))

(assert (= (and b!742099 res!498979) b!742100))

(assert (= (and b!742100 res!498967) b!742094))

(assert (= (and b!742094 res!498965) b!742088))

(assert (= (and b!742088 res!498971) b!742098))

(assert (= (and b!742098 res!498977) b!742102))

(assert (= (and b!742102 res!498974) b!742092))

(assert (= (and b!742092 res!498978) b!742093))

(assert (= (and b!742093 res!498976) b!742097))

(assert (= (and b!742097 res!498966) b!742089))

(assert (= (and b!742089 res!498972) b!742096))

(assert (= (and b!742096 c!81944) b!742091))

(assert (= (and b!742096 (not c!81944)) b!742095))

(assert (= (and b!742096 res!498973) b!742101))

(assert (= (and b!742101 res!498969) b!742086))

(assert (= (and b!742086 res!498968) b!742087))

(assert (= (and b!742087 res!498975) b!742090))

(declare-fun m!693483 () Bool)

(assert (=> b!742098 m!693483))

(declare-fun m!693485 () Bool)

(assert (=> b!742087 m!693485))

(assert (=> b!742087 m!693485))

(declare-fun m!693487 () Bool)

(assert (=> b!742087 m!693487))

(declare-fun m!693489 () Bool)

(assert (=> b!742092 m!693489))

(declare-fun m!693491 () Bool)

(assert (=> b!742102 m!693491))

(assert (=> b!742090 m!693485))

(assert (=> b!742090 m!693485))

(declare-fun m!693493 () Bool)

(assert (=> b!742090 m!693493))

(declare-fun m!693495 () Bool)

(assert (=> b!742086 m!693495))

(declare-fun m!693497 () Bool)

(assert (=> b!742086 m!693497))

(declare-fun m!693499 () Bool)

(assert (=> b!742101 m!693499))

(declare-fun m!693501 () Bool)

(assert (=> b!742101 m!693501))

(declare-fun m!693503 () Bool)

(assert (=> b!742101 m!693503))

(declare-fun m!693505 () Bool)

(assert (=> b!742101 m!693505))

(assert (=> b!742101 m!693499))

(declare-fun m!693507 () Bool)

(assert (=> b!742101 m!693507))

(declare-fun m!693509 () Bool)

(assert (=> b!742089 m!693509))

(declare-fun m!693511 () Bool)

(assert (=> b!742094 m!693511))

(declare-fun m!693513 () Bool)

(assert (=> b!742088 m!693513))

(assert (=> b!742097 m!693485))

(assert (=> b!742097 m!693485))

(declare-fun m!693515 () Bool)

(assert (=> b!742097 m!693515))

(assert (=> b!742097 m!693515))

(assert (=> b!742097 m!693485))

(declare-fun m!693517 () Bool)

(assert (=> b!742097 m!693517))

(assert (=> b!742095 m!693485))

(assert (=> b!742095 m!693485))

(declare-fun m!693519 () Bool)

(assert (=> b!742095 m!693519))

(assert (=> b!742091 m!693485))

(assert (=> b!742091 m!693485))

(declare-fun m!693521 () Bool)

(assert (=> b!742091 m!693521))

(assert (=> b!742100 m!693485))

(assert (=> b!742100 m!693485))

(declare-fun m!693523 () Bool)

(assert (=> b!742100 m!693523))

(declare-fun m!693525 () Bool)

(assert (=> start!65424 m!693525))

(declare-fun m!693527 () Bool)

(assert (=> start!65424 m!693527))

(check-sat (not b!742094) (not b!742086) (not b!742102) (not b!742090) (not start!65424) (not b!742100) (not b!742097) (not b!742088) (not b!742095) (not b!742087) (not b!742098) (not b!742091) (not b!742092) (not b!742101))
(check-sat)
