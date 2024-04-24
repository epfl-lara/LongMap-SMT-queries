; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67882 () Bool)

(assert start!67882)

(declare-fun b!787715 () Bool)

(declare-fun res!533288 () Bool)

(declare-fun e!437921 () Bool)

(assert (=> b!787715 (=> (not res!533288) (not e!437921))))

(declare-datatypes ((array!42802 0))(
  ( (array!42803 (arr!20485 (Array (_ BitVec 32) (_ BitVec 64))) (size!20905 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42802)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42802 (_ BitVec 32)) Bool)

(assert (=> b!787715 (= res!533288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787716 () Bool)

(declare-fun res!533296 () Bool)

(declare-fun e!437926 () Bool)

(assert (=> b!787716 (=> (not res!533296) (not e!437926))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787716 (= res!533296 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787717 () Bool)

(declare-fun res!533286 () Bool)

(declare-fun e!437925 () Bool)

(assert (=> b!787717 (=> (not res!533286) (not e!437925))))

(declare-fun e!437930 () Bool)

(assert (=> b!787717 (= res!533286 e!437930)))

(declare-fun c!87629 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787717 (= c!87629 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787719 () Bool)

(declare-fun res!533298 () Bool)

(assert (=> b!787719 (=> (not res!533298) (not e!437921))))

(declare-datatypes ((List!14394 0))(
  ( (Nil!14391) (Cons!14390 (h!15519 (_ BitVec 64)) (t!20701 List!14394)) )
))
(declare-fun arrayNoDuplicates!0 (array!42802 (_ BitVec 32) List!14394) Bool)

(assert (=> b!787719 (= res!533298 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14391))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8041 0))(
  ( (MissingZero!8041 (index!34532 (_ BitVec 32))) (Found!8041 (index!34533 (_ BitVec 32))) (Intermediate!8041 (undefined!8853 Bool) (index!34534 (_ BitVec 32)) (x!65632 (_ BitVec 32))) (Undefined!8041) (MissingVacant!8041 (index!34535 (_ BitVec 32))) )
))
(declare-fun lt!351339 () SeekEntryResult!8041)

(declare-fun b!787720 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42802 (_ BitVec 32)) SeekEntryResult!8041)

(assert (=> b!787720 (= e!437930 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20485 a!3186) j!159) a!3186 mask!3328) lt!351339))))

(declare-fun b!787721 () Bool)

(declare-fun res!533294 () Bool)

(assert (=> b!787721 (=> (not res!533294) (not e!437925))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787721 (= res!533294 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20485 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787722 () Bool)

(declare-fun res!533285 () Bool)

(assert (=> b!787722 (=> (not res!533285) (not e!437926))))

(assert (=> b!787722 (= res!533285 (and (= (size!20905 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20905 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20905 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787723 () Bool)

(declare-fun e!437932 () Bool)

(declare-fun e!437931 () Bool)

(assert (=> b!787723 (= e!437932 (not e!437931))))

(declare-fun res!533291 () Bool)

(assert (=> b!787723 (=> res!533291 e!437931)))

(declare-fun lt!351340 () SeekEntryResult!8041)

(get-info :version)

(assert (=> b!787723 (= res!533291 (or (not ((_ is Intermediate!8041) lt!351340)) (bvslt x!1131 (x!65632 lt!351340)) (not (= x!1131 (x!65632 lt!351340))) (not (= index!1321 (index!34534 lt!351340)))))))

(declare-fun e!437927 () Bool)

(assert (=> b!787723 e!437927))

(declare-fun res!533297 () Bool)

(assert (=> b!787723 (=> (not res!533297) (not e!437927))))

(declare-fun lt!351336 () SeekEntryResult!8041)

(declare-fun lt!351337 () SeekEntryResult!8041)

(assert (=> b!787723 (= res!533297 (= lt!351336 lt!351337))))

(assert (=> b!787723 (= lt!351337 (Found!8041 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42802 (_ BitVec 32)) SeekEntryResult!8041)

(assert (=> b!787723 (= lt!351336 (seekEntryOrOpen!0 (select (arr!20485 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!787723 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27229 0))(
  ( (Unit!27230) )
))
(declare-fun lt!351333 () Unit!27229)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27229)

(assert (=> b!787723 (= lt!351333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787724 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42802 (_ BitVec 32)) SeekEntryResult!8041)

(assert (=> b!787724 (= e!437930 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20485 a!3186) j!159) a!3186 mask!3328) (Found!8041 j!159)))))

(declare-fun b!787725 () Bool)

(assert (=> b!787725 (= e!437925 e!437932)))

(declare-fun res!533295 () Bool)

(assert (=> b!787725 (=> (not res!533295) (not e!437932))))

(declare-fun lt!351335 () SeekEntryResult!8041)

(assert (=> b!787725 (= res!533295 (= lt!351335 lt!351340))))

(declare-fun lt!351332 () (_ BitVec 64))

(declare-fun lt!351338 () array!42802)

(assert (=> b!787725 (= lt!351340 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351332 lt!351338 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787725 (= lt!351335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351332 mask!3328) lt!351332 lt!351338 mask!3328))))

(assert (=> b!787725 (= lt!351332 (select (store (arr!20485 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787725 (= lt!351338 (array!42803 (store (arr!20485 a!3186) i!1173 k0!2102) (size!20905 a!3186)))))

(declare-fun b!787726 () Bool)

(declare-fun e!437924 () Unit!27229)

(declare-fun Unit!27231 () Unit!27229)

(assert (=> b!787726 (= e!437924 Unit!27231)))

(assert (=> b!787726 false))

(declare-fun b!787727 () Bool)

(declare-fun res!533289 () Bool)

(declare-fun e!437928 () Bool)

(assert (=> b!787727 (=> (not res!533289) (not e!437928))))

(assert (=> b!787727 (= res!533289 (= (seekEntryOrOpen!0 lt!351332 lt!351338 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351332 lt!351338 mask!3328)))))

(declare-fun b!787728 () Bool)

(declare-fun e!437923 () Bool)

(assert (=> b!787728 (= e!437923 true)))

(assert (=> b!787728 e!437928))

(declare-fun res!533282 () Bool)

(assert (=> b!787728 (=> (not res!533282) (not e!437928))))

(declare-fun lt!351329 () (_ BitVec 64))

(assert (=> b!787728 (= res!533282 (= lt!351329 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351334 () Unit!27229)

(assert (=> b!787728 (= lt!351334 e!437924)))

(declare-fun c!87628 () Bool)

(assert (=> b!787728 (= c!87628 (= lt!351329 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787718 () Bool)

(declare-fun e!437929 () Bool)

(assert (=> b!787718 (= e!437931 e!437929)))

(declare-fun res!533292 () Bool)

(assert (=> b!787718 (=> res!533292 e!437929)))

(declare-fun lt!351330 () SeekEntryResult!8041)

(assert (=> b!787718 (= res!533292 (not (= lt!351330 lt!351337)))))

(assert (=> b!787718 (= lt!351330 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20485 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!533284 () Bool)

(assert (=> start!67882 (=> (not res!533284) (not e!437926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67882 (= res!533284 (validMask!0 mask!3328))))

(assert (=> start!67882 e!437926))

(assert (=> start!67882 true))

(declare-fun array_inv!16344 (array!42802) Bool)

(assert (=> start!67882 (array_inv!16344 a!3186)))

(declare-fun b!787729 () Bool)

(assert (=> b!787729 (= e!437929 e!437923)))

(declare-fun res!533293 () Bool)

(assert (=> b!787729 (=> res!533293 e!437923)))

(assert (=> b!787729 (= res!533293 (= lt!351329 lt!351332))))

(assert (=> b!787729 (= lt!351329 (select (store (arr!20485 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787730 () Bool)

(declare-fun Unit!27232 () Unit!27229)

(assert (=> b!787730 (= e!437924 Unit!27232)))

(declare-fun b!787731 () Bool)

(declare-fun res!533287 () Bool)

(assert (=> b!787731 (=> (not res!533287) (not e!437921))))

(assert (=> b!787731 (= res!533287 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20905 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20905 a!3186))))))

(declare-fun b!787732 () Bool)

(assert (=> b!787732 (= e!437926 e!437921)))

(declare-fun res!533281 () Bool)

(assert (=> b!787732 (=> (not res!533281) (not e!437921))))

(declare-fun lt!351331 () SeekEntryResult!8041)

(assert (=> b!787732 (= res!533281 (or (= lt!351331 (MissingZero!8041 i!1173)) (= lt!351331 (MissingVacant!8041 i!1173))))))

(assert (=> b!787732 (= lt!351331 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787733 () Bool)

(assert (=> b!787733 (= e!437928 (= lt!351336 lt!351330))))

(declare-fun b!787734 () Bool)

(declare-fun res!533283 () Bool)

(assert (=> b!787734 (=> (not res!533283) (not e!437926))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787734 (= res!533283 (validKeyInArray!0 k0!2102))))

(declare-fun b!787735 () Bool)

(assert (=> b!787735 (= e!437927 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20485 a!3186) j!159) a!3186 mask!3328) lt!351337))))

(declare-fun b!787736 () Bool)

(assert (=> b!787736 (= e!437921 e!437925)))

(declare-fun res!533290 () Bool)

(assert (=> b!787736 (=> (not res!533290) (not e!437925))))

(assert (=> b!787736 (= res!533290 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20485 a!3186) j!159) mask!3328) (select (arr!20485 a!3186) j!159) a!3186 mask!3328) lt!351339))))

(assert (=> b!787736 (= lt!351339 (Intermediate!8041 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787737 () Bool)

(declare-fun res!533280 () Bool)

(assert (=> b!787737 (=> (not res!533280) (not e!437926))))

(assert (=> b!787737 (= res!533280 (validKeyInArray!0 (select (arr!20485 a!3186) j!159)))))

(assert (= (and start!67882 res!533284) b!787722))

(assert (= (and b!787722 res!533285) b!787737))

(assert (= (and b!787737 res!533280) b!787734))

(assert (= (and b!787734 res!533283) b!787716))

(assert (= (and b!787716 res!533296) b!787732))

(assert (= (and b!787732 res!533281) b!787715))

(assert (= (and b!787715 res!533288) b!787719))

(assert (= (and b!787719 res!533298) b!787731))

(assert (= (and b!787731 res!533287) b!787736))

(assert (= (and b!787736 res!533290) b!787721))

(assert (= (and b!787721 res!533294) b!787717))

(assert (= (and b!787717 c!87629) b!787720))

(assert (= (and b!787717 (not c!87629)) b!787724))

(assert (= (and b!787717 res!533286) b!787725))

(assert (= (and b!787725 res!533295) b!787723))

(assert (= (and b!787723 res!533297) b!787735))

(assert (= (and b!787723 (not res!533291)) b!787718))

(assert (= (and b!787718 (not res!533292)) b!787729))

(assert (= (and b!787729 (not res!533293)) b!787728))

(assert (= (and b!787728 c!87628) b!787726))

(assert (= (and b!787728 (not c!87628)) b!787730))

(assert (= (and b!787728 res!533282) b!787727))

(assert (= (and b!787727 res!533289) b!787733))

(declare-fun m!729803 () Bool)

(assert (=> b!787715 m!729803))

(declare-fun m!729805 () Bool)

(assert (=> b!787721 m!729805))

(declare-fun m!729807 () Bool)

(assert (=> b!787718 m!729807))

(assert (=> b!787718 m!729807))

(declare-fun m!729809 () Bool)

(assert (=> b!787718 m!729809))

(declare-fun m!729811 () Bool)

(assert (=> b!787719 m!729811))

(declare-fun m!729813 () Bool)

(assert (=> b!787729 m!729813))

(declare-fun m!729815 () Bool)

(assert (=> b!787729 m!729815))

(assert (=> b!787736 m!729807))

(assert (=> b!787736 m!729807))

(declare-fun m!729817 () Bool)

(assert (=> b!787736 m!729817))

(assert (=> b!787736 m!729817))

(assert (=> b!787736 m!729807))

(declare-fun m!729819 () Bool)

(assert (=> b!787736 m!729819))

(declare-fun m!729821 () Bool)

(assert (=> b!787716 m!729821))

(declare-fun m!729823 () Bool)

(assert (=> b!787734 m!729823))

(declare-fun m!729825 () Bool)

(assert (=> b!787725 m!729825))

(declare-fun m!729827 () Bool)

(assert (=> b!787725 m!729827))

(assert (=> b!787725 m!729813))

(assert (=> b!787725 m!729825))

(declare-fun m!729829 () Bool)

(assert (=> b!787725 m!729829))

(declare-fun m!729831 () Bool)

(assert (=> b!787725 m!729831))

(assert (=> b!787724 m!729807))

(assert (=> b!787724 m!729807))

(assert (=> b!787724 m!729809))

(assert (=> b!787723 m!729807))

(assert (=> b!787723 m!729807))

(declare-fun m!729833 () Bool)

(assert (=> b!787723 m!729833))

(declare-fun m!729835 () Bool)

(assert (=> b!787723 m!729835))

(declare-fun m!729837 () Bool)

(assert (=> b!787723 m!729837))

(assert (=> b!787737 m!729807))

(assert (=> b!787737 m!729807))

(declare-fun m!729839 () Bool)

(assert (=> b!787737 m!729839))

(assert (=> b!787735 m!729807))

(assert (=> b!787735 m!729807))

(declare-fun m!729841 () Bool)

(assert (=> b!787735 m!729841))

(declare-fun m!729843 () Bool)

(assert (=> b!787732 m!729843))

(declare-fun m!729845 () Bool)

(assert (=> start!67882 m!729845))

(declare-fun m!729847 () Bool)

(assert (=> start!67882 m!729847))

(declare-fun m!729849 () Bool)

(assert (=> b!787727 m!729849))

(declare-fun m!729851 () Bool)

(assert (=> b!787727 m!729851))

(assert (=> b!787720 m!729807))

(assert (=> b!787720 m!729807))

(declare-fun m!729853 () Bool)

(assert (=> b!787720 m!729853))

(check-sat (not b!787727) (not b!787735) (not b!787736) (not b!787715) (not b!787734) (not b!787732) (not start!67882) (not b!787719) (not b!787716) (not b!787737) (not b!787720) (not b!787724) (not b!787723) (not b!787718) (not b!787725))
(check-sat)
