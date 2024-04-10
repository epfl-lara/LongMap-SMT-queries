; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127810 () Bool)

(assert start!127810)

(declare-fun b!1501988 () Bool)

(declare-fun res!1023068 () Bool)

(declare-fun e!840133 () Bool)

(assert (=> b!1501988 (=> (not res!1023068) (not e!840133))))

(declare-datatypes ((array!100191 0))(
  ( (array!100192 (arr!48355 (Array (_ BitVec 32) (_ BitVec 64))) (size!48905 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100191)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501988 (= res!1023068 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48905 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48905 a!2850)) (= (select (arr!48355 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48355 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48905 a!2850))))))

(declare-fun b!1501989 () Bool)

(declare-fun res!1023067 () Bool)

(assert (=> b!1501989 (=> (not res!1023067) (not e!840133))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100191 (_ BitVec 32)) Bool)

(assert (=> b!1501989 (= res!1023067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501990 () Bool)

(assert (=> b!1501990 (= e!840133 false)))

(declare-datatypes ((SeekEntryResult!12553 0))(
  ( (MissingZero!12553 (index!52604 (_ BitVec 32))) (Found!12553 (index!52605 (_ BitVec 32))) (Intermediate!12553 (undefined!13365 Bool) (index!52606 (_ BitVec 32)) (x!134291 (_ BitVec 32))) (Undefined!12553) (MissingVacant!12553 (index!52607 (_ BitVec 32))) )
))
(declare-fun lt!653299 () SeekEntryResult!12553)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100191 (_ BitVec 32)) SeekEntryResult!12553)

(assert (=> b!1501990 (= lt!653299 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48355 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501991 () Bool)

(declare-fun res!1023065 () Bool)

(assert (=> b!1501991 (=> (not res!1023065) (not e!840133))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501991 (= res!1023065 (validKeyInArray!0 (select (arr!48355 a!2850) j!87)))))

(declare-fun res!1023066 () Bool)

(assert (=> start!127810 (=> (not res!1023066) (not e!840133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127810 (= res!1023066 (validMask!0 mask!2661))))

(assert (=> start!127810 e!840133))

(assert (=> start!127810 true))

(declare-fun array_inv!37383 (array!100191) Bool)

(assert (=> start!127810 (array_inv!37383 a!2850)))

(declare-fun b!1501992 () Bool)

(declare-fun res!1023070 () Bool)

(assert (=> b!1501992 (=> (not res!1023070) (not e!840133))))

(assert (=> b!1501992 (= res!1023070 (and (= (size!48905 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48905 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48905 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501993 () Bool)

(declare-fun res!1023064 () Bool)

(assert (=> b!1501993 (=> (not res!1023064) (not e!840133))))

(declare-datatypes ((List!34847 0))(
  ( (Nil!34844) (Cons!34843 (h!36240 (_ BitVec 64)) (t!49541 List!34847)) )
))
(declare-fun arrayNoDuplicates!0 (array!100191 (_ BitVec 32) List!34847) Bool)

(assert (=> b!1501993 (= res!1023064 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34844))))

(declare-fun b!1501994 () Bool)

(declare-fun res!1023069 () Bool)

(assert (=> b!1501994 (=> (not res!1023069) (not e!840133))))

(assert (=> b!1501994 (= res!1023069 (validKeyInArray!0 (select (arr!48355 a!2850) i!996)))))

(assert (= (and start!127810 res!1023066) b!1501992))

(assert (= (and b!1501992 res!1023070) b!1501994))

(assert (= (and b!1501994 res!1023069) b!1501991))

(assert (= (and b!1501991 res!1023065) b!1501989))

(assert (= (and b!1501989 res!1023067) b!1501993))

(assert (= (and b!1501993 res!1023064) b!1501988))

(assert (= (and b!1501988 res!1023068) b!1501990))

(declare-fun m!1385275 () Bool)

(assert (=> b!1501990 m!1385275))

(assert (=> b!1501990 m!1385275))

(declare-fun m!1385277 () Bool)

(assert (=> b!1501990 m!1385277))

(declare-fun m!1385279 () Bool)

(assert (=> b!1501994 m!1385279))

(assert (=> b!1501994 m!1385279))

(declare-fun m!1385281 () Bool)

(assert (=> b!1501994 m!1385281))

(declare-fun m!1385283 () Bool)

(assert (=> b!1501988 m!1385283))

(declare-fun m!1385285 () Bool)

(assert (=> b!1501988 m!1385285))

(declare-fun m!1385287 () Bool)

(assert (=> b!1501988 m!1385287))

(assert (=> b!1501991 m!1385275))

(assert (=> b!1501991 m!1385275))

(declare-fun m!1385289 () Bool)

(assert (=> b!1501991 m!1385289))

(declare-fun m!1385291 () Bool)

(assert (=> start!127810 m!1385291))

(declare-fun m!1385293 () Bool)

(assert (=> start!127810 m!1385293))

(declare-fun m!1385295 () Bool)

(assert (=> b!1501989 m!1385295))

(declare-fun m!1385297 () Bool)

(assert (=> b!1501993 m!1385297))

(push 1)

(assert (not b!1501990))

(assert (not b!1501994))

(assert (not b!1501989))

(assert (not start!127810))

(assert (not b!1501993))

