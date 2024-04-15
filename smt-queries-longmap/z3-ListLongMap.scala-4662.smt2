; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64724 () Bool)

(assert start!64724)

(declare-fun b!730609 () Bool)

(declare-fun e!408824 () Bool)

(declare-fun e!408829 () Bool)

(assert (=> b!730609 (= e!408824 e!408829)))

(declare-fun res!491009 () Bool)

(assert (=> b!730609 (=> (not res!491009) (not e!408829))))

(declare-datatypes ((SeekEntryResult!7312 0))(
  ( (MissingZero!7312 (index!31616 (_ BitVec 32))) (Found!7312 (index!31617 (_ BitVec 32))) (Intermediate!7312 (undefined!8124 Bool) (index!31618 (_ BitVec 32)) (x!62601 (_ BitVec 32))) (Undefined!7312) (MissingVacant!7312 (index!31619 (_ BitVec 32))) )
))
(declare-fun lt!323640 () SeekEntryResult!7312)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!730609 (= res!491009 (or (= lt!323640 (MissingZero!7312 i!1173)) (= lt!323640 (MissingVacant!7312 i!1173))))))

(declare-datatypes ((array!41190 0))(
  ( (array!41191 (arr!19715 (Array (_ BitVec 32) (_ BitVec 64))) (size!20136 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41190)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41190 (_ BitVec 32)) SeekEntryResult!7312)

(assert (=> b!730609 (= lt!323640 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!730610 () Bool)

(declare-fun e!408825 () Bool)

(declare-fun e!408830 () Bool)

(assert (=> b!730610 (= e!408825 e!408830)))

(declare-fun res!491011 () Bool)

(assert (=> b!730610 (=> res!491011 e!408830)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730610 (= res!491011 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323639 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730610 (= lt!323639 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730611 () Bool)

(declare-fun e!408827 () Bool)

(declare-fun e!408832 () Bool)

(assert (=> b!730611 (= e!408827 e!408832)))

(declare-fun res!491007 () Bool)

(assert (=> b!730611 (=> (not res!491007) (not e!408832))))

(declare-fun lt!323634 () SeekEntryResult!7312)

(declare-fun lt!323636 () SeekEntryResult!7312)

(assert (=> b!730611 (= res!491007 (= lt!323634 lt!323636))))

(declare-fun lt!323635 () array!41190)

(declare-fun lt!323641 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41190 (_ BitVec 32)) SeekEntryResult!7312)

(assert (=> b!730611 (= lt!323636 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323641 lt!323635 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730611 (= lt!323634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323641 mask!3328) lt!323641 lt!323635 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!730611 (= lt!323641 (select (store (arr!19715 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!730611 (= lt!323635 (array!41191 (store (arr!19715 a!3186) i!1173 k0!2102) (size!20136 a!3186)))))

(declare-fun b!730612 () Bool)

(declare-fun res!491013 () Bool)

(assert (=> b!730612 (=> (not res!491013) (not e!408827))))

(declare-fun e!408831 () Bool)

(assert (=> b!730612 (= res!491013 e!408831)))

(declare-fun c!80181 () Bool)

(assert (=> b!730612 (= c!80181 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!730613 () Bool)

(declare-fun res!491008 () Bool)

(assert (=> b!730613 (=> (not res!491008) (not e!408824))))

(declare-fun arrayContainsKey!0 (array!41190 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730613 (= res!491008 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730614 () Bool)

(declare-fun res!490998 () Bool)

(assert (=> b!730614 (=> (not res!490998) (not e!408824))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730614 (= res!490998 (validKeyInArray!0 k0!2102))))

(declare-fun b!730615 () Bool)

(declare-fun res!491002 () Bool)

(assert (=> b!730615 (=> (not res!491002) (not e!408829))))

(declare-datatypes ((List!13756 0))(
  ( (Nil!13753) (Cons!13752 (h!14812 (_ BitVec 64)) (t!20062 List!13756)) )
))
(declare-fun arrayNoDuplicates!0 (array!41190 (_ BitVec 32) List!13756) Bool)

(assert (=> b!730615 (= res!491002 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13753))))

(declare-fun b!730616 () Bool)

(declare-fun res!491000 () Bool)

(assert (=> b!730616 (=> res!491000 e!408830)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41190 (_ BitVec 32)) SeekEntryResult!7312)

(assert (=> b!730616 (= res!491000 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19715 a!3186) j!159) a!3186 mask!3328) (Found!7312 j!159))))))

(declare-fun b!730617 () Bool)

(declare-fun res!491003 () Bool)

(assert (=> b!730617 (=> (not res!491003) (not e!408829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41190 (_ BitVec 32)) Bool)

(assert (=> b!730617 (= res!491003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730618 () Bool)

(assert (=> b!730618 (= e!408832 (not e!408825))))

(declare-fun res!491006 () Bool)

(assert (=> b!730618 (=> res!491006 e!408825)))

(get-info :version)

(assert (=> b!730618 (= res!491006 (or (not ((_ is Intermediate!7312) lt!323636)) (bvsge x!1131 (x!62601 lt!323636))))))

(declare-fun e!408828 () Bool)

(assert (=> b!730618 e!408828))

(declare-fun res!491010 () Bool)

(assert (=> b!730618 (=> (not res!491010) (not e!408828))))

(assert (=> b!730618 (= res!491010 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24914 0))(
  ( (Unit!24915) )
))
(declare-fun lt!323638 () Unit!24914)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24914)

(assert (=> b!730618 (= lt!323638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!730619 () Bool)

(assert (=> b!730619 (= e!408829 e!408827)))

(declare-fun res!490997 () Bool)

(assert (=> b!730619 (=> (not res!490997) (not e!408827))))

(declare-fun lt!323642 () SeekEntryResult!7312)

(assert (=> b!730619 (= res!490997 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19715 a!3186) j!159) mask!3328) (select (arr!19715 a!3186) j!159) a!3186 mask!3328) lt!323642))))

(assert (=> b!730619 (= lt!323642 (Intermediate!7312 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730620 () Bool)

(assert (=> b!730620 (= e!408831 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19715 a!3186) j!159) a!3186 mask!3328) lt!323642))))

(declare-fun b!730621 () Bool)

(declare-fun res!491005 () Bool)

(assert (=> b!730621 (=> (not res!491005) (not e!408824))))

(assert (=> b!730621 (= res!491005 (and (= (size!20136 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20136 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20136 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730623 () Bool)

(declare-fun res!490999 () Bool)

(assert (=> b!730623 (=> (not res!490999) (not e!408829))))

(assert (=> b!730623 (= res!490999 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20136 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20136 a!3186))))))

(declare-fun b!730624 () Bool)

(assert (=> b!730624 (= e!408830 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!730625 () Bool)

(declare-fun e!408823 () Bool)

(assert (=> b!730625 (= e!408828 e!408823)))

(declare-fun res!491004 () Bool)

(assert (=> b!730625 (=> (not res!491004) (not e!408823))))

(declare-fun lt!323637 () SeekEntryResult!7312)

(assert (=> b!730625 (= res!491004 (= (seekEntryOrOpen!0 (select (arr!19715 a!3186) j!159) a!3186 mask!3328) lt!323637))))

(assert (=> b!730625 (= lt!323637 (Found!7312 j!159))))

(declare-fun b!730626 () Bool)

(assert (=> b!730626 (= e!408831 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19715 a!3186) j!159) a!3186 mask!3328) (Found!7312 j!159)))))

(declare-fun b!730627 () Bool)

(declare-fun res!490996 () Bool)

(assert (=> b!730627 (=> (not res!490996) (not e!408827))))

(assert (=> b!730627 (= res!490996 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19715 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730628 () Bool)

(assert (=> b!730628 (= e!408823 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19715 a!3186) j!159) a!3186 mask!3328) lt!323637))))

(declare-fun res!491001 () Bool)

(assert (=> start!64724 (=> (not res!491001) (not e!408824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64724 (= res!491001 (validMask!0 mask!3328))))

(assert (=> start!64724 e!408824))

(assert (=> start!64724 true))

(declare-fun array_inv!15598 (array!41190) Bool)

(assert (=> start!64724 (array_inv!15598 a!3186)))

(declare-fun b!730622 () Bool)

(declare-fun res!491012 () Bool)

(assert (=> b!730622 (=> (not res!491012) (not e!408824))))

(assert (=> b!730622 (= res!491012 (validKeyInArray!0 (select (arr!19715 a!3186) j!159)))))

(assert (= (and start!64724 res!491001) b!730621))

(assert (= (and b!730621 res!491005) b!730622))

(assert (= (and b!730622 res!491012) b!730614))

(assert (= (and b!730614 res!490998) b!730613))

(assert (= (and b!730613 res!491008) b!730609))

(assert (= (and b!730609 res!491009) b!730617))

(assert (= (and b!730617 res!491003) b!730615))

(assert (= (and b!730615 res!491002) b!730623))

(assert (= (and b!730623 res!490999) b!730619))

(assert (= (and b!730619 res!490997) b!730627))

(assert (= (and b!730627 res!490996) b!730612))

(assert (= (and b!730612 c!80181) b!730620))

(assert (= (and b!730612 (not c!80181)) b!730626))

(assert (= (and b!730612 res!491013) b!730611))

(assert (= (and b!730611 res!491007) b!730618))

(assert (= (and b!730618 res!491010) b!730625))

(assert (= (and b!730625 res!491004) b!730628))

(assert (= (and b!730618 (not res!491006)) b!730610))

(assert (= (and b!730610 (not res!491011)) b!730616))

(assert (= (and b!730616 (not res!491000)) b!730624))

(declare-fun m!683573 () Bool)

(assert (=> b!730610 m!683573))

(declare-fun m!683575 () Bool)

(assert (=> b!730615 m!683575))

(declare-fun m!683577 () Bool)

(assert (=> b!730626 m!683577))

(assert (=> b!730626 m!683577))

(declare-fun m!683579 () Bool)

(assert (=> b!730626 m!683579))

(assert (=> b!730628 m!683577))

(assert (=> b!730628 m!683577))

(declare-fun m!683581 () Bool)

(assert (=> b!730628 m!683581))

(declare-fun m!683583 () Bool)

(assert (=> b!730617 m!683583))

(assert (=> b!730616 m!683577))

(assert (=> b!730616 m!683577))

(assert (=> b!730616 m!683579))

(declare-fun m!683585 () Bool)

(assert (=> b!730627 m!683585))

(assert (=> b!730622 m!683577))

(assert (=> b!730622 m!683577))

(declare-fun m!683587 () Bool)

(assert (=> b!730622 m!683587))

(declare-fun m!683589 () Bool)

(assert (=> b!730611 m!683589))

(assert (=> b!730611 m!683589))

(declare-fun m!683591 () Bool)

(assert (=> b!730611 m!683591))

(declare-fun m!683593 () Bool)

(assert (=> b!730611 m!683593))

(declare-fun m!683595 () Bool)

(assert (=> b!730611 m!683595))

(declare-fun m!683597 () Bool)

(assert (=> b!730611 m!683597))

(declare-fun m!683599 () Bool)

(assert (=> b!730613 m!683599))

(declare-fun m!683601 () Bool)

(assert (=> b!730618 m!683601))

(declare-fun m!683603 () Bool)

(assert (=> b!730618 m!683603))

(declare-fun m!683605 () Bool)

(assert (=> b!730609 m!683605))

(assert (=> b!730619 m!683577))

(assert (=> b!730619 m!683577))

(declare-fun m!683607 () Bool)

(assert (=> b!730619 m!683607))

(assert (=> b!730619 m!683607))

(assert (=> b!730619 m!683577))

(declare-fun m!683609 () Bool)

(assert (=> b!730619 m!683609))

(assert (=> b!730620 m!683577))

(assert (=> b!730620 m!683577))

(declare-fun m!683611 () Bool)

(assert (=> b!730620 m!683611))

(assert (=> b!730625 m!683577))

(assert (=> b!730625 m!683577))

(declare-fun m!683613 () Bool)

(assert (=> b!730625 m!683613))

(declare-fun m!683615 () Bool)

(assert (=> b!730614 m!683615))

(declare-fun m!683617 () Bool)

(assert (=> start!64724 m!683617))

(declare-fun m!683619 () Bool)

(assert (=> start!64724 m!683619))

(check-sat (not b!730616) (not b!730619) (not b!730611) (not b!730628) (not start!64724) (not b!730613) (not b!730610) (not b!730618) (not b!730622) (not b!730609) (not b!730626) (not b!730620) (not b!730617) (not b!730625) (not b!730615) (not b!730614))
(check-sat)
