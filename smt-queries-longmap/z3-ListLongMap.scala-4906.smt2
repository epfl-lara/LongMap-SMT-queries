; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67682 () Bool)

(assert start!67682)

(declare-datatypes ((array!42722 0))(
  ( (array!42723 (arr!20449 (Array (_ BitVec 32) (_ BitVec 64))) (size!20870 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42722)

(declare-fun b!784241 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8049 0))(
  ( (MissingZero!8049 (index!34564 (_ BitVec 32))) (Found!8049 (index!34565 (_ BitVec 32))) (Intermediate!8049 (undefined!8861 Bool) (index!34566 (_ BitVec 32)) (x!65517 (_ BitVec 32))) (Undefined!8049) (MissingVacant!8049 (index!34567 (_ BitVec 32))) )
))
(declare-fun lt!349581 () SeekEntryResult!8049)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!436029 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42722 (_ BitVec 32)) SeekEntryResult!8049)

(assert (=> b!784241 (= e!436029 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20449 a!3186) j!159) a!3186 mask!3328) lt!349581))))

(declare-fun b!784242 () Bool)

(declare-fun e!436038 () Bool)

(declare-fun e!436040 () Bool)

(assert (=> b!784242 (= e!436038 e!436040)))

(declare-fun res!530679 () Bool)

(assert (=> b!784242 (=> (not res!530679) (not e!436040))))

(declare-fun lt!349585 () SeekEntryResult!8049)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784242 (= res!530679 (or (= lt!349585 (MissingZero!8049 i!1173)) (= lt!349585 (MissingVacant!8049 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42722 (_ BitVec 32)) SeekEntryResult!8049)

(assert (=> b!784242 (= lt!349585 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784243 () Bool)

(declare-fun e!436032 () Bool)

(assert (=> b!784243 (= e!436040 e!436032)))

(declare-fun res!530687 () Bool)

(assert (=> b!784243 (=> (not res!530687) (not e!436032))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784243 (= res!530687 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20449 a!3186) j!159) mask!3328) (select (arr!20449 a!3186) j!159) a!3186 mask!3328) lt!349581))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784243 (= lt!349581 (Intermediate!8049 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!530683 () Bool)

(assert (=> start!67682 (=> (not res!530683) (not e!436038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67682 (= res!530683 (validMask!0 mask!3328))))

(assert (=> start!67682 e!436038))

(assert (=> start!67682 true))

(declare-fun array_inv!16245 (array!42722) Bool)

(assert (=> start!67682 (array_inv!16245 a!3186)))

(declare-fun b!784244 () Bool)

(declare-fun e!436036 () Bool)

(assert (=> b!784244 (= e!436036 true)))

(declare-fun e!436037 () Bool)

(assert (=> b!784244 e!436037))

(declare-fun res!530676 () Bool)

(assert (=> b!784244 (=> (not res!530676) (not e!436037))))

(declare-fun lt!349589 () (_ BitVec 64))

(assert (=> b!784244 (= res!530676 (= lt!349589 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27084 0))(
  ( (Unit!27085) )
))
(declare-fun lt!349591 () Unit!27084)

(declare-fun e!436035 () Unit!27084)

(assert (=> b!784244 (= lt!349591 e!436035)))

(declare-fun c!87192 () Bool)

(assert (=> b!784244 (= c!87192 (= lt!349589 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784245 () Bool)

(declare-fun e!436031 () Bool)

(assert (=> b!784245 (= e!436031 e!436036)))

(declare-fun res!530686 () Bool)

(assert (=> b!784245 (=> res!530686 e!436036)))

(declare-fun lt!349586 () (_ BitVec 64))

(assert (=> b!784245 (= res!530686 (= lt!349589 lt!349586))))

(assert (=> b!784245 (= lt!349589 (select (store (arr!20449 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784246 () Bool)

(declare-fun e!436034 () Bool)

(assert (=> b!784246 (= e!436032 e!436034)))

(declare-fun res!530682 () Bool)

(assert (=> b!784246 (=> (not res!530682) (not e!436034))))

(declare-fun lt!349588 () SeekEntryResult!8049)

(declare-fun lt!349592 () SeekEntryResult!8049)

(assert (=> b!784246 (= res!530682 (= lt!349588 lt!349592))))

(declare-fun lt!349583 () array!42722)

(assert (=> b!784246 (= lt!349592 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349586 lt!349583 mask!3328))))

(assert (=> b!784246 (= lt!349588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349586 mask!3328) lt!349586 lt!349583 mask!3328))))

(assert (=> b!784246 (= lt!349586 (select (store (arr!20449 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784246 (= lt!349583 (array!42723 (store (arr!20449 a!3186) i!1173 k0!2102) (size!20870 a!3186)))))

(declare-fun b!784247 () Bool)

(declare-fun res!530689 () Bool)

(assert (=> b!784247 (=> (not res!530689) (not e!436040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42722 (_ BitVec 32)) Bool)

(assert (=> b!784247 (= res!530689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784248 () Bool)

(declare-fun Unit!27086 () Unit!27084)

(assert (=> b!784248 (= e!436035 Unit!27086)))

(declare-fun b!784249 () Bool)

(declare-fun res!530688 () Bool)

(assert (=> b!784249 (=> (not res!530688) (not e!436040))))

(assert (=> b!784249 (= res!530688 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20870 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20870 a!3186))))))

(declare-fun b!784250 () Bool)

(declare-fun e!436030 () Bool)

(declare-fun lt!349584 () SeekEntryResult!8049)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42722 (_ BitVec 32)) SeekEntryResult!8049)

(assert (=> b!784250 (= e!436030 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20449 a!3186) j!159) a!3186 mask!3328) lt!349584))))

(declare-fun b!784251 () Bool)

(declare-fun res!530681 () Bool)

(assert (=> b!784251 (=> (not res!530681) (not e!436040))))

(declare-datatypes ((List!14451 0))(
  ( (Nil!14448) (Cons!14447 (h!15570 (_ BitVec 64)) (t!20766 List!14451)) )
))
(declare-fun arrayNoDuplicates!0 (array!42722 (_ BitVec 32) List!14451) Bool)

(assert (=> b!784251 (= res!530681 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14448))))

(declare-fun b!784252 () Bool)

(assert (=> b!784252 (= e!436029 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20449 a!3186) j!159) a!3186 mask!3328) (Found!8049 j!159)))))

(declare-fun b!784253 () Bool)

(declare-fun res!530673 () Bool)

(assert (=> b!784253 (=> (not res!530673) (not e!436037))))

(assert (=> b!784253 (= res!530673 (= (seekEntryOrOpen!0 lt!349586 lt!349583 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349586 lt!349583 mask!3328)))))

(declare-fun b!784254 () Bool)

(declare-fun res!530678 () Bool)

(assert (=> b!784254 (=> (not res!530678) (not e!436038))))

(declare-fun arrayContainsKey!0 (array!42722 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784254 (= res!530678 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784255 () Bool)

(declare-fun e!436039 () Bool)

(assert (=> b!784255 (= e!436039 e!436031)))

(declare-fun res!530675 () Bool)

(assert (=> b!784255 (=> res!530675 e!436031)))

(declare-fun lt!349590 () SeekEntryResult!8049)

(assert (=> b!784255 (= res!530675 (not (= lt!349590 lt!349584)))))

(assert (=> b!784255 (= lt!349590 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20449 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784256 () Bool)

(declare-fun Unit!27087 () Unit!27084)

(assert (=> b!784256 (= e!436035 Unit!27087)))

(assert (=> b!784256 false))

(declare-fun b!784257 () Bool)

(assert (=> b!784257 (= e!436034 (not e!436039))))

(declare-fun res!530690 () Bool)

(assert (=> b!784257 (=> res!530690 e!436039)))

(get-info :version)

(assert (=> b!784257 (= res!530690 (or (not ((_ is Intermediate!8049) lt!349592)) (bvslt x!1131 (x!65517 lt!349592)) (not (= x!1131 (x!65517 lt!349592))) (not (= index!1321 (index!34566 lt!349592)))))))

(assert (=> b!784257 e!436030))

(declare-fun res!530680 () Bool)

(assert (=> b!784257 (=> (not res!530680) (not e!436030))))

(declare-fun lt!349582 () SeekEntryResult!8049)

(assert (=> b!784257 (= res!530680 (= lt!349582 lt!349584))))

(assert (=> b!784257 (= lt!349584 (Found!8049 j!159))))

(assert (=> b!784257 (= lt!349582 (seekEntryOrOpen!0 (select (arr!20449 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784257 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349587 () Unit!27084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42722 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27084)

(assert (=> b!784257 (= lt!349587 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784258 () Bool)

(assert (=> b!784258 (= e!436037 (= lt!349582 lt!349590))))

(declare-fun b!784259 () Bool)

(declare-fun res!530674 () Bool)

(assert (=> b!784259 (=> (not res!530674) (not e!436038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784259 (= res!530674 (validKeyInArray!0 (select (arr!20449 a!3186) j!159)))))

(declare-fun b!784260 () Bool)

(declare-fun res!530677 () Bool)

(assert (=> b!784260 (=> (not res!530677) (not e!436032))))

(assert (=> b!784260 (= res!530677 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20449 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784261 () Bool)

(declare-fun res!530684 () Bool)

(assert (=> b!784261 (=> (not res!530684) (not e!436032))))

(assert (=> b!784261 (= res!530684 e!436029)))

(declare-fun c!87193 () Bool)

(assert (=> b!784261 (= c!87193 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784262 () Bool)

(declare-fun res!530685 () Bool)

(assert (=> b!784262 (=> (not res!530685) (not e!436038))))

(assert (=> b!784262 (= res!530685 (and (= (size!20870 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20870 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20870 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784263 () Bool)

(declare-fun res!530672 () Bool)

(assert (=> b!784263 (=> (not res!530672) (not e!436038))))

(assert (=> b!784263 (= res!530672 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67682 res!530683) b!784262))

(assert (= (and b!784262 res!530685) b!784259))

(assert (= (and b!784259 res!530674) b!784263))

(assert (= (and b!784263 res!530672) b!784254))

(assert (= (and b!784254 res!530678) b!784242))

(assert (= (and b!784242 res!530679) b!784247))

(assert (= (and b!784247 res!530689) b!784251))

(assert (= (and b!784251 res!530681) b!784249))

(assert (= (and b!784249 res!530688) b!784243))

(assert (= (and b!784243 res!530687) b!784260))

(assert (= (and b!784260 res!530677) b!784261))

(assert (= (and b!784261 c!87193) b!784241))

(assert (= (and b!784261 (not c!87193)) b!784252))

(assert (= (and b!784261 res!530684) b!784246))

(assert (= (and b!784246 res!530682) b!784257))

(assert (= (and b!784257 res!530680) b!784250))

(assert (= (and b!784257 (not res!530690)) b!784255))

(assert (= (and b!784255 (not res!530675)) b!784245))

(assert (= (and b!784245 (not res!530686)) b!784244))

(assert (= (and b!784244 c!87192) b!784256))

(assert (= (and b!784244 (not c!87192)) b!784248))

(assert (= (and b!784244 res!530676) b!784253))

(assert (= (and b!784253 res!530673) b!784258))

(declare-fun m!726609 () Bool)

(assert (=> b!784243 m!726609))

(assert (=> b!784243 m!726609))

(declare-fun m!726611 () Bool)

(assert (=> b!784243 m!726611))

(assert (=> b!784243 m!726611))

(assert (=> b!784243 m!726609))

(declare-fun m!726613 () Bool)

(assert (=> b!784243 m!726613))

(assert (=> b!784252 m!726609))

(assert (=> b!784252 m!726609))

(declare-fun m!726615 () Bool)

(assert (=> b!784252 m!726615))

(assert (=> b!784241 m!726609))

(assert (=> b!784241 m!726609))

(declare-fun m!726617 () Bool)

(assert (=> b!784241 m!726617))

(declare-fun m!726619 () Bool)

(assert (=> b!784245 m!726619))

(declare-fun m!726621 () Bool)

(assert (=> b!784245 m!726621))

(declare-fun m!726623 () Bool)

(assert (=> b!784263 m!726623))

(assert (=> b!784259 m!726609))

(assert (=> b!784259 m!726609))

(declare-fun m!726625 () Bool)

(assert (=> b!784259 m!726625))

(declare-fun m!726627 () Bool)

(assert (=> b!784254 m!726627))

(declare-fun m!726629 () Bool)

(assert (=> b!784260 m!726629))

(assert (=> b!784257 m!726609))

(assert (=> b!784257 m!726609))

(declare-fun m!726631 () Bool)

(assert (=> b!784257 m!726631))

(declare-fun m!726633 () Bool)

(assert (=> b!784257 m!726633))

(declare-fun m!726635 () Bool)

(assert (=> b!784257 m!726635))

(declare-fun m!726637 () Bool)

(assert (=> b!784242 m!726637))

(declare-fun m!726639 () Bool)

(assert (=> b!784253 m!726639))

(declare-fun m!726641 () Bool)

(assert (=> b!784253 m!726641))

(declare-fun m!726643 () Bool)

(assert (=> start!67682 m!726643))

(declare-fun m!726645 () Bool)

(assert (=> start!67682 m!726645))

(declare-fun m!726647 () Bool)

(assert (=> b!784247 m!726647))

(assert (=> b!784250 m!726609))

(assert (=> b!784250 m!726609))

(declare-fun m!726649 () Bool)

(assert (=> b!784250 m!726649))

(assert (=> b!784255 m!726609))

(assert (=> b!784255 m!726609))

(assert (=> b!784255 m!726615))

(declare-fun m!726651 () Bool)

(assert (=> b!784246 m!726651))

(declare-fun m!726653 () Bool)

(assert (=> b!784246 m!726653))

(assert (=> b!784246 m!726619))

(declare-fun m!726655 () Bool)

(assert (=> b!784246 m!726655))

(assert (=> b!784246 m!726651))

(declare-fun m!726657 () Bool)

(assert (=> b!784246 m!726657))

(declare-fun m!726659 () Bool)

(assert (=> b!784251 m!726659))

(check-sat (not b!784259) (not b!784251) (not b!784246) (not b!784253) (not b!784254) (not start!67682) (not b!784255) (not b!784252) (not b!784263) (not b!784257) (not b!784242) (not b!784241) (not b!784250) (not b!784247) (not b!784243))
(check-sat)
