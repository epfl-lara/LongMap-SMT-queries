; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127462 () Bool)

(assert start!127462)

(declare-fun b!1497949 () Bool)

(declare-fun e!838802 () Bool)

(declare-datatypes ((List!34691 0))(
  ( (Nil!34688) (Cons!34687 (h!36084 (_ BitVec 64)) (t!49385 List!34691)) )
))
(declare-fun contains!9940 (List!34691 (_ BitVec 64)) Bool)

(assert (=> b!1497949 (= e!838802 (contains!9940 Nil!34688 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497951 () Bool)

(declare-fun res!1019045 () Bool)

(declare-fun e!838803 () Bool)

(assert (=> b!1497951 (=> (not res!1019045) (not e!838803))))

(declare-datatypes ((array!99876 0))(
  ( (array!99877 (arr!48199 (Array (_ BitVec 32) (_ BitVec 64))) (size!48749 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99876)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497951 (= res!1019045 (validKeyInArray!0 (select (arr!48199 a!2850) i!996)))))

(declare-fun b!1497952 () Bool)

(assert (=> b!1497952 (= e!838803 e!838802)))

(declare-fun res!1019050 () Bool)

(assert (=> b!1497952 (=> res!1019050 e!838802)))

(assert (=> b!1497952 (= res!1019050 (contains!9940 Nil!34688 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497953 () Bool)

(declare-fun res!1019049 () Bool)

(assert (=> b!1497953 (=> (not res!1019049) (not e!838803))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497953 (= res!1019049 (validKeyInArray!0 (select (arr!48199 a!2850) j!87)))))

(declare-fun b!1497954 () Bool)

(declare-fun res!1019044 () Bool)

(assert (=> b!1497954 (=> (not res!1019044) (not e!838803))))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1497954 (= res!1019044 (and (= (size!48749 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48749 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48749 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497955 () Bool)

(declare-fun res!1019046 () Bool)

(assert (=> b!1497955 (=> (not res!1019046) (not e!838803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99876 (_ BitVec 32)) Bool)

(assert (=> b!1497955 (= res!1019046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497956 () Bool)

(declare-fun res!1019047 () Bool)

(assert (=> b!1497956 (=> (not res!1019047) (not e!838803))))

(declare-fun noDuplicate!2623 (List!34691) Bool)

(assert (=> b!1497956 (= res!1019047 (noDuplicate!2623 Nil!34688))))

(declare-fun b!1497950 () Bool)

(declare-fun res!1019043 () Bool)

(assert (=> b!1497950 (=> (not res!1019043) (not e!838803))))

(assert (=> b!1497950 (= res!1019043 (and (bvsle #b00000000000000000000000000000000 (size!48749 a!2850)) (bvslt (size!48749 a!2850) #b01111111111111111111111111111111)))))

(declare-fun res!1019048 () Bool)

(assert (=> start!127462 (=> (not res!1019048) (not e!838803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127462 (= res!1019048 (validMask!0 mask!2661))))

(assert (=> start!127462 e!838803))

(assert (=> start!127462 true))

(declare-fun array_inv!37227 (array!99876) Bool)

(assert (=> start!127462 (array_inv!37227 a!2850)))

(assert (= (and start!127462 res!1019048) b!1497954))

(assert (= (and b!1497954 res!1019044) b!1497951))

(assert (= (and b!1497951 res!1019045) b!1497953))

(assert (= (and b!1497953 res!1019049) b!1497955))

(assert (= (and b!1497955 res!1019046) b!1497950))

(assert (= (and b!1497950 res!1019043) b!1497956))

(assert (= (and b!1497956 res!1019047) b!1497952))

(assert (= (and b!1497952 (not res!1019050)) b!1497949))

(declare-fun m!1381007 () Bool)

(assert (=> b!1497956 m!1381007))

(declare-fun m!1381009 () Bool)

(assert (=> start!127462 m!1381009))

(declare-fun m!1381011 () Bool)

(assert (=> start!127462 m!1381011))

(declare-fun m!1381013 () Bool)

(assert (=> b!1497949 m!1381013))

(declare-fun m!1381015 () Bool)

(assert (=> b!1497955 m!1381015))

(declare-fun m!1381017 () Bool)

(assert (=> b!1497953 m!1381017))

(assert (=> b!1497953 m!1381017))

(declare-fun m!1381019 () Bool)

(assert (=> b!1497953 m!1381019))

(declare-fun m!1381021 () Bool)

(assert (=> b!1497951 m!1381021))

(assert (=> b!1497951 m!1381021))

(declare-fun m!1381023 () Bool)

(assert (=> b!1497951 m!1381023))

(declare-fun m!1381025 () Bool)

(assert (=> b!1497952 m!1381025))

(push 1)

(assert (not b!1497953))

(assert (not b!1497952))

(assert (not start!127462))

(assert (not b!1497955))

(assert (not b!1497949))

(assert (not b!1497951))

(assert (not b!1497956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157505 () Bool)

(assert (=> d!157505 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127462 d!157505))

(declare-fun d!157507 () Bool)

(assert (=> d!157507 (= (array_inv!37227 a!2850) (bvsge (size!48749 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127462 d!157507))

(declare-fun d!157509 () Bool)

(declare-fun lt!652564 () Bool)

(declare-fun content!781 (List!34691) (Set (_ BitVec 64)))

(assert (=> d!157509 (= lt!652564 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!781 Nil!34688)))))

(declare-fun e!838816 () Bool)

(assert (=> d!157509 (= lt!652564 e!838816)))

(declare-fun res!1019062 () Bool)

(assert (=> d!157509 (=> (not res!1019062) (not e!838816))))

(assert (=> d!157509 (= res!1019062 (is-Cons!34687 Nil!34688))))

(assert (=> d!157509 (= (contains!9940 Nil!34688 #b0000000000000000000000000000000000000000000000000000000000000000) lt!652564)))

(declare-fun b!1497967 () Bool)

(declare-fun e!838815 () Bool)

(assert (=> b!1497967 (= e!838816 e!838815)))

(declare-fun res!1019061 () Bool)

(assert (=> b!1497967 (=> res!1019061 e!838815)))

(assert (=> b!1497967 (= res!1019061 (= (h!36084 Nil!34688) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497968 () Bool)

(assert (=> b!1497968 (= e!838815 (contains!9940 (t!49385 Nil!34688) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157509 res!1019062) b!1497967))

(assert (= (and b!1497967 (not res!1019061)) b!1497968))

(declare-fun m!1381033 () Bool)

(assert (=> d!157509 m!1381033))

(declare-fun m!1381035 () Bool)

(assert (=> d!157509 m!1381035))

(declare-fun m!1381037 () Bool)

(assert (=> b!1497968 m!1381037))

(assert (=> b!1497952 d!157509))

(declare-fun d!157511 () Bool)

(assert (=> d!157511 (= (validKeyInArray!0 (select (arr!48199 a!2850) j!87)) (and (not (= (select (arr!48199 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48199 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497953 d!157511))

(declare-fun d!157517 () Bool)

(declare-fun lt!652565 () Bool)

(assert (=> d!157517 (= lt!652565 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!781 Nil!34688)))))

(declare-fun e!838818 () Bool)

(assert (=> d!157517 (= lt!652565 e!838818)))

(declare-fun res!1019064 () Bool)

(assert (=> d!157517 (=> (not res!1019064) (not e!838818))))

(assert (=> d!157517 (= res!1019064 (is-Cons!34687 Nil!34688))))

(assert (=> d!157517 (= (contains!9940 Nil!34688 #b1000000000000000000000000000000000000000000000000000000000000000) lt!652565)))

(declare-fun b!1497969 () Bool)

(declare-fun e!838817 () Bool)

(assert (=> b!1497969 (= e!838818 e!838817)))

(declare-fun res!1019063 () Bool)

(assert (=> b!1497969 (=> res!1019063 e!838817)))

(assert (=> b!1497969 (= res!1019063 (= (h!36084 Nil!34688) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1497970 () Bool)

(assert (=> b!1497970 (= e!838817 (contains!9940 (t!49385 Nil!34688) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157517 res!1019064) b!1497969))

(assert (= (and b!1497969 (not res!1019063)) b!1497970))

(assert (=> d!157517 m!1381033))

(declare-fun m!1381039 () Bool)

(assert (=> d!157517 m!1381039))

(declare-fun m!1381041 () Bool)

(assert (=> b!1497970 m!1381041))

(assert (=> b!1497949 d!157517))

(declare-fun bm!68058 () Bool)

(declare-fun call!68061 () Bool)

(assert (=> bm!68058 (= call!68061 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1497989 () Bool)

(declare-fun e!838835 () Bool)

(declare-fun e!838836 () Bool)

(assert (=> b!1497989 (= e!838835 e!838836)))

(declare-fun c!138989 () Bool)

(assert (=> b!1497989 (= c!138989 (validKeyInArray!0 (select (arr!48199 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!157519 () Bool)

(declare-fun res!1019079 () Bool)

(assert (=> d!157519 (=> res!1019079 e!838835)))

(assert (=> d!157519 (= res!1019079 (bvsge #b00000000000000000000000000000000 (size!48749 a!2850)))))

(assert (=> d!157519 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!838835)))

(declare-fun b!1497990 () Bool)

(declare-fun e!838837 () Bool)

(assert (=> b!1497990 (= e!838837 call!68061)))

(declare-fun b!1497991 () Bool)

(assert (=> b!1497991 (= e!838836 call!68061)))

(declare-fun b!1497992 () Bool)

(assert (=> b!1497992 (= e!838836 e!838837)))

(declare-fun lt!652576 () (_ BitVec 64))

(assert (=> b!1497992 (= lt!652576 (select (arr!48199 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50204 0))(
  ( (Unit!50205) )
))
(declare-fun lt!652578 () Unit!50204)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99876 (_ BitVec 64) (_ BitVec 32)) Unit!50204)

(assert (=> b!1497992 (= lt!652578 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652576 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99876 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497992 (arrayContainsKey!0 a!2850 lt!652576 #b00000000000000000000000000000000)))

(declare-fun lt!652577 () Unit!50204)

(assert (=> b!1497992 (= lt!652577 lt!652578)))

(declare-fun res!1019080 () Bool)

(declare-datatypes ((SeekEntryResult!12432 0))(
  ( (MissingZero!12432 (index!52120 (_ BitVec 32))) (Found!12432 (index!52121 (_ BitVec 32))) (Intermediate!12432 (undefined!13244 Bool) (index!52122 (_ BitVec 32)) (x!133754 (_ BitVec 32))) (Undefined!12432) (MissingVacant!12432 (index!52123 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99876 (_ BitVec 32)) SeekEntryResult!12432)

(assert (=> b!1497992 (= res!1019080 (= (seekEntryOrOpen!0 (select (arr!48199 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12432 #b00000000000000000000000000000000)))))

(assert (=> b!1497992 (=> (not res!1019080) (not e!838837))))

(assert (= (and d!157519 (not res!1019079)) b!1497989))

(assert (= (and b!1497989 c!138989) b!1497992))

(assert (= (and b!1497989 (not c!138989)) b!1497991))

(assert (= (and b!1497992 res!1019080) b!1497990))

(assert (= (or b!1497990 b!1497991) bm!68058))

(declare-fun m!1381053 () Bool)

(assert (=> bm!68058 m!1381053))

(declare-fun m!1381055 () Bool)

(assert (=> b!1497989 m!1381055))

(assert (=> b!1497989 m!1381055))

(declare-fun m!1381057 () Bool)

(assert (=> b!1497989 m!1381057))

(assert (=> b!1497992 m!1381055))

(declare-fun m!1381059 () Bool)

(assert (=> b!1497992 m!1381059))

(declare-fun m!1381061 () Bool)

(assert (=> b!1497992 m!1381061))

(assert (=> b!1497992 m!1381055))

(declare-fun m!1381063 () Bool)

(assert (=> b!1497992 m!1381063))

(assert (=> b!1497955 d!157519))

(declare-fun d!157531 () Bool)

(assert (=> d!157531 (= (validKeyInArray!0 (select (arr!48199 a!2850) i!996)) (and (not (= (select (arr!48199 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48199 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1497951 d!157531))

(declare-fun d!157533 () Bool)

(declare-fun res!1019093 () Bool)

(declare-fun e!838852 () Bool)

(assert (=> d!157533 (=> res!1019093 e!838852)))

(assert (=> d!157533 (= res!1019093 (is-Nil!34688 Nil!34688))))

(assert (=> d!157533 (= (noDuplicate!2623 Nil!34688) e!838852)))

(declare-fun b!1498009 () Bool)

(declare-fun e!838853 () Bool)

(assert (=> b!1498009 (= e!838852 e!838853)))

(declare-fun res!1019094 () Bool)

(assert (=> b!1498009 (=> (not res!1019094) (not e!838853))))

(assert (=> b!1498009 (= res!1019094 (not (contains!9940 (t!49385 Nil!34688) (h!36084 Nil!34688))))))

(declare-fun b!1498010 () Bool)

(assert (=> b!1498010 (= e!838853 (noDuplicate!2623 (t!49385 Nil!34688)))))

(assert (= (and d!157533 (not res!1019093)) b!1498009))

(assert (= (and b!1498009 res!1019094) b!1498010))

(declare-fun m!1381069 () Bool)

(assert (=> b!1498009 m!1381069))

(declare-fun m!1381071 () Bool)

(assert (=> b!1498010 m!1381071))

(assert (=> b!1497956 d!157533))

(push 1)

