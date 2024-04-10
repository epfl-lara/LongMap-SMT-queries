; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68000 () Bool)

(assert start!68000)

(declare-fun b!791300 () Bool)

(declare-fun res!536067 () Bool)

(declare-fun e!439776 () Bool)

(assert (=> b!791300 (=> (not res!536067) (not e!439776))))

(declare-datatypes ((array!42914 0))(
  ( (array!42915 (arr!20542 (Array (_ BitVec 32) (_ BitVec 64))) (size!20963 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42914)

(declare-datatypes ((List!14544 0))(
  ( (Nil!14541) (Cons!14540 (h!15669 (_ BitVec 64)) (t!20859 List!14544)) )
))
(declare-fun arrayNoDuplicates!0 (array!42914 (_ BitVec 32) List!14544) Bool)

(assert (=> b!791300 (= res!536067 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14541))))

(declare-fun b!791301 () Bool)

(declare-fun res!536072 () Bool)

(assert (=> b!791301 (=> (not res!536072) (not e!439776))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!791301 (= res!536072 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20963 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20963 a!3186))))))

(declare-fun b!791302 () Bool)

(declare-fun e!439778 () Bool)

(declare-fun e!439772 () Bool)

(assert (=> b!791302 (= e!439778 e!439772)))

(declare-fun res!536075 () Bool)

(assert (=> b!791302 (=> (not res!536075) (not e!439772))))

(declare-fun lt!353212 () (_ BitVec 64))

(declare-fun lt!353211 () array!42914)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8142 0))(
  ( (MissingZero!8142 (index!34936 (_ BitVec 32))) (Found!8142 (index!34937 (_ BitVec 32))) (Intermediate!8142 (undefined!8954 Bool) (index!34938 (_ BitVec 32)) (x!65876 (_ BitVec 32))) (Undefined!8142) (MissingVacant!8142 (index!34939 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42914 (_ BitVec 32)) SeekEntryResult!8142)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791302 (= res!536075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353212 mask!3328) lt!353212 lt!353211 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353212 lt!353211 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!791302 (= lt!353212 (select (store (arr!20542 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!791302 (= lt!353211 (array!42915 (store (arr!20542 a!3186) i!1173 k0!2102) (size!20963 a!3186)))))

(declare-fun b!791303 () Bool)

(assert (=> b!791303 (= e!439772 (not true))))

(declare-fun e!439777 () Bool)

(assert (=> b!791303 e!439777))

(declare-fun res!536061 () Bool)

(assert (=> b!791303 (=> (not res!536061) (not e!439777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42914 (_ BitVec 32)) Bool)

(assert (=> b!791303 (= res!536061 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27436 0))(
  ( (Unit!27437) )
))
(declare-fun lt!353213 () Unit!27436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27436)

(assert (=> b!791303 (= lt!353213 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791304 () Bool)

(declare-fun res!536065 () Bool)

(assert (=> b!791304 (=> (not res!536065) (not e!439778))))

(declare-fun e!439771 () Bool)

(assert (=> b!791304 (= res!536065 e!439771)))

(declare-fun c!88030 () Bool)

(assert (=> b!791304 (= c!88030 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791305 () Bool)

(declare-fun res!536074 () Bool)

(declare-fun e!439774 () Bool)

(assert (=> b!791305 (=> (not res!536074) (not e!439774))))

(assert (=> b!791305 (= res!536074 (and (= (size!20963 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20963 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20963 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!536068 () Bool)

(assert (=> start!68000 (=> (not res!536068) (not e!439774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68000 (= res!536068 (validMask!0 mask!3328))))

(assert (=> start!68000 e!439774))

(assert (=> start!68000 true))

(declare-fun array_inv!16338 (array!42914) Bool)

(assert (=> start!68000 (array_inv!16338 a!3186)))

(declare-fun b!791306 () Bool)

(declare-fun res!536062 () Bool)

(assert (=> b!791306 (=> (not res!536062) (not e!439774))))

(declare-fun arrayContainsKey!0 (array!42914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791306 (= res!536062 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!353209 () SeekEntryResult!8142)

(declare-fun e!439775 () Bool)

(declare-fun b!791307 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42914 (_ BitVec 32)) SeekEntryResult!8142)

(assert (=> b!791307 (= e!439775 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20542 a!3186) j!159) a!3186 mask!3328) lt!353209))))

(declare-fun b!791308 () Bool)

(declare-fun res!536073 () Bool)

(assert (=> b!791308 (=> (not res!536073) (not e!439774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791308 (= res!536073 (validKeyInArray!0 k0!2102))))

(declare-fun b!791309 () Bool)

(assert (=> b!791309 (= e!439774 e!439776)))

(declare-fun res!536063 () Bool)

(assert (=> b!791309 (=> (not res!536063) (not e!439776))))

(declare-fun lt!353208 () SeekEntryResult!8142)

(assert (=> b!791309 (= res!536063 (or (= lt!353208 (MissingZero!8142 i!1173)) (= lt!353208 (MissingVacant!8142 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42914 (_ BitVec 32)) SeekEntryResult!8142)

(assert (=> b!791309 (= lt!353208 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!791310 () Bool)

(assert (=> b!791310 (= e!439777 e!439775)))

(declare-fun res!536066 () Bool)

(assert (=> b!791310 (=> (not res!536066) (not e!439775))))

(assert (=> b!791310 (= res!536066 (= (seekEntryOrOpen!0 (select (arr!20542 a!3186) j!159) a!3186 mask!3328) lt!353209))))

(assert (=> b!791310 (= lt!353209 (Found!8142 j!159))))

(declare-fun b!791311 () Bool)

(assert (=> b!791311 (= e!439771 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20542 a!3186) j!159) a!3186 mask!3328) (Found!8142 j!159)))))

(declare-fun lt!353210 () SeekEntryResult!8142)

(declare-fun b!791312 () Bool)

(assert (=> b!791312 (= e!439771 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20542 a!3186) j!159) a!3186 mask!3328) lt!353210))))

(declare-fun b!791313 () Bool)

(declare-fun res!536064 () Bool)

(assert (=> b!791313 (=> (not res!536064) (not e!439776))))

(assert (=> b!791313 (= res!536064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791314 () Bool)

(declare-fun res!536070 () Bool)

(assert (=> b!791314 (=> (not res!536070) (not e!439778))))

(assert (=> b!791314 (= res!536070 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20542 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791315 () Bool)

(declare-fun res!536069 () Bool)

(assert (=> b!791315 (=> (not res!536069) (not e!439774))))

(assert (=> b!791315 (= res!536069 (validKeyInArray!0 (select (arr!20542 a!3186) j!159)))))

(declare-fun b!791316 () Bool)

(assert (=> b!791316 (= e!439776 e!439778)))

(declare-fun res!536071 () Bool)

(assert (=> b!791316 (=> (not res!536071) (not e!439778))))

(assert (=> b!791316 (= res!536071 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20542 a!3186) j!159) mask!3328) (select (arr!20542 a!3186) j!159) a!3186 mask!3328) lt!353210))))

(assert (=> b!791316 (= lt!353210 (Intermediate!8142 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!68000 res!536068) b!791305))

(assert (= (and b!791305 res!536074) b!791315))

(assert (= (and b!791315 res!536069) b!791308))

(assert (= (and b!791308 res!536073) b!791306))

(assert (= (and b!791306 res!536062) b!791309))

(assert (= (and b!791309 res!536063) b!791313))

(assert (= (and b!791313 res!536064) b!791300))

(assert (= (and b!791300 res!536067) b!791301))

(assert (= (and b!791301 res!536072) b!791316))

(assert (= (and b!791316 res!536071) b!791314))

(assert (= (and b!791314 res!536070) b!791304))

(assert (= (and b!791304 c!88030) b!791312))

(assert (= (and b!791304 (not c!88030)) b!791311))

(assert (= (and b!791304 res!536065) b!791302))

(assert (= (and b!791302 res!536075) b!791303))

(assert (= (and b!791303 res!536061) b!791310))

(assert (= (and b!791310 res!536066) b!791307))

(declare-fun m!732051 () Bool)

(assert (=> b!791316 m!732051))

(assert (=> b!791316 m!732051))

(declare-fun m!732053 () Bool)

(assert (=> b!791316 m!732053))

(assert (=> b!791316 m!732053))

(assert (=> b!791316 m!732051))

(declare-fun m!732055 () Bool)

(assert (=> b!791316 m!732055))

(declare-fun m!732057 () Bool)

(assert (=> b!791306 m!732057))

(assert (=> b!791310 m!732051))

(assert (=> b!791310 m!732051))

(declare-fun m!732059 () Bool)

(assert (=> b!791310 m!732059))

(declare-fun m!732061 () Bool)

(assert (=> start!68000 m!732061))

(declare-fun m!732063 () Bool)

(assert (=> start!68000 m!732063))

(declare-fun m!732065 () Bool)

(assert (=> b!791300 m!732065))

(assert (=> b!791311 m!732051))

(assert (=> b!791311 m!732051))

(declare-fun m!732067 () Bool)

(assert (=> b!791311 m!732067))

(assert (=> b!791312 m!732051))

(assert (=> b!791312 m!732051))

(declare-fun m!732069 () Bool)

(assert (=> b!791312 m!732069))

(declare-fun m!732071 () Bool)

(assert (=> b!791313 m!732071))

(assert (=> b!791307 m!732051))

(assert (=> b!791307 m!732051))

(declare-fun m!732073 () Bool)

(assert (=> b!791307 m!732073))

(assert (=> b!791315 m!732051))

(assert (=> b!791315 m!732051))

(declare-fun m!732075 () Bool)

(assert (=> b!791315 m!732075))

(declare-fun m!732077 () Bool)

(assert (=> b!791308 m!732077))

(declare-fun m!732079 () Bool)

(assert (=> b!791303 m!732079))

(declare-fun m!732081 () Bool)

(assert (=> b!791303 m!732081))

(declare-fun m!732083 () Bool)

(assert (=> b!791314 m!732083))

(declare-fun m!732085 () Bool)

(assert (=> b!791302 m!732085))

(declare-fun m!732087 () Bool)

(assert (=> b!791302 m!732087))

(declare-fun m!732089 () Bool)

(assert (=> b!791302 m!732089))

(declare-fun m!732091 () Bool)

(assert (=> b!791302 m!732091))

(assert (=> b!791302 m!732089))

(declare-fun m!732093 () Bool)

(assert (=> b!791302 m!732093))

(declare-fun m!732095 () Bool)

(assert (=> b!791309 m!732095))

(check-sat (not b!791313) (not start!68000) (not b!791300) (not b!791312) (not b!791308) (not b!791303) (not b!791306) (not b!791311) (not b!791302) (not b!791310) (not b!791316) (not b!791315) (not b!791307) (not b!791309))
(check-sat)
