; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65226 () Bool)

(assert start!65226)

(declare-fun b!738916 () Bool)

(declare-fun e!413221 () Bool)

(assert (=> b!738916 (= e!413221 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7413 0))(
  ( (MissingZero!7413 (index!32020 (_ BitVec 32))) (Found!7413 (index!32021 (_ BitVec 32))) (Intermediate!7413 (undefined!8225 Bool) (index!32022 (_ BitVec 32)) (x!63011 (_ BitVec 32))) (Undefined!7413) (MissingVacant!7413 (index!32023 (_ BitVec 32))) )
))
(declare-fun lt!328047 () SeekEntryResult!7413)

(declare-fun lt!328044 () (_ BitVec 32))

(declare-fun lt!328045 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41399 0))(
  ( (array!41400 (arr!19813 (Array (_ BitVec 32) (_ BitVec 64))) (size!20234 (_ BitVec 32))) )
))
(declare-fun lt!328053 () array!41399)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41399 (_ BitVec 32)) SeekEntryResult!7413)

(assert (=> b!738916 (= lt!328047 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328044 lt!328045 lt!328053 mask!3328))))

(declare-fun b!738917 () Bool)

(declare-fun res!496791 () Bool)

(declare-fun e!413219 () Bool)

(assert (=> b!738917 (=> (not res!496791) (not e!413219))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738917 (= res!496791 (validKeyInArray!0 k0!2102))))

(declare-fun b!738918 () Bool)

(declare-fun res!496786 () Bool)

(declare-fun e!413222 () Bool)

(assert (=> b!738918 (=> (not res!496786) (not e!413222))))

(declare-fun a!3186 () array!41399)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41399 (_ BitVec 32)) Bool)

(assert (=> b!738918 (= res!496786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738919 () Bool)

(declare-fun e!413220 () Bool)

(declare-fun e!413212 () Bool)

(assert (=> b!738919 (= e!413220 e!413212)))

(declare-fun res!496792 () Bool)

(assert (=> b!738919 (=> (not res!496792) (not e!413212))))

(declare-fun lt!328050 () SeekEntryResult!7413)

(declare-fun lt!328043 () SeekEntryResult!7413)

(assert (=> b!738919 (= res!496792 (= lt!328050 lt!328043))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!738919 (= lt!328043 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328045 lt!328053 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738919 (= lt!328050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328045 mask!3328) lt!328045 lt!328053 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738919 (= lt!328045 (select (store (arr!19813 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738919 (= lt!328053 (array!41400 (store (arr!19813 a!3186) i!1173 k0!2102) (size!20234 a!3186)))))

(declare-fun b!738920 () Bool)

(declare-fun res!496799 () Bool)

(assert (=> b!738920 (=> (not res!496799) (not e!413220))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!738920 (= res!496799 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19813 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738921 () Bool)

(declare-fun res!496796 () Bool)

(assert (=> b!738921 (=> (not res!496796) (not e!413219))))

(assert (=> b!738921 (= res!496796 (validKeyInArray!0 (select (arr!19813 a!3186) j!159)))))

(declare-fun lt!328049 () SeekEntryResult!7413)

(declare-fun e!413211 () Bool)

(declare-fun b!738922 () Bool)

(assert (=> b!738922 (= e!413211 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328049))))

(declare-fun b!738923 () Bool)

(declare-fun res!496785 () Bool)

(assert (=> b!738923 (=> (not res!496785) (not e!413220))))

(assert (=> b!738923 (= res!496785 e!413211)))

(declare-fun c!81448 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738923 (= c!81448 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738924 () Bool)

(declare-fun e!413216 () Bool)

(declare-fun e!413217 () Bool)

(assert (=> b!738924 (= e!413216 e!413217)))

(declare-fun res!496789 () Bool)

(assert (=> b!738924 (=> (not res!496789) (not e!413217))))

(declare-fun lt!328054 () SeekEntryResult!7413)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41399 (_ BitVec 32)) SeekEntryResult!7413)

(assert (=> b!738924 (= res!496789 (= (seekEntryOrOpen!0 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328054))))

(assert (=> b!738924 (= lt!328054 (Found!7413 j!159))))

(declare-fun b!738925 () Bool)

(declare-fun e!413215 () Bool)

(assert (=> b!738925 (= e!413212 (not e!413215))))

(declare-fun res!496798 () Bool)

(assert (=> b!738925 (=> res!496798 e!413215)))

(get-info :version)

(assert (=> b!738925 (= res!496798 (or (not ((_ is Intermediate!7413) lt!328043)) (bvsge x!1131 (x!63011 lt!328043))))))

(declare-fun lt!328042 () SeekEntryResult!7413)

(assert (=> b!738925 (= lt!328042 (Found!7413 j!159))))

(assert (=> b!738925 e!413216))

(declare-fun res!496787 () Bool)

(assert (=> b!738925 (=> (not res!496787) (not e!413216))))

(assert (=> b!738925 (= res!496787 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25248 0))(
  ( (Unit!25249) )
))
(declare-fun lt!328048 () Unit!25248)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41399 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25248)

(assert (=> b!738925 (= lt!328048 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738926 () Bool)

(declare-fun e!413218 () Unit!25248)

(declare-fun Unit!25250 () Unit!25248)

(assert (=> b!738926 (= e!413218 Unit!25250)))

(assert (=> b!738926 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328044 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328049)))

(declare-fun b!738927 () Bool)

(declare-fun res!496801 () Bool)

(assert (=> b!738927 (=> (not res!496801) (not e!413222))))

(declare-datatypes ((List!13815 0))(
  ( (Nil!13812) (Cons!13811 (h!14883 (_ BitVec 64)) (t!20130 List!13815)) )
))
(declare-fun arrayNoDuplicates!0 (array!41399 (_ BitVec 32) List!13815) Bool)

(assert (=> b!738927 (= res!496801 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13812))))

(declare-fun b!738928 () Bool)

(declare-fun res!496794 () Bool)

(assert (=> b!738928 (=> (not res!496794) (not e!413219))))

(declare-fun arrayContainsKey!0 (array!41399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738928 (= res!496794 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738929 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41399 (_ BitVec 32)) SeekEntryResult!7413)

(assert (=> b!738929 (= e!413217 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328054))))

(declare-fun b!738930 () Bool)

(assert (=> b!738930 (= e!413222 e!413220)))

(declare-fun res!496800 () Bool)

(assert (=> b!738930 (=> (not res!496800) (not e!413220))))

(assert (=> b!738930 (= res!496800 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19813 a!3186) j!159) mask!3328) (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328049))))

(assert (=> b!738930 (= lt!328049 (Intermediate!7413 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!413213 () Bool)

(declare-fun b!738931 () Bool)

(assert (=> b!738931 (= e!413213 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328044 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328049)))))

(declare-fun res!496788 () Bool)

(assert (=> start!65226 (=> (not res!496788) (not e!413219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65226 (= res!496788 (validMask!0 mask!3328))))

(assert (=> start!65226 e!413219))

(assert (=> start!65226 true))

(declare-fun array_inv!15609 (array!41399) Bool)

(assert (=> start!65226 (array_inv!15609 a!3186)))

(declare-fun b!738932 () Bool)

(assert (=> b!738932 (= e!413213 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328044 resIntermediateIndex!5 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328042)))))

(declare-fun b!738933 () Bool)

(declare-fun res!496795 () Bool)

(assert (=> b!738933 (=> (not res!496795) (not e!413222))))

(assert (=> b!738933 (= res!496795 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20234 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20234 a!3186))))))

(declare-fun b!738934 () Bool)

(declare-fun Unit!25251 () Unit!25248)

(assert (=> b!738934 (= e!413218 Unit!25251)))

(declare-fun lt!328051 () SeekEntryResult!7413)

(assert (=> b!738934 (= lt!328051 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19813 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738934 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328044 resIntermediateIndex!5 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) lt!328042)))

(declare-fun b!738935 () Bool)

(declare-fun res!496802 () Bool)

(assert (=> b!738935 (=> res!496802 e!413221)))

(assert (=> b!738935 (= res!496802 e!413213)))

(declare-fun c!81447 () Bool)

(declare-fun lt!328052 () Bool)

(assert (=> b!738935 (= c!81447 lt!328052)))

(declare-fun b!738936 () Bool)

(declare-fun res!496797 () Bool)

(assert (=> b!738936 (=> (not res!496797) (not e!413219))))

(assert (=> b!738936 (= res!496797 (and (= (size!20234 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20234 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20234 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738937 () Bool)

(assert (=> b!738937 (= e!413215 e!413221)))

(declare-fun res!496790 () Bool)

(assert (=> b!738937 (=> res!496790 e!413221)))

(assert (=> b!738937 (= res!496790 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328044 #b00000000000000000000000000000000) (bvsge lt!328044 (size!20234 a!3186))))))

(declare-fun lt!328055 () Unit!25248)

(assert (=> b!738937 (= lt!328055 e!413218)))

(declare-fun c!81446 () Bool)

(assert (=> b!738937 (= c!81446 lt!328052)))

(assert (=> b!738937 (= lt!328052 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738937 (= lt!328044 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738938 () Bool)

(assert (=> b!738938 (= e!413211 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19813 a!3186) j!159) a!3186 mask!3328) (Found!7413 j!159)))))

(declare-fun b!738939 () Bool)

(assert (=> b!738939 (= e!413219 e!413222)))

(declare-fun res!496793 () Bool)

(assert (=> b!738939 (=> (not res!496793) (not e!413222))))

(declare-fun lt!328046 () SeekEntryResult!7413)

(assert (=> b!738939 (= res!496793 (or (= lt!328046 (MissingZero!7413 i!1173)) (= lt!328046 (MissingVacant!7413 i!1173))))))

(assert (=> b!738939 (= lt!328046 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65226 res!496788) b!738936))

(assert (= (and b!738936 res!496797) b!738921))

(assert (= (and b!738921 res!496796) b!738917))

(assert (= (and b!738917 res!496791) b!738928))

(assert (= (and b!738928 res!496794) b!738939))

(assert (= (and b!738939 res!496793) b!738918))

(assert (= (and b!738918 res!496786) b!738927))

(assert (= (and b!738927 res!496801) b!738933))

(assert (= (and b!738933 res!496795) b!738930))

(assert (= (and b!738930 res!496800) b!738920))

(assert (= (and b!738920 res!496799) b!738923))

(assert (= (and b!738923 c!81448) b!738922))

(assert (= (and b!738923 (not c!81448)) b!738938))

(assert (= (and b!738923 res!496785) b!738919))

(assert (= (and b!738919 res!496792) b!738925))

(assert (= (and b!738925 res!496787) b!738924))

(assert (= (and b!738924 res!496789) b!738929))

(assert (= (and b!738925 (not res!496798)) b!738937))

(assert (= (and b!738937 c!81446) b!738926))

(assert (= (and b!738937 (not c!81446)) b!738934))

(assert (= (and b!738937 (not res!496790)) b!738935))

(assert (= (and b!738935 c!81447) b!738931))

(assert (= (and b!738935 (not c!81447)) b!738932))

(assert (= (and b!738935 (not res!496802)) b!738916))

(declare-fun m!690427 () Bool)

(assert (=> b!738930 m!690427))

(assert (=> b!738930 m!690427))

(declare-fun m!690429 () Bool)

(assert (=> b!738930 m!690429))

(assert (=> b!738930 m!690429))

(assert (=> b!738930 m!690427))

(declare-fun m!690431 () Bool)

(assert (=> b!738930 m!690431))

(declare-fun m!690433 () Bool)

(assert (=> b!738928 m!690433))

(declare-fun m!690435 () Bool)

(assert (=> b!738927 m!690435))

(assert (=> b!738934 m!690427))

(assert (=> b!738934 m!690427))

(declare-fun m!690437 () Bool)

(assert (=> b!738934 m!690437))

(assert (=> b!738934 m!690427))

(declare-fun m!690439 () Bool)

(assert (=> b!738934 m!690439))

(declare-fun m!690441 () Bool)

(assert (=> b!738925 m!690441))

(declare-fun m!690443 () Bool)

(assert (=> b!738925 m!690443))

(assert (=> b!738938 m!690427))

(assert (=> b!738938 m!690427))

(assert (=> b!738938 m!690437))

(assert (=> b!738921 m!690427))

(assert (=> b!738921 m!690427))

(declare-fun m!690445 () Bool)

(assert (=> b!738921 m!690445))

(assert (=> b!738922 m!690427))

(assert (=> b!738922 m!690427))

(declare-fun m!690447 () Bool)

(assert (=> b!738922 m!690447))

(assert (=> b!738931 m!690427))

(assert (=> b!738931 m!690427))

(declare-fun m!690449 () Bool)

(assert (=> b!738931 m!690449))

(declare-fun m!690451 () Bool)

(assert (=> start!65226 m!690451))

(declare-fun m!690453 () Bool)

(assert (=> start!65226 m!690453))

(declare-fun m!690455 () Bool)

(assert (=> b!738919 m!690455))

(declare-fun m!690457 () Bool)

(assert (=> b!738919 m!690457))

(declare-fun m!690459 () Bool)

(assert (=> b!738919 m!690459))

(assert (=> b!738919 m!690455))

(declare-fun m!690461 () Bool)

(assert (=> b!738919 m!690461))

(declare-fun m!690463 () Bool)

(assert (=> b!738919 m!690463))

(declare-fun m!690465 () Bool)

(assert (=> b!738916 m!690465))

(assert (=> b!738932 m!690427))

(assert (=> b!738932 m!690427))

(assert (=> b!738932 m!690439))

(declare-fun m!690467 () Bool)

(assert (=> b!738917 m!690467))

(declare-fun m!690469 () Bool)

(assert (=> b!738918 m!690469))

(assert (=> b!738926 m!690427))

(assert (=> b!738926 m!690427))

(assert (=> b!738926 m!690449))

(assert (=> b!738924 m!690427))

(assert (=> b!738924 m!690427))

(declare-fun m!690471 () Bool)

(assert (=> b!738924 m!690471))

(declare-fun m!690473 () Bool)

(assert (=> b!738920 m!690473))

(declare-fun m!690475 () Bool)

(assert (=> b!738939 m!690475))

(declare-fun m!690477 () Bool)

(assert (=> b!738937 m!690477))

(assert (=> b!738929 m!690427))

(assert (=> b!738929 m!690427))

(declare-fun m!690479 () Bool)

(assert (=> b!738929 m!690479))

(check-sat (not b!738928) (not b!738930) (not b!738925) (not b!738937) (not start!65226) (not b!738919) (not b!738927) (not b!738931) (not b!738918) (not b!738934) (not b!738939) (not b!738924) (not b!738922) (not b!738926) (not b!738916) (not b!738938) (not b!738917) (not b!738932) (not b!738921) (not b!738929))
(check-sat)
