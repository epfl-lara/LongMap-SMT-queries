; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65096 () Bool)

(assert start!65096)

(declare-fun b!734741 () Bool)

(declare-fun res!493727 () Bool)

(declare-fun e!411096 () Bool)

(assert (=> b!734741 (=> (not res!493727) (not e!411096))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41286 0))(
  ( (array!41287 (arr!19757 (Array (_ BitVec 32) (_ BitVec 64))) (size!20178 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41286)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!734741 (= res!493727 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19757 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!734742 () Bool)

(declare-fun res!493713 () Bool)

(declare-fun e!411099 () Bool)

(assert (=> b!734742 (=> (not res!493713) (not e!411099))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734742 (= res!493713 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20178 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20178 a!3186))))))

(declare-fun b!734743 () Bool)

(declare-fun res!493717 () Bool)

(assert (=> b!734743 (=> (not res!493717) (not e!411096))))

(declare-fun e!411092 () Bool)

(assert (=> b!734743 (= res!493717 e!411092)))

(declare-fun c!80895 () Bool)

(assert (=> b!734743 (= c!80895 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734744 () Bool)

(declare-fun e!411093 () Bool)

(declare-fun e!411100 () Bool)

(assert (=> b!734744 (= e!411093 (not e!411100))))

(declare-fun res!493716 () Bool)

(assert (=> b!734744 (=> res!493716 e!411100)))

(declare-datatypes ((SeekEntryResult!7354 0))(
  ( (MissingZero!7354 (index!31784 (_ BitVec 32))) (Found!7354 (index!31785 (_ BitVec 32))) (Intermediate!7354 (undefined!8166 Bool) (index!31786 (_ BitVec 32)) (x!62803 (_ BitVec 32))) (Undefined!7354) (MissingVacant!7354 (index!31787 (_ BitVec 32))) )
))
(declare-fun lt!325525 () SeekEntryResult!7354)

(get-info :version)

(assert (=> b!734744 (= res!493716 (or (not ((_ is Intermediate!7354) lt!325525)) (bvsge x!1131 (x!62803 lt!325525))))))

(declare-fun e!411098 () Bool)

(assert (=> b!734744 e!411098))

(declare-fun res!493715 () Bool)

(assert (=> b!734744 (=> (not res!493715) (not e!411098))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41286 (_ BitVec 32)) Bool)

(assert (=> b!734744 (= res!493715 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24998 0))(
  ( (Unit!24999) )
))
(declare-fun lt!325523 () Unit!24998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41286 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24998)

(assert (=> b!734744 (= lt!325523 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!734745 () Bool)

(assert (=> b!734745 (= e!411096 e!411093)))

(declare-fun res!493719 () Bool)

(assert (=> b!734745 (=> (not res!493719) (not e!411093))))

(declare-fun lt!325522 () SeekEntryResult!7354)

(assert (=> b!734745 (= res!493719 (= lt!325522 lt!325525))))

(declare-fun lt!325529 () array!41286)

(declare-fun lt!325520 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41286 (_ BitVec 32)) SeekEntryResult!7354)

(assert (=> b!734745 (= lt!325525 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325520 lt!325529 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734745 (= lt!325522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325520 mask!3328) lt!325520 lt!325529 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!734745 (= lt!325520 (select (store (arr!19757 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!734745 (= lt!325529 (array!41287 (store (arr!19757 a!3186) i!1173 k0!2102) (size!20178 a!3186)))))

(declare-fun b!734747 () Bool)

(declare-fun res!493712 () Bool)

(declare-fun e!411094 () Bool)

(assert (=> b!734747 (=> (not res!493712) (not e!411094))))

(assert (=> b!734747 (= res!493712 (and (= (size!20178 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20178 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20178 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!734748 () Bool)

(declare-fun res!493718 () Bool)

(assert (=> b!734748 (=> (not res!493718) (not e!411094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734748 (= res!493718 (validKeyInArray!0 k0!2102))))

(declare-fun b!734749 () Bool)

(declare-fun e!411091 () Bool)

(assert (=> b!734749 (= e!411100 e!411091)))

(declare-fun res!493722 () Bool)

(assert (=> b!734749 (=> res!493722 e!411091)))

(assert (=> b!734749 (= res!493722 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325527 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734749 (= lt!325527 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!734750 () Bool)

(declare-fun res!493721 () Bool)

(assert (=> b!734750 (=> (not res!493721) (not e!411094))))

(assert (=> b!734750 (= res!493721 (validKeyInArray!0 (select (arr!19757 a!3186) j!159)))))

(declare-fun b!734751 () Bool)

(declare-fun res!493723 () Bool)

(assert (=> b!734751 (=> (not res!493723) (not e!411094))))

(declare-fun arrayContainsKey!0 (array!41286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!734751 (= res!493723 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!734752 () Bool)

(declare-fun e!411097 () Bool)

(assert (=> b!734752 (= e!411098 e!411097)))

(declare-fun res!493720 () Bool)

(assert (=> b!734752 (=> (not res!493720) (not e!411097))))

(declare-fun lt!325524 () SeekEntryResult!7354)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41286 (_ BitVec 32)) SeekEntryResult!7354)

(assert (=> b!734752 (= res!493720 (= (seekEntryOrOpen!0 (select (arr!19757 a!3186) j!159) a!3186 mask!3328) lt!325524))))

(assert (=> b!734752 (= lt!325524 (Found!7354 j!159))))

(declare-fun b!734746 () Bool)

(declare-fun res!493726 () Bool)

(assert (=> b!734746 (=> (not res!493726) (not e!411099))))

(declare-datatypes ((List!13798 0))(
  ( (Nil!13795) (Cons!13794 (h!14866 (_ BitVec 64)) (t!20104 List!13798)) )
))
(declare-fun arrayNoDuplicates!0 (array!41286 (_ BitVec 32) List!13798) Bool)

(assert (=> b!734746 (= res!493726 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13795))))

(declare-fun res!493724 () Bool)

(assert (=> start!65096 (=> (not res!493724) (not e!411094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65096 (= res!493724 (validMask!0 mask!3328))))

(assert (=> start!65096 e!411094))

(assert (=> start!65096 true))

(declare-fun array_inv!15640 (array!41286) Bool)

(assert (=> start!65096 (array_inv!15640 a!3186)))

(declare-fun b!734753 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41286 (_ BitVec 32)) SeekEntryResult!7354)

(assert (=> b!734753 (= e!411092 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19757 a!3186) j!159) a!3186 mask!3328) (Found!7354 j!159)))))

(declare-fun b!734754 () Bool)

(declare-fun res!493728 () Bool)

(assert (=> b!734754 (=> (not res!493728) (not e!411099))))

(assert (=> b!734754 (= res!493728 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!734755 () Bool)

(assert (=> b!734755 (= e!411091 true)))

(declare-fun lt!325528 () SeekEntryResult!7354)

(assert (=> b!734755 (= lt!325528 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19757 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!734756 () Bool)

(assert (=> b!734756 (= e!411097 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19757 a!3186) j!159) a!3186 mask!3328) lt!325524))))

(declare-fun lt!325521 () SeekEntryResult!7354)

(declare-fun b!734757 () Bool)

(assert (=> b!734757 (= e!411092 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19757 a!3186) j!159) a!3186 mask!3328) lt!325521))))

(declare-fun b!734758 () Bool)

(assert (=> b!734758 (= e!411094 e!411099)))

(declare-fun res!493714 () Bool)

(assert (=> b!734758 (=> (not res!493714) (not e!411099))))

(declare-fun lt!325526 () SeekEntryResult!7354)

(assert (=> b!734758 (= res!493714 (or (= lt!325526 (MissingZero!7354 i!1173)) (= lt!325526 (MissingVacant!7354 i!1173))))))

(assert (=> b!734758 (= lt!325526 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!734759 () Bool)

(assert (=> b!734759 (= e!411099 e!411096)))

(declare-fun res!493725 () Bool)

(assert (=> b!734759 (=> (not res!493725) (not e!411096))))

(assert (=> b!734759 (= res!493725 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19757 a!3186) j!159) mask!3328) (select (arr!19757 a!3186) j!159) a!3186 mask!3328) lt!325521))))

(assert (=> b!734759 (= lt!325521 (Intermediate!7354 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65096 res!493724) b!734747))

(assert (= (and b!734747 res!493712) b!734750))

(assert (= (and b!734750 res!493721) b!734748))

(assert (= (and b!734748 res!493718) b!734751))

(assert (= (and b!734751 res!493723) b!734758))

(assert (= (and b!734758 res!493714) b!734754))

(assert (= (and b!734754 res!493728) b!734746))

(assert (= (and b!734746 res!493726) b!734742))

(assert (= (and b!734742 res!493713) b!734759))

(assert (= (and b!734759 res!493725) b!734741))

(assert (= (and b!734741 res!493727) b!734743))

(assert (= (and b!734743 c!80895) b!734757))

(assert (= (and b!734743 (not c!80895)) b!734753))

(assert (= (and b!734743 res!493717) b!734745))

(assert (= (and b!734745 res!493719) b!734744))

(assert (= (and b!734744 res!493715) b!734752))

(assert (= (and b!734752 res!493720) b!734756))

(assert (= (and b!734744 (not res!493716)) b!734749))

(assert (= (and b!734749 (not res!493722)) b!734755))

(declare-fun m!686717 () Bool)

(assert (=> b!734745 m!686717))

(declare-fun m!686719 () Bool)

(assert (=> b!734745 m!686719))

(declare-fun m!686721 () Bool)

(assert (=> b!734745 m!686721))

(declare-fun m!686723 () Bool)

(assert (=> b!734745 m!686723))

(declare-fun m!686725 () Bool)

(assert (=> b!734745 m!686725))

(assert (=> b!734745 m!686717))

(declare-fun m!686727 () Bool)

(assert (=> b!734750 m!686727))

(assert (=> b!734750 m!686727))

(declare-fun m!686729 () Bool)

(assert (=> b!734750 m!686729))

(assert (=> b!734752 m!686727))

(assert (=> b!734752 m!686727))

(declare-fun m!686731 () Bool)

(assert (=> b!734752 m!686731))

(assert (=> b!734757 m!686727))

(assert (=> b!734757 m!686727))

(declare-fun m!686733 () Bool)

(assert (=> b!734757 m!686733))

(assert (=> b!734756 m!686727))

(assert (=> b!734756 m!686727))

(declare-fun m!686735 () Bool)

(assert (=> b!734756 m!686735))

(declare-fun m!686737 () Bool)

(assert (=> b!734754 m!686737))

(declare-fun m!686739 () Bool)

(assert (=> b!734746 m!686739))

(assert (=> b!734759 m!686727))

(assert (=> b!734759 m!686727))

(declare-fun m!686741 () Bool)

(assert (=> b!734759 m!686741))

(assert (=> b!734759 m!686741))

(assert (=> b!734759 m!686727))

(declare-fun m!686743 () Bool)

(assert (=> b!734759 m!686743))

(declare-fun m!686745 () Bool)

(assert (=> start!65096 m!686745))

(declare-fun m!686747 () Bool)

(assert (=> start!65096 m!686747))

(declare-fun m!686749 () Bool)

(assert (=> b!734758 m!686749))

(assert (=> b!734755 m!686727))

(assert (=> b!734755 m!686727))

(declare-fun m!686751 () Bool)

(assert (=> b!734755 m!686751))

(declare-fun m!686753 () Bool)

(assert (=> b!734749 m!686753))

(declare-fun m!686755 () Bool)

(assert (=> b!734748 m!686755))

(declare-fun m!686757 () Bool)

(assert (=> b!734741 m!686757))

(declare-fun m!686759 () Bool)

(assert (=> b!734751 m!686759))

(assert (=> b!734753 m!686727))

(assert (=> b!734753 m!686727))

(assert (=> b!734753 m!686751))

(declare-fun m!686761 () Bool)

(assert (=> b!734744 m!686761))

(declare-fun m!686763 () Bool)

(assert (=> b!734744 m!686763))

(check-sat (not b!734752) (not start!65096) (not b!734754) (not b!734755) (not b!734756) (not b!734759) (not b!734758) (not b!734748) (not b!734750) (not b!734753) (not b!734751) (not b!734745) (not b!734746) (not b!734757) (not b!734744) (not b!734749))
(check-sat)
