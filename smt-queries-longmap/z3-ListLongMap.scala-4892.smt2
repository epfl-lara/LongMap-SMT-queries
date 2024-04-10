; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67466 () Bool)

(assert start!67466)

(declare-fun b!780652 () Bool)

(declare-fun res!528216 () Bool)

(declare-fun e!434236 () Bool)

(assert (=> b!780652 (=> (not res!528216) (not e!434236))))

(declare-datatypes ((array!42632 0))(
  ( (array!42633 (arr!20407 (Array (_ BitVec 32) (_ BitVec 64))) (size!20828 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42632)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780652 (= res!528216 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780653 () Bool)

(declare-datatypes ((Unit!26916 0))(
  ( (Unit!26917) )
))
(declare-fun e!434232 () Unit!26916)

(declare-fun Unit!26918 () Unit!26916)

(assert (=> b!780653 (= e!434232 Unit!26918)))

(assert (=> b!780653 false))

(declare-fun b!780654 () Bool)

(declare-fun Unit!26919 () Unit!26916)

(assert (=> b!780654 (= e!434232 Unit!26919)))

(declare-fun b!780656 () Bool)

(declare-fun e!434234 () Bool)

(declare-fun e!434233 () Bool)

(assert (=> b!780656 (= e!434234 e!434233)))

(declare-fun res!528212 () Bool)

(assert (=> b!780656 (=> (not res!528212) (not e!434233))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8007 0))(
  ( (MissingZero!8007 (index!34396 (_ BitVec 32))) (Found!8007 (index!34397 (_ BitVec 32))) (Intermediate!8007 (undefined!8819 Bool) (index!34398 (_ BitVec 32)) (x!65345 (_ BitVec 32))) (Undefined!8007) (MissingVacant!8007 (index!34399 (_ BitVec 32))) )
))
(declare-fun lt!347889 () SeekEntryResult!8007)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42632 (_ BitVec 32)) SeekEntryResult!8007)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780656 (= res!528212 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20407 a!3186) j!159) mask!3328) (select (arr!20407 a!3186) j!159) a!3186 mask!3328) lt!347889))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780656 (= lt!347889 (Intermediate!8007 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780657 () Bool)

(assert (=> b!780657 (= e!434236 e!434234)))

(declare-fun res!528218 () Bool)

(assert (=> b!780657 (=> (not res!528218) (not e!434234))))

(declare-fun lt!347890 () SeekEntryResult!8007)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!780657 (= res!528218 (or (= lt!347890 (MissingZero!8007 i!1173)) (= lt!347890 (MissingVacant!8007 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42632 (_ BitVec 32)) SeekEntryResult!8007)

(assert (=> b!780657 (= lt!347890 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!780658 () Bool)

(declare-fun res!528208 () Bool)

(declare-fun e!434238 () Bool)

(assert (=> b!780658 (=> res!528208 e!434238)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!347888 () (_ BitVec 64))

(assert (=> b!780658 (= res!528208 (= (select (store (arr!20407 a!3186) i!1173 k0!2102) index!1321) lt!347888))))

(declare-fun b!780659 () Bool)

(declare-fun lt!347885 () SeekEntryResult!8007)

(declare-fun e!434237 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42632 (_ BitVec 32)) SeekEntryResult!8007)

(assert (=> b!780659 (= e!434237 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20407 a!3186) j!159) a!3186 mask!3328) lt!347885))))

(declare-fun b!780660 () Bool)

(declare-fun res!528206 () Bool)

(assert (=> b!780660 (=> (not res!528206) (not e!434234))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42632 (_ BitVec 32)) Bool)

(assert (=> b!780660 (= res!528206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780661 () Bool)

(declare-fun res!528215 () Bool)

(assert (=> b!780661 (=> res!528215 e!434238)))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!780661 (= res!528215 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20407 a!3186) j!159) a!3186 mask!3328) lt!347885)))))

(declare-fun b!780662 () Bool)

(assert (=> b!780662 (= e!434238 true)))

(declare-fun lt!347894 () Unit!26916)

(assert (=> b!780662 (= lt!347894 e!434232)))

(declare-fun c!86629 () Bool)

(assert (=> b!780662 (= c!86629 (= (select (store (arr!20407 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!780663 () Bool)

(declare-fun e!434239 () Bool)

(assert (=> b!780663 (= e!434233 e!434239)))

(declare-fun res!528213 () Bool)

(assert (=> b!780663 (=> (not res!528213) (not e!434239))))

(declare-fun lt!347887 () SeekEntryResult!8007)

(declare-fun lt!347892 () SeekEntryResult!8007)

(assert (=> b!780663 (= res!528213 (= lt!347887 lt!347892))))

(declare-fun lt!347891 () array!42632)

(assert (=> b!780663 (= lt!347892 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347888 lt!347891 mask!3328))))

(assert (=> b!780663 (= lt!347887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347888 mask!3328) lt!347888 lt!347891 mask!3328))))

(assert (=> b!780663 (= lt!347888 (select (store (arr!20407 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!780663 (= lt!347891 (array!42633 (store (arr!20407 a!3186) i!1173 k0!2102) (size!20828 a!3186)))))

(declare-fun b!780664 () Bool)

(declare-fun res!528217 () Bool)

(assert (=> b!780664 (=> (not res!528217) (not e!434236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780664 (= res!528217 (validKeyInArray!0 k0!2102))))

(declare-fun b!780655 () Bool)

(declare-fun res!528211 () Bool)

(assert (=> b!780655 (=> (not res!528211) (not e!434236))))

(assert (=> b!780655 (= res!528211 (validKeyInArray!0 (select (arr!20407 a!3186) j!159)))))

(declare-fun res!528221 () Bool)

(assert (=> start!67466 (=> (not res!528221) (not e!434236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67466 (= res!528221 (validMask!0 mask!3328))))

(assert (=> start!67466 e!434236))

(assert (=> start!67466 true))

(declare-fun array_inv!16203 (array!42632) Bool)

(assert (=> start!67466 (array_inv!16203 a!3186)))

(declare-fun b!780665 () Bool)

(assert (=> b!780665 (= e!434239 (not e!434238))))

(declare-fun res!528207 () Bool)

(assert (=> b!780665 (=> res!528207 e!434238)))

(get-info :version)

(assert (=> b!780665 (= res!528207 (or (not ((_ is Intermediate!8007) lt!347892)) (bvslt x!1131 (x!65345 lt!347892)) (not (= x!1131 (x!65345 lt!347892))) (not (= index!1321 (index!34398 lt!347892)))))))

(assert (=> b!780665 e!434237))

(declare-fun res!528219 () Bool)

(assert (=> b!780665 (=> (not res!528219) (not e!434237))))

(declare-fun lt!347893 () SeekEntryResult!8007)

(assert (=> b!780665 (= res!528219 (= lt!347893 lt!347885))))

(assert (=> b!780665 (= lt!347885 (Found!8007 j!159))))

(assert (=> b!780665 (= lt!347893 (seekEntryOrOpen!0 (select (arr!20407 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!780665 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!347886 () Unit!26916)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42632 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26916)

(assert (=> b!780665 (= lt!347886 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780666 () Bool)

(declare-fun res!528209 () Bool)

(assert (=> b!780666 (=> (not res!528209) (not e!434233))))

(assert (=> b!780666 (= res!528209 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20407 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780667 () Bool)

(declare-fun res!528210 () Bool)

(assert (=> b!780667 (=> (not res!528210) (not e!434234))))

(assert (=> b!780667 (= res!528210 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20828 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20828 a!3186))))))

(declare-fun b!780668 () Bool)

(declare-fun res!528214 () Bool)

(assert (=> b!780668 (=> (not res!528214) (not e!434234))))

(declare-datatypes ((List!14409 0))(
  ( (Nil!14406) (Cons!14405 (h!15522 (_ BitVec 64)) (t!20724 List!14409)) )
))
(declare-fun arrayNoDuplicates!0 (array!42632 (_ BitVec 32) List!14409) Bool)

(assert (=> b!780668 (= res!528214 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14406))))

(declare-fun b!780669 () Bool)

(declare-fun e!434235 () Bool)

(assert (=> b!780669 (= e!434235 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20407 a!3186) j!159) a!3186 mask!3328) (Found!8007 j!159)))))

(declare-fun b!780670 () Bool)

(declare-fun res!528205 () Bool)

(assert (=> b!780670 (=> (not res!528205) (not e!434233))))

(assert (=> b!780670 (= res!528205 e!434235)))

(declare-fun c!86628 () Bool)

(assert (=> b!780670 (= c!86628 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780671 () Bool)

(declare-fun res!528220 () Bool)

(assert (=> b!780671 (=> (not res!528220) (not e!434236))))

(assert (=> b!780671 (= res!528220 (and (= (size!20828 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20828 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20828 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780672 () Bool)

(assert (=> b!780672 (= e!434235 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20407 a!3186) j!159) a!3186 mask!3328) lt!347889))))

(assert (= (and start!67466 res!528221) b!780671))

(assert (= (and b!780671 res!528220) b!780655))

(assert (= (and b!780655 res!528211) b!780664))

(assert (= (and b!780664 res!528217) b!780652))

(assert (= (and b!780652 res!528216) b!780657))

(assert (= (and b!780657 res!528218) b!780660))

(assert (= (and b!780660 res!528206) b!780668))

(assert (= (and b!780668 res!528214) b!780667))

(assert (= (and b!780667 res!528210) b!780656))

(assert (= (and b!780656 res!528212) b!780666))

(assert (= (and b!780666 res!528209) b!780670))

(assert (= (and b!780670 c!86628) b!780672))

(assert (= (and b!780670 (not c!86628)) b!780669))

(assert (= (and b!780670 res!528205) b!780663))

(assert (= (and b!780663 res!528213) b!780665))

(assert (= (and b!780665 res!528219) b!780659))

(assert (= (and b!780665 (not res!528207)) b!780661))

(assert (= (and b!780661 (not res!528215)) b!780658))

(assert (= (and b!780658 (not res!528208)) b!780662))

(assert (= (and b!780662 c!86629) b!780653))

(assert (= (and b!780662 (not c!86629)) b!780654))

(declare-fun m!723905 () Bool)

(assert (=> start!67466 m!723905))

(declare-fun m!723907 () Bool)

(assert (=> start!67466 m!723907))

(declare-fun m!723909 () Bool)

(assert (=> b!780658 m!723909))

(declare-fun m!723911 () Bool)

(assert (=> b!780658 m!723911))

(declare-fun m!723913 () Bool)

(assert (=> b!780659 m!723913))

(assert (=> b!780659 m!723913))

(declare-fun m!723915 () Bool)

(assert (=> b!780659 m!723915))

(declare-fun m!723917 () Bool)

(assert (=> b!780666 m!723917))

(declare-fun m!723919 () Bool)

(assert (=> b!780652 m!723919))

(assert (=> b!780661 m!723913))

(assert (=> b!780661 m!723913))

(declare-fun m!723921 () Bool)

(assert (=> b!780661 m!723921))

(assert (=> b!780655 m!723913))

(assert (=> b!780655 m!723913))

(declare-fun m!723923 () Bool)

(assert (=> b!780655 m!723923))

(declare-fun m!723925 () Bool)

(assert (=> b!780660 m!723925))

(assert (=> b!780665 m!723913))

(assert (=> b!780665 m!723913))

(declare-fun m!723927 () Bool)

(assert (=> b!780665 m!723927))

(declare-fun m!723929 () Bool)

(assert (=> b!780665 m!723929))

(declare-fun m!723931 () Bool)

(assert (=> b!780665 m!723931))

(declare-fun m!723933 () Bool)

(assert (=> b!780657 m!723933))

(assert (=> b!780656 m!723913))

(assert (=> b!780656 m!723913))

(declare-fun m!723935 () Bool)

(assert (=> b!780656 m!723935))

(assert (=> b!780656 m!723935))

(assert (=> b!780656 m!723913))

(declare-fun m!723937 () Bool)

(assert (=> b!780656 m!723937))

(assert (=> b!780672 m!723913))

(assert (=> b!780672 m!723913))

(declare-fun m!723939 () Bool)

(assert (=> b!780672 m!723939))

(assert (=> b!780662 m!723909))

(assert (=> b!780662 m!723911))

(declare-fun m!723941 () Bool)

(assert (=> b!780663 m!723941))

(assert (=> b!780663 m!723909))

(declare-fun m!723943 () Bool)

(assert (=> b!780663 m!723943))

(declare-fun m!723945 () Bool)

(assert (=> b!780663 m!723945))

(assert (=> b!780663 m!723945))

(declare-fun m!723947 () Bool)

(assert (=> b!780663 m!723947))

(declare-fun m!723949 () Bool)

(assert (=> b!780668 m!723949))

(assert (=> b!780669 m!723913))

(assert (=> b!780669 m!723913))

(assert (=> b!780669 m!723921))

(declare-fun m!723951 () Bool)

(assert (=> b!780664 m!723951))

(check-sat (not b!780660) (not b!780664) (not b!780655) (not b!780657) (not b!780656) (not b!780669) (not b!780652) (not b!780665) (not b!780663) (not b!780668) (not b!780659) (not b!780672) (not b!780661) (not start!67466))
(check-sat)
