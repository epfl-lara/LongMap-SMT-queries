; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67694 () Bool)

(assert start!67694)

(declare-fun b!784655 () Bool)

(declare-fun res!531031 () Bool)

(declare-fun e!436251 () Bool)

(assert (=> b!784655 (=> (not res!531031) (not e!436251))))

(declare-datatypes ((array!42734 0))(
  ( (array!42735 (arr!20455 (Array (_ BitVec 32) (_ BitVec 64))) (size!20876 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42734)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784655 (= res!531031 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784656 () Bool)

(declare-datatypes ((Unit!27108 0))(
  ( (Unit!27109) )
))
(declare-fun e!436248 () Unit!27108)

(declare-fun Unit!27110 () Unit!27108)

(assert (=> b!784656 (= e!436248 Unit!27110)))

(declare-fun b!784657 () Bool)

(declare-fun res!531023 () Bool)

(declare-fun e!436246 () Bool)

(assert (=> b!784657 (=> (not res!531023) (not e!436246))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!349807 () array!42734)

(declare-fun lt!349803 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8055 0))(
  ( (MissingZero!8055 (index!34588 (_ BitVec 32))) (Found!8055 (index!34589 (_ BitVec 32))) (Intermediate!8055 (undefined!8867 Bool) (index!34590 (_ BitVec 32)) (x!65539 (_ BitVec 32))) (Undefined!8055) (MissingVacant!8055 (index!34591 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42734 (_ BitVec 32)) SeekEntryResult!8055)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42734 (_ BitVec 32)) SeekEntryResult!8055)

(assert (=> b!784657 (= res!531023 (= (seekEntryOrOpen!0 lt!349803 lt!349807 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349803 lt!349807 mask!3328)))))

(declare-fun lt!349808 () SeekEntryResult!8055)

(declare-fun e!436254 () Bool)

(declare-fun b!784658 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42734 (_ BitVec 32)) SeekEntryResult!8055)

(assert (=> b!784658 (= e!436254 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20455 a!3186) j!159) a!3186 mask!3328) lt!349808))))

(declare-fun b!784659 () Bool)

(declare-fun e!436255 () Bool)

(declare-fun e!436245 () Bool)

(assert (=> b!784659 (= e!436255 e!436245)))

(declare-fun res!531016 () Bool)

(assert (=> b!784659 (=> (not res!531016) (not e!436245))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784659 (= res!531016 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20455 a!3186) j!159) mask!3328) (select (arr!20455 a!3186) j!159) a!3186 mask!3328) lt!349808))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784659 (= lt!349808 (Intermediate!8055 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784660 () Bool)

(declare-fun e!436247 () Bool)

(assert (=> b!784660 (= e!436247 true)))

(assert (=> b!784660 e!436246))

(declare-fun res!531029 () Bool)

(assert (=> b!784660 (=> (not res!531029) (not e!436246))))

(declare-fun lt!349797 () (_ BitVec 64))

(assert (=> b!784660 (= res!531029 (= lt!349797 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349798 () Unit!27108)

(assert (=> b!784660 (= lt!349798 e!436248)))

(declare-fun c!87229 () Bool)

(assert (=> b!784660 (= c!87229 (= lt!349797 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784661 () Bool)

(declare-fun res!531025 () Bool)

(assert (=> b!784661 (=> (not res!531025) (not e!436251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784661 (= res!531025 (validKeyInArray!0 (select (arr!20455 a!3186) j!159)))))

(declare-fun b!784662 () Bool)

(declare-fun res!531030 () Bool)

(assert (=> b!784662 (=> (not res!531030) (not e!436251))))

(assert (=> b!784662 (= res!531030 (validKeyInArray!0 k0!2102))))

(declare-fun b!784663 () Bool)

(declare-fun res!531024 () Bool)

(assert (=> b!784663 (=> (not res!531024) (not e!436255))))

(assert (=> b!784663 (= res!531024 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20876 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20876 a!3186))))))

(declare-fun b!784664 () Bool)

(declare-fun Unit!27111 () Unit!27108)

(assert (=> b!784664 (= e!436248 Unit!27111)))

(assert (=> b!784664 false))

(declare-fun b!784665 () Bool)

(declare-fun e!436253 () Bool)

(assert (=> b!784665 (= e!436253 e!436247)))

(declare-fun res!531020 () Bool)

(assert (=> b!784665 (=> res!531020 e!436247)))

(assert (=> b!784665 (= res!531020 (= lt!349797 lt!349803))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784665 (= lt!349797 (select (store (arr!20455 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun res!531022 () Bool)

(assert (=> start!67694 (=> (not res!531022) (not e!436251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67694 (= res!531022 (validMask!0 mask!3328))))

(assert (=> start!67694 e!436251))

(assert (=> start!67694 true))

(declare-fun array_inv!16251 (array!42734) Bool)

(assert (=> start!67694 (array_inv!16251 a!3186)))

(declare-fun b!784666 () Bool)

(declare-fun res!531014 () Bool)

(assert (=> b!784666 (=> (not res!531014) (not e!436251))))

(assert (=> b!784666 (= res!531014 (and (= (size!20876 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20876 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20876 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784667 () Bool)

(declare-fun lt!349805 () SeekEntryResult!8055)

(declare-fun lt!349801 () SeekEntryResult!8055)

(assert (=> b!784667 (= e!436246 (= lt!349805 lt!349801))))

(declare-fun b!784668 () Bool)

(declare-fun e!436250 () Bool)

(assert (=> b!784668 (= e!436245 e!436250)))

(declare-fun res!531026 () Bool)

(assert (=> b!784668 (=> (not res!531026) (not e!436250))))

(declare-fun lt!349806 () SeekEntryResult!8055)

(declare-fun lt!349804 () SeekEntryResult!8055)

(assert (=> b!784668 (= res!531026 (= lt!349806 lt!349804))))

(assert (=> b!784668 (= lt!349804 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349803 lt!349807 mask!3328))))

(assert (=> b!784668 (= lt!349806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349803 mask!3328) lt!349803 lt!349807 mask!3328))))

(assert (=> b!784668 (= lt!349803 (select (store (arr!20455 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784668 (= lt!349807 (array!42735 (store (arr!20455 a!3186) i!1173 k0!2102) (size!20876 a!3186)))))

(declare-fun b!784669 () Bool)

(declare-fun res!531015 () Bool)

(assert (=> b!784669 (=> (not res!531015) (not e!436255))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42734 (_ BitVec 32)) Bool)

(assert (=> b!784669 (= res!531015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784670 () Bool)

(assert (=> b!784670 (= e!436254 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20455 a!3186) j!159) a!3186 mask!3328) (Found!8055 j!159)))))

(declare-fun b!784671 () Bool)

(declare-fun res!531032 () Bool)

(assert (=> b!784671 (=> (not res!531032) (not e!436245))))

(assert (=> b!784671 (= res!531032 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20455 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!436256 () Bool)

(declare-fun lt!349800 () SeekEntryResult!8055)

(declare-fun b!784672 () Bool)

(assert (=> b!784672 (= e!436256 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20455 a!3186) j!159) a!3186 mask!3328) lt!349800))))

(declare-fun b!784673 () Bool)

(declare-fun e!436249 () Bool)

(assert (=> b!784673 (= e!436250 (not e!436249))))

(declare-fun res!531018 () Bool)

(assert (=> b!784673 (=> res!531018 e!436249)))

(get-info :version)

(assert (=> b!784673 (= res!531018 (or (not ((_ is Intermediate!8055) lt!349804)) (bvslt x!1131 (x!65539 lt!349804)) (not (= x!1131 (x!65539 lt!349804))) (not (= index!1321 (index!34590 lt!349804)))))))

(assert (=> b!784673 e!436256))

(declare-fun res!531027 () Bool)

(assert (=> b!784673 (=> (not res!531027) (not e!436256))))

(assert (=> b!784673 (= res!531027 (= lt!349805 lt!349800))))

(assert (=> b!784673 (= lt!349800 (Found!8055 j!159))))

(assert (=> b!784673 (= lt!349805 (seekEntryOrOpen!0 (select (arr!20455 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784673 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349802 () Unit!27108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27108)

(assert (=> b!784673 (= lt!349802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784674 () Bool)

(assert (=> b!784674 (= e!436251 e!436255)))

(declare-fun res!531028 () Bool)

(assert (=> b!784674 (=> (not res!531028) (not e!436255))))

(declare-fun lt!349799 () SeekEntryResult!8055)

(assert (=> b!784674 (= res!531028 (or (= lt!349799 (MissingZero!8055 i!1173)) (= lt!349799 (MissingVacant!8055 i!1173))))))

(assert (=> b!784674 (= lt!349799 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784675 () Bool)

(declare-fun res!531019 () Bool)

(assert (=> b!784675 (=> (not res!531019) (not e!436255))))

(declare-datatypes ((List!14457 0))(
  ( (Nil!14454) (Cons!14453 (h!15576 (_ BitVec 64)) (t!20772 List!14457)) )
))
(declare-fun arrayNoDuplicates!0 (array!42734 (_ BitVec 32) List!14457) Bool)

(assert (=> b!784675 (= res!531019 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14454))))

(declare-fun b!784676 () Bool)

(assert (=> b!784676 (= e!436249 e!436253)))

(declare-fun res!531021 () Bool)

(assert (=> b!784676 (=> res!531021 e!436253)))

(assert (=> b!784676 (= res!531021 (not (= lt!349801 lt!349800)))))

(assert (=> b!784676 (= lt!349801 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20455 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784677 () Bool)

(declare-fun res!531017 () Bool)

(assert (=> b!784677 (=> (not res!531017) (not e!436245))))

(assert (=> b!784677 (= res!531017 e!436254)))

(declare-fun c!87228 () Bool)

(assert (=> b!784677 (= c!87228 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!67694 res!531022) b!784666))

(assert (= (and b!784666 res!531014) b!784661))

(assert (= (and b!784661 res!531025) b!784662))

(assert (= (and b!784662 res!531030) b!784655))

(assert (= (and b!784655 res!531031) b!784674))

(assert (= (and b!784674 res!531028) b!784669))

(assert (= (and b!784669 res!531015) b!784675))

(assert (= (and b!784675 res!531019) b!784663))

(assert (= (and b!784663 res!531024) b!784659))

(assert (= (and b!784659 res!531016) b!784671))

(assert (= (and b!784671 res!531032) b!784677))

(assert (= (and b!784677 c!87228) b!784658))

(assert (= (and b!784677 (not c!87228)) b!784670))

(assert (= (and b!784677 res!531017) b!784668))

(assert (= (and b!784668 res!531026) b!784673))

(assert (= (and b!784673 res!531027) b!784672))

(assert (= (and b!784673 (not res!531018)) b!784676))

(assert (= (and b!784676 (not res!531021)) b!784665))

(assert (= (and b!784665 (not res!531020)) b!784660))

(assert (= (and b!784660 c!87229) b!784664))

(assert (= (and b!784660 (not c!87229)) b!784656))

(assert (= (and b!784660 res!531029) b!784657))

(assert (= (and b!784657 res!531023) b!784667))

(declare-fun m!726921 () Bool)

(assert (=> b!784662 m!726921))

(declare-fun m!726923 () Bool)

(assert (=> b!784659 m!726923))

(assert (=> b!784659 m!726923))

(declare-fun m!726925 () Bool)

(assert (=> b!784659 m!726925))

(assert (=> b!784659 m!726925))

(assert (=> b!784659 m!726923))

(declare-fun m!726927 () Bool)

(assert (=> b!784659 m!726927))

(declare-fun m!726929 () Bool)

(assert (=> start!67694 m!726929))

(declare-fun m!726931 () Bool)

(assert (=> start!67694 m!726931))

(assert (=> b!784661 m!726923))

(assert (=> b!784661 m!726923))

(declare-fun m!726933 () Bool)

(assert (=> b!784661 m!726933))

(declare-fun m!726935 () Bool)

(assert (=> b!784668 m!726935))

(declare-fun m!726937 () Bool)

(assert (=> b!784668 m!726937))

(assert (=> b!784668 m!726935))

(declare-fun m!726939 () Bool)

(assert (=> b!784668 m!726939))

(declare-fun m!726941 () Bool)

(assert (=> b!784668 m!726941))

(declare-fun m!726943 () Bool)

(assert (=> b!784668 m!726943))

(declare-fun m!726945 () Bool)

(assert (=> b!784674 m!726945))

(assert (=> b!784672 m!726923))

(assert (=> b!784672 m!726923))

(declare-fun m!726947 () Bool)

(assert (=> b!784672 m!726947))

(assert (=> b!784673 m!726923))

(assert (=> b!784673 m!726923))

(declare-fun m!726949 () Bool)

(assert (=> b!784673 m!726949))

(declare-fun m!726951 () Bool)

(assert (=> b!784673 m!726951))

(declare-fun m!726953 () Bool)

(assert (=> b!784673 m!726953))

(assert (=> b!784658 m!726923))

(assert (=> b!784658 m!726923))

(declare-fun m!726955 () Bool)

(assert (=> b!784658 m!726955))

(declare-fun m!726957 () Bool)

(assert (=> b!784671 m!726957))

(declare-fun m!726959 () Bool)

(assert (=> b!784675 m!726959))

(assert (=> b!784676 m!726923))

(assert (=> b!784676 m!726923))

(declare-fun m!726961 () Bool)

(assert (=> b!784676 m!726961))

(declare-fun m!726963 () Bool)

(assert (=> b!784655 m!726963))

(assert (=> b!784670 m!726923))

(assert (=> b!784670 m!726923))

(assert (=> b!784670 m!726961))

(assert (=> b!784665 m!726939))

(declare-fun m!726965 () Bool)

(assert (=> b!784665 m!726965))

(declare-fun m!726967 () Bool)

(assert (=> b!784657 m!726967))

(declare-fun m!726969 () Bool)

(assert (=> b!784657 m!726969))

(declare-fun m!726971 () Bool)

(assert (=> b!784669 m!726971))

(check-sat (not b!784670) (not b!784676) (not b!784668) (not b!784662) (not start!67694) (not b!784657) (not b!784661) (not b!784658) (not b!784675) (not b!784673) (not b!784655) (not b!784669) (not b!784672) (not b!784674) (not b!784659))
(check-sat)
