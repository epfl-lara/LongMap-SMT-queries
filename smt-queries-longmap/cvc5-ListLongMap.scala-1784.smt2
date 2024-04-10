; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32404 () Bool)

(assert start!32404)

(declare-fun b!323300 () Bool)

(declare-datatypes ((Unit!9983 0))(
  ( (Unit!9984) )
))
(declare-fun e!199880 () Unit!9983)

(declare-fun Unit!9985 () Unit!9983)

(assert (=> b!323300 (= e!199880 Unit!9985)))

(declare-fun b!323301 () Bool)

(declare-fun res!176898 () Bool)

(declare-fun e!199881 () Bool)

(assert (=> b!323301 (=> (not res!176898) (not e!199881))))

(declare-datatypes ((array!16543 0))(
  ( (array!16544 (arr!7829 (Array (_ BitVec 32) (_ BitVec 64))) (size!8181 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16543)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323301 (= res!176898 (and (= (select (arr!7829 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8181 a!3305))))))

(declare-fun b!323302 () Bool)

(declare-fun res!176895 () Bool)

(declare-fun e!199883 () Bool)

(assert (=> b!323302 (=> (not res!176895) (not e!199883))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323302 (= res!176895 (validKeyInArray!0 k!2497))))

(declare-fun b!323303 () Bool)

(assert (=> b!323303 false))

(declare-fun e!199884 () Unit!9983)

(declare-fun Unit!9986 () Unit!9983)

(assert (=> b!323303 (= e!199884 Unit!9986)))

(declare-fun b!323304 () Bool)

(declare-fun res!176896 () Bool)

(assert (=> b!323304 (=> (not res!176896) (not e!199881))))

(assert (=> b!323304 (= res!176896 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7829 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323305 () Bool)

(declare-fun res!176889 () Bool)

(assert (=> b!323305 (=> (not res!176889) (not e!199883))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16543 (_ BitVec 32)) Bool)

(assert (=> b!323305 (= res!176889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323306 () Bool)

(declare-fun res!176897 () Bool)

(assert (=> b!323306 (=> (not res!176897) (not e!199883))))

(declare-fun arrayContainsKey!0 (array!16543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323306 (= res!176897 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323307 () Bool)

(declare-fun Unit!9987 () Unit!9983)

(assert (=> b!323307 (= e!199880 Unit!9987)))

(assert (=> b!323307 false))

(declare-fun res!176894 () Bool)

(assert (=> start!32404 (=> (not res!176894) (not e!199883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32404 (= res!176894 (validMask!0 mask!3777))))

(assert (=> start!32404 e!199883))

(declare-fun array_inv!5792 (array!16543) Bool)

(assert (=> start!32404 (array_inv!5792 a!3305)))

(assert (=> start!32404 true))

(declare-fun b!323308 () Bool)

(declare-fun res!176890 () Bool)

(assert (=> b!323308 (=> (not res!176890) (not e!199883))))

(declare-datatypes ((SeekEntryResult!2960 0))(
  ( (MissingZero!2960 (index!14016 (_ BitVec 32))) (Found!2960 (index!14017 (_ BitVec 32))) (Intermediate!2960 (undefined!3772 Bool) (index!14018 (_ BitVec 32)) (x!32276 (_ BitVec 32))) (Undefined!2960) (MissingVacant!2960 (index!14019 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16543 (_ BitVec 32)) SeekEntryResult!2960)

(assert (=> b!323308 (= res!176890 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2960 i!1250)))))

(declare-fun b!323309 () Bool)

(assert (=> b!323309 (= e!199883 e!199881)))

(declare-fun res!176891 () Bool)

(assert (=> b!323309 (=> (not res!176891) (not e!199881))))

(declare-fun lt!156611 () SeekEntryResult!2960)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16543 (_ BitVec 32)) SeekEntryResult!2960)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323309 (= res!176891 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156611))))

(assert (=> b!323309 (= lt!156611 (Intermediate!2960 false resIndex!58 resX!58))))

(declare-fun b!323310 () Bool)

(declare-fun e!199885 () Unit!9983)

(assert (=> b!323310 (= e!199885 e!199884)))

(declare-fun c!50834 () Bool)

(assert (=> b!323310 (= c!50834 (or (= (select (arr!7829 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7829 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323311 () Bool)

(assert (=> b!323311 (= e!199881 (not (or (not (= (select (arr!7829 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3777 #b00000000000000000000000000000000))))))

(assert (=> b!323311 (= index!1840 resIndex!58)))

(declare-fun lt!156610 () Unit!9983)

(assert (=> b!323311 (= lt!156610 e!199885)))

(declare-fun c!50835 () Bool)

(assert (=> b!323311 (= c!50835 (not (= resIndex!58 index!1840)))))

(declare-fun b!323312 () Bool)

(assert (=> b!323312 false))

(declare-fun lt!156612 () Unit!9983)

(assert (=> b!323312 (= lt!156612 e!199880)))

(declare-fun c!50833 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323312 (= c!50833 (is-Intermediate!2960 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!9988 () Unit!9983)

(assert (=> b!323312 (= e!199884 Unit!9988)))

(declare-fun b!323313 () Bool)

(declare-fun res!176893 () Bool)

(assert (=> b!323313 (=> (not res!176893) (not e!199883))))

(assert (=> b!323313 (= res!176893 (and (= (size!8181 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8181 a!3305))))))

(declare-fun b!323314 () Bool)

(declare-fun Unit!9989 () Unit!9983)

(assert (=> b!323314 (= e!199885 Unit!9989)))

(declare-fun b!323315 () Bool)

(declare-fun res!176892 () Bool)

(assert (=> b!323315 (=> (not res!176892) (not e!199881))))

(assert (=> b!323315 (= res!176892 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156611))))

(assert (= (and start!32404 res!176894) b!323313))

(assert (= (and b!323313 res!176893) b!323302))

(assert (= (and b!323302 res!176895) b!323306))

(assert (= (and b!323306 res!176897) b!323308))

(assert (= (and b!323308 res!176890) b!323305))

(assert (= (and b!323305 res!176889) b!323309))

(assert (= (and b!323309 res!176891) b!323301))

(assert (= (and b!323301 res!176898) b!323315))

(assert (= (and b!323315 res!176892) b!323304))

(assert (= (and b!323304 res!176896) b!323311))

(assert (= (and b!323311 c!50835) b!323310))

(assert (= (and b!323311 (not c!50835)) b!323314))

(assert (= (and b!323310 c!50834) b!323303))

(assert (= (and b!323310 (not c!50834)) b!323312))

(assert (= (and b!323312 c!50833) b!323300))

(assert (= (and b!323312 (not c!50833)) b!323307))

(declare-fun m!330743 () Bool)

(assert (=> b!323301 m!330743))

(declare-fun m!330745 () Bool)

(assert (=> b!323302 m!330745))

(declare-fun m!330747 () Bool)

(assert (=> b!323309 m!330747))

(assert (=> b!323309 m!330747))

(declare-fun m!330749 () Bool)

(assert (=> b!323309 m!330749))

(declare-fun m!330751 () Bool)

(assert (=> b!323304 m!330751))

(declare-fun m!330753 () Bool)

(assert (=> b!323312 m!330753))

(assert (=> b!323312 m!330753))

(declare-fun m!330755 () Bool)

(assert (=> b!323312 m!330755))

(declare-fun m!330757 () Bool)

(assert (=> start!32404 m!330757))

(declare-fun m!330759 () Bool)

(assert (=> start!32404 m!330759))

(declare-fun m!330761 () Bool)

(assert (=> b!323305 m!330761))

(declare-fun m!330763 () Bool)

(assert (=> b!323306 m!330763))

(assert (=> b!323311 m!330751))

(declare-fun m!330765 () Bool)

(assert (=> b!323308 m!330765))

(declare-fun m!330767 () Bool)

(assert (=> b!323315 m!330767))

(assert (=> b!323310 m!330751))

(push 1)

