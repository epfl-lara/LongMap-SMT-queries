; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127914 () Bool)

(assert start!127914)

(declare-fun res!1023981 () Bool)

(declare-fun e!840366 () Bool)

(assert (=> start!127914 (=> (not res!1023981) (not e!840366))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127914 (= res!1023981 (validMask!0 mask!2661))))

(assert (=> start!127914 e!840366))

(assert (=> start!127914 true))

(declare-datatypes ((array!100223 0))(
  ( (array!100224 (arr!48369 (Array (_ BitVec 32) (_ BitVec 64))) (size!48921 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100223)

(declare-fun array_inv!37602 (array!100223) Bool)

(assert (=> start!127914 (array_inv!37602 a!2850)))

(declare-fun b!1502912 () Bool)

(declare-fun res!1023986 () Bool)

(assert (=> b!1502912 (=> (not res!1023986) (not e!840366))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12588 0))(
  ( (MissingZero!12588 (index!52744 (_ BitVec 32))) (Found!12588 (index!52745 (_ BitVec 32))) (Intermediate!12588 (undefined!13400 Bool) (index!52746 (_ BitVec 32)) (x!134431 (_ BitVec 32))) (Undefined!12588) (MissingVacant!12588 (index!52747 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100223 (_ BitVec 32)) SeekEntryResult!12588)

(assert (=> b!1502912 (= res!1023986 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48369 a!2850) j!87) a!2850 mask!2661) (Found!12588 j!87)))))

(declare-fun b!1502913 () Bool)

(declare-fun res!1023980 () Bool)

(assert (=> b!1502913 (=> (not res!1023980) (not e!840366))))

(assert (=> b!1502913 (= res!1023980 (not (= (select (arr!48369 a!2850) index!625) (select (arr!48369 a!2850) j!87))))))

(declare-fun b!1502914 () Bool)

(declare-fun res!1023983 () Bool)

(assert (=> b!1502914 (=> (not res!1023983) (not e!840366))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502914 (= res!1023983 (validKeyInArray!0 (select (arr!48369 a!2850) i!996)))))

(declare-fun b!1502915 () Bool)

(declare-fun res!1023985 () Bool)

(assert (=> b!1502915 (=> (not res!1023985) (not e!840366))))

(assert (=> b!1502915 (= res!1023985 (validKeyInArray!0 (select (arr!48369 a!2850) j!87)))))

(declare-fun b!1502916 () Bool)

(declare-fun res!1023978 () Bool)

(assert (=> b!1502916 (=> (not res!1023978) (not e!840366))))

(assert (=> b!1502916 (= res!1023978 (and (= (size!48921 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48921 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48921 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502917 () Bool)

(declare-fun res!1023984 () Bool)

(assert (=> b!1502917 (=> (not res!1023984) (not e!840366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100223 (_ BitVec 32)) Bool)

(assert (=> b!1502917 (= res!1023984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502918 () Bool)

(declare-fun res!1023982 () Bool)

(assert (=> b!1502918 (=> (not res!1023982) (not e!840366))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502918 (= res!1023982 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48921 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48921 a!2850)) (= (select (arr!48369 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48369 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48921 a!2850))))))

(declare-fun b!1502919 () Bool)

(declare-fun res!1023979 () Bool)

(assert (=> b!1502919 (=> (not res!1023979) (not e!840366))))

(declare-datatypes ((List!34939 0))(
  ( (Nil!34936) (Cons!34935 (h!36333 (_ BitVec 64)) (t!49625 List!34939)) )
))
(declare-fun arrayNoDuplicates!0 (array!100223 (_ BitVec 32) List!34939) Bool)

(assert (=> b!1502919 (= res!1023979 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34936))))

(declare-fun b!1502920 () Bool)

(assert (=> b!1502920 (= e!840366 false)))

(declare-fun lt!653224 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502920 (= lt!653224 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127914 res!1023981) b!1502916))

(assert (= (and b!1502916 res!1023978) b!1502914))

(assert (= (and b!1502914 res!1023983) b!1502915))

(assert (= (and b!1502915 res!1023985) b!1502917))

(assert (= (and b!1502917 res!1023984) b!1502919))

(assert (= (and b!1502919 res!1023979) b!1502918))

(assert (= (and b!1502918 res!1023982) b!1502912))

(assert (= (and b!1502912 res!1023986) b!1502913))

(assert (= (and b!1502913 res!1023980) b!1502920))

(declare-fun m!1385601 () Bool)

(assert (=> b!1502917 m!1385601))

(declare-fun m!1385603 () Bool)

(assert (=> b!1502914 m!1385603))

(assert (=> b!1502914 m!1385603))

(declare-fun m!1385605 () Bool)

(assert (=> b!1502914 m!1385605))

(declare-fun m!1385607 () Bool)

(assert (=> start!127914 m!1385607))

(declare-fun m!1385609 () Bool)

(assert (=> start!127914 m!1385609))

(declare-fun m!1385611 () Bool)

(assert (=> b!1502915 m!1385611))

(assert (=> b!1502915 m!1385611))

(declare-fun m!1385613 () Bool)

(assert (=> b!1502915 m!1385613))

(declare-fun m!1385615 () Bool)

(assert (=> b!1502920 m!1385615))

(declare-fun m!1385617 () Bool)

(assert (=> b!1502918 m!1385617))

(declare-fun m!1385619 () Bool)

(assert (=> b!1502918 m!1385619))

(declare-fun m!1385621 () Bool)

(assert (=> b!1502918 m!1385621))

(assert (=> b!1502912 m!1385611))

(assert (=> b!1502912 m!1385611))

(declare-fun m!1385623 () Bool)

(assert (=> b!1502912 m!1385623))

(declare-fun m!1385625 () Bool)

(assert (=> b!1502913 m!1385625))

(assert (=> b!1502913 m!1385611))

(declare-fun m!1385627 () Bool)

(assert (=> b!1502919 m!1385627))

(push 1)

(assert (not b!1502912))

(assert (not start!127914))

(assert (not b!1502915))

(assert (not b!1502917))

(assert (not b!1502919))

(assert (not b!1502920))

(assert (not b!1502914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

