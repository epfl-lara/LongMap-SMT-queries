; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127896 () Bool)

(assert start!127896)

(declare-fun res!1023740 () Bool)

(declare-fun e!840312 () Bool)

(assert (=> start!127896 (=> (not res!1023740) (not e!840312))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127896 (= res!1023740 (validMask!0 mask!2661))))

(assert (=> start!127896 e!840312))

(assert (=> start!127896 true))

(declare-datatypes ((array!100205 0))(
  ( (array!100206 (arr!48360 (Array (_ BitVec 32) (_ BitVec 64))) (size!48912 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100205)

(declare-fun array_inv!37593 (array!100205) Bool)

(assert (=> start!127896 (array_inv!37593 a!2850)))

(declare-fun b!1502669 () Bool)

(declare-fun res!1023737 () Bool)

(assert (=> b!1502669 (=> (not res!1023737) (not e!840312))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502669 (= res!1023737 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48912 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48912 a!2850)) (= (select (arr!48360 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48360 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48912 a!2850))))))

(declare-fun b!1502670 () Bool)

(assert (=> b!1502670 (= e!840312 false)))

(declare-fun lt!653197 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502670 (= lt!653197 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502671 () Bool)

(declare-fun res!1023738 () Bool)

(assert (=> b!1502671 (=> (not res!1023738) (not e!840312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502671 (= res!1023738 (validKeyInArray!0 (select (arr!48360 a!2850) i!996)))))

(declare-fun b!1502672 () Bool)

(declare-fun res!1023736 () Bool)

(assert (=> b!1502672 (=> (not res!1023736) (not e!840312))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12579 0))(
  ( (MissingZero!12579 (index!52708 (_ BitVec 32))) (Found!12579 (index!52709 (_ BitVec 32))) (Intermediate!12579 (undefined!13391 Bool) (index!52710 (_ BitVec 32)) (x!134398 (_ BitVec 32))) (Undefined!12579) (MissingVacant!12579 (index!52711 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100205 (_ BitVec 32)) SeekEntryResult!12579)

(assert (=> b!1502672 (= res!1023736 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48360 a!2850) j!87) a!2850 mask!2661) (Found!12579 j!87)))))

(declare-fun b!1502673 () Bool)

(declare-fun res!1023735 () Bool)

(assert (=> b!1502673 (=> (not res!1023735) (not e!840312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100205 (_ BitVec 32)) Bool)

(assert (=> b!1502673 (= res!1023735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502674 () Bool)

(declare-fun res!1023739 () Bool)

(assert (=> b!1502674 (=> (not res!1023739) (not e!840312))))

(declare-datatypes ((List!34930 0))(
  ( (Nil!34927) (Cons!34926 (h!36324 (_ BitVec 64)) (t!49616 List!34930)) )
))
(declare-fun arrayNoDuplicates!0 (array!100205 (_ BitVec 32) List!34930) Bool)

(assert (=> b!1502674 (= res!1023739 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34927))))

(declare-fun b!1502675 () Bool)

(declare-fun res!1023741 () Bool)

(assert (=> b!1502675 (=> (not res!1023741) (not e!840312))))

(assert (=> b!1502675 (= res!1023741 (not (= (select (arr!48360 a!2850) index!625) (select (arr!48360 a!2850) j!87))))))

(declare-fun b!1502676 () Bool)

(declare-fun res!1023742 () Bool)

(assert (=> b!1502676 (=> (not res!1023742) (not e!840312))))

(assert (=> b!1502676 (= res!1023742 (and (= (size!48912 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48912 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48912 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502677 () Bool)

(declare-fun res!1023743 () Bool)

(assert (=> b!1502677 (=> (not res!1023743) (not e!840312))))

(assert (=> b!1502677 (= res!1023743 (validKeyInArray!0 (select (arr!48360 a!2850) j!87)))))

(assert (= (and start!127896 res!1023740) b!1502676))

(assert (= (and b!1502676 res!1023742) b!1502671))

(assert (= (and b!1502671 res!1023738) b!1502677))

(assert (= (and b!1502677 res!1023743) b!1502673))

(assert (= (and b!1502673 res!1023735) b!1502674))

(assert (= (and b!1502674 res!1023739) b!1502669))

(assert (= (and b!1502669 res!1023737) b!1502672))

(assert (= (and b!1502672 res!1023736) b!1502675))

(assert (= (and b!1502675 res!1023741) b!1502670))

(declare-fun m!1385349 () Bool)

(assert (=> b!1502673 m!1385349))

(declare-fun m!1385351 () Bool)

(assert (=> b!1502677 m!1385351))

(assert (=> b!1502677 m!1385351))

(declare-fun m!1385353 () Bool)

(assert (=> b!1502677 m!1385353))

(declare-fun m!1385355 () Bool)

(assert (=> b!1502671 m!1385355))

(assert (=> b!1502671 m!1385355))

(declare-fun m!1385357 () Bool)

(assert (=> b!1502671 m!1385357))

(declare-fun m!1385359 () Bool)

(assert (=> b!1502675 m!1385359))

(assert (=> b!1502675 m!1385351))

(declare-fun m!1385361 () Bool)

(assert (=> b!1502669 m!1385361))

(declare-fun m!1385363 () Bool)

(assert (=> b!1502669 m!1385363))

(declare-fun m!1385365 () Bool)

(assert (=> b!1502669 m!1385365))

(declare-fun m!1385367 () Bool)

(assert (=> start!127896 m!1385367))

(declare-fun m!1385369 () Bool)

(assert (=> start!127896 m!1385369))

(declare-fun m!1385371 () Bool)

(assert (=> b!1502670 m!1385371))

(declare-fun m!1385373 () Bool)

(assert (=> b!1502674 m!1385373))

(assert (=> b!1502672 m!1385351))

(assert (=> b!1502672 m!1385351))

(declare-fun m!1385375 () Bool)

(assert (=> b!1502672 m!1385375))

(push 1)

(assert (not b!1502674))

(assert (not b!1502670))

(assert (not b!1502673))

(assert (not b!1502671))

(assert (not start!127896))

(assert (not b!1502672))

(assert (not b!1502677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

