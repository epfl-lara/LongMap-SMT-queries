; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127932 () Bool)

(assert start!127932)

(declare-fun b!1502850 () Bool)

(declare-fun res!1023731 () Bool)

(declare-fun e!840481 () Bool)

(assert (=> b!1502850 (=> (not res!1023731) (not e!840481))))

(declare-datatypes ((array!100247 0))(
  ( (array!100248 (arr!48380 (Array (_ BitVec 32) (_ BitVec 64))) (size!48930 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100247)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502850 (= res!1023731 (validKeyInArray!0 (select (arr!48380 a!2850) j!87)))))

(declare-fun b!1502851 () Bool)

(declare-fun res!1023729 () Bool)

(assert (=> b!1502851 (=> (not res!1023729) (not e!840481))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502851 (= res!1023729 (and (= (size!48930 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48930 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48930 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502853 () Bool)

(assert (=> b!1502853 (= e!840481 false)))

(declare-fun lt!653461 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502853 (= lt!653461 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502854 () Bool)

(declare-fun res!1023733 () Bool)

(assert (=> b!1502854 (=> (not res!1023733) (not e!840481))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502854 (= res!1023733 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48930 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48930 a!2850)) (= (select (arr!48380 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48380 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48930 a!2850))))))

(declare-fun b!1502855 () Bool)

(declare-fun res!1023735 () Bool)

(assert (=> b!1502855 (=> (not res!1023735) (not e!840481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100247 (_ BitVec 32)) Bool)

(assert (=> b!1502855 (= res!1023735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502856 () Bool)

(declare-fun res!1023728 () Bool)

(assert (=> b!1502856 (=> (not res!1023728) (not e!840481))))

(declare-datatypes ((List!34872 0))(
  ( (Nil!34869) (Cons!34868 (h!36265 (_ BitVec 64)) (t!49566 List!34872)) )
))
(declare-fun arrayNoDuplicates!0 (array!100247 (_ BitVec 32) List!34872) Bool)

(assert (=> b!1502856 (= res!1023728 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34869))))

(declare-fun b!1502857 () Bool)

(declare-fun res!1023736 () Bool)

(assert (=> b!1502857 (=> (not res!1023736) (not e!840481))))

(assert (=> b!1502857 (= res!1023736 (validKeyInArray!0 (select (arr!48380 a!2850) i!996)))))

(declare-fun b!1502858 () Bool)

(declare-fun res!1023732 () Bool)

(assert (=> b!1502858 (=> (not res!1023732) (not e!840481))))

(declare-datatypes ((SeekEntryResult!12578 0))(
  ( (MissingZero!12578 (index!52704 (_ BitVec 32))) (Found!12578 (index!52705 (_ BitVec 32))) (Intermediate!12578 (undefined!13390 Bool) (index!52706 (_ BitVec 32)) (x!134394 (_ BitVec 32))) (Undefined!12578) (MissingVacant!12578 (index!52707 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100247 (_ BitVec 32)) SeekEntryResult!12578)

(assert (=> b!1502858 (= res!1023732 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48380 a!2850) j!87) a!2850 mask!2661) (Found!12578 j!87)))))

(declare-fun b!1502852 () Bool)

(declare-fun res!1023730 () Bool)

(assert (=> b!1502852 (=> (not res!1023730) (not e!840481))))

(assert (=> b!1502852 (= res!1023730 (not (= (select (arr!48380 a!2850) index!625) (select (arr!48380 a!2850) j!87))))))

(declare-fun res!1023734 () Bool)

(assert (=> start!127932 (=> (not res!1023734) (not e!840481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127932 (= res!1023734 (validMask!0 mask!2661))))

(assert (=> start!127932 e!840481))

(assert (=> start!127932 true))

(declare-fun array_inv!37408 (array!100247) Bool)

(assert (=> start!127932 (array_inv!37408 a!2850)))

(assert (= (and start!127932 res!1023734) b!1502851))

(assert (= (and b!1502851 res!1023729) b!1502857))

(assert (= (and b!1502857 res!1023736) b!1502850))

(assert (= (and b!1502850 res!1023731) b!1502855))

(assert (= (and b!1502855 res!1023735) b!1502856))

(assert (= (and b!1502856 res!1023728) b!1502854))

(assert (= (and b!1502854 res!1023733) b!1502858))

(assert (= (and b!1502858 res!1023732) b!1502852))

(assert (= (and b!1502852 res!1023730) b!1502853))

(declare-fun m!1386079 () Bool)

(assert (=> b!1502853 m!1386079))

(declare-fun m!1386081 () Bool)

(assert (=> b!1502858 m!1386081))

(assert (=> b!1502858 m!1386081))

(declare-fun m!1386083 () Bool)

(assert (=> b!1502858 m!1386083))

(declare-fun m!1386085 () Bool)

(assert (=> start!127932 m!1386085))

(declare-fun m!1386087 () Bool)

(assert (=> start!127932 m!1386087))

(declare-fun m!1386089 () Bool)

(assert (=> b!1502856 m!1386089))

(declare-fun m!1386091 () Bool)

(assert (=> b!1502855 m!1386091))

(assert (=> b!1502850 m!1386081))

(assert (=> b!1502850 m!1386081))

(declare-fun m!1386093 () Bool)

(assert (=> b!1502850 m!1386093))

(declare-fun m!1386095 () Bool)

(assert (=> b!1502857 m!1386095))

(assert (=> b!1502857 m!1386095))

(declare-fun m!1386097 () Bool)

(assert (=> b!1502857 m!1386097))

(declare-fun m!1386099 () Bool)

(assert (=> b!1502852 m!1386099))

(assert (=> b!1502852 m!1386081))

(declare-fun m!1386101 () Bool)

(assert (=> b!1502854 m!1386101))

(declare-fun m!1386103 () Bool)

(assert (=> b!1502854 m!1386103))

(declare-fun m!1386105 () Bool)

(assert (=> b!1502854 m!1386105))

(push 1)

(assert (not b!1502856))

(assert (not b!1502853))

(assert (not b!1502857))

(assert (not b!1502858))

(assert (not b!1502855))

(assert (not start!127932))

(assert (not b!1502850))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

