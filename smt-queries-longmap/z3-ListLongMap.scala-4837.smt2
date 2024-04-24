; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66686 () Bool)

(assert start!66686)

(declare-fun b!767697 () Bool)

(declare-fun e!427569 () Bool)

(declare-fun e!427568 () Bool)

(assert (=> b!767697 (= e!427569 e!427568)))

(declare-fun res!519127 () Bool)

(assert (=> b!767697 (=> (not res!519127) (not e!427568))))

(declare-datatypes ((array!42274 0))(
  ( (array!42275 (arr!20236 (Array (_ BitVec 32) (_ BitVec 64))) (size!20656 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42274)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7792 0))(
  ( (MissingZero!7792 (index!33536 (_ BitVec 32))) (Found!7792 (index!33537 (_ BitVec 32))) (Intermediate!7792 (undefined!8604 Bool) (index!33538 (_ BitVec 32)) (x!64613 (_ BitVec 32))) (Undefined!7792) (MissingVacant!7792 (index!33539 (_ BitVec 32))) )
))
(declare-fun lt!341476 () SeekEntryResult!7792)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42274 (_ BitVec 32)) SeekEntryResult!7792)

(assert (=> b!767697 (= res!519127 (= (seekEntryOrOpen!0 (select (arr!20236 a!3186) j!159) a!3186 mask!3328) lt!341476))))

(assert (=> b!767697 (= lt!341476 (Found!7792 j!159))))

(declare-fun b!767698 () Bool)

(declare-fun res!519134 () Bool)

(declare-fun e!427567 () Bool)

(assert (=> b!767698 (=> (not res!519134) (not e!427567))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767698 (= res!519134 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767699 () Bool)

(declare-fun res!519129 () Bool)

(assert (=> b!767699 (=> (not res!519129) (not e!427567))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767699 (= res!519129 (and (= (size!20656 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20656 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20656 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767700 () Bool)

(declare-fun res!519130 () Bool)

(declare-fun e!427566 () Bool)

(assert (=> b!767700 (=> (not res!519130) (not e!427566))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767700 (= res!519130 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20656 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20656 a!3186))))))

(declare-fun b!767701 () Bool)

(declare-fun res!519133 () Bool)

(assert (=> b!767701 (=> (not res!519133) (not e!427566))))

(declare-datatypes ((List!14145 0))(
  ( (Nil!14142) (Cons!14141 (h!15240 (_ BitVec 64)) (t!20452 List!14145)) )
))
(declare-fun arrayNoDuplicates!0 (array!42274 (_ BitVec 32) List!14145) Bool)

(assert (=> b!767701 (= res!519133 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14142))))

(declare-fun b!767702 () Bool)

(declare-fun e!427572 () Bool)

(declare-fun e!427571 () Bool)

(assert (=> b!767702 (= e!427572 (not e!427571))))

(declare-fun res!519140 () Bool)

(assert (=> b!767702 (=> res!519140 e!427571)))

(declare-fun lt!341471 () SeekEntryResult!7792)

(get-info :version)

(assert (=> b!767702 (= res!519140 (or (not ((_ is Intermediate!7792) lt!341471)) (bvsge x!1131 (x!64613 lt!341471))))))

(assert (=> b!767702 e!427569))

(declare-fun res!519132 () Bool)

(assert (=> b!767702 (=> (not res!519132) (not e!427569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42274 (_ BitVec 32)) Bool)

(assert (=> b!767702 (= res!519132 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26389 0))(
  ( (Unit!26390) )
))
(declare-fun lt!341474 () Unit!26389)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26389)

(assert (=> b!767702 (= lt!341474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767703 () Bool)

(declare-fun res!519137 () Bool)

(declare-fun e!427570 () Bool)

(assert (=> b!767703 (=> (not res!519137) (not e!427570))))

(assert (=> b!767703 (= res!519137 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20236 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767704 () Bool)

(assert (=> b!767704 (= e!427567 e!427566)))

(declare-fun res!519139 () Bool)

(assert (=> b!767704 (=> (not res!519139) (not e!427566))))

(declare-fun lt!341473 () SeekEntryResult!7792)

(assert (=> b!767704 (= res!519139 (or (= lt!341473 (MissingZero!7792 i!1173)) (= lt!341473 (MissingVacant!7792 i!1173))))))

(assert (=> b!767704 (= lt!341473 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!767705 () Bool)

(assert (=> b!767705 (= e!427566 e!427570)))

(declare-fun res!519138 () Bool)

(assert (=> b!767705 (=> (not res!519138) (not e!427570))))

(declare-fun lt!341477 () SeekEntryResult!7792)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42274 (_ BitVec 32)) SeekEntryResult!7792)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767705 (= res!519138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20236 a!3186) j!159) mask!3328) (select (arr!20236 a!3186) j!159) a!3186 mask!3328) lt!341477))))

(assert (=> b!767705 (= lt!341477 (Intermediate!7792 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767706 () Bool)

(declare-fun res!519126 () Bool)

(assert (=> b!767706 (=> (not res!519126) (not e!427567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767706 (= res!519126 (validKeyInArray!0 k0!2102))))

(declare-fun res!519135 () Bool)

(assert (=> start!66686 (=> (not res!519135) (not e!427567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66686 (= res!519135 (validMask!0 mask!3328))))

(assert (=> start!66686 e!427567))

(assert (=> start!66686 true))

(declare-fun array_inv!16095 (array!42274) Bool)

(assert (=> start!66686 (array_inv!16095 a!3186)))

(declare-fun b!767707 () Bool)

(declare-fun res!519128 () Bool)

(assert (=> b!767707 (=> (not res!519128) (not e!427570))))

(declare-fun e!427574 () Bool)

(assert (=> b!767707 (= res!519128 e!427574)))

(declare-fun c!84680 () Bool)

(assert (=> b!767707 (= c!84680 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767708 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42274 (_ BitVec 32)) SeekEntryResult!7792)

(assert (=> b!767708 (= e!427568 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20236 a!3186) j!159) a!3186 mask!3328) lt!341476))))

(declare-fun b!767709 () Bool)

(assert (=> b!767709 (= e!427570 e!427572)))

(declare-fun res!519125 () Bool)

(assert (=> b!767709 (=> (not res!519125) (not e!427572))))

(declare-fun lt!341470 () SeekEntryResult!7792)

(assert (=> b!767709 (= res!519125 (= lt!341470 lt!341471))))

(declare-fun lt!341475 () array!42274)

(declare-fun lt!341472 () (_ BitVec 64))

(assert (=> b!767709 (= lt!341471 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341472 lt!341475 mask!3328))))

(assert (=> b!767709 (= lt!341470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341472 mask!3328) lt!341472 lt!341475 mask!3328))))

(assert (=> b!767709 (= lt!341472 (select (store (arr!20236 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!767709 (= lt!341475 (array!42275 (store (arr!20236 a!3186) i!1173 k0!2102) (size!20656 a!3186)))))

(declare-fun b!767710 () Bool)

(assert (=> b!767710 (= e!427574 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20236 a!3186) j!159) a!3186 mask!3328) (Found!7792 j!159)))))

(declare-fun b!767711 () Bool)

(assert (=> b!767711 (= e!427571 true)))

(declare-fun lt!341478 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767711 (= lt!341478 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!767712 () Bool)

(assert (=> b!767712 (= e!427574 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20236 a!3186) j!159) a!3186 mask!3328) lt!341477))))

(declare-fun b!767713 () Bool)

(declare-fun res!519136 () Bool)

(assert (=> b!767713 (=> (not res!519136) (not e!427566))))

(assert (=> b!767713 (= res!519136 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767714 () Bool)

(declare-fun res!519131 () Bool)

(assert (=> b!767714 (=> (not res!519131) (not e!427567))))

(assert (=> b!767714 (= res!519131 (validKeyInArray!0 (select (arr!20236 a!3186) j!159)))))

(assert (= (and start!66686 res!519135) b!767699))

(assert (= (and b!767699 res!519129) b!767714))

(assert (= (and b!767714 res!519131) b!767706))

(assert (= (and b!767706 res!519126) b!767698))

(assert (= (and b!767698 res!519134) b!767704))

(assert (= (and b!767704 res!519139) b!767713))

(assert (= (and b!767713 res!519136) b!767701))

(assert (= (and b!767701 res!519133) b!767700))

(assert (= (and b!767700 res!519130) b!767705))

(assert (= (and b!767705 res!519138) b!767703))

(assert (= (and b!767703 res!519137) b!767707))

(assert (= (and b!767707 c!84680) b!767712))

(assert (= (and b!767707 (not c!84680)) b!767710))

(assert (= (and b!767707 res!519128) b!767709))

(assert (= (and b!767709 res!519125) b!767702))

(assert (= (and b!767702 res!519132) b!767697))

(assert (= (and b!767697 res!519127) b!767708))

(assert (= (and b!767702 (not res!519140)) b!767711))

(declare-fun m!713911 () Bool)

(assert (=> b!767711 m!713911))

(declare-fun m!713913 () Bool)

(assert (=> b!767709 m!713913))

(declare-fun m!713915 () Bool)

(assert (=> b!767709 m!713915))

(declare-fun m!713917 () Bool)

(assert (=> b!767709 m!713917))

(declare-fun m!713919 () Bool)

(assert (=> b!767709 m!713919))

(assert (=> b!767709 m!713917))

(declare-fun m!713921 () Bool)

(assert (=> b!767709 m!713921))

(declare-fun m!713923 () Bool)

(assert (=> b!767706 m!713923))

(declare-fun m!713925 () Bool)

(assert (=> b!767701 m!713925))

(declare-fun m!713927 () Bool)

(assert (=> b!767713 m!713927))

(declare-fun m!713929 () Bool)

(assert (=> b!767704 m!713929))

(declare-fun m!713931 () Bool)

(assert (=> b!767697 m!713931))

(assert (=> b!767697 m!713931))

(declare-fun m!713933 () Bool)

(assert (=> b!767697 m!713933))

(declare-fun m!713935 () Bool)

(assert (=> start!66686 m!713935))

(declare-fun m!713937 () Bool)

(assert (=> start!66686 m!713937))

(assert (=> b!767705 m!713931))

(assert (=> b!767705 m!713931))

(declare-fun m!713939 () Bool)

(assert (=> b!767705 m!713939))

(assert (=> b!767705 m!713939))

(assert (=> b!767705 m!713931))

(declare-fun m!713941 () Bool)

(assert (=> b!767705 m!713941))

(declare-fun m!713943 () Bool)

(assert (=> b!767698 m!713943))

(declare-fun m!713945 () Bool)

(assert (=> b!767703 m!713945))

(assert (=> b!767714 m!713931))

(assert (=> b!767714 m!713931))

(declare-fun m!713947 () Bool)

(assert (=> b!767714 m!713947))

(assert (=> b!767710 m!713931))

(assert (=> b!767710 m!713931))

(declare-fun m!713949 () Bool)

(assert (=> b!767710 m!713949))

(declare-fun m!713951 () Bool)

(assert (=> b!767702 m!713951))

(declare-fun m!713953 () Bool)

(assert (=> b!767702 m!713953))

(assert (=> b!767712 m!713931))

(assert (=> b!767712 m!713931))

(declare-fun m!713955 () Bool)

(assert (=> b!767712 m!713955))

(assert (=> b!767708 m!713931))

(assert (=> b!767708 m!713931))

(declare-fun m!713957 () Bool)

(assert (=> b!767708 m!713957))

(check-sat (not b!767698) (not b!767710) (not b!767704) (not b!767713) (not b!767705) (not b!767706) (not b!767711) (not b!767697) (not b!767709) (not b!767714) (not start!66686) (not b!767712) (not b!767708) (not b!767701) (not b!767702))
(check-sat)
