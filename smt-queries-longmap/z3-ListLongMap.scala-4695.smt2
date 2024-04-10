; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65232 () Bool)

(assert start!65232)

(declare-fun b!739132 () Bool)

(declare-fun res!496962 () Bool)

(declare-fun e!413321 () Bool)

(assert (=> b!739132 (=> (not res!496962) (not e!413321))))

(declare-datatypes ((array!41405 0))(
  ( (array!41406 (arr!19816 (Array (_ BitVec 32) (_ BitVec 64))) (size!20237 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41405)

(declare-datatypes ((List!13818 0))(
  ( (Nil!13815) (Cons!13814 (h!14886 (_ BitVec 64)) (t!20133 List!13818)) )
))
(declare-fun arrayNoDuplicates!0 (array!41405 (_ BitVec 32) List!13818) Bool)

(assert (=> b!739132 (= res!496962 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13815))))

(declare-fun e!413327 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7416 0))(
  ( (MissingZero!7416 (index!32032 (_ BitVec 32))) (Found!7416 (index!32033 (_ BitVec 32))) (Intermediate!7416 (undefined!8228 Bool) (index!32034 (_ BitVec 32)) (x!63022 (_ BitVec 32))) (Undefined!7416) (MissingVacant!7416 (index!32035 (_ BitVec 32))) )
))
(declare-fun lt!328170 () SeekEntryResult!7416)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!739133 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41405 (_ BitVec 32)) SeekEntryResult!7416)

(assert (=> b!739133 (= e!413327 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328170))))

(declare-fun b!739134 () Bool)

(declare-fun e!413324 () Bool)

(assert (=> b!739134 (= e!413321 e!413324)))

(declare-fun res!496960 () Bool)

(assert (=> b!739134 (=> (not res!496960) (not e!413324))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739134 (= res!496960 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19816 a!3186) j!159) mask!3328) (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328170))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739134 (= lt!328170 (Intermediate!7416 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739135 () Bool)

(declare-datatypes ((Unit!25260 0))(
  ( (Unit!25261) )
))
(declare-fun e!413330 () Unit!25260)

(declare-fun Unit!25262 () Unit!25260)

(assert (=> b!739135 (= e!413330 Unit!25262)))

(declare-fun lt!328174 () SeekEntryResult!7416)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41405 (_ BitVec 32)) SeekEntryResult!7416)

(assert (=> b!739135 (= lt!328174 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19816 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328177 () SeekEntryResult!7416)

(declare-fun lt!328176 () (_ BitVec 32))

(assert (=> b!739135 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328176 resIntermediateIndex!5 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328177)))

(declare-fun b!739136 () Bool)

(declare-fun res!496954 () Bool)

(declare-fun e!413319 () Bool)

(assert (=> b!739136 (=> res!496954 e!413319)))

(declare-fun e!413320 () Bool)

(assert (=> b!739136 (= res!496954 e!413320)))

(declare-fun c!81475 () Bool)

(declare-fun lt!328181 () Bool)

(assert (=> b!739136 (= c!81475 lt!328181)))

(declare-fun b!739137 () Bool)

(declare-fun res!496956 () Bool)

(assert (=> b!739137 (=> (not res!496956) (not e!413324))))

(assert (=> b!739137 (= res!496956 e!413327)))

(declare-fun c!81474 () Bool)

(assert (=> b!739137 (= c!81474 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739138 () Bool)

(assert (=> b!739138 (= e!413319 true)))

(declare-fun lt!328173 () SeekEntryResult!7416)

(declare-fun lt!328168 () array!41405)

(declare-fun lt!328178 () (_ BitVec 64))

(assert (=> b!739138 (= lt!328173 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328176 lt!328178 lt!328168 mask!3328))))

(declare-fun b!739139 () Bool)

(assert (=> b!739139 (= e!413327 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) (Found!7416 j!159)))))

(declare-fun b!739140 () Bool)

(assert (=> b!739140 (= e!413320 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328176 resIntermediateIndex!5 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328177)))))

(declare-fun b!739141 () Bool)

(declare-fun res!496958 () Bool)

(assert (=> b!739141 (=> (not res!496958) (not e!413321))))

(assert (=> b!739141 (= res!496958 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20237 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20237 a!3186))))))

(declare-fun b!739142 () Bool)

(declare-fun res!496963 () Bool)

(declare-fun e!413328 () Bool)

(assert (=> b!739142 (=> (not res!496963) (not e!413328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739142 (= res!496963 (and (= (size!20237 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20237 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20237 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739143 () Bool)

(assert (=> b!739143 (= e!413320 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328176 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328170)))))

(declare-fun b!739144 () Bool)

(declare-fun e!413322 () Bool)

(declare-fun e!413329 () Bool)

(assert (=> b!739144 (= e!413322 (not e!413329))))

(declare-fun res!496952 () Bool)

(assert (=> b!739144 (=> res!496952 e!413329)))

(declare-fun lt!328171 () SeekEntryResult!7416)

(get-info :version)

(assert (=> b!739144 (= res!496952 (or (not ((_ is Intermediate!7416) lt!328171)) (bvsge x!1131 (x!63022 lt!328171))))))

(assert (=> b!739144 (= lt!328177 (Found!7416 j!159))))

(declare-fun e!413323 () Bool)

(assert (=> b!739144 e!413323))

(declare-fun res!496964 () Bool)

(assert (=> b!739144 (=> (not res!496964) (not e!413323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41405 (_ BitVec 32)) Bool)

(assert (=> b!739144 (= res!496964 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328180 () Unit!25260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25260)

(assert (=> b!739144 (= lt!328180 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739145 () Bool)

(declare-fun res!496955 () Bool)

(assert (=> b!739145 (=> (not res!496955) (not e!413328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739145 (= res!496955 (validKeyInArray!0 (select (arr!19816 a!3186) j!159)))))

(declare-fun b!739146 () Bool)

(declare-fun res!496959 () Bool)

(assert (=> b!739146 (=> (not res!496959) (not e!413328))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739146 (= res!496959 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!328169 () SeekEntryResult!7416)

(declare-fun b!739147 () Bool)

(declare-fun e!413326 () Bool)

(assert (=> b!739147 (= e!413326 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328169))))

(declare-fun b!739148 () Bool)

(declare-fun res!496949 () Bool)

(assert (=> b!739148 (=> (not res!496949) (not e!413321))))

(assert (=> b!739148 (= res!496949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739149 () Bool)

(assert (=> b!739149 (= e!413329 e!413319)))

(declare-fun res!496950 () Bool)

(assert (=> b!739149 (=> res!496950 e!413319)))

(assert (=> b!739149 (= res!496950 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328176 #b00000000000000000000000000000000) (bvsge lt!328176 (size!20237 a!3186))))))

(declare-fun lt!328172 () Unit!25260)

(assert (=> b!739149 (= lt!328172 e!413330)))

(declare-fun c!81473 () Bool)

(assert (=> b!739149 (= c!81473 lt!328181)))

(assert (=> b!739149 (= lt!328181 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739149 (= lt!328176 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739150 () Bool)

(assert (=> b!739150 (= e!413328 e!413321)))

(declare-fun res!496953 () Bool)

(assert (=> b!739150 (=> (not res!496953) (not e!413321))))

(declare-fun lt!328175 () SeekEntryResult!7416)

(assert (=> b!739150 (= res!496953 (or (= lt!328175 (MissingZero!7416 i!1173)) (= lt!328175 (MissingVacant!7416 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41405 (_ BitVec 32)) SeekEntryResult!7416)

(assert (=> b!739150 (= lt!328175 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739151 () Bool)

(declare-fun res!496961 () Bool)

(assert (=> b!739151 (=> (not res!496961) (not e!413328))))

(assert (=> b!739151 (= res!496961 (validKeyInArray!0 k0!2102))))

(declare-fun b!739152 () Bool)

(declare-fun res!496947 () Bool)

(assert (=> b!739152 (=> (not res!496947) (not e!413324))))

(assert (=> b!739152 (= res!496947 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19816 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739153 () Bool)

(assert (=> b!739153 (= e!413324 e!413322)))

(declare-fun res!496951 () Bool)

(assert (=> b!739153 (=> (not res!496951) (not e!413322))))

(declare-fun lt!328179 () SeekEntryResult!7416)

(assert (=> b!739153 (= res!496951 (= lt!328179 lt!328171))))

(assert (=> b!739153 (= lt!328171 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328178 lt!328168 mask!3328))))

(assert (=> b!739153 (= lt!328179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328178 mask!3328) lt!328178 lt!328168 mask!3328))))

(assert (=> b!739153 (= lt!328178 (select (store (arr!19816 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739153 (= lt!328168 (array!41406 (store (arr!19816 a!3186) i!1173 k0!2102) (size!20237 a!3186)))))

(declare-fun res!496948 () Bool)

(assert (=> start!65232 (=> (not res!496948) (not e!413328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65232 (= res!496948 (validMask!0 mask!3328))))

(assert (=> start!65232 e!413328))

(assert (=> start!65232 true))

(declare-fun array_inv!15612 (array!41405) Bool)

(assert (=> start!65232 (array_inv!15612 a!3186)))

(declare-fun b!739154 () Bool)

(assert (=> b!739154 (= e!413323 e!413326)))

(declare-fun res!496957 () Bool)

(assert (=> b!739154 (=> (not res!496957) (not e!413326))))

(assert (=> b!739154 (= res!496957 (= (seekEntryOrOpen!0 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328169))))

(assert (=> b!739154 (= lt!328169 (Found!7416 j!159))))

(declare-fun b!739155 () Bool)

(declare-fun Unit!25263 () Unit!25260)

(assert (=> b!739155 (= e!413330 Unit!25263)))

(assert (=> b!739155 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328176 (select (arr!19816 a!3186) j!159) a!3186 mask!3328) lt!328170)))

(assert (= (and start!65232 res!496948) b!739142))

(assert (= (and b!739142 res!496963) b!739145))

(assert (= (and b!739145 res!496955) b!739151))

(assert (= (and b!739151 res!496961) b!739146))

(assert (= (and b!739146 res!496959) b!739150))

(assert (= (and b!739150 res!496953) b!739148))

(assert (= (and b!739148 res!496949) b!739132))

(assert (= (and b!739132 res!496962) b!739141))

(assert (= (and b!739141 res!496958) b!739134))

(assert (= (and b!739134 res!496960) b!739152))

(assert (= (and b!739152 res!496947) b!739137))

(assert (= (and b!739137 c!81474) b!739133))

(assert (= (and b!739137 (not c!81474)) b!739139))

(assert (= (and b!739137 res!496956) b!739153))

(assert (= (and b!739153 res!496951) b!739144))

(assert (= (and b!739144 res!496964) b!739154))

(assert (= (and b!739154 res!496957) b!739147))

(assert (= (and b!739144 (not res!496952)) b!739149))

(assert (= (and b!739149 c!81473) b!739155))

(assert (= (and b!739149 (not c!81473)) b!739135))

(assert (= (and b!739149 (not res!496950)) b!739136))

(assert (= (and b!739136 c!81475) b!739143))

(assert (= (and b!739136 (not c!81475)) b!739140))

(assert (= (and b!739136 (not res!496954)) b!739138))

(declare-fun m!690589 () Bool)

(assert (=> b!739148 m!690589))

(declare-fun m!690591 () Bool)

(assert (=> b!739153 m!690591))

(declare-fun m!690593 () Bool)

(assert (=> b!739153 m!690593))

(declare-fun m!690595 () Bool)

(assert (=> b!739153 m!690595))

(declare-fun m!690597 () Bool)

(assert (=> b!739153 m!690597))

(assert (=> b!739153 m!690591))

(declare-fun m!690599 () Bool)

(assert (=> b!739153 m!690599))

(declare-fun m!690601 () Bool)

(assert (=> b!739146 m!690601))

(declare-fun m!690603 () Bool)

(assert (=> b!739139 m!690603))

(assert (=> b!739139 m!690603))

(declare-fun m!690605 () Bool)

(assert (=> b!739139 m!690605))

(assert (=> b!739154 m!690603))

(assert (=> b!739154 m!690603))

(declare-fun m!690607 () Bool)

(assert (=> b!739154 m!690607))

(assert (=> b!739133 m!690603))

(assert (=> b!739133 m!690603))

(declare-fun m!690609 () Bool)

(assert (=> b!739133 m!690609))

(declare-fun m!690611 () Bool)

(assert (=> b!739151 m!690611))

(declare-fun m!690613 () Bool)

(assert (=> b!739144 m!690613))

(declare-fun m!690615 () Bool)

(assert (=> b!739144 m!690615))

(declare-fun m!690617 () Bool)

(assert (=> b!739150 m!690617))

(assert (=> b!739143 m!690603))

(assert (=> b!739143 m!690603))

(declare-fun m!690619 () Bool)

(assert (=> b!739143 m!690619))

(assert (=> b!739134 m!690603))

(assert (=> b!739134 m!690603))

(declare-fun m!690621 () Bool)

(assert (=> b!739134 m!690621))

(assert (=> b!739134 m!690621))

(assert (=> b!739134 m!690603))

(declare-fun m!690623 () Bool)

(assert (=> b!739134 m!690623))

(declare-fun m!690625 () Bool)

(assert (=> b!739149 m!690625))

(declare-fun m!690627 () Bool)

(assert (=> b!739132 m!690627))

(assert (=> b!739135 m!690603))

(assert (=> b!739135 m!690603))

(assert (=> b!739135 m!690605))

(assert (=> b!739135 m!690603))

(declare-fun m!690629 () Bool)

(assert (=> b!739135 m!690629))

(declare-fun m!690631 () Bool)

(assert (=> b!739138 m!690631))

(assert (=> b!739147 m!690603))

(assert (=> b!739147 m!690603))

(declare-fun m!690633 () Bool)

(assert (=> b!739147 m!690633))

(declare-fun m!690635 () Bool)

(assert (=> b!739152 m!690635))

(assert (=> b!739140 m!690603))

(assert (=> b!739140 m!690603))

(assert (=> b!739140 m!690629))

(assert (=> b!739145 m!690603))

(assert (=> b!739145 m!690603))

(declare-fun m!690637 () Bool)

(assert (=> b!739145 m!690637))

(assert (=> b!739155 m!690603))

(assert (=> b!739155 m!690603))

(assert (=> b!739155 m!690619))

(declare-fun m!690639 () Bool)

(assert (=> start!65232 m!690639))

(declare-fun m!690641 () Bool)

(assert (=> start!65232 m!690641))

(check-sat (not b!739148) (not b!739139) (not b!739147) (not b!739154) (not b!739144) (not b!739132) (not b!739149) (not b!739138) (not b!739155) (not b!739151) (not b!739145) (not b!739143) (not b!739153) (not b!739150) (not b!739134) (not b!739146) (not b!739133) (not start!65232) (not b!739135) (not b!739140))
(check-sat)
