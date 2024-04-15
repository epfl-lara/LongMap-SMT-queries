; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49198 () Bool)

(assert start!49198)

(declare-fun res!336566 () Bool)

(declare-fun e!313547 () Bool)

(assert (=> start!49198 (=> (not res!336566) (not e!313547))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49198 (= res!336566 (validMask!0 mask!3216))))

(assert (=> start!49198 e!313547))

(assert (=> start!49198 true))

(declare-datatypes ((array!34267 0))(
  ( (array!34268 (arr!16468 (Array (_ BitVec 32) (_ BitVec 64))) (size!16833 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34267)

(declare-fun array_inv!12351 (array!34267) Bool)

(assert (=> start!49198 (array_inv!12351 a!3154)))

(declare-fun b!541691 () Bool)

(declare-fun e!313546 () Bool)

(declare-fun e!313548 () Bool)

(assert (=> b!541691 (= e!313546 e!313548)))

(declare-fun res!336563 () Bool)

(assert (=> b!541691 (=> (not res!336563) (not e!313548))))

(declare-datatypes ((SeekEntryResult!4923 0))(
  ( (MissingZero!4923 (index!21916 (_ BitVec 32))) (Found!4923 (index!21917 (_ BitVec 32))) (Intermediate!4923 (undefined!5735 Bool) (index!21918 (_ BitVec 32)) (x!50831 (_ BitVec 32))) (Undefined!4923) (MissingVacant!4923 (index!21919 (_ BitVec 32))) )
))
(declare-fun lt!247540 () SeekEntryResult!4923)

(declare-fun lt!247539 () SeekEntryResult!4923)

(assert (=> b!541691 (= res!336563 (= lt!247540 lt!247539))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541691 (= lt!247539 (Intermediate!4923 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34267 (_ BitVec 32)) SeekEntryResult!4923)

(assert (=> b!541691 (= lt!247540 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16468 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541692 () Bool)

(declare-fun res!336571 () Bool)

(assert (=> b!541692 (=> (not res!336571) (not e!313546))))

(assert (=> b!541692 (= res!336571 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16833 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16833 a!3154)) (= (select (arr!16468 a!3154) resIndex!32) (select (arr!16468 a!3154) j!147))))))

(declare-fun b!541693 () Bool)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541693 (= e!313548 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (store (arr!16468 a!3154) i!1153 k!1998) j!147) (array!34268 (store (arr!16468 a!3154) i!1153 k!1998) (size!16833 a!3154)) mask!3216) lt!247539)))))

(declare-fun b!541694 () Bool)

(declare-fun res!336570 () Bool)

(assert (=> b!541694 (=> (not res!336570) (not e!313547))))

(assert (=> b!541694 (= res!336570 (and (= (size!16833 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16833 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16833 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541695 () Bool)

(declare-fun res!336561 () Bool)

(assert (=> b!541695 (=> (not res!336561) (not e!313548))))

(assert (=> b!541695 (= res!336561 (and (not (= (select (arr!16468 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16468 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16468 a!3154) index!1177) (select (arr!16468 a!3154) j!147)) (= index!1177 resIndex!32)))))

(declare-fun b!541696 () Bool)

(declare-fun res!336568 () Bool)

(assert (=> b!541696 (=> (not res!336568) (not e!313547))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541696 (= res!336568 (validKeyInArray!0 k!1998))))

(declare-fun b!541697 () Bool)

(declare-fun res!336567 () Bool)

(assert (=> b!541697 (=> (not res!336567) (not e!313547))))

(assert (=> b!541697 (= res!336567 (validKeyInArray!0 (select (arr!16468 a!3154) j!147)))))

(declare-fun b!541698 () Bool)

(declare-fun res!336564 () Bool)

(assert (=> b!541698 (=> (not res!336564) (not e!313547))))

(declare-fun arrayContainsKey!0 (array!34267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541698 (= res!336564 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541699 () Bool)

(declare-fun res!336562 () Bool)

(assert (=> b!541699 (=> (not res!336562) (not e!313546))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34267 (_ BitVec 32)) Bool)

(assert (=> b!541699 (= res!336562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541700 () Bool)

(declare-fun res!336569 () Bool)

(assert (=> b!541700 (=> (not res!336569) (not e!313546))))

(declare-datatypes ((List!10626 0))(
  ( (Nil!10623) (Cons!10622 (h!11574 (_ BitVec 64)) (t!16845 List!10626)) )
))
(declare-fun arrayNoDuplicates!0 (array!34267 (_ BitVec 32) List!10626) Bool)

(assert (=> b!541700 (= res!336569 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10623))))

(declare-fun b!541701 () Bool)

(declare-fun res!336572 () Bool)

(assert (=> b!541701 (=> (not res!336572) (not e!313548))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541701 (= res!336572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) (select (arr!16468 a!3154) j!147) a!3154 mask!3216) lt!247540))))

(declare-fun b!541702 () Bool)

(assert (=> b!541702 (= e!313547 e!313546)))

(declare-fun res!336565 () Bool)

(assert (=> b!541702 (=> (not res!336565) (not e!313546))))

(declare-fun lt!247538 () SeekEntryResult!4923)

(assert (=> b!541702 (= res!336565 (or (= lt!247538 (MissingZero!4923 i!1153)) (= lt!247538 (MissingVacant!4923 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34267 (_ BitVec 32)) SeekEntryResult!4923)

(assert (=> b!541702 (= lt!247538 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49198 res!336566) b!541694))

(assert (= (and b!541694 res!336570) b!541697))

(assert (= (and b!541697 res!336567) b!541696))

(assert (= (and b!541696 res!336568) b!541698))

(assert (= (and b!541698 res!336564) b!541702))

(assert (= (and b!541702 res!336565) b!541699))

(assert (= (and b!541699 res!336562) b!541700))

(assert (= (and b!541700 res!336569) b!541692))

(assert (= (and b!541692 res!336571) b!541691))

(assert (= (and b!541691 res!336563) b!541701))

(assert (= (and b!541701 res!336572) b!541695))

(assert (= (and b!541695 res!336561) b!541693))

(declare-fun m!519627 () Bool)

(assert (=> start!49198 m!519627))

(declare-fun m!519629 () Bool)

(assert (=> start!49198 m!519629))

(declare-fun m!519631 () Bool)

(assert (=> b!541697 m!519631))

(assert (=> b!541697 m!519631))

(declare-fun m!519633 () Bool)

(assert (=> b!541697 m!519633))

(declare-fun m!519635 () Bool)

(assert (=> b!541695 m!519635))

(assert (=> b!541695 m!519631))

(declare-fun m!519637 () Bool)

(assert (=> b!541696 m!519637))

(declare-fun m!519639 () Bool)

(assert (=> b!541699 m!519639))

(declare-fun m!519641 () Bool)

(assert (=> b!541693 m!519641))

(declare-fun m!519643 () Bool)

(assert (=> b!541693 m!519643))

(assert (=> b!541693 m!519643))

(declare-fun m!519645 () Bool)

(assert (=> b!541693 m!519645))

(declare-fun m!519647 () Bool)

(assert (=> b!541692 m!519647))

(assert (=> b!541692 m!519631))

(assert (=> b!541701 m!519631))

(assert (=> b!541701 m!519631))

(declare-fun m!519649 () Bool)

(assert (=> b!541701 m!519649))

(assert (=> b!541701 m!519649))

(assert (=> b!541701 m!519631))

(declare-fun m!519651 () Bool)

(assert (=> b!541701 m!519651))

(declare-fun m!519653 () Bool)

(assert (=> b!541698 m!519653))

(declare-fun m!519655 () Bool)

(assert (=> b!541702 m!519655))

(assert (=> b!541691 m!519631))

(assert (=> b!541691 m!519631))

(declare-fun m!519657 () Bool)

(assert (=> b!541691 m!519657))

(declare-fun m!519659 () Bool)

(assert (=> b!541700 m!519659))

(push 1)

(assert (not b!541700))

(assert (not b!541691))

(assert (not b!541697))

(assert (not b!541698))

(assert (not b!541699))

(assert (not start!49198))

(assert (not b!541701))

(assert (not b!541693))

(assert (not b!541702))

(assert (not b!541696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!541823 () Bool)

(declare-fun e!313622 () SeekEntryResult!4923)

(declare-fun lt!247587 () SeekEntryResult!4923)

(assert (=> b!541823 (= e!313622 (MissingZero!4923 (index!21918 lt!247587)))))

(declare-fun b!541824 () Bool)

(declare-fun e!313624 () SeekEntryResult!4923)

(assert (=> b!541824 (= e!313624 Undefined!4923)))

(declare-fun b!541825 () Bool)

(declare-fun e!313623 () SeekEntryResult!4923)

(assert (=> b!541825 (= e!313623 (Found!4923 (index!21918 lt!247587)))))

(declare-fun b!541826 () Bool)

(declare-fun c!62924 () Bool)

(declare-fun lt!247585 () (_ BitVec 64))

(assert (=> b!541826 (= c!62924 (= lt!247585 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541826 (= e!313623 e!313622)))

(declare-fun b!541827 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34267 (_ BitVec 32)) SeekEntryResult!4923)

(assert (=> b!541827 (= e!313622 (seekKeyOrZeroReturnVacant!0 (x!50831 lt!247587) (index!21918 lt!247587) (index!21918 lt!247587) k!1998 a!3154 mask!3216))))

(declare-fun b!541828 () Bool)

(assert (=> b!541828 (= e!313624 e!313623)))

(assert (=> b!541828 (= lt!247585 (select (arr!16468 a!3154) (index!21918 lt!247587)))))

(declare-fun c!62923 () Bool)

(assert (=> b!541828 (= c!62923 (= lt!247585 k!1998))))

(declare-fun d!81635 () Bool)

(declare-fun lt!247586 () SeekEntryResult!4923)

(assert (=> d!81635 (and (or (is-Undefined!4923 lt!247586) (not (is-Found!4923 lt!247586)) (and (bvsge (index!21917 lt!247586) #b00000000000000000000000000000000) (bvslt (index!21917 lt!247586) (size!16833 a!3154)))) (or (is-Undefined!4923 lt!247586) (is-Found!4923 lt!247586) (not (is-MissingZero!4923 lt!247586)) (and (bvsge (index!21916 lt!247586) #b00000000000000000000000000000000) (bvslt (index!21916 lt!247586) (size!16833 a!3154)))) (or (is-Undefined!4923 lt!247586) (is-Found!4923 lt!247586) (is-MissingZero!4923 lt!247586) (not (is-MissingVacant!4923 lt!247586)) (and (bvsge (index!21919 lt!247586) #b00000000000000000000000000000000) (bvslt (index!21919 lt!247586) (size!16833 a!3154)))) (or (is-Undefined!4923 lt!247586) (ite (is-Found!4923 lt!247586) (= (select (arr!16468 a!3154) (index!21917 lt!247586)) k!1998) (ite (is-MissingZero!4923 lt!247586) (= (select (arr!16468 a!3154) (index!21916 lt!247586)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4923 lt!247586) (= (select (arr!16468 a!3154) (index!21919 lt!247586)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81635 (= lt!247586 e!313624)))

(declare-fun c!62925 () Bool)

(assert (=> d!81635 (= c!62925 (and (is-Intermediate!4923 lt!247587) (undefined!5735 lt!247587)))))

(assert (=> d!81635 (= lt!247587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81635 (validMask!0 mask!3216)))

(assert (=> d!81635 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!247586)))

(assert (= (and d!81635 c!62925) b!541824))

(assert (= (and d!81635 (not c!62925)) b!541828))

(assert (= (and b!541828 c!62923) b!541825))

(assert (= (and b!541828 (not c!62923)) b!541826))

(assert (= (and b!541826 c!62924) b!541823))

(assert (= (and b!541826 (not c!62924)) b!541827))

(declare-fun m!519713 () Bool)

(assert (=> b!541827 m!519713))

(declare-fun m!519715 () Bool)

(assert (=> b!541828 m!519715))

(assert (=> d!81635 m!519627))

(declare-fun m!519717 () Bool)

(assert (=> d!81635 m!519717))

(declare-fun m!519719 () Bool)

(assert (=> d!81635 m!519719))

(assert (=> d!81635 m!519717))

(declare-fun m!519721 () Bool)

(assert (=> d!81635 m!519721))

(declare-fun m!519723 () Bool)

(assert (=> d!81635 m!519723))

(declare-fun m!519725 () Bool)

(assert (=> d!81635 m!519725))

(assert (=> b!541702 d!81635))

(declare-fun d!81643 () Bool)

(assert (=> d!81643 (= (validKeyInArray!0 (select (arr!16468 a!3154) j!147)) (and (not (= (select (arr!16468 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16468 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541697 d!81643))

(declare-fun bm!32032 () Bool)

(declare-fun call!32035 () Bool)

(assert (=> bm!32032 (= call!32035 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!541852 () Bool)

(declare-fun e!313641 () Bool)

(assert (=> b!541852 (= e!313641 call!32035)))

(declare-fun b!541853 () Bool)

(declare-fun e!313642 () Bool)

(assert (=> b!541853 (= e!313642 e!313641)))

(declare-fun lt!247600 () (_ BitVec 64))

(assert (=> b!541853 (= lt!247600 (select (arr!16468 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16884 0))(
  ( (Unit!16885) )
))
(declare-fun lt!247599 () Unit!16884)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34267 (_ BitVec 64) (_ BitVec 32)) Unit!16884)

(assert (=> b!541853 (= lt!247599 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247600 #b00000000000000000000000000000000))))

(assert (=> b!541853 (arrayContainsKey!0 a!3154 lt!247600 #b00000000000000000000000000000000)))

(declare-fun lt!247598 () Unit!16884)

(assert (=> b!541853 (= lt!247598 lt!247599)))

(declare-fun res!336624 () Bool)

(assert (=> b!541853 (= res!336624 (= (seekEntryOrOpen!0 (select (arr!16468 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4923 #b00000000000000000000000000000000)))))

(assert (=> b!541853 (=> (not res!336624) (not e!313641))))

(declare-fun d!81645 () Bool)

(declare-fun res!336625 () Bool)

(declare-fun e!313640 () Bool)

(assert (=> d!81645 (=> res!336625 e!313640)))

(assert (=> d!81645 (= res!336625 (bvsge #b00000000000000000000000000000000 (size!16833 a!3154)))))

(assert (=> d!81645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313640)))

(declare-fun b!541854 () Bool)

(assert (=> b!541854 (= e!313642 call!32035)))

(declare-fun b!541855 () Bool)

(assert (=> b!541855 (= e!313640 e!313642)))

(declare-fun c!62931 () Bool)

(assert (=> b!541855 (= c!62931 (validKeyInArray!0 (select (arr!16468 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81645 (not res!336625)) b!541855))

(assert (= (and b!541855 c!62931) b!541853))

(assert (= (and b!541855 (not c!62931)) b!541854))

(assert (= (and b!541853 res!336624) b!541852))

(assert (= (or b!541852 b!541854) bm!32032))

(declare-fun m!519735 () Bool)

(assert (=> bm!32032 m!519735))

(declare-fun m!519737 () Bool)

(assert (=> b!541853 m!519737))

(declare-fun m!519739 () Bool)

(assert (=> b!541853 m!519739))

(declare-fun m!519741 () Bool)

(assert (=> b!541853 m!519741))

(assert (=> b!541853 m!519737))

(declare-fun m!519743 () Bool)

(assert (=> b!541853 m!519743))

(assert (=> b!541855 m!519737))

(assert (=> b!541855 m!519737))

(declare-fun m!519745 () Bool)

(assert (=> b!541855 m!519745))

(assert (=> b!541699 d!81645))

(declare-fun d!81649 () Bool)

(declare-fun res!336630 () Bool)

(declare-fun e!313647 () Bool)

(assert (=> d!81649 (=> res!336630 e!313647)))

(assert (=> d!81649 (= res!336630 (= (select (arr!16468 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81649 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!313647)))

(declare-fun b!541860 () Bool)

(declare-fun e!313648 () Bool)

(assert (=> b!541860 (= e!313647 e!313648)))

(declare-fun res!336631 () Bool)

(assert (=> b!541860 (=> (not res!336631) (not e!313648))))

(assert (=> b!541860 (= res!336631 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16833 a!3154)))))

(declare-fun b!541861 () Bool)

(assert (=> b!541861 (= e!313648 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81649 (not res!336630)) b!541860))

(assert (= (and b!541860 res!336631) b!541861))

(assert (=> d!81649 m!519737))

(declare-fun m!519747 () Bool)

(assert (=> b!541861 m!519747))

(assert (=> b!541698 d!81649))

(declare-fun lt!247613 () SeekEntryResult!4923)

(declare-fun b!541904 () Bool)

(assert (=> b!541904 (and (bvsge (index!21918 lt!247613) #b00000000000000000000000000000000) (bvslt (index!21918 lt!247613) (size!16833 (array!34268 (store (arr!16468 a!3154) i!1153 k!1998) (size!16833 a!3154)))))))

(declare-fun res!336652 () Bool)

(assert (=> b!541904 (= res!336652 (= (select (arr!16468 (array!34268 (store (arr!16468 a!3154) i!1153 k!1998) (size!16833 a!3154))) (index!21918 lt!247613)) (select (store (arr!16468 a!3154) i!1153 k!1998) j!147)))))

(declare-fun e!313677 () Bool)

(assert (=> b!541904 (=> res!336652 e!313677)))

(declare-fun e!313676 () Bool)

(assert (=> b!541904 (= e!313676 e!313677)))

(declare-fun b!541905 () Bool)

(assert (=> b!541905 (and (bvsge (index!21918 lt!247613) #b00000000000000000000000000000000) (bvslt (index!21918 lt!247613) (size!16833 (array!34268 (store (arr!16468 a!3154) i!1153 k!1998) (size!16833 a!3154)))))))

(assert (=> b!541905 (= e!313677 (= (select (arr!16468 (array!34268 (store (arr!16468 a!3154) i!1153 k!1998) (size!16833 a!3154))) (index!21918 lt!247613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541906 () Bool)

(declare-fun e!313678 () Bool)

(assert (=> b!541906 (= e!313678 (bvsge (x!50831 lt!247613) #b01111111111111111111111111111110))))

(declare-fun b!541907 () Bool)

(declare-fun e!313675 () SeekEntryResult!4923)

(assert (=> b!541907 (= e!313675 (Intermediate!4923 false index!1177 x!1030))))

(declare-fun b!541908 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541908 (= e!313675 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (store (arr!16468 a!3154) i!1153 k!1998) j!147) (array!34268 (store (arr!16468 a!3154) i!1153 k!1998) (size!16833 a!3154)) mask!3216))))

(declare-fun b!541910 () Bool)

(assert (=> b!541910 (= e!313678 e!313676)))

(declare-fun res!336650 () Bool)

(assert (=> b!541910 (= res!336650 (and (is-Intermediate!4923 lt!247613) (not (undefined!5735 lt!247613)) (bvslt (x!50831 lt!247613) #b01111111111111111111111111111110) (bvsge (x!50831 lt!247613) #b00000000000000000000000000000000) (bvsge (x!50831 lt!247613) x!1030)))))

(assert (=> b!541910 (=> (not res!336650) (not e!313676))))

(declare-fun b!541911 () Bool)

(declare-fun e!313679 () SeekEntryResult!4923)

(assert (=> b!541911 (= e!313679 e!313675)))

(declare-fun lt!247614 () (_ BitVec 64))

(declare-fun c!62944 () Bool)

(assert (=> b!541911 (= c!62944 (or (= lt!247614 (select (store (arr!16468 a!3154) i!1153 k!1998) j!147)) (= (bvadd lt!247614 lt!247614) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541912 () Bool)

(assert (=> b!541912 (= e!313679 (Intermediate!4923 true index!1177 x!1030))))

(declare-fun d!81655 () Bool)

(assert (=> d!81655 e!313678))

(declare-fun c!62946 () Bool)

(assert (=> d!81655 (= c!62946 (and (is-Intermediate!4923 lt!247613) (undefined!5735 lt!247613)))))

(assert (=> d!81655 (= lt!247613 e!313679)))

(declare-fun c!62945 () Bool)

(assert (=> d!81655 (= c!62945 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81655 (= lt!247614 (select (arr!16468 (array!34268 (store (arr!16468 a!3154) i!1153 k!1998) (size!16833 a!3154))) index!1177))))

(assert (=> d!81655 (validMask!0 mask!3216)))

(assert (=> d!81655 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (store (arr!16468 a!3154) i!1153 k!1998) j!147) (array!34268 (store (arr!16468 a!3154) i!1153 k!1998) (size!16833 a!3154)) mask!3216) lt!247613)))

(declare-fun b!541909 () Bool)

(assert (=> b!541909 (and (bvsge (index!21918 lt!247613) #b00000000000000000000000000000000) (bvslt (index!21918 lt!247613) (size!16833 (array!34268 (store (arr!16468 a!3154) i!1153 k!1998) (size!16833 a!3154)))))))

(declare-fun res!336651 () Bool)

(assert (=> b!541909 (= res!336651 (= (select (arr!16468 (array!34268 (store (arr!16468 a!3154) i!1153 k!1998) (size!16833 a!3154))) (index!21918 lt!247613)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541909 (=> res!336651 e!313677)))

(assert (= (and d!81655 c!62945) b!541912))

(assert (= (and d!81655 (not c!62945)) b!541911))

(assert (= (and b!541911 c!62944) b!541907))

(assert (= (and b!541911 (not c!62944)) b!541908))

(assert (= (and d!81655 c!62946) b!541906))

(assert (= (and d!81655 (not c!62946)) b!541910))

(assert (= (and b!541910 res!336650) b!541904))

(assert (= (and b!541904 (not res!336652)) b!541909))

(assert (= (and b!541909 (not res!336651)) b!541905))

(declare-fun m!519765 () Bool)

(assert (=> b!541909 m!519765))

(declare-fun m!519767 () Bool)

(assert (=> b!541908 m!519767))

(assert (=> b!541908 m!519767))

(assert (=> b!541908 m!519643))

(declare-fun m!519769 () Bool)

(assert (=> b!541908 m!519769))

(assert (=> b!541904 m!519765))

(assert (=> b!541905 m!519765))

(declare-fun m!519771 () Bool)

(assert (=> d!81655 m!519771))

(assert (=> d!81655 m!519627))

(assert (=> b!541693 d!81655))

(declare-fun d!81669 () Bool)

(declare-fun res!336670 () Bool)

(declare-fun e!313703 () Bool)

(assert (=> d!81669 (=> res!336670 e!313703)))

(assert (=> d!81669 (= res!336670 (bvsge #b00000000000000000000000000000000 (size!16833 a!3154)))))

(assert (=> d!81669 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10623) e!313703)))

(declare-fun b!541938 () Bool)

(declare-fun e!313701 () Bool)

(declare-fun e!313702 () Bool)

(assert (=> b!541938 (= e!313701 e!313702)))

(declare-fun c!62952 () Bool)

(assert (=> b!541938 (= c!62952 (validKeyInArray!0 (select (arr!16468 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32038 () Bool)

(declare-fun call!32041 () Bool)

(assert (=> bm!32038 (= call!32041 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62952 (Cons!10622 (select (arr!16468 a!3154) #b00000000000000000000000000000000) Nil!10623) Nil!10623)))))

(declare-fun b!541939 () Bool)

(declare-fun e!313700 () Bool)

(declare-fun contains!2783 (List!10626 (_ BitVec 64)) Bool)

(assert (=> b!541939 (= e!313700 (contains!2783 Nil!10623 (select (arr!16468 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541940 () Bool)

(assert (=> b!541940 (= e!313703 e!313701)))

(declare-fun res!336668 () Bool)

(assert (=> b!541940 (=> (not res!336668) (not e!313701))))

(assert (=> b!541940 (= res!336668 (not e!313700))))

(declare-fun res!336669 () Bool)

(assert (=> b!541940 (=> (not res!336669) (not e!313700))))

(assert (=> b!541940 (= res!336669 (validKeyInArray!0 (select (arr!16468 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!541941 () Bool)

(assert (=> b!541941 (= e!313702 call!32041)))

(declare-fun b!541942 () Bool)

(assert (=> b!541942 (= e!313702 call!32041)))

(assert (= (and d!81669 (not res!336670)) b!541940))

(assert (= (and b!541940 res!336669) b!541939))

(assert (= (and b!541940 res!336668) b!541938))

(assert (= (and b!541938 c!62952) b!541941))

(assert (= (and b!541938 (not c!62952)) b!541942))

(assert (= (or b!541941 b!541942) bm!32038))

(assert (=> b!541938 m!519737))

(assert (=> b!541938 m!519737))

(assert (=> b!541938 m!519745))

(assert (=> bm!32038 m!519737))

(declare-fun m!519779 () Bool)

(assert (=> bm!32038 m!519779))

(assert (=> b!541939 m!519737))

(assert (=> b!541939 m!519737))

(declare-fun m!519781 () Bool)

(assert (=> b!541939 m!519781))

(assert (=> b!541940 m!519737))

(assert (=> b!541940 m!519737))

(assert (=> b!541940 m!519745))

(assert (=> b!541700 d!81669))

(declare-fun d!81673 () Bool)

(assert (=> d!81673 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49198 d!81673))

(declare-fun d!81675 () Bool)

(assert (=> d!81675 (= (array_inv!12351 a!3154) (bvsge (size!16833 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49198 d!81675))

(declare-fun d!81677 () Bool)

(assert (=> d!81677 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541696 d!81677))

(declare-fun b!541943 () Bool)

(declare-fun lt!247615 () SeekEntryResult!4923)

(assert (=> b!541943 (and (bvsge (index!21918 lt!247615) #b00000000000000000000000000000000) (bvslt (index!21918 lt!247615) (size!16833 a!3154)))))

(declare-fun res!336673 () Bool)

(assert (=> b!541943 (= res!336673 (= (select (arr!16468 a!3154) (index!21918 lt!247615)) (select (arr!16468 a!3154) j!147)))))

(declare-fun e!313706 () Bool)

(assert (=> b!541943 (=> res!336673 e!313706)))

(declare-fun e!313705 () Bool)

(assert (=> b!541943 (= e!313705 e!313706)))

(declare-fun b!541944 () Bool)

(assert (=> b!541944 (and (bvsge (index!21918 lt!247615) #b00000000000000000000000000000000) (bvslt (index!21918 lt!247615) (size!16833 a!3154)))))

(assert (=> b!541944 (= e!313706 (= (select (arr!16468 a!3154) (index!21918 lt!247615)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541945 () Bool)

(declare-fun e!313707 () Bool)

(assert (=> b!541945 (= e!313707 (bvsge (x!50831 lt!247615) #b01111111111111111111111111111110))))

(declare-fun b!541946 () Bool)

(declare-fun e!313704 () SeekEntryResult!4923)

(assert (=> b!541946 (= e!313704 (Intermediate!4923 false index!1177 x!1030))))

(declare-fun b!541947 () Bool)

(assert (=> b!541947 (= e!313704 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16468 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541949 () Bool)

(assert (=> b!541949 (= e!313707 e!313705)))

(declare-fun res!336671 () Bool)

(assert (=> b!541949 (= res!336671 (and (is-Intermediate!4923 lt!247615) (not (undefined!5735 lt!247615)) (bvslt (x!50831 lt!247615) #b01111111111111111111111111111110) (bvsge (x!50831 lt!247615) #b00000000000000000000000000000000) (bvsge (x!50831 lt!247615) x!1030)))))

(assert (=> b!541949 (=> (not res!336671) (not e!313705))))

(declare-fun b!541950 () Bool)

(declare-fun e!313708 () SeekEntryResult!4923)

(assert (=> b!541950 (= e!313708 e!313704)))

(declare-fun c!62953 () Bool)

(declare-fun lt!247616 () (_ BitVec 64))

(assert (=> b!541950 (= c!62953 (or (= lt!247616 (select (arr!16468 a!3154) j!147)) (= (bvadd lt!247616 lt!247616) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541951 () Bool)

(assert (=> b!541951 (= e!313708 (Intermediate!4923 true index!1177 x!1030))))

(declare-fun d!81679 () Bool)

(assert (=> d!81679 e!313707))

(declare-fun c!62955 () Bool)

(assert (=> d!81679 (= c!62955 (and (is-Intermediate!4923 lt!247615) (undefined!5735 lt!247615)))))

(assert (=> d!81679 (= lt!247615 e!313708)))

(declare-fun c!62954 () Bool)

(assert (=> d!81679 (= c!62954 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81679 (= lt!247616 (select (arr!16468 a!3154) index!1177))))

(assert (=> d!81679 (validMask!0 mask!3216)))

(assert (=> d!81679 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16468 a!3154) j!147) a!3154 mask!3216) lt!247615)))

(declare-fun b!541948 () Bool)

(assert (=> b!541948 (and (bvsge (index!21918 lt!247615) #b00000000000000000000000000000000) (bvslt (index!21918 lt!247615) (size!16833 a!3154)))))

(declare-fun res!336672 () Bool)

(assert (=> b!541948 (= res!336672 (= (select (arr!16468 a!3154) (index!21918 lt!247615)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541948 (=> res!336672 e!313706)))

(assert (= (and d!81679 c!62954) b!541951))

(assert (= (and d!81679 (not c!62954)) b!541950))

(assert (= (and b!541950 c!62953) b!541946))

(assert (= (and b!541950 (not c!62953)) b!541947))

(assert (= (and d!81679 c!62955) b!541945))

(assert (= (and d!81679 (not c!62955)) b!541949))

(assert (= (and b!541949 res!336671) b!541943))

(assert (= (and b!541943 (not res!336673)) b!541948))

(assert (= (and b!541948 (not res!336672)) b!541944))

(declare-fun m!519783 () Bool)

(assert (=> b!541948 m!519783))

(assert (=> b!541947 m!519767))

(assert (=> b!541947 m!519767))

(assert (=> b!541947 m!519631))

(declare-fun m!519785 () Bool)

(assert (=> b!541947 m!519785))

(assert (=> b!541943 m!519783))

(assert (=> b!541944 m!519783))

(assert (=> d!81679 m!519635))

(assert (=> d!81679 m!519627))

(assert (=> b!541691 d!81679))

(declare-fun b!541952 () Bool)

(declare-fun lt!247617 () SeekEntryResult!4923)

(assert (=> b!541952 (and (bvsge (index!21918 lt!247617) #b00000000000000000000000000000000) (bvslt (index!21918 lt!247617) (size!16833 a!3154)))))

(declare-fun res!336676 () Bool)

(assert (=> b!541952 (= res!336676 (= (select (arr!16468 a!3154) (index!21918 lt!247617)) (select (arr!16468 a!3154) j!147)))))

(declare-fun e!313711 () Bool)

(assert (=> b!541952 (=> res!336676 e!313711)))

(declare-fun e!313710 () Bool)

(assert (=> b!541952 (= e!313710 e!313711)))

(declare-fun b!541953 () Bool)

(assert (=> b!541953 (and (bvsge (index!21918 lt!247617) #b00000000000000000000000000000000) (bvslt (index!21918 lt!247617) (size!16833 a!3154)))))

(assert (=> b!541953 (= e!313711 (= (select (arr!16468 a!3154) (index!21918 lt!247617)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!541954 () Bool)

(declare-fun e!313712 () Bool)

(assert (=> b!541954 (= e!313712 (bvsge (x!50831 lt!247617) #b01111111111111111111111111111110))))

(declare-fun e!313709 () SeekEntryResult!4923)

(declare-fun b!541955 () Bool)

(assert (=> b!541955 (= e!313709 (Intermediate!4923 false (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!541956 () Bool)

(assert (=> b!541956 (= e!313709 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16468 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541958 () Bool)

(assert (=> b!541958 (= e!313712 e!313710)))

(declare-fun res!336674 () Bool)

(assert (=> b!541958 (= res!336674 (and (is-Intermediate!4923 lt!247617) (not (undefined!5735 lt!247617)) (bvslt (x!50831 lt!247617) #b01111111111111111111111111111110) (bvsge (x!50831 lt!247617) #b00000000000000000000000000000000) (bvsge (x!50831 lt!247617) #b00000000000000000000000000000000)))))

(assert (=> b!541958 (=> (not res!336674) (not e!313710))))

(declare-fun b!541959 () Bool)

(declare-fun e!313713 () SeekEntryResult!4923)

(assert (=> b!541959 (= e!313713 e!313709)))

(declare-fun c!62956 () Bool)

(declare-fun lt!247618 () (_ BitVec 64))

(assert (=> b!541959 (= c!62956 (or (= lt!247618 (select (arr!16468 a!3154) j!147)) (= (bvadd lt!247618 lt!247618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!541960 () Bool)

(assert (=> b!541960 (= e!313713 (Intermediate!4923 true (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun d!81681 () Bool)

(assert (=> d!81681 e!313712))

(declare-fun c!62958 () Bool)

(assert (=> d!81681 (= c!62958 (and (is-Intermediate!4923 lt!247617) (undefined!5735 lt!247617)))))

(assert (=> d!81681 (= lt!247617 e!313713)))

(declare-fun c!62957 () Bool)

(assert (=> d!81681 (= c!62957 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81681 (= lt!247618 (select (arr!16468 a!3154) (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216)))))

(assert (=> d!81681 (validMask!0 mask!3216)))

(assert (=> d!81681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) (select (arr!16468 a!3154) j!147) a!3154 mask!3216) lt!247617)))

(declare-fun b!541957 () Bool)

(assert (=> b!541957 (and (bvsge (index!21918 lt!247617) #b00000000000000000000000000000000) (bvslt (index!21918 lt!247617) (size!16833 a!3154)))))

(declare-fun res!336675 () Bool)

(assert (=> b!541957 (= res!336675 (= (select (arr!16468 a!3154) (index!21918 lt!247617)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!541957 (=> res!336675 e!313711)))

(assert (= (and d!81681 c!62957) b!541960))

(assert (= (and d!81681 (not c!62957)) b!541959))

(assert (= (and b!541959 c!62956) b!541955))

(assert (= (and b!541959 (not c!62956)) b!541956))

(assert (= (and d!81681 c!62958) b!541954))

(assert (= (and d!81681 (not c!62958)) b!541958))

(assert (= (and b!541958 res!336674) b!541952))

(assert (= (and b!541952 (not res!336676)) b!541957))

(assert (= (and b!541957 (not res!336675)) b!541953))

(declare-fun m!519787 () Bool)

(assert (=> b!541957 m!519787))

(assert (=> b!541956 m!519649))

(declare-fun m!519789 () Bool)

(assert (=> b!541956 m!519789))

(assert (=> b!541956 m!519789))

(assert (=> b!541956 m!519631))

(declare-fun m!519791 () Bool)

(assert (=> b!541956 m!519791))

(assert (=> b!541952 m!519787))

(assert (=> b!541953 m!519787))

(assert (=> d!81681 m!519649))

(declare-fun m!519793 () Bool)

(assert (=> d!81681 m!519793))

(assert (=> d!81681 m!519627))

(assert (=> b!541701 d!81681))

(declare-fun d!81683 () Bool)

(declare-fun lt!247630 () (_ BitVec 32))

(declare-fun lt!247629 () (_ BitVec 32))

(assert (=> d!81683 (= lt!247630 (bvmul (bvxor lt!247629 (bvlshr lt!247629 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81683 (= lt!247629 ((_ extract 31 0) (bvand (bvxor (select (arr!16468 a!3154) j!147) (bvlshr (select (arr!16468 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81683 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!336677 (let ((h!11577 ((_ extract 31 0) (bvand (bvxor (select (arr!16468 a!3154) j!147) (bvlshr (select (arr!16468 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50837 (bvmul (bvxor h!11577 (bvlshr h!11577 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50837 (bvlshr x!50837 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!336677 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!336677 #b00000000000000000000000000000000))))))

(assert (=> d!81683 (= (toIndex!0 (select (arr!16468 a!3154) j!147) mask!3216) (bvand (bvxor lt!247630 (bvlshr lt!247630 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!541701 d!81683))

(push 1)

(assert (not bm!32032))

(assert (not b!541947))

(assert (not d!81679))

(assert (not b!541939))

(assert (not b!541940))

(assert (not b!541938))

(assert (not b!541861))

(assert (not b!541908))

(assert (not bm!32038))

(assert (not b!541956))

(assert (not d!81635))

(assert (not b!541855))

(assert (not d!81655))

(assert (not b!541853))

(assert (not b!541827))

(assert (not d!81681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

