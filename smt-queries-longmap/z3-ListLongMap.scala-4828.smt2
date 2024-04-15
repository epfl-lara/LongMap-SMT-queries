; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66288 () Bool)

(assert start!66288)

(declare-fun b!764159 () Bool)

(declare-fun res!517141 () Bool)

(declare-fun e!425582 () Bool)

(assert (=> b!764159 (=> (not res!517141) (not e!425582))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42210 0))(
  ( (array!42211 (arr!20213 (Array (_ BitVec 32) (_ BitVec 64))) (size!20634 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42210)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764159 (= res!517141 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20634 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20634 a!3186))))))

(declare-fun b!764160 () Bool)

(declare-fun e!425581 () Bool)

(assert (=> b!764160 (= e!425582 e!425581)))

(declare-fun res!517142 () Bool)

(assert (=> b!764160 (=> (not res!517142) (not e!425581))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7810 0))(
  ( (MissingZero!7810 (index!33608 (_ BitVec 32))) (Found!7810 (index!33609 (_ BitVec 32))) (Intermediate!7810 (undefined!8622 Bool) (index!33610 (_ BitVec 32)) (x!64513 (_ BitVec 32))) (Undefined!7810) (MissingVacant!7810 (index!33611 (_ BitVec 32))) )
))
(declare-fun lt!339908 () SeekEntryResult!7810)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42210 (_ BitVec 32)) SeekEntryResult!7810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764160 (= res!517142 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20213 a!3186) j!159) mask!3328) (select (arr!20213 a!3186) j!159) a!3186 mask!3328) lt!339908))))

(assert (=> b!764160 (= lt!339908 (Intermediate!7810 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764162 () Bool)

(declare-fun res!517146 () Bool)

(assert (=> b!764162 (=> (not res!517146) (not e!425581))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764162 (= res!517146 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20213 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!425580 () Bool)

(declare-fun b!764163 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42210 (_ BitVec 32)) SeekEntryResult!7810)

(assert (=> b!764163 (= e!425580 (not (= (seekEntryOrOpen!0 (select (arr!20213 a!3186) j!159) a!3186 mask!3328) (Found!7810 j!159))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42210 (_ BitVec 32)) Bool)

(assert (=> b!764163 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26318 0))(
  ( (Unit!26319) )
))
(declare-fun lt!339909 () Unit!26318)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26318)

(assert (=> b!764163 (= lt!339909 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!764164 () Bool)

(declare-fun e!425585 () Bool)

(assert (=> b!764164 (= e!425585 e!425582)))

(declare-fun res!517139 () Bool)

(assert (=> b!764164 (=> (not res!517139) (not e!425582))))

(declare-fun lt!339911 () SeekEntryResult!7810)

(assert (=> b!764164 (= res!517139 (or (= lt!339911 (MissingZero!7810 i!1173)) (= lt!339911 (MissingVacant!7810 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!764164 (= lt!339911 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!764165 () Bool)

(declare-fun e!425583 () Bool)

(assert (=> b!764165 (= e!425583 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20213 a!3186) j!159) a!3186 mask!3328) lt!339908))))

(declare-fun b!764166 () Bool)

(declare-fun res!517144 () Bool)

(assert (=> b!764166 (=> (not res!517144) (not e!425582))))

(declare-datatypes ((List!14254 0))(
  ( (Nil!14251) (Cons!14250 (h!15334 (_ BitVec 64)) (t!20560 List!14254)) )
))
(declare-fun arrayNoDuplicates!0 (array!42210 (_ BitVec 32) List!14254) Bool)

(assert (=> b!764166 (= res!517144 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14251))))

(declare-fun b!764167 () Bool)

(declare-fun res!517143 () Bool)

(assert (=> b!764167 (=> (not res!517143) (not e!425581))))

(assert (=> b!764167 (= res!517143 e!425583)))

(declare-fun c!83898 () Bool)

(assert (=> b!764167 (= c!83898 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764168 () Bool)

(declare-fun res!517145 () Bool)

(assert (=> b!764168 (=> (not res!517145) (not e!425585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764168 (= res!517145 (validKeyInArray!0 k0!2102))))

(declare-fun b!764169 () Bool)

(declare-fun res!517147 () Bool)

(assert (=> b!764169 (=> (not res!517147) (not e!425582))))

(assert (=> b!764169 (= res!517147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!517137 () Bool)

(assert (=> start!66288 (=> (not res!517137) (not e!425585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66288 (= res!517137 (validMask!0 mask!3328))))

(assert (=> start!66288 e!425585))

(assert (=> start!66288 true))

(declare-fun array_inv!16096 (array!42210) Bool)

(assert (=> start!66288 (array_inv!16096 a!3186)))

(declare-fun b!764161 () Bool)

(assert (=> b!764161 (= e!425581 e!425580)))

(declare-fun res!517148 () Bool)

(assert (=> b!764161 (=> (not res!517148) (not e!425580))))

(declare-fun lt!339910 () array!42210)

(declare-fun lt!339907 () (_ BitVec 64))

(assert (=> b!764161 (= res!517148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339907 mask!3328) lt!339907 lt!339910 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339907 lt!339910 mask!3328)))))

(assert (=> b!764161 (= lt!339907 (select (store (arr!20213 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764161 (= lt!339910 (array!42211 (store (arr!20213 a!3186) i!1173 k0!2102) (size!20634 a!3186)))))

(declare-fun b!764170 () Bool)

(declare-fun res!517140 () Bool)

(assert (=> b!764170 (=> (not res!517140) (not e!425585))))

(assert (=> b!764170 (= res!517140 (validKeyInArray!0 (select (arr!20213 a!3186) j!159)))))

(declare-fun b!764171 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42210 (_ BitVec 32)) SeekEntryResult!7810)

(assert (=> b!764171 (= e!425583 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20213 a!3186) j!159) a!3186 mask!3328) (Found!7810 j!159)))))

(declare-fun b!764172 () Bool)

(declare-fun res!517138 () Bool)

(assert (=> b!764172 (=> (not res!517138) (not e!425585))))

(assert (=> b!764172 (= res!517138 (and (= (size!20634 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20634 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20634 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764173 () Bool)

(declare-fun res!517136 () Bool)

(assert (=> b!764173 (=> (not res!517136) (not e!425585))))

(declare-fun arrayContainsKey!0 (array!42210 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764173 (= res!517136 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!66288 res!517137) b!764172))

(assert (= (and b!764172 res!517138) b!764170))

(assert (= (and b!764170 res!517140) b!764168))

(assert (= (and b!764168 res!517145) b!764173))

(assert (= (and b!764173 res!517136) b!764164))

(assert (= (and b!764164 res!517139) b!764169))

(assert (= (and b!764169 res!517147) b!764166))

(assert (= (and b!764166 res!517144) b!764159))

(assert (= (and b!764159 res!517141) b!764160))

(assert (= (and b!764160 res!517142) b!764162))

(assert (= (and b!764162 res!517146) b!764167))

(assert (= (and b!764167 c!83898) b!764165))

(assert (= (and b!764167 (not c!83898)) b!764171))

(assert (= (and b!764167 res!517143) b!764161))

(assert (= (and b!764161 res!517148) b!764163))

(declare-fun m!710023 () Bool)

(assert (=> b!764165 m!710023))

(assert (=> b!764165 m!710023))

(declare-fun m!710025 () Bool)

(assert (=> b!764165 m!710025))

(declare-fun m!710027 () Bool)

(assert (=> b!764168 m!710027))

(declare-fun m!710029 () Bool)

(assert (=> b!764162 m!710029))

(declare-fun m!710031 () Bool)

(assert (=> b!764164 m!710031))

(assert (=> b!764171 m!710023))

(assert (=> b!764171 m!710023))

(declare-fun m!710033 () Bool)

(assert (=> b!764171 m!710033))

(declare-fun m!710035 () Bool)

(assert (=> start!66288 m!710035))

(declare-fun m!710037 () Bool)

(assert (=> start!66288 m!710037))

(declare-fun m!710039 () Bool)

(assert (=> b!764173 m!710039))

(declare-fun m!710041 () Bool)

(assert (=> b!764161 m!710041))

(declare-fun m!710043 () Bool)

(assert (=> b!764161 m!710043))

(declare-fun m!710045 () Bool)

(assert (=> b!764161 m!710045))

(declare-fun m!710047 () Bool)

(assert (=> b!764161 m!710047))

(declare-fun m!710049 () Bool)

(assert (=> b!764161 m!710049))

(assert (=> b!764161 m!710041))

(assert (=> b!764163 m!710023))

(assert (=> b!764163 m!710023))

(declare-fun m!710051 () Bool)

(assert (=> b!764163 m!710051))

(declare-fun m!710053 () Bool)

(assert (=> b!764163 m!710053))

(declare-fun m!710055 () Bool)

(assert (=> b!764163 m!710055))

(declare-fun m!710057 () Bool)

(assert (=> b!764166 m!710057))

(assert (=> b!764170 m!710023))

(assert (=> b!764170 m!710023))

(declare-fun m!710059 () Bool)

(assert (=> b!764170 m!710059))

(assert (=> b!764160 m!710023))

(assert (=> b!764160 m!710023))

(declare-fun m!710061 () Bool)

(assert (=> b!764160 m!710061))

(assert (=> b!764160 m!710061))

(assert (=> b!764160 m!710023))

(declare-fun m!710063 () Bool)

(assert (=> b!764160 m!710063))

(declare-fun m!710065 () Bool)

(assert (=> b!764169 m!710065))

(check-sat (not b!764169) (not b!764168) (not b!764173) (not b!764166) (not b!764163) (not b!764170) (not b!764165) (not b!764160) (not start!66288) (not b!764164) (not b!764161) (not b!764171))
(check-sat)
(get-model)

(declare-fun b!764282 () Bool)

(declare-fun lt!339946 () SeekEntryResult!7810)

(assert (=> b!764282 (and (bvsge (index!33610 lt!339946) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339946) (size!20634 a!3186)))))

(declare-fun res!517235 () Bool)

(assert (=> b!764282 (= res!517235 (= (select (arr!20213 a!3186) (index!33610 lt!339946)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!425636 () Bool)

(assert (=> b!764282 (=> res!517235 e!425636)))

(declare-fun b!764283 () Bool)

(declare-fun e!425635 () SeekEntryResult!7810)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764283 (= e!425635 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20213 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764284 () Bool)

(declare-fun e!425633 () SeekEntryResult!7810)

(assert (=> b!764284 (= e!425633 e!425635)))

(declare-fun c!83913 () Bool)

(declare-fun lt!339947 () (_ BitVec 64))

(assert (=> b!764284 (= c!83913 (or (= lt!339947 (select (arr!20213 a!3186) j!159)) (= (bvadd lt!339947 lt!339947) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764286 () Bool)

(assert (=> b!764286 (and (bvsge (index!33610 lt!339946) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339946) (size!20634 a!3186)))))

(declare-fun res!517234 () Bool)

(assert (=> b!764286 (= res!517234 (= (select (arr!20213 a!3186) (index!33610 lt!339946)) (select (arr!20213 a!3186) j!159)))))

(assert (=> b!764286 (=> res!517234 e!425636)))

(declare-fun e!425634 () Bool)

(assert (=> b!764286 (= e!425634 e!425636)))

(declare-fun b!764287 () Bool)

(declare-fun e!425632 () Bool)

(assert (=> b!764287 (= e!425632 (bvsge (x!64513 lt!339946) #b01111111111111111111111111111110))))

(declare-fun b!764288 () Bool)

(assert (=> b!764288 (= e!425632 e!425634)))

(declare-fun res!517233 () Bool)

(get-info :version)

(assert (=> b!764288 (= res!517233 (and ((_ is Intermediate!7810) lt!339946) (not (undefined!8622 lt!339946)) (bvslt (x!64513 lt!339946) #b01111111111111111111111111111110) (bvsge (x!64513 lt!339946) #b00000000000000000000000000000000) (bvsge (x!64513 lt!339946) x!1131)))))

(assert (=> b!764288 (=> (not res!517233) (not e!425634))))

(declare-fun d!100785 () Bool)

(assert (=> d!100785 e!425632))

(declare-fun c!83912 () Bool)

(assert (=> d!100785 (= c!83912 (and ((_ is Intermediate!7810) lt!339946) (undefined!8622 lt!339946)))))

(assert (=> d!100785 (= lt!339946 e!425633)))

(declare-fun c!83911 () Bool)

(assert (=> d!100785 (= c!83911 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100785 (= lt!339947 (select (arr!20213 a!3186) index!1321))))

(assert (=> d!100785 (validMask!0 mask!3328)))

(assert (=> d!100785 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20213 a!3186) j!159) a!3186 mask!3328) lt!339946)))

(declare-fun b!764285 () Bool)

(assert (=> b!764285 (= e!425635 (Intermediate!7810 false index!1321 x!1131))))

(declare-fun b!764289 () Bool)

(assert (=> b!764289 (= e!425633 (Intermediate!7810 true index!1321 x!1131))))

(declare-fun b!764290 () Bool)

(assert (=> b!764290 (and (bvsge (index!33610 lt!339946) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339946) (size!20634 a!3186)))))

(assert (=> b!764290 (= e!425636 (= (select (arr!20213 a!3186) (index!33610 lt!339946)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100785 c!83911) b!764289))

(assert (= (and d!100785 (not c!83911)) b!764284))

(assert (= (and b!764284 c!83913) b!764285))

(assert (= (and b!764284 (not c!83913)) b!764283))

(assert (= (and d!100785 c!83912) b!764287))

(assert (= (and d!100785 (not c!83912)) b!764288))

(assert (= (and b!764288 res!517233) b!764286))

(assert (= (and b!764286 (not res!517234)) b!764282))

(assert (= (and b!764282 (not res!517235)) b!764290))

(declare-fun m!710155 () Bool)

(assert (=> b!764282 m!710155))

(declare-fun m!710157 () Bool)

(assert (=> d!100785 m!710157))

(assert (=> d!100785 m!710035))

(assert (=> b!764286 m!710155))

(assert (=> b!764290 m!710155))

(declare-fun m!710159 () Bool)

(assert (=> b!764283 m!710159))

(assert (=> b!764283 m!710159))

(assert (=> b!764283 m!710023))

(declare-fun m!710161 () Bool)

(assert (=> b!764283 m!710161))

(assert (=> b!764165 d!100785))

(declare-fun b!764302 () Bool)

(declare-fun e!425646 () Bool)

(declare-fun e!425647 () Bool)

(assert (=> b!764302 (= e!425646 e!425647)))

(declare-fun c!83916 () Bool)

(assert (=> b!764302 (= c!83916 (validKeyInArray!0 (select (arr!20213 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34975 () Bool)

(declare-fun call!34978 () Bool)

(assert (=> bm!34975 (= call!34978 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83916 (Cons!14250 (select (arr!20213 a!3186) #b00000000000000000000000000000000) Nil!14251) Nil!14251)))))

(declare-fun b!764303 () Bool)

(declare-fun e!425645 () Bool)

(assert (=> b!764303 (= e!425645 e!425646)))

(declare-fun res!517243 () Bool)

(assert (=> b!764303 (=> (not res!517243) (not e!425646))))

(declare-fun e!425648 () Bool)

(assert (=> b!764303 (= res!517243 (not e!425648))))

(declare-fun res!517244 () Bool)

(assert (=> b!764303 (=> (not res!517244) (not e!425648))))

(assert (=> b!764303 (= res!517244 (validKeyInArray!0 (select (arr!20213 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!764304 () Bool)

(assert (=> b!764304 (= e!425647 call!34978)))

(declare-fun b!764305 () Bool)

(assert (=> b!764305 (= e!425647 call!34978)))

(declare-fun d!100787 () Bool)

(declare-fun res!517242 () Bool)

(assert (=> d!100787 (=> res!517242 e!425645)))

(assert (=> d!100787 (= res!517242 (bvsge #b00000000000000000000000000000000 (size!20634 a!3186)))))

(assert (=> d!100787 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14251) e!425645)))

(declare-fun b!764301 () Bool)

(declare-fun contains!4057 (List!14254 (_ BitVec 64)) Bool)

(assert (=> b!764301 (= e!425648 (contains!4057 Nil!14251 (select (arr!20213 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100787 (not res!517242)) b!764303))

(assert (= (and b!764303 res!517244) b!764301))

(assert (= (and b!764303 res!517243) b!764302))

(assert (= (and b!764302 c!83916) b!764304))

(assert (= (and b!764302 (not c!83916)) b!764305))

(assert (= (or b!764304 b!764305) bm!34975))

(declare-fun m!710163 () Bool)

(assert (=> b!764302 m!710163))

(assert (=> b!764302 m!710163))

(declare-fun m!710165 () Bool)

(assert (=> b!764302 m!710165))

(assert (=> bm!34975 m!710163))

(declare-fun m!710167 () Bool)

(assert (=> bm!34975 m!710167))

(assert (=> b!764303 m!710163))

(assert (=> b!764303 m!710163))

(assert (=> b!764303 m!710165))

(assert (=> b!764301 m!710163))

(assert (=> b!764301 m!710163))

(declare-fun m!710169 () Bool)

(assert (=> b!764301 m!710169))

(assert (=> b!764166 d!100787))

(declare-fun b!764314 () Bool)

(declare-fun e!425657 () Bool)

(declare-fun call!34981 () Bool)

(assert (=> b!764314 (= e!425657 call!34981)))

(declare-fun b!764315 () Bool)

(declare-fun e!425655 () Bool)

(assert (=> b!764315 (= e!425655 call!34981)))

(declare-fun b!764316 () Bool)

(assert (=> b!764316 (= e!425657 e!425655)))

(declare-fun lt!339954 () (_ BitVec 64))

(assert (=> b!764316 (= lt!339954 (select (arr!20213 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!339955 () Unit!26318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42210 (_ BitVec 64) (_ BitVec 32)) Unit!26318)

(assert (=> b!764316 (= lt!339955 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339954 #b00000000000000000000000000000000))))

(assert (=> b!764316 (arrayContainsKey!0 a!3186 lt!339954 #b00000000000000000000000000000000)))

(declare-fun lt!339956 () Unit!26318)

(assert (=> b!764316 (= lt!339956 lt!339955)))

(declare-fun res!517250 () Bool)

(assert (=> b!764316 (= res!517250 (= (seekEntryOrOpen!0 (select (arr!20213 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7810 #b00000000000000000000000000000000)))))

(assert (=> b!764316 (=> (not res!517250) (not e!425655))))

(declare-fun b!764317 () Bool)

(declare-fun e!425656 () Bool)

(assert (=> b!764317 (= e!425656 e!425657)))

(declare-fun c!83919 () Bool)

(assert (=> b!764317 (= c!83919 (validKeyInArray!0 (select (arr!20213 a!3186) #b00000000000000000000000000000000)))))

(declare-fun bm!34978 () Bool)

(assert (=> bm!34978 (= call!34981 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!100789 () Bool)

(declare-fun res!517249 () Bool)

(assert (=> d!100789 (=> res!517249 e!425656)))

(assert (=> d!100789 (= res!517249 (bvsge #b00000000000000000000000000000000 (size!20634 a!3186)))))

(assert (=> d!100789 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!425656)))

(assert (= (and d!100789 (not res!517249)) b!764317))

(assert (= (and b!764317 c!83919) b!764316))

(assert (= (and b!764317 (not c!83919)) b!764314))

(assert (= (and b!764316 res!517250) b!764315))

(assert (= (or b!764315 b!764314) bm!34978))

(assert (=> b!764316 m!710163))

(declare-fun m!710171 () Bool)

(assert (=> b!764316 m!710171))

(declare-fun m!710173 () Bool)

(assert (=> b!764316 m!710173))

(assert (=> b!764316 m!710163))

(declare-fun m!710175 () Bool)

(assert (=> b!764316 m!710175))

(assert (=> b!764317 m!710163))

(assert (=> b!764317 m!710163))

(assert (=> b!764317 m!710165))

(declare-fun m!710177 () Bool)

(assert (=> bm!34978 m!710177))

(assert (=> b!764169 d!100789))

(declare-fun d!100793 () Bool)

(assert (=> d!100793 (= (validKeyInArray!0 (select (arr!20213 a!3186) j!159)) (and (not (= (select (arr!20213 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20213 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!764170 d!100793))

(declare-fun d!100795 () Bool)

(assert (=> d!100795 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!764168 d!100795))

(declare-fun b!764318 () Bool)

(declare-fun lt!339957 () SeekEntryResult!7810)

(assert (=> b!764318 (and (bvsge (index!33610 lt!339957) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339957) (size!20634 lt!339910)))))

(declare-fun res!517253 () Bool)

(assert (=> b!764318 (= res!517253 (= (select (arr!20213 lt!339910) (index!33610 lt!339957)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!425662 () Bool)

(assert (=> b!764318 (=> res!517253 e!425662)))

(declare-fun b!764319 () Bool)

(declare-fun e!425661 () SeekEntryResult!7810)

(assert (=> b!764319 (= e!425661 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!339907 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!339907 lt!339910 mask!3328))))

(declare-fun b!764320 () Bool)

(declare-fun e!425659 () SeekEntryResult!7810)

(assert (=> b!764320 (= e!425659 e!425661)))

(declare-fun c!83922 () Bool)

(declare-fun lt!339958 () (_ BitVec 64))

(assert (=> b!764320 (= c!83922 (or (= lt!339958 lt!339907) (= (bvadd lt!339958 lt!339958) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764322 () Bool)

(assert (=> b!764322 (and (bvsge (index!33610 lt!339957) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339957) (size!20634 lt!339910)))))

(declare-fun res!517252 () Bool)

(assert (=> b!764322 (= res!517252 (= (select (arr!20213 lt!339910) (index!33610 lt!339957)) lt!339907))))

(assert (=> b!764322 (=> res!517252 e!425662)))

(declare-fun e!425660 () Bool)

(assert (=> b!764322 (= e!425660 e!425662)))

(declare-fun b!764323 () Bool)

(declare-fun e!425658 () Bool)

(assert (=> b!764323 (= e!425658 (bvsge (x!64513 lt!339957) #b01111111111111111111111111111110))))

(declare-fun b!764324 () Bool)

(assert (=> b!764324 (= e!425658 e!425660)))

(declare-fun res!517251 () Bool)

(assert (=> b!764324 (= res!517251 (and ((_ is Intermediate!7810) lt!339957) (not (undefined!8622 lt!339957)) (bvslt (x!64513 lt!339957) #b01111111111111111111111111111110) (bvsge (x!64513 lt!339957) #b00000000000000000000000000000000) (bvsge (x!64513 lt!339957) #b00000000000000000000000000000000)))))

(assert (=> b!764324 (=> (not res!517251) (not e!425660))))

(declare-fun d!100797 () Bool)

(assert (=> d!100797 e!425658))

(declare-fun c!83921 () Bool)

(assert (=> d!100797 (= c!83921 (and ((_ is Intermediate!7810) lt!339957) (undefined!8622 lt!339957)))))

(assert (=> d!100797 (= lt!339957 e!425659)))

(declare-fun c!83920 () Bool)

(assert (=> d!100797 (= c!83920 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100797 (= lt!339958 (select (arr!20213 lt!339910) (toIndex!0 lt!339907 mask!3328)))))

(assert (=> d!100797 (validMask!0 mask!3328)))

(assert (=> d!100797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339907 mask!3328) lt!339907 lt!339910 mask!3328) lt!339957)))

(declare-fun b!764321 () Bool)

(assert (=> b!764321 (= e!425661 (Intermediate!7810 false (toIndex!0 lt!339907 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764325 () Bool)

(assert (=> b!764325 (= e!425659 (Intermediate!7810 true (toIndex!0 lt!339907 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764326 () Bool)

(assert (=> b!764326 (and (bvsge (index!33610 lt!339957) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339957) (size!20634 lt!339910)))))

(assert (=> b!764326 (= e!425662 (= (select (arr!20213 lt!339910) (index!33610 lt!339957)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100797 c!83920) b!764325))

(assert (= (and d!100797 (not c!83920)) b!764320))

(assert (= (and b!764320 c!83922) b!764321))

(assert (= (and b!764320 (not c!83922)) b!764319))

(assert (= (and d!100797 c!83921) b!764323))

(assert (= (and d!100797 (not c!83921)) b!764324))

(assert (= (and b!764324 res!517251) b!764322))

(assert (= (and b!764322 (not res!517252)) b!764318))

(assert (= (and b!764318 (not res!517253)) b!764326))

(declare-fun m!710179 () Bool)

(assert (=> b!764318 m!710179))

(assert (=> d!100797 m!710041))

(declare-fun m!710181 () Bool)

(assert (=> d!100797 m!710181))

(assert (=> d!100797 m!710035))

(assert (=> b!764322 m!710179))

(assert (=> b!764326 m!710179))

(assert (=> b!764319 m!710041))

(declare-fun m!710183 () Bool)

(assert (=> b!764319 m!710183))

(assert (=> b!764319 m!710183))

(declare-fun m!710185 () Bool)

(assert (=> b!764319 m!710185))

(assert (=> b!764161 d!100797))

(declare-fun d!100801 () Bool)

(declare-fun lt!339964 () (_ BitVec 32))

(declare-fun lt!339963 () (_ BitVec 32))

(assert (=> d!100801 (= lt!339964 (bvmul (bvxor lt!339963 (bvlshr lt!339963 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100801 (= lt!339963 ((_ extract 31 0) (bvand (bvxor lt!339907 (bvlshr lt!339907 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100801 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517254 (let ((h!15337 ((_ extract 31 0) (bvand (bvxor lt!339907 (bvlshr lt!339907 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64517 (bvmul (bvxor h!15337 (bvlshr h!15337 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64517 (bvlshr x!64517 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517254 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517254 #b00000000000000000000000000000000))))))

(assert (=> d!100801 (= (toIndex!0 lt!339907 mask!3328) (bvand (bvxor lt!339964 (bvlshr lt!339964 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!764161 d!100801))

(declare-fun b!764327 () Bool)

(declare-fun lt!339965 () SeekEntryResult!7810)

(assert (=> b!764327 (and (bvsge (index!33610 lt!339965) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339965) (size!20634 lt!339910)))))

(declare-fun res!517257 () Bool)

(assert (=> b!764327 (= res!517257 (= (select (arr!20213 lt!339910) (index!33610 lt!339965)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!425667 () Bool)

(assert (=> b!764327 (=> res!517257 e!425667)))

(declare-fun e!425666 () SeekEntryResult!7810)

(declare-fun b!764328 () Bool)

(assert (=> b!764328 (= e!425666 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!339907 lt!339910 mask!3328))))

(declare-fun b!764329 () Bool)

(declare-fun e!425664 () SeekEntryResult!7810)

(assert (=> b!764329 (= e!425664 e!425666)))

(declare-fun c!83925 () Bool)

(declare-fun lt!339966 () (_ BitVec 64))

(assert (=> b!764329 (= c!83925 (or (= lt!339966 lt!339907) (= (bvadd lt!339966 lt!339966) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764331 () Bool)

(assert (=> b!764331 (and (bvsge (index!33610 lt!339965) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339965) (size!20634 lt!339910)))))

(declare-fun res!517256 () Bool)

(assert (=> b!764331 (= res!517256 (= (select (arr!20213 lt!339910) (index!33610 lt!339965)) lt!339907))))

(assert (=> b!764331 (=> res!517256 e!425667)))

(declare-fun e!425665 () Bool)

(assert (=> b!764331 (= e!425665 e!425667)))

(declare-fun b!764332 () Bool)

(declare-fun e!425663 () Bool)

(assert (=> b!764332 (= e!425663 (bvsge (x!64513 lt!339965) #b01111111111111111111111111111110))))

(declare-fun b!764333 () Bool)

(assert (=> b!764333 (= e!425663 e!425665)))

(declare-fun res!517255 () Bool)

(assert (=> b!764333 (= res!517255 (and ((_ is Intermediate!7810) lt!339965) (not (undefined!8622 lt!339965)) (bvslt (x!64513 lt!339965) #b01111111111111111111111111111110) (bvsge (x!64513 lt!339965) #b00000000000000000000000000000000) (bvsge (x!64513 lt!339965) x!1131)))))

(assert (=> b!764333 (=> (not res!517255) (not e!425665))))

(declare-fun d!100803 () Bool)

(assert (=> d!100803 e!425663))

(declare-fun c!83924 () Bool)

(assert (=> d!100803 (= c!83924 (and ((_ is Intermediate!7810) lt!339965) (undefined!8622 lt!339965)))))

(assert (=> d!100803 (= lt!339965 e!425664)))

(declare-fun c!83923 () Bool)

(assert (=> d!100803 (= c!83923 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!100803 (= lt!339966 (select (arr!20213 lt!339910) index!1321))))

(assert (=> d!100803 (validMask!0 mask!3328)))

(assert (=> d!100803 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339907 lt!339910 mask!3328) lt!339965)))

(declare-fun b!764330 () Bool)

(assert (=> b!764330 (= e!425666 (Intermediate!7810 false index!1321 x!1131))))

(declare-fun b!764334 () Bool)

(assert (=> b!764334 (= e!425664 (Intermediate!7810 true index!1321 x!1131))))

(declare-fun b!764335 () Bool)

(assert (=> b!764335 (and (bvsge (index!33610 lt!339965) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339965) (size!20634 lt!339910)))))

(assert (=> b!764335 (= e!425667 (= (select (arr!20213 lt!339910) (index!33610 lt!339965)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100803 c!83923) b!764334))

(assert (= (and d!100803 (not c!83923)) b!764329))

(assert (= (and b!764329 c!83925) b!764330))

(assert (= (and b!764329 (not c!83925)) b!764328))

(assert (= (and d!100803 c!83924) b!764332))

(assert (= (and d!100803 (not c!83924)) b!764333))

(assert (= (and b!764333 res!517255) b!764331))

(assert (= (and b!764331 (not res!517256)) b!764327))

(assert (= (and b!764327 (not res!517257)) b!764335))

(declare-fun m!710187 () Bool)

(assert (=> b!764327 m!710187))

(declare-fun m!710189 () Bool)

(assert (=> d!100803 m!710189))

(assert (=> d!100803 m!710035))

(assert (=> b!764331 m!710187))

(assert (=> b!764335 m!710187))

(assert (=> b!764328 m!710159))

(assert (=> b!764328 m!710159))

(declare-fun m!710191 () Bool)

(assert (=> b!764328 m!710191))

(assert (=> b!764161 d!100803))

(declare-fun d!100805 () Bool)

(assert (=> d!100805 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66288 d!100805))

(declare-fun d!100813 () Bool)

(assert (=> d!100813 (= (array_inv!16096 a!3186) (bvsge (size!20634 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66288 d!100813))

(declare-fun b!764364 () Bool)

(declare-fun lt!339977 () SeekEntryResult!7810)

(assert (=> b!764364 (and (bvsge (index!33610 lt!339977) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339977) (size!20634 a!3186)))))

(declare-fun res!517274 () Bool)

(assert (=> b!764364 (= res!517274 (= (select (arr!20213 a!3186) (index!33610 lt!339977)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!425694 () Bool)

(assert (=> b!764364 (=> res!517274 e!425694)))

(declare-fun e!425693 () SeekEntryResult!7810)

(declare-fun b!764365 () Bool)

(assert (=> b!764365 (= e!425693 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20213 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20213 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764366 () Bool)

(declare-fun e!425691 () SeekEntryResult!7810)

(assert (=> b!764366 (= e!425691 e!425693)))

(declare-fun c!83936 () Bool)

(declare-fun lt!339978 () (_ BitVec 64))

(assert (=> b!764366 (= c!83936 (or (= lt!339978 (select (arr!20213 a!3186) j!159)) (= (bvadd lt!339978 lt!339978) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764368 () Bool)

(assert (=> b!764368 (and (bvsge (index!33610 lt!339977) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339977) (size!20634 a!3186)))))

(declare-fun res!517273 () Bool)

(assert (=> b!764368 (= res!517273 (= (select (arr!20213 a!3186) (index!33610 lt!339977)) (select (arr!20213 a!3186) j!159)))))

(assert (=> b!764368 (=> res!517273 e!425694)))

(declare-fun e!425692 () Bool)

(assert (=> b!764368 (= e!425692 e!425694)))

(declare-fun b!764369 () Bool)

(declare-fun e!425690 () Bool)

(assert (=> b!764369 (= e!425690 (bvsge (x!64513 lt!339977) #b01111111111111111111111111111110))))

(declare-fun b!764370 () Bool)

(assert (=> b!764370 (= e!425690 e!425692)))

(declare-fun res!517272 () Bool)

(assert (=> b!764370 (= res!517272 (and ((_ is Intermediate!7810) lt!339977) (not (undefined!8622 lt!339977)) (bvslt (x!64513 lt!339977) #b01111111111111111111111111111110) (bvsge (x!64513 lt!339977) #b00000000000000000000000000000000) (bvsge (x!64513 lt!339977) #b00000000000000000000000000000000)))))

(assert (=> b!764370 (=> (not res!517272) (not e!425692))))

(declare-fun d!100815 () Bool)

(assert (=> d!100815 e!425690))

(declare-fun c!83935 () Bool)

(assert (=> d!100815 (= c!83935 (and ((_ is Intermediate!7810) lt!339977) (undefined!8622 lt!339977)))))

(assert (=> d!100815 (= lt!339977 e!425691)))

(declare-fun c!83934 () Bool)

(assert (=> d!100815 (= c!83934 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!100815 (= lt!339978 (select (arr!20213 a!3186) (toIndex!0 (select (arr!20213 a!3186) j!159) mask!3328)))))

(assert (=> d!100815 (validMask!0 mask!3328)))

(assert (=> d!100815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20213 a!3186) j!159) mask!3328) (select (arr!20213 a!3186) j!159) a!3186 mask!3328) lt!339977)))

(declare-fun b!764367 () Bool)

(assert (=> b!764367 (= e!425693 (Intermediate!7810 false (toIndex!0 (select (arr!20213 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764371 () Bool)

(assert (=> b!764371 (= e!425691 (Intermediate!7810 true (toIndex!0 (select (arr!20213 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!764372 () Bool)

(assert (=> b!764372 (and (bvsge (index!33610 lt!339977) #b00000000000000000000000000000000) (bvslt (index!33610 lt!339977) (size!20634 a!3186)))))

(assert (=> b!764372 (= e!425694 (= (select (arr!20213 a!3186) (index!33610 lt!339977)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100815 c!83934) b!764371))

(assert (= (and d!100815 (not c!83934)) b!764366))

(assert (= (and b!764366 c!83936) b!764367))

(assert (= (and b!764366 (not c!83936)) b!764365))

(assert (= (and d!100815 c!83935) b!764369))

(assert (= (and d!100815 (not c!83935)) b!764370))

(assert (= (and b!764370 res!517272) b!764368))

(assert (= (and b!764368 (not res!517273)) b!764364))

(assert (= (and b!764364 (not res!517274)) b!764372))

(declare-fun m!710197 () Bool)

(assert (=> b!764364 m!710197))

(assert (=> d!100815 m!710061))

(declare-fun m!710199 () Bool)

(assert (=> d!100815 m!710199))

(assert (=> d!100815 m!710035))

(assert (=> b!764368 m!710197))

(assert (=> b!764372 m!710197))

(assert (=> b!764365 m!710061))

(declare-fun m!710201 () Bool)

(assert (=> b!764365 m!710201))

(assert (=> b!764365 m!710201))

(assert (=> b!764365 m!710023))

(declare-fun m!710203 () Bool)

(assert (=> b!764365 m!710203))

(assert (=> b!764160 d!100815))

(declare-fun d!100817 () Bool)

(declare-fun lt!339980 () (_ BitVec 32))

(declare-fun lt!339979 () (_ BitVec 32))

(assert (=> d!100817 (= lt!339980 (bvmul (bvxor lt!339979 (bvlshr lt!339979 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100817 (= lt!339979 ((_ extract 31 0) (bvand (bvxor (select (arr!20213 a!3186) j!159) (bvlshr (select (arr!20213 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100817 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517254 (let ((h!15337 ((_ extract 31 0) (bvand (bvxor (select (arr!20213 a!3186) j!159) (bvlshr (select (arr!20213 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64517 (bvmul (bvxor h!15337 (bvlshr h!15337 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64517 (bvlshr x!64517 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517254 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517254 #b00000000000000000000000000000000))))))

(assert (=> d!100817 (= (toIndex!0 (select (arr!20213 a!3186) j!159) mask!3328) (bvand (bvxor lt!339980 (bvlshr lt!339980 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!764160 d!100817))

(declare-fun b!764414 () Bool)

(declare-fun e!425716 () SeekEntryResult!7810)

(assert (=> b!764414 (= e!425716 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20213 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764415 () Bool)

(declare-fun e!425715 () SeekEntryResult!7810)

(assert (=> b!764415 (= e!425715 Undefined!7810)))

(declare-fun b!764416 () Bool)

(declare-fun e!425717 () SeekEntryResult!7810)

(assert (=> b!764416 (= e!425717 (Found!7810 index!1321))))

(declare-fun b!764417 () Bool)

(assert (=> b!764417 (= e!425716 (MissingVacant!7810 resIntermediateIndex!5))))

(declare-fun d!100819 () Bool)

(declare-fun lt!340001 () SeekEntryResult!7810)

(assert (=> d!100819 (and (or ((_ is Undefined!7810) lt!340001) (not ((_ is Found!7810) lt!340001)) (and (bvsge (index!33609 lt!340001) #b00000000000000000000000000000000) (bvslt (index!33609 lt!340001) (size!20634 a!3186)))) (or ((_ is Undefined!7810) lt!340001) ((_ is Found!7810) lt!340001) (not ((_ is MissingVacant!7810) lt!340001)) (not (= (index!33611 lt!340001) resIntermediateIndex!5)) (and (bvsge (index!33611 lt!340001) #b00000000000000000000000000000000) (bvslt (index!33611 lt!340001) (size!20634 a!3186)))) (or ((_ is Undefined!7810) lt!340001) (ite ((_ is Found!7810) lt!340001) (= (select (arr!20213 a!3186) (index!33609 lt!340001)) (select (arr!20213 a!3186) j!159)) (and ((_ is MissingVacant!7810) lt!340001) (= (index!33611 lt!340001) resIntermediateIndex!5) (= (select (arr!20213 a!3186) (index!33611 lt!340001)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!100819 (= lt!340001 e!425715)))

(declare-fun c!83953 () Bool)

(assert (=> d!100819 (= c!83953 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!340000 () (_ BitVec 64))

(assert (=> d!100819 (= lt!340000 (select (arr!20213 a!3186) index!1321))))

(assert (=> d!100819 (validMask!0 mask!3328)))

(assert (=> d!100819 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20213 a!3186) j!159) a!3186 mask!3328) lt!340001)))

(declare-fun b!764418 () Bool)

(declare-fun c!83955 () Bool)

(assert (=> b!764418 (= c!83955 (= lt!340000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764418 (= e!425717 e!425716)))

(declare-fun b!764419 () Bool)

(assert (=> b!764419 (= e!425715 e!425717)))

(declare-fun c!83954 () Bool)

(assert (=> b!764419 (= c!83954 (= lt!340000 (select (arr!20213 a!3186) j!159)))))

(assert (= (and d!100819 c!83953) b!764415))

(assert (= (and d!100819 (not c!83953)) b!764419))

(assert (= (and b!764419 c!83954) b!764416))

(assert (= (and b!764419 (not c!83954)) b!764418))

(assert (= (and b!764418 c!83955) b!764417))

(assert (= (and b!764418 (not c!83955)) b!764414))

(assert (=> b!764414 m!710159))

(assert (=> b!764414 m!710159))

(assert (=> b!764414 m!710023))

(declare-fun m!710223 () Bool)

(assert (=> b!764414 m!710223))

(declare-fun m!710225 () Bool)

(assert (=> d!100819 m!710225))

(declare-fun m!710227 () Bool)

(assert (=> d!100819 m!710227))

(assert (=> d!100819 m!710157))

(assert (=> d!100819 m!710035))

(assert (=> b!764171 d!100819))

(declare-fun b!764482 () Bool)

(declare-fun e!425753 () SeekEntryResult!7810)

(assert (=> b!764482 (= e!425753 Undefined!7810)))

(declare-fun b!764483 () Bool)

(declare-fun e!425752 () SeekEntryResult!7810)

(assert (=> b!764483 (= e!425753 e!425752)))

(declare-fun lt!340030 () (_ BitVec 64))

(declare-fun lt!340029 () SeekEntryResult!7810)

(assert (=> b!764483 (= lt!340030 (select (arr!20213 a!3186) (index!33610 lt!340029)))))

(declare-fun c!83984 () Bool)

(assert (=> b!764483 (= c!83984 (= lt!340030 k0!2102))))

(declare-fun b!764484 () Bool)

(declare-fun e!425754 () SeekEntryResult!7810)

(assert (=> b!764484 (= e!425754 (MissingZero!7810 (index!33610 lt!340029)))))

(declare-fun b!764485 () Bool)

(assert (=> b!764485 (= e!425754 (seekKeyOrZeroReturnVacant!0 (x!64513 lt!340029) (index!33610 lt!340029) (index!33610 lt!340029) k0!2102 a!3186 mask!3328))))

(declare-fun b!764486 () Bool)

(assert (=> b!764486 (= e!425752 (Found!7810 (index!33610 lt!340029)))))

(declare-fun b!764487 () Bool)

(declare-fun c!83982 () Bool)

(assert (=> b!764487 (= c!83982 (= lt!340030 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764487 (= e!425752 e!425754)))

(declare-fun d!100827 () Bool)

(declare-fun lt!340031 () SeekEntryResult!7810)

(assert (=> d!100827 (and (or ((_ is Undefined!7810) lt!340031) (not ((_ is Found!7810) lt!340031)) (and (bvsge (index!33609 lt!340031) #b00000000000000000000000000000000) (bvslt (index!33609 lt!340031) (size!20634 a!3186)))) (or ((_ is Undefined!7810) lt!340031) ((_ is Found!7810) lt!340031) (not ((_ is MissingZero!7810) lt!340031)) (and (bvsge (index!33608 lt!340031) #b00000000000000000000000000000000) (bvslt (index!33608 lt!340031) (size!20634 a!3186)))) (or ((_ is Undefined!7810) lt!340031) ((_ is Found!7810) lt!340031) ((_ is MissingZero!7810) lt!340031) (not ((_ is MissingVacant!7810) lt!340031)) (and (bvsge (index!33611 lt!340031) #b00000000000000000000000000000000) (bvslt (index!33611 lt!340031) (size!20634 a!3186)))) (or ((_ is Undefined!7810) lt!340031) (ite ((_ is Found!7810) lt!340031) (= (select (arr!20213 a!3186) (index!33609 lt!340031)) k0!2102) (ite ((_ is MissingZero!7810) lt!340031) (= (select (arr!20213 a!3186) (index!33608 lt!340031)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7810) lt!340031) (= (select (arr!20213 a!3186) (index!33611 lt!340031)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100827 (= lt!340031 e!425753)))

(declare-fun c!83983 () Bool)

(assert (=> d!100827 (= c!83983 (and ((_ is Intermediate!7810) lt!340029) (undefined!8622 lt!340029)))))

(assert (=> d!100827 (= lt!340029 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!100827 (validMask!0 mask!3328)))

(assert (=> d!100827 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!340031)))

(assert (= (and d!100827 c!83983) b!764482))

(assert (= (and d!100827 (not c!83983)) b!764483))

(assert (= (and b!764483 c!83984) b!764486))

(assert (= (and b!764483 (not c!83984)) b!764487))

(assert (= (and b!764487 c!83982) b!764484))

(assert (= (and b!764487 (not c!83982)) b!764485))

(declare-fun m!710249 () Bool)

(assert (=> b!764483 m!710249))

(declare-fun m!710251 () Bool)

(assert (=> b!764485 m!710251))

(declare-fun m!710253 () Bool)

(assert (=> d!100827 m!710253))

(assert (=> d!100827 m!710035))

(declare-fun m!710255 () Bool)

(assert (=> d!100827 m!710255))

(declare-fun m!710257 () Bool)

(assert (=> d!100827 m!710257))

(declare-fun m!710259 () Bool)

(assert (=> d!100827 m!710259))

(assert (=> d!100827 m!710255))

(declare-fun m!710261 () Bool)

(assert (=> d!100827 m!710261))

(assert (=> b!764164 d!100827))

(declare-fun d!100833 () Bool)

(declare-fun res!517303 () Bool)

(declare-fun e!425767 () Bool)

(assert (=> d!100833 (=> res!517303 e!425767)))

(assert (=> d!100833 (= res!517303 (= (select (arr!20213 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!100833 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!425767)))

(declare-fun b!764505 () Bool)

(declare-fun e!425768 () Bool)

(assert (=> b!764505 (= e!425767 e!425768)))

(declare-fun res!517304 () Bool)

(assert (=> b!764505 (=> (not res!517304) (not e!425768))))

(assert (=> b!764505 (= res!517304 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20634 a!3186)))))

(declare-fun b!764506 () Bool)

(assert (=> b!764506 (= e!425768 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100833 (not res!517303)) b!764505))

(assert (= (and b!764505 res!517304) b!764506))

(assert (=> d!100833 m!710163))

(declare-fun m!710277 () Bool)

(assert (=> b!764506 m!710277))

(assert (=> b!764173 d!100833))

(declare-fun b!764507 () Bool)

(declare-fun e!425770 () SeekEntryResult!7810)

(assert (=> b!764507 (= e!425770 Undefined!7810)))

(declare-fun b!764508 () Bool)

(declare-fun e!425769 () SeekEntryResult!7810)

(assert (=> b!764508 (= e!425770 e!425769)))

(declare-fun lt!340038 () (_ BitVec 64))

(declare-fun lt!340037 () SeekEntryResult!7810)

(assert (=> b!764508 (= lt!340038 (select (arr!20213 a!3186) (index!33610 lt!340037)))))

(declare-fun c!83991 () Bool)

(assert (=> b!764508 (= c!83991 (= lt!340038 (select (arr!20213 a!3186) j!159)))))

(declare-fun b!764509 () Bool)

(declare-fun e!425771 () SeekEntryResult!7810)

(assert (=> b!764509 (= e!425771 (MissingZero!7810 (index!33610 lt!340037)))))

(declare-fun b!764510 () Bool)

(assert (=> b!764510 (= e!425771 (seekKeyOrZeroReturnVacant!0 (x!64513 lt!340037) (index!33610 lt!340037) (index!33610 lt!340037) (select (arr!20213 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!764511 () Bool)

(assert (=> b!764511 (= e!425769 (Found!7810 (index!33610 lt!340037)))))

(declare-fun b!764512 () Bool)

(declare-fun c!83989 () Bool)

(assert (=> b!764512 (= c!83989 (= lt!340038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!764512 (= e!425769 e!425771)))

(declare-fun d!100839 () Bool)

(declare-fun lt!340039 () SeekEntryResult!7810)

(assert (=> d!100839 (and (or ((_ is Undefined!7810) lt!340039) (not ((_ is Found!7810) lt!340039)) (and (bvsge (index!33609 lt!340039) #b00000000000000000000000000000000) (bvslt (index!33609 lt!340039) (size!20634 a!3186)))) (or ((_ is Undefined!7810) lt!340039) ((_ is Found!7810) lt!340039) (not ((_ is MissingZero!7810) lt!340039)) (and (bvsge (index!33608 lt!340039) #b00000000000000000000000000000000) (bvslt (index!33608 lt!340039) (size!20634 a!3186)))) (or ((_ is Undefined!7810) lt!340039) ((_ is Found!7810) lt!340039) ((_ is MissingZero!7810) lt!340039) (not ((_ is MissingVacant!7810) lt!340039)) (and (bvsge (index!33611 lt!340039) #b00000000000000000000000000000000) (bvslt (index!33611 lt!340039) (size!20634 a!3186)))) (or ((_ is Undefined!7810) lt!340039) (ite ((_ is Found!7810) lt!340039) (= (select (arr!20213 a!3186) (index!33609 lt!340039)) (select (arr!20213 a!3186) j!159)) (ite ((_ is MissingZero!7810) lt!340039) (= (select (arr!20213 a!3186) (index!33608 lt!340039)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7810) lt!340039) (= (select (arr!20213 a!3186) (index!33611 lt!340039)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100839 (= lt!340039 e!425770)))

(declare-fun c!83990 () Bool)

(assert (=> d!100839 (= c!83990 (and ((_ is Intermediate!7810) lt!340037) (undefined!8622 lt!340037)))))

(assert (=> d!100839 (= lt!340037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20213 a!3186) j!159) mask!3328) (select (arr!20213 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100839 (validMask!0 mask!3328)))

(assert (=> d!100839 (= (seekEntryOrOpen!0 (select (arr!20213 a!3186) j!159) a!3186 mask!3328) lt!340039)))

(assert (= (and d!100839 c!83990) b!764507))

(assert (= (and d!100839 (not c!83990)) b!764508))

(assert (= (and b!764508 c!83991) b!764511))

(assert (= (and b!764508 (not c!83991)) b!764512))

(assert (= (and b!764512 c!83989) b!764509))

(assert (= (and b!764512 (not c!83989)) b!764510))

(declare-fun m!710279 () Bool)

(assert (=> b!764508 m!710279))

(assert (=> b!764510 m!710023))

(declare-fun m!710281 () Bool)

(assert (=> b!764510 m!710281))

(declare-fun m!710283 () Bool)

(assert (=> d!100839 m!710283))

(assert (=> d!100839 m!710035))

(assert (=> d!100839 m!710023))

(assert (=> d!100839 m!710061))

(declare-fun m!710285 () Bool)

(assert (=> d!100839 m!710285))

(declare-fun m!710287 () Bool)

(assert (=> d!100839 m!710287))

(assert (=> d!100839 m!710061))

(assert (=> d!100839 m!710023))

(assert (=> d!100839 m!710063))

(assert (=> b!764163 d!100839))

(declare-fun b!764513 () Bool)

(declare-fun e!425774 () Bool)

(declare-fun call!34988 () Bool)

(assert (=> b!764513 (= e!425774 call!34988)))

(declare-fun b!764514 () Bool)

(declare-fun e!425772 () Bool)

(assert (=> b!764514 (= e!425772 call!34988)))

(declare-fun b!764515 () Bool)

(assert (=> b!764515 (= e!425774 e!425772)))

(declare-fun lt!340040 () (_ BitVec 64))

(assert (=> b!764515 (= lt!340040 (select (arr!20213 a!3186) j!159))))

(declare-fun lt!340041 () Unit!26318)

(assert (=> b!764515 (= lt!340041 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340040 j!159))))

(assert (=> b!764515 (arrayContainsKey!0 a!3186 lt!340040 #b00000000000000000000000000000000)))

(declare-fun lt!340042 () Unit!26318)

(assert (=> b!764515 (= lt!340042 lt!340041)))

(declare-fun res!517306 () Bool)

(assert (=> b!764515 (= res!517306 (= (seekEntryOrOpen!0 (select (arr!20213 a!3186) j!159) a!3186 mask!3328) (Found!7810 j!159)))))

(assert (=> b!764515 (=> (not res!517306) (not e!425772))))

(declare-fun b!764516 () Bool)

(declare-fun e!425773 () Bool)

(assert (=> b!764516 (= e!425773 e!425774)))

(declare-fun c!83992 () Bool)

(assert (=> b!764516 (= c!83992 (validKeyInArray!0 (select (arr!20213 a!3186) j!159)))))

(declare-fun bm!34985 () Bool)

(assert (=> bm!34985 (= call!34988 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!100841 () Bool)

(declare-fun res!517305 () Bool)

(assert (=> d!100841 (=> res!517305 e!425773)))

(assert (=> d!100841 (= res!517305 (bvsge j!159 (size!20634 a!3186)))))

(assert (=> d!100841 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!425773)))

(assert (= (and d!100841 (not res!517305)) b!764516))

(assert (= (and b!764516 c!83992) b!764515))

(assert (= (and b!764516 (not c!83992)) b!764513))

(assert (= (and b!764515 res!517306) b!764514))

(assert (= (or b!764514 b!764513) bm!34985))

(assert (=> b!764515 m!710023))

(declare-fun m!710289 () Bool)

(assert (=> b!764515 m!710289))

(declare-fun m!710291 () Bool)

(assert (=> b!764515 m!710291))

(assert (=> b!764515 m!710023))

(assert (=> b!764515 m!710051))

(assert (=> b!764516 m!710023))

(assert (=> b!764516 m!710023))

(assert (=> b!764516 m!710059))

(declare-fun m!710293 () Bool)

(assert (=> bm!34985 m!710293))

(assert (=> b!764163 d!100841))

(declare-fun d!100843 () Bool)

(assert (=> d!100843 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!340056 () Unit!26318)

(declare-fun choose!38 (array!42210 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26318)

(assert (=> d!100843 (= lt!340056 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100843 (validMask!0 mask!3328)))

(assert (=> d!100843 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!340056)))

(declare-fun bs!21447 () Bool)

(assert (= bs!21447 d!100843))

(assert (=> bs!21447 m!710053))

(declare-fun m!710301 () Bool)

(assert (=> bs!21447 m!710301))

(assert (=> bs!21447 m!710035))

(assert (=> b!764163 d!100843))

(check-sat (not d!100827) (not b!764302) (not b!764365) (not b!764301) (not d!100815) (not b!764414) (not b!764485) (not b!764516) (not b!764515) (not b!764328) (not d!100839) (not bm!34985) (not bm!34978) (not d!100785) (not d!100819) (not d!100797) (not bm!34975) (not d!100803) (not d!100843) (not b!764319) (not b!764506) (not b!764283) (not b!764510) (not b!764317) (not b!764303) (not b!764316))
(check-sat)
