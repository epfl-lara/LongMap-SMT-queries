; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127594 () Bool)

(assert start!127594)

(declare-fun b!1498962 () Bool)

(declare-fun res!1020040 () Bool)

(declare-fun e!839161 () Bool)

(assert (=> b!1498962 (=> (not res!1020040) (not e!839161))))

(declare-datatypes ((array!99975 0))(
  ( (array!99976 (arr!48247 (Array (_ BitVec 32) (_ BitVec 64))) (size!48797 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99975)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12457 0))(
  ( (MissingZero!12457 (index!52220 (_ BitVec 32))) (Found!12457 (index!52221 (_ BitVec 32))) (Intermediate!12457 (undefined!13269 Bool) (index!52222 (_ BitVec 32)) (x!133907 (_ BitVec 32))) (Undefined!12457) (MissingVacant!12457 (index!52223 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99975 (_ BitVec 32)) SeekEntryResult!12457)

(assert (=> b!1498962 (= res!1020040 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48247 a!2850) j!87) a!2850 mask!2661) (Found!12457 j!87)))))

(declare-fun b!1498963 () Bool)

(declare-fun res!1020045 () Bool)

(assert (=> b!1498963 (=> (not res!1020045) (not e!839161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498963 (= res!1020045 (validKeyInArray!0 (select (arr!48247 a!2850) j!87)))))

(declare-fun b!1498964 () Bool)

(declare-fun res!1020044 () Bool)

(assert (=> b!1498964 (=> (not res!1020044) (not e!839161))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498964 (= res!1020044 (and (= (select (arr!48247 a!2850) index!625) (select (arr!48247 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvslt vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1498965 () Bool)

(declare-fun res!1020043 () Bool)

(assert (=> b!1498965 (=> (not res!1020043) (not e!839161))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498965 (= res!1020043 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48797 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48797 a!2850)) (= (select (arr!48247 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48247 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48797 a!2850))))))

(declare-fun res!1020041 () Bool)

(assert (=> start!127594 (=> (not res!1020041) (not e!839161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127594 (= res!1020041 (validMask!0 mask!2661))))

(assert (=> start!127594 e!839161))

(assert (=> start!127594 true))

(declare-fun array_inv!37275 (array!99975) Bool)

(assert (=> start!127594 (array_inv!37275 a!2850)))

(declare-fun b!1498966 () Bool)

(declare-fun res!1020046 () Bool)

(assert (=> b!1498966 (=> (not res!1020046) (not e!839161))))

(declare-datatypes ((List!34739 0))(
  ( (Nil!34736) (Cons!34735 (h!36132 (_ BitVec 64)) (t!49433 List!34739)) )
))
(declare-fun arrayNoDuplicates!0 (array!99975 (_ BitVec 32) List!34739) Bool)

(assert (=> b!1498966 (= res!1020046 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34736))))

(declare-fun b!1498967 () Bool)

(declare-fun res!1020039 () Bool)

(assert (=> b!1498967 (=> (not res!1020039) (not e!839161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99975 (_ BitVec 32)) Bool)

(assert (=> b!1498967 (= res!1020039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498968 () Bool)

(declare-fun res!1020038 () Bool)

(assert (=> b!1498968 (=> (not res!1020038) (not e!839161))))

(assert (=> b!1498968 (= res!1020038 (and (= (size!48797 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48797 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48797 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1498969 () Bool)

(declare-fun res!1020042 () Bool)

(assert (=> b!1498969 (=> (not res!1020042) (not e!839161))))

(assert (=> b!1498969 (= res!1020042 (validKeyInArray!0 (select (arr!48247 a!2850) i!996)))))

(declare-fun b!1498970 () Bool)

(assert (=> b!1498970 (= e!839161 (not (validKeyInArray!0 (select (store (arr!48247 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87))))))

(assert (= (and start!127594 res!1020041) b!1498968))

(assert (= (and b!1498968 res!1020038) b!1498969))

(assert (= (and b!1498969 res!1020042) b!1498963))

(assert (= (and b!1498963 res!1020045) b!1498967))

(assert (= (and b!1498967 res!1020039) b!1498966))

(assert (= (and b!1498966 res!1020046) b!1498965))

(assert (= (and b!1498965 res!1020043) b!1498962))

(assert (= (and b!1498962 res!1020040) b!1498964))

(assert (= (and b!1498964 res!1020044) b!1498970))

(declare-fun m!1382125 () Bool)

(assert (=> b!1498963 m!1382125))

(assert (=> b!1498963 m!1382125))

(declare-fun m!1382127 () Bool)

(assert (=> b!1498963 m!1382127))

(assert (=> b!1498962 m!1382125))

(assert (=> b!1498962 m!1382125))

(declare-fun m!1382129 () Bool)

(assert (=> b!1498962 m!1382129))

(declare-fun m!1382131 () Bool)

(assert (=> b!1498965 m!1382131))

(declare-fun m!1382133 () Bool)

(assert (=> b!1498965 m!1382133))

(declare-fun m!1382135 () Bool)

(assert (=> b!1498965 m!1382135))

(declare-fun m!1382137 () Bool)

(assert (=> start!127594 m!1382137))

(declare-fun m!1382139 () Bool)

(assert (=> start!127594 m!1382139))

(declare-fun m!1382141 () Bool)

(assert (=> b!1498969 m!1382141))

(assert (=> b!1498969 m!1382141))

(declare-fun m!1382143 () Bool)

(assert (=> b!1498969 m!1382143))

(assert (=> b!1498970 m!1382133))

(declare-fun m!1382145 () Bool)

(assert (=> b!1498970 m!1382145))

(assert (=> b!1498970 m!1382145))

(declare-fun m!1382147 () Bool)

(assert (=> b!1498970 m!1382147))

(declare-fun m!1382149 () Bool)

(assert (=> b!1498967 m!1382149))

(declare-fun m!1382151 () Bool)

(assert (=> b!1498966 m!1382151))

(declare-fun m!1382153 () Bool)

(assert (=> b!1498964 m!1382153))

(assert (=> b!1498964 m!1382125))

(push 1)

(assert (not b!1498967))

(assert (not b!1498966))

(assert (not b!1498970))

(assert (not b!1498969))

(assert (not b!1498963))

(assert (not b!1498962))

(assert (not start!127594))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

