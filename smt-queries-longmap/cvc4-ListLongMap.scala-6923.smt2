; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86958 () Bool)

(assert start!86958)

(declare-fun b!1008893 () Bool)

(declare-fun e!567613 () Bool)

(declare-fun e!567608 () Bool)

(assert (=> b!1008893 (= e!567613 e!567608)))

(declare-fun res!677791 () Bool)

(assert (=> b!1008893 (=> (not res!677791) (not e!567608))))

(declare-datatypes ((SeekEntryResult!9556 0))(
  ( (MissingZero!9556 (index!40595 (_ BitVec 32))) (Found!9556 (index!40596 (_ BitVec 32))) (Intermediate!9556 (undefined!10368 Bool) (index!40597 (_ BitVec 32)) (x!87978 (_ BitVec 32))) (Undefined!9556) (MissingVacant!9556 (index!40598 (_ BitVec 32))) )
))
(declare-fun lt!445925 () SeekEntryResult!9556)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008893 (= res!677791 (or (= lt!445925 (MissingVacant!9556 i!1194)) (= lt!445925 (MissingZero!9556 i!1194))))))

(declare-datatypes ((array!63606 0))(
  ( (array!63607 (arr!30624 (Array (_ BitVec 32) (_ BitVec 64))) (size!31126 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63606)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63606 (_ BitVec 32)) SeekEntryResult!9556)

(assert (=> b!1008893 (= lt!445925 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008894 () Bool)

(declare-fun e!567610 () Bool)

(assert (=> b!1008894 (= e!567608 e!567610)))

(declare-fun res!677790 () Bool)

(assert (=> b!1008894 (=> (not res!677790) (not e!567610))))

(declare-fun lt!445931 () SeekEntryResult!9556)

(declare-fun lt!445926 () SeekEntryResult!9556)

(assert (=> b!1008894 (= res!677790 (= lt!445931 lt!445926))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008894 (= lt!445926 (Intermediate!9556 false resIndex!38 resX!38))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63606 (_ BitVec 32)) SeekEntryResult!9556)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008894 (= lt!445931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30624 a!3219) j!170) mask!3464) (select (arr!30624 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008895 () Bool)

(declare-fun res!677792 () Bool)

(assert (=> b!1008895 (=> (not res!677792) (not e!567613))))

(declare-fun arrayContainsKey!0 (array!63606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008895 (= res!677792 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008896 () Bool)

(declare-fun res!677797 () Bool)

(assert (=> b!1008896 (=> (not res!677797) (not e!567613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008896 (= res!677797 (validKeyInArray!0 (select (arr!30624 a!3219) j!170)))))

(declare-fun b!1008897 () Bool)

(declare-fun res!677798 () Bool)

(declare-fun e!567611 () Bool)

(assert (=> b!1008897 (=> (not res!677798) (not e!567611))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445929 () (_ BitVec 64))

(declare-fun lt!445930 () array!63606)

(declare-fun lt!445928 () SeekEntryResult!9556)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1008897 (= res!677798 (not (= lt!445928 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445929 lt!445930 mask!3464))))))

(declare-fun res!677794 () Bool)

(assert (=> start!86958 (=> (not res!677794) (not e!567613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86958 (= res!677794 (validMask!0 mask!3464))))

(assert (=> start!86958 e!567613))

(declare-fun array_inv!23748 (array!63606) Bool)

(assert (=> start!86958 (array_inv!23748 a!3219)))

(assert (=> start!86958 true))

(declare-fun b!1008898 () Bool)

(declare-fun res!677793 () Bool)

(assert (=> b!1008898 (=> (not res!677793) (not e!567608))))

(declare-datatypes ((List!21300 0))(
  ( (Nil!21297) (Cons!21296 (h!22482 (_ BitVec 64)) (t!30301 List!21300)) )
))
(declare-fun arrayNoDuplicates!0 (array!63606 (_ BitVec 32) List!21300) Bool)

(assert (=> b!1008898 (= res!677793 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21297))))

(declare-fun b!1008899 () Bool)

(declare-fun res!677796 () Bool)

(assert (=> b!1008899 (=> (not res!677796) (not e!567611))))

(assert (=> b!1008899 (= res!677796 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008900 () Bool)

(declare-fun e!567612 () Bool)

(assert (=> b!1008900 (= e!567610 e!567612)))

(declare-fun res!677789 () Bool)

(assert (=> b!1008900 (=> (not res!677789) (not e!567612))))

(assert (=> b!1008900 (= res!677789 (= lt!445928 lt!445926))))

(assert (=> b!1008900 (= lt!445928 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30624 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008901 () Bool)

(assert (=> b!1008901 (= e!567611 (bvsgt (bvadd #b00000000000000000000000000000001 x!1245) resX!38))))

(declare-fun lt!445927 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008901 (= lt!445927 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008902 () Bool)

(declare-fun res!677788 () Bool)

(assert (=> b!1008902 (=> (not res!677788) (not e!567608))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63606 (_ BitVec 32)) Bool)

(assert (=> b!1008902 (= res!677788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008903 () Bool)

(declare-fun res!677795 () Bool)

(assert (=> b!1008903 (=> (not res!677795) (not e!567613))))

(assert (=> b!1008903 (= res!677795 (and (= (size!31126 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31126 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31126 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008904 () Bool)

(declare-fun res!677787 () Bool)

(assert (=> b!1008904 (=> (not res!677787) (not e!567613))))

(assert (=> b!1008904 (= res!677787 (validKeyInArray!0 k!2224))))

(declare-fun b!1008905 () Bool)

(assert (=> b!1008905 (= e!567612 e!567611)))

(declare-fun res!677786 () Bool)

(assert (=> b!1008905 (=> (not res!677786) (not e!567611))))

(assert (=> b!1008905 (= res!677786 (not (= lt!445931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445929 mask!3464) lt!445929 lt!445930 mask!3464))))))

(assert (=> b!1008905 (= lt!445929 (select (store (arr!30624 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008905 (= lt!445930 (array!63607 (store (arr!30624 a!3219) i!1194 k!2224) (size!31126 a!3219)))))

(declare-fun b!1008906 () Bool)

(declare-fun res!677799 () Bool)

(assert (=> b!1008906 (=> (not res!677799) (not e!567608))))

(assert (=> b!1008906 (= res!677799 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31126 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31126 a!3219))))))

(assert (= (and start!86958 res!677794) b!1008903))

(assert (= (and b!1008903 res!677795) b!1008896))

(assert (= (and b!1008896 res!677797) b!1008904))

(assert (= (and b!1008904 res!677787) b!1008895))

(assert (= (and b!1008895 res!677792) b!1008893))

(assert (= (and b!1008893 res!677791) b!1008902))

(assert (= (and b!1008902 res!677788) b!1008898))

(assert (= (and b!1008898 res!677793) b!1008906))

(assert (= (and b!1008906 res!677799) b!1008894))

(assert (= (and b!1008894 res!677790) b!1008900))

(assert (= (and b!1008900 res!677789) b!1008905))

(assert (= (and b!1008905 res!677786) b!1008897))

(assert (= (and b!1008897 res!677798) b!1008899))

(assert (= (and b!1008899 res!677796) b!1008901))

(declare-fun m!933575 () Bool)

(assert (=> b!1008904 m!933575))

(declare-fun m!933577 () Bool)

(assert (=> b!1008902 m!933577))

(declare-fun m!933579 () Bool)

(assert (=> b!1008901 m!933579))

(declare-fun m!933581 () Bool)

(assert (=> b!1008897 m!933581))

(declare-fun m!933583 () Bool)

(assert (=> b!1008894 m!933583))

(assert (=> b!1008894 m!933583))

(declare-fun m!933585 () Bool)

(assert (=> b!1008894 m!933585))

(assert (=> b!1008894 m!933585))

(assert (=> b!1008894 m!933583))

(declare-fun m!933587 () Bool)

(assert (=> b!1008894 m!933587))

(assert (=> b!1008896 m!933583))

(assert (=> b!1008896 m!933583))

(declare-fun m!933589 () Bool)

(assert (=> b!1008896 m!933589))

(declare-fun m!933591 () Bool)

(assert (=> b!1008895 m!933591))

(declare-fun m!933593 () Bool)

(assert (=> b!1008905 m!933593))

(assert (=> b!1008905 m!933593))

(declare-fun m!933595 () Bool)

(assert (=> b!1008905 m!933595))

(declare-fun m!933597 () Bool)

(assert (=> b!1008905 m!933597))

(declare-fun m!933599 () Bool)

(assert (=> b!1008905 m!933599))

(declare-fun m!933601 () Bool)

(assert (=> b!1008893 m!933601))

(declare-fun m!933603 () Bool)

(assert (=> start!86958 m!933603))

(declare-fun m!933605 () Bool)

(assert (=> start!86958 m!933605))

(declare-fun m!933607 () Bool)

(assert (=> b!1008898 m!933607))

(assert (=> b!1008900 m!933583))

(assert (=> b!1008900 m!933583))

(declare-fun m!933609 () Bool)

(assert (=> b!1008900 m!933609))

(push 1)

(assert (not b!1008904))

(assert (not b!1008896))

(assert (not b!1008902))

(assert (not start!86958))

(assert (not b!1008895))

(assert (not b!1008898))

(assert (not b!1008900))

(assert (not b!1008905))

(assert (not b!1008893))

(assert (not b!1008901))

(assert (not b!1008897))

(assert (not b!1008894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1008997 () Bool)

(declare-fun e!567675 () SeekEntryResult!9556)

(assert (=> b!1008997 (= e!567675 (Intermediate!9556 false index!1507 x!1245))))

(declare-fun b!1008998 () Bool)

(declare-fun e!567677 () Bool)

(declare-fun e!567674 () Bool)

(assert (=> b!1008998 (= e!567677 e!567674)))

(declare-fun res!677843 () Bool)

(declare-fun lt!445950 () SeekEntryResult!9556)

(assert (=> b!1008998 (= res!677843 (and (is-Intermediate!9556 lt!445950) (not (undefined!10368 lt!445950)) (bvslt (x!87978 lt!445950) #b01111111111111111111111111111110) (bvsge (x!87978 lt!445950) #b00000000000000000000000000000000) (bvsge (x!87978 lt!445950) x!1245)))))

(assert (=> b!1008998 (=> (not res!677843) (not e!567674))))

(declare-fun b!1008999 () Bool)

(assert (=> b!1008999 (and (bvsge (index!40597 lt!445950) #b00000000000000000000000000000000) (bvslt (index!40597 lt!445950) (size!31126 lt!445930)))))

(declare-fun res!677844 () Bool)

(assert (=> b!1008999 (= res!677844 (= (select (arr!30624 lt!445930) (index!40597 lt!445950)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567678 () Bool)

(assert (=> b!1008999 (=> res!677844 e!567678)))

(declare-fun b!1009000 () Bool)

(declare-fun e!567676 () SeekEntryResult!9556)

(assert (=> b!1009000 (= e!567676 e!567675)))

(declare-fun c!101730 () Bool)

(declare-fun lt!445951 () (_ BitVec 64))

(assert (=> b!1009000 (= c!101730 (or (= lt!445951 lt!445929) (= (bvadd lt!445951 lt!445951) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009001 () Bool)

(assert (=> b!1009001 (= e!567676 (Intermediate!9556 true index!1507 x!1245))))

(declare-fun b!1009002 () Bool)

(assert (=> b!1009002 (= e!567675 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!445929 lt!445930 mask!3464))))

(declare-fun d!119723 () Bool)

(assert (=> d!119723 e!567677))

(declare-fun c!101731 () Bool)

(assert (=> d!119723 (= c!101731 (and (is-Intermediate!9556 lt!445950) (undefined!10368 lt!445950)))))

(assert (=> d!119723 (= lt!445950 e!567676)))

(declare-fun c!101732 () Bool)

(assert (=> d!119723 (= c!101732 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119723 (= lt!445951 (select (arr!30624 lt!445930) index!1507))))

(assert (=> d!119723 (validMask!0 mask!3464)))

(assert (=> d!119723 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445929 lt!445930 mask!3464) lt!445950)))

(declare-fun b!1009003 () Bool)

(assert (=> b!1009003 (and (bvsge (index!40597 lt!445950) #b00000000000000000000000000000000) (bvslt (index!40597 lt!445950) (size!31126 lt!445930)))))

(declare-fun res!677845 () Bool)

(assert (=> b!1009003 (= res!677845 (= (select (arr!30624 lt!445930) (index!40597 lt!445950)) lt!445929))))

(assert (=> b!1009003 (=> res!677845 e!567678)))

(assert (=> b!1009003 (= e!567674 e!567678)))

(declare-fun b!1009004 () Bool)

(assert (=> b!1009004 (= e!567677 (bvsge (x!87978 lt!445950) #b01111111111111111111111111111110))))

(declare-fun b!1009005 () Bool)

(assert (=> b!1009005 (and (bvsge (index!40597 lt!445950) #b00000000000000000000000000000000) (bvslt (index!40597 lt!445950) (size!31126 lt!445930)))))

(assert (=> b!1009005 (= e!567678 (= (select (arr!30624 lt!445930) (index!40597 lt!445950)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!119723 c!101732) b!1009001))

(assert (= (and d!119723 (not c!101732)) b!1009000))

(assert (= (and b!1009000 c!101730) b!1008997))

(assert (= (and b!1009000 (not c!101730)) b!1009002))

(assert (= (and d!119723 c!101731) b!1009004))

(assert (= (and d!119723 (not c!101731)) b!1008998))

(assert (= (and b!1008998 res!677843) b!1009003))

(assert (= (and b!1009003 (not res!677845)) b!1008999))

(assert (= (and b!1008999 (not res!677844)) b!1009005))

(declare-fun m!933643 () Bool)

(assert (=> b!1009005 m!933643))

(assert (=> b!1009003 m!933643))

(assert (=> b!1009002 m!933579))

(assert (=> b!1009002 m!933579))

(declare-fun m!933645 () Bool)

(assert (=> b!1009002 m!933645))

(assert (=> b!1008999 m!933643))

(declare-fun m!933647 () Bool)

(assert (=> d!119723 m!933647))

(assert (=> d!119723 m!933603))

(assert (=> b!1008897 d!119723))

(declare-fun bm!42373 () Bool)

(declare-fun call!42376 () Bool)

(declare-fun c!101737 () Bool)

(assert (=> bm!42373 (= call!42376 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101737 (Cons!21296 (select (arr!30624 a!3219) #b00000000000000000000000000000000) Nil!21297) Nil!21297)))))

(declare-fun b!1009024 () Bool)

(declare-fun e!567694 () Bool)

(assert (=> b!1009024 (= e!567694 call!42376)))

(declare-fun d!119747 () Bool)

(declare-fun res!677857 () Bool)

(declare-fun e!567695 () Bool)

(assert (=> d!119747 (=> res!677857 e!567695)))

(assert (=> d!119747 (= res!677857 (bvsge #b00000000000000000000000000000000 (size!31126 a!3219)))))

(assert (=> d!119747 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21297) e!567695)))

(declare-fun b!1009025 () Bool)

(declare-fun e!567693 () Bool)

(assert (=> b!1009025 (= e!567693 e!567694)))

(assert (=> b!1009025 (= c!101737 (validKeyInArray!0 (select (arr!30624 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009026 () Bool)

(declare-fun e!567696 () Bool)

(declare-fun contains!5891 (List!21300 (_ BitVec 64)) Bool)

(assert (=> b!1009026 (= e!567696 (contains!5891 Nil!21297 (select (arr!30624 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009027 () Bool)

(assert (=> b!1009027 (= e!567694 call!42376)))

(declare-fun b!1009028 () Bool)

(assert (=> b!1009028 (= e!567695 e!567693)))

(declare-fun res!677856 () Bool)

(assert (=> b!1009028 (=> (not res!677856) (not e!567693))))

(assert (=> b!1009028 (= res!677856 (not e!567696))))

(declare-fun res!677858 () Bool)

(assert (=> b!1009028 (=> (not res!677858) (not e!567696))))

(assert (=> b!1009028 (= res!677858 (validKeyInArray!0 (select (arr!30624 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119747 (not res!677857)) b!1009028))

(assert (= (and b!1009028 res!677858) b!1009026))

(assert (= (and b!1009028 res!677856) b!1009025))

(assert (= (and b!1009025 c!101737) b!1009024))

(assert (= (and b!1009025 (not c!101737)) b!1009027))

(assert (= (or b!1009024 b!1009027) bm!42373))

(declare-fun m!933649 () Bool)

(assert (=> bm!42373 m!933649))

(declare-fun m!933651 () Bool)

(assert (=> bm!42373 m!933651))

(assert (=> b!1009025 m!933649))

(assert (=> b!1009025 m!933649))

(declare-fun m!933653 () Bool)

(assert (=> b!1009025 m!933653))

(assert (=> b!1009026 m!933649))

(assert (=> b!1009026 m!933649))

(declare-fun m!933655 () Bool)

(assert (=> b!1009026 m!933655))

(assert (=> b!1009028 m!933649))

(assert (=> b!1009028 m!933649))

(assert (=> b!1009028 m!933653))

(assert (=> b!1008898 d!119747))

(declare-fun d!119749 () Bool)

(assert (=> d!119749 (= (validKeyInArray!0 (select (arr!30624 a!3219) j!170)) (and (not (= (select (arr!30624 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30624 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1008896 d!119749))

(declare-fun b!1009033 () Bool)

(declare-fun e!567701 () SeekEntryResult!9556)

(assert (=> b!1009033 (= e!567701 (Intermediate!9556 false (toIndex!0 lt!445929 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009034 () Bool)

(declare-fun e!567703 () Bool)

(declare-fun e!567700 () Bool)

(assert (=> b!1009034 (= e!567703 e!567700)))

(declare-fun res!677861 () Bool)

(declare-fun lt!445961 () SeekEntryResult!9556)

(assert (=> b!1009034 (= res!677861 (and (is-Intermediate!9556 lt!445961) (not (undefined!10368 lt!445961)) (bvslt (x!87978 lt!445961) #b01111111111111111111111111111110) (bvsge (x!87978 lt!445961) #b00000000000000000000000000000000) (bvsge (x!87978 lt!445961) #b00000000000000000000000000000000)))))

(assert (=> b!1009034 (=> (not res!677861) (not e!567700))))

(declare-fun b!1009035 () Bool)

(assert (=> b!1009035 (and (bvsge (index!40597 lt!445961) #b00000000000000000000000000000000) (bvslt (index!40597 lt!445961) (size!31126 lt!445930)))))

(declare-fun res!677862 () Bool)

(assert (=> b!1009035 (= res!677862 (= (select (arr!30624 lt!445930) (index!40597 lt!445961)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567704 () Bool)

(assert (=> b!1009035 (=> res!677862 e!567704)))

(declare-fun b!1009036 () Bool)

(declare-fun e!567702 () SeekEntryResult!9556)

(assert (=> b!1009036 (= e!567702 e!567701)))

(declare-fun c!101739 () Bool)

(declare-fun lt!445962 () (_ BitVec 64))

(assert (=> b!1009036 (= c!101739 (or (= lt!445962 lt!445929) (= (bvadd lt!445962 lt!445962) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009037 () Bool)

(assert (=> b!1009037 (= e!567702 (Intermediate!9556 true (toIndex!0 lt!445929 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009038 () Bool)

(assert (=> b!1009038 (= e!567701 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!445929 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!445929 lt!445930 mask!3464))))

(declare-fun d!119751 () Bool)

(assert (=> d!119751 e!567703))

(declare-fun c!101740 () Bool)

(assert (=> d!119751 (= c!101740 (and (is-Intermediate!9556 lt!445961) (undefined!10368 lt!445961)))))

(assert (=> d!119751 (= lt!445961 e!567702)))

(declare-fun c!101741 () Bool)

(assert (=> d!119751 (= c!101741 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119751 (= lt!445962 (select (arr!30624 lt!445930) (toIndex!0 lt!445929 mask!3464)))))

(assert (=> d!119751 (validMask!0 mask!3464)))

(assert (=> d!119751 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445929 mask!3464) lt!445929 lt!445930 mask!3464) lt!445961)))

(declare-fun b!1009039 () Bool)

(assert (=> b!1009039 (and (bvsge (index!40597 lt!445961) #b00000000000000000000000000000000) (bvslt (index!40597 lt!445961) (size!31126 lt!445930)))))

(declare-fun res!677863 () Bool)

(assert (=> b!1009039 (= res!677863 (= (select (arr!30624 lt!445930) (index!40597 lt!445961)) lt!445929))))

(assert (=> b!1009039 (=> res!677863 e!567704)))

(assert (=> b!1009039 (= e!567700 e!567704)))

(declare-fun b!1009040 () Bool)

(assert (=> b!1009040 (= e!567703 (bvsge (x!87978 lt!445961) #b01111111111111111111111111111110))))

(declare-fun b!1009041 () Bool)

(assert (=> b!1009041 (and (bvsge (index!40597 lt!445961) #b00000000000000000000000000000000) (bvslt (index!40597 lt!445961) (size!31126 lt!445930)))))

(assert (=> b!1009041 (= e!567704 (= (select (arr!30624 lt!445930) (index!40597 lt!445961)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!119751 c!101741) b!1009037))

(assert (= (and d!119751 (not c!101741)) b!1009036))

(assert (= (and b!1009036 c!101739) b!1009033))

(assert (= (and b!1009036 (not c!101739)) b!1009038))

(assert (= (and d!119751 c!101740) b!1009040))

(assert (= (and d!119751 (not c!101740)) b!1009034))

(assert (= (and b!1009034 res!677861) b!1009039))

(assert (= (and b!1009039 (not res!677863)) b!1009035))

(assert (= (and b!1009035 (not res!677862)) b!1009041))

(declare-fun m!933665 () Bool)

(assert (=> b!1009041 m!933665))

(assert (=> b!1009039 m!933665))

(assert (=> b!1009038 m!933593))

(declare-fun m!933667 () Bool)

(assert (=> b!1009038 m!933667))

(assert (=> b!1009038 m!933667))

(declare-fun m!933669 () Bool)

(assert (=> b!1009038 m!933669))

(assert (=> b!1009035 m!933665))

(assert (=> d!119751 m!933593))

(declare-fun m!933671 () Bool)

(assert (=> d!119751 m!933671))

(assert (=> d!119751 m!933603))

(assert (=> b!1008905 d!119751))

(declare-fun d!119755 () Bool)

(declare-fun lt!445972 () (_ BitVec 32))

(declare-fun lt!445971 () (_ BitVec 32))

(assert (=> d!119755 (= lt!445972 (bvmul (bvxor lt!445971 (bvlshr lt!445971 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119755 (= lt!445971 ((_ extract 31 0) (bvand (bvxor lt!445929 (bvlshr lt!445929 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119755 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!677864 (let ((h!22484 ((_ extract 31 0) (bvand (bvxor lt!445929 (bvlshr lt!445929 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87982 (bvmul (bvxor h!22484 (bvlshr h!22484 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87982 (bvlshr x!87982 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!677864 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!677864 #b00000000000000000000000000000000))))))

(assert (=> d!119755 (= (toIndex!0 lt!445929 mask!3464) (bvand (bvxor lt!445972 (bvlshr lt!445972 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1008905 d!119755))

(declare-fun d!119757 () Bool)

(declare-fun res!677875 () Bool)

(declare-fun e!567719 () Bool)

(assert (=> d!119757 (=> res!677875 e!567719)))

(assert (=> d!119757 (= res!677875 (= (select (arr!30624 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119757 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!567719)))

(declare-fun b!1009064 () Bool)

(declare-fun e!567720 () Bool)

(assert (=> b!1009064 (= e!567719 e!567720)))

(declare-fun res!677876 () Bool)

(assert (=> b!1009064 (=> (not res!677876) (not e!567720))))

(assert (=> b!1009064 (= res!677876 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31126 a!3219)))))

(declare-fun b!1009065 () Bool)

(assert (=> b!1009065 (= e!567720 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119757 (not res!677875)) b!1009064))

(assert (= (and b!1009064 res!677876) b!1009065))

(assert (=> d!119757 m!933649))

(declare-fun m!933673 () Bool)

(assert (=> b!1009065 m!933673))

(assert (=> b!1008895 d!119757))

(declare-fun b!1009138 () Bool)

(declare-fun e!567762 () SeekEntryResult!9556)

(declare-fun e!567763 () SeekEntryResult!9556)

(assert (=> b!1009138 (= e!567762 e!567763)))

(declare-fun lt!446012 () (_ BitVec 64))

(declare-fun lt!446010 () SeekEntryResult!9556)

(assert (=> b!1009138 (= lt!446012 (select (arr!30624 a!3219) (index!40597 lt!446010)))))

(declare-fun c!101775 () Bool)

(assert (=> b!1009138 (= c!101775 (= lt!446012 k!2224))))

(declare-fun b!1009139 () Bool)

(assert (=> b!1009139 (= e!567763 (Found!9556 (index!40597 lt!446010)))))

(declare-fun b!1009140 () Bool)

(declare-fun e!567764 () SeekEntryResult!9556)

(assert (=> b!1009140 (= e!567764 (MissingZero!9556 (index!40597 lt!446010)))))

(declare-fun b!1009141 () Bool)

(declare-fun c!101776 () Bool)

(assert (=> b!1009141 (= c!101776 (= lt!446012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009141 (= e!567763 e!567764)))

(declare-fun d!119759 () Bool)

(declare-fun lt!446011 () SeekEntryResult!9556)

(assert (=> d!119759 (and (or (is-Undefined!9556 lt!446011) (not (is-Found!9556 lt!446011)) (and (bvsge (index!40596 lt!446011) #b00000000000000000000000000000000) (bvslt (index!40596 lt!446011) (size!31126 a!3219)))) (or (is-Undefined!9556 lt!446011) (is-Found!9556 lt!446011) (not (is-MissingZero!9556 lt!446011)) (and (bvsge (index!40595 lt!446011) #b00000000000000000000000000000000) (bvslt (index!40595 lt!446011) (size!31126 a!3219)))) (or (is-Undefined!9556 lt!446011) (is-Found!9556 lt!446011) (is-MissingZero!9556 lt!446011) (not (is-MissingVacant!9556 lt!446011)) (and (bvsge (index!40598 lt!446011) #b00000000000000000000000000000000) (bvslt (index!40598 lt!446011) (size!31126 a!3219)))) (or (is-Undefined!9556 lt!446011) (ite (is-Found!9556 lt!446011) (= (select (arr!30624 a!3219) (index!40596 lt!446011)) k!2224) (ite (is-MissingZero!9556 lt!446011) (= (select (arr!30624 a!3219) (index!40595 lt!446011)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9556 lt!446011) (= (select (arr!30624 a!3219) (index!40598 lt!446011)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119759 (= lt!446011 e!567762)))

(declare-fun c!101777 () Bool)

(assert (=> d!119759 (= c!101777 (and (is-Intermediate!9556 lt!446010) (undefined!10368 lt!446010)))))

(assert (=> d!119759 (= lt!446010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119759 (validMask!0 mask!3464)))

(assert (=> d!119759 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!446011)))

(declare-fun b!1009142 () Bool)

(assert (=> b!1009142 (= e!567762 Undefined!9556)))

(declare-fun b!1009143 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63606 (_ BitVec 32)) SeekEntryResult!9556)

(assert (=> b!1009143 (= e!567764 (seekKeyOrZeroReturnVacant!0 (x!87978 lt!446010) (index!40597 lt!446010) (index!40597 lt!446010) k!2224 a!3219 mask!3464))))

(assert (= (and d!119759 c!101777) b!1009142))

(assert (= (and d!119759 (not c!101777)) b!1009138))

(assert (= (and b!1009138 c!101775) b!1009139))

(assert (= (and b!1009138 (not c!101775)) b!1009141))

(assert (= (and b!1009141 c!101776) b!1009140))

(assert (= (and b!1009141 (not c!101776)) b!1009143))

(declare-fun m!933723 () Bool)

(assert (=> b!1009138 m!933723))

(declare-fun m!933725 () Bool)

(assert (=> d!119759 m!933725))

(declare-fun m!933727 () Bool)

(assert (=> d!119759 m!933727))

(declare-fun m!933729 () Bool)

(assert (=> d!119759 m!933729))

(declare-fun m!933731 () Bool)

(assert (=> d!119759 m!933731))

(assert (=> d!119759 m!933725))

(declare-fun m!933733 () Bool)

(assert (=> d!119759 m!933733))

(assert (=> d!119759 m!933603))

(declare-fun m!933735 () Bool)

(assert (=> b!1009143 m!933735))

(assert (=> b!1008893 d!119759))

(declare-fun d!119785 () Bool)

(assert (=> d!119785 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1008904 d!119785))

(declare-fun b!1009144 () Bool)

(declare-fun e!567766 () SeekEntryResult!9556)

(assert (=> b!1009144 (= e!567766 (Intermediate!9556 false (toIndex!0 (select (arr!30624 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009145 () Bool)

(declare-fun e!567768 () Bool)

(declare-fun e!567765 () Bool)

(assert (=> b!1009145 (= e!567768 e!567765)))

(declare-fun res!677896 () Bool)

(declare-fun lt!446013 () SeekEntryResult!9556)

(assert (=> b!1009145 (= res!677896 (and (is-Intermediate!9556 lt!446013) (not (undefined!10368 lt!446013)) (bvslt (x!87978 lt!446013) #b01111111111111111111111111111110) (bvsge (x!87978 lt!446013) #b00000000000000000000000000000000) (bvsge (x!87978 lt!446013) #b00000000000000000000000000000000)))))

(assert (=> b!1009145 (=> (not res!677896) (not e!567765))))

(declare-fun b!1009146 () Bool)

(assert (=> b!1009146 (and (bvsge (index!40597 lt!446013) #b00000000000000000000000000000000) (bvslt (index!40597 lt!446013) (size!31126 a!3219)))))

(declare-fun res!677897 () Bool)

(assert (=> b!1009146 (= res!677897 (= (select (arr!30624 a!3219) (index!40597 lt!446013)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567769 () Bool)

(assert (=> b!1009146 (=> res!677897 e!567769)))

(declare-fun b!1009147 () Bool)

(declare-fun e!567767 () SeekEntryResult!9556)

(assert (=> b!1009147 (= e!567767 e!567766)))

(declare-fun lt!446014 () (_ BitVec 64))

(declare-fun c!101778 () Bool)

(assert (=> b!1009147 (= c!101778 (or (= lt!446014 (select (arr!30624 a!3219) j!170)) (= (bvadd lt!446014 lt!446014) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009148 () Bool)

(assert (=> b!1009148 (= e!567767 (Intermediate!9556 true (toIndex!0 (select (arr!30624 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009149 () Bool)

(assert (=> b!1009149 (= e!567766 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30624 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30624 a!3219) j!170) a!3219 mask!3464))))

(declare-fun d!119787 () Bool)

(assert (=> d!119787 e!567768))

(declare-fun c!101779 () Bool)

(assert (=> d!119787 (= c!101779 (and (is-Intermediate!9556 lt!446013) (undefined!10368 lt!446013)))))

(assert (=> d!119787 (= lt!446013 e!567767)))

(declare-fun c!101780 () Bool)

(assert (=> d!119787 (= c!101780 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119787 (= lt!446014 (select (arr!30624 a!3219) (toIndex!0 (select (arr!30624 a!3219) j!170) mask!3464)))))

(assert (=> d!119787 (validMask!0 mask!3464)))

(assert (=> d!119787 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30624 a!3219) j!170) mask!3464) (select (arr!30624 a!3219) j!170) a!3219 mask!3464) lt!446013)))

(declare-fun b!1009150 () Bool)

(assert (=> b!1009150 (and (bvsge (index!40597 lt!446013) #b00000000000000000000000000000000) (bvslt (index!40597 lt!446013) (size!31126 a!3219)))))

(declare-fun res!677898 () Bool)

(assert (=> b!1009150 (= res!677898 (= (select (arr!30624 a!3219) (index!40597 lt!446013)) (select (arr!30624 a!3219) j!170)))))

(assert (=> b!1009150 (=> res!677898 e!567769)))

(assert (=> b!1009150 (= e!567765 e!567769)))

(declare-fun b!1009151 () Bool)

(assert (=> b!1009151 (= e!567768 (bvsge (x!87978 lt!446013) #b01111111111111111111111111111110))))

(declare-fun b!1009152 () Bool)

(assert (=> b!1009152 (and (bvsge (index!40597 lt!446013) #b00000000000000000000000000000000) (bvslt (index!40597 lt!446013) (size!31126 a!3219)))))

(assert (=> b!1009152 (= e!567769 (= (select (arr!30624 a!3219) (index!40597 lt!446013)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!119787 c!101780) b!1009148))

(assert (= (and d!119787 (not c!101780)) b!1009147))

(assert (= (and b!1009147 c!101778) b!1009144))

(assert (= (and b!1009147 (not c!101778)) b!1009149))

(assert (= (and d!119787 c!101779) b!1009151))

(assert (= (and d!119787 (not c!101779)) b!1009145))

(assert (= (and b!1009145 res!677896) b!1009150))

(assert (= (and b!1009150 (not res!677898)) b!1009146))

(assert (= (and b!1009146 (not res!677897)) b!1009152))

(declare-fun m!933737 () Bool)

(assert (=> b!1009152 m!933737))

(assert (=> b!1009150 m!933737))

(assert (=> b!1009149 m!933585))

(declare-fun m!933739 () Bool)

(assert (=> b!1009149 m!933739))

(assert (=> b!1009149 m!933739))

(assert (=> b!1009149 m!933583))

(declare-fun m!933741 () Bool)

(assert (=> b!1009149 m!933741))

(assert (=> b!1009146 m!933737))

(assert (=> d!119787 m!933585))

(declare-fun m!933743 () Bool)

(assert (=> d!119787 m!933743))

(assert (=> d!119787 m!933603))

(assert (=> b!1008894 d!119787))

(declare-fun d!119789 () Bool)

(declare-fun lt!446022 () (_ BitVec 32))

(declare-fun lt!446021 () (_ BitVec 32))

(assert (=> d!119789 (= lt!446022 (bvmul (bvxor lt!446021 (bvlshr lt!446021 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119789 (= lt!446021 ((_ extract 31 0) (bvand (bvxor (select (arr!30624 a!3219) j!170) (bvlshr (select (arr!30624 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119789 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!677864 (let ((h!22484 ((_ extract 31 0) (bvand (bvxor (select (arr!30624 a!3219) j!170) (bvlshr (select (arr!30624 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87982 (bvmul (bvxor h!22484 (bvlshr h!22484 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87982 (bvlshr x!87982 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!677864 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!677864 #b00000000000000000000000000000000))))))

(assert (=> d!119789 (= (toIndex!0 (select (arr!30624 a!3219) j!170) mask!3464) (bvand (bvxor lt!446022 (bvlshr lt!446022 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1008894 d!119789))

(declare-fun d!119791 () Bool)

(declare-fun lt!446025 () (_ BitVec 32))

(assert (=> d!119791 (and (bvsge lt!446025 #b00000000000000000000000000000000) (bvslt lt!446025 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119791 (= lt!446025 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!119791 (validMask!0 mask!3464)))

(assert (=> d!119791 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446025)))

(declare-fun bs!28697 () Bool)

(assert (= bs!28697 d!119791))

(declare-fun m!933745 () Bool)

(assert (=> bs!28697 m!933745))

(assert (=> bs!28697 m!933603))

(assert (=> b!1008901 d!119791))

(declare-fun b!1009173 () Bool)

(declare-fun e!567786 () Bool)

(declare-fun call!42383 () Bool)

(assert (=> b!1009173 (= e!567786 call!42383)))

(declare-fun bm!42380 () Bool)

(assert (=> bm!42380 (= call!42383 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1009175 () Bool)

(declare-fun e!567787 () Bool)

(assert (=> b!1009175 (= e!567786 e!567787)))

(declare-fun lt!446037 () (_ BitVec 64))

(assert (=> b!1009175 (= lt!446037 (select (arr!30624 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33020 0))(
  ( (Unit!33021) )
))
(declare-fun lt!446036 () Unit!33020)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63606 (_ BitVec 64) (_ BitVec 32)) Unit!33020)

(assert (=> b!1009175 (= lt!446036 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446037 #b00000000000000000000000000000000))))

(assert (=> b!1009175 (arrayContainsKey!0 a!3219 lt!446037 #b00000000000000000000000000000000)))

(declare-fun lt!446035 () Unit!33020)

(assert (=> b!1009175 (= lt!446035 lt!446036)))

(declare-fun res!677910 () Bool)

(assert (=> b!1009175 (= res!677910 (= (seekEntryOrOpen!0 (select (arr!30624 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9556 #b00000000000000000000000000000000)))))

(assert (=> b!1009175 (=> (not res!677910) (not e!567787))))

(declare-fun b!1009176 () Bool)

(declare-fun e!567785 () Bool)

(assert (=> b!1009176 (= e!567785 e!567786)))

(declare-fun c!101786 () Bool)

(assert (=> b!1009176 (= c!101786 (validKeyInArray!0 (select (arr!30624 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!119793 () Bool)

(declare-fun res!677909 () Bool)

(assert (=> d!119793 (=> res!677909 e!567785)))

(assert (=> d!119793 (= res!677909 (bvsge #b00000000000000000000000000000000 (size!31126 a!3219)))))

(assert (=> d!119793 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!567785)))

(declare-fun b!1009174 () Bool)

(assert (=> b!1009174 (= e!567787 call!42383)))

(assert (= (and d!119793 (not res!677909)) b!1009176))

(assert (= (and b!1009176 c!101786) b!1009175))

(assert (= (and b!1009176 (not c!101786)) b!1009173))

(assert (= (and b!1009175 res!677910) b!1009174))

(assert (= (or b!1009174 b!1009173) bm!42380))

(declare-fun m!933755 () Bool)

(assert (=> bm!42380 m!933755))

(assert (=> b!1009175 m!933649))

(declare-fun m!933757 () Bool)

(assert (=> b!1009175 m!933757))

(declare-fun m!933759 () Bool)

(assert (=> b!1009175 m!933759))

(assert (=> b!1009175 m!933649))

(declare-fun m!933761 () Bool)

(assert (=> b!1009175 m!933761))

(assert (=> b!1009176 m!933649))

(assert (=> b!1009176 m!933649))

(assert (=> b!1009176 m!933653))

(assert (=> b!1008902 d!119793))

(declare-fun b!1009177 () Bool)

(declare-fun e!567789 () SeekEntryResult!9556)

(assert (=> b!1009177 (= e!567789 (Intermediate!9556 false index!1507 x!1245))))

(declare-fun b!1009178 () Bool)

(declare-fun e!567791 () Bool)

(declare-fun e!567788 () Bool)

(assert (=> b!1009178 (= e!567791 e!567788)))

(declare-fun res!677911 () Bool)

(declare-fun lt!446038 () SeekEntryResult!9556)

(assert (=> b!1009178 (= res!677911 (and (is-Intermediate!9556 lt!446038) (not (undefined!10368 lt!446038)) (bvslt (x!87978 lt!446038) #b01111111111111111111111111111110) (bvsge (x!87978 lt!446038) #b00000000000000000000000000000000) (bvsge (x!87978 lt!446038) x!1245)))))

(assert (=> b!1009178 (=> (not res!677911) (not e!567788))))

(declare-fun b!1009179 () Bool)

(assert (=> b!1009179 (and (bvsge (index!40597 lt!446038) #b00000000000000000000000000000000) (bvslt (index!40597 lt!446038) (size!31126 a!3219)))))

(declare-fun res!677912 () Bool)

(assert (=> b!1009179 (= res!677912 (= (select (arr!30624 a!3219) (index!40597 lt!446038)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567792 () Bool)

(assert (=> b!1009179 (=> res!677912 e!567792)))

(declare-fun b!1009180 () Bool)

(declare-fun e!567790 () SeekEntryResult!9556)

(assert (=> b!1009180 (= e!567790 e!567789)))

(declare-fun lt!446039 () (_ BitVec 64))

(declare-fun c!101787 () Bool)

(assert (=> b!1009180 (= c!101787 (or (= lt!446039 (select (arr!30624 a!3219) j!170)) (= (bvadd lt!446039 lt!446039) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009181 () Bool)

(assert (=> b!1009181 (= e!567790 (Intermediate!9556 true index!1507 x!1245))))

(declare-fun b!1009182 () Bool)

(assert (=> b!1009182 (= e!567789 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30624 a!3219) j!170) a!3219 mask!3464))))

(declare-fun d!119799 () Bool)

(assert (=> d!119799 e!567791))

(declare-fun c!101788 () Bool)

(assert (=> d!119799 (= c!101788 (and (is-Intermediate!9556 lt!446038) (undefined!10368 lt!446038)))))

(assert (=> d!119799 (= lt!446038 e!567790)))

(declare-fun c!101789 () Bool)

(assert (=> d!119799 (= c!101789 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119799 (= lt!446039 (select (arr!30624 a!3219) index!1507))))

(assert (=> d!119799 (validMask!0 mask!3464)))

(assert (=> d!119799 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30624 a!3219) j!170) a!3219 mask!3464) lt!446038)))

(declare-fun b!1009183 () Bool)

(assert (=> b!1009183 (and (bvsge (index!40597 lt!446038) #b00000000000000000000000000000000) (bvslt (index!40597 lt!446038) (size!31126 a!3219)))))

(declare-fun res!677913 () Bool)

(assert (=> b!1009183 (= res!677913 (= (select (arr!30624 a!3219) (index!40597 lt!446038)) (select (arr!30624 a!3219) j!170)))))

(assert (=> b!1009183 (=> res!677913 e!567792)))

(assert (=> b!1009183 (= e!567788 e!567792)))

(declare-fun b!1009184 () Bool)

(assert (=> b!1009184 (= e!567791 (bvsge (x!87978 lt!446038) #b01111111111111111111111111111110))))

(declare-fun b!1009185 () Bool)

(assert (=> b!1009185 (and (bvsge (index!40597 lt!446038) #b00000000000000000000000000000000) (bvslt (index!40597 lt!446038) (size!31126 a!3219)))))

(assert (=> b!1009185 (= e!567792 (= (select (arr!30624 a!3219) (index!40597 lt!446038)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!119799 c!101789) b!1009181))

(assert (= (and d!119799 (not c!101789)) b!1009180))

(assert (= (and b!1009180 c!101787) b!1009177))

(assert (= (and b!1009180 (not c!101787)) b!1009182))

(assert (= (and d!119799 c!101788) b!1009184))

(assert (= (and d!119799 (not c!101788)) b!1009178))

(assert (= (and b!1009178 res!677911) b!1009183))

(assert (= (and b!1009183 (not res!677913)) b!1009179))

(assert (= (and b!1009179 (not res!677912)) b!1009185))

(declare-fun m!933763 () Bool)

(assert (=> b!1009185 m!933763))

(assert (=> b!1009183 m!933763))

(assert (=> b!1009182 m!933579))

(assert (=> b!1009182 m!933579))

(assert (=> b!1009182 m!933583))

(declare-fun m!933765 () Bool)

(assert (=> b!1009182 m!933765))

(assert (=> b!1009179 m!933763))

(declare-fun m!933767 () Bool)

(assert (=> d!119799 m!933767))

(assert (=> d!119799 m!933603))

(assert (=> b!1008900 d!119799))

(declare-fun d!119801 () Bool)

(assert (=> d!119801 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86958 d!119801))

(declare-fun d!119803 () Bool)

(assert (=> d!119803 (= (array_inv!23748 a!3219) (bvsge (size!31126 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86958 d!119803))

(push 1)

(assert (not b!1009182))

(assert (not b!1009002))

(assert (not b!1009038))

(assert (not b!1009176))

(assert (not b!1009143))

(assert (not d!119751))

(assert (not d!119799))

(assert (not bm!42373))

(assert (not b!1009065))

(assert (not b!1009149))

(assert (not b!1009025))

(assert (not bm!42380))

(assert (not d!119791))

(assert (not b!1009175))

(assert (not d!119759))

(assert (not d!119723))

(assert (not d!119787))

(assert (not b!1009028))

(assert (not b!1009026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

