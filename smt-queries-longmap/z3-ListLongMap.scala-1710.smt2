; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31428 () Bool)

(assert start!31428)

(declare-fun b!314632 () Bool)

(declare-fun e!195894 () Bool)

(declare-fun e!195895 () Bool)

(assert (=> b!314632 (= e!195894 e!195895)))

(declare-fun res!170392 () Bool)

(assert (=> b!314632 (=> (not res!170392) (not e!195895))))

(declare-datatypes ((array!16058 0))(
  ( (array!16059 (arr!7602 (Array (_ BitVec 32) (_ BitVec 64))) (size!7955 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16058)

(declare-datatypes ((SeekEntryResult!2741 0))(
  ( (MissingZero!2741 (index!13140 (_ BitVec 32))) (Found!2741 (index!13141 (_ BitVec 32))) (Intermediate!2741 (undefined!3553 Bool) (index!13142 (_ BitVec 32)) (x!31388 (_ BitVec 32))) (Undefined!2741) (MissingVacant!2741 (index!13143 (_ BitVec 32))) )
))
(declare-fun lt!153818 () SeekEntryResult!2741)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16058 (_ BitVec 32)) SeekEntryResult!2741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314632 (= res!170392 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153818))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!314632 (= lt!153818 (Intermediate!2741 false resIndex!52 resX!52))))

(declare-fun b!314633 () Bool)

(declare-fun res!170387 () Bool)

(assert (=> b!314633 (=> (not res!170387) (not e!195894))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314633 (= res!170387 (and (= (size!7955 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7955 a!3293))))))

(declare-fun b!314634 () Bool)

(declare-fun res!170386 () Bool)

(assert (=> b!314634 (=> (not res!170386) (not e!195894))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16058 (_ BitVec 32)) SeekEntryResult!2741)

(assert (=> b!314634 (= res!170386 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2741 i!1240)))))

(declare-fun b!314635 () Bool)

(declare-fun e!195896 () Bool)

(assert (=> b!314635 (= e!195895 e!195896)))

(declare-fun res!170389 () Bool)

(assert (=> b!314635 (=> (not res!170389) (not e!195896))))

(declare-fun lt!153817 () SeekEntryResult!2741)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314635 (= res!170389 (and (= lt!153817 lt!153818) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7602 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7602 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7602 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314635 (= lt!153817 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314636 () Bool)

(declare-fun res!170393 () Bool)

(assert (=> b!314636 (=> (not res!170393) (not e!195894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314636 (= res!170393 (validKeyInArray!0 k0!2441))))

(declare-fun b!314638 () Bool)

(declare-fun res!170390 () Bool)

(assert (=> b!314638 (=> (not res!170390) (not e!195894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16058 (_ BitVec 32)) Bool)

(assert (=> b!314638 (= res!170390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314639 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314639 (= e!195896 (not (= lt!153817 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))))

(declare-fun b!314640 () Bool)

(declare-fun res!170388 () Bool)

(assert (=> b!314640 (=> (not res!170388) (not e!195894))))

(declare-fun arrayContainsKey!0 (array!16058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314640 (= res!170388 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!170394 () Bool)

(assert (=> start!31428 (=> (not res!170394) (not e!195894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31428 (= res!170394 (validMask!0 mask!3709))))

(assert (=> start!31428 e!195894))

(declare-fun array_inv!5574 (array!16058) Bool)

(assert (=> start!31428 (array_inv!5574 a!3293)))

(assert (=> start!31428 true))

(declare-fun b!314637 () Bool)

(declare-fun res!170391 () Bool)

(assert (=> b!314637 (=> (not res!170391) (not e!195895))))

(assert (=> b!314637 (= res!170391 (and (= (select (arr!7602 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7955 a!3293))))))

(assert (= (and start!31428 res!170394) b!314633))

(assert (= (and b!314633 res!170387) b!314636))

(assert (= (and b!314636 res!170393) b!314640))

(assert (= (and b!314640 res!170388) b!314634))

(assert (= (and b!314634 res!170386) b!314638))

(assert (= (and b!314638 res!170390) b!314632))

(assert (= (and b!314632 res!170392) b!314637))

(assert (= (and b!314637 res!170391) b!314635))

(assert (= (and b!314635 res!170389) b!314639))

(declare-fun m!323593 () Bool)

(assert (=> b!314640 m!323593))

(declare-fun m!323595 () Bool)

(assert (=> start!31428 m!323595))

(declare-fun m!323597 () Bool)

(assert (=> start!31428 m!323597))

(declare-fun m!323599 () Bool)

(assert (=> b!314632 m!323599))

(assert (=> b!314632 m!323599))

(declare-fun m!323601 () Bool)

(assert (=> b!314632 m!323601))

(declare-fun m!323603 () Bool)

(assert (=> b!314637 m!323603))

(declare-fun m!323605 () Bool)

(assert (=> b!314635 m!323605))

(declare-fun m!323607 () Bool)

(assert (=> b!314635 m!323607))

(declare-fun m!323609 () Bool)

(assert (=> b!314636 m!323609))

(declare-fun m!323611 () Bool)

(assert (=> b!314639 m!323611))

(assert (=> b!314639 m!323611))

(declare-fun m!323613 () Bool)

(assert (=> b!314639 m!323613))

(declare-fun m!323615 () Bool)

(assert (=> b!314638 m!323615))

(declare-fun m!323617 () Bool)

(assert (=> b!314634 m!323617))

(check-sat (not start!31428) (not b!314636) (not b!314634) (not b!314635) (not b!314640) (not b!314639) (not b!314638) (not b!314632))
(check-sat)
(get-model)

(declare-fun d!68623 () Bool)

(declare-fun e!195951 () Bool)

(assert (=> d!68623 e!195951))

(declare-fun c!49754 () Bool)

(declare-fun lt!153849 () SeekEntryResult!2741)

(get-info :version)

(assert (=> d!68623 (= c!49754 (and ((_ is Intermediate!2741) lt!153849) (undefined!3553 lt!153849)))))

(declare-fun e!195952 () SeekEntryResult!2741)

(assert (=> d!68623 (= lt!153849 e!195952)))

(declare-fun c!49753 () Bool)

(assert (=> d!68623 (= c!49753 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!153848 () (_ BitVec 64))

(assert (=> d!68623 (= lt!153848 (select (arr!7602 a!3293) index!1781))))

(assert (=> d!68623 (validMask!0 mask!3709)))

(assert (=> d!68623 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!153849)))

(declare-fun b!314743 () Bool)

(declare-fun e!195950 () Bool)

(assert (=> b!314743 (= e!195951 e!195950)))

(declare-fun res!170469 () Bool)

(assert (=> b!314743 (= res!170469 (and ((_ is Intermediate!2741) lt!153849) (not (undefined!3553 lt!153849)) (bvslt (x!31388 lt!153849) #b01111111111111111111111111111110) (bvsge (x!31388 lt!153849) #b00000000000000000000000000000000) (bvsge (x!31388 lt!153849) x!1427)))))

(assert (=> b!314743 (=> (not res!170469) (not e!195950))))

(declare-fun b!314744 () Bool)

(assert (=> b!314744 (and (bvsge (index!13142 lt!153849) #b00000000000000000000000000000000) (bvslt (index!13142 lt!153849) (size!7955 a!3293)))))

(declare-fun e!195953 () Bool)

(assert (=> b!314744 (= e!195953 (= (select (arr!7602 a!3293) (index!13142 lt!153849)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314745 () Bool)

(assert (=> b!314745 (and (bvsge (index!13142 lt!153849) #b00000000000000000000000000000000) (bvslt (index!13142 lt!153849) (size!7955 a!3293)))))

(declare-fun res!170467 () Bool)

(assert (=> b!314745 (= res!170467 (= (select (arr!7602 a!3293) (index!13142 lt!153849)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314745 (=> res!170467 e!195953)))

(declare-fun b!314746 () Bool)

(declare-fun e!195954 () SeekEntryResult!2741)

(assert (=> b!314746 (= e!195954 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314747 () Bool)

(assert (=> b!314747 (= e!195952 (Intermediate!2741 true index!1781 x!1427))))

(declare-fun b!314748 () Bool)

(assert (=> b!314748 (and (bvsge (index!13142 lt!153849) #b00000000000000000000000000000000) (bvslt (index!13142 lt!153849) (size!7955 a!3293)))))

(declare-fun res!170468 () Bool)

(assert (=> b!314748 (= res!170468 (= (select (arr!7602 a!3293) (index!13142 lt!153849)) k0!2441))))

(assert (=> b!314748 (=> res!170468 e!195953)))

(assert (=> b!314748 (= e!195950 e!195953)))

(declare-fun b!314749 () Bool)

(assert (=> b!314749 (= e!195951 (bvsge (x!31388 lt!153849) #b01111111111111111111111111111110))))

(declare-fun b!314750 () Bool)

(assert (=> b!314750 (= e!195952 e!195954)))

(declare-fun c!49752 () Bool)

(assert (=> b!314750 (= c!49752 (or (= lt!153848 k0!2441) (= (bvadd lt!153848 lt!153848) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314751 () Bool)

(assert (=> b!314751 (= e!195954 (Intermediate!2741 false index!1781 x!1427))))

(assert (= (and d!68623 c!49753) b!314747))

(assert (= (and d!68623 (not c!49753)) b!314750))

(assert (= (and b!314750 c!49752) b!314751))

(assert (= (and b!314750 (not c!49752)) b!314746))

(assert (= (and d!68623 c!49754) b!314749))

(assert (= (and d!68623 (not c!49754)) b!314743))

(assert (= (and b!314743 res!170469) b!314748))

(assert (= (and b!314748 (not res!170468)) b!314745))

(assert (= (and b!314745 (not res!170467)) b!314744))

(assert (=> d!68623 m!323605))

(assert (=> d!68623 m!323595))

(declare-fun m!323683 () Bool)

(assert (=> b!314748 m!323683))

(assert (=> b!314744 m!323683))

(assert (=> b!314746 m!323611))

(assert (=> b!314746 m!323611))

(declare-fun m!323685 () Bool)

(assert (=> b!314746 m!323685))

(assert (=> b!314745 m!323683))

(assert (=> b!314635 d!68623))

(declare-fun d!68631 () Bool)

(declare-fun res!170483 () Bool)

(declare-fun e!195974 () Bool)

(assert (=> d!68631 (=> res!170483 e!195974)))

(assert (=> d!68631 (= res!170483 (= (select (arr!7602 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68631 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195974)))

(declare-fun b!314783 () Bool)

(declare-fun e!195975 () Bool)

(assert (=> b!314783 (= e!195974 e!195975)))

(declare-fun res!170484 () Bool)

(assert (=> b!314783 (=> (not res!170484) (not e!195975))))

(assert (=> b!314783 (= res!170484 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7955 a!3293)))))

(declare-fun b!314784 () Bool)

(assert (=> b!314784 (= e!195975 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68631 (not res!170483)) b!314783))

(assert (= (and b!314783 res!170484) b!314784))

(declare-fun m!323687 () Bool)

(assert (=> d!68631 m!323687))

(declare-fun m!323689 () Bool)

(assert (=> b!314784 m!323689))

(assert (=> b!314640 d!68631))

(declare-fun d!68633 () Bool)

(declare-fun e!195977 () Bool)

(assert (=> d!68633 e!195977))

(declare-fun c!49766 () Bool)

(declare-fun lt!153857 () SeekEntryResult!2741)

(assert (=> d!68633 (= c!49766 (and ((_ is Intermediate!2741) lt!153857) (undefined!3553 lt!153857)))))

(declare-fun e!195978 () SeekEntryResult!2741)

(assert (=> d!68633 (= lt!153857 e!195978)))

(declare-fun c!49765 () Bool)

(assert (=> d!68633 (= c!49765 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!153856 () (_ BitVec 64))

(assert (=> d!68633 (= lt!153856 (select (arr!7602 a!3293) (nextIndex!0 index!1781 x!1427 mask!3709)))))

(assert (=> d!68633 (validMask!0 mask!3709)))

(assert (=> d!68633 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709) lt!153857)))

(declare-fun b!314785 () Bool)

(declare-fun e!195976 () Bool)

(assert (=> b!314785 (= e!195977 e!195976)))

(declare-fun res!170487 () Bool)

(assert (=> b!314785 (= res!170487 (and ((_ is Intermediate!2741) lt!153857) (not (undefined!3553 lt!153857)) (bvslt (x!31388 lt!153857) #b01111111111111111111111111111110) (bvsge (x!31388 lt!153857) #b00000000000000000000000000000000) (bvsge (x!31388 lt!153857) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!314785 (=> (not res!170487) (not e!195976))))

(declare-fun b!314786 () Bool)

(assert (=> b!314786 (and (bvsge (index!13142 lt!153857) #b00000000000000000000000000000000) (bvslt (index!13142 lt!153857) (size!7955 a!3293)))))

(declare-fun e!195979 () Bool)

(assert (=> b!314786 (= e!195979 (= (select (arr!7602 a!3293) (index!13142 lt!153857)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314787 () Bool)

(assert (=> b!314787 (and (bvsge (index!13142 lt!153857) #b00000000000000000000000000000000) (bvslt (index!13142 lt!153857) (size!7955 a!3293)))))

(declare-fun res!170485 () Bool)

(assert (=> b!314787 (= res!170485 (= (select (arr!7602 a!3293) (index!13142 lt!153857)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314787 (=> res!170485 e!195979)))

(declare-fun b!314788 () Bool)

(declare-fun e!195980 () SeekEntryResult!2741)

(assert (=> b!314788 (= e!195980 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314789 () Bool)

(assert (=> b!314789 (= e!195978 (Intermediate!2741 true (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!314790 () Bool)

(assert (=> b!314790 (and (bvsge (index!13142 lt!153857) #b00000000000000000000000000000000) (bvslt (index!13142 lt!153857) (size!7955 a!3293)))))

(declare-fun res!170486 () Bool)

(assert (=> b!314790 (= res!170486 (= (select (arr!7602 a!3293) (index!13142 lt!153857)) k0!2441))))

(assert (=> b!314790 (=> res!170486 e!195979)))

(assert (=> b!314790 (= e!195976 e!195979)))

(declare-fun b!314791 () Bool)

(assert (=> b!314791 (= e!195977 (bvsge (x!31388 lt!153857) #b01111111111111111111111111111110))))

(declare-fun b!314792 () Bool)

(assert (=> b!314792 (= e!195978 e!195980)))

(declare-fun c!49764 () Bool)

(assert (=> b!314792 (= c!49764 (or (= lt!153856 k0!2441) (= (bvadd lt!153856 lt!153856) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314793 () Bool)

(assert (=> b!314793 (= e!195980 (Intermediate!2741 false (nextIndex!0 index!1781 x!1427 mask!3709) (bvadd #b00000000000000000000000000000001 x!1427)))))

(assert (= (and d!68633 c!49765) b!314789))

(assert (= (and d!68633 (not c!49765)) b!314792))

(assert (= (and b!314792 c!49764) b!314793))

(assert (= (and b!314792 (not c!49764)) b!314788))

(assert (= (and d!68633 c!49766) b!314791))

(assert (= (and d!68633 (not c!49766)) b!314785))

(assert (= (and b!314785 res!170487) b!314790))

(assert (= (and b!314790 (not res!170486)) b!314787))

(assert (= (and b!314787 (not res!170485)) b!314786))

(assert (=> d!68633 m!323611))

(declare-fun m!323699 () Bool)

(assert (=> d!68633 m!323699))

(assert (=> d!68633 m!323595))

(declare-fun m!323701 () Bool)

(assert (=> b!314790 m!323701))

(assert (=> b!314786 m!323701))

(assert (=> b!314788 m!323611))

(declare-fun m!323703 () Bool)

(assert (=> b!314788 m!323703))

(assert (=> b!314788 m!323703))

(declare-fun m!323705 () Bool)

(assert (=> b!314788 m!323705))

(assert (=> b!314787 m!323701))

(assert (=> b!314639 d!68633))

(declare-fun d!68637 () Bool)

(declare-fun lt!153865 () (_ BitVec 32))

(assert (=> d!68637 (and (bvsge lt!153865 #b00000000000000000000000000000000) (bvslt lt!153865 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!68637 (= lt!153865 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!68637 (validMask!0 mask!3709)))

(assert (=> d!68637 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!153865)))

(declare-fun bs!10989 () Bool)

(assert (= bs!10989 d!68637))

(declare-fun m!323717 () Bool)

(assert (=> bs!10989 m!323717))

(assert (=> bs!10989 m!323595))

(assert (=> b!314639 d!68637))

(declare-fun b!314875 () Bool)

(declare-fun c!49799 () Bool)

(declare-fun lt!153905 () (_ BitVec 64))

(assert (=> b!314875 (= c!49799 (= lt!153905 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!196027 () SeekEntryResult!2741)

(declare-fun e!196028 () SeekEntryResult!2741)

(assert (=> b!314875 (= e!196027 e!196028)))

(declare-fun b!314876 () Bool)

(declare-fun lt!153904 () SeekEntryResult!2741)

(assert (=> b!314876 (= e!196028 (MissingZero!2741 (index!13142 lt!153904)))))

(declare-fun d!68643 () Bool)

(declare-fun lt!153906 () SeekEntryResult!2741)

(assert (=> d!68643 (and (or ((_ is Undefined!2741) lt!153906) (not ((_ is Found!2741) lt!153906)) (and (bvsge (index!13141 lt!153906) #b00000000000000000000000000000000) (bvslt (index!13141 lt!153906) (size!7955 a!3293)))) (or ((_ is Undefined!2741) lt!153906) ((_ is Found!2741) lt!153906) (not ((_ is MissingZero!2741) lt!153906)) (and (bvsge (index!13140 lt!153906) #b00000000000000000000000000000000) (bvslt (index!13140 lt!153906) (size!7955 a!3293)))) (or ((_ is Undefined!2741) lt!153906) ((_ is Found!2741) lt!153906) ((_ is MissingZero!2741) lt!153906) (not ((_ is MissingVacant!2741) lt!153906)) (and (bvsge (index!13143 lt!153906) #b00000000000000000000000000000000) (bvslt (index!13143 lt!153906) (size!7955 a!3293)))) (or ((_ is Undefined!2741) lt!153906) (ite ((_ is Found!2741) lt!153906) (= (select (arr!7602 a!3293) (index!13141 lt!153906)) k0!2441) (ite ((_ is MissingZero!2741) lt!153906) (= (select (arr!7602 a!3293) (index!13140 lt!153906)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2741) lt!153906) (= (select (arr!7602 a!3293) (index!13143 lt!153906)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!196029 () SeekEntryResult!2741)

(assert (=> d!68643 (= lt!153906 e!196029)))

(declare-fun c!49798 () Bool)

(assert (=> d!68643 (= c!49798 (and ((_ is Intermediate!2741) lt!153904) (undefined!3553 lt!153904)))))

(assert (=> d!68643 (= lt!153904 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68643 (validMask!0 mask!3709)))

(assert (=> d!68643 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153906)))

(declare-fun b!314877 () Bool)

(assert (=> b!314877 (= e!196029 e!196027)))

(assert (=> b!314877 (= lt!153905 (select (arr!7602 a!3293) (index!13142 lt!153904)))))

(declare-fun c!49797 () Bool)

(assert (=> b!314877 (= c!49797 (= lt!153905 k0!2441))))

(declare-fun b!314878 () Bool)

(assert (=> b!314878 (= e!196027 (Found!2741 (index!13142 lt!153904)))))

(declare-fun b!314879 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16058 (_ BitVec 32)) SeekEntryResult!2741)

(assert (=> b!314879 (= e!196028 (seekKeyOrZeroReturnVacant!0 (x!31388 lt!153904) (index!13142 lt!153904) (index!13142 lt!153904) k0!2441 a!3293 mask!3709))))

(declare-fun b!314880 () Bool)

(assert (=> b!314880 (= e!196029 Undefined!2741)))

(assert (= (and d!68643 c!49798) b!314880))

(assert (= (and d!68643 (not c!49798)) b!314877))

(assert (= (and b!314877 c!49797) b!314878))

(assert (= (and b!314877 (not c!49797)) b!314875))

(assert (= (and b!314875 c!49799) b!314876))

(assert (= (and b!314875 (not c!49799)) b!314879))

(assert (=> d!68643 m!323599))

(assert (=> d!68643 m!323601))

(assert (=> d!68643 m!323595))

(declare-fun m!323757 () Bool)

(assert (=> d!68643 m!323757))

(declare-fun m!323759 () Bool)

(assert (=> d!68643 m!323759))

(declare-fun m!323761 () Bool)

(assert (=> d!68643 m!323761))

(assert (=> d!68643 m!323599))

(declare-fun m!323763 () Bool)

(assert (=> b!314877 m!323763))

(declare-fun m!323765 () Bool)

(assert (=> b!314879 m!323765))

(assert (=> b!314634 d!68643))

(declare-fun d!68665 () Bool)

(assert (=> d!68665 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31428 d!68665))

(declare-fun d!68675 () Bool)

(assert (=> d!68675 (= (array_inv!5574 a!3293) (bvsge (size!7955 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31428 d!68675))

(declare-fun d!68677 () Bool)

(declare-fun e!196046 () Bool)

(assert (=> d!68677 e!196046))

(declare-fun c!49811 () Bool)

(declare-fun lt!153917 () SeekEntryResult!2741)

(assert (=> d!68677 (= c!49811 (and ((_ is Intermediate!2741) lt!153917) (undefined!3553 lt!153917)))))

(declare-fun e!196047 () SeekEntryResult!2741)

(assert (=> d!68677 (= lt!153917 e!196047)))

(declare-fun c!49810 () Bool)

(assert (=> d!68677 (= c!49810 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!153916 () (_ BitVec 64))

(assert (=> d!68677 (= lt!153916 (select (arr!7602 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68677 (validMask!0 mask!3709)))

(assert (=> d!68677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153917)))

(declare-fun b!314905 () Bool)

(declare-fun e!196045 () Bool)

(assert (=> b!314905 (= e!196046 e!196045)))

(declare-fun res!170519 () Bool)

(assert (=> b!314905 (= res!170519 (and ((_ is Intermediate!2741) lt!153917) (not (undefined!3553 lt!153917)) (bvslt (x!31388 lt!153917) #b01111111111111111111111111111110) (bvsge (x!31388 lt!153917) #b00000000000000000000000000000000) (bvsge (x!31388 lt!153917) #b00000000000000000000000000000000)))))

(assert (=> b!314905 (=> (not res!170519) (not e!196045))))

(declare-fun b!314906 () Bool)

(assert (=> b!314906 (and (bvsge (index!13142 lt!153917) #b00000000000000000000000000000000) (bvslt (index!13142 lt!153917) (size!7955 a!3293)))))

(declare-fun e!196048 () Bool)

(assert (=> b!314906 (= e!196048 (= (select (arr!7602 a!3293) (index!13142 lt!153917)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!314907 () Bool)

(assert (=> b!314907 (and (bvsge (index!13142 lt!153917) #b00000000000000000000000000000000) (bvslt (index!13142 lt!153917) (size!7955 a!3293)))))

(declare-fun res!170517 () Bool)

(assert (=> b!314907 (= res!170517 (= (select (arr!7602 a!3293) (index!13142 lt!153917)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!314907 (=> res!170517 e!196048)))

(declare-fun e!196049 () SeekEntryResult!2741)

(declare-fun b!314908 () Bool)

(assert (=> b!314908 (= e!196049 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314909 () Bool)

(assert (=> b!314909 (= e!196047 (Intermediate!2741 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!314910 () Bool)

(assert (=> b!314910 (and (bvsge (index!13142 lt!153917) #b00000000000000000000000000000000) (bvslt (index!13142 lt!153917) (size!7955 a!3293)))))

(declare-fun res!170518 () Bool)

(assert (=> b!314910 (= res!170518 (= (select (arr!7602 a!3293) (index!13142 lt!153917)) k0!2441))))

(assert (=> b!314910 (=> res!170518 e!196048)))

(assert (=> b!314910 (= e!196045 e!196048)))

(declare-fun b!314911 () Bool)

(assert (=> b!314911 (= e!196046 (bvsge (x!31388 lt!153917) #b01111111111111111111111111111110))))

(declare-fun b!314912 () Bool)

(assert (=> b!314912 (= e!196047 e!196049)))

(declare-fun c!49809 () Bool)

(assert (=> b!314912 (= c!49809 (or (= lt!153916 k0!2441) (= (bvadd lt!153916 lt!153916) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!314913 () Bool)

(assert (=> b!314913 (= e!196049 (Intermediate!2741 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(assert (= (and d!68677 c!49810) b!314909))

(assert (= (and d!68677 (not c!49810)) b!314912))

(assert (= (and b!314912 c!49809) b!314913))

(assert (= (and b!314912 (not c!49809)) b!314908))

(assert (= (and d!68677 c!49811) b!314911))

(assert (= (and d!68677 (not c!49811)) b!314905))

(assert (= (and b!314905 res!170519) b!314910))

(assert (= (and b!314910 (not res!170518)) b!314907))

(assert (= (and b!314907 (not res!170517)) b!314906))

(assert (=> d!68677 m!323599))

(declare-fun m!323781 () Bool)

(assert (=> d!68677 m!323781))

(assert (=> d!68677 m!323595))

(declare-fun m!323783 () Bool)

(assert (=> b!314910 m!323783))

(assert (=> b!314906 m!323783))

(assert (=> b!314908 m!323599))

(declare-fun m!323785 () Bool)

(assert (=> b!314908 m!323785))

(assert (=> b!314908 m!323785))

(declare-fun m!323787 () Bool)

(assert (=> b!314908 m!323787))

(assert (=> b!314907 m!323783))

(assert (=> b!314632 d!68677))

(declare-fun d!68679 () Bool)

(declare-fun lt!153929 () (_ BitVec 32))

(declare-fun lt!153928 () (_ BitVec 32))

(assert (=> d!68679 (= lt!153929 (bvmul (bvxor lt!153928 (bvlshr lt!153928 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68679 (= lt!153928 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68679 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!170520 (let ((h!5334 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31399 (bvmul (bvxor h!5334 (bvlshr h!5334 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31399 (bvlshr x!31399 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!170520 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!170520 #b00000000000000000000000000000000))))))

(assert (=> d!68679 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153929 (bvlshr lt!153929 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!314632 d!68679))

(declare-fun bm!25961 () Bool)

(declare-fun call!25964 () Bool)

(assert (=> bm!25961 (= call!25964 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!68681 () Bool)

(declare-fun res!170531 () Bool)

(declare-fun e!196067 () Bool)

(assert (=> d!68681 (=> res!170531 e!196067)))

(assert (=> d!68681 (= res!170531 (bvsge #b00000000000000000000000000000000 (size!7955 a!3293)))))

(assert (=> d!68681 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!196067)))

(declare-fun b!314934 () Bool)

(declare-fun e!196065 () Bool)

(declare-fun e!196066 () Bool)

(assert (=> b!314934 (= e!196065 e!196066)))

(declare-fun lt!153939 () (_ BitVec 64))

(assert (=> b!314934 (= lt!153939 (select (arr!7602 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9661 0))(
  ( (Unit!9662) )
))
(declare-fun lt!153940 () Unit!9661)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16058 (_ BitVec 64) (_ BitVec 32)) Unit!9661)

(assert (=> b!314934 (= lt!153940 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153939 #b00000000000000000000000000000000))))

(assert (=> b!314934 (arrayContainsKey!0 a!3293 lt!153939 #b00000000000000000000000000000000)))

(declare-fun lt!153941 () Unit!9661)

(assert (=> b!314934 (= lt!153941 lt!153940)))

(declare-fun res!170532 () Bool)

(assert (=> b!314934 (= res!170532 (= (seekEntryOrOpen!0 (select (arr!7602 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2741 #b00000000000000000000000000000000)))))

(assert (=> b!314934 (=> (not res!170532) (not e!196066))))

(declare-fun b!314935 () Bool)

(assert (=> b!314935 (= e!196065 call!25964)))

(declare-fun b!314936 () Bool)

(assert (=> b!314936 (= e!196066 call!25964)))

(declare-fun b!314937 () Bool)

(assert (=> b!314937 (= e!196067 e!196065)))

(declare-fun c!49817 () Bool)

(assert (=> b!314937 (= c!49817 (validKeyInArray!0 (select (arr!7602 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!68681 (not res!170531)) b!314937))

(assert (= (and b!314937 c!49817) b!314934))

(assert (= (and b!314937 (not c!49817)) b!314935))

(assert (= (and b!314934 res!170532) b!314936))

(assert (= (or b!314936 b!314935) bm!25961))

(declare-fun m!323799 () Bool)

(assert (=> bm!25961 m!323799))

(assert (=> b!314934 m!323687))

(declare-fun m!323801 () Bool)

(assert (=> b!314934 m!323801))

(declare-fun m!323803 () Bool)

(assert (=> b!314934 m!323803))

(assert (=> b!314934 m!323687))

(declare-fun m!323805 () Bool)

(assert (=> b!314934 m!323805))

(assert (=> b!314937 m!323687))

(assert (=> b!314937 m!323687))

(declare-fun m!323807 () Bool)

(assert (=> b!314937 m!323807))

(assert (=> b!314638 d!68681))

(declare-fun d!68685 () Bool)

(assert (=> d!68685 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!314636 d!68685))

(check-sat (not d!68643) (not bm!25961) (not b!314908) (not b!314879) (not d!68623) (not d!68637) (not b!314788) (not b!314784) (not d!68633) (not b!314746) (not d!68677) (not b!314934) (not b!314937))
(check-sat)
