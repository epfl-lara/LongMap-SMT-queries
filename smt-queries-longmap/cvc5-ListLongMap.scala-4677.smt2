; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65122 () Bool)

(assert start!65122)

(declare-fun b!735172 () Bool)

(declare-fun e!411345 () Bool)

(assert (=> b!735172 (= e!411345 true)))

(declare-fun lt!325869 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!41295 0))(
  ( (array!41296 (arr!19761 (Array (_ BitVec 32) (_ BitVec 64))) (size!20182 (_ BitVec 32))) )
))
(declare-fun lt!325867 () array!41295)

(declare-datatypes ((SeekEntryResult!7361 0))(
  ( (MissingZero!7361 (index!31812 (_ BitVec 32))) (Found!7361 (index!31813 (_ BitVec 32))) (Intermediate!7361 (undefined!8173 Bool) (index!31814 (_ BitVec 32)) (x!62823 (_ BitVec 32))) (Undefined!7361) (MissingVacant!7361 (index!31815 (_ BitVec 32))) )
))
(declare-fun lt!325866 () SeekEntryResult!7361)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!325863 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41295 (_ BitVec 32)) SeekEntryResult!7361)

(assert (=> b!735172 (= lt!325866 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325863 lt!325869 lt!325867 mask!3328))))

(declare-fun b!735173 () Bool)

(declare-fun res!493984 () Bool)

(declare-fun e!411348 () Bool)

(assert (=> b!735173 (=> (not res!493984) (not e!411348))))

(declare-fun a!3186 () array!41295)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735173 (= res!493984 (and (= (size!20182 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20182 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20182 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735174 () Bool)

(declare-fun res!493981 () Bool)

(declare-fun e!411344 () Bool)

(assert (=> b!735174 (=> (not res!493981) (not e!411344))))

(declare-fun e!411341 () Bool)

(assert (=> b!735174 (= res!493981 e!411341)))

(declare-fun c!80980 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735174 (= c!80980 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735175 () Bool)

(declare-fun e!411346 () Bool)

(declare-fun e!411349 () Bool)

(assert (=> b!735175 (= e!411346 (not e!411349))))

(declare-fun res!493993 () Bool)

(assert (=> b!735175 (=> res!493993 e!411349)))

(declare-fun lt!325870 () SeekEntryResult!7361)

(assert (=> b!735175 (= res!493993 (or (not (is-Intermediate!7361 lt!325870)) (bvsge x!1131 (x!62823 lt!325870))))))

(declare-fun lt!325858 () SeekEntryResult!7361)

(assert (=> b!735175 (= lt!325858 (Found!7361 j!159))))

(declare-fun e!411339 () Bool)

(assert (=> b!735175 e!411339))

(declare-fun res!493991 () Bool)

(assert (=> b!735175 (=> (not res!493991) (not e!411339))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41295 (_ BitVec 32)) Bool)

(assert (=> b!735175 (= res!493991 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25040 0))(
  ( (Unit!25041) )
))
(declare-fun lt!325862 () Unit!25040)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41295 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25040)

(assert (=> b!735175 (= lt!325862 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735176 () Bool)

(declare-fun res!493992 () Bool)

(declare-fun e!411340 () Bool)

(assert (=> b!735176 (=> (not res!493992) (not e!411340))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!735176 (= res!493992 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20182 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20182 a!3186))))))

(declare-fun b!735177 () Bool)

(assert (=> b!735177 (= e!411348 e!411340)))

(declare-fun res!493990 () Bool)

(assert (=> b!735177 (=> (not res!493990) (not e!411340))))

(declare-fun lt!325865 () SeekEntryResult!7361)

(assert (=> b!735177 (= res!493990 (or (= lt!325865 (MissingZero!7361 i!1173)) (= lt!325865 (MissingVacant!7361 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41295 (_ BitVec 32)) SeekEntryResult!7361)

(assert (=> b!735177 (= lt!325865 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!735178 () Bool)

(declare-fun e!411342 () Unit!25040)

(declare-fun Unit!25042 () Unit!25040)

(assert (=> b!735178 (= e!411342 Unit!25042)))

(declare-fun lt!325871 () SeekEntryResult!7361)

(assert (=> b!735178 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325863 (select (arr!19761 a!3186) j!159) a!3186 mask!3328) lt!325871)))

(declare-fun e!411350 () Bool)

(declare-fun b!735179 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41295 (_ BitVec 32)) SeekEntryResult!7361)

(assert (=> b!735179 (= e!411350 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325863 resIntermediateIndex!5 (select (arr!19761 a!3186) j!159) a!3186 mask!3328) lt!325858)))))

(declare-fun b!735180 () Bool)

(assert (=> b!735180 (= e!411349 e!411345)))

(declare-fun res!493989 () Bool)

(assert (=> b!735180 (=> res!493989 e!411345)))

(assert (=> b!735180 (= res!493989 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!325863 #b00000000000000000000000000000000) (bvsge lt!325863 (size!20182 a!3186))))))

(declare-fun lt!325861 () Unit!25040)

(assert (=> b!735180 (= lt!325861 e!411342)))

(declare-fun c!80978 () Bool)

(declare-fun lt!325864 () Bool)

(assert (=> b!735180 (= c!80978 lt!325864)))

(assert (=> b!735180 (= lt!325864 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735180 (= lt!325863 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735181 () Bool)

(declare-fun res!493983 () Bool)

(assert (=> b!735181 (=> (not res!493983) (not e!411348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735181 (= res!493983 (validKeyInArray!0 k!2102))))

(declare-fun b!735182 () Bool)

(assert (=> b!735182 (= e!411350 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325863 (select (arr!19761 a!3186) j!159) a!3186 mask!3328) lt!325871)))))

(declare-fun b!735183 () Bool)

(declare-fun res!493980 () Bool)

(assert (=> b!735183 (=> (not res!493980) (not e!411340))))

(assert (=> b!735183 (= res!493980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735184 () Bool)

(declare-fun Unit!25043 () Unit!25040)

(assert (=> b!735184 (= e!411342 Unit!25043)))

(declare-fun lt!325868 () SeekEntryResult!7361)

(assert (=> b!735184 (= lt!325868 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19761 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735184 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325863 resIntermediateIndex!5 (select (arr!19761 a!3186) j!159) a!3186 mask!3328) lt!325858)))

(declare-fun res!493979 () Bool)

(assert (=> start!65122 (=> (not res!493979) (not e!411348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65122 (= res!493979 (validMask!0 mask!3328))))

(assert (=> start!65122 e!411348))

(assert (=> start!65122 true))

(declare-fun array_inv!15557 (array!41295) Bool)

(assert (=> start!65122 (array_inv!15557 a!3186)))

(declare-fun b!735185 () Bool)

(declare-fun res!493978 () Bool)

(assert (=> b!735185 (=> res!493978 e!411345)))

(assert (=> b!735185 (= res!493978 e!411350)))

(declare-fun c!80979 () Bool)

(assert (=> b!735185 (= c!80979 lt!325864)))

(declare-fun b!735186 () Bool)

(declare-fun res!493988 () Bool)

(assert (=> b!735186 (=> (not res!493988) (not e!411348))))

(declare-fun arrayContainsKey!0 (array!41295 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735186 (= res!493988 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735187 () Bool)

(assert (=> b!735187 (= e!411341 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19761 a!3186) j!159) a!3186 mask!3328) lt!325871))))

(declare-fun b!735188 () Bool)

(assert (=> b!735188 (= e!411341 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19761 a!3186) j!159) a!3186 mask!3328) (Found!7361 j!159)))))

(declare-fun b!735189 () Bool)

(declare-fun e!411347 () Bool)

(assert (=> b!735189 (= e!411339 e!411347)))

(declare-fun res!493986 () Bool)

(assert (=> b!735189 (=> (not res!493986) (not e!411347))))

(declare-fun lt!325860 () SeekEntryResult!7361)

(assert (=> b!735189 (= res!493986 (= (seekEntryOrOpen!0 (select (arr!19761 a!3186) j!159) a!3186 mask!3328) lt!325860))))

(assert (=> b!735189 (= lt!325860 (Found!7361 j!159))))

(declare-fun b!735190 () Bool)

(declare-fun res!493985 () Bool)

(assert (=> b!735190 (=> (not res!493985) (not e!411340))))

(declare-datatypes ((List!13763 0))(
  ( (Nil!13760) (Cons!13759 (h!14831 (_ BitVec 64)) (t!20078 List!13763)) )
))
(declare-fun arrayNoDuplicates!0 (array!41295 (_ BitVec 32) List!13763) Bool)

(assert (=> b!735190 (= res!493985 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13760))))

(declare-fun b!735191 () Bool)

(declare-fun res!493977 () Bool)

(assert (=> b!735191 (=> (not res!493977) (not e!411348))))

(assert (=> b!735191 (= res!493977 (validKeyInArray!0 (select (arr!19761 a!3186) j!159)))))

(declare-fun b!735192 () Bool)

(assert (=> b!735192 (= e!411340 e!411344)))

(declare-fun res!493987 () Bool)

(assert (=> b!735192 (=> (not res!493987) (not e!411344))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735192 (= res!493987 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19761 a!3186) j!159) mask!3328) (select (arr!19761 a!3186) j!159) a!3186 mask!3328) lt!325871))))

(assert (=> b!735192 (= lt!325871 (Intermediate!7361 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735193 () Bool)

(assert (=> b!735193 (= e!411344 e!411346)))

(declare-fun res!493994 () Bool)

(assert (=> b!735193 (=> (not res!493994) (not e!411346))))

(declare-fun lt!325859 () SeekEntryResult!7361)

(assert (=> b!735193 (= res!493994 (= lt!325859 lt!325870))))

(assert (=> b!735193 (= lt!325870 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325869 lt!325867 mask!3328))))

(assert (=> b!735193 (= lt!325859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325869 mask!3328) lt!325869 lt!325867 mask!3328))))

(assert (=> b!735193 (= lt!325869 (select (store (arr!19761 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!735193 (= lt!325867 (array!41296 (store (arr!19761 a!3186) i!1173 k!2102) (size!20182 a!3186)))))

(declare-fun b!735194 () Bool)

(declare-fun res!493982 () Bool)

(assert (=> b!735194 (=> (not res!493982) (not e!411344))))

(assert (=> b!735194 (= res!493982 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19761 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735195 () Bool)

(assert (=> b!735195 (= e!411347 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19761 a!3186) j!159) a!3186 mask!3328) lt!325860))))

(assert (= (and start!65122 res!493979) b!735173))

(assert (= (and b!735173 res!493984) b!735191))

(assert (= (and b!735191 res!493977) b!735181))

(assert (= (and b!735181 res!493983) b!735186))

(assert (= (and b!735186 res!493988) b!735177))

(assert (= (and b!735177 res!493990) b!735183))

(assert (= (and b!735183 res!493980) b!735190))

(assert (= (and b!735190 res!493985) b!735176))

(assert (= (and b!735176 res!493992) b!735192))

(assert (= (and b!735192 res!493987) b!735194))

(assert (= (and b!735194 res!493982) b!735174))

(assert (= (and b!735174 c!80980) b!735187))

(assert (= (and b!735174 (not c!80980)) b!735188))

(assert (= (and b!735174 res!493981) b!735193))

(assert (= (and b!735193 res!493994) b!735175))

(assert (= (and b!735175 res!493991) b!735189))

(assert (= (and b!735189 res!493986) b!735195))

(assert (= (and b!735175 (not res!493993)) b!735180))

(assert (= (and b!735180 c!80978) b!735178))

(assert (= (and b!735180 (not c!80978)) b!735184))

(assert (= (and b!735180 (not res!493989)) b!735185))

(assert (= (and b!735185 c!80979) b!735182))

(assert (= (and b!735185 (not c!80979)) b!735179))

(assert (= (and b!735185 (not res!493978)) b!735172))

(declare-fun m!687619 () Bool)

(assert (=> b!735175 m!687619))

(declare-fun m!687621 () Bool)

(assert (=> b!735175 m!687621))

(declare-fun m!687623 () Bool)

(assert (=> b!735187 m!687623))

(assert (=> b!735187 m!687623))

(declare-fun m!687625 () Bool)

(assert (=> b!735187 m!687625))

(declare-fun m!687627 () Bool)

(assert (=> b!735181 m!687627))

(declare-fun m!687629 () Bool)

(assert (=> b!735194 m!687629))

(assert (=> b!735184 m!687623))

(assert (=> b!735184 m!687623))

(declare-fun m!687631 () Bool)

(assert (=> b!735184 m!687631))

(assert (=> b!735184 m!687623))

(declare-fun m!687633 () Bool)

(assert (=> b!735184 m!687633))

(assert (=> b!735189 m!687623))

(assert (=> b!735189 m!687623))

(declare-fun m!687635 () Bool)

(assert (=> b!735189 m!687635))

(assert (=> b!735191 m!687623))

(assert (=> b!735191 m!687623))

(declare-fun m!687637 () Bool)

(assert (=> b!735191 m!687637))

(declare-fun m!687639 () Bool)

(assert (=> b!735190 m!687639))

(declare-fun m!687641 () Bool)

(assert (=> b!735172 m!687641))

(declare-fun m!687643 () Bool)

(assert (=> start!65122 m!687643))

(declare-fun m!687645 () Bool)

(assert (=> start!65122 m!687645))

(assert (=> b!735188 m!687623))

(assert (=> b!735188 m!687623))

(assert (=> b!735188 m!687631))

(assert (=> b!735178 m!687623))

(assert (=> b!735178 m!687623))

(declare-fun m!687647 () Bool)

(assert (=> b!735178 m!687647))

(declare-fun m!687649 () Bool)

(assert (=> b!735193 m!687649))

(declare-fun m!687651 () Bool)

(assert (=> b!735193 m!687651))

(declare-fun m!687653 () Bool)

(assert (=> b!735193 m!687653))

(declare-fun m!687655 () Bool)

(assert (=> b!735193 m!687655))

(assert (=> b!735193 m!687651))

(declare-fun m!687657 () Bool)

(assert (=> b!735193 m!687657))

(assert (=> b!735192 m!687623))

(assert (=> b!735192 m!687623))

(declare-fun m!687659 () Bool)

(assert (=> b!735192 m!687659))

(assert (=> b!735192 m!687659))

(assert (=> b!735192 m!687623))

(declare-fun m!687661 () Bool)

(assert (=> b!735192 m!687661))

(assert (=> b!735195 m!687623))

(assert (=> b!735195 m!687623))

(declare-fun m!687663 () Bool)

(assert (=> b!735195 m!687663))

(declare-fun m!687665 () Bool)

(assert (=> b!735180 m!687665))

(declare-fun m!687667 () Bool)

(assert (=> b!735183 m!687667))

(declare-fun m!687669 () Bool)

(assert (=> b!735177 m!687669))

(assert (=> b!735179 m!687623))

(assert (=> b!735179 m!687623))

(assert (=> b!735179 m!687633))

(assert (=> b!735182 m!687623))

(assert (=> b!735182 m!687623))

(assert (=> b!735182 m!687647))

(declare-fun m!687671 () Bool)

(assert (=> b!735186 m!687671))

(push 1)

