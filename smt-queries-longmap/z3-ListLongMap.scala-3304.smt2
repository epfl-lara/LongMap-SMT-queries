; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45770 () Bool)

(assert start!45770)

(declare-fun b!506488 () Bool)

(declare-fun e!296447 () Bool)

(assert (=> b!506488 (= e!296447 true)))

(assert (=> b!506488 false))

(declare-fun res!307450 () Bool)

(declare-fun e!296446 () Bool)

(assert (=> start!45770 (=> (not res!307450) (not e!296446))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45770 (= res!307450 (validMask!0 mask!3524))))

(assert (=> start!45770 e!296446))

(assert (=> start!45770 true))

(declare-datatypes ((array!32526 0))(
  ( (array!32527 (arr!15643 (Array (_ BitVec 32) (_ BitVec 64))) (size!16007 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32526)

(declare-fun array_inv!11439 (array!32526) Bool)

(assert (=> start!45770 (array_inv!11439 a!3235)))

(declare-fun b!506489 () Bool)

(declare-fun e!296444 () Bool)

(declare-fun e!296443 () Bool)

(assert (=> b!506489 (= e!296444 (not e!296443))))

(declare-fun res!307452 () Bool)

(assert (=> b!506489 (=> res!307452 e!296443)))

(declare-datatypes ((SeekEntryResult!4110 0))(
  ( (MissingZero!4110 (index!18628 (_ BitVec 32))) (Found!4110 (index!18629 (_ BitVec 32))) (Intermediate!4110 (undefined!4922 Bool) (index!18630 (_ BitVec 32)) (x!47631 (_ BitVec 32))) (Undefined!4110) (MissingVacant!4110 (index!18631 (_ BitVec 32))) )
))
(declare-fun lt!231123 () SeekEntryResult!4110)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!231122 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32526 (_ BitVec 32)) SeekEntryResult!4110)

(assert (=> b!506489 (= res!307452 (= lt!231123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231122 (select (store (arr!15643 a!3235) i!1204 k0!2280) j!176) (array!32527 (store (arr!15643 a!3235) i!1204 k0!2280) (size!16007 a!3235)) mask!3524)))))

(declare-fun lt!231119 () (_ BitVec 32))

(assert (=> b!506489 (= lt!231123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231119 (select (arr!15643 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506489 (= lt!231122 (toIndex!0 (select (store (arr!15643 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506489 (= lt!231119 (toIndex!0 (select (arr!15643 a!3235) j!176) mask!3524))))

(declare-fun e!296445 () Bool)

(assert (=> b!506489 e!296445))

(declare-fun res!307447 () Bool)

(assert (=> b!506489 (=> (not res!307447) (not e!296445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32526 (_ BitVec 32)) Bool)

(assert (=> b!506489 (= res!307447 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15508 0))(
  ( (Unit!15509) )
))
(declare-fun lt!231121 () Unit!15508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32526 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15508)

(assert (=> b!506489 (= lt!231121 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506490 () Bool)

(assert (=> b!506490 (= e!296446 e!296444)))

(declare-fun res!307451 () Bool)

(assert (=> b!506490 (=> (not res!307451) (not e!296444))))

(declare-fun lt!231120 () SeekEntryResult!4110)

(assert (=> b!506490 (= res!307451 (or (= lt!231120 (MissingZero!4110 i!1204)) (= lt!231120 (MissingVacant!4110 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32526 (_ BitVec 32)) SeekEntryResult!4110)

(assert (=> b!506490 (= lt!231120 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506491 () Bool)

(declare-fun res!307449 () Bool)

(assert (=> b!506491 (=> (not res!307449) (not e!296446))))

(assert (=> b!506491 (= res!307449 (and (= (size!16007 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16007 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16007 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506492 () Bool)

(declare-fun res!307456 () Bool)

(assert (=> b!506492 (=> (not res!307456) (not e!296446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506492 (= res!307456 (validKeyInArray!0 (select (arr!15643 a!3235) j!176)))))

(declare-fun b!506493 () Bool)

(declare-fun res!307453 () Bool)

(assert (=> b!506493 (=> (not res!307453) (not e!296446))))

(assert (=> b!506493 (= res!307453 (validKeyInArray!0 k0!2280))))

(declare-fun b!506494 () Bool)

(declare-fun res!307457 () Bool)

(assert (=> b!506494 (=> (not res!307457) (not e!296446))))

(declare-fun arrayContainsKey!0 (array!32526 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506494 (= res!307457 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506495 () Bool)

(declare-fun res!307455 () Bool)

(assert (=> b!506495 (=> (not res!307455) (not e!296444))))

(assert (=> b!506495 (= res!307455 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506496 () Bool)

(assert (=> b!506496 (= e!296445 (= (seekEntryOrOpen!0 (select (arr!15643 a!3235) j!176) a!3235 mask!3524) (Found!4110 j!176)))))

(declare-fun b!506497 () Bool)

(declare-fun res!307448 () Bool)

(assert (=> b!506497 (=> (not res!307448) (not e!296444))))

(declare-datatypes ((List!9801 0))(
  ( (Nil!9798) (Cons!9797 (h!10674 (_ BitVec 64)) (t!16029 List!9801)) )
))
(declare-fun arrayNoDuplicates!0 (array!32526 (_ BitVec 32) List!9801) Bool)

(assert (=> b!506497 (= res!307448 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9798))))

(declare-fun b!506498 () Bool)

(assert (=> b!506498 (= e!296443 e!296447)))

(declare-fun res!307454 () Bool)

(assert (=> b!506498 (=> res!307454 e!296447)))

(declare-fun lt!231124 () Bool)

(assert (=> b!506498 (= res!307454 (or (and (not lt!231124) (undefined!4922 lt!231123)) (and (not lt!231124) (not (undefined!4922 lt!231123)))))))

(get-info :version)

(assert (=> b!506498 (= lt!231124 (not ((_ is Intermediate!4110) lt!231123)))))

(assert (= (and start!45770 res!307450) b!506491))

(assert (= (and b!506491 res!307449) b!506492))

(assert (= (and b!506492 res!307456) b!506493))

(assert (= (and b!506493 res!307453) b!506494))

(assert (= (and b!506494 res!307457) b!506490))

(assert (= (and b!506490 res!307451) b!506495))

(assert (= (and b!506495 res!307455) b!506497))

(assert (= (and b!506497 res!307448) b!506489))

(assert (= (and b!506489 res!307447) b!506496))

(assert (= (and b!506489 (not res!307452)) b!506498))

(assert (= (and b!506498 (not res!307454)) b!506488))

(declare-fun m!487155 () Bool)

(assert (=> b!506489 m!487155))

(declare-fun m!487157 () Bool)

(assert (=> b!506489 m!487157))

(declare-fun m!487159 () Bool)

(assert (=> b!506489 m!487159))

(declare-fun m!487161 () Bool)

(assert (=> b!506489 m!487161))

(assert (=> b!506489 m!487157))

(declare-fun m!487163 () Bool)

(assert (=> b!506489 m!487163))

(declare-fun m!487165 () Bool)

(assert (=> b!506489 m!487165))

(assert (=> b!506489 m!487163))

(declare-fun m!487167 () Bool)

(assert (=> b!506489 m!487167))

(assert (=> b!506489 m!487157))

(declare-fun m!487169 () Bool)

(assert (=> b!506489 m!487169))

(assert (=> b!506489 m!487163))

(declare-fun m!487171 () Bool)

(assert (=> b!506489 m!487171))

(declare-fun m!487173 () Bool)

(assert (=> b!506497 m!487173))

(assert (=> b!506496 m!487163))

(assert (=> b!506496 m!487163))

(declare-fun m!487175 () Bool)

(assert (=> b!506496 m!487175))

(assert (=> b!506492 m!487163))

(assert (=> b!506492 m!487163))

(declare-fun m!487177 () Bool)

(assert (=> b!506492 m!487177))

(declare-fun m!487179 () Bool)

(assert (=> b!506493 m!487179))

(declare-fun m!487181 () Bool)

(assert (=> b!506495 m!487181))

(declare-fun m!487183 () Bool)

(assert (=> b!506490 m!487183))

(declare-fun m!487185 () Bool)

(assert (=> start!45770 m!487185))

(declare-fun m!487187 () Bool)

(assert (=> start!45770 m!487187))

(declare-fun m!487189 () Bool)

(assert (=> b!506494 m!487189))

(check-sat (not b!506495) (not start!45770) (not b!506494) (not b!506492) (not b!506496) (not b!506497) (not b!506489) (not b!506490) (not b!506493))
(check-sat)
