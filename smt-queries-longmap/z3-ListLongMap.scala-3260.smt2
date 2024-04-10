; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45434 () Bool)

(assert start!45434)

(declare-fun b!499728 () Bool)

(declare-fun res!301663 () Bool)

(declare-fun e!292826 () Bool)

(assert (=> b!499728 (=> (not res!301663) (not e!292826))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32259 0))(
  ( (array!32260 (arr!15511 (Array (_ BitVec 32) (_ BitVec 64))) (size!15875 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32259)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!499728 (= res!301663 (and (= (size!15875 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15875 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15875 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499729 () Bool)

(declare-fun e!292823 () Bool)

(assert (=> b!499729 (= e!292823 true)))

(declare-fun lt!226641 () (_ BitVec 64))

(declare-fun lt!226640 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3978 0))(
  ( (MissingZero!3978 (index!18094 (_ BitVec 32))) (Found!3978 (index!18095 (_ BitVec 32))) (Intermediate!3978 (undefined!4790 Bool) (index!18096 (_ BitVec 32)) (x!47135 (_ BitVec 32))) (Undefined!3978) (MissingVacant!3978 (index!18097 (_ BitVec 32))) )
))
(declare-fun lt!226648 () SeekEntryResult!3978)

(declare-fun lt!226646 () array!32259)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32259 (_ BitVec 32)) SeekEntryResult!3978)

(assert (=> b!499729 (= lt!226648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226640 lt!226641 lt!226646 mask!3524))))

(declare-fun e!292825 () Bool)

(declare-fun b!499730 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32259 (_ BitVec 32)) SeekEntryResult!3978)

(assert (=> b!499730 (= e!292825 (= (seekEntryOrOpen!0 (select (arr!15511 a!3235) j!176) a!3235 mask!3524) (Found!3978 j!176)))))

(declare-fun b!499731 () Bool)

(declare-fun res!301655 () Bool)

(assert (=> b!499731 (=> (not res!301655) (not e!292826))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499731 (= res!301655 (validKeyInArray!0 (select (arr!15511 a!3235) j!176)))))

(declare-fun b!499732 () Bool)

(declare-fun e!292829 () Bool)

(assert (=> b!499732 (= e!292829 false)))

(declare-fun b!499733 () Bool)

(declare-fun e!292828 () Bool)

(declare-fun e!292827 () Bool)

(assert (=> b!499733 (= e!292828 (not e!292827))))

(declare-fun res!301654 () Bool)

(assert (=> b!499733 (=> res!301654 e!292827)))

(declare-fun lt!226642 () SeekEntryResult!3978)

(declare-fun lt!226645 () (_ BitVec 32))

(assert (=> b!499733 (= res!301654 (= lt!226642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226645 lt!226641 lt!226646 mask!3524)))))

(assert (=> b!499733 (= lt!226642 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226640 (select (arr!15511 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499733 (= lt!226645 (toIndex!0 lt!226641 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!499733 (= lt!226641 (select (store (arr!15511 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499733 (= lt!226640 (toIndex!0 (select (arr!15511 a!3235) j!176) mask!3524))))

(assert (=> b!499733 (= lt!226646 (array!32260 (store (arr!15511 a!3235) i!1204 k0!2280) (size!15875 a!3235)))))

(assert (=> b!499733 e!292825))

(declare-fun res!301664 () Bool)

(assert (=> b!499733 (=> (not res!301664) (not e!292825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32259 (_ BitVec 32)) Bool)

(assert (=> b!499733 (= res!301664 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14988 0))(
  ( (Unit!14989) )
))
(declare-fun lt!226643 () Unit!14988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32259 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14988)

(assert (=> b!499733 (= lt!226643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499734 () Bool)

(declare-fun res!301658 () Bool)

(assert (=> b!499734 (=> (not res!301658) (not e!292828))))

(declare-datatypes ((List!9669 0))(
  ( (Nil!9666) (Cons!9665 (h!10539 (_ BitVec 64)) (t!15897 List!9669)) )
))
(declare-fun arrayNoDuplicates!0 (array!32259 (_ BitVec 32) List!9669) Bool)

(assert (=> b!499734 (= res!301658 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9666))))

(declare-fun b!499735 () Bool)

(assert (=> b!499735 (= e!292826 e!292828)))

(declare-fun res!301653 () Bool)

(assert (=> b!499735 (=> (not res!301653) (not e!292828))))

(declare-fun lt!226639 () SeekEntryResult!3978)

(assert (=> b!499735 (= res!301653 (or (= lt!226639 (MissingZero!3978 i!1204)) (= lt!226639 (MissingVacant!3978 i!1204))))))

(assert (=> b!499735 (= lt!226639 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!499736 () Bool)

(declare-fun res!301652 () Bool)

(assert (=> b!499736 (=> res!301652 e!292827)))

(get-info :version)

(assert (=> b!499736 (= res!301652 (or (undefined!4790 lt!226642) (not ((_ is Intermediate!3978) lt!226642))))))

(declare-fun b!499737 () Bool)

(assert (=> b!499737 (= e!292827 e!292823)))

(declare-fun res!301662 () Bool)

(assert (=> b!499737 (=> res!301662 e!292823)))

(assert (=> b!499737 (= res!301662 (or (bvsgt #b00000000000000000000000000000000 (x!47135 lt!226642)) (bvsgt (x!47135 lt!226642) #b01111111111111111111111111111110) (bvslt lt!226640 #b00000000000000000000000000000000) (bvsge lt!226640 (size!15875 a!3235)) (bvslt (index!18096 lt!226642) #b00000000000000000000000000000000) (bvsge (index!18096 lt!226642) (size!15875 a!3235)) (not (= lt!226642 (Intermediate!3978 false (index!18096 lt!226642) (x!47135 lt!226642))))))))

(assert (=> b!499737 (and (or (= (select (arr!15511 a!3235) (index!18096 lt!226642)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15511 a!3235) (index!18096 lt!226642)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15511 a!3235) (index!18096 lt!226642)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15511 a!3235) (index!18096 lt!226642)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226644 () Unit!14988)

(declare-fun e!292824 () Unit!14988)

(assert (=> b!499737 (= lt!226644 e!292824)))

(declare-fun c!59315 () Bool)

(assert (=> b!499737 (= c!59315 (= (select (arr!15511 a!3235) (index!18096 lt!226642)) (select (arr!15511 a!3235) j!176)))))

(assert (=> b!499737 (and (bvslt (x!47135 lt!226642) #b01111111111111111111111111111110) (or (= (select (arr!15511 a!3235) (index!18096 lt!226642)) (select (arr!15511 a!3235) j!176)) (= (select (arr!15511 a!3235) (index!18096 lt!226642)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15511 a!3235) (index!18096 lt!226642)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499738 () Bool)

(declare-fun res!301657 () Bool)

(assert (=> b!499738 (=> (not res!301657) (not e!292828))))

(assert (=> b!499738 (= res!301657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499739 () Bool)

(declare-fun res!301661 () Bool)

(assert (=> b!499739 (=> (not res!301661) (not e!292826))))

(declare-fun arrayContainsKey!0 (array!32259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499739 (= res!301661 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!301659 () Bool)

(assert (=> start!45434 (=> (not res!301659) (not e!292826))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45434 (= res!301659 (validMask!0 mask!3524))))

(assert (=> start!45434 e!292826))

(assert (=> start!45434 true))

(declare-fun array_inv!11307 (array!32259) Bool)

(assert (=> start!45434 (array_inv!11307 a!3235)))

(declare-fun b!499740 () Bool)

(declare-fun Unit!14990 () Unit!14988)

(assert (=> b!499740 (= e!292824 Unit!14990)))

(declare-fun lt!226647 () Unit!14988)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32259 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14988)

(assert (=> b!499740 (= lt!226647 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226640 #b00000000000000000000000000000000 (index!18096 lt!226642) (x!47135 lt!226642) mask!3524))))

(declare-fun res!301660 () Bool)

(assert (=> b!499740 (= res!301660 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226640 lt!226641 lt!226646 mask!3524) (Intermediate!3978 false (index!18096 lt!226642) (x!47135 lt!226642))))))

(assert (=> b!499740 (=> (not res!301660) (not e!292829))))

(assert (=> b!499740 e!292829))

(declare-fun b!499741 () Bool)

(declare-fun res!301656 () Bool)

(assert (=> b!499741 (=> (not res!301656) (not e!292826))))

(assert (=> b!499741 (= res!301656 (validKeyInArray!0 k0!2280))))

(declare-fun b!499742 () Bool)

(declare-fun Unit!14991 () Unit!14988)

(assert (=> b!499742 (= e!292824 Unit!14991)))

(assert (= (and start!45434 res!301659) b!499728))

(assert (= (and b!499728 res!301663) b!499731))

(assert (= (and b!499731 res!301655) b!499741))

(assert (= (and b!499741 res!301656) b!499739))

(assert (= (and b!499739 res!301661) b!499735))

(assert (= (and b!499735 res!301653) b!499738))

(assert (= (and b!499738 res!301657) b!499734))

(assert (= (and b!499734 res!301658) b!499733))

(assert (= (and b!499733 res!301664) b!499730))

(assert (= (and b!499733 (not res!301654)) b!499736))

(assert (= (and b!499736 (not res!301652)) b!499737))

(assert (= (and b!499737 c!59315) b!499740))

(assert (= (and b!499737 (not c!59315)) b!499742))

(assert (= (and b!499740 res!301660) b!499732))

(assert (= (and b!499737 (not res!301662)) b!499729))

(declare-fun m!480909 () Bool)

(assert (=> b!499730 m!480909))

(assert (=> b!499730 m!480909))

(declare-fun m!480911 () Bool)

(assert (=> b!499730 m!480911))

(declare-fun m!480913 () Bool)

(assert (=> b!499729 m!480913))

(declare-fun m!480915 () Bool)

(assert (=> b!499735 m!480915))

(assert (=> b!499731 m!480909))

(assert (=> b!499731 m!480909))

(declare-fun m!480917 () Bool)

(assert (=> b!499731 m!480917))

(declare-fun m!480919 () Bool)

(assert (=> b!499737 m!480919))

(assert (=> b!499737 m!480909))

(declare-fun m!480921 () Bool)

(assert (=> start!45434 m!480921))

(declare-fun m!480923 () Bool)

(assert (=> start!45434 m!480923))

(declare-fun m!480925 () Bool)

(assert (=> b!499734 m!480925))

(declare-fun m!480927 () Bool)

(assert (=> b!499738 m!480927))

(declare-fun m!480929 () Bool)

(assert (=> b!499741 m!480929))

(declare-fun m!480931 () Bool)

(assert (=> b!499733 m!480931))

(declare-fun m!480933 () Bool)

(assert (=> b!499733 m!480933))

(declare-fun m!480935 () Bool)

(assert (=> b!499733 m!480935))

(assert (=> b!499733 m!480909))

(declare-fun m!480937 () Bool)

(assert (=> b!499733 m!480937))

(assert (=> b!499733 m!480909))

(declare-fun m!480939 () Bool)

(assert (=> b!499733 m!480939))

(declare-fun m!480941 () Bool)

(assert (=> b!499733 m!480941))

(assert (=> b!499733 m!480909))

(declare-fun m!480943 () Bool)

(assert (=> b!499733 m!480943))

(declare-fun m!480945 () Bool)

(assert (=> b!499733 m!480945))

(declare-fun m!480947 () Bool)

(assert (=> b!499740 m!480947))

(assert (=> b!499740 m!480913))

(declare-fun m!480949 () Bool)

(assert (=> b!499739 m!480949))

(check-sat (not b!499731) (not b!499735) (not b!499733) (not b!499738) (not b!499740) (not b!499734) (not b!499741) (not start!45434) (not b!499730) (not b!499739) (not b!499729))
(check-sat)
