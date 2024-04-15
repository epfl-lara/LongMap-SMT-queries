; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45774 () Bool)

(assert start!45774)

(declare-fun b!506481 () Bool)

(declare-fun res!307591 () Bool)

(declare-fun e!296413 () Bool)

(assert (=> b!506481 (=> (not res!307591) (not e!296413))))

(declare-datatypes ((array!32540 0))(
  ( (array!32541 (arr!15650 (Array (_ BitVec 32) (_ BitVec 64))) (size!16015 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32540)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506481 (= res!307591 (validKeyInArray!0 (select (arr!15650 a!3235) j!176)))))

(declare-fun b!506482 () Bool)

(declare-fun res!307585 () Bool)

(declare-fun e!296417 () Bool)

(assert (=> b!506482 (=> (not res!307585) (not e!296417))))

(declare-datatypes ((List!9847 0))(
  ( (Nil!9844) (Cons!9843 (h!10720 (_ BitVec 64)) (t!16066 List!9847)) )
))
(declare-fun arrayNoDuplicates!0 (array!32540 (_ BitVec 32) List!9847) Bool)

(assert (=> b!506482 (= res!307585 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9844))))

(declare-fun res!307588 () Bool)

(assert (=> start!45774 (=> (not res!307588) (not e!296413))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45774 (= res!307588 (validMask!0 mask!3524))))

(assert (=> start!45774 e!296413))

(assert (=> start!45774 true))

(declare-fun array_inv!11533 (array!32540) Bool)

(assert (=> start!45774 (array_inv!11533 a!3235)))

(declare-fun b!506483 () Bool)

(declare-fun e!296418 () Bool)

(declare-datatypes ((SeekEntryResult!4114 0))(
  ( (MissingZero!4114 (index!18644 (_ BitVec 32))) (Found!4114 (index!18645 (_ BitVec 32))) (Intermediate!4114 (undefined!4926 Bool) (index!18646 (_ BitVec 32)) (x!47654 (_ BitVec 32))) (Undefined!4114) (MissingVacant!4114 (index!18647 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32540 (_ BitVec 32)) SeekEntryResult!4114)

(assert (=> b!506483 (= e!296418 (= (seekEntryOrOpen!0 (select (arr!15650 a!3235) j!176) a!3235 mask!3524) (Found!4114 j!176)))))

(declare-fun b!506484 () Bool)

(assert (=> b!506484 (= e!296413 e!296417)))

(declare-fun res!307583 () Bool)

(assert (=> b!506484 (=> (not res!307583) (not e!296417))))

(declare-fun lt!231031 () SeekEntryResult!4114)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506484 (= res!307583 (or (= lt!231031 (MissingZero!4114 i!1204)) (= lt!231031 (MissingVacant!4114 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!506484 (= lt!231031 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!506485 () Bool)

(declare-fun res!307589 () Bool)

(assert (=> b!506485 (=> (not res!307589) (not e!296413))))

(assert (=> b!506485 (= res!307589 (and (= (size!16015 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16015 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16015 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506486 () Bool)

(declare-fun res!307584 () Bool)

(assert (=> b!506486 (=> (not res!307584) (not e!296417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32540 (_ BitVec 32)) Bool)

(assert (=> b!506486 (= res!307584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506487 () Bool)

(declare-fun res!307592 () Bool)

(assert (=> b!506487 (=> (not res!307592) (not e!296413))))

(assert (=> b!506487 (= res!307592 (validKeyInArray!0 k0!2280))))

(declare-fun b!506488 () Bool)

(declare-fun e!296415 () Bool)

(declare-fun e!296414 () Bool)

(assert (=> b!506488 (= e!296415 e!296414)))

(declare-fun res!307590 () Bool)

(assert (=> b!506488 (=> res!307590 e!296414)))

(declare-fun lt!231029 () Bool)

(declare-fun lt!231032 () SeekEntryResult!4114)

(assert (=> b!506488 (= res!307590 (or (and (not lt!231029) (undefined!4926 lt!231032)) (and (not lt!231029) (not (undefined!4926 lt!231032)))))))

(get-info :version)

(assert (=> b!506488 (= lt!231029 (not ((_ is Intermediate!4114) lt!231032)))))

(declare-fun b!506489 () Bool)

(assert (=> b!506489 (= e!296417 (not e!296415))))

(declare-fun res!307586 () Bool)

(assert (=> b!506489 (=> res!307586 e!296415)))

(declare-fun lt!231034 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32540 (_ BitVec 32)) SeekEntryResult!4114)

(assert (=> b!506489 (= res!307586 (= lt!231032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231034 (select (store (arr!15650 a!3235) i!1204 k0!2280) j!176) (array!32541 (store (arr!15650 a!3235) i!1204 k0!2280) (size!16015 a!3235)) mask!3524)))))

(declare-fun lt!231030 () (_ BitVec 32))

(assert (=> b!506489 (= lt!231032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231030 (select (arr!15650 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506489 (= lt!231034 (toIndex!0 (select (store (arr!15650 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506489 (= lt!231030 (toIndex!0 (select (arr!15650 a!3235) j!176) mask!3524))))

(assert (=> b!506489 e!296418))

(declare-fun res!307582 () Bool)

(assert (=> b!506489 (=> (not res!307582) (not e!296418))))

(assert (=> b!506489 (= res!307582 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15502 0))(
  ( (Unit!15503) )
))
(declare-fun lt!231033 () Unit!15502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32540 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15502)

(assert (=> b!506489 (= lt!231033 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506490 () Bool)

(assert (=> b!506490 (= e!296414 true)))

(assert (=> b!506490 false))

(declare-fun b!506491 () Bool)

(declare-fun res!307587 () Bool)

(assert (=> b!506491 (=> (not res!307587) (not e!296413))))

(declare-fun arrayContainsKey!0 (array!32540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506491 (= res!307587 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45774 res!307588) b!506485))

(assert (= (and b!506485 res!307589) b!506481))

(assert (= (and b!506481 res!307591) b!506487))

(assert (= (and b!506487 res!307592) b!506491))

(assert (= (and b!506491 res!307587) b!506484))

(assert (= (and b!506484 res!307583) b!506486))

(assert (= (and b!506486 res!307584) b!506482))

(assert (= (and b!506482 res!307585) b!506489))

(assert (= (and b!506489 res!307582) b!506483))

(assert (= (and b!506489 (not res!307586)) b!506488))

(assert (= (and b!506488 (not res!307590)) b!506490))

(declare-fun m!486691 () Bool)

(assert (=> b!506491 m!486691))

(declare-fun m!486693 () Bool)

(assert (=> b!506483 m!486693))

(assert (=> b!506483 m!486693))

(declare-fun m!486695 () Bool)

(assert (=> b!506483 m!486695))

(declare-fun m!486697 () Bool)

(assert (=> b!506489 m!486697))

(declare-fun m!486699 () Bool)

(assert (=> b!506489 m!486699))

(declare-fun m!486701 () Bool)

(assert (=> b!506489 m!486701))

(assert (=> b!506489 m!486701))

(declare-fun m!486703 () Bool)

(assert (=> b!506489 m!486703))

(assert (=> b!506489 m!486693))

(declare-fun m!486705 () Bool)

(assert (=> b!506489 m!486705))

(assert (=> b!506489 m!486701))

(declare-fun m!486707 () Bool)

(assert (=> b!506489 m!486707))

(assert (=> b!506489 m!486693))

(declare-fun m!486709 () Bool)

(assert (=> b!506489 m!486709))

(assert (=> b!506489 m!486693))

(declare-fun m!486711 () Bool)

(assert (=> b!506489 m!486711))

(declare-fun m!486713 () Bool)

(assert (=> b!506482 m!486713))

(assert (=> b!506481 m!486693))

(assert (=> b!506481 m!486693))

(declare-fun m!486715 () Bool)

(assert (=> b!506481 m!486715))

(declare-fun m!486717 () Bool)

(assert (=> b!506486 m!486717))

(declare-fun m!486719 () Bool)

(assert (=> b!506484 m!486719))

(declare-fun m!486721 () Bool)

(assert (=> b!506487 m!486721))

(declare-fun m!486723 () Bool)

(assert (=> start!45774 m!486723))

(declare-fun m!486725 () Bool)

(assert (=> start!45774 m!486725))

(check-sat (not b!506487) (not b!506489) (not b!506481) (not start!45774) (not b!506482) (not b!506484) (not b!506491) (not b!506486) (not b!506483))
(check-sat)
