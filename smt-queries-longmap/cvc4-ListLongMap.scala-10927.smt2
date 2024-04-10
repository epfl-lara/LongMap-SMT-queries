; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127828 () Bool)

(assert start!127828)

(declare-fun b!1502185 () Bool)

(declare-fun res!1023263 () Bool)

(declare-fun e!840186 () Bool)

(assert (=> b!1502185 (=> (not res!1023263) (not e!840186))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100209 0))(
  ( (array!100210 (arr!48364 (Array (_ BitVec 32) (_ BitVec 64))) (size!48914 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100209)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12562 0))(
  ( (MissingZero!12562 (index!52640 (_ BitVec 32))) (Found!12562 (index!52641 (_ BitVec 32))) (Intermediate!12562 (undefined!13374 Bool) (index!52642 (_ BitVec 32)) (x!134324 (_ BitVec 32))) (Undefined!12562) (MissingVacant!12562 (index!52643 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100209 (_ BitVec 32)) SeekEntryResult!12562)

(assert (=> b!1502185 (= res!1023263 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48364 a!2850) j!87) a!2850 mask!2661) (Found!12562 j!87)))))

(declare-fun b!1502186 () Bool)

(declare-fun res!1023266 () Bool)

(assert (=> b!1502186 (=> (not res!1023266) (not e!840186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502186 (= res!1023266 (validKeyInArray!0 (select (arr!48364 a!2850) j!87)))))

(declare-fun b!1502187 () Bool)

(assert (=> b!1502187 (= e!840186 (and (= (select (arr!48364 a!2850) index!625) (select (arr!48364 a!2850) j!87)) (not (= j!87 index!625))))))

(declare-fun b!1502188 () Bool)

(declare-fun res!1023265 () Bool)

(assert (=> b!1502188 (=> (not res!1023265) (not e!840186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100209 (_ BitVec 32)) Bool)

(assert (=> b!1502188 (= res!1023265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502189 () Bool)

(declare-fun res!1023262 () Bool)

(assert (=> b!1502189 (=> (not res!1023262) (not e!840186))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502189 (= res!1023262 (and (= (size!48914 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48914 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48914 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502190 () Bool)

(declare-fun res!1023267 () Bool)

(assert (=> b!1502190 (=> (not res!1023267) (not e!840186))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502190 (= res!1023267 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48914 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48914 a!2850)) (= (select (arr!48364 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48364 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48914 a!2850))))))

(declare-fun b!1502191 () Bool)

(declare-fun res!1023264 () Bool)

(assert (=> b!1502191 (=> (not res!1023264) (not e!840186))))

(declare-datatypes ((List!34856 0))(
  ( (Nil!34853) (Cons!34852 (h!36249 (_ BitVec 64)) (t!49550 List!34856)) )
))
(declare-fun arrayNoDuplicates!0 (array!100209 (_ BitVec 32) List!34856) Bool)

(assert (=> b!1502191 (= res!1023264 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34853))))

(declare-fun b!1502192 () Bool)

(declare-fun res!1023261 () Bool)

(assert (=> b!1502192 (=> (not res!1023261) (not e!840186))))

(assert (=> b!1502192 (= res!1023261 (validKeyInArray!0 (select (arr!48364 a!2850) i!996)))))

(declare-fun res!1023268 () Bool)

(assert (=> start!127828 (=> (not res!1023268) (not e!840186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127828 (= res!1023268 (validMask!0 mask!2661))))

(assert (=> start!127828 e!840186))

(assert (=> start!127828 true))

(declare-fun array_inv!37392 (array!100209) Bool)

(assert (=> start!127828 (array_inv!37392 a!2850)))

(assert (= (and start!127828 res!1023268) b!1502189))

(assert (= (and b!1502189 res!1023262) b!1502192))

(assert (= (and b!1502192 res!1023261) b!1502186))

(assert (= (and b!1502186 res!1023266) b!1502188))

(assert (= (and b!1502188 res!1023265) b!1502191))

(assert (= (and b!1502191 res!1023264) b!1502190))

(assert (= (and b!1502190 res!1023267) b!1502185))

(assert (= (and b!1502185 res!1023263) b!1502187))

(declare-fun m!1385495 () Bool)

(assert (=> b!1502188 m!1385495))

(declare-fun m!1385497 () Bool)

(assert (=> b!1502192 m!1385497))

(assert (=> b!1502192 m!1385497))

(declare-fun m!1385499 () Bool)

(assert (=> b!1502192 m!1385499))

(declare-fun m!1385501 () Bool)

(assert (=> b!1502190 m!1385501))

(declare-fun m!1385503 () Bool)

(assert (=> b!1502190 m!1385503))

(declare-fun m!1385505 () Bool)

(assert (=> b!1502190 m!1385505))

(declare-fun m!1385507 () Bool)

(assert (=> b!1502185 m!1385507))

(assert (=> b!1502185 m!1385507))

(declare-fun m!1385509 () Bool)

(assert (=> b!1502185 m!1385509))

(assert (=> b!1502186 m!1385507))

(assert (=> b!1502186 m!1385507))

(declare-fun m!1385511 () Bool)

(assert (=> b!1502186 m!1385511))

(declare-fun m!1385513 () Bool)

(assert (=> b!1502187 m!1385513))

(assert (=> b!1502187 m!1385507))

(declare-fun m!1385515 () Bool)

(assert (=> start!127828 m!1385515))

(declare-fun m!1385517 () Bool)

(assert (=> start!127828 m!1385517))

(declare-fun m!1385519 () Bool)

(assert (=> b!1502191 m!1385519))

(push 1)

(assert (not b!1502185))

(assert (not b!1502188))

(assert (not b!1502191))

(assert (not start!127828))

(assert (not b!1502192))

(assert (not b!1502186))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun lt!653331 () SeekEntryResult!12562)

(declare-fun d!157669 () Bool)

(assert (=> d!157669 (and (or (is-Undefined!12562 lt!653331) (not (is-Found!12562 lt!653331)) (and (bvsge (index!52641 lt!653331) #b00000000000000000000000000000000) (bvslt (index!52641 lt!653331) (size!48914 a!2850)))) (or (is-Undefined!12562 lt!653331) (is-Found!12562 lt!653331) (not (is-MissingVacant!12562 lt!653331)) (not (= (index!52643 lt!653331) vacantBefore!10)) (and (bvsge (index!52643 lt!653331) #b00000000000000000000000000000000) (bvslt (index!52643 lt!653331) (size!48914 a!2850)))) (or (is-Undefined!12562 lt!653331) (ite (is-Found!12562 lt!653331) (= (select (arr!48364 a!2850) (index!52641 lt!653331)) (select (arr!48364 a!2850) j!87)) (and (is-MissingVacant!12562 lt!653331) (= (index!52643 lt!653331) vacantBefore!10) (= (select (arr!48364 a!2850) (index!52643 lt!653331)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!840228 () SeekEntryResult!12562)

(assert (=> d!157669 (= lt!653331 e!840228)))

(declare-fun c!139013 () Bool)

(assert (=> d!157669 (= c!139013 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!653332 () (_ BitVec 64))

(assert (=> d!157669 (= lt!653332 (select (arr!48364 a!2850) index!625))))

(assert (=> d!157669 (validMask!0 mask!2661)))

(assert (=> d!157669 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48364 a!2850) j!87) a!2850 mask!2661) lt!653331)))

(declare-fun b!1502247 () Bool)

(declare-fun e!840229 () SeekEntryResult!12562)

(assert (=> b!1502247 (= e!840229 (MissingVacant!12562 vacantBefore!10))))

(declare-fun b!1502248 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502248 (= e!840229 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 x!647 mask!2661) vacantBefore!10 (select (arr!48364 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502249 () Bool)

(declare-fun c!139012 () Bool)

(assert (=> b!1502249 (= c!139012 (= lt!653332 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!840227 () SeekEntryResult!12562)

(assert (=> b!1502249 (= e!840227 e!840229)))

(declare-fun b!1502250 () Bool)

(assert (=> b!1502250 (= e!840228 e!840227)))

(declare-fun c!139011 () Bool)

(assert (=> b!1502250 (= c!139011 (= lt!653332 (select (arr!48364 a!2850) j!87)))))

(declare-fun b!1502251 () Bool)

(assert (=> b!1502251 (= e!840228 Undefined!12562)))

(declare-fun b!1502252 () Bool)

(assert (=> b!1502252 (= e!840227 (Found!12562 index!625))))

(assert (= (and d!157669 c!139013) b!1502251))

(assert (= (and d!157669 (not c!139013)) b!1502250))

(assert (= (and b!1502250 c!139011) b!1502252))

(assert (= (and b!1502250 (not c!139011)) b!1502249))

(assert (= (and b!1502249 c!139012) b!1502247))

(assert (= (and b!1502249 (not c!139012)) b!1502248))

(declare-fun m!1385545 () Bool)

(assert (=> d!157669 m!1385545))

(declare-fun m!1385547 () Bool)

(assert (=> d!157669 m!1385547))

(assert (=> d!157669 m!1385513))

(assert (=> d!157669 m!1385515))

(declare-fun m!1385549 () Bool)

(assert (=> b!1502248 m!1385549))

(assert (=> b!1502248 m!1385549))

(assert (=> b!1502248 m!1385507))

(declare-fun m!1385551 () Bool)

(assert (=> b!1502248 m!1385551))

(assert (=> b!1502185 d!157669))

(declare-fun b!1502275 () Bool)

(declare-fun e!840247 () Bool)

(declare-fun call!68079 () Bool)

(assert (=> b!1502275 (= e!840247 call!68079)))

(declare-fun b!1502276 () Bool)

(declare-fun e!840246 () Bool)

(declare-fun contains!9943 (List!34856 (_ BitVec 64)) Bool)

(assert (=> b!1502276 (= e!840246 (contains!9943 Nil!34853 (select (arr!48364 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502277 () Bool)

(declare-fun e!840244 () Bool)

(declare-fun e!840245 () Bool)

(assert (=> b!1502277 (= e!840244 e!840245)))

(declare-fun res!1023299 () Bool)

(assert (=> b!1502277 (=> (not res!1023299) (not e!840245))))

(assert (=> b!1502277 (= res!1023299 (not e!840246))))

(declare-fun res!1023301 () Bool)

