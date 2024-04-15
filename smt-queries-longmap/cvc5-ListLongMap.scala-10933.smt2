; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127890 () Bool)

(assert start!127890)

(declare-fun res!1023654 () Bool)

(declare-fun e!840293 () Bool)

(assert (=> start!127890 (=> (not res!1023654) (not e!840293))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127890 (= res!1023654 (validMask!0 mask!2661))))

(assert (=> start!127890 e!840293))

(assert (=> start!127890 true))

(declare-datatypes ((array!100199 0))(
  ( (array!100200 (arr!48357 (Array (_ BitVec 32) (_ BitVec 64))) (size!48909 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100199)

(declare-fun array_inv!37590 (array!100199) Bool)

(assert (=> start!127890 (array_inv!37590 a!2850)))

(declare-fun b!1502588 () Bool)

(declare-fun res!1023660 () Bool)

(assert (=> b!1502588 (=> (not res!1023660) (not e!840293))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12576 0))(
  ( (MissingZero!12576 (index!52696 (_ BitVec 32))) (Found!12576 (index!52697 (_ BitVec 32))) (Intermediate!12576 (undefined!13388 Bool) (index!52698 (_ BitVec 32)) (x!134387 (_ BitVec 32))) (Undefined!12576) (MissingVacant!12576 (index!52699 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100199 (_ BitVec 32)) SeekEntryResult!12576)

(assert (=> b!1502588 (= res!1023660 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48357 a!2850) j!87) a!2850 mask!2661) (Found!12576 j!87)))))

(declare-fun b!1502589 () Bool)

(declare-fun res!1023656 () Bool)

(assert (=> b!1502589 (=> (not res!1023656) (not e!840293))))

(assert (=> b!1502589 (= res!1023656 (not (= (select (arr!48357 a!2850) index!625) (select (arr!48357 a!2850) j!87))))))

(declare-fun b!1502590 () Bool)

(declare-fun res!1023661 () Bool)

(assert (=> b!1502590 (=> (not res!1023661) (not e!840293))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502590 (= res!1023661 (validKeyInArray!0 (select (arr!48357 a!2850) i!996)))))

(declare-fun b!1502591 () Bool)

(declare-fun res!1023659 () Bool)

(assert (=> b!1502591 (=> (not res!1023659) (not e!840293))))

(assert (=> b!1502591 (= res!1023659 (and (= (size!48909 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48909 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48909 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502592 () Bool)

(assert (=> b!1502592 (= e!840293 false)))

(declare-fun lt!653188 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502592 (= lt!653188 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502593 () Bool)

(declare-fun res!1023658 () Bool)

(assert (=> b!1502593 (=> (not res!1023658) (not e!840293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100199 (_ BitVec 32)) Bool)

(assert (=> b!1502593 (= res!1023658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502594 () Bool)

(declare-fun res!1023655 () Bool)

(assert (=> b!1502594 (=> (not res!1023655) (not e!840293))))

(assert (=> b!1502594 (= res!1023655 (validKeyInArray!0 (select (arr!48357 a!2850) j!87)))))

(declare-fun b!1502595 () Bool)

(declare-fun res!1023657 () Bool)

(assert (=> b!1502595 (=> (not res!1023657) (not e!840293))))

(declare-datatypes ((List!34927 0))(
  ( (Nil!34924) (Cons!34923 (h!36321 (_ BitVec 64)) (t!49613 List!34927)) )
))
(declare-fun arrayNoDuplicates!0 (array!100199 (_ BitVec 32) List!34927) Bool)

(assert (=> b!1502595 (= res!1023657 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34924))))

(declare-fun b!1502596 () Bool)

(declare-fun res!1023662 () Bool)

(assert (=> b!1502596 (=> (not res!1023662) (not e!840293))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502596 (= res!1023662 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48909 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48909 a!2850)) (= (select (arr!48357 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48357 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48909 a!2850))))))

(assert (= (and start!127890 res!1023654) b!1502591))

(assert (= (and b!1502591 res!1023659) b!1502590))

(assert (= (and b!1502590 res!1023661) b!1502594))

(assert (= (and b!1502594 res!1023655) b!1502593))

(assert (= (and b!1502593 res!1023658) b!1502595))

(assert (= (and b!1502595 res!1023657) b!1502596))

(assert (= (and b!1502596 res!1023662) b!1502588))

(assert (= (and b!1502588 res!1023660) b!1502589))

(assert (= (and b!1502589 res!1023656) b!1502592))

(declare-fun m!1385265 () Bool)

(assert (=> b!1502593 m!1385265))

(declare-fun m!1385267 () Bool)

(assert (=> b!1502592 m!1385267))

(declare-fun m!1385269 () Bool)

(assert (=> b!1502590 m!1385269))

(assert (=> b!1502590 m!1385269))

(declare-fun m!1385271 () Bool)

(assert (=> b!1502590 m!1385271))

(declare-fun m!1385273 () Bool)

(assert (=> b!1502589 m!1385273))

(declare-fun m!1385275 () Bool)

(assert (=> b!1502589 m!1385275))

(assert (=> b!1502588 m!1385275))

(assert (=> b!1502588 m!1385275))

(declare-fun m!1385277 () Bool)

(assert (=> b!1502588 m!1385277))

(declare-fun m!1385279 () Bool)

(assert (=> b!1502596 m!1385279))

(declare-fun m!1385281 () Bool)

(assert (=> b!1502596 m!1385281))

(declare-fun m!1385283 () Bool)

(assert (=> b!1502596 m!1385283))

(assert (=> b!1502594 m!1385275))

(assert (=> b!1502594 m!1385275))

(declare-fun m!1385285 () Bool)

(assert (=> b!1502594 m!1385285))

(declare-fun m!1385287 () Bool)

(assert (=> b!1502595 m!1385287))

(declare-fun m!1385289 () Bool)

(assert (=> start!127890 m!1385289))

(declare-fun m!1385291 () Bool)

(assert (=> start!127890 m!1385291))

(push 1)

(assert (not b!1502588))

(assert (not start!127890))

(assert (not b!1502592))

(assert (not b!1502593))

(assert (not b!1502594))

(assert (not b!1502595))

(assert (not b!1502590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

