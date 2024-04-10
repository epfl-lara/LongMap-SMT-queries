; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52542 () Bool)

(assert start!52542)

(declare-fun b!573626 () Bool)

(declare-fun e!330002 () Bool)

(declare-fun e!330008 () Bool)

(assert (=> b!573626 (= e!330002 e!330008)))

(declare-fun res!362869 () Bool)

(assert (=> b!573626 (=> (not res!362869) (not e!330008))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35876 0))(
  ( (array!35877 (arr!17225 (Array (_ BitVec 32) (_ BitVec 64))) (size!17589 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35876)

(declare-datatypes ((SeekEntryResult!5674 0))(
  ( (MissingZero!5674 (index!24923 (_ BitVec 32))) (Found!5674 (index!24924 (_ BitVec 32))) (Intermediate!5674 (undefined!6486 Bool) (index!24925 (_ BitVec 32)) (x!53792 (_ BitVec 32))) (Undefined!5674) (MissingVacant!5674 (index!24926 (_ BitVec 32))) )
))
(declare-fun lt!261958 () SeekEntryResult!5674)

(declare-fun lt!261961 () SeekEntryResult!5674)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35876 (_ BitVec 32)) SeekEntryResult!5674)

(assert (=> b!573626 (= res!362869 (= lt!261958 (seekKeyOrZeroReturnVacant!0 (x!53792 lt!261961) (index!24925 lt!261961) (index!24925 lt!261961) (select (arr!17225 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573627 () Bool)

(declare-fun res!362870 () Bool)

(declare-fun e!330007 () Bool)

(assert (=> b!573627 (=> (not res!362870) (not e!330007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573627 (= res!362870 (validKeyInArray!0 (select (arr!17225 a!3118) j!142)))))

(declare-fun b!573628 () Bool)

(declare-fun e!330009 () Bool)

(assert (=> b!573628 (= e!330007 e!330009)))

(declare-fun res!362865 () Bool)

(assert (=> b!573628 (=> (not res!362865) (not e!330009))))

(declare-fun lt!261962 () SeekEntryResult!5674)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!573628 (= res!362865 (or (= lt!261962 (MissingZero!5674 i!1132)) (= lt!261962 (MissingVacant!5674 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35876 (_ BitVec 32)) SeekEntryResult!5674)

(assert (=> b!573628 (= lt!261962 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!573629 () Bool)

(declare-fun e!330005 () Bool)

(declare-fun e!330006 () Bool)

(assert (=> b!573629 (= e!330005 e!330006)))

(declare-fun res!362871 () Bool)

(assert (=> b!573629 (=> res!362871 e!330006)))

(assert (=> b!573629 (= res!362871 (or (undefined!6486 lt!261961) (not (is-Intermediate!5674 lt!261961))))))

(declare-fun b!573630 () Bool)

(assert (=> b!573630 (= e!330006 e!330002)))

(declare-fun res!362861 () Bool)

(assert (=> b!573630 (=> res!362861 e!330002)))

(declare-fun lt!261963 () (_ BitVec 64))

(assert (=> b!573630 (= res!362861 (or (= lt!261963 (select (arr!17225 a!3118) j!142)) (= lt!261963 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!573630 (= lt!261963 (select (arr!17225 a!3118) (index!24925 lt!261961)))))

(declare-fun b!573631 () Bool)

(declare-fun e!330004 () Bool)

(assert (=> b!573631 (= e!330009 e!330004)))

(declare-fun res!362873 () Bool)

(assert (=> b!573631 (=> (not res!362873) (not e!330004))))

(declare-fun lt!261959 () (_ BitVec 64))

(declare-fun lt!261956 () (_ BitVec 32))

(declare-fun lt!261960 () array!35876)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35876 (_ BitVec 32)) SeekEntryResult!5674)

(assert (=> b!573631 (= res!362873 (= lt!261961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261956 lt!261959 lt!261960 mask!3119)))))

(declare-fun lt!261957 () (_ BitVec 32))

(assert (=> b!573631 (= lt!261961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261957 (select (arr!17225 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573631 (= lt!261956 (toIndex!0 lt!261959 mask!3119))))

(assert (=> b!573631 (= lt!261959 (select (store (arr!17225 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!573631 (= lt!261957 (toIndex!0 (select (arr!17225 a!3118) j!142) mask!3119))))

(assert (=> b!573631 (= lt!261960 (array!35877 (store (arr!17225 a!3118) i!1132 k!1914) (size!17589 a!3118)))))

(declare-fun res!362864 () Bool)

(assert (=> start!52542 (=> (not res!362864) (not e!330007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52542 (= res!362864 (validMask!0 mask!3119))))

(assert (=> start!52542 e!330007))

(assert (=> start!52542 true))

(declare-fun array_inv!13021 (array!35876) Bool)

(assert (=> start!52542 (array_inv!13021 a!3118)))

(declare-fun b!573632 () Bool)

(assert (=> b!573632 (= e!330004 (not (or (undefined!6486 lt!261961) (not (is-Intermediate!5674 lt!261961)) (let ((bdg!17977 (select (arr!17225 a!3118) (index!24925 lt!261961)))) (or (= bdg!17977 (select (arr!17225 a!3118) j!142)) (= bdg!17977 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (index!24925 lt!261961) #b00000000000000000000000000000000) (bvsge (index!24925 lt!261961) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!53792 lt!261961) #b01111111111111111111111111111110) (bvsge (x!53792 lt!261961) #b00000000000000000000000000000000)))))))))

(assert (=> b!573632 e!330005))

(declare-fun res!362868 () Bool)

(assert (=> b!573632 (=> (not res!362868) (not e!330005))))

(assert (=> b!573632 (= res!362868 (= lt!261958 (Found!5674 j!142)))))

(assert (=> b!573632 (= lt!261958 (seekEntryOrOpen!0 (select (arr!17225 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35876 (_ BitVec 32)) Bool)

(assert (=> b!573632 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18050 0))(
  ( (Unit!18051) )
))
(declare-fun lt!261964 () Unit!18050)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18050)

(assert (=> b!573632 (= lt!261964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573633 () Bool)

(declare-fun res!362866 () Bool)

(assert (=> b!573633 (=> (not res!362866) (not e!330007))))

(declare-fun arrayContainsKey!0 (array!35876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573633 (= res!362866 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573634 () Bool)

(declare-fun res!362867 () Bool)

(assert (=> b!573634 (=> (not res!362867) (not e!330007))))

(assert (=> b!573634 (= res!362867 (and (= (size!17589 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17589 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17589 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573635 () Bool)

(declare-fun res!362863 () Bool)

(assert (=> b!573635 (=> (not res!362863) (not e!330009))))

(assert (=> b!573635 (= res!362863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!573636 () Bool)

(declare-fun res!362872 () Bool)

(assert (=> b!573636 (=> (not res!362872) (not e!330007))))

(assert (=> b!573636 (= res!362872 (validKeyInArray!0 k!1914))))

(declare-fun b!573637 () Bool)

(assert (=> b!573637 (= e!330008 (= (seekEntryOrOpen!0 lt!261959 lt!261960 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53792 lt!261961) (index!24925 lt!261961) (index!24925 lt!261961) lt!261959 lt!261960 mask!3119)))))

(declare-fun b!573638 () Bool)

(declare-fun res!362862 () Bool)

(assert (=> b!573638 (=> (not res!362862) (not e!330009))))

(declare-datatypes ((List!11305 0))(
  ( (Nil!11302) (Cons!11301 (h!12331 (_ BitVec 64)) (t!17533 List!11305)) )
))
(declare-fun arrayNoDuplicates!0 (array!35876 (_ BitVec 32) List!11305) Bool)

(assert (=> b!573638 (= res!362862 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11302))))

(assert (= (and start!52542 res!362864) b!573634))

(assert (= (and b!573634 res!362867) b!573627))

(assert (= (and b!573627 res!362870) b!573636))

(assert (= (and b!573636 res!362872) b!573633))

(assert (= (and b!573633 res!362866) b!573628))

(assert (= (and b!573628 res!362865) b!573635))

(assert (= (and b!573635 res!362863) b!573638))

(assert (= (and b!573638 res!362862) b!573631))

(assert (= (and b!573631 res!362873) b!573632))

(assert (= (and b!573632 res!362868) b!573629))

(assert (= (and b!573629 (not res!362871)) b!573630))

(assert (= (and b!573630 (not res!362861)) b!573626))

(assert (= (and b!573626 res!362869) b!573637))

(declare-fun m!552613 () Bool)

(assert (=> b!573631 m!552613))

(declare-fun m!552615 () Bool)

(assert (=> b!573631 m!552615))

(assert (=> b!573631 m!552613))

(declare-fun m!552617 () Bool)

(assert (=> b!573631 m!552617))

(assert (=> b!573631 m!552613))

(declare-fun m!552619 () Bool)

(assert (=> b!573631 m!552619))

(declare-fun m!552621 () Bool)

(assert (=> b!573631 m!552621))

(declare-fun m!552623 () Bool)

(assert (=> b!573631 m!552623))

(declare-fun m!552625 () Bool)

(assert (=> b!573631 m!552625))

(assert (=> b!573626 m!552613))

(assert (=> b!573626 m!552613))

(declare-fun m!552627 () Bool)

(assert (=> b!573626 m!552627))

(declare-fun m!552629 () Bool)

(assert (=> b!573628 m!552629))

(declare-fun m!552631 () Bool)

(assert (=> start!52542 m!552631))

(declare-fun m!552633 () Bool)

(assert (=> start!52542 m!552633))

(declare-fun m!552635 () Bool)

(assert (=> b!573635 m!552635))

(assert (=> b!573632 m!552613))

(declare-fun m!552637 () Bool)

(assert (=> b!573632 m!552637))

(declare-fun m!552639 () Bool)

(assert (=> b!573632 m!552639))

(declare-fun m!552641 () Bool)

(assert (=> b!573632 m!552641))

(assert (=> b!573632 m!552613))

(declare-fun m!552643 () Bool)

(assert (=> b!573632 m!552643))

(declare-fun m!552645 () Bool)

(assert (=> b!573637 m!552645))

(declare-fun m!552647 () Bool)

(assert (=> b!573637 m!552647))

(assert (=> b!573627 m!552613))

(assert (=> b!573627 m!552613))

(declare-fun m!552649 () Bool)

(assert (=> b!573627 m!552649))

(assert (=> b!573630 m!552613))

(assert (=> b!573630 m!552639))

(declare-fun m!552651 () Bool)

(assert (=> b!573633 m!552651))

(declare-fun m!552653 () Bool)

(assert (=> b!573638 m!552653))

(declare-fun m!552655 () Bool)

(assert (=> b!573636 m!552655))

(push 1)

(assert (not b!573633))

(assert (not start!52542))

(assert (not b!573628))

(assert (not b!573637))

(assert (not b!573638))

(assert (not b!573631))

(assert (not b!573626))

(assert (not b!573636))

(assert (not b!573627))

(assert (not b!573632))

(assert (not b!573635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!84971 () Bool)

(assert (=> d!84971 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52542 d!84971))

(declare-fun d!84977 () Bool)

(assert (=> d!84977 (= (array_inv!13021 a!3118) (bvsge (size!17589 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52542 d!84977))

(declare-fun b!573728 () Bool)

(declare-fun e!330071 () Bool)

(declare-fun e!330070 () Bool)

(assert (=> b!573728 (= e!330071 e!330070)))

(declare-fun c!65771 () Bool)

(assert (=> b!573728 (= c!65771 (validKeyInArray!0 (select (arr!17225 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32651 () Bool)

(declare-fun call!32654 () Bool)

(assert (=> bm!32651 (= call!32654 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!573730 () Bool)

(declare-fun e!330072 () Bool)

(assert (=> b!573730 (= e!330072 call!32654)))

(declare-fun b!573731 () Bool)

(assert (=> b!573731 (= e!330070 e!330072)))

(declare-fun lt!261999 () (_ BitVec 64))

(assert (=> b!573731 (= lt!261999 (select (arr!17225 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!262000 () Unit!18050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35876 (_ BitVec 64) (_ BitVec 32)) Unit!18050)

(assert (=> b!573731 (= lt!262000 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!261999 #b00000000000000000000000000000000))))

(assert (=> b!573731 (arrayContainsKey!0 a!3118 lt!261999 #b00000000000000000000000000000000)))

(declare-fun lt!261998 () Unit!18050)

(assert (=> b!573731 (= lt!261998 lt!262000)))

(declare-fun res!362905 () Bool)

(assert (=> b!573731 (= res!362905 (= (seekEntryOrOpen!0 (select (arr!17225 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5674 #b00000000000000000000000000000000)))))

(assert (=> b!573731 (=> (not res!362905) (not e!330072))))

(declare-fun b!573729 () Bool)

(assert (=> b!573729 (= e!330070 call!32654)))

(declare-fun d!84979 () Bool)

(declare-fun res!362906 () Bool)

(assert (=> d!84979 (=> res!362906 e!330071)))

(assert (=> d!84979 (= res!362906 (bvsge #b00000000000000000000000000000000 (size!17589 a!3118)))))

(assert (=> d!84979 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!330071)))

(assert (= (and d!84979 (not res!362906)) b!573728))

(assert (= (and b!573728 c!65771) b!573731))

(assert (= (and b!573728 (not c!65771)) b!573729))

(assert (= (and b!573731 res!362905) b!573730))

(assert (= (or b!573730 b!573729) bm!32651))

(declare-fun m!552717 () Bool)

(assert (=> b!573728 m!552717))

(assert (=> b!573728 m!552717))

(declare-fun m!552719 () Bool)

(assert (=> b!573728 m!552719))

(declare-fun m!552721 () Bool)

(assert (=> bm!32651 m!552721))

(assert (=> b!573731 m!552717))

(declare-fun m!552723 () Bool)

(assert (=> b!573731 m!552723))

(declare-fun m!552725 () Bool)

(assert (=> b!573731 m!552725))

(assert (=> b!573731 m!552717))

(declare-fun m!552727 () Bool)

(assert (=> b!573731 m!552727))

(assert (=> b!573635 d!84979))

(declare-fun b!573776 () Bool)

(declare-fun e!330098 () SeekEntryResult!5674)

(declare-fun e!330099 () SeekEntryResult!5674)

(assert (=> b!573776 (= e!330098 e!330099)))

(declare-fun c!65792 () Bool)

(declare-fun lt!262024 () (_ BitVec 64))

(assert (=> b!573776 (= c!65792 (= lt!262024 (select (arr!17225 a!3118) j!142)))))

(declare-fun b!573777 () Bool)

(assert (=> b!573777 (= e!330099 (Found!5674 (index!24925 lt!261961)))))

(declare-fun b!573778 () Bool)

(assert (=> b!573778 (= e!330098 Undefined!5674)))

(declare-fun b!573779 () Bool)

(declare-fun c!65794 () Bool)

(assert (=> b!573779 (= c!65794 (= lt!262024 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330097 () SeekEntryResult!5674)

(assert (=> b!573779 (= e!330099 e!330097)))

(declare-fun lt!262023 () SeekEntryResult!5674)

(declare-fun d!84983 () Bool)

(assert (=> d!84983 (and (or (is-Undefined!5674 lt!262023) (not (is-Found!5674 lt!262023)) (and (bvsge (index!24924 lt!262023) #b00000000000000000000000000000000) (bvslt (index!24924 lt!262023) (size!17589 a!3118)))) (or (is-Undefined!5674 lt!262023) (is-Found!5674 lt!262023) (not (is-MissingVacant!5674 lt!262023)) (not (= (index!24926 lt!262023) (index!24925 lt!261961))) (and (bvsge (index!24926 lt!262023) #b00000000000000000000000000000000) (bvslt (index!24926 lt!262023) (size!17589 a!3118)))) (or (is-Undefined!5674 lt!262023) (ite (is-Found!5674 lt!262023) (= (select (arr!17225 a!3118) (index!24924 lt!262023)) (select (arr!17225 a!3118) j!142)) (and (is-MissingVacant!5674 lt!262023) (= (index!24926 lt!262023) (index!24925 lt!261961)) (= (select (arr!17225 a!3118) (index!24926 lt!262023)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!84983 (= lt!262023 e!330098)))

(declare-fun c!65793 () Bool)

(assert (=> d!84983 (= c!65793 (bvsge (x!53792 lt!261961) #b01111111111111111111111111111110))))

(assert (=> d!84983 (= lt!262024 (select (arr!17225 a!3118) (index!24925 lt!261961)))))

(assert (=> d!84983 (validMask!0 mask!3119)))

(assert (=> d!84983 (= (seekKeyOrZeroReturnVacant!0 (x!53792 lt!261961) (index!24925 lt!261961) (index!24925 lt!261961) (select (arr!17225 a!3118) j!142) a!3118 mask!3119) lt!262023)))

(declare-fun b!573780 () Bool)

(assert (=> b!573780 (= e!330097 (MissingVacant!5674 (index!24925 lt!261961)))))

(declare-fun b!573781 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573781 (= e!330097 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53792 lt!261961) #b00000000000000000000000000000001) (nextIndex!0 (index!24925 lt!261961) (x!53792 lt!261961) mask!3119) (index!24925 lt!261961) (select (arr!17225 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!84983 c!65793) b!573778))

(assert (= (and d!84983 (not c!65793)) b!573776))

(assert (= (and b!573776 c!65792) b!573777))

(assert (= (and b!573776 (not c!65792)) b!573779))

(assert (= (and b!573779 c!65794) b!573780))

(assert (= (and b!573779 (not c!65794)) b!573781))

(declare-fun m!552755 () Bool)

(assert (=> d!84983 m!552755))

(declare-fun m!552757 () Bool)

(assert (=> d!84983 m!552757))

(assert (=> d!84983 m!552639))

(assert (=> d!84983 m!552631))

(declare-fun m!552759 () Bool)

(assert (=> b!573781 m!552759))

(assert (=> b!573781 m!552759))

(assert (=> b!573781 m!552613))

(declare-fun m!552761 () Bool)

(assert (=> b!573781 m!552761))

(assert (=> b!573626 d!84983))

(declare-fun b!573826 () Bool)

(declare-fun e!330125 () SeekEntryResult!5674)

(assert (=> b!573826 (= e!330125 Undefined!5674)))

(declare-fun b!573828 () Bool)

(declare-fun c!65816 () Bool)

(declare-fun lt!262050 () (_ BitVec 64))

(assert (=> b!573828 (= c!65816 (= lt!262050 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330126 () SeekEntryResult!5674)

(declare-fun e!330124 () SeekEntryResult!5674)

(assert (=> b!573828 (= e!330126 e!330124)))

(declare-fun lt!262048 () SeekEntryResult!5674)

(declare-fun b!573829 () Bool)

(assert (=> b!573829 (= e!330124 (seekKeyOrZeroReturnVacant!0 (x!53792 lt!262048) (index!24925 lt!262048) (index!24925 lt!262048) lt!261959 lt!261960 mask!3119))))

(declare-fun b!573830 () Bool)

(assert (=> b!573830 (= e!330126 (Found!5674 (index!24925 lt!262048)))))

(declare-fun b!573831 () Bool)

(assert (=> b!573831 (= e!330124 (MissingZero!5674 (index!24925 lt!262048)))))

(declare-fun b!573827 () Bool)

(assert (=> b!573827 (= e!330125 e!330126)))

(assert (=> b!573827 (= lt!262050 (select (arr!17225 lt!261960) (index!24925 lt!262048)))))

(declare-fun c!65815 () Bool)

(assert (=> b!573827 (= c!65815 (= lt!262050 lt!261959))))

(declare-fun d!84995 () Bool)

(declare-fun lt!262049 () SeekEntryResult!5674)

(assert (=> d!84995 (and (or (is-Undefined!5674 lt!262049) (not (is-Found!5674 lt!262049)) (and (bvsge (index!24924 lt!262049) #b00000000000000000000000000000000) (bvslt (index!24924 lt!262049) (size!17589 lt!261960)))) (or (is-Undefined!5674 lt!262049) (is-Found!5674 lt!262049) (not (is-MissingZero!5674 lt!262049)) (and (bvsge (index!24923 lt!262049) #b00000000000000000000000000000000) (bvslt (index!24923 lt!262049) (size!17589 lt!261960)))) (or (is-Undefined!5674 lt!262049) (is-Found!5674 lt!262049) (is-MissingZero!5674 lt!262049) (not (is-MissingVacant!5674 lt!262049)) (and (bvsge (index!24926 lt!262049) #b00000000000000000000000000000000) (bvslt (index!24926 lt!262049) (size!17589 lt!261960)))) (or (is-Undefined!5674 lt!262049) (ite (is-Found!5674 lt!262049) (= (select (arr!17225 lt!261960) (index!24924 lt!262049)) lt!261959) (ite (is-MissingZero!5674 lt!262049) (= (select (arr!17225 lt!261960) (index!24923 lt!262049)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5674 lt!262049) (= (select (arr!17225 lt!261960) (index!24926 lt!262049)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84995 (= lt!262049 e!330125)))

(declare-fun c!65817 () Bool)

(assert (=> d!84995 (= c!65817 (and (is-Intermediate!5674 lt!262048) (undefined!6486 lt!262048)))))

(assert (=> d!84995 (= lt!262048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!261959 mask!3119) lt!261959 lt!261960 mask!3119))))

(assert (=> d!84995 (validMask!0 mask!3119)))

(assert (=> d!84995 (= (seekEntryOrOpen!0 lt!261959 lt!261960 mask!3119) lt!262049)))

(assert (= (and d!84995 c!65817) b!573826))

(assert (= (and d!84995 (not c!65817)) b!573827))

(assert (= (and b!573827 c!65815) b!573830))

(assert (= (and b!573827 (not c!65815)) b!573828))

(assert (= (and b!573828 c!65816) b!573831))

(assert (= (and b!573828 (not c!65816)) b!573829))

(declare-fun m!552793 () Bool)

(assert (=> b!573829 m!552793))

(declare-fun m!552795 () Bool)

(assert (=> b!573827 m!552795))

(assert (=> d!84995 m!552623))

(declare-fun m!552797 () Bool)

(assert (=> d!84995 m!552797))

(assert (=> d!84995 m!552631))

(assert (=> d!84995 m!552623))

(declare-fun m!552799 () Bool)

(assert (=> d!84995 m!552799))

(declare-fun m!552801 () Bool)

(assert (=> d!84995 m!552801))

(declare-fun m!552803 () Bool)

(assert (=> d!84995 m!552803))

(assert (=> b!573637 d!84995))

(declare-fun b!573832 () Bool)

(declare-fun e!330128 () SeekEntryResult!5674)

(declare-fun e!330129 () SeekEntryResult!5674)

(assert (=> b!573832 (= e!330128 e!330129)))

(declare-fun c!65818 () Bool)

(declare-fun lt!262052 () (_ BitVec 64))

(assert (=> b!573832 (= c!65818 (= lt!262052 lt!261959))))

(declare-fun b!573833 () Bool)

(assert (=> b!573833 (= e!330129 (Found!5674 (index!24925 lt!261961)))))

(declare-fun b!573834 () Bool)

(assert (=> b!573834 (= e!330128 Undefined!5674)))

(declare-fun b!573835 () Bool)

(declare-fun c!65820 () Bool)

(assert (=> b!573835 (= c!65820 (= lt!262052 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330127 () SeekEntryResult!5674)

(assert (=> b!573835 (= e!330129 e!330127)))

(declare-fun d!85013 () Bool)

(declare-fun lt!262051 () SeekEntryResult!5674)

(assert (=> d!85013 (and (or (is-Undefined!5674 lt!262051) (not (is-Found!5674 lt!262051)) (and (bvsge (index!24924 lt!262051) #b00000000000000000000000000000000) (bvslt (index!24924 lt!262051) (size!17589 lt!261960)))) (or (is-Undefined!5674 lt!262051) (is-Found!5674 lt!262051) (not (is-MissingVacant!5674 lt!262051)) (not (= (index!24926 lt!262051) (index!24925 lt!261961))) (and (bvsge (index!24926 lt!262051) #b00000000000000000000000000000000) (bvslt (index!24926 lt!262051) (size!17589 lt!261960)))) (or (is-Undefined!5674 lt!262051) (ite (is-Found!5674 lt!262051) (= (select (arr!17225 lt!261960) (index!24924 lt!262051)) lt!261959) (and (is-MissingVacant!5674 lt!262051) (= (index!24926 lt!262051) (index!24925 lt!261961)) (= (select (arr!17225 lt!261960) (index!24926 lt!262051)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!85013 (= lt!262051 e!330128)))

(declare-fun c!65819 () Bool)

(assert (=> d!85013 (= c!65819 (bvsge (x!53792 lt!261961) #b01111111111111111111111111111110))))

(assert (=> d!85013 (= lt!262052 (select (arr!17225 lt!261960) (index!24925 lt!261961)))))

(assert (=> d!85013 (validMask!0 mask!3119)))

(assert (=> d!85013 (= (seekKeyOrZeroReturnVacant!0 (x!53792 lt!261961) (index!24925 lt!261961) (index!24925 lt!261961) lt!261959 lt!261960 mask!3119) lt!262051)))

(declare-fun b!573836 () Bool)

(assert (=> b!573836 (= e!330127 (MissingVacant!5674 (index!24925 lt!261961)))))

(declare-fun b!573837 () Bool)

(assert (=> b!573837 (= e!330127 (seekKeyOrZeroReturnVacant!0 (bvadd (x!53792 lt!261961) #b00000000000000000000000000000001) (nextIndex!0 (index!24925 lt!261961) (x!53792 lt!261961) mask!3119) (index!24925 lt!261961) lt!261959 lt!261960 mask!3119))))

(assert (= (and d!85013 c!65819) b!573834))

(assert (= (and d!85013 (not c!65819)) b!573832))

(assert (= (and b!573832 c!65818) b!573833))

(assert (= (and b!573832 (not c!65818)) b!573835))

(assert (= (and b!573835 c!65820) b!573836))

(assert (= (and b!573835 (not c!65820)) b!573837))

(declare-fun m!552805 () Bool)

(assert (=> d!85013 m!552805))

(declare-fun m!552807 () Bool)

(assert (=> d!85013 m!552807))

(declare-fun m!552809 () Bool)

(assert (=> d!85013 m!552809))

(assert (=> d!85013 m!552631))

(assert (=> b!573837 m!552759))

(assert (=> b!573837 m!552759))

(declare-fun m!552811 () Bool)

(assert (=> b!573837 m!552811))

(assert (=> b!573637 d!85013))

(declare-fun d!85017 () Bool)

(assert (=> d!85017 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!573636 d!85017))

(declare-fun d!85019 () Bool)

(declare-fun e!330172 () Bool)

(assert (=> d!85019 e!330172))

(declare-fun c!65844 () Bool)

(declare-fun lt!262073 () SeekEntryResult!5674)

(assert (=> d!85019 (= c!65844 (and (is-Intermediate!5674 lt!262073) (undefined!6486 lt!262073)))))

(declare-fun e!330173 () SeekEntryResult!5674)

(assert (=> d!85019 (= lt!262073 e!330173)))

(declare-fun c!65842 () Bool)

(assert (=> d!85019 (= c!65842 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262074 () (_ BitVec 64))

(assert (=> d!85019 (= lt!262074 (select (arr!17225 lt!261960) lt!261956))))

(assert (=> d!85019 (validMask!0 mask!3119)))

(assert (=> d!85019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261956 lt!261959 lt!261960 mask!3119) lt!262073)))

(declare-fun b!573907 () Bool)

(declare-fun e!330175 () SeekEntryResult!5674)

(assert (=> b!573907 (= e!330175 (Intermediate!5674 false lt!261956 #b00000000000000000000000000000000))))

(declare-fun b!573908 () Bool)

(assert (=> b!573908 (and (bvsge (index!24925 lt!262073) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262073) (size!17589 lt!261960)))))

(declare-fun res!362945 () Bool)

(assert (=> b!573908 (= res!362945 (= (select (arr!17225 lt!261960) (index!24925 lt!262073)) lt!261959))))

(declare-fun e!330176 () Bool)

(assert (=> b!573908 (=> res!362945 e!330176)))

(declare-fun e!330174 () Bool)

(assert (=> b!573908 (= e!330174 e!330176)))

(declare-fun b!573909 () Bool)

(assert (=> b!573909 (= e!330173 e!330175)))

(declare-fun c!65843 () Bool)

(assert (=> b!573909 (= c!65843 (or (= lt!262074 lt!261959) (= (bvadd lt!262074 lt!262074) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573910 () Bool)

(assert (=> b!573910 (and (bvsge (index!24925 lt!262073) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262073) (size!17589 lt!261960)))))

(declare-fun res!362944 () Bool)

(assert (=> b!573910 (= res!362944 (= (select (arr!17225 lt!261960) (index!24925 lt!262073)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573910 (=> res!362944 e!330176)))

(declare-fun b!573911 () Bool)

(assert (=> b!573911 (= e!330173 (Intermediate!5674 true lt!261956 #b00000000000000000000000000000000))))

(declare-fun b!573912 () Bool)

(assert (=> b!573912 (= e!330172 (bvsge (x!53792 lt!262073) #b01111111111111111111111111111110))))

(declare-fun b!573913 () Bool)

(assert (=> b!573913 (= e!330172 e!330174)))

(declare-fun res!362943 () Bool)

(assert (=> b!573913 (= res!362943 (and (is-Intermediate!5674 lt!262073) (not (undefined!6486 lt!262073)) (bvslt (x!53792 lt!262073) #b01111111111111111111111111111110) (bvsge (x!53792 lt!262073) #b00000000000000000000000000000000) (bvsge (x!53792 lt!262073) #b00000000000000000000000000000000)))))

(assert (=> b!573913 (=> (not res!362943) (not e!330174))))

(declare-fun b!573914 () Bool)

(assert (=> b!573914 (= e!330175 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261956 #b00000000000000000000000000000000 mask!3119) lt!261959 lt!261960 mask!3119))))

(declare-fun b!573915 () Bool)

(assert (=> b!573915 (and (bvsge (index!24925 lt!262073) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262073) (size!17589 lt!261960)))))

(assert (=> b!573915 (= e!330176 (= (select (arr!17225 lt!261960) (index!24925 lt!262073)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!85019 c!65842) b!573911))

(assert (= (and d!85019 (not c!65842)) b!573909))

(assert (= (and b!573909 c!65843) b!573907))

(assert (= (and b!573909 (not c!65843)) b!573914))

(assert (= (and d!85019 c!65844) b!573912))

(assert (= (and d!85019 (not c!65844)) b!573913))

(assert (= (and b!573913 res!362943) b!573908))

(assert (= (and b!573908 (not res!362945)) b!573910))

(assert (= (and b!573910 (not res!362944)) b!573915))

(declare-fun m!552833 () Bool)

(assert (=> d!85019 m!552833))

(assert (=> d!85019 m!552631))

(declare-fun m!552835 () Bool)

(assert (=> b!573915 m!552835))

(assert (=> b!573908 m!552835))

(assert (=> b!573910 m!552835))

(declare-fun m!552837 () Bool)

(assert (=> b!573914 m!552837))

(assert (=> b!573914 m!552837))

(declare-fun m!552839 () Bool)

(assert (=> b!573914 m!552839))

(assert (=> b!573631 d!85019))

(declare-fun d!85029 () Bool)

(declare-fun e!330181 () Bool)

(assert (=> d!85029 e!330181))

(declare-fun c!65851 () Bool)

(declare-fun lt!262079 () SeekEntryResult!5674)

(assert (=> d!85029 (= c!65851 (and (is-Intermediate!5674 lt!262079) (undefined!6486 lt!262079)))))

(declare-fun e!330182 () SeekEntryResult!5674)

(assert (=> d!85029 (= lt!262079 e!330182)))

(declare-fun c!65849 () Bool)

(assert (=> d!85029 (= c!65849 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!262080 () (_ BitVec 64))

(assert (=> d!85029 (= lt!262080 (select (arr!17225 a!3118) lt!261957))))

(assert (=> d!85029 (validMask!0 mask!3119)))

(assert (=> d!85029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261957 (select (arr!17225 a!3118) j!142) a!3118 mask!3119) lt!262079)))

(declare-fun b!573924 () Bool)

(declare-fun e!330184 () SeekEntryResult!5674)

(assert (=> b!573924 (= e!330184 (Intermediate!5674 false lt!261957 #b00000000000000000000000000000000))))

(declare-fun b!573925 () Bool)

(assert (=> b!573925 (and (bvsge (index!24925 lt!262079) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262079) (size!17589 a!3118)))))

(declare-fun res!362948 () Bool)

(assert (=> b!573925 (= res!362948 (= (select (arr!17225 a!3118) (index!24925 lt!262079)) (select (arr!17225 a!3118) j!142)))))

(declare-fun e!330185 () Bool)

(assert (=> b!573925 (=> res!362948 e!330185)))

(declare-fun e!330183 () Bool)

(assert (=> b!573925 (= e!330183 e!330185)))

(declare-fun b!573926 () Bool)

(assert (=> b!573926 (= e!330182 e!330184)))

(declare-fun c!65850 () Bool)

(assert (=> b!573926 (= c!65850 (or (= lt!262080 (select (arr!17225 a!3118) j!142)) (= (bvadd lt!262080 lt!262080) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!573927 () Bool)

(assert (=> b!573927 (and (bvsge (index!24925 lt!262079) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262079) (size!17589 a!3118)))))

(declare-fun res!362947 () Bool)

(assert (=> b!573927 (= res!362947 (= (select (arr!17225 a!3118) (index!24925 lt!262079)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!573927 (=> res!362947 e!330185)))

(declare-fun b!573928 () Bool)

(assert (=> b!573928 (= e!330182 (Intermediate!5674 true lt!261957 #b00000000000000000000000000000000))))

(declare-fun b!573929 () Bool)

(assert (=> b!573929 (= e!330181 (bvsge (x!53792 lt!262079) #b01111111111111111111111111111110))))

(declare-fun b!573930 () Bool)

(assert (=> b!573930 (= e!330181 e!330183)))

(declare-fun res!362946 () Bool)

(assert (=> b!573930 (= res!362946 (and (is-Intermediate!5674 lt!262079) (not (undefined!6486 lt!262079)) (bvslt (x!53792 lt!262079) #b01111111111111111111111111111110) (bvsge (x!53792 lt!262079) #b00000000000000000000000000000000) (bvsge (x!53792 lt!262079) #b00000000000000000000000000000000)))))

(assert (=> b!573930 (=> (not res!362946) (not e!330183))))

(declare-fun b!573931 () Bool)

(assert (=> b!573931 (= e!330184 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!261957 #b00000000000000000000000000000000 mask!3119) (select (arr!17225 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!573932 () Bool)

(assert (=> b!573932 (and (bvsge (index!24925 lt!262079) #b00000000000000000000000000000000) (bvslt (index!24925 lt!262079) (size!17589 a!3118)))))

(assert (=> b!573932 (= e!330185 (= (select (arr!17225 a!3118) (index!24925 lt!262079)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!85029 c!65849) b!573928))

(assert (= (and d!85029 (not c!65849)) b!573926))

(assert (= (and b!573926 c!65850) b!573924))

(assert (= (and b!573926 (not c!65850)) b!573931))

(assert (= (and d!85029 c!65851) b!573929))

(assert (= (and d!85029 (not c!65851)) b!573930))

(assert (= (and b!573930 res!362946) b!573925))

(assert (= (and b!573925 (not res!362948)) b!573927))

(assert (= (and b!573927 (not res!362947)) b!573932))

(declare-fun m!552841 () Bool)

(assert (=> d!85029 m!552841))

(assert (=> d!85029 m!552631))

(declare-fun m!552843 () Bool)

(assert (=> b!573932 m!552843))

(assert (=> b!573925 m!552843))

(assert (=> b!573927 m!552843))

(declare-fun m!552845 () Bool)

(assert (=> b!573931 m!552845))

(assert (=> b!573931 m!552845))

(assert (=> b!573931 m!552613))

(declare-fun m!552847 () Bool)

(assert (=> b!573931 m!552847))

(assert (=> b!573631 d!85029))

(declare-fun d!85031 () Bool)

(declare-fun lt!262090 () (_ BitVec 32))

(declare-fun lt!262089 () (_ BitVec 32))

(assert (=> d!85031 (= lt!262090 (bvmul (bvxor lt!262089 (bvlshr lt!262089 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85031 (= lt!262089 ((_ extract 31 0) (bvand (bvxor lt!261959 (bvlshr lt!261959 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85031 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362955 (let ((h!12333 ((_ extract 31 0) (bvand (bvxor lt!261959 (bvlshr lt!261959 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53800 (bvmul (bvxor h!12333 (bvlshr h!12333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53800 (bvlshr x!53800 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362955 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362955 #b00000000000000000000000000000000))))))

(assert (=> d!85031 (= (toIndex!0 lt!261959 mask!3119) (bvand (bvxor lt!262090 (bvlshr lt!262090 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573631 d!85031))

(declare-fun d!85035 () Bool)

(declare-fun lt!262092 () (_ BitVec 32))

(declare-fun lt!262091 () (_ BitVec 32))

(assert (=> d!85035 (= lt!262092 (bvmul (bvxor lt!262091 (bvlshr lt!262091 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85035 (= lt!262091 ((_ extract 31 0) (bvand (bvxor (select (arr!17225 a!3118) j!142) (bvlshr (select (arr!17225 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85035 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!362955 (let ((h!12333 ((_ extract 31 0) (bvand (bvxor (select (arr!17225 a!3118) j!142) (bvlshr (select (arr!17225 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53800 (bvmul (bvxor h!12333 (bvlshr h!12333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53800 (bvlshr x!53800 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!362955 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!362955 #b00000000000000000000000000000000))))))

(assert (=> d!85035 (= (toIndex!0 (select (arr!17225 a!3118) j!142) mask!3119) (bvand (bvxor lt!262092 (bvlshr lt!262092 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!573631 d!85035))

(declare-fun b!573977 () Bool)

(declare-fun e!330213 () Bool)

(declare-fun contains!2888 (List!11305 (_ BitVec 64)) Bool)

(assert (=> b!573977 (= e!330213 (contains!2888 Nil!11302 (select (arr!17225 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573978 () Bool)

(declare-fun e!330216 () Bool)

(declare-fun e!330214 () Bool)

(assert (=> b!573978 (= e!330216 e!330214)))

(declare-fun c!65865 () Bool)

(assert (=> b!573978 (= c!65865 (validKeyInArray!0 (select (arr!17225 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32661 () Bool)

(declare-fun call!32664 () Bool)

(assert (=> bm!32661 (= call!32664 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65865 (Cons!11301 (select (arr!17225 a!3118) #b00000000000000000000000000000000) Nil!11302) Nil!11302)))))

(declare-fun d!85037 () Bool)

(declare-fun res!362969 () Bool)

(declare-fun e!330215 () Bool)

(assert (=> d!85037 (=> res!362969 e!330215)))

(assert (=> d!85037 (= res!362969 (bvsge #b00000000000000000000000000000000 (size!17589 a!3118)))))

(assert (=> d!85037 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11302) e!330215)))

(declare-fun b!573979 () Bool)

(assert (=> b!573979 (= e!330215 e!330216)))

(declare-fun res!362970 () Bool)

(assert (=> b!573979 (=> (not res!362970) (not e!330216))))

(assert (=> b!573979 (= res!362970 (not e!330213))))

(declare-fun res!362971 () Bool)

(assert (=> b!573979 (=> (not res!362971) (not e!330213))))

(assert (=> b!573979 (= res!362971 (validKeyInArray!0 (select (arr!17225 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!573980 () Bool)

(assert (=> b!573980 (= e!330214 call!32664)))

(declare-fun b!573981 () Bool)

(assert (=> b!573981 (= e!330214 call!32664)))

(assert (= (and d!85037 (not res!362969)) b!573979))

(assert (= (and b!573979 res!362971) b!573977))

(assert (= (and b!573979 res!362970) b!573978))

(assert (= (and b!573978 c!65865) b!573980))

(assert (= (and b!573978 (not c!65865)) b!573981))

(assert (= (or b!573980 b!573981) bm!32661))

(assert (=> b!573977 m!552717))

(assert (=> b!573977 m!552717))

(declare-fun m!552877 () Bool)

(assert (=> b!573977 m!552877))

(assert (=> b!573978 m!552717))

(assert (=> b!573978 m!552717))

(assert (=> b!573978 m!552719))

(assert (=> bm!32661 m!552717))

(declare-fun m!552879 () Bool)

(assert (=> bm!32661 m!552879))

(assert (=> b!573979 m!552717))

(assert (=> b!573979 m!552717))

(assert (=> b!573979 m!552719))

(assert (=> b!573638 d!85037))

(declare-fun d!85047 () Bool)

(declare-fun res!362978 () Bool)

(declare-fun e!330230 () Bool)

(assert (=> d!85047 (=> res!362978 e!330230)))

(assert (=> d!85047 (= res!362978 (= (select (arr!17225 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!85047 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!330230)))

(declare-fun b!574002 () Bool)

(declare-fun e!330231 () Bool)

(assert (=> b!574002 (= e!330230 e!330231)))

(declare-fun res!362979 () Bool)

(assert (=> b!574002 (=> (not res!362979) (not e!330231))))

(assert (=> b!574002 (= res!362979 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17589 a!3118)))))

(declare-fun b!574003 () Bool)

(assert (=> b!574003 (= e!330231 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85047 (not res!362978)) b!574002))

(assert (= (and b!574002 res!362979) b!574003))

(assert (=> d!85047 m!552717))

(declare-fun m!552907 () Bool)

(assert (=> b!574003 m!552907))

(assert (=> b!573633 d!85047))

(declare-fun b!574004 () Bool)

(declare-fun e!330233 () SeekEntryResult!5674)

(assert (=> b!574004 (= e!330233 Undefined!5674)))

(declare-fun b!574006 () Bool)

(declare-fun c!65874 () Bool)

(declare-fun lt!262114 () (_ BitVec 64))

(assert (=> b!574006 (= c!65874 (= lt!262114 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!330234 () SeekEntryResult!5674)

(declare-fun e!330232 () SeekEntryResult!5674)

(assert (=> b!574006 (= e!330234 e!330232)))

(declare-fun lt!262112 () SeekEntryResult!5674)

(declare-fun b!574007 () Bool)

(assert (=> b!574007 (= e!330232 (seekKeyOrZeroReturnVacant!0 (x!53792 lt!262112) (index!24925 lt!262112) (index!24925 lt!262112) (select (arr!17225 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!574008 () Bool)

(assert (=> b!574008 (= e!330234 (Found!5674 (index!24925 lt!262112)))))

(declare-fun b!574009 () Bool)

(assert (=> b!574009 (= e!330232 (MissingZero!5674 (index!24925 lt!262112)))))

(declare-fun b!574005 () Bool)

(assert (=> b!574005 (= e!330233 e!330234)))

(assert (=> b!574005 (= lt!262114 (select (arr!17225 a!3118) (index!24925 lt!262112)))))

(declare-fun c!65873 () Bool)

(assert (=> b!574005 (= c!65873 (= lt!262114 (select (arr!17225 a!3118) j!142)))))

(declare-fun d!85057 () Bool)

(declare-fun lt!262113 () SeekEntryResult!5674)

(assert (=> d!85057 (and (or (is-Undefined!5674 lt!262113) (not (is-Found!5674 lt!262113)) (and (bvsge (index!24924 lt!262113) #b00000000000000000000000000000000) (bvslt (index!24924 lt!262113) (size!17589 a!3118)))) (or (is-Undefined!5674 lt!262113) (is-Found!5674 lt!262113) (not (is-MissingZero!5674 lt!262113)) (and (bvsge (index!24923 lt!262113) #b00000000000000000000000000000000) (bvslt (index!24923 lt!262113) (size!17589 a!3118)))) (or (is-Undefined!5674 lt!262113) (is-Found!5674 lt!262113) (is-MissingZero!5674 lt!262113) (not (is-MissingVacant!5674 lt!262113)) (and (bvsge (index!24926 lt!262113) #b00000000000000000000000000000000) (bvslt (index!24926 lt!262113) (size!17589 a!3118)))) (or (is-Undefined!5674 lt!262113) (ite (is-Found!5674 lt!262113) (= (select (arr!17225 a!3118) (index!24924 lt!262113)) (select (arr!17225 a!3118) j!142)) (ite (is-MissingZero!5674 lt!262113) (= (select (arr!17225 a!3118) (index!24923 lt!262113)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5674 lt!262113) (= (select (arr!17225 a!3118) (index!24926 lt!262113)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

