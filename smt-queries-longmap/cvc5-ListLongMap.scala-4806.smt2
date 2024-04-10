; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66044 () Bool)

(assert start!66044)

(declare-fun b!760998 () Bool)

(declare-fun res!514729 () Bool)

(declare-fun e!424239 () Bool)

(assert (=> b!760998 (=> (not res!514729) (not e!424239))))

(declare-datatypes ((array!42075 0))(
  ( (array!42076 (arr!20148 (Array (_ BitVec 32) (_ BitVec 64))) (size!20569 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42075)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!760998 (= res!514729 (validKeyInArray!0 (select (arr!20148 a!3186) j!159)))))

(declare-fun b!760999 () Bool)

(declare-fun res!514725 () Bool)

(declare-fun e!424245 () Bool)

(assert (=> b!760999 (=> (not res!514725) (not e!424245))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!760999 (= res!514725 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20569 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20569 a!3186))))))

(declare-fun b!761000 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!424244 () Bool)

(declare-datatypes ((SeekEntryResult!7748 0))(
  ( (MissingZero!7748 (index!33360 (_ BitVec 32))) (Found!7748 (index!33361 (_ BitVec 32))) (Intermediate!7748 (undefined!8560 Bool) (index!33362 (_ BitVec 32)) (x!64262 (_ BitVec 32))) (Undefined!7748) (MissingVacant!7748 (index!33363 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42075 (_ BitVec 32)) SeekEntryResult!7748)

(assert (=> b!761000 (= e!424244 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20148 a!3186) j!159) a!3186 mask!3328) (Found!7748 j!159)))))

(declare-fun b!761002 () Bool)

(declare-fun lt!339043 () SeekEntryResult!7748)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42075 (_ BitVec 32)) SeekEntryResult!7748)

(assert (=> b!761002 (= e!424244 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20148 a!3186) j!159) a!3186 mask!3328) lt!339043))))

(declare-fun b!761003 () Bool)

(declare-fun e!424240 () Bool)

(assert (=> b!761003 (= e!424245 e!424240)))

(declare-fun res!514730 () Bool)

(assert (=> b!761003 (=> (not res!514730) (not e!424240))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!761003 (= res!514730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20148 a!3186) j!159) mask!3328) (select (arr!20148 a!3186) j!159) a!3186 mask!3328) lt!339043))))

(assert (=> b!761003 (= lt!339043 (Intermediate!7748 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!761004 () Bool)

(declare-fun e!424243 () Bool)

(declare-fun lt!339047 () SeekEntryResult!7748)

(assert (=> b!761004 (= e!424243 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20148 a!3186) j!159) a!3186 mask!3328) lt!339047))))

(declare-fun b!761005 () Bool)

(declare-fun res!514733 () Bool)

(assert (=> b!761005 (=> (not res!514733) (not e!424239))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!761005 (= res!514733 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!761006 () Bool)

(declare-fun e!424242 () Bool)

(assert (=> b!761006 (= e!424242 e!424243)))

(declare-fun res!514728 () Bool)

(assert (=> b!761006 (=> (not res!514728) (not e!424243))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42075 (_ BitVec 32)) SeekEntryResult!7748)

(assert (=> b!761006 (= res!514728 (= (seekEntryOrOpen!0 (select (arr!20148 a!3186) j!159) a!3186 mask!3328) lt!339047))))

(assert (=> b!761006 (= lt!339047 (Found!7748 j!159))))

(declare-fun b!761007 () Bool)

(declare-fun res!514737 () Bool)

(assert (=> b!761007 (=> (not res!514737) (not e!424240))))

(assert (=> b!761007 (= res!514737 e!424244)))

(declare-fun c!83521 () Bool)

(assert (=> b!761007 (= c!83521 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!761008 () Bool)

(declare-fun res!514727 () Bool)

(assert (=> b!761008 (=> (not res!514727) (not e!424245))))

(declare-datatypes ((List!14150 0))(
  ( (Nil!14147) (Cons!14146 (h!15224 (_ BitVec 64)) (t!20465 List!14150)) )
))
(declare-fun arrayNoDuplicates!0 (array!42075 (_ BitVec 32) List!14150) Bool)

(assert (=> b!761008 (= res!514727 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14147))))

(declare-fun b!761009 () Bool)

(declare-fun e!424241 () Bool)

(declare-fun e!424238 () Bool)

(assert (=> b!761009 (= e!424241 (not e!424238))))

(declare-fun res!514726 () Bool)

(assert (=> b!761009 (=> res!514726 e!424238)))

(declare-fun lt!339041 () SeekEntryResult!7748)

(assert (=> b!761009 (= res!514726 (or (not (is-Intermediate!7748 lt!339041)) (bvslt x!1131 (x!64262 lt!339041)) (not (= x!1131 (x!64262 lt!339041))) (not (= index!1321 (index!33362 lt!339041)))))))

(assert (=> b!761009 e!424242))

(declare-fun res!514732 () Bool)

(assert (=> b!761009 (=> (not res!514732) (not e!424242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42075 (_ BitVec 32)) Bool)

(assert (=> b!761009 (= res!514732 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26336 0))(
  ( (Unit!26337) )
))
(declare-fun lt!339042 () Unit!26336)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26336)

(assert (=> b!761009 (= lt!339042 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!761010 () Bool)

(assert (=> b!761010 (= e!424240 e!424241)))

(declare-fun res!514731 () Bool)

(assert (=> b!761010 (=> (not res!514731) (not e!424241))))

(declare-fun lt!339046 () SeekEntryResult!7748)

(assert (=> b!761010 (= res!514731 (= lt!339046 lt!339041))))

(declare-fun lt!339040 () (_ BitVec 64))

(declare-fun lt!339044 () array!42075)

(assert (=> b!761010 (= lt!339041 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339040 lt!339044 mask!3328))))

(assert (=> b!761010 (= lt!339046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339040 mask!3328) lt!339040 lt!339044 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!761010 (= lt!339040 (select (store (arr!20148 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!761010 (= lt!339044 (array!42076 (store (arr!20148 a!3186) i!1173 k!2102) (size!20569 a!3186)))))

(declare-fun b!761011 () Bool)

(declare-fun res!514736 () Bool)

(assert (=> b!761011 (=> (not res!514736) (not e!424240))))

(assert (=> b!761011 (= res!514736 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20148 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761001 () Bool)

(assert (=> b!761001 (= e!424239 e!424245)))

(declare-fun res!514723 () Bool)

(assert (=> b!761001 (=> (not res!514723) (not e!424245))))

(declare-fun lt!339045 () SeekEntryResult!7748)

(assert (=> b!761001 (= res!514723 (or (= lt!339045 (MissingZero!7748 i!1173)) (= lt!339045 (MissingVacant!7748 i!1173))))))

(assert (=> b!761001 (= lt!339045 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!514738 () Bool)

(assert (=> start!66044 (=> (not res!514738) (not e!424239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66044 (= res!514738 (validMask!0 mask!3328))))

(assert (=> start!66044 e!424239))

(assert (=> start!66044 true))

(declare-fun array_inv!15944 (array!42075) Bool)

(assert (=> start!66044 (array_inv!15944 a!3186)))

(declare-fun b!761012 () Bool)

(assert (=> b!761012 (= e!424238 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20148 a!3186) j!159) a!3186 mask!3328) (Found!7748 j!159)))))

(declare-fun b!761013 () Bool)

(declare-fun res!514735 () Bool)

(assert (=> b!761013 (=> (not res!514735) (not e!424239))))

(assert (=> b!761013 (= res!514735 (validKeyInArray!0 k!2102))))

(declare-fun b!761014 () Bool)

(declare-fun res!514724 () Bool)

(assert (=> b!761014 (=> (not res!514724) (not e!424239))))

(assert (=> b!761014 (= res!514724 (and (= (size!20569 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20569 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20569 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!761015 () Bool)

(declare-fun res!514734 () Bool)

(assert (=> b!761015 (=> (not res!514734) (not e!424245))))

(assert (=> b!761015 (= res!514734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66044 res!514738) b!761014))

(assert (= (and b!761014 res!514724) b!760998))

(assert (= (and b!760998 res!514729) b!761013))

(assert (= (and b!761013 res!514735) b!761005))

(assert (= (and b!761005 res!514733) b!761001))

(assert (= (and b!761001 res!514723) b!761015))

(assert (= (and b!761015 res!514734) b!761008))

(assert (= (and b!761008 res!514727) b!760999))

(assert (= (and b!760999 res!514725) b!761003))

(assert (= (and b!761003 res!514730) b!761011))

(assert (= (and b!761011 res!514736) b!761007))

(assert (= (and b!761007 c!83521) b!761002))

(assert (= (and b!761007 (not c!83521)) b!761000))

(assert (= (and b!761007 res!514737) b!761010))

(assert (= (and b!761010 res!514731) b!761009))

(assert (= (and b!761009 res!514732) b!761006))

(assert (= (and b!761006 res!514728) b!761004))

(assert (= (and b!761009 (not res!514726)) b!761012))

(declare-fun m!708105 () Bool)

(assert (=> b!761003 m!708105))

(assert (=> b!761003 m!708105))

(declare-fun m!708107 () Bool)

(assert (=> b!761003 m!708107))

(assert (=> b!761003 m!708107))

(assert (=> b!761003 m!708105))

(declare-fun m!708109 () Bool)

(assert (=> b!761003 m!708109))

(declare-fun m!708111 () Bool)

(assert (=> b!761008 m!708111))

(declare-fun m!708113 () Bool)

(assert (=> b!761010 m!708113))

(declare-fun m!708115 () Bool)

(assert (=> b!761010 m!708115))

(declare-fun m!708117 () Bool)

(assert (=> b!761010 m!708117))

(declare-fun m!708119 () Bool)

(assert (=> b!761010 m!708119))

(assert (=> b!761010 m!708115))

(declare-fun m!708121 () Bool)

(assert (=> b!761010 m!708121))

(assert (=> b!761004 m!708105))

(assert (=> b!761004 m!708105))

(declare-fun m!708123 () Bool)

(assert (=> b!761004 m!708123))

(declare-fun m!708125 () Bool)

(assert (=> b!761015 m!708125))

(assert (=> b!761012 m!708105))

(assert (=> b!761012 m!708105))

(declare-fun m!708127 () Bool)

(assert (=> b!761012 m!708127))

(declare-fun m!708129 () Bool)

(assert (=> b!761009 m!708129))

(declare-fun m!708131 () Bool)

(assert (=> b!761009 m!708131))

(assert (=> b!760998 m!708105))

(assert (=> b!760998 m!708105))

(declare-fun m!708133 () Bool)

(assert (=> b!760998 m!708133))

(assert (=> b!761000 m!708105))

(assert (=> b!761000 m!708105))

(assert (=> b!761000 m!708127))

(declare-fun m!708135 () Bool)

(assert (=> b!761001 m!708135))

(declare-fun m!708137 () Bool)

(assert (=> b!761011 m!708137))

(declare-fun m!708139 () Bool)

(assert (=> b!761013 m!708139))

(declare-fun m!708141 () Bool)

(assert (=> b!761005 m!708141))

(assert (=> b!761006 m!708105))

(assert (=> b!761006 m!708105))

(declare-fun m!708143 () Bool)

(assert (=> b!761006 m!708143))

(assert (=> b!761002 m!708105))

(assert (=> b!761002 m!708105))

(declare-fun m!708145 () Bool)

(assert (=> b!761002 m!708145))

(declare-fun m!708147 () Bool)

(assert (=> start!66044 m!708147))

(declare-fun m!708149 () Bool)

(assert (=> start!66044 m!708149))

(push 1)

(assert (not b!761002))

(assert (not b!761015))

(assert (not b!761004))

(assert (not b!761006))

(assert (not b!761008))

(assert (not b!761003))

(assert (not b!761013))

(assert (not start!66044))

(assert (not b!761000))

(assert (not b!761012))

(assert (not b!761009))

(assert (not b!761005))

(assert (not b!761010))

(assert (not b!761001))

(assert (not b!760998))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!761262 () Bool)

(declare-fun e!424382 () SeekEntryResult!7748)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!761262 (= e!424382 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20148 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!100725 () Bool)

(declare-fun lt!339147 () SeekEntryResult!7748)

(assert (=> d!100725 (and (or (is-Undefined!7748 lt!339147) (not (is-Found!7748 lt!339147)) (and (bvsge (index!33361 lt!339147) #b00000000000000000000000000000000) (bvslt (index!33361 lt!339147) (size!20569 a!3186)))) (or (is-Undefined!7748 lt!339147) (is-Found!7748 lt!339147) (not (is-MissingVacant!7748 lt!339147)) (not (= (index!33363 lt!339147) resIntermediateIndex!5)) (and (bvsge (index!33363 lt!339147) #b00000000000000000000000000000000) (bvslt (index!33363 lt!339147) (size!20569 a!3186)))) (or (is-Undefined!7748 lt!339147) (ite (is-Found!7748 lt!339147) (= (select (arr!20148 a!3186) (index!33361 lt!339147)) (select (arr!20148 a!3186) j!159)) (and (is-MissingVacant!7748 lt!339147) (= (index!33363 lt!339147) resIntermediateIndex!5) (= (select (arr!20148 a!3186) (index!33363 lt!339147)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!424384 () SeekEntryResult!7748)

(assert (=> d!100725 (= lt!339147 e!424384)))

(declare-fun c!83579 () Bool)

(assert (=> d!100725 (= c!83579 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!339148 () (_ BitVec 64))

(assert (=> d!100725 (= lt!339148 (select (arr!20148 a!3186) resIntermediateIndex!5))))

(assert (=> d!100725 (validMask!0 mask!3328)))

(assert (=> d!100725 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20148 a!3186) j!159) a!3186 mask!3328) lt!339147)))

(declare-fun b!761263 () Bool)

(assert (=> b!761263 (= e!424382 (MissingVacant!7748 resIntermediateIndex!5))))

(declare-fun b!761264 () Bool)

(declare-fun c!83581 () Bool)

(assert (=> b!761264 (= c!83581 (= lt!339148 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424383 () SeekEntryResult!7748)

(assert (=> b!761264 (= e!424383 e!424382)))

(declare-fun b!761265 () Bool)

(assert (=> b!761265 (= e!424383 (Found!7748 resIntermediateIndex!5))))

(declare-fun b!761266 () Bool)

(assert (=> b!761266 (= e!424384 e!424383)))

(declare-fun c!83580 () Bool)

(assert (=> b!761266 (= c!83580 (= lt!339148 (select (arr!20148 a!3186) j!159)))))

(declare-fun b!761267 () Bool)

(assert (=> b!761267 (= e!424384 Undefined!7748)))

(assert (= (and d!100725 c!83579) b!761267))

(assert (= (and d!100725 (not c!83579)) b!761266))

(assert (= (and b!761266 c!83580) b!761265))

(assert (= (and b!761266 (not c!83580)) b!761264))

(assert (= (and b!761264 c!83581) b!761263))

(assert (= (and b!761264 (not c!83581)) b!761262))

(declare-fun m!708325 () Bool)

(assert (=> b!761262 m!708325))

(assert (=> b!761262 m!708325))

(assert (=> b!761262 m!708105))

(declare-fun m!708327 () Bool)

(assert (=> b!761262 m!708327))

(declare-fun m!708329 () Bool)

(assert (=> d!100725 m!708329))

(declare-fun m!708331 () Bool)

(assert (=> d!100725 m!708331))

(assert (=> d!100725 m!708137))

(assert (=> d!100725 m!708147))

(assert (=> b!761004 d!100725))

(declare-fun d!100741 () Bool)

(declare-fun e!424418 () Bool)

(assert (=> d!100741 e!424418))

(declare-fun c!83601 () Bool)

(declare-fun lt!339168 () SeekEntryResult!7748)

(assert (=> d!100741 (= c!83601 (and (is-Intermediate!7748 lt!339168) (undefined!8560 lt!339168)))))

(declare-fun e!424421 () SeekEntryResult!7748)

(assert (=> d!100741 (= lt!339168 e!424421)))

(declare-fun c!83603 () Bool)

(assert (=> d!100741 (= c!83603 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!339167 () (_ BitVec 64))

(assert (=> d!100741 (= lt!339167 (select (arr!20148 a!3186) (toIndex!0 (select (arr!20148 a!3186) j!159) mask!3328)))))

(assert (=> d!100741 (validMask!0 mask!3328)))

(assert (=> d!100741 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20148 a!3186) j!159) mask!3328) (select (arr!20148 a!3186) j!159) a!3186 mask!3328) lt!339168)))

(declare-fun b!761323 () Bool)

(assert (=> b!761323 (and (bvsge (index!33362 lt!339168) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339168) (size!20569 a!3186)))))

(declare-fun res!514890 () Bool)

(assert (=> b!761323 (= res!514890 (= (select (arr!20148 a!3186) (index!33362 lt!339168)) (select (arr!20148 a!3186) j!159)))))

(declare-fun e!424420 () Bool)

(assert (=> b!761323 (=> res!514890 e!424420)))

(declare-fun e!424422 () Bool)

(assert (=> b!761323 (= e!424422 e!424420)))

(declare-fun b!761324 () Bool)

(declare-fun e!424419 () SeekEntryResult!7748)

(assert (=> b!761324 (= e!424419 (Intermediate!7748 false (toIndex!0 (select (arr!20148 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761325 () Bool)

(assert (=> b!761325 (= e!424418 (bvsge (x!64262 lt!339168) #b01111111111111111111111111111110))))

(declare-fun b!761326 () Bool)

(assert (=> b!761326 (= e!424421 e!424419)))

(declare-fun c!83602 () Bool)

(assert (=> b!761326 (= c!83602 (or (= lt!339167 (select (arr!20148 a!3186) j!159)) (= (bvadd lt!339167 lt!339167) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761327 () Bool)

(assert (=> b!761327 (= e!424419 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20148 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20148 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761328 () Bool)

(assert (=> b!761328 (= e!424421 (Intermediate!7748 true (toIndex!0 (select (arr!20148 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761329 () Bool)

(assert (=> b!761329 (= e!424418 e!424422)))

(declare-fun res!514889 () Bool)

(assert (=> b!761329 (= res!514889 (and (is-Intermediate!7748 lt!339168) (not (undefined!8560 lt!339168)) (bvslt (x!64262 lt!339168) #b01111111111111111111111111111110) (bvsge (x!64262 lt!339168) #b00000000000000000000000000000000) (bvsge (x!64262 lt!339168) #b00000000000000000000000000000000)))))

(assert (=> b!761329 (=> (not res!514889) (not e!424422))))

(declare-fun b!761330 () Bool)

(assert (=> b!761330 (and (bvsge (index!33362 lt!339168) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339168) (size!20569 a!3186)))))

(declare-fun res!514891 () Bool)

(assert (=> b!761330 (= res!514891 (= (select (arr!20148 a!3186) (index!33362 lt!339168)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761330 (=> res!514891 e!424420)))

(declare-fun b!761331 () Bool)

(assert (=> b!761331 (and (bvsge (index!33362 lt!339168) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339168) (size!20569 a!3186)))))

(assert (=> b!761331 (= e!424420 (= (select (arr!20148 a!3186) (index!33362 lt!339168)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100741 c!83603) b!761328))

(assert (= (and d!100741 (not c!83603)) b!761326))

(assert (= (and b!761326 c!83602) b!761324))

(assert (= (and b!761326 (not c!83602)) b!761327))

(assert (= (and d!100741 c!83601) b!761325))

(assert (= (and d!100741 (not c!83601)) b!761329))

(assert (= (and b!761329 res!514889) b!761323))

(assert (= (and b!761323 (not res!514890)) b!761330))

(assert (= (and b!761330 (not res!514891)) b!761331))

(declare-fun m!708357 () Bool)

(assert (=> b!761331 m!708357))

(assert (=> b!761327 m!708107))

(declare-fun m!708359 () Bool)

(assert (=> b!761327 m!708359))

(assert (=> b!761327 m!708359))

(assert (=> b!761327 m!708105))

(declare-fun m!708361 () Bool)

(assert (=> b!761327 m!708361))

(assert (=> d!100741 m!708107))

(declare-fun m!708363 () Bool)

(assert (=> d!100741 m!708363))

(assert (=> d!100741 m!708147))

(assert (=> b!761323 m!708357))

(assert (=> b!761330 m!708357))

(assert (=> b!761003 d!100741))

(declare-fun d!100757 () Bool)

(declare-fun lt!339176 () (_ BitVec 32))

(declare-fun lt!339175 () (_ BitVec 32))

(assert (=> d!100757 (= lt!339176 (bvmul (bvxor lt!339175 (bvlshr lt!339175 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100757 (= lt!339175 ((_ extract 31 0) (bvand (bvxor (select (arr!20148 a!3186) j!159) (bvlshr (select (arr!20148 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100757 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514892 (let ((h!15228 ((_ extract 31 0) (bvand (bvxor (select (arr!20148 a!3186) j!159) (bvlshr (select (arr!20148 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64271 (bvmul (bvxor h!15228 (bvlshr h!15228 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64271 (bvlshr x!64271 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514892 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514892 #b00000000000000000000000000000000))))))

(assert (=> d!100757 (= (toIndex!0 (select (arr!20148 a!3186) j!159) mask!3328) (bvand (bvxor lt!339176 (bvlshr lt!339176 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!761003 d!100757))

(declare-fun d!100767 () Bool)

(declare-fun res!514897 () Bool)

(declare-fun e!424430 () Bool)

(assert (=> d!100767 (=> res!514897 e!424430)))

(assert (=> d!100767 (= res!514897 (= (select (arr!20148 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!100767 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!424430)))

(declare-fun b!761342 () Bool)

(declare-fun e!424431 () Bool)

(assert (=> b!761342 (= e!424430 e!424431)))

(declare-fun res!514898 () Bool)

(assert (=> b!761342 (=> (not res!514898) (not e!424431))))

(assert (=> b!761342 (= res!514898 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20569 a!3186)))))

(declare-fun b!761343 () Bool)

(assert (=> b!761343 (= e!424431 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!100767 (not res!514897)) b!761342))

(assert (= (and b!761342 res!514898) b!761343))

(declare-fun m!708375 () Bool)

(assert (=> d!100767 m!708375))

(declare-fun m!708377 () Bool)

(assert (=> b!761343 m!708377))

(assert (=> b!761005 d!100767))

(declare-fun d!100769 () Bool)

(declare-fun res!514912 () Bool)

(declare-fun e!424451 () Bool)

(assert (=> d!100769 (=> res!514912 e!424451)))

(assert (=> d!100769 (= res!514912 (bvsge #b00000000000000000000000000000000 (size!20569 a!3186)))))

(assert (=> d!100769 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!424451)))

(declare-fun b!761367 () Bool)

(declare-fun e!424452 () Bool)

(assert (=> b!761367 (= e!424451 e!424452)))

(declare-fun c!83612 () Bool)

(assert (=> b!761367 (= c!83612 (validKeyInArray!0 (select (arr!20148 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761368 () Bool)

(declare-fun e!424450 () Bool)

(declare-fun call!34972 () Bool)

(assert (=> b!761368 (= e!424450 call!34972)))

(declare-fun b!761369 () Bool)

(assert (=> b!761369 (= e!424452 call!34972)))

(declare-fun bm!34969 () Bool)

(assert (=> bm!34969 (= call!34972 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!761370 () Bool)

(assert (=> b!761370 (= e!424452 e!424450)))

(declare-fun lt!339185 () (_ BitVec 64))

(assert (=> b!761370 (= lt!339185 (select (arr!20148 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!339183 () Unit!26336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42075 (_ BitVec 64) (_ BitVec 32)) Unit!26336)

(assert (=> b!761370 (= lt!339183 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339185 #b00000000000000000000000000000000))))

(assert (=> b!761370 (arrayContainsKey!0 a!3186 lt!339185 #b00000000000000000000000000000000)))

(declare-fun lt!339184 () Unit!26336)

(assert (=> b!761370 (= lt!339184 lt!339183)))

(declare-fun res!514913 () Bool)

(assert (=> b!761370 (= res!514913 (= (seekEntryOrOpen!0 (select (arr!20148 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7748 #b00000000000000000000000000000000)))))

(assert (=> b!761370 (=> (not res!514913) (not e!424450))))

(assert (= (and d!100769 (not res!514912)) b!761367))

(assert (= (and b!761367 c!83612) b!761370))

(assert (= (and b!761367 (not c!83612)) b!761369))

(assert (= (and b!761370 res!514913) b!761368))

(assert (= (or b!761368 b!761369) bm!34969))

(assert (=> b!761367 m!708375))

(assert (=> b!761367 m!708375))

(declare-fun m!708385 () Bool)

(assert (=> b!761367 m!708385))

(declare-fun m!708387 () Bool)

(assert (=> bm!34969 m!708387))

(assert (=> b!761370 m!708375))

(declare-fun m!708389 () Bool)

(assert (=> b!761370 m!708389))

(declare-fun m!708391 () Bool)

(assert (=> b!761370 m!708391))

(assert (=> b!761370 m!708375))

(declare-fun m!708393 () Bool)

(assert (=> b!761370 m!708393))

(assert (=> b!761015 d!100769))

(declare-fun lt!339201 () SeekEntryResult!7748)

(declare-fun b!761419 () Bool)

(declare-fun e!424480 () SeekEntryResult!7748)

(assert (=> b!761419 (= e!424480 (seekKeyOrZeroReturnVacant!0 (x!64262 lt!339201) (index!33362 lt!339201) (index!33362 lt!339201) (select (arr!20148 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761420 () Bool)

(declare-fun c!83633 () Bool)

(declare-fun lt!339200 () (_ BitVec 64))

(assert (=> b!761420 (= c!83633 (= lt!339200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424481 () SeekEntryResult!7748)

(assert (=> b!761420 (= e!424481 e!424480)))

(declare-fun b!761421 () Bool)

(declare-fun e!424479 () SeekEntryResult!7748)

(assert (=> b!761421 (= e!424479 Undefined!7748)))

(declare-fun d!100773 () Bool)

(declare-fun lt!339202 () SeekEntryResult!7748)

(assert (=> d!100773 (and (or (is-Undefined!7748 lt!339202) (not (is-Found!7748 lt!339202)) (and (bvsge (index!33361 lt!339202) #b00000000000000000000000000000000) (bvslt (index!33361 lt!339202) (size!20569 a!3186)))) (or (is-Undefined!7748 lt!339202) (is-Found!7748 lt!339202) (not (is-MissingZero!7748 lt!339202)) (and (bvsge (index!33360 lt!339202) #b00000000000000000000000000000000) (bvslt (index!33360 lt!339202) (size!20569 a!3186)))) (or (is-Undefined!7748 lt!339202) (is-Found!7748 lt!339202) (is-MissingZero!7748 lt!339202) (not (is-MissingVacant!7748 lt!339202)) (and (bvsge (index!33363 lt!339202) #b00000000000000000000000000000000) (bvslt (index!33363 lt!339202) (size!20569 a!3186)))) (or (is-Undefined!7748 lt!339202) (ite (is-Found!7748 lt!339202) (= (select (arr!20148 a!3186) (index!33361 lt!339202)) (select (arr!20148 a!3186) j!159)) (ite (is-MissingZero!7748 lt!339202) (= (select (arr!20148 a!3186) (index!33360 lt!339202)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7748 lt!339202) (= (select (arr!20148 a!3186) (index!33363 lt!339202)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100773 (= lt!339202 e!424479)))

(declare-fun c!83632 () Bool)

(assert (=> d!100773 (= c!83632 (and (is-Intermediate!7748 lt!339201) (undefined!8560 lt!339201)))))

(assert (=> d!100773 (= lt!339201 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20148 a!3186) j!159) mask!3328) (select (arr!20148 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!100773 (validMask!0 mask!3328)))

(assert (=> d!100773 (= (seekEntryOrOpen!0 (select (arr!20148 a!3186) j!159) a!3186 mask!3328) lt!339202)))

(declare-fun b!761422 () Bool)

(assert (=> b!761422 (= e!424480 (MissingZero!7748 (index!33362 lt!339201)))))

(declare-fun b!761423 () Bool)

(assert (=> b!761423 (= e!424479 e!424481)))

(assert (=> b!761423 (= lt!339200 (select (arr!20148 a!3186) (index!33362 lt!339201)))))

(declare-fun c!83631 () Bool)

(assert (=> b!761423 (= c!83631 (= lt!339200 (select (arr!20148 a!3186) j!159)))))

(declare-fun b!761424 () Bool)

(assert (=> b!761424 (= e!424481 (Found!7748 (index!33362 lt!339201)))))

(assert (= (and d!100773 c!83632) b!761421))

(assert (= (and d!100773 (not c!83632)) b!761423))

(assert (= (and b!761423 c!83631) b!761424))

(assert (= (and b!761423 (not c!83631)) b!761420))

(assert (= (and b!761420 c!83633) b!761422))

(assert (= (and b!761420 (not c!83633)) b!761419))

(assert (=> b!761419 m!708105))

(declare-fun m!708409 () Bool)

(assert (=> b!761419 m!708409))

(declare-fun m!708411 () Bool)

(assert (=> d!100773 m!708411))

(assert (=> d!100773 m!708107))

(assert (=> d!100773 m!708105))

(assert (=> d!100773 m!708109))

(declare-fun m!708413 () Bool)

(assert (=> d!100773 m!708413))

(assert (=> d!100773 m!708105))

(assert (=> d!100773 m!708107))

(declare-fun m!708415 () Bool)

(assert (=> d!100773 m!708415))

(assert (=> d!100773 m!708147))

(declare-fun m!708417 () Bool)

(assert (=> b!761423 m!708417))

(assert (=> b!761006 d!100773))

(declare-fun d!100779 () Bool)

(declare-fun res!514933 () Bool)

(declare-fun e!424490 () Bool)

(assert (=> d!100779 (=> res!514933 e!424490)))

(assert (=> d!100779 (= res!514933 (bvsge #b00000000000000000000000000000000 (size!20569 a!3186)))))

(assert (=> d!100779 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14147) e!424490)))

(declare-fun bm!34972 () Bool)

(declare-fun call!34975 () Bool)

(declare-fun c!83636 () Bool)

(assert (=> bm!34972 (= call!34975 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!83636 (Cons!14146 (select (arr!20148 a!3186) #b00000000000000000000000000000000) Nil!14147) Nil!14147)))))

(declare-fun b!761435 () Bool)

(declare-fun e!424492 () Bool)

(assert (=> b!761435 (= e!424492 call!34975)))

(declare-fun b!761436 () Bool)

(assert (=> b!761436 (= e!424492 call!34975)))

(declare-fun b!761437 () Bool)

(declare-fun e!424493 () Bool)

(assert (=> b!761437 (= e!424490 e!424493)))

(declare-fun res!514934 () Bool)

(assert (=> b!761437 (=> (not res!514934) (not e!424493))))

(declare-fun e!424491 () Bool)

(assert (=> b!761437 (= res!514934 (not e!424491))))

(declare-fun res!514935 () Bool)

(assert (=> b!761437 (=> (not res!514935) (not e!424491))))

(assert (=> b!761437 (= res!514935 (validKeyInArray!0 (select (arr!20148 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761438 () Bool)

(assert (=> b!761438 (= e!424493 e!424492)))

(assert (=> b!761438 (= c!83636 (validKeyInArray!0 (select (arr!20148 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!761439 () Bool)

(declare-fun contains!4071 (List!14150 (_ BitVec 64)) Bool)

(assert (=> b!761439 (= e!424491 (contains!4071 Nil!14147 (select (arr!20148 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!100779 (not res!514933)) b!761437))

(assert (= (and b!761437 res!514935) b!761439))

(assert (= (and b!761437 res!514934) b!761438))

(assert (= (and b!761438 c!83636) b!761436))

(assert (= (and b!761438 (not c!83636)) b!761435))

(assert (= (or b!761436 b!761435) bm!34972))

(assert (=> bm!34972 m!708375))

(declare-fun m!708419 () Bool)

(assert (=> bm!34972 m!708419))

(assert (=> b!761437 m!708375))

(assert (=> b!761437 m!708375))

(assert (=> b!761437 m!708385))

(assert (=> b!761438 m!708375))

(assert (=> b!761438 m!708375))

(assert (=> b!761438 m!708385))

(assert (=> b!761439 m!708375))

(assert (=> b!761439 m!708375))

(declare-fun m!708421 () Bool)

(assert (=> b!761439 m!708421))

(assert (=> b!761008 d!100779))

(declare-fun d!100783 () Bool)

(assert (=> d!100783 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66044 d!100783))

(declare-fun d!100785 () Bool)

(assert (=> d!100785 (= (array_inv!15944 a!3186) (bvsge (size!20569 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66044 d!100785))

(declare-fun d!100787 () Bool)

(declare-fun res!514936 () Bool)

(declare-fun e!424501 () Bool)

(assert (=> d!100787 (=> res!514936 e!424501)))

(assert (=> d!100787 (= res!514936 (bvsge j!159 (size!20569 a!3186)))))

(assert (=> d!100787 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!424501)))

(declare-fun b!761452 () Bool)

(declare-fun e!424502 () Bool)

(assert (=> b!761452 (= e!424501 e!424502)))

(declare-fun c!83643 () Bool)

(assert (=> b!761452 (= c!83643 (validKeyInArray!0 (select (arr!20148 a!3186) j!159)))))

(declare-fun b!761453 () Bool)

(declare-fun e!424500 () Bool)

(declare-fun call!34976 () Bool)

(assert (=> b!761453 (= e!424500 call!34976)))

(declare-fun b!761454 () Bool)

(assert (=> b!761454 (= e!424502 call!34976)))

(declare-fun bm!34973 () Bool)

(assert (=> bm!34973 (= call!34976 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!761455 () Bool)

(assert (=> b!761455 (= e!424502 e!424500)))

(declare-fun lt!339217 () (_ BitVec 64))

(assert (=> b!761455 (= lt!339217 (select (arr!20148 a!3186) j!159))))

(declare-fun lt!339215 () Unit!26336)

(assert (=> b!761455 (= lt!339215 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!339217 j!159))))

(assert (=> b!761455 (arrayContainsKey!0 a!3186 lt!339217 #b00000000000000000000000000000000)))

(declare-fun lt!339216 () Unit!26336)

(assert (=> b!761455 (= lt!339216 lt!339215)))

(declare-fun res!514937 () Bool)

(assert (=> b!761455 (= res!514937 (= (seekEntryOrOpen!0 (select (arr!20148 a!3186) j!159) a!3186 mask!3328) (Found!7748 j!159)))))

(assert (=> b!761455 (=> (not res!514937) (not e!424500))))

(assert (= (and d!100787 (not res!514936)) b!761452))

(assert (= (and b!761452 c!83643) b!761455))

(assert (= (and b!761452 (not c!83643)) b!761454))

(assert (= (and b!761455 res!514937) b!761453))

(assert (= (or b!761453 b!761454) bm!34973))

(assert (=> b!761452 m!708105))

(assert (=> b!761452 m!708105))

(assert (=> b!761452 m!708133))

(declare-fun m!708423 () Bool)

(assert (=> bm!34973 m!708423))

(assert (=> b!761455 m!708105))

(declare-fun m!708425 () Bool)

(assert (=> b!761455 m!708425))

(declare-fun m!708427 () Bool)

(assert (=> b!761455 m!708427))

(assert (=> b!761455 m!708105))

(assert (=> b!761455 m!708143))

(assert (=> b!761009 d!100787))

(declare-fun d!100789 () Bool)

(assert (=> d!100789 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!339223 () Unit!26336)

(declare-fun choose!38 (array!42075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26336)

(assert (=> d!100789 (= lt!339223 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!100789 (validMask!0 mask!3328)))

(assert (=> d!100789 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!339223)))

(declare-fun bs!21406 () Bool)

(assert (= bs!21406 d!100789))

(assert (=> bs!21406 m!708129))

(declare-fun m!708439 () Bool)

(assert (=> bs!21406 m!708439))

(assert (=> bs!21406 m!708147))

(assert (=> b!761009 d!100789))

(declare-fun d!100793 () Bool)

(assert (=> d!100793 (= (validKeyInArray!0 (select (arr!20148 a!3186) j!159)) (and (not (= (select (arr!20148 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20148 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!760998 d!100793))

(declare-fun b!761462 () Bool)

(declare-fun e!424506 () SeekEntryResult!7748)

(assert (=> b!761462 (= e!424506 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20148 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!339224 () SeekEntryResult!7748)

(declare-fun d!100795 () Bool)

(assert (=> d!100795 (and (or (is-Undefined!7748 lt!339224) (not (is-Found!7748 lt!339224)) (and (bvsge (index!33361 lt!339224) #b00000000000000000000000000000000) (bvslt (index!33361 lt!339224) (size!20569 a!3186)))) (or (is-Undefined!7748 lt!339224) (is-Found!7748 lt!339224) (not (is-MissingVacant!7748 lt!339224)) (not (= (index!33363 lt!339224) resIntermediateIndex!5)) (and (bvsge (index!33363 lt!339224) #b00000000000000000000000000000000) (bvslt (index!33363 lt!339224) (size!20569 a!3186)))) (or (is-Undefined!7748 lt!339224) (ite (is-Found!7748 lt!339224) (= (select (arr!20148 a!3186) (index!33361 lt!339224)) (select (arr!20148 a!3186) j!159)) (and (is-MissingVacant!7748 lt!339224) (= (index!33363 lt!339224) resIntermediateIndex!5) (= (select (arr!20148 a!3186) (index!33363 lt!339224)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!424508 () SeekEntryResult!7748)

(assert (=> d!100795 (= lt!339224 e!424508)))

(declare-fun c!83647 () Bool)

(assert (=> d!100795 (= c!83647 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!339225 () (_ BitVec 64))

(assert (=> d!100795 (= lt!339225 (select (arr!20148 a!3186) index!1321))))

(assert (=> d!100795 (validMask!0 mask!3328)))

(assert (=> d!100795 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20148 a!3186) j!159) a!3186 mask!3328) lt!339224)))

(declare-fun b!761463 () Bool)

(assert (=> b!761463 (= e!424506 (MissingVacant!7748 resIntermediateIndex!5))))

(declare-fun b!761464 () Bool)

(declare-fun c!83649 () Bool)

(assert (=> b!761464 (= c!83649 (= lt!339225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424507 () SeekEntryResult!7748)

(assert (=> b!761464 (= e!424507 e!424506)))

(declare-fun b!761465 () Bool)

(assert (=> b!761465 (= e!424507 (Found!7748 index!1321))))

(declare-fun b!761466 () Bool)

(assert (=> b!761466 (= e!424508 e!424507)))

(declare-fun c!83648 () Bool)

(assert (=> b!761466 (= c!83648 (= lt!339225 (select (arr!20148 a!3186) j!159)))))

(declare-fun b!761467 () Bool)

(assert (=> b!761467 (= e!424508 Undefined!7748)))

(assert (= (and d!100795 c!83647) b!761467))

(assert (= (and d!100795 (not c!83647)) b!761466))

(assert (= (and b!761466 c!83648) b!761465))

(assert (= (and b!761466 (not c!83648)) b!761464))

(assert (= (and b!761464 c!83649) b!761463))

(assert (= (and b!761464 (not c!83649)) b!761462))

(declare-fun m!708441 () Bool)

(assert (=> b!761462 m!708441))

(assert (=> b!761462 m!708441))

(assert (=> b!761462 m!708105))

(declare-fun m!708443 () Bool)

(assert (=> b!761462 m!708443))

(declare-fun m!708445 () Bool)

(assert (=> d!100795 m!708445))

(declare-fun m!708447 () Bool)

(assert (=> d!100795 m!708447))

(declare-fun m!708449 () Bool)

(assert (=> d!100795 m!708449))

(assert (=> d!100795 m!708147))

(assert (=> b!761000 d!100795))

(declare-fun d!100797 () Bool)

(declare-fun e!424509 () Bool)

(assert (=> d!100797 e!424509))

(declare-fun c!83650 () Bool)

(declare-fun lt!339227 () SeekEntryResult!7748)

(assert (=> d!100797 (= c!83650 (and (is-Intermediate!7748 lt!339227) (undefined!8560 lt!339227)))))

(declare-fun e!424512 () SeekEntryResult!7748)

(assert (=> d!100797 (= lt!339227 e!424512)))

(declare-fun c!83652 () Bool)

(assert (=> d!100797 (= c!83652 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!339226 () (_ BitVec 64))

(assert (=> d!100797 (= lt!339226 (select (arr!20148 lt!339044) index!1321))))

(assert (=> d!100797 (validMask!0 mask!3328)))

(assert (=> d!100797 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339040 lt!339044 mask!3328) lt!339227)))

(declare-fun b!761468 () Bool)

(assert (=> b!761468 (and (bvsge (index!33362 lt!339227) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339227) (size!20569 lt!339044)))))

(declare-fun res!514939 () Bool)

(assert (=> b!761468 (= res!514939 (= (select (arr!20148 lt!339044) (index!33362 lt!339227)) lt!339040))))

(declare-fun e!424511 () Bool)

(assert (=> b!761468 (=> res!514939 e!424511)))

(declare-fun e!424513 () Bool)

(assert (=> b!761468 (= e!424513 e!424511)))

(declare-fun b!761469 () Bool)

(declare-fun e!424510 () SeekEntryResult!7748)

(assert (=> b!761469 (= e!424510 (Intermediate!7748 false index!1321 x!1131))))

(declare-fun b!761470 () Bool)

(assert (=> b!761470 (= e!424509 (bvsge (x!64262 lt!339227) #b01111111111111111111111111111110))))

(declare-fun b!761471 () Bool)

(assert (=> b!761471 (= e!424512 e!424510)))

(declare-fun c!83651 () Bool)

(assert (=> b!761471 (= c!83651 (or (= lt!339226 lt!339040) (= (bvadd lt!339226 lt!339226) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761472 () Bool)

(assert (=> b!761472 (= e!424510 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!339040 lt!339044 mask!3328))))

(declare-fun b!761473 () Bool)

(assert (=> b!761473 (= e!424512 (Intermediate!7748 true index!1321 x!1131))))

(declare-fun b!761474 () Bool)

(assert (=> b!761474 (= e!424509 e!424513)))

(declare-fun res!514938 () Bool)

(assert (=> b!761474 (= res!514938 (and (is-Intermediate!7748 lt!339227) (not (undefined!8560 lt!339227)) (bvslt (x!64262 lt!339227) #b01111111111111111111111111111110) (bvsge (x!64262 lt!339227) #b00000000000000000000000000000000) (bvsge (x!64262 lt!339227) x!1131)))))

(assert (=> b!761474 (=> (not res!514938) (not e!424513))))

(declare-fun b!761475 () Bool)

(assert (=> b!761475 (and (bvsge (index!33362 lt!339227) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339227) (size!20569 lt!339044)))))

(declare-fun res!514940 () Bool)

(assert (=> b!761475 (= res!514940 (= (select (arr!20148 lt!339044) (index!33362 lt!339227)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761475 (=> res!514940 e!424511)))

(declare-fun b!761476 () Bool)

(assert (=> b!761476 (and (bvsge (index!33362 lt!339227) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339227) (size!20569 lt!339044)))))

(assert (=> b!761476 (= e!424511 (= (select (arr!20148 lt!339044) (index!33362 lt!339227)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100797 c!83652) b!761473))

(assert (= (and d!100797 (not c!83652)) b!761471))

(assert (= (and b!761471 c!83651) b!761469))

(assert (= (and b!761471 (not c!83651)) b!761472))

(assert (= (and d!100797 c!83650) b!761470))

(assert (= (and d!100797 (not c!83650)) b!761474))

(assert (= (and b!761474 res!514938) b!761468))

(assert (= (and b!761468 (not res!514939)) b!761475))

(assert (= (and b!761475 (not res!514940)) b!761476))

(declare-fun m!708451 () Bool)

(assert (=> b!761476 m!708451))

(assert (=> b!761472 m!708441))

(assert (=> b!761472 m!708441))

(declare-fun m!708453 () Bool)

(assert (=> b!761472 m!708453))

(declare-fun m!708455 () Bool)

(assert (=> d!100797 m!708455))

(assert (=> d!100797 m!708147))

(assert (=> b!761468 m!708451))

(assert (=> b!761475 m!708451))

(assert (=> b!761010 d!100797))

(declare-fun d!100799 () Bool)

(declare-fun e!424514 () Bool)

(assert (=> d!100799 e!424514))

(declare-fun c!83653 () Bool)

(declare-fun lt!339229 () SeekEntryResult!7748)

(assert (=> d!100799 (= c!83653 (and (is-Intermediate!7748 lt!339229) (undefined!8560 lt!339229)))))

(declare-fun e!424517 () SeekEntryResult!7748)

(assert (=> d!100799 (= lt!339229 e!424517)))

(declare-fun c!83655 () Bool)

(assert (=> d!100799 (= c!83655 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!339228 () (_ BitVec 64))

(assert (=> d!100799 (= lt!339228 (select (arr!20148 lt!339044) (toIndex!0 lt!339040 mask!3328)))))

(assert (=> d!100799 (validMask!0 mask!3328)))

(assert (=> d!100799 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339040 mask!3328) lt!339040 lt!339044 mask!3328) lt!339229)))

(declare-fun b!761477 () Bool)

(assert (=> b!761477 (and (bvsge (index!33362 lt!339229) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339229) (size!20569 lt!339044)))))

(declare-fun res!514942 () Bool)

(assert (=> b!761477 (= res!514942 (= (select (arr!20148 lt!339044) (index!33362 lt!339229)) lt!339040))))

(declare-fun e!424516 () Bool)

(assert (=> b!761477 (=> res!514942 e!424516)))

(declare-fun e!424518 () Bool)

(assert (=> b!761477 (= e!424518 e!424516)))

(declare-fun b!761478 () Bool)

(declare-fun e!424515 () SeekEntryResult!7748)

(assert (=> b!761478 (= e!424515 (Intermediate!7748 false (toIndex!0 lt!339040 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761479 () Bool)

(assert (=> b!761479 (= e!424514 (bvsge (x!64262 lt!339229) #b01111111111111111111111111111110))))

(declare-fun b!761480 () Bool)

(assert (=> b!761480 (= e!424517 e!424515)))

(declare-fun c!83654 () Bool)

(assert (=> b!761480 (= c!83654 (or (= lt!339228 lt!339040) (= (bvadd lt!339228 lt!339228) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761481 () Bool)

(assert (=> b!761481 (= e!424515 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!339040 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!339040 lt!339044 mask!3328))))

(declare-fun b!761482 () Bool)

(assert (=> b!761482 (= e!424517 (Intermediate!7748 true (toIndex!0 lt!339040 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!761483 () Bool)

(assert (=> b!761483 (= e!424514 e!424518)))

(declare-fun res!514941 () Bool)

(assert (=> b!761483 (= res!514941 (and (is-Intermediate!7748 lt!339229) (not (undefined!8560 lt!339229)) (bvslt (x!64262 lt!339229) #b01111111111111111111111111111110) (bvsge (x!64262 lt!339229) #b00000000000000000000000000000000) (bvsge (x!64262 lt!339229) #b00000000000000000000000000000000)))))

(assert (=> b!761483 (=> (not res!514941) (not e!424518))))

(declare-fun b!761484 () Bool)

(assert (=> b!761484 (and (bvsge (index!33362 lt!339229) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339229) (size!20569 lt!339044)))))

(declare-fun res!514943 () Bool)

(assert (=> b!761484 (= res!514943 (= (select (arr!20148 lt!339044) (index!33362 lt!339229)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761484 (=> res!514943 e!424516)))

(declare-fun b!761485 () Bool)

(assert (=> b!761485 (and (bvsge (index!33362 lt!339229) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339229) (size!20569 lt!339044)))))

(assert (=> b!761485 (= e!424516 (= (select (arr!20148 lt!339044) (index!33362 lt!339229)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100799 c!83655) b!761482))

(assert (= (and d!100799 (not c!83655)) b!761480))

(assert (= (and b!761480 c!83654) b!761478))

(assert (= (and b!761480 (not c!83654)) b!761481))

(assert (= (and d!100799 c!83653) b!761479))

(assert (= (and d!100799 (not c!83653)) b!761483))

(assert (= (and b!761483 res!514941) b!761477))

(assert (= (and b!761477 (not res!514942)) b!761484))

(assert (= (and b!761484 (not res!514943)) b!761485))

(declare-fun m!708457 () Bool)

(assert (=> b!761485 m!708457))

(assert (=> b!761481 m!708115))

(declare-fun m!708459 () Bool)

(assert (=> b!761481 m!708459))

(assert (=> b!761481 m!708459))

(declare-fun m!708461 () Bool)

(assert (=> b!761481 m!708461))

(assert (=> d!100799 m!708115))

(declare-fun m!708463 () Bool)

(assert (=> d!100799 m!708463))

(assert (=> d!100799 m!708147))

(assert (=> b!761477 m!708457))

(assert (=> b!761484 m!708457))

(assert (=> b!761010 d!100799))

(declare-fun d!100801 () Bool)

(declare-fun lt!339237 () (_ BitVec 32))

(declare-fun lt!339236 () (_ BitVec 32))

(assert (=> d!100801 (= lt!339237 (bvmul (bvxor lt!339236 (bvlshr lt!339236 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!100801 (= lt!339236 ((_ extract 31 0) (bvand (bvxor lt!339040 (bvlshr lt!339040 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!100801 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!514892 (let ((h!15228 ((_ extract 31 0) (bvand (bvxor lt!339040 (bvlshr lt!339040 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64271 (bvmul (bvxor h!15228 (bvlshr h!15228 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64271 (bvlshr x!64271 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!514892 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!514892 #b00000000000000000000000000000000))))))

(assert (=> d!100801 (= (toIndex!0 lt!339040 mask!3328) (bvand (bvxor lt!339237 (bvlshr lt!339237 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!761010 d!100801))

(assert (=> b!761012 d!100795))

(declare-fun e!424526 () SeekEntryResult!7748)

(declare-fun lt!339239 () SeekEntryResult!7748)

(declare-fun b!761494 () Bool)

(assert (=> b!761494 (= e!424526 (seekKeyOrZeroReturnVacant!0 (x!64262 lt!339239) (index!33362 lt!339239) (index!33362 lt!339239) k!2102 a!3186 mask!3328))))

(declare-fun b!761495 () Bool)

(declare-fun c!83660 () Bool)

(declare-fun lt!339238 () (_ BitVec 64))

(assert (=> b!761495 (= c!83660 (= lt!339238 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!424527 () SeekEntryResult!7748)

(assert (=> b!761495 (= e!424527 e!424526)))

(declare-fun b!761496 () Bool)

(declare-fun e!424525 () SeekEntryResult!7748)

(assert (=> b!761496 (= e!424525 Undefined!7748)))

(declare-fun d!100803 () Bool)

(declare-fun lt!339240 () SeekEntryResult!7748)

(assert (=> d!100803 (and (or (is-Undefined!7748 lt!339240) (not (is-Found!7748 lt!339240)) (and (bvsge (index!33361 lt!339240) #b00000000000000000000000000000000) (bvslt (index!33361 lt!339240) (size!20569 a!3186)))) (or (is-Undefined!7748 lt!339240) (is-Found!7748 lt!339240) (not (is-MissingZero!7748 lt!339240)) (and (bvsge (index!33360 lt!339240) #b00000000000000000000000000000000) (bvslt (index!33360 lt!339240) (size!20569 a!3186)))) (or (is-Undefined!7748 lt!339240) (is-Found!7748 lt!339240) (is-MissingZero!7748 lt!339240) (not (is-MissingVacant!7748 lt!339240)) (and (bvsge (index!33363 lt!339240) #b00000000000000000000000000000000) (bvslt (index!33363 lt!339240) (size!20569 a!3186)))) (or (is-Undefined!7748 lt!339240) (ite (is-Found!7748 lt!339240) (= (select (arr!20148 a!3186) (index!33361 lt!339240)) k!2102) (ite (is-MissingZero!7748 lt!339240) (= (select (arr!20148 a!3186) (index!33360 lt!339240)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7748 lt!339240) (= (select (arr!20148 a!3186) (index!33363 lt!339240)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!100803 (= lt!339240 e!424525)))

(declare-fun c!83659 () Bool)

(assert (=> d!100803 (= c!83659 (and (is-Intermediate!7748 lt!339239) (undefined!8560 lt!339239)))))

(assert (=> d!100803 (= lt!339239 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!100803 (validMask!0 mask!3328)))

(assert (=> d!100803 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!339240)))

(declare-fun b!761497 () Bool)

(assert (=> b!761497 (= e!424526 (MissingZero!7748 (index!33362 lt!339239)))))

(declare-fun b!761498 () Bool)

(assert (=> b!761498 (= e!424525 e!424527)))

(assert (=> b!761498 (= lt!339238 (select (arr!20148 a!3186) (index!33362 lt!339239)))))

(declare-fun c!83658 () Bool)

(assert (=> b!761498 (= c!83658 (= lt!339238 k!2102))))

(declare-fun b!761499 () Bool)

(assert (=> b!761499 (= e!424527 (Found!7748 (index!33362 lt!339239)))))

(assert (= (and d!100803 c!83659) b!761496))

(assert (= (and d!100803 (not c!83659)) b!761498))

(assert (= (and b!761498 c!83658) b!761499))

(assert (= (and b!761498 (not c!83658)) b!761495))

(assert (= (and b!761495 c!83660) b!761497))

(assert (= (and b!761495 (not c!83660)) b!761494))

(declare-fun m!708465 () Bool)

(assert (=> b!761494 m!708465))

(declare-fun m!708467 () Bool)

(assert (=> d!100803 m!708467))

(declare-fun m!708469 () Bool)

(assert (=> d!100803 m!708469))

(declare-fun m!708471 () Bool)

(assert (=> d!100803 m!708471))

(declare-fun m!708473 () Bool)

(assert (=> d!100803 m!708473))

(assert (=> d!100803 m!708469))

(declare-fun m!708475 () Bool)

(assert (=> d!100803 m!708475))

(assert (=> d!100803 m!708147))

(declare-fun m!708477 () Bool)

(assert (=> b!761498 m!708477))

(assert (=> b!761001 d!100803))

(declare-fun d!100805 () Bool)

(assert (=> d!100805 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!761013 d!100805))

(declare-fun d!100807 () Bool)

(declare-fun e!424528 () Bool)

(assert (=> d!100807 e!424528))

(declare-fun c!83661 () Bool)

(declare-fun lt!339242 () SeekEntryResult!7748)

(assert (=> d!100807 (= c!83661 (and (is-Intermediate!7748 lt!339242) (undefined!8560 lt!339242)))))

(declare-fun e!424531 () SeekEntryResult!7748)

(assert (=> d!100807 (= lt!339242 e!424531)))

(declare-fun c!83663 () Bool)

(assert (=> d!100807 (= c!83663 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!339241 () (_ BitVec 64))

(assert (=> d!100807 (= lt!339241 (select (arr!20148 a!3186) index!1321))))

(assert (=> d!100807 (validMask!0 mask!3328)))

(assert (=> d!100807 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20148 a!3186) j!159) a!3186 mask!3328) lt!339242)))

(declare-fun b!761500 () Bool)

(assert (=> b!761500 (and (bvsge (index!33362 lt!339242) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339242) (size!20569 a!3186)))))

(declare-fun res!514949 () Bool)

(assert (=> b!761500 (= res!514949 (= (select (arr!20148 a!3186) (index!33362 lt!339242)) (select (arr!20148 a!3186) j!159)))))

(declare-fun e!424530 () Bool)

(assert (=> b!761500 (=> res!514949 e!424530)))

(declare-fun e!424532 () Bool)

(assert (=> b!761500 (= e!424532 e!424530)))

(declare-fun b!761501 () Bool)

(declare-fun e!424529 () SeekEntryResult!7748)

(assert (=> b!761501 (= e!424529 (Intermediate!7748 false index!1321 x!1131))))

(declare-fun b!761502 () Bool)

(assert (=> b!761502 (= e!424528 (bvsge (x!64262 lt!339242) #b01111111111111111111111111111110))))

(declare-fun b!761503 () Bool)

(assert (=> b!761503 (= e!424531 e!424529)))

(declare-fun c!83662 () Bool)

(assert (=> b!761503 (= c!83662 (or (= lt!339241 (select (arr!20148 a!3186) j!159)) (= (bvadd lt!339241 lt!339241) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!761504 () Bool)

(assert (=> b!761504 (= e!424529 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20148 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!761505 () Bool)

(assert (=> b!761505 (= e!424531 (Intermediate!7748 true index!1321 x!1131))))

(declare-fun b!761506 () Bool)

(assert (=> b!761506 (= e!424528 e!424532)))

(declare-fun res!514948 () Bool)

(assert (=> b!761506 (= res!514948 (and (is-Intermediate!7748 lt!339242) (not (undefined!8560 lt!339242)) (bvslt (x!64262 lt!339242) #b01111111111111111111111111111110) (bvsge (x!64262 lt!339242) #b00000000000000000000000000000000) (bvsge (x!64262 lt!339242) x!1131)))))

(assert (=> b!761506 (=> (not res!514948) (not e!424532))))

(declare-fun b!761507 () Bool)

(assert (=> b!761507 (and (bvsge (index!33362 lt!339242) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339242) (size!20569 a!3186)))))

(declare-fun res!514950 () Bool)

(assert (=> b!761507 (= res!514950 (= (select (arr!20148 a!3186) (index!33362 lt!339242)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!761507 (=> res!514950 e!424530)))

(declare-fun b!761508 () Bool)

(assert (=> b!761508 (and (bvsge (index!33362 lt!339242) #b00000000000000000000000000000000) (bvslt (index!33362 lt!339242) (size!20569 a!3186)))))

(assert (=> b!761508 (= e!424530 (= (select (arr!20148 a!3186) (index!33362 lt!339242)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!100807 c!83663) b!761505))

(assert (= (and d!100807 (not c!83663)) b!761503))

(assert (= (and b!761503 c!83662) b!761501))

(assert (= (and b!761503 (not c!83662)) b!761504))

(assert (= (and d!100807 c!83661) b!761502))

(assert (= (and d!100807 (not c!83661)) b!761506))

(assert (= (and b!761506 res!514948) b!761500))

(assert (= (and b!761500 (not res!514949)) b!761507))

(assert (= (and b!761507 (not res!514950)) b!761508))

(declare-fun m!708479 () Bool)

(assert (=> b!761508 m!708479))

(assert (=> b!761504 m!708441))

(assert (=> b!761504 m!708441))

(assert (=> b!761504 m!708105))

(declare-fun m!708481 () Bool)

(assert (=> b!761504 m!708481))

(assert (=> d!100807 m!708449))

(assert (=> d!100807 m!708147))

(assert (=> b!761500 m!708479))

(assert (=> b!761507 m!708479))

(assert (=> b!761002 d!100807))

(push 1)

(assert (not b!761455))

(assert (not b!761472))

(assert (not b!761437))

(assert (not d!100807))

(assert (not b!761343))

(assert (not b!761504))

(assert (not b!761370))

(assert (not b!761367))

(assert (not bm!34972))

(assert (not b!761452))

(assert (not d!100773))

(assert (not d!100789))

(assert (not d!100797))

(assert (not d!100799))

(assert (not d!100741))

(assert (not d!100803))

(assert (not bm!34973))

(assert (not b!761462))

(assert (not b!761481))

(assert (not b!761438))

(assert (not b!761439))

(assert (not b!761262))

(assert (not b!761327))

(assert (not b!761419))

(assert (not d!100795))

(assert (not bm!34969))

(assert (not d!100725))

(assert (not b!761494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

