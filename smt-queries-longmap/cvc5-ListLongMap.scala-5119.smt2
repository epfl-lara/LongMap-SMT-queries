; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69482 () Bool)

(assert start!69482)

(declare-fun b!809934 () Bool)

(declare-fun res!553445 () Bool)

(declare-fun e!448324 () Bool)

(assert (=> b!809934 (=> (not res!553445) (not e!448324))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!44029 0))(
  ( (array!44030 (arr!21087 (Array (_ BitVec 32) (_ BitVec 64))) (size!21508 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44029)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!809934 (= res!553445 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21508 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21087 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21508 a!3170)) (= (select (arr!21087 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809935 () Bool)

(declare-fun res!553454 () Bool)

(declare-fun e!448323 () Bool)

(assert (=> b!809935 (=> (not res!553454) (not e!448323))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!809935 (= res!553454 (and (= (size!21508 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21508 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21508 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809936 () Bool)

(declare-fun res!553449 () Bool)

(declare-fun e!448325 () Bool)

(assert (=> b!809936 (=> (not res!553449) (not e!448325))))

(declare-datatypes ((SeekEntryResult!8678 0))(
  ( (MissingZero!8678 (index!37080 (_ BitVec 32))) (Found!8678 (index!37081 (_ BitVec 32))) (Intermediate!8678 (undefined!9490 Bool) (index!37082 (_ BitVec 32)) (x!67892 (_ BitVec 32))) (Undefined!8678) (MissingVacant!8678 (index!37083 (_ BitVec 32))) )
))
(declare-fun lt!362980 () SeekEntryResult!8678)

(declare-fun lt!362984 () (_ BitVec 64))

(declare-fun lt!362982 () (_ BitVec 32))

(declare-fun lt!362978 () array!44029)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44029 (_ BitVec 32)) SeekEntryResult!8678)

(assert (=> b!809936 (= res!553449 (= lt!362980 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362982 vacantAfter!23 lt!362984 lt!362978 mask!3266)))))

(declare-fun b!809937 () Bool)

(declare-fun res!553457 () Bool)

(assert (=> b!809937 (=> (not res!553457) (not e!448323))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!44029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809937 (= res!553457 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809938 () Bool)

(declare-fun e!448322 () Bool)

(assert (=> b!809938 (= e!448322 e!448325)))

(declare-fun res!553455 () Bool)

(assert (=> b!809938 (=> (not res!553455) (not e!448325))))

(assert (=> b!809938 (= res!553455 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!362982 #b00000000000000000000000000000000) (bvslt lt!362982 (size!21508 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809938 (= lt!362982 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!809939 () Bool)

(declare-fun res!553450 () Bool)

(assert (=> b!809939 (=> (not res!553450) (not e!448324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44029 (_ BitVec 32)) Bool)

(assert (=> b!809939 (= res!553450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809940 () Bool)

(declare-fun res!553446 () Bool)

(assert (=> b!809940 (=> (not res!553446) (not e!448323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809940 (= res!553446 (validKeyInArray!0 k!2044))))

(declare-fun res!553451 () Bool)

(assert (=> start!69482 (=> (not res!553451) (not e!448323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69482 (= res!553451 (validMask!0 mask!3266))))

(assert (=> start!69482 e!448323))

(assert (=> start!69482 true))

(declare-fun array_inv!16883 (array!44029) Bool)

(assert (=> start!69482 (array_inv!16883 a!3170)))

(declare-fun b!809941 () Bool)

(declare-fun res!553452 () Bool)

(assert (=> b!809941 (=> (not res!553452) (not e!448324))))

(declare-datatypes ((List!15050 0))(
  ( (Nil!15047) (Cons!15046 (h!16175 (_ BitVec 64)) (t!21365 List!15050)) )
))
(declare-fun arrayNoDuplicates!0 (array!44029 (_ BitVec 32) List!15050) Bool)

(assert (=> b!809941 (= res!553452 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15047))))

(declare-fun b!809942 () Bool)

(declare-fun res!553453 () Bool)

(assert (=> b!809942 (=> (not res!553453) (not e!448323))))

(assert (=> b!809942 (= res!553453 (validKeyInArray!0 (select (arr!21087 a!3170) j!153)))))

(declare-fun b!809943 () Bool)

(declare-fun lt!362979 () SeekEntryResult!8678)

(assert (=> b!809943 (= e!448325 (not (= lt!362979 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362982 vacantBefore!23 (select (arr!21087 a!3170) j!153) a!3170 mask!3266))))))

(declare-fun b!809944 () Bool)

(declare-fun e!448320 () Bool)

(assert (=> b!809944 (= e!448320 e!448322)))

(declare-fun res!553456 () Bool)

(assert (=> b!809944 (=> (not res!553456) (not e!448322))))

(declare-fun lt!362983 () SeekEntryResult!8678)

(assert (=> b!809944 (= res!553456 (and (= lt!362979 lt!362983) (= lt!362983 (Found!8678 j!153)) (not (= (select (arr!21087 a!3170) index!1236) (select (arr!21087 a!3170) j!153)))))))

(assert (=> b!809944 (= lt!362983 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21087 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44029 (_ BitVec 32)) SeekEntryResult!8678)

(assert (=> b!809944 (= lt!362979 (seekEntryOrOpen!0 (select (arr!21087 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809945 () Bool)

(assert (=> b!809945 (= e!448324 e!448320)))

(declare-fun res!553447 () Bool)

(assert (=> b!809945 (=> (not res!553447) (not e!448320))))

(assert (=> b!809945 (= res!553447 (= lt!362980 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362984 lt!362978 mask!3266)))))

(assert (=> b!809945 (= lt!362980 (seekEntryOrOpen!0 lt!362984 lt!362978 mask!3266))))

(assert (=> b!809945 (= lt!362984 (select (store (arr!21087 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!809945 (= lt!362978 (array!44030 (store (arr!21087 a!3170) i!1163 k!2044) (size!21508 a!3170)))))

(declare-fun b!809946 () Bool)

(assert (=> b!809946 (= e!448323 e!448324)))

(declare-fun res!553448 () Bool)

(assert (=> b!809946 (=> (not res!553448) (not e!448324))))

(declare-fun lt!362981 () SeekEntryResult!8678)

(assert (=> b!809946 (= res!553448 (or (= lt!362981 (MissingZero!8678 i!1163)) (= lt!362981 (MissingVacant!8678 i!1163))))))

(assert (=> b!809946 (= lt!362981 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69482 res!553451) b!809935))

(assert (= (and b!809935 res!553454) b!809942))

(assert (= (and b!809942 res!553453) b!809940))

(assert (= (and b!809940 res!553446) b!809937))

(assert (= (and b!809937 res!553457) b!809946))

(assert (= (and b!809946 res!553448) b!809939))

(assert (= (and b!809939 res!553450) b!809941))

(assert (= (and b!809941 res!553452) b!809934))

(assert (= (and b!809934 res!553445) b!809945))

(assert (= (and b!809945 res!553447) b!809944))

(assert (= (and b!809944 res!553456) b!809938))

(assert (= (and b!809938 res!553455) b!809936))

(assert (= (and b!809936 res!553449) b!809943))

(declare-fun m!752129 () Bool)

(assert (=> start!69482 m!752129))

(declare-fun m!752131 () Bool)

(assert (=> start!69482 m!752131))

(declare-fun m!752133 () Bool)

(assert (=> b!809946 m!752133))

(declare-fun m!752135 () Bool)

(assert (=> b!809942 m!752135))

(assert (=> b!809942 m!752135))

(declare-fun m!752137 () Bool)

(assert (=> b!809942 m!752137))

(declare-fun m!752139 () Bool)

(assert (=> b!809938 m!752139))

(assert (=> b!809943 m!752135))

(assert (=> b!809943 m!752135))

(declare-fun m!752141 () Bool)

(assert (=> b!809943 m!752141))

(declare-fun m!752143 () Bool)

(assert (=> b!809937 m!752143))

(declare-fun m!752145 () Bool)

(assert (=> b!809941 m!752145))

(declare-fun m!752147 () Bool)

(assert (=> b!809939 m!752147))

(declare-fun m!752149 () Bool)

(assert (=> b!809940 m!752149))

(declare-fun m!752151 () Bool)

(assert (=> b!809936 m!752151))

(declare-fun m!752153 () Bool)

(assert (=> b!809945 m!752153))

(declare-fun m!752155 () Bool)

(assert (=> b!809945 m!752155))

(declare-fun m!752157 () Bool)

(assert (=> b!809945 m!752157))

(declare-fun m!752159 () Bool)

(assert (=> b!809945 m!752159))

(declare-fun m!752161 () Bool)

(assert (=> b!809944 m!752161))

(assert (=> b!809944 m!752135))

(assert (=> b!809944 m!752135))

(declare-fun m!752163 () Bool)

(assert (=> b!809944 m!752163))

(assert (=> b!809944 m!752135))

(declare-fun m!752165 () Bool)

(assert (=> b!809944 m!752165))

(declare-fun m!752167 () Bool)

(assert (=> b!809934 m!752167))

(declare-fun m!752169 () Bool)

(assert (=> b!809934 m!752169))

(push 1)

(assert (not b!809937))

(assert (not b!809939))

(assert (not b!809946))

(assert (not start!69482))

(assert (not b!809943))

(assert (not b!809944))

(assert (not b!809940))

(assert (not b!809941))

(assert (not b!809936))

(assert (not b!809938))

(assert (not b!809945))

(assert (not b!809942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!104005 () Bool)

(declare-fun lt!363059 () SeekEntryResult!8678)

(assert (=> d!104005 (and (or (is-Undefined!8678 lt!363059) (not (is-Found!8678 lt!363059)) (and (bvsge (index!37081 lt!363059) #b00000000000000000000000000000000) (bvslt (index!37081 lt!363059) (size!21508 lt!362978)))) (or (is-Undefined!8678 lt!363059) (is-Found!8678 lt!363059) (not (is-MissingVacant!8678 lt!363059)) (not (= (index!37083 lt!363059) vacantAfter!23)) (and (bvsge (index!37083 lt!363059) #b00000000000000000000000000000000) (bvslt (index!37083 lt!363059) (size!21508 lt!362978)))) (or (is-Undefined!8678 lt!363059) (ite (is-Found!8678 lt!363059) (= (select (arr!21087 lt!362978) (index!37081 lt!363059)) lt!362984) (and (is-MissingVacant!8678 lt!363059) (= (index!37083 lt!363059) vacantAfter!23) (= (select (arr!21087 lt!362978) (index!37083 lt!363059)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448406 () SeekEntryResult!8678)

(assert (=> d!104005 (= lt!363059 e!448406)))

(declare-fun c!88685 () Bool)

(assert (=> d!104005 (= c!88685 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!363058 () (_ BitVec 64))

(assert (=> d!104005 (= lt!363058 (select (arr!21087 lt!362978) index!1236))))

(assert (=> d!104005 (validMask!0 mask!3266)))

(assert (=> d!104005 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362984 lt!362978 mask!3266) lt!363059)))

(declare-fun b!810097 () Bool)

(declare-fun e!448404 () SeekEntryResult!8678)

(assert (=> b!810097 (= e!448404 (MissingVacant!8678 vacantAfter!23))))

(declare-fun b!810098 () Bool)

(assert (=> b!810098 (= e!448406 Undefined!8678)))

(declare-fun b!810099 () Bool)

(declare-fun c!88687 () Bool)

(assert (=> b!810099 (= c!88687 (= lt!363058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448405 () SeekEntryResult!8678)

(assert (=> b!810099 (= e!448405 e!448404)))

(declare-fun b!810100 () Bool)

(assert (=> b!810100 (= e!448404 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantAfter!23 lt!362984 lt!362978 mask!3266))))

(declare-fun b!810101 () Bool)

(assert (=> b!810101 (= e!448406 e!448405)))

(declare-fun c!88686 () Bool)

(assert (=> b!810101 (= c!88686 (= lt!363058 lt!362984))))

(declare-fun b!810102 () Bool)

(assert (=> b!810102 (= e!448405 (Found!8678 index!1236))))

(assert (= (and d!104005 c!88685) b!810098))

(assert (= (and d!104005 (not c!88685)) b!810101))

(assert (= (and b!810101 c!88686) b!810102))

(assert (= (and b!810101 (not c!88686)) b!810099))

(assert (= (and b!810099 c!88687) b!810097))

(assert (= (and b!810099 (not c!88687)) b!810100))

(declare-fun m!752301 () Bool)

(assert (=> d!104005 m!752301))

(declare-fun m!752303 () Bool)

(assert (=> d!104005 m!752303))

(declare-fun m!752307 () Bool)

(assert (=> d!104005 m!752307))

(assert (=> d!104005 m!752129))

(assert (=> b!810100 m!752139))

(assert (=> b!810100 m!752139))

(declare-fun m!752313 () Bool)

(assert (=> b!810100 m!752313))

(assert (=> b!809945 d!104005))

(declare-fun b!810149 () Bool)

(declare-fun lt!363081 () SeekEntryResult!8678)

(declare-fun e!448434 () SeekEntryResult!8678)

(assert (=> b!810149 (= e!448434 (seekKeyOrZeroReturnVacant!0 (x!67892 lt!363081) (index!37082 lt!363081) (index!37082 lt!363081) lt!362984 lt!362978 mask!3266))))

(declare-fun d!104015 () Bool)

(declare-fun lt!363080 () SeekEntryResult!8678)

(assert (=> d!104015 (and (or (is-Undefined!8678 lt!363080) (not (is-Found!8678 lt!363080)) (and (bvsge (index!37081 lt!363080) #b00000000000000000000000000000000) (bvslt (index!37081 lt!363080) (size!21508 lt!362978)))) (or (is-Undefined!8678 lt!363080) (is-Found!8678 lt!363080) (not (is-MissingZero!8678 lt!363080)) (and (bvsge (index!37080 lt!363080) #b00000000000000000000000000000000) (bvslt (index!37080 lt!363080) (size!21508 lt!362978)))) (or (is-Undefined!8678 lt!363080) (is-Found!8678 lt!363080) (is-MissingZero!8678 lt!363080) (not (is-MissingVacant!8678 lt!363080)) (and (bvsge (index!37083 lt!363080) #b00000000000000000000000000000000) (bvslt (index!37083 lt!363080) (size!21508 lt!362978)))) (or (is-Undefined!8678 lt!363080) (ite (is-Found!8678 lt!363080) (= (select (arr!21087 lt!362978) (index!37081 lt!363080)) lt!362984) (ite (is-MissingZero!8678 lt!363080) (= (select (arr!21087 lt!362978) (index!37080 lt!363080)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8678 lt!363080) (= (select (arr!21087 lt!362978) (index!37083 lt!363080)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448435 () SeekEntryResult!8678)

(assert (=> d!104015 (= lt!363080 e!448435)))

(declare-fun c!88710 () Bool)

(assert (=> d!104015 (= c!88710 (and (is-Intermediate!8678 lt!363081) (undefined!9490 lt!363081)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44029 (_ BitVec 32)) SeekEntryResult!8678)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104015 (= lt!363081 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!362984 mask!3266) lt!362984 lt!362978 mask!3266))))

(assert (=> d!104015 (validMask!0 mask!3266)))

(assert (=> d!104015 (= (seekEntryOrOpen!0 lt!362984 lt!362978 mask!3266) lt!363080)))

(declare-fun b!810150 () Bool)

(declare-fun e!448433 () SeekEntryResult!8678)

(assert (=> b!810150 (= e!448435 e!448433)))

(declare-fun lt!363079 () (_ BitVec 64))

(assert (=> b!810150 (= lt!363079 (select (arr!21087 lt!362978) (index!37082 lt!363081)))))

(declare-fun c!88708 () Bool)

(assert (=> b!810150 (= c!88708 (= lt!363079 lt!362984))))

(declare-fun b!810151 () Bool)

(assert (=> b!810151 (= e!448433 (Found!8678 (index!37082 lt!363081)))))

(declare-fun b!810152 () Bool)

(assert (=> b!810152 (= e!448434 (MissingZero!8678 (index!37082 lt!363081)))))

(declare-fun b!810153 () Bool)

(declare-fun c!88709 () Bool)

(assert (=> b!810153 (= c!88709 (= lt!363079 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810153 (= e!448433 e!448434)))

(declare-fun b!810154 () Bool)

(assert (=> b!810154 (= e!448435 Undefined!8678)))

(assert (= (and d!104015 c!88710) b!810154))

(assert (= (and d!104015 (not c!88710)) b!810150))

(assert (= (and b!810150 c!88708) b!810151))

(assert (= (and b!810150 (not c!88708)) b!810153))

(assert (= (and b!810153 c!88709) b!810152))

(assert (= (and b!810153 (not c!88709)) b!810149))

(declare-fun m!752335 () Bool)

(assert (=> b!810149 m!752335))

(declare-fun m!752337 () Bool)

(assert (=> d!104015 m!752337))

(assert (=> d!104015 m!752129))

(declare-fun m!752339 () Bool)

(assert (=> d!104015 m!752339))

(declare-fun m!752341 () Bool)

(assert (=> d!104015 m!752341))

(declare-fun m!752343 () Bool)

(assert (=> d!104015 m!752343))

(assert (=> d!104015 m!752339))

(declare-fun m!752345 () Bool)

(assert (=> d!104015 m!752345))

(declare-fun m!752347 () Bool)

(assert (=> b!810150 m!752347))

(assert (=> b!809945 d!104015))

(declare-fun lt!363083 () SeekEntryResult!8678)

(declare-fun d!104031 () Bool)

(assert (=> d!104031 (and (or (is-Undefined!8678 lt!363083) (not (is-Found!8678 lt!363083)) (and (bvsge (index!37081 lt!363083) #b00000000000000000000000000000000) (bvslt (index!37081 lt!363083) (size!21508 a!3170)))) (or (is-Undefined!8678 lt!363083) (is-Found!8678 lt!363083) (not (is-MissingVacant!8678 lt!363083)) (not (= (index!37083 lt!363083) vacantBefore!23)) (and (bvsge (index!37083 lt!363083) #b00000000000000000000000000000000) (bvslt (index!37083 lt!363083) (size!21508 a!3170)))) (or (is-Undefined!8678 lt!363083) (ite (is-Found!8678 lt!363083) (= (select (arr!21087 a!3170) (index!37081 lt!363083)) (select (arr!21087 a!3170) j!153)) (and (is-MissingVacant!8678 lt!363083) (= (index!37083 lt!363083) vacantBefore!23) (= (select (arr!21087 a!3170) (index!37083 lt!363083)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448438 () SeekEntryResult!8678)

(assert (=> d!104031 (= lt!363083 e!448438)))

(declare-fun c!88711 () Bool)

(assert (=> d!104031 (= c!88711 (bvsge x!1077 #b01111111111111111111111111111110))))

(declare-fun lt!363082 () (_ BitVec 64))

(assert (=> d!104031 (= lt!363082 (select (arr!21087 a!3170) index!1236))))

(assert (=> d!104031 (validMask!0 mask!3266)))

(assert (=> d!104031 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21087 a!3170) j!153) a!3170 mask!3266) lt!363083)))

(declare-fun b!810155 () Bool)

(declare-fun e!448436 () SeekEntryResult!8678)

(assert (=> b!810155 (= e!448436 (MissingVacant!8678 vacantBefore!23))))

(declare-fun b!810156 () Bool)

(assert (=> b!810156 (= e!448438 Undefined!8678)))

(declare-fun b!810157 () Bool)

(declare-fun c!88713 () Bool)

(assert (=> b!810157 (= c!88713 (= lt!363082 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448437 () SeekEntryResult!8678)

(assert (=> b!810157 (= e!448437 e!448436)))

(declare-fun b!810158 () Bool)

(assert (=> b!810158 (= e!448436 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 x!1077 mask!3266) vacantBefore!23 (select (arr!21087 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810159 () Bool)

(assert (=> b!810159 (= e!448438 e!448437)))

(declare-fun c!88712 () Bool)

(assert (=> b!810159 (= c!88712 (= lt!363082 (select (arr!21087 a!3170) j!153)))))

(declare-fun b!810160 () Bool)

(assert (=> b!810160 (= e!448437 (Found!8678 index!1236))))

(assert (= (and d!104031 c!88711) b!810156))

(assert (= (and d!104031 (not c!88711)) b!810159))

(assert (= (and b!810159 c!88712) b!810160))

(assert (= (and b!810159 (not c!88712)) b!810157))

(assert (= (and b!810157 c!88713) b!810155))

(assert (= (and b!810157 (not c!88713)) b!810158))

(declare-fun m!752349 () Bool)

(assert (=> d!104031 m!752349))

(declare-fun m!752351 () Bool)

(assert (=> d!104031 m!752351))

(assert (=> d!104031 m!752161))

(assert (=> d!104031 m!752129))

(assert (=> b!810158 m!752139))

(assert (=> b!810158 m!752139))

(assert (=> b!810158 m!752135))

(declare-fun m!752353 () Bool)

(assert (=> b!810158 m!752353))

(assert (=> b!809944 d!104031))

(declare-fun lt!363089 () SeekEntryResult!8678)

(declare-fun b!810172 () Bool)

(declare-fun e!448447 () SeekEntryResult!8678)

(assert (=> b!810172 (= e!448447 (seekKeyOrZeroReturnVacant!0 (x!67892 lt!363089) (index!37082 lt!363089) (index!37082 lt!363089) (select (arr!21087 a!3170) j!153) a!3170 mask!3266))))

(declare-fun d!104033 () Bool)

(declare-fun lt!363088 () SeekEntryResult!8678)

(assert (=> d!104033 (and (or (is-Undefined!8678 lt!363088) (not (is-Found!8678 lt!363088)) (and (bvsge (index!37081 lt!363088) #b00000000000000000000000000000000) (bvslt (index!37081 lt!363088) (size!21508 a!3170)))) (or (is-Undefined!8678 lt!363088) (is-Found!8678 lt!363088) (not (is-MissingZero!8678 lt!363088)) (and (bvsge (index!37080 lt!363088) #b00000000000000000000000000000000) (bvslt (index!37080 lt!363088) (size!21508 a!3170)))) (or (is-Undefined!8678 lt!363088) (is-Found!8678 lt!363088) (is-MissingZero!8678 lt!363088) (not (is-MissingVacant!8678 lt!363088)) (and (bvsge (index!37083 lt!363088) #b00000000000000000000000000000000) (bvslt (index!37083 lt!363088) (size!21508 a!3170)))) (or (is-Undefined!8678 lt!363088) (ite (is-Found!8678 lt!363088) (= (select (arr!21087 a!3170) (index!37081 lt!363088)) (select (arr!21087 a!3170) j!153)) (ite (is-MissingZero!8678 lt!363088) (= (select (arr!21087 a!3170) (index!37080 lt!363088)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8678 lt!363088) (= (select (arr!21087 a!3170) (index!37083 lt!363088)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448448 () SeekEntryResult!8678)

(assert (=> d!104033 (= lt!363088 e!448448)))

(declare-fun c!88720 () Bool)

(assert (=> d!104033 (= c!88720 (and (is-Intermediate!8678 lt!363089) (undefined!9490 lt!363089)))))

(assert (=> d!104033 (= lt!363089 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21087 a!3170) j!153) mask!3266) (select (arr!21087 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104033 (validMask!0 mask!3266)))

(assert (=> d!104033 (= (seekEntryOrOpen!0 (select (arr!21087 a!3170) j!153) a!3170 mask!3266) lt!363088)))

(declare-fun b!810173 () Bool)

(declare-fun e!448446 () SeekEntryResult!8678)

(assert (=> b!810173 (= e!448448 e!448446)))

(declare-fun lt!363087 () (_ BitVec 64))

(assert (=> b!810173 (= lt!363087 (select (arr!21087 a!3170) (index!37082 lt!363089)))))

(declare-fun c!88718 () Bool)

(assert (=> b!810173 (= c!88718 (= lt!363087 (select (arr!21087 a!3170) j!153)))))

(declare-fun b!810174 () Bool)

(assert (=> b!810174 (= e!448446 (Found!8678 (index!37082 lt!363089)))))

(declare-fun b!810175 () Bool)

(assert (=> b!810175 (= e!448447 (MissingZero!8678 (index!37082 lt!363089)))))

(declare-fun b!810176 () Bool)

(declare-fun c!88719 () Bool)

(assert (=> b!810176 (= c!88719 (= lt!363087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810176 (= e!448446 e!448447)))

(declare-fun b!810177 () Bool)

(assert (=> b!810177 (= e!448448 Undefined!8678)))

(assert (= (and d!104033 c!88720) b!810177))

(assert (= (and d!104033 (not c!88720)) b!810173))

(assert (= (and b!810173 c!88718) b!810174))

(assert (= (and b!810173 (not c!88718)) b!810176))

(assert (= (and b!810176 c!88719) b!810175))

(assert (= (and b!810176 (not c!88719)) b!810172))

(assert (=> b!810172 m!752135))

(declare-fun m!752365 () Bool)

(assert (=> b!810172 m!752365))

(declare-fun m!752369 () Bool)

(assert (=> d!104033 m!752369))

(assert (=> d!104033 m!752129))

(assert (=> d!104033 m!752135))

(declare-fun m!752373 () Bool)

(assert (=> d!104033 m!752373))

(declare-fun m!752377 () Bool)

(assert (=> d!104033 m!752377))

(declare-fun m!752381 () Bool)

(assert (=> d!104033 m!752381))

(assert (=> d!104033 m!752373))

(assert (=> d!104033 m!752135))

(declare-fun m!752385 () Bool)

(assert (=> d!104033 m!752385))

(declare-fun m!752387 () Bool)

(assert (=> b!810173 m!752387))

(assert (=> b!809944 d!104033))

(declare-fun d!104039 () Bool)

(declare-fun lt!363091 () SeekEntryResult!8678)

(assert (=> d!104039 (and (or (is-Undefined!8678 lt!363091) (not (is-Found!8678 lt!363091)) (and (bvsge (index!37081 lt!363091) #b00000000000000000000000000000000) (bvslt (index!37081 lt!363091) (size!21508 a!3170)))) (or (is-Undefined!8678 lt!363091) (is-Found!8678 lt!363091) (not (is-MissingVacant!8678 lt!363091)) (not (= (index!37083 lt!363091) vacantBefore!23)) (and (bvsge (index!37083 lt!363091) #b00000000000000000000000000000000) (bvslt (index!37083 lt!363091) (size!21508 a!3170)))) (or (is-Undefined!8678 lt!363091) (ite (is-Found!8678 lt!363091) (= (select (arr!21087 a!3170) (index!37081 lt!363091)) (select (arr!21087 a!3170) j!153)) (and (is-MissingVacant!8678 lt!363091) (= (index!37083 lt!363091) vacantBefore!23) (= (select (arr!21087 a!3170) (index!37083 lt!363091)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448451 () SeekEntryResult!8678)

(assert (=> d!104039 (= lt!363091 e!448451)))

(declare-fun c!88721 () Bool)

(assert (=> d!104039 (= c!88721 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!363090 () (_ BitVec 64))

(assert (=> d!104039 (= lt!363090 (select (arr!21087 a!3170) lt!362982))))

(assert (=> d!104039 (validMask!0 mask!3266)))

(assert (=> d!104039 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362982 vacantBefore!23 (select (arr!21087 a!3170) j!153) a!3170 mask!3266) lt!363091)))

(declare-fun b!810178 () Bool)

(declare-fun e!448449 () SeekEntryResult!8678)

(assert (=> b!810178 (= e!448449 (MissingVacant!8678 vacantBefore!23))))

(declare-fun b!810179 () Bool)

(assert (=> b!810179 (= e!448451 Undefined!8678)))

(declare-fun b!810180 () Bool)

(declare-fun c!88723 () Bool)

(assert (=> b!810180 (= c!88723 (= lt!363090 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448450 () SeekEntryResult!8678)

(assert (=> b!810180 (= e!448450 e!448449)))

(declare-fun b!810181 () Bool)

(assert (=> b!810181 (= e!448449 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!362982 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantBefore!23 (select (arr!21087 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810182 () Bool)

(assert (=> b!810182 (= e!448451 e!448450)))

(declare-fun c!88722 () Bool)

(assert (=> b!810182 (= c!88722 (= lt!363090 (select (arr!21087 a!3170) j!153)))))

(declare-fun b!810183 () Bool)

(assert (=> b!810183 (= e!448450 (Found!8678 lt!362982))))

(assert (= (and d!104039 c!88721) b!810179))

(assert (= (and d!104039 (not c!88721)) b!810182))

(assert (= (and b!810182 c!88722) b!810183))

(assert (= (and b!810182 (not c!88722)) b!810180))

(assert (= (and b!810180 c!88723) b!810178))

(assert (= (and b!810180 (not c!88723)) b!810181))

(declare-fun m!752389 () Bool)

(assert (=> d!104039 m!752389))

(declare-fun m!752391 () Bool)

(assert (=> d!104039 m!752391))

(declare-fun m!752393 () Bool)

(assert (=> d!104039 m!752393))

(assert (=> d!104039 m!752129))

(declare-fun m!752395 () Bool)

(assert (=> b!810181 m!752395))

(assert (=> b!810181 m!752395))

(assert (=> b!810181 m!752135))

(declare-fun m!752397 () Bool)

(assert (=> b!810181 m!752397))

(assert (=> b!809943 d!104039))

(declare-fun d!104041 () Bool)

(assert (=> d!104041 (= (validKeyInArray!0 (select (arr!21087 a!3170) j!153)) (and (not (= (select (arr!21087 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21087 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809942 d!104041))

(declare-fun b!810217 () Bool)

(declare-fun e!448482 () Bool)

(declare-fun contains!4134 (List!15050 (_ BitVec 64)) Bool)

(assert (=> b!810217 (= e!448482 (contains!4134 Nil!15047 (select (arr!21087 a!3170) #b00000000000000000000000000000000)))))

(declare-fun bm!35447 () Bool)

(declare-fun call!35450 () Bool)

(declare-fun c!88731 () Bool)

(assert (=> bm!35447 (= call!35450 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88731 (Cons!15046 (select (arr!21087 a!3170) #b00000000000000000000000000000000) Nil!15047) Nil!15047)))))

(declare-fun b!810219 () Bool)

(declare-fun e!448483 () Bool)

(declare-fun e!448478 () Bool)

(assert (=> b!810219 (= e!448483 e!448478)))

(assert (=> b!810219 (= c!88731 (validKeyInArray!0 (select (arr!21087 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810220 () Bool)

(assert (=> b!810220 (= e!448478 call!35450)))

(declare-fun b!810221 () Bool)

(assert (=> b!810221 (= e!448478 call!35450)))

(declare-fun d!104043 () Bool)

(declare-fun res!553576 () Bool)

(declare-fun e!448479 () Bool)

(assert (=> d!104043 (=> res!553576 e!448479)))

(assert (=> d!104043 (= res!553576 (bvsge #b00000000000000000000000000000000 (size!21508 a!3170)))))

(assert (=> d!104043 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15047) e!448479)))

(declare-fun b!810218 () Bool)

(assert (=> b!810218 (= e!448479 e!448483)))

(declare-fun res!553580 () Bool)

(assert (=> b!810218 (=> (not res!553580) (not e!448483))))

(assert (=> b!810218 (= res!553580 (not e!448482))))

(declare-fun res!553579 () Bool)

(assert (=> b!810218 (=> (not res!553579) (not e!448482))))

(assert (=> b!810218 (= res!553579 (validKeyInArray!0 (select (arr!21087 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!104043 (not res!553576)) b!810218))

(assert (= (and b!810218 res!553579) b!810217))

(assert (= (and b!810218 res!553580) b!810219))

(assert (= (and b!810219 c!88731) b!810221))

(assert (= (and b!810219 (not c!88731)) b!810220))

(assert (= (or b!810221 b!810220) bm!35447))

(declare-fun m!752403 () Bool)

(assert (=> b!810217 m!752403))

(assert (=> b!810217 m!752403))

(declare-fun m!752405 () Bool)

(assert (=> b!810217 m!752405))

(assert (=> bm!35447 m!752403))

(declare-fun m!752409 () Bool)

(assert (=> bm!35447 m!752409))

(assert (=> b!810219 m!752403))

(assert (=> b!810219 m!752403))

(declare-fun m!752411 () Bool)

(assert (=> b!810219 m!752411))

(assert (=> b!810218 m!752403))

(assert (=> b!810218 m!752403))

(assert (=> b!810218 m!752411))

(assert (=> b!809941 d!104043))

(declare-fun d!104047 () Bool)

(assert (=> d!104047 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!809940 d!104047))

(declare-fun b!810252 () Bool)

(declare-fun e!448505 () Bool)

(declare-fun e!448504 () Bool)

(assert (=> b!810252 (= e!448505 e!448504)))

(declare-fun lt!363117 () (_ BitVec 64))

(assert (=> b!810252 (= lt!363117 (select (arr!21087 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27634 0))(
  ( (Unit!27635) )
))
(declare-fun lt!363115 () Unit!27634)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44029 (_ BitVec 64) (_ BitVec 32)) Unit!27634)

(assert (=> b!810252 (= lt!363115 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!363117 #b00000000000000000000000000000000))))

(assert (=> b!810252 (arrayContainsKey!0 a!3170 lt!363117 #b00000000000000000000000000000000)))

(declare-fun lt!363116 () Unit!27634)

(assert (=> b!810252 (= lt!363116 lt!363115)))

(declare-fun res!553591 () Bool)

(assert (=> b!810252 (= res!553591 (= (seekEntryOrOpen!0 (select (arr!21087 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8678 #b00000000000000000000000000000000)))))

(assert (=> b!810252 (=> (not res!553591) (not e!448504))))

(declare-fun b!810253 () Bool)

(declare-fun call!35454 () Bool)

(assert (=> b!810253 (= e!448505 call!35454)))

(declare-fun d!104051 () Bool)

(declare-fun res!553592 () Bool)

(declare-fun e!448503 () Bool)

(assert (=> d!104051 (=> res!553592 e!448503)))

(assert (=> d!104051 (= res!553592 (bvsge #b00000000000000000000000000000000 (size!21508 a!3170)))))

(assert (=> d!104051 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448503)))

(declare-fun bm!35451 () Bool)

(assert (=> bm!35451 (= call!35454 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(declare-fun b!810254 () Bool)

(assert (=> b!810254 (= e!448503 e!448505)))

(declare-fun c!88741 () Bool)

(assert (=> b!810254 (= c!88741 (validKeyInArray!0 (select (arr!21087 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810255 () Bool)

(assert (=> b!810255 (= e!448504 call!35454)))

(assert (= (and d!104051 (not res!553592)) b!810254))

(assert (= (and b!810254 c!88741) b!810252))

(assert (= (and b!810254 (not c!88741)) b!810253))

(assert (= (and b!810252 res!553591) b!810255))

(assert (= (or b!810255 b!810253) bm!35451))

(assert (=> b!810252 m!752403))

(declare-fun m!752443 () Bool)

(assert (=> b!810252 m!752443))

(declare-fun m!752445 () Bool)

(assert (=> b!810252 m!752445))

(assert (=> b!810252 m!752403))

(declare-fun m!752447 () Bool)

(assert (=> b!810252 m!752447))

(declare-fun m!752449 () Bool)

(assert (=> bm!35451 m!752449))

(assert (=> b!810254 m!752403))

(assert (=> b!810254 m!752403))

(assert (=> b!810254 m!752411))

(assert (=> b!809939 d!104051))

(declare-fun d!104061 () Bool)

(declare-fun lt!363120 () (_ BitVec 32))

(assert (=> d!104061 (and (bvsge lt!363120 #b00000000000000000000000000000000) (bvslt lt!363120 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104061 (= lt!363120 (choose!52 index!1236 x!1077 mask!3266))))

(assert (=> d!104061 (validMask!0 mask!3266)))

(assert (=> d!104061 (= (nextIndex!0 index!1236 x!1077 mask!3266) lt!363120)))

(declare-fun bs!22431 () Bool)

(assert (= bs!22431 d!104061))

(declare-fun m!752451 () Bool)

(assert (=> bs!22431 m!752451))

(assert (=> bs!22431 m!752129))

(assert (=> b!809938 d!104061))

(declare-fun d!104063 () Bool)

(declare-fun res!553597 () Bool)

(declare-fun e!448510 () Bool)

(assert (=> d!104063 (=> res!553597 e!448510)))

(assert (=> d!104063 (= res!553597 (= (select (arr!21087 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!104063 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!448510)))

(declare-fun b!810260 () Bool)

(declare-fun e!448511 () Bool)

(assert (=> b!810260 (= e!448510 e!448511)))

(declare-fun res!553598 () Bool)

(assert (=> b!810260 (=> (not res!553598) (not e!448511))))

(assert (=> b!810260 (= res!553598 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21508 a!3170)))))

(declare-fun b!810261 () Bool)

(assert (=> b!810261 (= e!448511 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!104063 (not res!553597)) b!810260))

(assert (= (and b!810260 res!553598) b!810261))

(assert (=> d!104063 m!752403))

(declare-fun m!752453 () Bool)

(assert (=> b!810261 m!752453))

(assert (=> b!809937 d!104063))

(declare-fun lt!363122 () SeekEntryResult!8678)

(declare-fun d!104065 () Bool)

(assert (=> d!104065 (and (or (is-Undefined!8678 lt!363122) (not (is-Found!8678 lt!363122)) (and (bvsge (index!37081 lt!363122) #b00000000000000000000000000000000) (bvslt (index!37081 lt!363122) (size!21508 lt!362978)))) (or (is-Undefined!8678 lt!363122) (is-Found!8678 lt!363122) (not (is-MissingVacant!8678 lt!363122)) (not (= (index!37083 lt!363122) vacantAfter!23)) (and (bvsge (index!37083 lt!363122) #b00000000000000000000000000000000) (bvslt (index!37083 lt!363122) (size!21508 lt!362978)))) (or (is-Undefined!8678 lt!363122) (ite (is-Found!8678 lt!363122) (= (select (arr!21087 lt!362978) (index!37081 lt!363122)) lt!362984) (and (is-MissingVacant!8678 lt!363122) (= (index!37083 lt!363122) vacantAfter!23) (= (select (arr!21087 lt!362978) (index!37083 lt!363122)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!448514 () SeekEntryResult!8678)

(assert (=> d!104065 (= lt!363122 e!448514)))

(declare-fun c!88742 () Bool)

(assert (=> d!104065 (= c!88742 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(declare-fun lt!363121 () (_ BitVec 64))

(assert (=> d!104065 (= lt!363121 (select (arr!21087 lt!362978) lt!362982))))

(assert (=> d!104065 (validMask!0 mask!3266)))

(assert (=> d!104065 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362982 vacantAfter!23 lt!362984 lt!362978 mask!3266) lt!363122)))

(declare-fun b!810262 () Bool)

(declare-fun e!448512 () SeekEntryResult!8678)

(assert (=> b!810262 (= e!448512 (MissingVacant!8678 vacantAfter!23))))

(declare-fun b!810263 () Bool)

(assert (=> b!810263 (= e!448514 Undefined!8678)))

(declare-fun b!810264 () Bool)

(declare-fun c!88744 () Bool)

(assert (=> b!810264 (= c!88744 (= lt!363121 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448513 () SeekEntryResult!8678)

(assert (=> b!810264 (= e!448513 e!448512)))

(declare-fun b!810265 () Bool)

(assert (=> b!810265 (= e!448512 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!362982 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) vacantAfter!23 lt!362984 lt!362978 mask!3266))))

(declare-fun b!810266 () Bool)

(assert (=> b!810266 (= e!448514 e!448513)))

(declare-fun c!88743 () Bool)

(assert (=> b!810266 (= c!88743 (= lt!363121 lt!362984))))

(declare-fun b!810267 () Bool)

(assert (=> b!810267 (= e!448513 (Found!8678 lt!362982))))

(assert (= (and d!104065 c!88742) b!810263))

(assert (= (and d!104065 (not c!88742)) b!810266))

(assert (= (and b!810266 c!88743) b!810267))

(assert (= (and b!810266 (not c!88743)) b!810264))

(assert (= (and b!810264 c!88744) b!810262))

(assert (= (and b!810264 (not c!88744)) b!810265))

(declare-fun m!752455 () Bool)

(assert (=> d!104065 m!752455))

(declare-fun m!752457 () Bool)

(assert (=> d!104065 m!752457))

(declare-fun m!752459 () Bool)

(assert (=> d!104065 m!752459))

(assert (=> d!104065 m!752129))

(assert (=> b!810265 m!752395))

(assert (=> b!810265 m!752395))

(declare-fun m!752461 () Bool)

(assert (=> b!810265 m!752461))

(assert (=> b!809936 d!104065))

(declare-fun d!104071 () Bool)

(assert (=> d!104071 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69482 d!104071))

(declare-fun d!104073 () Bool)

(assert (=> d!104073 (= (array_inv!16883 a!3170) (bvsge (size!21508 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69482 d!104073))

(declare-fun e!448516 () SeekEntryResult!8678)

(declare-fun lt!363125 () SeekEntryResult!8678)

(declare-fun b!810268 () Bool)

(assert (=> b!810268 (= e!448516 (seekKeyOrZeroReturnVacant!0 (x!67892 lt!363125) (index!37082 lt!363125) (index!37082 lt!363125) k!2044 a!3170 mask!3266))))

(declare-fun d!104075 () Bool)

(declare-fun lt!363124 () SeekEntryResult!8678)

(assert (=> d!104075 (and (or (is-Undefined!8678 lt!363124) (not (is-Found!8678 lt!363124)) (and (bvsge (index!37081 lt!363124) #b00000000000000000000000000000000) (bvslt (index!37081 lt!363124) (size!21508 a!3170)))) (or (is-Undefined!8678 lt!363124) (is-Found!8678 lt!363124) (not (is-MissingZero!8678 lt!363124)) (and (bvsge (index!37080 lt!363124) #b00000000000000000000000000000000) (bvslt (index!37080 lt!363124) (size!21508 a!3170)))) (or (is-Undefined!8678 lt!363124) (is-Found!8678 lt!363124) (is-MissingZero!8678 lt!363124) (not (is-MissingVacant!8678 lt!363124)) (and (bvsge (index!37083 lt!363124) #b00000000000000000000000000000000) (bvslt (index!37083 lt!363124) (size!21508 a!3170)))) (or (is-Undefined!8678 lt!363124) (ite (is-Found!8678 lt!363124) (= (select (arr!21087 a!3170) (index!37081 lt!363124)) k!2044) (ite (is-MissingZero!8678 lt!363124) (= (select (arr!21087 a!3170) (index!37080 lt!363124)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8678 lt!363124) (= (select (arr!21087 a!3170) (index!37083 lt!363124)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!448517 () SeekEntryResult!8678)

(assert (=> d!104075 (= lt!363124 e!448517)))

(declare-fun c!88747 () Bool)

(assert (=> d!104075 (= c!88747 (and (is-Intermediate!8678 lt!363125) (undefined!9490 lt!363125)))))

(assert (=> d!104075 (= lt!363125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!104075 (validMask!0 mask!3266)))

(assert (=> d!104075 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!363124)))

(declare-fun b!810269 () Bool)

(declare-fun e!448515 () SeekEntryResult!8678)

(assert (=> b!810269 (= e!448517 e!448515)))

(declare-fun lt!363123 () (_ BitVec 64))

(assert (=> b!810269 (= lt!363123 (select (arr!21087 a!3170) (index!37082 lt!363125)))))

(declare-fun c!88745 () Bool)

(assert (=> b!810269 (= c!88745 (= lt!363123 k!2044))))

(declare-fun b!810270 () Bool)

(assert (=> b!810270 (= e!448515 (Found!8678 (index!37082 lt!363125)))))

(declare-fun b!810271 () Bool)

(assert (=> b!810271 (= e!448516 (MissingZero!8678 (index!37082 lt!363125)))))

(declare-fun b!810272 () Bool)

(declare-fun c!88746 () Bool)

(assert (=> b!810272 (= c!88746 (= lt!363123 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810272 (= e!448515 e!448516)))

(declare-fun b!810273 () Bool)

(assert (=> b!810273 (= e!448517 Undefined!8678)))

(assert (= (and d!104075 c!88747) b!810273))

(assert (= (and d!104075 (not c!88747)) b!810269))

(assert (= (and b!810269 c!88745) b!810270))

(assert (= (and b!810269 (not c!88745)) b!810272))

(assert (= (and b!810272 c!88746) b!810271))

(assert (= (and b!810272 (not c!88746)) b!810268))

(declare-fun m!752463 () Bool)

(assert (=> b!810268 m!752463))

(declare-fun m!752465 () Bool)

(assert (=> d!104075 m!752465))

(assert (=> d!104075 m!752129))

(declare-fun m!752467 () Bool)

(assert (=> d!104075 m!752467))

(declare-fun m!752469 () Bool)

(assert (=> d!104075 m!752469))

(declare-fun m!752471 () Bool)

(assert (=> d!104075 m!752471))

(assert (=> d!104075 m!752467))

(declare-fun m!752473 () Bool)

(assert (=> d!104075 m!752473))

(declare-fun m!752475 () Bool)

(assert (=> b!810269 m!752475))

(assert (=> b!809946 d!104075))

(push 1)

