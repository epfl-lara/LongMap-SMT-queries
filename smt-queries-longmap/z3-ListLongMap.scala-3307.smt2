; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45788 () Bool)

(assert start!45788)

(declare-fun b!506785 () Bool)

(declare-fun e!296610 () Bool)

(declare-fun e!296609 () Bool)

(assert (=> b!506785 (= e!296610 (not e!296609))))

(declare-fun res!307752 () Bool)

(assert (=> b!506785 (=> res!307752 e!296609)))

(declare-fun lt!231285 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32544 0))(
  ( (array!32545 (arr!15652 (Array (_ BitVec 32) (_ BitVec 64))) (size!16016 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32544)

(declare-datatypes ((SeekEntryResult!4119 0))(
  ( (MissingZero!4119 (index!18664 (_ BitVec 32))) (Found!4119 (index!18665 (_ BitVec 32))) (Intermediate!4119 (undefined!4931 Bool) (index!18666 (_ BitVec 32)) (x!47664 (_ BitVec 32))) (Undefined!4119) (MissingVacant!4119 (index!18667 (_ BitVec 32))) )
))
(declare-fun lt!231283 () SeekEntryResult!4119)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32544 (_ BitVec 32)) SeekEntryResult!4119)

(assert (=> b!506785 (= res!307752 (= lt!231283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231285 (select (store (arr!15652 a!3235) i!1204 k0!2280) j!176) (array!32545 (store (arr!15652 a!3235) i!1204 k0!2280) (size!16016 a!3235)) mask!3524)))))

(declare-fun lt!231286 () (_ BitVec 32))

(assert (=> b!506785 (= lt!231283 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231286 (select (arr!15652 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506785 (= lt!231285 (toIndex!0 (select (store (arr!15652 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506785 (= lt!231286 (toIndex!0 (select (arr!15652 a!3235) j!176) mask!3524))))

(declare-fun e!296606 () Bool)

(assert (=> b!506785 e!296606))

(declare-fun res!307753 () Bool)

(assert (=> b!506785 (=> (not res!307753) (not e!296606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32544 (_ BitVec 32)) Bool)

(assert (=> b!506785 (= res!307753 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15526 0))(
  ( (Unit!15527) )
))
(declare-fun lt!231284 () Unit!15526)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32544 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15526)

(assert (=> b!506785 (= lt!231284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!307747 () Bool)

(declare-fun e!296605 () Bool)

(assert (=> start!45788 (=> (not res!307747) (not e!296605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45788 (= res!307747 (validMask!0 mask!3524))))

(assert (=> start!45788 e!296605))

(assert (=> start!45788 true))

(declare-fun array_inv!11448 (array!32544) Bool)

(assert (=> start!45788 (array_inv!11448 a!3235)))

(declare-fun b!506786 () Bool)

(declare-fun e!296607 () Bool)

(assert (=> b!506786 (= e!296609 e!296607)))

(declare-fun res!307754 () Bool)

(assert (=> b!506786 (=> res!307754 e!296607)))

(declare-fun lt!231281 () Bool)

(assert (=> b!506786 (= res!307754 (or (and (not lt!231281) (undefined!4931 lt!231283)) (and (not lt!231281) (not (undefined!4931 lt!231283)))))))

(get-info :version)

(assert (=> b!506786 (= lt!231281 (not ((_ is Intermediate!4119) lt!231283)))))

(declare-fun b!506787 () Bool)

(assert (=> b!506787 (= e!296605 e!296610)))

(declare-fun res!307746 () Bool)

(assert (=> b!506787 (=> (not res!307746) (not e!296610))))

(declare-fun lt!231282 () SeekEntryResult!4119)

(assert (=> b!506787 (= res!307746 (or (= lt!231282 (MissingZero!4119 i!1204)) (= lt!231282 (MissingVacant!4119 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32544 (_ BitVec 32)) SeekEntryResult!4119)

(assert (=> b!506787 (= lt!231282 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506788 () Bool)

(declare-fun res!307751 () Bool)

(assert (=> b!506788 (=> (not res!307751) (not e!296605))))

(declare-fun arrayContainsKey!0 (array!32544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506788 (= res!307751 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506789 () Bool)

(declare-fun res!307745 () Bool)

(assert (=> b!506789 (=> (not res!307745) (not e!296610))))

(assert (=> b!506789 (= res!307745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506790 () Bool)

(declare-fun res!307750 () Bool)

(assert (=> b!506790 (=> (not res!307750) (not e!296605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506790 (= res!307750 (validKeyInArray!0 (select (arr!15652 a!3235) j!176)))))

(declare-fun b!506791 () Bool)

(declare-fun res!307749 () Bool)

(assert (=> b!506791 (=> (not res!307749) (not e!296605))))

(assert (=> b!506791 (= res!307749 (and (= (size!16016 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16016 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16016 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506792 () Bool)

(assert (=> b!506792 (= e!296606 (= (seekEntryOrOpen!0 (select (arr!15652 a!3235) j!176) a!3235 mask!3524) (Found!4119 j!176)))))

(declare-fun b!506793 () Bool)

(declare-fun res!307744 () Bool)

(assert (=> b!506793 (=> (not res!307744) (not e!296605))))

(assert (=> b!506793 (= res!307744 (validKeyInArray!0 k0!2280))))

(declare-fun b!506794 () Bool)

(declare-fun res!307748 () Bool)

(assert (=> b!506794 (=> (not res!307748) (not e!296610))))

(declare-datatypes ((List!9810 0))(
  ( (Nil!9807) (Cons!9806 (h!10683 (_ BitVec 64)) (t!16038 List!9810)) )
))
(declare-fun arrayNoDuplicates!0 (array!32544 (_ BitVec 32) List!9810) Bool)

(assert (=> b!506794 (= res!307748 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9807))))

(declare-fun b!506795 () Bool)

(assert (=> b!506795 (= e!296607 true)))

(assert (=> b!506795 false))

(assert (= (and start!45788 res!307747) b!506791))

(assert (= (and b!506791 res!307749) b!506790))

(assert (= (and b!506790 res!307750) b!506793))

(assert (= (and b!506793 res!307744) b!506788))

(assert (= (and b!506788 res!307751) b!506787))

(assert (= (and b!506787 res!307746) b!506789))

(assert (= (and b!506789 res!307745) b!506794))

(assert (= (and b!506794 res!307748) b!506785))

(assert (= (and b!506785 res!307753) b!506792))

(assert (= (and b!506785 (not res!307752)) b!506786))

(assert (= (and b!506786 (not res!307754)) b!506795))

(declare-fun m!487479 () Bool)

(assert (=> b!506794 m!487479))

(declare-fun m!487481 () Bool)

(assert (=> b!506787 m!487481))

(declare-fun m!487483 () Bool)

(assert (=> b!506792 m!487483))

(assert (=> b!506792 m!487483))

(declare-fun m!487485 () Bool)

(assert (=> b!506792 m!487485))

(declare-fun m!487487 () Bool)

(assert (=> b!506789 m!487487))

(declare-fun m!487489 () Bool)

(assert (=> b!506788 m!487489))

(assert (=> b!506790 m!487483))

(assert (=> b!506790 m!487483))

(declare-fun m!487491 () Bool)

(assert (=> b!506790 m!487491))

(declare-fun m!487493 () Bool)

(assert (=> b!506793 m!487493))

(declare-fun m!487495 () Bool)

(assert (=> start!45788 m!487495))

(declare-fun m!487497 () Bool)

(assert (=> start!45788 m!487497))

(declare-fun m!487499 () Bool)

(assert (=> b!506785 m!487499))

(declare-fun m!487501 () Bool)

(assert (=> b!506785 m!487501))

(declare-fun m!487503 () Bool)

(assert (=> b!506785 m!487503))

(assert (=> b!506785 m!487483))

(declare-fun m!487505 () Bool)

(assert (=> b!506785 m!487505))

(declare-fun m!487507 () Bool)

(assert (=> b!506785 m!487507))

(assert (=> b!506785 m!487503))

(declare-fun m!487509 () Bool)

(assert (=> b!506785 m!487509))

(assert (=> b!506785 m!487503))

(declare-fun m!487511 () Bool)

(assert (=> b!506785 m!487511))

(assert (=> b!506785 m!487483))

(declare-fun m!487513 () Bool)

(assert (=> b!506785 m!487513))

(assert (=> b!506785 m!487483))

(check-sat (not b!506790) (not start!45788) (not b!506789) (not b!506794) (not b!506793) (not b!506787) (not b!506792) (not b!506785) (not b!506788))
(check-sat)
