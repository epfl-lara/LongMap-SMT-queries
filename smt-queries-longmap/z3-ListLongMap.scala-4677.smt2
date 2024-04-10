; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65124 () Bool)

(assert start!65124)

(declare-datatypes ((array!41297 0))(
  ( (array!41298 (arr!19762 (Array (_ BitVec 32) (_ BitVec 64))) (size!20183 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41297)

(declare-datatypes ((SeekEntryResult!7362 0))(
  ( (MissingZero!7362 (index!31816 (_ BitVec 32))) (Found!7362 (index!31817 (_ BitVec 32))) (Intermediate!7362 (undefined!8174 Bool) (index!31818 (_ BitVec 32)) (x!62824 (_ BitVec 32))) (Undefined!7362) (MissingVacant!7362 (index!31819 (_ BitVec 32))) )
))
(declare-fun lt!325902 () SeekEntryResult!7362)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!735244 () Bool)

(declare-fun e!411384 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41297 (_ BitVec 32)) SeekEntryResult!7362)

(assert (=> b!735244 (= e!411384 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!325902))))

(declare-fun b!735245 () Bool)

(declare-fun e!411385 () Bool)

(declare-fun e!411379 () Bool)

(assert (=> b!735245 (= e!411385 e!411379)))

(declare-fun res!494032 () Bool)

(assert (=> b!735245 (=> (not res!494032) (not e!411379))))

(declare-fun lt!325910 () SeekEntryResult!7362)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41297 (_ BitVec 32)) SeekEntryResult!7362)

(assert (=> b!735245 (= res!494032 (= (seekEntryOrOpen!0 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!325910))))

(assert (=> b!735245 (= lt!325910 (Found!7362 j!159))))

(declare-fun b!735246 () Bool)

(declare-fun e!411377 () Bool)

(declare-fun e!411378 () Bool)

(assert (=> b!735246 (= e!411377 e!411378)))

(declare-fun res!494041 () Bool)

(assert (=> b!735246 (=> (not res!494041) (not e!411378))))

(declare-fun lt!325905 () SeekEntryResult!7362)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735246 (= res!494041 (or (= lt!325905 (MissingZero!7362 i!1173)) (= lt!325905 (MissingVacant!7362 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!735246 (= lt!325905 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735247 () Bool)

(declare-datatypes ((Unit!25044 0))(
  ( (Unit!25045) )
))
(declare-fun e!411382 () Unit!25044)

(declare-fun Unit!25046 () Unit!25044)

(assert (=> b!735247 (= e!411382 Unit!25046)))

(declare-fun lt!325901 () (_ BitVec 32))

(assert (=> b!735247 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325901 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!325902)))

(declare-fun b!735248 () Bool)

(declare-fun e!411383 () Bool)

(declare-fun e!411376 () Bool)

(assert (=> b!735248 (= e!411383 (not e!411376))))

(declare-fun res!494031 () Bool)

(assert (=> b!735248 (=> res!494031 e!411376)))

(declare-fun lt!325908 () SeekEntryResult!7362)

(get-info :version)

(assert (=> b!735248 (= res!494031 (or (not ((_ is Intermediate!7362) lt!325908)) (bvsge x!1131 (x!62824 lt!325908))))))

(declare-fun lt!325903 () SeekEntryResult!7362)

(assert (=> b!735248 (= lt!325903 (Found!7362 j!159))))

(assert (=> b!735248 e!411385))

(declare-fun res!494039 () Bool)

(assert (=> b!735248 (=> (not res!494039) (not e!411385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41297 (_ BitVec 32)) Bool)

(assert (=> b!735248 (= res!494039 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!325904 () Unit!25044)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25044)

(assert (=> b!735248 (= lt!325904 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!735250 () Bool)

(declare-fun e!411380 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41297 (_ BitVec 32)) SeekEntryResult!7362)

(assert (=> b!735250 (= e!411380 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325901 resIntermediateIndex!5 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!325903)))))

(declare-fun b!735251 () Bool)

(declare-fun e!411381 () Bool)

(assert (=> b!735251 (= e!411378 e!411381)))

(declare-fun res!494046 () Bool)

(assert (=> b!735251 (=> (not res!494046) (not e!411381))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735251 (= res!494046 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19762 a!3186) j!159) mask!3328) (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!325902))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735251 (= lt!325902 (Intermediate!7362 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735252 () Bool)

(assert (=> b!735252 (= e!411381 e!411383)))

(declare-fun res!494034 () Bool)

(assert (=> b!735252 (=> (not res!494034) (not e!411383))))

(declare-fun lt!325912 () SeekEntryResult!7362)

(assert (=> b!735252 (= res!494034 (= lt!325912 lt!325908))))

(declare-fun lt!325909 () array!41297)

(declare-fun lt!325906 () (_ BitVec 64))

(assert (=> b!735252 (= lt!325908 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325906 lt!325909 mask!3328))))

(assert (=> b!735252 (= lt!325912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325906 mask!3328) lt!325906 lt!325909 mask!3328))))

(assert (=> b!735252 (= lt!325906 (select (store (arr!19762 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735252 (= lt!325909 (array!41298 (store (arr!19762 a!3186) i!1173 k0!2102) (size!20183 a!3186)))))

(declare-fun b!735253 () Bool)

(declare-fun Unit!25047 () Unit!25044)

(assert (=> b!735253 (= e!411382 Unit!25047)))

(declare-fun lt!325911 () SeekEntryResult!7362)

(assert (=> b!735253 (= lt!325911 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19762 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735253 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325901 resIntermediateIndex!5 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!325903)))

(declare-fun b!735254 () Bool)

(declare-fun e!411386 () Bool)

(assert (=> b!735254 (= e!411376 e!411386)))

(declare-fun res!494043 () Bool)

(assert (=> b!735254 (=> res!494043 e!411386)))

(assert (=> b!735254 (= res!494043 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!325901 #b00000000000000000000000000000000) (bvsge lt!325901 (size!20183 a!3186))))))

(declare-fun lt!325900 () Unit!25044)

(assert (=> b!735254 (= lt!325900 e!411382)))

(declare-fun c!80988 () Bool)

(declare-fun lt!325913 () Bool)

(assert (=> b!735254 (= c!80988 lt!325913)))

(assert (=> b!735254 (= lt!325913 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735254 (= lt!325901 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735255 () Bool)

(declare-fun res!494033 () Bool)

(assert (=> b!735255 (=> (not res!494033) (not e!411378))))

(declare-datatypes ((List!13764 0))(
  ( (Nil!13761) (Cons!13760 (h!14832 (_ BitVec 64)) (t!20079 List!13764)) )
))
(declare-fun arrayNoDuplicates!0 (array!41297 (_ BitVec 32) List!13764) Bool)

(assert (=> b!735255 (= res!494033 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13761))))

(declare-fun b!735256 () Bool)

(declare-fun res!494047 () Bool)

(assert (=> b!735256 (=> (not res!494047) (not e!411378))))

(assert (=> b!735256 (= res!494047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735257 () Bool)

(declare-fun res!494036 () Bool)

(assert (=> b!735257 (=> (not res!494036) (not e!411381))))

(assert (=> b!735257 (= res!494036 e!411384)))

(declare-fun c!80989 () Bool)

(assert (=> b!735257 (= c!80989 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735258 () Bool)

(declare-fun res!494038 () Bool)

(assert (=> b!735258 (=> (not res!494038) (not e!411377))))

(declare-fun arrayContainsKey!0 (array!41297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735258 (= res!494038 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735259 () Bool)

(declare-fun res!494045 () Bool)

(assert (=> b!735259 (=> (not res!494045) (not e!411377))))

(assert (=> b!735259 (= res!494045 (and (= (size!20183 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20183 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20183 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735260 () Bool)

(declare-fun res!494037 () Bool)

(assert (=> b!735260 (=> (not res!494037) (not e!411377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735260 (= res!494037 (validKeyInArray!0 k0!2102))))

(declare-fun b!735261 () Bool)

(declare-fun res!494048 () Bool)

(assert (=> b!735261 (=> (not res!494048) (not e!411378))))

(assert (=> b!735261 (= res!494048 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20183 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20183 a!3186))))))

(declare-fun b!735262 () Bool)

(declare-fun res!494040 () Bool)

(assert (=> b!735262 (=> (not res!494040) (not e!411381))))

(assert (=> b!735262 (= res!494040 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19762 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735263 () Bool)

(declare-fun res!494042 () Bool)

(assert (=> b!735263 (=> res!494042 e!411386)))

(assert (=> b!735263 (= res!494042 e!411380)))

(declare-fun c!80987 () Bool)

(assert (=> b!735263 (= c!80987 lt!325913)))

(declare-fun b!735264 () Bool)

(assert (=> b!735264 (= e!411386 true)))

(declare-fun lt!325907 () SeekEntryResult!7362)

(assert (=> b!735264 (= lt!325907 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325901 lt!325906 lt!325909 mask!3328))))

(declare-fun b!735265 () Bool)

(assert (=> b!735265 (= e!411379 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!325910))))

(declare-fun res!494044 () Bool)

(assert (=> start!65124 (=> (not res!494044) (not e!411377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65124 (= res!494044 (validMask!0 mask!3328))))

(assert (=> start!65124 e!411377))

(assert (=> start!65124 true))

(declare-fun array_inv!15558 (array!41297) Bool)

(assert (=> start!65124 (array_inv!15558 a!3186)))

(declare-fun b!735249 () Bool)

(declare-fun res!494035 () Bool)

(assert (=> b!735249 (=> (not res!494035) (not e!411377))))

(assert (=> b!735249 (= res!494035 (validKeyInArray!0 (select (arr!19762 a!3186) j!159)))))

(declare-fun b!735266 () Bool)

(assert (=> b!735266 (= e!411384 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) (Found!7362 j!159)))))

(declare-fun b!735267 () Bool)

(assert (=> b!735267 (= e!411380 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!325901 (select (arr!19762 a!3186) j!159) a!3186 mask!3328) lt!325902)))))

(assert (= (and start!65124 res!494044) b!735259))

(assert (= (and b!735259 res!494045) b!735249))

(assert (= (and b!735249 res!494035) b!735260))

(assert (= (and b!735260 res!494037) b!735258))

(assert (= (and b!735258 res!494038) b!735246))

(assert (= (and b!735246 res!494041) b!735256))

(assert (= (and b!735256 res!494047) b!735255))

(assert (= (and b!735255 res!494033) b!735261))

(assert (= (and b!735261 res!494048) b!735251))

(assert (= (and b!735251 res!494046) b!735262))

(assert (= (and b!735262 res!494040) b!735257))

(assert (= (and b!735257 c!80989) b!735244))

(assert (= (and b!735257 (not c!80989)) b!735266))

(assert (= (and b!735257 res!494036) b!735252))

(assert (= (and b!735252 res!494034) b!735248))

(assert (= (and b!735248 res!494039) b!735245))

(assert (= (and b!735245 res!494032) b!735265))

(assert (= (and b!735248 (not res!494031)) b!735254))

(assert (= (and b!735254 c!80988) b!735247))

(assert (= (and b!735254 (not c!80988)) b!735253))

(assert (= (and b!735254 (not res!494043)) b!735263))

(assert (= (and b!735263 c!80987) b!735267))

(assert (= (and b!735263 (not c!80987)) b!735250))

(assert (= (and b!735263 (not res!494042)) b!735264))

(declare-fun m!687673 () Bool)

(assert (=> b!735266 m!687673))

(assert (=> b!735266 m!687673))

(declare-fun m!687675 () Bool)

(assert (=> b!735266 m!687675))

(declare-fun m!687677 () Bool)

(assert (=> b!735256 m!687677))

(assert (=> b!735249 m!687673))

(assert (=> b!735249 m!687673))

(declare-fun m!687679 () Bool)

(assert (=> b!735249 m!687679))

(assert (=> b!735245 m!687673))

(assert (=> b!735245 m!687673))

(declare-fun m!687681 () Bool)

(assert (=> b!735245 m!687681))

(declare-fun m!687683 () Bool)

(assert (=> b!735254 m!687683))

(assert (=> b!735253 m!687673))

(assert (=> b!735253 m!687673))

(assert (=> b!735253 m!687675))

(assert (=> b!735253 m!687673))

(declare-fun m!687685 () Bool)

(assert (=> b!735253 m!687685))

(assert (=> b!735251 m!687673))

(assert (=> b!735251 m!687673))

(declare-fun m!687687 () Bool)

(assert (=> b!735251 m!687687))

(assert (=> b!735251 m!687687))

(assert (=> b!735251 m!687673))

(declare-fun m!687689 () Bool)

(assert (=> b!735251 m!687689))

(assert (=> b!735265 m!687673))

(assert (=> b!735265 m!687673))

(declare-fun m!687691 () Bool)

(assert (=> b!735265 m!687691))

(declare-fun m!687693 () Bool)

(assert (=> b!735262 m!687693))

(declare-fun m!687695 () Bool)

(assert (=> b!735246 m!687695))

(declare-fun m!687697 () Bool)

(assert (=> start!65124 m!687697))

(declare-fun m!687699 () Bool)

(assert (=> start!65124 m!687699))

(assert (=> b!735250 m!687673))

(assert (=> b!735250 m!687673))

(assert (=> b!735250 m!687685))

(declare-fun m!687701 () Bool)

(assert (=> b!735260 m!687701))

(assert (=> b!735244 m!687673))

(assert (=> b!735244 m!687673))

(declare-fun m!687703 () Bool)

(assert (=> b!735244 m!687703))

(declare-fun m!687705 () Bool)

(assert (=> b!735248 m!687705))

(declare-fun m!687707 () Bool)

(assert (=> b!735248 m!687707))

(declare-fun m!687709 () Bool)

(assert (=> b!735252 m!687709))

(declare-fun m!687711 () Bool)

(assert (=> b!735252 m!687711))

(assert (=> b!735252 m!687709))

(declare-fun m!687713 () Bool)

(assert (=> b!735252 m!687713))

(declare-fun m!687715 () Bool)

(assert (=> b!735252 m!687715))

(declare-fun m!687717 () Bool)

(assert (=> b!735252 m!687717))

(assert (=> b!735267 m!687673))

(assert (=> b!735267 m!687673))

(declare-fun m!687719 () Bool)

(assert (=> b!735267 m!687719))

(assert (=> b!735247 m!687673))

(assert (=> b!735247 m!687673))

(assert (=> b!735247 m!687719))

(declare-fun m!687721 () Bool)

(assert (=> b!735264 m!687721))

(declare-fun m!687723 () Bool)

(assert (=> b!735258 m!687723))

(declare-fun m!687725 () Bool)

(assert (=> b!735255 m!687725))

(check-sat (not b!735249) (not b!735266) (not start!65124) (not b!735265) (not b!735258) (not b!735260) (not b!735267) (not b!735248) (not b!735250) (not b!735253) (not b!735247) (not b!735246) (not b!735254) (not b!735255) (not b!735244) (not b!735251) (not b!735252) (not b!735256) (not b!735245) (not b!735264))
(check-sat)
