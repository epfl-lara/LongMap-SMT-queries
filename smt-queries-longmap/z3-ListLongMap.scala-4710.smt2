; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65322 () Bool)

(assert start!65322)

(declare-fun b!742004 () Bool)

(declare-fun res!499255 () Bool)

(declare-fun e!414713 () Bool)

(assert (=> b!742004 (=> (not res!499255) (not e!414713))))

(declare-datatypes ((array!41495 0))(
  ( (array!41496 (arr!19861 (Array (_ BitVec 32) (_ BitVec 64))) (size!20282 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41495)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742004 (= res!499255 (validKeyInArray!0 (select (arr!19861 a!3186) j!159)))))

(declare-fun b!742005 () Bool)

(declare-fun res!499249 () Bool)

(assert (=> b!742005 (=> (not res!499249) (not e!414713))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!742005 (= res!499249 (and (= (size!20282 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20282 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20282 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742006 () Bool)

(declare-fun res!499257 () Bool)

(declare-fun e!414717 () Bool)

(assert (=> b!742006 (=> (not res!499257) (not e!414717))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!742006 (= res!499257 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20282 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20282 a!3186))))))

(declare-fun e!414719 () Bool)

(declare-fun b!742007 () Bool)

(declare-datatypes ((SeekEntryResult!7461 0))(
  ( (MissingZero!7461 (index!32212 (_ BitVec 32))) (Found!7461 (index!32213 (_ BitVec 32))) (Intermediate!7461 (undefined!8273 Bool) (index!32214 (_ BitVec 32)) (x!63187 (_ BitVec 32))) (Undefined!7461) (MissingVacant!7461 (index!32215 (_ BitVec 32))) )
))
(declare-fun lt!329645 () SeekEntryResult!7461)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41495 (_ BitVec 32)) SeekEntryResult!7461)

(assert (=> b!742007 (= e!414719 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19861 a!3186) j!159) a!3186 mask!3328) lt!329645))))

(declare-fun b!742008 () Bool)

(declare-fun res!499251 () Bool)

(declare-fun e!414716 () Bool)

(assert (=> b!742008 (=> (not res!499251) (not e!414716))))

(assert (=> b!742008 (= res!499251 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19861 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!742009 () Bool)

(declare-fun res!499246 () Bool)

(assert (=> b!742009 (=> (not res!499246) (not e!414713))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!742009 (= res!499246 (validKeyInArray!0 k0!2102))))

(declare-fun b!742010 () Bool)

(declare-fun res!499252 () Bool)

(assert (=> b!742010 (=> (not res!499252) (not e!414713))))

(declare-fun arrayContainsKey!0 (array!41495 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742010 (= res!499252 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742011 () Bool)

(declare-fun e!414715 () Bool)

(assert (=> b!742011 (= e!414715 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19861 a!3186) j!159) a!3186 mask!3328) (Found!7461 j!159)))))

(declare-fun b!742012 () Bool)

(assert (=> b!742012 (= e!414717 e!414716)))

(declare-fun res!499258 () Bool)

(assert (=> b!742012 (=> (not res!499258) (not e!414716))))

(declare-fun lt!329644 () SeekEntryResult!7461)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41495 (_ BitVec 32)) SeekEntryResult!7461)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742012 (= res!499258 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19861 a!3186) j!159) mask!3328) (select (arr!19861 a!3186) j!159) a!3186 mask!3328) lt!329644))))

(assert (=> b!742012 (= lt!329644 (Intermediate!7461 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742014 () Bool)

(declare-fun res!499256 () Bool)

(assert (=> b!742014 (=> (not res!499256) (not e!414717))))

(declare-datatypes ((List!13863 0))(
  ( (Nil!13860) (Cons!13859 (h!14931 (_ BitVec 64)) (t!20178 List!13863)) )
))
(declare-fun arrayNoDuplicates!0 (array!41495 (_ BitVec 32) List!13863) Bool)

(assert (=> b!742014 (= res!499256 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13860))))

(declare-fun b!742015 () Bool)

(assert (=> b!742015 (= e!414713 e!414717)))

(declare-fun res!499250 () Bool)

(assert (=> b!742015 (=> (not res!499250) (not e!414717))))

(declare-fun lt!329641 () SeekEntryResult!7461)

(assert (=> b!742015 (= res!499250 (or (= lt!329641 (MissingZero!7461 i!1173)) (= lt!329641 (MissingVacant!7461 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41495 (_ BitVec 32)) SeekEntryResult!7461)

(assert (=> b!742015 (= lt!329641 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!742016 () Bool)

(declare-fun res!499245 () Bool)

(assert (=> b!742016 (=> (not res!499245) (not e!414717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41495 (_ BitVec 32)) Bool)

(assert (=> b!742016 (= res!499245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742017 () Bool)

(assert (=> b!742017 (= e!414715 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19861 a!3186) j!159) a!3186 mask!3328) lt!329644))))

(declare-fun b!742018 () Bool)

(declare-fun res!499259 () Bool)

(assert (=> b!742018 (=> (not res!499259) (not e!414716))))

(assert (=> b!742018 (= res!499259 e!414715)))

(declare-fun c!81760 () Bool)

(assert (=> b!742018 (= c!81760 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742019 () Bool)

(declare-fun e!414714 () Bool)

(assert (=> b!742019 (= e!414714 e!414719)))

(declare-fun res!499254 () Bool)

(assert (=> b!742019 (=> (not res!499254) (not e!414719))))

(assert (=> b!742019 (= res!499254 (= (seekEntryOrOpen!0 (select (arr!19861 a!3186) j!159) a!3186 mask!3328) lt!329645))))

(assert (=> b!742019 (= lt!329645 (Found!7461 j!159))))

(declare-fun b!742020 () Bool)

(declare-fun e!414718 () Bool)

(assert (=> b!742020 (= e!414718 (not true))))

(assert (=> b!742020 e!414714))

(declare-fun res!499248 () Bool)

(assert (=> b!742020 (=> (not res!499248) (not e!414714))))

(assert (=> b!742020 (= res!499248 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25402 0))(
  ( (Unit!25403) )
))
(declare-fun lt!329643 () Unit!25402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25402)

(assert (=> b!742020 (= lt!329643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!499253 () Bool)

(assert (=> start!65322 (=> (not res!499253) (not e!414713))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65322 (= res!499253 (validMask!0 mask!3328))))

(assert (=> start!65322 e!414713))

(assert (=> start!65322 true))

(declare-fun array_inv!15657 (array!41495) Bool)

(assert (=> start!65322 (array_inv!15657 a!3186)))

(declare-fun b!742013 () Bool)

(assert (=> b!742013 (= e!414716 e!414718)))

(declare-fun res!499247 () Bool)

(assert (=> b!742013 (=> (not res!499247) (not e!414718))))

(declare-fun lt!329640 () (_ BitVec 64))

(declare-fun lt!329642 () array!41495)

(assert (=> b!742013 (= res!499247 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329640 mask!3328) lt!329640 lt!329642 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329640 lt!329642 mask!3328)))))

(assert (=> b!742013 (= lt!329640 (select (store (arr!19861 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742013 (= lt!329642 (array!41496 (store (arr!19861 a!3186) i!1173 k0!2102) (size!20282 a!3186)))))

(assert (= (and start!65322 res!499253) b!742005))

(assert (= (and b!742005 res!499249) b!742004))

(assert (= (and b!742004 res!499255) b!742009))

(assert (= (and b!742009 res!499246) b!742010))

(assert (= (and b!742010 res!499252) b!742015))

(assert (= (and b!742015 res!499250) b!742016))

(assert (= (and b!742016 res!499245) b!742014))

(assert (= (and b!742014 res!499256) b!742006))

(assert (= (and b!742006 res!499257) b!742012))

(assert (= (and b!742012 res!499258) b!742008))

(assert (= (and b!742008 res!499251) b!742018))

(assert (= (and b!742018 c!81760) b!742017))

(assert (= (and b!742018 (not c!81760)) b!742011))

(assert (= (and b!742018 res!499259) b!742013))

(assert (= (and b!742013 res!499247) b!742020))

(assert (= (and b!742020 res!499248) b!742019))

(assert (= (and b!742019 res!499254) b!742007))

(declare-fun m!692921 () Bool)

(assert (=> start!65322 m!692921))

(declare-fun m!692923 () Bool)

(assert (=> start!65322 m!692923))

(declare-fun m!692925 () Bool)

(assert (=> b!742007 m!692925))

(assert (=> b!742007 m!692925))

(declare-fun m!692927 () Bool)

(assert (=> b!742007 m!692927))

(assert (=> b!742012 m!692925))

(assert (=> b!742012 m!692925))

(declare-fun m!692929 () Bool)

(assert (=> b!742012 m!692929))

(assert (=> b!742012 m!692929))

(assert (=> b!742012 m!692925))

(declare-fun m!692931 () Bool)

(assert (=> b!742012 m!692931))

(declare-fun m!692933 () Bool)

(assert (=> b!742020 m!692933))

(declare-fun m!692935 () Bool)

(assert (=> b!742020 m!692935))

(declare-fun m!692937 () Bool)

(assert (=> b!742015 m!692937))

(declare-fun m!692939 () Bool)

(assert (=> b!742010 m!692939))

(declare-fun m!692941 () Bool)

(assert (=> b!742008 m!692941))

(assert (=> b!742017 m!692925))

(assert (=> b!742017 m!692925))

(declare-fun m!692943 () Bool)

(assert (=> b!742017 m!692943))

(assert (=> b!742011 m!692925))

(assert (=> b!742011 m!692925))

(declare-fun m!692945 () Bool)

(assert (=> b!742011 m!692945))

(declare-fun m!692947 () Bool)

(assert (=> b!742016 m!692947))

(assert (=> b!742019 m!692925))

(assert (=> b!742019 m!692925))

(declare-fun m!692949 () Bool)

(assert (=> b!742019 m!692949))

(declare-fun m!692951 () Bool)

(assert (=> b!742009 m!692951))

(declare-fun m!692953 () Bool)

(assert (=> b!742013 m!692953))

(declare-fun m!692955 () Bool)

(assert (=> b!742013 m!692955))

(assert (=> b!742013 m!692953))

(declare-fun m!692957 () Bool)

(assert (=> b!742013 m!692957))

(declare-fun m!692959 () Bool)

(assert (=> b!742013 m!692959))

(declare-fun m!692961 () Bool)

(assert (=> b!742013 m!692961))

(assert (=> b!742004 m!692925))

(assert (=> b!742004 m!692925))

(declare-fun m!692963 () Bool)

(assert (=> b!742004 m!692963))

(declare-fun m!692965 () Bool)

(assert (=> b!742014 m!692965))

(check-sat (not b!742015) (not b!742010) (not b!742020) (not b!742014) (not b!742017) (not b!742016) (not b!742007) (not b!742013) (not b!742019) (not b!742009) (not b!742011) (not b!742012) (not start!65322) (not b!742004))
(check-sat)
