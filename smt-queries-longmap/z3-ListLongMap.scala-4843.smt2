; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66874 () Bool)

(assert start!66874)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!428694 () Bool)

(declare-fun b!769721 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42316 0))(
  ( (array!42317 (arr!20254 (Array (_ BitVec 32) (_ BitVec 64))) (size!20674 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42316)

(declare-datatypes ((SeekEntryResult!7810 0))(
  ( (MissingZero!7810 (index!33608 (_ BitVec 32))) (Found!7810 (index!33609 (_ BitVec 32))) (Intermediate!7810 (undefined!8622 Bool) (index!33610 (_ BitVec 32)) (x!64704 (_ BitVec 32))) (Undefined!7810) (MissingVacant!7810 (index!33611 (_ BitVec 32))) )
))
(declare-fun lt!342422 () SeekEntryResult!7810)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42316 (_ BitVec 32)) SeekEntryResult!7810)

(assert (=> b!769721 (= e!428694 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!342422))))

(declare-fun res!520343 () Bool)

(declare-fun e!428691 () Bool)

(assert (=> start!66874 (=> (not res!520343) (not e!428691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66874 (= res!520343 (validMask!0 mask!3328))))

(assert (=> start!66874 e!428691))

(assert (=> start!66874 true))

(declare-fun array_inv!16113 (array!42316) Bool)

(assert (=> start!66874 (array_inv!16113 a!3186)))

(declare-fun b!769722 () Bool)

(declare-fun e!428690 () Bool)

(declare-fun e!428693 () Bool)

(assert (=> b!769722 (= e!428690 (not e!428693))))

(declare-fun res!520336 () Bool)

(assert (=> b!769722 (=> res!520336 e!428693)))

(declare-fun lt!342418 () SeekEntryResult!7810)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!769722 (= res!520336 (or (not ((_ is Intermediate!7810) lt!342418)) (bvsge x!1131 (x!64704 lt!342418))))))

(declare-fun e!428688 () Bool)

(assert (=> b!769722 e!428688))

(declare-fun res!520341 () Bool)

(assert (=> b!769722 (=> (not res!520341) (not e!428688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42316 (_ BitVec 32)) Bool)

(assert (=> b!769722 (= res!520341 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26431 0))(
  ( (Unit!26432) )
))
(declare-fun lt!342427 () Unit!26431)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42316 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26431)

(assert (=> b!769722 (= lt!342427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769723 () Bool)

(assert (=> b!769723 (= e!428693 true)))

(declare-fun lt!342425 () Unit!26431)

(declare-fun e!428692 () Unit!26431)

(assert (=> b!769723 (= lt!342425 e!428692)))

(declare-fun c!85093 () Bool)

(assert (=> b!769723 (= c!85093 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342423 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769723 (= lt!342423 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!769724 () Bool)

(declare-fun res!520342 () Bool)

(assert (=> b!769724 (=> (not res!520342) (not e!428691))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769724 (= res!520342 (and (= (size!20674 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20674 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20674 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769725 () Bool)

(declare-fun e!428695 () Bool)

(declare-fun e!428687 () Bool)

(assert (=> b!769725 (= e!428695 e!428687)))

(declare-fun res!520339 () Bool)

(assert (=> b!769725 (=> (not res!520339) (not e!428687))))

(declare-fun lt!342426 () SeekEntryResult!7810)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42316 (_ BitVec 32)) SeekEntryResult!7810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769725 (= res!520339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20254 a!3186) j!159) mask!3328) (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!342426))))

(assert (=> b!769725 (= lt!342426 (Intermediate!7810 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769726 () Bool)

(declare-fun res!520334 () Bool)

(assert (=> b!769726 (=> (not res!520334) (not e!428695))))

(assert (=> b!769726 (= res!520334 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20674 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20674 a!3186))))))

(declare-fun b!769727 () Bool)

(declare-fun res!520337 () Bool)

(assert (=> b!769727 (=> (not res!520337) (not e!428687))))

(declare-fun e!428686 () Bool)

(assert (=> b!769727 (= res!520337 e!428686)))

(declare-fun c!85094 () Bool)

(assert (=> b!769727 (= c!85094 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769728 () Bool)

(assert (=> b!769728 (= e!428686 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!342426))))

(declare-fun b!769729 () Bool)

(declare-fun res!520347 () Bool)

(assert (=> b!769729 (=> (not res!520347) (not e!428687))))

(assert (=> b!769729 (= res!520347 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20254 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769730 () Bool)

(declare-fun res!520344 () Bool)

(assert (=> b!769730 (=> (not res!520344) (not e!428695))))

(assert (=> b!769730 (= res!520344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769731 () Bool)

(declare-fun res!520345 () Bool)

(assert (=> b!769731 (=> (not res!520345) (not e!428691))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769731 (= res!520345 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769732 () Bool)

(declare-fun Unit!26433 () Unit!26431)

(assert (=> b!769732 (= e!428692 Unit!26433)))

(declare-fun lt!342421 () SeekEntryResult!7810)

(assert (=> b!769732 (= lt!342421 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769732 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342423 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) (Found!7810 j!159))))

(declare-fun b!769733 () Bool)

(declare-fun res!520332 () Bool)

(assert (=> b!769733 (=> (not res!520332) (not e!428691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769733 (= res!520332 (validKeyInArray!0 (select (arr!20254 a!3186) j!159)))))

(declare-fun b!769734 () Bool)

(assert (=> b!769734 (= e!428687 e!428690)))

(declare-fun res!520333 () Bool)

(assert (=> b!769734 (=> (not res!520333) (not e!428690))))

(declare-fun lt!342417 () SeekEntryResult!7810)

(assert (=> b!769734 (= res!520333 (= lt!342417 lt!342418))))

(declare-fun lt!342420 () (_ BitVec 64))

(declare-fun lt!342424 () array!42316)

(assert (=> b!769734 (= lt!342418 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342420 lt!342424 mask!3328))))

(assert (=> b!769734 (= lt!342417 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342420 mask!3328) lt!342420 lt!342424 mask!3328))))

(assert (=> b!769734 (= lt!342420 (select (store (arr!20254 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769734 (= lt!342424 (array!42317 (store (arr!20254 a!3186) i!1173 k0!2102) (size!20674 a!3186)))))

(declare-fun b!769735 () Bool)

(declare-fun res!520346 () Bool)

(assert (=> b!769735 (=> (not res!520346) (not e!428695))))

(declare-datatypes ((List!14163 0))(
  ( (Nil!14160) (Cons!14159 (h!15264 (_ BitVec 64)) (t!20470 List!14163)) )
))
(declare-fun arrayNoDuplicates!0 (array!42316 (_ BitVec 32) List!14163) Bool)

(assert (=> b!769735 (= res!520346 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14160))))

(declare-fun b!769736 () Bool)

(assert (=> b!769736 (= e!428686 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) (Found!7810 j!159)))))

(declare-fun b!769737 () Bool)

(declare-fun res!520335 () Bool)

(assert (=> b!769737 (=> (not res!520335) (not e!428691))))

(assert (=> b!769737 (= res!520335 (validKeyInArray!0 k0!2102))))

(declare-fun b!769738 () Bool)

(assert (=> b!769738 (= e!428688 e!428694)))

(declare-fun res!520340 () Bool)

(assert (=> b!769738 (=> (not res!520340) (not e!428694))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42316 (_ BitVec 32)) SeekEntryResult!7810)

(assert (=> b!769738 (= res!520340 (= (seekEntryOrOpen!0 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!342422))))

(assert (=> b!769738 (= lt!342422 (Found!7810 j!159))))

(declare-fun b!769739 () Bool)

(assert (=> b!769739 (= e!428691 e!428695)))

(declare-fun res!520338 () Bool)

(assert (=> b!769739 (=> (not res!520338) (not e!428695))))

(declare-fun lt!342419 () SeekEntryResult!7810)

(assert (=> b!769739 (= res!520338 (or (= lt!342419 (MissingZero!7810 i!1173)) (= lt!342419 (MissingVacant!7810 i!1173))))))

(assert (=> b!769739 (= lt!342419 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769740 () Bool)

(declare-fun Unit!26434 () Unit!26431)

(assert (=> b!769740 (= e!428692 Unit!26434)))

(assert (=> b!769740 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342423 (select (arr!20254 a!3186) j!159) a!3186 mask!3328) lt!342426)))

(assert (= (and start!66874 res!520343) b!769724))

(assert (= (and b!769724 res!520342) b!769733))

(assert (= (and b!769733 res!520332) b!769737))

(assert (= (and b!769737 res!520335) b!769731))

(assert (= (and b!769731 res!520345) b!769739))

(assert (= (and b!769739 res!520338) b!769730))

(assert (= (and b!769730 res!520344) b!769735))

(assert (= (and b!769735 res!520346) b!769726))

(assert (= (and b!769726 res!520334) b!769725))

(assert (= (and b!769725 res!520339) b!769729))

(assert (= (and b!769729 res!520347) b!769727))

(assert (= (and b!769727 c!85094) b!769728))

(assert (= (and b!769727 (not c!85094)) b!769736))

(assert (= (and b!769727 res!520337) b!769734))

(assert (= (and b!769734 res!520333) b!769722))

(assert (= (and b!769722 res!520341) b!769738))

(assert (= (and b!769738 res!520340) b!769721))

(assert (= (and b!769722 (not res!520336)) b!769723))

(assert (= (and b!769723 c!85093) b!769740))

(assert (= (and b!769723 (not c!85093)) b!769732))

(declare-fun m!715583 () Bool)

(assert (=> b!769738 m!715583))

(assert (=> b!769738 m!715583))

(declare-fun m!715585 () Bool)

(assert (=> b!769738 m!715585))

(declare-fun m!715587 () Bool)

(assert (=> b!769730 m!715587))

(declare-fun m!715589 () Bool)

(assert (=> b!769731 m!715589))

(assert (=> b!769733 m!715583))

(assert (=> b!769733 m!715583))

(declare-fun m!715591 () Bool)

(assert (=> b!769733 m!715591))

(assert (=> b!769728 m!715583))

(assert (=> b!769728 m!715583))

(declare-fun m!715593 () Bool)

(assert (=> b!769728 m!715593))

(assert (=> b!769740 m!715583))

(assert (=> b!769740 m!715583))

(declare-fun m!715595 () Bool)

(assert (=> b!769740 m!715595))

(assert (=> b!769736 m!715583))

(assert (=> b!769736 m!715583))

(declare-fun m!715597 () Bool)

(assert (=> b!769736 m!715597))

(assert (=> b!769732 m!715583))

(assert (=> b!769732 m!715583))

(assert (=> b!769732 m!715597))

(assert (=> b!769732 m!715583))

(declare-fun m!715599 () Bool)

(assert (=> b!769732 m!715599))

(declare-fun m!715601 () Bool)

(assert (=> b!769737 m!715601))

(declare-fun m!715603 () Bool)

(assert (=> b!769739 m!715603))

(declare-fun m!715605 () Bool)

(assert (=> b!769723 m!715605))

(declare-fun m!715607 () Bool)

(assert (=> b!769734 m!715607))

(assert (=> b!769734 m!715607))

(declare-fun m!715609 () Bool)

(assert (=> b!769734 m!715609))

(declare-fun m!715611 () Bool)

(assert (=> b!769734 m!715611))

(declare-fun m!715613 () Bool)

(assert (=> b!769734 m!715613))

(declare-fun m!715615 () Bool)

(assert (=> b!769734 m!715615))

(declare-fun m!715617 () Bool)

(assert (=> b!769722 m!715617))

(declare-fun m!715619 () Bool)

(assert (=> b!769722 m!715619))

(assert (=> b!769721 m!715583))

(assert (=> b!769721 m!715583))

(declare-fun m!715621 () Bool)

(assert (=> b!769721 m!715621))

(declare-fun m!715623 () Bool)

(assert (=> b!769729 m!715623))

(declare-fun m!715625 () Bool)

(assert (=> start!66874 m!715625))

(declare-fun m!715627 () Bool)

(assert (=> start!66874 m!715627))

(declare-fun m!715629 () Bool)

(assert (=> b!769735 m!715629))

(assert (=> b!769725 m!715583))

(assert (=> b!769725 m!715583))

(declare-fun m!715631 () Bool)

(assert (=> b!769725 m!715631))

(assert (=> b!769725 m!715631))

(assert (=> b!769725 m!715583))

(declare-fun m!715633 () Bool)

(assert (=> b!769725 m!715633))

(check-sat (not b!769737) (not b!769734) (not b!769735) (not b!769728) (not b!769730) (not b!769723) (not b!769733) (not b!769736) (not b!769738) (not b!769739) (not b!769732) (not b!769722) (not b!769740) (not b!769721) (not b!769731) (not b!769725) (not start!66874))
(check-sat)
