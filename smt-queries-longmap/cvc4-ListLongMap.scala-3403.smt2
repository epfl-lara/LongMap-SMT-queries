; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47080 () Bool)

(assert start!47080)

(declare-fun b!518884 () Bool)

(declare-fun res!317668 () Bool)

(declare-fun e!302754 () Bool)

(assert (=> b!518884 (=> (not res!317668) (not e!302754))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33158 0))(
  ( (array!33159 (arr!15941 (Array (_ BitVec 32) (_ BitVec 64))) (size!16305 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33158)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!518884 (= res!317668 (and (= (size!16305 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16305 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16305 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518885 () Bool)

(declare-fun e!302756 () Bool)

(assert (=> b!518885 (= e!302756 false)))

(declare-fun b!518886 () Bool)

(declare-fun e!302751 () Bool)

(declare-fun e!302757 () Bool)

(assert (=> b!518886 (= e!302751 (not e!302757))))

(declare-fun res!317665 () Bool)

(assert (=> b!518886 (=> res!317665 e!302757)))

(declare-datatypes ((SeekEntryResult!4408 0))(
  ( (MissingZero!4408 (index!19823 (_ BitVec 32))) (Found!4408 (index!19824 (_ BitVec 32))) (Intermediate!4408 (undefined!5220 Bool) (index!19825 (_ BitVec 32)) (x!48790 (_ BitVec 32))) (Undefined!4408) (MissingVacant!4408 (index!19826 (_ BitVec 32))) )
))
(declare-fun lt!237581 () SeekEntryResult!4408)

(declare-fun lt!237585 () (_ BitVec 32))

(declare-fun lt!237589 () array!33158)

(declare-fun lt!237583 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33158 (_ BitVec 32)) SeekEntryResult!4408)

(assert (=> b!518886 (= res!317665 (= lt!237581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237585 lt!237583 lt!237589 mask!3524)))))

(declare-fun lt!237586 () (_ BitVec 32))

(assert (=> b!518886 (= lt!237581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237586 (select (arr!15941 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518886 (= lt!237585 (toIndex!0 lt!237583 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!518886 (= lt!237583 (select (store (arr!15941 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!518886 (= lt!237586 (toIndex!0 (select (arr!15941 a!3235) j!176) mask!3524))))

(assert (=> b!518886 (= lt!237589 (array!33159 (store (arr!15941 a!3235) i!1204 k!2280) (size!16305 a!3235)))))

(declare-fun e!302755 () Bool)

(assert (=> b!518886 e!302755))

(declare-fun res!317674 () Bool)

(assert (=> b!518886 (=> (not res!317674) (not e!302755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33158 (_ BitVec 32)) Bool)

(assert (=> b!518886 (= res!317674 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16084 0))(
  ( (Unit!16085) )
))
(declare-fun lt!237587 () Unit!16084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16084)

(assert (=> b!518886 (= lt!237587 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518887 () Bool)

(declare-fun res!317675 () Bool)

(assert (=> b!518887 (=> (not res!317675) (not e!302754))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518887 (= res!317675 (validKeyInArray!0 k!2280))))

(declare-fun b!518888 () Bool)

(declare-fun res!317664 () Bool)

(assert (=> b!518888 (=> (not res!317664) (not e!302751))))

(declare-datatypes ((List!10099 0))(
  ( (Nil!10096) (Cons!10095 (h!11005 (_ BitVec 64)) (t!16327 List!10099)) )
))
(declare-fun arrayNoDuplicates!0 (array!33158 (_ BitVec 32) List!10099) Bool)

(assert (=> b!518888 (= res!317664 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10096))))

(declare-fun b!518889 () Bool)

(assert (=> b!518889 (= e!302754 e!302751)))

(declare-fun res!317669 () Bool)

(assert (=> b!518889 (=> (not res!317669) (not e!302751))))

(declare-fun lt!237588 () SeekEntryResult!4408)

(assert (=> b!518889 (= res!317669 (or (= lt!237588 (MissingZero!4408 i!1204)) (= lt!237588 (MissingVacant!4408 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33158 (_ BitVec 32)) SeekEntryResult!4408)

(assert (=> b!518889 (= lt!237588 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!518890 () Bool)

(declare-fun e!302752 () Unit!16084)

(declare-fun Unit!16086 () Unit!16084)

(assert (=> b!518890 (= e!302752 Unit!16086)))

(declare-fun b!518891 () Bool)

(assert (=> b!518891 (= e!302757 (or (= (select (arr!15941 a!3235) (index!19825 lt!237581)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!19825 lt!237581) #b00000000000000000000000000000000) (bvslt (index!19825 lt!237581) (size!16305 a!3235)))))))

(declare-fun lt!237584 () Unit!16084)

(assert (=> b!518891 (= lt!237584 e!302752)))

(declare-fun c!60905 () Bool)

(assert (=> b!518891 (= c!60905 (= (select (arr!15941 a!3235) (index!19825 lt!237581)) (select (arr!15941 a!3235) j!176)))))

(assert (=> b!518891 (and (bvslt (x!48790 lt!237581) #b01111111111111111111111111111110) (or (= (select (arr!15941 a!3235) (index!19825 lt!237581)) (select (arr!15941 a!3235) j!176)) (= (select (arr!15941 a!3235) (index!19825 lt!237581)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15941 a!3235) (index!19825 lt!237581)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518892 () Bool)

(declare-fun res!317667 () Bool)

(assert (=> b!518892 (=> res!317667 e!302757)))

(assert (=> b!518892 (= res!317667 (or (undefined!5220 lt!237581) (not (is-Intermediate!4408 lt!237581))))))

(declare-fun res!317672 () Bool)

(assert (=> start!47080 (=> (not res!317672) (not e!302754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47080 (= res!317672 (validMask!0 mask!3524))))

(assert (=> start!47080 e!302754))

(assert (=> start!47080 true))

(declare-fun array_inv!11737 (array!33158) Bool)

(assert (=> start!47080 (array_inv!11737 a!3235)))

(declare-fun b!518893 () Bool)

(assert (=> b!518893 (= e!302755 (= (seekEntryOrOpen!0 (select (arr!15941 a!3235) j!176) a!3235 mask!3524) (Found!4408 j!176)))))

(declare-fun b!518894 () Bool)

(declare-fun res!317671 () Bool)

(assert (=> b!518894 (=> (not res!317671) (not e!302754))))

(declare-fun arrayContainsKey!0 (array!33158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518894 (= res!317671 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518895 () Bool)

(declare-fun res!317666 () Bool)

(assert (=> b!518895 (=> (not res!317666) (not e!302751))))

(assert (=> b!518895 (= res!317666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518896 () Bool)

(declare-fun Unit!16087 () Unit!16084)

(assert (=> b!518896 (= e!302752 Unit!16087)))

(declare-fun lt!237582 () Unit!16084)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33158 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16084)

(assert (=> b!518896 (= lt!237582 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237586 #b00000000000000000000000000000000 (index!19825 lt!237581) (x!48790 lt!237581) mask!3524))))

(declare-fun res!317670 () Bool)

(assert (=> b!518896 (= res!317670 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237586 lt!237583 lt!237589 mask!3524) (Intermediate!4408 false (index!19825 lt!237581) (x!48790 lt!237581))))))

(assert (=> b!518896 (=> (not res!317670) (not e!302756))))

(assert (=> b!518896 e!302756))

(declare-fun b!518897 () Bool)

(declare-fun res!317673 () Bool)

(assert (=> b!518897 (=> (not res!317673) (not e!302754))))

(assert (=> b!518897 (= res!317673 (validKeyInArray!0 (select (arr!15941 a!3235) j!176)))))

(assert (= (and start!47080 res!317672) b!518884))

(assert (= (and b!518884 res!317668) b!518897))

(assert (= (and b!518897 res!317673) b!518887))

(assert (= (and b!518887 res!317675) b!518894))

(assert (= (and b!518894 res!317671) b!518889))

(assert (= (and b!518889 res!317669) b!518895))

(assert (= (and b!518895 res!317666) b!518888))

(assert (= (and b!518888 res!317664) b!518886))

(assert (= (and b!518886 res!317674) b!518893))

(assert (= (and b!518886 (not res!317665)) b!518892))

(assert (= (and b!518892 (not res!317667)) b!518891))

(assert (= (and b!518891 c!60905) b!518896))

(assert (= (and b!518891 (not c!60905)) b!518890))

(assert (= (and b!518896 res!317670) b!518885))

(declare-fun m!500169 () Bool)

(assert (=> b!518886 m!500169))

(declare-fun m!500171 () Bool)

(assert (=> b!518886 m!500171))

(declare-fun m!500173 () Bool)

(assert (=> b!518886 m!500173))

(declare-fun m!500175 () Bool)

(assert (=> b!518886 m!500175))

(declare-fun m!500177 () Bool)

(assert (=> b!518886 m!500177))

(declare-fun m!500179 () Bool)

(assert (=> b!518886 m!500179))

(assert (=> b!518886 m!500169))

(declare-fun m!500181 () Bool)

(assert (=> b!518886 m!500181))

(assert (=> b!518886 m!500169))

(declare-fun m!500183 () Bool)

(assert (=> b!518886 m!500183))

(declare-fun m!500185 () Bool)

(assert (=> b!518886 m!500185))

(declare-fun m!500187 () Bool)

(assert (=> b!518894 m!500187))

(declare-fun m!500189 () Bool)

(assert (=> b!518895 m!500189))

(declare-fun m!500191 () Bool)

(assert (=> start!47080 m!500191))

(declare-fun m!500193 () Bool)

(assert (=> start!47080 m!500193))

(assert (=> b!518893 m!500169))

(assert (=> b!518893 m!500169))

(declare-fun m!500195 () Bool)

(assert (=> b!518893 m!500195))

(declare-fun m!500197 () Bool)

(assert (=> b!518888 m!500197))

(declare-fun m!500199 () Bool)

(assert (=> b!518896 m!500199))

(declare-fun m!500201 () Bool)

(assert (=> b!518896 m!500201))

(assert (=> b!518897 m!500169))

(assert (=> b!518897 m!500169))

(declare-fun m!500203 () Bool)

(assert (=> b!518897 m!500203))

(declare-fun m!500205 () Bool)

(assert (=> b!518889 m!500205))

(declare-fun m!500207 () Bool)

(assert (=> b!518887 m!500207))

(declare-fun m!500209 () Bool)

(assert (=> b!518891 m!500209))

(assert (=> b!518891 m!500169))

(push 1)

(assert (not start!47080))

(assert (not b!518889))

(assert (not b!518887))

(assert (not b!518886))

(assert (not b!518895))

(assert (not b!518896))

(assert (not b!518897))

(assert (not b!518893))

(assert (not b!518888))

(assert (not b!518894))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79983 () Bool)

(assert (=> d!79983 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518887 d!79983))

(declare-fun b!518938 () Bool)

(declare-fun e!302785 () Bool)

(declare-fun e!302786 () Bool)

(assert (=> b!518938 (= e!302785 e!302786)))

(declare-fun res!317689 () Bool)

(assert (=> b!518938 (=> (not res!317689) (not e!302786))))

(declare-fun e!302787 () Bool)

(assert (=> b!518938 (= res!317689 (not e!302787))))

(declare-fun res!317691 () Bool)

(assert (=> b!518938 (=> (not res!317691) (not e!302787))))

(assert (=> b!518938 (= res!317691 (validKeyInArray!0 (select (arr!15941 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518939 () Bool)

(declare-fun e!302784 () Bool)

(declare-fun call!31730 () Bool)

(assert (=> b!518939 (= e!302784 call!31730)))

(declare-fun d!79985 () Bool)

(declare-fun res!317690 () Bool)

(assert (=> d!79985 (=> res!317690 e!302785)))

(assert (=> d!79985 (= res!317690 (bvsge #b00000000000000000000000000000000 (size!16305 a!3235)))))

(assert (=> d!79985 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10096) e!302785)))

(declare-fun b!518940 () Bool)

(declare-fun contains!2753 (List!10099 (_ BitVec 64)) Bool)

(assert (=> b!518940 (= e!302787 (contains!2753 Nil!10096 (select (arr!15941 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518941 () Bool)

(assert (=> b!518941 (= e!302784 call!31730)))

(declare-fun b!518942 () Bool)

(assert (=> b!518942 (= e!302786 e!302784)))

(declare-fun c!60920 () Bool)

(assert (=> b!518942 (= c!60920 (validKeyInArray!0 (select (arr!15941 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31727 () Bool)

(assert (=> bm!31727 (= call!31730 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60920 (Cons!10095 (select (arr!15941 a!3235) #b00000000000000000000000000000000) Nil!10096) Nil!10096)))))

(assert (= (and d!79985 (not res!317690)) b!518938))

(assert (= (and b!518938 res!317691) b!518940))

(assert (= (and b!518938 res!317689) b!518942))

(assert (= (and b!518942 c!60920) b!518939))

(assert (= (and b!518942 (not c!60920)) b!518941))

(assert (= (or b!518939 b!518941) bm!31727))

(declare-fun m!500229 () Bool)

(assert (=> b!518938 m!500229))

(assert (=> b!518938 m!500229))

(declare-fun m!500231 () Bool)

(assert (=> b!518938 m!500231))

(assert (=> b!518940 m!500229))

(assert (=> b!518940 m!500229))

(declare-fun m!500233 () Bool)

(assert (=> b!518940 m!500233))

(assert (=> b!518942 m!500229))

(assert (=> b!518942 m!500229))

(assert (=> b!518942 m!500231))

(assert (=> bm!31727 m!500229))

(declare-fun m!500235 () Bool)

(assert (=> bm!31727 m!500235))

(assert (=> b!518888 d!79985))

(declare-fun d!79989 () Bool)

(declare-fun lt!237653 () SeekEntryResult!4408)

(assert (=> d!79989 (and (or (is-Undefined!4408 lt!237653) (not (is-Found!4408 lt!237653)) (and (bvsge (index!19824 lt!237653) #b00000000000000000000000000000000) (bvslt (index!19824 lt!237653) (size!16305 a!3235)))) (or (is-Undefined!4408 lt!237653) (is-Found!4408 lt!237653) (not (is-MissingZero!4408 lt!237653)) (and (bvsge (index!19823 lt!237653) #b00000000000000000000000000000000) (bvslt (index!19823 lt!237653) (size!16305 a!3235)))) (or (is-Undefined!4408 lt!237653) (is-Found!4408 lt!237653) (is-MissingZero!4408 lt!237653) (not (is-MissingVacant!4408 lt!237653)) (and (bvsge (index!19826 lt!237653) #b00000000000000000000000000000000) (bvslt (index!19826 lt!237653) (size!16305 a!3235)))) (or (is-Undefined!4408 lt!237653) (ite (is-Found!4408 lt!237653) (= (select (arr!15941 a!3235) (index!19824 lt!237653)) (select (arr!15941 a!3235) j!176)) (ite (is-MissingZero!4408 lt!237653) (= (select (arr!15941 a!3235) (index!19823 lt!237653)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4408 lt!237653) (= (select (arr!15941 a!3235) (index!19826 lt!237653)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302855 () SeekEntryResult!4408)

(assert (=> d!79989 (= lt!237653 e!302855)))

(declare-fun c!60957 () Bool)

(declare-fun lt!237655 () SeekEntryResult!4408)

(assert (=> d!79989 (= c!60957 (and (is-Intermediate!4408 lt!237655) (undefined!5220 lt!237655)))))

(assert (=> d!79989 (= lt!237655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15941 a!3235) j!176) mask!3524) (select (arr!15941 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79989 (validMask!0 mask!3524)))

(assert (=> d!79989 (= (seekEntryOrOpen!0 (select (arr!15941 a!3235) j!176) a!3235 mask!3524) lt!237653)))

(declare-fun b!519049 () Bool)

(declare-fun e!302854 () SeekEntryResult!4408)

(assert (=> b!519049 (= e!302854 (Found!4408 (index!19825 lt!237655)))))

(declare-fun b!519050 () Bool)

(declare-fun c!60956 () Bool)

(declare-fun lt!237654 () (_ BitVec 64))

(assert (=> b!519050 (= c!60956 (= lt!237654 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302853 () SeekEntryResult!4408)

(assert (=> b!519050 (= e!302854 e!302853)))

(declare-fun b!519051 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33158 (_ BitVec 32)) SeekEntryResult!4408)

(assert (=> b!519051 (= e!302853 (seekKeyOrZeroReturnVacant!0 (x!48790 lt!237655) (index!19825 lt!237655) (index!19825 lt!237655) (select (arr!15941 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519052 () Bool)

(assert (=> b!519052 (= e!302855 e!302854)))

(assert (=> b!519052 (= lt!237654 (select (arr!15941 a!3235) (index!19825 lt!237655)))))

(declare-fun c!60955 () Bool)

(assert (=> b!519052 (= c!60955 (= lt!237654 (select (arr!15941 a!3235) j!176)))))

(declare-fun b!519053 () Bool)

(assert (=> b!519053 (= e!302855 Undefined!4408)))

(declare-fun b!519054 () Bool)

(assert (=> b!519054 (= e!302853 (MissingZero!4408 (index!19825 lt!237655)))))

(assert (= (and d!79989 c!60957) b!519053))

(assert (= (and d!79989 (not c!60957)) b!519052))

(assert (= (and b!519052 c!60955) b!519049))

(assert (= (and b!519052 (not c!60955)) b!519050))

(assert (= (and b!519050 c!60956) b!519054))

(assert (= (and b!519050 (not c!60956)) b!519051))

(declare-fun m!500295 () Bool)

(assert (=> d!79989 m!500295))

(assert (=> d!79989 m!500169))

(assert (=> d!79989 m!500181))

(declare-fun m!500297 () Bool)

(assert (=> d!79989 m!500297))

(declare-fun m!500299 () Bool)

(assert (=> d!79989 m!500299))

(assert (=> d!79989 m!500181))

(assert (=> d!79989 m!500169))

(declare-fun m!500301 () Bool)

(assert (=> d!79989 m!500301))

(assert (=> d!79989 m!500191))

(assert (=> b!519051 m!500169))

(declare-fun m!500303 () Bool)

(assert (=> b!519051 m!500303))

(declare-fun m!500305 () Bool)

(assert (=> b!519052 m!500305))

(assert (=> b!518893 d!79989))

(declare-fun d!80013 () Bool)

(declare-fun res!317739 () Bool)

(declare-fun e!302866 () Bool)

(assert (=> d!80013 (=> res!317739 e!302866)))

(assert (=> d!80013 (= res!317739 (= (select (arr!15941 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80013 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!302866)))

(declare-fun b!519067 () Bool)

(declare-fun e!302867 () Bool)

(assert (=> b!519067 (= e!302866 e!302867)))

(declare-fun res!317740 () Bool)

(assert (=> b!519067 (=> (not res!317740) (not e!302867))))

(assert (=> b!519067 (= res!317740 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16305 a!3235)))))

(declare-fun b!519068 () Bool)

(assert (=> b!519068 (= e!302867 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80013 (not res!317739)) b!519067))

(assert (= (and b!519067 res!317740) b!519068))

(assert (=> d!80013 m!500229))

(declare-fun m!500307 () Bool)

(assert (=> b!519068 m!500307))

(assert (=> b!518894 d!80013))

(declare-fun d!80015 () Bool)

(declare-fun lt!237662 () SeekEntryResult!4408)

(assert (=> d!80015 (and (or (is-Undefined!4408 lt!237662) (not (is-Found!4408 lt!237662)) (and (bvsge (index!19824 lt!237662) #b00000000000000000000000000000000) (bvslt (index!19824 lt!237662) (size!16305 a!3235)))) (or (is-Undefined!4408 lt!237662) (is-Found!4408 lt!237662) (not (is-MissingZero!4408 lt!237662)) (and (bvsge (index!19823 lt!237662) #b00000000000000000000000000000000) (bvslt (index!19823 lt!237662) (size!16305 a!3235)))) (or (is-Undefined!4408 lt!237662) (is-Found!4408 lt!237662) (is-MissingZero!4408 lt!237662) (not (is-MissingVacant!4408 lt!237662)) (and (bvsge (index!19826 lt!237662) #b00000000000000000000000000000000) (bvslt (index!19826 lt!237662) (size!16305 a!3235)))) (or (is-Undefined!4408 lt!237662) (ite (is-Found!4408 lt!237662) (= (select (arr!15941 a!3235) (index!19824 lt!237662)) k!2280) (ite (is-MissingZero!4408 lt!237662) (= (select (arr!15941 a!3235) (index!19823 lt!237662)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4408 lt!237662) (= (select (arr!15941 a!3235) (index!19826 lt!237662)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302870 () SeekEntryResult!4408)

(assert (=> d!80015 (= lt!237662 e!302870)))

(declare-fun c!60962 () Bool)

(declare-fun lt!237664 () SeekEntryResult!4408)

(assert (=> d!80015 (= c!60962 (and (is-Intermediate!4408 lt!237664) (undefined!5220 lt!237664)))))

(assert (=> d!80015 (= lt!237664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80015 (validMask!0 mask!3524)))

(assert (=> d!80015 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!237662)))

(declare-fun b!519069 () Bool)

(declare-fun e!302869 () SeekEntryResult!4408)

(assert (=> b!519069 (= e!302869 (Found!4408 (index!19825 lt!237664)))))

(declare-fun b!519070 () Bool)

(declare-fun c!60961 () Bool)

(declare-fun lt!237663 () (_ BitVec 64))

(assert (=> b!519070 (= c!60961 (= lt!237663 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302868 () SeekEntryResult!4408)

(assert (=> b!519070 (= e!302869 e!302868)))

(declare-fun b!519071 () Bool)

(assert (=> b!519071 (= e!302868 (seekKeyOrZeroReturnVacant!0 (x!48790 lt!237664) (index!19825 lt!237664) (index!19825 lt!237664) k!2280 a!3235 mask!3524))))

(declare-fun b!519072 () Bool)

(assert (=> b!519072 (= e!302870 e!302869)))

(assert (=> b!519072 (= lt!237663 (select (arr!15941 a!3235) (index!19825 lt!237664)))))

(declare-fun c!60960 () Bool)

(assert (=> b!519072 (= c!60960 (= lt!237663 k!2280))))

(declare-fun b!519073 () Bool)

(assert (=> b!519073 (= e!302870 Undefined!4408)))

(declare-fun b!519074 () Bool)

(assert (=> b!519074 (= e!302868 (MissingZero!4408 (index!19825 lt!237664)))))

(assert (= (and d!80015 c!60962) b!519073))

(assert (= (and d!80015 (not c!60962)) b!519072))

(assert (= (and b!519072 c!60960) b!519069))

(assert (= (and b!519072 (not c!60960)) b!519070))

(assert (= (and b!519070 c!60961) b!519074))

(assert (= (and b!519070 (not c!60961)) b!519071))

(declare-fun m!500309 () Bool)

(assert (=> d!80015 m!500309))

(declare-fun m!500311 () Bool)

(assert (=> d!80015 m!500311))

(declare-fun m!500313 () Bool)

(assert (=> d!80015 m!500313))

(declare-fun m!500315 () Bool)

(assert (=> d!80015 m!500315))

(assert (=> d!80015 m!500311))

(declare-fun m!500317 () Bool)

(assert (=> d!80015 m!500317))

(assert (=> d!80015 m!500191))

(declare-fun m!500319 () Bool)

(assert (=> b!519071 m!500319))

(declare-fun m!500321 () Bool)

(assert (=> b!519072 m!500321))

(assert (=> b!518889 d!80015))

(declare-fun bm!31737 () Bool)

(declare-fun call!31740 () Bool)

(assert (=> bm!31737 (= call!31740 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519108 () Bool)

(declare-fun e!302894 () Bool)

(declare-fun e!302895 () Bool)

(assert (=> b!519108 (= e!302894 e!302895)))

(declare-fun lt!237684 () (_ BitVec 64))

(assert (=> b!519108 (= lt!237684 (select (arr!15941 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237685 () Unit!16084)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33158 (_ BitVec 64) (_ BitVec 32)) Unit!16084)

(assert (=> b!519108 (= lt!237685 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237684 #b00000000000000000000000000000000))))

(assert (=> b!519108 (arrayContainsKey!0 a!3235 lt!237684 #b00000000000000000000000000000000)))

(declare-fun lt!237686 () Unit!16084)

(assert (=> b!519108 (= lt!237686 lt!237685)))

(declare-fun res!317756 () Bool)

(assert (=> b!519108 (= res!317756 (= (seekEntryOrOpen!0 (select (arr!15941 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4408 #b00000000000000000000000000000000)))))

(assert (=> b!519108 (=> (not res!317756) (not e!302895))))

(declare-fun b!519109 () Bool)

(declare-fun e!302893 () Bool)

(assert (=> b!519109 (= e!302893 e!302894)))

(declare-fun c!60972 () Bool)

(assert (=> b!519109 (= c!60972 (validKeyInArray!0 (select (arr!15941 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519110 () Bool)

(assert (=> b!519110 (= e!302894 call!31740)))

(declare-fun b!519111 () Bool)

(assert (=> b!519111 (= e!302895 call!31740)))

(declare-fun d!80017 () Bool)

(declare-fun res!317757 () Bool)

(assert (=> d!80017 (=> res!317757 e!302893)))

(assert (=> d!80017 (= res!317757 (bvsge #b00000000000000000000000000000000 (size!16305 a!3235)))))

(assert (=> d!80017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302893)))

(assert (= (and d!80017 (not res!317757)) b!519109))

(assert (= (and b!519109 c!60972) b!519108))

(assert (= (and b!519109 (not c!60972)) b!519110))

(assert (= (and b!519108 res!317756) b!519111))

(assert (= (or b!519111 b!519110) bm!31737))

(declare-fun m!500349 () Bool)

(assert (=> bm!31737 m!500349))

(assert (=> b!519108 m!500229))

(declare-fun m!500351 () Bool)

(assert (=> b!519108 m!500351))

(declare-fun m!500353 () Bool)

(assert (=> b!519108 m!500353))

(assert (=> b!519108 m!500229))

(declare-fun m!500355 () Bool)

(assert (=> b!519108 m!500355))

(assert (=> b!519109 m!500229))

(assert (=> b!519109 m!500229))

(assert (=> b!519109 m!500231))

(assert (=> b!518895 d!80017))

(declare-fun d!80027 () Bool)

(declare-fun e!302898 () Bool)

(assert (=> d!80027 e!302898))

(declare-fun res!317760 () Bool)

(assert (=> d!80027 (=> (not res!317760) (not e!302898))))

(assert (=> d!80027 (= res!317760 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16305 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16305 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16305 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16305 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16305 a!3235))))))

(declare-fun lt!237689 () Unit!16084)

(declare-fun choose!47 (array!33158 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16084)

(assert (=> d!80027 (= lt!237689 (choose!47 a!3235 i!1204 k!2280 j!176 lt!237586 #b00000000000000000000000000000000 (index!19825 lt!237581) (x!48790 lt!237581) mask!3524))))

(assert (=> d!80027 (validMask!0 mask!3524)))

(assert (=> d!80027 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237586 #b00000000000000000000000000000000 (index!19825 lt!237581) (x!48790 lt!237581) mask!3524) lt!237689)))

(declare-fun b!519114 () Bool)

(assert (=> b!519114 (= e!302898 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237586 (select (store (arr!15941 a!3235) i!1204 k!2280) j!176) (array!33159 (store (arr!15941 a!3235) i!1204 k!2280) (size!16305 a!3235)) mask!3524) (Intermediate!4408 false (index!19825 lt!237581) (x!48790 lt!237581))))))

(assert (= (and d!80027 res!317760) b!519114))

(declare-fun m!500357 () Bool)

(assert (=> d!80027 m!500357))

(assert (=> d!80027 m!500191))

(assert (=> b!519114 m!500173))

(assert (=> b!519114 m!500177))

(assert (=> b!519114 m!500177))

(declare-fun m!500359 () Bool)

(assert (=> b!519114 m!500359))

(assert (=> b!518896 d!80027))

(declare-fun b!519155 () Bool)

(declare-fun e!302925 () Bool)

(declare-fun e!302924 () Bool)

(assert (=> b!519155 (= e!302925 e!302924)))

(declare-fun res!317770 () Bool)

(declare-fun lt!237707 () SeekEntryResult!4408)

(assert (=> b!519155 (= res!317770 (and (is-Intermediate!4408 lt!237707) (not (undefined!5220 lt!237707)) (bvslt (x!48790 lt!237707) #b01111111111111111111111111111110) (bvsge (x!48790 lt!237707) #b00000000000000000000000000000000) (bvsge (x!48790 lt!237707) #b00000000000000000000000000000000)))))

(assert (=> b!519155 (=> (not res!317770) (not e!302924))))

(declare-fun b!519156 () Bool)

(declare-fun e!302923 () SeekEntryResult!4408)

(assert (=> b!519156 (= e!302923 (Intermediate!4408 false lt!237586 #b00000000000000000000000000000000))))

(declare-fun b!519157 () Bool)

(assert (=> b!519157 (= e!302925 (bvsge (x!48790 lt!237707) #b01111111111111111111111111111110))))

(declare-fun b!519158 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519158 (= e!302923 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237586 #b00000000000000000000000000000000 mask!3524) lt!237583 lt!237589 mask!3524))))

(declare-fun b!519159 () Bool)

(declare-fun e!302921 () SeekEntryResult!4408)

(assert (=> b!519159 (= e!302921 e!302923)))

(declare-fun c!60991 () Bool)

(declare-fun lt!237706 () (_ BitVec 64))

(assert (=> b!519159 (= c!60991 (or (= lt!237706 lt!237583) (= (bvadd lt!237706 lt!237706) #b0000000000000000000000000000000000000000000000000000000000000000)))))

