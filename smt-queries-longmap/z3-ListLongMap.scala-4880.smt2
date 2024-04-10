; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67262 () Bool)

(assert start!67262)

(declare-fun b!777779 () Bool)

(declare-fun res!526181 () Bool)

(declare-fun e!432756 () Bool)

(assert (=> b!777779 (=> (not res!526181) (not e!432756))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42554 0))(
  ( (array!42555 (arr!20371 (Array (_ BitVec 32) (_ BitVec 64))) (size!20792 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42554)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!777779 (= res!526181 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20371 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!777780 () Bool)

(declare-fun res!526191 () Bool)

(declare-fun e!432760 () Bool)

(assert (=> b!777780 (=> (not res!526191) (not e!432760))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777780 (= res!526191 (validKeyInArray!0 k0!2102))))

(declare-fun b!777781 () Bool)

(declare-fun res!526188 () Bool)

(assert (=> b!777781 (=> (not res!526188) (not e!432760))))

(declare-fun arrayContainsKey!0 (array!42554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777781 (= res!526188 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777782 () Bool)

(declare-fun e!432761 () Bool)

(assert (=> b!777782 (= e!432761 true)))

(declare-datatypes ((SeekEntryResult!7971 0))(
  ( (MissingZero!7971 (index!34252 (_ BitVec 32))) (Found!7971 (index!34253 (_ BitVec 32))) (Intermediate!7971 (undefined!8783 Bool) (index!34254 (_ BitVec 32)) (x!65195 (_ BitVec 32))) (Undefined!7971) (MissingVacant!7971 (index!34255 (_ BitVec 32))) )
))
(declare-fun lt!346521 () SeekEntryResult!7971)

(declare-fun lt!346520 () array!42554)

(declare-fun lt!346515 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42554 (_ BitVec 32)) SeekEntryResult!7971)

(assert (=> b!777782 (= lt!346521 (seekEntryOrOpen!0 lt!346515 lt!346520 mask!3328))))

(declare-fun b!777783 () Bool)

(declare-fun lt!346522 () SeekEntryResult!7971)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!432762 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42554 (_ BitVec 32)) SeekEntryResult!7971)

(assert (=> b!777783 (= e!432762 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!346522))))

(declare-fun b!777784 () Bool)

(declare-fun e!432758 () Bool)

(assert (=> b!777784 (= e!432758 e!432756)))

(declare-fun res!526189 () Bool)

(assert (=> b!777784 (=> (not res!526189) (not e!432756))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777784 (= res!526189 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20371 a!3186) j!159) mask!3328) (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!346522))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777784 (= lt!346522 (Intermediate!7971 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777785 () Bool)

(declare-fun res!526186 () Bool)

(assert (=> b!777785 (=> res!526186 e!432761)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42554 (_ BitVec 32)) SeekEntryResult!7971)

(assert (=> b!777785 (= res!526186 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) (Found!7971 j!159))))))

(declare-fun b!777786 () Bool)

(declare-fun res!526176 () Bool)

(assert (=> b!777786 (=> (not res!526176) (not e!432758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42554 (_ BitVec 32)) Bool)

(assert (=> b!777786 (= res!526176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777787 () Bool)

(declare-fun res!526180 () Bool)

(assert (=> b!777787 (=> (not res!526180) (not e!432758))))

(declare-datatypes ((List!14373 0))(
  ( (Nil!14370) (Cons!14369 (h!15480 (_ BitVec 64)) (t!20688 List!14373)) )
))
(declare-fun arrayNoDuplicates!0 (array!42554 (_ BitVec 32) List!14373) Bool)

(assert (=> b!777787 (= res!526180 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14370))))

(declare-fun res!526193 () Bool)

(assert (=> start!67262 (=> (not res!526193) (not e!432760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67262 (= res!526193 (validMask!0 mask!3328))))

(assert (=> start!67262 e!432760))

(assert (=> start!67262 true))

(declare-fun array_inv!16167 (array!42554) Bool)

(assert (=> start!67262 (array_inv!16167 a!3186)))

(declare-fun b!777788 () Bool)

(declare-fun e!432764 () Bool)

(assert (=> b!777788 (= e!432764 (not e!432761))))

(declare-fun res!526192 () Bool)

(assert (=> b!777788 (=> res!526192 e!432761)))

(declare-fun lt!346516 () SeekEntryResult!7971)

(get-info :version)

(assert (=> b!777788 (= res!526192 (or (not ((_ is Intermediate!7971) lt!346516)) (bvslt x!1131 (x!65195 lt!346516)) (not (= x!1131 (x!65195 lt!346516))) (not (= index!1321 (index!34254 lt!346516)))))))

(declare-fun e!432763 () Bool)

(assert (=> b!777788 e!432763))

(declare-fun res!526184 () Bool)

(assert (=> b!777788 (=> (not res!526184) (not e!432763))))

(assert (=> b!777788 (= res!526184 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26836 0))(
  ( (Unit!26837) )
))
(declare-fun lt!346517 () Unit!26836)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26836)

(assert (=> b!777788 (= lt!346517 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777789 () Bool)

(declare-fun res!526179 () Bool)

(assert (=> b!777789 (=> (not res!526179) (not e!432756))))

(assert (=> b!777789 (= res!526179 e!432762)))

(declare-fun c!86203 () Bool)

(assert (=> b!777789 (= c!86203 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777790 () Bool)

(declare-fun res!526178 () Bool)

(assert (=> b!777790 (=> (not res!526178) (not e!432760))))

(assert (=> b!777790 (= res!526178 (and (= (size!20792 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20792 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20792 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!432757 () Bool)

(declare-fun lt!346523 () SeekEntryResult!7971)

(declare-fun b!777791 () Bool)

(assert (=> b!777791 (= e!432757 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!346523))))

(declare-fun b!777792 () Bool)

(assert (=> b!777792 (= e!432756 e!432764)))

(declare-fun res!526185 () Bool)

(assert (=> b!777792 (=> (not res!526185) (not e!432764))))

(declare-fun lt!346519 () SeekEntryResult!7971)

(assert (=> b!777792 (= res!526185 (= lt!346519 lt!346516))))

(assert (=> b!777792 (= lt!346516 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346515 lt!346520 mask!3328))))

(assert (=> b!777792 (= lt!346519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346515 mask!3328) lt!346515 lt!346520 mask!3328))))

(assert (=> b!777792 (= lt!346515 (select (store (arr!20371 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777792 (= lt!346520 (array!42555 (store (arr!20371 a!3186) i!1173 k0!2102) (size!20792 a!3186)))))

(declare-fun b!777793 () Bool)

(assert (=> b!777793 (= e!432762 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) (Found!7971 j!159)))))

(declare-fun b!777794 () Bool)

(assert (=> b!777794 (= e!432760 e!432758)))

(declare-fun res!526177 () Bool)

(assert (=> b!777794 (=> (not res!526177) (not e!432758))))

(declare-fun lt!346518 () SeekEntryResult!7971)

(assert (=> b!777794 (= res!526177 (or (= lt!346518 (MissingZero!7971 i!1173)) (= lt!346518 (MissingVacant!7971 i!1173))))))

(assert (=> b!777794 (= lt!346518 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777795 () Bool)

(declare-fun res!526190 () Bool)

(assert (=> b!777795 (=> (not res!526190) (not e!432760))))

(assert (=> b!777795 (= res!526190 (validKeyInArray!0 (select (arr!20371 a!3186) j!159)))))

(declare-fun b!777796 () Bool)

(declare-fun res!526183 () Bool)

(assert (=> b!777796 (=> (not res!526183) (not e!432758))))

(assert (=> b!777796 (= res!526183 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20792 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20792 a!3186))))))

(declare-fun b!777797 () Bool)

(assert (=> b!777797 (= e!432763 e!432757)))

(declare-fun res!526187 () Bool)

(assert (=> b!777797 (=> (not res!526187) (not e!432757))))

(assert (=> b!777797 (= res!526187 (= (seekEntryOrOpen!0 (select (arr!20371 a!3186) j!159) a!3186 mask!3328) lt!346523))))

(assert (=> b!777797 (= lt!346523 (Found!7971 j!159))))

(declare-fun b!777798 () Bool)

(declare-fun res!526182 () Bool)

(assert (=> b!777798 (=> res!526182 e!432761)))

(assert (=> b!777798 (= res!526182 (or (not (= (select (store (arr!20371 a!3186) i!1173 k0!2102) index!1321) lt!346515)) (undefined!8783 lt!346516)))))

(assert (= (and start!67262 res!526193) b!777790))

(assert (= (and b!777790 res!526178) b!777795))

(assert (= (and b!777795 res!526190) b!777780))

(assert (= (and b!777780 res!526191) b!777781))

(assert (= (and b!777781 res!526188) b!777794))

(assert (= (and b!777794 res!526177) b!777786))

(assert (= (and b!777786 res!526176) b!777787))

(assert (= (and b!777787 res!526180) b!777796))

(assert (= (and b!777796 res!526183) b!777784))

(assert (= (and b!777784 res!526189) b!777779))

(assert (= (and b!777779 res!526181) b!777789))

(assert (= (and b!777789 c!86203) b!777783))

(assert (= (and b!777789 (not c!86203)) b!777793))

(assert (= (and b!777789 res!526179) b!777792))

(assert (= (and b!777792 res!526185) b!777788))

(assert (= (and b!777788 res!526184) b!777797))

(assert (= (and b!777797 res!526187) b!777791))

(assert (= (and b!777788 (not res!526192)) b!777785))

(assert (= (and b!777785 (not res!526186)) b!777798))

(assert (= (and b!777798 (not res!526182)) b!777782))

(declare-fun m!721591 () Bool)

(assert (=> b!777780 m!721591))

(declare-fun m!721593 () Bool)

(assert (=> start!67262 m!721593))

(declare-fun m!721595 () Bool)

(assert (=> start!67262 m!721595))

(declare-fun m!721597 () Bool)

(assert (=> b!777782 m!721597))

(declare-fun m!721599 () Bool)

(assert (=> b!777781 m!721599))

(declare-fun m!721601 () Bool)

(assert (=> b!777785 m!721601))

(assert (=> b!777785 m!721601))

(declare-fun m!721603 () Bool)

(assert (=> b!777785 m!721603))

(assert (=> b!777783 m!721601))

(assert (=> b!777783 m!721601))

(declare-fun m!721605 () Bool)

(assert (=> b!777783 m!721605))

(declare-fun m!721607 () Bool)

(assert (=> b!777787 m!721607))

(assert (=> b!777793 m!721601))

(assert (=> b!777793 m!721601))

(assert (=> b!777793 m!721603))

(declare-fun m!721609 () Bool)

(assert (=> b!777798 m!721609))

(declare-fun m!721611 () Bool)

(assert (=> b!777798 m!721611))

(assert (=> b!777784 m!721601))

(assert (=> b!777784 m!721601))

(declare-fun m!721613 () Bool)

(assert (=> b!777784 m!721613))

(assert (=> b!777784 m!721613))

(assert (=> b!777784 m!721601))

(declare-fun m!721615 () Bool)

(assert (=> b!777784 m!721615))

(assert (=> b!777797 m!721601))

(assert (=> b!777797 m!721601))

(declare-fun m!721617 () Bool)

(assert (=> b!777797 m!721617))

(declare-fun m!721619 () Bool)

(assert (=> b!777788 m!721619))

(declare-fun m!721621 () Bool)

(assert (=> b!777788 m!721621))

(declare-fun m!721623 () Bool)

(assert (=> b!777792 m!721623))

(declare-fun m!721625 () Bool)

(assert (=> b!777792 m!721625))

(declare-fun m!721627 () Bool)

(assert (=> b!777792 m!721627))

(declare-fun m!721629 () Bool)

(assert (=> b!777792 m!721629))

(assert (=> b!777792 m!721625))

(assert (=> b!777792 m!721609))

(assert (=> b!777791 m!721601))

(assert (=> b!777791 m!721601))

(declare-fun m!721631 () Bool)

(assert (=> b!777791 m!721631))

(declare-fun m!721633 () Bool)

(assert (=> b!777786 m!721633))

(assert (=> b!777795 m!721601))

(assert (=> b!777795 m!721601))

(declare-fun m!721635 () Bool)

(assert (=> b!777795 m!721635))

(declare-fun m!721637 () Bool)

(assert (=> b!777779 m!721637))

(declare-fun m!721639 () Bool)

(assert (=> b!777794 m!721639))

(check-sat (not b!777792) (not b!777788) (not b!777791) (not b!777780) (not b!777787) (not b!777785) (not b!777781) (not b!777782) (not b!777793) (not b!777797) (not b!777795) (not start!67262) (not b!777783) (not b!777786) (not b!777794) (not b!777784))
(check-sat)
