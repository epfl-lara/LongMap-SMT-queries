; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49608 () Bool)

(assert start!49608)

(declare-fun b!545773 () Bool)

(declare-fun res!339853 () Bool)

(declare-fun e!315426 () Bool)

(assert (=> b!545773 (=> (not res!339853) (not e!315426))))

(declare-datatypes ((array!34431 0))(
  ( (array!34432 (arr!16544 (Array (_ BitVec 32) (_ BitVec 64))) (size!16909 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34431)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34431 (_ BitVec 32)) Bool)

(assert (=> b!545773 (= res!339853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545774 () Bool)

(declare-fun res!339847 () Bool)

(declare-fun e!315424 () Bool)

(assert (=> b!545774 (=> (not res!339847) (not e!315424))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545774 (= res!339847 (validKeyInArray!0 (select (arr!16544 a!3154) j!147)))))

(declare-fun b!545775 () Bool)

(declare-fun e!315428 () Bool)

(assert (=> b!545775 (= e!315426 e!315428)))

(declare-fun res!339845 () Bool)

(assert (=> b!545775 (=> (not res!339845) (not e!315428))))

(declare-datatypes ((SeekEntryResult!4999 0))(
  ( (MissingZero!4999 (index!22220 (_ BitVec 32))) (Found!4999 (index!22221 (_ BitVec 32))) (Intermediate!4999 (undefined!5811 Bool) (index!22222 (_ BitVec 32)) (x!51154 (_ BitVec 32))) (Undefined!4999) (MissingVacant!4999 (index!22223 (_ BitVec 32))) )
))
(declare-fun lt!248910 () SeekEntryResult!4999)

(declare-fun lt!248911 () SeekEntryResult!4999)

(assert (=> b!545775 (= res!339845 (= lt!248910 lt!248911))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545775 (= lt!248911 (Intermediate!4999 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34431 (_ BitVec 32)) SeekEntryResult!4999)

(assert (=> b!545775 (= lt!248910 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16544 a!3154) j!147) a!3154 mask!3216))))

(declare-fun lt!248912 () array!34431)

(declare-fun lt!248913 () (_ BitVec 64))

(declare-fun b!545776 () Bool)

(declare-fun e!315425 () Bool)

(assert (=> b!545776 (= e!315425 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 lt!248913 lt!248912 mask!3216) lt!248911)))))

(declare-fun lt!248916 () (_ BitVec 32))

(assert (=> b!545776 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248916 lt!248913 lt!248912 mask!3216) lt!248911)))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!545776 (= lt!248913 (select (store (arr!16544 a!3154) i!1153 k0!1998) j!147))))

(assert (=> b!545776 (= lt!248912 (array!34432 (store (arr!16544 a!3154) i!1153 k0!1998) (size!16909 a!3154)))))

(declare-datatypes ((Unit!16924 0))(
  ( (Unit!16925) )
))
(declare-fun lt!248914 () Unit!16924)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16924)

(assert (=> b!545776 (= lt!248914 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!248916 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545777 () Bool)

(declare-fun e!315427 () Bool)

(assert (=> b!545777 (= e!315428 e!315427)))

(declare-fun res!339849 () Bool)

(assert (=> b!545777 (=> (not res!339849) (not e!315427))))

(declare-fun lt!248917 () SeekEntryResult!4999)

(assert (=> b!545777 (= res!339849 (and (= lt!248917 lt!248910) (not (= (select (arr!16544 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16544 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16544 a!3154) index!1177) (select (arr!16544 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545777 (= lt!248917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16544 a!3154) j!147) mask!3216) (select (arr!16544 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545778 () Bool)

(declare-fun res!339846 () Bool)

(assert (=> b!545778 (=> (not res!339846) (not e!315424))))

(declare-fun arrayContainsKey!0 (array!34431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545778 (= res!339846 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545780 () Bool)

(declare-fun e!315423 () Bool)

(assert (=> b!545780 (= e!315423 e!315425)))

(declare-fun res!339852 () Bool)

(assert (=> b!545780 (=> (not res!339852) (not e!315425))))

(declare-fun lt!248915 () SeekEntryResult!4999)

(assert (=> b!545780 (= res!339852 (and (= lt!248915 lt!248911) (= lt!248917 lt!248915)))))

(assert (=> b!545780 (= lt!248915 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248916 (select (arr!16544 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545781 () Bool)

(assert (=> b!545781 (= e!315424 e!315426)))

(declare-fun res!339844 () Bool)

(assert (=> b!545781 (=> (not res!339844) (not e!315426))))

(declare-fun lt!248909 () SeekEntryResult!4999)

(assert (=> b!545781 (= res!339844 (or (= lt!248909 (MissingZero!4999 i!1153)) (= lt!248909 (MissingVacant!4999 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34431 (_ BitVec 32)) SeekEntryResult!4999)

(assert (=> b!545781 (= lt!248909 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545782 () Bool)

(declare-fun res!339850 () Bool)

(assert (=> b!545782 (=> (not res!339850) (not e!315426))))

(assert (=> b!545782 (= res!339850 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16909 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16909 a!3154)) (= (select (arr!16544 a!3154) resIndex!32) (select (arr!16544 a!3154) j!147))))))

(declare-fun res!339842 () Bool)

(assert (=> start!49608 (=> (not res!339842) (not e!315424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49608 (= res!339842 (validMask!0 mask!3216))))

(assert (=> start!49608 e!315424))

(assert (=> start!49608 true))

(declare-fun array_inv!12427 (array!34431) Bool)

(assert (=> start!49608 (array_inv!12427 a!3154)))

(declare-fun b!545779 () Bool)

(declare-fun res!339843 () Bool)

(assert (=> b!545779 (=> (not res!339843) (not e!315424))))

(assert (=> b!545779 (= res!339843 (validKeyInArray!0 k0!1998))))

(declare-fun b!545783 () Bool)

(assert (=> b!545783 (= e!315427 e!315423)))

(declare-fun res!339854 () Bool)

(assert (=> b!545783 (=> (not res!339854) (not e!315423))))

(assert (=> b!545783 (= res!339854 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248916 #b00000000000000000000000000000000) (bvslt lt!248916 (size!16909 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545783 (= lt!248916 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545784 () Bool)

(declare-fun res!339851 () Bool)

(assert (=> b!545784 (=> (not res!339851) (not e!315424))))

(assert (=> b!545784 (= res!339851 (and (= (size!16909 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16909 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16909 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545785 () Bool)

(declare-fun res!339848 () Bool)

(assert (=> b!545785 (=> (not res!339848) (not e!315426))))

(declare-datatypes ((List!10702 0))(
  ( (Nil!10699) (Cons!10698 (h!11662 (_ BitVec 64)) (t!16921 List!10702)) )
))
(declare-fun arrayNoDuplicates!0 (array!34431 (_ BitVec 32) List!10702) Bool)

(assert (=> b!545785 (= res!339848 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10699))))

(assert (= (and start!49608 res!339842) b!545784))

(assert (= (and b!545784 res!339851) b!545774))

(assert (= (and b!545774 res!339847) b!545779))

(assert (= (and b!545779 res!339843) b!545778))

(assert (= (and b!545778 res!339846) b!545781))

(assert (= (and b!545781 res!339844) b!545773))

(assert (= (and b!545773 res!339853) b!545785))

(assert (= (and b!545785 res!339848) b!545782))

(assert (= (and b!545782 res!339850) b!545775))

(assert (= (and b!545775 res!339845) b!545777))

(assert (= (and b!545777 res!339849) b!545783))

(assert (= (and b!545783 res!339854) b!545780))

(assert (= (and b!545780 res!339852) b!545776))

(declare-fun m!522841 () Bool)

(assert (=> b!545774 m!522841))

(assert (=> b!545774 m!522841))

(declare-fun m!522843 () Bool)

(assert (=> b!545774 m!522843))

(declare-fun m!522845 () Bool)

(assert (=> b!545776 m!522845))

(declare-fun m!522847 () Bool)

(assert (=> b!545776 m!522847))

(declare-fun m!522849 () Bool)

(assert (=> b!545776 m!522849))

(declare-fun m!522851 () Bool)

(assert (=> b!545776 m!522851))

(declare-fun m!522853 () Bool)

(assert (=> b!545776 m!522853))

(declare-fun m!522855 () Bool)

(assert (=> b!545778 m!522855))

(assert (=> b!545775 m!522841))

(assert (=> b!545775 m!522841))

(declare-fun m!522857 () Bool)

(assert (=> b!545775 m!522857))

(declare-fun m!522859 () Bool)

(assert (=> b!545781 m!522859))

(declare-fun m!522861 () Bool)

(assert (=> b!545785 m!522861))

(declare-fun m!522863 () Bool)

(assert (=> start!49608 m!522863))

(declare-fun m!522865 () Bool)

(assert (=> start!49608 m!522865))

(declare-fun m!522867 () Bool)

(assert (=> b!545773 m!522867))

(declare-fun m!522869 () Bool)

(assert (=> b!545777 m!522869))

(assert (=> b!545777 m!522841))

(assert (=> b!545777 m!522841))

(declare-fun m!522871 () Bool)

(assert (=> b!545777 m!522871))

(assert (=> b!545777 m!522871))

(assert (=> b!545777 m!522841))

(declare-fun m!522873 () Bool)

(assert (=> b!545777 m!522873))

(assert (=> b!545780 m!522841))

(assert (=> b!545780 m!522841))

(declare-fun m!522875 () Bool)

(assert (=> b!545780 m!522875))

(declare-fun m!522877 () Bool)

(assert (=> b!545782 m!522877))

(assert (=> b!545782 m!522841))

(declare-fun m!522879 () Bool)

(assert (=> b!545783 m!522879))

(declare-fun m!522881 () Bool)

(assert (=> b!545779 m!522881))

(check-sat (not b!545779) (not b!545777) (not b!545785) (not b!545781) (not b!545780) (not b!545774) (not b!545773) (not b!545775) (not b!545776) (not b!545783) (not b!545778) (not start!49608))
(check-sat)
(get-model)

(declare-fun b!545872 () Bool)

(declare-fun e!315480 () Bool)

(declare-fun call!32107 () Bool)

(assert (=> b!545872 (= e!315480 call!32107)))

(declare-fun b!545873 () Bool)

(declare-fun e!315479 () Bool)

(declare-fun e!315478 () Bool)

(assert (=> b!545873 (= e!315479 e!315478)))

(declare-fun c!63294 () Bool)

(assert (=> b!545873 (= c!63294 (validKeyInArray!0 (select (arr!16544 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545874 () Bool)

(assert (=> b!545874 (= e!315478 e!315480)))

(declare-fun lt!248980 () (_ BitVec 64))

(assert (=> b!545874 (= lt!248980 (select (arr!16544 a!3154) #b00000000000000000000000000000000))))

(declare-fun lt!248979 () Unit!16924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34431 (_ BitVec 64) (_ BitVec 32)) Unit!16924)

(assert (=> b!545874 (= lt!248979 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248980 #b00000000000000000000000000000000))))

(assert (=> b!545874 (arrayContainsKey!0 a!3154 lt!248980 #b00000000000000000000000000000000)))

(declare-fun lt!248978 () Unit!16924)

(assert (=> b!545874 (= lt!248978 lt!248979)))

(declare-fun res!339938 () Bool)

(assert (=> b!545874 (= res!339938 (= (seekEntryOrOpen!0 (select (arr!16544 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4999 #b00000000000000000000000000000000)))))

(assert (=> b!545874 (=> (not res!339938) (not e!315480))))

(declare-fun d!82051 () Bool)

(declare-fun res!339937 () Bool)

(assert (=> d!82051 (=> res!339937 e!315479)))

(assert (=> d!82051 (= res!339937 (bvsge #b00000000000000000000000000000000 (size!16909 a!3154)))))

(assert (=> d!82051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315479)))

(declare-fun bm!32104 () Bool)

(assert (=> bm!32104 (= call!32107 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!545875 () Bool)

(assert (=> b!545875 (= e!315478 call!32107)))

(assert (= (and d!82051 (not res!339937)) b!545873))

(assert (= (and b!545873 c!63294) b!545874))

(assert (= (and b!545873 (not c!63294)) b!545875))

(assert (= (and b!545874 res!339938) b!545872))

(assert (= (or b!545872 b!545875) bm!32104))

(declare-fun m!522967 () Bool)

(assert (=> b!545873 m!522967))

(assert (=> b!545873 m!522967))

(declare-fun m!522969 () Bool)

(assert (=> b!545873 m!522969))

(assert (=> b!545874 m!522967))

(declare-fun m!522971 () Bool)

(assert (=> b!545874 m!522971))

(declare-fun m!522973 () Bool)

(assert (=> b!545874 m!522973))

(assert (=> b!545874 m!522967))

(declare-fun m!522975 () Bool)

(assert (=> b!545874 m!522975))

(declare-fun m!522977 () Bool)

(assert (=> bm!32104 m!522977))

(assert (=> b!545773 d!82051))

(declare-fun d!82053 () Bool)

(declare-fun lt!248983 () (_ BitVec 32))

(assert (=> d!82053 (and (bvsge lt!248983 #b00000000000000000000000000000000) (bvslt lt!248983 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82053 (= lt!248983 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!82053 (validMask!0 mask!3216)))

(assert (=> d!82053 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248983)))

(declare-fun bs!16993 () Bool)

(assert (= bs!16993 d!82053))

(declare-fun m!522979 () Bool)

(assert (=> bs!16993 m!522979))

(assert (=> bs!16993 m!522863))

(assert (=> b!545783 d!82053))

(declare-fun d!82055 () Bool)

(assert (=> d!82055 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49608 d!82055))

(declare-fun d!82057 () Bool)

(assert (=> d!82057 (= (array_inv!12427 a!3154) (bvsge (size!16909 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49608 d!82057))

(declare-fun b!545894 () Bool)

(declare-fun e!315494 () SeekEntryResult!4999)

(declare-fun e!315495 () SeekEntryResult!4999)

(assert (=> b!545894 (= e!315494 e!315495)))

(declare-fun c!63301 () Bool)

(declare-fun lt!248990 () (_ BitVec 64))

(assert (=> b!545894 (= c!63301 (or (= lt!248990 lt!248913) (= (bvadd lt!248990 lt!248990) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!545895 () Bool)

(assert (=> b!545895 (= e!315495 (Intermediate!4999 false index!1177 x!1030))))

(declare-fun b!545896 () Bool)

(assert (=> b!545896 (= e!315494 (Intermediate!4999 true index!1177 x!1030))))

(declare-fun b!545897 () Bool)

(declare-fun lt!248991 () SeekEntryResult!4999)

(assert (=> b!545897 (and (bvsge (index!22222 lt!248991) #b00000000000000000000000000000000) (bvslt (index!22222 lt!248991) (size!16909 lt!248912)))))

(declare-fun e!315493 () Bool)

(assert (=> b!545897 (= e!315493 (= (select (arr!16544 lt!248912) (index!22222 lt!248991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545898 () Bool)

(assert (=> b!545898 (= e!315495 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) lt!248913 lt!248912 mask!3216))))

(declare-fun d!82059 () Bool)

(declare-fun e!315491 () Bool)

(assert (=> d!82059 e!315491))

(declare-fun c!63303 () Bool)

(get-info :version)

(assert (=> d!82059 (= c!63303 (and ((_ is Intermediate!4999) lt!248991) (undefined!5811 lt!248991)))))

(assert (=> d!82059 (= lt!248991 e!315494)))

(declare-fun c!63302 () Bool)

(assert (=> d!82059 (= c!63302 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!82059 (= lt!248990 (select (arr!16544 lt!248912) index!1177))))

(assert (=> d!82059 (validMask!0 mask!3216)))

(assert (=> d!82059 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 lt!248913 lt!248912 mask!3216) lt!248991)))

(declare-fun b!545899 () Bool)

(assert (=> b!545899 (= e!315491 (bvsge (x!51154 lt!248991) #b01111111111111111111111111111110))))

(declare-fun b!545900 () Bool)

(assert (=> b!545900 (and (bvsge (index!22222 lt!248991) #b00000000000000000000000000000000) (bvslt (index!22222 lt!248991) (size!16909 lt!248912)))))

(declare-fun res!339947 () Bool)

(assert (=> b!545900 (= res!339947 (= (select (arr!16544 lt!248912) (index!22222 lt!248991)) lt!248913))))

(assert (=> b!545900 (=> res!339947 e!315493)))

(declare-fun e!315492 () Bool)

(assert (=> b!545900 (= e!315492 e!315493)))

(declare-fun b!545901 () Bool)

(assert (=> b!545901 (and (bvsge (index!22222 lt!248991) #b00000000000000000000000000000000) (bvslt (index!22222 lt!248991) (size!16909 lt!248912)))))

(declare-fun res!339945 () Bool)

(assert (=> b!545901 (= res!339945 (= (select (arr!16544 lt!248912) (index!22222 lt!248991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545901 (=> res!339945 e!315493)))

(declare-fun b!545902 () Bool)

(assert (=> b!545902 (= e!315491 e!315492)))

(declare-fun res!339946 () Bool)

(assert (=> b!545902 (= res!339946 (and ((_ is Intermediate!4999) lt!248991) (not (undefined!5811 lt!248991)) (bvslt (x!51154 lt!248991) #b01111111111111111111111111111110) (bvsge (x!51154 lt!248991) #b00000000000000000000000000000000) (bvsge (x!51154 lt!248991) x!1030)))))

(assert (=> b!545902 (=> (not res!339946) (not e!315492))))

(assert (= (and d!82059 c!63302) b!545896))

(assert (= (and d!82059 (not c!63302)) b!545894))

(assert (= (and b!545894 c!63301) b!545895))

(assert (= (and b!545894 (not c!63301)) b!545898))

(assert (= (and d!82059 c!63303) b!545899))

(assert (= (and d!82059 (not c!63303)) b!545902))

(assert (= (and b!545902 res!339946) b!545900))

(assert (= (and b!545900 (not res!339947)) b!545901))

(assert (= (and b!545901 (not res!339945)) b!545897))

(declare-fun m!522983 () Bool)

(assert (=> d!82059 m!522983))

(assert (=> d!82059 m!522863))

(declare-fun m!522985 () Bool)

(assert (=> b!545897 m!522985))

(assert (=> b!545900 m!522985))

(assert (=> b!545898 m!522879))

(assert (=> b!545898 m!522879))

(declare-fun m!522987 () Bool)

(assert (=> b!545898 m!522987))

(assert (=> b!545901 m!522985))

(assert (=> b!545776 d!82059))

(declare-fun b!545903 () Bool)

(declare-fun e!315499 () SeekEntryResult!4999)

(declare-fun e!315500 () SeekEntryResult!4999)

(assert (=> b!545903 (= e!315499 e!315500)))

(declare-fun c!63304 () Bool)

(declare-fun lt!248993 () (_ BitVec 64))

(assert (=> b!545903 (= c!63304 (or (= lt!248993 lt!248913) (= (bvadd lt!248993 lt!248993) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!545904 () Bool)

(assert (=> b!545904 (= e!315500 (Intermediate!4999 false lt!248916 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!545905 () Bool)

(assert (=> b!545905 (= e!315499 (Intermediate!4999 true lt!248916 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!545906 () Bool)

(declare-fun lt!248994 () SeekEntryResult!4999)

(assert (=> b!545906 (and (bvsge (index!22222 lt!248994) #b00000000000000000000000000000000) (bvslt (index!22222 lt!248994) (size!16909 lt!248912)))))

(declare-fun e!315498 () Bool)

(assert (=> b!545906 (= e!315498 (= (select (arr!16544 lt!248912) (index!22222 lt!248994)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545907 () Bool)

(assert (=> b!545907 (= e!315500 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!248916 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) lt!248913 lt!248912 mask!3216))))

(declare-fun d!82069 () Bool)

(declare-fun e!315496 () Bool)

(assert (=> d!82069 e!315496))

(declare-fun c!63306 () Bool)

(assert (=> d!82069 (= c!63306 (and ((_ is Intermediate!4999) lt!248994) (undefined!5811 lt!248994)))))

(assert (=> d!82069 (= lt!248994 e!315499)))

(declare-fun c!63305 () Bool)

(assert (=> d!82069 (= c!63305 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(assert (=> d!82069 (= lt!248993 (select (arr!16544 lt!248912) lt!248916))))

(assert (=> d!82069 (validMask!0 mask!3216)))

(assert (=> d!82069 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248916 lt!248913 lt!248912 mask!3216) lt!248994)))

(declare-fun b!545908 () Bool)

(assert (=> b!545908 (= e!315496 (bvsge (x!51154 lt!248994) #b01111111111111111111111111111110))))

(declare-fun b!545909 () Bool)

(assert (=> b!545909 (and (bvsge (index!22222 lt!248994) #b00000000000000000000000000000000) (bvslt (index!22222 lt!248994) (size!16909 lt!248912)))))

(declare-fun res!339950 () Bool)

(assert (=> b!545909 (= res!339950 (= (select (arr!16544 lt!248912) (index!22222 lt!248994)) lt!248913))))

(assert (=> b!545909 (=> res!339950 e!315498)))

(declare-fun e!315497 () Bool)

(assert (=> b!545909 (= e!315497 e!315498)))

(declare-fun b!545910 () Bool)

(assert (=> b!545910 (and (bvsge (index!22222 lt!248994) #b00000000000000000000000000000000) (bvslt (index!22222 lt!248994) (size!16909 lt!248912)))))

(declare-fun res!339948 () Bool)

(assert (=> b!545910 (= res!339948 (= (select (arr!16544 lt!248912) (index!22222 lt!248994)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545910 (=> res!339948 e!315498)))

(declare-fun b!545911 () Bool)

(assert (=> b!545911 (= e!315496 e!315497)))

(declare-fun res!339949 () Bool)

(assert (=> b!545911 (= res!339949 (and ((_ is Intermediate!4999) lt!248994) (not (undefined!5811 lt!248994)) (bvslt (x!51154 lt!248994) #b01111111111111111111111111111110) (bvsge (x!51154 lt!248994) #b00000000000000000000000000000000) (bvsge (x!51154 lt!248994) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!545911 (=> (not res!339949) (not e!315497))))

(assert (= (and d!82069 c!63305) b!545905))

(assert (= (and d!82069 (not c!63305)) b!545903))

(assert (= (and b!545903 c!63304) b!545904))

(assert (= (and b!545903 (not c!63304)) b!545907))

(assert (= (and d!82069 c!63306) b!545908))

(assert (= (and d!82069 (not c!63306)) b!545911))

(assert (= (and b!545911 res!339949) b!545909))

(assert (= (and b!545909 (not res!339950)) b!545910))

(assert (= (and b!545910 (not res!339948)) b!545906))

(declare-fun m!522989 () Bool)

(assert (=> d!82069 m!522989))

(assert (=> d!82069 m!522863))

(declare-fun m!522991 () Bool)

(assert (=> b!545906 m!522991))

(assert (=> b!545909 m!522991))

(declare-fun m!522993 () Bool)

(assert (=> b!545907 m!522993))

(assert (=> b!545907 m!522993))

(declare-fun m!522995 () Bool)

(assert (=> b!545907 m!522995))

(assert (=> b!545910 m!522991))

(assert (=> b!545776 d!82069))

(declare-fun d!82071 () Bool)

(declare-fun e!315503 () Bool)

(assert (=> d!82071 e!315503))

(declare-fun res!339953 () Bool)

(assert (=> d!82071 (=> (not res!339953) (not e!315503))))

(assert (=> d!82071 (= res!339953 (and (or (bvslt i!1153 #b00000000000000000000000000000000) (bvsge i!1153 (size!16909 a!3154)) (and (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16909 a!3154)))) (or (bvslt i!1153 #b00000000000000000000000000000000) (bvsge i!1153 (size!16909 a!3154)) (and (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16909 a!3154)))) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16909 a!3154))))))

(declare-fun lt!248997 () Unit!16924)

(declare-fun choose!47 (array!34431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16924)

(assert (=> d!82071 (= lt!248997 (choose!47 a!3154 i!1153 k0!1998 j!147 lt!248916 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(assert (=> d!82071 (validMask!0 mask!3216)))

(assert (=> d!82071 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!248916 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216) lt!248997)))

(declare-fun b!545914 () Bool)

(assert (=> b!545914 (= e!315503 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248916 (select (store (arr!16544 a!3154) i!1153 k0!1998) j!147) (array!34432 (store (arr!16544 a!3154) i!1153 k0!1998) (size!16909 a!3154)) mask!3216) (Intermediate!4999 false resIndex!32 resX!32)))))

(assert (= (and d!82071 res!339953) b!545914))

(declare-fun m!522997 () Bool)

(assert (=> d!82071 m!522997))

(assert (=> d!82071 m!522863))

(assert (=> b!545914 m!522853))

(assert (=> b!545914 m!522845))

(assert (=> b!545914 m!522845))

(declare-fun m!522999 () Bool)

(assert (=> b!545914 m!522999))

(assert (=> b!545776 d!82071))

(declare-fun b!545919 () Bool)

(declare-fun e!315509 () SeekEntryResult!4999)

(declare-fun e!315510 () SeekEntryResult!4999)

(assert (=> b!545919 (= e!315509 e!315510)))

(declare-fun lt!249002 () (_ BitVec 64))

(declare-fun c!63309 () Bool)

(assert (=> b!545919 (= c!63309 (or (= lt!249002 (select (arr!16544 a!3154) j!147)) (= (bvadd lt!249002 lt!249002) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!545920 () Bool)

(assert (=> b!545920 (= e!315510 (Intermediate!4999 false index!1177 x!1030))))

(declare-fun b!545921 () Bool)

(assert (=> b!545921 (= e!315509 (Intermediate!4999 true index!1177 x!1030))))

(declare-fun b!545922 () Bool)

(declare-fun lt!249003 () SeekEntryResult!4999)

(assert (=> b!545922 (and (bvsge (index!22222 lt!249003) #b00000000000000000000000000000000) (bvslt (index!22222 lt!249003) (size!16909 a!3154)))))

(declare-fun e!315508 () Bool)

(assert (=> b!545922 (= e!315508 (= (select (arr!16544 a!3154) (index!22222 lt!249003)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545923 () Bool)

(assert (=> b!545923 (= e!315510 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16544 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!82073 () Bool)

(declare-fun e!315506 () Bool)

(assert (=> d!82073 e!315506))

(declare-fun c!63311 () Bool)

(assert (=> d!82073 (= c!63311 (and ((_ is Intermediate!4999) lt!249003) (undefined!5811 lt!249003)))))

(assert (=> d!82073 (= lt!249003 e!315509)))

(declare-fun c!63310 () Bool)

(assert (=> d!82073 (= c!63310 (bvsge x!1030 #b01111111111111111111111111111110))))

(assert (=> d!82073 (= lt!249002 (select (arr!16544 a!3154) index!1177))))

(assert (=> d!82073 (validMask!0 mask!3216)))

(assert (=> d!82073 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16544 a!3154) j!147) a!3154 mask!3216) lt!249003)))

(declare-fun b!545924 () Bool)

(assert (=> b!545924 (= e!315506 (bvsge (x!51154 lt!249003) #b01111111111111111111111111111110))))

(declare-fun b!545925 () Bool)

(assert (=> b!545925 (and (bvsge (index!22222 lt!249003) #b00000000000000000000000000000000) (bvslt (index!22222 lt!249003) (size!16909 a!3154)))))

(declare-fun res!339956 () Bool)

(assert (=> b!545925 (= res!339956 (= (select (arr!16544 a!3154) (index!22222 lt!249003)) (select (arr!16544 a!3154) j!147)))))

(assert (=> b!545925 (=> res!339956 e!315508)))

(declare-fun e!315507 () Bool)

(assert (=> b!545925 (= e!315507 e!315508)))

(declare-fun b!545926 () Bool)

(assert (=> b!545926 (and (bvsge (index!22222 lt!249003) #b00000000000000000000000000000000) (bvslt (index!22222 lt!249003) (size!16909 a!3154)))))

(declare-fun res!339954 () Bool)

(assert (=> b!545926 (= res!339954 (= (select (arr!16544 a!3154) (index!22222 lt!249003)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545926 (=> res!339954 e!315508)))

(declare-fun b!545927 () Bool)

(assert (=> b!545927 (= e!315506 e!315507)))

(declare-fun res!339955 () Bool)

(assert (=> b!545927 (= res!339955 (and ((_ is Intermediate!4999) lt!249003) (not (undefined!5811 lt!249003)) (bvslt (x!51154 lt!249003) #b01111111111111111111111111111110) (bvsge (x!51154 lt!249003) #b00000000000000000000000000000000) (bvsge (x!51154 lt!249003) x!1030)))))

(assert (=> b!545927 (=> (not res!339955) (not e!315507))))

(assert (= (and d!82073 c!63310) b!545921))

(assert (= (and d!82073 (not c!63310)) b!545919))

(assert (= (and b!545919 c!63309) b!545920))

(assert (= (and b!545919 (not c!63309)) b!545923))

(assert (= (and d!82073 c!63311) b!545924))

(assert (= (and d!82073 (not c!63311)) b!545927))

(assert (= (and b!545927 res!339955) b!545925))

(assert (= (and b!545925 (not res!339956)) b!545926))

(assert (= (and b!545926 (not res!339954)) b!545922))

(assert (=> d!82073 m!522869))

(assert (=> d!82073 m!522863))

(declare-fun m!523001 () Bool)

(assert (=> b!545922 m!523001))

(assert (=> b!545925 m!523001))

(assert (=> b!545923 m!522879))

(assert (=> b!545923 m!522879))

(assert (=> b!545923 m!522841))

(declare-fun m!523003 () Bool)

(assert (=> b!545923 m!523003))

(assert (=> b!545926 m!523001))

(assert (=> b!545775 d!82073))

(declare-fun b!545988 () Bool)

(declare-fun e!315549 () Bool)

(declare-fun call!32110 () Bool)

(assert (=> b!545988 (= e!315549 call!32110)))

(declare-fun b!545989 () Bool)

(declare-fun e!315548 () Bool)

(declare-fun contains!2794 (List!10702 (_ BitVec 64)) Bool)

(assert (=> b!545989 (= e!315548 (contains!2794 Nil!10699 (select (arr!16544 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!82075 () Bool)

(declare-fun res!339981 () Bool)

(declare-fun e!315550 () Bool)

(assert (=> d!82075 (=> res!339981 e!315550)))

(assert (=> d!82075 (= res!339981 (bvsge #b00000000000000000000000000000000 (size!16909 a!3154)))))

(assert (=> d!82075 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10699) e!315550)))

(declare-fun b!545990 () Bool)

(declare-fun e!315547 () Bool)

(assert (=> b!545990 (= e!315550 e!315547)))

(declare-fun res!339983 () Bool)

(assert (=> b!545990 (=> (not res!339983) (not e!315547))))

(assert (=> b!545990 (= res!339983 (not e!315548))))

(declare-fun res!339982 () Bool)

(assert (=> b!545990 (=> (not res!339982) (not e!315548))))

(assert (=> b!545990 (= res!339982 (validKeyInArray!0 (select (arr!16544 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545991 () Bool)

(assert (=> b!545991 (= e!315547 e!315549)))

(declare-fun c!63330 () Bool)

(assert (=> b!545991 (= c!63330 (validKeyInArray!0 (select (arr!16544 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32107 () Bool)

(assert (=> bm!32107 (= call!32110 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63330 (Cons!10698 (select (arr!16544 a!3154) #b00000000000000000000000000000000) Nil!10699) Nil!10699)))))

(declare-fun b!545992 () Bool)

(assert (=> b!545992 (= e!315549 call!32110)))

(assert (= (and d!82075 (not res!339981)) b!545990))

(assert (= (and b!545990 res!339982) b!545989))

(assert (= (and b!545990 res!339983) b!545991))

(assert (= (and b!545991 c!63330) b!545988))

(assert (= (and b!545991 (not c!63330)) b!545992))

(assert (= (or b!545988 b!545992) bm!32107))

(assert (=> b!545989 m!522967))

(assert (=> b!545989 m!522967))

(declare-fun m!523017 () Bool)

(assert (=> b!545989 m!523017))

(assert (=> b!545990 m!522967))

(assert (=> b!545990 m!522967))

(assert (=> b!545990 m!522969))

(assert (=> b!545991 m!522967))

(assert (=> b!545991 m!522967))

(assert (=> b!545991 m!522969))

(assert (=> bm!32107 m!522967))

(declare-fun m!523019 () Bool)

(assert (=> bm!32107 m!523019))

(assert (=> b!545785 d!82075))

(declare-fun d!82081 () Bool)

(assert (=> d!82081 (= (validKeyInArray!0 (select (arr!16544 a!3154) j!147)) (and (not (= (select (arr!16544 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16544 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!545774 d!82081))

(declare-fun d!82085 () Bool)

(assert (=> d!82085 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!545779 d!82085))

(declare-fun d!82087 () Bool)

(declare-fun res!339993 () Bool)

(declare-fun e!315560 () Bool)

(assert (=> d!82087 (=> res!339993 e!315560)))

(assert (=> d!82087 (= res!339993 (= (select (arr!16544 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!82087 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!315560)))

(declare-fun b!546006 () Bool)

(declare-fun e!315561 () Bool)

(assert (=> b!546006 (= e!315560 e!315561)))

(declare-fun res!339994 () Bool)

(assert (=> b!546006 (=> (not res!339994) (not e!315561))))

(assert (=> b!546006 (= res!339994 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16909 a!3154)))))

(declare-fun b!546007 () Bool)

(assert (=> b!546007 (= e!315561 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82087 (not res!339993)) b!546006))

(assert (= (and b!546006 res!339994) b!546007))

(assert (=> d!82087 m!522967))

(declare-fun m!523031 () Bool)

(assert (=> b!546007 m!523031))

(assert (=> b!545778 d!82087))

(declare-fun b!546008 () Bool)

(declare-fun e!315565 () SeekEntryResult!4999)

(declare-fun e!315566 () SeekEntryResult!4999)

(assert (=> b!546008 (= e!315565 e!315566)))

(declare-fun lt!249023 () (_ BitVec 64))

(declare-fun c!63334 () Bool)

(assert (=> b!546008 (= c!63334 (or (= lt!249023 (select (arr!16544 a!3154) j!147)) (= (bvadd lt!249023 lt!249023) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546009 () Bool)

(assert (=> b!546009 (= e!315566 (Intermediate!4999 false (toIndex!0 (select (arr!16544 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!546010 () Bool)

(assert (=> b!546010 (= e!315565 (Intermediate!4999 true (toIndex!0 (select (arr!16544 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!546011 () Bool)

(declare-fun lt!249024 () SeekEntryResult!4999)

(assert (=> b!546011 (and (bvsge (index!22222 lt!249024) #b00000000000000000000000000000000) (bvslt (index!22222 lt!249024) (size!16909 a!3154)))))

(declare-fun e!315564 () Bool)

(assert (=> b!546011 (= e!315564 (= (select (arr!16544 a!3154) (index!22222 lt!249024)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546012 () Bool)

(assert (=> b!546012 (= e!315566 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16544 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16544 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!82091 () Bool)

(declare-fun e!315562 () Bool)

(assert (=> d!82091 e!315562))

(declare-fun c!63336 () Bool)

(assert (=> d!82091 (= c!63336 (and ((_ is Intermediate!4999) lt!249024) (undefined!5811 lt!249024)))))

(assert (=> d!82091 (= lt!249024 e!315565)))

(declare-fun c!63335 () Bool)

(assert (=> d!82091 (= c!63335 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!82091 (= lt!249023 (select (arr!16544 a!3154) (toIndex!0 (select (arr!16544 a!3154) j!147) mask!3216)))))

(assert (=> d!82091 (validMask!0 mask!3216)))

(assert (=> d!82091 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16544 a!3154) j!147) mask!3216) (select (arr!16544 a!3154) j!147) a!3154 mask!3216) lt!249024)))

(declare-fun b!546013 () Bool)

(assert (=> b!546013 (= e!315562 (bvsge (x!51154 lt!249024) #b01111111111111111111111111111110))))

(declare-fun b!546014 () Bool)

(assert (=> b!546014 (and (bvsge (index!22222 lt!249024) #b00000000000000000000000000000000) (bvslt (index!22222 lt!249024) (size!16909 a!3154)))))

(declare-fun res!339997 () Bool)

(assert (=> b!546014 (= res!339997 (= (select (arr!16544 a!3154) (index!22222 lt!249024)) (select (arr!16544 a!3154) j!147)))))

(assert (=> b!546014 (=> res!339997 e!315564)))

(declare-fun e!315563 () Bool)

(assert (=> b!546014 (= e!315563 e!315564)))

(declare-fun b!546015 () Bool)

(assert (=> b!546015 (and (bvsge (index!22222 lt!249024) #b00000000000000000000000000000000) (bvslt (index!22222 lt!249024) (size!16909 a!3154)))))

(declare-fun res!339995 () Bool)

(assert (=> b!546015 (= res!339995 (= (select (arr!16544 a!3154) (index!22222 lt!249024)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546015 (=> res!339995 e!315564)))

(declare-fun b!546016 () Bool)

(assert (=> b!546016 (= e!315562 e!315563)))

(declare-fun res!339996 () Bool)

(assert (=> b!546016 (= res!339996 (and ((_ is Intermediate!4999) lt!249024) (not (undefined!5811 lt!249024)) (bvslt (x!51154 lt!249024) #b01111111111111111111111111111110) (bvsge (x!51154 lt!249024) #b00000000000000000000000000000000) (bvsge (x!51154 lt!249024) #b00000000000000000000000000000000)))))

(assert (=> b!546016 (=> (not res!339996) (not e!315563))))

(assert (= (and d!82091 c!63335) b!546010))

(assert (= (and d!82091 (not c!63335)) b!546008))

(assert (= (and b!546008 c!63334) b!546009))

(assert (= (and b!546008 (not c!63334)) b!546012))

(assert (= (and d!82091 c!63336) b!546013))

(assert (= (and d!82091 (not c!63336)) b!546016))

(assert (= (and b!546016 res!339996) b!546014))

(assert (= (and b!546014 (not res!339997)) b!546015))

(assert (= (and b!546015 (not res!339995)) b!546011))

(assert (=> d!82091 m!522871))

(declare-fun m!523033 () Bool)

(assert (=> d!82091 m!523033))

(assert (=> d!82091 m!522863))

(declare-fun m!523035 () Bool)

(assert (=> b!546011 m!523035))

(assert (=> b!546014 m!523035))

(assert (=> b!546012 m!522871))

(declare-fun m!523037 () Bool)

(assert (=> b!546012 m!523037))

(assert (=> b!546012 m!523037))

(assert (=> b!546012 m!522841))

(declare-fun m!523043 () Bool)

(assert (=> b!546012 m!523043))

(assert (=> b!546015 m!523035))

(assert (=> b!545777 d!82091))

(declare-fun d!82095 () Bool)

(declare-fun lt!249042 () (_ BitVec 32))

(declare-fun lt!249041 () (_ BitVec 32))

(assert (=> d!82095 (= lt!249042 (bvmul (bvxor lt!249041 (bvlshr lt!249041 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82095 (= lt!249041 ((_ extract 31 0) (bvand (bvxor (select (arr!16544 a!3154) j!147) (bvlshr (select (arr!16544 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82095 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!340004 (let ((h!11667 ((_ extract 31 0) (bvand (bvxor (select (arr!16544 a!3154) j!147) (bvlshr (select (arr!16544 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51166 (bvmul (bvxor h!11667 (bvlshr h!11667 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51166 (bvlshr x!51166 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!340004 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!340004 #b00000000000000000000000000000000))))))

(assert (=> d!82095 (= (toIndex!0 (select (arr!16544 a!3154) j!147) mask!3216) (bvand (bvxor lt!249042 (bvlshr lt!249042 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!545777 d!82095))

(declare-fun b!546092 () Bool)

(declare-fun c!63371 () Bool)

(declare-fun lt!249067 () (_ BitVec 64))

(assert (=> b!546092 (= c!63371 (= lt!249067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!315606 () SeekEntryResult!4999)

(declare-fun e!315607 () SeekEntryResult!4999)

(assert (=> b!546092 (= e!315606 e!315607)))

(declare-fun b!546093 () Bool)

(declare-fun e!315608 () SeekEntryResult!4999)

(assert (=> b!546093 (= e!315608 e!315606)))

(declare-fun lt!249068 () SeekEntryResult!4999)

(assert (=> b!546093 (= lt!249067 (select (arr!16544 a!3154) (index!22222 lt!249068)))))

(declare-fun c!63370 () Bool)

(assert (=> b!546093 (= c!63370 (= lt!249067 k0!1998))))

(declare-fun b!546094 () Bool)

(assert (=> b!546094 (= e!315607 (MissingZero!4999 (index!22222 lt!249068)))))

(declare-fun b!546095 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34431 (_ BitVec 32)) SeekEntryResult!4999)

(assert (=> b!546095 (= e!315607 (seekKeyOrZeroReturnVacant!0 (x!51154 lt!249068) (index!22222 lt!249068) (index!22222 lt!249068) k0!1998 a!3154 mask!3216))))

(declare-fun b!546097 () Bool)

(assert (=> b!546097 (= e!315606 (Found!4999 (index!22222 lt!249068)))))

(declare-fun d!82107 () Bool)

(declare-fun lt!249069 () SeekEntryResult!4999)

(assert (=> d!82107 (and (or ((_ is Undefined!4999) lt!249069) (not ((_ is Found!4999) lt!249069)) (and (bvsge (index!22221 lt!249069) #b00000000000000000000000000000000) (bvslt (index!22221 lt!249069) (size!16909 a!3154)))) (or ((_ is Undefined!4999) lt!249069) ((_ is Found!4999) lt!249069) (not ((_ is MissingZero!4999) lt!249069)) (and (bvsge (index!22220 lt!249069) #b00000000000000000000000000000000) (bvslt (index!22220 lt!249069) (size!16909 a!3154)))) (or ((_ is Undefined!4999) lt!249069) ((_ is Found!4999) lt!249069) ((_ is MissingZero!4999) lt!249069) (not ((_ is MissingVacant!4999) lt!249069)) (and (bvsge (index!22223 lt!249069) #b00000000000000000000000000000000) (bvslt (index!22223 lt!249069) (size!16909 a!3154)))) (or ((_ is Undefined!4999) lt!249069) (ite ((_ is Found!4999) lt!249069) (= (select (arr!16544 a!3154) (index!22221 lt!249069)) k0!1998) (ite ((_ is MissingZero!4999) lt!249069) (= (select (arr!16544 a!3154) (index!22220 lt!249069)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4999) lt!249069) (= (select (arr!16544 a!3154) (index!22223 lt!249069)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82107 (= lt!249069 e!315608)))

(declare-fun c!63372 () Bool)

(assert (=> d!82107 (= c!63372 (and ((_ is Intermediate!4999) lt!249068) (undefined!5811 lt!249068)))))

(assert (=> d!82107 (= lt!249068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!82107 (validMask!0 mask!3216)))

(assert (=> d!82107 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!249069)))

(declare-fun b!546096 () Bool)

(assert (=> b!546096 (= e!315608 Undefined!4999)))

(assert (= (and d!82107 c!63372) b!546096))

(assert (= (and d!82107 (not c!63372)) b!546093))

(assert (= (and b!546093 c!63370) b!546097))

(assert (= (and b!546093 (not c!63370)) b!546092))

(assert (= (and b!546092 c!63371) b!546094))

(assert (= (and b!546092 (not c!63371)) b!546095))

(declare-fun m!523089 () Bool)

(assert (=> b!546093 m!523089))

(declare-fun m!523091 () Bool)

(assert (=> b!546095 m!523091))

(assert (=> d!82107 m!522863))

(declare-fun m!523093 () Bool)

(assert (=> d!82107 m!523093))

(declare-fun m!523095 () Bool)

(assert (=> d!82107 m!523095))

(declare-fun m!523097 () Bool)

(assert (=> d!82107 m!523097))

(declare-fun m!523099 () Bool)

(assert (=> d!82107 m!523099))

(assert (=> d!82107 m!523093))

(declare-fun m!523101 () Bool)

(assert (=> d!82107 m!523101))

(assert (=> b!545781 d!82107))

(declare-fun b!546098 () Bool)

(declare-fun e!315612 () SeekEntryResult!4999)

(declare-fun e!315613 () SeekEntryResult!4999)

(assert (=> b!546098 (= e!315612 e!315613)))

(declare-fun c!63373 () Bool)

(declare-fun lt!249070 () (_ BitVec 64))

(assert (=> b!546098 (= c!63373 (or (= lt!249070 (select (arr!16544 a!3154) j!147)) (= (bvadd lt!249070 lt!249070) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!546099 () Bool)

(assert (=> b!546099 (= e!315613 (Intermediate!4999 false lt!248916 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546100 () Bool)

(assert (=> b!546100 (= e!315612 (Intermediate!4999 true lt!248916 (bvadd #b00000000000000000000000000000001 x!1030)))))

(declare-fun b!546101 () Bool)

(declare-fun lt!249071 () SeekEntryResult!4999)

(assert (=> b!546101 (and (bvsge (index!22222 lt!249071) #b00000000000000000000000000000000) (bvslt (index!22222 lt!249071) (size!16909 a!3154)))))

(declare-fun e!315611 () Bool)

(assert (=> b!546101 (= e!315611 (= (select (arr!16544 a!3154) (index!22222 lt!249071)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!546102 () Bool)

(assert (=> b!546102 (= e!315613 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030 #b00000000000000000000000000000001) (nextIndex!0 lt!248916 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216) (select (arr!16544 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!82115 () Bool)

(declare-fun e!315609 () Bool)

(assert (=> d!82115 e!315609))

(declare-fun c!63375 () Bool)

(assert (=> d!82115 (= c!63375 (and ((_ is Intermediate!4999) lt!249071) (undefined!5811 lt!249071)))))

(assert (=> d!82115 (= lt!249071 e!315612)))

(declare-fun c!63374 () Bool)

(assert (=> d!82115 (= c!63374 (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b01111111111111111111111111111110))))

(assert (=> d!82115 (= lt!249070 (select (arr!16544 a!3154) lt!248916))))

(assert (=> d!82115 (validMask!0 mask!3216)))

(assert (=> d!82115 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248916 (select (arr!16544 a!3154) j!147) a!3154 mask!3216) lt!249071)))

(declare-fun b!546103 () Bool)

(assert (=> b!546103 (= e!315609 (bvsge (x!51154 lt!249071) #b01111111111111111111111111111110))))

(declare-fun b!546104 () Bool)

(assert (=> b!546104 (and (bvsge (index!22222 lt!249071) #b00000000000000000000000000000000) (bvslt (index!22222 lt!249071) (size!16909 a!3154)))))

(declare-fun res!340010 () Bool)

(assert (=> b!546104 (= res!340010 (= (select (arr!16544 a!3154) (index!22222 lt!249071)) (select (arr!16544 a!3154) j!147)))))

(assert (=> b!546104 (=> res!340010 e!315611)))

(declare-fun e!315610 () Bool)

(assert (=> b!546104 (= e!315610 e!315611)))

(declare-fun b!546105 () Bool)

(assert (=> b!546105 (and (bvsge (index!22222 lt!249071) #b00000000000000000000000000000000) (bvslt (index!22222 lt!249071) (size!16909 a!3154)))))

(declare-fun res!340008 () Bool)

(assert (=> b!546105 (= res!340008 (= (select (arr!16544 a!3154) (index!22222 lt!249071)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!546105 (=> res!340008 e!315611)))

(declare-fun b!546106 () Bool)

(assert (=> b!546106 (= e!315609 e!315610)))

(declare-fun res!340009 () Bool)

(assert (=> b!546106 (= res!340009 (and ((_ is Intermediate!4999) lt!249071) (not (undefined!5811 lt!249071)) (bvslt (x!51154 lt!249071) #b01111111111111111111111111111110) (bvsge (x!51154 lt!249071) #b00000000000000000000000000000000) (bvsge (x!51154 lt!249071) (bvadd #b00000000000000000000000000000001 x!1030))))))

(assert (=> b!546106 (=> (not res!340009) (not e!315610))))

(assert (= (and d!82115 c!63374) b!546100))

(assert (= (and d!82115 (not c!63374)) b!546098))

(assert (= (and b!546098 c!63373) b!546099))

(assert (= (and b!546098 (not c!63373)) b!546102))

(assert (= (and d!82115 c!63375) b!546103))

(assert (= (and d!82115 (not c!63375)) b!546106))

(assert (= (and b!546106 res!340009) b!546104))

(assert (= (and b!546104 (not res!340010)) b!546105))

(assert (= (and b!546105 (not res!340008)) b!546101))

(declare-fun m!523103 () Bool)

(assert (=> d!82115 m!523103))

(assert (=> d!82115 m!522863))

(declare-fun m!523105 () Bool)

(assert (=> b!546101 m!523105))

(assert (=> b!546104 m!523105))

(assert (=> b!546102 m!522993))

(assert (=> b!546102 m!522993))

(assert (=> b!546102 m!522841))

(declare-fun m!523107 () Bool)

(assert (=> b!546102 m!523107))

(assert (=> b!546105 m!523105))

(assert (=> b!545780 d!82115))

(check-sat (not b!545990) (not b!545914) (not d!82115) (not b!545923) (not d!82069) (not b!545873) (not d!82107) (not d!82071) (not d!82091) (not b!545991) (not b!546012) (not d!82053) (not b!546095) (not b!546007) (not bm!32104) (not b!545907) (not bm!32107) (not b!545989) (not d!82073) (not d!82059) (not b!545874) (not b!546102) (not b!545898))
(check-sat)
