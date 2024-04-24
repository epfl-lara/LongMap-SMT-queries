; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32390 () Bool)

(assert start!32390)

(declare-datatypes ((array!16542 0))(
  ( (array!16543 (arr!7828 (Array (_ BitVec 32) (_ BitVec 64))) (size!8180 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16542)

(declare-fun e!199846 () Bool)

(declare-fun b!323247 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!323247 (= e!199846 (not (or (not (= (select (arr!7828 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000))))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323247 (= index!1840 resIndex!58)))

(declare-datatypes ((Unit!9945 0))(
  ( (Unit!9946) )
))
(declare-fun lt!156630 () Unit!9945)

(declare-fun e!199851 () Unit!9945)

(assert (=> b!323247 (= lt!156630 e!199851)))

(declare-fun c!50809 () Bool)

(assert (=> b!323247 (= c!50809 (not (= resIndex!58 index!1840)))))

(declare-fun b!323248 () Bool)

(declare-fun e!199847 () Unit!9945)

(declare-fun Unit!9947 () Unit!9945)

(assert (=> b!323248 (= e!199847 Unit!9947)))

(assert (=> b!323248 false))

(declare-fun b!323249 () Bool)

(declare-fun res!176889 () Bool)

(assert (=> b!323249 (=> (not res!176889) (not e!199846))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323249 (= res!176889 (and (= (select (arr!7828 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8180 a!3305))))))

(declare-fun b!323250 () Bool)

(declare-fun res!176892 () Bool)

(declare-fun e!199850 () Bool)

(assert (=> b!323250 (=> (not res!176892) (not e!199850))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2924 0))(
  ( (MissingZero!2924 (index!13872 (_ BitVec 32))) (Found!2924 (index!13873 (_ BitVec 32))) (Intermediate!2924 (undefined!3736 Bool) (index!13874 (_ BitVec 32)) (x!32237 (_ BitVec 32))) (Undefined!2924) (MissingVacant!2924 (index!13875 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16542 (_ BitVec 32)) SeekEntryResult!2924)

(assert (=> b!323250 (= res!176892 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2924 i!1250)))))

(declare-fun res!176895 () Bool)

(assert (=> start!32390 (=> (not res!176895) (not e!199850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32390 (= res!176895 (validMask!0 mask!3777))))

(assert (=> start!32390 e!199850))

(declare-fun array_inv!5778 (array!16542) Bool)

(assert (=> start!32390 (array_inv!5778 a!3305)))

(assert (=> start!32390 true))

(declare-fun b!323251 () Bool)

(assert (=> b!323251 (= e!199850 e!199846)))

(declare-fun res!176894 () Bool)

(assert (=> b!323251 (=> (not res!176894) (not e!199846))))

(declare-fun lt!156628 () SeekEntryResult!2924)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16542 (_ BitVec 32)) SeekEntryResult!2924)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323251 (= res!176894 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156628))))

(assert (=> b!323251 (= lt!156628 (Intermediate!2924 false resIndex!58 resX!58))))

(declare-fun b!323252 () Bool)

(assert (=> b!323252 false))

(declare-fun e!199848 () Unit!9945)

(declare-fun Unit!9948 () Unit!9945)

(assert (=> b!323252 (= e!199848 Unit!9948)))

(declare-fun b!323253 () Bool)

(declare-fun Unit!9949 () Unit!9945)

(assert (=> b!323253 (= e!199851 Unit!9949)))

(declare-fun b!323254 () Bool)

(declare-fun res!176890 () Bool)

(assert (=> b!323254 (=> (not res!176890) (not e!199850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16542 (_ BitVec 32)) Bool)

(assert (=> b!323254 (= res!176890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323255 () Bool)

(assert (=> b!323255 false))

(declare-fun lt!156629 () Unit!9945)

(assert (=> b!323255 (= lt!156629 e!199847)))

(declare-fun c!50810 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323255 (= c!50810 ((_ is Intermediate!2924) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!9950 () Unit!9945)

(assert (=> b!323255 (= e!199848 Unit!9950)))

(declare-fun b!323256 () Bool)

(declare-fun res!176888 () Bool)

(assert (=> b!323256 (=> (not res!176888) (not e!199846))))

(assert (=> b!323256 (= res!176888 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156628))))

(declare-fun b!323257 () Bool)

(declare-fun res!176886 () Bool)

(assert (=> b!323257 (=> (not res!176886) (not e!199850))))

(declare-fun arrayContainsKey!0 (array!16542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323257 (= res!176886 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323258 () Bool)

(declare-fun res!176891 () Bool)

(assert (=> b!323258 (=> (not res!176891) (not e!199850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323258 (= res!176891 (validKeyInArray!0 k0!2497))))

(declare-fun b!323259 () Bool)

(assert (=> b!323259 (= e!199851 e!199848)))

(declare-fun c!50808 () Bool)

(assert (=> b!323259 (= c!50808 (or (= (select (arr!7828 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7828 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323260 () Bool)

(declare-fun res!176887 () Bool)

(assert (=> b!323260 (=> (not res!176887) (not e!199846))))

(assert (=> b!323260 (= res!176887 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7828 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun b!323261 () Bool)

(declare-fun Unit!9951 () Unit!9945)

(assert (=> b!323261 (= e!199847 Unit!9951)))

(declare-fun b!323262 () Bool)

(declare-fun res!176893 () Bool)

(assert (=> b!323262 (=> (not res!176893) (not e!199850))))

(assert (=> b!323262 (= res!176893 (and (= (size!8180 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8180 a!3305))))))

(assert (= (and start!32390 res!176895) b!323262))

(assert (= (and b!323262 res!176893) b!323258))

(assert (= (and b!323258 res!176891) b!323257))

(assert (= (and b!323257 res!176886) b!323250))

(assert (= (and b!323250 res!176892) b!323254))

(assert (= (and b!323254 res!176890) b!323251))

(assert (= (and b!323251 res!176894) b!323249))

(assert (= (and b!323249 res!176889) b!323256))

(assert (= (and b!323256 res!176888) b!323260))

(assert (= (and b!323260 res!176887) b!323247))

(assert (= (and b!323247 c!50809) b!323259))

(assert (= (and b!323247 (not c!50809)) b!323253))

(assert (= (and b!323259 c!50808) b!323252))

(assert (= (and b!323259 (not c!50808)) b!323255))

(assert (= (and b!323255 c!50810) b!323261))

(assert (= (and b!323255 (not c!50810)) b!323248))

(declare-fun m!330925 () Bool)

(assert (=> b!323247 m!330925))

(declare-fun m!330927 () Bool)

(assert (=> b!323251 m!330927))

(assert (=> b!323251 m!330927))

(declare-fun m!330929 () Bool)

(assert (=> b!323251 m!330929))

(declare-fun m!330931 () Bool)

(assert (=> b!323249 m!330931))

(declare-fun m!330933 () Bool)

(assert (=> start!32390 m!330933))

(declare-fun m!330935 () Bool)

(assert (=> start!32390 m!330935))

(declare-fun m!330937 () Bool)

(assert (=> b!323254 m!330937))

(declare-fun m!330939 () Bool)

(assert (=> b!323250 m!330939))

(declare-fun m!330941 () Bool)

(assert (=> b!323257 m!330941))

(declare-fun m!330943 () Bool)

(assert (=> b!323255 m!330943))

(assert (=> b!323255 m!330943))

(declare-fun m!330945 () Bool)

(assert (=> b!323255 m!330945))

(declare-fun m!330947 () Bool)

(assert (=> b!323258 m!330947))

(assert (=> b!323260 m!330925))

(assert (=> b!323259 m!330925))

(declare-fun m!330949 () Bool)

(assert (=> b!323256 m!330949))

(check-sat (not b!323258) (not start!32390) (not b!323255) (not b!323254) (not b!323257) (not b!323256) (not b!323251) (not b!323250))
(check-sat)
