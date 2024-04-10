; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45270 () Bool)

(assert start!45270)

(declare-fun b!497278 () Bool)

(declare-fun e!291505 () Bool)

(assert (=> b!497278 (= e!291505 true)))

(declare-datatypes ((SeekEntryResult!3929 0))(
  ( (MissingZero!3929 (index!17895 (_ BitVec 32))) (Found!3929 (index!17896 (_ BitVec 32))) (Intermediate!3929 (undefined!4741 Bool) (index!17897 (_ BitVec 32)) (x!46949 (_ BitVec 32))) (Undefined!3929) (MissingVacant!3929 (index!17898 (_ BitVec 32))) )
))
(declare-fun lt!225125 () SeekEntryResult!3929)

(declare-datatypes ((array!32158 0))(
  ( (array!32159 (arr!15462 (Array (_ BitVec 32) (_ BitVec 64))) (size!15826 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32158)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497278 (and (bvslt (x!46949 lt!225125) #b01111111111111111111111111111110) (or (= (select (arr!15462 a!3235) (index!17897 lt!225125)) (select (arr!15462 a!3235) j!176)) (= (select (arr!15462 a!3235) (index!17897 lt!225125)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15462 a!3235) (index!17897 lt!225125)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497279 () Bool)

(declare-fun e!291506 () Bool)

(assert (=> b!497279 (= e!291506 (not e!291505))))

(declare-fun res!299672 () Bool)

(assert (=> b!497279 (=> res!299672 e!291505)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!225123 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32158 (_ BitVec 32)) SeekEntryResult!3929)

(assert (=> b!497279 (= res!299672 (= lt!225125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225123 (select (store (arr!15462 a!3235) i!1204 k!2280) j!176) (array!32159 (store (arr!15462 a!3235) i!1204 k!2280) (size!15826 a!3235)) mask!3524)))))

(declare-fun lt!225126 () (_ BitVec 32))

(assert (=> b!497279 (= lt!225125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225126 (select (arr!15462 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497279 (= lt!225123 (toIndex!0 (select (store (arr!15462 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!497279 (= lt!225126 (toIndex!0 (select (arr!15462 a!3235) j!176) mask!3524))))

(declare-fun e!291503 () Bool)

(assert (=> b!497279 e!291503))

(declare-fun res!299670 () Bool)

(assert (=> b!497279 (=> (not res!299670) (not e!291503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32158 (_ BitVec 32)) Bool)

(assert (=> b!497279 (= res!299670 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14804 0))(
  ( (Unit!14805) )
))
(declare-fun lt!225127 () Unit!14804)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14804)

(assert (=> b!497279 (= lt!225127 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497280 () Bool)

(declare-fun res!299668 () Bool)

(declare-fun e!291504 () Bool)

(assert (=> b!497280 (=> (not res!299668) (not e!291504))))

(declare-fun arrayContainsKey!0 (array!32158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497280 (= res!299668 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497281 () Bool)

(assert (=> b!497281 (= e!291504 e!291506)))

(declare-fun res!299667 () Bool)

(assert (=> b!497281 (=> (not res!299667) (not e!291506))))

(declare-fun lt!225124 () SeekEntryResult!3929)

(assert (=> b!497281 (= res!299667 (or (= lt!225124 (MissingZero!3929 i!1204)) (= lt!225124 (MissingVacant!3929 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32158 (_ BitVec 32)) SeekEntryResult!3929)

(assert (=> b!497281 (= lt!225124 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!497282 () Bool)

(declare-fun res!299675 () Bool)

(assert (=> b!497282 (=> (not res!299675) (not e!291504))))

(assert (=> b!497282 (= res!299675 (and (= (size!15826 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15826 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15826 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!299669 () Bool)

(assert (=> start!45270 (=> (not res!299669) (not e!291504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45270 (= res!299669 (validMask!0 mask!3524))))

(assert (=> start!45270 e!291504))

(assert (=> start!45270 true))

(declare-fun array_inv!11258 (array!32158) Bool)

(assert (=> start!45270 (array_inv!11258 a!3235)))

(declare-fun b!497283 () Bool)

(declare-fun res!299674 () Bool)

(assert (=> b!497283 (=> (not res!299674) (not e!291506))))

(assert (=> b!497283 (= res!299674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497284 () Bool)

(declare-fun res!299673 () Bool)

(assert (=> b!497284 (=> (not res!299673) (not e!291504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497284 (= res!299673 (validKeyInArray!0 k!2280))))

(declare-fun b!497285 () Bool)

(declare-fun res!299671 () Bool)

(assert (=> b!497285 (=> (not res!299671) (not e!291504))))

(assert (=> b!497285 (= res!299671 (validKeyInArray!0 (select (arr!15462 a!3235) j!176)))))

(declare-fun b!497286 () Bool)

(declare-fun res!299666 () Bool)

(assert (=> b!497286 (=> (not res!299666) (not e!291506))))

(declare-datatypes ((List!9620 0))(
  ( (Nil!9617) (Cons!9616 (h!10487 (_ BitVec 64)) (t!15848 List!9620)) )
))
(declare-fun arrayNoDuplicates!0 (array!32158 (_ BitVec 32) List!9620) Bool)

(assert (=> b!497286 (= res!299666 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9617))))

(declare-fun b!497287 () Bool)

(declare-fun res!299665 () Bool)

(assert (=> b!497287 (=> res!299665 e!291505)))

(assert (=> b!497287 (= res!299665 (or (undefined!4741 lt!225125) (not (is-Intermediate!3929 lt!225125))))))

(declare-fun b!497288 () Bool)

(assert (=> b!497288 (= e!291503 (= (seekEntryOrOpen!0 (select (arr!15462 a!3235) j!176) a!3235 mask!3524) (Found!3929 j!176)))))

(assert (= (and start!45270 res!299669) b!497282))

(assert (= (and b!497282 res!299675) b!497285))

(assert (= (and b!497285 res!299671) b!497284))

(assert (= (and b!497284 res!299673) b!497280))

(assert (= (and b!497280 res!299668) b!497281))

(assert (= (and b!497281 res!299667) b!497283))

(assert (= (and b!497283 res!299674) b!497286))

(assert (= (and b!497286 res!299666) b!497279))

(assert (= (and b!497279 res!299670) b!497288))

(assert (= (and b!497279 (not res!299672)) b!497287))

(assert (= (and b!497287 (not res!299665)) b!497278))

(declare-fun m!478641 () Bool)

(assert (=> b!497284 m!478641))

(declare-fun m!478643 () Bool)

(assert (=> b!497283 m!478643))

(declare-fun m!478645 () Bool)

(assert (=> start!45270 m!478645))

(declare-fun m!478647 () Bool)

(assert (=> start!45270 m!478647))

(declare-fun m!478649 () Bool)

(assert (=> b!497280 m!478649))

(declare-fun m!478651 () Bool)

(assert (=> b!497285 m!478651))

(assert (=> b!497285 m!478651))

(declare-fun m!478653 () Bool)

(assert (=> b!497285 m!478653))

(declare-fun m!478655 () Bool)

(assert (=> b!497279 m!478655))

(declare-fun m!478657 () Bool)

(assert (=> b!497279 m!478657))

(declare-fun m!478659 () Bool)

(assert (=> b!497279 m!478659))

(assert (=> b!497279 m!478651))

(declare-fun m!478661 () Bool)

(assert (=> b!497279 m!478661))

(declare-fun m!478663 () Bool)

(assert (=> b!497279 m!478663))

(assert (=> b!497279 m!478659))

(declare-fun m!478665 () Bool)

(assert (=> b!497279 m!478665))

(assert (=> b!497279 m!478651))

(declare-fun m!478667 () Bool)

(assert (=> b!497279 m!478667))

(assert (=> b!497279 m!478659))

(declare-fun m!478669 () Bool)

(assert (=> b!497279 m!478669))

(assert (=> b!497279 m!478651))

(assert (=> b!497288 m!478651))

(assert (=> b!497288 m!478651))

(declare-fun m!478671 () Bool)

(assert (=> b!497288 m!478671))

(declare-fun m!478673 () Bool)

(assert (=> b!497286 m!478673))

(declare-fun m!478675 () Bool)

(assert (=> b!497278 m!478675))

(assert (=> b!497278 m!478651))

(declare-fun m!478677 () Bool)

(assert (=> b!497281 m!478677))

(push 1)

