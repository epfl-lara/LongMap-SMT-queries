; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45748 () Bool)

(assert start!45748)

(declare-fun b!506002 () Bool)

(declare-fun e!296184 () Bool)

(declare-fun e!296182 () Bool)

(assert (=> b!506002 (= e!296184 e!296182)))

(declare-fun res!307009 () Bool)

(assert (=> b!506002 (=> res!307009 e!296182)))

(declare-datatypes ((array!32504 0))(
  ( (array!32505 (arr!15632 (Array (_ BitVec 32) (_ BitVec 64))) (size!15996 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32504)

(declare-datatypes ((SeekEntryResult!4099 0))(
  ( (MissingZero!4099 (index!18584 (_ BitVec 32))) (Found!4099 (index!18585 (_ BitVec 32))) (Intermediate!4099 (undefined!4911 Bool) (index!18586 (_ BitVec 32)) (x!47588 (_ BitVec 32))) (Undefined!4099) (MissingVacant!4099 (index!18587 (_ BitVec 32))) )
))
(declare-fun lt!230792 () SeekEntryResult!4099)

(declare-fun lt!230788 () (_ BitVec 32))

(assert (=> b!506002 (= res!307009 (or (bvsgt (x!47588 lt!230792) #b01111111111111111111111111111110) (bvslt lt!230788 #b00000000000000000000000000000000) (bvsge lt!230788 (size!15996 a!3235)) (bvslt (index!18586 lt!230792) #b00000000000000000000000000000000) (bvsge (index!18586 lt!230792) (size!15996 a!3235)) (not (= lt!230792 (Intermediate!4099 false (index!18586 lt!230792) (x!47588 lt!230792))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!506002 (= (index!18586 lt!230792) i!1204)))

(declare-datatypes ((Unit!15472 0))(
  ( (Unit!15473) )
))
(declare-fun lt!230799 () Unit!15472)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32504 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15472)

(assert (=> b!506002 (= lt!230799 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230788 #b00000000000000000000000000000000 (index!18586 lt!230792) (x!47588 lt!230792) mask!3524))))

(assert (=> b!506002 (and (or (= (select (arr!15632 a!3235) (index!18586 lt!230792)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15632 a!3235) (index!18586 lt!230792)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15632 a!3235) (index!18586 lt!230792)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15632 a!3235) (index!18586 lt!230792)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230795 () Unit!15472)

(declare-fun e!296183 () Unit!15472)

(assert (=> b!506002 (= lt!230795 e!296183)))

(declare-fun c!59780 () Bool)

(assert (=> b!506002 (= c!59780 (= (select (arr!15632 a!3235) (index!18586 lt!230792)) (select (arr!15632 a!3235) j!176)))))

(assert (=> b!506002 (and (bvslt (x!47588 lt!230792) #b01111111111111111111111111111110) (or (= (select (arr!15632 a!3235) (index!18586 lt!230792)) (select (arr!15632 a!3235) j!176)) (= (select (arr!15632 a!3235) (index!18586 lt!230792)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15632 a!3235) (index!18586 lt!230792)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!506003 () Bool)

(declare-fun res!307006 () Bool)

(declare-fun e!296187 () Bool)

(assert (=> b!506003 (=> (not res!307006) (not e!296187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506003 (= res!307006 (validKeyInArray!0 (select (arr!15632 a!3235) j!176)))))

(declare-fun b!506004 () Bool)

(declare-fun res!307001 () Bool)

(declare-fun e!296185 () Bool)

(assert (=> b!506004 (=> (not res!307001) (not e!296185))))

(declare-datatypes ((List!9790 0))(
  ( (Nil!9787) (Cons!9786 (h!10663 (_ BitVec 64)) (t!16018 List!9790)) )
))
(declare-fun arrayNoDuplicates!0 (array!32504 (_ BitVec 32) List!9790) Bool)

(assert (=> b!506004 (= res!307001 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9787))))

(declare-fun b!506005 () Bool)

(declare-fun Unit!15474 () Unit!15472)

(assert (=> b!506005 (= e!296183 Unit!15474)))

(declare-fun lt!230797 () Unit!15472)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32504 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15472)

(assert (=> b!506005 (= lt!230797 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230788 #b00000000000000000000000000000000 (index!18586 lt!230792) (x!47588 lt!230792) mask!3524))))

(declare-fun lt!230794 () array!32504)

(declare-fun res!306999 () Bool)

(declare-fun lt!230800 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32504 (_ BitVec 32)) SeekEntryResult!4099)

(assert (=> b!506005 (= res!306999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230788 lt!230800 lt!230794 mask!3524) (Intermediate!4099 false (index!18586 lt!230792) (x!47588 lt!230792))))))

(declare-fun e!296179 () Bool)

(assert (=> b!506005 (=> (not res!306999) (not e!296179))))

(assert (=> b!506005 e!296179))

(declare-fun b!506006 () Bool)

(declare-fun Unit!15475 () Unit!15472)

(assert (=> b!506006 (= e!296183 Unit!15475)))

(declare-fun b!506007 () Bool)

(assert (=> b!506007 (= e!296179 false)))

(declare-fun b!506008 () Bool)

(declare-fun res!307012 () Bool)

(assert (=> b!506008 (=> res!307012 e!296182)))

(declare-fun e!296186 () Bool)

(assert (=> b!506008 (= res!307012 e!296186)))

(declare-fun res!307003 () Bool)

(assert (=> b!506008 (=> (not res!307003) (not e!296186))))

(assert (=> b!506008 (= res!307003 (bvsgt #b00000000000000000000000000000000 (x!47588 lt!230792)))))

(declare-fun b!506009 () Bool)

(declare-fun res!307010 () Bool)

(assert (=> b!506009 (=> (not res!307010) (not e!296185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32504 (_ BitVec 32)) Bool)

(assert (=> b!506009 (= res!307010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!307004 () Bool)

(assert (=> start!45748 (=> (not res!307004) (not e!296187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45748 (= res!307004 (validMask!0 mask!3524))))

(assert (=> start!45748 e!296187))

(assert (=> start!45748 true))

(declare-fun array_inv!11428 (array!32504) Bool)

(assert (=> start!45748 (array_inv!11428 a!3235)))

(declare-fun b!506010 () Bool)

(declare-fun res!307008 () Bool)

(assert (=> b!506010 (=> (not res!307008) (not e!296187))))

(assert (=> b!506010 (= res!307008 (and (= (size!15996 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15996 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15996 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506011 () Bool)

(assert (=> b!506011 (= e!296185 (not e!296184))))

(declare-fun res!307011 () Bool)

(assert (=> b!506011 (=> res!307011 e!296184)))

(declare-fun lt!230789 () SeekEntryResult!4099)

(assert (=> b!506011 (= res!307011 (or (= lt!230792 lt!230789) (undefined!4911 lt!230792) (not (is-Intermediate!4099 lt!230792))))))

(declare-fun lt!230793 () (_ BitVec 32))

(assert (=> b!506011 (= lt!230789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230793 lt!230800 lt!230794 mask!3524))))

(assert (=> b!506011 (= lt!230792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230788 (select (arr!15632 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506011 (= lt!230793 (toIndex!0 lt!230800 mask!3524))))

(assert (=> b!506011 (= lt!230800 (select (store (arr!15632 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!506011 (= lt!230788 (toIndex!0 (select (arr!15632 a!3235) j!176) mask!3524))))

(assert (=> b!506011 (= lt!230794 (array!32505 (store (arr!15632 a!3235) i!1204 k!2280) (size!15996 a!3235)))))

(declare-fun lt!230791 () SeekEntryResult!4099)

(assert (=> b!506011 (= lt!230791 (Found!4099 j!176))))

(declare-fun e!296180 () Bool)

(assert (=> b!506011 e!296180))

(declare-fun res!307000 () Bool)

(assert (=> b!506011 (=> (not res!307000) (not e!296180))))

(assert (=> b!506011 (= res!307000 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230790 () Unit!15472)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15472)

(assert (=> b!506011 (= lt!230790 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506012 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32504 (_ BitVec 32)) SeekEntryResult!4099)

(assert (=> b!506012 (= e!296180 (= (seekEntryOrOpen!0 (select (arr!15632 a!3235) j!176) a!3235 mask!3524) (Found!4099 j!176)))))

(declare-fun b!506013 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32504 (_ BitVec 32)) SeekEntryResult!4099)

(assert (=> b!506013 (= e!296186 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230788 (index!18586 lt!230792) (select (arr!15632 a!3235) j!176) a!3235 mask!3524) lt!230791)))))

(declare-fun b!506014 () Bool)

(declare-fun res!307005 () Bool)

(assert (=> b!506014 (=> (not res!307005) (not e!296187))))

(declare-fun arrayContainsKey!0 (array!32504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506014 (= res!307005 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!506015 () Bool)

(declare-fun res!307007 () Bool)

(assert (=> b!506015 (=> (not res!307007) (not e!296187))))

(assert (=> b!506015 (= res!307007 (validKeyInArray!0 k!2280))))

(declare-fun b!506016 () Bool)

(declare-fun res!307013 () Bool)

(assert (=> b!506016 (=> res!307013 e!296182)))

(assert (=> b!506016 (= res!307013 (not (= lt!230789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230788 lt!230800 lt!230794 mask!3524))))))

(declare-fun b!506017 () Bool)

(assert (=> b!506017 (= e!296187 e!296185)))

(declare-fun res!307002 () Bool)

(assert (=> b!506017 (=> (not res!307002) (not e!296185))))

(declare-fun lt!230796 () SeekEntryResult!4099)

(assert (=> b!506017 (= res!307002 (or (= lt!230796 (MissingZero!4099 i!1204)) (= lt!230796 (MissingVacant!4099 i!1204))))))

(assert (=> b!506017 (= lt!230796 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506018 () Bool)

(assert (=> b!506018 (= e!296182 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!506018 (= (seekEntryOrOpen!0 lt!230800 lt!230794 mask!3524) lt!230791)))

(declare-fun lt!230798 () Unit!15472)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32504 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15472)

(assert (=> b!506018 (= lt!230798 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230788 #b00000000000000000000000000000000 (index!18586 lt!230792) (x!47588 lt!230792) mask!3524))))

(assert (= (and start!45748 res!307004) b!506010))

(assert (= (and b!506010 res!307008) b!506003))

(assert (= (and b!506003 res!307006) b!506015))

(assert (= (and b!506015 res!307007) b!506014))

(assert (= (and b!506014 res!307005) b!506017))

(assert (= (and b!506017 res!307002) b!506009))

(assert (= (and b!506009 res!307010) b!506004))

(assert (= (and b!506004 res!307001) b!506011))

(assert (= (and b!506011 res!307000) b!506012))

(assert (= (and b!506011 (not res!307011)) b!506002))

(assert (= (and b!506002 c!59780) b!506005))

(assert (= (and b!506002 (not c!59780)) b!506006))

(assert (= (and b!506005 res!306999) b!506007))

(assert (= (and b!506002 (not res!307009)) b!506008))

(assert (= (and b!506008 res!307003) b!506013))

(assert (= (and b!506008 (not res!307012)) b!506016))

(assert (= (and b!506016 (not res!307013)) b!506018))

(declare-fun m!486655 () Bool)

(assert (=> b!506012 m!486655))

(assert (=> b!506012 m!486655))

(declare-fun m!486657 () Bool)

(assert (=> b!506012 m!486657))

(declare-fun m!486659 () Bool)

(assert (=> b!506017 m!486659))

(declare-fun m!486661 () Bool)

(assert (=> b!506005 m!486661))

(declare-fun m!486663 () Bool)

(assert (=> b!506005 m!486663))

(assert (=> b!506003 m!486655))

(assert (=> b!506003 m!486655))

(declare-fun m!486665 () Bool)

(assert (=> b!506003 m!486665))

(declare-fun m!486667 () Bool)

(assert (=> b!506004 m!486667))

(assert (=> b!506016 m!486663))

(declare-fun m!486669 () Bool)

(assert (=> start!45748 m!486669))

(declare-fun m!486671 () Bool)

(assert (=> start!45748 m!486671))

(declare-fun m!486673 () Bool)

(assert (=> b!506011 m!486673))

(declare-fun m!486675 () Bool)

(assert (=> b!506011 m!486675))

(declare-fun m!486677 () Bool)

(assert (=> b!506011 m!486677))

(declare-fun m!486679 () Bool)

(assert (=> b!506011 m!486679))

(assert (=> b!506011 m!486655))

(declare-fun m!486681 () Bool)

(assert (=> b!506011 m!486681))

(assert (=> b!506011 m!486655))

(declare-fun m!486683 () Bool)

(assert (=> b!506011 m!486683))

(declare-fun m!486685 () Bool)

(assert (=> b!506011 m!486685))

(assert (=> b!506011 m!486655))

(declare-fun m!486687 () Bool)

(assert (=> b!506011 m!486687))

(declare-fun m!486689 () Bool)

(assert (=> b!506015 m!486689))

(declare-fun m!486691 () Bool)

(assert (=> b!506002 m!486691))

(declare-fun m!486693 () Bool)

(assert (=> b!506002 m!486693))

(assert (=> b!506002 m!486655))

(assert (=> b!506013 m!486655))

(assert (=> b!506013 m!486655))

(declare-fun m!486695 () Bool)

(assert (=> b!506013 m!486695))

(declare-fun m!486697 () Bool)

(assert (=> b!506014 m!486697))

(declare-fun m!486699 () Bool)

(assert (=> b!506009 m!486699))

(declare-fun m!486701 () Bool)

(assert (=> b!506018 m!486701))

(declare-fun m!486703 () Bool)

(assert (=> b!506018 m!486703))

(push 1)

