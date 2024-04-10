; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49528 () Bool)

(assert start!49528)

(declare-fun res!339260 () Bool)

(declare-fun e!315100 () Bool)

(assert (=> start!49528 (=> (not res!339260) (not e!315100))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49528 (= res!339260 (validMask!0 mask!3216))))

(assert (=> start!49528 e!315100))

(assert (=> start!49528 true))

(declare-datatypes ((array!34398 0))(
  ( (array!34399 (arr!16529 (Array (_ BitVec 32) (_ BitVec 64))) (size!16893 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34398)

(declare-fun array_inv!12325 (array!34398) Bool)

(assert (=> start!49528 (array_inv!12325 a!3154)))

(declare-fun b!545150 () Bool)

(declare-fun res!339257 () Bool)

(assert (=> b!545150 (=> (not res!339257) (not e!315100))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545150 (= res!339257 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545151 () Bool)

(declare-fun res!339256 () Bool)

(assert (=> b!545151 (=> (not res!339256) (not e!315100))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545151 (= res!339256 (and (= (size!16893 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16893 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16893 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545152 () Bool)

(declare-fun res!339265 () Bool)

(assert (=> b!545152 (=> (not res!339265) (not e!315100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545152 (= res!339265 (validKeyInArray!0 (select (arr!16529 a!3154) j!147)))))

(declare-fun b!545153 () Bool)

(declare-fun res!339255 () Bool)

(assert (=> b!545153 (=> (not res!339255) (not e!315100))))

(assert (=> b!545153 (= res!339255 (validKeyInArray!0 k!1998))))

(declare-fun b!545154 () Bool)

(declare-fun res!339259 () Bool)

(declare-fun e!315101 () Bool)

(assert (=> b!545154 (=> (not res!339259) (not e!315101))))

(declare-datatypes ((SeekEntryResult!4987 0))(
  ( (MissingZero!4987 (index!22172 (_ BitVec 32))) (Found!4987 (index!22173 (_ BitVec 32))) (Intermediate!4987 (undefined!5799 Bool) (index!22174 (_ BitVec 32)) (x!51090 (_ BitVec 32))) (Undefined!4987) (MissingVacant!4987 (index!22175 (_ BitVec 32))) )
))
(declare-fun lt!248714 () SeekEntryResult!4987)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34398 (_ BitVec 32)) SeekEntryResult!4987)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545154 (= res!339259 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16529 a!3154) j!147) mask!3216) (select (arr!16529 a!3154) j!147) a!3154 mask!3216) lt!248714))))

(declare-fun b!545155 () Bool)

(declare-fun res!339263 () Bool)

(declare-fun e!315098 () Bool)

(assert (=> b!545155 (=> (not res!339263) (not e!315098))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545155 (= res!339263 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16893 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16893 a!3154)) (= (select (arr!16529 a!3154) resIndex!32) (select (arr!16529 a!3154) j!147))))))

(declare-fun b!545156 () Bool)

(declare-fun e!315102 () Bool)

(declare-fun lt!248716 () (_ BitVec 32))

(declare-fun lt!248713 () SeekEntryResult!4987)

(assert (=> b!545156 (= e!315102 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248716 (select (arr!16529 a!3154) j!147) a!3154 mask!3216) lt!248713)))))

(declare-fun b!545157 () Bool)

(declare-fun res!339262 () Bool)

(assert (=> b!545157 (=> (not res!339262) (not e!315098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34398 (_ BitVec 32)) Bool)

(assert (=> b!545157 (= res!339262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545158 () Bool)

(assert (=> b!545158 (= e!315098 e!315101)))

(declare-fun res!339254 () Bool)

(assert (=> b!545158 (=> (not res!339254) (not e!315101))))

(assert (=> b!545158 (= res!339254 (= lt!248714 lt!248713))))

(assert (=> b!545158 (= lt!248713 (Intermediate!4987 false resIndex!32 resX!32))))

(assert (=> b!545158 (= lt!248714 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16529 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545159 () Bool)

(declare-fun res!339258 () Bool)

(assert (=> b!545159 (=> (not res!339258) (not e!315098))))

(declare-datatypes ((List!10648 0))(
  ( (Nil!10645) (Cons!10644 (h!11605 (_ BitVec 64)) (t!16876 List!10648)) )
))
(declare-fun arrayNoDuplicates!0 (array!34398 (_ BitVec 32) List!10648) Bool)

(assert (=> b!545159 (= res!339258 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10645))))

(declare-fun b!545160 () Bool)

(assert (=> b!545160 (= e!315101 e!315102)))

(declare-fun res!339261 () Bool)

(assert (=> b!545160 (=> (not res!339261) (not e!315102))))

(assert (=> b!545160 (= res!339261 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248716 #b00000000000000000000000000000000) (bvslt lt!248716 (size!16893 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545160 (= lt!248716 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545161 () Bool)

(assert (=> b!545161 (= e!315100 e!315098)))

(declare-fun res!339266 () Bool)

(assert (=> b!545161 (=> (not res!339266) (not e!315098))))

(declare-fun lt!248715 () SeekEntryResult!4987)

(assert (=> b!545161 (= res!339266 (or (= lt!248715 (MissingZero!4987 i!1153)) (= lt!248715 (MissingVacant!4987 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34398 (_ BitVec 32)) SeekEntryResult!4987)

(assert (=> b!545161 (= lt!248715 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!545162 () Bool)

(declare-fun res!339264 () Bool)

(assert (=> b!545162 (=> (not res!339264) (not e!315101))))

(assert (=> b!545162 (= res!339264 (and (not (= (select (arr!16529 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16529 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16529 a!3154) index!1177) (select (arr!16529 a!3154) j!147)))))))

(assert (= (and start!49528 res!339260) b!545151))

(assert (= (and b!545151 res!339256) b!545152))

(assert (= (and b!545152 res!339265) b!545153))

(assert (= (and b!545153 res!339255) b!545150))

(assert (= (and b!545150 res!339257) b!545161))

(assert (= (and b!545161 res!339266) b!545157))

(assert (= (and b!545157 res!339262) b!545159))

(assert (= (and b!545159 res!339258) b!545155))

(assert (= (and b!545155 res!339263) b!545158))

(assert (= (and b!545158 res!339254) b!545154))

(assert (= (and b!545154 res!339259) b!545162))

(assert (= (and b!545162 res!339264) b!545160))

(assert (= (and b!545160 res!339261) b!545156))

(declare-fun m!522847 () Bool)

(assert (=> b!545157 m!522847))

(declare-fun m!522849 () Bool)

(assert (=> b!545161 m!522849))

(declare-fun m!522851 () Bool)

(assert (=> b!545162 m!522851))

(declare-fun m!522853 () Bool)

(assert (=> b!545162 m!522853))

(assert (=> b!545152 m!522853))

(assert (=> b!545152 m!522853))

(declare-fun m!522855 () Bool)

(assert (=> b!545152 m!522855))

(declare-fun m!522857 () Bool)

(assert (=> b!545150 m!522857))

(declare-fun m!522859 () Bool)

(assert (=> b!545159 m!522859))

(declare-fun m!522861 () Bool)

(assert (=> start!49528 m!522861))

(declare-fun m!522863 () Bool)

(assert (=> start!49528 m!522863))

(declare-fun m!522865 () Bool)

(assert (=> b!545155 m!522865))

(assert (=> b!545155 m!522853))

(assert (=> b!545158 m!522853))

(assert (=> b!545158 m!522853))

(declare-fun m!522867 () Bool)

(assert (=> b!545158 m!522867))

(declare-fun m!522869 () Bool)

(assert (=> b!545153 m!522869))

(assert (=> b!545154 m!522853))

(assert (=> b!545154 m!522853))

(declare-fun m!522871 () Bool)

(assert (=> b!545154 m!522871))

(assert (=> b!545154 m!522871))

(assert (=> b!545154 m!522853))

(declare-fun m!522873 () Bool)

(assert (=> b!545154 m!522873))

(assert (=> b!545156 m!522853))

(assert (=> b!545156 m!522853))

(declare-fun m!522875 () Bool)

(assert (=> b!545156 m!522875))

(declare-fun m!522877 () Bool)

(assert (=> b!545160 m!522877))

(push 1)

(assert (not b!545161))

(assert (not b!545153))

(assert (not b!545158))

(assert (not b!545152))

(assert (not b!545156))

(assert (not b!545160))

(assert (not b!545154))

(assert (not b!545157))

(assert (not b!545150))

(assert (not start!49528))

(assert (not b!545159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!32114 () Bool)

(declare-fun call!32117 () Bool)

(assert (=> bm!32114 (= call!32117 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!545204 () Bool)

(declare-fun e!315132 () Bool)

(assert (=> b!545204 (= e!315132 call!32117)))

(declare-fun b!545205 () Bool)

(declare-fun e!315131 () Bool)

(assert (=> b!545205 (= e!315132 e!315131)))

(declare-fun lt!248735 () (_ BitVec 64))

(assert (=> b!545205 (= lt!248735 (select (arr!16529 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16916 0))(
  ( (Unit!16917) )
))
(declare-fun lt!248736 () Unit!16916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34398 (_ BitVec 64) (_ BitVec 32)) Unit!16916)

(assert (=> b!545205 (= lt!248736 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!248735 #b00000000000000000000000000000000))))

(assert (=> b!545205 (arrayContainsKey!0 a!3154 lt!248735 #b00000000000000000000000000000000)))

(declare-fun lt!248737 () Unit!16916)

(assert (=> b!545205 (= lt!248737 lt!248736)))

(declare-fun res!339281 () Bool)

(assert (=> b!545205 (= res!339281 (= (seekEntryOrOpen!0 (select (arr!16529 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4987 #b00000000000000000000000000000000)))))

(assert (=> b!545205 (=> (not res!339281) (not e!315131))))

(declare-fun d!82177 () Bool)

(declare-fun res!339280 () Bool)

(declare-fun e!315130 () Bool)

(assert (=> d!82177 (=> res!339280 e!315130)))

(assert (=> d!82177 (= res!339280 (bvsge #b00000000000000000000000000000000 (size!16893 a!3154)))))

(assert (=> d!82177 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!315130)))

(declare-fun b!545206 () Bool)

(assert (=> b!545206 (= e!315131 call!32117)))

(declare-fun b!545207 () Bool)

(assert (=> b!545207 (= e!315130 e!315132)))

(declare-fun c!63287 () Bool)

(assert (=> b!545207 (= c!63287 (validKeyInArray!0 (select (arr!16529 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82177 (not res!339280)) b!545207))

(assert (= (and b!545207 c!63287) b!545205))

(assert (= (and b!545207 (not c!63287)) b!545204))

(assert (= (and b!545205 res!339281) b!545206))

(assert (= (or b!545206 b!545204) bm!32114))

(declare-fun m!522903 () Bool)

(assert (=> bm!32114 m!522903))

(declare-fun m!522905 () Bool)

(assert (=> b!545205 m!522905))

(declare-fun m!522907 () Bool)

(assert (=> b!545205 m!522907))

(declare-fun m!522909 () Bool)

(assert (=> b!545205 m!522909))

(assert (=> b!545205 m!522905))

(declare-fun m!522911 () Bool)

(assert (=> b!545205 m!522911))

(assert (=> b!545207 m!522905))

(assert (=> b!545207 m!522905))

(declare-fun m!522913 () Bool)

(assert (=> b!545207 m!522913))

(assert (=> b!545157 d!82177))

(declare-fun d!82181 () Bool)

(assert (=> d!82181 (= (validKeyInArray!0 (select (arr!16529 a!3154) j!147)) (and (not (= (select (arr!16529 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16529 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!545152 d!82181))

(declare-fun d!82183 () Bool)

(assert (=> d!82183 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!545153 d!82183))

(declare-fun d!82185 () Bool)

(assert (=> d!82185 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!49528 d!82185))

(declare-fun d!82195 () Bool)

(assert (=> d!82195 (= (array_inv!12325 a!3154) (bvsge (size!16893 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!49528 d!82195))

(declare-fun b!545310 () Bool)

(declare-fun e!315197 () SeekEntryResult!4987)

(assert (=> b!545310 (= e!315197 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16529 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!82197 () Bool)

(declare-fun e!315198 () Bool)

(assert (=> d!82197 e!315198))

(declare-fun c!63318 () Bool)

(declare-fun lt!248765 () SeekEntryResult!4987)

(assert (=> d!82197 (= c!63318 (and (is-Intermediate!4987 lt!248765) (undefined!5799 lt!248765)))))

(declare-fun e!315196 () SeekEntryResult!4987)

(assert (=> d!82197 (= lt!248765 e!315196)))

(declare-fun c!63320 () Bool)

(assert (=> d!82197 (= c!63320 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!248766 () (_ BitVec 64))

(assert (=> d!82197 (= lt!248766 (select (arr!16529 a!3154) index!1177))))

(assert (=> d!82197 (validMask!0 mask!3216)))

(assert (=> d!82197 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16529 a!3154) j!147) a!3154 mask!3216) lt!248765)))

(declare-fun b!545311 () Bool)

(assert (=> b!545311 (= e!315197 (Intermediate!4987 false index!1177 x!1030))))

(declare-fun b!545312 () Bool)

(assert (=> b!545312 (and (bvsge (index!22174 lt!248765) #b00000000000000000000000000000000) (bvslt (index!22174 lt!248765) (size!16893 a!3154)))))

(declare-fun e!315199 () Bool)

(assert (=> b!545312 (= e!315199 (= (select (arr!16529 a!3154) (index!22174 lt!248765)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545313 () Bool)

(assert (=> b!545313 (= e!315198 (bvsge (x!51090 lt!248765) #b01111111111111111111111111111110))))

(declare-fun b!545314 () Bool)

(assert (=> b!545314 (and (bvsge (index!22174 lt!248765) #b00000000000000000000000000000000) (bvslt (index!22174 lt!248765) (size!16893 a!3154)))))

(declare-fun res!339327 () Bool)

(assert (=> b!545314 (= res!339327 (= (select (arr!16529 a!3154) (index!22174 lt!248765)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545314 (=> res!339327 e!315199)))

(declare-fun b!545315 () Bool)

(assert (=> b!545315 (and (bvsge (index!22174 lt!248765) #b00000000000000000000000000000000) (bvslt (index!22174 lt!248765) (size!16893 a!3154)))))

(declare-fun res!339326 () Bool)

(assert (=> b!545315 (= res!339326 (= (select (arr!16529 a!3154) (index!22174 lt!248765)) (select (arr!16529 a!3154) j!147)))))

(assert (=> b!545315 (=> res!339326 e!315199)))

(declare-fun e!315200 () Bool)

(assert (=> b!545315 (= e!315200 e!315199)))

(declare-fun b!545316 () Bool)

(assert (=> b!545316 (= e!315196 (Intermediate!4987 true index!1177 x!1030))))

(declare-fun b!545317 () Bool)

(assert (=> b!545317 (= e!315196 e!315197)))

(declare-fun c!63319 () Bool)

(assert (=> b!545317 (= c!63319 (or (= lt!248766 (select (arr!16529 a!3154) j!147)) (= (bvadd lt!248766 lt!248766) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!545318 () Bool)

(assert (=> b!545318 (= e!315198 e!315200)))

(declare-fun res!339325 () Bool)

(assert (=> b!545318 (= res!339325 (and (is-Intermediate!4987 lt!248765) (not (undefined!5799 lt!248765)) (bvslt (x!51090 lt!248765) #b01111111111111111111111111111110) (bvsge (x!51090 lt!248765) #b00000000000000000000000000000000) (bvsge (x!51090 lt!248765) x!1030)))))

(assert (=> b!545318 (=> (not res!339325) (not e!315200))))

(assert (= (and d!82197 c!63320) b!545316))

(assert (= (and d!82197 (not c!63320)) b!545317))

(assert (= (and b!545317 c!63319) b!545311))

(assert (= (and b!545317 (not c!63319)) b!545310))

(assert (= (and d!82197 c!63318) b!545313))

(assert (= (and d!82197 (not c!63318)) b!545318))

(assert (= (and b!545318 res!339325) b!545315))

(assert (= (and b!545315 (not res!339326)) b!545314))

(assert (= (and b!545314 (not res!339327)) b!545312))

(declare-fun m!522943 () Bool)

(assert (=> b!545312 m!522943))

(assert (=> b!545315 m!522943))

(assert (=> b!545310 m!522877))

(assert (=> b!545310 m!522877))

(assert (=> b!545310 m!522853))

(declare-fun m!522945 () Bool)

(assert (=> b!545310 m!522945))

(assert (=> d!82197 m!522851))

(assert (=> d!82197 m!522861))

(assert (=> b!545314 m!522943))

(assert (=> b!545158 d!82197))

(declare-fun d!82215 () Bool)

(declare-fun lt!248769 () (_ BitVec 32))

(assert (=> d!82215 (and (bvsge lt!248769 #b00000000000000000000000000000000) (bvslt lt!248769 (bvadd mask!3216 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82215 (= lt!248769 (choose!52 index!1177 x!1030 mask!3216))))

(assert (=> d!82215 (validMask!0 mask!3216)))

(assert (=> d!82215 (= (nextIndex!0 index!1177 x!1030 mask!3216) lt!248769)))

(declare-fun bs!17004 () Bool)

(assert (= bs!17004 d!82215))

(declare-fun m!522947 () Bool)

(assert (=> bs!17004 m!522947))

(assert (=> bs!17004 m!522861))

(assert (=> b!545160 d!82215))

(declare-fun d!82217 () Bool)

(declare-fun res!339345 () Bool)

(declare-fun e!315224 () Bool)

(assert (=> d!82217 (=> res!339345 e!315224)))

(assert (=> d!82217 (= res!339345 (bvsge #b00000000000000000000000000000000 (size!16893 a!3154)))))

(assert (=> d!82217 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10645) e!315224)))

(declare-fun b!545350 () Bool)

(declare-fun e!315223 () Bool)

(declare-fun call!32126 () Bool)

(assert (=> b!545350 (= e!315223 call!32126)))

(declare-fun b!545351 () Bool)

(declare-fun e!315226 () Bool)

(declare-fun contains!2812 (List!10648 (_ BitVec 64)) Bool)

(assert (=> b!545351 (= e!315226 (contains!2812 Nil!10645 (select (arr!16529 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545352 () Bool)

(declare-fun e!315225 () Bool)

(assert (=> b!545352 (= e!315224 e!315225)))

(declare-fun res!339343 () Bool)

(assert (=> b!545352 (=> (not res!339343) (not e!315225))))

(assert (=> b!545352 (= res!339343 (not e!315226))))

(declare-fun res!339344 () Bool)

(assert (=> b!545352 (=> (not res!339344) (not e!315226))))

(assert (=> b!545352 (= res!339344 (validKeyInArray!0 (select (arr!16529 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!545353 () Bool)

(assert (=> b!545353 (= e!315223 call!32126)))

(declare-fun bm!32123 () Bool)

(declare-fun c!63329 () Bool)

(assert (=> bm!32123 (= call!32126 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63329 (Cons!10644 (select (arr!16529 a!3154) #b00000000000000000000000000000000) Nil!10645) Nil!10645)))))

(declare-fun b!545354 () Bool)

(assert (=> b!545354 (= e!315225 e!315223)))

(assert (=> b!545354 (= c!63329 (validKeyInArray!0 (select (arr!16529 a!3154) #b00000000000000000000000000000000)))))

(assert (= (and d!82217 (not res!339345)) b!545352))

(assert (= (and b!545352 res!339344) b!545351))

(assert (= (and b!545352 res!339343) b!545354))

(assert (= (and b!545354 c!63329) b!545350))

(assert (= (and b!545354 (not c!63329)) b!545353))

(assert (= (or b!545350 b!545353) bm!32123))

(assert (=> b!545351 m!522905))

(assert (=> b!545351 m!522905))

(declare-fun m!522965 () Bool)

(assert (=> b!545351 m!522965))

(assert (=> b!545352 m!522905))

(assert (=> b!545352 m!522905))

(assert (=> b!545352 m!522913))

(assert (=> bm!32123 m!522905))

(declare-fun m!522967 () Bool)

(assert (=> bm!32123 m!522967))

(assert (=> b!545354 m!522905))

(assert (=> b!545354 m!522905))

(assert (=> b!545354 m!522913))

(assert (=> b!545159 d!82217))

(declare-fun b!545355 () Bool)

(declare-fun e!315228 () SeekEntryResult!4987)

(assert (=> b!545355 (= e!315228 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16529 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16529 a!3154) j!147) a!3154 mask!3216))))

(declare-fun d!82223 () Bool)

(declare-fun e!315229 () Bool)

(assert (=> d!82223 e!315229))

(declare-fun c!63330 () Bool)

(declare-fun lt!248781 () SeekEntryResult!4987)

(assert (=> d!82223 (= c!63330 (and (is-Intermediate!4987 lt!248781) (undefined!5799 lt!248781)))))

(declare-fun e!315227 () SeekEntryResult!4987)

(assert (=> d!82223 (= lt!248781 e!315227)))

(declare-fun c!63332 () Bool)

(assert (=> d!82223 (= c!63332 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!248782 () (_ BitVec 64))

(assert (=> d!82223 (= lt!248782 (select (arr!16529 a!3154) (toIndex!0 (select (arr!16529 a!3154) j!147) mask!3216)))))

(assert (=> d!82223 (validMask!0 mask!3216)))

(assert (=> d!82223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16529 a!3154) j!147) mask!3216) (select (arr!16529 a!3154) j!147) a!3154 mask!3216) lt!248781)))

(declare-fun b!545356 () Bool)

(assert (=> b!545356 (= e!315228 (Intermediate!4987 false (toIndex!0 (select (arr!16529 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!545357 () Bool)

(assert (=> b!545357 (and (bvsge (index!22174 lt!248781) #b00000000000000000000000000000000) (bvslt (index!22174 lt!248781) (size!16893 a!3154)))))

(declare-fun e!315230 () Bool)

(assert (=> b!545357 (= e!315230 (= (select (arr!16529 a!3154) (index!22174 lt!248781)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!545358 () Bool)

(assert (=> b!545358 (= e!315229 (bvsge (x!51090 lt!248781) #b01111111111111111111111111111110))))

(declare-fun b!545359 () Bool)

(assert (=> b!545359 (and (bvsge (index!22174 lt!248781) #b00000000000000000000000000000000) (bvslt (index!22174 lt!248781) (size!16893 a!3154)))))

(declare-fun res!339348 () Bool)

(assert (=> b!545359 (= res!339348 (= (select (arr!16529 a!3154) (index!22174 lt!248781)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!545359 (=> res!339348 e!315230)))

(declare-fun b!545360 () Bool)

(assert (=> b!545360 (and (bvsge (index!22174 lt!248781) #b00000000000000000000000000000000) (bvslt (index!22174 lt!248781) (size!16893 a!3154)))))

(declare-fun res!339347 () Bool)

(assert (=> b!545360 (= res!339347 (= (select (arr!16529 a!3154) (index!22174 lt!248781)) (select (arr!16529 a!3154) j!147)))))

(assert (=> b!545360 (=> res!339347 e!315230)))

(declare-fun e!315231 () Bool)

(assert (=> b!545360 (= e!315231 e!315230)))

(declare-fun b!545361 () Bool)

(assert (=> b!545361 (= e!315227 (Intermediate!4987 true (toIndex!0 (select (arr!16529 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!545362 () Bool)

(assert (=> b!545362 (= e!315227 e!315228)))

(declare-fun c!63331 () Bool)

(assert (=> b!545362 (= c!63331 (or (= lt!248782 (select (arr!16529 a!3154) j!147)) (= (bvadd lt!248782 lt!248782) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!545363 () Bool)

(assert (=> b!545363 (= e!315229 e!315231)))

(declare-fun res!339346 () Bool)

(assert (=> b!545363 (= res!339346 (and (is-Intermediate!4987 lt!248781) (not (undefined!5799 lt!248781)) (bvslt (x!51090 lt!248781) #b01111111111111111111111111111110) (bvsge (x!51090 lt!248781) #b00000000000000000000000000000000) (bvsge (x!51090 lt!248781) #b00000000000000000000000000000000)))))

(assert (=> b!545363 (=> (not res!339346) (not e!315231))))

(assert (= (and d!82223 c!63332) b!545361))

(assert (= (and d!82223 (not c!63332)) b!545362))

(assert (= (and b!545362 c!63331) b!545356))

(assert (= (and b!545362 (not c!63331)) b!545355))

(assert (= (and d!82223 c!63330) b!545358))

(assert (= (and d!82223 (not c!63330)) b!545363))

(assert (= (and b!545363 res!339346) b!545360))

(assert (= (and b!545360 (not res!339347)) b!545359))

(assert (= (and b!545359 (not res!339348)) b!545357))

(declare-fun m!522969 () Bool)

(assert (=> b!545357 m!522969))

(assert (=> b!545360 m!522969))

(assert (=> b!545355 m!522871))

(declare-fun m!522971 () Bool)

(assert (=> b!545355 m!522971))

(assert (=> b!545355 m!522971))

(assert (=> b!545355 m!522853))

(declare-fun m!522973 () Bool)

(assert (=> b!545355 m!522973))

(assert (=> d!82223 m!522871))

(declare-fun m!522975 () Bool)

(assert (=> d!82223 m!522975))

(assert (=> d!82223 m!522861))

(assert (=> b!545359 m!522969))

(assert (=> b!545154 d!82223))

(declare-fun d!82225 () Bool)

(declare-fun lt!248794 () (_ BitVec 32))

(declare-fun lt!248793 () (_ BitVec 32))

(assert (=> d!82225 (= lt!248794 (bvmul (bvxor lt!248793 (bvlshr lt!248793 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82225 (= lt!248793 ((_ extract 31 0) (bvand (bvxor (select (arr!16529 a!3154) j!147) (bvlshr (select (arr!16529 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82225 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!339349 (let ((h!11607 ((_ extract 31 0) (bvand (bvxor (select (arr!16529 a!3154) j!147) (bvlshr (select (arr!16529 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51098 (bvmul (bvxor h!11607 (bvlshr h!11607 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51098 (bvlshr x!51098 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!339349 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!339349 #b00000000000000000000000000000000))))))

(assert (=> d!82225 (= (toIndex!0 (select (arr!16529 a!3154) j!147) mask!3216) (bvand (bvxor lt!248794 (bvlshr lt!248794 #b00000000000000000000000000001101)) mask!3216))))

(assert (=> b!545154 d!82225))

(declare-fun b!545430 () Bool)

(declare-fun e!315273 () SeekEntryResult!4987)

(declare-fun lt!248818 () SeekEntryResult!4987)

(assert (=> b!545430 (= e!315273 (MissingZero!4987 (index!22174 lt!248818)))))

(declare-fun d!82227 () Bool)

(declare-fun lt!248819 () SeekEntryResult!4987)

(assert (=> d!82227 (and (or (is-Undefined!4987 lt!248819) (not (is-Found!4987 lt!248819)) (and (bvsge (index!22173 lt!248819) #b00000000000000000000000000000000) (bvslt (index!22173 lt!248819) (size!16893 a!3154)))) (or (is-Undefined!4987 lt!248819) (is-Found!4987 lt!248819) (not (is-MissingZero!4987 lt!248819)) (and (bvsge (index!22172 lt!248819) #b00000000000000000000000000000000) (bvslt (index!22172 lt!248819) (size!16893 a!3154)))) (or (is-Undefined!4987 lt!248819) (is-Found!4987 lt!248819) (is-MissingZero!4987 lt!248819) (not (is-MissingVacant!4987 lt!248819)) (and (bvsge (index!22175 lt!248819) #b00000000000000000000000000000000) (bvslt (index!22175 lt!248819) (size!16893 a!3154)))) (or (is-Undefined!4987 lt!248819) (ite (is-Found!4987 lt!248819) (= (select (arr!16529 a!3154) (index!22173 lt!248819)) k!1998) (ite (is-MissingZero!4987 lt!248819) (= (select (arr!16529 a!3154) (index!22172 lt!248819)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4987 lt!248819) (= (select (arr!16529 a!3154) (index!22175 lt!248819)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!315272 () SeekEntryResult!4987)

(assert (=> d!82227 (= lt!248819 e!315272)))

(declare-fun c!63357 () Bool)

(assert (=> d!82227 (= c!63357 (and (is-Intermediate!4987 lt!248818) (undefined!5799 lt!248818)))))

(assert (=> d!82227 (= lt!248818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!82227 (validMask!0 mask!3216)))

(assert (=> d!82227 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!248819)))

(declare-fun b!545431 () Bool)

(assert (=> b!545431 (= e!315272 Undefined!4987)))

(declare-fun b!545432 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34398 (_ BitVec 32)) SeekEntryResult!4987)

(assert (=> b!545432 (= e!315273 (seekKeyOrZeroReturnVacant!0 (x!51090 lt!248818) (index!22174 lt!248818) (index!22174 lt!248818) k!1998 a!3154 mask!3216))))

(declare-fun b!545433 () Bool)

(declare-fun e!315274 () SeekEntryResult!4987)

(assert (=> b!545433 (= e!315272 e!315274)))

