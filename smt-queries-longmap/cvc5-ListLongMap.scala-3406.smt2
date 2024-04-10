; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47226 () Bool)

(assert start!47226)

(declare-fun b!519832 () Bool)

(declare-fun res!318179 () Bool)

(declare-fun e!303319 () Bool)

(assert (=> b!519832 (=> res!318179 e!303319)))

(declare-datatypes ((SeekEntryResult!4415 0))(
  ( (MissingZero!4415 (index!19857 (_ BitVec 32))) (Found!4415 (index!19858 (_ BitVec 32))) (Intermediate!4415 (undefined!5227 Bool) (index!19859 (_ BitVec 32)) (x!48839 (_ BitVec 32))) (Undefined!4415) (MissingVacant!4415 (index!19860 (_ BitVec 32))) )
))
(declare-fun lt!238062 () SeekEntryResult!4415)

(assert (=> b!519832 (= res!318179 (or (undefined!5227 lt!238062) (not (is-Intermediate!4415 lt!238062))))))

(declare-fun b!519833 () Bool)

(declare-datatypes ((Unit!16112 0))(
  ( (Unit!16113) )
))
(declare-fun e!303324 () Unit!16112)

(declare-fun Unit!16114 () Unit!16112)

(assert (=> b!519833 (= e!303324 Unit!16114)))

(declare-fun b!519834 () Bool)

(declare-fun res!318177 () Bool)

(declare-fun e!303321 () Bool)

(assert (=> b!519834 (=> (not res!318177) (not e!303321))))

(declare-datatypes ((array!33178 0))(
  ( (array!33179 (arr!15948 (Array (_ BitVec 32) (_ BitVec 64))) (size!16312 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33178)

(declare-datatypes ((List!10106 0))(
  ( (Nil!10103) (Cons!10102 (h!11018 (_ BitVec 64)) (t!16334 List!10106)) )
))
(declare-fun arrayNoDuplicates!0 (array!33178 (_ BitVec 32) List!10106) Bool)

(assert (=> b!519834 (= res!318177 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10103))))

(declare-fun e!303318 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!519835 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33178 (_ BitVec 32)) SeekEntryResult!4415)

(assert (=> b!519835 (= e!303318 (= (seekEntryOrOpen!0 (select (arr!15948 a!3235) j!176) a!3235 mask!3524) (Found!4415 j!176)))))

(declare-fun res!318176 () Bool)

(declare-fun e!303320 () Bool)

(assert (=> start!47226 (=> (not res!318176) (not e!303320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47226 (= res!318176 (validMask!0 mask!3524))))

(assert (=> start!47226 e!303320))

(assert (=> start!47226 true))

(declare-fun array_inv!11744 (array!33178) Bool)

(assert (=> start!47226 (array_inv!11744 a!3235)))

(declare-fun b!519836 () Bool)

(declare-fun res!318170 () Bool)

(assert (=> b!519836 (=> (not res!318170) (not e!303320))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519836 (= res!318170 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519837 () Bool)

(declare-fun res!318175 () Bool)

(assert (=> b!519837 (=> (not res!318175) (not e!303320))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!519837 (= res!318175 (and (= (size!16312 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16312 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16312 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519838 () Bool)

(declare-fun res!318171 () Bool)

(assert (=> b!519838 (=> (not res!318171) (not e!303321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33178 (_ BitVec 32)) Bool)

(assert (=> b!519838 (= res!318171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519839 () Bool)

(assert (=> b!519839 (= e!303321 (not e!303319))))

(declare-fun res!318173 () Bool)

(assert (=> b!519839 (=> res!318173 e!303319)))

(declare-fun lt!238059 () (_ BitVec 64))

(declare-fun lt!238065 () (_ BitVec 32))

(declare-fun lt!238058 () array!33178)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33178 (_ BitVec 32)) SeekEntryResult!4415)

(assert (=> b!519839 (= res!318173 (= lt!238062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238065 lt!238059 lt!238058 mask!3524)))))

(declare-fun lt!238061 () (_ BitVec 32))

(assert (=> b!519839 (= lt!238062 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238061 (select (arr!15948 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519839 (= lt!238065 (toIndex!0 lt!238059 mask!3524))))

(assert (=> b!519839 (= lt!238059 (select (store (arr!15948 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!519839 (= lt!238061 (toIndex!0 (select (arr!15948 a!3235) j!176) mask!3524))))

(assert (=> b!519839 (= lt!238058 (array!33179 (store (arr!15948 a!3235) i!1204 k!2280) (size!16312 a!3235)))))

(assert (=> b!519839 e!303318))

(declare-fun res!318172 () Bool)

(assert (=> b!519839 (=> (not res!318172) (not e!303318))))

(assert (=> b!519839 (= res!318172 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238060 () Unit!16112)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16112)

(assert (=> b!519839 (= lt!238060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519840 () Bool)

(assert (=> b!519840 (= e!303320 e!303321)))

(declare-fun res!318168 () Bool)

(assert (=> b!519840 (=> (not res!318168) (not e!303321))))

(declare-fun lt!238064 () SeekEntryResult!4415)

(assert (=> b!519840 (= res!318168 (or (= lt!238064 (MissingZero!4415 i!1204)) (= lt!238064 (MissingVacant!4415 i!1204))))))

(assert (=> b!519840 (= lt!238064 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!519841 () Bool)

(declare-fun res!318174 () Bool)

(assert (=> b!519841 (=> (not res!318174) (not e!303320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519841 (= res!318174 (validKeyInArray!0 (select (arr!15948 a!3235) j!176)))))

(declare-fun b!519842 () Bool)

(assert (=> b!519842 (= e!303319 (not (= (select (arr!15948 a!3235) (index!19859 lt!238062)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!519842 (or (= (select (arr!15948 a!3235) (index!19859 lt!238062)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15948 a!3235) (index!19859 lt!238062)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238063 () Unit!16112)

(assert (=> b!519842 (= lt!238063 e!303324)))

(declare-fun c!61130 () Bool)

(assert (=> b!519842 (= c!61130 (= (select (arr!15948 a!3235) (index!19859 lt!238062)) (select (arr!15948 a!3235) j!176)))))

(assert (=> b!519842 (and (bvslt (x!48839 lt!238062) #b01111111111111111111111111111110) (or (= (select (arr!15948 a!3235) (index!19859 lt!238062)) (select (arr!15948 a!3235) j!176)) (= (select (arr!15948 a!3235) (index!19859 lt!238062)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15948 a!3235) (index!19859 lt!238062)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519843 () Bool)

(declare-fun res!318178 () Bool)

(assert (=> b!519843 (=> (not res!318178) (not e!303320))))

(assert (=> b!519843 (= res!318178 (validKeyInArray!0 k!2280))))

(declare-fun b!519844 () Bool)

(declare-fun e!303323 () Bool)

(assert (=> b!519844 (= e!303323 false)))

(declare-fun b!519845 () Bool)

(declare-fun Unit!16115 () Unit!16112)

(assert (=> b!519845 (= e!303324 Unit!16115)))

(declare-fun lt!238066 () Unit!16112)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33178 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16112)

(assert (=> b!519845 (= lt!238066 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238061 #b00000000000000000000000000000000 (index!19859 lt!238062) (x!48839 lt!238062) mask!3524))))

(declare-fun res!318169 () Bool)

(assert (=> b!519845 (= res!318169 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238061 lt!238059 lt!238058 mask!3524) (Intermediate!4415 false (index!19859 lt!238062) (x!48839 lt!238062))))))

(assert (=> b!519845 (=> (not res!318169) (not e!303323))))

(assert (=> b!519845 e!303323))

(assert (= (and start!47226 res!318176) b!519837))

(assert (= (and b!519837 res!318175) b!519841))

(assert (= (and b!519841 res!318174) b!519843))

(assert (= (and b!519843 res!318178) b!519836))

(assert (= (and b!519836 res!318170) b!519840))

(assert (= (and b!519840 res!318168) b!519838))

(assert (= (and b!519838 res!318171) b!519834))

(assert (= (and b!519834 res!318177) b!519839))

(assert (= (and b!519839 res!318172) b!519835))

(assert (= (and b!519839 (not res!318173)) b!519832))

(assert (= (and b!519832 (not res!318179)) b!519842))

(assert (= (and b!519842 c!61130) b!519845))

(assert (= (and b!519842 (not c!61130)) b!519833))

(assert (= (and b!519845 res!318169) b!519844))

(declare-fun m!500931 () Bool)

(assert (=> b!519838 m!500931))

(declare-fun m!500933 () Bool)

(assert (=> b!519839 m!500933))

(declare-fun m!500935 () Bool)

(assert (=> b!519839 m!500935))

(declare-fun m!500937 () Bool)

(assert (=> b!519839 m!500937))

(declare-fun m!500939 () Bool)

(assert (=> b!519839 m!500939))

(assert (=> b!519839 m!500937))

(declare-fun m!500941 () Bool)

(assert (=> b!519839 m!500941))

(assert (=> b!519839 m!500937))

(declare-fun m!500943 () Bool)

(assert (=> b!519839 m!500943))

(declare-fun m!500945 () Bool)

(assert (=> b!519839 m!500945))

(declare-fun m!500947 () Bool)

(assert (=> b!519839 m!500947))

(declare-fun m!500949 () Bool)

(assert (=> b!519839 m!500949))

(declare-fun m!500951 () Bool)

(assert (=> b!519843 m!500951))

(declare-fun m!500953 () Bool)

(assert (=> start!47226 m!500953))

(declare-fun m!500955 () Bool)

(assert (=> start!47226 m!500955))

(assert (=> b!519835 m!500937))

(assert (=> b!519835 m!500937))

(declare-fun m!500957 () Bool)

(assert (=> b!519835 m!500957))

(declare-fun m!500959 () Bool)

(assert (=> b!519842 m!500959))

(assert (=> b!519842 m!500937))

(declare-fun m!500961 () Bool)

(assert (=> b!519840 m!500961))

(declare-fun m!500963 () Bool)

(assert (=> b!519836 m!500963))

(declare-fun m!500965 () Bool)

(assert (=> b!519834 m!500965))

(assert (=> b!519841 m!500937))

(assert (=> b!519841 m!500937))

(declare-fun m!500967 () Bool)

(assert (=> b!519841 m!500967))

(declare-fun m!500969 () Bool)

(assert (=> b!519845 m!500969))

(declare-fun m!500971 () Bool)

(assert (=> b!519845 m!500971))

(push 1)

(assert (not b!519845))

(assert (not b!519834))

(assert (not b!519835))

(assert (not b!519843))

(assert (not b!519839))

(assert (not b!519840))

(assert (not b!519838))

(assert (not b!519841))

(assert (not b!519836))

(assert (not start!47226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80185 () Bool)

(assert (=> d!80185 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519843 d!80185))

(declare-fun b!519986 () Bool)

(declare-fun e!303402 () Bool)

(declare-fun e!303404 () Bool)

(assert (=> b!519986 (= e!303402 e!303404)))

(declare-fun c!61154 () Bool)

(assert (=> b!519986 (= c!61154 (validKeyInArray!0 (select (arr!15948 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519987 () Bool)

(declare-fun call!31772 () Bool)

(assert (=> b!519987 (= e!303404 call!31772)))

(declare-fun b!519988 () Bool)

(declare-fun e!303403 () Bool)

(assert (=> b!519988 (= e!303404 e!303403)))

(declare-fun lt!238157 () (_ BitVec 64))

(assert (=> b!519988 (= lt!238157 (select (arr!15948 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238156 () Unit!16112)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33178 (_ BitVec 64) (_ BitVec 32)) Unit!16112)

(assert (=> b!519988 (= lt!238156 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238157 #b00000000000000000000000000000000))))

(assert (=> b!519988 (arrayContainsKey!0 a!3235 lt!238157 #b00000000000000000000000000000000)))

(declare-fun lt!238154 () Unit!16112)

(assert (=> b!519988 (= lt!238154 lt!238156)))

(declare-fun res!318276 () Bool)

(assert (=> b!519988 (= res!318276 (= (seekEntryOrOpen!0 (select (arr!15948 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4415 #b00000000000000000000000000000000)))))

(assert (=> b!519988 (=> (not res!318276) (not e!303403))))

(declare-fun b!519989 () Bool)

(assert (=> b!519989 (= e!303403 call!31772)))

(declare-fun bm!31769 () Bool)

(assert (=> bm!31769 (= call!31772 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80189 () Bool)

(declare-fun res!318275 () Bool)

(assert (=> d!80189 (=> res!318275 e!303402)))

(assert (=> d!80189 (= res!318275 (bvsge #b00000000000000000000000000000000 (size!16312 a!3235)))))

(assert (=> d!80189 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303402)))

(assert (= (and d!80189 (not res!318275)) b!519986))

(assert (= (and b!519986 c!61154) b!519988))

(assert (= (and b!519986 (not c!61154)) b!519987))

(assert (= (and b!519988 res!318276) b!519989))

(assert (= (or b!519989 b!519987) bm!31769))

(declare-fun m!501081 () Bool)

(assert (=> b!519986 m!501081))

(assert (=> b!519986 m!501081))

(declare-fun m!501083 () Bool)

(assert (=> b!519986 m!501083))

(assert (=> b!519988 m!501081))

(declare-fun m!501085 () Bool)

(assert (=> b!519988 m!501085))

(declare-fun m!501087 () Bool)

(assert (=> b!519988 m!501087))

(assert (=> b!519988 m!501081))

(declare-fun m!501089 () Bool)

(assert (=> b!519988 m!501089))

(declare-fun m!501091 () Bool)

(assert (=> bm!31769 m!501091))

(assert (=> b!519838 d!80189))

(declare-fun d!80195 () Bool)

(declare-fun res!318284 () Bool)

(declare-fun e!303412 () Bool)

(assert (=> d!80195 (=> res!318284 e!303412)))

(assert (=> d!80195 (= res!318284 (= (select (arr!15948 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80195 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!303412)))

(declare-fun b!519997 () Bool)

(declare-fun e!303413 () Bool)

(assert (=> b!519997 (= e!303412 e!303413)))

(declare-fun res!318285 () Bool)

(assert (=> b!519997 (=> (not res!318285) (not e!303413))))

(assert (=> b!519997 (= res!318285 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16312 a!3235)))))

(declare-fun b!519998 () Bool)

(assert (=> b!519998 (= e!303413 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80195 (not res!318284)) b!519997))

(assert (= (and b!519997 res!318285) b!519998))

(assert (=> d!80195 m!501081))

(declare-fun m!501097 () Bool)

(assert (=> b!519998 m!501097))

(assert (=> b!519836 d!80195))

(declare-fun b!520057 () Bool)

(declare-fun c!61180 () Bool)

(declare-fun lt!238183 () (_ BitVec 64))

(assert (=> b!520057 (= c!61180 (= lt!238183 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303446 () SeekEntryResult!4415)

(declare-fun e!303444 () SeekEntryResult!4415)

(assert (=> b!520057 (= e!303446 e!303444)))

(declare-fun b!520058 () Bool)

(declare-fun e!303445 () SeekEntryResult!4415)

(assert (=> b!520058 (= e!303445 Undefined!4415)))

(declare-fun b!520059 () Bool)

(declare-fun lt!238182 () SeekEntryResult!4415)

(assert (=> b!520059 (= e!303444 (MissingZero!4415 (index!19859 lt!238182)))))

(declare-fun b!520060 () Bool)

(assert (=> b!520060 (= e!303446 (Found!4415 (index!19859 lt!238182)))))

(declare-fun b!520061 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33178 (_ BitVec 32)) SeekEntryResult!4415)

(assert (=> b!520061 (= e!303444 (seekKeyOrZeroReturnVacant!0 (x!48839 lt!238182) (index!19859 lt!238182) (index!19859 lt!238182) (select (arr!15948 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!80199 () Bool)

(declare-fun lt!238184 () SeekEntryResult!4415)

(assert (=> d!80199 (and (or (is-Undefined!4415 lt!238184) (not (is-Found!4415 lt!238184)) (and (bvsge (index!19858 lt!238184) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238184) (size!16312 a!3235)))) (or (is-Undefined!4415 lt!238184) (is-Found!4415 lt!238184) (not (is-MissingZero!4415 lt!238184)) (and (bvsge (index!19857 lt!238184) #b00000000000000000000000000000000) (bvslt (index!19857 lt!238184) (size!16312 a!3235)))) (or (is-Undefined!4415 lt!238184) (is-Found!4415 lt!238184) (is-MissingZero!4415 lt!238184) (not (is-MissingVacant!4415 lt!238184)) (and (bvsge (index!19860 lt!238184) #b00000000000000000000000000000000) (bvslt (index!19860 lt!238184) (size!16312 a!3235)))) (or (is-Undefined!4415 lt!238184) (ite (is-Found!4415 lt!238184) (= (select (arr!15948 a!3235) (index!19858 lt!238184)) (select (arr!15948 a!3235) j!176)) (ite (is-MissingZero!4415 lt!238184) (= (select (arr!15948 a!3235) (index!19857 lt!238184)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4415 lt!238184) (= (select (arr!15948 a!3235) (index!19860 lt!238184)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80199 (= lt!238184 e!303445)))

(declare-fun c!61181 () Bool)

(assert (=> d!80199 (= c!61181 (and (is-Intermediate!4415 lt!238182) (undefined!5227 lt!238182)))))

(assert (=> d!80199 (= lt!238182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15948 a!3235) j!176) mask!3524) (select (arr!15948 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80199 (validMask!0 mask!3524)))

(assert (=> d!80199 (= (seekEntryOrOpen!0 (select (arr!15948 a!3235) j!176) a!3235 mask!3524) lt!238184)))

(declare-fun b!520056 () Bool)

(assert (=> b!520056 (= e!303445 e!303446)))

(assert (=> b!520056 (= lt!238183 (select (arr!15948 a!3235) (index!19859 lt!238182)))))

(declare-fun c!61179 () Bool)

(assert (=> b!520056 (= c!61179 (= lt!238183 (select (arr!15948 a!3235) j!176)))))

(assert (= (and d!80199 c!61181) b!520058))

(assert (= (and d!80199 (not c!61181)) b!520056))

(assert (= (and b!520056 c!61179) b!520060))

(assert (= (and b!520056 (not c!61179)) b!520057))

(assert (= (and b!520057 c!61180) b!520059))

(assert (= (and b!520057 (not c!61180)) b!520061))

(assert (=> b!520061 m!500937))

(declare-fun m!501119 () Bool)

(assert (=> b!520061 m!501119))

(assert (=> d!80199 m!500937))

(assert (=> d!80199 m!500939))

(assert (=> d!80199 m!500939))

(assert (=> d!80199 m!500937))

(declare-fun m!501123 () Bool)

(assert (=> d!80199 m!501123))

(declare-fun m!501125 () Bool)

(assert (=> d!80199 m!501125))

(declare-fun m!501127 () Bool)

(assert (=> d!80199 m!501127))

(assert (=> d!80199 m!500953))

(declare-fun m!501129 () Bool)

(assert (=> d!80199 m!501129))

(declare-fun m!501131 () Bool)

(assert (=> b!520056 m!501131))

(assert (=> b!519835 d!80199))

(declare-fun b!520063 () Bool)

(declare-fun c!61183 () Bool)

(declare-fun lt!238186 () (_ BitVec 64))

(assert (=> b!520063 (= c!61183 (= lt!238186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303449 () SeekEntryResult!4415)

(declare-fun e!303447 () SeekEntryResult!4415)

(assert (=> b!520063 (= e!303449 e!303447)))

(declare-fun b!520064 () Bool)

(declare-fun e!303448 () SeekEntryResult!4415)

(assert (=> b!520064 (= e!303448 Undefined!4415)))

(declare-fun b!520065 () Bool)

(declare-fun lt!238185 () SeekEntryResult!4415)

(assert (=> b!520065 (= e!303447 (MissingZero!4415 (index!19859 lt!238185)))))

(declare-fun b!520066 () Bool)

(assert (=> b!520066 (= e!303449 (Found!4415 (index!19859 lt!238185)))))

(declare-fun b!520067 () Bool)

(assert (=> b!520067 (= e!303447 (seekKeyOrZeroReturnVacant!0 (x!48839 lt!238185) (index!19859 lt!238185) (index!19859 lt!238185) k!2280 a!3235 mask!3524))))

(declare-fun d!80205 () Bool)

(declare-fun lt!238187 () SeekEntryResult!4415)

(assert (=> d!80205 (and (or (is-Undefined!4415 lt!238187) (not (is-Found!4415 lt!238187)) (and (bvsge (index!19858 lt!238187) #b00000000000000000000000000000000) (bvslt (index!19858 lt!238187) (size!16312 a!3235)))) (or (is-Undefined!4415 lt!238187) (is-Found!4415 lt!238187) (not (is-MissingZero!4415 lt!238187)) (and (bvsge (index!19857 lt!238187) #b00000000000000000000000000000000) (bvslt (index!19857 lt!238187) (size!16312 a!3235)))) (or (is-Undefined!4415 lt!238187) (is-Found!4415 lt!238187) (is-MissingZero!4415 lt!238187) (not (is-MissingVacant!4415 lt!238187)) (and (bvsge (index!19860 lt!238187) #b00000000000000000000000000000000) (bvslt (index!19860 lt!238187) (size!16312 a!3235)))) (or (is-Undefined!4415 lt!238187) (ite (is-Found!4415 lt!238187) (= (select (arr!15948 a!3235) (index!19858 lt!238187)) k!2280) (ite (is-MissingZero!4415 lt!238187) (= (select (arr!15948 a!3235) (index!19857 lt!238187)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4415 lt!238187) (= (select (arr!15948 a!3235) (index!19860 lt!238187)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80205 (= lt!238187 e!303448)))

(declare-fun c!61184 () Bool)

(assert (=> d!80205 (= c!61184 (and (is-Intermediate!4415 lt!238185) (undefined!5227 lt!238185)))))

(assert (=> d!80205 (= lt!238185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80205 (validMask!0 mask!3524)))

(assert (=> d!80205 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!238187)))

(declare-fun b!520062 () Bool)

(assert (=> b!520062 (= e!303448 e!303449)))

(assert (=> b!520062 (= lt!238186 (select (arr!15948 a!3235) (index!19859 lt!238185)))))

(declare-fun c!61182 () Bool)

(assert (=> b!520062 (= c!61182 (= lt!238186 k!2280))))

(assert (= (and d!80205 c!61184) b!520064))

(assert (= (and d!80205 (not c!61184)) b!520062))

(assert (= (and b!520062 c!61182) b!520066))

(assert (= (and b!520062 (not c!61182)) b!520063))

(assert (= (and b!520063 c!61183) b!520065))

(assert (= (and b!520063 (not c!61183)) b!520067))

(declare-fun m!501133 () Bool)

(assert (=> b!520067 m!501133))

(declare-fun m!501135 () Bool)

(assert (=> d!80205 m!501135))

(assert (=> d!80205 m!501135))

(declare-fun m!501137 () Bool)

(assert (=> d!80205 m!501137))

(declare-fun m!501139 () Bool)

(assert (=> d!80205 m!501139))

(declare-fun m!501141 () Bool)

(assert (=> d!80205 m!501141))

(assert (=> d!80205 m!500953))

(declare-fun m!501143 () Bool)

(assert (=> d!80205 m!501143))

(declare-fun m!501145 () Bool)

(assert (=> b!520062 m!501145))

(assert (=> b!519840 d!80205))

(declare-fun d!80207 () Bool)

(assert (=> d!80207 (= (validKeyInArray!0 (select (arr!15948 a!3235) j!176)) (and (not (= (select (arr!15948 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15948 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519841 d!80207))

(declare-fun d!80209 () Bool)

(declare-fun lt!238195 () (_ BitVec 32))

(declare-fun lt!238194 () (_ BitVec 32))

(assert (=> d!80209 (= lt!238195 (bvmul (bvxor lt!238194 (bvlshr lt!238194 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80209 (= lt!238194 ((_ extract 31 0) (bvand (bvxor (select (arr!15948 a!3235) j!176) (bvlshr (select (arr!15948 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80209 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318295 (let ((h!11022 ((_ extract 31 0) (bvand (bvxor (select (arr!15948 a!3235) j!176) (bvlshr (select (arr!15948 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48846 (bvmul (bvxor h!11022 (bvlshr h!11022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48846 (bvlshr x!48846 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318295 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318295 #b00000000000000000000000000000000))))))

(assert (=> d!80209 (= (toIndex!0 (select (arr!15948 a!3235) j!176) mask!3524) (bvand (bvxor lt!238195 (bvlshr lt!238195 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519839 d!80209))

(declare-fun b!520070 () Bool)

(declare-fun e!303452 () Bool)

(declare-fun e!303454 () Bool)

(assert (=> b!520070 (= e!303452 e!303454)))

(declare-fun c!61185 () Bool)

(assert (=> b!520070 (= c!61185 (validKeyInArray!0 (select (arr!15948 a!3235) j!176)))))

(declare-fun b!520071 () Bool)

(declare-fun call!31773 () Bool)

(assert (=> b!520071 (= e!303454 call!31773)))

(declare-fun b!520072 () Bool)

(declare-fun e!303453 () Bool)

(assert (=> b!520072 (= e!303454 e!303453)))

(declare-fun lt!238198 () (_ BitVec 64))

(assert (=> b!520072 (= lt!238198 (select (arr!15948 a!3235) j!176))))

(declare-fun lt!238197 () Unit!16112)

(assert (=> b!520072 (= lt!238197 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238198 j!176))))

(assert (=> b!520072 (arrayContainsKey!0 a!3235 lt!238198 #b00000000000000000000000000000000)))

(declare-fun lt!238196 () Unit!16112)

(assert (=> b!520072 (= lt!238196 lt!238197)))

(declare-fun res!318299 () Bool)

(assert (=> b!520072 (= res!318299 (= (seekEntryOrOpen!0 (select (arr!15948 a!3235) j!176) a!3235 mask!3524) (Found!4415 j!176)))))

(assert (=> b!520072 (=> (not res!318299) (not e!303453))))

(declare-fun b!520073 () Bool)

(assert (=> b!520073 (= e!303453 call!31773)))

(declare-fun bm!31770 () Bool)

(assert (=> bm!31770 (= call!31773 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80211 () Bool)

(declare-fun res!318298 () Bool)

(assert (=> d!80211 (=> res!318298 e!303452)))

(assert (=> d!80211 (= res!318298 (bvsge j!176 (size!16312 a!3235)))))

(assert (=> d!80211 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303452)))

(assert (= (and d!80211 (not res!318298)) b!520070))

(assert (= (and b!520070 c!61185) b!520072))

(assert (= (and b!520070 (not c!61185)) b!520071))

(assert (= (and b!520072 res!318299) b!520073))

(assert (= (or b!520073 b!520071) bm!31770))

(assert (=> b!520070 m!500937))

(assert (=> b!520070 m!500937))

(assert (=> b!520070 m!500967))

(assert (=> b!520072 m!500937))

(declare-fun m!501147 () Bool)

(assert (=> b!520072 m!501147))

(declare-fun m!501149 () Bool)

(assert (=> b!520072 m!501149))

(assert (=> b!520072 m!500937))

(assert (=> b!520072 m!500957))

(declare-fun m!501151 () Bool)

(assert (=> bm!31770 m!501151))

(assert (=> b!519839 d!80211))

(declare-fun d!80213 () Bool)

(declare-fun lt!238200 () (_ BitVec 32))

(declare-fun lt!238199 () (_ BitVec 32))

(assert (=> d!80213 (= lt!238200 (bvmul (bvxor lt!238199 (bvlshr lt!238199 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80213 (= lt!238199 ((_ extract 31 0) (bvand (bvxor lt!238059 (bvlshr lt!238059 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80213 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318295 (let ((h!11022 ((_ extract 31 0) (bvand (bvxor lt!238059 (bvlshr lt!238059 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48846 (bvmul (bvxor h!11022 (bvlshr h!11022 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48846 (bvlshr x!48846 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318295 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318295 #b00000000000000000000000000000000))))))

(assert (=> d!80213 (= (toIndex!0 lt!238059 mask!3524) (bvand (bvxor lt!238200 (bvlshr lt!238200 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519839 d!80213))

(declare-fun b!520142 () Bool)

(declare-fun lt!238224 () SeekEntryResult!4415)

(assert (=> b!520142 (and (bvsge (index!19859 lt!238224) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238224) (size!16312 lt!238058)))))

(declare-fun res!318324 () Bool)

(assert (=> b!520142 (= res!318324 (= (select (arr!15948 lt!238058) (index!19859 lt!238224)) lt!238059))))

(declare-fun e!303500 () Bool)

(assert (=> b!520142 (=> res!318324 e!303500)))

(declare-fun e!303499 () Bool)

(assert (=> b!520142 (= e!303499 e!303500)))

(declare-fun d!80215 () Bool)

(declare-fun e!303502 () Bool)

(assert (=> d!80215 e!303502))

(declare-fun c!61208 () Bool)

(assert (=> d!80215 (= c!61208 (and (is-Intermediate!4415 lt!238224) (undefined!5227 lt!238224)))))

(declare-fun e!303501 () SeekEntryResult!4415)

(assert (=> d!80215 (= lt!238224 e!303501)))

(declare-fun c!61210 () Bool)

(assert (=> d!80215 (= c!61210 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238223 () (_ BitVec 64))

(assert (=> d!80215 (= lt!238223 (select (arr!15948 lt!238058) lt!238065))))

(assert (=> d!80215 (validMask!0 mask!3524)))

(assert (=> d!80215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238065 lt!238059 lt!238058 mask!3524) lt!238224)))

(declare-fun b!520143 () Bool)

(declare-fun e!303498 () SeekEntryResult!4415)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520143 (= e!303498 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238065 #b00000000000000000000000000000000 mask!3524) lt!238059 lt!238058 mask!3524))))

(declare-fun b!520144 () Bool)

(assert (=> b!520144 (= e!303501 (Intermediate!4415 true lt!238065 #b00000000000000000000000000000000))))

(declare-fun b!520145 () Bool)

(assert (=> b!520145 (= e!303502 e!303499)))

(declare-fun res!318326 () Bool)

(assert (=> b!520145 (= res!318326 (and (is-Intermediate!4415 lt!238224) (not (undefined!5227 lt!238224)) (bvslt (x!48839 lt!238224) #b01111111111111111111111111111110) (bvsge (x!48839 lt!238224) #b00000000000000000000000000000000) (bvsge (x!48839 lt!238224) #b00000000000000000000000000000000)))))

(assert (=> b!520145 (=> (not res!318326) (not e!303499))))

(declare-fun b!520146 () Bool)

(assert (=> b!520146 (= e!303498 (Intermediate!4415 false lt!238065 #b00000000000000000000000000000000))))

(declare-fun b!520147 () Bool)

(assert (=> b!520147 (and (bvsge (index!19859 lt!238224) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238224) (size!16312 lt!238058)))))

(declare-fun res!318325 () Bool)

(assert (=> b!520147 (= res!318325 (= (select (arr!15948 lt!238058) (index!19859 lt!238224)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520147 (=> res!318325 e!303500)))

(declare-fun b!520148 () Bool)

(assert (=> b!520148 (= e!303501 e!303498)))

(declare-fun c!61209 () Bool)

(assert (=> b!520148 (= c!61209 (or (= lt!238223 lt!238059) (= (bvadd lt!238223 lt!238223) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520149 () Bool)

(assert (=> b!520149 (= e!303502 (bvsge (x!48839 lt!238224) #b01111111111111111111111111111110))))

(declare-fun b!520150 () Bool)

(assert (=> b!520150 (and (bvsge (index!19859 lt!238224) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238224) (size!16312 lt!238058)))))

(assert (=> b!520150 (= e!303500 (= (select (arr!15948 lt!238058) (index!19859 lt!238224)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80215 c!61210) b!520144))

(assert (= (and d!80215 (not c!61210)) b!520148))

(assert (= (and b!520148 c!61209) b!520146))

(assert (= (and b!520148 (not c!61209)) b!520143))

(assert (= (and d!80215 c!61208) b!520149))

(assert (= (and d!80215 (not c!61208)) b!520145))

(assert (= (and b!520145 res!318326) b!520142))

(assert (= (and b!520142 (not res!318324)) b!520147))

(assert (= (and b!520147 (not res!318325)) b!520150))

(declare-fun m!501205 () Bool)

(assert (=> b!520143 m!501205))

(assert (=> b!520143 m!501205))

(declare-fun m!501207 () Bool)

(assert (=> b!520143 m!501207))

(declare-fun m!501209 () Bool)

(assert (=> b!520142 m!501209))

(assert (=> b!520150 m!501209))

(declare-fun m!501211 () Bool)

(assert (=> d!80215 m!501211))

(assert (=> d!80215 m!500953))

(assert (=> b!520147 m!501209))

(assert (=> b!519839 d!80215))

(declare-fun b!520157 () Bool)

(declare-fun lt!238232 () SeekEntryResult!4415)

(assert (=> b!520157 (and (bvsge (index!19859 lt!238232) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238232) (size!16312 a!3235)))))

(declare-fun res!318329 () Bool)

(assert (=> b!520157 (= res!318329 (= (select (arr!15948 a!3235) (index!19859 lt!238232)) (select (arr!15948 a!3235) j!176)))))

(declare-fun e!303509 () Bool)

(assert (=> b!520157 (=> res!318329 e!303509)))

(declare-fun e!303508 () Bool)

(assert (=> b!520157 (= e!303508 e!303509)))

(declare-fun d!80239 () Bool)

(declare-fun e!303511 () Bool)

(assert (=> d!80239 e!303511))

(declare-fun c!61213 () Bool)

(assert (=> d!80239 (= c!61213 (and (is-Intermediate!4415 lt!238232) (undefined!5227 lt!238232)))))

(declare-fun e!303510 () SeekEntryResult!4415)

(assert (=> d!80239 (= lt!238232 e!303510)))

(declare-fun c!61215 () Bool)

(assert (=> d!80239 (= c!61215 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238231 () (_ BitVec 64))

(assert (=> d!80239 (= lt!238231 (select (arr!15948 a!3235) lt!238061))))

(assert (=> d!80239 (validMask!0 mask!3524)))

(assert (=> d!80239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238061 (select (arr!15948 a!3235) j!176) a!3235 mask!3524) lt!238232)))

(declare-fun e!303507 () SeekEntryResult!4415)

(declare-fun b!520158 () Bool)

(assert (=> b!520158 (= e!303507 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238061 #b00000000000000000000000000000000 mask!3524) (select (arr!15948 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!520159 () Bool)

(assert (=> b!520159 (= e!303510 (Intermediate!4415 true lt!238061 #b00000000000000000000000000000000))))

(declare-fun b!520160 () Bool)

(assert (=> b!520160 (= e!303511 e!303508)))

(declare-fun res!318331 () Bool)

(assert (=> b!520160 (= res!318331 (and (is-Intermediate!4415 lt!238232) (not (undefined!5227 lt!238232)) (bvslt (x!48839 lt!238232) #b01111111111111111111111111111110) (bvsge (x!48839 lt!238232) #b00000000000000000000000000000000) (bvsge (x!48839 lt!238232) #b00000000000000000000000000000000)))))

(assert (=> b!520160 (=> (not res!318331) (not e!303508))))

(declare-fun b!520161 () Bool)

(assert (=> b!520161 (= e!303507 (Intermediate!4415 false lt!238061 #b00000000000000000000000000000000))))

(declare-fun b!520162 () Bool)

(assert (=> b!520162 (and (bvsge (index!19859 lt!238232) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238232) (size!16312 a!3235)))))

(declare-fun res!318330 () Bool)

(assert (=> b!520162 (= res!318330 (= (select (arr!15948 a!3235) (index!19859 lt!238232)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520162 (=> res!318330 e!303509)))

(declare-fun b!520163 () Bool)

(assert (=> b!520163 (= e!303510 e!303507)))

(declare-fun c!61214 () Bool)

(assert (=> b!520163 (= c!61214 (or (= lt!238231 (select (arr!15948 a!3235) j!176)) (= (bvadd lt!238231 lt!238231) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520164 () Bool)

(assert (=> b!520164 (= e!303511 (bvsge (x!48839 lt!238232) #b01111111111111111111111111111110))))

(declare-fun b!520165 () Bool)

(assert (=> b!520165 (and (bvsge (index!19859 lt!238232) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238232) (size!16312 a!3235)))))

(assert (=> b!520165 (= e!303509 (= (select (arr!15948 a!3235) (index!19859 lt!238232)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80239 c!61215) b!520159))

(assert (= (and d!80239 (not c!61215)) b!520163))

(assert (= (and b!520163 c!61214) b!520161))

(assert (= (and b!520163 (not c!61214)) b!520158))

(assert (= (and d!80239 c!61213) b!520164))

(assert (= (and d!80239 (not c!61213)) b!520160))

(assert (= (and b!520160 res!318331) b!520157))

(assert (= (and b!520157 (not res!318329)) b!520162))

(assert (= (and b!520162 (not res!318330)) b!520165))

(declare-fun m!501213 () Bool)

(assert (=> b!520158 m!501213))

(assert (=> b!520158 m!501213))

(assert (=> b!520158 m!500937))

(declare-fun m!501215 () Bool)

(assert (=> b!520158 m!501215))

(declare-fun m!501217 () Bool)

(assert (=> b!520157 m!501217))

(assert (=> b!520165 m!501217))

(declare-fun m!501219 () Bool)

(assert (=> d!80239 m!501219))

(assert (=> d!80239 m!500953))

(assert (=> b!520162 m!501217))

(assert (=> b!519839 d!80239))

(declare-fun d!80241 () Bool)

(assert (=> d!80241 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!238241 () Unit!16112)

(declare-fun choose!38 (array!33178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16112)

(assert (=> d!80241 (= lt!238241 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80241 (validMask!0 mask!3524)))

(assert (=> d!80241 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!238241)))

(declare-fun bs!16382 () Bool)

(assert (= bs!16382 d!80241))

(assert (=> bs!16382 m!500941))

(declare-fun m!501249 () Bool)

(assert (=> bs!16382 m!501249))

(assert (=> bs!16382 m!500953))

(assert (=> b!519839 d!80241))

(declare-fun d!80247 () Bool)

(assert (=> d!80247 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47226 d!80247))

(declare-fun d!80253 () Bool)

(assert (=> d!80253 (= (array_inv!11744 a!3235) (bvsge (size!16312 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47226 d!80253))

(declare-fun d!80255 () Bool)

(declare-fun e!303551 () Bool)

(assert (=> d!80255 e!303551))

(declare-fun res!318360 () Bool)

(assert (=> d!80255 (=> (not res!318360) (not e!303551))))

(assert (=> d!80255 (= res!318360 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16312 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16312 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16312 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16312 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16312 a!3235))))))

(declare-fun lt!238246 () Unit!16112)

(declare-fun choose!47 (array!33178 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16112)

(assert (=> d!80255 (= lt!238246 (choose!47 a!3235 i!1204 k!2280 j!176 lt!238061 #b00000000000000000000000000000000 (index!19859 lt!238062) (x!48839 lt!238062) mask!3524))))

(assert (=> d!80255 (validMask!0 mask!3524)))

(assert (=> d!80255 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238061 #b00000000000000000000000000000000 (index!19859 lt!238062) (x!48839 lt!238062) mask!3524) lt!238246)))

(declare-fun b!520219 () Bool)

(assert (=> b!520219 (= e!303551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238061 (select (store (arr!15948 a!3235) i!1204 k!2280) j!176) (array!33179 (store (arr!15948 a!3235) i!1204 k!2280) (size!16312 a!3235)) mask!3524) (Intermediate!4415 false (index!19859 lt!238062) (x!48839 lt!238062))))))

(assert (= (and d!80255 res!318360) b!520219))

(declare-fun m!501263 () Bool)

(assert (=> d!80255 m!501263))

(assert (=> d!80255 m!500953))

(assert (=> b!520219 m!500945))

(assert (=> b!520219 m!500949))

(assert (=> b!520219 m!500949))

(declare-fun m!501265 () Bool)

(assert (=> b!520219 m!501265))

(assert (=> b!519845 d!80255))

(declare-fun b!520220 () Bool)

(declare-fun lt!238248 () SeekEntryResult!4415)

(assert (=> b!520220 (and (bvsge (index!19859 lt!238248) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238248) (size!16312 lt!238058)))))

(declare-fun res!318361 () Bool)

(assert (=> b!520220 (= res!318361 (= (select (arr!15948 lt!238058) (index!19859 lt!238248)) lt!238059))))

(declare-fun e!303554 () Bool)

(assert (=> b!520220 (=> res!318361 e!303554)))

(declare-fun e!303553 () Bool)

(assert (=> b!520220 (= e!303553 e!303554)))

(declare-fun d!80263 () Bool)

(declare-fun e!303556 () Bool)

(assert (=> d!80263 e!303556))

(declare-fun c!61229 () Bool)

(assert (=> d!80263 (= c!61229 (and (is-Intermediate!4415 lt!238248) (undefined!5227 lt!238248)))))

(declare-fun e!303555 () SeekEntryResult!4415)

(assert (=> d!80263 (= lt!238248 e!303555)))

(declare-fun c!61231 () Bool)

(assert (=> d!80263 (= c!61231 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238247 () (_ BitVec 64))

(assert (=> d!80263 (= lt!238247 (select (arr!15948 lt!238058) lt!238061))))

(assert (=> d!80263 (validMask!0 mask!3524)))

(assert (=> d!80263 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238061 lt!238059 lt!238058 mask!3524) lt!238248)))

(declare-fun b!520221 () Bool)

(declare-fun e!303552 () SeekEntryResult!4415)

(assert (=> b!520221 (= e!303552 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238061 #b00000000000000000000000000000000 mask!3524) lt!238059 lt!238058 mask!3524))))

(declare-fun b!520222 () Bool)

(assert (=> b!520222 (= e!303555 (Intermediate!4415 true lt!238061 #b00000000000000000000000000000000))))

(declare-fun b!520223 () Bool)

(assert (=> b!520223 (= e!303556 e!303553)))

(declare-fun res!318363 () Bool)

(assert (=> b!520223 (= res!318363 (and (is-Intermediate!4415 lt!238248) (not (undefined!5227 lt!238248)) (bvslt (x!48839 lt!238248) #b01111111111111111111111111111110) (bvsge (x!48839 lt!238248) #b00000000000000000000000000000000) (bvsge (x!48839 lt!238248) #b00000000000000000000000000000000)))))

(assert (=> b!520223 (=> (not res!318363) (not e!303553))))

(declare-fun b!520224 () Bool)

(assert (=> b!520224 (= e!303552 (Intermediate!4415 false lt!238061 #b00000000000000000000000000000000))))

(declare-fun b!520225 () Bool)

(assert (=> b!520225 (and (bvsge (index!19859 lt!238248) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238248) (size!16312 lt!238058)))))

(declare-fun res!318362 () Bool)

(assert (=> b!520225 (= res!318362 (= (select (arr!15948 lt!238058) (index!19859 lt!238248)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520225 (=> res!318362 e!303554)))

(declare-fun b!520226 () Bool)

(assert (=> b!520226 (= e!303555 e!303552)))

(declare-fun c!61230 () Bool)

(assert (=> b!520226 (= c!61230 (or (= lt!238247 lt!238059) (= (bvadd lt!238247 lt!238247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520227 () Bool)

(assert (=> b!520227 (= e!303556 (bvsge (x!48839 lt!238248) #b01111111111111111111111111111110))))

(declare-fun b!520228 () Bool)

(assert (=> b!520228 (and (bvsge (index!19859 lt!238248) #b00000000000000000000000000000000) (bvslt (index!19859 lt!238248) (size!16312 lt!238058)))))

(assert (=> b!520228 (= e!303554 (= (select (arr!15948 lt!238058) (index!19859 lt!238248)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!80263 c!61231) b!520222))

(assert (= (and d!80263 (not c!61231)) b!520226))

(assert (= (and b!520226 c!61230) b!520224))

(assert (= (and b!520226 (not c!61230)) b!520221))

(assert (= (and d!80263 c!61229) b!520227))

(assert (= (and d!80263 (not c!61229)) b!520223))

(assert (= (and b!520223 res!318363) b!520220))

(assert (= (and b!520220 (not res!318361)) b!520225))

(assert (= (and b!520225 (not res!318362)) b!520228))

(assert (=> b!520221 m!501213))

(assert (=> b!520221 m!501213))

(declare-fun m!501267 () Bool)

(assert (=> b!520221 m!501267))

(declare-fun m!501269 () Bool)

(assert (=> b!520220 m!501269))

(assert (=> b!520228 m!501269))

(declare-fun m!501271 () Bool)

(assert (=> d!80263 m!501271))

(assert (=> d!80263 m!500953))

(assert (=> b!520225 m!501269))

(assert (=> b!519845 d!80263))

(declare-fun b!520252 () Bool)

(declare-fun e!303576 () Bool)

(declare-fun call!31787 () Bool)

(assert (=> b!520252 (= e!303576 call!31787)))

(declare-fun d!80265 () Bool)

(declare-fun res!318376 () Bool)

(declare-fun e!303574 () Bool)

(assert (=> d!80265 (=> res!318376 e!303574)))

(assert (=> d!80265 (= res!318376 (bvsge #b00000000000000000000000000000000 (size!16312 a!3235)))))

(assert (=> d!80265 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10103) e!303574)))

(declare-fun b!520253 () Bool)

(assert (=> b!520253 (= e!303576 call!31787)))

(declare-fun b!520254 () Bool)

(declare-fun e!303573 () Bool)

(assert (=> b!520254 (= e!303574 e!303573)))

(declare-fun res!318377 () Bool)

(assert (=> b!520254 (=> (not res!318377) (not e!303573))))

(declare-fun e!303575 () Bool)

(assert (=> b!520254 (= res!318377 (not e!303575))))

(declare-fun res!318375 () Bool)

(assert (=> b!520254 (=> (not res!318375) (not e!303575))))

(assert (=> b!520254 (= res!318375 (validKeyInArray!0 (select (arr!15948 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520255 () Bool)

(assert (=> b!520255 (= e!303573 e!303576)))

(declare-fun c!61238 () Bool)

(assert (=> b!520255 (= c!61238 (validKeyInArray!0 (select (arr!15948 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31784 () Bool)

(assert (=> bm!31784 (= call!31787 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61238 (Cons!10102 (select (arr!15948 a!3235) #b00000000000000000000000000000000) Nil!10103) Nil!10103)))))

(declare-fun b!520256 () Bool)

(declare-fun contains!2760 (List!10106 (_ BitVec 64)) Bool)

(assert (=> b!520256 (= e!303575 (contains!2760 Nil!10103 (select (arr!15948 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80265 (not res!318376)) b!520254))

(assert (= (and b!520254 res!318375) b!520256))

(assert (= (and b!520254 res!318377) b!520255))

(assert (= (and b!520255 c!61238) b!520252))

