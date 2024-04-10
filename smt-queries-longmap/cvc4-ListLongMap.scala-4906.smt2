; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67684 () Bool)

(assert start!67684)

(declare-fun b!784310 () Bool)

(declare-fun res!530729 () Bool)

(declare-fun e!436075 () Bool)

(assert (=> b!784310 (=> (not res!530729) (not e!436075))))

(declare-datatypes ((array!42724 0))(
  ( (array!42725 (arr!20450 (Array (_ BitVec 32) (_ BitVec 64))) (size!20871 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42724)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784310 (= res!530729 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784311 () Bool)

(declare-fun res!530734 () Bool)

(declare-fun e!436067 () Bool)

(assert (=> b!784311 (=> (not res!530734) (not e!436067))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42724 (_ BitVec 32)) Bool)

(assert (=> b!784311 (= res!530734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784312 () Bool)

(declare-datatypes ((Unit!27088 0))(
  ( (Unit!27089) )
))
(declare-fun e!436073 () Unit!27088)

(declare-fun Unit!27090 () Unit!27088)

(assert (=> b!784312 (= e!436073 Unit!27090)))

(assert (=> b!784312 false))

(declare-fun b!784313 () Bool)

(declare-fun e!436066 () Bool)

(assert (=> b!784313 (= e!436067 e!436066)))

(declare-fun res!530744 () Bool)

(assert (=> b!784313 (=> (not res!530744) (not e!436066))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8050 0))(
  ( (MissingZero!8050 (index!34568 (_ BitVec 32))) (Found!8050 (index!34569 (_ BitVec 32))) (Intermediate!8050 (undefined!8862 Bool) (index!34570 (_ BitVec 32)) (x!65518 (_ BitVec 32))) (Undefined!8050) (MissingVacant!8050 (index!34571 (_ BitVec 32))) )
))
(declare-fun lt!349623 () SeekEntryResult!8050)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42724 (_ BitVec 32)) SeekEntryResult!8050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784313 (= res!530744 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20450 a!3186) j!159) mask!3328) (select (arr!20450 a!3186) j!159) a!3186 mask!3328) lt!349623))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784313 (= lt!349623 (Intermediate!8050 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784314 () Bool)

(declare-fun e!436076 () Bool)

(declare-fun e!436071 () Bool)

(assert (=> b!784314 (= e!436076 e!436071)))

(declare-fun res!530732 () Bool)

(assert (=> b!784314 (=> res!530732 e!436071)))

(declare-fun lt!349622 () SeekEntryResult!8050)

(declare-fun lt!349626 () SeekEntryResult!8050)

(assert (=> b!784314 (= res!530732 (not (= lt!349622 lt!349626)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42724 (_ BitVec 32)) SeekEntryResult!8050)

(assert (=> b!784314 (= lt!349622 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20450 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784315 () Bool)

(declare-fun e!436065 () Bool)

(assert (=> b!784315 (= e!436071 e!436065)))

(declare-fun res!530735 () Bool)

(assert (=> b!784315 (=> res!530735 e!436065)))

(declare-fun lt!349620 () (_ BitVec 64))

(declare-fun lt!349619 () (_ BitVec 64))

(assert (=> b!784315 (= res!530735 (= lt!349620 lt!349619))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784315 (= lt!349620 (select (store (arr!20450 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!784316 () Bool)

(declare-fun res!530742 () Bool)

(assert (=> b!784316 (=> (not res!530742) (not e!436075))))

(assert (=> b!784316 (= res!530742 (and (= (size!20871 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20871 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20871 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784317 () Bool)

(declare-fun res!530743 () Bool)

(assert (=> b!784317 (=> (not res!530743) (not e!436075))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784317 (= res!530743 (validKeyInArray!0 k!2102))))

(declare-fun e!436069 () Bool)

(declare-fun b!784318 () Bool)

(assert (=> b!784318 (= e!436069 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20450 a!3186) j!159) a!3186 mask!3328) lt!349626))))

(declare-fun b!784319 () Bool)

(declare-fun res!530739 () Bool)

(assert (=> b!784319 (=> (not res!530739) (not e!436075))))

(assert (=> b!784319 (= res!530739 (validKeyInArray!0 (select (arr!20450 a!3186) j!159)))))

(declare-fun b!784320 () Bool)

(declare-fun res!530730 () Bool)

(assert (=> b!784320 (=> (not res!530730) (not e!436066))))

(assert (=> b!784320 (= res!530730 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20450 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784321 () Bool)

(declare-fun res!530737 () Bool)

(declare-fun e!436072 () Bool)

(assert (=> b!784321 (=> (not res!530737) (not e!436072))))

(declare-fun lt!349621 () array!42724)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42724 (_ BitVec 32)) SeekEntryResult!8050)

(assert (=> b!784321 (= res!530737 (= (seekEntryOrOpen!0 lt!349619 lt!349621 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349619 lt!349621 mask!3328)))))

(declare-fun b!784322 () Bool)

(declare-fun e!436074 () Bool)

(assert (=> b!784322 (= e!436074 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20450 a!3186) j!159) a!3186 mask!3328) (Found!8050 j!159)))))

(declare-fun b!784323 () Bool)

(assert (=> b!784323 (= e!436065 true)))

(assert (=> b!784323 e!436072))

(declare-fun res!530733 () Bool)

(assert (=> b!784323 (=> (not res!530733) (not e!436072))))

(assert (=> b!784323 (= res!530733 (= lt!349620 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349618 () Unit!27088)

(assert (=> b!784323 (= lt!349618 e!436073)))

(declare-fun c!87199 () Bool)

(assert (=> b!784323 (= c!87199 (= lt!349620 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784324 () Bool)

(declare-fun Unit!27091 () Unit!27088)

(assert (=> b!784324 (= e!436073 Unit!27091)))

(declare-fun b!784325 () Bool)

(declare-fun res!530746 () Bool)

(assert (=> b!784325 (=> (not res!530746) (not e!436067))))

(assert (=> b!784325 (= res!530746 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20871 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20871 a!3186))))))

(declare-fun res!530740 () Bool)

(assert (=> start!67684 (=> (not res!530740) (not e!436075))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67684 (= res!530740 (validMask!0 mask!3328))))

(assert (=> start!67684 e!436075))

(assert (=> start!67684 true))

(declare-fun array_inv!16246 (array!42724) Bool)

(assert (=> start!67684 (array_inv!16246 a!3186)))

(declare-fun b!784326 () Bool)

(declare-fun res!530731 () Bool)

(assert (=> b!784326 (=> (not res!530731) (not e!436066))))

(assert (=> b!784326 (= res!530731 e!436074)))

(declare-fun c!87198 () Bool)

(assert (=> b!784326 (= c!87198 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784327 () Bool)

(declare-fun e!436070 () Bool)

(assert (=> b!784327 (= e!436070 (not e!436076))))

(declare-fun res!530736 () Bool)

(assert (=> b!784327 (=> res!530736 e!436076)))

(declare-fun lt!349625 () SeekEntryResult!8050)

(assert (=> b!784327 (= res!530736 (or (not (is-Intermediate!8050 lt!349625)) (bvslt x!1131 (x!65518 lt!349625)) (not (= x!1131 (x!65518 lt!349625))) (not (= index!1321 (index!34570 lt!349625)))))))

(assert (=> b!784327 e!436069))

(declare-fun res!530738 () Bool)

(assert (=> b!784327 (=> (not res!530738) (not e!436069))))

(declare-fun lt!349628 () SeekEntryResult!8050)

(assert (=> b!784327 (= res!530738 (= lt!349628 lt!349626))))

(assert (=> b!784327 (= lt!349626 (Found!8050 j!159))))

(assert (=> b!784327 (= lt!349628 (seekEntryOrOpen!0 (select (arr!20450 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784327 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349617 () Unit!27088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42724 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27088)

(assert (=> b!784327 (= lt!349617 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784328 () Bool)

(assert (=> b!784328 (= e!436075 e!436067)))

(declare-fun res!530745 () Bool)

(assert (=> b!784328 (=> (not res!530745) (not e!436067))))

(declare-fun lt!349624 () SeekEntryResult!8050)

(assert (=> b!784328 (= res!530745 (or (= lt!349624 (MissingZero!8050 i!1173)) (= lt!349624 (MissingVacant!8050 i!1173))))))

(assert (=> b!784328 (= lt!349624 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!784329 () Bool)

(assert (=> b!784329 (= e!436072 (= lt!349628 lt!349622))))

(declare-fun b!784330 () Bool)

(assert (=> b!784330 (= e!436066 e!436070)))

(declare-fun res!530741 () Bool)

(assert (=> b!784330 (=> (not res!530741) (not e!436070))))

(declare-fun lt!349627 () SeekEntryResult!8050)

(assert (=> b!784330 (= res!530741 (= lt!349627 lt!349625))))

(assert (=> b!784330 (= lt!349625 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349619 lt!349621 mask!3328))))

(assert (=> b!784330 (= lt!349627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349619 mask!3328) lt!349619 lt!349621 mask!3328))))

(assert (=> b!784330 (= lt!349619 (select (store (arr!20450 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!784330 (= lt!349621 (array!42725 (store (arr!20450 a!3186) i!1173 k!2102) (size!20871 a!3186)))))

(declare-fun b!784331 () Bool)

(declare-fun res!530747 () Bool)

(assert (=> b!784331 (=> (not res!530747) (not e!436067))))

(declare-datatypes ((List!14452 0))(
  ( (Nil!14449) (Cons!14448 (h!15571 (_ BitVec 64)) (t!20767 List!14452)) )
))
(declare-fun arrayNoDuplicates!0 (array!42724 (_ BitVec 32) List!14452) Bool)

(assert (=> b!784331 (= res!530747 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14449))))

(declare-fun b!784332 () Bool)

(assert (=> b!784332 (= e!436074 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20450 a!3186) j!159) a!3186 mask!3328) lt!349623))))

(assert (= (and start!67684 res!530740) b!784316))

(assert (= (and b!784316 res!530742) b!784319))

(assert (= (and b!784319 res!530739) b!784317))

(assert (= (and b!784317 res!530743) b!784310))

(assert (= (and b!784310 res!530729) b!784328))

(assert (= (and b!784328 res!530745) b!784311))

(assert (= (and b!784311 res!530734) b!784331))

(assert (= (and b!784331 res!530747) b!784325))

(assert (= (and b!784325 res!530746) b!784313))

(assert (= (and b!784313 res!530744) b!784320))

(assert (= (and b!784320 res!530730) b!784326))

(assert (= (and b!784326 c!87198) b!784332))

(assert (= (and b!784326 (not c!87198)) b!784322))

(assert (= (and b!784326 res!530731) b!784330))

(assert (= (and b!784330 res!530741) b!784327))

(assert (= (and b!784327 res!530738) b!784318))

(assert (= (and b!784327 (not res!530736)) b!784314))

(assert (= (and b!784314 (not res!530732)) b!784315))

(assert (= (and b!784315 (not res!530735)) b!784323))

(assert (= (and b!784323 c!87199) b!784312))

(assert (= (and b!784323 (not c!87199)) b!784324))

(assert (= (and b!784323 res!530733) b!784321))

(assert (= (and b!784321 res!530737) b!784329))

(declare-fun m!726661 () Bool)

(assert (=> b!784321 m!726661))

(declare-fun m!726663 () Bool)

(assert (=> b!784321 m!726663))

(declare-fun m!726665 () Bool)

(assert (=> b!784318 m!726665))

(assert (=> b!784318 m!726665))

(declare-fun m!726667 () Bool)

(assert (=> b!784318 m!726667))

(declare-fun m!726669 () Bool)

(assert (=> b!784331 m!726669))

(declare-fun m!726671 () Bool)

(assert (=> start!67684 m!726671))

(declare-fun m!726673 () Bool)

(assert (=> start!67684 m!726673))

(declare-fun m!726675 () Bool)

(assert (=> b!784320 m!726675))

(declare-fun m!726677 () Bool)

(assert (=> b!784330 m!726677))

(declare-fun m!726679 () Bool)

(assert (=> b!784330 m!726679))

(declare-fun m!726681 () Bool)

(assert (=> b!784330 m!726681))

(declare-fun m!726683 () Bool)

(assert (=> b!784330 m!726683))

(assert (=> b!784330 m!726677))

(declare-fun m!726685 () Bool)

(assert (=> b!784330 m!726685))

(declare-fun m!726687 () Bool)

(assert (=> b!784311 m!726687))

(declare-fun m!726689 () Bool)

(assert (=> b!784310 m!726689))

(assert (=> b!784314 m!726665))

(assert (=> b!784314 m!726665))

(declare-fun m!726691 () Bool)

(assert (=> b!784314 m!726691))

(assert (=> b!784313 m!726665))

(assert (=> b!784313 m!726665))

(declare-fun m!726693 () Bool)

(assert (=> b!784313 m!726693))

(assert (=> b!784313 m!726693))

(assert (=> b!784313 m!726665))

(declare-fun m!726695 () Bool)

(assert (=> b!784313 m!726695))

(assert (=> b!784327 m!726665))

(assert (=> b!784327 m!726665))

(declare-fun m!726697 () Bool)

(assert (=> b!784327 m!726697))

(declare-fun m!726699 () Bool)

(assert (=> b!784327 m!726699))

(declare-fun m!726701 () Bool)

(assert (=> b!784327 m!726701))

(assert (=> b!784322 m!726665))

(assert (=> b!784322 m!726665))

(assert (=> b!784322 m!726691))

(declare-fun m!726703 () Bool)

(assert (=> b!784317 m!726703))

(declare-fun m!726705 () Bool)

(assert (=> b!784328 m!726705))

(assert (=> b!784315 m!726681))

(declare-fun m!726707 () Bool)

(assert (=> b!784315 m!726707))

(assert (=> b!784332 m!726665))

(assert (=> b!784332 m!726665))

(declare-fun m!726709 () Bool)

(assert (=> b!784332 m!726709))

(assert (=> b!784319 m!726665))

(assert (=> b!784319 m!726665))

(declare-fun m!726711 () Bool)

(assert (=> b!784319 m!726711))

(push 1)

