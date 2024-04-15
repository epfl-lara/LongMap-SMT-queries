; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51392 () Bool)

(assert start!51392)

(declare-fun res!352593 () Bool)

(declare-fun e!323429 () Bool)

(assert (=> start!51392 (=> (not res!352593) (not e!323429))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51392 (= res!352593 (validMask!0 mask!3119))))

(assert (=> start!51392 e!323429))

(assert (=> start!51392 true))

(declare-datatypes ((array!35266 0))(
  ( (array!35267 (arr!16934 (Array (_ BitVec 32) (_ BitVec 64))) (size!17299 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35266)

(declare-fun array_inv!12817 (array!35266) Bool)

(assert (=> start!51392 (array_inv!12817 a!3118)))

(declare-fun b!561298 () Bool)

(declare-fun res!352600 () Bool)

(assert (=> b!561298 (=> (not res!352600) (not e!323429))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561298 (= res!352600 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561299 () Bool)

(declare-fun res!352599 () Bool)

(declare-fun e!323426 () Bool)

(assert (=> b!561299 (=> (not res!352599) (not e!323426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35266 (_ BitVec 32)) Bool)

(assert (=> b!561299 (= res!352599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561300 () Bool)

(declare-fun res!352596 () Bool)

(assert (=> b!561300 (=> (not res!352596) (not e!323429))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561300 (= res!352596 (validKeyInArray!0 k0!1914))))

(declare-fun e!323431 () Bool)

(declare-fun lt!255366 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5380 0))(
  ( (MissingZero!5380 (index!23747 (_ BitVec 32))) (Found!5380 (index!23748 (_ BitVec 32))) (Intermediate!5380 (undefined!6192 Bool) (index!23749 (_ BitVec 32)) (x!52662 (_ BitVec 32))) (Undefined!5380) (MissingVacant!5380 (index!23750 (_ BitVec 32))) )
))
(declare-fun lt!255372 () SeekEntryResult!5380)

(declare-fun lt!255371 () array!35266)

(declare-fun b!561301 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35266 (_ BitVec 32)) SeekEntryResult!5380)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35266 (_ BitVec 32)) SeekEntryResult!5380)

(assert (=> b!561301 (= e!323431 (= (seekEntryOrOpen!0 lt!255366 lt!255371 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52662 lt!255372) (index!23749 lt!255372) (index!23749 lt!255372) lt!255366 lt!255371 mask!3119)))))

(declare-fun b!561302 () Bool)

(assert (=> b!561302 (= e!323429 e!323426)))

(declare-fun res!352595 () Bool)

(assert (=> b!561302 (=> (not res!352595) (not e!323426))))

(declare-fun lt!255373 () SeekEntryResult!5380)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561302 (= res!352595 (or (= lt!255373 (MissingZero!5380 i!1132)) (= lt!255373 (MissingVacant!5380 i!1132))))))

(assert (=> b!561302 (= lt!255373 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561303 () Bool)

(declare-fun res!352597 () Bool)

(assert (=> b!561303 (=> (not res!352597) (not e!323426))))

(declare-datatypes ((List!11053 0))(
  ( (Nil!11050) (Cons!11049 (h!12052 (_ BitVec 64)) (t!17272 List!11053)) )
))
(declare-fun arrayNoDuplicates!0 (array!35266 (_ BitVec 32) List!11053) Bool)

(assert (=> b!561303 (= res!352597 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11050))))

(declare-fun b!561304 () Bool)

(declare-fun e!323427 () Bool)

(assert (=> b!561304 (= e!323427 (not true))))

(declare-fun e!323432 () Bool)

(assert (=> b!561304 e!323432))

(declare-fun res!352598 () Bool)

(assert (=> b!561304 (=> (not res!352598) (not e!323432))))

(declare-fun lt!255365 () SeekEntryResult!5380)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!561304 (= res!352598 (= lt!255365 (Found!5380 j!142)))))

(assert (=> b!561304 (= lt!255365 (seekEntryOrOpen!0 (select (arr!16934 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561304 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17520 0))(
  ( (Unit!17521) )
))
(declare-fun lt!255368 () Unit!17520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35266 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17520)

(assert (=> b!561304 (= lt!255368 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561305 () Bool)

(declare-fun e!323433 () Bool)

(declare-fun e!323428 () Bool)

(assert (=> b!561305 (= e!323433 e!323428)))

(declare-fun res!352601 () Bool)

(assert (=> b!561305 (=> res!352601 e!323428)))

(declare-fun lt!255367 () (_ BitVec 64))

(assert (=> b!561305 (= res!352601 (or (= lt!255367 (select (arr!16934 a!3118) j!142)) (= lt!255367 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561305 (= lt!255367 (select (arr!16934 a!3118) (index!23749 lt!255372)))))

(declare-fun b!561306 () Bool)

(assert (=> b!561306 (= e!323426 e!323427)))

(declare-fun res!352592 () Bool)

(assert (=> b!561306 (=> (not res!352592) (not e!323427))))

(declare-fun lt!255370 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35266 (_ BitVec 32)) SeekEntryResult!5380)

(assert (=> b!561306 (= res!352592 (= lt!255372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255370 lt!255366 lt!255371 mask!3119)))))

(declare-fun lt!255369 () (_ BitVec 32))

(assert (=> b!561306 (= lt!255372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255369 (select (arr!16934 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561306 (= lt!255370 (toIndex!0 lt!255366 mask!3119))))

(assert (=> b!561306 (= lt!255366 (select (store (arr!16934 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561306 (= lt!255369 (toIndex!0 (select (arr!16934 a!3118) j!142) mask!3119))))

(assert (=> b!561306 (= lt!255371 (array!35267 (store (arr!16934 a!3118) i!1132 k0!1914) (size!17299 a!3118)))))

(declare-fun b!561307 () Bool)

(assert (=> b!561307 (= e!323428 e!323431)))

(declare-fun res!352604 () Bool)

(assert (=> b!561307 (=> (not res!352604) (not e!323431))))

(assert (=> b!561307 (= res!352604 (= lt!255365 (seekKeyOrZeroReturnVacant!0 (x!52662 lt!255372) (index!23749 lt!255372) (index!23749 lt!255372) (select (arr!16934 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561308 () Bool)

(assert (=> b!561308 (= e!323432 e!323433)))

(declare-fun res!352603 () Bool)

(assert (=> b!561308 (=> res!352603 e!323433)))

(get-info :version)

(assert (=> b!561308 (= res!352603 (or (undefined!6192 lt!255372) (not ((_ is Intermediate!5380) lt!255372))))))

(declare-fun b!561309 () Bool)

(declare-fun res!352602 () Bool)

(assert (=> b!561309 (=> (not res!352602) (not e!323429))))

(assert (=> b!561309 (= res!352602 (validKeyInArray!0 (select (arr!16934 a!3118) j!142)))))

(declare-fun b!561310 () Bool)

(declare-fun res!352594 () Bool)

(assert (=> b!561310 (=> (not res!352594) (not e!323429))))

(assert (=> b!561310 (= res!352594 (and (= (size!17299 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17299 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17299 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51392 res!352593) b!561310))

(assert (= (and b!561310 res!352594) b!561309))

(assert (= (and b!561309 res!352602) b!561300))

(assert (= (and b!561300 res!352596) b!561298))

(assert (= (and b!561298 res!352600) b!561302))

(assert (= (and b!561302 res!352595) b!561299))

(assert (= (and b!561299 res!352599) b!561303))

(assert (= (and b!561303 res!352597) b!561306))

(assert (= (and b!561306 res!352592) b!561304))

(assert (= (and b!561304 res!352598) b!561308))

(assert (= (and b!561308 (not res!352603)) b!561305))

(assert (= (and b!561305 (not res!352601)) b!561307))

(assert (= (and b!561307 res!352604) b!561301))

(declare-fun m!538709 () Bool)

(assert (=> b!561298 m!538709))

(declare-fun m!538711 () Bool)

(assert (=> b!561303 m!538711))

(declare-fun m!538713 () Bool)

(assert (=> b!561302 m!538713))

(declare-fun m!538715 () Bool)

(assert (=> b!561299 m!538715))

(declare-fun m!538717 () Bool)

(assert (=> b!561304 m!538717))

(assert (=> b!561304 m!538717))

(declare-fun m!538719 () Bool)

(assert (=> b!561304 m!538719))

(declare-fun m!538721 () Bool)

(assert (=> b!561304 m!538721))

(declare-fun m!538723 () Bool)

(assert (=> b!561304 m!538723))

(assert (=> b!561307 m!538717))

(assert (=> b!561307 m!538717))

(declare-fun m!538725 () Bool)

(assert (=> b!561307 m!538725))

(declare-fun m!538727 () Bool)

(assert (=> b!561300 m!538727))

(assert (=> b!561309 m!538717))

(assert (=> b!561309 m!538717))

(declare-fun m!538729 () Bool)

(assert (=> b!561309 m!538729))

(assert (=> b!561305 m!538717))

(declare-fun m!538731 () Bool)

(assert (=> b!561305 m!538731))

(declare-fun m!538733 () Bool)

(assert (=> b!561301 m!538733))

(declare-fun m!538735 () Bool)

(assert (=> b!561301 m!538735))

(declare-fun m!538737 () Bool)

(assert (=> start!51392 m!538737))

(declare-fun m!538739 () Bool)

(assert (=> start!51392 m!538739))

(assert (=> b!561306 m!538717))

(declare-fun m!538741 () Bool)

(assert (=> b!561306 m!538741))

(declare-fun m!538743 () Bool)

(assert (=> b!561306 m!538743))

(assert (=> b!561306 m!538717))

(declare-fun m!538745 () Bool)

(assert (=> b!561306 m!538745))

(assert (=> b!561306 m!538717))

(declare-fun m!538747 () Bool)

(assert (=> b!561306 m!538747))

(declare-fun m!538749 () Bool)

(assert (=> b!561306 m!538749))

(declare-fun m!538751 () Bool)

(assert (=> b!561306 m!538751))

(check-sat (not b!561307) (not b!561301) (not b!561302) (not start!51392) (not b!561298) (not b!561300) (not b!561303) (not b!561309) (not b!561299) (not b!561306) (not b!561304))
(check-sat)
