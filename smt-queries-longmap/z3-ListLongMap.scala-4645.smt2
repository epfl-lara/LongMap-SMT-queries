; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64644 () Bool)

(assert start!64644)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41093 0))(
  ( (array!41094 (arr!19666 (Array (_ BitVec 32) (_ BitVec 64))) (size!20087 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41093)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!728146 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!407624 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7266 0))(
  ( (MissingZero!7266 (index!31432 (_ BitVec 32))) (Found!7266 (index!31433 (_ BitVec 32))) (Intermediate!7266 (undefined!8078 Bool) (index!31434 (_ BitVec 32)) (x!62424 (_ BitVec 32))) (Undefined!7266) (MissingVacant!7266 (index!31435 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41093 (_ BitVec 32)) SeekEntryResult!7266)

(assert (=> b!728146 (= e!407624 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19666 a!3186) j!159) a!3186 mask!3328) (Found!7266 j!159)))))

(declare-fun b!728147 () Bool)

(declare-fun res!488701 () Bool)

(declare-fun e!407618 () Bool)

(assert (=> b!728147 (=> (not res!488701) (not e!407618))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728147 (= res!488701 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728148 () Bool)

(declare-fun e!407622 () Bool)

(declare-fun e!407617 () Bool)

(assert (=> b!728148 (= e!407622 e!407617)))

(declare-fun res!488706 () Bool)

(assert (=> b!728148 (=> (not res!488706) (not e!407617))))

(declare-fun lt!322522 () SeekEntryResult!7266)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41093 (_ BitVec 32)) SeekEntryResult!7266)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728148 (= res!488706 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19666 a!3186) j!159) mask!3328) (select (arr!19666 a!3186) j!159) a!3186 mask!3328) lt!322522))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728148 (= lt!322522 (Intermediate!7266 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728149 () Bool)

(declare-fun res!488693 () Bool)

(assert (=> b!728149 (=> (not res!488693) (not e!407617))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728149 (= res!488693 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19666 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728151 () Bool)

(assert (=> b!728151 (= e!407624 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19666 a!3186) j!159) a!3186 mask!3328) lt!322522))))

(declare-fun b!728152 () Bool)

(declare-fun res!488703 () Bool)

(assert (=> b!728152 (=> (not res!488703) (not e!407618))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728152 (= res!488703 (validKeyInArray!0 k0!2102))))

(declare-fun e!407621 () Bool)

(declare-fun b!728153 () Bool)

(declare-fun lt!322516 () SeekEntryResult!7266)

(assert (=> b!728153 (= e!407621 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19666 a!3186) j!159) a!3186 mask!3328) lt!322516))))

(declare-fun b!728154 () Bool)

(declare-fun e!407616 () Bool)

(assert (=> b!728154 (= e!407616 true)))

(declare-fun lt!322520 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728154 (= lt!322520 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728155 () Bool)

(declare-fun e!407619 () Bool)

(assert (=> b!728155 (= e!407619 (not e!407616))))

(declare-fun res!488694 () Bool)

(assert (=> b!728155 (=> res!488694 e!407616)))

(declare-fun lt!322521 () SeekEntryResult!7266)

(get-info :version)

(assert (=> b!728155 (= res!488694 (or (not ((_ is Intermediate!7266) lt!322521)) (bvsge x!1131 (x!62424 lt!322521))))))

(declare-fun e!407620 () Bool)

(assert (=> b!728155 e!407620))

(declare-fun res!488705 () Bool)

(assert (=> b!728155 (=> (not res!488705) (not e!407620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41093 (_ BitVec 32)) Bool)

(assert (=> b!728155 (= res!488705 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24850 0))(
  ( (Unit!24851) )
))
(declare-fun lt!322518 () Unit!24850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24850)

(assert (=> b!728155 (= lt!322518 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728156 () Bool)

(assert (=> b!728156 (= e!407617 e!407619)))

(declare-fun res!488699 () Bool)

(assert (=> b!728156 (=> (not res!488699) (not e!407619))))

(declare-fun lt!322515 () SeekEntryResult!7266)

(assert (=> b!728156 (= res!488699 (= lt!322515 lt!322521))))

(declare-fun lt!322523 () (_ BitVec 64))

(declare-fun lt!322517 () array!41093)

(assert (=> b!728156 (= lt!322521 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322523 lt!322517 mask!3328))))

(assert (=> b!728156 (= lt!322515 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322523 mask!3328) lt!322523 lt!322517 mask!3328))))

(assert (=> b!728156 (= lt!322523 (select (store (arr!19666 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728156 (= lt!322517 (array!41094 (store (arr!19666 a!3186) i!1173 k0!2102) (size!20087 a!3186)))))

(declare-fun b!728157 () Bool)

(declare-fun res!488697 () Bool)

(assert (=> b!728157 (=> (not res!488697) (not e!407622))))

(declare-datatypes ((List!13668 0))(
  ( (Nil!13665) (Cons!13664 (h!14724 (_ BitVec 64)) (t!19983 List!13668)) )
))
(declare-fun arrayNoDuplicates!0 (array!41093 (_ BitVec 32) List!13668) Bool)

(assert (=> b!728157 (= res!488697 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13665))))

(declare-fun b!728158 () Bool)

(assert (=> b!728158 (= e!407618 e!407622)))

(declare-fun res!488695 () Bool)

(assert (=> b!728158 (=> (not res!488695) (not e!407622))))

(declare-fun lt!322519 () SeekEntryResult!7266)

(assert (=> b!728158 (= res!488695 (or (= lt!322519 (MissingZero!7266 i!1173)) (= lt!322519 (MissingVacant!7266 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41093 (_ BitVec 32)) SeekEntryResult!7266)

(assert (=> b!728158 (= lt!322519 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728159 () Bool)

(declare-fun res!488704 () Bool)

(assert (=> b!728159 (=> (not res!488704) (not e!407618))))

(assert (=> b!728159 (= res!488704 (validKeyInArray!0 (select (arr!19666 a!3186) j!159)))))

(declare-fun b!728160 () Bool)

(declare-fun res!488698 () Bool)

(assert (=> b!728160 (=> (not res!488698) (not e!407617))))

(assert (=> b!728160 (= res!488698 e!407624)))

(declare-fun c!80101 () Bool)

(assert (=> b!728160 (= c!80101 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728150 () Bool)

(declare-fun res!488696 () Bool)

(assert (=> b!728150 (=> (not res!488696) (not e!407618))))

(assert (=> b!728150 (= res!488696 (and (= (size!20087 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20087 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20087 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!488708 () Bool)

(assert (=> start!64644 (=> (not res!488708) (not e!407618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64644 (= res!488708 (validMask!0 mask!3328))))

(assert (=> start!64644 e!407618))

(assert (=> start!64644 true))

(declare-fun array_inv!15462 (array!41093) Bool)

(assert (=> start!64644 (array_inv!15462 a!3186)))

(declare-fun b!728161 () Bool)

(declare-fun res!488707 () Bool)

(assert (=> b!728161 (=> (not res!488707) (not e!407622))))

(assert (=> b!728161 (= res!488707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728162 () Bool)

(assert (=> b!728162 (= e!407620 e!407621)))

(declare-fun res!488700 () Bool)

(assert (=> b!728162 (=> (not res!488700) (not e!407621))))

(assert (=> b!728162 (= res!488700 (= (seekEntryOrOpen!0 (select (arr!19666 a!3186) j!159) a!3186 mask!3328) lt!322516))))

(assert (=> b!728162 (= lt!322516 (Found!7266 j!159))))

(declare-fun b!728163 () Bool)

(declare-fun res!488702 () Bool)

(assert (=> b!728163 (=> (not res!488702) (not e!407622))))

(assert (=> b!728163 (= res!488702 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20087 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20087 a!3186))))))

(assert (= (and start!64644 res!488708) b!728150))

(assert (= (and b!728150 res!488696) b!728159))

(assert (= (and b!728159 res!488704) b!728152))

(assert (= (and b!728152 res!488703) b!728147))

(assert (= (and b!728147 res!488701) b!728158))

(assert (= (and b!728158 res!488695) b!728161))

(assert (= (and b!728161 res!488707) b!728157))

(assert (= (and b!728157 res!488697) b!728163))

(assert (= (and b!728163 res!488702) b!728148))

(assert (= (and b!728148 res!488706) b!728149))

(assert (= (and b!728149 res!488693) b!728160))

(assert (= (and b!728160 c!80101) b!728151))

(assert (= (and b!728160 (not c!80101)) b!728146))

(assert (= (and b!728160 res!488698) b!728156))

(assert (= (and b!728156 res!488699) b!728155))

(assert (= (and b!728155 res!488705) b!728162))

(assert (= (and b!728162 res!488700) b!728153))

(assert (= (and b!728155 (not res!488694)) b!728154))

(declare-fun m!681931 () Bool)

(assert (=> b!728155 m!681931))

(declare-fun m!681933 () Bool)

(assert (=> b!728155 m!681933))

(declare-fun m!681935 () Bool)

(assert (=> b!728159 m!681935))

(assert (=> b!728159 m!681935))

(declare-fun m!681937 () Bool)

(assert (=> b!728159 m!681937))

(declare-fun m!681939 () Bool)

(assert (=> b!728152 m!681939))

(declare-fun m!681941 () Bool)

(assert (=> b!728157 m!681941))

(assert (=> b!728162 m!681935))

(assert (=> b!728162 m!681935))

(declare-fun m!681943 () Bool)

(assert (=> b!728162 m!681943))

(declare-fun m!681945 () Bool)

(assert (=> b!728147 m!681945))

(declare-fun m!681947 () Bool)

(assert (=> start!64644 m!681947))

(declare-fun m!681949 () Bool)

(assert (=> start!64644 m!681949))

(declare-fun m!681951 () Bool)

(assert (=> b!728154 m!681951))

(assert (=> b!728153 m!681935))

(assert (=> b!728153 m!681935))

(declare-fun m!681953 () Bool)

(assert (=> b!728153 m!681953))

(assert (=> b!728146 m!681935))

(assert (=> b!728146 m!681935))

(declare-fun m!681955 () Bool)

(assert (=> b!728146 m!681955))

(declare-fun m!681957 () Bool)

(assert (=> b!728161 m!681957))

(declare-fun m!681959 () Bool)

(assert (=> b!728158 m!681959))

(declare-fun m!681961 () Bool)

(assert (=> b!728156 m!681961))

(declare-fun m!681963 () Bool)

(assert (=> b!728156 m!681963))

(declare-fun m!681965 () Bool)

(assert (=> b!728156 m!681965))

(declare-fun m!681967 () Bool)

(assert (=> b!728156 m!681967))

(declare-fun m!681969 () Bool)

(assert (=> b!728156 m!681969))

(assert (=> b!728156 m!681965))

(declare-fun m!681971 () Bool)

(assert (=> b!728149 m!681971))

(assert (=> b!728151 m!681935))

(assert (=> b!728151 m!681935))

(declare-fun m!681973 () Bool)

(assert (=> b!728151 m!681973))

(assert (=> b!728148 m!681935))

(assert (=> b!728148 m!681935))

(declare-fun m!681975 () Bool)

(assert (=> b!728148 m!681975))

(assert (=> b!728148 m!681975))

(assert (=> b!728148 m!681935))

(declare-fun m!681977 () Bool)

(assert (=> b!728148 m!681977))

(check-sat (not b!728161) (not b!728152) (not b!728156) (not b!728154) (not b!728158) (not b!728148) (not b!728151) (not b!728157) (not b!728147) (not b!728153) (not start!64644) (not b!728155) (not b!728159) (not b!728146) (not b!728162))
(check-sat)
