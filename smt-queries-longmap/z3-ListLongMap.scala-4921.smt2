; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67748 () Bool)

(assert start!67748)

(declare-fun b!787027 () Bool)

(declare-fun res!533085 () Bool)

(declare-fun e!437465 () Bool)

(assert (=> b!787027 (=> (not res!533085) (not e!437465))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42807 0))(
  ( (array!42808 (arr!20492 (Array (_ BitVec 32) (_ BitVec 64))) (size!20913 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42807)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787027 (= res!533085 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20913 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20913 a!3186))))))

(declare-fun b!787028 () Bool)

(declare-datatypes ((SeekEntryResult!8089 0))(
  ( (MissingZero!8089 (index!34724 (_ BitVec 32))) (Found!8089 (index!34725 (_ BitVec 32))) (Intermediate!8089 (undefined!8901 Bool) (index!34726 (_ BitVec 32)) (x!65672 (_ BitVec 32))) (Undefined!8089) (MissingVacant!8089 (index!34727 (_ BitVec 32))) )
))
(declare-fun lt!350927 () SeekEntryResult!8089)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!437464 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42807 (_ BitVec 32)) SeekEntryResult!8089)

(assert (=> b!787028 (= e!437464 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20492 a!3186) j!159) a!3186 mask!3328) lt!350927))))

(declare-fun b!787029 () Bool)

(declare-fun e!437463 () Bool)

(declare-fun e!437467 () Bool)

(assert (=> b!787029 (= e!437463 e!437467)))

(declare-fun res!533077 () Bool)

(assert (=> b!787029 (=> (not res!533077) (not e!437467))))

(declare-fun lt!350933 () SeekEntryResult!8089)

(declare-fun lt!350929 () SeekEntryResult!8089)

(assert (=> b!787029 (= res!533077 (= lt!350933 lt!350929))))

(declare-fun lt!350935 () array!42807)

(declare-fun lt!350930 () (_ BitVec 64))

(assert (=> b!787029 (= lt!350929 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350930 lt!350935 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787029 (= lt!350933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350930 mask!3328) lt!350930 lt!350935 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!787029 (= lt!350930 (select (store (arr!20492 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787029 (= lt!350935 (array!42808 (store (arr!20492 a!3186) i!1173 k0!2102) (size!20913 a!3186)))))

(declare-fun b!787030 () Bool)

(declare-fun e!437468 () Bool)

(declare-fun e!437469 () Bool)

(assert (=> b!787030 (= e!437468 e!437469)))

(declare-fun res!533071 () Bool)

(assert (=> b!787030 (=> res!533071 e!437469)))

(declare-fun lt!350925 () SeekEntryResult!8089)

(declare-fun lt!350936 () SeekEntryResult!8089)

(assert (=> b!787030 (= res!533071 (not (= lt!350925 lt!350936)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42807 (_ BitVec 32)) SeekEntryResult!8089)

(assert (=> b!787030 (= lt!350925 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20492 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787031 () Bool)

(declare-fun res!533073 () Bool)

(declare-fun e!437459 () Bool)

(assert (=> b!787031 (=> (not res!533073) (not e!437459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787031 (= res!533073 (validKeyInArray!0 k0!2102))))

(declare-fun b!787032 () Bool)

(assert (=> b!787032 (= e!437465 e!437463)))

(declare-fun res!533087 () Bool)

(assert (=> b!787032 (=> (not res!533087) (not e!437463))))

(assert (=> b!787032 (= res!533087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20492 a!3186) j!159) mask!3328) (select (arr!20492 a!3186) j!159) a!3186 mask!3328) lt!350927))))

(assert (=> b!787032 (= lt!350927 (Intermediate!8089 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787033 () Bool)

(declare-fun res!533083 () Bool)

(assert (=> b!787033 (=> (not res!533083) (not e!437463))))

(assert (=> b!787033 (= res!533083 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20492 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787034 () Bool)

(declare-datatypes ((Unit!27224 0))(
  ( (Unit!27225) )
))
(declare-fun e!437466 () Unit!27224)

(declare-fun Unit!27226 () Unit!27224)

(assert (=> b!787034 (= e!437466 Unit!27226)))

(assert (=> b!787034 false))

(declare-fun b!787035 () Bool)

(declare-fun res!533086 () Bool)

(assert (=> b!787035 (=> (not res!533086) (not e!437459))))

(assert (=> b!787035 (= res!533086 (validKeyInArray!0 (select (arr!20492 a!3186) j!159)))))

(declare-fun b!787036 () Bool)

(declare-fun res!533079 () Bool)

(declare-fun e!437461 () Bool)

(assert (=> b!787036 (=> (not res!533079) (not e!437461))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42807 (_ BitVec 32)) SeekEntryResult!8089)

(assert (=> b!787036 (= res!533079 (= (seekEntryOrOpen!0 lt!350930 lt!350935 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350930 lt!350935 mask!3328)))))

(declare-fun b!787037 () Bool)

(declare-fun res!533072 () Bool)

(assert (=> b!787037 (=> (not res!533072) (not e!437465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42807 (_ BitVec 32)) Bool)

(assert (=> b!787037 (= res!533072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787038 () Bool)

(declare-fun res!533078 () Bool)

(assert (=> b!787038 (=> (not res!533078) (not e!437465))))

(declare-datatypes ((List!14533 0))(
  ( (Nil!14530) (Cons!14529 (h!15652 (_ BitVec 64)) (t!20839 List!14533)) )
))
(declare-fun arrayNoDuplicates!0 (array!42807 (_ BitVec 32) List!14533) Bool)

(assert (=> b!787038 (= res!533078 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14530))))

(declare-fun b!787039 () Bool)

(declare-fun res!533076 () Bool)

(assert (=> b!787039 (=> (not res!533076) (not e!437459))))

(declare-fun arrayContainsKey!0 (array!42807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787039 (= res!533076 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!533082 () Bool)

(assert (=> start!67748 (=> (not res!533082) (not e!437459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67748 (= res!533082 (validMask!0 mask!3328))))

(assert (=> start!67748 e!437459))

(assert (=> start!67748 true))

(declare-fun array_inv!16375 (array!42807) Bool)

(assert (=> start!67748 (array_inv!16375 a!3186)))

(declare-fun b!787040 () Bool)

(declare-fun res!533080 () Bool)

(assert (=> b!787040 (=> (not res!533080) (not e!437459))))

(assert (=> b!787040 (= res!533080 (and (= (size!20913 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20913 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20913 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!437460 () Bool)

(declare-fun b!787041 () Bool)

(assert (=> b!787041 (= e!437460 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20492 a!3186) j!159) a!3186 mask!3328) lt!350936))))

(declare-fun b!787042 () Bool)

(declare-fun e!437470 () Bool)

(assert (=> b!787042 (= e!437469 e!437470)))

(declare-fun res!533084 () Bool)

(assert (=> b!787042 (=> res!533084 e!437470)))

(declare-fun lt!350931 () (_ BitVec 64))

(assert (=> b!787042 (= res!533084 (= lt!350931 lt!350930))))

(assert (=> b!787042 (= lt!350931 (select (store (arr!20492 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787043 () Bool)

(declare-fun lt!350926 () SeekEntryResult!8089)

(assert (=> b!787043 (= e!437461 (= lt!350926 lt!350925))))

(declare-fun b!787044 () Bool)

(assert (=> b!787044 (= e!437464 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20492 a!3186) j!159) a!3186 mask!3328) (Found!8089 j!159)))))

(declare-fun b!787045 () Bool)

(assert (=> b!787045 (= e!437470 true)))

(assert (=> b!787045 e!437461))

(declare-fun res!533070 () Bool)

(assert (=> b!787045 (=> (not res!533070) (not e!437461))))

(assert (=> b!787045 (= res!533070 (= lt!350931 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350932 () Unit!27224)

(assert (=> b!787045 (= lt!350932 e!437466)))

(declare-fun c!87387 () Bool)

(assert (=> b!787045 (= c!87387 (= lt!350931 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787046 () Bool)

(assert (=> b!787046 (= e!437467 (not e!437468))))

(declare-fun res!533074 () Bool)

(assert (=> b!787046 (=> res!533074 e!437468)))

(get-info :version)

(assert (=> b!787046 (= res!533074 (or (not ((_ is Intermediate!8089) lt!350929)) (bvslt x!1131 (x!65672 lt!350929)) (not (= x!1131 (x!65672 lt!350929))) (not (= index!1321 (index!34726 lt!350929)))))))

(assert (=> b!787046 e!437460))

(declare-fun res!533088 () Bool)

(assert (=> b!787046 (=> (not res!533088) (not e!437460))))

(assert (=> b!787046 (= res!533088 (= lt!350926 lt!350936))))

(assert (=> b!787046 (= lt!350936 (Found!8089 j!159))))

(assert (=> b!787046 (= lt!350926 (seekEntryOrOpen!0 (select (arr!20492 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!787046 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350928 () Unit!27224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27224)

(assert (=> b!787046 (= lt!350928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787047 () Bool)

(declare-fun res!533081 () Bool)

(assert (=> b!787047 (=> (not res!533081) (not e!437463))))

(assert (=> b!787047 (= res!533081 e!437464)))

(declare-fun c!87386 () Bool)

(assert (=> b!787047 (= c!87386 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787048 () Bool)

(declare-fun Unit!27227 () Unit!27224)

(assert (=> b!787048 (= e!437466 Unit!27227)))

(declare-fun b!787049 () Bool)

(assert (=> b!787049 (= e!437459 e!437465)))

(declare-fun res!533075 () Bool)

(assert (=> b!787049 (=> (not res!533075) (not e!437465))))

(declare-fun lt!350934 () SeekEntryResult!8089)

(assert (=> b!787049 (= res!533075 (or (= lt!350934 (MissingZero!8089 i!1173)) (= lt!350934 (MissingVacant!8089 i!1173))))))

(assert (=> b!787049 (= lt!350934 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!67748 res!533082) b!787040))

(assert (= (and b!787040 res!533080) b!787035))

(assert (= (and b!787035 res!533086) b!787031))

(assert (= (and b!787031 res!533073) b!787039))

(assert (= (and b!787039 res!533076) b!787049))

(assert (= (and b!787049 res!533075) b!787037))

(assert (= (and b!787037 res!533072) b!787038))

(assert (= (and b!787038 res!533078) b!787027))

(assert (= (and b!787027 res!533085) b!787032))

(assert (= (and b!787032 res!533087) b!787033))

(assert (= (and b!787033 res!533083) b!787047))

(assert (= (and b!787047 c!87386) b!787028))

(assert (= (and b!787047 (not c!87386)) b!787044))

(assert (= (and b!787047 res!533081) b!787029))

(assert (= (and b!787029 res!533077) b!787046))

(assert (= (and b!787046 res!533088) b!787041))

(assert (= (and b!787046 (not res!533074)) b!787030))

(assert (= (and b!787030 (not res!533071)) b!787042))

(assert (= (and b!787042 (not res!533084)) b!787045))

(assert (= (and b!787045 c!87387) b!787034))

(assert (= (and b!787045 (not c!87387)) b!787048))

(assert (= (and b!787045 res!533070) b!787036))

(assert (= (and b!787036 res!533079) b!787043))

(declare-fun m!728139 () Bool)

(assert (=> b!787028 m!728139))

(assert (=> b!787028 m!728139))

(declare-fun m!728141 () Bool)

(assert (=> b!787028 m!728141))

(declare-fun m!728143 () Bool)

(assert (=> b!787033 m!728143))

(declare-fun m!728145 () Bool)

(assert (=> b!787042 m!728145))

(declare-fun m!728147 () Bool)

(assert (=> b!787042 m!728147))

(declare-fun m!728149 () Bool)

(assert (=> b!787029 m!728149))

(declare-fun m!728151 () Bool)

(assert (=> b!787029 m!728151))

(declare-fun m!728153 () Bool)

(assert (=> b!787029 m!728153))

(assert (=> b!787029 m!728145))

(declare-fun m!728155 () Bool)

(assert (=> b!787029 m!728155))

(assert (=> b!787029 m!728151))

(declare-fun m!728157 () Bool)

(assert (=> b!787037 m!728157))

(assert (=> b!787041 m!728139))

(assert (=> b!787041 m!728139))

(declare-fun m!728159 () Bool)

(assert (=> b!787041 m!728159))

(declare-fun m!728161 () Bool)

(assert (=> b!787039 m!728161))

(declare-fun m!728163 () Bool)

(assert (=> b!787031 m!728163))

(assert (=> b!787032 m!728139))

(assert (=> b!787032 m!728139))

(declare-fun m!728165 () Bool)

(assert (=> b!787032 m!728165))

(assert (=> b!787032 m!728165))

(assert (=> b!787032 m!728139))

(declare-fun m!728167 () Bool)

(assert (=> b!787032 m!728167))

(assert (=> b!787035 m!728139))

(assert (=> b!787035 m!728139))

(declare-fun m!728169 () Bool)

(assert (=> b!787035 m!728169))

(declare-fun m!728171 () Bool)

(assert (=> start!67748 m!728171))

(declare-fun m!728173 () Bool)

(assert (=> start!67748 m!728173))

(assert (=> b!787046 m!728139))

(assert (=> b!787046 m!728139))

(declare-fun m!728175 () Bool)

(assert (=> b!787046 m!728175))

(declare-fun m!728177 () Bool)

(assert (=> b!787046 m!728177))

(declare-fun m!728179 () Bool)

(assert (=> b!787046 m!728179))

(assert (=> b!787030 m!728139))

(assert (=> b!787030 m!728139))

(declare-fun m!728181 () Bool)

(assert (=> b!787030 m!728181))

(assert (=> b!787044 m!728139))

(assert (=> b!787044 m!728139))

(assert (=> b!787044 m!728181))

(declare-fun m!728183 () Bool)

(assert (=> b!787049 m!728183))

(declare-fun m!728185 () Bool)

(assert (=> b!787036 m!728185))

(declare-fun m!728187 () Bool)

(assert (=> b!787036 m!728187))

(declare-fun m!728189 () Bool)

(assert (=> b!787038 m!728189))

(check-sat (not b!787030) (not b!787031) (not b!787028) (not b!787035) (not b!787041) (not b!787036) (not b!787049) (not b!787038) (not b!787032) (not b!787029) (not b!787037) (not b!787046) (not b!787039) (not start!67748) (not b!787044))
(check-sat)
