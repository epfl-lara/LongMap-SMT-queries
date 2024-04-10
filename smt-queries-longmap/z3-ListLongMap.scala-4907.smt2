; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67688 () Bool)

(assert start!67688)

(declare-fun b!784448 () Bool)

(declare-fun res!530853 () Bool)

(declare-fun e!436142 () Bool)

(assert (=> b!784448 (=> (not res!530853) (not e!436142))))

(declare-datatypes ((array!42728 0))(
  ( (array!42729 (arr!20452 (Array (_ BitVec 32) (_ BitVec 64))) (size!20873 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42728)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!784448 (= res!530853 (and (= (size!20873 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20873 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20873 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784449 () Bool)

(declare-fun res!530861 () Bool)

(declare-fun e!436141 () Bool)

(assert (=> b!784449 (=> (not res!530861) (not e!436141))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784449 (= res!530861 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20873 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20873 a!3186))))))

(declare-fun b!784450 () Bool)

(declare-fun res!530851 () Bool)

(declare-fun e!436137 () Bool)

(assert (=> b!784450 (=> (not res!530851) (not e!436137))))

(declare-fun e!436139 () Bool)

(assert (=> b!784450 (= res!530851 e!436139)))

(declare-fun c!87211 () Bool)

(assert (=> b!784450 (= c!87211 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784451 () Bool)

(declare-datatypes ((SeekEntryResult!8052 0))(
  ( (MissingZero!8052 (index!34576 (_ BitVec 32))) (Found!8052 (index!34577 (_ BitVec 32))) (Intermediate!8052 (undefined!8864 Bool) (index!34578 (_ BitVec 32)) (x!65528 (_ BitVec 32))) (Undefined!8052) (MissingVacant!8052 (index!34579 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42728 (_ BitVec 32)) SeekEntryResult!8052)

(assert (=> b!784451 (= e!436139 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20452 a!3186) j!159) a!3186 mask!3328) (Found!8052 j!159)))))

(declare-fun b!784452 () Bool)

(declare-fun lt!349693 () SeekEntryResult!8052)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42728 (_ BitVec 32)) SeekEntryResult!8052)

(assert (=> b!784452 (= e!436139 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20452 a!3186) j!159) a!3186 mask!3328) lt!349693))))

(declare-fun b!784453 () Bool)

(assert (=> b!784453 (= e!436141 e!436137)))

(declare-fun res!530850 () Bool)

(assert (=> b!784453 (=> (not res!530850) (not e!436137))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784453 (= res!530850 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20452 a!3186) j!159) mask!3328) (select (arr!20452 a!3186) j!159) a!3186 mask!3328) lt!349693))))

(assert (=> b!784453 (= lt!349693 (Intermediate!8052 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784454 () Bool)

(declare-fun res!530858 () Bool)

(declare-fun e!436147 () Bool)

(assert (=> b!784454 (=> (not res!530858) (not e!436147))))

(declare-fun lt!349700 () (_ BitVec 64))

(declare-fun lt!349691 () array!42728)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42728 (_ BitVec 32)) SeekEntryResult!8052)

(assert (=> b!784454 (= res!530858 (= (seekEntryOrOpen!0 lt!349700 lt!349691 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349700 lt!349691 mask!3328)))))

(declare-fun b!784455 () Bool)

(declare-fun e!436138 () Bool)

(assert (=> b!784455 (= e!436138 true)))

(assert (=> b!784455 e!436147))

(declare-fun res!530845 () Bool)

(assert (=> b!784455 (=> (not res!530845) (not e!436147))))

(declare-fun lt!349695 () (_ BitVec 64))

(assert (=> b!784455 (= res!530845 (= lt!349695 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27096 0))(
  ( (Unit!27097) )
))
(declare-fun lt!349694 () Unit!27096)

(declare-fun e!436144 () Unit!27096)

(assert (=> b!784455 (= lt!349694 e!436144)))

(declare-fun c!87210 () Bool)

(assert (=> b!784455 (= c!87210 (= lt!349695 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784456 () Bool)

(declare-fun res!530860 () Bool)

(assert (=> b!784456 (=> (not res!530860) (not e!436142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784456 (= res!530860 (validKeyInArray!0 (select (arr!20452 a!3186) j!159)))))

(declare-fun b!784457 () Bool)

(declare-fun e!436146 () Bool)

(assert (=> b!784457 (= e!436137 e!436146)))

(declare-fun res!530849 () Bool)

(assert (=> b!784457 (=> (not res!530849) (not e!436146))))

(declare-fun lt!349689 () SeekEntryResult!8052)

(declare-fun lt!349690 () SeekEntryResult!8052)

(assert (=> b!784457 (= res!530849 (= lt!349689 lt!349690))))

(assert (=> b!784457 (= lt!349690 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349700 lt!349691 mask!3328))))

(assert (=> b!784457 (= lt!349689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349700 mask!3328) lt!349700 lt!349691 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!784457 (= lt!349700 (select (store (arr!20452 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784457 (= lt!349691 (array!42729 (store (arr!20452 a!3186) i!1173 k0!2102) (size!20873 a!3186)))))

(declare-fun b!784458 () Bool)

(declare-fun res!530855 () Bool)

(assert (=> b!784458 (=> (not res!530855) (not e!436137))))

(assert (=> b!784458 (= res!530855 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20452 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784459 () Bool)

(declare-fun res!530848 () Bool)

(assert (=> b!784459 (=> (not res!530848) (not e!436141))))

(declare-datatypes ((List!14454 0))(
  ( (Nil!14451) (Cons!14450 (h!15573 (_ BitVec 64)) (t!20769 List!14454)) )
))
(declare-fun arrayNoDuplicates!0 (array!42728 (_ BitVec 32) List!14454) Bool)

(assert (=> b!784459 (= res!530848 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14451))))

(declare-fun b!784461 () Bool)

(declare-fun Unit!27098 () Unit!27096)

(assert (=> b!784461 (= e!436144 Unit!27098)))

(declare-fun b!784462 () Bool)

(declare-fun res!530844 () Bool)

(assert (=> b!784462 (=> (not res!530844) (not e!436142))))

(assert (=> b!784462 (= res!530844 (validKeyInArray!0 k0!2102))))

(declare-fun b!784463 () Bool)

(declare-fun Unit!27099 () Unit!27096)

(assert (=> b!784463 (= e!436144 Unit!27099)))

(assert (=> b!784463 false))

(declare-fun b!784464 () Bool)

(declare-fun res!530856 () Bool)

(assert (=> b!784464 (=> (not res!530856) (not e!436141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42728 (_ BitVec 32)) Bool)

(assert (=> b!784464 (= res!530856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784465 () Bool)

(declare-fun res!530857 () Bool)

(assert (=> b!784465 (=> (not res!530857) (not e!436142))))

(declare-fun arrayContainsKey!0 (array!42728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784465 (= res!530857 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784466 () Bool)

(declare-fun e!436143 () Bool)

(assert (=> b!784466 (= e!436143 e!436138)))

(declare-fun res!530847 () Bool)

(assert (=> b!784466 (=> res!530847 e!436138)))

(assert (=> b!784466 (= res!530847 (= lt!349695 lt!349700))))

(assert (=> b!784466 (= lt!349695 (select (store (arr!20452 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784467 () Bool)

(assert (=> b!784467 (= e!436142 e!436141)))

(declare-fun res!530843 () Bool)

(assert (=> b!784467 (=> (not res!530843) (not e!436141))))

(declare-fun lt!349697 () SeekEntryResult!8052)

(assert (=> b!784467 (= res!530843 (or (= lt!349697 (MissingZero!8052 i!1173)) (= lt!349697 (MissingVacant!8052 i!1173))))))

(assert (=> b!784467 (= lt!349697 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784468 () Bool)

(declare-fun e!436140 () Bool)

(assert (=> b!784468 (= e!436146 (not e!436140))))

(declare-fun res!530846 () Bool)

(assert (=> b!784468 (=> res!530846 e!436140)))

(get-info :version)

(assert (=> b!784468 (= res!530846 (or (not ((_ is Intermediate!8052) lt!349690)) (bvslt x!1131 (x!65528 lt!349690)) (not (= x!1131 (x!65528 lt!349690))) (not (= index!1321 (index!34578 lt!349690)))))))

(declare-fun e!436145 () Bool)

(assert (=> b!784468 e!436145))

(declare-fun res!530852 () Bool)

(assert (=> b!784468 (=> (not res!530852) (not e!436145))))

(declare-fun lt!349698 () SeekEntryResult!8052)

(declare-fun lt!349696 () SeekEntryResult!8052)

(assert (=> b!784468 (= res!530852 (= lt!349698 lt!349696))))

(assert (=> b!784468 (= lt!349696 (Found!8052 j!159))))

(assert (=> b!784468 (= lt!349698 (seekEntryOrOpen!0 (select (arr!20452 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784468 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349699 () Unit!27096)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42728 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27096)

(assert (=> b!784468 (= lt!349699 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784469 () Bool)

(declare-fun lt!349692 () SeekEntryResult!8052)

(assert (=> b!784469 (= e!436147 (= lt!349698 lt!349692))))

(declare-fun b!784470 () Bool)

(assert (=> b!784470 (= e!436145 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20452 a!3186) j!159) a!3186 mask!3328) lt!349696))))

(declare-fun b!784460 () Bool)

(assert (=> b!784460 (= e!436140 e!436143)))

(declare-fun res!530859 () Bool)

(assert (=> b!784460 (=> res!530859 e!436143)))

(assert (=> b!784460 (= res!530859 (not (= lt!349692 lt!349696)))))

(assert (=> b!784460 (= lt!349692 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20452 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!530854 () Bool)

(assert (=> start!67688 (=> (not res!530854) (not e!436142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67688 (= res!530854 (validMask!0 mask!3328))))

(assert (=> start!67688 e!436142))

(assert (=> start!67688 true))

(declare-fun array_inv!16248 (array!42728) Bool)

(assert (=> start!67688 (array_inv!16248 a!3186)))

(assert (= (and start!67688 res!530854) b!784448))

(assert (= (and b!784448 res!530853) b!784456))

(assert (= (and b!784456 res!530860) b!784462))

(assert (= (and b!784462 res!530844) b!784465))

(assert (= (and b!784465 res!530857) b!784467))

(assert (= (and b!784467 res!530843) b!784464))

(assert (= (and b!784464 res!530856) b!784459))

(assert (= (and b!784459 res!530848) b!784449))

(assert (= (and b!784449 res!530861) b!784453))

(assert (= (and b!784453 res!530850) b!784458))

(assert (= (and b!784458 res!530855) b!784450))

(assert (= (and b!784450 c!87211) b!784452))

(assert (= (and b!784450 (not c!87211)) b!784451))

(assert (= (and b!784450 res!530851) b!784457))

(assert (= (and b!784457 res!530849) b!784468))

(assert (= (and b!784468 res!530852) b!784470))

(assert (= (and b!784468 (not res!530846)) b!784460))

(assert (= (and b!784460 (not res!530859)) b!784466))

(assert (= (and b!784466 (not res!530847)) b!784455))

(assert (= (and b!784455 c!87210) b!784463))

(assert (= (and b!784455 (not c!87210)) b!784461))

(assert (= (and b!784455 res!530845) b!784454))

(assert (= (and b!784454 res!530858) b!784469))

(declare-fun m!726765 () Bool)

(assert (=> b!784467 m!726765))

(declare-fun m!726767 () Bool)

(assert (=> b!784464 m!726767))

(declare-fun m!726769 () Bool)

(assert (=> start!67688 m!726769))

(declare-fun m!726771 () Bool)

(assert (=> start!67688 m!726771))

(declare-fun m!726773 () Bool)

(assert (=> b!784452 m!726773))

(assert (=> b!784452 m!726773))

(declare-fun m!726775 () Bool)

(assert (=> b!784452 m!726775))

(assert (=> b!784456 m!726773))

(assert (=> b!784456 m!726773))

(declare-fun m!726777 () Bool)

(assert (=> b!784456 m!726777))

(declare-fun m!726779 () Bool)

(assert (=> b!784462 m!726779))

(declare-fun m!726781 () Bool)

(assert (=> b!784466 m!726781))

(declare-fun m!726783 () Bool)

(assert (=> b!784466 m!726783))

(declare-fun m!726785 () Bool)

(assert (=> b!784454 m!726785))

(declare-fun m!726787 () Bool)

(assert (=> b!784454 m!726787))

(declare-fun m!726789 () Bool)

(assert (=> b!784465 m!726789))

(declare-fun m!726791 () Bool)

(assert (=> b!784459 m!726791))

(assert (=> b!784470 m!726773))

(assert (=> b!784470 m!726773))

(declare-fun m!726793 () Bool)

(assert (=> b!784470 m!726793))

(assert (=> b!784453 m!726773))

(assert (=> b!784453 m!726773))

(declare-fun m!726795 () Bool)

(assert (=> b!784453 m!726795))

(assert (=> b!784453 m!726795))

(assert (=> b!784453 m!726773))

(declare-fun m!726797 () Bool)

(assert (=> b!784453 m!726797))

(assert (=> b!784451 m!726773))

(assert (=> b!784451 m!726773))

(declare-fun m!726799 () Bool)

(assert (=> b!784451 m!726799))

(assert (=> b!784468 m!726773))

(assert (=> b!784468 m!726773))

(declare-fun m!726801 () Bool)

(assert (=> b!784468 m!726801))

(declare-fun m!726803 () Bool)

(assert (=> b!784468 m!726803))

(declare-fun m!726805 () Bool)

(assert (=> b!784468 m!726805))

(declare-fun m!726807 () Bool)

(assert (=> b!784458 m!726807))

(declare-fun m!726809 () Bool)

(assert (=> b!784457 m!726809))

(assert (=> b!784457 m!726781))

(declare-fun m!726811 () Bool)

(assert (=> b!784457 m!726811))

(assert (=> b!784457 m!726809))

(declare-fun m!726813 () Bool)

(assert (=> b!784457 m!726813))

(declare-fun m!726815 () Bool)

(assert (=> b!784457 m!726815))

(assert (=> b!784460 m!726773))

(assert (=> b!784460 m!726773))

(assert (=> b!784460 m!726799))

(check-sat (not b!784452) (not b!784456) (not b!784468) (not b!784453) (not b!784467) (not b!784451) (not b!784464) (not start!67688) (not b!784457) (not b!784462) (not b!784454) (not b!784460) (not b!784470) (not b!784459) (not b!784465))
(check-sat)
