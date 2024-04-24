; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86836 () Bool)

(assert start!86836)

(declare-fun b!1005733 () Bool)

(declare-fun res!674452 () Bool)

(declare-fun e!566436 () Bool)

(assert (=> b!1005733 (=> (not res!674452) (not e!566436))))

(declare-datatypes ((array!63456 0))(
  ( (array!63457 (arr!30547 (Array (_ BitVec 32) (_ BitVec 64))) (size!31050 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63456)

(declare-datatypes ((List!21194 0))(
  ( (Nil!21191) (Cons!21190 (h!22376 (_ BitVec 64)) (t!30187 List!21194)) )
))
(declare-fun arrayNoDuplicates!0 (array!63456 (_ BitVec 32) List!21194) Bool)

(assert (=> b!1005733 (= res!674452 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21191))))

(declare-fun b!1005734 () Bool)

(declare-fun res!674458 () Bool)

(assert (=> b!1005734 (=> (not res!674458) (not e!566436))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1005734 (= res!674458 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31050 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31050 a!3219))))))

(declare-fun b!1005735 () Bool)

(declare-fun e!566434 () Bool)

(declare-fun e!566435 () Bool)

(assert (=> b!1005735 (= e!566434 e!566435)))

(declare-fun res!674451 () Bool)

(assert (=> b!1005735 (=> (not res!674451) (not e!566435))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun lt!444678 () (_ BitVec 64))

(declare-fun lt!444682 () array!63456)

(declare-datatypes ((SeekEntryResult!9415 0))(
  ( (MissingZero!9415 (index!40031 (_ BitVec 32))) (Found!9415 (index!40032 (_ BitVec 32))) (Intermediate!9415 (undefined!10227 Bool) (index!40033 (_ BitVec 32)) (x!87591 (_ BitVec 32))) (Undefined!9415) (MissingVacant!9415 (index!40034 (_ BitVec 32))) )
))
(declare-fun lt!444681 () SeekEntryResult!9415)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63456 (_ BitVec 32)) SeekEntryResult!9415)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005735 (= res!674451 (not (= lt!444681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444678 mask!3464) lt!444678 lt!444682 mask!3464))))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(assert (=> b!1005735 (= lt!444678 (select (store (arr!30547 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1005735 (= lt!444682 (array!63457 (store (arr!30547 a!3219) i!1194 k0!2224) (size!31050 a!3219)))))

(declare-fun b!1005736 () Bool)

(declare-fun res!674461 () Bool)

(declare-fun e!566432 () Bool)

(assert (=> b!1005736 (=> (not res!674461) (not e!566432))))

(assert (=> b!1005736 (= res!674461 (and (= (size!31050 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31050 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31050 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005737 () Bool)

(declare-fun e!566431 () Bool)

(assert (=> b!1005737 (= e!566436 e!566431)))

(declare-fun res!674459 () Bool)

(assert (=> b!1005737 (=> (not res!674459) (not e!566431))))

(declare-fun lt!444680 () SeekEntryResult!9415)

(assert (=> b!1005737 (= res!674459 (= lt!444681 lt!444680))))

(assert (=> b!1005737 (= lt!444680 (Intermediate!9415 false resIndex!38 resX!38))))

(assert (=> b!1005737 (= lt!444681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30547 a!3219) j!170) mask!3464) (select (arr!30547 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005738 () Bool)

(declare-fun res!674456 () Bool)

(assert (=> b!1005738 (=> (not res!674456) (not e!566435))))

(declare-fun lt!444683 () SeekEntryResult!9415)

(assert (=> b!1005738 (= res!674456 (not (= lt!444683 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444678 lt!444682 mask!3464))))))

(declare-fun b!1005740 () Bool)

(declare-fun res!674453 () Bool)

(assert (=> b!1005740 (=> (not res!674453) (not e!566432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005740 (= res!674453 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005741 () Bool)

(declare-fun res!674454 () Bool)

(assert (=> b!1005741 (=> (not res!674454) (not e!566432))))

(declare-fun arrayContainsKey!0 (array!63456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005741 (= res!674454 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005742 () Bool)

(assert (=> b!1005742 (= e!566432 e!566436)))

(declare-fun res!674460 () Bool)

(assert (=> b!1005742 (=> (not res!674460) (not e!566436))))

(declare-fun lt!444679 () SeekEntryResult!9415)

(assert (=> b!1005742 (= res!674460 (or (= lt!444679 (MissingVacant!9415 i!1194)) (= lt!444679 (MissingZero!9415 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63456 (_ BitVec 32)) SeekEntryResult!9415)

(assert (=> b!1005742 (= lt!444679 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1005743 () Bool)

(assert (=> b!1005743 (= e!566431 e!566434)))

(declare-fun res!674450 () Bool)

(assert (=> b!1005743 (=> (not res!674450) (not e!566434))))

(assert (=> b!1005743 (= res!674450 (= lt!444683 lt!444680))))

(assert (=> b!1005743 (= lt!444683 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30547 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005739 () Bool)

(declare-fun res!674462 () Bool)

(assert (=> b!1005739 (=> (not res!674462) (not e!566432))))

(assert (=> b!1005739 (= res!674462 (validKeyInArray!0 (select (arr!30547 a!3219) j!170)))))

(declare-fun res!674455 () Bool)

(assert (=> start!86836 (=> (not res!674455) (not e!566432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86836 (= res!674455 (validMask!0 mask!3464))))

(assert (=> start!86836 e!566432))

(declare-fun array_inv!23683 (array!63456) Bool)

(assert (=> start!86836 (array_inv!23683 a!3219)))

(assert (=> start!86836 true))

(declare-fun b!1005744 () Bool)

(declare-fun res!674457 () Bool)

(assert (=> b!1005744 (=> (not res!674457) (not e!566436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63456 (_ BitVec 32)) Bool)

(assert (=> b!1005744 (= res!674457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005745 () Bool)

(assert (=> b!1005745 (= e!566435 (and (= index!1507 resIndex!38) (not (= x!1245 resX!38))))))

(assert (= (and start!86836 res!674455) b!1005736))

(assert (= (and b!1005736 res!674461) b!1005739))

(assert (= (and b!1005739 res!674462) b!1005740))

(assert (= (and b!1005740 res!674453) b!1005741))

(assert (= (and b!1005741 res!674454) b!1005742))

(assert (= (and b!1005742 res!674460) b!1005744))

(assert (= (and b!1005744 res!674457) b!1005733))

(assert (= (and b!1005733 res!674452) b!1005734))

(assert (= (and b!1005734 res!674458) b!1005737))

(assert (= (and b!1005737 res!674459) b!1005743))

(assert (= (and b!1005743 res!674450) b!1005735))

(assert (= (and b!1005735 res!674451) b!1005738))

(assert (= (and b!1005738 res!674456) b!1005745))

(declare-fun m!931553 () Bool)

(assert (=> b!1005743 m!931553))

(assert (=> b!1005743 m!931553))

(declare-fun m!931555 () Bool)

(assert (=> b!1005743 m!931555))

(declare-fun m!931557 () Bool)

(assert (=> b!1005742 m!931557))

(assert (=> b!1005739 m!931553))

(assert (=> b!1005739 m!931553))

(declare-fun m!931559 () Bool)

(assert (=> b!1005739 m!931559))

(declare-fun m!931561 () Bool)

(assert (=> b!1005733 m!931561))

(declare-fun m!931563 () Bool)

(assert (=> b!1005738 m!931563))

(assert (=> b!1005737 m!931553))

(assert (=> b!1005737 m!931553))

(declare-fun m!931565 () Bool)

(assert (=> b!1005737 m!931565))

(assert (=> b!1005737 m!931565))

(assert (=> b!1005737 m!931553))

(declare-fun m!931567 () Bool)

(assert (=> b!1005737 m!931567))

(declare-fun m!931569 () Bool)

(assert (=> start!86836 m!931569))

(declare-fun m!931571 () Bool)

(assert (=> start!86836 m!931571))

(declare-fun m!931573 () Bool)

(assert (=> b!1005744 m!931573))

(declare-fun m!931575 () Bool)

(assert (=> b!1005735 m!931575))

(assert (=> b!1005735 m!931575))

(declare-fun m!931577 () Bool)

(assert (=> b!1005735 m!931577))

(declare-fun m!931579 () Bool)

(assert (=> b!1005735 m!931579))

(declare-fun m!931581 () Bool)

(assert (=> b!1005735 m!931581))

(declare-fun m!931583 () Bool)

(assert (=> b!1005740 m!931583))

(declare-fun m!931585 () Bool)

(assert (=> b!1005741 m!931585))

(check-sat (not b!1005738) (not b!1005741) (not b!1005737) (not b!1005733) (not start!86836) (not b!1005739) (not b!1005743) (not b!1005740) (not b!1005744) (not b!1005735) (not b!1005742))
(check-sat)
(get-model)

(declare-fun b!1005848 () Bool)

(declare-fun e!566488 () SeekEntryResult!9415)

(declare-fun lt!444736 () SeekEntryResult!9415)

(assert (=> b!1005848 (= e!566488 (Found!9415 (index!40033 lt!444736)))))

(declare-fun b!1005849 () Bool)

(declare-fun e!566489 () SeekEntryResult!9415)

(assert (=> b!1005849 (= e!566489 e!566488)))

(declare-fun lt!444737 () (_ BitVec 64))

(assert (=> b!1005849 (= lt!444737 (select (arr!30547 a!3219) (index!40033 lt!444736)))))

(declare-fun c!101805 () Bool)

(assert (=> b!1005849 (= c!101805 (= lt!444737 k0!2224))))

(declare-fun b!1005850 () Bool)

(declare-fun c!101804 () Bool)

(assert (=> b!1005850 (= c!101804 (= lt!444737 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566490 () SeekEntryResult!9415)

(assert (=> b!1005850 (= e!566488 e!566490)))

(declare-fun d!119841 () Bool)

(declare-fun lt!444735 () SeekEntryResult!9415)

(get-info :version)

(assert (=> d!119841 (and (or ((_ is Undefined!9415) lt!444735) (not ((_ is Found!9415) lt!444735)) (and (bvsge (index!40032 lt!444735) #b00000000000000000000000000000000) (bvslt (index!40032 lt!444735) (size!31050 a!3219)))) (or ((_ is Undefined!9415) lt!444735) ((_ is Found!9415) lt!444735) (not ((_ is MissingZero!9415) lt!444735)) (and (bvsge (index!40031 lt!444735) #b00000000000000000000000000000000) (bvslt (index!40031 lt!444735) (size!31050 a!3219)))) (or ((_ is Undefined!9415) lt!444735) ((_ is Found!9415) lt!444735) ((_ is MissingZero!9415) lt!444735) (not ((_ is MissingVacant!9415) lt!444735)) (and (bvsge (index!40034 lt!444735) #b00000000000000000000000000000000) (bvslt (index!40034 lt!444735) (size!31050 a!3219)))) (or ((_ is Undefined!9415) lt!444735) (ite ((_ is Found!9415) lt!444735) (= (select (arr!30547 a!3219) (index!40032 lt!444735)) k0!2224) (ite ((_ is MissingZero!9415) lt!444735) (= (select (arr!30547 a!3219) (index!40031 lt!444735)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9415) lt!444735) (= (select (arr!30547 a!3219) (index!40034 lt!444735)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119841 (= lt!444735 e!566489)))

(declare-fun c!101806 () Bool)

(assert (=> d!119841 (= c!101806 (and ((_ is Intermediate!9415) lt!444736) (undefined!10227 lt!444736)))))

(assert (=> d!119841 (= lt!444736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119841 (validMask!0 mask!3464)))

(assert (=> d!119841 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!444735)))

(declare-fun b!1005851 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63456 (_ BitVec 32)) SeekEntryResult!9415)

(assert (=> b!1005851 (= e!566490 (seekKeyOrZeroReturnVacant!0 (x!87591 lt!444736) (index!40033 lt!444736) (index!40033 lt!444736) k0!2224 a!3219 mask!3464))))

(declare-fun b!1005852 () Bool)

(assert (=> b!1005852 (= e!566490 (MissingZero!9415 (index!40033 lt!444736)))))

(declare-fun b!1005853 () Bool)

(assert (=> b!1005853 (= e!566489 Undefined!9415)))

(assert (= (and d!119841 c!101806) b!1005853))

(assert (= (and d!119841 (not c!101806)) b!1005849))

(assert (= (and b!1005849 c!101805) b!1005848))

(assert (= (and b!1005849 (not c!101805)) b!1005850))

(assert (= (and b!1005850 c!101804) b!1005852))

(assert (= (and b!1005850 (not c!101804)) b!1005851))

(declare-fun m!931667 () Bool)

(assert (=> b!1005849 m!931667))

(declare-fun m!931669 () Bool)

(assert (=> d!119841 m!931669))

(declare-fun m!931671 () Bool)

(assert (=> d!119841 m!931671))

(assert (=> d!119841 m!931669))

(declare-fun m!931673 () Bool)

(assert (=> d!119841 m!931673))

(declare-fun m!931675 () Bool)

(assert (=> d!119841 m!931675))

(assert (=> d!119841 m!931569))

(declare-fun m!931677 () Bool)

(assert (=> d!119841 m!931677))

(declare-fun m!931679 () Bool)

(assert (=> b!1005851 m!931679))

(assert (=> b!1005742 d!119841))

(declare-fun e!566520 () SeekEntryResult!9415)

(declare-fun b!1005897 () Bool)

(assert (=> b!1005897 (= e!566520 (Intermediate!9415 false (toIndex!0 (select (arr!30547 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1005898 () Bool)

(declare-fun e!566521 () Bool)

(declare-fun lt!444747 () SeekEntryResult!9415)

(assert (=> b!1005898 (= e!566521 (bvsge (x!87591 lt!444747) #b01111111111111111111111111111110))))

(declare-fun b!1005899 () Bool)

(assert (=> b!1005899 (and (bvsge (index!40033 lt!444747) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444747) (size!31050 a!3219)))))

(declare-fun res!674566 () Bool)

(assert (=> b!1005899 (= res!674566 (= (select (arr!30547 a!3219) (index!40033 lt!444747)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566518 () Bool)

(assert (=> b!1005899 (=> res!674566 e!566518)))

(declare-fun b!1005900 () Bool)

(declare-fun e!566517 () SeekEntryResult!9415)

(assert (=> b!1005900 (= e!566517 (Intermediate!9415 true (toIndex!0 (select (arr!30547 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119847 () Bool)

(assert (=> d!119847 e!566521))

(declare-fun c!101821 () Bool)

(assert (=> d!119847 (= c!101821 (and ((_ is Intermediate!9415) lt!444747) (undefined!10227 lt!444747)))))

(assert (=> d!119847 (= lt!444747 e!566517)))

(declare-fun c!101820 () Bool)

(assert (=> d!119847 (= c!101820 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444746 () (_ BitVec 64))

(assert (=> d!119847 (= lt!444746 (select (arr!30547 a!3219) (toIndex!0 (select (arr!30547 a!3219) j!170) mask!3464)))))

(assert (=> d!119847 (validMask!0 mask!3464)))

(assert (=> d!119847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30547 a!3219) j!170) mask!3464) (select (arr!30547 a!3219) j!170) a!3219 mask!3464) lt!444747)))

(declare-fun b!1005896 () Bool)

(assert (=> b!1005896 (and (bvsge (index!40033 lt!444747) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444747) (size!31050 a!3219)))))

(declare-fun res!674565 () Bool)

(assert (=> b!1005896 (= res!674565 (= (select (arr!30547 a!3219) (index!40033 lt!444747)) (select (arr!30547 a!3219) j!170)))))

(assert (=> b!1005896 (=> res!674565 e!566518)))

(declare-fun e!566519 () Bool)

(assert (=> b!1005896 (= e!566519 e!566518)))

(declare-fun b!1005901 () Bool)

(assert (=> b!1005901 (and (bvsge (index!40033 lt!444747) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444747) (size!31050 a!3219)))))

(assert (=> b!1005901 (= e!566518 (= (select (arr!30547 a!3219) (index!40033 lt!444747)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005902 () Bool)

(assert (=> b!1005902 (= e!566521 e!566519)))

(declare-fun res!674567 () Bool)

(assert (=> b!1005902 (= res!674567 (and ((_ is Intermediate!9415) lt!444747) (not (undefined!10227 lt!444747)) (bvslt (x!87591 lt!444747) #b01111111111111111111111111111110) (bvsge (x!87591 lt!444747) #b00000000000000000000000000000000) (bvsge (x!87591 lt!444747) #b00000000000000000000000000000000)))))

(assert (=> b!1005902 (=> (not res!674567) (not e!566519))))

(declare-fun b!1005903 () Bool)

(assert (=> b!1005903 (= e!566517 e!566520)))

(declare-fun c!101819 () Bool)

(assert (=> b!1005903 (= c!101819 (or (= lt!444746 (select (arr!30547 a!3219) j!170)) (= (bvadd lt!444746 lt!444746) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005904 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005904 (= e!566520 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30547 a!3219) j!170) mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30547 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and d!119847 c!101820) b!1005900))

(assert (= (and d!119847 (not c!101820)) b!1005903))

(assert (= (and b!1005903 c!101819) b!1005897))

(assert (= (and b!1005903 (not c!101819)) b!1005904))

(assert (= (and d!119847 c!101821) b!1005898))

(assert (= (and d!119847 (not c!101821)) b!1005902))

(assert (= (and b!1005902 res!674567) b!1005896))

(assert (= (and b!1005896 (not res!674565)) b!1005899))

(assert (= (and b!1005899 (not res!674566)) b!1005901))

(declare-fun m!931683 () Bool)

(assert (=> b!1005901 m!931683))

(assert (=> b!1005896 m!931683))

(assert (=> b!1005899 m!931683))

(assert (=> d!119847 m!931565))

(declare-fun m!931685 () Bool)

(assert (=> d!119847 m!931685))

(assert (=> d!119847 m!931569))

(assert (=> b!1005904 m!931565))

(declare-fun m!931687 () Bool)

(assert (=> b!1005904 m!931687))

(assert (=> b!1005904 m!931687))

(assert (=> b!1005904 m!931553))

(declare-fun m!931689 () Bool)

(assert (=> b!1005904 m!931689))

(assert (=> b!1005737 d!119847))

(declare-fun d!119855 () Bool)

(declare-fun lt!444761 () (_ BitVec 32))

(declare-fun lt!444760 () (_ BitVec 32))

(assert (=> d!119855 (= lt!444761 (bvmul (bvxor lt!444760 (bvlshr lt!444760 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119855 (= lt!444760 ((_ extract 31 0) (bvand (bvxor (select (arr!30547 a!3219) j!170) (bvlshr (select (arr!30547 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119855 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674568 (let ((h!22379 ((_ extract 31 0) (bvand (bvxor (select (arr!30547 a!3219) j!170) (bvlshr (select (arr!30547 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87596 (bvmul (bvxor h!22379 (bvlshr h!22379 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87596 (bvlshr x!87596 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674568 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674568 #b00000000000000000000000000000000))))))

(assert (=> d!119855 (= (toIndex!0 (select (arr!30547 a!3219) j!170) mask!3464) (bvand (bvxor lt!444761 (bvlshr lt!444761 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1005737 d!119855))

(declare-fun b!1005927 () Bool)

(declare-fun e!566536 () SeekEntryResult!9415)

(assert (=> b!1005927 (= e!566536 (Intermediate!9415 false (toIndex!0 lt!444678 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1005928 () Bool)

(declare-fun e!566537 () Bool)

(declare-fun lt!444763 () SeekEntryResult!9415)

(assert (=> b!1005928 (= e!566537 (bvsge (x!87591 lt!444763) #b01111111111111111111111111111110))))

(declare-fun b!1005929 () Bool)

(assert (=> b!1005929 (and (bvsge (index!40033 lt!444763) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444763) (size!31050 lt!444682)))))

(declare-fun res!674573 () Bool)

(assert (=> b!1005929 (= res!674573 (= (select (arr!30547 lt!444682) (index!40033 lt!444763)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566534 () Bool)

(assert (=> b!1005929 (=> res!674573 e!566534)))

(declare-fun b!1005930 () Bool)

(declare-fun e!566533 () SeekEntryResult!9415)

(assert (=> b!1005930 (= e!566533 (Intermediate!9415 true (toIndex!0 lt!444678 mask!3464) #b00000000000000000000000000000000))))

(declare-fun d!119859 () Bool)

(assert (=> d!119859 e!566537))

(declare-fun c!101833 () Bool)

(assert (=> d!119859 (= c!101833 (and ((_ is Intermediate!9415) lt!444763) (undefined!10227 lt!444763)))))

(assert (=> d!119859 (= lt!444763 e!566533)))

(declare-fun c!101832 () Bool)

(assert (=> d!119859 (= c!101832 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444762 () (_ BitVec 64))

(assert (=> d!119859 (= lt!444762 (select (arr!30547 lt!444682) (toIndex!0 lt!444678 mask!3464)))))

(assert (=> d!119859 (validMask!0 mask!3464)))

(assert (=> d!119859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444678 mask!3464) lt!444678 lt!444682 mask!3464) lt!444763)))

(declare-fun b!1005926 () Bool)

(assert (=> b!1005926 (and (bvsge (index!40033 lt!444763) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444763) (size!31050 lt!444682)))))

(declare-fun res!674572 () Bool)

(assert (=> b!1005926 (= res!674572 (= (select (arr!30547 lt!444682) (index!40033 lt!444763)) lt!444678))))

(assert (=> b!1005926 (=> res!674572 e!566534)))

(declare-fun e!566535 () Bool)

(assert (=> b!1005926 (= e!566535 e!566534)))

(declare-fun b!1005931 () Bool)

(assert (=> b!1005931 (and (bvsge (index!40033 lt!444763) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444763) (size!31050 lt!444682)))))

(assert (=> b!1005931 (= e!566534 (= (select (arr!30547 lt!444682) (index!40033 lt!444763)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005932 () Bool)

(assert (=> b!1005932 (= e!566537 e!566535)))

(declare-fun res!674574 () Bool)

(assert (=> b!1005932 (= res!674574 (and ((_ is Intermediate!9415) lt!444763) (not (undefined!10227 lt!444763)) (bvslt (x!87591 lt!444763) #b01111111111111111111111111111110) (bvsge (x!87591 lt!444763) #b00000000000000000000000000000000) (bvsge (x!87591 lt!444763) #b00000000000000000000000000000000)))))

(assert (=> b!1005932 (=> (not res!674574) (not e!566535))))

(declare-fun b!1005933 () Bool)

(assert (=> b!1005933 (= e!566533 e!566536)))

(declare-fun c!101831 () Bool)

(assert (=> b!1005933 (= c!101831 (or (= lt!444762 lt!444678) (= (bvadd lt!444762 lt!444762) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005934 () Bool)

(assert (=> b!1005934 (= e!566536 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444678 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!444678 lt!444682 mask!3464))))

(assert (= (and d!119859 c!101832) b!1005930))

(assert (= (and d!119859 (not c!101832)) b!1005933))

(assert (= (and b!1005933 c!101831) b!1005927))

(assert (= (and b!1005933 (not c!101831)) b!1005934))

(assert (= (and d!119859 c!101833) b!1005928))

(assert (= (and d!119859 (not c!101833)) b!1005932))

(assert (= (and b!1005932 res!674574) b!1005926))

(assert (= (and b!1005926 (not res!674572)) b!1005929))

(assert (= (and b!1005929 (not res!674573)) b!1005931))

(declare-fun m!931699 () Bool)

(assert (=> b!1005931 m!931699))

(assert (=> b!1005926 m!931699))

(assert (=> b!1005929 m!931699))

(assert (=> d!119859 m!931575))

(declare-fun m!931701 () Bool)

(assert (=> d!119859 m!931701))

(assert (=> d!119859 m!931569))

(assert (=> b!1005934 m!931575))

(declare-fun m!931703 () Bool)

(assert (=> b!1005934 m!931703))

(assert (=> b!1005934 m!931703))

(declare-fun m!931705 () Bool)

(assert (=> b!1005934 m!931705))

(assert (=> b!1005735 d!119859))

(declare-fun d!119861 () Bool)

(declare-fun lt!444765 () (_ BitVec 32))

(declare-fun lt!444764 () (_ BitVec 32))

(assert (=> d!119861 (= lt!444765 (bvmul (bvxor lt!444764 (bvlshr lt!444764 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119861 (= lt!444764 ((_ extract 31 0) (bvand (bvxor lt!444678 (bvlshr lt!444678 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119861 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!674568 (let ((h!22379 ((_ extract 31 0) (bvand (bvxor lt!444678 (bvlshr lt!444678 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87596 (bvmul (bvxor h!22379 (bvlshr h!22379 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87596 (bvlshr x!87596 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!674568 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!674568 #b00000000000000000000000000000000))))))

(assert (=> d!119861 (= (toIndex!0 lt!444678 mask!3464) (bvand (bvxor lt!444765 (bvlshr lt!444765 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1005735 d!119861))

(declare-fun d!119863 () Bool)

(declare-fun res!674585 () Bool)

(declare-fun e!566553 () Bool)

(assert (=> d!119863 (=> res!674585 e!566553)))

(assert (=> d!119863 (= res!674585 (= (select (arr!30547 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119863 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!566553)))

(declare-fun b!1005955 () Bool)

(declare-fun e!566554 () Bool)

(assert (=> b!1005955 (= e!566553 e!566554)))

(declare-fun res!674586 () Bool)

(assert (=> b!1005955 (=> (not res!674586) (not e!566554))))

(assert (=> b!1005955 (= res!674586 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31050 a!3219)))))

(declare-fun b!1005956 () Bool)

(assert (=> b!1005956 (= e!566554 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119863 (not res!674585)) b!1005955))

(assert (= (and b!1005955 res!674586) b!1005956))

(declare-fun m!931707 () Bool)

(assert (=> d!119863 m!931707))

(declare-fun m!931711 () Bool)

(assert (=> b!1005956 m!931711))

(assert (=> b!1005741 d!119863))

(declare-fun d!119865 () Bool)

(assert (=> d!119865 (= (validKeyInArray!0 (select (arr!30547 a!3219) j!170)) (and (not (= (select (arr!30547 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30547 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1005739 d!119865))

(declare-fun d!119871 () Bool)

(assert (=> d!119871 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1005740 d!119871))

(declare-fun b!1005972 () Bool)

(declare-fun e!566567 () SeekEntryResult!9415)

(assert (=> b!1005972 (= e!566567 (Intermediate!9415 false index!1507 x!1245))))

(declare-fun b!1005973 () Bool)

(declare-fun e!566568 () Bool)

(declare-fun lt!444772 () SeekEntryResult!9415)

(assert (=> b!1005973 (= e!566568 (bvsge (x!87591 lt!444772) #b01111111111111111111111111111110))))

(declare-fun b!1005974 () Bool)

(assert (=> b!1005974 (and (bvsge (index!40033 lt!444772) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444772) (size!31050 a!3219)))))

(declare-fun res!674594 () Bool)

(assert (=> b!1005974 (= res!674594 (= (select (arr!30547 a!3219) (index!40033 lt!444772)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566565 () Bool)

(assert (=> b!1005974 (=> res!674594 e!566565)))

(declare-fun b!1005975 () Bool)

(declare-fun e!566564 () SeekEntryResult!9415)

(assert (=> b!1005975 (= e!566564 (Intermediate!9415 true index!1507 x!1245))))

(declare-fun d!119873 () Bool)

(assert (=> d!119873 e!566568))

(declare-fun c!101845 () Bool)

(assert (=> d!119873 (= c!101845 (and ((_ is Intermediate!9415) lt!444772) (undefined!10227 lt!444772)))))

(assert (=> d!119873 (= lt!444772 e!566564)))

(declare-fun c!101844 () Bool)

(assert (=> d!119873 (= c!101844 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444771 () (_ BitVec 64))

(assert (=> d!119873 (= lt!444771 (select (arr!30547 a!3219) index!1507))))

(assert (=> d!119873 (validMask!0 mask!3464)))

(assert (=> d!119873 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30547 a!3219) j!170) a!3219 mask!3464) lt!444772)))

(declare-fun b!1005971 () Bool)

(assert (=> b!1005971 (and (bvsge (index!40033 lt!444772) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444772) (size!31050 a!3219)))))

(declare-fun res!674593 () Bool)

(assert (=> b!1005971 (= res!674593 (= (select (arr!30547 a!3219) (index!40033 lt!444772)) (select (arr!30547 a!3219) j!170)))))

(assert (=> b!1005971 (=> res!674593 e!566565)))

(declare-fun e!566566 () Bool)

(assert (=> b!1005971 (= e!566566 e!566565)))

(declare-fun b!1005976 () Bool)

(assert (=> b!1005976 (and (bvsge (index!40033 lt!444772) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444772) (size!31050 a!3219)))))

(assert (=> b!1005976 (= e!566565 (= (select (arr!30547 a!3219) (index!40033 lt!444772)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005977 () Bool)

(assert (=> b!1005977 (= e!566568 e!566566)))

(declare-fun res!674595 () Bool)

(assert (=> b!1005977 (= res!674595 (and ((_ is Intermediate!9415) lt!444772) (not (undefined!10227 lt!444772)) (bvslt (x!87591 lt!444772) #b01111111111111111111111111111110) (bvsge (x!87591 lt!444772) #b00000000000000000000000000000000) (bvsge (x!87591 lt!444772) x!1245)))))

(assert (=> b!1005977 (=> (not res!674595) (not e!566566))))

(declare-fun b!1005978 () Bool)

(assert (=> b!1005978 (= e!566564 e!566567)))

(declare-fun c!101843 () Bool)

(assert (=> b!1005978 (= c!101843 (or (= lt!444771 (select (arr!30547 a!3219) j!170)) (= (bvadd lt!444771 lt!444771) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005979 () Bool)

(assert (=> b!1005979 (= e!566567 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30547 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and d!119873 c!101844) b!1005975))

(assert (= (and d!119873 (not c!101844)) b!1005978))

(assert (= (and b!1005978 c!101843) b!1005972))

(assert (= (and b!1005978 (not c!101843)) b!1005979))

(assert (= (and d!119873 c!101845) b!1005973))

(assert (= (and d!119873 (not c!101845)) b!1005977))

(assert (= (and b!1005977 res!674595) b!1005971))

(assert (= (and b!1005971 (not res!674593)) b!1005974))

(assert (= (and b!1005974 (not res!674594)) b!1005976))

(declare-fun m!931737 () Bool)

(assert (=> b!1005976 m!931737))

(assert (=> b!1005971 m!931737))

(assert (=> b!1005974 m!931737))

(declare-fun m!931739 () Bool)

(assert (=> d!119873 m!931739))

(assert (=> d!119873 m!931569))

(declare-fun m!931741 () Bool)

(assert (=> b!1005979 m!931741))

(assert (=> b!1005979 m!931741))

(assert (=> b!1005979 m!931553))

(declare-fun m!931743 () Bool)

(assert (=> b!1005979 m!931743))

(assert (=> b!1005743 d!119873))

(declare-fun d!119877 () Bool)

(assert (=> d!119877 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86836 d!119877))

(declare-fun d!119885 () Bool)

(assert (=> d!119885 (= (array_inv!23683 a!3219) (bvsge (size!31050 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86836 d!119885))

(declare-fun b!1005981 () Bool)

(declare-fun e!566572 () SeekEntryResult!9415)

(assert (=> b!1005981 (= e!566572 (Intermediate!9415 false index!1507 x!1245))))

(declare-fun b!1005982 () Bool)

(declare-fun e!566573 () Bool)

(declare-fun lt!444780 () SeekEntryResult!9415)

(assert (=> b!1005982 (= e!566573 (bvsge (x!87591 lt!444780) #b01111111111111111111111111111110))))

(declare-fun b!1005983 () Bool)

(assert (=> b!1005983 (and (bvsge (index!40033 lt!444780) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444780) (size!31050 lt!444682)))))

(declare-fun res!674598 () Bool)

(assert (=> b!1005983 (= res!674598 (= (select (arr!30547 lt!444682) (index!40033 lt!444780)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566570 () Bool)

(assert (=> b!1005983 (=> res!674598 e!566570)))

(declare-fun b!1005984 () Bool)

(declare-fun e!566569 () SeekEntryResult!9415)

(assert (=> b!1005984 (= e!566569 (Intermediate!9415 true index!1507 x!1245))))

(declare-fun d!119887 () Bool)

(assert (=> d!119887 e!566573))

(declare-fun c!101848 () Bool)

(assert (=> d!119887 (= c!101848 (and ((_ is Intermediate!9415) lt!444780) (undefined!10227 lt!444780)))))

(assert (=> d!119887 (= lt!444780 e!566569)))

(declare-fun c!101847 () Bool)

(assert (=> d!119887 (= c!101847 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444779 () (_ BitVec 64))

(assert (=> d!119887 (= lt!444779 (select (arr!30547 lt!444682) index!1507))))

(assert (=> d!119887 (validMask!0 mask!3464)))

(assert (=> d!119887 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444678 lt!444682 mask!3464) lt!444780)))

(declare-fun b!1005980 () Bool)

(assert (=> b!1005980 (and (bvsge (index!40033 lt!444780) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444780) (size!31050 lt!444682)))))

(declare-fun res!674597 () Bool)

(assert (=> b!1005980 (= res!674597 (= (select (arr!30547 lt!444682) (index!40033 lt!444780)) lt!444678))))

(assert (=> b!1005980 (=> res!674597 e!566570)))

(declare-fun e!566571 () Bool)

(assert (=> b!1005980 (= e!566571 e!566570)))

(declare-fun b!1005985 () Bool)

(assert (=> b!1005985 (and (bvsge (index!40033 lt!444780) #b00000000000000000000000000000000) (bvslt (index!40033 lt!444780) (size!31050 lt!444682)))))

(assert (=> b!1005985 (= e!566570 (= (select (arr!30547 lt!444682) (index!40033 lt!444780)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1005986 () Bool)

(assert (=> b!1005986 (= e!566573 e!566571)))

(declare-fun res!674599 () Bool)

(assert (=> b!1005986 (= res!674599 (and ((_ is Intermediate!9415) lt!444780) (not (undefined!10227 lt!444780)) (bvslt (x!87591 lt!444780) #b01111111111111111111111111111110) (bvsge (x!87591 lt!444780) #b00000000000000000000000000000000) (bvsge (x!87591 lt!444780) x!1245)))))

(assert (=> b!1005986 (=> (not res!674599) (not e!566571))))

(declare-fun b!1005987 () Bool)

(assert (=> b!1005987 (= e!566569 e!566572)))

(declare-fun c!101846 () Bool)

(assert (=> b!1005987 (= c!101846 (or (= lt!444779 lt!444678) (= (bvadd lt!444779 lt!444779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1005988 () Bool)

(assert (=> b!1005988 (= e!566572 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!444678 lt!444682 mask!3464))))

(assert (= (and d!119887 c!101847) b!1005984))

(assert (= (and d!119887 (not c!101847)) b!1005987))

(assert (= (and b!1005987 c!101846) b!1005981))

(assert (= (and b!1005987 (not c!101846)) b!1005988))

(assert (= (and d!119887 c!101848) b!1005982))

(assert (= (and d!119887 (not c!101848)) b!1005986))

(assert (= (and b!1005986 res!674599) b!1005980))

(assert (= (and b!1005980 (not res!674597)) b!1005983))

(assert (= (and b!1005983 (not res!674598)) b!1005985))

(declare-fun m!931745 () Bool)

(assert (=> b!1005985 m!931745))

(assert (=> b!1005980 m!931745))

(assert (=> b!1005983 m!931745))

(declare-fun m!931747 () Bool)

(assert (=> d!119887 m!931747))

(assert (=> d!119887 m!931569))

(assert (=> b!1005988 m!931741))

(assert (=> b!1005988 m!931741))

(declare-fun m!931749 () Bool)

(assert (=> b!1005988 m!931749))

(assert (=> b!1005738 d!119887))

(declare-fun d!119889 () Bool)

(declare-fun res!674612 () Bool)

(declare-fun e!566591 () Bool)

(assert (=> d!119889 (=> res!674612 e!566591)))

(assert (=> d!119889 (= res!674612 (bvsge #b00000000000000000000000000000000 (size!31050 a!3219)))))

(assert (=> d!119889 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21191) e!566591)))

(declare-fun b!1006011 () Bool)

(declare-fun e!566593 () Bool)

(declare-fun e!566594 () Bool)

(assert (=> b!1006011 (= e!566593 e!566594)))

(declare-fun c!101854 () Bool)

(assert (=> b!1006011 (= c!101854 (validKeyInArray!0 (select (arr!30547 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1006012 () Bool)

(assert (=> b!1006012 (= e!566591 e!566593)))

(declare-fun res!674613 () Bool)

(assert (=> b!1006012 (=> (not res!674613) (not e!566593))))

(declare-fun e!566592 () Bool)

(assert (=> b!1006012 (= res!674613 (not e!566592))))

(declare-fun res!674614 () Bool)

(assert (=> b!1006012 (=> (not res!674614) (not e!566592))))

(assert (=> b!1006012 (= res!674614 (validKeyInArray!0 (select (arr!30547 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1006013 () Bool)

(declare-fun call!42388 () Bool)

(assert (=> b!1006013 (= e!566594 call!42388)))

(declare-fun b!1006014 () Bool)

(declare-fun contains!5900 (List!21194 (_ BitVec 64)) Bool)

(assert (=> b!1006014 (= e!566592 (contains!5900 Nil!21191 (select (arr!30547 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1006015 () Bool)

(assert (=> b!1006015 (= e!566594 call!42388)))

(declare-fun bm!42385 () Bool)

(assert (=> bm!42385 (= call!42388 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101854 (Cons!21190 (select (arr!30547 a!3219) #b00000000000000000000000000000000) Nil!21191) Nil!21191)))))

(assert (= (and d!119889 (not res!674612)) b!1006012))

(assert (= (and b!1006012 res!674614) b!1006014))

(assert (= (and b!1006012 res!674613) b!1006011))

(assert (= (and b!1006011 c!101854) b!1006015))

(assert (= (and b!1006011 (not c!101854)) b!1006013))

(assert (= (or b!1006015 b!1006013) bm!42385))

(assert (=> b!1006011 m!931707))

(assert (=> b!1006011 m!931707))

(declare-fun m!931763 () Bool)

(assert (=> b!1006011 m!931763))

(assert (=> b!1006012 m!931707))

(assert (=> b!1006012 m!931707))

(assert (=> b!1006012 m!931763))

(assert (=> b!1006014 m!931707))

(assert (=> b!1006014 m!931707))

(declare-fun m!931765 () Bool)

(assert (=> b!1006014 m!931765))

(assert (=> bm!42385 m!931707))

(declare-fun m!931767 () Bool)

(assert (=> bm!42385 m!931767))

(assert (=> b!1005733 d!119889))

(declare-fun d!119897 () Bool)

(declare-fun res!674620 () Bool)

(declare-fun e!566602 () Bool)

(assert (=> d!119897 (=> res!674620 e!566602)))

(assert (=> d!119897 (= res!674620 (bvsge #b00000000000000000000000000000000 (size!31050 a!3219)))))

(assert (=> d!119897 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!566602)))

(declare-fun b!1006024 () Bool)

(declare-fun e!566601 () Bool)

(assert (=> b!1006024 (= e!566602 e!566601)))

(declare-fun c!101857 () Bool)

(assert (=> b!1006024 (= c!101857 (validKeyInArray!0 (select (arr!30547 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1006025 () Bool)

(declare-fun e!566603 () Bool)

(declare-fun call!42391 () Bool)

(assert (=> b!1006025 (= e!566603 call!42391)))

(declare-fun b!1006026 () Bool)

(assert (=> b!1006026 (= e!566601 e!566603)))

(declare-fun lt!444796 () (_ BitVec 64))

(assert (=> b!1006026 (= lt!444796 (select (arr!30547 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32989 0))(
  ( (Unit!32990) )
))
(declare-fun lt!444797 () Unit!32989)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63456 (_ BitVec 64) (_ BitVec 32)) Unit!32989)

(assert (=> b!1006026 (= lt!444797 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!444796 #b00000000000000000000000000000000))))

(assert (=> b!1006026 (arrayContainsKey!0 a!3219 lt!444796 #b00000000000000000000000000000000)))

(declare-fun lt!444798 () Unit!32989)

(assert (=> b!1006026 (= lt!444798 lt!444797)))

(declare-fun res!674619 () Bool)

(assert (=> b!1006026 (= res!674619 (= (seekEntryOrOpen!0 (select (arr!30547 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9415 #b00000000000000000000000000000000)))))

(assert (=> b!1006026 (=> (not res!674619) (not e!566603))))

(declare-fun b!1006027 () Bool)

(assert (=> b!1006027 (= e!566601 call!42391)))

(declare-fun bm!42388 () Bool)

(assert (=> bm!42388 (= call!42391 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119897 (not res!674620)) b!1006024))

(assert (= (and b!1006024 c!101857) b!1006026))

(assert (= (and b!1006024 (not c!101857)) b!1006027))

(assert (= (and b!1006026 res!674619) b!1006025))

(assert (= (or b!1006025 b!1006027) bm!42388))

(assert (=> b!1006024 m!931707))

(assert (=> b!1006024 m!931707))

(assert (=> b!1006024 m!931763))

(assert (=> b!1006026 m!931707))

(declare-fun m!931769 () Bool)

(assert (=> b!1006026 m!931769))

(declare-fun m!931771 () Bool)

(assert (=> b!1006026 m!931771))

(assert (=> b!1006026 m!931707))

(declare-fun m!931773 () Bool)

(assert (=> b!1006026 m!931773))

(declare-fun m!931775 () Bool)

(assert (=> bm!42388 m!931775))

(assert (=> b!1005744 d!119897))

(check-sat (not b!1006026) (not b!1006024) (not b!1005934) (not bm!42388) (not b!1005956) (not b!1005851) (not b!1005904) (not d!119847) (not d!119841) (not d!119887) (not b!1005988) (not d!119873) (not b!1005979) (not b!1006011) (not b!1006012) (not bm!42385) (not b!1006014) (not d!119859))
(check-sat)
