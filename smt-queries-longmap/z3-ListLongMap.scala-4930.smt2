; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67892 () Bool)

(assert start!67892)

(declare-fun b!789657 () Bool)

(declare-fun res!534913 () Bool)

(declare-fun e!438895 () Bool)

(assert (=> b!789657 (=> (not res!534913) (not e!438895))))

(declare-datatypes ((array!42869 0))(
  ( (array!42870 (arr!20521 (Array (_ BitVec 32) (_ BitVec 64))) (size!20942 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42869)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!789657 (= res!534913 (and (= (size!20942 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20942 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20942 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789658 () Bool)

(declare-fun e!438902 () Bool)

(declare-fun e!438900 () Bool)

(assert (=> b!789658 (= e!438902 e!438900)))

(declare-fun res!534905 () Bool)

(assert (=> b!789658 (=> (not res!534905) (not e!438900))))

(declare-datatypes ((SeekEntryResult!8121 0))(
  ( (MissingZero!8121 (index!34852 (_ BitVec 32))) (Found!8121 (index!34853 (_ BitVec 32))) (Intermediate!8121 (undefined!8933 Bool) (index!34854 (_ BitVec 32)) (x!65790 (_ BitVec 32))) (Undefined!8121) (MissingVacant!8121 (index!34855 (_ BitVec 32))) )
))
(declare-fun lt!352382 () SeekEntryResult!8121)

(declare-fun lt!352377 () SeekEntryResult!8121)

(assert (=> b!789658 (= res!534905 (= lt!352382 lt!352377))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!352372 () array!42869)

(declare-fun lt!352379 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42869 (_ BitVec 32)) SeekEntryResult!8121)

(assert (=> b!789658 (= lt!352377 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352379 lt!352372 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789658 (= lt!352382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352379 mask!3328) lt!352379 lt!352372 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!789658 (= lt!352379 (select (store (arr!20521 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789658 (= lt!352372 (array!42870 (store (arr!20521 a!3186) i!1173 k0!2102) (size!20942 a!3186)))))

(declare-fun b!789659 () Bool)

(declare-fun res!534897 () Bool)

(declare-fun e!438897 () Bool)

(assert (=> b!789659 (=> (not res!534897) (not e!438897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42869 (_ BitVec 32)) Bool)

(assert (=> b!789659 (= res!534897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789660 () Bool)

(declare-datatypes ((Unit!27372 0))(
  ( (Unit!27373) )
))
(declare-fun e!438896 () Unit!27372)

(declare-fun Unit!27374 () Unit!27372)

(assert (=> b!789660 (= e!438896 Unit!27374)))

(declare-fun lt!352374 () SeekEntryResult!8121)

(declare-fun b!789661 () Bool)

(declare-fun e!438898 () Bool)

(assert (=> b!789661 (= e!438898 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20521 a!3186) j!159) a!3186 mask!3328) lt!352374))))

(declare-fun b!789662 () Bool)

(declare-fun res!534912 () Bool)

(assert (=> b!789662 (=> (not res!534912) (not e!438895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789662 (= res!534912 (validKeyInArray!0 k0!2102))))

(declare-fun b!789663 () Bool)

(declare-fun res!534906 () Bool)

(assert (=> b!789663 (=> (not res!534906) (not e!438895))))

(declare-fun arrayContainsKey!0 (array!42869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789663 (= res!534906 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789664 () Bool)

(declare-fun e!438891 () Bool)

(declare-fun e!438901 () Bool)

(assert (=> b!789664 (= e!438891 e!438901)))

(declare-fun res!534900 () Bool)

(assert (=> b!789664 (=> res!534900 e!438901)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!789664 (= res!534900 (or (not (= (select (arr!20521 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352369 () SeekEntryResult!8121)

(declare-fun lt!352371 () SeekEntryResult!8121)

(declare-fun lt!352378 () SeekEntryResult!8121)

(declare-fun lt!352368 () SeekEntryResult!8121)

(assert (=> b!789664 (and (= lt!352371 lt!352368) (= lt!352369 lt!352378))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42869 (_ BitVec 32)) SeekEntryResult!8121)

(assert (=> b!789664 (= lt!352368 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352379 lt!352372 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42869 (_ BitVec 32)) SeekEntryResult!8121)

(assert (=> b!789664 (= lt!352371 (seekEntryOrOpen!0 lt!352379 lt!352372 mask!3328))))

(declare-fun lt!352375 () (_ BitVec 64))

(assert (=> b!789664 (= lt!352375 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!352380 () Unit!27372)

(assert (=> b!789664 (= lt!352380 e!438896)))

(declare-fun c!87790 () Bool)

(assert (=> b!789664 (= c!87790 (= lt!352375 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789665 () Bool)

(declare-fun res!534910 () Bool)

(assert (=> b!789665 (=> (not res!534910) (not e!438895))))

(assert (=> b!789665 (= res!534910 (validKeyInArray!0 (select (arr!20521 a!3186) j!159)))))

(declare-fun b!789666 () Bool)

(declare-fun Unit!27375 () Unit!27372)

(assert (=> b!789666 (= e!438896 Unit!27375)))

(assert (=> b!789666 false))

(declare-fun res!534899 () Bool)

(assert (=> start!67892 (=> (not res!534899) (not e!438895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67892 (= res!534899 (validMask!0 mask!3328))))

(assert (=> start!67892 e!438895))

(assert (=> start!67892 true))

(declare-fun array_inv!16317 (array!42869) Bool)

(assert (=> start!67892 (array_inv!16317 a!3186)))

(declare-fun b!789667 () Bool)

(assert (=> b!789667 (= e!438901 true)))

(assert (=> b!789667 (= lt!352368 lt!352378)))

(declare-fun lt!352381 () Unit!27372)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42869 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27372)

(assert (=> b!789667 (= lt!352381 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!789668 () Bool)

(declare-fun res!534898 () Bool)

(assert (=> b!789668 (=> (not res!534898) (not e!438897))))

(declare-datatypes ((List!14523 0))(
  ( (Nil!14520) (Cons!14519 (h!15645 (_ BitVec 64)) (t!20838 List!14523)) )
))
(declare-fun arrayNoDuplicates!0 (array!42869 (_ BitVec 32) List!14523) Bool)

(assert (=> b!789668 (= res!534898 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14520))))

(declare-fun b!789669 () Bool)

(assert (=> b!789669 (= e!438897 e!438902)))

(declare-fun res!534904 () Bool)

(assert (=> b!789669 (=> (not res!534904) (not e!438902))))

(assert (=> b!789669 (= res!534904 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20521 a!3186) j!159) mask!3328) (select (arr!20521 a!3186) j!159) a!3186 mask!3328) lt!352374))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!789669 (= lt!352374 (Intermediate!8121 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789670 () Bool)

(declare-fun res!534911 () Bool)

(assert (=> b!789670 (=> (not res!534911) (not e!438902))))

(assert (=> b!789670 (= res!534911 e!438898)))

(declare-fun c!87789 () Bool)

(assert (=> b!789670 (= c!87789 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789671 () Bool)

(assert (=> b!789671 (= e!438898 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20521 a!3186) j!159) a!3186 mask!3328) (Found!8121 j!159)))))

(declare-fun b!789672 () Bool)

(declare-fun res!534909 () Bool)

(assert (=> b!789672 (=> (not res!534909) (not e!438902))))

(assert (=> b!789672 (= res!534909 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20521 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789673 () Bool)

(assert (=> b!789673 (= e!438895 e!438897)))

(declare-fun res!534914 () Bool)

(assert (=> b!789673 (=> (not res!534914) (not e!438897))))

(declare-fun lt!352370 () SeekEntryResult!8121)

(assert (=> b!789673 (= res!534914 (or (= lt!352370 (MissingZero!8121 i!1173)) (= lt!352370 (MissingVacant!8121 i!1173))))))

(assert (=> b!789673 (= lt!352370 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789674 () Bool)

(declare-fun e!438892 () Bool)

(assert (=> b!789674 (= e!438892 e!438891)))

(declare-fun res!534907 () Bool)

(assert (=> b!789674 (=> res!534907 e!438891)))

(assert (=> b!789674 (= res!534907 (= lt!352375 lt!352379))))

(assert (=> b!789674 (= lt!352375 (select (store (arr!20521 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!789675 () Bool)

(declare-fun e!438894 () Bool)

(assert (=> b!789675 (= e!438900 (not e!438894))))

(declare-fun res!534901 () Bool)

(assert (=> b!789675 (=> res!534901 e!438894)))

(get-info :version)

(assert (=> b!789675 (= res!534901 (or (not ((_ is Intermediate!8121) lt!352377)) (bvslt x!1131 (x!65790 lt!352377)) (not (= x!1131 (x!65790 lt!352377))) (not (= index!1321 (index!34854 lt!352377)))))))

(declare-fun e!438899 () Bool)

(assert (=> b!789675 e!438899))

(declare-fun res!534902 () Bool)

(assert (=> b!789675 (=> (not res!534902) (not e!438899))))

(declare-fun lt!352373 () SeekEntryResult!8121)

(assert (=> b!789675 (= res!534902 (= lt!352369 lt!352373))))

(assert (=> b!789675 (= lt!352373 (Found!8121 j!159))))

(assert (=> b!789675 (= lt!352369 (seekEntryOrOpen!0 (select (arr!20521 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789675 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352376 () Unit!27372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42869 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27372)

(assert (=> b!789675 (= lt!352376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789676 () Bool)

(declare-fun res!534908 () Bool)

(assert (=> b!789676 (=> (not res!534908) (not e!438897))))

(assert (=> b!789676 (= res!534908 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20942 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20942 a!3186))))))

(declare-fun b!789677 () Bool)

(assert (=> b!789677 (= e!438894 e!438892)))

(declare-fun res!534903 () Bool)

(assert (=> b!789677 (=> res!534903 e!438892)))

(assert (=> b!789677 (= res!534903 (not (= lt!352378 lt!352373)))))

(assert (=> b!789677 (= lt!352378 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20521 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789678 () Bool)

(assert (=> b!789678 (= e!438899 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20521 a!3186) j!159) a!3186 mask!3328) lt!352373))))

(assert (= (and start!67892 res!534899) b!789657))

(assert (= (and b!789657 res!534913) b!789665))

(assert (= (and b!789665 res!534910) b!789662))

(assert (= (and b!789662 res!534912) b!789663))

(assert (= (and b!789663 res!534906) b!789673))

(assert (= (and b!789673 res!534914) b!789659))

(assert (= (and b!789659 res!534897) b!789668))

(assert (= (and b!789668 res!534898) b!789676))

(assert (= (and b!789676 res!534908) b!789669))

(assert (= (and b!789669 res!534904) b!789672))

(assert (= (and b!789672 res!534909) b!789670))

(assert (= (and b!789670 c!87789) b!789661))

(assert (= (and b!789670 (not c!87789)) b!789671))

(assert (= (and b!789670 res!534911) b!789658))

(assert (= (and b!789658 res!534905) b!789675))

(assert (= (and b!789675 res!534902) b!789678))

(assert (= (and b!789675 (not res!534901)) b!789677))

(assert (= (and b!789677 (not res!534903)) b!789674))

(assert (= (and b!789674 (not res!534907)) b!789664))

(assert (= (and b!789664 c!87790) b!789666))

(assert (= (and b!789664 (not c!87790)) b!789660))

(assert (= (and b!789664 (not res!534900)) b!789667))

(declare-fun m!730693 () Bool)

(assert (=> b!789677 m!730693))

(assert (=> b!789677 m!730693))

(declare-fun m!730695 () Bool)

(assert (=> b!789677 m!730695))

(declare-fun m!730697 () Bool)

(assert (=> b!789659 m!730697))

(declare-fun m!730699 () Bool)

(assert (=> b!789662 m!730699))

(declare-fun m!730701 () Bool)

(assert (=> b!789664 m!730701))

(declare-fun m!730703 () Bool)

(assert (=> b!789664 m!730703))

(declare-fun m!730705 () Bool)

(assert (=> b!789664 m!730705))

(declare-fun m!730707 () Bool)

(assert (=> start!67892 m!730707))

(declare-fun m!730709 () Bool)

(assert (=> start!67892 m!730709))

(assert (=> b!789661 m!730693))

(assert (=> b!789661 m!730693))

(declare-fun m!730711 () Bool)

(assert (=> b!789661 m!730711))

(declare-fun m!730713 () Bool)

(assert (=> b!789674 m!730713))

(declare-fun m!730715 () Bool)

(assert (=> b!789674 m!730715))

(declare-fun m!730717 () Bool)

(assert (=> b!789672 m!730717))

(assert (=> b!789675 m!730693))

(assert (=> b!789675 m!730693))

(declare-fun m!730719 () Bool)

(assert (=> b!789675 m!730719))

(declare-fun m!730721 () Bool)

(assert (=> b!789675 m!730721))

(declare-fun m!730723 () Bool)

(assert (=> b!789675 m!730723))

(assert (=> b!789669 m!730693))

(assert (=> b!789669 m!730693))

(declare-fun m!730725 () Bool)

(assert (=> b!789669 m!730725))

(assert (=> b!789669 m!730725))

(assert (=> b!789669 m!730693))

(declare-fun m!730727 () Bool)

(assert (=> b!789669 m!730727))

(declare-fun m!730729 () Bool)

(assert (=> b!789668 m!730729))

(declare-fun m!730731 () Bool)

(assert (=> b!789673 m!730731))

(assert (=> b!789678 m!730693))

(assert (=> b!789678 m!730693))

(declare-fun m!730733 () Bool)

(assert (=> b!789678 m!730733))

(declare-fun m!730735 () Bool)

(assert (=> b!789663 m!730735))

(assert (=> b!789665 m!730693))

(assert (=> b!789665 m!730693))

(declare-fun m!730737 () Bool)

(assert (=> b!789665 m!730737))

(declare-fun m!730739 () Bool)

(assert (=> b!789658 m!730739))

(assert (=> b!789658 m!730713))

(declare-fun m!730741 () Bool)

(assert (=> b!789658 m!730741))

(declare-fun m!730743 () Bool)

(assert (=> b!789658 m!730743))

(assert (=> b!789658 m!730743))

(declare-fun m!730745 () Bool)

(assert (=> b!789658 m!730745))

(declare-fun m!730747 () Bool)

(assert (=> b!789667 m!730747))

(assert (=> b!789671 m!730693))

(assert (=> b!789671 m!730693))

(assert (=> b!789671 m!730695))

(check-sat (not b!789668) (not b!789667) (not b!789675) (not b!789663) (not b!789662) (not b!789659) (not b!789661) (not b!789678) (not start!67892) (not b!789664) (not b!789658) (not b!789677) (not b!789665) (not b!789671) (not b!789673) (not b!789669))
(check-sat)
