; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86956 () Bool)

(assert start!86956)

(declare-fun b!1008851 () Bool)

(declare-fun res!677744 () Bool)

(declare-fun e!567595 () Bool)

(assert (=> b!1008851 (=> (not res!677744) (not e!567595))))

(declare-datatypes ((array!63604 0))(
  ( (array!63605 (arr!30623 (Array (_ BitVec 32) (_ BitVec 64))) (size!31125 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63604)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008851 (= res!677744 (and (= (size!31125 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31125 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31125 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008852 () Bool)

(declare-fun res!677745 () Bool)

(declare-fun e!567594 () Bool)

(assert (=> b!1008852 (=> (not res!677745) (not e!567594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63604 (_ BitVec 32)) Bool)

(assert (=> b!1008852 (= res!677745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008853 () Bool)

(declare-fun res!677746 () Bool)

(assert (=> b!1008853 (=> (not res!677746) (not e!567595))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008853 (= res!677746 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008854 () Bool)

(declare-fun res!677749 () Bool)

(assert (=> b!1008854 (=> (not res!677749) (not e!567595))))

(declare-fun arrayContainsKey!0 (array!63604 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008854 (= res!677749 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008855 () Bool)

(declare-fun res!677754 () Bool)

(assert (=> b!1008855 (=> (not res!677754) (not e!567594))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1008855 (= res!677754 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31125 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31125 a!3219))))))

(declare-fun b!1008856 () Bool)

(declare-fun res!677755 () Bool)

(declare-fun e!567593 () Bool)

(assert (=> b!1008856 (=> (not res!677755) (not e!567593))))

(declare-datatypes ((SeekEntryResult!9555 0))(
  ( (MissingZero!9555 (index!40591 (_ BitVec 32))) (Found!9555 (index!40592 (_ BitVec 32))) (Intermediate!9555 (undefined!10367 Bool) (index!40593 (_ BitVec 32)) (x!87977 (_ BitVec 32))) (Undefined!9555) (MissingVacant!9555 (index!40594 (_ BitVec 32))) )
))
(declare-fun lt!445905 () SeekEntryResult!9555)

(declare-fun lt!445906 () array!63604)

(declare-fun lt!445910 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63604 (_ BitVec 32)) SeekEntryResult!9555)

(assert (=> b!1008856 (= res!677755 (not (= lt!445905 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445910 lt!445906 mask!3464))))))

(declare-fun b!1008857 () Bool)

(declare-fun e!567592 () Bool)

(assert (=> b!1008857 (= e!567592 e!567593)))

(declare-fun res!677753 () Bool)

(assert (=> b!1008857 (=> (not res!677753) (not e!567593))))

(declare-fun lt!445909 () SeekEntryResult!9555)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008857 (= res!677753 (not (= lt!445909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445910 mask!3464) lt!445910 lt!445906 mask!3464))))))

(assert (=> b!1008857 (= lt!445910 (select (store (arr!30623 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008857 (= lt!445906 (array!63605 (store (arr!30623 a!3219) i!1194 k0!2224) (size!31125 a!3219)))))

(declare-fun res!677748 () Bool)

(assert (=> start!86956 (=> (not res!677748) (not e!567595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86956 (= res!677748 (validMask!0 mask!3464))))

(assert (=> start!86956 e!567595))

(declare-fun array_inv!23747 (array!63604) Bool)

(assert (=> start!86956 (array_inv!23747 a!3219)))

(assert (=> start!86956 true))

(declare-fun b!1008858 () Bool)

(assert (=> b!1008858 (= e!567593 (bvsgt (bvadd #b00000000000000000000000000000001 x!1245) resX!38))))

(declare-fun lt!445907 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008858 (= lt!445907 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008859 () Bool)

(declare-fun res!677752 () Bool)

(assert (=> b!1008859 (=> (not res!677752) (not e!567593))))

(assert (=> b!1008859 (= res!677752 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008860 () Bool)

(declare-fun e!567591 () Bool)

(assert (=> b!1008860 (= e!567594 e!567591)))

(declare-fun res!677751 () Bool)

(assert (=> b!1008860 (=> (not res!677751) (not e!567591))))

(declare-fun lt!445908 () SeekEntryResult!9555)

(assert (=> b!1008860 (= res!677751 (= lt!445909 lt!445908))))

(assert (=> b!1008860 (= lt!445908 (Intermediate!9555 false resIndex!38 resX!38))))

(assert (=> b!1008860 (= lt!445909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) (select (arr!30623 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008861 () Bool)

(assert (=> b!1008861 (= e!567591 e!567592)))

(declare-fun res!677757 () Bool)

(assert (=> b!1008861 (=> (not res!677757) (not e!567592))))

(assert (=> b!1008861 (= res!677757 (= lt!445905 lt!445908))))

(assert (=> b!1008861 (= lt!445905 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30623 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008862 () Bool)

(declare-fun res!677747 () Bool)

(assert (=> b!1008862 (=> (not res!677747) (not e!567594))))

(declare-datatypes ((List!21299 0))(
  ( (Nil!21296) (Cons!21295 (h!22481 (_ BitVec 64)) (t!30300 List!21299)) )
))
(declare-fun arrayNoDuplicates!0 (array!63604 (_ BitVec 32) List!21299) Bool)

(assert (=> b!1008862 (= res!677747 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21296))))

(declare-fun b!1008863 () Bool)

(assert (=> b!1008863 (= e!567595 e!567594)))

(declare-fun res!677756 () Bool)

(assert (=> b!1008863 (=> (not res!677756) (not e!567594))))

(declare-fun lt!445904 () SeekEntryResult!9555)

(assert (=> b!1008863 (= res!677756 (or (= lt!445904 (MissingVacant!9555 i!1194)) (= lt!445904 (MissingZero!9555 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63604 (_ BitVec 32)) SeekEntryResult!9555)

(assert (=> b!1008863 (= lt!445904 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008864 () Bool)

(declare-fun res!677750 () Bool)

(assert (=> b!1008864 (=> (not res!677750) (not e!567595))))

(assert (=> b!1008864 (= res!677750 (validKeyInArray!0 (select (arr!30623 a!3219) j!170)))))

(assert (= (and start!86956 res!677748) b!1008851))

(assert (= (and b!1008851 res!677744) b!1008864))

(assert (= (and b!1008864 res!677750) b!1008853))

(assert (= (and b!1008853 res!677746) b!1008854))

(assert (= (and b!1008854 res!677749) b!1008863))

(assert (= (and b!1008863 res!677756) b!1008852))

(assert (= (and b!1008852 res!677745) b!1008862))

(assert (= (and b!1008862 res!677747) b!1008855))

(assert (= (and b!1008855 res!677754) b!1008860))

(assert (= (and b!1008860 res!677751) b!1008861))

(assert (= (and b!1008861 res!677757) b!1008857))

(assert (= (and b!1008857 res!677753) b!1008856))

(assert (= (and b!1008856 res!677755) b!1008859))

(assert (= (and b!1008859 res!677752) b!1008858))

(declare-fun m!933539 () Bool)

(assert (=> b!1008864 m!933539))

(assert (=> b!1008864 m!933539))

(declare-fun m!933541 () Bool)

(assert (=> b!1008864 m!933541))

(declare-fun m!933543 () Bool)

(assert (=> b!1008856 m!933543))

(declare-fun m!933545 () Bool)

(assert (=> b!1008863 m!933545))

(declare-fun m!933547 () Bool)

(assert (=> b!1008857 m!933547))

(assert (=> b!1008857 m!933547))

(declare-fun m!933549 () Bool)

(assert (=> b!1008857 m!933549))

(declare-fun m!933551 () Bool)

(assert (=> b!1008857 m!933551))

(declare-fun m!933553 () Bool)

(assert (=> b!1008857 m!933553))

(declare-fun m!933555 () Bool)

(assert (=> b!1008854 m!933555))

(declare-fun m!933557 () Bool)

(assert (=> start!86956 m!933557))

(declare-fun m!933559 () Bool)

(assert (=> start!86956 m!933559))

(assert (=> b!1008861 m!933539))

(assert (=> b!1008861 m!933539))

(declare-fun m!933561 () Bool)

(assert (=> b!1008861 m!933561))

(declare-fun m!933563 () Bool)

(assert (=> b!1008852 m!933563))

(declare-fun m!933565 () Bool)

(assert (=> b!1008862 m!933565))

(declare-fun m!933567 () Bool)

(assert (=> b!1008853 m!933567))

(assert (=> b!1008860 m!933539))

(assert (=> b!1008860 m!933539))

(declare-fun m!933569 () Bool)

(assert (=> b!1008860 m!933569))

(assert (=> b!1008860 m!933569))

(assert (=> b!1008860 m!933539))

(declare-fun m!933571 () Bool)

(assert (=> b!1008860 m!933571))

(declare-fun m!933573 () Bool)

(assert (=> b!1008858 m!933573))

(check-sat (not b!1008862) (not start!86956) (not b!1008861) (not b!1008857) (not b!1008853) (not b!1008856) (not b!1008852) (not b!1008858) (not b!1008860) (not b!1008854) (not b!1008863) (not b!1008864))
(check-sat)
(get-model)

(declare-fun b!1008925 () Bool)

(declare-fun e!567628 () SeekEntryResult!9555)

(declare-fun e!567624 () SeekEntryResult!9555)

(assert (=> b!1008925 (= e!567628 e!567624)))

(declare-fun c!101714 () Bool)

(declare-fun lt!445937 () (_ BitVec 64))

(assert (=> b!1008925 (= c!101714 (or (= lt!445937 lt!445910) (= (bvadd lt!445937 lt!445937) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1008926 () Bool)

(assert (=> b!1008926 (= e!567624 (Intermediate!9555 false (toIndex!0 lt!445910 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1008927 () Bool)

(assert (=> b!1008927 (= e!567624 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!445910 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!445910 lt!445906 mask!3464))))

(declare-fun b!1008928 () Bool)

(declare-fun e!567626 () Bool)

(declare-fun e!567625 () Bool)

(assert (=> b!1008928 (= e!567626 e!567625)))

(declare-fun res!677808 () Bool)

(declare-fun lt!445936 () SeekEntryResult!9555)

(get-info :version)

(assert (=> b!1008928 (= res!677808 (and ((_ is Intermediate!9555) lt!445936) (not (undefined!10367 lt!445936)) (bvslt (x!87977 lt!445936) #b01111111111111111111111111111110) (bvsge (x!87977 lt!445936) #b00000000000000000000000000000000) (bvsge (x!87977 lt!445936) #b00000000000000000000000000000000)))))

(assert (=> b!1008928 (=> (not res!677808) (not e!567625))))

(declare-fun b!1008930 () Bool)

(assert (=> b!1008930 (= e!567626 (bvsge (x!87977 lt!445936) #b01111111111111111111111111111110))))

(declare-fun b!1008931 () Bool)

(assert (=> b!1008931 (and (bvsge (index!40593 lt!445936) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445936) (size!31125 lt!445906)))))

(declare-fun e!567627 () Bool)

(assert (=> b!1008931 (= e!567627 (= (select (arr!30623 lt!445906) (index!40593 lt!445936)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1008932 () Bool)

(assert (=> b!1008932 (= e!567628 (Intermediate!9555 true (toIndex!0 lt!445910 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1008933 () Bool)

(assert (=> b!1008933 (and (bvsge (index!40593 lt!445936) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445936) (size!31125 lt!445906)))))

(declare-fun res!677807 () Bool)

(assert (=> b!1008933 (= res!677807 (= (select (arr!30623 lt!445906) (index!40593 lt!445936)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008933 (=> res!677807 e!567627)))

(declare-fun b!1008929 () Bool)

(assert (=> b!1008929 (and (bvsge (index!40593 lt!445936) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445936) (size!31125 lt!445906)))))

(declare-fun res!677806 () Bool)

(assert (=> b!1008929 (= res!677806 (= (select (arr!30623 lt!445906) (index!40593 lt!445936)) lt!445910))))

(assert (=> b!1008929 (=> res!677806 e!567627)))

(assert (=> b!1008929 (= e!567625 e!567627)))

(declare-fun d!119721 () Bool)

(assert (=> d!119721 e!567626))

(declare-fun c!101713 () Bool)

(assert (=> d!119721 (= c!101713 (and ((_ is Intermediate!9555) lt!445936) (undefined!10367 lt!445936)))))

(assert (=> d!119721 (= lt!445936 e!567628)))

(declare-fun c!101712 () Bool)

(assert (=> d!119721 (= c!101712 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119721 (= lt!445937 (select (arr!30623 lt!445906) (toIndex!0 lt!445910 mask!3464)))))

(assert (=> d!119721 (validMask!0 mask!3464)))

(assert (=> d!119721 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445910 mask!3464) lt!445910 lt!445906 mask!3464) lt!445936)))

(assert (= (and d!119721 c!101712) b!1008932))

(assert (= (and d!119721 (not c!101712)) b!1008925))

(assert (= (and b!1008925 c!101714) b!1008926))

(assert (= (and b!1008925 (not c!101714)) b!1008927))

(assert (= (and d!119721 c!101713) b!1008930))

(assert (= (and d!119721 (not c!101713)) b!1008928))

(assert (= (and b!1008928 res!677808) b!1008929))

(assert (= (and b!1008929 (not res!677806)) b!1008933))

(assert (= (and b!1008933 (not res!677807)) b!1008931))

(declare-fun m!933611 () Bool)

(assert (=> b!1008929 m!933611))

(assert (=> b!1008927 m!933547))

(declare-fun m!933613 () Bool)

(assert (=> b!1008927 m!933613))

(assert (=> b!1008927 m!933613))

(declare-fun m!933615 () Bool)

(assert (=> b!1008927 m!933615))

(assert (=> b!1008931 m!933611))

(assert (=> b!1008933 m!933611))

(assert (=> d!119721 m!933547))

(declare-fun m!933617 () Bool)

(assert (=> d!119721 m!933617))

(assert (=> d!119721 m!933557))

(assert (=> b!1008857 d!119721))

(declare-fun d!119727 () Bool)

(declare-fun lt!445943 () (_ BitVec 32))

(declare-fun lt!445942 () (_ BitVec 32))

(assert (=> d!119727 (= lt!445943 (bvmul (bvxor lt!445942 (bvlshr lt!445942 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119727 (= lt!445942 ((_ extract 31 0) (bvand (bvxor lt!445910 (bvlshr lt!445910 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119727 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!677809 (let ((h!22483 ((_ extract 31 0) (bvand (bvxor lt!445910 (bvlshr lt!445910 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87980 (bvmul (bvxor h!22483 (bvlshr h!22483 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87980 (bvlshr x!87980 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!677809 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!677809 #b00000000000000000000000000000000))))))

(assert (=> d!119727 (= (toIndex!0 lt!445910 mask!3464) (bvand (bvxor lt!445943 (bvlshr lt!445943 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1008857 d!119727))

(declare-fun b!1008934 () Bool)

(declare-fun e!567633 () SeekEntryResult!9555)

(declare-fun e!567629 () SeekEntryResult!9555)

(assert (=> b!1008934 (= e!567633 e!567629)))

(declare-fun c!101717 () Bool)

(declare-fun lt!445945 () (_ BitVec 64))

(assert (=> b!1008934 (= c!101717 (or (= lt!445945 lt!445910) (= (bvadd lt!445945 lt!445945) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1008935 () Bool)

(assert (=> b!1008935 (= e!567629 (Intermediate!9555 false index!1507 x!1245))))

(declare-fun b!1008936 () Bool)

(assert (=> b!1008936 (= e!567629 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!445910 lt!445906 mask!3464))))

(declare-fun b!1008937 () Bool)

(declare-fun e!567631 () Bool)

(declare-fun e!567630 () Bool)

(assert (=> b!1008937 (= e!567631 e!567630)))

(declare-fun res!677812 () Bool)

(declare-fun lt!445944 () SeekEntryResult!9555)

(assert (=> b!1008937 (= res!677812 (and ((_ is Intermediate!9555) lt!445944) (not (undefined!10367 lt!445944)) (bvslt (x!87977 lt!445944) #b01111111111111111111111111111110) (bvsge (x!87977 lt!445944) #b00000000000000000000000000000000) (bvsge (x!87977 lt!445944) x!1245)))))

(assert (=> b!1008937 (=> (not res!677812) (not e!567630))))

(declare-fun b!1008939 () Bool)

(assert (=> b!1008939 (= e!567631 (bvsge (x!87977 lt!445944) #b01111111111111111111111111111110))))

(declare-fun b!1008940 () Bool)

(assert (=> b!1008940 (and (bvsge (index!40593 lt!445944) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445944) (size!31125 lt!445906)))))

(declare-fun e!567632 () Bool)

(assert (=> b!1008940 (= e!567632 (= (select (arr!30623 lt!445906) (index!40593 lt!445944)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1008941 () Bool)

(assert (=> b!1008941 (= e!567633 (Intermediate!9555 true index!1507 x!1245))))

(declare-fun b!1008942 () Bool)

(assert (=> b!1008942 (and (bvsge (index!40593 lt!445944) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445944) (size!31125 lt!445906)))))

(declare-fun res!677811 () Bool)

(assert (=> b!1008942 (= res!677811 (= (select (arr!30623 lt!445906) (index!40593 lt!445944)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1008942 (=> res!677811 e!567632)))

(declare-fun b!1008938 () Bool)

(assert (=> b!1008938 (and (bvsge (index!40593 lt!445944) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445944) (size!31125 lt!445906)))))

(declare-fun res!677810 () Bool)

(assert (=> b!1008938 (= res!677810 (= (select (arr!30623 lt!445906) (index!40593 lt!445944)) lt!445910))))

(assert (=> b!1008938 (=> res!677810 e!567632)))

(assert (=> b!1008938 (= e!567630 e!567632)))

(declare-fun d!119729 () Bool)

(assert (=> d!119729 e!567631))

(declare-fun c!101716 () Bool)

(assert (=> d!119729 (= c!101716 (and ((_ is Intermediate!9555) lt!445944) (undefined!10367 lt!445944)))))

(assert (=> d!119729 (= lt!445944 e!567633)))

(declare-fun c!101715 () Bool)

(assert (=> d!119729 (= c!101715 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119729 (= lt!445945 (select (arr!30623 lt!445906) index!1507))))

(assert (=> d!119729 (validMask!0 mask!3464)))

(assert (=> d!119729 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445910 lt!445906 mask!3464) lt!445944)))

(assert (= (and d!119729 c!101715) b!1008941))

(assert (= (and d!119729 (not c!101715)) b!1008934))

(assert (= (and b!1008934 c!101717) b!1008935))

(assert (= (and b!1008934 (not c!101717)) b!1008936))

(assert (= (and d!119729 c!101716) b!1008939))

(assert (= (and d!119729 (not c!101716)) b!1008937))

(assert (= (and b!1008937 res!677812) b!1008938))

(assert (= (and b!1008938 (not res!677810)) b!1008942))

(assert (= (and b!1008942 (not res!677811)) b!1008940))

(declare-fun m!933619 () Bool)

(assert (=> b!1008938 m!933619))

(assert (=> b!1008936 m!933573))

(assert (=> b!1008936 m!933573))

(declare-fun m!933621 () Bool)

(assert (=> b!1008936 m!933621))

(assert (=> b!1008940 m!933619))

(assert (=> b!1008942 m!933619))

(declare-fun m!933623 () Bool)

(assert (=> d!119729 m!933623))

(assert (=> d!119729 m!933557))

(assert (=> b!1008856 d!119729))

(declare-fun d!119731 () Bool)

(declare-fun res!677817 () Bool)

(declare-fun e!567638 () Bool)

(assert (=> d!119731 (=> res!677817 e!567638)))

(assert (=> d!119731 (= res!677817 (= (select (arr!30623 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119731 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!567638)))

(declare-fun b!1008947 () Bool)

(declare-fun e!567639 () Bool)

(assert (=> b!1008947 (= e!567638 e!567639)))

(declare-fun res!677818 () Bool)

(assert (=> b!1008947 (=> (not res!677818) (not e!567639))))

(assert (=> b!1008947 (= res!677818 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31125 a!3219)))))

(declare-fun b!1008948 () Bool)

(assert (=> b!1008948 (= e!567639 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119731 (not res!677817)) b!1008947))

(assert (= (and b!1008947 res!677818) b!1008948))

(declare-fun m!933625 () Bool)

(assert (=> d!119731 m!933625))

(declare-fun m!933627 () Bool)

(assert (=> b!1008948 m!933627))

(assert (=> b!1008854 d!119731))

(declare-fun d!119735 () Bool)

(assert (=> d!119735 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1008853 d!119735))

(declare-fun d!119739 () Bool)

(assert (=> d!119739 (= (validKeyInArray!0 (select (arr!30623 a!3219) j!170)) (and (not (= (select (arr!30623 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30623 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1008864 d!119739))

(declare-fun b!1008992 () Bool)

(declare-fun e!567673 () Bool)

(declare-fun e!567671 () Bool)

(assert (=> b!1008992 (= e!567673 e!567671)))

(declare-fun c!101729 () Bool)

(assert (=> b!1008992 (= c!101729 (validKeyInArray!0 (select (arr!30623 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42368 () Bool)

(declare-fun call!42371 () Bool)

(assert (=> bm!42368 (= call!42371 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101729 (Cons!21295 (select (arr!30623 a!3219) #b00000000000000000000000000000000) Nil!21296) Nil!21296)))))

(declare-fun b!1008993 () Bool)

(declare-fun e!567670 () Bool)

(declare-fun contains!5890 (List!21299 (_ BitVec 64)) Bool)

(assert (=> b!1008993 (= e!567670 (contains!5890 Nil!21296 (select (arr!30623 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1008994 () Bool)

(assert (=> b!1008994 (= e!567671 call!42371)))

(declare-fun d!119741 () Bool)

(declare-fun res!677842 () Bool)

(declare-fun e!567672 () Bool)

(assert (=> d!119741 (=> res!677842 e!567672)))

(assert (=> d!119741 (= res!677842 (bvsge #b00000000000000000000000000000000 (size!31125 a!3219)))))

(assert (=> d!119741 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21296) e!567672)))

(declare-fun b!1008995 () Bool)

(assert (=> b!1008995 (= e!567672 e!567673)))

(declare-fun res!677840 () Bool)

(assert (=> b!1008995 (=> (not res!677840) (not e!567673))))

(assert (=> b!1008995 (= res!677840 (not e!567670))))

(declare-fun res!677841 () Bool)

(assert (=> b!1008995 (=> (not res!677841) (not e!567670))))

(assert (=> b!1008995 (= res!677841 (validKeyInArray!0 (select (arr!30623 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1008996 () Bool)

(assert (=> b!1008996 (= e!567671 call!42371)))

(assert (= (and d!119741 (not res!677842)) b!1008995))

(assert (= (and b!1008995 res!677841) b!1008993))

(assert (= (and b!1008995 res!677840) b!1008992))

(assert (= (and b!1008992 c!101729) b!1008996))

(assert (= (and b!1008992 (not c!101729)) b!1008994))

(assert (= (or b!1008996 b!1008994) bm!42368))

(assert (=> b!1008992 m!933625))

(assert (=> b!1008992 m!933625))

(declare-fun m!933637 () Bool)

(assert (=> b!1008992 m!933637))

(assert (=> bm!42368 m!933625))

(declare-fun m!933639 () Bool)

(assert (=> bm!42368 m!933639))

(assert (=> b!1008993 m!933625))

(assert (=> b!1008993 m!933625))

(declare-fun m!933641 () Bool)

(assert (=> b!1008993 m!933641))

(assert (=> b!1008995 m!933625))

(assert (=> b!1008995 m!933625))

(assert (=> b!1008995 m!933637))

(assert (=> b!1008862 d!119741))

(declare-fun d!119745 () Bool)

(declare-fun res!677859 () Bool)

(declare-fun e!567699 () Bool)

(assert (=> d!119745 (=> res!677859 e!567699)))

(assert (=> d!119745 (= res!677859 (bvsge #b00000000000000000000000000000000 (size!31125 a!3219)))))

(assert (=> d!119745 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!567699)))

(declare-fun b!1009029 () Bool)

(declare-fun e!567698 () Bool)

(declare-fun call!42377 () Bool)

(assert (=> b!1009029 (= e!567698 call!42377)))

(declare-fun b!1009030 () Bool)

(declare-fun e!567697 () Bool)

(assert (=> b!1009030 (= e!567697 call!42377)))

(declare-fun b!1009031 () Bool)

(assert (=> b!1009031 (= e!567699 e!567697)))

(declare-fun c!101738 () Bool)

(assert (=> b!1009031 (= c!101738 (validKeyInArray!0 (select (arr!30623 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009032 () Bool)

(assert (=> b!1009032 (= e!567697 e!567698)))

(declare-fun lt!445959 () (_ BitVec 64))

(assert (=> b!1009032 (= lt!445959 (select (arr!30623 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33016 0))(
  ( (Unit!33017) )
))
(declare-fun lt!445960 () Unit!33016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63604 (_ BitVec 64) (_ BitVec 32)) Unit!33016)

(assert (=> b!1009032 (= lt!445960 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!445959 #b00000000000000000000000000000000))))

(assert (=> b!1009032 (arrayContainsKey!0 a!3219 lt!445959 #b00000000000000000000000000000000)))

(declare-fun lt!445958 () Unit!33016)

(assert (=> b!1009032 (= lt!445958 lt!445960)))

(declare-fun res!677860 () Bool)

(assert (=> b!1009032 (= res!677860 (= (seekEntryOrOpen!0 (select (arr!30623 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9555 #b00000000000000000000000000000000)))))

(assert (=> b!1009032 (=> (not res!677860) (not e!567698))))

(declare-fun bm!42374 () Bool)

(assert (=> bm!42374 (= call!42377 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119745 (not res!677859)) b!1009031))

(assert (= (and b!1009031 c!101738) b!1009032))

(assert (= (and b!1009031 (not c!101738)) b!1009030))

(assert (= (and b!1009032 res!677860) b!1009029))

(assert (= (or b!1009029 b!1009030) bm!42374))

(assert (=> b!1009031 m!933625))

(assert (=> b!1009031 m!933625))

(assert (=> b!1009031 m!933637))

(assert (=> b!1009032 m!933625))

(declare-fun m!933657 () Bool)

(assert (=> b!1009032 m!933657))

(declare-fun m!933659 () Bool)

(assert (=> b!1009032 m!933659))

(assert (=> b!1009032 m!933625))

(declare-fun m!933661 () Bool)

(assert (=> b!1009032 m!933661))

(declare-fun m!933663 () Bool)

(assert (=> bm!42374 m!933663))

(assert (=> b!1008852 d!119745))

(declare-fun b!1009096 () Bool)

(declare-fun lt!445992 () SeekEntryResult!9555)

(declare-fun e!567737 () SeekEntryResult!9555)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63604 (_ BitVec 32)) SeekEntryResult!9555)

(assert (=> b!1009096 (= e!567737 (seekKeyOrZeroReturnVacant!0 (x!87977 lt!445992) (index!40593 lt!445992) (index!40593 lt!445992) k0!2224 a!3219 mask!3464))))

(declare-fun b!1009097 () Bool)

(declare-fun e!567738 () SeekEntryResult!9555)

(assert (=> b!1009097 (= e!567738 Undefined!9555)))

(declare-fun d!119753 () Bool)

(declare-fun lt!445993 () SeekEntryResult!9555)

(assert (=> d!119753 (and (or ((_ is Undefined!9555) lt!445993) (not ((_ is Found!9555) lt!445993)) (and (bvsge (index!40592 lt!445993) #b00000000000000000000000000000000) (bvslt (index!40592 lt!445993) (size!31125 a!3219)))) (or ((_ is Undefined!9555) lt!445993) ((_ is Found!9555) lt!445993) (not ((_ is MissingZero!9555) lt!445993)) (and (bvsge (index!40591 lt!445993) #b00000000000000000000000000000000) (bvslt (index!40591 lt!445993) (size!31125 a!3219)))) (or ((_ is Undefined!9555) lt!445993) ((_ is Found!9555) lt!445993) ((_ is MissingZero!9555) lt!445993) (not ((_ is MissingVacant!9555) lt!445993)) (and (bvsge (index!40594 lt!445993) #b00000000000000000000000000000000) (bvslt (index!40594 lt!445993) (size!31125 a!3219)))) (or ((_ is Undefined!9555) lt!445993) (ite ((_ is Found!9555) lt!445993) (= (select (arr!30623 a!3219) (index!40592 lt!445993)) k0!2224) (ite ((_ is MissingZero!9555) lt!445993) (= (select (arr!30623 a!3219) (index!40591 lt!445993)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9555) lt!445993) (= (select (arr!30623 a!3219) (index!40594 lt!445993)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119753 (= lt!445993 e!567738)))

(declare-fun c!101761 () Bool)

(assert (=> d!119753 (= c!101761 (and ((_ is Intermediate!9555) lt!445992) (undefined!10367 lt!445992)))))

(assert (=> d!119753 (= lt!445992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119753 (validMask!0 mask!3464)))

(assert (=> d!119753 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!445993)))

(declare-fun b!1009098 () Bool)

(declare-fun e!567739 () SeekEntryResult!9555)

(assert (=> b!1009098 (= e!567739 (Found!9555 (index!40593 lt!445992)))))

(declare-fun b!1009099 () Bool)

(assert (=> b!1009099 (= e!567737 (MissingZero!9555 (index!40593 lt!445992)))))

(declare-fun b!1009100 () Bool)

(declare-fun c!101760 () Bool)

(declare-fun lt!445994 () (_ BitVec 64))

(assert (=> b!1009100 (= c!101760 (= lt!445994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009100 (= e!567739 e!567737)))

(declare-fun b!1009101 () Bool)

(assert (=> b!1009101 (= e!567738 e!567739)))

(assert (=> b!1009101 (= lt!445994 (select (arr!30623 a!3219) (index!40593 lt!445992)))))

(declare-fun c!101762 () Bool)

(assert (=> b!1009101 (= c!101762 (= lt!445994 k0!2224))))

(assert (= (and d!119753 c!101761) b!1009097))

(assert (= (and d!119753 (not c!101761)) b!1009101))

(assert (= (and b!1009101 c!101762) b!1009098))

(assert (= (and b!1009101 (not c!101762)) b!1009100))

(assert (= (and b!1009100 c!101760) b!1009099))

(assert (= (and b!1009100 (not c!101760)) b!1009096))

(declare-fun m!933691 () Bool)

(assert (=> b!1009096 m!933691))

(declare-fun m!933693 () Bool)

(assert (=> d!119753 m!933693))

(declare-fun m!933695 () Bool)

(assert (=> d!119753 m!933695))

(declare-fun m!933697 () Bool)

(assert (=> d!119753 m!933697))

(assert (=> d!119753 m!933557))

(assert (=> d!119753 m!933695))

(declare-fun m!933699 () Bool)

(assert (=> d!119753 m!933699))

(declare-fun m!933701 () Bool)

(assert (=> d!119753 m!933701))

(declare-fun m!933703 () Bool)

(assert (=> b!1009101 m!933703))

(assert (=> b!1008863 d!119753))

(declare-fun b!1009102 () Bool)

(declare-fun e!567744 () SeekEntryResult!9555)

(declare-fun e!567740 () SeekEntryResult!9555)

(assert (=> b!1009102 (= e!567744 e!567740)))

(declare-fun c!101765 () Bool)

(declare-fun lt!445996 () (_ BitVec 64))

(assert (=> b!1009102 (= c!101765 (or (= lt!445996 (select (arr!30623 a!3219) j!170)) (= (bvadd lt!445996 lt!445996) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009103 () Bool)

(assert (=> b!1009103 (= e!567740 (Intermediate!9555 false index!1507 x!1245))))

(declare-fun b!1009104 () Bool)

(assert (=> b!1009104 (= e!567740 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30623 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009105 () Bool)

(declare-fun e!567742 () Bool)

(declare-fun e!567741 () Bool)

(assert (=> b!1009105 (= e!567742 e!567741)))

(declare-fun res!677886 () Bool)

(declare-fun lt!445995 () SeekEntryResult!9555)

(assert (=> b!1009105 (= res!677886 (and ((_ is Intermediate!9555) lt!445995) (not (undefined!10367 lt!445995)) (bvslt (x!87977 lt!445995) #b01111111111111111111111111111110) (bvsge (x!87977 lt!445995) #b00000000000000000000000000000000) (bvsge (x!87977 lt!445995) x!1245)))))

(assert (=> b!1009105 (=> (not res!677886) (not e!567741))))

(declare-fun b!1009107 () Bool)

(assert (=> b!1009107 (= e!567742 (bvsge (x!87977 lt!445995) #b01111111111111111111111111111110))))

(declare-fun b!1009108 () Bool)

(assert (=> b!1009108 (and (bvsge (index!40593 lt!445995) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445995) (size!31125 a!3219)))))

(declare-fun e!567743 () Bool)

(assert (=> b!1009108 (= e!567743 (= (select (arr!30623 a!3219) (index!40593 lt!445995)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009109 () Bool)

(assert (=> b!1009109 (= e!567744 (Intermediate!9555 true index!1507 x!1245))))

(declare-fun b!1009110 () Bool)

(assert (=> b!1009110 (and (bvsge (index!40593 lt!445995) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445995) (size!31125 a!3219)))))

(declare-fun res!677885 () Bool)

(assert (=> b!1009110 (= res!677885 (= (select (arr!30623 a!3219) (index!40593 lt!445995)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009110 (=> res!677885 e!567743)))

(declare-fun b!1009106 () Bool)

(assert (=> b!1009106 (and (bvsge (index!40593 lt!445995) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445995) (size!31125 a!3219)))))

(declare-fun res!677884 () Bool)

(assert (=> b!1009106 (= res!677884 (= (select (arr!30623 a!3219) (index!40593 lt!445995)) (select (arr!30623 a!3219) j!170)))))

(assert (=> b!1009106 (=> res!677884 e!567743)))

(assert (=> b!1009106 (= e!567741 e!567743)))

(declare-fun d!119773 () Bool)

(assert (=> d!119773 e!567742))

(declare-fun c!101764 () Bool)

(assert (=> d!119773 (= c!101764 (and ((_ is Intermediate!9555) lt!445995) (undefined!10367 lt!445995)))))

(assert (=> d!119773 (= lt!445995 e!567744)))

(declare-fun c!101763 () Bool)

(assert (=> d!119773 (= c!101763 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119773 (= lt!445996 (select (arr!30623 a!3219) index!1507))))

(assert (=> d!119773 (validMask!0 mask!3464)))

(assert (=> d!119773 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30623 a!3219) j!170) a!3219 mask!3464) lt!445995)))

(assert (= (and d!119773 c!101763) b!1009109))

(assert (= (and d!119773 (not c!101763)) b!1009102))

(assert (= (and b!1009102 c!101765) b!1009103))

(assert (= (and b!1009102 (not c!101765)) b!1009104))

(assert (= (and d!119773 c!101764) b!1009107))

(assert (= (and d!119773 (not c!101764)) b!1009105))

(assert (= (and b!1009105 res!677886) b!1009106))

(assert (= (and b!1009106 (not res!677884)) b!1009110))

(assert (= (and b!1009110 (not res!677885)) b!1009108))

(declare-fun m!933705 () Bool)

(assert (=> b!1009106 m!933705))

(assert (=> b!1009104 m!933573))

(assert (=> b!1009104 m!933573))

(assert (=> b!1009104 m!933539))

(declare-fun m!933707 () Bool)

(assert (=> b!1009104 m!933707))

(assert (=> b!1009108 m!933705))

(assert (=> b!1009110 m!933705))

(declare-fun m!933709 () Bool)

(assert (=> d!119773 m!933709))

(assert (=> d!119773 m!933557))

(assert (=> b!1008861 d!119773))

(declare-fun b!1009115 () Bool)

(declare-fun e!567753 () SeekEntryResult!9555)

(declare-fun e!567749 () SeekEntryResult!9555)

(assert (=> b!1009115 (= e!567753 e!567749)))

(declare-fun lt!445998 () (_ BitVec 64))

(declare-fun c!101768 () Bool)

(assert (=> b!1009115 (= c!101768 (or (= lt!445998 (select (arr!30623 a!3219) j!170)) (= (bvadd lt!445998 lt!445998) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009116 () Bool)

(assert (=> b!1009116 (= e!567749 (Intermediate!9555 false (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009117 () Bool)

(assert (=> b!1009117 (= e!567749 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30623 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009118 () Bool)

(declare-fun e!567751 () Bool)

(declare-fun e!567750 () Bool)

(assert (=> b!1009118 (= e!567751 e!567750)))

(declare-fun res!677893 () Bool)

(declare-fun lt!445997 () SeekEntryResult!9555)

(assert (=> b!1009118 (= res!677893 (and ((_ is Intermediate!9555) lt!445997) (not (undefined!10367 lt!445997)) (bvslt (x!87977 lt!445997) #b01111111111111111111111111111110) (bvsge (x!87977 lt!445997) #b00000000000000000000000000000000) (bvsge (x!87977 lt!445997) #b00000000000000000000000000000000)))))

(assert (=> b!1009118 (=> (not res!677893) (not e!567750))))

(declare-fun b!1009120 () Bool)

(assert (=> b!1009120 (= e!567751 (bvsge (x!87977 lt!445997) #b01111111111111111111111111111110))))

(declare-fun b!1009121 () Bool)

(assert (=> b!1009121 (and (bvsge (index!40593 lt!445997) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445997) (size!31125 a!3219)))))

(declare-fun e!567752 () Bool)

(assert (=> b!1009121 (= e!567752 (= (select (arr!30623 a!3219) (index!40593 lt!445997)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009122 () Bool)

(assert (=> b!1009122 (= e!567753 (Intermediate!9555 true (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009123 () Bool)

(assert (=> b!1009123 (and (bvsge (index!40593 lt!445997) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445997) (size!31125 a!3219)))))

(declare-fun res!677892 () Bool)

(assert (=> b!1009123 (= res!677892 (= (select (arr!30623 a!3219) (index!40593 lt!445997)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009123 (=> res!677892 e!567752)))

(declare-fun b!1009119 () Bool)

(assert (=> b!1009119 (and (bvsge (index!40593 lt!445997) #b00000000000000000000000000000000) (bvslt (index!40593 lt!445997) (size!31125 a!3219)))))

(declare-fun res!677891 () Bool)

(assert (=> b!1009119 (= res!677891 (= (select (arr!30623 a!3219) (index!40593 lt!445997)) (select (arr!30623 a!3219) j!170)))))

(assert (=> b!1009119 (=> res!677891 e!567752)))

(assert (=> b!1009119 (= e!567750 e!567752)))

(declare-fun d!119775 () Bool)

(assert (=> d!119775 e!567751))

(declare-fun c!101767 () Bool)

(assert (=> d!119775 (= c!101767 (and ((_ is Intermediate!9555) lt!445997) (undefined!10367 lt!445997)))))

(assert (=> d!119775 (= lt!445997 e!567753)))

(declare-fun c!101766 () Bool)

(assert (=> d!119775 (= c!101766 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119775 (= lt!445998 (select (arr!30623 a!3219) (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464)))))

(assert (=> d!119775 (validMask!0 mask!3464)))

(assert (=> d!119775 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) (select (arr!30623 a!3219) j!170) a!3219 mask!3464) lt!445997)))

(assert (= (and d!119775 c!101766) b!1009122))

(assert (= (and d!119775 (not c!101766)) b!1009115))

(assert (= (and b!1009115 c!101768) b!1009116))

(assert (= (and b!1009115 (not c!101768)) b!1009117))

(assert (= (and d!119775 c!101767) b!1009120))

(assert (= (and d!119775 (not c!101767)) b!1009118))

(assert (= (and b!1009118 res!677893) b!1009119))

(assert (= (and b!1009119 (not res!677891)) b!1009123))

(assert (= (and b!1009123 (not res!677892)) b!1009121))

(declare-fun m!933713 () Bool)

(assert (=> b!1009119 m!933713))

(assert (=> b!1009117 m!933569))

(declare-fun m!933715 () Bool)

(assert (=> b!1009117 m!933715))

(assert (=> b!1009117 m!933715))

(assert (=> b!1009117 m!933539))

(declare-fun m!933717 () Bool)

(assert (=> b!1009117 m!933717))

(assert (=> b!1009121 m!933713))

(assert (=> b!1009123 m!933713))

(assert (=> d!119775 m!933569))

(declare-fun m!933719 () Bool)

(assert (=> d!119775 m!933719))

(assert (=> d!119775 m!933557))

(assert (=> b!1008860 d!119775))

(declare-fun d!119779 () Bool)

(declare-fun lt!446004 () (_ BitVec 32))

(declare-fun lt!446003 () (_ BitVec 32))

(assert (=> d!119779 (= lt!446004 (bvmul (bvxor lt!446003 (bvlshr lt!446003 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119779 (= lt!446003 ((_ extract 31 0) (bvand (bvxor (select (arr!30623 a!3219) j!170) (bvlshr (select (arr!30623 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119779 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!677809 (let ((h!22483 ((_ extract 31 0) (bvand (bvxor (select (arr!30623 a!3219) j!170) (bvlshr (select (arr!30623 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87980 (bvmul (bvxor h!22483 (bvlshr h!22483 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87980 (bvlshr x!87980 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!677809 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!677809 #b00000000000000000000000000000000))))))

(assert (=> d!119779 (= (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) (bvand (bvxor lt!446004 (bvlshr lt!446004 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1008860 d!119779))

(declare-fun d!119781 () Bool)

(declare-fun lt!446009 () (_ BitVec 32))

(assert (=> d!119781 (and (bvsge lt!446009 #b00000000000000000000000000000000) (bvslt lt!446009 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119781 (= lt!446009 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!119781 (validMask!0 mask!3464)))

(assert (=> d!119781 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!446009)))

(declare-fun bs!28696 () Bool)

(assert (= bs!28696 d!119781))

(declare-fun m!933721 () Bool)

(assert (=> bs!28696 m!933721))

(assert (=> bs!28696 m!933557))

(assert (=> b!1008858 d!119781))

(declare-fun d!119783 () Bool)

(assert (=> d!119783 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86956 d!119783))

(declare-fun d!119797 () Bool)

(assert (=> d!119797 (= (array_inv!23747 a!3219) (bvsge (size!31125 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86956 d!119797))

(check-sat (not b!1009104) (not bm!42374) (not d!119721) (not b!1009032) (not b!1008936) (not d!119775) (not b!1009031) (not b!1008993) (not d!119753) (not b!1009117) (not b!1009096) (not d!119773) (not b!1008992) (not d!119781) (not b!1008927) (not b!1008948) (not d!119729) (not b!1008995) (not bm!42368))
(check-sat)
(get-model)

(assert (=> d!119729 d!119783))

(declare-fun d!119811 () Bool)

(declare-fun res!677922 () (_ BitVec 32))

(assert (=> d!119811 (and (bvsge res!677922 #b00000000000000000000000000000000) (bvslt res!677922 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(assert (=> d!119811 true))

(assert (=> d!119811 (= (choose!52 index!1507 x!1245 mask!3464) res!677922)))

(assert (=> d!119781 d!119811))

(assert (=> d!119781 d!119783))

(assert (=> d!119773 d!119783))

(declare-fun d!119813 () Bool)

(assert (=> d!119813 (= (validKeyInArray!0 (select (arr!30623 a!3219) #b00000000000000000000000000000000)) (and (not (= (select (arr!30623 a!3219) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30623 a!3219) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1008995 d!119813))

(declare-fun b!1009222 () Bool)

(declare-fun e!567816 () SeekEntryResult!9555)

(declare-fun e!567812 () SeekEntryResult!9555)

(assert (=> b!1009222 (= e!567816 e!567812)))

(declare-fun c!101807 () Bool)

(declare-fun lt!446056 () (_ BitVec 64))

(assert (=> b!1009222 (= c!101807 (or (= lt!446056 (select (arr!30623 a!3219) j!170)) (= (bvadd lt!446056 lt!446056) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009223 () Bool)

(assert (=> b!1009223 (= e!567812 (Intermediate!9555 false (nextIndex!0 (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1009224 () Bool)

(assert (=> b!1009224 (= e!567812 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) (select (arr!30623 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009225 () Bool)

(declare-fun e!567814 () Bool)

(declare-fun e!567813 () Bool)

(assert (=> b!1009225 (= e!567814 e!567813)))

(declare-fun res!677925 () Bool)

(declare-fun lt!446055 () SeekEntryResult!9555)

(assert (=> b!1009225 (= res!677925 (and ((_ is Intermediate!9555) lt!446055) (not (undefined!10367 lt!446055)) (bvslt (x!87977 lt!446055) #b01111111111111111111111111111110) (bvsge (x!87977 lt!446055) #b00000000000000000000000000000000) (bvsge (x!87977 lt!446055) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1009225 (=> (not res!677925) (not e!567813))))

(declare-fun b!1009227 () Bool)

(assert (=> b!1009227 (= e!567814 (bvsge (x!87977 lt!446055) #b01111111111111111111111111111110))))

(declare-fun b!1009228 () Bool)

(assert (=> b!1009228 (and (bvsge (index!40593 lt!446055) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446055) (size!31125 a!3219)))))

(declare-fun e!567815 () Bool)

(assert (=> b!1009228 (= e!567815 (= (select (arr!30623 a!3219) (index!40593 lt!446055)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009229 () Bool)

(assert (=> b!1009229 (= e!567816 (Intermediate!9555 true (nextIndex!0 (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1009230 () Bool)

(assert (=> b!1009230 (and (bvsge (index!40593 lt!446055) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446055) (size!31125 a!3219)))))

(declare-fun res!677924 () Bool)

(assert (=> b!1009230 (= res!677924 (= (select (arr!30623 a!3219) (index!40593 lt!446055)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009230 (=> res!677924 e!567815)))

(declare-fun b!1009226 () Bool)

(assert (=> b!1009226 (and (bvsge (index!40593 lt!446055) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446055) (size!31125 a!3219)))))

(declare-fun res!677923 () Bool)

(assert (=> b!1009226 (= res!677923 (= (select (arr!30623 a!3219) (index!40593 lt!446055)) (select (arr!30623 a!3219) j!170)))))

(assert (=> b!1009226 (=> res!677923 e!567815)))

(assert (=> b!1009226 (= e!567813 e!567815)))

(declare-fun d!119815 () Bool)

(assert (=> d!119815 e!567814))

(declare-fun c!101806 () Bool)

(assert (=> d!119815 (= c!101806 (and ((_ is Intermediate!9555) lt!446055) (undefined!10367 lt!446055)))))

(assert (=> d!119815 (= lt!446055 e!567816)))

(declare-fun c!101805 () Bool)

(assert (=> d!119815 (= c!101805 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!119815 (= lt!446056 (select (arr!30623 a!3219) (nextIndex!0 (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464)))))

(assert (=> d!119815 (validMask!0 mask!3464)))

(assert (=> d!119815 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30623 a!3219) j!170) a!3219 mask!3464) lt!446055)))

(assert (= (and d!119815 c!101805) b!1009229))

(assert (= (and d!119815 (not c!101805)) b!1009222))

(assert (= (and b!1009222 c!101807) b!1009223))

(assert (= (and b!1009222 (not c!101807)) b!1009224))

(assert (= (and d!119815 c!101806) b!1009227))

(assert (= (and d!119815 (not c!101806)) b!1009225))

(assert (= (and b!1009225 res!677925) b!1009226))

(assert (= (and b!1009226 (not res!677923)) b!1009230))

(assert (= (and b!1009230 (not res!677924)) b!1009228))

(declare-fun m!933797 () Bool)

(assert (=> b!1009226 m!933797))

(assert (=> b!1009224 m!933715))

(declare-fun m!933799 () Bool)

(assert (=> b!1009224 m!933799))

(assert (=> b!1009224 m!933799))

(assert (=> b!1009224 m!933539))

(declare-fun m!933801 () Bool)

(assert (=> b!1009224 m!933801))

(assert (=> b!1009228 m!933797))

(assert (=> b!1009230 m!933797))

(assert (=> d!119815 m!933715))

(declare-fun m!933803 () Bool)

(assert (=> d!119815 m!933803))

(assert (=> d!119815 m!933557))

(assert (=> b!1009117 d!119815))

(declare-fun d!119817 () Bool)

(declare-fun lt!446057 () (_ BitVec 32))

(assert (=> d!119817 (and (bvsge lt!446057 #b00000000000000000000000000000000) (bvslt lt!446057 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(assert (=> d!119817 (= lt!446057 (choose!52 (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464))))

(assert (=> d!119817 (validMask!0 mask!3464)))

(assert (=> d!119817 (= (nextIndex!0 (toIndex!0 (select (arr!30623 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446057)))

(declare-fun bs!28698 () Bool)

(assert (= bs!28698 d!119817))

(assert (=> bs!28698 m!933569))

(declare-fun m!933805 () Bool)

(assert (=> bs!28698 m!933805))

(assert (=> bs!28698 m!933557))

(assert (=> b!1009117 d!119817))

(declare-fun d!119819 () Bool)

(declare-fun lt!446060 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!484 (List!21299) (InoxSet (_ BitVec 64)))

(assert (=> d!119819 (= lt!446060 (select (content!484 Nil!21296) (select (arr!30623 a!3219) #b00000000000000000000000000000000)))))

(declare-fun e!567822 () Bool)

(assert (=> d!119819 (= lt!446060 e!567822)))

(declare-fun res!677930 () Bool)

(assert (=> d!119819 (=> (not res!677930) (not e!567822))))

(assert (=> d!119819 (= res!677930 ((_ is Cons!21295) Nil!21296))))

(assert (=> d!119819 (= (contains!5890 Nil!21296 (select (arr!30623 a!3219) #b00000000000000000000000000000000)) lt!446060)))

(declare-fun b!1009235 () Bool)

(declare-fun e!567821 () Bool)

(assert (=> b!1009235 (= e!567822 e!567821)))

(declare-fun res!677931 () Bool)

(assert (=> b!1009235 (=> res!677931 e!567821)))

(assert (=> b!1009235 (= res!677931 (= (h!22481 Nil!21296) (select (arr!30623 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009236 () Bool)

(assert (=> b!1009236 (= e!567821 (contains!5890 (t!30300 Nil!21296) (select (arr!30623 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119819 res!677930) b!1009235))

(assert (= (and b!1009235 (not res!677931)) b!1009236))

(declare-fun m!933807 () Bool)

(assert (=> d!119819 m!933807))

(assert (=> d!119819 m!933625))

(declare-fun m!933809 () Bool)

(assert (=> d!119819 m!933809))

(assert (=> b!1009236 m!933625))

(declare-fun m!933811 () Bool)

(assert (=> b!1009236 m!933811))

(assert (=> b!1008993 d!119819))

(declare-fun b!1009237 () Bool)

(declare-fun e!567826 () Bool)

(declare-fun e!567824 () Bool)

(assert (=> b!1009237 (= e!567826 e!567824)))

(declare-fun c!101808 () Bool)

(assert (=> b!1009237 (= c!101808 (validKeyInArray!0 (select (arr!30623 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!42384 () Bool)

(declare-fun bm!42381 () Bool)

(assert (=> bm!42381 (= call!42384 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!101808 (Cons!21295 (select (arr!30623 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!101729 (Cons!21295 (select (arr!30623 a!3219) #b00000000000000000000000000000000) Nil!21296) Nil!21296)) (ite c!101729 (Cons!21295 (select (arr!30623 a!3219) #b00000000000000000000000000000000) Nil!21296) Nil!21296))))))

(declare-fun b!1009238 () Bool)

(declare-fun e!567823 () Bool)

(assert (=> b!1009238 (= e!567823 (contains!5890 (ite c!101729 (Cons!21295 (select (arr!30623 a!3219) #b00000000000000000000000000000000) Nil!21296) Nil!21296) (select (arr!30623 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1009239 () Bool)

(assert (=> b!1009239 (= e!567824 call!42384)))

(declare-fun d!119821 () Bool)

(declare-fun res!677934 () Bool)

(declare-fun e!567825 () Bool)

(assert (=> d!119821 (=> res!677934 e!567825)))

(assert (=> d!119821 (= res!677934 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31125 a!3219)))))

(assert (=> d!119821 (= (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101729 (Cons!21295 (select (arr!30623 a!3219) #b00000000000000000000000000000000) Nil!21296) Nil!21296)) e!567825)))

(declare-fun b!1009240 () Bool)

(assert (=> b!1009240 (= e!567825 e!567826)))

(declare-fun res!677932 () Bool)

(assert (=> b!1009240 (=> (not res!677932) (not e!567826))))

(assert (=> b!1009240 (= res!677932 (not e!567823))))

(declare-fun res!677933 () Bool)

(assert (=> b!1009240 (=> (not res!677933) (not e!567823))))

(assert (=> b!1009240 (= res!677933 (validKeyInArray!0 (select (arr!30623 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1009241 () Bool)

(assert (=> b!1009241 (= e!567824 call!42384)))

(assert (= (and d!119821 (not res!677934)) b!1009240))

(assert (= (and b!1009240 res!677933) b!1009238))

(assert (= (and b!1009240 res!677932) b!1009237))

(assert (= (and b!1009237 c!101808) b!1009241))

(assert (= (and b!1009237 (not c!101808)) b!1009239))

(assert (= (or b!1009241 b!1009239) bm!42381))

(declare-fun m!933813 () Bool)

(assert (=> b!1009237 m!933813))

(assert (=> b!1009237 m!933813))

(declare-fun m!933815 () Bool)

(assert (=> b!1009237 m!933815))

(assert (=> bm!42381 m!933813))

(declare-fun m!933817 () Bool)

(assert (=> bm!42381 m!933817))

(assert (=> b!1009238 m!933813))

(assert (=> b!1009238 m!933813))

(declare-fun m!933819 () Bool)

(assert (=> b!1009238 m!933819))

(assert (=> b!1009240 m!933813))

(assert (=> b!1009240 m!933813))

(assert (=> b!1009240 m!933815))

(assert (=> bm!42368 d!119821))

(declare-fun b!1009254 () Bool)

(declare-fun c!101817 () Bool)

(declare-fun lt!446065 () (_ BitVec 64))

(assert (=> b!1009254 (= c!101817 (= lt!446065 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567833 () SeekEntryResult!9555)

(declare-fun e!567835 () SeekEntryResult!9555)

(assert (=> b!1009254 (= e!567833 e!567835)))

(declare-fun b!1009255 () Bool)

(assert (=> b!1009255 (= e!567835 (seekKeyOrZeroReturnVacant!0 (bvadd (x!87977 lt!445992) #b00000000000000000000000000000001) (nextIndex!0 (index!40593 lt!445992) (x!87977 lt!445992) mask!3464) (index!40593 lt!445992) k0!2224 a!3219 mask!3464))))

(declare-fun b!1009256 () Bool)

(assert (=> b!1009256 (= e!567833 (Found!9555 (index!40593 lt!445992)))))

(declare-fun lt!446066 () SeekEntryResult!9555)

(declare-fun d!119823 () Bool)

(assert (=> d!119823 (and (or ((_ is Undefined!9555) lt!446066) (not ((_ is Found!9555) lt!446066)) (and (bvsge (index!40592 lt!446066) #b00000000000000000000000000000000) (bvslt (index!40592 lt!446066) (size!31125 a!3219)))) (or ((_ is Undefined!9555) lt!446066) ((_ is Found!9555) lt!446066) (not ((_ is MissingVacant!9555) lt!446066)) (not (= (index!40594 lt!446066) (index!40593 lt!445992))) (and (bvsge (index!40594 lt!446066) #b00000000000000000000000000000000) (bvslt (index!40594 lt!446066) (size!31125 a!3219)))) (or ((_ is Undefined!9555) lt!446066) (ite ((_ is Found!9555) lt!446066) (= (select (arr!30623 a!3219) (index!40592 lt!446066)) k0!2224) (and ((_ is MissingVacant!9555) lt!446066) (= (index!40594 lt!446066) (index!40593 lt!445992)) (= (select (arr!30623 a!3219) (index!40594 lt!446066)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!567834 () SeekEntryResult!9555)

(assert (=> d!119823 (= lt!446066 e!567834)))

(declare-fun c!101815 () Bool)

(assert (=> d!119823 (= c!101815 (bvsge (x!87977 lt!445992) #b01111111111111111111111111111110))))

(assert (=> d!119823 (= lt!446065 (select (arr!30623 a!3219) (index!40593 lt!445992)))))

(assert (=> d!119823 (validMask!0 mask!3464)))

(assert (=> d!119823 (= (seekKeyOrZeroReturnVacant!0 (x!87977 lt!445992) (index!40593 lt!445992) (index!40593 lt!445992) k0!2224 a!3219 mask!3464) lt!446066)))

(declare-fun b!1009257 () Bool)

(assert (=> b!1009257 (= e!567835 (MissingVacant!9555 (index!40593 lt!445992)))))

(declare-fun b!1009258 () Bool)

(assert (=> b!1009258 (= e!567834 Undefined!9555)))

(declare-fun b!1009259 () Bool)

(assert (=> b!1009259 (= e!567834 e!567833)))

(declare-fun c!101816 () Bool)

(assert (=> b!1009259 (= c!101816 (= lt!446065 k0!2224))))

(assert (= (and d!119823 c!101815) b!1009258))

(assert (= (and d!119823 (not c!101815)) b!1009259))

(assert (= (and b!1009259 c!101816) b!1009256))

(assert (= (and b!1009259 (not c!101816)) b!1009254))

(assert (= (and b!1009254 c!101817) b!1009257))

(assert (= (and b!1009254 (not c!101817)) b!1009255))

(declare-fun m!933821 () Bool)

(assert (=> b!1009255 m!933821))

(assert (=> b!1009255 m!933821))

(declare-fun m!933823 () Bool)

(assert (=> b!1009255 m!933823))

(declare-fun m!933825 () Bool)

(assert (=> d!119823 m!933825))

(declare-fun m!933827 () Bool)

(assert (=> d!119823 m!933827))

(assert (=> d!119823 m!933703))

(assert (=> d!119823 m!933557))

(assert (=> b!1009096 d!119823))

(declare-fun b!1009260 () Bool)

(declare-fun e!567840 () SeekEntryResult!9555)

(declare-fun e!567836 () SeekEntryResult!9555)

(assert (=> b!1009260 (= e!567840 e!567836)))

(declare-fun c!101820 () Bool)

(declare-fun lt!446068 () (_ BitVec 64))

(assert (=> b!1009260 (= c!101820 (or (= lt!446068 lt!445910) (= (bvadd lt!446068 lt!446068) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009261 () Bool)

(assert (=> b!1009261 (= e!567836 (Intermediate!9555 false (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1009262 () Bool)

(assert (=> b!1009262 (= e!567836 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!445910 lt!445906 mask!3464))))

(declare-fun b!1009263 () Bool)

(declare-fun e!567838 () Bool)

(declare-fun e!567837 () Bool)

(assert (=> b!1009263 (= e!567838 e!567837)))

(declare-fun res!677937 () Bool)

(declare-fun lt!446067 () SeekEntryResult!9555)

(assert (=> b!1009263 (= res!677937 (and ((_ is Intermediate!9555) lt!446067) (not (undefined!10367 lt!446067)) (bvslt (x!87977 lt!446067) #b01111111111111111111111111111110) (bvsge (x!87977 lt!446067) #b00000000000000000000000000000000) (bvsge (x!87977 lt!446067) (bvadd x!1245 #b00000000000000000000000000000001))))))

(assert (=> b!1009263 (=> (not res!677937) (not e!567837))))

(declare-fun b!1009265 () Bool)

(assert (=> b!1009265 (= e!567838 (bvsge (x!87977 lt!446067) #b01111111111111111111111111111110))))

(declare-fun b!1009266 () Bool)

(assert (=> b!1009266 (and (bvsge (index!40593 lt!446067) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446067) (size!31125 lt!445906)))))

(declare-fun e!567839 () Bool)

(assert (=> b!1009266 (= e!567839 (= (select (arr!30623 lt!445906) (index!40593 lt!446067)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009267 () Bool)

(assert (=> b!1009267 (= e!567840 (Intermediate!9555 true (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1009268 () Bool)

(assert (=> b!1009268 (and (bvsge (index!40593 lt!446067) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446067) (size!31125 lt!445906)))))

(declare-fun res!677936 () Bool)

(assert (=> b!1009268 (= res!677936 (= (select (arr!30623 lt!445906) (index!40593 lt!446067)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009268 (=> res!677936 e!567839)))

(declare-fun b!1009264 () Bool)

(assert (=> b!1009264 (and (bvsge (index!40593 lt!446067) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446067) (size!31125 lt!445906)))))

(declare-fun res!677935 () Bool)

(assert (=> b!1009264 (= res!677935 (= (select (arr!30623 lt!445906) (index!40593 lt!446067)) lt!445910))))

(assert (=> b!1009264 (=> res!677935 e!567839)))

(assert (=> b!1009264 (= e!567837 e!567839)))

(declare-fun d!119825 () Bool)

(assert (=> d!119825 e!567838))

(declare-fun c!101819 () Bool)

(assert (=> d!119825 (= c!101819 (and ((_ is Intermediate!9555) lt!446067) (undefined!10367 lt!446067)))))

(assert (=> d!119825 (= lt!446067 e!567840)))

(declare-fun c!101818 () Bool)

(assert (=> d!119825 (= c!101818 (bvsge (bvadd x!1245 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!119825 (= lt!446068 (select (arr!30623 lt!445906) (nextIndex!0 index!1507 x!1245 mask!3464)))))

(assert (=> d!119825 (validMask!0 mask!3464)))

(assert (=> d!119825 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!445910 lt!445906 mask!3464) lt!446067)))

(assert (= (and d!119825 c!101818) b!1009267))

(assert (= (and d!119825 (not c!101818)) b!1009260))

(assert (= (and b!1009260 c!101820) b!1009261))

(assert (= (and b!1009260 (not c!101820)) b!1009262))

(assert (= (and d!119825 c!101819) b!1009265))

(assert (= (and d!119825 (not c!101819)) b!1009263))

(assert (= (and b!1009263 res!677937) b!1009264))

(assert (= (and b!1009264 (not res!677935)) b!1009268))

(assert (= (and b!1009268 (not res!677936)) b!1009266))

(declare-fun m!933829 () Bool)

(assert (=> b!1009264 m!933829))

(assert (=> b!1009262 m!933573))

(declare-fun m!933831 () Bool)

(assert (=> b!1009262 m!933831))

(assert (=> b!1009262 m!933831))

(declare-fun m!933833 () Bool)

(assert (=> b!1009262 m!933833))

(assert (=> b!1009266 m!933829))

(assert (=> b!1009268 m!933829))

(assert (=> d!119825 m!933573))

(declare-fun m!933835 () Bool)

(assert (=> d!119825 m!933835))

(assert (=> d!119825 m!933557))

(assert (=> b!1008936 d!119825))

(assert (=> b!1008936 d!119781))

(declare-fun d!119827 () Bool)

(declare-fun res!677938 () Bool)

(declare-fun e!567843 () Bool)

(assert (=> d!119827 (=> res!677938 e!567843)))

(assert (=> d!119827 (= res!677938 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31125 a!3219)))))

(assert (=> d!119827 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464) e!567843)))

(declare-fun b!1009269 () Bool)

(declare-fun e!567842 () Bool)

(declare-fun call!42385 () Bool)

(assert (=> b!1009269 (= e!567842 call!42385)))

(declare-fun b!1009270 () Bool)

(declare-fun e!567841 () Bool)

(assert (=> b!1009270 (= e!567841 call!42385)))

(declare-fun b!1009271 () Bool)

(assert (=> b!1009271 (= e!567843 e!567841)))

(declare-fun c!101821 () Bool)

(assert (=> b!1009271 (= c!101821 (validKeyInArray!0 (select (arr!30623 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1009272 () Bool)

(assert (=> b!1009272 (= e!567841 e!567842)))

(declare-fun lt!446070 () (_ BitVec 64))

(assert (=> b!1009272 (= lt!446070 (select (arr!30623 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!446071 () Unit!33016)

(assert (=> b!1009272 (= lt!446071 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1009272 (arrayContainsKey!0 a!3219 lt!446070 #b00000000000000000000000000000000)))

(declare-fun lt!446069 () Unit!33016)

(assert (=> b!1009272 (= lt!446069 lt!446071)))

(declare-fun res!677939 () Bool)

(assert (=> b!1009272 (= res!677939 (= (seekEntryOrOpen!0 (select (arr!30623 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3219 mask!3464) (Found!9555 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1009272 (=> (not res!677939) (not e!567842))))

(declare-fun bm!42382 () Bool)

(assert (=> bm!42382 (= call!42385 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3219 mask!3464))))

(assert (= (and d!119827 (not res!677938)) b!1009271))

(assert (= (and b!1009271 c!101821) b!1009272))

(assert (= (and b!1009271 (not c!101821)) b!1009270))

(assert (= (and b!1009272 res!677939) b!1009269))

(assert (= (or b!1009269 b!1009270) bm!42382))

(assert (=> b!1009271 m!933813))

(assert (=> b!1009271 m!933813))

(assert (=> b!1009271 m!933815))

(assert (=> b!1009272 m!933813))

(declare-fun m!933837 () Bool)

(assert (=> b!1009272 m!933837))

(declare-fun m!933839 () Bool)

(assert (=> b!1009272 m!933839))

(assert (=> b!1009272 m!933813))

(declare-fun m!933841 () Bool)

(assert (=> b!1009272 m!933841))

(declare-fun m!933843 () Bool)

(assert (=> bm!42382 m!933843))

(assert (=> bm!42374 d!119827))

(assert (=> b!1008992 d!119813))

(declare-fun b!1009273 () Bool)

(declare-fun e!567848 () SeekEntryResult!9555)

(declare-fun e!567844 () SeekEntryResult!9555)

(assert (=> b!1009273 (= e!567848 e!567844)))

(declare-fun c!101824 () Bool)

(declare-fun lt!446073 () (_ BitVec 64))

(assert (=> b!1009273 (= c!101824 (or (= lt!446073 (select (arr!30623 a!3219) j!170)) (= (bvadd lt!446073 lt!446073) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009274 () Bool)

(assert (=> b!1009274 (= e!567844 (Intermediate!9555 false (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1009275 () Bool)

(assert (=> b!1009275 (= e!567844 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) (select (arr!30623 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009276 () Bool)

(declare-fun e!567846 () Bool)

(declare-fun e!567845 () Bool)

(assert (=> b!1009276 (= e!567846 e!567845)))

(declare-fun res!677942 () Bool)

(declare-fun lt!446072 () SeekEntryResult!9555)

(assert (=> b!1009276 (= res!677942 (and ((_ is Intermediate!9555) lt!446072) (not (undefined!10367 lt!446072)) (bvslt (x!87977 lt!446072) #b01111111111111111111111111111110) (bvsge (x!87977 lt!446072) #b00000000000000000000000000000000) (bvsge (x!87977 lt!446072) (bvadd x!1245 #b00000000000000000000000000000001))))))

(assert (=> b!1009276 (=> (not res!677942) (not e!567845))))

(declare-fun b!1009278 () Bool)

(assert (=> b!1009278 (= e!567846 (bvsge (x!87977 lt!446072) #b01111111111111111111111111111110))))

(declare-fun b!1009279 () Bool)

(assert (=> b!1009279 (and (bvsge (index!40593 lt!446072) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446072) (size!31125 a!3219)))))

(declare-fun e!567847 () Bool)

(assert (=> b!1009279 (= e!567847 (= (select (arr!30623 a!3219) (index!40593 lt!446072)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009280 () Bool)

(assert (=> b!1009280 (= e!567848 (Intermediate!9555 true (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1009281 () Bool)

(assert (=> b!1009281 (and (bvsge (index!40593 lt!446072) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446072) (size!31125 a!3219)))))

(declare-fun res!677941 () Bool)

(assert (=> b!1009281 (= res!677941 (= (select (arr!30623 a!3219) (index!40593 lt!446072)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009281 (=> res!677941 e!567847)))

(declare-fun b!1009277 () Bool)

(assert (=> b!1009277 (and (bvsge (index!40593 lt!446072) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446072) (size!31125 a!3219)))))

(declare-fun res!677940 () Bool)

(assert (=> b!1009277 (= res!677940 (= (select (arr!30623 a!3219) (index!40593 lt!446072)) (select (arr!30623 a!3219) j!170)))))

(assert (=> b!1009277 (=> res!677940 e!567847)))

(assert (=> b!1009277 (= e!567845 e!567847)))

(declare-fun d!119829 () Bool)

(assert (=> d!119829 e!567846))

(declare-fun c!101823 () Bool)

(assert (=> d!119829 (= c!101823 (and ((_ is Intermediate!9555) lt!446072) (undefined!10367 lt!446072)))))

(assert (=> d!119829 (= lt!446072 e!567848)))

(declare-fun c!101822 () Bool)

(assert (=> d!119829 (= c!101822 (bvsge (bvadd x!1245 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!119829 (= lt!446073 (select (arr!30623 a!3219) (nextIndex!0 index!1507 x!1245 mask!3464)))))

(assert (=> d!119829 (validMask!0 mask!3464)))

(assert (=> d!119829 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30623 a!3219) j!170) a!3219 mask!3464) lt!446072)))

(assert (= (and d!119829 c!101822) b!1009280))

(assert (= (and d!119829 (not c!101822)) b!1009273))

(assert (= (and b!1009273 c!101824) b!1009274))

(assert (= (and b!1009273 (not c!101824)) b!1009275))

(assert (= (and d!119829 c!101823) b!1009278))

(assert (= (and d!119829 (not c!101823)) b!1009276))

(assert (= (and b!1009276 res!677942) b!1009277))

(assert (= (and b!1009277 (not res!677940)) b!1009281))

(assert (= (and b!1009281 (not res!677941)) b!1009279))

(declare-fun m!933845 () Bool)

(assert (=> b!1009277 m!933845))

(assert (=> b!1009275 m!933573))

(assert (=> b!1009275 m!933831))

(assert (=> b!1009275 m!933831))

(assert (=> b!1009275 m!933539))

(declare-fun m!933847 () Bool)

(assert (=> b!1009275 m!933847))

(assert (=> b!1009279 m!933845))

(assert (=> b!1009281 m!933845))

(assert (=> d!119829 m!933573))

(declare-fun m!933849 () Bool)

(assert (=> d!119829 m!933849))

(assert (=> d!119829 m!933557))

(assert (=> b!1009104 d!119829))

(assert (=> b!1009104 d!119781))

(declare-fun b!1009282 () Bool)

(declare-fun e!567853 () SeekEntryResult!9555)

(declare-fun e!567849 () SeekEntryResult!9555)

(assert (=> b!1009282 (= e!567853 e!567849)))

(declare-fun c!101827 () Bool)

(declare-fun lt!446075 () (_ BitVec 64))

(assert (=> b!1009282 (= c!101827 (or (= lt!446075 k0!2224) (= (bvadd lt!446075 lt!446075) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009283 () Bool)

(assert (=> b!1009283 (= e!567849 (Intermediate!9555 false (toIndex!0 k0!2224 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009284 () Bool)

(assert (=> b!1009284 (= e!567849 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2224 mask!3464) #b00000000000000000000000000000000 mask!3464) k0!2224 a!3219 mask!3464))))

(declare-fun b!1009285 () Bool)

(declare-fun e!567851 () Bool)

(declare-fun e!567850 () Bool)

(assert (=> b!1009285 (= e!567851 e!567850)))

(declare-fun res!677945 () Bool)

(declare-fun lt!446074 () SeekEntryResult!9555)

(assert (=> b!1009285 (= res!677945 (and ((_ is Intermediate!9555) lt!446074) (not (undefined!10367 lt!446074)) (bvslt (x!87977 lt!446074) #b01111111111111111111111111111110) (bvsge (x!87977 lt!446074) #b00000000000000000000000000000000) (bvsge (x!87977 lt!446074) #b00000000000000000000000000000000)))))

(assert (=> b!1009285 (=> (not res!677945) (not e!567850))))

(declare-fun b!1009287 () Bool)

(assert (=> b!1009287 (= e!567851 (bvsge (x!87977 lt!446074) #b01111111111111111111111111111110))))

(declare-fun b!1009288 () Bool)

(assert (=> b!1009288 (and (bvsge (index!40593 lt!446074) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446074) (size!31125 a!3219)))))

(declare-fun e!567852 () Bool)

(assert (=> b!1009288 (= e!567852 (= (select (arr!30623 a!3219) (index!40593 lt!446074)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009289 () Bool)

(assert (=> b!1009289 (= e!567853 (Intermediate!9555 true (toIndex!0 k0!2224 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009290 () Bool)

(assert (=> b!1009290 (and (bvsge (index!40593 lt!446074) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446074) (size!31125 a!3219)))))

(declare-fun res!677944 () Bool)

(assert (=> b!1009290 (= res!677944 (= (select (arr!30623 a!3219) (index!40593 lt!446074)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009290 (=> res!677944 e!567852)))

(declare-fun b!1009286 () Bool)

(assert (=> b!1009286 (and (bvsge (index!40593 lt!446074) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446074) (size!31125 a!3219)))))

(declare-fun res!677943 () Bool)

(assert (=> b!1009286 (= res!677943 (= (select (arr!30623 a!3219) (index!40593 lt!446074)) k0!2224))))

(assert (=> b!1009286 (=> res!677943 e!567852)))

(assert (=> b!1009286 (= e!567850 e!567852)))

(declare-fun d!119831 () Bool)

(assert (=> d!119831 e!567851))

(declare-fun c!101826 () Bool)

(assert (=> d!119831 (= c!101826 (and ((_ is Intermediate!9555) lt!446074) (undefined!10367 lt!446074)))))

(assert (=> d!119831 (= lt!446074 e!567853)))

(declare-fun c!101825 () Bool)

(assert (=> d!119831 (= c!101825 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119831 (= lt!446075 (select (arr!30623 a!3219) (toIndex!0 k0!2224 mask!3464)))))

(assert (=> d!119831 (validMask!0 mask!3464)))

(assert (=> d!119831 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464) lt!446074)))

(assert (= (and d!119831 c!101825) b!1009289))

(assert (= (and d!119831 (not c!101825)) b!1009282))

(assert (= (and b!1009282 c!101827) b!1009283))

(assert (= (and b!1009282 (not c!101827)) b!1009284))

(assert (= (and d!119831 c!101826) b!1009287))

(assert (= (and d!119831 (not c!101826)) b!1009285))

(assert (= (and b!1009285 res!677945) b!1009286))

(assert (= (and b!1009286 (not res!677943)) b!1009290))

(assert (= (and b!1009290 (not res!677944)) b!1009288))

(declare-fun m!933851 () Bool)

(assert (=> b!1009286 m!933851))

(assert (=> b!1009284 m!933695))

(declare-fun m!933853 () Bool)

(assert (=> b!1009284 m!933853))

(assert (=> b!1009284 m!933853))

(declare-fun m!933855 () Bool)

(assert (=> b!1009284 m!933855))

(assert (=> b!1009288 m!933851))

(assert (=> b!1009290 m!933851))

(assert (=> d!119831 m!933695))

(declare-fun m!933857 () Bool)

(assert (=> d!119831 m!933857))

(assert (=> d!119831 m!933557))

(assert (=> d!119753 d!119831))

(declare-fun d!119833 () Bool)

(declare-fun lt!446077 () (_ BitVec 32))

(declare-fun lt!446076 () (_ BitVec 32))

(assert (=> d!119833 (= lt!446077 (bvmul (bvxor lt!446076 (bvlshr lt!446076 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119833 (= lt!446076 ((_ extract 31 0) (bvand (bvxor k0!2224 (bvlshr k0!2224 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119833 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!677809 (let ((h!22483 ((_ extract 31 0) (bvand (bvxor k0!2224 (bvlshr k0!2224 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87980 (bvmul (bvxor h!22483 (bvlshr h!22483 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87980 (bvlshr x!87980 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!677809 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!677809 #b00000000000000000000000000000000))))))

(assert (=> d!119833 (= (toIndex!0 k0!2224 mask!3464) (bvand (bvxor lt!446077 (bvlshr lt!446077 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> d!119753 d!119833))

(assert (=> d!119753 d!119783))

(declare-fun d!119835 () Bool)

(declare-fun res!677946 () Bool)

(declare-fun e!567854 () Bool)

(assert (=> d!119835 (=> res!677946 e!567854)))

(assert (=> d!119835 (= res!677946 (= (select (arr!30623 a!3219) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!2224))))

(assert (=> d!119835 (= (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!567854)))

(declare-fun b!1009291 () Bool)

(declare-fun e!567855 () Bool)

(assert (=> b!1009291 (= e!567854 e!567855)))

(declare-fun res!677947 () Bool)

(assert (=> b!1009291 (=> (not res!677947) (not e!567855))))

(assert (=> b!1009291 (= res!677947 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31125 a!3219)))))

(declare-fun b!1009292 () Bool)

(assert (=> b!1009292 (= e!567855 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!119835 (not res!677946)) b!1009291))

(assert (= (and b!1009291 res!677947) b!1009292))

(assert (=> d!119835 m!933813))

(declare-fun m!933859 () Bool)

(assert (=> b!1009292 m!933859))

(assert (=> b!1008948 d!119835))

(assert (=> d!119721 d!119783))

(assert (=> d!119775 d!119783))

(assert (=> b!1009031 d!119813))

(declare-fun b!1009293 () Bool)

(declare-fun e!567860 () SeekEntryResult!9555)

(declare-fun e!567856 () SeekEntryResult!9555)

(assert (=> b!1009293 (= e!567860 e!567856)))

(declare-fun c!101830 () Bool)

(declare-fun lt!446079 () (_ BitVec 64))

(assert (=> b!1009293 (= c!101830 (or (= lt!446079 lt!445910) (= (bvadd lt!446079 lt!446079) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009294 () Bool)

(assert (=> b!1009294 (= e!567856 (Intermediate!9555 false (nextIndex!0 (toIndex!0 lt!445910 mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1009295 () Bool)

(assert (=> b!1009295 (= e!567856 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 lt!445910 mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3464) lt!445910 lt!445906 mask!3464))))

(declare-fun b!1009296 () Bool)

(declare-fun e!567858 () Bool)

(declare-fun e!567857 () Bool)

(assert (=> b!1009296 (= e!567858 e!567857)))

(declare-fun res!677950 () Bool)

(declare-fun lt!446078 () SeekEntryResult!9555)

(assert (=> b!1009296 (= res!677950 (and ((_ is Intermediate!9555) lt!446078) (not (undefined!10367 lt!446078)) (bvslt (x!87977 lt!446078) #b01111111111111111111111111111110) (bvsge (x!87977 lt!446078) #b00000000000000000000000000000000) (bvsge (x!87977 lt!446078) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1009296 (=> (not res!677950) (not e!567857))))

(declare-fun b!1009298 () Bool)

(assert (=> b!1009298 (= e!567858 (bvsge (x!87977 lt!446078) #b01111111111111111111111111111110))))

(declare-fun b!1009299 () Bool)

(assert (=> b!1009299 (and (bvsge (index!40593 lt!446078) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446078) (size!31125 lt!445906)))))

(declare-fun e!567859 () Bool)

(assert (=> b!1009299 (= e!567859 (= (select (arr!30623 lt!445906) (index!40593 lt!446078)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1009300 () Bool)

(assert (=> b!1009300 (= e!567860 (Intermediate!9555 true (nextIndex!0 (toIndex!0 lt!445910 mask!3464) #b00000000000000000000000000000000 mask!3464) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1009301 () Bool)

(assert (=> b!1009301 (and (bvsge (index!40593 lt!446078) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446078) (size!31125 lt!445906)))))

(declare-fun res!677949 () Bool)

(assert (=> b!1009301 (= res!677949 (= (select (arr!30623 lt!445906) (index!40593 lt!446078)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009301 (=> res!677949 e!567859)))

(declare-fun b!1009297 () Bool)

(assert (=> b!1009297 (and (bvsge (index!40593 lt!446078) #b00000000000000000000000000000000) (bvslt (index!40593 lt!446078) (size!31125 lt!445906)))))

(declare-fun res!677948 () Bool)

(assert (=> b!1009297 (= res!677948 (= (select (arr!30623 lt!445906) (index!40593 lt!446078)) lt!445910))))

(assert (=> b!1009297 (=> res!677948 e!567859)))

(assert (=> b!1009297 (= e!567857 e!567859)))

(declare-fun d!119837 () Bool)

(assert (=> d!119837 e!567858))

(declare-fun c!101829 () Bool)

(assert (=> d!119837 (= c!101829 (and ((_ is Intermediate!9555) lt!446078) (undefined!10367 lt!446078)))))

(assert (=> d!119837 (= lt!446078 e!567860)))

(declare-fun c!101828 () Bool)

(assert (=> d!119837 (= c!101828 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!119837 (= lt!446079 (select (arr!30623 lt!445906) (nextIndex!0 (toIndex!0 lt!445910 mask!3464) #b00000000000000000000000000000000 mask!3464)))))

(assert (=> d!119837 (validMask!0 mask!3464)))

(assert (=> d!119837 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!445910 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!445910 lt!445906 mask!3464) lt!446078)))

(assert (= (and d!119837 c!101828) b!1009300))

(assert (= (and d!119837 (not c!101828)) b!1009293))

(assert (= (and b!1009293 c!101830) b!1009294))

(assert (= (and b!1009293 (not c!101830)) b!1009295))

(assert (= (and d!119837 c!101829) b!1009298))

(assert (= (and d!119837 (not c!101829)) b!1009296))

(assert (= (and b!1009296 res!677950) b!1009297))

(assert (= (and b!1009297 (not res!677948)) b!1009301))

(assert (= (and b!1009301 (not res!677949)) b!1009299))

(declare-fun m!933861 () Bool)

(assert (=> b!1009297 m!933861))

(assert (=> b!1009295 m!933613))

(declare-fun m!933863 () Bool)

(assert (=> b!1009295 m!933863))

(assert (=> b!1009295 m!933863))

(declare-fun m!933865 () Bool)

(assert (=> b!1009295 m!933865))

(assert (=> b!1009299 m!933861))

(assert (=> b!1009301 m!933861))

(assert (=> d!119837 m!933613))

(declare-fun m!933867 () Bool)

(assert (=> d!119837 m!933867))

(assert (=> d!119837 m!933557))

(assert (=> b!1008927 d!119837))

(declare-fun d!119839 () Bool)

(declare-fun lt!446080 () (_ BitVec 32))

(assert (=> d!119839 (and (bvsge lt!446080 #b00000000000000000000000000000000) (bvslt lt!446080 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(assert (=> d!119839 (= lt!446080 (choose!52 (toIndex!0 lt!445910 mask!3464) #b00000000000000000000000000000000 mask!3464))))

(assert (=> d!119839 (validMask!0 mask!3464)))

(assert (=> d!119839 (= (nextIndex!0 (toIndex!0 lt!445910 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!446080)))

(declare-fun bs!28699 () Bool)

(assert (= bs!28699 d!119839))

(assert (=> bs!28699 m!933547))

(declare-fun m!933869 () Bool)

(assert (=> bs!28699 m!933869))

(assert (=> bs!28699 m!933557))

(assert (=> b!1008927 d!119839))

(declare-fun d!119841 () Bool)

(assert (=> d!119841 (arrayContainsKey!0 a!3219 lt!445959 #b00000000000000000000000000000000)))

(declare-fun lt!446083 () Unit!33016)

(declare-fun choose!13 (array!63604 (_ BitVec 64) (_ BitVec 32)) Unit!33016)

(assert (=> d!119841 (= lt!446083 (choose!13 a!3219 lt!445959 #b00000000000000000000000000000000))))

(assert (=> d!119841 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!119841 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!445959 #b00000000000000000000000000000000) lt!446083)))

(declare-fun bs!28700 () Bool)

(assert (= bs!28700 d!119841))

(assert (=> bs!28700 m!933659))

(declare-fun m!933871 () Bool)

(assert (=> bs!28700 m!933871))

(assert (=> b!1009032 d!119841))

(declare-fun d!119843 () Bool)

(declare-fun res!677951 () Bool)

(declare-fun e!567861 () Bool)

(assert (=> d!119843 (=> res!677951 e!567861)))

(assert (=> d!119843 (= res!677951 (= (select (arr!30623 a!3219) #b00000000000000000000000000000000) lt!445959))))

(assert (=> d!119843 (= (arrayContainsKey!0 a!3219 lt!445959 #b00000000000000000000000000000000) e!567861)))

(declare-fun b!1009302 () Bool)

(declare-fun e!567862 () Bool)

(assert (=> b!1009302 (= e!567861 e!567862)))

(declare-fun res!677952 () Bool)

(assert (=> b!1009302 (=> (not res!677952) (not e!567862))))

(assert (=> b!1009302 (= res!677952 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31125 a!3219)))))

(declare-fun b!1009303 () Bool)

(assert (=> b!1009303 (= e!567862 (arrayContainsKey!0 a!3219 lt!445959 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119843 (not res!677951)) b!1009302))

(assert (= (and b!1009302 res!677952) b!1009303))

(assert (=> d!119843 m!933625))

(declare-fun m!933873 () Bool)

(assert (=> b!1009303 m!933873))

(assert (=> b!1009032 d!119843))

(declare-fun lt!446084 () SeekEntryResult!9555)

(declare-fun b!1009304 () Bool)

(declare-fun e!567863 () SeekEntryResult!9555)

(assert (=> b!1009304 (= e!567863 (seekKeyOrZeroReturnVacant!0 (x!87977 lt!446084) (index!40593 lt!446084) (index!40593 lt!446084) (select (arr!30623 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464))))

(declare-fun b!1009305 () Bool)

(declare-fun e!567864 () SeekEntryResult!9555)

(assert (=> b!1009305 (= e!567864 Undefined!9555)))

(declare-fun d!119845 () Bool)

(declare-fun lt!446085 () SeekEntryResult!9555)

(assert (=> d!119845 (and (or ((_ is Undefined!9555) lt!446085) (not ((_ is Found!9555) lt!446085)) (and (bvsge (index!40592 lt!446085) #b00000000000000000000000000000000) (bvslt (index!40592 lt!446085) (size!31125 a!3219)))) (or ((_ is Undefined!9555) lt!446085) ((_ is Found!9555) lt!446085) (not ((_ is MissingZero!9555) lt!446085)) (and (bvsge (index!40591 lt!446085) #b00000000000000000000000000000000) (bvslt (index!40591 lt!446085) (size!31125 a!3219)))) (or ((_ is Undefined!9555) lt!446085) ((_ is Found!9555) lt!446085) ((_ is MissingZero!9555) lt!446085) (not ((_ is MissingVacant!9555) lt!446085)) (and (bvsge (index!40594 lt!446085) #b00000000000000000000000000000000) (bvslt (index!40594 lt!446085) (size!31125 a!3219)))) (or ((_ is Undefined!9555) lt!446085) (ite ((_ is Found!9555) lt!446085) (= (select (arr!30623 a!3219) (index!40592 lt!446085)) (select (arr!30623 a!3219) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9555) lt!446085) (= (select (arr!30623 a!3219) (index!40591 lt!446085)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9555) lt!446085) (= (select (arr!30623 a!3219) (index!40594 lt!446085)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119845 (= lt!446085 e!567864)))

(declare-fun c!101832 () Bool)

(assert (=> d!119845 (= c!101832 (and ((_ is Intermediate!9555) lt!446084) (undefined!10367 lt!446084)))))

(assert (=> d!119845 (= lt!446084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30623 a!3219) #b00000000000000000000000000000000) mask!3464) (select (arr!30623 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464))))

(assert (=> d!119845 (validMask!0 mask!3464)))

(assert (=> d!119845 (= (seekEntryOrOpen!0 (select (arr!30623 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) lt!446085)))

(declare-fun b!1009306 () Bool)

(declare-fun e!567865 () SeekEntryResult!9555)

(assert (=> b!1009306 (= e!567865 (Found!9555 (index!40593 lt!446084)))))

(declare-fun b!1009307 () Bool)

(assert (=> b!1009307 (= e!567863 (MissingZero!9555 (index!40593 lt!446084)))))

(declare-fun b!1009308 () Bool)

(declare-fun c!101831 () Bool)

(declare-fun lt!446086 () (_ BitVec 64))

(assert (=> b!1009308 (= c!101831 (= lt!446086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009308 (= e!567865 e!567863)))

(declare-fun b!1009309 () Bool)

(assert (=> b!1009309 (= e!567864 e!567865)))

(assert (=> b!1009309 (= lt!446086 (select (arr!30623 a!3219) (index!40593 lt!446084)))))

(declare-fun c!101833 () Bool)

(assert (=> b!1009309 (= c!101833 (= lt!446086 (select (arr!30623 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119845 c!101832) b!1009305))

(assert (= (and d!119845 (not c!101832)) b!1009309))

(assert (= (and b!1009309 c!101833) b!1009306))

(assert (= (and b!1009309 (not c!101833)) b!1009308))

(assert (= (and b!1009308 c!101831) b!1009307))

(assert (= (and b!1009308 (not c!101831)) b!1009304))

(assert (=> b!1009304 m!933625))

(declare-fun m!933875 () Bool)

(assert (=> b!1009304 m!933875))

(declare-fun m!933877 () Bool)

(assert (=> d!119845 m!933877))

(declare-fun m!933879 () Bool)

(assert (=> d!119845 m!933879))

(assert (=> d!119845 m!933625))

(declare-fun m!933881 () Bool)

(assert (=> d!119845 m!933881))

(assert (=> d!119845 m!933557))

(assert (=> d!119845 m!933625))

(assert (=> d!119845 m!933879))

(declare-fun m!933883 () Bool)

(assert (=> d!119845 m!933883))

(declare-fun m!933885 () Bool)

(assert (=> d!119845 m!933885))

(declare-fun m!933887 () Bool)

(assert (=> b!1009309 m!933887))

(assert (=> b!1009032 d!119845))

(check-sat (not d!119823) (not d!119825) (not bm!42381) (not b!1009275) (not b!1009292) (not d!119819) (not b!1009304) (not d!119815) (not b!1009240) (not b!1009238) (not b!1009271) (not b!1009262) (not d!119839) (not b!1009237) (not d!119831) (not bm!42382) (not b!1009255) (not b!1009303) (not d!119845) (not d!119837) (not b!1009236) (not b!1009295) (not d!119841) (not b!1009284) (not d!119829) (not d!119817) (not b!1009272) (not b!1009224))
(check-sat)
