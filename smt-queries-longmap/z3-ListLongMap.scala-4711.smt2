; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65306 () Bool)

(assert start!65306)

(declare-fun b!741856 () Bool)

(declare-fun e!414607 () Bool)

(declare-fun e!414610 () Bool)

(assert (=> b!741856 (= e!414607 e!414610)))

(declare-fun res!499230 () Bool)

(assert (=> b!741856 (=> (not res!499230) (not e!414610))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41496 0))(
  ( (array!41497 (arr!19862 (Array (_ BitVec 32) (_ BitVec 64))) (size!20283 (_ BitVec 32))) )
))
(declare-fun lt!329440 () array!41496)

(declare-fun lt!329437 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7459 0))(
  ( (MissingZero!7459 (index!32204 (_ BitVec 32))) (Found!7459 (index!32205 (_ BitVec 32))) (Intermediate!7459 (undefined!8271 Bool) (index!32206 (_ BitVec 32)) (x!63188 (_ BitVec 32))) (Undefined!7459) (MissingVacant!7459 (index!32207 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41496 (_ BitVec 32)) SeekEntryResult!7459)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741856 (= res!499230 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329437 mask!3328) lt!329437 lt!329440 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329437 lt!329440 mask!3328)))))

(declare-fun a!3186 () array!41496)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!741856 (= lt!329437 (select (store (arr!19862 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741856 (= lt!329440 (array!41497 (store (arr!19862 a!3186) i!1173 k0!2102) (size!20283 a!3186)))))

(declare-fun b!741857 () Bool)

(declare-fun res!499228 () Bool)

(declare-fun e!414611 () Bool)

(assert (=> b!741857 (=> (not res!499228) (not e!414611))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!741857 (= res!499228 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20283 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20283 a!3186))))))

(declare-fun e!414612 () Bool)

(declare-fun lt!329439 () SeekEntryResult!7459)

(declare-fun b!741858 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41496 (_ BitVec 32)) SeekEntryResult!7459)

(assert (=> b!741858 (= e!414612 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19862 a!3186) j!159) a!3186 mask!3328) lt!329439))))

(declare-fun b!741860 () Bool)

(assert (=> b!741860 (= e!414610 (not true))))

(declare-fun e!414613 () Bool)

(assert (=> b!741860 e!414613))

(declare-fun res!499235 () Bool)

(assert (=> b!741860 (=> (not res!499235) (not e!414613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41496 (_ BitVec 32)) Bool)

(assert (=> b!741860 (= res!499235 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25370 0))(
  ( (Unit!25371) )
))
(declare-fun lt!329441 () Unit!25370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41496 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25370)

(assert (=> b!741860 (= lt!329441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741861 () Bool)

(declare-fun res!499231 () Bool)

(assert (=> b!741861 (=> (not res!499231) (not e!414607))))

(assert (=> b!741861 (= res!499231 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19862 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741862 () Bool)

(assert (=> b!741862 (= e!414613 e!414612)))

(declare-fun res!499227 () Bool)

(assert (=> b!741862 (=> (not res!499227) (not e!414612))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41496 (_ BitVec 32)) SeekEntryResult!7459)

(assert (=> b!741862 (= res!499227 (= (seekEntryOrOpen!0 (select (arr!19862 a!3186) j!159) a!3186 mask!3328) lt!329439))))

(assert (=> b!741862 (= lt!329439 (Found!7459 j!159))))

(declare-fun b!741863 () Bool)

(assert (=> b!741863 (= e!414611 e!414607)))

(declare-fun res!499232 () Bool)

(assert (=> b!741863 (=> (not res!499232) (not e!414607))))

(declare-fun lt!329438 () SeekEntryResult!7459)

(assert (=> b!741863 (= res!499232 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19862 a!3186) j!159) mask!3328) (select (arr!19862 a!3186) j!159) a!3186 mask!3328) lt!329438))))

(assert (=> b!741863 (= lt!329438 (Intermediate!7459 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741864 () Bool)

(declare-fun res!499225 () Bool)

(assert (=> b!741864 (=> (not res!499225) (not e!414611))))

(declare-datatypes ((List!13903 0))(
  ( (Nil!13900) (Cons!13899 (h!14971 (_ BitVec 64)) (t!20209 List!13903)) )
))
(declare-fun arrayNoDuplicates!0 (array!41496 (_ BitVec 32) List!13903) Bool)

(assert (=> b!741864 (= res!499225 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13900))))

(declare-fun b!741865 () Bool)

(declare-fun res!499233 () Bool)

(declare-fun e!414606 () Bool)

(assert (=> b!741865 (=> (not res!499233) (not e!414606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741865 (= res!499233 (validKeyInArray!0 (select (arr!19862 a!3186) j!159)))))

(declare-fun b!741866 () Bool)

(assert (=> b!741866 (= e!414606 e!414611)))

(declare-fun res!499226 () Bool)

(assert (=> b!741866 (=> (not res!499226) (not e!414611))))

(declare-fun lt!329436 () SeekEntryResult!7459)

(assert (=> b!741866 (= res!499226 (or (= lt!329436 (MissingZero!7459 i!1173)) (= lt!329436 (MissingVacant!7459 i!1173))))))

(assert (=> b!741866 (= lt!329436 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun e!414608 () Bool)

(declare-fun b!741867 () Bool)

(assert (=> b!741867 (= e!414608 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19862 a!3186) j!159) a!3186 mask!3328) lt!329438))))

(declare-fun b!741868 () Bool)

(declare-fun res!499234 () Bool)

(assert (=> b!741868 (=> (not res!499234) (not e!414607))))

(assert (=> b!741868 (= res!499234 e!414608)))

(declare-fun c!81696 () Bool)

(assert (=> b!741868 (= c!81696 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741869 () Bool)

(declare-fun res!499239 () Bool)

(assert (=> b!741869 (=> (not res!499239) (not e!414606))))

(declare-fun arrayContainsKey!0 (array!41496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741869 (= res!499239 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741870 () Bool)

(declare-fun res!499236 () Bool)

(assert (=> b!741870 (=> (not res!499236) (not e!414611))))

(assert (=> b!741870 (= res!499236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!499237 () Bool)

(assert (=> start!65306 (=> (not res!499237) (not e!414606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65306 (= res!499237 (validMask!0 mask!3328))))

(assert (=> start!65306 e!414606))

(assert (=> start!65306 true))

(declare-fun array_inv!15745 (array!41496) Bool)

(assert (=> start!65306 (array_inv!15745 a!3186)))

(declare-fun b!741859 () Bool)

(declare-fun res!499238 () Bool)

(assert (=> b!741859 (=> (not res!499238) (not e!414606))))

(assert (=> b!741859 (= res!499238 (and (= (size!20283 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20283 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20283 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741871 () Bool)

(assert (=> b!741871 (= e!414608 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19862 a!3186) j!159) a!3186 mask!3328) (Found!7459 j!159)))))

(declare-fun b!741872 () Bool)

(declare-fun res!499229 () Bool)

(assert (=> b!741872 (=> (not res!499229) (not e!414606))))

(assert (=> b!741872 (= res!499229 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65306 res!499237) b!741859))

(assert (= (and b!741859 res!499238) b!741865))

(assert (= (and b!741865 res!499233) b!741872))

(assert (= (and b!741872 res!499229) b!741869))

(assert (= (and b!741869 res!499239) b!741866))

(assert (= (and b!741866 res!499226) b!741870))

(assert (= (and b!741870 res!499236) b!741864))

(assert (= (and b!741864 res!499225) b!741857))

(assert (= (and b!741857 res!499228) b!741863))

(assert (= (and b!741863 res!499232) b!741861))

(assert (= (and b!741861 res!499231) b!741868))

(assert (= (and b!741868 c!81696) b!741867))

(assert (= (and b!741868 (not c!81696)) b!741871))

(assert (= (and b!741868 res!499234) b!741856))

(assert (= (and b!741856 res!499230) b!741860))

(assert (= (and b!741860 res!499235) b!741862))

(assert (= (and b!741862 res!499227) b!741858))

(declare-fun m!692255 () Bool)

(assert (=> b!741867 m!692255))

(assert (=> b!741867 m!692255))

(declare-fun m!692257 () Bool)

(assert (=> b!741867 m!692257))

(declare-fun m!692259 () Bool)

(assert (=> b!741864 m!692259))

(declare-fun m!692261 () Bool)

(assert (=> b!741861 m!692261))

(declare-fun m!692263 () Bool)

(assert (=> start!65306 m!692263))

(declare-fun m!692265 () Bool)

(assert (=> start!65306 m!692265))

(declare-fun m!692267 () Bool)

(assert (=> b!741860 m!692267))

(declare-fun m!692269 () Bool)

(assert (=> b!741860 m!692269))

(declare-fun m!692271 () Bool)

(assert (=> b!741870 m!692271))

(declare-fun m!692273 () Bool)

(assert (=> b!741856 m!692273))

(declare-fun m!692275 () Bool)

(assert (=> b!741856 m!692275))

(declare-fun m!692277 () Bool)

(assert (=> b!741856 m!692277))

(assert (=> b!741856 m!692273))

(declare-fun m!692279 () Bool)

(assert (=> b!741856 m!692279))

(declare-fun m!692281 () Bool)

(assert (=> b!741856 m!692281))

(assert (=> b!741858 m!692255))

(assert (=> b!741858 m!692255))

(declare-fun m!692283 () Bool)

(assert (=> b!741858 m!692283))

(assert (=> b!741865 m!692255))

(assert (=> b!741865 m!692255))

(declare-fun m!692285 () Bool)

(assert (=> b!741865 m!692285))

(assert (=> b!741863 m!692255))

(assert (=> b!741863 m!692255))

(declare-fun m!692287 () Bool)

(assert (=> b!741863 m!692287))

(assert (=> b!741863 m!692287))

(assert (=> b!741863 m!692255))

(declare-fun m!692289 () Bool)

(assert (=> b!741863 m!692289))

(assert (=> b!741871 m!692255))

(assert (=> b!741871 m!692255))

(declare-fun m!692291 () Bool)

(assert (=> b!741871 m!692291))

(declare-fun m!692293 () Bool)

(assert (=> b!741869 m!692293))

(declare-fun m!692295 () Bool)

(assert (=> b!741866 m!692295))

(assert (=> b!741862 m!692255))

(assert (=> b!741862 m!692255))

(declare-fun m!692297 () Bool)

(assert (=> b!741862 m!692297))

(declare-fun m!692299 () Bool)

(assert (=> b!741872 m!692299))

(check-sat (not b!741870) (not b!741864) (not b!741866) (not b!741863) (not b!741865) (not start!65306) (not b!741869) (not b!741867) (not b!741858) (not b!741871) (not b!741872) (not b!741862) (not b!741856) (not b!741860))
(check-sat)
