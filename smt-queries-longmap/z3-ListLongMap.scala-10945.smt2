; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128048 () Bool)

(assert start!128048)

(declare-fun b!1503984 () Bool)

(declare-fun res!1024774 () Bool)

(declare-fun e!840793 () Bool)

(assert (=> b!1503984 (=> (not res!1024774) (not e!840793))))

(declare-datatypes ((array!100324 0))(
  ( (array!100325 (arr!48417 (Array (_ BitVec 32) (_ BitVec 64))) (size!48967 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100324)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503984 (= res!1024774 (validKeyInArray!0 (select (arr!48417 a!2850) i!996)))))

(declare-fun res!1024780 () Bool)

(assert (=> start!128048 (=> (not res!1024780) (not e!840793))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128048 (= res!1024780 (validMask!0 mask!2661))))

(assert (=> start!128048 e!840793))

(assert (=> start!128048 true))

(declare-fun array_inv!37445 (array!100324) Bool)

(assert (=> start!128048 (array_inv!37445 a!2850)))

(declare-fun b!1503985 () Bool)

(declare-fun res!1024776 () Bool)

(assert (=> b!1503985 (=> (not res!1024776) (not e!840793))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503985 (= res!1024776 (not (= (select (arr!48417 a!2850) index!625) (select (arr!48417 a!2850) j!87))))))

(declare-fun b!1503986 () Bool)

(declare-fun res!1024775 () Bool)

(assert (=> b!1503986 (=> (not res!1024775) (not e!840793))))

(declare-datatypes ((List!34909 0))(
  ( (Nil!34906) (Cons!34905 (h!36302 (_ BitVec 64)) (t!49603 List!34909)) )
))
(declare-fun arrayNoDuplicates!0 (array!100324 (_ BitVec 32) List!34909) Bool)

(assert (=> b!1503986 (= res!1024775 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34906))))

(declare-fun b!1503987 () Bool)

(declare-fun res!1024772 () Bool)

(assert (=> b!1503987 (=> (not res!1024772) (not e!840793))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12615 0))(
  ( (MissingZero!12615 (index!52852 (_ BitVec 32))) (Found!12615 (index!52853 (_ BitVec 32))) (Intermediate!12615 (undefined!13427 Bool) (index!52854 (_ BitVec 32)) (x!134533 (_ BitVec 32))) (Undefined!12615) (MissingVacant!12615 (index!52855 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100324 (_ BitVec 32)) SeekEntryResult!12615)

(assert (=> b!1503987 (= res!1024772 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48417 a!2850) j!87) a!2850 mask!2661) (Found!12615 j!87)))))

(declare-fun b!1503988 () Bool)

(declare-fun res!1024778 () Bool)

(assert (=> b!1503988 (=> (not res!1024778) (not e!840793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100324 (_ BitVec 32)) Bool)

(assert (=> b!1503988 (= res!1024778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503989 () Bool)

(declare-fun res!1024773 () Bool)

(assert (=> b!1503989 (=> (not res!1024773) (not e!840793))))

(assert (=> b!1503989 (= res!1024773 (validKeyInArray!0 (select (arr!48417 a!2850) j!87)))))

(declare-fun b!1503990 () Bool)

(declare-fun res!1024779 () Bool)

(assert (=> b!1503990 (=> (not res!1024779) (not e!840793))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503990 (= res!1024779 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48967 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48967 a!2850)) (= (select (arr!48417 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48417 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48967 a!2850))))))

(declare-fun b!1503991 () Bool)

(declare-fun res!1024777 () Bool)

(assert (=> b!1503991 (=> (not res!1024777) (not e!840793))))

(assert (=> b!1503991 (= res!1024777 (and (= (size!48967 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48967 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48967 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503992 () Bool)

(assert (=> b!1503992 (= e!840793 false)))

(declare-fun lt!653626 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503992 (= lt!653626 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!128048 res!1024780) b!1503991))

(assert (= (and b!1503991 res!1024777) b!1503984))

(assert (= (and b!1503984 res!1024774) b!1503989))

(assert (= (and b!1503989 res!1024773) b!1503988))

(assert (= (and b!1503988 res!1024778) b!1503986))

(assert (= (and b!1503986 res!1024775) b!1503990))

(assert (= (and b!1503990 res!1024779) b!1503987))

(assert (= (and b!1503987 res!1024772) b!1503985))

(assert (= (and b!1503985 res!1024776) b!1503992))

(declare-fun m!1387187 () Bool)

(assert (=> b!1503989 m!1387187))

(assert (=> b!1503989 m!1387187))

(declare-fun m!1387189 () Bool)

(assert (=> b!1503989 m!1387189))

(declare-fun m!1387191 () Bool)

(assert (=> b!1503986 m!1387191))

(declare-fun m!1387193 () Bool)

(assert (=> b!1503985 m!1387193))

(assert (=> b!1503985 m!1387187))

(declare-fun m!1387195 () Bool)

(assert (=> b!1503988 m!1387195))

(declare-fun m!1387197 () Bool)

(assert (=> b!1503990 m!1387197))

(declare-fun m!1387199 () Bool)

(assert (=> b!1503990 m!1387199))

(declare-fun m!1387201 () Bool)

(assert (=> b!1503990 m!1387201))

(declare-fun m!1387203 () Bool)

(assert (=> b!1503992 m!1387203))

(assert (=> b!1503987 m!1387187))

(assert (=> b!1503987 m!1387187))

(declare-fun m!1387205 () Bool)

(assert (=> b!1503987 m!1387205))

(declare-fun m!1387207 () Bool)

(assert (=> start!128048 m!1387207))

(declare-fun m!1387209 () Bool)

(assert (=> start!128048 m!1387209))

(declare-fun m!1387211 () Bool)

(assert (=> b!1503984 m!1387211))

(assert (=> b!1503984 m!1387211))

(declare-fun m!1387213 () Bool)

(assert (=> b!1503984 m!1387213))

(check-sat (not b!1503988) (not b!1503984) (not start!128048) (not b!1503986) (not b!1503989) (not b!1503992) (not b!1503987))
