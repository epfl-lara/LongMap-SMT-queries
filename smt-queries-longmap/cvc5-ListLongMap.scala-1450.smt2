; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27942 () Bool)

(assert start!27942)

(declare-fun b!286878 () Bool)

(declare-fun res!148941 () Bool)

(declare-fun e!181714 () Bool)

(assert (=> b!286878 (=> (not res!148941) (not e!181714))))

(declare-datatypes ((array!14384 0))(
  ( (array!14385 (arr!6824 (Array (_ BitVec 32) (_ BitVec 64))) (size!7177 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14384)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14384 (_ BitVec 32)) Bool)

(assert (=> b!286878 (= res!148941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286879 () Bool)

(declare-fun res!148944 () Bool)

(declare-fun e!181716 () Bool)

(assert (=> b!286879 (=> (not res!148944) (not e!181716))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286879 (= res!148944 (validKeyInArray!0 k!2524))))

(declare-fun b!286880 () Bool)

(declare-fun res!148943 () Bool)

(assert (=> b!286880 (=> (not res!148943) (not e!181716))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286880 (= res!148943 (and (= (size!7177 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7177 a!3312))))))

(declare-fun b!286881 () Bool)

(assert (=> b!286881 (= e!181716 e!181714)))

(declare-fun res!148945 () Bool)

(assert (=> b!286881 (=> (not res!148945) (not e!181714))))

(declare-datatypes ((SeekEntryResult!1972 0))(
  ( (MissingZero!1972 (index!10058 (_ BitVec 32))) (Found!1972 (index!10059 (_ BitVec 32))) (Intermediate!1972 (undefined!2784 Bool) (index!10060 (_ BitVec 32)) (x!28286 (_ BitVec 32))) (Undefined!1972) (MissingVacant!1972 (index!10061 (_ BitVec 32))) )
))
(declare-fun lt!141156 () SeekEntryResult!1972)

(assert (=> b!286881 (= res!148945 (or (= lt!141156 (MissingZero!1972 i!1256)) (= lt!141156 (MissingVacant!1972 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14384 (_ BitVec 32)) SeekEntryResult!1972)

(assert (=> b!286881 (= lt!141156 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!148942 () Bool)

(assert (=> start!27942 (=> (not res!148942) (not e!181716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27942 (= res!148942 (validMask!0 mask!3809))))

(assert (=> start!27942 e!181716))

(assert (=> start!27942 true))

(declare-fun array_inv!4796 (array!14384) Bool)

(assert (=> start!27942 (array_inv!4796 a!3312)))

(declare-fun b!286882 () Bool)

(assert (=> b!286882 (= e!181714 (and (bvsge mask!3809 #b00000000000000000000000000000000) (bvsgt mask!3809 #b00111111111111111111111111111111)))))

(declare-fun lt!141155 () SeekEntryResult!1972)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14384 (_ BitVec 32)) SeekEntryResult!1972)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286882 (= lt!141155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!286883 () Bool)

(declare-fun res!148940 () Bool)

(assert (=> b!286883 (=> (not res!148940) (not e!181716))))

(declare-fun arrayContainsKey!0 (array!14384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286883 (= res!148940 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27942 res!148942) b!286880))

(assert (= (and b!286880 res!148943) b!286879))

(assert (= (and b!286879 res!148944) b!286883))

(assert (= (and b!286883 res!148940) b!286881))

(assert (= (and b!286881 res!148945) b!286878))

(assert (= (and b!286878 res!148941) b!286882))

(declare-fun m!300979 () Bool)

(assert (=> b!286879 m!300979))

(declare-fun m!300981 () Bool)

(assert (=> b!286883 m!300981))

(declare-fun m!300983 () Bool)

(assert (=> b!286878 m!300983))

(declare-fun m!300985 () Bool)

(assert (=> start!27942 m!300985))

(declare-fun m!300987 () Bool)

(assert (=> start!27942 m!300987))

(declare-fun m!300989 () Bool)

(assert (=> b!286881 m!300989))

(declare-fun m!300991 () Bool)

(assert (=> b!286882 m!300991))

(assert (=> b!286882 m!300991))

(declare-fun m!300993 () Bool)

(assert (=> b!286882 m!300993))

(push 1)

(assert (not start!27942))

(assert (not b!286883))

(assert (not b!286881))

(assert (not b!286878))

(assert (not b!286879))

(assert (not b!286882))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!286920 () Bool)

(declare-fun lt!141171 () SeekEntryResult!1972)

(assert (=> b!286920 (and (bvsge (index!10060 lt!141171) #b00000000000000000000000000000000) (bvslt (index!10060 lt!141171) (size!7177 a!3312)))))

(declare-fun e!181739 () Bool)

(assert (=> b!286920 (= e!181739 (= (select (arr!6824 a!3312) (index!10060 lt!141171)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!286921 () Bool)

(assert (=> b!286921 (and (bvsge (index!10060 lt!141171) #b00000000000000000000000000000000) (bvslt (index!10060 lt!141171) (size!7177 a!3312)))))

(declare-fun res!148954 () Bool)

(assert (=> b!286921 (= res!148954 (= (select (arr!6824 a!3312) (index!10060 lt!141171)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!286921 (=> res!148954 e!181739)))

(declare-fun b!286922 () Bool)

(declare-fun e!181740 () SeekEntryResult!1972)

(assert (=> b!286922 (= e!181740 (Intermediate!1972 false (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(declare-fun b!286924 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286924 (= e!181740 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!286925 () Bool)

(declare-fun e!181736 () Bool)

(declare-fun e!181738 () Bool)

(assert (=> b!286925 (= e!181736 e!181738)))

(declare-fun res!148952 () Bool)

(assert (=> b!286925 (= res!148952 (and (is-Intermediate!1972 lt!141171) (not (undefined!2784 lt!141171)) (bvslt (x!28286 lt!141171) #b01111111111111111111111111111110) (bvsge (x!28286 lt!141171) #b00000000000000000000000000000000) (bvsge (x!28286 lt!141171) #b00000000000000000000000000000000)))))

(assert (=> b!286925 (=> (not res!148952) (not e!181738))))

(declare-fun b!286926 () Bool)

(assert (=> b!286926 (and (bvsge (index!10060 lt!141171) #b00000000000000000000000000000000) (bvslt (index!10060 lt!141171) (size!7177 a!3312)))))

(declare-fun res!148953 () Bool)

(assert (=> b!286926 (= res!148953 (= (select (arr!6824 a!3312) (index!10060 lt!141171)) k!2524))))

(assert (=> b!286926 (=> res!148953 e!181739)))

(assert (=> b!286926 (= e!181738 e!181739)))

(declare-fun b!286927 () Bool)

(assert (=> b!286927 (= e!181736 (bvsge (x!28286 lt!141171) #b01111111111111111111111111111110))))

(declare-fun b!286928 () Bool)

(declare-fun e!181737 () SeekEntryResult!1972)

(assert (=> b!286928 (= e!181737 e!181740)))

(declare-fun c!46542 () Bool)

(declare-fun lt!141170 () (_ BitVec 64))

(assert (=> b!286928 (= c!46542 (or (= lt!141170 k!2524) (= (bvadd lt!141170 lt!141170) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!65895 () Bool)

(assert (=> d!65895 e!181736))

(declare-fun c!46543 () Bool)

(assert (=> d!65895 (= c!46543 (and (is-Intermediate!1972 lt!141171) (undefined!2784 lt!141171)))))

(assert (=> d!65895 (= lt!141171 e!181737)))

(declare-fun c!46541 () Bool)

(assert (=> d!65895 (= c!46541 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!65895 (= lt!141170 (select (arr!6824 a!3312) (toIndex!0 k!2524 mask!3809)))))

(assert (=> d!65895 (validMask!0 mask!3809)))

(assert (=> d!65895 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809) lt!141171)))

(declare-fun b!286923 () Bool)

(assert (=> b!286923 (= e!181737 (Intermediate!1972 true (toIndex!0 k!2524 mask!3809) #b00000000000000000000000000000000))))

(assert (= (and d!65895 c!46541) b!286923))

(assert (= (and d!65895 (not c!46541)) b!286928))

(assert (= (and b!286928 c!46542) b!286922))

(assert (= (and b!286928 (not c!46542)) b!286924))

(assert (= (and d!65895 c!46543) b!286927))

(assert (= (and d!65895 (not c!46543)) b!286925))

(assert (= (and b!286925 res!148952) b!286926))

(assert (= (and b!286926 (not res!148953)) b!286921))

(assert (= (and b!286921 (not res!148954)) b!286920))

(declare-fun m!301005 () Bool)

(assert (=> b!286926 m!301005))

(assert (=> b!286924 m!300991))

(declare-fun m!301007 () Bool)

(assert (=> b!286924 m!301007))

(assert (=> b!286924 m!301007))

(declare-fun m!301009 () Bool)

(assert (=> b!286924 m!301009))

(assert (=> d!65895 m!300991))

(declare-fun m!301011 () Bool)

(assert (=> d!65895 m!301011))

(assert (=> d!65895 m!300985))

(assert (=> b!286921 m!301005))

(assert (=> b!286920 m!301005))

(assert (=> b!286882 d!65895))

(declare-fun d!65903 () Bool)

(declare-fun lt!141186 () (_ BitVec 32))

(declare-fun lt!141185 () (_ BitVec 32))

(assert (=> d!65903 (= lt!141186 (bvmul (bvxor lt!141185 (bvlshr lt!141185 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!65903 (= lt!141185 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!65903 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!148955 (let ((h!5218 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!28288 (bvmul (bvxor h!5218 (bvlshr h!5218 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!28288 (bvlshr x!28288 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!148955 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!148955 #b00000000000000000000000000000000))))))

(assert (=> d!65903 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!141186 (bvlshr lt!141186 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!286882 d!65903))

(declare-fun b!286995 () Bool)

(declare-fun lt!141207 () SeekEntryResult!1972)

(declare-fun e!181782 () SeekEntryResult!1972)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14384 (_ BitVec 32)) SeekEntryResult!1972)

(assert (=> b!286995 (= e!181782 (seekKeyOrZeroReturnVacant!0 (x!28286 lt!141207) (index!10060 lt!141207) (index!10060 lt!141207) k!2524 a!3312 mask!3809))))

(declare-fun b!286996 () Bool)

(declare-fun e!181781 () SeekEntryResult!1972)

(assert (=> b!286996 (= e!181781 (Found!1972 (index!10060 lt!141207)))))

(declare-fun b!286997 () Bool)

(assert (=> b!286997 (= e!181782 (MissingZero!1972 (index!10060 lt!141207)))))

(declare-fun d!65905 () Bool)

(declare-fun lt!141208 () SeekEntryResult!1972)

(assert (=> d!65905 (and (or (is-Undefined!1972 lt!141208) (not (is-Found!1972 lt!141208)) (and (bvsge (index!10059 lt!141208) #b00000000000000000000000000000000) (bvslt (index!10059 lt!141208) (size!7177 a!3312)))) (or (is-Undefined!1972 lt!141208) (is-Found!1972 lt!141208) (not (is-MissingZero!1972 lt!141208)) (and (bvsge (index!10058 lt!141208) #b00000000000000000000000000000000) (bvslt (index!10058 lt!141208) (size!7177 a!3312)))) (or (is-Undefined!1972 lt!141208) (is-Found!1972 lt!141208) (is-MissingZero!1972 lt!141208) (not (is-MissingVacant!1972 lt!141208)) (and (bvsge (index!10061 lt!141208) #b00000000000000000000000000000000) (bvslt (index!10061 lt!141208) (size!7177 a!3312)))) (or (is-Undefined!1972 lt!141208) (ite (is-Found!1972 lt!141208) (= (select (arr!6824 a!3312) (index!10059 lt!141208)) k!2524) (ite (is-MissingZero!1972 lt!141208) (= (select (arr!6824 a!3312) (index!10058 lt!141208)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1972 lt!141208) (= (select (arr!6824 a!3312) (index!10061 lt!141208)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!181783 () SeekEntryResult!1972)

(assert (=> d!65905 (= lt!141208 e!181783)))

(declare-fun c!46570 () Bool)

(assert (=> d!65905 (= c!46570 (and (is-Intermediate!1972 lt!141207) (undefined!2784 lt!141207)))))

(assert (=> d!65905 (= lt!141207 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!65905 (validMask!0 mask!3809)))

(assert (=> d!65905 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!141208)))

(declare-fun b!286998 () Bool)

(assert (=> b!286998 (= e!181783 Undefined!1972)))

(declare-fun b!286999 () Bool)

(assert (=> b!286999 (= e!181783 e!181781)))

(declare-fun lt!141206 () (_ BitVec 64))

(assert (=> b!286999 (= lt!141206 (select (arr!6824 a!3312) (index!10060 lt!141207)))))

(declare-fun c!46569 () Bool)

(assert (=> b!286999 (= c!46569 (= lt!141206 k!2524))))

(declare-fun b!287000 () Bool)

(declare-fun c!46568 () Bool)

(assert (=> b!287000 (= c!46568 (= lt!141206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!287000 (= e!181781 e!181782)))

(assert (= (and d!65905 c!46570) b!286998))

(assert (= (and d!65905 (not c!46570)) b!286999))

(assert (= (and b!286999 c!46569) b!286996))

(assert (= (and b!286999 (not c!46569)) b!287000))

(assert (= (and b!287000 c!46568) b!286997))

(assert (= (and b!287000 (not c!46568)) b!286995))

(declare-fun m!301037 () Bool)

(assert (=> b!286995 m!301037))

(declare-fun m!301039 () Bool)

(assert (=> d!65905 m!301039))

(declare-fun m!301041 () Bool)

(assert (=> d!65905 m!301041))

(assert (=> d!65905 m!300985))

(declare-fun m!301043 () Bool)

(assert (=> d!65905 m!301043))

(assert (=> d!65905 m!300991))

(assert (=> d!65905 m!300991))

(assert (=> d!65905 m!300993))

(declare-fun m!301045 () Bool)

(assert (=> b!286999 m!301045))

(assert (=> b!286881 d!65905))

(declare-fun d!65913 () Bool)

(assert (=> d!65913 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!286879 d!65913))

(declare-fun d!65915 () Bool)

(assert (=> d!65915 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27942 d!65915))

(declare-fun d!65925 () Bool)

(assert (=> d!65925 (= (array_inv!4796 a!3312) (bvsge (size!7177 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27942 d!65925))

(declare-fun d!65927 () Bool)

(declare-fun res!148998 () Bool)

(declare-fun e!181814 () Bool)

(assert (=> d!65927 (=> res!148998 e!181814)))

(assert (=> d!65927 (= res!148998 (= (select (arr!6824 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!65927 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!181814)))

(declare-fun b!287047 () Bool)

(declare-fun e!181815 () Bool)

(assert (=> b!287047 (= e!181814 e!181815)))

(declare-fun res!148999 () Bool)

(assert (=> b!287047 (=> (not res!148999) (not e!181815))))

(assert (=> b!287047 (= res!148999 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7177 a!3312)))))

(declare-fun b!287048 () Bool)

(assert (=> b!287048 (= e!181815 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65927 (not res!148998)) b!287047))

(assert (= (and b!287047 res!148999) b!287048))

(declare-fun m!301067 () Bool)

(assert (=> d!65927 m!301067))

(declare-fun m!301069 () Bool)

(assert (=> b!287048 m!301069))

(assert (=> b!286883 d!65927))

(declare-fun b!287057 () Bool)

(declare-fun e!181824 () Bool)

(declare-fun call!25588 () Bool)

(assert (=> b!287057 (= e!181824 call!25588)))

(declare-fun d!65931 () Bool)

(declare-fun res!149005 () Bool)

(declare-fun e!181823 () Bool)

(assert (=> d!65931 (=> res!149005 e!181823)))

(assert (=> d!65931 (= res!149005 (bvsge #b00000000000000000000000000000000 (size!7177 a!3312)))))

(assert (=> d!65931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181823)))

(declare-fun b!287058 () Bool)

(assert (=> b!287058 (= e!181823 e!181824)))

(declare-fun c!46585 () Bool)

(assert (=> b!287058 (= c!46585 (validKeyInArray!0 (select (arr!6824 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25585 () Bool)

(assert (=> bm!25585 (= call!25588 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!287059 () Bool)

(declare-fun e!181822 () Bool)

(assert (=> b!287059 (= e!181824 e!181822)))

(declare-fun lt!141237 () (_ BitVec 64))

(assert (=> b!287059 (= lt!141237 (select (arr!6824 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9014 0))(
  ( (Unit!9015) )
))
(declare-fun lt!141235 () Unit!9014)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14384 (_ BitVec 64) (_ BitVec 32)) Unit!9014)

(assert (=> b!287059 (= lt!141235 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141237 #b00000000000000000000000000000000))))

(assert (=> b!287059 (arrayContainsKey!0 a!3312 lt!141237 #b00000000000000000000000000000000)))

(declare-fun lt!141236 () Unit!9014)

(assert (=> b!287059 (= lt!141236 lt!141235)))

(declare-fun res!149004 () Bool)

(assert (=> b!287059 (= res!149004 (= (seekEntryOrOpen!0 (select (arr!6824 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1972 #b00000000000000000000000000000000)))))

(assert (=> b!287059 (=> (not res!149004) (not e!181822))))

(declare-fun b!287060 () Bool)

(assert (=> b!287060 (= e!181822 call!25588)))

(assert (= (and d!65931 (not res!149005)) b!287058))

(assert (= (and b!287058 c!46585) b!287059))

(assert (= (and b!287058 (not c!46585)) b!287057))

(assert (= (and b!287059 res!149004) b!287060))

(assert (= (or b!287060 b!287057) bm!25585))

(assert (=> b!287058 m!301067))

(assert (=> b!287058 m!301067))

(declare-fun m!301071 () Bool)

(assert (=> b!287058 m!301071))

(declare-fun m!301073 () Bool)

(assert (=> bm!25585 m!301073))

(assert (=> b!287059 m!301067))

(declare-fun m!301075 () Bool)

(assert (=> b!287059 m!301075))

(declare-fun m!301077 () Bool)

(assert (=> b!287059 m!301077))

(assert (=> b!287059 m!301067))

(declare-fun m!301079 () Bool)

(assert (=> b!287059 m!301079))

(assert (=> b!286878 d!65931))

(push 1)

(assert (not d!65905))

(assert (not b!286995))

(assert (not b!286924))

(assert (not bm!25585))

(assert (not d!65895))

(assert (not b!287059))

(assert (not b!287058))

(assert (not b!287048))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

