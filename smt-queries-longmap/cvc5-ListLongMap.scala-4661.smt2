; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64738 () Bool)

(assert start!64738)

(declare-fun b!730686 () Bool)

(declare-fun e!408887 () Bool)

(declare-fun e!408895 () Bool)

(assert (=> b!730686 (= e!408887 e!408895)))

(declare-fun res!490961 () Bool)

(assert (=> b!730686 (=> (not res!490961) (not e!408895))))

(declare-datatypes ((SeekEntryResult!7313 0))(
  ( (MissingZero!7313 (index!31620 (_ BitVec 32))) (Found!7313 (index!31621 (_ BitVec 32))) (Intermediate!7313 (undefined!8125 Bool) (index!31622 (_ BitVec 32)) (x!62599 (_ BitVec 32))) (Undefined!7313) (MissingVacant!7313 (index!31623 (_ BitVec 32))) )
))
(declare-fun lt!323795 () SeekEntryResult!7313)

(declare-fun lt!323793 () SeekEntryResult!7313)

(assert (=> b!730686 (= res!490961 (= lt!323795 lt!323793))))

(declare-fun lt!323786 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41187 0))(
  ( (array!41188 (arr!19713 (Array (_ BitVec 32) (_ BitVec 64))) (size!20134 (_ BitVec 32))) )
))
(declare-fun lt!323792 () array!41187)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41187 (_ BitVec 32)) SeekEntryResult!7313)

(assert (=> b!730686 (= lt!323793 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323786 lt!323792 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730686 (= lt!323795 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323786 mask!3328) lt!323786 lt!323792 mask!3328))))

(declare-fun a!3186 () array!41187)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!730686 (= lt!323786 (select (store (arr!19713 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730686 (= lt!323792 (array!41188 (store (arr!19713 a!3186) i!1173 k!2102) (size!20134 a!3186)))))

(declare-fun b!730687 () Bool)

(declare-fun res!490965 () Bool)

(declare-fun e!408894 () Bool)

(assert (=> b!730687 (=> (not res!490965) (not e!408894))))

(assert (=> b!730687 (= res!490965 (and (= (size!20134 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20134 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20134 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730688 () Bool)

(declare-fun e!408889 () Bool)

(assert (=> b!730688 (= e!408894 e!408889)))

(declare-fun res!490957 () Bool)

(assert (=> b!730688 (=> (not res!490957) (not e!408889))))

(declare-fun lt!323791 () SeekEntryResult!7313)

(assert (=> b!730688 (= res!490957 (or (= lt!323791 (MissingZero!7313 i!1173)) (= lt!323791 (MissingVacant!7313 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41187 (_ BitVec 32)) SeekEntryResult!7313)

(assert (=> b!730688 (= lt!323791 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730689 () Bool)

(declare-fun e!408893 () Bool)

(declare-fun e!408896 () Bool)

(assert (=> b!730689 (= e!408893 e!408896)))

(declare-fun res!490959 () Bool)

(assert (=> b!730689 (=> (not res!490959) (not e!408896))))

(declare-fun lt!323794 () SeekEntryResult!7313)

(assert (=> b!730689 (= res!490959 (= (seekEntryOrOpen!0 (select (arr!19713 a!3186) j!159) a!3186 mask!3328) lt!323794))))

(assert (=> b!730689 (= lt!323794 (Found!7313 j!159))))

(declare-fun b!730690 () Bool)

(assert (=> b!730690 (= e!408889 e!408887)))

(declare-fun res!490963 () Bool)

(assert (=> b!730690 (=> (not res!490963) (not e!408887))))

(declare-fun lt!323789 () SeekEntryResult!7313)

(assert (=> b!730690 (= res!490963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19713 a!3186) j!159) mask!3328) (select (arr!19713 a!3186) j!159) a!3186 mask!3328) lt!323789))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730690 (= lt!323789 (Intermediate!7313 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730691 () Bool)

(declare-fun e!408890 () Bool)

(assert (=> b!730691 (= e!408890 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19713 a!3186) j!159) a!3186 mask!3328) lt!323789))))

(declare-fun b!730692 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41187 (_ BitVec 32)) SeekEntryResult!7313)

(assert (=> b!730692 (= e!408890 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19713 a!3186) j!159) a!3186 mask!3328) (Found!7313 j!159)))))

(declare-fun b!730693 () Bool)

(declare-fun e!408892 () Bool)

(assert (=> b!730693 (= e!408895 (not e!408892))))

(declare-fun res!490964 () Bool)

(assert (=> b!730693 (=> res!490964 e!408892)))

(assert (=> b!730693 (= res!490964 (or (not (is-Intermediate!7313 lt!323793)) (bvsge x!1131 (x!62599 lt!323793))))))

(assert (=> b!730693 e!408893))

(declare-fun res!490962 () Bool)

(assert (=> b!730693 (=> (not res!490962) (not e!408893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41187 (_ BitVec 32)) Bool)

(assert (=> b!730693 (= res!490962 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24944 0))(
  ( (Unit!24945) )
))
(declare-fun lt!323787 () Unit!24944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24944)

(assert (=> b!730693 (= lt!323787 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730694 () Bool)

(declare-fun res!490958 () Bool)

(assert (=> b!730694 (=> (not res!490958) (not e!408889))))

(declare-datatypes ((List!13715 0))(
  ( (Nil!13712) (Cons!13711 (h!14771 (_ BitVec 64)) (t!20030 List!13715)) )
))
(declare-fun arrayNoDuplicates!0 (array!41187 (_ BitVec 32) List!13715) Bool)

(assert (=> b!730694 (= res!490958 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13712))))

(declare-fun b!730695 () Bool)

(declare-fun res!490955 () Bool)

(assert (=> b!730695 (=> (not res!490955) (not e!408894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730695 (= res!490955 (validKeyInArray!0 k!2102))))

(declare-fun b!730696 () Bool)

(declare-fun e!408891 () Bool)

(assert (=> b!730696 (= e!408892 e!408891)))

(declare-fun res!490951 () Bool)

(assert (=> b!730696 (=> res!490951 e!408891)))

(assert (=> b!730696 (= res!490951 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!323790 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730696 (= lt!323790 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730698 () Bool)

(declare-fun res!490967 () Bool)

(assert (=> b!730698 (=> (not res!490967) (not e!408889))))

(assert (=> b!730698 (= res!490967 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20134 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20134 a!3186))))))

(declare-fun b!730699 () Bool)

(assert (=> b!730699 (= e!408896 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19713 a!3186) j!159) a!3186 mask!3328) lt!323794))))

(declare-fun b!730700 () Bool)

(declare-fun res!490956 () Bool)

(assert (=> b!730700 (=> (not res!490956) (not e!408887))))

(assert (=> b!730700 (= res!490956 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19713 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730701 () Bool)

(declare-fun res!490953 () Bool)

(assert (=> b!730701 (=> (not res!490953) (not e!408894))))

(declare-fun arrayContainsKey!0 (array!41187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730701 (= res!490953 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730702 () Bool)

(assert (=> b!730702 (= e!408891 true)))

(declare-fun lt!323788 () SeekEntryResult!7313)

(assert (=> b!730702 (= lt!323788 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19713 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!730703 () Bool)

(declare-fun res!490966 () Bool)

(assert (=> b!730703 (=> (not res!490966) (not e!408894))))

(assert (=> b!730703 (= res!490966 (validKeyInArray!0 (select (arr!19713 a!3186) j!159)))))

(declare-fun b!730704 () Bool)

(declare-fun res!490960 () Bool)

(assert (=> b!730704 (=> (not res!490960) (not e!408887))))

(assert (=> b!730704 (= res!490960 e!408890)))

(declare-fun c!80242 () Bool)

(assert (=> b!730704 (= c!80242 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730697 () Bool)

(declare-fun res!490952 () Bool)

(assert (=> b!730697 (=> (not res!490952) (not e!408889))))

(assert (=> b!730697 (= res!490952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!490954 () Bool)

(assert (=> start!64738 (=> (not res!490954) (not e!408894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64738 (= res!490954 (validMask!0 mask!3328))))

(assert (=> start!64738 e!408894))

(assert (=> start!64738 true))

(declare-fun array_inv!15509 (array!41187) Bool)

(assert (=> start!64738 (array_inv!15509 a!3186)))

(assert (= (and start!64738 res!490954) b!730687))

(assert (= (and b!730687 res!490965) b!730703))

(assert (= (and b!730703 res!490966) b!730695))

(assert (= (and b!730695 res!490955) b!730701))

(assert (= (and b!730701 res!490953) b!730688))

(assert (= (and b!730688 res!490957) b!730697))

(assert (= (and b!730697 res!490952) b!730694))

(assert (= (and b!730694 res!490958) b!730698))

(assert (= (and b!730698 res!490967) b!730690))

(assert (= (and b!730690 res!490963) b!730700))

(assert (= (and b!730700 res!490956) b!730704))

(assert (= (and b!730704 c!80242) b!730691))

(assert (= (and b!730704 (not c!80242)) b!730692))

(assert (= (and b!730704 res!490960) b!730686))

(assert (= (and b!730686 res!490961) b!730693))

(assert (= (and b!730693 res!490962) b!730689))

(assert (= (and b!730689 res!490959) b!730699))

(assert (= (and b!730693 (not res!490964)) b!730696))

(assert (= (and b!730696 (not res!490951)) b!730702))

(declare-fun m!684187 () Bool)

(assert (=> b!730693 m!684187))

(declare-fun m!684189 () Bool)

(assert (=> b!730693 m!684189))

(declare-fun m!684191 () Bool)

(assert (=> b!730697 m!684191))

(declare-fun m!684193 () Bool)

(assert (=> b!730696 m!684193))

(declare-fun m!684195 () Bool)

(assert (=> start!64738 m!684195))

(declare-fun m!684197 () Bool)

(assert (=> start!64738 m!684197))

(declare-fun m!684199 () Bool)

(assert (=> b!730700 m!684199))

(declare-fun m!684201 () Bool)

(assert (=> b!730691 m!684201))

(assert (=> b!730691 m!684201))

(declare-fun m!684203 () Bool)

(assert (=> b!730691 m!684203))

(declare-fun m!684205 () Bool)

(assert (=> b!730701 m!684205))

(assert (=> b!730690 m!684201))

(assert (=> b!730690 m!684201))

(declare-fun m!684207 () Bool)

(assert (=> b!730690 m!684207))

(assert (=> b!730690 m!684207))

(assert (=> b!730690 m!684201))

(declare-fun m!684209 () Bool)

(assert (=> b!730690 m!684209))

(assert (=> b!730689 m!684201))

(assert (=> b!730689 m!684201))

(declare-fun m!684211 () Bool)

(assert (=> b!730689 m!684211))

(declare-fun m!684213 () Bool)

(assert (=> b!730688 m!684213))

(assert (=> b!730699 m!684201))

(assert (=> b!730699 m!684201))

(declare-fun m!684215 () Bool)

(assert (=> b!730699 m!684215))

(declare-fun m!684217 () Bool)

(assert (=> b!730694 m!684217))

(declare-fun m!684219 () Bool)

(assert (=> b!730695 m!684219))

(assert (=> b!730703 m!684201))

(assert (=> b!730703 m!684201))

(declare-fun m!684221 () Bool)

(assert (=> b!730703 m!684221))

(assert (=> b!730702 m!684201))

(assert (=> b!730702 m!684201))

(declare-fun m!684223 () Bool)

(assert (=> b!730702 m!684223))

(assert (=> b!730692 m!684201))

(assert (=> b!730692 m!684201))

(assert (=> b!730692 m!684223))

(declare-fun m!684225 () Bool)

(assert (=> b!730686 m!684225))

(declare-fun m!684227 () Bool)

(assert (=> b!730686 m!684227))

(declare-fun m!684229 () Bool)

(assert (=> b!730686 m!684229))

(declare-fun m!684231 () Bool)

(assert (=> b!730686 m!684231))

(declare-fun m!684233 () Bool)

(assert (=> b!730686 m!684233))

(assert (=> b!730686 m!684231))

(push 1)

