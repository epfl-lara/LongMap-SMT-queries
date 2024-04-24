; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65778 () Bool)

(assert start!65778)

(declare-fun b!752583 () Bool)

(declare-fun res!507952 () Bool)

(declare-fun e!419878 () Bool)

(assert (=> b!752583 (=> (not res!507952) (not e!419878))))

(declare-datatypes ((array!41821 0))(
  ( (array!41822 (arr!20020 (Array (_ BitVec 32) (_ BitVec 64))) (size!20440 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41821)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752583 (= res!507952 (validKeyInArray!0 (select (arr!20020 a!3186) j!159)))))

(declare-fun b!752584 () Bool)

(declare-fun e!419877 () Bool)

(declare-fun e!419880 () Bool)

(assert (=> b!752584 (= e!419877 e!419880)))

(declare-fun res!507946 () Bool)

(assert (=> b!752584 (=> res!507946 e!419880)))

(declare-fun lt!334709 () (_ BitVec 64))

(declare-fun lt!334710 () (_ BitVec 64))

(assert (=> b!752584 (= res!507946 (= lt!334709 lt!334710))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!752584 (= lt!334709 (select (store (arr!20020 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752585 () Bool)

(declare-fun e!419883 () Bool)

(assert (=> b!752585 (= e!419878 e!419883)))

(declare-fun res!507959 () Bool)

(assert (=> b!752585 (=> (not res!507959) (not e!419883))))

(declare-datatypes ((SeekEntryResult!7576 0))(
  ( (MissingZero!7576 (index!32672 (_ BitVec 32))) (Found!7576 (index!32673 (_ BitVec 32))) (Intermediate!7576 (undefined!8388 Bool) (index!32674 (_ BitVec 32)) (x!63754 (_ BitVec 32))) (Undefined!7576) (MissingVacant!7576 (index!32675 (_ BitVec 32))) )
))
(declare-fun lt!334707 () SeekEntryResult!7576)

(assert (=> b!752585 (= res!507959 (or (= lt!334707 (MissingZero!7576 i!1173)) (= lt!334707 (MissingVacant!7576 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41821 (_ BitVec 32)) SeekEntryResult!7576)

(assert (=> b!752585 (= lt!334707 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752586 () Bool)

(declare-fun e!419881 () Bool)

(assert (=> b!752586 (= e!419883 e!419881)))

(declare-fun res!507951 () Bool)

(assert (=> b!752586 (=> (not res!507951) (not e!419881))))

(declare-fun lt!334702 () SeekEntryResult!7576)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41821 (_ BitVec 32)) SeekEntryResult!7576)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752586 (= res!507951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20020 a!3186) j!159) mask!3328) (select (arr!20020 a!3186) j!159) a!3186 mask!3328) lt!334702))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752586 (= lt!334702 (Intermediate!7576 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752588 () Bool)

(declare-fun res!507949 () Bool)

(assert (=> b!752588 (=> (not res!507949) (not e!419878))))

(declare-fun arrayContainsKey!0 (array!41821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752588 (= res!507949 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752589 () Bool)

(declare-fun res!507961 () Bool)

(assert (=> b!752589 (=> (not res!507961) (not e!419878))))

(assert (=> b!752589 (= res!507961 (validKeyInArray!0 k0!2102))))

(declare-fun b!752590 () Bool)

(declare-datatypes ((Unit!25861 0))(
  ( (Unit!25862) )
))
(declare-fun e!419873 () Unit!25861)

(declare-fun Unit!25863 () Unit!25861)

(assert (=> b!752590 (= e!419873 Unit!25863)))

(declare-fun b!752591 () Bool)

(declare-fun Unit!25864 () Unit!25861)

(assert (=> b!752591 (= e!419873 Unit!25864)))

(assert (=> b!752591 false))

(declare-fun b!752592 () Bool)

(assert (=> b!752592 (= e!419880 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun e!419874 () Bool)

(assert (=> b!752592 e!419874))

(declare-fun res!507955 () Bool)

(assert (=> b!752592 (=> (not res!507955) (not e!419874))))

(assert (=> b!752592 (= res!507955 (= lt!334709 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334703 () Unit!25861)

(assert (=> b!752592 (= lt!334703 e!419873)))

(declare-fun c!82703 () Bool)

(assert (=> b!752592 (= c!82703 (= lt!334709 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752593 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!419872 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41821 (_ BitVec 32)) SeekEntryResult!7576)

(assert (=> b!752593 (= e!419872 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20020 a!3186) j!159) a!3186 mask!3328) (Found!7576 j!159)))))

(declare-fun b!752594 () Bool)

(declare-fun e!419875 () Bool)

(assert (=> b!752594 (= e!419881 e!419875)))

(declare-fun res!507962 () Bool)

(assert (=> b!752594 (=> (not res!507962) (not e!419875))))

(declare-fun lt!334706 () SeekEntryResult!7576)

(declare-fun lt!334701 () SeekEntryResult!7576)

(assert (=> b!752594 (= res!507962 (= lt!334706 lt!334701))))

(declare-fun lt!334704 () array!41821)

(assert (=> b!752594 (= lt!334701 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334710 lt!334704 mask!3328))))

(assert (=> b!752594 (= lt!334706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334710 mask!3328) lt!334710 lt!334704 mask!3328))))

(assert (=> b!752594 (= lt!334710 (select (store (arr!20020 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752594 (= lt!334704 (array!41822 (store (arr!20020 a!3186) i!1173 k0!2102) (size!20440 a!3186)))))

(declare-fun res!507963 () Bool)

(assert (=> start!65778 (=> (not res!507963) (not e!419878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65778 (= res!507963 (validMask!0 mask!3328))))

(assert (=> start!65778 e!419878))

(assert (=> start!65778 true))

(declare-fun array_inv!15879 (array!41821) Bool)

(assert (=> start!65778 (array_inv!15879 a!3186)))

(declare-fun b!752587 () Bool)

(declare-fun res!507957 () Bool)

(assert (=> b!752587 (=> (not res!507957) (not e!419881))))

(assert (=> b!752587 (= res!507957 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20020 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752595 () Bool)

(declare-fun lt!334699 () SeekEntryResult!7576)

(declare-fun lt!334708 () SeekEntryResult!7576)

(assert (=> b!752595 (= e!419874 (= lt!334699 lt!334708))))

(declare-fun b!752596 () Bool)

(declare-fun res!507948 () Bool)

(assert (=> b!752596 (=> (not res!507948) (not e!419881))))

(assert (=> b!752596 (= res!507948 e!419872)))

(declare-fun c!82702 () Bool)

(assert (=> b!752596 (= c!82702 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752597 () Bool)

(declare-fun res!507958 () Bool)

(assert (=> b!752597 (=> (not res!507958) (not e!419883))))

(declare-datatypes ((List!13929 0))(
  ( (Nil!13926) (Cons!13925 (h!15003 (_ BitVec 64)) (t!20236 List!13929)) )
))
(declare-fun arrayNoDuplicates!0 (array!41821 (_ BitVec 32) List!13929) Bool)

(assert (=> b!752597 (= res!507958 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13926))))

(declare-fun b!752598 () Bool)

(declare-fun res!507950 () Bool)

(assert (=> b!752598 (=> (not res!507950) (not e!419883))))

(assert (=> b!752598 (= res!507950 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20440 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20440 a!3186))))))

(declare-fun b!752599 () Bool)

(declare-fun res!507947 () Bool)

(assert (=> b!752599 (=> (not res!507947) (not e!419874))))

(assert (=> b!752599 (= res!507947 (= (seekEntryOrOpen!0 lt!334710 lt!334704 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334710 lt!334704 mask!3328)))))

(declare-fun b!752600 () Bool)

(declare-fun e!419882 () Bool)

(assert (=> b!752600 (= e!419882 e!419877)))

(declare-fun res!507956 () Bool)

(assert (=> b!752600 (=> res!507956 e!419877)))

(declare-fun lt!334705 () SeekEntryResult!7576)

(assert (=> b!752600 (= res!507956 (not (= lt!334708 lt!334705)))))

(assert (=> b!752600 (= lt!334708 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20020 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752601 () Bool)

(declare-fun e!419879 () Bool)

(assert (=> b!752601 (= e!419879 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20020 a!3186) j!159) a!3186 mask!3328) lt!334705))))

(declare-fun b!752602 () Bool)

(declare-fun res!507960 () Bool)

(assert (=> b!752602 (=> (not res!507960) (not e!419878))))

(assert (=> b!752602 (= res!507960 (and (= (size!20440 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20440 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20440 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752603 () Bool)

(declare-fun res!507953 () Bool)

(assert (=> b!752603 (=> (not res!507953) (not e!419883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41821 (_ BitVec 32)) Bool)

(assert (=> b!752603 (= res!507953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752604 () Bool)

(assert (=> b!752604 (= e!419872 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20020 a!3186) j!159) a!3186 mask!3328) lt!334702))))

(declare-fun b!752605 () Bool)

(assert (=> b!752605 (= e!419875 (not e!419882))))

(declare-fun res!507954 () Bool)

(assert (=> b!752605 (=> res!507954 e!419882)))

(get-info :version)

(assert (=> b!752605 (= res!507954 (or (not ((_ is Intermediate!7576) lt!334701)) (bvslt x!1131 (x!63754 lt!334701)) (not (= x!1131 (x!63754 lt!334701))) (not (= index!1321 (index!32674 lt!334701)))))))

(assert (=> b!752605 e!419879))

(declare-fun res!507964 () Bool)

(assert (=> b!752605 (=> (not res!507964) (not e!419879))))

(assert (=> b!752605 (= res!507964 (= lt!334699 lt!334705))))

(assert (=> b!752605 (= lt!334705 (Found!7576 j!159))))

(assert (=> b!752605 (= lt!334699 (seekEntryOrOpen!0 (select (arr!20020 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752605 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334700 () Unit!25861)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25861)

(assert (=> b!752605 (= lt!334700 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65778 res!507963) b!752602))

(assert (= (and b!752602 res!507960) b!752583))

(assert (= (and b!752583 res!507952) b!752589))

(assert (= (and b!752589 res!507961) b!752588))

(assert (= (and b!752588 res!507949) b!752585))

(assert (= (and b!752585 res!507959) b!752603))

(assert (= (and b!752603 res!507953) b!752597))

(assert (= (and b!752597 res!507958) b!752598))

(assert (= (and b!752598 res!507950) b!752586))

(assert (= (and b!752586 res!507951) b!752587))

(assert (= (and b!752587 res!507957) b!752596))

(assert (= (and b!752596 c!82702) b!752604))

(assert (= (and b!752596 (not c!82702)) b!752593))

(assert (= (and b!752596 res!507948) b!752594))

(assert (= (and b!752594 res!507962) b!752605))

(assert (= (and b!752605 res!507964) b!752601))

(assert (= (and b!752605 (not res!507954)) b!752600))

(assert (= (and b!752600 (not res!507956)) b!752584))

(assert (= (and b!752584 (not res!507946)) b!752592))

(assert (= (and b!752592 c!82703) b!752591))

(assert (= (and b!752592 (not c!82703)) b!752590))

(assert (= (and b!752592 res!507955) b!752599))

(assert (= (and b!752599 res!507947) b!752595))

(declare-fun m!702087 () Bool)

(assert (=> b!752587 m!702087))

(declare-fun m!702089 () Bool)

(assert (=> b!752599 m!702089))

(declare-fun m!702091 () Bool)

(assert (=> b!752599 m!702091))

(declare-fun m!702093 () Bool)

(assert (=> b!752601 m!702093))

(assert (=> b!752601 m!702093))

(declare-fun m!702095 () Bool)

(assert (=> b!752601 m!702095))

(declare-fun m!702097 () Bool)

(assert (=> b!752589 m!702097))

(assert (=> b!752605 m!702093))

(assert (=> b!752605 m!702093))

(declare-fun m!702099 () Bool)

(assert (=> b!752605 m!702099))

(declare-fun m!702101 () Bool)

(assert (=> b!752605 m!702101))

(declare-fun m!702103 () Bool)

(assert (=> b!752605 m!702103))

(declare-fun m!702105 () Bool)

(assert (=> b!752584 m!702105))

(declare-fun m!702107 () Bool)

(assert (=> b!752584 m!702107))

(declare-fun m!702109 () Bool)

(assert (=> b!752603 m!702109))

(assert (=> b!752583 m!702093))

(assert (=> b!752583 m!702093))

(declare-fun m!702111 () Bool)

(assert (=> b!752583 m!702111))

(declare-fun m!702113 () Bool)

(assert (=> b!752597 m!702113))

(assert (=> b!752600 m!702093))

(assert (=> b!752600 m!702093))

(declare-fun m!702115 () Bool)

(assert (=> b!752600 m!702115))

(assert (=> b!752586 m!702093))

(assert (=> b!752586 m!702093))

(declare-fun m!702117 () Bool)

(assert (=> b!752586 m!702117))

(assert (=> b!752586 m!702117))

(assert (=> b!752586 m!702093))

(declare-fun m!702119 () Bool)

(assert (=> b!752586 m!702119))

(assert (=> b!752593 m!702093))

(assert (=> b!752593 m!702093))

(assert (=> b!752593 m!702115))

(declare-fun m!702121 () Bool)

(assert (=> b!752594 m!702121))

(declare-fun m!702123 () Bool)

(assert (=> b!752594 m!702123))

(assert (=> b!752594 m!702121))

(assert (=> b!752594 m!702105))

(declare-fun m!702125 () Bool)

(assert (=> b!752594 m!702125))

(declare-fun m!702127 () Bool)

(assert (=> b!752594 m!702127))

(declare-fun m!702129 () Bool)

(assert (=> b!752585 m!702129))

(declare-fun m!702131 () Bool)

(assert (=> b!752588 m!702131))

(assert (=> b!752604 m!702093))

(assert (=> b!752604 m!702093))

(declare-fun m!702133 () Bool)

(assert (=> b!752604 m!702133))

(declare-fun m!702135 () Bool)

(assert (=> start!65778 m!702135))

(declare-fun m!702137 () Bool)

(assert (=> start!65778 m!702137))

(check-sat (not b!752594) (not b!752589) (not b!752593) (not start!65778) (not b!752605) (not b!752600) (not b!752585) (not b!752603) (not b!752586) (not b!752604) (not b!752601) (not b!752597) (not b!752583) (not b!752599) (not b!752588))
(check-sat)
