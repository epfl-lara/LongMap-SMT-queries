; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45776 () Bool)

(assert start!45776)

(declare-fun b!506691 () Bool)

(declare-fun e!296553 () Bool)

(assert (=> b!506691 (= e!296553 true)))

(assert (=> b!506691 false))

(declare-fun b!506692 () Bool)

(declare-fun e!296549 () Bool)

(assert (=> b!506692 (= e!296549 e!296553)))

(declare-fun res!307714 () Bool)

(assert (=> b!506692 (=> res!307714 e!296553)))

(declare-fun lt!231279 () Bool)

(declare-datatypes ((SeekEntryResult!4069 0))(
  ( (MissingZero!4069 (index!18464 (_ BitVec 32))) (Found!4069 (index!18465 (_ BitVec 32))) (Intermediate!4069 (undefined!4881 Bool) (index!18466 (_ BitVec 32)) (x!47611 (_ BitVec 32))) (Undefined!4069) (MissingVacant!4069 (index!18467 (_ BitVec 32))) )
))
(declare-fun lt!231278 () SeekEntryResult!4069)

(assert (=> b!506692 (= res!307714 (or (and (not lt!231279) (undefined!4881 lt!231278)) (and (not lt!231279) (not (undefined!4881 lt!231278)))))))

(get-info :version)

(assert (=> b!506692 (= lt!231279 (not ((_ is Intermediate!4069) lt!231278)))))

(declare-fun b!506693 () Bool)

(declare-fun res!307708 () Bool)

(declare-fun e!296548 () Bool)

(assert (=> b!506693 (=> (not res!307708) (not e!296548))))

(declare-datatypes ((array!32533 0))(
  ( (array!32534 (arr!15646 (Array (_ BitVec 32) (_ BitVec 64))) (size!16010 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32533)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32533 (_ BitVec 32)) Bool)

(assert (=> b!506693 (= res!307708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506694 () Bool)

(declare-fun res!307706 () Bool)

(declare-fun e!296551 () Bool)

(assert (=> b!506694 (=> (not res!307706) (not e!296551))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506694 (= res!307706 (validKeyInArray!0 k0!2280))))

(declare-fun b!506695 () Bool)

(assert (=> b!506695 (= e!296548 (not e!296549))))

(declare-fun res!307710 () Bool)

(assert (=> b!506695 (=> res!307710 e!296549)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!231280 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32533 (_ BitVec 32)) SeekEntryResult!4069)

(assert (=> b!506695 (= res!307710 (= lt!231278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231280 (select (store (arr!15646 a!3235) i!1204 k0!2280) j!176) (array!32534 (store (arr!15646 a!3235) i!1204 k0!2280) (size!16010 a!3235)) mask!3524)))))

(declare-fun lt!231275 () (_ BitVec 32))

(assert (=> b!506695 (= lt!231278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231275 (select (arr!15646 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506695 (= lt!231280 (toIndex!0 (select (store (arr!15646 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!506695 (= lt!231275 (toIndex!0 (select (arr!15646 a!3235) j!176) mask!3524))))

(declare-fun e!296552 () Bool)

(assert (=> b!506695 e!296552))

(declare-fun res!307704 () Bool)

(assert (=> b!506695 (=> (not res!307704) (not e!296552))))

(assert (=> b!506695 (= res!307704 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15487 0))(
  ( (Unit!15488) )
))
(declare-fun lt!231276 () Unit!15487)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15487)

(assert (=> b!506695 (= lt!231276 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506696 () Bool)

(declare-fun res!307711 () Bool)

(assert (=> b!506696 (=> (not res!307711) (not e!296551))))

(declare-fun arrayContainsKey!0 (array!32533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506696 (= res!307711 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506697 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32533 (_ BitVec 32)) SeekEntryResult!4069)

(assert (=> b!506697 (= e!296552 (= (seekEntryOrOpen!0 (select (arr!15646 a!3235) j!176) a!3235 mask!3524) (Found!4069 j!176)))))

(declare-fun b!506698 () Bool)

(assert (=> b!506698 (= e!296551 e!296548)))

(declare-fun res!307709 () Bool)

(assert (=> b!506698 (=> (not res!307709) (not e!296548))))

(declare-fun lt!231277 () SeekEntryResult!4069)

(assert (=> b!506698 (= res!307709 (or (= lt!231277 (MissingZero!4069 i!1204)) (= lt!231277 (MissingVacant!4069 i!1204))))))

(assert (=> b!506698 (= lt!231277 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!307713 () Bool)

(assert (=> start!45776 (=> (not res!307713) (not e!296551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45776 (= res!307713 (validMask!0 mask!3524))))

(assert (=> start!45776 e!296551))

(assert (=> start!45776 true))

(declare-fun array_inv!11505 (array!32533) Bool)

(assert (=> start!45776 (array_inv!11505 a!3235)))

(declare-fun b!506699 () Bool)

(declare-fun res!307705 () Bool)

(assert (=> b!506699 (=> (not res!307705) (not e!296551))))

(assert (=> b!506699 (= res!307705 (and (= (size!16010 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16010 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16010 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506700 () Bool)

(declare-fun res!307712 () Bool)

(assert (=> b!506700 (=> (not res!307712) (not e!296548))))

(declare-datatypes ((List!9711 0))(
  ( (Nil!9708) (Cons!9707 (h!10584 (_ BitVec 64)) (t!15931 List!9711)) )
))
(declare-fun arrayNoDuplicates!0 (array!32533 (_ BitVec 32) List!9711) Bool)

(assert (=> b!506700 (= res!307712 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9708))))

(declare-fun b!506701 () Bool)

(declare-fun res!307707 () Bool)

(assert (=> b!506701 (=> (not res!307707) (not e!296551))))

(assert (=> b!506701 (= res!307707 (validKeyInArray!0 (select (arr!15646 a!3235) j!176)))))

(assert (= (and start!45776 res!307713) b!506699))

(assert (= (and b!506699 res!307705) b!506701))

(assert (= (and b!506701 res!307707) b!506694))

(assert (= (and b!506694 res!307706) b!506696))

(assert (= (and b!506696 res!307711) b!506698))

(assert (= (and b!506698 res!307709) b!506693))

(assert (= (and b!506693 res!307708) b!506700))

(assert (= (and b!506700 res!307712) b!506695))

(assert (= (and b!506695 res!307704) b!506697))

(assert (= (and b!506695 (not res!307710)) b!506692))

(assert (= (and b!506692 (not res!307714)) b!506691))

(declare-fun m!487627 () Bool)

(assert (=> start!45776 m!487627))

(declare-fun m!487629 () Bool)

(assert (=> start!45776 m!487629))

(declare-fun m!487631 () Bool)

(assert (=> b!506694 m!487631))

(declare-fun m!487633 () Bool)

(assert (=> b!506696 m!487633))

(declare-fun m!487635 () Bool)

(assert (=> b!506695 m!487635))

(declare-fun m!487637 () Bool)

(assert (=> b!506695 m!487637))

(declare-fun m!487639 () Bool)

(assert (=> b!506695 m!487639))

(declare-fun m!487641 () Bool)

(assert (=> b!506695 m!487641))

(assert (=> b!506695 m!487639))

(declare-fun m!487643 () Bool)

(assert (=> b!506695 m!487643))

(assert (=> b!506695 m!487639))

(declare-fun m!487645 () Bool)

(assert (=> b!506695 m!487645))

(assert (=> b!506695 m!487637))

(declare-fun m!487647 () Bool)

(assert (=> b!506695 m!487647))

(assert (=> b!506695 m!487637))

(declare-fun m!487649 () Bool)

(assert (=> b!506695 m!487649))

(declare-fun m!487651 () Bool)

(assert (=> b!506695 m!487651))

(assert (=> b!506701 m!487639))

(assert (=> b!506701 m!487639))

(declare-fun m!487653 () Bool)

(assert (=> b!506701 m!487653))

(declare-fun m!487655 () Bool)

(assert (=> b!506693 m!487655))

(assert (=> b!506697 m!487639))

(assert (=> b!506697 m!487639))

(declare-fun m!487657 () Bool)

(assert (=> b!506697 m!487657))

(declare-fun m!487659 () Bool)

(assert (=> b!506700 m!487659))

(declare-fun m!487661 () Bool)

(assert (=> b!506698 m!487661))

(check-sat (not b!506697) (not start!45776) (not b!506693) (not b!506701) (not b!506696) (not b!506700) (not b!506694) (not b!506698) (not b!506695))
(check-sat)
