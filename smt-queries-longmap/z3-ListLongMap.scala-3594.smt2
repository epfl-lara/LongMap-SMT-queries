; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49352 () Bool)

(assert start!49352)

(declare-fun b!543834 () Bool)

(declare-fun res!338390 () Bool)

(declare-fun e!314431 () Bool)

(assert (=> b!543834 (=> (not res!338390) (not e!314431))))

(declare-datatypes ((array!34360 0))(
  ( (array!34361 (arr!16513 (Array (_ BitVec 32) (_ BitVec 64))) (size!16877 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34360)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543834 (= res!338390 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543835 () Bool)

(declare-fun res!338391 () Bool)

(declare-fun e!314433 () Bool)

(assert (=> b!543835 (=> (not res!338391) (not e!314433))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34360 (_ BitVec 32)) Bool)

(assert (=> b!543835 (= res!338391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543836 () Bool)

(declare-fun e!314432 () Bool)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543836 (= e!314432 (bvsgt (bvadd #b00000000000000000000000000000001 x!1030) resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!248272 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543836 (= lt!248272 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543837 () Bool)

(declare-fun res!338389 () Bool)

(assert (=> b!543837 (=> (not res!338389) (not e!314432))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!543837 (= res!338389 (and (not (= (select (arr!16513 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16513 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16513 a!3154) index!1177) (select (arr!16513 a!3154) j!147)))))))

(declare-fun b!543838 () Bool)

(declare-fun res!338386 () Bool)

(assert (=> b!543838 (=> (not res!338386) (not e!314431))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543838 (= res!338386 (and (= (size!16877 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16877 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16877 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543839 () Bool)

(assert (=> b!543839 (= e!314431 e!314433)))

(declare-fun res!338393 () Bool)

(assert (=> b!543839 (=> (not res!338393) (not e!314433))))

(declare-datatypes ((SeekEntryResult!4971 0))(
  ( (MissingZero!4971 (index!22108 (_ BitVec 32))) (Found!4971 (index!22109 (_ BitVec 32))) (Intermediate!4971 (undefined!5783 Bool) (index!22110 (_ BitVec 32)) (x!51010 (_ BitVec 32))) (Undefined!4971) (MissingVacant!4971 (index!22111 (_ BitVec 32))) )
))
(declare-fun lt!248271 () SeekEntryResult!4971)

(assert (=> b!543839 (= res!338393 (or (= lt!248271 (MissingZero!4971 i!1153)) (= lt!248271 (MissingVacant!4971 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34360 (_ BitVec 32)) SeekEntryResult!4971)

(assert (=> b!543839 (= lt!248271 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543840 () Bool)

(declare-fun res!338395 () Bool)

(assert (=> b!543840 (=> (not res!338395) (not e!314433))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!543840 (= res!338395 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16877 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16877 a!3154)) (= (select (arr!16513 a!3154) resIndex!32) (select (arr!16513 a!3154) j!147))))))

(declare-fun res!338385 () Bool)

(assert (=> start!49352 (=> (not res!338385) (not e!314431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49352 (= res!338385 (validMask!0 mask!3216))))

(assert (=> start!49352 e!314431))

(assert (=> start!49352 true))

(declare-fun array_inv!12309 (array!34360) Bool)

(assert (=> start!49352 (array_inv!12309 a!3154)))

(declare-fun b!543841 () Bool)

(declare-fun res!338394 () Bool)

(assert (=> b!543841 (=> (not res!338394) (not e!314431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543841 (= res!338394 (validKeyInArray!0 k0!1998))))

(declare-fun b!543842 () Bool)

(declare-fun res!338392 () Bool)

(assert (=> b!543842 (=> (not res!338392) (not e!314432))))

(declare-fun lt!248270 () SeekEntryResult!4971)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34360 (_ BitVec 32)) SeekEntryResult!4971)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543842 (= res!338392 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216) lt!248270))))

(declare-fun b!543843 () Bool)

(declare-fun res!338387 () Bool)

(assert (=> b!543843 (=> (not res!338387) (not e!314433))))

(declare-datatypes ((List!10632 0))(
  ( (Nil!10629) (Cons!10628 (h!11583 (_ BitVec 64)) (t!16860 List!10632)) )
))
(declare-fun arrayNoDuplicates!0 (array!34360 (_ BitVec 32) List!10632) Bool)

(assert (=> b!543843 (= res!338387 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10629))))

(declare-fun b!543844 () Bool)

(declare-fun res!338388 () Bool)

(assert (=> b!543844 (=> (not res!338388) (not e!314431))))

(assert (=> b!543844 (= res!338388 (validKeyInArray!0 (select (arr!16513 a!3154) j!147)))))

(declare-fun b!543845 () Bool)

(assert (=> b!543845 (= e!314433 e!314432)))

(declare-fun res!338396 () Bool)

(assert (=> b!543845 (=> (not res!338396) (not e!314432))))

(assert (=> b!543845 (= res!338396 (= lt!248270 (Intermediate!4971 false resIndex!32 resX!32)))))

(assert (=> b!543845 (= lt!248270 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16513 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49352 res!338385) b!543838))

(assert (= (and b!543838 res!338386) b!543844))

(assert (= (and b!543844 res!338388) b!543841))

(assert (= (and b!543841 res!338394) b!543834))

(assert (= (and b!543834 res!338390) b!543839))

(assert (= (and b!543839 res!338393) b!543835))

(assert (= (and b!543835 res!338391) b!543843))

(assert (= (and b!543843 res!338387) b!543840))

(assert (= (and b!543840 res!338395) b!543845))

(assert (= (and b!543845 res!338396) b!543842))

(assert (= (and b!543842 res!338392) b!543837))

(assert (= (and b!543837 res!338389) b!543836))

(declare-fun m!521859 () Bool)

(assert (=> b!543842 m!521859))

(assert (=> b!543842 m!521859))

(declare-fun m!521861 () Bool)

(assert (=> b!543842 m!521861))

(assert (=> b!543842 m!521861))

(assert (=> b!543842 m!521859))

(declare-fun m!521863 () Bool)

(assert (=> b!543842 m!521863))

(declare-fun m!521865 () Bool)

(assert (=> b!543840 m!521865))

(assert (=> b!543840 m!521859))

(declare-fun m!521867 () Bool)

(assert (=> start!49352 m!521867))

(declare-fun m!521869 () Bool)

(assert (=> start!49352 m!521869))

(declare-fun m!521871 () Bool)

(assert (=> b!543839 m!521871))

(declare-fun m!521873 () Bool)

(assert (=> b!543836 m!521873))

(declare-fun m!521875 () Bool)

(assert (=> b!543837 m!521875))

(assert (=> b!543837 m!521859))

(declare-fun m!521877 () Bool)

(assert (=> b!543843 m!521877))

(declare-fun m!521879 () Bool)

(assert (=> b!543841 m!521879))

(assert (=> b!543845 m!521859))

(assert (=> b!543845 m!521859))

(declare-fun m!521881 () Bool)

(assert (=> b!543845 m!521881))

(assert (=> b!543844 m!521859))

(assert (=> b!543844 m!521859))

(declare-fun m!521883 () Bool)

(assert (=> b!543844 m!521883))

(declare-fun m!521885 () Bool)

(assert (=> b!543835 m!521885))

(declare-fun m!521887 () Bool)

(assert (=> b!543834 m!521887))

(check-sat (not b!543845) (not b!543841) (not b!543839) (not b!543842) (not b!543844) (not b!543834) (not b!543843) (not start!49352) (not b!543835) (not b!543836))
(check-sat)
(get-model)

(declare-fun d!81923 () Bool)

(assert (=> d!81923 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49352 d!81923))

(declare-fun d!81925 () Bool)

(assert (=> d!81925 (= (array_inv!12309 a!3154) (bvsge (size!16877 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49352 d!81925))

(declare-fun b!543892 () Bool)

(declare-fun e!314455 () Bool)

(declare-fun call!32072 () Bool)

(assert (=> b!543892 (= e!314455 call!32072)))

(declare-fun b!543893 () Bool)

(declare-fun e!314457 () Bool)

(assert (=> b!543893 (= e!314457 e!314455)))

(declare-fun c!63044 () Bool)

(assert (=> b!543893 (= c!63044 (validKeyInArray!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81927 () Bool)

(declare-fun res!338439 () Bool)

(declare-fun e!314456 () Bool)

(assert (=> d!81927 (=> res!338439 e!314456)))

(assert (=> d!81927 (= res!338439 (bvsge #b00000000000000000000000000000000 (size!16877 a!3154)))))

(assert (=> d!81927 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10629) e!314456)))

(declare-fun bm!32069 () Bool)

(assert (=> bm!32069 (= call!32072 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63044 (Cons!10628 (select (arr!16513 a!3154) #b00000000000000000000000000000000) Nil!10629) Nil!10629)))))

(declare-fun b!543894 () Bool)

(assert (=> b!543894 (= e!314455 call!32072)))

(declare-fun b!543895 () Bool)

(assert (=> b!543895 (= e!314456 e!314457)))

(declare-fun res!338440 () Bool)

(assert (=> b!543895 (=> (not res!338440) (not e!314457))))

(declare-fun e!314454 () Bool)

(assert (=> b!543895 (= res!338440 (not e!314454))))

(declare-fun res!338441 () Bool)

(assert (=> b!543895 (=> (not res!338441) (not e!314454))))

(assert (=> b!543895 (= res!338441 (validKeyInArray!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!543896 () Bool)

(declare-fun contains!2805 (List!10632 (_ BitVec 64)) Bool)

(assert (=> b!543896 (= e!314454 (contains!2805 Nil!10629 (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!81927 (not res!338439)) b!543895))

(assert (= (and b!543895 res!338441) b!543896))

(assert (= (and b!543895 res!338440) b!543893))

(assert (= (and b!543893 c!63044) b!543894))

(assert (= (and b!543893 (not c!63044)) b!543892))

(assert (= (or b!543894 b!543892) bm!32069))

(declare-fun m!521919 () Bool)

(assert (=> b!543893 m!521919))

(assert (=> b!543893 m!521919))

(declare-fun m!521921 () Bool)

(assert (=> b!543893 m!521921))

(assert (=> bm!32069 m!521919))

(declare-fun m!521923 () Bool)

(assert (=> bm!32069 m!521923))

(assert (=> b!543895 m!521919))

(assert (=> b!543895 m!521919))

(assert (=> b!543895 m!521921))

(assert (=> b!543896 m!521919))

(assert (=> b!543896 m!521919))

(declare-fun m!521925 () Bool)

(assert (=> b!543896 m!521925))

(assert (=> b!543843 d!81927))

(declare-fun d!81931 () Bool)

(assert (=> d!81931 (= (validKeyInArray!0 (select (arr!16513 a!3154) j!147)) (and (not (= (select (arr!16513 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16513 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543844 d!81931))

(declare-fun b!543936 () Bool)

(declare-fun e!314486 () SeekEntryResult!4971)

(assert (=> b!543936 (= e!314486 Undefined!4971)))

(declare-fun b!543937 () Bool)

(declare-fun e!314487 () SeekEntryResult!4971)

(declare-fun lt!248302 () SeekEntryResult!4971)

(assert (=> b!543937 (= e!314487 (Found!4971 (index!22110 lt!248302)))))

(declare-fun b!543938 () Bool)

(declare-fun e!314485 () SeekEntryResult!4971)

(assert (=> b!543938 (= e!314485 (MissingZero!4971 (index!22110 lt!248302)))))

(declare-fun b!543939 () Bool)

(assert (=> b!543939 (= e!314486 e!314487)))

(declare-fun lt!248300 () (_ BitVec 64))

(assert (=> b!543939 (= lt!248300 (select (arr!16513 a!3154) (index!22110 lt!248302)))))

(declare-fun c!63058 () Bool)

(assert (=> b!543939 (= c!63058 (= lt!248300 k0!1998))))

(declare-fun d!81933 () Bool)

(declare-fun lt!248301 () SeekEntryResult!4971)

(get-info :version)

(assert (=> d!81933 (and (or ((_ is Undefined!4971) lt!248301) (not ((_ is Found!4971) lt!248301)) (and (bvsge (index!22109 lt!248301) #b00000000000000000000000000000000) (bvslt (index!22109 lt!248301) (size!16877 a!3154)))) (or ((_ is Undefined!4971) lt!248301) ((_ is Found!4971) lt!248301) (not ((_ is MissingZero!4971) lt!248301)) (and (bvsge (index!22108 lt!248301) #b00000000000000000000000000000000) (bvslt (index!22108 lt!248301) (size!16877 a!3154)))) (or ((_ is Undefined!4971) lt!248301) ((_ is Found!4971) lt!248301) ((_ is MissingZero!4971) lt!248301) (not ((_ is MissingVacant!4971) lt!248301)) (and (bvsge (index!22111 lt!248301) #b00000000000000000000000000000000) (bvslt (index!22111 lt!248301) (size!16877 a!3154)))) (or ((_ is Undefined!4971) lt!248301) (ite ((_ is Found!4971) lt!248301) (= (select (arr!16513 a!3154) (index!22109 lt!248301)) k0!1998) (ite ((_ is MissingZero!4971) lt!248301) (= (select (arr!16513 a!3154) (index!22108 lt!248301)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4971) lt!248301) (= (select (arr!16513 a!3154) (index!22111 lt!248301)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81933 (= lt!248301 e!314486)))

(declare-fun c!63057 () Bool)

(assert (=> d!81933 (= c!63057 (and ((_ is Intermediate!4971) lt!248302) (undefined!5783 lt!248302)))))

(assert (=> d!81933 (= lt!248302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81933 (validMask!0 mask!3216)))

(assert (=> d!81933 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!248301)))

(declare-fun b!543940 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34360 (_ BitVec 32)) SeekEntryResult!4971)

(assert (=> b!543940 (= e!314485 (seekKeyOrZeroReturnVacant!0 (x!51010 lt!248302) (index!22110 lt!248302) (index!22110 lt!248302) k0!1998 a!3154 mask!3216))))

(declare-fun b!543941 () Bool)

(declare-fun c!63059 () Bool)

(assert (=> b!543941 (= c!63059 (= lt!248300 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!543941 (= e!314487 e!314485)))

(assert (= (and d!81933 c!63057) b!543936))

(assert (= (and d!81933 (not c!63057)) b!543939))

(assert (= (and b!543939 c!63058) b!543937))

(assert (= (and b!543939 (not c!63058)) b!543941))

(assert (= (and b!543941 c!63059) b!543938))

(assert (= (and b!543941 (not c!63059)) b!543940))

(declare-fun m!521945 () Bool)

(assert (=> b!543939 m!521945))

(declare-fun m!521947 () Bool)

(assert (=> d!81933 m!521947))

(declare-fun m!521949 () Bool)

(assert (=> d!81933 m!521949))

(assert (=> d!81933 m!521947))

(assert (=> d!81933 m!521867))

(declare-fun m!521951 () Bool)

(assert (=> d!81933 m!521951))

(declare-fun m!521953 () Bool)

(assert (=> d!81933 m!521953))

(declare-fun m!521955 () Bool)

(assert (=> d!81933 m!521955))

(declare-fun m!521957 () Bool)

(assert (=> b!543940 m!521957))

(assert (=> b!543839 d!81933))

(declare-fun d!81945 () Bool)

(declare-fun res!338461 () Bool)

(declare-fun e!314492 () Bool)

(assert (=> d!81945 (=> res!338461 e!314492)))

(assert (=> d!81945 (= res!338461 (= (select (arr!16513 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81945 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!314492)))

(declare-fun b!543946 () Bool)

(declare-fun e!314493 () Bool)

(assert (=> b!543946 (= e!314492 e!314493)))

(declare-fun res!338462 () Bool)

(assert (=> b!543946 (=> (not res!338462) (not e!314493))))

(assert (=> b!543946 (= res!338462 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16877 a!3154)))))

(declare-fun b!543947 () Bool)

(assert (=> b!543947 (= e!314493 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81945 (not res!338461)) b!543946))

(assert (= (and b!543946 res!338462) b!543947))

(assert (=> d!81945 m!521919))

(declare-fun m!521959 () Bool)

(assert (=> b!543947 m!521959))

(assert (=> b!543834 d!81945))

(declare-fun b!544017 () Bool)

(declare-fun e!314534 () SeekEntryResult!4971)

(assert (=> b!544017 (= e!314534 (Intermediate!4971 false index!1177 x!1030))))

(declare-fun b!544018 () Bool)

(declare-fun lt!248329 () SeekEntryResult!4971)

(assert (=> b!544018 (and (bvsge (index!22110 lt!248329) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248329) (size!16877 a!3154)))))

(declare-fun res!338486 () Bool)

(assert (=> b!544018 (= res!338486 (= (select (arr!16513 a!3154) (index!22110 lt!248329)) (select (arr!16513 a!3154) j!147)))))

(declare-fun e!314536 () Bool)

(assert (=> b!544018 (=> res!338486 e!314536)))

(declare-fun e!314535 () Bool)

(assert (=> b!544018 (= e!314535 e!314536)))

(declare-fun b!544019 () Bool)

(declare-fun e!314537 () SeekEntryResult!4971)

(assert (=> b!544019 (= e!314537 e!314534)))

(declare-fun lt!248328 () (_ BitVec 64))

(declare-fun c!63086 () Bool)

(assert (=> b!544019 (= c!63086 (or (= lt!248328 (select (arr!16513 a!3154) j!147)) (= (bvadd lt!248328 lt!248328) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544020 () Bool)

(assert (=> b!544020 (and (bvsge (index!22110 lt!248329) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248329) (size!16877 a!3154)))))

(assert (=> b!544020 (= e!314536 (= (select (arr!16513 a!3154) (index!22110 lt!248329)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544021 () Bool)

(assert (=> b!544021 (and (bvsge (index!22110 lt!248329) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248329) (size!16877 a!3154)))))

(declare-fun res!338487 () Bool)

(assert (=> b!544021 (= res!338487 (= (select (arr!16513 a!3154) (index!22110 lt!248329)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544021 (=> res!338487 e!314536)))

(declare-fun b!544022 () Bool)

(assert (=> b!544022 (= e!314534 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544023 () Bool)

(assert (=> b!544023 (= e!314537 (Intermediate!4971 true index!1177 x!1030))))

(declare-fun b!544024 () Bool)

(declare-fun e!314538 () Bool)

(assert (=> b!544024 (= e!314538 e!314535)))

(declare-fun res!338485 () Bool)

(assert (=> b!544024 (= res!338485 (and ((_ is Intermediate!4971) lt!248329) (not (undefined!5783 lt!248329)) (bvslt (x!51010 lt!248329) #b01111111111111111111111111111110) (bvsge (x!51010 lt!248329) #b00000000000000000000000000000000) (bvsge (x!51010 lt!248329) x!1030)))))

(assert (=> b!544024 (=> (not res!338485) (not e!314535))))

(declare-fun b!544025 () Bool)

(assert (=> b!544025 (= e!314538 (bvsge (x!51010 lt!248329) #b01111111111111111111111111111110))))

(declare-fun d!81947 () Bool)

(assert (=> d!81947 e!314538))

(declare-fun c!63084 () Bool)

(assert (=> d!81947 (= c!63084 (and ((_ is Intermediate!4971) lt!248329) (undefined!5783 lt!248329)))))

(assert (=> d!81947 (= lt!248329 e!314537)))

(declare-fun c!63085 () Bool)

(assert (=> d!81947 (= c!63085 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!81947 (= lt!248328 (select (arr!16513 a!3154) index!1177))))

(assert (=> d!81947 (validMask!0 mask!3216)))

(assert (=> d!81947 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16513 a!3154) j!147) a!3154 mask!3216) lt!248329)))

(assert (= (and d!81947 c!63085) b!544023))

(assert (= (and d!81947 (not c!63085)) b!544019))

(assert (= (and b!544019 c!63086) b!544017))

(assert (= (and b!544019 (not c!63086)) b!544022))

(assert (= (and d!81947 c!63084) b!544025))

(assert (= (and d!81947 (not c!63084)) b!544024))

(assert (= (and b!544024 res!338485) b!544018))

(assert (= (and b!544018 (not res!338486)) b!544021))

(assert (= (and b!544021 (not res!338487)) b!544020))

(declare-fun m!521987 () Bool)

(assert (=> b!544018 m!521987))

(assert (=> b!544021 m!521987))

(assert (=> d!81947 m!521875))

(assert (=> d!81947 m!521867))

(assert (=> b!544022 m!521873))

(assert (=> b!544022 m!521873))

(assert (=> b!544022 m!521859))

(declare-fun m!521989 () Bool)

(assert (=> b!544022 m!521989))

(assert (=> b!544020 m!521987))

(assert (=> b!543845 d!81947))

(declare-fun b!544034 () Bool)

(declare-fun e!314547 () Bool)

(declare-fun e!314545 () Bool)

(assert (=> b!544034 (= e!314547 e!314545)))

(declare-fun c!63089 () Bool)

(assert (=> b!544034 (= c!63089 (validKeyInArray!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81965 () Bool)

(declare-fun res!338492 () Bool)

(assert (=> d!81965 (=> res!338492 e!314547)))

(assert (=> d!81965 (= res!338492 (bvsge #b00000000000000000000000000000000 (size!16877 a!3154)))))

(assert (=> d!81965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!314547)))

(declare-fun b!544035 () Bool)

(declare-fun call!32081 () Bool)

(assert (=> b!544035 (= e!314545 call!32081)))

(declare-fun b!544036 () Bool)

(declare-fun e!314546 () Bool)

(assert (=> b!544036 (= e!314546 call!32081)))

(declare-fun b!544037 () Bool)

(assert (=> b!544037 (= e!314545 e!314546)))

(declare-fun lt!248338 () (_ BitVec 64))

(assert (=> b!544037 (= lt!248338 (select (arr!16513 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16906 0))(
  ( (Unit!16907) )
))
(declare-fun lt!248337 () Unit!16906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34360 (_ BitVec 64) (_ BitVec 32)) Unit!16906)

(assert (=> b!544037 (= lt!248337 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248338 #b00000000000000000000000000000000))))

(assert (=> b!544037 (arrayContainsKey!0 a!3154 lt!248338 #b00000000000000000000000000000000)))

(declare-fun lt!248336 () Unit!16906)

(assert (=> b!544037 (= lt!248336 lt!248337)))

(declare-fun res!338493 () Bool)

(assert (=> b!544037 (= res!338493 (= (seekEntryOrOpen!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4971 #b00000000000000000000000000000000)))))

(assert (=> b!544037 (=> (not res!338493) (not e!314546))))

(declare-fun bm!32078 () Bool)

(assert (=> bm!32078 (= call!32081 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(assert (= (and d!81965 (not res!338492)) b!544034))

(assert (= (and b!544034 c!63089) b!544037))

(assert (= (and b!544034 (not c!63089)) b!544035))

(assert (= (and b!544037 res!338493) b!544036))

(assert (= (or b!544036 b!544035) bm!32078))

(assert (=> b!544034 m!521919))

(assert (=> b!544034 m!521919))

(assert (=> b!544034 m!521921))

(assert (=> b!544037 m!521919))

(declare-fun m!521991 () Bool)

(assert (=> b!544037 m!521991))

(declare-fun m!521993 () Bool)

(assert (=> b!544037 m!521993))

(assert (=> b!544037 m!521919))

(declare-fun m!521995 () Bool)

(assert (=> b!544037 m!521995))

(declare-fun m!521997 () Bool)

(assert (=> bm!32078 m!521997))

(assert (=> b!543835 d!81965))

(declare-fun d!81971 () Bool)

(assert (=> d!81971 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543841 d!81971))

(declare-fun d!81973 () Bool)

(declare-fun lt!248345 () (_ BitVec 32))

(assert (=> d!81973 (and (bvsge lt!248345 #b00000000000000000000000000000000) (bvslt lt!248345 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81973 (= lt!248345 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!81973 (validMask!0 mask!3216)))

(assert (=> d!81973 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248345)))

(declare-fun bs!16976 () Bool)

(assert (= bs!16976 d!81973))

(declare-fun m!521999 () Bool)

(assert (=> bs!16976 m!521999))

(assert (=> bs!16976 m!521867))

(assert (=> b!543836 d!81973))

(declare-fun e!314560 () SeekEntryResult!4971)

(declare-fun b!544056 () Bool)

(assert (=> b!544056 (= e!314560 (Intermediate!4971 false (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544057 () Bool)

(declare-fun lt!248347 () SeekEntryResult!4971)

(assert (=> b!544057 (and (bvsge (index!22110 lt!248347) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248347) (size!16877 a!3154)))))

(declare-fun res!338501 () Bool)

(assert (=> b!544057 (= res!338501 (= (select (arr!16513 a!3154) (index!22110 lt!248347)) (select (arr!16513 a!3154) j!147)))))

(declare-fun e!314562 () Bool)

(assert (=> b!544057 (=> res!338501 e!314562)))

(declare-fun e!314561 () Bool)

(assert (=> b!544057 (= e!314561 e!314562)))

(declare-fun b!544058 () Bool)

(declare-fun e!314563 () SeekEntryResult!4971)

(assert (=> b!544058 (= e!314563 e!314560)))

(declare-fun c!63098 () Bool)

(declare-fun lt!248346 () (_ BitVec 64))

(assert (=> b!544058 (= c!63098 (or (= lt!248346 (select (arr!16513 a!3154) j!147)) (= (bvadd lt!248346 lt!248346) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544059 () Bool)

(assert (=> b!544059 (and (bvsge (index!22110 lt!248347) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248347) (size!16877 a!3154)))))

(assert (=> b!544059 (= e!314562 (= (select (arr!16513 a!3154) (index!22110 lt!248347)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544060 () Bool)

(assert (=> b!544060 (and (bvsge (index!22110 lt!248347) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248347) (size!16877 a!3154)))))

(declare-fun res!338502 () Bool)

(assert (=> b!544060 (= res!338502 (= (select (arr!16513 a!3154) (index!22110 lt!248347)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544060 (=> res!338502 e!314562)))

(declare-fun b!544061 () Bool)

(assert (=> b!544061 (= e!314560 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544062 () Bool)

(assert (=> b!544062 (= e!314563 (Intermediate!4971 true (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544063 () Bool)

(declare-fun e!314564 () Bool)

(assert (=> b!544063 (= e!314564 e!314561)))

(declare-fun res!338500 () Bool)

(assert (=> b!544063 (= res!338500 (and ((_ is Intermediate!4971) lt!248347) (not (undefined!5783 lt!248347)) (bvslt (x!51010 lt!248347) #b01111111111111111111111111111110) (bvsge (x!51010 lt!248347) #b00000000000000000000000000000000) (bvsge (x!51010 lt!248347) #b00000000000000000000000000000000)))))

(assert (=> b!544063 (=> (not res!338500) (not e!314561))))

(declare-fun b!544064 () Bool)

(assert (=> b!544064 (= e!314564 (bvsge (x!51010 lt!248347) #b01111111111111111111111111111110))))

(declare-fun d!81975 () Bool)

(assert (=> d!81975 e!314564))

(declare-fun c!63096 () Bool)

(assert (=> d!81975 (= c!63096 (and ((_ is Intermediate!4971) lt!248347) (undefined!5783 lt!248347)))))

(assert (=> d!81975 (= lt!248347 e!314563)))

(declare-fun c!63097 () Bool)

(assert (=> d!81975 (= c!63097 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81975 (= lt!248346 (select (arr!16513 a!3154) (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216)))))

(assert (=> d!81975 (validMask!0 mask!3216)))

(assert (=> d!81975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216) lt!248347)))

(assert (= (and d!81975 c!63097) b!544062))

(assert (= (and d!81975 (not c!63097)) b!544058))

(assert (= (and b!544058 c!63098) b!544056))

(assert (= (and b!544058 (not c!63098)) b!544061))

(assert (= (and d!81975 c!63096) b!544064))

(assert (= (and d!81975 (not c!63096)) b!544063))

(assert (= (and b!544063 res!338500) b!544057))

(assert (= (and b!544057 (not res!338501)) b!544060))

(assert (= (and b!544060 (not res!338502)) b!544059))

(declare-fun m!522001 () Bool)

(assert (=> b!544057 m!522001))

(assert (=> b!544060 m!522001))

(assert (=> d!81975 m!521861))

(declare-fun m!522005 () Bool)

(assert (=> d!81975 m!522005))

(assert (=> d!81975 m!521867))

(assert (=> b!544061 m!521861))

(declare-fun m!522009 () Bool)

(assert (=> b!544061 m!522009))

(assert (=> b!544061 m!522009))

(assert (=> b!544061 m!521859))

(declare-fun m!522013 () Bool)

(assert (=> b!544061 m!522013))

(assert (=> b!544059 m!522001))

(assert (=> b!543842 d!81975))

(declare-fun d!81979 () Bool)

(declare-fun lt!248355 () (_ BitVec 32))

(declare-fun lt!248354 () (_ BitVec 32))

(assert (=> d!81979 (= lt!248355 (bvmul (bvxor lt!248354 (bvlshr lt!248354 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81979 (= lt!248354 ((_ extract 31 0) (bvand (bvxor (select (arr!16513 a!3154) j!147) (bvlshr (select (arr!16513 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81979 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338512 (let ((h!11586 ((_ extract 31 0) (bvand (bvxor (select (arr!16513 a!3154) j!147) (bvlshr (select (arr!16513 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51018 (bvmul (bvxor h!11586 (bvlshr h!11586 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51018 (bvlshr x!51018 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338512 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338512 #b00000000000000000000000000000000))))))

(assert (=> d!81979 (= (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) (bvand (bvxor lt!248355 (bvlshr lt!248355 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!543842 d!81979))

(check-sat (not b!543896) (not bm!32069) (not d!81947) (not b!544061) (not b!544037) (not b!543940) (not b!543947) (not bm!32078) (not b!543893) (not b!543895) (not d!81975) (not d!81933) (not b!544034) (not b!544022) (not d!81973))
(check-sat)
(get-model)

(declare-fun b!544213 () Bool)

(declare-fun e!314659 () Bool)

(declare-fun call!32090 () Bool)

(assert (=> b!544213 (= e!314659 call!32090)))

(declare-fun b!544214 () Bool)

(declare-fun e!314661 () Bool)

(assert (=> b!544214 (= e!314661 e!314659)))

(declare-fun c!63146 () Bool)

(assert (=> b!544214 (= c!63146 (validKeyInArray!0 (select (arr!16513 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!82025 () Bool)

(declare-fun res!338562 () Bool)

(declare-fun e!314660 () Bool)

(assert (=> d!82025 (=> res!338562 e!314660)))

(assert (=> d!82025 (= res!338562 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16877 a!3154)))))

(assert (=> d!82025 (= (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63044 (Cons!10628 (select (arr!16513 a!3154) #b00000000000000000000000000000000) Nil!10629) Nil!10629)) e!314660)))

(declare-fun bm!32087 () Bool)

(assert (=> bm!32087 (= call!32090 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!63146 (Cons!10628 (select (arr!16513 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!63044 (Cons!10628 (select (arr!16513 a!3154) #b00000000000000000000000000000000) Nil!10629) Nil!10629)) (ite c!63044 (Cons!10628 (select (arr!16513 a!3154) #b00000000000000000000000000000000) Nil!10629) Nil!10629))))))

(declare-fun b!544215 () Bool)

(assert (=> b!544215 (= e!314659 call!32090)))

(declare-fun b!544216 () Bool)

(assert (=> b!544216 (= e!314660 e!314661)))

(declare-fun res!338563 () Bool)

(assert (=> b!544216 (=> (not res!338563) (not e!314661))))

(declare-fun e!314658 () Bool)

(assert (=> b!544216 (= res!338563 (not e!314658))))

(declare-fun res!338564 () Bool)

(assert (=> b!544216 (=> (not res!338564) (not e!314658))))

(assert (=> b!544216 (= res!338564 (validKeyInArray!0 (select (arr!16513 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!544217 () Bool)

(assert (=> b!544217 (= e!314658 (contains!2805 (ite c!63044 (Cons!10628 (select (arr!16513 a!3154) #b00000000000000000000000000000000) Nil!10629) Nil!10629) (select (arr!16513 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!82025 (not res!338562)) b!544216))

(assert (= (and b!544216 res!338564) b!544217))

(assert (= (and b!544216 res!338563) b!544214))

(assert (= (and b!544214 c!63146) b!544215))

(assert (= (and b!544214 (not c!63146)) b!544213))

(assert (= (or b!544215 b!544213) bm!32087))

(declare-fun m!522133 () Bool)

(assert (=> b!544214 m!522133))

(assert (=> b!544214 m!522133))

(declare-fun m!522135 () Bool)

(assert (=> b!544214 m!522135))

(assert (=> bm!32087 m!522133))

(declare-fun m!522137 () Bool)

(assert (=> bm!32087 m!522137))

(assert (=> b!544216 m!522133))

(assert (=> b!544216 m!522133))

(assert (=> b!544216 m!522135))

(assert (=> b!544217 m!522133))

(assert (=> b!544217 m!522133))

(declare-fun m!522139 () Bool)

(assert (=> b!544217 m!522139))

(assert (=> bm!32069 d!82025))

(declare-fun b!544218 () Bool)

(declare-fun e!314664 () Bool)

(declare-fun e!314662 () Bool)

(assert (=> b!544218 (= e!314664 e!314662)))

(declare-fun c!63147 () Bool)

(assert (=> b!544218 (= c!63147 (validKeyInArray!0 (select (arr!16513 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!82027 () Bool)

(declare-fun res!338565 () Bool)

(assert (=> d!82027 (=> res!338565 e!314664)))

(assert (=> d!82027 (= res!338565 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16877 a!3154)))))

(assert (=> d!82027 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216) e!314664)))

(declare-fun b!544219 () Bool)

(declare-fun call!32091 () Bool)

(assert (=> b!544219 (= e!314662 call!32091)))

(declare-fun b!544220 () Bool)

(declare-fun e!314663 () Bool)

(assert (=> b!544220 (= e!314663 call!32091)))

(declare-fun b!544221 () Bool)

(assert (=> b!544221 (= e!314662 e!314663)))

(declare-fun lt!248416 () (_ BitVec 64))

(assert (=> b!544221 (= lt!248416 (select (arr!16513 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!248415 () Unit!16906)

(assert (=> b!544221 (= lt!248415 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248416 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!544221 (arrayContainsKey!0 a!3154 lt!248416 #b00000000000000000000000000000000)))

(declare-fun lt!248414 () Unit!16906)

(assert (=> b!544221 (= lt!248414 lt!248415)))

(declare-fun res!338566 () Bool)

(assert (=> b!544221 (= res!338566 (= (seekEntryOrOpen!0 (select (arr!16513 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!3154 mask!3216) (Found!4971 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!544221 (=> (not res!338566) (not e!314663))))

(declare-fun bm!32088 () Bool)

(assert (=> bm!32088 (= call!32091 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!3154 mask!3216))))

(assert (= (and d!82027 (not res!338565)) b!544218))

(assert (= (and b!544218 c!63147) b!544221))

(assert (= (and b!544218 (not c!63147)) b!544219))

(assert (= (and b!544221 res!338566) b!544220))

(assert (= (or b!544220 b!544219) bm!32088))

(assert (=> b!544218 m!522133))

(assert (=> b!544218 m!522133))

(assert (=> b!544218 m!522135))

(assert (=> b!544221 m!522133))

(declare-fun m!522141 () Bool)

(assert (=> b!544221 m!522141))

(declare-fun m!522143 () Bool)

(assert (=> b!544221 m!522143))

(assert (=> b!544221 m!522133))

(declare-fun m!522145 () Bool)

(assert (=> b!544221 m!522145))

(declare-fun m!522147 () Bool)

(assert (=> bm!32088 m!522147))

(assert (=> bm!32078 d!82027))

(declare-fun b!544222 () Bool)

(declare-fun e!314665 () SeekEntryResult!4971)

(assert (=> b!544222 (= e!314665 (Intermediate!4971 false (nextIndex!0 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!544223 () Bool)

(declare-fun lt!248418 () SeekEntryResult!4971)

(assert (=> b!544223 (and (bvsge (index!22110 lt!248418) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248418) (size!16877 a!3154)))))

(declare-fun res!338568 () Bool)

(assert (=> b!544223 (= res!338568 (= (select (arr!16513 a!3154) (index!22110 lt!248418)) (select (arr!16513 a!3154) j!147)))))

(declare-fun e!314667 () Bool)

(assert (=> b!544223 (=> res!338568 e!314667)))

(declare-fun e!314666 () Bool)

(assert (=> b!544223 (= e!314666 e!314667)))

(declare-fun b!544224 () Bool)

(declare-fun e!314668 () SeekEntryResult!4971)

(assert (=> b!544224 (= e!314668 e!314665)))

(declare-fun c!63150 () Bool)

(declare-fun lt!248417 () (_ BitVec 64))

(assert (=> b!544224 (= c!63150 (or (= lt!248417 (select (arr!16513 a!3154) j!147)) (= (bvadd lt!248417 lt!248417) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544225 () Bool)

(assert (=> b!544225 (and (bvsge (index!22110 lt!248418) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248418) (size!16877 a!3154)))))

(assert (=> b!544225 (= e!314667 (= (select (arr!16513 a!3154) (index!22110 lt!248418)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544226 () Bool)

(assert (=> b!544226 (and (bvsge (index!22110 lt!248418) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248418) (size!16877 a!3154)))))

(declare-fun res!338569 () Bool)

(assert (=> b!544226 (= res!338569 (= (select (arr!16513 a!3154) (index!22110 lt!248418)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544226 (=> res!338569 e!314667)))

(declare-fun b!544227 () Bool)

(assert (=> b!544227 (= e!314665 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544228 () Bool)

(assert (=> b!544228 (= e!314668 (Intermediate!4971 true (nextIndex!0 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!544229 () Bool)

(declare-fun e!314669 () Bool)

(assert (=> b!544229 (= e!314669 e!314666)))

(declare-fun res!338567 () Bool)

(assert (=> b!544229 (= res!338567 (and ((_ is Intermediate!4971) lt!248418) (not (undefined!5783 lt!248418)) (bvslt (x!51010 lt!248418) #b01111111111111111111111111111110) (bvsge (x!51010 lt!248418) #b00000000000000000000000000000000) (bvsge (x!51010 lt!248418) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!544229 (=> (not res!338567) (not e!314666))))

(declare-fun b!544230 () Bool)

(assert (=> b!544230 (= e!314669 (bvsge (x!51010 lt!248418) #b01111111111111111111111111111110))))

(declare-fun d!82029 () Bool)

(assert (=> d!82029 e!314669))

(declare-fun c!63148 () Bool)

(assert (=> d!82029 (= c!63148 (and ((_ is Intermediate!4971) lt!248418) (undefined!5783 lt!248418)))))

(assert (=> d!82029 (= lt!248418 e!314668)))

(declare-fun c!63149 () Bool)

(assert (=> d!82029 (= c!63149 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!82029 (= lt!248417 (select (arr!16513 a!3154) (nextIndex!0 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216)))))

(assert (=> d!82029 (validMask!0 mask!3216)))

(assert (=> d!82029 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216) lt!248418)))

(assert (= (and d!82029 c!63149) b!544228))

(assert (= (and d!82029 (not c!63149)) b!544224))

(assert (= (and b!544224 c!63150) b!544222))

(assert (= (and b!544224 (not c!63150)) b!544227))

(assert (= (and d!82029 c!63148) b!544230))

(assert (= (and d!82029 (not c!63148)) b!544229))

(assert (= (and b!544229 res!338567) b!544223))

(assert (= (and b!544223 (not res!338568)) b!544226))

(assert (= (and b!544226 (not res!338569)) b!544225))

(declare-fun m!522149 () Bool)

(assert (=> b!544223 m!522149))

(assert (=> b!544226 m!522149))

(assert (=> d!82029 m!522009))

(declare-fun m!522151 () Bool)

(assert (=> d!82029 m!522151))

(assert (=> d!82029 m!521867))

(assert (=> b!544227 m!522009))

(declare-fun m!522153 () Bool)

(assert (=> b!544227 m!522153))

(assert (=> b!544227 m!522153))

(assert (=> b!544227 m!521859))

(declare-fun m!522155 () Bool)

(assert (=> b!544227 m!522155))

(assert (=> b!544225 m!522149))

(assert (=> b!544061 d!82029))

(declare-fun d!82031 () Bool)

(declare-fun lt!248419 () (_ BitVec 32))

(assert (=> d!82031 (and (bvsge lt!248419 #b00000000000000000000000000000000) (bvslt lt!248419 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!82031 (= lt!248419 (choose!52 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216))))

(assert (=> d!82031 (validMask!0 mask!3216)))

(assert (=> d!82031 (= (nextIndex!0 (toIndex!0 (select (arr!16513 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) lt!248419)))

(declare-fun bs!16980 () Bool)

(assert (= bs!16980 d!82031))

(assert (=> bs!16980 m!521861))

(declare-fun m!522157 () Bool)

(assert (=> bs!16980 m!522157))

(assert (=> bs!16980 m!521867))

(assert (=> b!544061 d!82031))

(declare-fun d!82033 () Bool)

(assert (=> d!82033 (= (validKeyInArray!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000)) (and (not (= (select (arr!16513 a!3154) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16513 a!3154) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!543893 d!82033))

(declare-fun d!82035 () Bool)

(assert (=> d!82035 (arrayContainsKey!0 a!3154 lt!248338 #b00000000000000000000000000000000)))

(declare-fun lt!248422 () Unit!16906)

(declare-fun choose!13 (array!34360 (_ BitVec 64) (_ BitVec 32)) Unit!16906)

(assert (=> d!82035 (= lt!248422 (choose!13 a!3154 lt!248338 #b00000000000000000000000000000000))))

(assert (=> d!82035 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!82035 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248338 #b00000000000000000000000000000000) lt!248422)))

(declare-fun bs!16981 () Bool)

(assert (= bs!16981 d!82035))

(assert (=> bs!16981 m!521993))

(declare-fun m!522159 () Bool)

(assert (=> bs!16981 m!522159))

(assert (=> b!544037 d!82035))

(declare-fun d!82037 () Bool)

(declare-fun res!338570 () Bool)

(declare-fun e!314670 () Bool)

(assert (=> d!82037 (=> res!338570 e!314670)))

(assert (=> d!82037 (= res!338570 (= (select (arr!16513 a!3154) #b00000000000000000000000000000000) lt!248338))))

(assert (=> d!82037 (= (arrayContainsKey!0 a!3154 lt!248338 #b00000000000000000000000000000000) e!314670)))

(declare-fun b!544231 () Bool)

(declare-fun e!314671 () Bool)

(assert (=> b!544231 (= e!314670 e!314671)))

(declare-fun res!338571 () Bool)

(assert (=> b!544231 (=> (not res!338571) (not e!314671))))

(assert (=> b!544231 (= res!338571 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16877 a!3154)))))

(declare-fun b!544232 () Bool)

(assert (=> b!544232 (= e!314671 (arrayContainsKey!0 a!3154 lt!248338 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82037 (not res!338570)) b!544231))

(assert (= (and b!544231 res!338571) b!544232))

(assert (=> d!82037 m!521919))

(declare-fun m!522161 () Bool)

(assert (=> b!544232 m!522161))

(assert (=> b!544037 d!82037))

(declare-fun b!544233 () Bool)

(declare-fun e!314673 () SeekEntryResult!4971)

(assert (=> b!544233 (= e!314673 Undefined!4971)))

(declare-fun b!544234 () Bool)

(declare-fun e!314674 () SeekEntryResult!4971)

(declare-fun lt!248425 () SeekEntryResult!4971)

(assert (=> b!544234 (= e!314674 (Found!4971 (index!22110 lt!248425)))))

(declare-fun b!544235 () Bool)

(declare-fun e!314672 () SeekEntryResult!4971)

(assert (=> b!544235 (= e!314672 (MissingZero!4971 (index!22110 lt!248425)))))

(declare-fun b!544236 () Bool)

(assert (=> b!544236 (= e!314673 e!314674)))

(declare-fun lt!248423 () (_ BitVec 64))

(assert (=> b!544236 (= lt!248423 (select (arr!16513 a!3154) (index!22110 lt!248425)))))

(declare-fun c!63152 () Bool)

(assert (=> b!544236 (= c!63152 (= lt!248423 (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82039 () Bool)

(declare-fun lt!248424 () SeekEntryResult!4971)

(assert (=> d!82039 (and (or ((_ is Undefined!4971) lt!248424) (not ((_ is Found!4971) lt!248424)) (and (bvsge (index!22109 lt!248424) #b00000000000000000000000000000000) (bvslt (index!22109 lt!248424) (size!16877 a!3154)))) (or ((_ is Undefined!4971) lt!248424) ((_ is Found!4971) lt!248424) (not ((_ is MissingZero!4971) lt!248424)) (and (bvsge (index!22108 lt!248424) #b00000000000000000000000000000000) (bvslt (index!22108 lt!248424) (size!16877 a!3154)))) (or ((_ is Undefined!4971) lt!248424) ((_ is Found!4971) lt!248424) ((_ is MissingZero!4971) lt!248424) (not ((_ is MissingVacant!4971) lt!248424)) (and (bvsge (index!22111 lt!248424) #b00000000000000000000000000000000) (bvslt (index!22111 lt!248424) (size!16877 a!3154)))) (or ((_ is Undefined!4971) lt!248424) (ite ((_ is Found!4971) lt!248424) (= (select (arr!16513 a!3154) (index!22109 lt!248424)) (select (arr!16513 a!3154) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!4971) lt!248424) (= (select (arr!16513 a!3154) (index!22108 lt!248424)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4971) lt!248424) (= (select (arr!16513 a!3154) (index!22111 lt!248424)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82039 (= lt!248424 e!314673)))

(declare-fun c!63151 () Bool)

(assert (=> d!82039 (= c!63151 (and ((_ is Intermediate!4971) lt!248425) (undefined!5783 lt!248425)))))

(assert (=> d!82039 (= lt!248425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000) mask!3216) (select (arr!16513 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216))))

(assert (=> d!82039 (validMask!0 mask!3216)))

(assert (=> d!82039 (= (seekEntryOrOpen!0 (select (arr!16513 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) lt!248424)))

(declare-fun b!544237 () Bool)

(assert (=> b!544237 (= e!314672 (seekKeyOrZeroReturnVacant!0 (x!51010 lt!248425) (index!22110 lt!248425) (index!22110 lt!248425) (select (arr!16513 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216))))

(declare-fun b!544238 () Bool)

(declare-fun c!63153 () Bool)

(assert (=> b!544238 (= c!63153 (= lt!248423 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544238 (= e!314674 e!314672)))

(assert (= (and d!82039 c!63151) b!544233))

(assert (= (and d!82039 (not c!63151)) b!544236))

(assert (= (and b!544236 c!63152) b!544234))

(assert (= (and b!544236 (not c!63152)) b!544238))

(assert (= (and b!544238 c!63153) b!544235))

(assert (= (and b!544238 (not c!63153)) b!544237))

(declare-fun m!522163 () Bool)

(assert (=> b!544236 m!522163))

(declare-fun m!522165 () Bool)

(assert (=> d!82039 m!522165))

(assert (=> d!82039 m!521919))

(declare-fun m!522167 () Bool)

(assert (=> d!82039 m!522167))

(assert (=> d!82039 m!521919))

(assert (=> d!82039 m!522165))

(assert (=> d!82039 m!521867))

(declare-fun m!522169 () Bool)

(assert (=> d!82039 m!522169))

(declare-fun m!522171 () Bool)

(assert (=> d!82039 m!522171))

(declare-fun m!522173 () Bool)

(assert (=> d!82039 m!522173))

(assert (=> b!544237 m!521919))

(declare-fun m!522175 () Bool)

(assert (=> b!544237 m!522175))

(assert (=> b!544037 d!82039))

(declare-fun d!82041 () Bool)

(declare-fun res!338572 () Bool)

(declare-fun e!314675 () Bool)

(assert (=> d!82041 (=> res!338572 e!314675)))

(assert (=> d!82041 (= res!338572 (= (select (arr!16513 a!3154) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!1998))))

(assert (=> d!82041 (= (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!314675)))

(declare-fun b!544239 () Bool)

(declare-fun e!314676 () Bool)

(assert (=> b!544239 (= e!314675 e!314676)))

(declare-fun res!338573 () Bool)

(assert (=> b!544239 (=> (not res!338573) (not e!314676))))

(assert (=> b!544239 (= res!338573 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!16877 a!3154)))))

(declare-fun b!544240 () Bool)

(assert (=> b!544240 (= e!314676 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!82041 (not res!338572)) b!544239))

(assert (= (and b!544239 res!338573) b!544240))

(assert (=> d!82041 m!522133))

(declare-fun m!522177 () Bool)

(assert (=> b!544240 m!522177))

(assert (=> b!543947 d!82041))

(assert (=> b!544034 d!82033))

(declare-fun e!314677 () SeekEntryResult!4971)

(declare-fun b!544241 () Bool)

(assert (=> b!544241 (= e!314677 (Intermediate!4971 false (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001)))))

(declare-fun b!544242 () Bool)

(declare-fun lt!248427 () SeekEntryResult!4971)

(assert (=> b!544242 (and (bvsge (index!22110 lt!248427) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248427) (size!16877 a!3154)))))

(declare-fun res!338575 () Bool)

(assert (=> b!544242 (= res!338575 (= (select (arr!16513 a!3154) (index!22110 lt!248427)) (select (arr!16513 a!3154) j!147)))))

(declare-fun e!314679 () Bool)

(assert (=> b!544242 (=> res!338575 e!314679)))

(declare-fun e!314678 () Bool)

(assert (=> b!544242 (= e!314678 e!314679)))

(declare-fun b!544243 () Bool)

(declare-fun e!314680 () SeekEntryResult!4971)

(assert (=> b!544243 (= e!314680 e!314677)))

(declare-fun c!63156 () Bool)

(declare-fun lt!248426 () (_ BitVec 64))

(assert (=> b!544243 (= c!63156 (or (= lt!248426 (select (arr!16513 a!3154) j!147)) (= (bvadd lt!248426 lt!248426) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544244 () Bool)

(assert (=> b!544244 (and (bvsge (index!22110 lt!248427) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248427) (size!16877 a!3154)))))

(assert (=> b!544244 (= e!314679 (= (select (arr!16513 a!3154) (index!22110 lt!248427)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544245 () Bool)

(assert (=> b!544245 (and (bvsge (index!22110 lt!248427) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248427) (size!16877 a!3154)))))

(declare-fun res!338576 () Bool)

(assert (=> b!544245 (= res!338576 (= (select (arr!16513 a!3154) (index!22110 lt!248427)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544245 (=> res!338576 e!314679)))

(declare-fun b!544246 () Bool)

(assert (=> b!544246 (= e!314677 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001) mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544247 () Bool)

(assert (=> b!544247 (= e!314680 (Intermediate!4971 true (nextIndex!0 index!1177 x!1030 mask!3216) (bvadd x!1030 #b00000000000000000000000000000001)))))

(declare-fun b!544248 () Bool)

(declare-fun e!314681 () Bool)

(assert (=> b!544248 (= e!314681 e!314678)))

(declare-fun res!338574 () Bool)

(assert (=> b!544248 (= res!338574 (and ((_ is Intermediate!4971) lt!248427) (not (undefined!5783 lt!248427)) (bvslt (x!51010 lt!248427) #b01111111111111111111111111111110) (bvsge (x!51010 lt!248427) #b00000000000000000000000000000000) (bvsge (x!51010 lt!248427) (bvadd x!1030 #b00000000000000000000000000000001))))))

(assert (=> b!544248 (=> (not res!338574) (not e!314678))))

(declare-fun b!544249 () Bool)

(assert (=> b!544249 (= e!314681 (bvsge (x!51010 lt!248427) #b01111111111111111111111111111110))))

(declare-fun d!82043 () Bool)

(assert (=> d!82043 e!314681))

(declare-fun c!63154 () Bool)

(assert (=> d!82043 (= c!63154 (and ((_ is Intermediate!4971) lt!248427) (undefined!5783 lt!248427)))))

(assert (=> d!82043 (= lt!248427 e!314680)))

(declare-fun c!63155 () Bool)

(assert (=> d!82043 (= c!63155 (bvsge (bvadd x!1030 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!82043 (= lt!248426 (select (arr!16513 a!3154) (nextIndex!0 index!1177 x!1030 mask!3216)))))

(assert (=> d!82043 (validMask!0 mask!3216)))

(assert (=> d!82043 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16513 a!3154) j!147) a!3154 mask!3216) lt!248427)))

(assert (= (and d!82043 c!63155) b!544247))

(assert (= (and d!82043 (not c!63155)) b!544243))

(assert (= (and b!544243 c!63156) b!544241))

(assert (= (and b!544243 (not c!63156)) b!544246))

(assert (= (and d!82043 c!63154) b!544249))

(assert (= (and d!82043 (not c!63154)) b!544248))

(assert (= (and b!544248 res!338574) b!544242))

(assert (= (and b!544242 (not res!338575)) b!544245))

(assert (= (and b!544245 (not res!338576)) b!544244))

(declare-fun m!522179 () Bool)

(assert (=> b!544242 m!522179))

(assert (=> b!544245 m!522179))

(assert (=> d!82043 m!521873))

(declare-fun m!522181 () Bool)

(assert (=> d!82043 m!522181))

(assert (=> d!82043 m!521867))

(assert (=> b!544246 m!521873))

(declare-fun m!522183 () Bool)

(assert (=> b!544246 m!522183))

(assert (=> b!544246 m!522183))

(assert (=> b!544246 m!521859))

(declare-fun m!522185 () Bool)

(assert (=> b!544246 m!522185))

(assert (=> b!544244 m!522179))

(assert (=> b!544022 d!82043))

(assert (=> b!544022 d!81973))

(declare-fun d!82045 () Bool)

(declare-fun lt!248430 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!226 (List!10632) (InoxSet (_ BitVec 64)))

(assert (=> d!82045 (= lt!248430 (select (content!226 Nil!10629) (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(declare-fun e!314687 () Bool)

(assert (=> d!82045 (= lt!248430 e!314687)))

(declare-fun res!338582 () Bool)

(assert (=> d!82045 (=> (not res!338582) (not e!314687))))

(assert (=> d!82045 (= res!338582 ((_ is Cons!10628) Nil!10629))))

(assert (=> d!82045 (= (contains!2805 Nil!10629 (select (arr!16513 a!3154) #b00000000000000000000000000000000)) lt!248430)))

(declare-fun b!544254 () Bool)

(declare-fun e!314686 () Bool)

(assert (=> b!544254 (= e!314687 e!314686)))

(declare-fun res!338581 () Bool)

(assert (=> b!544254 (=> res!338581 e!314686)))

(assert (=> b!544254 (= res!338581 (= (h!11583 Nil!10629) (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!544255 () Bool)

(assert (=> b!544255 (= e!314686 (contains!2805 (t!16860 Nil!10629) (select (arr!16513 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82045 res!338582) b!544254))

(assert (= (and b!544254 (not res!338581)) b!544255))

(declare-fun m!522187 () Bool)

(assert (=> d!82045 m!522187))

(assert (=> d!82045 m!521919))

(declare-fun m!522189 () Bool)

(assert (=> d!82045 m!522189))

(assert (=> b!544255 m!521919))

(declare-fun m!522191 () Bool)

(assert (=> b!544255 m!522191))

(assert (=> b!543896 d!82045))

(assert (=> d!81947 d!81923))

(assert (=> b!543895 d!82033))

(assert (=> d!81975 d!81923))

(declare-fun b!544268 () Bool)

(declare-fun c!63165 () Bool)

(declare-fun lt!248435 () (_ BitVec 64))

(assert (=> b!544268 (= c!63165 (= lt!248435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!314694 () SeekEntryResult!4971)

(declare-fun e!314696 () SeekEntryResult!4971)

(assert (=> b!544268 (= e!314694 e!314696)))

(declare-fun d!82047 () Bool)

(declare-fun lt!248436 () SeekEntryResult!4971)

(assert (=> d!82047 (and (or ((_ is Undefined!4971) lt!248436) (not ((_ is Found!4971) lt!248436)) (and (bvsge (index!22109 lt!248436) #b00000000000000000000000000000000) (bvslt (index!22109 lt!248436) (size!16877 a!3154)))) (or ((_ is Undefined!4971) lt!248436) ((_ is Found!4971) lt!248436) (not ((_ is MissingVacant!4971) lt!248436)) (not (= (index!22111 lt!248436) (index!22110 lt!248302))) (and (bvsge (index!22111 lt!248436) #b00000000000000000000000000000000) (bvslt (index!22111 lt!248436) (size!16877 a!3154)))) (or ((_ is Undefined!4971) lt!248436) (ite ((_ is Found!4971) lt!248436) (= (select (arr!16513 a!3154) (index!22109 lt!248436)) k0!1998) (and ((_ is MissingVacant!4971) lt!248436) (= (index!22111 lt!248436) (index!22110 lt!248302)) (= (select (arr!16513 a!3154) (index!22111 lt!248436)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!314695 () SeekEntryResult!4971)

(assert (=> d!82047 (= lt!248436 e!314695)))

(declare-fun c!63163 () Bool)

(assert (=> d!82047 (= c!63163 (bvsge (x!51010 lt!248302) #b01111111111111111111111111111110))))

(assert (=> d!82047 (= lt!248435 (select (arr!16513 a!3154) (index!22110 lt!248302)))))

(assert (=> d!82047 (validMask!0 mask!3216)))

(assert (=> d!82047 (= (seekKeyOrZeroReturnVacant!0 (x!51010 lt!248302) (index!22110 lt!248302) (index!22110 lt!248302) k0!1998 a!3154 mask!3216) lt!248436)))

(declare-fun b!544269 () Bool)

(assert (=> b!544269 (= e!314695 Undefined!4971)))

(declare-fun b!544270 () Bool)

(assert (=> b!544270 (= e!314696 (seekKeyOrZeroReturnVacant!0 (bvadd (x!51010 lt!248302) #b00000000000000000000000000000001) (nextIndex!0 (index!22110 lt!248302) (x!51010 lt!248302) mask!3216) (index!22110 lt!248302) k0!1998 a!3154 mask!3216))))

(declare-fun b!544271 () Bool)

(assert (=> b!544271 (= e!314694 (Found!4971 (index!22110 lt!248302)))))

(declare-fun b!544272 () Bool)

(assert (=> b!544272 (= e!314696 (MissingVacant!4971 (index!22110 lt!248302)))))

(declare-fun b!544273 () Bool)

(assert (=> b!544273 (= e!314695 e!314694)))

(declare-fun c!63164 () Bool)

(assert (=> b!544273 (= c!63164 (= lt!248435 k0!1998))))

(assert (= (and d!82047 c!63163) b!544269))

(assert (= (and d!82047 (not c!63163)) b!544273))

(assert (= (and b!544273 c!63164) b!544271))

(assert (= (and b!544273 (not c!63164)) b!544268))

(assert (= (and b!544268 c!63165) b!544272))

(assert (= (and b!544268 (not c!63165)) b!544270))

(declare-fun m!522193 () Bool)

(assert (=> d!82047 m!522193))

(declare-fun m!522195 () Bool)

(assert (=> d!82047 m!522195))

(assert (=> d!82047 m!521945))

(assert (=> d!82047 m!521867))

(declare-fun m!522197 () Bool)

(assert (=> b!544270 m!522197))

(assert (=> b!544270 m!522197))

(declare-fun m!522199 () Bool)

(assert (=> b!544270 m!522199))

(assert (=> b!543940 d!82047))

(declare-fun b!544274 () Bool)

(declare-fun e!314697 () SeekEntryResult!4971)

(assert (=> b!544274 (= e!314697 (Intermediate!4971 false (toIndex!0 k0!1998 mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544275 () Bool)

(declare-fun lt!248438 () SeekEntryResult!4971)

(assert (=> b!544275 (and (bvsge (index!22110 lt!248438) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248438) (size!16877 a!3154)))))

(declare-fun res!338584 () Bool)

(assert (=> b!544275 (= res!338584 (= (select (arr!16513 a!3154) (index!22110 lt!248438)) k0!1998))))

(declare-fun e!314699 () Bool)

(assert (=> b!544275 (=> res!338584 e!314699)))

(declare-fun e!314698 () Bool)

(assert (=> b!544275 (= e!314698 e!314699)))

(declare-fun b!544276 () Bool)

(declare-fun e!314700 () SeekEntryResult!4971)

(assert (=> b!544276 (= e!314700 e!314697)))

(declare-fun c!63168 () Bool)

(declare-fun lt!248437 () (_ BitVec 64))

(assert (=> b!544276 (= c!63168 (or (= lt!248437 k0!1998) (= (bvadd lt!248437 lt!248437) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!544277 () Bool)

(assert (=> b!544277 (and (bvsge (index!22110 lt!248438) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248438) (size!16877 a!3154)))))

(assert (=> b!544277 (= e!314699 (= (select (arr!16513 a!3154) (index!22110 lt!248438)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!544278 () Bool)

(assert (=> b!544278 (and (bvsge (index!22110 lt!248438) #b00000000000000000000000000000000) (bvslt (index!22110 lt!248438) (size!16877 a!3154)))))

(declare-fun res!338585 () Bool)

(assert (=> b!544278 (= res!338585 (= (select (arr!16513 a!3154) (index!22110 lt!248438)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!544278 (=> res!338585 e!314699)))

(declare-fun b!544279 () Bool)

(assert (=> b!544279 (= e!314697 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!1998 mask!3216) #b00000000000000000000000000000000 mask!3216) k0!1998 a!3154 mask!3216))))

(declare-fun b!544280 () Bool)

(assert (=> b!544280 (= e!314700 (Intermediate!4971 true (toIndex!0 k0!1998 mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!544281 () Bool)

(declare-fun e!314701 () Bool)

(assert (=> b!544281 (= e!314701 e!314698)))

(declare-fun res!338583 () Bool)

(assert (=> b!544281 (= res!338583 (and ((_ is Intermediate!4971) lt!248438) (not (undefined!5783 lt!248438)) (bvslt (x!51010 lt!248438) #b01111111111111111111111111111110) (bvsge (x!51010 lt!248438) #b00000000000000000000000000000000) (bvsge (x!51010 lt!248438) #b00000000000000000000000000000000)))))

(assert (=> b!544281 (=> (not res!338583) (not e!314698))))

(declare-fun b!544282 () Bool)

(assert (=> b!544282 (= e!314701 (bvsge (x!51010 lt!248438) #b01111111111111111111111111111110))))

(declare-fun d!82049 () Bool)

(assert (=> d!82049 e!314701))

(declare-fun c!63166 () Bool)

(assert (=> d!82049 (= c!63166 (and ((_ is Intermediate!4971) lt!248438) (undefined!5783 lt!248438)))))

(assert (=> d!82049 (= lt!248438 e!314700)))

(declare-fun c!63167 () Bool)

(assert (=> d!82049 (= c!63167 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!82049 (= lt!248437 (select (arr!16513 a!3154) (toIndex!0 k0!1998 mask!3216)))))

(assert (=> d!82049 (validMask!0 mask!3216)))

(assert (=> d!82049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216) lt!248438)))

(assert (= (and d!82049 c!63167) b!544280))

(assert (= (and d!82049 (not c!63167)) b!544276))

(assert (= (and b!544276 c!63168) b!544274))

(assert (= (and b!544276 (not c!63168)) b!544279))

(assert (= (and d!82049 c!63166) b!544282))

(assert (= (and d!82049 (not c!63166)) b!544281))

(assert (= (and b!544281 res!338583) b!544275))

(assert (= (and b!544275 (not res!338584)) b!544278))

(assert (= (and b!544278 (not res!338585)) b!544277))

(declare-fun m!522201 () Bool)

(assert (=> b!544275 m!522201))

(assert (=> b!544278 m!522201))

(assert (=> d!82049 m!521947))

(declare-fun m!522203 () Bool)

(assert (=> d!82049 m!522203))

(assert (=> d!82049 m!521867))

(assert (=> b!544279 m!521947))

(declare-fun m!522205 () Bool)

(assert (=> b!544279 m!522205))

(assert (=> b!544279 m!522205))

(declare-fun m!522207 () Bool)

(assert (=> b!544279 m!522207))

(assert (=> b!544277 m!522201))

(assert (=> d!81933 d!82049))

(declare-fun d!82051 () Bool)

(declare-fun lt!248440 () (_ BitVec 32))

(declare-fun lt!248439 () (_ BitVec 32))

(assert (=> d!82051 (= lt!248440 (bvmul (bvxor lt!248439 (bvlshr lt!248439 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82051 (= lt!248439 ((_ extract 31 0) (bvand (bvxor k0!1998 (bvlshr k0!1998 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82051 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!338512 (let ((h!11586 ((_ extract 31 0) (bvand (bvxor k0!1998 (bvlshr k0!1998 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51018 (bvmul (bvxor h!11586 (bvlshr h!11586 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51018 (bvlshr x!51018 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!338512 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!338512 #b00000000000000000000000000000000))))))

(assert (=> d!82051 (= (toIndex!0 k0!1998 mask!3216) (bvand (bvxor lt!248440 (bvlshr lt!248440 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> d!81933 d!82051))

(assert (=> d!81933 d!81923))

(declare-fun d!82053 () Bool)

(declare-fun res!338588 () (_ BitVec 32))

(assert (=> d!82053 (and (bvsge res!338588 #b00000000000000000000000000000000) (bvslt res!338588 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(assert (=> d!82053 true))

(assert (=> d!82053 (= (choose!52 index!1177 x!1030 mask!3216) res!338588)))

(assert (=> d!81973 d!82053))

(assert (=> d!81973 d!81923))

(check-sat (not d!82039) (not b!544221) (not bm!32088) (not b!544218) (not d!82029) (not d!82043) (not b!544216) (not b!544237) (not b!544227) (not b!544246) (not b!544255) (not d!82031) (not b!544214) (not d!82045) (not bm!32087) (not b!544232) (not b!544217) (not b!544279) (not b!544270) (not d!82047) (not d!82049) (not b!544240) (not d!82035))
(check-sat)
