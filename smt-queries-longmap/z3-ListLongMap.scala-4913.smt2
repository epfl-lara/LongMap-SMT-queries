; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67700 () Bool)

(assert start!67700)

(declare-fun b!785371 () Bool)

(declare-datatypes ((Unit!27128 0))(
  ( (Unit!27129) )
))
(declare-fun e!436604 () Unit!27128)

(declare-fun Unit!27130 () Unit!27128)

(assert (=> b!785371 (= e!436604 Unit!27130)))

(declare-fun b!785373 () Bool)

(declare-fun res!531719 () Bool)

(declare-fun e!436599 () Bool)

(assert (=> b!785373 (=> (not res!531719) (not e!436599))))

(declare-datatypes ((array!42759 0))(
  ( (array!42760 (arr!20468 (Array (_ BitVec 32) (_ BitVec 64))) (size!20889 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42759)

(declare-datatypes ((List!14509 0))(
  ( (Nil!14506) (Cons!14505 (h!15628 (_ BitVec 64)) (t!20815 List!14509)) )
))
(declare-fun arrayNoDuplicates!0 (array!42759 (_ BitVec 32) List!14509) Bool)

(assert (=> b!785373 (= res!531719 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14506))))

(declare-fun b!785374 () Bool)

(declare-fun res!531720 () Bool)

(declare-fun e!436605 () Bool)

(assert (=> b!785374 (=> (not res!531720) (not e!436605))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785374 (= res!531720 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20468 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785375 () Bool)

(declare-fun e!436603 () Bool)

(declare-fun e!436602 () Bool)

(assert (=> b!785375 (= e!436603 e!436602)))

(declare-fun res!531716 () Bool)

(assert (=> b!785375 (=> res!531716 e!436602)))

(declare-fun lt!350066 () (_ BitVec 64))

(declare-fun lt!350070 () (_ BitVec 64))

(assert (=> b!785375 (= res!531716 (= lt!350066 lt!350070))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!785375 (= lt!350066 (select (store (arr!20468 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785376 () Bool)

(declare-fun e!436598 () Bool)

(assert (=> b!785376 (= e!436598 e!436603)))

(declare-fun res!531702 () Bool)

(assert (=> b!785376 (=> res!531702 e!436603)))

(declare-datatypes ((SeekEntryResult!8065 0))(
  ( (MissingZero!8065 (index!34628 (_ BitVec 32))) (Found!8065 (index!34629 (_ BitVec 32))) (Intermediate!8065 (undefined!8877 Bool) (index!34630 (_ BitVec 32)) (x!65584 (_ BitVec 32))) (Undefined!8065) (MissingVacant!8065 (index!34631 (_ BitVec 32))) )
))
(declare-fun lt!350069 () SeekEntryResult!8065)

(declare-fun lt!350065 () SeekEntryResult!8065)

(assert (=> b!785376 (= res!531702 (not (= lt!350069 lt!350065)))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42759 (_ BitVec 32)) SeekEntryResult!8065)

(assert (=> b!785376 (= lt!350069 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20468 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785377 () Bool)

(declare-fun res!531713 () Bool)

(assert (=> b!785377 (=> (not res!531713) (not e!436605))))

(declare-fun e!436596 () Bool)

(assert (=> b!785377 (= res!531713 e!436596)))

(declare-fun c!87243 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785377 (= c!87243 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!350071 () SeekEntryResult!8065)

(declare-fun b!785378 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42759 (_ BitVec 32)) SeekEntryResult!8065)

(assert (=> b!785378 (= e!436596 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20468 a!3186) j!159) a!3186 mask!3328) lt!350071))))

(declare-fun b!785379 () Bool)

(declare-fun res!531706 () Bool)

(declare-fun e!436597 () Bool)

(assert (=> b!785379 (=> (not res!531706) (not e!436597))))

(declare-fun lt!350062 () array!42759)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42759 (_ BitVec 32)) SeekEntryResult!8065)

(assert (=> b!785379 (= res!531706 (= (seekEntryOrOpen!0 lt!350070 lt!350062 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350070 lt!350062 mask!3328)))))

(declare-fun b!785380 () Bool)

(declare-fun e!436606 () Bool)

(assert (=> b!785380 (= e!436606 (not e!436598))))

(declare-fun res!531718 () Bool)

(assert (=> b!785380 (=> res!531718 e!436598)))

(declare-fun lt!350068 () SeekEntryResult!8065)

(get-info :version)

(assert (=> b!785380 (= res!531718 (or (not ((_ is Intermediate!8065) lt!350068)) (bvslt x!1131 (x!65584 lt!350068)) (not (= x!1131 (x!65584 lt!350068))) (not (= index!1321 (index!34630 lt!350068)))))))

(declare-fun e!436595 () Bool)

(assert (=> b!785380 e!436595))

(declare-fun res!531717 () Bool)

(assert (=> b!785380 (=> (not res!531717) (not e!436595))))

(declare-fun lt!350072 () SeekEntryResult!8065)

(assert (=> b!785380 (= res!531717 (= lt!350072 lt!350065))))

(assert (=> b!785380 (= lt!350065 (Found!8065 j!159))))

(assert (=> b!785380 (= lt!350072 (seekEntryOrOpen!0 (select (arr!20468 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42759 (_ BitVec 32)) Bool)

(assert (=> b!785380 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350061 () Unit!27128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27128)

(assert (=> b!785380 (= lt!350061 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785381 () Bool)

(declare-fun Unit!27131 () Unit!27128)

(assert (=> b!785381 (= e!436604 Unit!27131)))

(assert (=> b!785381 false))

(declare-fun res!531704 () Bool)

(declare-fun e!436600 () Bool)

(assert (=> start!67700 (=> (not res!531704) (not e!436600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67700 (= res!531704 (validMask!0 mask!3328))))

(assert (=> start!67700 e!436600))

(assert (=> start!67700 true))

(declare-fun array_inv!16351 (array!42759) Bool)

(assert (=> start!67700 (array_inv!16351 a!3186)))

(declare-fun b!785372 () Bool)

(assert (=> b!785372 (= e!436599 e!436605)))

(declare-fun res!531710 () Bool)

(assert (=> b!785372 (=> (not res!531710) (not e!436605))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785372 (= res!531710 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20468 a!3186) j!159) mask!3328) (select (arr!20468 a!3186) j!159) a!3186 mask!3328) lt!350071))))

(assert (=> b!785372 (= lt!350071 (Intermediate!8065 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785382 () Bool)

(assert (=> b!785382 (= e!436605 e!436606)))

(declare-fun res!531709 () Bool)

(assert (=> b!785382 (=> (not res!531709) (not e!436606))))

(declare-fun lt!350063 () SeekEntryResult!8065)

(assert (=> b!785382 (= res!531709 (= lt!350063 lt!350068))))

(assert (=> b!785382 (= lt!350068 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350070 lt!350062 mask!3328))))

(assert (=> b!785382 (= lt!350063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350070 mask!3328) lt!350070 lt!350062 mask!3328))))

(assert (=> b!785382 (= lt!350070 (select (store (arr!20468 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785382 (= lt!350062 (array!42760 (store (arr!20468 a!3186) i!1173 k0!2102) (size!20889 a!3186)))))

(declare-fun b!785383 () Bool)

(assert (=> b!785383 (= e!436597 (= lt!350072 lt!350069))))

(declare-fun b!785384 () Bool)

(assert (=> b!785384 (= e!436602 true)))

(assert (=> b!785384 e!436597))

(declare-fun res!531708 () Bool)

(assert (=> b!785384 (=> (not res!531708) (not e!436597))))

(assert (=> b!785384 (= res!531708 (= lt!350066 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350067 () Unit!27128)

(assert (=> b!785384 (= lt!350067 e!436604)))

(declare-fun c!87242 () Bool)

(assert (=> b!785384 (= c!87242 (= lt!350066 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785385 () Bool)

(declare-fun res!531715 () Bool)

(assert (=> b!785385 (=> (not res!531715) (not e!436600))))

(declare-fun arrayContainsKey!0 (array!42759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785385 (= res!531715 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785386 () Bool)

(declare-fun res!531711 () Bool)

(assert (=> b!785386 (=> (not res!531711) (not e!436599))))

(assert (=> b!785386 (= res!531711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785387 () Bool)

(assert (=> b!785387 (= e!436600 e!436599)))

(declare-fun res!531714 () Bool)

(assert (=> b!785387 (=> (not res!531714) (not e!436599))))

(declare-fun lt!350064 () SeekEntryResult!8065)

(assert (=> b!785387 (= res!531714 (or (= lt!350064 (MissingZero!8065 i!1173)) (= lt!350064 (MissingVacant!8065 i!1173))))))

(assert (=> b!785387 (= lt!350064 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!785388 () Bool)

(assert (=> b!785388 (= e!436595 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20468 a!3186) j!159) a!3186 mask!3328) lt!350065))))

(declare-fun b!785389 () Bool)

(declare-fun res!531707 () Bool)

(assert (=> b!785389 (=> (not res!531707) (not e!436600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785389 (= res!531707 (validKeyInArray!0 k0!2102))))

(declare-fun b!785390 () Bool)

(declare-fun res!531712 () Bool)

(assert (=> b!785390 (=> (not res!531712) (not e!436599))))

(assert (=> b!785390 (= res!531712 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20889 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20889 a!3186))))))

(declare-fun b!785391 () Bool)

(declare-fun res!531705 () Bool)

(assert (=> b!785391 (=> (not res!531705) (not e!436600))))

(assert (=> b!785391 (= res!531705 (validKeyInArray!0 (select (arr!20468 a!3186) j!159)))))

(declare-fun b!785392 () Bool)

(assert (=> b!785392 (= e!436596 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20468 a!3186) j!159) a!3186 mask!3328) (Found!8065 j!159)))))

(declare-fun b!785393 () Bool)

(declare-fun res!531703 () Bool)

(assert (=> b!785393 (=> (not res!531703) (not e!436600))))

(assert (=> b!785393 (= res!531703 (and (= (size!20889 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20889 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20889 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67700 res!531704) b!785393))

(assert (= (and b!785393 res!531703) b!785391))

(assert (= (and b!785391 res!531705) b!785389))

(assert (= (and b!785389 res!531707) b!785385))

(assert (= (and b!785385 res!531715) b!785387))

(assert (= (and b!785387 res!531714) b!785386))

(assert (= (and b!785386 res!531711) b!785373))

(assert (= (and b!785373 res!531719) b!785390))

(assert (= (and b!785390 res!531712) b!785372))

(assert (= (and b!785372 res!531710) b!785374))

(assert (= (and b!785374 res!531720) b!785377))

(assert (= (and b!785377 c!87243) b!785378))

(assert (= (and b!785377 (not c!87243)) b!785392))

(assert (= (and b!785377 res!531713) b!785382))

(assert (= (and b!785382 res!531709) b!785380))

(assert (= (and b!785380 res!531717) b!785388))

(assert (= (and b!785380 (not res!531718)) b!785376))

(assert (= (and b!785376 (not res!531702)) b!785375))

(assert (= (and b!785375 (not res!531716)) b!785384))

(assert (= (and b!785384 c!87242) b!785381))

(assert (= (and b!785384 (not c!87242)) b!785371))

(assert (= (and b!785384 res!531708) b!785379))

(assert (= (and b!785379 res!531706) b!785383))

(declare-fun m!726891 () Bool)

(assert (=> b!785380 m!726891))

(assert (=> b!785380 m!726891))

(declare-fun m!726893 () Bool)

(assert (=> b!785380 m!726893))

(declare-fun m!726895 () Bool)

(assert (=> b!785380 m!726895))

(declare-fun m!726897 () Bool)

(assert (=> b!785380 m!726897))

(declare-fun m!726899 () Bool)

(assert (=> b!785373 m!726899))

(declare-fun m!726901 () Bool)

(assert (=> b!785375 m!726901))

(declare-fun m!726903 () Bool)

(assert (=> b!785375 m!726903))

(declare-fun m!726905 () Bool)

(assert (=> start!67700 m!726905))

(declare-fun m!726907 () Bool)

(assert (=> start!67700 m!726907))

(declare-fun m!726909 () Bool)

(assert (=> b!785374 m!726909))

(assert (=> b!785376 m!726891))

(assert (=> b!785376 m!726891))

(declare-fun m!726911 () Bool)

(assert (=> b!785376 m!726911))

(declare-fun m!726913 () Bool)

(assert (=> b!785379 m!726913))

(declare-fun m!726915 () Bool)

(assert (=> b!785379 m!726915))

(declare-fun m!726917 () Bool)

(assert (=> b!785389 m!726917))

(assert (=> b!785382 m!726901))

(declare-fun m!726919 () Bool)

(assert (=> b!785382 m!726919))

(declare-fun m!726921 () Bool)

(assert (=> b!785382 m!726921))

(declare-fun m!726923 () Bool)

(assert (=> b!785382 m!726923))

(assert (=> b!785382 m!726919))

(declare-fun m!726925 () Bool)

(assert (=> b!785382 m!726925))

(declare-fun m!726927 () Bool)

(assert (=> b!785387 m!726927))

(assert (=> b!785388 m!726891))

(assert (=> b!785388 m!726891))

(declare-fun m!726929 () Bool)

(assert (=> b!785388 m!726929))

(assert (=> b!785391 m!726891))

(assert (=> b!785391 m!726891))

(declare-fun m!726931 () Bool)

(assert (=> b!785391 m!726931))

(declare-fun m!726933 () Bool)

(assert (=> b!785385 m!726933))

(assert (=> b!785372 m!726891))

(assert (=> b!785372 m!726891))

(declare-fun m!726935 () Bool)

(assert (=> b!785372 m!726935))

(assert (=> b!785372 m!726935))

(assert (=> b!785372 m!726891))

(declare-fun m!726937 () Bool)

(assert (=> b!785372 m!726937))

(assert (=> b!785378 m!726891))

(assert (=> b!785378 m!726891))

(declare-fun m!726939 () Bool)

(assert (=> b!785378 m!726939))

(assert (=> b!785392 m!726891))

(assert (=> b!785392 m!726891))

(assert (=> b!785392 m!726911))

(declare-fun m!726941 () Bool)

(assert (=> b!785386 m!726941))

(check-sat (not start!67700) (not b!785376) (not b!785387) (not b!785378) (not b!785392) (not b!785379) (not b!785386) (not b!785391) (not b!785382) (not b!785389) (not b!785380) (not b!785388) (not b!785373) (not b!785385) (not b!785372))
(check-sat)
