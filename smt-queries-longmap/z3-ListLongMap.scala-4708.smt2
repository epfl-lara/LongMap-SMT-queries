; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65310 () Bool)

(assert start!65310)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41483 0))(
  ( (array!41484 (arr!19855 (Array (_ BitVec 32) (_ BitVec 64))) (size!20276 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41483)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!741698 () Bool)

(declare-fun e!414573 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7455 0))(
  ( (MissingZero!7455 (index!32188 (_ BitVec 32))) (Found!7455 (index!32189 (_ BitVec 32))) (Intermediate!7455 (undefined!8267 Bool) (index!32190 (_ BitVec 32)) (x!63165 (_ BitVec 32))) (Undefined!7455) (MissingVacant!7455 (index!32191 (_ BitVec 32))) )
))
(declare-fun lt!329519 () SeekEntryResult!7455)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41483 (_ BitVec 32)) SeekEntryResult!7455)

(assert (=> b!741698 (= e!414573 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19855 a!3186) j!159) a!3186 mask!3328) lt!329519))))

(declare-fun b!741699 () Bool)

(declare-fun res!498989 () Bool)

(declare-fun e!414568 () Bool)

(assert (=> b!741699 (=> (not res!498989) (not e!414568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41483 (_ BitVec 32)) Bool)

(assert (=> b!741699 (= res!498989 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741700 () Bool)

(declare-fun res!498978 () Bool)

(assert (=> b!741700 (=> (not res!498978) (not e!414568))))

(declare-datatypes ((List!13857 0))(
  ( (Nil!13854) (Cons!13853 (h!14925 (_ BitVec 64)) (t!20172 List!13857)) )
))
(declare-fun arrayNoDuplicates!0 (array!41483 (_ BitVec 32) List!13857) Bool)

(assert (=> b!741700 (= res!498978 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13854))))

(declare-fun b!741701 () Bool)

(declare-fun e!414569 () Bool)

(assert (=> b!741701 (= e!414569 e!414568)))

(declare-fun res!498982 () Bool)

(assert (=> b!741701 (=> (not res!498982) (not e!414568))))

(declare-fun lt!329514 () SeekEntryResult!7455)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741701 (= res!498982 (or (= lt!329514 (MissingZero!7455 i!1173)) (= lt!329514 (MissingVacant!7455 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41483 (_ BitVec 32)) SeekEntryResult!7455)

(assert (=> b!741701 (= lt!329514 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741702 () Bool)

(declare-fun e!414570 () Bool)

(assert (=> b!741702 (= e!414570 (not true))))

(declare-fun e!414575 () Bool)

(assert (=> b!741702 e!414575))

(declare-fun res!498987 () Bool)

(assert (=> b!741702 (=> (not res!498987) (not e!414575))))

(assert (=> b!741702 (= res!498987 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25390 0))(
  ( (Unit!25391) )
))
(declare-fun lt!329515 () Unit!25390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25390)

(assert (=> b!741702 (= lt!329515 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741703 () Bool)

(declare-fun res!498976 () Bool)

(assert (=> b!741703 (=> (not res!498976) (not e!414569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741703 (= res!498976 (validKeyInArray!0 (select (arr!19855 a!3186) j!159)))))

(declare-fun b!741704 () Bool)

(declare-fun res!498980 () Bool)

(assert (=> b!741704 (=> (not res!498980) (not e!414569))))

(assert (=> b!741704 (= res!498980 (validKeyInArray!0 k0!2102))))

(declare-fun e!414574 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!741705 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!741705 (= e!414574 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19855 a!3186) j!159) a!3186 mask!3328) (Found!7455 j!159)))))

(declare-fun lt!329516 () SeekEntryResult!7455)

(declare-fun b!741706 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41483 (_ BitVec 32)) SeekEntryResult!7455)

(assert (=> b!741706 (= e!414574 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19855 a!3186) j!159) a!3186 mask!3328) lt!329516))))

(declare-fun b!741707 () Bool)

(assert (=> b!741707 (= e!414575 e!414573)))

(declare-fun res!498983 () Bool)

(assert (=> b!741707 (=> (not res!498983) (not e!414573))))

(assert (=> b!741707 (= res!498983 (= (seekEntryOrOpen!0 (select (arr!19855 a!3186) j!159) a!3186 mask!3328) lt!329519))))

(assert (=> b!741707 (= lt!329519 (Found!7455 j!159))))

(declare-fun b!741708 () Bool)

(declare-fun res!498986 () Bool)

(declare-fun e!414572 () Bool)

(assert (=> b!741708 (=> (not res!498986) (not e!414572))))

(assert (=> b!741708 (= res!498986 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19855 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741709 () Bool)

(declare-fun res!498979 () Bool)

(assert (=> b!741709 (=> (not res!498979) (not e!414572))))

(assert (=> b!741709 (= res!498979 e!414574)))

(declare-fun c!81742 () Bool)

(assert (=> b!741709 (= c!81742 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741710 () Bool)

(assert (=> b!741710 (= e!414568 e!414572)))

(declare-fun res!498984 () Bool)

(assert (=> b!741710 (=> (not res!498984) (not e!414572))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741710 (= res!498984 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19855 a!3186) j!159) mask!3328) (select (arr!19855 a!3186) j!159) a!3186 mask!3328) lt!329516))))

(assert (=> b!741710 (= lt!329516 (Intermediate!7455 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741711 () Bool)

(declare-fun res!498985 () Bool)

(assert (=> b!741711 (=> (not res!498985) (not e!414569))))

(assert (=> b!741711 (= res!498985 (and (= (size!20276 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20276 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20276 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!498975 () Bool)

(assert (=> start!65310 (=> (not res!498975) (not e!414569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65310 (= res!498975 (validMask!0 mask!3328))))

(assert (=> start!65310 e!414569))

(assert (=> start!65310 true))

(declare-fun array_inv!15651 (array!41483) Bool)

(assert (=> start!65310 (array_inv!15651 a!3186)))

(declare-fun b!741712 () Bool)

(assert (=> b!741712 (= e!414572 e!414570)))

(declare-fun res!498988 () Bool)

(assert (=> b!741712 (=> (not res!498988) (not e!414570))))

(declare-fun lt!329518 () (_ BitVec 64))

(declare-fun lt!329517 () array!41483)

(assert (=> b!741712 (= res!498988 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329518 mask!3328) lt!329518 lt!329517 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329518 lt!329517 mask!3328)))))

(assert (=> b!741712 (= lt!329518 (select (store (arr!19855 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741712 (= lt!329517 (array!41484 (store (arr!19855 a!3186) i!1173 k0!2102) (size!20276 a!3186)))))

(declare-fun b!741713 () Bool)

(declare-fun res!498981 () Bool)

(assert (=> b!741713 (=> (not res!498981) (not e!414569))))

(declare-fun arrayContainsKey!0 (array!41483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741713 (= res!498981 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741714 () Bool)

(declare-fun res!498977 () Bool)

(assert (=> b!741714 (=> (not res!498977) (not e!414568))))

(assert (=> b!741714 (= res!498977 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20276 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20276 a!3186))))))

(assert (= (and start!65310 res!498975) b!741711))

(assert (= (and b!741711 res!498985) b!741703))

(assert (= (and b!741703 res!498976) b!741704))

(assert (= (and b!741704 res!498980) b!741713))

(assert (= (and b!741713 res!498981) b!741701))

(assert (= (and b!741701 res!498982) b!741699))

(assert (= (and b!741699 res!498989) b!741700))

(assert (= (and b!741700 res!498978) b!741714))

(assert (= (and b!741714 res!498977) b!741710))

(assert (= (and b!741710 res!498984) b!741708))

(assert (= (and b!741708 res!498986) b!741709))

(assert (= (and b!741709 c!81742) b!741706))

(assert (= (and b!741709 (not c!81742)) b!741705))

(assert (= (and b!741709 res!498979) b!741712))

(assert (= (and b!741712 res!498988) b!741702))

(assert (= (and b!741702 res!498987) b!741707))

(assert (= (and b!741707 res!498983) b!741698))

(declare-fun m!692645 () Bool)

(assert (=> b!741713 m!692645))

(declare-fun m!692647 () Bool)

(assert (=> b!741710 m!692647))

(assert (=> b!741710 m!692647))

(declare-fun m!692649 () Bool)

(assert (=> b!741710 m!692649))

(assert (=> b!741710 m!692649))

(assert (=> b!741710 m!692647))

(declare-fun m!692651 () Bool)

(assert (=> b!741710 m!692651))

(declare-fun m!692653 () Bool)

(assert (=> b!741712 m!692653))

(declare-fun m!692655 () Bool)

(assert (=> b!741712 m!692655))

(assert (=> b!741712 m!692653))

(declare-fun m!692657 () Bool)

(assert (=> b!741712 m!692657))

(declare-fun m!692659 () Bool)

(assert (=> b!741712 m!692659))

(declare-fun m!692661 () Bool)

(assert (=> b!741712 m!692661))

(declare-fun m!692663 () Bool)

(assert (=> b!741704 m!692663))

(assert (=> b!741703 m!692647))

(assert (=> b!741703 m!692647))

(declare-fun m!692665 () Bool)

(assert (=> b!741703 m!692665))

(assert (=> b!741698 m!692647))

(assert (=> b!741698 m!692647))

(declare-fun m!692667 () Bool)

(assert (=> b!741698 m!692667))

(assert (=> b!741706 m!692647))

(assert (=> b!741706 m!692647))

(declare-fun m!692669 () Bool)

(assert (=> b!741706 m!692669))

(declare-fun m!692671 () Bool)

(assert (=> b!741701 m!692671))

(declare-fun m!692673 () Bool)

(assert (=> b!741708 m!692673))

(declare-fun m!692675 () Bool)

(assert (=> b!741699 m!692675))

(declare-fun m!692677 () Bool)

(assert (=> b!741700 m!692677))

(declare-fun m!692679 () Bool)

(assert (=> start!65310 m!692679))

(declare-fun m!692681 () Bool)

(assert (=> start!65310 m!692681))

(assert (=> b!741707 m!692647))

(assert (=> b!741707 m!692647))

(declare-fun m!692683 () Bool)

(assert (=> b!741707 m!692683))

(assert (=> b!741705 m!692647))

(assert (=> b!741705 m!692647))

(declare-fun m!692685 () Bool)

(assert (=> b!741705 m!692685))

(declare-fun m!692687 () Bool)

(assert (=> b!741702 m!692687))

(declare-fun m!692689 () Bool)

(assert (=> b!741702 m!692689))

(check-sat (not b!741712) (not b!741701) (not start!65310) (not b!741698) (not b!741703) (not b!741705) (not b!741704) (not b!741700) (not b!741702) (not b!741710) (not b!741707) (not b!741699) (not b!741706) (not b!741713))
(check-sat)
