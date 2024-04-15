; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65552 () Bool)

(assert start!65552)

(declare-fun b!749003 () Bool)

(declare-fun e!417945 () Bool)

(declare-fun e!417952 () Bool)

(assert (=> b!749003 (= e!417945 e!417952)))

(declare-fun res!505421 () Bool)

(assert (=> b!749003 (=> (not res!505421) (not e!417952))))

(declare-datatypes ((SeekEntryResult!7582 0))(
  ( (MissingZero!7582 (index!32696 (_ BitVec 32))) (Found!7582 (index!32697 (_ BitVec 32))) (Intermediate!7582 (undefined!8394 Bool) (index!32698 (_ BitVec 32)) (x!63639 (_ BitVec 32))) (Undefined!7582) (MissingVacant!7582 (index!32699 (_ BitVec 32))) )
))
(declare-fun lt!332857 () SeekEntryResult!7582)

(declare-fun lt!332856 () SeekEntryResult!7582)

(assert (=> b!749003 (= res!505421 (= lt!332857 lt!332856))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!332851 () (_ BitVec 64))

(declare-datatypes ((array!41742 0))(
  ( (array!41743 (arr!19985 (Array (_ BitVec 32) (_ BitVec 64))) (size!20406 (_ BitVec 32))) )
))
(declare-fun lt!332854 () array!41742)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41742 (_ BitVec 32)) SeekEntryResult!7582)

(assert (=> b!749003 (= lt!332856 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332851 lt!332854 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749003 (= lt!332857 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332851 mask!3328) lt!332851 lt!332854 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun a!3186 () array!41742)

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!749003 (= lt!332851 (select (store (arr!19985 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749003 (= lt!332854 (array!41743 (store (arr!19985 a!3186) i!1173 k0!2102) (size!20406 a!3186)))))

(declare-fun b!749004 () Bool)

(declare-fun res!505431 () Bool)

(declare-fun e!417946 () Bool)

(assert (=> b!749004 (=> (not res!505431) (not e!417946))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41742 (_ BitVec 32)) Bool)

(assert (=> b!749004 (= res!505431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749005 () Bool)

(declare-fun res!505419 () Bool)

(declare-fun e!417951 () Bool)

(assert (=> b!749005 (=> (not res!505419) (not e!417951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749005 (= res!505419 (validKeyInArray!0 (select (arr!19985 a!3186) j!159)))))

(declare-fun b!749006 () Bool)

(assert (=> b!749006 (= e!417951 e!417946)))

(declare-fun res!505423 () Bool)

(assert (=> b!749006 (=> (not res!505423) (not e!417946))))

(declare-fun lt!332858 () SeekEntryResult!7582)

(assert (=> b!749006 (= res!505423 (or (= lt!332858 (MissingZero!7582 i!1173)) (= lt!332858 (MissingVacant!7582 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41742 (_ BitVec 32)) SeekEntryResult!7582)

(assert (=> b!749006 (= lt!332858 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749007 () Bool)

(declare-fun res!505427 () Bool)

(declare-fun e!417942 () Bool)

(assert (=> b!749007 (=> res!505427 e!417942)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!332850 () SeekEntryResult!7582)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41742 (_ BitVec 32)) SeekEntryResult!7582)

(assert (=> b!749007 (= res!505427 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19985 a!3186) j!159) a!3186 mask!3328) lt!332850)))))

(declare-fun b!749008 () Bool)

(assert (=> b!749008 (= e!417946 e!417945)))

(declare-fun res!505429 () Bool)

(assert (=> b!749008 (=> (not res!505429) (not e!417945))))

(declare-fun lt!332848 () SeekEntryResult!7582)

(assert (=> b!749008 (= res!505429 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19985 a!3186) j!159) mask!3328) (select (arr!19985 a!3186) j!159) a!3186 mask!3328) lt!332848))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749008 (= lt!332848 (Intermediate!7582 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!417947 () Bool)

(declare-fun b!749009 () Bool)

(assert (=> b!749009 (= e!417947 (= (seekEntryOrOpen!0 lt!332851 lt!332854 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!332851 lt!332854 mask!3328)))))

(declare-fun e!417950 () Bool)

(declare-fun b!749010 () Bool)

(assert (=> b!749010 (= e!417950 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19985 a!3186) j!159) a!3186 mask!3328) lt!332848))))

(declare-fun b!749011 () Bool)

(declare-fun res!505420 () Bool)

(assert (=> b!749011 (=> (not res!505420) (not e!417951))))

(assert (=> b!749011 (= res!505420 (and (= (size!20406 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20406 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20406 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749012 () Bool)

(declare-fun e!417948 () Bool)

(assert (=> b!749012 (= e!417948 true)))

(assert (=> b!749012 e!417947))

(declare-fun res!505422 () Bool)

(assert (=> b!749012 (=> (not res!505422) (not e!417947))))

(declare-fun lt!332855 () (_ BitVec 64))

(assert (=> b!749012 (= res!505422 (= lt!332855 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25688 0))(
  ( (Unit!25689) )
))
(declare-fun lt!332852 () Unit!25688)

(declare-fun e!417943 () Unit!25688)

(assert (=> b!749012 (= lt!332852 e!417943)))

(declare-fun c!82175 () Bool)

(assert (=> b!749012 (= c!82175 (= lt!332855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749013 () Bool)

(declare-fun res!505416 () Bool)

(assert (=> b!749013 (=> (not res!505416) (not e!417945))))

(assert (=> b!749013 (= res!505416 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19985 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!417944 () Bool)

(declare-fun b!749014 () Bool)

(assert (=> b!749014 (= e!417944 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19985 a!3186) j!159) a!3186 mask!3328) lt!332850))))

(declare-fun b!749015 () Bool)

(declare-fun Unit!25690 () Unit!25688)

(assert (=> b!749015 (= e!417943 Unit!25690)))

(assert (=> b!749015 false))

(declare-fun b!749016 () Bool)

(declare-fun res!505425 () Bool)

(assert (=> b!749016 (=> (not res!505425) (not e!417946))))

(declare-datatypes ((List!14026 0))(
  ( (Nil!14023) (Cons!14022 (h!15094 (_ BitVec 64)) (t!20332 List!14026)) )
))
(declare-fun arrayNoDuplicates!0 (array!41742 (_ BitVec 32) List!14026) Bool)

(assert (=> b!749016 (= res!505425 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14023))))

(declare-fun b!749017 () Bool)

(declare-fun res!505418 () Bool)

(assert (=> b!749017 (=> (not res!505418) (not e!417945))))

(assert (=> b!749017 (= res!505418 e!417950)))

(declare-fun c!82176 () Bool)

(assert (=> b!749017 (= c!82176 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749018 () Bool)

(assert (=> b!749018 (= e!417942 e!417948)))

(declare-fun res!505417 () Bool)

(assert (=> b!749018 (=> res!505417 e!417948)))

(assert (=> b!749018 (= res!505417 (= lt!332855 lt!332851))))

(assert (=> b!749018 (= lt!332855 (select (store (arr!19985 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!749019 () Bool)

(declare-fun res!505424 () Bool)

(assert (=> b!749019 (=> (not res!505424) (not e!417951))))

(assert (=> b!749019 (= res!505424 (validKeyInArray!0 k0!2102))))

(declare-fun b!749020 () Bool)

(declare-fun res!505415 () Bool)

(assert (=> b!749020 (=> (not res!505415) (not e!417946))))

(assert (=> b!749020 (= res!505415 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20406 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20406 a!3186))))))

(declare-fun b!749021 () Bool)

(assert (=> b!749021 (= e!417950 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19985 a!3186) j!159) a!3186 mask!3328) (Found!7582 j!159)))))

(declare-fun b!749022 () Bool)

(declare-fun Unit!25691 () Unit!25688)

(assert (=> b!749022 (= e!417943 Unit!25691)))

(declare-fun res!505428 () Bool)

(assert (=> start!65552 (=> (not res!505428) (not e!417951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65552 (= res!505428 (validMask!0 mask!3328))))

(assert (=> start!65552 e!417951))

(assert (=> start!65552 true))

(declare-fun array_inv!15868 (array!41742) Bool)

(assert (=> start!65552 (array_inv!15868 a!3186)))

(declare-fun b!749023 () Bool)

(declare-fun res!505426 () Bool)

(assert (=> b!749023 (=> (not res!505426) (not e!417951))))

(declare-fun arrayContainsKey!0 (array!41742 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749023 (= res!505426 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749024 () Bool)

(assert (=> b!749024 (= e!417952 (not e!417942))))

(declare-fun res!505414 () Bool)

(assert (=> b!749024 (=> res!505414 e!417942)))

(get-info :version)

(assert (=> b!749024 (= res!505414 (or (not ((_ is Intermediate!7582) lt!332856)) (bvslt x!1131 (x!63639 lt!332856)) (not (= x!1131 (x!63639 lt!332856))) (not (= index!1321 (index!32698 lt!332856)))))))

(assert (=> b!749024 e!417944))

(declare-fun res!505430 () Bool)

(assert (=> b!749024 (=> (not res!505430) (not e!417944))))

(declare-fun lt!332853 () SeekEntryResult!7582)

(assert (=> b!749024 (= res!505430 (= lt!332853 lt!332850))))

(assert (=> b!749024 (= lt!332850 (Found!7582 j!159))))

(assert (=> b!749024 (= lt!332853 (seekEntryOrOpen!0 (select (arr!19985 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!749024 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332849 () Unit!25688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25688)

(assert (=> b!749024 (= lt!332849 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65552 res!505428) b!749011))

(assert (= (and b!749011 res!505420) b!749005))

(assert (= (and b!749005 res!505419) b!749019))

(assert (= (and b!749019 res!505424) b!749023))

(assert (= (and b!749023 res!505426) b!749006))

(assert (= (and b!749006 res!505423) b!749004))

(assert (= (and b!749004 res!505431) b!749016))

(assert (= (and b!749016 res!505425) b!749020))

(assert (= (and b!749020 res!505415) b!749008))

(assert (= (and b!749008 res!505429) b!749013))

(assert (= (and b!749013 res!505416) b!749017))

(assert (= (and b!749017 c!82176) b!749010))

(assert (= (and b!749017 (not c!82176)) b!749021))

(assert (= (and b!749017 res!505418) b!749003))

(assert (= (and b!749003 res!505421) b!749024))

(assert (= (and b!749024 res!505430) b!749014))

(assert (= (and b!749024 (not res!505414)) b!749007))

(assert (= (and b!749007 (not res!505427)) b!749018))

(assert (= (and b!749018 (not res!505417)) b!749012))

(assert (= (and b!749012 c!82175) b!749015))

(assert (= (and b!749012 (not c!82175)) b!749022))

(assert (= (and b!749012 res!505422) b!749009))

(declare-fun m!698141 () Bool)

(assert (=> b!749007 m!698141))

(assert (=> b!749007 m!698141))

(declare-fun m!698143 () Bool)

(assert (=> b!749007 m!698143))

(declare-fun m!698145 () Bool)

(assert (=> start!65552 m!698145))

(declare-fun m!698147 () Bool)

(assert (=> start!65552 m!698147))

(declare-fun m!698149 () Bool)

(assert (=> b!749016 m!698149))

(declare-fun m!698151 () Bool)

(assert (=> b!749018 m!698151))

(declare-fun m!698153 () Bool)

(assert (=> b!749018 m!698153))

(assert (=> b!749024 m!698141))

(assert (=> b!749024 m!698141))

(declare-fun m!698155 () Bool)

(assert (=> b!749024 m!698155))

(declare-fun m!698157 () Bool)

(assert (=> b!749024 m!698157))

(declare-fun m!698159 () Bool)

(assert (=> b!749024 m!698159))

(declare-fun m!698161 () Bool)

(assert (=> b!749009 m!698161))

(declare-fun m!698163 () Bool)

(assert (=> b!749009 m!698163))

(assert (=> b!749010 m!698141))

(assert (=> b!749010 m!698141))

(declare-fun m!698165 () Bool)

(assert (=> b!749010 m!698165))

(assert (=> b!749021 m!698141))

(assert (=> b!749021 m!698141))

(assert (=> b!749021 m!698143))

(declare-fun m!698167 () Bool)

(assert (=> b!749023 m!698167))

(declare-fun m!698169 () Bool)

(assert (=> b!749006 m!698169))

(assert (=> b!749014 m!698141))

(assert (=> b!749014 m!698141))

(declare-fun m!698171 () Bool)

(assert (=> b!749014 m!698171))

(assert (=> b!749005 m!698141))

(assert (=> b!749005 m!698141))

(declare-fun m!698173 () Bool)

(assert (=> b!749005 m!698173))

(declare-fun m!698175 () Bool)

(assert (=> b!749004 m!698175))

(declare-fun m!698177 () Bool)

(assert (=> b!749019 m!698177))

(declare-fun m!698179 () Bool)

(assert (=> b!749003 m!698179))

(declare-fun m!698181 () Bool)

(assert (=> b!749003 m!698181))

(declare-fun m!698183 () Bool)

(assert (=> b!749003 m!698183))

(assert (=> b!749003 m!698151))

(assert (=> b!749003 m!698181))

(declare-fun m!698185 () Bool)

(assert (=> b!749003 m!698185))

(declare-fun m!698187 () Bool)

(assert (=> b!749013 m!698187))

(assert (=> b!749008 m!698141))

(assert (=> b!749008 m!698141))

(declare-fun m!698189 () Bool)

(assert (=> b!749008 m!698189))

(assert (=> b!749008 m!698189))

(assert (=> b!749008 m!698141))

(declare-fun m!698191 () Bool)

(assert (=> b!749008 m!698191))

(check-sat (not b!749003) (not b!749006) (not b!749005) (not b!749009) (not start!65552) (not b!749024) (not b!749016) (not b!749007) (not b!749008) (not b!749019) (not b!749021) (not b!749004) (not b!749023) (not b!749014) (not b!749010))
(check-sat)
