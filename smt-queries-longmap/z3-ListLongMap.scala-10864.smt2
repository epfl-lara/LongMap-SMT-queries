; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127358 () Bool)

(assert start!127358)

(declare-fun b!1496933 () Bool)

(declare-fun res!1018189 () Bool)

(declare-fun e!838361 () Bool)

(assert (=> b!1496933 (=> (not res!1018189) (not e!838361))))

(declare-datatypes ((array!99820 0))(
  ( (array!99821 (arr!48174 (Array (_ BitVec 32) (_ BitVec 64))) (size!48724 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99820)

(declare-datatypes ((List!34675 0))(
  ( (Nil!34672) (Cons!34671 (h!36068 (_ BitVec 64)) (t!49369 List!34675)) )
))
(declare-fun arrayNoDuplicates!0 (array!99820 (_ BitVec 32) List!34675) Bool)

(assert (=> b!1496933 (= res!1018189 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34672))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!652260 () (_ BitVec 64))

(declare-fun lt!652263 () array!99820)

(declare-fun b!1496934 () Bool)

(declare-datatypes ((SeekEntryResult!12414 0))(
  ( (MissingZero!12414 (index!52048 (_ BitVec 32))) (Found!12414 (index!52049 (_ BitVec 32))) (Intermediate!12414 (undefined!13226 Bool) (index!52050 (_ BitVec 32)) (x!133672 (_ BitVec 32))) (Undefined!12414) (MissingVacant!12414 (index!52051 (_ BitVec 32))) )
))
(declare-fun lt!652264 () SeekEntryResult!12414)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!838358 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99820 (_ BitVec 32)) SeekEntryResult!12414)

(assert (=> b!1496934 (= e!838358 (= lt!652264 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652260 lt!652263 mask!2687)))))

(declare-fun b!1496935 () Bool)

(declare-fun res!1018198 () Bool)

(declare-fun e!838362 () Bool)

(assert (=> b!1496935 (=> res!1018198 e!838362)))

(declare-fun e!838360 () Bool)

(assert (=> b!1496935 (= res!1018198 e!838360)))

(declare-fun c!138907 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1496935 (= c!138907 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1496936 () Bool)

(declare-fun res!1018190 () Bool)

(assert (=> b!1496936 (=> (not res!1018190) (not e!838361))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1496936 (= res!1018190 (and (= (size!48724 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48724 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48724 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1496937 () Bool)

(declare-fun res!1018197 () Bool)

(assert (=> b!1496937 (=> res!1018197 e!838362)))

(declare-fun lt!652257 () SeekEntryResult!12414)

(declare-fun lt!652261 () (_ BitVec 32))

(assert (=> b!1496937 (= res!1018197 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652261 (select (arr!48174 a!2862) j!93) a!2862 mask!2687) lt!652257)))))

(declare-fun b!1496938 () Bool)

(declare-fun res!1018201 () Bool)

(assert (=> b!1496938 (=> (not res!1018201) (not e!838361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1496938 (= res!1018201 (validKeyInArray!0 (select (arr!48174 a!2862) j!93)))))

(declare-fun b!1496939 () Bool)

(declare-fun res!1018199 () Bool)

(declare-fun e!838356 () Bool)

(assert (=> b!1496939 (=> (not res!1018199) (not e!838356))))

(assert (=> b!1496939 (= res!1018199 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48174 a!2862) j!93) a!2862 mask!2687) lt!652257))))

(declare-fun b!1496940 () Bool)

(declare-fun e!838355 () Bool)

(assert (=> b!1496940 (= e!838356 e!838355)))

(declare-fun res!1018202 () Bool)

(assert (=> b!1496940 (=> (not res!1018202) (not e!838355))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1496940 (= res!1018202 (= lt!652264 (Intermediate!12414 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496940 (= lt!652264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652260 mask!2687) lt!652260 lt!652263 mask!2687))))

(assert (=> b!1496940 (= lt!652260 (select (store (arr!48174 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1496941 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99820 (_ BitVec 32)) SeekEntryResult!12414)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99820 (_ BitVec 32)) SeekEntryResult!12414)

(assert (=> b!1496941 (= e!838360 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652261 intermediateAfterIndex!19 lt!652260 lt!652263 mask!2687) (seekEntryOrOpen!0 lt!652260 lt!652263 mask!2687))))))

(declare-fun b!1496942 () Bool)

(declare-fun res!1018188 () Bool)

(assert (=> b!1496942 (=> (not res!1018188) (not e!838355))))

(assert (=> b!1496942 (= res!1018188 e!838358)))

(declare-fun c!138908 () Bool)

(assert (=> b!1496942 (= c!138908 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1496943 () Bool)

(declare-fun e!838359 () Bool)

(assert (=> b!1496943 (= e!838359 e!838362)))

(declare-fun res!1018192 () Bool)

(assert (=> b!1496943 (=> res!1018192 e!838362)))

(assert (=> b!1496943 (= res!1018192 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652261 #b00000000000000000000000000000000) (bvsge lt!652261 (size!48724 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1496943 (= lt!652261 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1496944 () Bool)

(declare-fun res!1018193 () Bool)

(assert (=> b!1496944 (=> (not res!1018193) (not e!838361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99820 (_ BitVec 32)) Bool)

(assert (=> b!1496944 (= res!1018193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1496945 () Bool)

(declare-fun res!1018203 () Bool)

(assert (=> b!1496945 (=> (not res!1018203) (not e!838361))))

(assert (=> b!1496945 (= res!1018203 (validKeyInArray!0 (select (arr!48174 a!2862) i!1006)))))

(declare-fun res!1018204 () Bool)

(assert (=> start!127358 (=> (not res!1018204) (not e!838361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127358 (= res!1018204 (validMask!0 mask!2687))))

(assert (=> start!127358 e!838361))

(assert (=> start!127358 true))

(declare-fun array_inv!37202 (array!99820) Bool)

(assert (=> start!127358 (array_inv!37202 a!2862)))

(declare-fun b!1496946 () Bool)

(assert (=> b!1496946 (= e!838355 (not e!838359))))

(declare-fun res!1018194 () Bool)

(assert (=> b!1496946 (=> res!1018194 e!838359)))

(assert (=> b!1496946 (= res!1018194 (or (and (= (select (arr!48174 a!2862) index!646) (select (store (arr!48174 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48174 a!2862) index!646) (select (arr!48174 a!2862) j!93))) (= (select (arr!48174 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!652262 () SeekEntryResult!12414)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1496946 (and (= lt!652262 (Found!12414 j!93)) (or (= (select (arr!48174 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48174 a!2862) intermediateBeforeIndex!19) (select (arr!48174 a!2862) j!93))))))

(assert (=> b!1496946 (= lt!652262 (seekEntryOrOpen!0 (select (arr!48174 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1496946 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50168 0))(
  ( (Unit!50169) )
))
(declare-fun lt!652258 () Unit!50168)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50168)

(assert (=> b!1496946 (= lt!652258 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1496947 () Bool)

(assert (=> b!1496947 (= e!838360 (not (= lt!652264 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652261 lt!652260 lt!652263 mask!2687))))))

(declare-fun b!1496948 () Bool)

(declare-fun e!838363 () Bool)

(assert (=> b!1496948 (= e!838363 e!838356)))

(declare-fun res!1018195 () Bool)

(assert (=> b!1496948 (=> (not res!1018195) (not e!838356))))

(assert (=> b!1496948 (= res!1018195 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48174 a!2862) j!93) mask!2687) (select (arr!48174 a!2862) j!93) a!2862 mask!2687) lt!652257))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1496948 (= lt!652257 (Intermediate!12414 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1496949 () Bool)

(assert (=> b!1496949 (= e!838362 true)))

(assert (=> b!1496949 (= lt!652262 (seekEntryOrOpen!0 lt!652260 lt!652263 mask!2687))))

(declare-fun lt!652259 () Unit!50168)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50168)

(assert (=> b!1496949 (= lt!652259 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652261 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1496950 () Bool)

(declare-fun res!1018200 () Bool)

(assert (=> b!1496950 (=> res!1018200 e!838362)))

(assert (=> b!1496950 (= res!1018200 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1496951 () Bool)

(declare-fun res!1018187 () Bool)

(assert (=> b!1496951 (=> (not res!1018187) (not e!838361))))

(assert (=> b!1496951 (= res!1018187 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48724 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48724 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48724 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1496952 () Bool)

(assert (=> b!1496952 (= e!838361 e!838363)))

(declare-fun res!1018196 () Bool)

(assert (=> b!1496952 (=> (not res!1018196) (not e!838363))))

(assert (=> b!1496952 (= res!1018196 (= (select (store (arr!48174 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1496952 (= lt!652263 (array!99821 (store (arr!48174 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48724 a!2862)))))

(declare-fun b!1496953 () Bool)

(assert (=> b!1496953 (= e!838358 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652260 lt!652263 mask!2687) (seekEntryOrOpen!0 lt!652260 lt!652263 mask!2687)))))

(declare-fun b!1496954 () Bool)

(declare-fun res!1018191 () Bool)

(assert (=> b!1496954 (=> (not res!1018191) (not e!838355))))

(assert (=> b!1496954 (= res!1018191 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127358 res!1018204) b!1496936))

(assert (= (and b!1496936 res!1018190) b!1496945))

(assert (= (and b!1496945 res!1018203) b!1496938))

(assert (= (and b!1496938 res!1018201) b!1496944))

(assert (= (and b!1496944 res!1018193) b!1496933))

(assert (= (and b!1496933 res!1018189) b!1496951))

(assert (= (and b!1496951 res!1018187) b!1496952))

(assert (= (and b!1496952 res!1018196) b!1496948))

(assert (= (and b!1496948 res!1018195) b!1496939))

(assert (= (and b!1496939 res!1018199) b!1496940))

(assert (= (and b!1496940 res!1018202) b!1496942))

(assert (= (and b!1496942 c!138908) b!1496934))

(assert (= (and b!1496942 (not c!138908)) b!1496953))

(assert (= (and b!1496942 res!1018188) b!1496954))

(assert (= (and b!1496954 res!1018191) b!1496946))

(assert (= (and b!1496946 (not res!1018194)) b!1496943))

(assert (= (and b!1496943 (not res!1018192)) b!1496937))

(assert (= (and b!1496937 (not res!1018197)) b!1496935))

(assert (= (and b!1496935 c!138907) b!1496947))

(assert (= (and b!1496935 (not c!138907)) b!1496941))

(assert (= (and b!1496935 (not res!1018198)) b!1496950))

(assert (= (and b!1496950 (not res!1018200)) b!1496949))

(declare-fun m!1380055 () Bool)

(assert (=> b!1496933 m!1380055))

(declare-fun m!1380057 () Bool)

(assert (=> b!1496946 m!1380057))

(declare-fun m!1380059 () Bool)

(assert (=> b!1496946 m!1380059))

(declare-fun m!1380061 () Bool)

(assert (=> b!1496946 m!1380061))

(declare-fun m!1380063 () Bool)

(assert (=> b!1496946 m!1380063))

(declare-fun m!1380065 () Bool)

(assert (=> b!1496946 m!1380065))

(declare-fun m!1380067 () Bool)

(assert (=> b!1496946 m!1380067))

(declare-fun m!1380069 () Bool)

(assert (=> b!1496946 m!1380069))

(declare-fun m!1380071 () Bool)

(assert (=> b!1496946 m!1380071))

(assert (=> b!1496946 m!1380067))

(declare-fun m!1380073 () Bool)

(assert (=> b!1496949 m!1380073))

(declare-fun m!1380075 () Bool)

(assert (=> b!1496949 m!1380075))

(declare-fun m!1380077 () Bool)

(assert (=> b!1496941 m!1380077))

(assert (=> b!1496941 m!1380073))

(assert (=> b!1496939 m!1380067))

(assert (=> b!1496939 m!1380067))

(declare-fun m!1380079 () Bool)

(assert (=> b!1496939 m!1380079))

(declare-fun m!1380081 () Bool)

(assert (=> b!1496953 m!1380081))

(assert (=> b!1496953 m!1380073))

(assert (=> b!1496937 m!1380067))

(assert (=> b!1496937 m!1380067))

(declare-fun m!1380083 () Bool)

(assert (=> b!1496937 m!1380083))

(assert (=> b!1496952 m!1380059))

(declare-fun m!1380085 () Bool)

(assert (=> b!1496952 m!1380085))

(declare-fun m!1380087 () Bool)

(assert (=> b!1496947 m!1380087))

(declare-fun m!1380089 () Bool)

(assert (=> start!127358 m!1380089))

(declare-fun m!1380091 () Bool)

(assert (=> start!127358 m!1380091))

(assert (=> b!1496938 m!1380067))

(assert (=> b!1496938 m!1380067))

(declare-fun m!1380093 () Bool)

(assert (=> b!1496938 m!1380093))

(declare-fun m!1380095 () Bool)

(assert (=> b!1496944 m!1380095))

(declare-fun m!1380097 () Bool)

(assert (=> b!1496934 m!1380097))

(declare-fun m!1380099 () Bool)

(assert (=> b!1496943 m!1380099))

(assert (=> b!1496948 m!1380067))

(assert (=> b!1496948 m!1380067))

(declare-fun m!1380101 () Bool)

(assert (=> b!1496948 m!1380101))

(assert (=> b!1496948 m!1380101))

(assert (=> b!1496948 m!1380067))

(declare-fun m!1380103 () Bool)

(assert (=> b!1496948 m!1380103))

(declare-fun m!1380105 () Bool)

(assert (=> b!1496940 m!1380105))

(assert (=> b!1496940 m!1380105))

(declare-fun m!1380107 () Bool)

(assert (=> b!1496940 m!1380107))

(assert (=> b!1496940 m!1380059))

(declare-fun m!1380109 () Bool)

(assert (=> b!1496940 m!1380109))

(declare-fun m!1380111 () Bool)

(assert (=> b!1496945 m!1380111))

(assert (=> b!1496945 m!1380111))

(declare-fun m!1380113 () Bool)

(assert (=> b!1496945 m!1380113))

(check-sat (not b!1496946) (not start!127358) (not b!1496939) (not b!1496940) (not b!1496953) (not b!1496944) (not b!1496937) (not b!1496948) (not b!1496947) (not b!1496933) (not b!1496949) (not b!1496943) (not b!1496938) (not b!1496934) (not b!1496941) (not b!1496945))
(check-sat)
