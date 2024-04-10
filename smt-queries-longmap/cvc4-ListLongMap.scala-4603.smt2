; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64196 () Bool)

(assert start!64196)

(declare-fun b!721079 () Bool)

(declare-fun e!404350 () Bool)

(declare-fun e!404349 () Bool)

(assert (=> b!721079 (= e!404350 e!404349)))

(declare-fun res!483156 () Bool)

(assert (=> b!721079 (=> (not res!483156) (not e!404349))))

(declare-datatypes ((SeekEntryResult!7141 0))(
  ( (MissingZero!7141 (index!30932 (_ BitVec 32))) (Found!7141 (index!30933 (_ BitVec 32))) (Intermediate!7141 (undefined!7953 Bool) (index!30934 (_ BitVec 32)) (x!61933 (_ BitVec 32))) (Undefined!7141) (MissingVacant!7141 (index!30935 (_ BitVec 32))) )
))
(declare-fun lt!319953 () SeekEntryResult!7141)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721079 (= res!483156 (or (= lt!319953 (MissingZero!7141 i!1173)) (= lt!319953 (MissingVacant!7141 i!1173))))))

(declare-datatypes ((array!40834 0))(
  ( (array!40835 (arr!19541 (Array (_ BitVec 32) (_ BitVec 64))) (size!19962 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40834)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40834 (_ BitVec 32)) SeekEntryResult!7141)

(assert (=> b!721079 (= lt!319953 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721080 () Bool)

(declare-fun e!404348 () Bool)

(declare-fun lt!319954 () (_ BitVec 32))

(assert (=> b!721080 (= e!404348 (and (bvsge mask!3328 #b00000000000000000000000000000000) (or (bvslt lt!319954 #b00000000000000000000000000000000) (bvsge lt!319954 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721080 (= lt!319954 (toIndex!0 (select (store (arr!19541 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!721081 () Bool)

(declare-fun res!483161 () Bool)

(assert (=> b!721081 (=> (not res!483161) (not e!404348))))

(declare-fun e!404351 () Bool)

(assert (=> b!721081 (= res!483161 e!404351)))

(declare-fun c!79333 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721081 (= c!79333 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721082 () Bool)

(declare-fun res!483155 () Bool)

(assert (=> b!721082 (=> (not res!483155) (not e!404350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721082 (= res!483155 (validKeyInArray!0 k!2102))))

(declare-fun b!721083 () Bool)

(declare-fun res!483163 () Bool)

(assert (=> b!721083 (=> (not res!483163) (not e!404349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40834 (_ BitVec 32)) Bool)

(assert (=> b!721083 (= res!483163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!483160 () Bool)

(assert (=> start!64196 (=> (not res!483160) (not e!404350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64196 (= res!483160 (validMask!0 mask!3328))))

(assert (=> start!64196 e!404350))

(assert (=> start!64196 true))

(declare-fun array_inv!15337 (array!40834) Bool)

(assert (=> start!64196 (array_inv!15337 a!3186)))

(declare-fun b!721084 () Bool)

(declare-fun res!483159 () Bool)

(assert (=> b!721084 (=> (not res!483159) (not e!404349))))

(declare-datatypes ((List!13543 0))(
  ( (Nil!13540) (Cons!13539 (h!14590 (_ BitVec 64)) (t!19858 List!13543)) )
))
(declare-fun arrayNoDuplicates!0 (array!40834 (_ BitVec 32) List!13543) Bool)

(assert (=> b!721084 (= res!483159 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13540))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!721085 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40834 (_ BitVec 32)) SeekEntryResult!7141)

(assert (=> b!721085 (= e!404351 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19541 a!3186) j!159) a!3186 mask!3328) (Found!7141 j!159)))))

(declare-fun b!721086 () Bool)

(declare-fun res!483157 () Bool)

(assert (=> b!721086 (=> (not res!483157) (not e!404350))))

(assert (=> b!721086 (= res!483157 (validKeyInArray!0 (select (arr!19541 a!3186) j!159)))))

(declare-fun b!721087 () Bool)

(declare-fun res!483162 () Bool)

(assert (=> b!721087 (=> (not res!483162) (not e!404350))))

(assert (=> b!721087 (= res!483162 (and (= (size!19962 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19962 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19962 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721088 () Bool)

(declare-fun res!483158 () Bool)

(assert (=> b!721088 (=> (not res!483158) (not e!404348))))

(assert (=> b!721088 (= res!483158 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19541 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!319955 () SeekEntryResult!7141)

(declare-fun b!721089 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40834 (_ BitVec 32)) SeekEntryResult!7141)

(assert (=> b!721089 (= e!404351 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19541 a!3186) j!159) a!3186 mask!3328) lt!319955))))

(declare-fun b!721090 () Bool)

(declare-fun res!483153 () Bool)

(assert (=> b!721090 (=> (not res!483153) (not e!404350))))

(declare-fun arrayContainsKey!0 (array!40834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721090 (= res!483153 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721091 () Bool)

(assert (=> b!721091 (= e!404349 e!404348)))

(declare-fun res!483154 () Bool)

(assert (=> b!721091 (=> (not res!483154) (not e!404348))))

(assert (=> b!721091 (= res!483154 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19541 a!3186) j!159) mask!3328) (select (arr!19541 a!3186) j!159) a!3186 mask!3328) lt!319955))))

(assert (=> b!721091 (= lt!319955 (Intermediate!7141 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721092 () Bool)

(declare-fun res!483164 () Bool)

(assert (=> b!721092 (=> (not res!483164) (not e!404349))))

(assert (=> b!721092 (= res!483164 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19962 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19962 a!3186))))))

(assert (= (and start!64196 res!483160) b!721087))

(assert (= (and b!721087 res!483162) b!721086))

(assert (= (and b!721086 res!483157) b!721082))

(assert (= (and b!721082 res!483155) b!721090))

(assert (= (and b!721090 res!483153) b!721079))

(assert (= (and b!721079 res!483156) b!721083))

(assert (= (and b!721083 res!483163) b!721084))

(assert (= (and b!721084 res!483159) b!721092))

(assert (= (and b!721092 res!483164) b!721091))

(assert (= (and b!721091 res!483154) b!721088))

(assert (= (and b!721088 res!483158) b!721081))

(assert (= (and b!721081 c!79333) b!721089))

(assert (= (and b!721081 (not c!79333)) b!721085))

(assert (= (and b!721081 res!483161) b!721080))

(declare-fun m!676035 () Bool)

(assert (=> b!721083 m!676035))

(declare-fun m!676037 () Bool)

(assert (=> b!721088 m!676037))

(declare-fun m!676039 () Bool)

(assert (=> b!721091 m!676039))

(assert (=> b!721091 m!676039))

(declare-fun m!676041 () Bool)

(assert (=> b!721091 m!676041))

(assert (=> b!721091 m!676041))

(assert (=> b!721091 m!676039))

(declare-fun m!676043 () Bool)

(assert (=> b!721091 m!676043))

(assert (=> b!721085 m!676039))

(assert (=> b!721085 m!676039))

(declare-fun m!676045 () Bool)

(assert (=> b!721085 m!676045))

(declare-fun m!676047 () Bool)

(assert (=> b!721090 m!676047))

(declare-fun m!676049 () Bool)

(assert (=> b!721084 m!676049))

(declare-fun m!676051 () Bool)

(assert (=> start!64196 m!676051))

(declare-fun m!676053 () Bool)

(assert (=> start!64196 m!676053))

(declare-fun m!676055 () Bool)

(assert (=> b!721080 m!676055))

(declare-fun m!676057 () Bool)

(assert (=> b!721080 m!676057))

(assert (=> b!721080 m!676057))

(declare-fun m!676059 () Bool)

(assert (=> b!721080 m!676059))

(declare-fun m!676061 () Bool)

(assert (=> b!721082 m!676061))

(assert (=> b!721086 m!676039))

(assert (=> b!721086 m!676039))

(declare-fun m!676063 () Bool)

(assert (=> b!721086 m!676063))

(assert (=> b!721089 m!676039))

(assert (=> b!721089 m!676039))

(declare-fun m!676065 () Bool)

(assert (=> b!721089 m!676065))

(declare-fun m!676067 () Bool)

(assert (=> b!721079 m!676067))

(push 1)

(assert (not b!721080))

(assert (not b!721083))

(assert (not start!64196))

(assert (not b!721085))

(assert (not b!721091))

(assert (not b!721084))

(assert (not b!721082))

(assert (not b!721086))

(assert (not b!721090))

(assert (not b!721079))

(assert (not b!721089))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!721162 () Bool)

(declare-fun e!404401 () SeekEntryResult!7141)

(declare-fun e!404399 () SeekEntryResult!7141)

(assert (=> b!721162 (= e!404401 e!404399)))

(declare-fun c!79353 () Bool)

(declare-fun lt!319981 () (_ BitVec 64))

(assert (=> b!721162 (= c!79353 (or (= lt!319981 (select (arr!19541 a!3186) j!159)) (= (bvadd lt!319981 lt!319981) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721163 () Bool)

(declare-fun lt!319982 () SeekEntryResult!7141)

(assert (=> b!721163 (and (bvsge (index!30934 lt!319982) #b00000000000000000000000000000000) (bvslt (index!30934 lt!319982) (size!19962 a!3186)))))

(declare-fun e!404398 () Bool)

(assert (=> b!721163 (= e!404398 (= (select (arr!19541 a!3186) (index!30934 lt!319982)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!721164 () Bool)

(assert (=> b!721164 (= e!404401 (Intermediate!7141 true index!1321 x!1131))))

(declare-fun b!721165 () Bool)

(assert (=> b!721165 (and (bvsge (index!30934 lt!319982) #b00000000000000000000000000000000) (bvslt (index!30934 lt!319982) (size!19962 a!3186)))))

(declare-fun res!483201 () Bool)

(assert (=> b!721165 (= res!483201 (= (select (arr!19541 a!3186) (index!30934 lt!319982)) (select (arr!19541 a!3186) j!159)))))

(assert (=> b!721165 (=> res!483201 e!404398)))

(declare-fun e!404400 () Bool)

(assert (=> b!721165 (= e!404400 e!404398)))

(declare-fun b!721166 () Bool)

(assert (=> b!721166 (and (bvsge (index!30934 lt!319982) #b00000000000000000000000000000000) (bvslt (index!30934 lt!319982) (size!19962 a!3186)))))

(declare-fun res!483200 () Bool)

(assert (=> b!721166 (= res!483200 (= (select (arr!19541 a!3186) (index!30934 lt!319982)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!721166 (=> res!483200 e!404398)))

(declare-fun b!721167 () Bool)

(declare-fun e!404402 () Bool)

(assert (=> b!721167 (= e!404402 e!404400)))

(declare-fun res!483199 () Bool)

(assert (=> b!721167 (= res!483199 (and (is-Intermediate!7141 lt!319982) (not (undefined!7953 lt!319982)) (bvslt (x!61933 lt!319982) #b01111111111111111111111111111110) (bvsge (x!61933 lt!319982) #b00000000000000000000000000000000) (bvsge (x!61933 lt!319982) x!1131)))))

(assert (=> b!721167 (=> (not res!483199) (not e!404400))))

(declare-fun d!99191 () Bool)

(assert (=> d!99191 e!404402))

(declare-fun c!79352 () Bool)

(assert (=> d!99191 (= c!79352 (and (is-Intermediate!7141 lt!319982) (undefined!7953 lt!319982)))))

(assert (=> d!99191 (= lt!319982 e!404401)))

(declare-fun c!79354 () Bool)

(assert (=> d!99191 (= c!79354 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99191 (= lt!319981 (select (arr!19541 a!3186) index!1321))))

(assert (=> d!99191 (validMask!0 mask!3328)))

(assert (=> d!99191 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19541 a!3186) j!159) a!3186 mask!3328) lt!319982)))

(declare-fun b!721168 () Bool)

(assert (=> b!721168 (= e!404399 (Intermediate!7141 false index!1321 x!1131))))

(declare-fun b!721169 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721169 (= e!404399 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19541 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721170 () Bool)

(assert (=> b!721170 (= e!404402 (bvsge (x!61933 lt!319982) #b01111111111111111111111111111110))))

(assert (= (and d!99191 c!79354) b!721164))

(assert (= (and d!99191 (not c!79354)) b!721162))

(assert (= (and b!721162 c!79353) b!721168))

(assert (= (and b!721162 (not c!79353)) b!721169))

(assert (= (and d!99191 c!79352) b!721170))

(assert (= (and d!99191 (not c!79352)) b!721167))

(assert (= (and b!721167 res!483199) b!721165))

(assert (= (and b!721165 (not res!483201)) b!721166))

(assert (= (and b!721166 (not res!483200)) b!721163))

(declare-fun m!676095 () Bool)

(assert (=> b!721169 m!676095))

(assert (=> b!721169 m!676095))

(assert (=> b!721169 m!676039))

(declare-fun m!676097 () Bool)

(assert (=> b!721169 m!676097))

(declare-fun m!676099 () Bool)

(assert (=> b!721163 m!676099))

(declare-fun m!676101 () Bool)

(assert (=> d!99191 m!676101))

(assert (=> d!99191 m!676051))

(assert (=> b!721165 m!676099))

(assert (=> b!721166 m!676099))

(assert (=> b!721089 d!99191))

(declare-fun b!721193 () Bool)

(declare-fun e!404417 () Bool)

(declare-fun e!404419 () Bool)

(assert (=> b!721193 (= e!404417 e!404419)))

(declare-fun c!79363 () Bool)

(assert (=> b!721193 (= c!79363 (validKeyInArray!0 (select (arr!19541 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721194 () Bool)

(declare-fun call!34773 () Bool)

(assert (=> b!721194 (= e!404419 call!34773)))

(declare-fun b!721195 () Bool)

(assert (=> b!721195 (= e!404419 call!34773)))

(declare-fun d!99201 () Bool)

(declare-fun res!483208 () Bool)

(declare-fun e!404418 () Bool)

(assert (=> d!99201 (=> res!483208 e!404418)))

(assert (=> d!99201 (= res!483208 (bvsge #b00000000000000000000000000000000 (size!19962 a!3186)))))

(assert (=> d!99201 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13540) e!404418)))

(declare-fun bm!34770 () Bool)

(assert (=> bm!34770 (= call!34773 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79363 (Cons!13539 (select (arr!19541 a!3186) #b00000000000000000000000000000000) Nil!13540) Nil!13540)))))

(declare-fun b!721196 () Bool)

(assert (=> b!721196 (= e!404418 e!404417)))

(declare-fun res!483210 () Bool)

(assert (=> b!721196 (=> (not res!483210) (not e!404417))))

(declare-fun e!404420 () Bool)

(assert (=> b!721196 (= res!483210 (not e!404420))))

(declare-fun res!483209 () Bool)

(assert (=> b!721196 (=> (not res!483209) (not e!404420))))

(assert (=> b!721196 (= res!483209 (validKeyInArray!0 (select (arr!19541 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721197 () Bool)

(declare-fun contains!4043 (List!13543 (_ BitVec 64)) Bool)

(assert (=> b!721197 (= e!404420 (contains!4043 Nil!13540 (select (arr!19541 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99201 (not res!483208)) b!721196))

(assert (= (and b!721196 res!483209) b!721197))

(assert (= (and b!721196 res!483210) b!721193))

(assert (= (and b!721193 c!79363) b!721195))

(assert (= (and b!721193 (not c!79363)) b!721194))

(assert (= (or b!721195 b!721194) bm!34770))

(declare-fun m!676103 () Bool)

(assert (=> b!721193 m!676103))

(assert (=> b!721193 m!676103))

(declare-fun m!676105 () Bool)

(assert (=> b!721193 m!676105))

(assert (=> bm!34770 m!676103))

(declare-fun m!676107 () Bool)

(assert (=> bm!34770 m!676107))

(assert (=> b!721196 m!676103))

(assert (=> b!721196 m!676103))

(assert (=> b!721196 m!676105))

(assert (=> b!721197 m!676103))

(assert (=> b!721197 m!676103))

(declare-fun m!676109 () Bool)

(assert (=> b!721197 m!676109))

(assert (=> b!721084 d!99201))

(declare-fun d!99203 () Bool)

(declare-fun res!483215 () Bool)

(declare-fun e!404432 () Bool)

(assert (=> d!99203 (=> res!483215 e!404432)))

(assert (=> d!99203 (= res!483215 (bvsge #b00000000000000000000000000000000 (size!19962 a!3186)))))

(assert (=> d!99203 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!404432)))

(declare-fun b!721212 () Bool)

(declare-fun e!404430 () Bool)

(assert (=> b!721212 (= e!404432 e!404430)))

(declare-fun c!79369 () Bool)

(assert (=> b!721212 (= c!79369 (validKeyInArray!0 (select (arr!19541 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721213 () Bool)

(declare-fun e!404431 () Bool)

(declare-fun call!34776 () Bool)

(assert (=> b!721213 (= e!404431 call!34776)))

(declare-fun bm!34773 () Bool)

(assert (=> bm!34773 (= call!34776 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!721214 () Bool)

(assert (=> b!721214 (= e!404430 call!34776)))

(declare-fun b!721215 () Bool)

(assert (=> b!721215 (= e!404430 e!404431)))

(declare-fun lt!320001 () (_ BitVec 64))

(assert (=> b!721215 (= lt!320001 (select (arr!19541 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24676 0))(
  ( (Unit!24677) )
))
(declare-fun lt!320002 () Unit!24676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40834 (_ BitVec 64) (_ BitVec 32)) Unit!24676)

(assert (=> b!721215 (= lt!320002 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!320001 #b00000000000000000000000000000000))))

(assert (=> b!721215 (arrayContainsKey!0 a!3186 lt!320001 #b00000000000000000000000000000000)))

(declare-fun lt!320000 () Unit!24676)

(assert (=> b!721215 (= lt!320000 lt!320002)))

(declare-fun res!483216 () Bool)

(assert (=> b!721215 (= res!483216 (= (seekEntryOrOpen!0 (select (arr!19541 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7141 #b00000000000000000000000000000000)))))

(assert (=> b!721215 (=> (not res!483216) (not e!404431))))

(assert (= (and d!99203 (not res!483215)) b!721212))

(assert (= (and b!721212 c!79369) b!721215))

(assert (= (and b!721212 (not c!79369)) b!721214))

(assert (= (and b!721215 res!483216) b!721213))

(assert (= (or b!721213 b!721214) bm!34773))

(assert (=> b!721212 m!676103))

(assert (=> b!721212 m!676103))

(assert (=> b!721212 m!676105))

(declare-fun m!676125 () Bool)

(assert (=> bm!34773 m!676125))

(assert (=> b!721215 m!676103))

(declare-fun m!676127 () Bool)

(assert (=> b!721215 m!676127))

(declare-fun m!676129 () Bool)

(assert (=> b!721215 m!676129))

(assert (=> b!721215 m!676103))

(declare-fun m!676131 () Bool)

(assert (=> b!721215 m!676131))

(assert (=> b!721083 d!99203))

(declare-fun d!99217 () Bool)

(assert (=> d!99217 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64196 d!99217))

(declare-fun d!99219 () Bool)

(assert (=> d!99219 (= (array_inv!15337 a!3186) (bvsge (size!19962 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64196 d!99219))

(declare-fun b!721295 () Bool)

(declare-fun e!404477 () SeekEntryResult!7141)

(assert (=> b!721295 (= e!404477 (Found!7141 index!1321))))

(declare-fun b!721296 () Bool)

(declare-fun e!404478 () SeekEntryResult!7141)

(assert (=> b!721296 (= e!404478 (MissingVacant!7141 resIntermediateIndex!5))))

(declare-fun lt!320033 () SeekEntryResult!7141)

(declare-fun d!99221 () Bool)

(assert (=> d!99221 (and (or (is-Undefined!7141 lt!320033) (not (is-Found!7141 lt!320033)) (and (bvsge (index!30933 lt!320033) #b00000000000000000000000000000000) (bvslt (index!30933 lt!320033) (size!19962 a!3186)))) (or (is-Undefined!7141 lt!320033) (is-Found!7141 lt!320033) (not (is-MissingVacant!7141 lt!320033)) (not (= (index!30935 lt!320033) resIntermediateIndex!5)) (and (bvsge (index!30935 lt!320033) #b00000000000000000000000000000000) (bvslt (index!30935 lt!320033) (size!19962 a!3186)))) (or (is-Undefined!7141 lt!320033) (ite (is-Found!7141 lt!320033) (= (select (arr!19541 a!3186) (index!30933 lt!320033)) (select (arr!19541 a!3186) j!159)) (and (is-MissingVacant!7141 lt!320033) (= (index!30935 lt!320033) resIntermediateIndex!5) (= (select (arr!19541 a!3186) (index!30935 lt!320033)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!404479 () SeekEntryResult!7141)

(assert (=> d!99221 (= lt!320033 e!404479)))

(declare-fun c!79404 () Bool)

(assert (=> d!99221 (= c!79404 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!320032 () (_ BitVec 64))

(assert (=> d!99221 (= lt!320032 (select (arr!19541 a!3186) index!1321))))

(assert (=> d!99221 (validMask!0 mask!3328)))

(assert (=> d!99221 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19541 a!3186) j!159) a!3186 mask!3328) lt!320033)))

(declare-fun b!721297 () Bool)

(assert (=> b!721297 (= e!404479 Undefined!7141)))

(declare-fun b!721298 () Bool)

(declare-fun c!79403 () Bool)

(assert (=> b!721298 (= c!79403 (= lt!320032 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!721298 (= e!404477 e!404478)))

(declare-fun b!721299 () Bool)

(assert (=> b!721299 (= e!404478 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19541 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721300 () Bool)

(assert (=> b!721300 (= e!404479 e!404477)))

(declare-fun c!79402 () Bool)

(assert (=> b!721300 (= c!79402 (= lt!320032 (select (arr!19541 a!3186) j!159)))))

(assert (= (and d!99221 c!79404) b!721297))

(assert (= (and d!99221 (not c!79404)) b!721300))

(assert (= (and b!721300 c!79402) b!721295))

(assert (= (and b!721300 (not c!79402)) b!721298))

(assert (= (and b!721298 c!79403) b!721296))

(assert (= (and b!721298 (not c!79403)) b!721299))

(declare-fun m!676155 () Bool)

(assert (=> d!99221 m!676155))

(declare-fun m!676157 () Bool)

(assert (=> d!99221 m!676157))

(assert (=> d!99221 m!676101))

(assert (=> d!99221 m!676051))

(assert (=> b!721299 m!676095))

(assert (=> b!721299 m!676095))

(assert (=> b!721299 m!676039))

(declare-fun m!676159 () Bool)

(assert (=> b!721299 m!676159))

(assert (=> b!721085 d!99221))

(declare-fun d!99229 () Bool)

(declare-fun lt!320045 () (_ BitVec 32))

(declare-fun lt!320044 () (_ BitVec 32))

(assert (=> d!99229 (= lt!320045 (bvmul (bvxor lt!320044 (bvlshr lt!320044 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99229 (= lt!320044 ((_ extract 31 0) (bvand (bvxor (select (store (arr!19541 a!3186) i!1173 k!2102) j!159) (bvlshr (select (store (arr!19541 a!3186) i!1173 k!2102) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99229 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!483236 (let ((h!14593 ((_ extract 31 0) (bvand (bvxor (select (store (arr!19541 a!3186) i!1173 k!2102) j!159) (bvlshr (select (store (arr!19541 a!3186) i!1173 k!2102) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61941 (bvmul (bvxor h!14593 (bvlshr h!14593 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61941 (bvlshr x!61941 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!483236 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!483236 #b00000000000000000000000000000000))))))

(assert (=> d!99229 (= (toIndex!0 (select (store (arr!19541 a!3186) i!1173 k!2102) j!159) mask!3328) (bvand (bvxor lt!320045 (bvlshr lt!320045 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!721080 d!99229))

(declare-fun b!721378 () Bool)

(declare-fun c!79435 () Bool)

(declare-fun lt!320067 () (_ BitVec 64))

(assert (=> b!721378 (= c!79435 (= lt!320067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404530 () SeekEntryResult!7141)

(declare-fun e!404528 () SeekEntryResult!7141)

(assert (=> b!721378 (= e!404530 e!404528)))

(declare-fun b!721379 () Bool)

(declare-fun e!404529 () SeekEntryResult!7141)

(assert (=> b!721379 (= e!404529 Undefined!7141)))

(declare-fun b!721380 () Bool)

(assert (=> b!721380 (= e!404529 e!404530)))

(declare-fun lt!320068 () SeekEntryResult!7141)

(assert (=> b!721380 (= lt!320067 (select (arr!19541 a!3186) (index!30934 lt!320068)))))

(declare-fun c!79433 () Bool)

(assert (=> b!721380 (= c!79433 (= lt!320067 k!2102))))

(declare-fun b!721381 () Bool)

(assert (=> b!721381 (= e!404528 (MissingZero!7141 (index!30934 lt!320068)))))

(declare-fun b!721382 () Bool)

(assert (=> b!721382 (= e!404528 (seekKeyOrZeroReturnVacant!0 (x!61933 lt!320068) (index!30934 lt!320068) (index!30934 lt!320068) k!2102 a!3186 mask!3328))))

(declare-fun d!99241 () Bool)

(declare-fun lt!320069 () SeekEntryResult!7141)

(assert (=> d!99241 (and (or (is-Undefined!7141 lt!320069) (not (is-Found!7141 lt!320069)) (and (bvsge (index!30933 lt!320069) #b00000000000000000000000000000000) (bvslt (index!30933 lt!320069) (size!19962 a!3186)))) (or (is-Undefined!7141 lt!320069) (is-Found!7141 lt!320069) (not (is-MissingZero!7141 lt!320069)) (and (bvsge (index!30932 lt!320069) #b00000000000000000000000000000000) (bvslt (index!30932 lt!320069) (size!19962 a!3186)))) (or (is-Undefined!7141 lt!320069) (is-Found!7141 lt!320069) (is-MissingZero!7141 lt!320069) (not (is-MissingVacant!7141 lt!320069)) (and (bvsge (index!30935 lt!320069) #b00000000000000000000000000000000) (bvslt (index!30935 lt!320069) (size!19962 a!3186)))) (or (is-Undefined!7141 lt!320069) (ite (is-Found!7141 lt!320069) (= (select (arr!19541 a!3186) (index!30933 lt!320069)) k!2102) (ite (is-MissingZero!7141 lt!320069) (= (select (arr!19541 a!3186) (index!30932 lt!320069)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7141 lt!320069) (= (select (arr!19541 a!3186) (index!30935 lt!320069)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99241 (= lt!320069 e!404529)))

(declare-fun c!79434 () Bool)

(assert (=> d!99241 (= c!79434 (and (is-Intermediate!7141 lt!320068) (undefined!7953 lt!320068)))))

(assert (=> d!99241 (= lt!320068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!99241 (validMask!0 mask!3328)))

(assert (=> d!99241 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!320069)))

(declare-fun b!721383 () Bool)

(assert (=> b!721383 (= e!404530 (Found!7141 (index!30934 lt!320068)))))

(assert (= (and d!99241 c!79434) b!721379))

(assert (= (and d!99241 (not c!79434)) b!721380))

(assert (= (and b!721380 c!79433) b!721383))

(assert (= (and b!721380 (not c!79433)) b!721378))

(assert (= (and b!721378 c!79435) b!721381))

(assert (= (and b!721378 (not c!79435)) b!721382))

(declare-fun m!676203 () Bool)

(assert (=> b!721380 m!676203))

(declare-fun m!676205 () Bool)

(assert (=> b!721382 m!676205))

(declare-fun m!676207 () Bool)

(assert (=> d!99241 m!676207))

(declare-fun m!676209 () Bool)

(assert (=> d!99241 m!676209))

(declare-fun m!676211 () Bool)

(assert (=> d!99241 m!676211))

(assert (=> d!99241 m!676051))

(declare-fun m!676213 () Bool)

(assert (=> d!99241 m!676213))

(assert (=> d!99241 m!676207))

(declare-fun m!676215 () Bool)

(assert (=> d!99241 m!676215))

(assert (=> b!721079 d!99241))

(declare-fun d!99247 () Bool)

(declare-fun res!483259 () Bool)

(declare-fun e!404535 () Bool)

(assert (=> d!99247 (=> res!483259 e!404535)))

(assert (=> d!99247 (= res!483259 (= (select (arr!19541 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!99247 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!404535)))

(declare-fun b!721388 () Bool)

(declare-fun e!404536 () Bool)

(assert (=> b!721388 (= e!404535 e!404536)))

(declare-fun res!483260 () Bool)

(assert (=> b!721388 (=> (not res!483260) (not e!404536))))

(assert (=> b!721388 (= res!483260 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19962 a!3186)))))

(declare-fun b!721389 () Bool)

(assert (=> b!721389 (= e!404536 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99247 (not res!483259)) b!721388))

(assert (= (and b!721388 res!483260) b!721389))

(assert (=> d!99247 m!676103))

(declare-fun m!676217 () Bool)

(assert (=> b!721389 m!676217))

(assert (=> b!721090 d!99247))

(declare-fun b!721390 () Bool)

(declare-fun e!404540 () SeekEntryResult!7141)

(declare-fun e!404538 () SeekEntryResult!7141)

(assert (=> b!721390 (= e!404540 e!404538)))

(declare-fun lt!320070 () (_ BitVec 64))

(declare-fun c!79437 () Bool)

(assert (=> b!721390 (= c!79437 (or (= lt!320070 (select (arr!19541 a!3186) j!159)) (= (bvadd lt!320070 lt!320070) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721391 () Bool)

(declare-fun lt!320071 () SeekEntryResult!7141)

(assert (=> b!721391 (and (bvsge (index!30934 lt!320071) #b00000000000000000000000000000000) (bvslt (index!30934 lt!320071) (size!19962 a!3186)))))

(declare-fun e!404537 () Bool)

(assert (=> b!721391 (= e!404537 (= (select (arr!19541 a!3186) (index!30934 lt!320071)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!721392 () Bool)

(assert (=> b!721392 (= e!404540 (Intermediate!7141 true (toIndex!0 (select (arr!19541 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!721393 () Bool)

(assert (=> b!721393 (and (bvsge (index!30934 lt!320071) #b00000000000000000000000000000000) (bvslt (index!30934 lt!320071) (size!19962 a!3186)))))

(declare-fun res!483263 () Bool)

(assert (=> b!721393 (= res!483263 (= (select (arr!19541 a!3186) (index!30934 lt!320071)) (select (arr!19541 a!3186) j!159)))))

(assert (=> b!721393 (=> res!483263 e!404537)))

(declare-fun e!404539 () Bool)

(assert (=> b!721393 (= e!404539 e!404537)))

(declare-fun b!721394 () Bool)

(assert (=> b!721394 (and (bvsge (index!30934 lt!320071) #b00000000000000000000000000000000) (bvslt (index!30934 lt!320071) (size!19962 a!3186)))))

(declare-fun res!483262 () Bool)

(assert (=> b!721394 (= res!483262 (= (select (arr!19541 a!3186) (index!30934 lt!320071)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!721394 (=> res!483262 e!404537)))

(declare-fun b!721395 () Bool)

(declare-fun e!404541 () Bool)

(assert (=> b!721395 (= e!404541 e!404539)))

(declare-fun res!483261 () Bool)

(assert (=> b!721395 (= res!483261 (and (is-Intermediate!7141 lt!320071) (not (undefined!7953 lt!320071)) (bvslt (x!61933 lt!320071) #b01111111111111111111111111111110) (bvsge (x!61933 lt!320071) #b00000000000000000000000000000000) (bvsge (x!61933 lt!320071) #b00000000000000000000000000000000)))))

(assert (=> b!721395 (=> (not res!483261) (not e!404539))))

(declare-fun d!99249 () Bool)

(assert (=> d!99249 e!404541))

(declare-fun c!79436 () Bool)

(assert (=> d!99249 (= c!79436 (and (is-Intermediate!7141 lt!320071) (undefined!7953 lt!320071)))))

(assert (=> d!99249 (= lt!320071 e!404540)))

(declare-fun c!79438 () Bool)

(assert (=> d!99249 (= c!79438 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99249 (= lt!320070 (select (arr!19541 a!3186) (toIndex!0 (select (arr!19541 a!3186) j!159) mask!3328)))))

(assert (=> d!99249 (validMask!0 mask!3328)))

(assert (=> d!99249 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19541 a!3186) j!159) mask!3328) (select (arr!19541 a!3186) j!159) a!3186 mask!3328) lt!320071)))

(declare-fun b!721396 () Bool)

(assert (=> b!721396 (= e!404538 (Intermediate!7141 false (toIndex!0 (select (arr!19541 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!721397 () Bool)

(assert (=> b!721397 (= e!404538 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19541 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19541 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721398 () Bool)

(assert (=> b!721398 (= e!404541 (bvsge (x!61933 lt!320071) #b01111111111111111111111111111110))))

(assert (= (and d!99249 c!79438) b!721392))

(assert (= (and d!99249 (not c!79438)) b!721390))

(assert (= (and b!721390 c!79437) b!721396))

(assert (= (and b!721390 (not c!79437)) b!721397))

(assert (= (and d!99249 c!79436) b!721398))

(assert (= (and d!99249 (not c!79436)) b!721395))

(assert (= (and b!721395 res!483261) b!721393))

(assert (= (and b!721393 (not res!483263)) b!721394))

(assert (= (and b!721394 (not res!483262)) b!721391))

(assert (=> b!721397 m!676041))

(declare-fun m!676219 () Bool)

(assert (=> b!721397 m!676219))

(assert (=> b!721397 m!676219))

(assert (=> b!721397 m!676039))

(declare-fun m!676221 () Bool)

(assert (=> b!721397 m!676221))

(declare-fun m!676223 () Bool)

(assert (=> b!721391 m!676223))

(assert (=> d!99249 m!676041))

(declare-fun m!676225 () Bool)

(assert (=> d!99249 m!676225))

(assert (=> d!99249 m!676051))

(assert (=> b!721393 m!676223))

(assert (=> b!721394 m!676223))

(assert (=> b!721091 d!99249))

(declare-fun d!99255 () Bool)

(declare-fun lt!320075 () (_ BitVec 32))

(declare-fun lt!320074 () (_ BitVec 32))

(assert (=> d!99255 (= lt!320075 (bvmul (bvxor lt!320074 (bvlshr lt!320074 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99255 (= lt!320074 ((_ extract 31 0) (bvand (bvxor (select (arr!19541 a!3186) j!159) (bvlshr (select (arr!19541 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99255 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!483236 (let ((h!14593 ((_ extract 31 0) (bvand (bvxor (select (arr!19541 a!3186) j!159) (bvlshr (select (arr!19541 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61941 (bvmul (bvxor h!14593 (bvlshr h!14593 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61941 (bvlshr x!61941 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!483236 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!483236 #b00000000000000000000000000000000))))))

(assert (=> d!99255 (= (toIndex!0 (select (arr!19541 a!3186) j!159) mask!3328) (bvand (bvxor lt!320075 (bvlshr lt!320075 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!721091 d!99255))

(declare-fun d!99257 () Bool)

(assert (=> d!99257 (= (validKeyInArray!0 (select (arr!19541 a!3186) j!159)) (and (not (= (select (arr!19541 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19541 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!721086 d!99257))

(declare-fun d!99259 () Bool)

(assert (=> d!99259 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!721082 d!99259))

(push 1)

(assert (not bm!34770))

(assert (not b!721193))

(assert (not b!721382))

(assert (not bm!34773))

(assert (not b!721389))

(assert (not b!721169))

(assert (not d!99221))

(assert (not d!99191))

(assert (not b!721212))

(assert (not b!721397))

(assert (not b!721196))

(assert (not d!99241))

(assert (not d!99249))

(assert (not b!721197))

(assert (not b!721299))

(assert (not b!721215))

(check-sat)

(pop 1)

(push 1)

(check-sat)

