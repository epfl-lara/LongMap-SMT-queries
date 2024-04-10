; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127888 () Bool)

(assert start!127888)

(declare-fun res!1023583 () Bool)

(declare-fun e!840356 () Bool)

(assert (=> start!127888 (=> (not res!1023583) (not e!840356))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127888 (= res!1023583 (validMask!0 mask!2661))))

(assert (=> start!127888 e!840356))

(assert (=> start!127888 true))

(declare-datatypes ((array!100236 0))(
  ( (array!100237 (arr!48376 (Array (_ BitVec 32) (_ BitVec 64))) (size!48926 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100236)

(declare-fun array_inv!37404 (array!100236) Bool)

(assert (=> start!127888 (array_inv!37404 a!2850)))

(declare-fun b!1502589 () Bool)

(declare-fun res!1023577 () Bool)

(assert (=> b!1502589 (=> (not res!1023577) (not e!840356))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502589 (= res!1023577 (and (= (size!48926 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48926 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48926 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502590 () Bool)

(declare-fun res!1023581 () Bool)

(assert (=> b!1502590 (=> (not res!1023581) (not e!840356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100236 (_ BitVec 32)) Bool)

(assert (=> b!1502590 (= res!1023581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12574 0))(
  ( (MissingZero!12574 (index!52688 (_ BitVec 32))) (Found!12574 (index!52689 (_ BitVec 32))) (Intermediate!12574 (undefined!13386 Bool) (index!52690 (_ BitVec 32)) (x!134371 (_ BitVec 32))) (Undefined!12574) (MissingVacant!12574 (index!52691 (_ BitVec 32))) )
))
(declare-fun lt!653398 () SeekEntryResult!12574)

(declare-fun e!840358 () Bool)

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun b!1502591 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100236 (_ BitVec 32)) SeekEntryResult!12574)

(assert (=> b!1502591 (= e!840358 (not (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 (select (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100237 (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48926 a!2850)) mask!2661) lt!653398)))))

(declare-fun b!1502592 () Bool)

(declare-fun res!1023575 () Bool)

(assert (=> b!1502592 (=> (not res!1023575) (not e!840358))))

(assert (=> b!1502592 (= res!1023575 (and (= (select (arr!48376 a!2850) index!625) (select (arr!48376 a!2850) j!87)) (= j!87 index!625)))))

(declare-fun b!1502593 () Bool)

(declare-fun res!1023580 () Bool)

(assert (=> b!1502593 (=> (not res!1023580) (not e!840356))))

(declare-datatypes ((List!34868 0))(
  ( (Nil!34865) (Cons!34864 (h!36261 (_ BitVec 64)) (t!49562 List!34868)) )
))
(declare-fun arrayNoDuplicates!0 (array!100236 (_ BitVec 32) List!34868) Bool)

(assert (=> b!1502593 (= res!1023580 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34865))))

(declare-fun b!1502594 () Bool)

(declare-fun res!1023576 () Bool)

(assert (=> b!1502594 (=> (not res!1023576) (not e!840356))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1502594 (= res!1023576 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48926 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48926 a!2850)) (= (select (arr!48376 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48926 a!2850))))))

(declare-fun b!1502595 () Bool)

(assert (=> b!1502595 (= e!840356 e!840358)))

(declare-fun res!1023578 () Bool)

(assert (=> b!1502595 (=> (not res!1023578) (not e!840358))))

(assert (=> b!1502595 (= res!1023578 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48376 a!2850) j!87) a!2850 mask!2661) lt!653398))))

(assert (=> b!1502595 (= lt!653398 (Found!12574 j!87))))

(declare-fun b!1502596 () Bool)

(declare-fun res!1023582 () Bool)

(assert (=> b!1502596 (=> (not res!1023582) (not e!840356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502596 (= res!1023582 (validKeyInArray!0 (select (arr!48376 a!2850) j!87)))))

(declare-fun b!1502597 () Bool)

(declare-fun res!1023579 () Bool)

(assert (=> b!1502597 (=> (not res!1023579) (not e!840356))))

(assert (=> b!1502597 (= res!1023579 (validKeyInArray!0 (select (arr!48376 a!2850) i!996)))))

(assert (= (and start!127888 res!1023583) b!1502589))

(assert (= (and b!1502589 res!1023577) b!1502597))

(assert (= (and b!1502597 res!1023579) b!1502596))

(assert (= (and b!1502596 res!1023582) b!1502590))

(assert (= (and b!1502590 res!1023581) b!1502593))

(assert (= (and b!1502593 res!1023580) b!1502594))

(assert (= (and b!1502594 res!1023576) b!1502595))

(assert (= (and b!1502595 res!1023578) b!1502592))

(assert (= (and b!1502592 res!1023575) b!1502591))

(declare-fun m!1385869 () Bool)

(assert (=> b!1502595 m!1385869))

(assert (=> b!1502595 m!1385869))

(declare-fun m!1385871 () Bool)

(assert (=> b!1502595 m!1385871))

(declare-fun m!1385873 () Bool)

(assert (=> b!1502590 m!1385873))

(declare-fun m!1385875 () Bool)

(assert (=> b!1502591 m!1385875))

(declare-fun m!1385877 () Bool)

(assert (=> b!1502591 m!1385877))

(assert (=> b!1502591 m!1385877))

(declare-fun m!1385879 () Bool)

(assert (=> b!1502591 m!1385879))

(assert (=> b!1502596 m!1385869))

(assert (=> b!1502596 m!1385869))

(declare-fun m!1385881 () Bool)

(assert (=> b!1502596 m!1385881))

(declare-fun m!1385883 () Bool)

(assert (=> b!1502597 m!1385883))

(assert (=> b!1502597 m!1385883))

(declare-fun m!1385885 () Bool)

(assert (=> b!1502597 m!1385885))

(declare-fun m!1385887 () Bool)

(assert (=> b!1502592 m!1385887))

(assert (=> b!1502592 m!1385869))

(declare-fun m!1385889 () Bool)

(assert (=> b!1502593 m!1385889))

(declare-fun m!1385891 () Bool)

(assert (=> b!1502594 m!1385891))

(assert (=> b!1502594 m!1385875))

(declare-fun m!1385893 () Bool)

(assert (=> b!1502594 m!1385893))

(declare-fun m!1385895 () Bool)

(assert (=> start!127888 m!1385895))

(declare-fun m!1385897 () Bool)

(assert (=> start!127888 m!1385897))

(push 1)

(assert (not b!1502596))

(assert (not start!127888))

(assert (not b!1502593))

(assert (not b!1502595))

(assert (not b!1502590))

(assert (not b!1502591))

(assert (not b!1502597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157717 () Bool)

(declare-fun res!1023590 () Bool)

(declare-fun e!840377 () Bool)

(assert (=> d!157717 (=> res!1023590 e!840377)))

(assert (=> d!157717 (= res!1023590 (bvsge #b00000000000000000000000000000000 (size!48926 a!2850)))))

(assert (=> d!157717 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34865) e!840377)))

(declare-fun b!1502626 () Bool)

(declare-fun e!840376 () Bool)

(declare-fun contains!9945 (List!34868 (_ BitVec 64)) Bool)

(assert (=> b!1502626 (= e!840376 (contains!9945 Nil!34865 (select (arr!48376 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1502627 () Bool)

(declare-fun e!840378 () Bool)

(declare-fun e!840379 () Bool)

(assert (=> b!1502627 (= e!840378 e!840379)))

(declare-fun c!139052 () Bool)

(assert (=> b!1502627 (= c!139052 (validKeyInArray!0 (select (arr!48376 a!2850) #b00000000000000000000000000000000)))))

(declare-fun bm!68085 () Bool)

(declare-fun call!68088 () Bool)

(assert (=> bm!68085 (= call!68088 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139052 (Cons!34864 (select (arr!48376 a!2850) #b00000000000000000000000000000000) Nil!34865) Nil!34865)))))

(declare-fun b!1502628 () Bool)

(assert (=> b!1502628 (= e!840379 call!68088)))

(declare-fun b!1502629 () Bool)

(assert (=> b!1502629 (= e!840379 call!68088)))

(declare-fun b!1502630 () Bool)

(assert (=> b!1502630 (= e!840377 e!840378)))

(declare-fun res!1023592 () Bool)

(assert (=> b!1502630 (=> (not res!1023592) (not e!840378))))

(assert (=> b!1502630 (= res!1023592 (not e!840376))))

(declare-fun res!1023591 () Bool)

(assert (=> b!1502630 (=> (not res!1023591) (not e!840376))))

(assert (=> b!1502630 (= res!1023591 (validKeyInArray!0 (select (arr!48376 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!157717 (not res!1023590)) b!1502630))

(assert (= (and b!1502630 res!1023591) b!1502626))

(assert (= (and b!1502630 res!1023592) b!1502627))

(assert (= (and b!1502627 c!139052) b!1502628))

(assert (= (and b!1502627 (not c!139052)) b!1502629))

(assert (= (or b!1502628 b!1502629) bm!68085))

(declare-fun m!1385909 () Bool)

(assert (=> b!1502626 m!1385909))

(assert (=> b!1502626 m!1385909))

(declare-fun m!1385911 () Bool)

(assert (=> b!1502626 m!1385911))

(assert (=> b!1502627 m!1385909))

(assert (=> b!1502627 m!1385909))

(declare-fun m!1385913 () Bool)

(assert (=> b!1502627 m!1385913))

(assert (=> bm!68085 m!1385909))

(declare-fun m!1385915 () Bool)

(assert (=> bm!68085 m!1385915))

(assert (=> b!1502630 m!1385909))

(assert (=> b!1502630 m!1385909))

(assert (=> b!1502630 m!1385913))

(assert (=> b!1502593 d!157717))

(declare-fun d!157723 () Bool)

(assert (=> d!157723 (= (validKeyInArray!0 (select (arr!48376 a!2850) i!996)) (and (not (= (select (arr!48376 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48376 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1502597 d!157723))

(declare-fun lt!653430 () SeekEntryResult!12574)

(declare-fun d!157725 () Bool)

(assert (=> d!157725 (and (or (is-Undefined!12574 lt!653430) (not (is-Found!12574 lt!653430)) (and (bvsge (index!52689 lt!653430) #b00000000000000000000000000000000) (bvslt (index!52689 lt!653430) (size!48926 (array!100237 (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48926 a!2850)))))) (or (is-Undefined!12574 lt!653430) (is-Found!12574 lt!653430) (not (is-MissingVacant!12574 lt!653430)) (not (= (index!52691 lt!653430) vacantAfter!10)) (and (bvsge (index!52691 lt!653430) #b00000000000000000000000000000000) (bvslt (index!52691 lt!653430) (size!48926 (array!100237 (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48926 a!2850)))))) (or (is-Undefined!12574 lt!653430) (ite (is-Found!12574 lt!653430) (= (select (arr!48376 (array!100237 (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48926 a!2850))) (index!52689 lt!653430)) (select (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87)) (and (is-MissingVacant!12574 lt!653430) (= (index!52691 lt!653430) vacantAfter!10) (= (select (arr!48376 (array!100237 (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48926 a!2850))) (index!52691 lt!653430)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!840432 () SeekEntryResult!12574)

(assert (=> d!157725 (= lt!653430 e!840432)))

(declare-fun c!139075 () Bool)

(assert (=> d!157725 (= c!139075 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!653429 () (_ BitVec 64))

(assert (=> d!157725 (= lt!653429 (select (arr!48376 (array!100237 (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48926 a!2850))) index!625))))

(assert (=> d!157725 (validMask!0 mask!2661)))

(assert (=> d!157725 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantAfter!10 (select (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100237 (store (arr!48376 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48926 a!2850)) mask!2661) lt!653430)))

(declare-fun b!1502703 () Bool)

(assert (=> b!1502703 (= e!840432 Undefined!12574)))

