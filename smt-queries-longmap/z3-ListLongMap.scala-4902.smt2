; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67658 () Bool)

(assert start!67658)

(declare-fun b!783426 () Bool)

(declare-datatypes ((Unit!27036 0))(
  ( (Unit!27037) )
))
(declare-fun e!435610 () Unit!27036)

(declare-fun Unit!27038 () Unit!27036)

(assert (=> b!783426 (= e!435610 Unit!27038)))

(assert (=> b!783426 false))

(declare-fun b!783427 () Bool)

(declare-fun res!530004 () Bool)

(declare-fun e!435606 () Bool)

(assert (=> b!783427 (=> (not res!530004) (not e!435606))))

(declare-datatypes ((array!42698 0))(
  ( (array!42699 (arr!20437 (Array (_ BitVec 32) (_ BitVec 64))) (size!20858 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42698)

(declare-datatypes ((List!14439 0))(
  ( (Nil!14436) (Cons!14435 (h!15558 (_ BitVec 64)) (t!20754 List!14439)) )
))
(declare-fun arrayNoDuplicates!0 (array!42698 (_ BitVec 32) List!14439) Bool)

(assert (=> b!783427 (= res!530004 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14436))))

(declare-fun b!783428 () Bool)

(declare-fun res!530012 () Bool)

(declare-fun e!435601 () Bool)

(assert (=> b!783428 (=> (not res!530012) (not e!435601))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783428 (= res!530012 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20437 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783429 () Bool)

(declare-fun e!435611 () Bool)

(assert (=> b!783429 (= e!435601 e!435611)))

(declare-fun res!530017 () Bool)

(assert (=> b!783429 (=> (not res!530017) (not e!435611))))

(declare-datatypes ((SeekEntryResult!8037 0))(
  ( (MissingZero!8037 (index!34516 (_ BitVec 32))) (Found!8037 (index!34517 (_ BitVec 32))) (Intermediate!8037 (undefined!8849 Bool) (index!34518 (_ BitVec 32)) (x!65473 (_ BitVec 32))) (Undefined!8037) (MissingVacant!8037 (index!34519 (_ BitVec 32))) )
))
(declare-fun lt!349155 () SeekEntryResult!8037)

(declare-fun lt!349154 () SeekEntryResult!8037)

(assert (=> b!783429 (= res!530017 (= lt!349155 lt!349154))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!349159 () array!42698)

(declare-fun lt!349160 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42698 (_ BitVec 32)) SeekEntryResult!8037)

(assert (=> b!783429 (= lt!349154 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349160 lt!349159 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783429 (= lt!349155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349160 mask!3328) lt!349160 lt!349159 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!783429 (= lt!349160 (select (store (arr!20437 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783429 (= lt!349159 (array!42699 (store (arr!20437 a!3186) i!1173 k0!2102) (size!20858 a!3186)))))

(declare-fun b!783430 () Bool)

(declare-fun res!530007 () Bool)

(assert (=> b!783430 (=> (not res!530007) (not e!435606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42698 (_ BitVec 32)) Bool)

(assert (=> b!783430 (= res!530007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783431 () Bool)

(declare-fun e!435602 () Bool)

(declare-fun e!435609 () Bool)

(assert (=> b!783431 (= e!435602 e!435609)))

(declare-fun res!530006 () Bool)

(assert (=> b!783431 (=> res!530006 e!435609)))

(declare-fun lt!349158 () (_ BitVec 64))

(assert (=> b!783431 (= res!530006 (= lt!349158 lt!349160))))

(assert (=> b!783431 (= lt!349158 (select (store (arr!20437 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!783432 () Bool)

(assert (=> b!783432 (= e!435609 true)))

(declare-fun e!435603 () Bool)

(assert (=> b!783432 e!435603))

(declare-fun res!530010 () Bool)

(assert (=> b!783432 (=> (not res!530010) (not e!435603))))

(assert (=> b!783432 (= res!530010 (= lt!349158 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349153 () Unit!27036)

(assert (=> b!783432 (= lt!349153 e!435610)))

(declare-fun c!87121 () Bool)

(assert (=> b!783432 (= c!87121 (= lt!349158 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!530005 () Bool)

(declare-fun e!435608 () Bool)

(assert (=> start!67658 (=> (not res!530005) (not e!435608))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67658 (= res!530005 (validMask!0 mask!3328))))

(assert (=> start!67658 e!435608))

(assert (=> start!67658 true))

(declare-fun array_inv!16233 (array!42698) Bool)

(assert (=> start!67658 (array_inv!16233 a!3186)))

(declare-fun e!435604 () Bool)

(declare-fun b!783433 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42698 (_ BitVec 32)) SeekEntryResult!8037)

(assert (=> b!783433 (= e!435604 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20437 a!3186) j!159) a!3186 mask!3328) (Found!8037 j!159)))))

(declare-fun b!783434 () Bool)

(declare-fun res!530003 () Bool)

(assert (=> b!783434 (=> (not res!530003) (not e!435601))))

(assert (=> b!783434 (= res!530003 e!435604)))

(declare-fun c!87120 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783434 (= c!87120 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783435 () Bool)

(assert (=> b!783435 (= e!435606 e!435601)))

(declare-fun res!530001 () Bool)

(assert (=> b!783435 (=> (not res!530001) (not e!435601))))

(declare-fun lt!349161 () SeekEntryResult!8037)

(assert (=> b!783435 (= res!530001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20437 a!3186) j!159) mask!3328) (select (arr!20437 a!3186) j!159) a!3186 mask!3328) lt!349161))))

(assert (=> b!783435 (= lt!349161 (Intermediate!8037 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783436 () Bool)

(assert (=> b!783436 (= e!435611 (not e!435602))))

(declare-fun res!530016 () Bool)

(assert (=> b!783436 (=> res!530016 e!435602)))

(get-info :version)

(assert (=> b!783436 (= res!530016 (or (not ((_ is Intermediate!8037) lt!349154)) (bvslt x!1131 (x!65473 lt!349154)) (not (= x!1131 (x!65473 lt!349154))) (not (= index!1321 (index!34518 lt!349154)))))))

(declare-fun e!435607 () Bool)

(assert (=> b!783436 e!435607))

(declare-fun res!530013 () Bool)

(assert (=> b!783436 (=> (not res!530013) (not e!435607))))

(declare-fun lt!349162 () SeekEntryResult!8037)

(declare-fun lt!349156 () SeekEntryResult!8037)

(assert (=> b!783436 (= res!530013 (= lt!349162 lt!349156))))

(assert (=> b!783436 (= lt!349156 (Found!8037 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42698 (_ BitVec 32)) SeekEntryResult!8037)

(assert (=> b!783436 (= lt!349162 (seekEntryOrOpen!0 (select (arr!20437 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!783436 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349157 () Unit!27036)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27036)

(assert (=> b!783436 (= lt!349157 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783437 () Bool)

(declare-fun res!530015 () Bool)

(assert (=> b!783437 (=> (not res!530015) (not e!435608))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783437 (= res!530015 (validKeyInArray!0 (select (arr!20437 a!3186) j!159)))))

(declare-fun b!783438 () Bool)

(assert (=> b!783438 (= e!435608 e!435606)))

(declare-fun res!530008 () Bool)

(assert (=> b!783438 (=> (not res!530008) (not e!435606))))

(declare-fun lt!349163 () SeekEntryResult!8037)

(assert (=> b!783438 (= res!530008 (or (= lt!349163 (MissingZero!8037 i!1173)) (= lt!349163 (MissingVacant!8037 i!1173))))))

(assert (=> b!783438 (= lt!349163 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783439 () Bool)

(declare-fun res!530014 () Bool)

(assert (=> b!783439 (=> res!530014 e!435602)))

(assert (=> b!783439 (= res!530014 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20437 a!3186) j!159) a!3186 mask!3328) lt!349156)))))

(declare-fun b!783440 () Bool)

(declare-fun res!530009 () Bool)

(assert (=> b!783440 (=> (not res!530009) (not e!435608))))

(assert (=> b!783440 (= res!530009 (validKeyInArray!0 k0!2102))))

(declare-fun b!783441 () Bool)

(declare-fun res!530018 () Bool)

(assert (=> b!783441 (=> (not res!530018) (not e!435608))))

(declare-fun arrayContainsKey!0 (array!42698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783441 (= res!530018 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783442 () Bool)

(assert (=> b!783442 (= e!435607 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20437 a!3186) j!159) a!3186 mask!3328) lt!349156))))

(declare-fun b!783443 () Bool)

(assert (=> b!783443 (= e!435603 (= (seekEntryOrOpen!0 lt!349160 lt!349159 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349160 lt!349159 mask!3328)))))

(declare-fun b!783444 () Bool)

(declare-fun Unit!27039 () Unit!27036)

(assert (=> b!783444 (= e!435610 Unit!27039)))

(declare-fun b!783445 () Bool)

(assert (=> b!783445 (= e!435604 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20437 a!3186) j!159) a!3186 mask!3328) lt!349161))))

(declare-fun b!783446 () Bool)

(declare-fun res!530011 () Bool)

(assert (=> b!783446 (=> (not res!530011) (not e!435606))))

(assert (=> b!783446 (= res!530011 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20858 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20858 a!3186))))))

(declare-fun b!783447 () Bool)

(declare-fun res!530002 () Bool)

(assert (=> b!783447 (=> (not res!530002) (not e!435608))))

(assert (=> b!783447 (= res!530002 (and (= (size!20858 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20858 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20858 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67658 res!530005) b!783447))

(assert (= (and b!783447 res!530002) b!783437))

(assert (= (and b!783437 res!530015) b!783440))

(assert (= (and b!783440 res!530009) b!783441))

(assert (= (and b!783441 res!530018) b!783438))

(assert (= (and b!783438 res!530008) b!783430))

(assert (= (and b!783430 res!530007) b!783427))

(assert (= (and b!783427 res!530004) b!783446))

(assert (= (and b!783446 res!530011) b!783435))

(assert (= (and b!783435 res!530001) b!783428))

(assert (= (and b!783428 res!530012) b!783434))

(assert (= (and b!783434 c!87120) b!783445))

(assert (= (and b!783434 (not c!87120)) b!783433))

(assert (= (and b!783434 res!530003) b!783429))

(assert (= (and b!783429 res!530017) b!783436))

(assert (= (and b!783436 res!530013) b!783442))

(assert (= (and b!783436 (not res!530016)) b!783439))

(assert (= (and b!783439 (not res!530014)) b!783431))

(assert (= (and b!783431 (not res!530006)) b!783432))

(assert (= (and b!783432 c!87121) b!783426))

(assert (= (and b!783432 (not c!87121)) b!783444))

(assert (= (and b!783432 res!530010) b!783443))

(declare-fun m!725985 () Bool)

(assert (=> b!783440 m!725985))

(declare-fun m!725987 () Bool)

(assert (=> start!67658 m!725987))

(declare-fun m!725989 () Bool)

(assert (=> start!67658 m!725989))

(declare-fun m!725991 () Bool)

(assert (=> b!783442 m!725991))

(assert (=> b!783442 m!725991))

(declare-fun m!725993 () Bool)

(assert (=> b!783442 m!725993))

(declare-fun m!725995 () Bool)

(assert (=> b!783430 m!725995))

(assert (=> b!783433 m!725991))

(assert (=> b!783433 m!725991))

(declare-fun m!725997 () Bool)

(assert (=> b!783433 m!725997))

(assert (=> b!783436 m!725991))

(assert (=> b!783436 m!725991))

(declare-fun m!725999 () Bool)

(assert (=> b!783436 m!725999))

(declare-fun m!726001 () Bool)

(assert (=> b!783436 m!726001))

(declare-fun m!726003 () Bool)

(assert (=> b!783436 m!726003))

(declare-fun m!726005 () Bool)

(assert (=> b!783428 m!726005))

(declare-fun m!726007 () Bool)

(assert (=> b!783429 m!726007))

(assert (=> b!783429 m!726007))

(declare-fun m!726009 () Bool)

(assert (=> b!783429 m!726009))

(declare-fun m!726011 () Bool)

(assert (=> b!783429 m!726011))

(declare-fun m!726013 () Bool)

(assert (=> b!783429 m!726013))

(declare-fun m!726015 () Bool)

(assert (=> b!783429 m!726015))

(assert (=> b!783431 m!726011))

(declare-fun m!726017 () Bool)

(assert (=> b!783431 m!726017))

(assert (=> b!783437 m!725991))

(assert (=> b!783437 m!725991))

(declare-fun m!726019 () Bool)

(assert (=> b!783437 m!726019))

(declare-fun m!726021 () Bool)

(assert (=> b!783438 m!726021))

(assert (=> b!783439 m!725991))

(assert (=> b!783439 m!725991))

(assert (=> b!783439 m!725997))

(declare-fun m!726023 () Bool)

(assert (=> b!783441 m!726023))

(assert (=> b!783435 m!725991))

(assert (=> b!783435 m!725991))

(declare-fun m!726025 () Bool)

(assert (=> b!783435 m!726025))

(assert (=> b!783435 m!726025))

(assert (=> b!783435 m!725991))

(declare-fun m!726027 () Bool)

(assert (=> b!783435 m!726027))

(declare-fun m!726029 () Bool)

(assert (=> b!783443 m!726029))

(declare-fun m!726031 () Bool)

(assert (=> b!783443 m!726031))

(assert (=> b!783445 m!725991))

(assert (=> b!783445 m!725991))

(declare-fun m!726033 () Bool)

(assert (=> b!783445 m!726033))

(declare-fun m!726035 () Bool)

(assert (=> b!783427 m!726035))

(check-sat (not start!67658) (not b!783442) (not b!783436) (not b!783443) (not b!783427) (not b!783433) (not b!783435) (not b!783439) (not b!783437) (not b!783430) (not b!783445) (not b!783438) (not b!783429) (not b!783440) (not b!783441))
(check-sat)
