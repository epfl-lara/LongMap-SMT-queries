; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127668 () Bool)

(assert start!127668)

(declare-fun b!1499981 () Bool)

(declare-fun res!1021065 () Bool)

(declare-fun e!839456 () Bool)

(assert (=> b!1499981 (=> (not res!1021065) (not e!839456))))

(declare-datatypes ((array!100049 0))(
  ( (array!100050 (arr!48284 (Array (_ BitVec 32) (_ BitVec 64))) (size!48834 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100049)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100049 (_ BitVec 32)) Bool)

(assert (=> b!1499981 (= res!1021065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499982 () Bool)

(declare-fun res!1021057 () Bool)

(assert (=> b!1499982 (=> (not res!1021057) (not e!839456))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1499982 (= res!1021057 (and (= (size!48834 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48834 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48834 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499983 () Bool)

(declare-fun res!1021066 () Bool)

(assert (=> b!1499983 (=> (not res!1021066) (not e!839456))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12494 0))(
  ( (MissingZero!12494 (index!52368 (_ BitVec 32))) (Found!12494 (index!52369 (_ BitVec 32))) (Intermediate!12494 (undefined!13306 Bool) (index!52370 (_ BitVec 32)) (x!134048 (_ BitVec 32))) (Undefined!12494) (MissingVacant!12494 (index!52371 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100049 (_ BitVec 32)) SeekEntryResult!12494)

(assert (=> b!1499983 (= res!1021066 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48284 a!2850) j!87) a!2850 mask!2661) (Found!12494 j!87)))))

(declare-fun b!1499985 () Bool)

(declare-fun res!1021063 () Bool)

(assert (=> b!1499985 (=> (not res!1021063) (not e!839456))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499985 (= res!1021063 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48834 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48834 a!2850)) (= (select (arr!48284 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48284 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48834 a!2850))))))

(declare-fun b!1499986 () Bool)

(declare-fun res!1021062 () Bool)

(assert (=> b!1499986 (=> (not res!1021062) (not e!839456))))

(assert (=> b!1499986 (= res!1021062 (not (= (select (arr!48284 a!2850) index!625) (select (arr!48284 a!2850) j!87))))))

(declare-fun b!1499987 () Bool)

(declare-fun res!1021064 () Bool)

(assert (=> b!1499987 (=> (not res!1021064) (not e!839456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499987 (= res!1021064 (validKeyInArray!0 (select (arr!48284 a!2850) i!996)))))

(declare-fun b!1499988 () Bool)

(declare-fun res!1021058 () Bool)

(assert (=> b!1499988 (=> (not res!1021058) (not e!839456))))

(declare-datatypes ((List!34776 0))(
  ( (Nil!34773) (Cons!34772 (h!36169 (_ BitVec 64)) (t!49470 List!34776)) )
))
(declare-fun arrayNoDuplicates!0 (array!100049 (_ BitVec 32) List!34776) Bool)

(assert (=> b!1499988 (= res!1021058 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34773))))

(declare-fun b!1499989 () Bool)

(declare-fun e!839457 () Bool)

(assert (=> b!1499989 (= e!839457 false)))

(declare-fun lt!652846 () SeekEntryResult!12494)

(declare-fun lt!652845 () (_ BitVec 32))

(assert (=> b!1499989 (= lt!652846 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652845 vacantBefore!10 (select (arr!48284 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499990 () Bool)

(assert (=> b!1499990 (= e!839456 e!839457)))

(declare-fun res!1021060 () Bool)

(assert (=> b!1499990 (=> (not res!1021060) (not e!839457))))

(assert (=> b!1499990 (= res!1021060 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652845 #b00000000000000000000000000000000) (bvslt lt!652845 (size!48834 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499990 (= lt!652845 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499984 () Bool)

(declare-fun res!1021061 () Bool)

(assert (=> b!1499984 (=> (not res!1021061) (not e!839456))))

(assert (=> b!1499984 (= res!1021061 (validKeyInArray!0 (select (arr!48284 a!2850) j!87)))))

(declare-fun res!1021059 () Bool)

(assert (=> start!127668 (=> (not res!1021059) (not e!839456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127668 (= res!1021059 (validMask!0 mask!2661))))

(assert (=> start!127668 e!839456))

(assert (=> start!127668 true))

(declare-fun array_inv!37312 (array!100049) Bool)

(assert (=> start!127668 (array_inv!37312 a!2850)))

(assert (= (and start!127668 res!1021059) b!1499982))

(assert (= (and b!1499982 res!1021057) b!1499987))

(assert (= (and b!1499987 res!1021064) b!1499984))

(assert (= (and b!1499984 res!1021061) b!1499981))

(assert (= (and b!1499981 res!1021065) b!1499988))

(assert (= (and b!1499988 res!1021058) b!1499985))

(assert (= (and b!1499985 res!1021063) b!1499983))

(assert (= (and b!1499983 res!1021066) b!1499986))

(assert (= (and b!1499986 res!1021062) b!1499990))

(assert (= (and b!1499990 res!1021060) b!1499989))

(declare-fun m!1383175 () Bool)

(assert (=> b!1499989 m!1383175))

(assert (=> b!1499989 m!1383175))

(declare-fun m!1383177 () Bool)

(assert (=> b!1499989 m!1383177))

(declare-fun m!1383179 () Bool)

(assert (=> b!1499987 m!1383179))

(assert (=> b!1499987 m!1383179))

(declare-fun m!1383181 () Bool)

(assert (=> b!1499987 m!1383181))

(declare-fun m!1383183 () Bool)

(assert (=> b!1499986 m!1383183))

(assert (=> b!1499986 m!1383175))

(declare-fun m!1383185 () Bool)

(assert (=> b!1499990 m!1383185))

(declare-fun m!1383187 () Bool)

(assert (=> b!1499988 m!1383187))

(declare-fun m!1383189 () Bool)

(assert (=> b!1499981 m!1383189))

(declare-fun m!1383191 () Bool)

(assert (=> start!127668 m!1383191))

(declare-fun m!1383193 () Bool)

(assert (=> start!127668 m!1383193))

(assert (=> b!1499983 m!1383175))

(assert (=> b!1499983 m!1383175))

(declare-fun m!1383195 () Bool)

(assert (=> b!1499983 m!1383195))

(declare-fun m!1383197 () Bool)

(assert (=> b!1499985 m!1383197))

(declare-fun m!1383199 () Bool)

(assert (=> b!1499985 m!1383199))

(declare-fun m!1383201 () Bool)

(assert (=> b!1499985 m!1383201))

(assert (=> b!1499984 m!1383175))

(assert (=> b!1499984 m!1383175))

(declare-fun m!1383203 () Bool)

(assert (=> b!1499984 m!1383203))

(push 1)

