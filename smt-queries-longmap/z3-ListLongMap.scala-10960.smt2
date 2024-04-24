; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128624 () Bool)

(assert start!128624)

(declare-fun res!1026778 () Bool)

(declare-fun e!842698 () Bool)

(assert (=> start!128624 (=> (not res!1026778) (not e!842698))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128624 (= res!1026778 (validMask!0 mask!2512))))

(assert (=> start!128624 e!842698))

(assert (=> start!128624 true))

(declare-datatypes ((array!100543 0))(
  ( (array!100544 (arr!48514 (Array (_ BitVec 32) (_ BitVec 64))) (size!49065 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100543)

(declare-fun array_inv!37795 (array!100543) Bool)

(assert (=> start!128624 (array_inv!37795 a!2804)))

(declare-fun b!1507542 () Bool)

(declare-fun e!842700 () Bool)

(assert (=> b!1507542 (= e!842698 e!842700)))

(declare-fun res!1026776 () Bool)

(assert (=> b!1507542 (=> res!1026776 e!842700)))

(declare-datatypes ((List!34984 0))(
  ( (Nil!34981) (Cons!34980 (h!36392 (_ BitVec 64)) (t!49670 List!34984)) )
))
(declare-fun contains!10002 (List!34984 (_ BitVec 64)) Bool)

(assert (=> b!1507542 (= res!1026776 (contains!10002 Nil!34981 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507543 () Bool)

(declare-fun res!1026781 () Bool)

(assert (=> b!1507543 (=> (not res!1026781) (not e!842698))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507543 (= res!1026781 (validKeyInArray!0 (select (arr!48514 a!2804) i!961)))))

(declare-fun b!1507544 () Bool)

(declare-fun res!1026782 () Bool)

(assert (=> b!1507544 (=> (not res!1026782) (not e!842698))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1507544 (= res!1026782 (validKeyInArray!0 (select (arr!48514 a!2804) j!70)))))

(declare-fun b!1507545 () Bool)

(declare-fun res!1026779 () Bool)

(assert (=> b!1507545 (=> (not res!1026779) (not e!842698))))

(assert (=> b!1507545 (= res!1026779 (and (bvsle #b00000000000000000000000000000000 (size!49065 a!2804)) (bvslt (size!49065 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1507546 () Bool)

(declare-fun res!1026777 () Bool)

(assert (=> b!1507546 (=> (not res!1026777) (not e!842698))))

(assert (=> b!1507546 (= res!1026777 (and (= (size!49065 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49065 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49065 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507547 () Bool)

(declare-fun res!1026780 () Bool)

(assert (=> b!1507547 (=> (not res!1026780) (not e!842698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100543 (_ BitVec 32)) Bool)

(assert (=> b!1507547 (= res!1026780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507548 () Bool)

(assert (=> b!1507548 (= e!842700 (contains!10002 Nil!34981 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507549 () Bool)

(declare-fun res!1026775 () Bool)

(assert (=> b!1507549 (=> (not res!1026775) (not e!842698))))

(declare-fun noDuplicate!2644 (List!34984) Bool)

(assert (=> b!1507549 (= res!1026775 (noDuplicate!2644 Nil!34981))))

(assert (= (and start!128624 res!1026778) b!1507546))

(assert (= (and b!1507546 res!1026777) b!1507543))

(assert (= (and b!1507543 res!1026781) b!1507544))

(assert (= (and b!1507544 res!1026782) b!1507547))

(assert (= (and b!1507547 res!1026780) b!1507545))

(assert (= (and b!1507545 res!1026779) b!1507549))

(assert (= (and b!1507549 res!1026775) b!1507542))

(assert (= (and b!1507542 (not res!1026776)) b!1507548))

(declare-fun m!1390581 () Bool)

(assert (=> b!1507542 m!1390581))

(declare-fun m!1390583 () Bool)

(assert (=> b!1507549 m!1390583))

(declare-fun m!1390585 () Bool)

(assert (=> b!1507547 m!1390585))

(declare-fun m!1390587 () Bool)

(assert (=> b!1507544 m!1390587))

(assert (=> b!1507544 m!1390587))

(declare-fun m!1390589 () Bool)

(assert (=> b!1507544 m!1390589))

(declare-fun m!1390591 () Bool)

(assert (=> b!1507548 m!1390591))

(declare-fun m!1390593 () Bool)

(assert (=> b!1507543 m!1390593))

(assert (=> b!1507543 m!1390593))

(declare-fun m!1390595 () Bool)

(assert (=> b!1507543 m!1390595))

(declare-fun m!1390597 () Bool)

(assert (=> start!128624 m!1390597))

(declare-fun m!1390599 () Bool)

(assert (=> start!128624 m!1390599))

(check-sat (not b!1507542) (not b!1507548) (not b!1507543) (not b!1507547) (not b!1507549) (not b!1507544) (not start!128624))
(check-sat)
(get-model)

(declare-fun d!158615 () Bool)

(declare-fun res!1026835 () Bool)

(declare-fun e!842723 () Bool)

(assert (=> d!158615 (=> res!1026835 e!842723)))

(get-info :version)

(assert (=> d!158615 (= res!1026835 ((_ is Nil!34981) Nil!34981))))

(assert (=> d!158615 (= (noDuplicate!2644 Nil!34981) e!842723)))

(declare-fun b!1507602 () Bool)

(declare-fun e!842724 () Bool)

(assert (=> b!1507602 (= e!842723 e!842724)))

(declare-fun res!1026836 () Bool)

(assert (=> b!1507602 (=> (not res!1026836) (not e!842724))))

(assert (=> b!1507602 (= res!1026836 (not (contains!10002 (t!49670 Nil!34981) (h!36392 Nil!34981))))))

(declare-fun b!1507603 () Bool)

(assert (=> b!1507603 (= e!842724 (noDuplicate!2644 (t!49670 Nil!34981)))))

(assert (= (and d!158615 (not res!1026835)) b!1507602))

(assert (= (and b!1507602 res!1026836) b!1507603))

(declare-fun m!1390641 () Bool)

(assert (=> b!1507602 m!1390641))

(declare-fun m!1390643 () Bool)

(assert (=> b!1507603 m!1390643))

(assert (=> b!1507549 d!158615))

(declare-fun d!158617 () Bool)

(assert (=> d!158617 (= (validKeyInArray!0 (select (arr!48514 a!2804) j!70)) (and (not (= (select (arr!48514 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48514 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507544 d!158617))

(declare-fun d!158619 () Bool)

(declare-fun lt!654742 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!773 (List!34984) (InoxSet (_ BitVec 64)))

(assert (=> d!158619 (= lt!654742 (select (content!773 Nil!34981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842730 () Bool)

(assert (=> d!158619 (= lt!654742 e!842730)))

(declare-fun res!1026842 () Bool)

(assert (=> d!158619 (=> (not res!1026842) (not e!842730))))

(assert (=> d!158619 (= res!1026842 ((_ is Cons!34980) Nil!34981))))

(assert (=> d!158619 (= (contains!10002 Nil!34981 #b0000000000000000000000000000000000000000000000000000000000000000) lt!654742)))

(declare-fun b!1507608 () Bool)

(declare-fun e!842729 () Bool)

(assert (=> b!1507608 (= e!842730 e!842729)))

(declare-fun res!1026841 () Bool)

(assert (=> b!1507608 (=> res!1026841 e!842729)))

(assert (=> b!1507608 (= res!1026841 (= (h!36392 Nil!34981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507609 () Bool)

(assert (=> b!1507609 (= e!842729 (contains!10002 (t!49670 Nil!34981) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!158619 res!1026842) b!1507608))

(assert (= (and b!1507608 (not res!1026841)) b!1507609))

(declare-fun m!1390645 () Bool)

(assert (=> d!158619 m!1390645))

(declare-fun m!1390647 () Bool)

(assert (=> d!158619 m!1390647))

(declare-fun m!1390649 () Bool)

(assert (=> b!1507609 m!1390649))

(assert (=> b!1507542 d!158619))

(declare-fun d!158621 () Bool)

(assert (=> d!158621 (= (validKeyInArray!0 (select (arr!48514 a!2804) i!961)) (and (not (= (select (arr!48514 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48514 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507543 d!158621))

(declare-fun d!158623 () Bool)

(declare-fun lt!654743 () Bool)

(assert (=> d!158623 (= lt!654743 (select (content!773 Nil!34981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!842732 () Bool)

(assert (=> d!158623 (= lt!654743 e!842732)))

(declare-fun res!1026844 () Bool)

(assert (=> d!158623 (=> (not res!1026844) (not e!842732))))

(assert (=> d!158623 (= res!1026844 ((_ is Cons!34980) Nil!34981))))

(assert (=> d!158623 (= (contains!10002 Nil!34981 #b1000000000000000000000000000000000000000000000000000000000000000) lt!654743)))

(declare-fun b!1507610 () Bool)

(declare-fun e!842731 () Bool)

(assert (=> b!1507610 (= e!842732 e!842731)))

(declare-fun res!1026843 () Bool)

(assert (=> b!1507610 (=> res!1026843 e!842731)))

(assert (=> b!1507610 (= res!1026843 (= (h!36392 Nil!34981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1507611 () Bool)

(assert (=> b!1507611 (= e!842731 (contains!10002 (t!49670 Nil!34981) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!158623 res!1026844) b!1507610))

(assert (= (and b!1507610 (not res!1026843)) b!1507611))

(assert (=> d!158623 m!1390645))

(declare-fun m!1390651 () Bool)

(assert (=> d!158623 m!1390651))

(declare-fun m!1390653 () Bool)

(assert (=> b!1507611 m!1390653))

(assert (=> b!1507548 d!158623))

(declare-fun b!1507632 () Bool)

(declare-fun e!842752 () Bool)

(declare-fun e!842751 () Bool)

(assert (=> b!1507632 (= e!842752 e!842751)))

(declare-fun c!139930 () Bool)

(assert (=> b!1507632 (= c!139930 (validKeyInArray!0 (select (arr!48514 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68298 () Bool)

(declare-fun call!68301 () Bool)

(assert (=> bm!68298 (= call!68301 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1507634 () Bool)

(declare-fun e!842753 () Bool)

(assert (=> b!1507634 (= e!842751 e!842753)))

(declare-fun lt!654755 () (_ BitVec 64))

(assert (=> b!1507634 (= lt!654755 (select (arr!48514 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50237 0))(
  ( (Unit!50238) )
))
(declare-fun lt!654753 () Unit!50237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100543 (_ BitVec 64) (_ BitVec 32)) Unit!50237)

(assert (=> b!1507634 (= lt!654753 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654755 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507634 (arrayContainsKey!0 a!2804 lt!654755 #b00000000000000000000000000000000)))

(declare-fun lt!654754 () Unit!50237)

(assert (=> b!1507634 (= lt!654754 lt!654753)))

(declare-fun res!1026861 () Bool)

(declare-datatypes ((SeekEntryResult!12598 0))(
  ( (MissingZero!12598 (index!52787 (_ BitVec 32))) (Found!12598 (index!52788 (_ BitVec 32))) (Intermediate!12598 (undefined!13410 Bool) (index!52789 (_ BitVec 32)) (x!134694 (_ BitVec 32))) (Undefined!12598) (MissingVacant!12598 (index!52790 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100543 (_ BitVec 32)) SeekEntryResult!12598)

(assert (=> b!1507634 (= res!1026861 (= (seekEntryOrOpen!0 (select (arr!48514 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12598 #b00000000000000000000000000000000)))))

(assert (=> b!1507634 (=> (not res!1026861) (not e!842753))))

(declare-fun b!1507635 () Bool)

(assert (=> b!1507635 (= e!842753 call!68301)))

(declare-fun d!158625 () Bool)

(declare-fun res!1026862 () Bool)

(assert (=> d!158625 (=> res!1026862 e!842752)))

(assert (=> d!158625 (= res!1026862 (bvsge #b00000000000000000000000000000000 (size!49065 a!2804)))))

(assert (=> d!158625 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842752)))

(declare-fun b!1507633 () Bool)

(assert (=> b!1507633 (= e!842751 call!68301)))

(assert (= (and d!158625 (not res!1026862)) b!1507632))

(assert (= (and b!1507632 c!139930) b!1507634))

(assert (= (and b!1507632 (not c!139930)) b!1507633))

(assert (= (and b!1507634 res!1026861) b!1507635))

(assert (= (or b!1507635 b!1507633) bm!68298))

(declare-fun m!1390665 () Bool)

(assert (=> b!1507632 m!1390665))

(assert (=> b!1507632 m!1390665))

(declare-fun m!1390667 () Bool)

(assert (=> b!1507632 m!1390667))

(declare-fun m!1390669 () Bool)

(assert (=> bm!68298 m!1390669))

(assert (=> b!1507634 m!1390665))

(declare-fun m!1390671 () Bool)

(assert (=> b!1507634 m!1390671))

(declare-fun m!1390673 () Bool)

(assert (=> b!1507634 m!1390673))

(assert (=> b!1507634 m!1390665))

(declare-fun m!1390675 () Bool)

(assert (=> b!1507634 m!1390675))

(assert (=> b!1507547 d!158625))

(declare-fun d!158637 () Bool)

(assert (=> d!158637 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128624 d!158637))

(declare-fun d!158649 () Bool)

(assert (=> d!158649 (= (array_inv!37795 a!2804) (bvsge (size!49065 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128624 d!158649))

(check-sat (not b!1507609) (not b!1507602) (not b!1507632) (not b!1507634) (not b!1507603) (not d!158619) (not d!158623) (not bm!68298) (not b!1507611))
(check-sat)
