; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28966 () Bool)

(assert start!28966)

(declare-fun b!294654 () Bool)

(declare-fun res!154886 () Bool)

(declare-fun e!186264 () Bool)

(assert (=> b!294654 (=> (not res!154886) (not e!186264))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!294654 (= res!154886 (validKeyInArray!0 k!2524))))

(declare-fun b!294655 () Bool)

(declare-fun res!154885 () Bool)

(assert (=> b!294655 (=> (not res!154885) (not e!186264))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14904 0))(
  ( (array!14905 (arr!7067 (Array (_ BitVec 32) (_ BitVec 64))) (size!7419 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14904)

(assert (=> b!294655 (= res!154885 (and (= (size!7419 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7419 a!3312))))))

(declare-fun res!154889 () Bool)

(assert (=> start!28966 (=> (not res!154889) (not e!186264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28966 (= res!154889 (validMask!0 mask!3809))))

(assert (=> start!28966 e!186264))

(assert (=> start!28966 true))

(declare-fun array_inv!5030 (array!14904) Bool)

(assert (=> start!28966 (array_inv!5030 a!3312)))

(declare-fun b!294656 () Bool)

(declare-fun res!154887 () Bool)

(declare-fun e!186263 () Bool)

(assert (=> b!294656 (=> (not res!154887) (not e!186263))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14904 (_ BitVec 32)) Bool)

(assert (=> b!294656 (= res!154887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!294657 () Bool)

(assert (=> b!294657 (= e!186264 e!186263)))

(declare-fun res!154890 () Bool)

(assert (=> b!294657 (=> (not res!154890) (not e!186263))))

(declare-fun lt!146067 () Bool)

(declare-datatypes ((SeekEntryResult!2216 0))(
  ( (MissingZero!2216 (index!11034 (_ BitVec 32))) (Found!2216 (index!11035 (_ BitVec 32))) (Intermediate!2216 (undefined!3028 Bool) (index!11036 (_ BitVec 32)) (x!29242 (_ BitVec 32))) (Undefined!2216) (MissingVacant!2216 (index!11037 (_ BitVec 32))) )
))
(declare-fun lt!146069 () SeekEntryResult!2216)

(assert (=> b!294657 (= res!154890 (or lt!146067 (= lt!146069 (MissingVacant!2216 i!1256))))))

(assert (=> b!294657 (= lt!146067 (= lt!146069 (MissingZero!2216 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14904 (_ BitVec 32)) SeekEntryResult!2216)

(assert (=> b!294657 (= lt!146069 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun lt!146066 () SeekEntryResult!2216)

(declare-fun b!294658 () Bool)

(assert (=> b!294658 (= e!186263 (and lt!146067 (let ((bdg!6241 (not (is-Intermediate!2216 lt!146066)))) (and (or bdg!6241 (not (undefined!3028 lt!146066))) (or bdg!6241 (not (= (select (arr!7067 a!3312) (index!11036 lt!146066)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6241 (not (= (select (arr!7067 a!3312) (index!11036 lt!146066)) k!2524))) (not bdg!6241) (or (bvslt (index!11036 lt!146066) #b00000000000000000000000000000000) (bvsge (index!11036 lt!146066) (size!7419 a!3312)))))))))

(declare-fun lt!146070 () (_ BitVec 32))

(declare-fun lt!146068 () SeekEntryResult!2216)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14904 (_ BitVec 32)) SeekEntryResult!2216)

(assert (=> b!294658 (= lt!146068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146070 k!2524 (array!14905 (store (arr!7067 a!3312) i!1256 k!2524) (size!7419 a!3312)) mask!3809))))

(assert (=> b!294658 (= lt!146066 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146070 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294658 (= lt!146070 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!294659 () Bool)

(declare-fun res!154888 () Bool)

(assert (=> b!294659 (=> (not res!154888) (not e!186264))))

(declare-fun arrayContainsKey!0 (array!14904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!294659 (= res!154888 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28966 res!154889) b!294655))

(assert (= (and b!294655 res!154885) b!294654))

(assert (= (and b!294654 res!154886) b!294659))

(assert (= (and b!294659 res!154888) b!294657))

(assert (= (and b!294657 res!154890) b!294656))

(assert (= (and b!294656 res!154887) b!294658))

(declare-fun m!308031 () Bool)

(assert (=> b!294658 m!308031))

(declare-fun m!308033 () Bool)

(assert (=> b!294658 m!308033))

(declare-fun m!308035 () Bool)

(assert (=> b!294658 m!308035))

(declare-fun m!308037 () Bool)

(assert (=> b!294658 m!308037))

(declare-fun m!308039 () Bool)

(assert (=> b!294658 m!308039))

(declare-fun m!308041 () Bool)

(assert (=> b!294657 m!308041))

(declare-fun m!308043 () Bool)

(assert (=> start!28966 m!308043))

(declare-fun m!308045 () Bool)

(assert (=> start!28966 m!308045))

(declare-fun m!308047 () Bool)

(assert (=> b!294659 m!308047))

(declare-fun m!308049 () Bool)

(assert (=> b!294654 m!308049))

(declare-fun m!308051 () Bool)

(assert (=> b!294656 m!308051))

(push 1)

(assert (not b!294654))

(assert (not b!294656))

(assert (not b!294658))

(assert (not b!294657))

(assert (not start!28966))

(assert (not b!294659))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!25710 () Bool)

(declare-fun call!25713 () Bool)

(assert (=> bm!25710 (= call!25713 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!294736 () Bool)

(declare-fun e!186313 () Bool)

(assert (=> b!294736 (= e!186313 call!25713)))

(declare-fun b!294737 () Bool)

(declare-fun e!186311 () Bool)

(assert (=> b!294737 (= e!186311 e!186313)))

(declare-fun lt!146124 () (_ BitVec 64))

(assert (=> b!294737 (= lt!146124 (select (arr!7067 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9208 0))(
  ( (Unit!9209) )
))
(declare-fun lt!146122 () Unit!9208)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14904 (_ BitVec 64) (_ BitVec 32)) Unit!9208)

(assert (=> b!294737 (= lt!146122 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!146124 #b00000000000000000000000000000000))))

(assert (=> b!294737 (arrayContainsKey!0 a!3312 lt!146124 #b00000000000000000000000000000000)))

(declare-fun lt!146123 () Unit!9208)

(assert (=> b!294737 (= lt!146123 lt!146122)))

(declare-fun res!154942 () Bool)

(assert (=> b!294737 (= res!154942 (= (seekEntryOrOpen!0 (select (arr!7067 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2216 #b00000000000000000000000000000000)))))

(assert (=> b!294737 (=> (not res!154942) (not e!186313))))

(declare-fun d!66859 () Bool)

(declare-fun res!154941 () Bool)

(declare-fun e!186312 () Bool)

(assert (=> d!66859 (=> res!154941 e!186312)))

(assert (=> d!66859 (= res!154941 (bvsge #b00000000000000000000000000000000 (size!7419 a!3312)))))

(assert (=> d!66859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!186312)))

(declare-fun b!294738 () Bool)

(assert (=> b!294738 (= e!186311 call!25713)))

(declare-fun b!294739 () Bool)

(assert (=> b!294739 (= e!186312 e!186311)))

(declare-fun c!47471 () Bool)

(assert (=> b!294739 (= c!47471 (validKeyInArray!0 (select (arr!7067 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!66859 (not res!154941)) b!294739))

(assert (= (and b!294739 c!47471) b!294737))

(assert (= (and b!294739 (not c!47471)) b!294738))

(assert (= (and b!294737 res!154942) b!294736))

(assert (= (or b!294736 b!294738) bm!25710))

(declare-fun m!308113 () Bool)

(assert (=> bm!25710 m!308113))

(declare-fun m!308115 () Bool)

(assert (=> b!294737 m!308115))

(declare-fun m!308117 () Bool)

(assert (=> b!294737 m!308117))

(declare-fun m!308119 () Bool)

(assert (=> b!294737 m!308119))

(assert (=> b!294737 m!308115))

(declare-fun m!308121 () Bool)

(assert (=> b!294737 m!308121))

(assert (=> b!294739 m!308115))

(assert (=> b!294739 m!308115))

(declare-fun m!308123 () Bool)

(assert (=> b!294739 m!308123))

(assert (=> b!294656 d!66859))

(declare-fun d!66863 () Bool)

(assert (=> d!66863 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!294654 d!66863))

(declare-fun b!294818 () Bool)

(declare-fun e!186362 () SeekEntryResult!2216)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!294818 (= e!186362 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146070 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14905 (store (arr!7067 a!3312) i!1256 k!2524) (size!7419 a!3312)) mask!3809))))

(declare-fun b!294819 () Bool)

(declare-fun lt!146158 () SeekEntryResult!2216)

(assert (=> b!294819 (and (bvsge (index!11036 lt!146158) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146158) (size!7419 (array!14905 (store (arr!7067 a!3312) i!1256 k!2524) (size!7419 a!3312)))))))

(declare-fun res!154968 () Bool)

(assert (=> b!294819 (= res!154968 (= (select (arr!7067 (array!14905 (store (arr!7067 a!3312) i!1256 k!2524) (size!7419 a!3312))) (index!11036 lt!146158)) k!2524))))

(declare-fun e!186359 () Bool)

(assert (=> b!294819 (=> res!154968 e!186359)))

(declare-fun e!186363 () Bool)

(assert (=> b!294819 (= e!186363 e!186359)))

(declare-fun b!294820 () Bool)

(declare-fun e!186361 () SeekEntryResult!2216)

(assert (=> b!294820 (= e!186361 e!186362)))

(declare-fun c!47499 () Bool)

(declare-fun lt!146159 () (_ BitVec 64))

(assert (=> b!294820 (= c!47499 (or (= lt!146159 k!2524) (= (bvadd lt!146159 lt!146159) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294821 () Bool)

(declare-fun e!186360 () Bool)

(assert (=> b!294821 (= e!186360 e!186363)))

(declare-fun res!154969 () Bool)

(assert (=> b!294821 (= res!154969 (and (is-Intermediate!2216 lt!146158) (not (undefined!3028 lt!146158)) (bvslt (x!29242 lt!146158) #b01111111111111111111111111111110) (bvsge (x!29242 lt!146158) #b00000000000000000000000000000000) (bvsge (x!29242 lt!146158) #b00000000000000000000000000000000)))))

(assert (=> b!294821 (=> (not res!154969) (not e!186363))))

(declare-fun b!294822 () Bool)

(assert (=> b!294822 (= e!186361 (Intermediate!2216 true lt!146070 #b00000000000000000000000000000000))))

(declare-fun b!294823 () Bool)

(assert (=> b!294823 (and (bvsge (index!11036 lt!146158) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146158) (size!7419 (array!14905 (store (arr!7067 a!3312) i!1256 k!2524) (size!7419 a!3312)))))))

(assert (=> b!294823 (= e!186359 (= (select (arr!7067 (array!14905 (store (arr!7067 a!3312) i!1256 k!2524) (size!7419 a!3312))) (index!11036 lt!146158)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294824 () Bool)

(assert (=> b!294824 (and (bvsge (index!11036 lt!146158) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146158) (size!7419 (array!14905 (store (arr!7067 a!3312) i!1256 k!2524) (size!7419 a!3312)))))))

(declare-fun res!154970 () Bool)

(assert (=> b!294824 (= res!154970 (= (select (arr!7067 (array!14905 (store (arr!7067 a!3312) i!1256 k!2524) (size!7419 a!3312))) (index!11036 lt!146158)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294824 (=> res!154970 e!186359)))

(declare-fun d!66865 () Bool)

(assert (=> d!66865 e!186360))

(declare-fun c!47501 () Bool)

(assert (=> d!66865 (= c!47501 (and (is-Intermediate!2216 lt!146158) (undefined!3028 lt!146158)))))

(assert (=> d!66865 (= lt!146158 e!186361)))

(declare-fun c!47500 () Bool)

(assert (=> d!66865 (= c!47500 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66865 (= lt!146159 (select (arr!7067 (array!14905 (store (arr!7067 a!3312) i!1256 k!2524) (size!7419 a!3312))) lt!146070))))

(assert (=> d!66865 (validMask!0 mask!3809)))

(assert (=> d!66865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146070 k!2524 (array!14905 (store (arr!7067 a!3312) i!1256 k!2524) (size!7419 a!3312)) mask!3809) lt!146158)))

(declare-fun b!294825 () Bool)

(assert (=> b!294825 (= e!186360 (bvsge (x!29242 lt!146158) #b01111111111111111111111111111110))))

(declare-fun b!294826 () Bool)

(assert (=> b!294826 (= e!186362 (Intermediate!2216 false lt!146070 #b00000000000000000000000000000000))))

(assert (= (and d!66865 c!47500) b!294822))

(assert (= (and d!66865 (not c!47500)) b!294820))

(assert (= (and b!294820 c!47499) b!294826))

(assert (= (and b!294820 (not c!47499)) b!294818))

(assert (= (and d!66865 c!47501) b!294825))

(assert (= (and d!66865 (not c!47501)) b!294821))

(assert (= (and b!294821 res!154969) b!294819))

(assert (= (and b!294819 (not res!154968)) b!294824))

(assert (= (and b!294824 (not res!154970)) b!294823))

(declare-fun m!308149 () Bool)

(assert (=> b!294823 m!308149))

(assert (=> b!294824 m!308149))

(declare-fun m!308151 () Bool)

(assert (=> b!294818 m!308151))

(assert (=> b!294818 m!308151))

(declare-fun m!308153 () Bool)

(assert (=> b!294818 m!308153))

(assert (=> b!294819 m!308149))

(declare-fun m!308155 () Bool)

(assert (=> d!66865 m!308155))

(assert (=> d!66865 m!308043))

(assert (=> b!294658 d!66865))

(declare-fun b!294833 () Bool)

(declare-fun e!186370 () SeekEntryResult!2216)

(assert (=> b!294833 (= e!186370 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!146070 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!294834 () Bool)

(declare-fun lt!146163 () SeekEntryResult!2216)

(assert (=> b!294834 (and (bvsge (index!11036 lt!146163) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146163) (size!7419 a!3312)))))

(declare-fun res!154971 () Bool)

(assert (=> b!294834 (= res!154971 (= (select (arr!7067 a!3312) (index!11036 lt!146163)) k!2524))))

(declare-fun e!186367 () Bool)

(assert (=> b!294834 (=> res!154971 e!186367)))

(declare-fun e!186371 () Bool)

(assert (=> b!294834 (= e!186371 e!186367)))

(declare-fun b!294835 () Bool)

(declare-fun e!186369 () SeekEntryResult!2216)

(assert (=> b!294835 (= e!186369 e!186370)))

(declare-fun c!47505 () Bool)

(declare-fun lt!146164 () (_ BitVec 64))

(assert (=> b!294835 (= c!47505 (or (= lt!146164 k!2524) (= (bvadd lt!146164 lt!146164) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!294836 () Bool)

(declare-fun e!186368 () Bool)

(assert (=> b!294836 (= e!186368 e!186371)))

(declare-fun res!154972 () Bool)

(assert (=> b!294836 (= res!154972 (and (is-Intermediate!2216 lt!146163) (not (undefined!3028 lt!146163)) (bvslt (x!29242 lt!146163) #b01111111111111111111111111111110) (bvsge (x!29242 lt!146163) #b00000000000000000000000000000000) (bvsge (x!29242 lt!146163) #b00000000000000000000000000000000)))))

(assert (=> b!294836 (=> (not res!154972) (not e!186371))))

(declare-fun b!294837 () Bool)

(assert (=> b!294837 (= e!186369 (Intermediate!2216 true lt!146070 #b00000000000000000000000000000000))))

(declare-fun b!294838 () Bool)

(assert (=> b!294838 (and (bvsge (index!11036 lt!146163) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146163) (size!7419 a!3312)))))

(assert (=> b!294838 (= e!186367 (= (select (arr!7067 a!3312) (index!11036 lt!146163)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!294839 () Bool)

(assert (=> b!294839 (and (bvsge (index!11036 lt!146163) #b00000000000000000000000000000000) (bvslt (index!11036 lt!146163) (size!7419 a!3312)))))

(declare-fun res!154973 () Bool)

(assert (=> b!294839 (= res!154973 (= (select (arr!7067 a!3312) (index!11036 lt!146163)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294839 (=> res!154973 e!186367)))

(declare-fun d!66877 () Bool)

(assert (=> d!66877 e!186368))

(declare-fun c!47507 () Bool)

(assert (=> d!66877 (= c!47507 (and (is-Intermediate!2216 lt!146163) (undefined!3028 lt!146163)))))

(assert (=> d!66877 (= lt!146163 e!186369)))

(declare-fun c!47506 () Bool)

(assert (=> d!66877 (= c!47506 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66877 (= lt!146164 (select (arr!7067 a!3312) lt!146070))))

(assert (=> d!66877 (validMask!0 mask!3809)))

(assert (=> d!66877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146070 k!2524 a!3312 mask!3809) lt!146163)))

(declare-fun b!294840 () Bool)

(assert (=> b!294840 (= e!186368 (bvsge (x!29242 lt!146163) #b01111111111111111111111111111110))))

(declare-fun b!294841 () Bool)

(assert (=> b!294841 (= e!186370 (Intermediate!2216 false lt!146070 #b00000000000000000000000000000000))))

(assert (= (and d!66877 c!47506) b!294837))

(assert (= (and d!66877 (not c!47506)) b!294835))

(assert (= (and b!294835 c!47505) b!294841))

(assert (= (and b!294835 (not c!47505)) b!294833))

(assert (= (and d!66877 c!47507) b!294840))

(assert (= (and d!66877 (not c!47507)) b!294836))

(assert (= (and b!294836 res!154972) b!294834))

(assert (= (and b!294834 (not res!154971)) b!294839))

(assert (= (and b!294839 (not res!154973)) b!294838))

(declare-fun m!308169 () Bool)

(assert (=> b!294838 m!308169))

(assert (=> b!294839 m!308169))

(assert (=> b!294833 m!308151))

(assert (=> b!294833 m!308151))

(declare-fun m!308171 () Bool)

(assert (=> b!294833 m!308171))

(assert (=> b!294834 m!308169))

(declare-fun m!308173 () Bool)

(assert (=> d!66877 m!308173))

(assert (=> d!66877 m!308043))

(assert (=> b!294658 d!66877))

(declare-fun d!66881 () Bool)

(declare-fun lt!146173 () (_ BitVec 32))

(declare-fun lt!146172 () (_ BitVec 32))

(assert (=> d!66881 (= lt!146173 (bvmul (bvxor lt!146172 (bvlshr lt!146172 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66881 (= lt!146172 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66881 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!154974 (let ((h!5284 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29248 (bvmul (bvxor h!5284 (bvlshr h!5284 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29248 (bvlshr x!29248 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!154974 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!154974 #b00000000000000000000000000000000))))))

(assert (=> d!66881 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!146173 (bvlshr lt!146173 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!294658 d!66881))

(declare-fun d!66887 () Bool)

(declare-fun res!154987 () Bool)

(declare-fun e!186385 () Bool)

(assert (=> d!66887 (=> res!154987 e!186385)))

(assert (=> d!66887 (= res!154987 (= (select (arr!7067 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!66887 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!186385)))

(declare-fun b!294856 () Bool)

(declare-fun e!186386 () Bool)

(assert (=> b!294856 (= e!186385 e!186386)))

(declare-fun res!154988 () Bool)

(assert (=> b!294856 (=> (not res!154988) (not e!186386))))

(assert (=> b!294856 (= res!154988 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7419 a!3312)))))

(declare-fun b!294857 () Bool)

(assert (=> b!294857 (= e!186386 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66887 (not res!154987)) b!294856))

(assert (= (and b!294856 res!154988) b!294857))

(assert (=> d!66887 m!308115))

(declare-fun m!308189 () Bool)

(assert (=> b!294857 m!308189))

(assert (=> b!294659 d!66887))

(declare-fun lt!146196 () SeekEntryResult!2216)

(declare-fun e!186413 () SeekEntryResult!2216)

(declare-fun b!294906 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14904 (_ BitVec 32)) SeekEntryResult!2216)

(assert (=> b!294906 (= e!186413 (seekKeyOrZeroReturnVacant!0 (x!29242 lt!146196) (index!11036 lt!146196) (index!11036 lt!146196) k!2524 a!3312 mask!3809))))

(declare-fun b!294907 () Bool)

(declare-fun e!186415 () SeekEntryResult!2216)

(assert (=> b!294907 (= e!186415 Undefined!2216)))

(declare-fun d!66889 () Bool)

(declare-fun lt!146195 () SeekEntryResult!2216)

(assert (=> d!66889 (and (or (is-Undefined!2216 lt!146195) (not (is-Found!2216 lt!146195)) (and (bvsge (index!11035 lt!146195) #b00000000000000000000000000000000) (bvslt (index!11035 lt!146195) (size!7419 a!3312)))) (or (is-Undefined!2216 lt!146195) (is-Found!2216 lt!146195) (not (is-MissingZero!2216 lt!146195)) (and (bvsge (index!11034 lt!146195) #b00000000000000000000000000000000) (bvslt (index!11034 lt!146195) (size!7419 a!3312)))) (or (is-Undefined!2216 lt!146195) (is-Found!2216 lt!146195) (is-MissingZero!2216 lt!146195) (not (is-MissingVacant!2216 lt!146195)) (and (bvsge (index!11037 lt!146195) #b00000000000000000000000000000000) (bvslt (index!11037 lt!146195) (size!7419 a!3312)))) (or (is-Undefined!2216 lt!146195) (ite (is-Found!2216 lt!146195) (= (select (arr!7067 a!3312) (index!11035 lt!146195)) k!2524) (ite (is-MissingZero!2216 lt!146195) (= (select (arr!7067 a!3312) (index!11034 lt!146195)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2216 lt!146195) (= (select (arr!7067 a!3312) (index!11037 lt!146195)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66889 (= lt!146195 e!186415)))

(declare-fun c!47529 () Bool)

(assert (=> d!66889 (= c!47529 (and (is-Intermediate!2216 lt!146196) (undefined!3028 lt!146196)))))

(assert (=> d!66889 (= lt!146196 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!66889 (validMask!0 mask!3809)))

(assert (=> d!66889 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!146195)))

(declare-fun b!294908 () Bool)

(declare-fun e!186414 () SeekEntryResult!2216)

(assert (=> b!294908 (= e!186415 e!186414)))

(declare-fun lt!146194 () (_ BitVec 64))

(assert (=> b!294908 (= lt!146194 (select (arr!7067 a!3312) (index!11036 lt!146196)))))

(declare-fun c!47527 () Bool)

(assert (=> b!294908 (= c!47527 (= lt!146194 k!2524))))

(declare-fun b!294909 () Bool)

(declare-fun c!47528 () Bool)

(assert (=> b!294909 (= c!47528 (= lt!146194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!294909 (= e!186414 e!186413)))

(declare-fun b!294910 () Bool)

(assert (=> b!294910 (= e!186413 (MissingZero!2216 (index!11036 lt!146196)))))

(declare-fun b!294911 () Bool)

(assert (=> b!294911 (= e!186414 (Found!2216 (index!11036 lt!146196)))))

(assert (= (and d!66889 c!47529) b!294907))

(assert (= (and d!66889 (not c!47529)) b!294908))

(assert (= (and b!294908 c!47527) b!294911))

(assert (= (and b!294908 (not c!47527)) b!294909))

(assert (= (and b!294909 c!47528) b!294910))

(assert (= (and b!294909 (not c!47528)) b!294906))

(declare-fun m!308205 () Bool)

(assert (=> b!294906 m!308205))

(assert (=> d!66889 m!308043))

(declare-fun m!308207 () Bool)

(assert (=> d!66889 m!308207))

(declare-fun m!308209 () Bool)

(assert (=> d!66889 m!308209))

(assert (=> d!66889 m!308039))

(assert (=> d!66889 m!308039))

(declare-fun m!308211 () Bool)

(assert (=> d!66889 m!308211))

(declare-fun m!308213 () Bool)

(assert (=> d!66889 m!308213))

(declare-fun m!308215 () Bool)

(assert (=> b!294908 m!308215))

(assert (=> b!294657 d!66889))

(declare-fun d!66899 () Bool)

(assert (=> d!66899 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!28966 d!66899))

(declare-fun d!66903 () Bool)

(assert (=> d!66903 (= (array_inv!5030 a!3312) (bvsge (size!7419 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!28966 d!66903))

(push 1)

(assert (not b!294906))

(assert (not b!294818))

(assert (not b!294833))

(assert (not b!294737))

(assert (not b!294739))

(assert (not d!66889))

(assert (not d!66865))

(assert (not bm!25710))

(assert (not b!294857))

(assert (not d!66877))

(check-sat)

(pop 1)

(push 1)

(check-sat)

