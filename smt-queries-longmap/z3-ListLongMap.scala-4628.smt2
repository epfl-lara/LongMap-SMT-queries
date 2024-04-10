; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64470 () Bool)

(assert start!64470)

(declare-fun b!725064 () Bool)

(declare-fun e!406080 () Bool)

(declare-fun e!406079 () Bool)

(assert (=> b!725064 (= e!406080 e!406079)))

(declare-fun res!486218 () Bool)

(assert (=> b!725064 (=> (not res!486218) (not e!406079))))

(declare-datatypes ((array!40988 0))(
  ( (array!40989 (arr!19615 (Array (_ BitVec 32) (_ BitVec 64))) (size!20036 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40988)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7215 0))(
  ( (MissingZero!7215 (index!31228 (_ BitVec 32))) (Found!7215 (index!31229 (_ BitVec 32))) (Intermediate!7215 (undefined!8027 Bool) (index!31230 (_ BitVec 32)) (x!62225 (_ BitVec 32))) (Undefined!7215) (MissingVacant!7215 (index!31231 (_ BitVec 32))) )
))
(declare-fun lt!321214 () SeekEntryResult!7215)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40988 (_ BitVec 32)) SeekEntryResult!7215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725064 (= res!486218 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19615 a!3186) j!159) mask!3328) (select (arr!19615 a!3186) j!159) a!3186 mask!3328) lt!321214))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725064 (= lt!321214 (Intermediate!7215 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725065 () Bool)

(declare-fun res!486215 () Bool)

(assert (=> b!725065 (=> (not res!486215) (not e!406079))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725065 (= res!486215 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19615 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725066 () Bool)

(declare-fun res!486214 () Bool)

(declare-fun e!406082 () Bool)

(assert (=> b!725066 (=> (not res!486214) (not e!406082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725066 (= res!486214 (validKeyInArray!0 (select (arr!19615 a!3186) j!159)))))

(declare-fun b!725067 () Bool)

(declare-fun e!406077 () Bool)

(assert (=> b!725067 (= e!406079 e!406077)))

(declare-fun res!486212 () Bool)

(assert (=> b!725067 (=> (not res!486212) (not e!406077))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!321218 () array!40988)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321215 () (_ BitVec 64))

(assert (=> b!725067 (= res!486212 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321215 mask!3328) lt!321215 lt!321218 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321215 lt!321218 mask!3328)))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!725067 (= lt!321215 (select (store (arr!19615 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725067 (= lt!321218 (array!40989 (store (arr!19615 a!3186) i!1173 k0!2102) (size!20036 a!3186)))))

(declare-fun b!725069 () Bool)

(declare-fun e!406081 () Bool)

(assert (=> b!725069 (= e!406081 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19615 a!3186) j!159) a!3186 mask!3328) lt!321214))))

(declare-fun b!725070 () Bool)

(declare-fun res!486208 () Bool)

(assert (=> b!725070 (=> (not res!486208) (not e!406080))))

(declare-datatypes ((List!13617 0))(
  ( (Nil!13614) (Cons!13613 (h!14670 (_ BitVec 64)) (t!19932 List!13617)) )
))
(declare-fun arrayNoDuplicates!0 (array!40988 (_ BitVec 32) List!13617) Bool)

(assert (=> b!725070 (= res!486208 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13614))))

(declare-fun b!725071 () Bool)

(declare-fun res!486221 () Bool)

(assert (=> b!725071 (=> (not res!486221) (not e!406080))))

(assert (=> b!725071 (= res!486221 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20036 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20036 a!3186))))))

(declare-fun b!725072 () Bool)

(declare-fun res!486213 () Bool)

(assert (=> b!725072 (=> (not res!486213) (not e!406079))))

(assert (=> b!725072 (= res!486213 e!406081)))

(declare-fun c!79801 () Bool)

(assert (=> b!725072 (= c!79801 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725073 () Bool)

(declare-fun res!486220 () Bool)

(assert (=> b!725073 (=> (not res!486220) (not e!406082))))

(declare-fun arrayContainsKey!0 (array!40988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725073 (= res!486220 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725074 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40988 (_ BitVec 32)) SeekEntryResult!7215)

(assert (=> b!725074 (= e!406081 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19615 a!3186) j!159) a!3186 mask!3328) (Found!7215 j!159)))))

(declare-fun b!725075 () Bool)

(declare-fun res!486219 () Bool)

(assert (=> b!725075 (=> (not res!486219) (not e!406082))))

(assert (=> b!725075 (= res!486219 (and (= (size!20036 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20036 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20036 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725068 () Bool)

(declare-fun res!486209 () Bool)

(assert (=> b!725068 (=> (not res!486209) (not e!406082))))

(assert (=> b!725068 (= res!486209 (validKeyInArray!0 k0!2102))))

(declare-fun res!486210 () Bool)

(assert (=> start!64470 (=> (not res!486210) (not e!406082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64470 (= res!486210 (validMask!0 mask!3328))))

(assert (=> start!64470 e!406082))

(assert (=> start!64470 true))

(declare-fun array_inv!15411 (array!40988) Bool)

(assert (=> start!64470 (array_inv!15411 a!3186)))

(declare-fun b!725076 () Bool)

(declare-fun res!486217 () Bool)

(assert (=> b!725076 (=> (not res!486217) (not e!406080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40988 (_ BitVec 32)) Bool)

(assert (=> b!725076 (= res!486217 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725077 () Bool)

(declare-fun e!406078 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40988 (_ BitVec 32)) SeekEntryResult!7215)

(assert (=> b!725077 (= e!406078 (= (seekEntryOrOpen!0 (select (arr!19615 a!3186) j!159) a!3186 mask!3328) (Found!7215 j!159)))))

(declare-fun b!725078 () Bool)

(assert (=> b!725078 (= e!406077 (not true))))

(assert (=> b!725078 e!406078))

(declare-fun res!486211 () Bool)

(assert (=> b!725078 (=> (not res!486211) (not e!406078))))

(assert (=> b!725078 (= res!486211 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24748 0))(
  ( (Unit!24749) )
))
(declare-fun lt!321217 () Unit!24748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24748)

(assert (=> b!725078 (= lt!321217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725079 () Bool)

(assert (=> b!725079 (= e!406082 e!406080)))

(declare-fun res!486216 () Bool)

(assert (=> b!725079 (=> (not res!486216) (not e!406080))))

(declare-fun lt!321216 () SeekEntryResult!7215)

(assert (=> b!725079 (= res!486216 (or (= lt!321216 (MissingZero!7215 i!1173)) (= lt!321216 (MissingVacant!7215 i!1173))))))

(assert (=> b!725079 (= lt!321216 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!64470 res!486210) b!725075))

(assert (= (and b!725075 res!486219) b!725066))

(assert (= (and b!725066 res!486214) b!725068))

(assert (= (and b!725068 res!486209) b!725073))

(assert (= (and b!725073 res!486220) b!725079))

(assert (= (and b!725079 res!486216) b!725076))

(assert (= (and b!725076 res!486217) b!725070))

(assert (= (and b!725070 res!486208) b!725071))

(assert (= (and b!725071 res!486221) b!725064))

(assert (= (and b!725064 res!486218) b!725065))

(assert (= (and b!725065 res!486215) b!725072))

(assert (= (and b!725072 c!79801) b!725069))

(assert (= (and b!725072 (not c!79801)) b!725074))

(assert (= (and b!725072 res!486213) b!725067))

(assert (= (and b!725067 res!486212) b!725078))

(assert (= (and b!725078 res!486211) b!725077))

(declare-fun m!679263 () Bool)

(assert (=> b!725066 m!679263))

(assert (=> b!725066 m!679263))

(declare-fun m!679265 () Bool)

(assert (=> b!725066 m!679265))

(assert (=> b!725064 m!679263))

(assert (=> b!725064 m!679263))

(declare-fun m!679267 () Bool)

(assert (=> b!725064 m!679267))

(assert (=> b!725064 m!679267))

(assert (=> b!725064 m!679263))

(declare-fun m!679269 () Bool)

(assert (=> b!725064 m!679269))

(declare-fun m!679271 () Bool)

(assert (=> b!725070 m!679271))

(declare-fun m!679273 () Bool)

(assert (=> start!64470 m!679273))

(declare-fun m!679275 () Bool)

(assert (=> start!64470 m!679275))

(declare-fun m!679277 () Bool)

(assert (=> b!725068 m!679277))

(declare-fun m!679279 () Bool)

(assert (=> b!725073 m!679279))

(declare-fun m!679281 () Bool)

(assert (=> b!725076 m!679281))

(assert (=> b!725077 m!679263))

(assert (=> b!725077 m!679263))

(declare-fun m!679283 () Bool)

(assert (=> b!725077 m!679283))

(assert (=> b!725069 m!679263))

(assert (=> b!725069 m!679263))

(declare-fun m!679285 () Bool)

(assert (=> b!725069 m!679285))

(declare-fun m!679287 () Bool)

(assert (=> b!725065 m!679287))

(declare-fun m!679289 () Bool)

(assert (=> b!725078 m!679289))

(declare-fun m!679291 () Bool)

(assert (=> b!725078 m!679291))

(declare-fun m!679293 () Bool)

(assert (=> b!725067 m!679293))

(declare-fun m!679295 () Bool)

(assert (=> b!725067 m!679295))

(declare-fun m!679297 () Bool)

(assert (=> b!725067 m!679297))

(assert (=> b!725067 m!679293))

(declare-fun m!679299 () Bool)

(assert (=> b!725067 m!679299))

(declare-fun m!679301 () Bool)

(assert (=> b!725067 m!679301))

(assert (=> b!725074 m!679263))

(assert (=> b!725074 m!679263))

(declare-fun m!679303 () Bool)

(assert (=> b!725074 m!679303))

(declare-fun m!679305 () Bool)

(assert (=> b!725079 m!679305))

(check-sat (not b!725077) (not b!725070) (not start!64470) (not b!725067) (not b!725074) (not b!725066) (not b!725079) (not b!725068) (not b!725076) (not b!725073) (not b!725078) (not b!725064) (not b!725069))
(check-sat)
