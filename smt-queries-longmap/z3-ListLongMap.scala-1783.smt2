; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32384 () Bool)

(assert start!32384)

(declare-fun b!322881 () Bool)

(assert (=> b!322881 false))

(declare-datatypes ((Unit!9926 0))(
  ( (Unit!9927) )
))
(declare-fun lt!156348 () Unit!9926)

(declare-fun e!199653 () Unit!9926)

(assert (=> b!322881 (= lt!156348 e!199653)))

(declare-datatypes ((array!16527 0))(
  ( (array!16528 (arr!7821 (Array (_ BitVec 32) (_ BitVec 64))) (size!8174 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16527)

(declare-fun c!50735 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!2951 0))(
  ( (MissingZero!2951 (index!13980 (_ BitVec 32))) (Found!2951 (index!13981 (_ BitVec 32))) (Intermediate!2951 (undefined!3763 Bool) (index!13982 (_ BitVec 32)) (x!32254 (_ BitVec 32))) (Undefined!2951) (MissingVacant!2951 (index!13983 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16527 (_ BitVec 32)) SeekEntryResult!2951)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322881 (= c!50735 ((_ is Intermediate!2951) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun e!199650 () Unit!9926)

(declare-fun Unit!9928 () Unit!9926)

(assert (=> b!322881 (= e!199650 Unit!9928)))

(declare-fun b!322882 () Bool)

(declare-fun res!176675 () Bool)

(declare-fun e!199654 () Bool)

(assert (=> b!322882 (=> (not res!176675) (not e!199654))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!322882 (= res!176675 (validKeyInArray!0 k0!2497))))

(declare-fun b!322883 () Bool)

(declare-fun e!199651 () Unit!9926)

(assert (=> b!322883 (= e!199651 e!199650)))

(declare-fun c!50733 () Bool)

(assert (=> b!322883 (= c!50733 (or (= (select (arr!7821 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7821 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!322884 () Bool)

(declare-fun res!176674 () Bool)

(declare-fun e!199652 () Bool)

(assert (=> b!322884 (=> (not res!176674) (not e!199652))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!322884 (= res!176674 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7821 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!322885 () Bool)

(declare-fun Unit!9929 () Unit!9926)

(assert (=> b!322885 (= e!199653 Unit!9929)))

(assert (=> b!322885 false))

(declare-fun b!322886 () Bool)

(declare-fun Unit!9930 () Unit!9926)

(assert (=> b!322886 (= e!199653 Unit!9930)))

(declare-fun b!322887 () Bool)

(assert (=> b!322887 (= e!199652 (not true))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!322887 (= index!1840 resIndex!58)))

(declare-fun lt!156350 () Unit!9926)

(assert (=> b!322887 (= lt!156350 e!199651)))

(declare-fun c!50734 () Bool)

(assert (=> b!322887 (= c!50734 (not (= resIndex!58 index!1840)))))

(declare-fun b!322888 () Bool)

(assert (=> b!322888 false))

(declare-fun Unit!9931 () Unit!9926)

(assert (=> b!322888 (= e!199650 Unit!9931)))

(declare-fun res!176670 () Bool)

(assert (=> start!32384 (=> (not res!176670) (not e!199654))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32384 (= res!176670 (validMask!0 mask!3777))))

(assert (=> start!32384 e!199654))

(declare-fun array_inv!5793 (array!16527) Bool)

(assert (=> start!32384 (array_inv!5793 a!3305)))

(assert (=> start!32384 true))

(declare-fun b!322889 () Bool)

(assert (=> b!322889 (= e!199654 e!199652)))

(declare-fun res!176677 () Bool)

(assert (=> b!322889 (=> (not res!176677) (not e!199652))))

(declare-fun lt!156349 () SeekEntryResult!2951)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!322889 (= res!176677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156349))))

(assert (=> b!322889 (= lt!156349 (Intermediate!2951 false resIndex!58 resX!58))))

(declare-fun b!322890 () Bool)

(declare-fun Unit!9932 () Unit!9926)

(assert (=> b!322890 (= e!199651 Unit!9932)))

(declare-fun b!322891 () Bool)

(declare-fun res!176673 () Bool)

(assert (=> b!322891 (=> (not res!176673) (not e!199652))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!322891 (= res!176673 (and (= (select (arr!7821 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8174 a!3305))))))

(declare-fun b!322892 () Bool)

(declare-fun res!176671 () Bool)

(assert (=> b!322892 (=> (not res!176671) (not e!199654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16527 (_ BitVec 32)) Bool)

(assert (=> b!322892 (= res!176671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!322893 () Bool)

(declare-fun res!176679 () Bool)

(assert (=> b!322893 (=> (not res!176679) (not e!199654))))

(declare-fun arrayContainsKey!0 (array!16527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!322893 (= res!176679 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!322894 () Bool)

(declare-fun res!176678 () Bool)

(assert (=> b!322894 (=> (not res!176678) (not e!199652))))

(assert (=> b!322894 (= res!176678 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156349))))

(declare-fun b!322895 () Bool)

(declare-fun res!176676 () Bool)

(assert (=> b!322895 (=> (not res!176676) (not e!199654))))

(assert (=> b!322895 (= res!176676 (and (= (size!8174 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8174 a!3305))))))

(declare-fun b!322896 () Bool)

(declare-fun res!176672 () Bool)

(assert (=> b!322896 (=> (not res!176672) (not e!199654))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16527 (_ BitVec 32)) SeekEntryResult!2951)

(assert (=> b!322896 (= res!176672 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2951 i!1250)))))

(assert (= (and start!32384 res!176670) b!322895))

(assert (= (and b!322895 res!176676) b!322882))

(assert (= (and b!322882 res!176675) b!322893))

(assert (= (and b!322893 res!176679) b!322896))

(assert (= (and b!322896 res!176672) b!322892))

(assert (= (and b!322892 res!176671) b!322889))

(assert (= (and b!322889 res!176677) b!322891))

(assert (= (and b!322891 res!176673) b!322894))

(assert (= (and b!322894 res!176678) b!322884))

(assert (= (and b!322884 res!176674) b!322887))

(assert (= (and b!322887 c!50734) b!322883))

(assert (= (and b!322887 (not c!50734)) b!322890))

(assert (= (and b!322883 c!50733) b!322888))

(assert (= (and b!322883 (not c!50733)) b!322881))

(assert (= (and b!322881 c!50735) b!322886))

(assert (= (and b!322881 (not c!50735)) b!322885))

(declare-fun m!329935 () Bool)

(assert (=> b!322891 m!329935))

(declare-fun m!329937 () Bool)

(assert (=> b!322893 m!329937))

(declare-fun m!329939 () Bool)

(assert (=> b!322882 m!329939))

(declare-fun m!329941 () Bool)

(assert (=> b!322881 m!329941))

(assert (=> b!322881 m!329941))

(declare-fun m!329943 () Bool)

(assert (=> b!322881 m!329943))

(declare-fun m!329945 () Bool)

(assert (=> b!322892 m!329945))

(declare-fun m!329947 () Bool)

(assert (=> start!32384 m!329947))

(declare-fun m!329949 () Bool)

(assert (=> start!32384 m!329949))

(declare-fun m!329951 () Bool)

(assert (=> b!322889 m!329951))

(assert (=> b!322889 m!329951))

(declare-fun m!329953 () Bool)

(assert (=> b!322889 m!329953))

(declare-fun m!329955 () Bool)

(assert (=> b!322883 m!329955))

(assert (=> b!322884 m!329955))

(declare-fun m!329957 () Bool)

(assert (=> b!322894 m!329957))

(declare-fun m!329959 () Bool)

(assert (=> b!322896 m!329959))

(check-sat (not b!322881) (not b!322889) (not b!322882) (not start!32384) (not b!322893) (not b!322892) (not b!322896) (not b!322894))
(check-sat)
