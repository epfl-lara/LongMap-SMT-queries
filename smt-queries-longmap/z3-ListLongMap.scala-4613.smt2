; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64374 () Bool)

(assert start!64374)

(declare-fun b!722889 () Bool)

(declare-fun res!484444 () Bool)

(declare-fun e!405198 () Bool)

(assert (=> b!722889 (=> (not res!484444) (not e!405198))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!722889 (= res!484444 (validKeyInArray!0 k0!2102))))

(declare-fun b!722890 () Bool)

(declare-fun res!484438 () Bool)

(assert (=> b!722890 (=> (not res!484438) (not e!405198))))

(declare-datatypes ((array!40888 0))(
  ( (array!40889 (arr!19564 (Array (_ BitVec 32) (_ BitVec 64))) (size!19984 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40888)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!722890 (= res!484438 (validKeyInArray!0 (select (arr!19564 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!722891 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!405197 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7120 0))(
  ( (MissingZero!7120 (index!30848 (_ BitVec 32))) (Found!7120 (index!30849 (_ BitVec 32))) (Intermediate!7120 (undefined!7932 Bool) (index!30850 (_ BitVec 32)) (x!62004 (_ BitVec 32))) (Undefined!7120) (MissingVacant!7120 (index!30851 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40888 (_ BitVec 32)) SeekEntryResult!7120)

(assert (=> b!722891 (= e!405197 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19564 a!3186) j!159) a!3186 mask!3328) (Found!7120 j!159)))))

(declare-fun b!722892 () Bool)

(declare-fun res!484439 () Bool)

(declare-fun e!405200 () Bool)

(assert (=> b!722892 (=> (not res!484439) (not e!405200))))

(declare-datatypes ((List!13473 0))(
  ( (Nil!13470) (Cons!13469 (h!14526 (_ BitVec 64)) (t!19780 List!13473)) )
))
(declare-fun arrayNoDuplicates!0 (array!40888 (_ BitVec 32) List!13473) Bool)

(assert (=> b!722892 (= res!484439 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13470))))

(declare-fun b!722893 () Bool)

(declare-fun e!405199 () Bool)

(assert (=> b!722893 (= e!405200 e!405199)))

(declare-fun res!484441 () Bool)

(assert (=> b!722893 (=> (not res!484441) (not e!405199))))

(declare-fun lt!320466 () SeekEntryResult!7120)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40888 (_ BitVec 32)) SeekEntryResult!7120)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!722893 (= res!484441 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19564 a!3186) j!159) mask!3328) (select (arr!19564 a!3186) j!159) a!3186 mask!3328) lt!320466))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!722893 (= lt!320466 (Intermediate!7120 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!722894 () Bool)

(assert (=> b!722894 (= e!405197 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19564 a!3186) j!159) a!3186 mask!3328) lt!320466))))

(declare-fun b!722895 () Bool)

(declare-fun res!484435 () Bool)

(assert (=> b!722895 (=> (not res!484435) (not e!405198))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!722895 (= res!484435 (and (= (size!19984 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19984 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19984 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!722896 () Bool)

(assert (=> b!722896 (= e!405198 e!405200)))

(declare-fun res!484437 () Bool)

(assert (=> b!722896 (=> (not res!484437) (not e!405200))))

(declare-fun lt!320464 () SeekEntryResult!7120)

(assert (=> b!722896 (= res!484437 (or (= lt!320464 (MissingZero!7120 i!1173)) (= lt!320464 (MissingVacant!7120 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40888 (_ BitVec 32)) SeekEntryResult!7120)

(assert (=> b!722896 (= lt!320464 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!722897 () Bool)

(assert (=> b!722897 (= e!405199 false)))

(declare-fun lt!320461 () (_ BitVec 64))

(declare-fun lt!320463 () array!40888)

(declare-fun lt!320462 () SeekEntryResult!7120)

(assert (=> b!722897 (= lt!320462 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!320461 lt!320463 mask!3328))))

(declare-fun lt!320465 () SeekEntryResult!7120)

(assert (=> b!722897 (= lt!320465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!320461 mask!3328) lt!320461 lt!320463 mask!3328))))

(assert (=> b!722897 (= lt!320461 (select (store (arr!19564 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!722897 (= lt!320463 (array!40889 (store (arr!19564 a!3186) i!1173 k0!2102) (size!19984 a!3186)))))

(declare-fun b!722898 () Bool)

(declare-fun res!484442 () Bool)

(assert (=> b!722898 (=> (not res!484442) (not e!405198))))

(declare-fun arrayContainsKey!0 (array!40888 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!722898 (= res!484442 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!722899 () Bool)

(declare-fun res!484440 () Bool)

(assert (=> b!722899 (=> (not res!484440) (not e!405200))))

(assert (=> b!722899 (= res!484440 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19984 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19984 a!3186))))))

(declare-fun b!722901 () Bool)

(declare-fun res!484436 () Bool)

(assert (=> b!722901 (=> (not res!484436) (not e!405200))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40888 (_ BitVec 32)) Bool)

(assert (=> b!722901 (= res!484436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!722902 () Bool)

(declare-fun res!484434 () Bool)

(assert (=> b!722902 (=> (not res!484434) (not e!405199))))

(assert (=> b!722902 (= res!484434 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19564 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!484433 () Bool)

(assert (=> start!64374 (=> (not res!484433) (not e!405198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64374 (= res!484433 (validMask!0 mask!3328))))

(assert (=> start!64374 e!405198))

(assert (=> start!64374 true))

(declare-fun array_inv!15423 (array!40888) Bool)

(assert (=> start!64374 (array_inv!15423 a!3186)))

(declare-fun b!722900 () Bool)

(declare-fun res!484443 () Bool)

(assert (=> b!722900 (=> (not res!484443) (not e!405199))))

(assert (=> b!722900 (= res!484443 e!405197)))

(declare-fun c!79601 () Bool)

(assert (=> b!722900 (= c!79601 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64374 res!484433) b!722895))

(assert (= (and b!722895 res!484435) b!722890))

(assert (= (and b!722890 res!484438) b!722889))

(assert (= (and b!722889 res!484444) b!722898))

(assert (= (and b!722898 res!484442) b!722896))

(assert (= (and b!722896 res!484437) b!722901))

(assert (= (and b!722901 res!484436) b!722892))

(assert (= (and b!722892 res!484439) b!722899))

(assert (= (and b!722899 res!484440) b!722893))

(assert (= (and b!722893 res!484441) b!722902))

(assert (= (and b!722902 res!484434) b!722900))

(assert (= (and b!722900 c!79601) b!722894))

(assert (= (and b!722900 (not c!79601)) b!722891))

(assert (= (and b!722900 res!484443) b!722897))

(declare-fun m!677925 () Bool)

(assert (=> b!722901 m!677925))

(declare-fun m!677927 () Bool)

(assert (=> b!722898 m!677927))

(declare-fun m!677929 () Bool)

(assert (=> b!722892 m!677929))

(declare-fun m!677931 () Bool)

(assert (=> b!722902 m!677931))

(declare-fun m!677933 () Bool)

(assert (=> start!64374 m!677933))

(declare-fun m!677935 () Bool)

(assert (=> start!64374 m!677935))

(declare-fun m!677937 () Bool)

(assert (=> b!722894 m!677937))

(assert (=> b!722894 m!677937))

(declare-fun m!677939 () Bool)

(assert (=> b!722894 m!677939))

(assert (=> b!722890 m!677937))

(assert (=> b!722890 m!677937))

(declare-fun m!677941 () Bool)

(assert (=> b!722890 m!677941))

(declare-fun m!677943 () Bool)

(assert (=> b!722897 m!677943))

(declare-fun m!677945 () Bool)

(assert (=> b!722897 m!677945))

(declare-fun m!677947 () Bool)

(assert (=> b!722897 m!677947))

(declare-fun m!677949 () Bool)

(assert (=> b!722897 m!677949))

(assert (=> b!722897 m!677945))

(declare-fun m!677951 () Bool)

(assert (=> b!722897 m!677951))

(declare-fun m!677953 () Bool)

(assert (=> b!722889 m!677953))

(assert (=> b!722891 m!677937))

(assert (=> b!722891 m!677937))

(declare-fun m!677955 () Bool)

(assert (=> b!722891 m!677955))

(declare-fun m!677957 () Bool)

(assert (=> b!722896 m!677957))

(assert (=> b!722893 m!677937))

(assert (=> b!722893 m!677937))

(declare-fun m!677959 () Bool)

(assert (=> b!722893 m!677959))

(assert (=> b!722893 m!677959))

(assert (=> b!722893 m!677937))

(declare-fun m!677961 () Bool)

(assert (=> b!722893 m!677961))

(check-sat (not b!722891) (not b!722894) (not b!722892) (not b!722890) (not start!64374) (not b!722901) (not b!722893) (not b!722898) (not b!722896) (not b!722889) (not b!722897))
(check-sat)
