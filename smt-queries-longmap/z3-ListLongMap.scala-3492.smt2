; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48408 () Bool)

(assert start!48408)

(declare-fun b!531814 () Bool)

(declare-fun res!327454 () Bool)

(declare-fun e!309658 () Bool)

(assert (=> b!531814 (=> (not res!327454) (not e!309658))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531814 (= res!327454 (validKeyInArray!0 k0!1998))))

(declare-fun b!531815 () Bool)

(declare-fun res!327447 () Bool)

(declare-fun e!309660 () Bool)

(assert (=> b!531815 (=> (not res!327447) (not e!309660))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33726 0))(
  ( (array!33727 (arr!16205 (Array (_ BitVec 32) (_ BitVec 64))) (size!16570 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33726)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!531815 (= res!327447 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16570 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16570 a!3154)) (= (select (arr!16205 a!3154) resIndex!32) (select (arr!16205 a!3154) j!147))))))

(declare-fun b!531816 () Bool)

(assert (=> b!531816 (= e!309658 e!309660)))

(declare-fun res!327450 () Bool)

(assert (=> b!531816 (=> (not res!327450) (not e!309660))))

(declare-datatypes ((SeekEntryResult!4660 0))(
  ( (MissingZero!4660 (index!20864 (_ BitVec 32))) (Found!4660 (index!20865 (_ BitVec 32))) (Intermediate!4660 (undefined!5472 Bool) (index!20866 (_ BitVec 32)) (x!49845 (_ BitVec 32))) (Undefined!4660) (MissingVacant!4660 (index!20867 (_ BitVec 32))) )
))
(declare-fun lt!244888 () SeekEntryResult!4660)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531816 (= res!327450 (or (= lt!244888 (MissingZero!4660 i!1153)) (= lt!244888 (MissingVacant!4660 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33726 (_ BitVec 32)) SeekEntryResult!4660)

(assert (=> b!531816 (= lt!244888 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531817 () Bool)

(declare-fun res!327455 () Bool)

(assert (=> b!531817 (=> (not res!327455) (not e!309660))))

(declare-datatypes ((List!10363 0))(
  ( (Nil!10360) (Cons!10359 (h!11299 (_ BitVec 64)) (t!16582 List!10363)) )
))
(declare-fun arrayNoDuplicates!0 (array!33726 (_ BitVec 32) List!10363) Bool)

(assert (=> b!531817 (= res!327455 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10360))))

(declare-fun res!327446 () Bool)

(assert (=> start!48408 (=> (not res!327446) (not e!309658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48408 (= res!327446 (validMask!0 mask!3216))))

(assert (=> start!48408 e!309658))

(assert (=> start!48408 true))

(declare-fun array_inv!12088 (array!33726) Bool)

(assert (=> start!48408 (array_inv!12088 a!3154)))

(declare-fun b!531818 () Bool)

(declare-fun res!327449 () Bool)

(assert (=> b!531818 (=> (not res!327449) (not e!309660))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33726 (_ BitVec 32)) SeekEntryResult!4660)

(assert (=> b!531818 (= res!327449 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16205 a!3154) j!147) a!3154 mask!3216) (Intermediate!4660 false resIndex!32 resX!32)))))

(declare-fun b!531819 () Bool)

(assert (=> b!531819 (= e!309660 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvsgt mask!3216 #b00111111111111111111111111111111)))))

(declare-fun b!531820 () Bool)

(declare-fun res!327453 () Bool)

(assert (=> b!531820 (=> (not res!327453) (not e!309658))))

(assert (=> b!531820 (= res!327453 (validKeyInArray!0 (select (arr!16205 a!3154) j!147)))))

(declare-fun b!531821 () Bool)

(declare-fun res!327448 () Bool)

(assert (=> b!531821 (=> (not res!327448) (not e!309658))))

(assert (=> b!531821 (= res!327448 (and (= (size!16570 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16570 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16570 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531822 () Bool)

(declare-fun res!327451 () Bool)

(assert (=> b!531822 (=> (not res!327451) (not e!309660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33726 (_ BitVec 32)) Bool)

(assert (=> b!531822 (= res!327451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531823 () Bool)

(declare-fun res!327452 () Bool)

(assert (=> b!531823 (=> (not res!327452) (not e!309658))))

(declare-fun arrayContainsKey!0 (array!33726 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531823 (= res!327452 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48408 res!327446) b!531821))

(assert (= (and b!531821 res!327448) b!531820))

(assert (= (and b!531820 res!327453) b!531814))

(assert (= (and b!531814 res!327454) b!531823))

(assert (= (and b!531823 res!327452) b!531816))

(assert (= (and b!531816 res!327450) b!531822))

(assert (= (and b!531822 res!327451) b!531817))

(assert (= (and b!531817 res!327455) b!531815))

(assert (= (and b!531815 res!327447) b!531818))

(assert (= (and b!531818 res!327449) b!531819))

(declare-fun m!511627 () Bool)

(assert (=> b!531822 m!511627))

(declare-fun m!511629 () Bool)

(assert (=> b!531816 m!511629))

(declare-fun m!511631 () Bool)

(assert (=> b!531823 m!511631))

(declare-fun m!511633 () Bool)

(assert (=> b!531817 m!511633))

(declare-fun m!511635 () Bool)

(assert (=> b!531818 m!511635))

(assert (=> b!531818 m!511635))

(declare-fun m!511637 () Bool)

(assert (=> b!531818 m!511637))

(declare-fun m!511639 () Bool)

(assert (=> start!48408 m!511639))

(declare-fun m!511641 () Bool)

(assert (=> start!48408 m!511641))

(declare-fun m!511643 () Bool)

(assert (=> b!531815 m!511643))

(assert (=> b!531815 m!511635))

(assert (=> b!531820 m!511635))

(assert (=> b!531820 m!511635))

(declare-fun m!511645 () Bool)

(assert (=> b!531820 m!511645))

(declare-fun m!511647 () Bool)

(assert (=> b!531814 m!511647))

(check-sat (not b!531823) (not b!531818) (not b!531817) (not b!531822) (not b!531820) (not start!48408) (not b!531814) (not b!531816))
(check-sat)
(get-model)

(declare-fun d!81129 () Bool)

(assert (=> d!81129 (= (validKeyInArray!0 (select (arr!16205 a!3154) j!147)) (and (not (= (select (arr!16205 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16205 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531820 d!81129))

(declare-fun d!81131 () Bool)

(assert (=> d!81131 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48408 d!81131))

(declare-fun d!81133 () Bool)

(assert (=> d!81133 (= (array_inv!12088 a!3154) (bvsge (size!16570 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48408 d!81133))

(declare-fun d!81135 () Bool)

(assert (=> d!81135 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531814 d!81135))

(declare-fun b!531894 () Bool)

(declare-fun e!309690 () Bool)

(declare-fun call!31939 () Bool)

(assert (=> b!531894 (= e!309690 call!31939)))

(declare-fun b!531895 () Bool)

(declare-fun e!309687 () Bool)

(declare-fun e!309688 () Bool)

(assert (=> b!531895 (= e!309687 e!309688)))

(declare-fun res!327524 () Bool)

(assert (=> b!531895 (=> (not res!327524) (not e!309688))))

(declare-fun e!309689 () Bool)

(assert (=> b!531895 (= res!327524 (not e!309689))))

(declare-fun res!327522 () Bool)

(assert (=> b!531895 (=> (not res!327522) (not e!309689))))

(assert (=> b!531895 (= res!327522 (validKeyInArray!0 (select (arr!16205 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!531896 () Bool)

(declare-fun contains!2769 (List!10363 (_ BitVec 64)) Bool)

(assert (=> b!531896 (= e!309689 (contains!2769 Nil!10360 (select (arr!16205 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81137 () Bool)

(declare-fun res!327523 () Bool)

(assert (=> d!81137 (=> res!327523 e!309687)))

(assert (=> d!81137 (= res!327523 (bvsge #b00000000000000000000000000000000 (size!16570 a!3154)))))

(assert (=> d!81137 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10360) e!309687)))

(declare-fun b!531897 () Bool)

(assert (=> b!531897 (= e!309688 e!309690)))

(declare-fun c!62496 () Bool)

(assert (=> b!531897 (= c!62496 (validKeyInArray!0 (select (arr!16205 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!531898 () Bool)

(assert (=> b!531898 (= e!309690 call!31939)))

(declare-fun bm!31936 () Bool)

(assert (=> bm!31936 (= call!31939 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62496 (Cons!10359 (select (arr!16205 a!3154) #b00000000000000000000000000000000) Nil!10360) Nil!10360)))))

(assert (= (and d!81137 (not res!327523)) b!531895))

(assert (= (and b!531895 res!327522) b!531896))

(assert (= (and b!531895 res!327524) b!531897))

(assert (= (and b!531897 c!62496) b!531894))

(assert (= (and b!531897 (not c!62496)) b!531898))

(assert (= (or b!531894 b!531898) bm!31936))

(declare-fun m!511693 () Bool)

(assert (=> b!531895 m!511693))

(assert (=> b!531895 m!511693))

(declare-fun m!511695 () Bool)

(assert (=> b!531895 m!511695))

(assert (=> b!531896 m!511693))

(assert (=> b!531896 m!511693))

(declare-fun m!511697 () Bool)

(assert (=> b!531896 m!511697))

(assert (=> b!531897 m!511693))

(assert (=> b!531897 m!511693))

(assert (=> b!531897 m!511695))

(assert (=> bm!31936 m!511693))

(declare-fun m!511699 () Bool)

(assert (=> bm!31936 m!511699))

(assert (=> b!531817 d!81137))

(declare-fun d!81143 () Bool)

(declare-fun res!327529 () Bool)

(declare-fun e!309695 () Bool)

(assert (=> d!81143 (=> res!327529 e!309695)))

(assert (=> d!81143 (= res!327529 (= (select (arr!16205 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81143 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!309695)))

(declare-fun b!531903 () Bool)

(declare-fun e!309696 () Bool)

(assert (=> b!531903 (= e!309695 e!309696)))

(declare-fun res!327530 () Bool)

(assert (=> b!531903 (=> (not res!327530) (not e!309696))))

(assert (=> b!531903 (= res!327530 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16570 a!3154)))))

(declare-fun b!531904 () Bool)

(assert (=> b!531904 (= e!309696 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81143 (not res!327529)) b!531903))

(assert (= (and b!531903 res!327530) b!531904))

(assert (=> d!81143 m!511693))

(declare-fun m!511701 () Bool)

(assert (=> b!531904 m!511701))

(assert (=> b!531823 d!81143))

(declare-fun e!309742 () SeekEntryResult!4660)

(declare-fun b!531974 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!531974 (= e!309742 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16205 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!531975 () Bool)

(declare-fun lt!244910 () SeekEntryResult!4660)

(assert (=> b!531975 (and (bvsge (index!20866 lt!244910) #b00000000000000000000000000000000) (bvslt (index!20866 lt!244910) (size!16570 a!3154)))))

(declare-fun res!327559 () Bool)

(assert (=> b!531975 (= res!327559 (= (select (arr!16205 a!3154) (index!20866 lt!244910)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309741 () Bool)

(assert (=> b!531975 (=> res!327559 e!309741)))

(declare-fun b!531976 () Bool)

(declare-fun e!309739 () SeekEntryResult!4660)

(assert (=> b!531976 (= e!309739 (Intermediate!4660 true index!1177 x!1030))))

(declare-fun b!531977 () Bool)

(assert (=> b!531977 (and (bvsge (index!20866 lt!244910) #b00000000000000000000000000000000) (bvslt (index!20866 lt!244910) (size!16570 a!3154)))))

(declare-fun res!327560 () Bool)

(assert (=> b!531977 (= res!327560 (= (select (arr!16205 a!3154) (index!20866 lt!244910)) (select (arr!16205 a!3154) j!147)))))

(assert (=> b!531977 (=> res!327560 e!309741)))

(declare-fun e!309740 () Bool)

(assert (=> b!531977 (= e!309740 e!309741)))

(declare-fun b!531978 () Bool)

(declare-fun e!309738 () Bool)

(assert (=> b!531978 (= e!309738 e!309740)))

(declare-fun res!327558 () Bool)

(get-info :version)

(assert (=> b!531978 (= res!327558 (and ((_ is Intermediate!4660) lt!244910) (not (undefined!5472 lt!244910)) (bvslt (x!49845 lt!244910) #b01111111111111111111111111111110) (bvsge (x!49845 lt!244910) #b00000000000000000000000000000000) (bvsge (x!49845 lt!244910) x!1030)))))

(assert (=> b!531978 (=> (not res!327558) (not e!309740))))

(declare-fun d!81145 () Bool)

(assert (=> d!81145 e!309738))

(declare-fun c!62518 () Bool)

(assert (=> d!81145 (= c!62518 (and ((_ is Intermediate!4660) lt!244910) (undefined!5472 lt!244910)))))

(assert (=> d!81145 (= lt!244910 e!309739)))

(declare-fun c!62519 () Bool)

(assert (=> d!81145 (= c!62519 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!244909 () (_ BitVec 64))

(assert (=> d!81145 (= lt!244909 (select (arr!16205 a!3154) index!1177))))

(assert (=> d!81145 (validMask!0 mask!3216)))

(assert (=> d!81145 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16205 a!3154) j!147) a!3154 mask!3216) lt!244910)))

(declare-fun b!531979 () Bool)

(assert (=> b!531979 (= e!309742 (Intermediate!4660 false index!1177 x!1030))))

(declare-fun b!531980 () Bool)

(assert (=> b!531980 (= e!309738 (bvsge (x!49845 lt!244910) #b01111111111111111111111111111110))))

(declare-fun b!531981 () Bool)

(assert (=> b!531981 (and (bvsge (index!20866 lt!244910) #b00000000000000000000000000000000) (bvslt (index!20866 lt!244910) (size!16570 a!3154)))))

(assert (=> b!531981 (= e!309741 (= (select (arr!16205 a!3154) (index!20866 lt!244910)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!531982 () Bool)

(assert (=> b!531982 (= e!309739 e!309742)))

(declare-fun c!62520 () Bool)

(assert (=> b!531982 (= c!62520 (or (= lt!244909 (select (arr!16205 a!3154) j!147)) (= (bvadd lt!244909 lt!244909) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!81145 c!62519) b!531976))

(assert (= (and d!81145 (not c!62519)) b!531982))

(assert (= (and b!531982 c!62520) b!531979))

(assert (= (and b!531982 (not c!62520)) b!531974))

(assert (= (and d!81145 c!62518) b!531980))

(assert (= (and d!81145 (not c!62518)) b!531978))

(assert (= (and b!531978 res!327558) b!531977))

(assert (= (and b!531977 (not res!327560)) b!531975))

(assert (= (and b!531975 (not res!327559)) b!531981))

(declare-fun m!511715 () Bool)

(assert (=> b!531981 m!511715))

(assert (=> b!531975 m!511715))

(assert (=> b!531977 m!511715))

(declare-fun m!511717 () Bool)

(assert (=> b!531974 m!511717))

(assert (=> b!531974 m!511717))

(assert (=> b!531974 m!511635))

(declare-fun m!511719 () Bool)

(assert (=> b!531974 m!511719))

(declare-fun m!511721 () Bool)

(assert (=> d!81145 m!511721))

(assert (=> d!81145 m!511639))

(assert (=> b!531818 d!81145))

(declare-fun d!81153 () Bool)

(declare-fun lt!244935 () SeekEntryResult!4660)

(assert (=> d!81153 (and (or ((_ is Undefined!4660) lt!244935) (not ((_ is Found!4660) lt!244935)) (and (bvsge (index!20865 lt!244935) #b00000000000000000000000000000000) (bvslt (index!20865 lt!244935) (size!16570 a!3154)))) (or ((_ is Undefined!4660) lt!244935) ((_ is Found!4660) lt!244935) (not ((_ is MissingZero!4660) lt!244935)) (and (bvsge (index!20864 lt!244935) #b00000000000000000000000000000000) (bvslt (index!20864 lt!244935) (size!16570 a!3154)))) (or ((_ is Undefined!4660) lt!244935) ((_ is Found!4660) lt!244935) ((_ is MissingZero!4660) lt!244935) (not ((_ is MissingVacant!4660) lt!244935)) (and (bvsge (index!20867 lt!244935) #b00000000000000000000000000000000) (bvslt (index!20867 lt!244935) (size!16570 a!3154)))) (or ((_ is Undefined!4660) lt!244935) (ite ((_ is Found!4660) lt!244935) (= (select (arr!16205 a!3154) (index!20865 lt!244935)) k0!1998) (ite ((_ is MissingZero!4660) lt!244935) (= (select (arr!16205 a!3154) (index!20864 lt!244935)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4660) lt!244935) (= (select (arr!16205 a!3154) (index!20867 lt!244935)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!309770 () SeekEntryResult!4660)

(assert (=> d!81153 (= lt!244935 e!309770)))

(declare-fun c!62545 () Bool)

(declare-fun lt!244934 () SeekEntryResult!4660)

(assert (=> d!81153 (= c!62545 (and ((_ is Intermediate!4660) lt!244934) (undefined!5472 lt!244934)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81153 (= lt!244934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81153 (validMask!0 mask!3216)))

(assert (=> d!81153 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!244935)))

(declare-fun e!309771 () SeekEntryResult!4660)

(declare-fun b!532034 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33726 (_ BitVec 32)) SeekEntryResult!4660)

(assert (=> b!532034 (= e!309771 (seekKeyOrZeroReturnVacant!0 (x!49845 lt!244934) (index!20866 lt!244934) (index!20866 lt!244934) k0!1998 a!3154 mask!3216))))

(declare-fun b!532035 () Bool)

(assert (=> b!532035 (= e!309771 (MissingZero!4660 (index!20866 lt!244934)))))

(declare-fun b!532036 () Bool)

(assert (=> b!532036 (= e!309770 Undefined!4660)))

(declare-fun b!532037 () Bool)

(declare-fun e!309769 () SeekEntryResult!4660)

(assert (=> b!532037 (= e!309769 (Found!4660 (index!20866 lt!244934)))))

(declare-fun b!532038 () Bool)

(declare-fun c!62547 () Bool)

(declare-fun lt!244936 () (_ BitVec 64))

(assert (=> b!532038 (= c!62547 (= lt!244936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!532038 (= e!309769 e!309771)))

(declare-fun b!532039 () Bool)

(assert (=> b!532039 (= e!309770 e!309769)))

(assert (=> b!532039 (= lt!244936 (select (arr!16205 a!3154) (index!20866 lt!244934)))))

(declare-fun c!62546 () Bool)

(assert (=> b!532039 (= c!62546 (= lt!244936 k0!1998))))

(assert (= (and d!81153 c!62545) b!532036))

(assert (= (and d!81153 (not c!62545)) b!532039))

(assert (= (and b!532039 c!62546) b!532037))

(assert (= (and b!532039 (not c!62546)) b!532038))

(assert (= (and b!532038 c!62547) b!532035))

(assert (= (and b!532038 (not c!62547)) b!532034))

(assert (=> d!81153 m!511639))

(declare-fun m!511745 () Bool)

(assert (=> d!81153 m!511745))

(declare-fun m!511747 () Bool)

(assert (=> d!81153 m!511747))

(declare-fun m!511749 () Bool)

(assert (=> d!81153 m!511749))

(declare-fun m!511751 () Bool)

(assert (=> d!81153 m!511751))

(assert (=> d!81153 m!511745))

(declare-fun m!511753 () Bool)

(assert (=> d!81153 m!511753))

(declare-fun m!511755 () Bool)

(assert (=> b!532034 m!511755))

(declare-fun m!511757 () Bool)

(assert (=> b!532039 m!511757))

(assert (=> b!531816 d!81153))

(declare-fun b!532072 () Bool)

(declare-fun e!309796 () Bool)

(declare-fun call!31945 () Bool)

(assert (=> b!532072 (= e!309796 call!31945)))

(declare-fun bm!31942 () Bool)

(assert (=> bm!31942 (= call!31945 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!532073 () Bool)

(declare-fun e!309795 () Bool)

(assert (=> b!532073 (= e!309795 call!31945)))

(declare-fun d!81161 () Bool)

(declare-fun res!327576 () Bool)

(declare-fun e!309794 () Bool)

(assert (=> d!81161 (=> res!327576 e!309794)))

(assert (=> d!81161 (= res!327576 (bvsge #b00000000000000000000000000000000 (size!16570 a!3154)))))

(assert (=> d!81161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309794)))

(declare-fun b!532074 () Bool)

(assert (=> b!532074 (= e!309794 e!309795)))

(declare-fun c!62558 () Bool)

(assert (=> b!532074 (= c!62558 (validKeyInArray!0 (select (arr!16205 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!532075 () Bool)

(assert (=> b!532075 (= e!309795 e!309796)))

(declare-fun lt!244957 () (_ BitVec 64))

(assert (=> b!532075 (= lt!244957 (select (arr!16205 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16818 0))(
  ( (Unit!16819) )
))
(declare-fun lt!244956 () Unit!16818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33726 (_ BitVec 64) (_ BitVec 32)) Unit!16818)

(assert (=> b!532075 (= lt!244956 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!244957 #b00000000000000000000000000000000))))

(assert (=> b!532075 (arrayContainsKey!0 a!3154 lt!244957 #b00000000000000000000000000000000)))

(declare-fun lt!244955 () Unit!16818)

(assert (=> b!532075 (= lt!244955 lt!244956)))

(declare-fun res!327577 () Bool)

(assert (=> b!532075 (= res!327577 (= (seekEntryOrOpen!0 (select (arr!16205 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4660 #b00000000000000000000000000000000)))))

(assert (=> b!532075 (=> (not res!327577) (not e!309796))))

(assert (= (and d!81161 (not res!327576)) b!532074))

(assert (= (and b!532074 c!62558) b!532075))

(assert (= (and b!532074 (not c!62558)) b!532073))

(assert (= (and b!532075 res!327577) b!532072))

(assert (= (or b!532072 b!532073) bm!31942))

(declare-fun m!511783 () Bool)

(assert (=> bm!31942 m!511783))

(assert (=> b!532074 m!511693))

(assert (=> b!532074 m!511693))

(assert (=> b!532074 m!511695))

(assert (=> b!532075 m!511693))

(declare-fun m!511785 () Bool)

(assert (=> b!532075 m!511785))

(declare-fun m!511787 () Bool)

(assert (=> b!532075 m!511787))

(assert (=> b!532075 m!511693))

(declare-fun m!511789 () Bool)

(assert (=> b!532075 m!511789))

(assert (=> b!531822 d!81161))

(check-sat (not b!531896) (not b!532034) (not d!81153) (not b!532075) (not b!531895) (not b!531904) (not bm!31936) (not d!81145) (not b!532074) (not bm!31942) (not b!531897) (not b!531974))
(check-sat)
