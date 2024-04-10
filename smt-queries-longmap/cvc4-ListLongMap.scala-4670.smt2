; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64940 () Bool)

(assert start!64940)

(declare-fun b!733217 () Bool)

(declare-fun res!492728 () Bool)

(declare-fun e!410263 () Bool)

(assert (=> b!733217 (=> (not res!492728) (not e!410263))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733217 (= res!492728 (validKeyInArray!0 k!2102))))

(declare-fun b!733218 () Bool)

(declare-fun e!410265 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!733218 (= e!410265 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-datatypes ((array!41251 0))(
  ( (array!41252 (arr!19742 (Array (_ BitVec 32) (_ BitVec 64))) (size!20163 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41251)

(declare-fun e!410262 () Bool)

(declare-fun b!733219 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7342 0))(
  ( (MissingZero!7342 (index!31736 (_ BitVec 32))) (Found!7342 (index!31737 (_ BitVec 32))) (Intermediate!7342 (undefined!8154 Bool) (index!31738 (_ BitVec 32)) (x!62724 (_ BitVec 32))) (Undefined!7342) (MissingVacant!7342 (index!31739 (_ BitVec 32))) )
))
(declare-fun lt!324960 () SeekEntryResult!7342)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41251 (_ BitVec 32)) SeekEntryResult!7342)

(assert (=> b!733219 (= e!410262 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19742 a!3186) j!159) a!3186 mask!3328) lt!324960))))

(declare-fun b!733220 () Bool)

(declare-fun res!492743 () Bool)

(declare-fun e!410264 () Bool)

(assert (=> b!733220 (=> (not res!492743) (not e!410264))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733220 (= res!492743 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20163 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20163 a!3186))))))

(declare-fun b!733221 () Bool)

(declare-fun e!410267 () Bool)

(declare-fun e!410269 () Bool)

(assert (=> b!733221 (= e!410267 (not e!410269))))

(declare-fun res!492734 () Bool)

(assert (=> b!733221 (=> res!492734 e!410269)))

(declare-fun lt!324965 () SeekEntryResult!7342)

(assert (=> b!733221 (= res!492734 (or (not (is-Intermediate!7342 lt!324965)) (bvsge x!1131 (x!62724 lt!324965))))))

(declare-fun e!410268 () Bool)

(assert (=> b!733221 e!410268))

(declare-fun res!492727 () Bool)

(assert (=> b!733221 (=> (not res!492727) (not e!410268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41251 (_ BitVec 32)) Bool)

(assert (=> b!733221 (= res!492727 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25002 0))(
  ( (Unit!25003) )
))
(declare-fun lt!324964 () Unit!25002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41251 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25002)

(assert (=> b!733221 (= lt!324964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733222 () Bool)

(declare-fun res!492739 () Bool)

(assert (=> b!733222 (=> (not res!492739) (not e!410263))))

(declare-fun arrayContainsKey!0 (array!41251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733222 (= res!492739 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733223 () Bool)

(declare-fun e!410270 () Bool)

(assert (=> b!733223 (= e!410270 e!410267)))

(declare-fun res!492737 () Bool)

(assert (=> b!733223 (=> (not res!492737) (not e!410267))))

(declare-fun lt!324966 () SeekEntryResult!7342)

(assert (=> b!733223 (= res!492737 (= lt!324966 lt!324965))))

(declare-fun lt!324961 () array!41251)

(declare-fun lt!324967 () (_ BitVec 64))

(assert (=> b!733223 (= lt!324965 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324967 lt!324961 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733223 (= lt!324966 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324967 mask!3328) lt!324967 lt!324961 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!733223 (= lt!324967 (select (store (arr!19742 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!733223 (= lt!324961 (array!41252 (store (arr!19742 a!3186) i!1173 k!2102) (size!20163 a!3186)))))

(declare-fun b!733224 () Bool)

(assert (=> b!733224 (= e!410263 e!410264)))

(declare-fun res!492740 () Bool)

(assert (=> b!733224 (=> (not res!492740) (not e!410264))))

(declare-fun lt!324963 () SeekEntryResult!7342)

(assert (=> b!733224 (= res!492740 (or (= lt!324963 (MissingZero!7342 i!1173)) (= lt!324963 (MissingVacant!7342 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41251 (_ BitVec 32)) SeekEntryResult!7342)

(assert (=> b!733224 (= lt!324963 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!733225 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41251 (_ BitVec 32)) SeekEntryResult!7342)

(assert (=> b!733225 (= e!410262 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19742 a!3186) j!159) a!3186 mask!3328) (Found!7342 j!159)))))

(declare-fun b!733226 () Bool)

(declare-fun res!492742 () Bool)

(assert (=> b!733226 (=> (not res!492742) (not e!410264))))

(assert (=> b!733226 (= res!492742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733227 () Bool)

(declare-fun res!492729 () Bool)

(assert (=> b!733227 (=> (not res!492729) (not e!410263))))

(assert (=> b!733227 (= res!492729 (validKeyInArray!0 (select (arr!19742 a!3186) j!159)))))

(declare-fun b!733228 () Bool)

(assert (=> b!733228 (= e!410269 e!410265)))

(declare-fun res!492731 () Bool)

(assert (=> b!733228 (=> res!492731 e!410265)))

(assert (=> b!733228 (= res!492731 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324962 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733228 (= lt!324962 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!733229 () Bool)

(declare-fun res!492726 () Bool)

(assert (=> b!733229 (=> res!492726 e!410265)))

(assert (=> b!733229 (= res!492726 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19742 a!3186) j!159) a!3186 mask!3328) (Found!7342 j!159)))))

(declare-fun b!733230 () Bool)

(assert (=> b!733230 (= e!410264 e!410270)))

(declare-fun res!492732 () Bool)

(assert (=> b!733230 (=> (not res!492732) (not e!410270))))

(assert (=> b!733230 (= res!492732 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19742 a!3186) j!159) mask!3328) (select (arr!19742 a!3186) j!159) a!3186 mask!3328) lt!324960))))

(assert (=> b!733230 (= lt!324960 (Intermediate!7342 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733231 () Bool)

(declare-fun res!492735 () Bool)

(assert (=> b!733231 (=> (not res!492735) (not e!410263))))

(assert (=> b!733231 (= res!492735 (and (= (size!20163 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20163 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20163 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733232 () Bool)

(declare-fun res!492738 () Bool)

(assert (=> b!733232 (=> (not res!492738) (not e!410270))))

(assert (=> b!733232 (= res!492738 e!410262)))

(declare-fun c!80623 () Bool)

(assert (=> b!733232 (= c!80623 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!733233 () Bool)

(declare-fun e!410266 () Bool)

(assert (=> b!733233 (= e!410268 e!410266)))

(declare-fun res!492730 () Bool)

(assert (=> b!733233 (=> (not res!492730) (not e!410266))))

(declare-fun lt!324968 () SeekEntryResult!7342)

(assert (=> b!733233 (= res!492730 (= (seekEntryOrOpen!0 (select (arr!19742 a!3186) j!159) a!3186 mask!3328) lt!324968))))

(assert (=> b!733233 (= lt!324968 (Found!7342 j!159))))

(declare-fun b!733234 () Bool)

(declare-fun res!492736 () Bool)

(assert (=> b!733234 (=> (not res!492736) (not e!410270))))

(assert (=> b!733234 (= res!492736 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19742 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!492733 () Bool)

(assert (=> start!64940 (=> (not res!492733) (not e!410263))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64940 (= res!492733 (validMask!0 mask!3328))))

(assert (=> start!64940 e!410263))

(assert (=> start!64940 true))

(declare-fun array_inv!15538 (array!41251) Bool)

(assert (=> start!64940 (array_inv!15538 a!3186)))

(declare-fun b!733235 () Bool)

(assert (=> b!733235 (= e!410266 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19742 a!3186) j!159) a!3186 mask!3328) lt!324968))))

(declare-fun b!733236 () Bool)

(declare-fun res!492741 () Bool)

(assert (=> b!733236 (=> (not res!492741) (not e!410264))))

(declare-datatypes ((List!13744 0))(
  ( (Nil!13741) (Cons!13740 (h!14806 (_ BitVec 64)) (t!20059 List!13744)) )
))
(declare-fun arrayNoDuplicates!0 (array!41251 (_ BitVec 32) List!13744) Bool)

(assert (=> b!733236 (= res!492741 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13741))))

(assert (= (and start!64940 res!492733) b!733231))

(assert (= (and b!733231 res!492735) b!733227))

(assert (= (and b!733227 res!492729) b!733217))

(assert (= (and b!733217 res!492728) b!733222))

(assert (= (and b!733222 res!492739) b!733224))

(assert (= (and b!733224 res!492740) b!733226))

(assert (= (and b!733226 res!492742) b!733236))

(assert (= (and b!733236 res!492741) b!733220))

(assert (= (and b!733220 res!492743) b!733230))

(assert (= (and b!733230 res!492732) b!733234))

(assert (= (and b!733234 res!492736) b!733232))

(assert (= (and b!733232 c!80623) b!733219))

(assert (= (and b!733232 (not c!80623)) b!733225))

(assert (= (and b!733232 res!492738) b!733223))

(assert (= (and b!733223 res!492737) b!733221))

(assert (= (and b!733221 res!492727) b!733233))

(assert (= (and b!733233 res!492730) b!733235))

(assert (= (and b!733221 (not res!492734)) b!733228))

(assert (= (and b!733228 (not res!492731)) b!733229))

(assert (= (and b!733229 (not res!492726)) b!733218))

(declare-fun m!686143 () Bool)

(assert (=> b!733219 m!686143))

(assert (=> b!733219 m!686143))

(declare-fun m!686145 () Bool)

(assert (=> b!733219 m!686145))

(declare-fun m!686147 () Bool)

(assert (=> b!733223 m!686147))

(assert (=> b!733223 m!686147))

(declare-fun m!686149 () Bool)

(assert (=> b!733223 m!686149))

(declare-fun m!686151 () Bool)

(assert (=> b!733223 m!686151))

(declare-fun m!686153 () Bool)

(assert (=> b!733223 m!686153))

(declare-fun m!686155 () Bool)

(assert (=> b!733223 m!686155))

(assert (=> b!733235 m!686143))

(assert (=> b!733235 m!686143))

(declare-fun m!686157 () Bool)

(assert (=> b!733235 m!686157))

(assert (=> b!733225 m!686143))

(assert (=> b!733225 m!686143))

(declare-fun m!686159 () Bool)

(assert (=> b!733225 m!686159))

(assert (=> b!733227 m!686143))

(assert (=> b!733227 m!686143))

(declare-fun m!686161 () Bool)

(assert (=> b!733227 m!686161))

(assert (=> b!733230 m!686143))

(assert (=> b!733230 m!686143))

(declare-fun m!686163 () Bool)

(assert (=> b!733230 m!686163))

(assert (=> b!733230 m!686163))

(assert (=> b!733230 m!686143))

(declare-fun m!686165 () Bool)

(assert (=> b!733230 m!686165))

(declare-fun m!686167 () Bool)

(assert (=> b!733236 m!686167))

(declare-fun m!686169 () Bool)

(assert (=> b!733224 m!686169))

(assert (=> b!733229 m!686143))

(assert (=> b!733229 m!686143))

(assert (=> b!733229 m!686159))

(declare-fun m!686171 () Bool)

(assert (=> b!733221 m!686171))

(declare-fun m!686173 () Bool)

(assert (=> b!733221 m!686173))

(assert (=> b!733233 m!686143))

(assert (=> b!733233 m!686143))

(declare-fun m!686175 () Bool)

(assert (=> b!733233 m!686175))

(declare-fun m!686177 () Bool)

(assert (=> b!733234 m!686177))

(declare-fun m!686179 () Bool)

(assert (=> b!733217 m!686179))

(declare-fun m!686181 () Bool)

(assert (=> b!733222 m!686181))

(declare-fun m!686183 () Bool)

(assert (=> b!733226 m!686183))

(declare-fun m!686185 () Bool)

(assert (=> start!64940 m!686185))

(declare-fun m!686187 () Bool)

(assert (=> start!64940 m!686187))

(declare-fun m!686189 () Bool)

(assert (=> b!733228 m!686189))

(push 1)

