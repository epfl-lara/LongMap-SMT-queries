; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127964 () Bool)

(assert start!127964)

(declare-fun b!1501729 () Bool)

(declare-fun res!1021626 () Bool)

(declare-fun e!840568 () Bool)

(assert (=> b!1501729 (=> (not res!1021626) (not e!840568))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100159 0))(
  ( (array!100160 (arr!48334 (Array (_ BitVec 32) (_ BitVec 64))) (size!48885 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100159)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12437 0))(
  ( (MissingZero!12437 (index!52140 (_ BitVec 32))) (Found!12437 (index!52141 (_ BitVec 32))) (Intermediate!12437 (undefined!13249 Bool) (index!52142 (_ BitVec 32)) (x!134020 (_ BitVec 32))) (Undefined!12437) (MissingVacant!12437 (index!52143 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100159 (_ BitVec 32)) SeekEntryResult!12437)

(assert (=> b!1501729 (= res!1021626 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48334 a!2850) j!87) a!2850 mask!2661) (Found!12437 j!87)))))

(declare-fun res!1021625 () Bool)

(assert (=> start!127964 (=> (not res!1021625) (not e!840568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127964 (= res!1021625 (validMask!0 mask!2661))))

(assert (=> start!127964 e!840568))

(assert (=> start!127964 true))

(declare-fun array_inv!37615 (array!100159) Bool)

(assert (=> start!127964 (array_inv!37615 a!2850)))

(declare-fun b!1501730 () Bool)

(declare-fun res!1021627 () Bool)

(assert (=> b!1501730 (=> (not res!1021627) (not e!840568))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501730 (= res!1021627 (validKeyInArray!0 (select (arr!48334 a!2850) j!87)))))

(declare-fun b!1501731 () Bool)

(declare-fun res!1021630 () Bool)

(assert (=> b!1501731 (=> (not res!1021630) (not e!840568))))

(declare-datatypes ((List!34813 0))(
  ( (Nil!34810) (Cons!34809 (h!36221 (_ BitVec 64)) (t!49499 List!34813)) )
))
(declare-fun arrayNoDuplicates!0 (array!100159 (_ BitVec 32) List!34813) Bool)

(assert (=> b!1501731 (= res!1021630 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34810))))

(declare-fun b!1501732 () Bool)

(declare-fun res!1021631 () Bool)

(assert (=> b!1501732 (=> (not res!1021631) (not e!840568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100159 (_ BitVec 32)) Bool)

(assert (=> b!1501732 (= res!1021631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501733 () Bool)

(declare-fun e!840569 () Bool)

(assert (=> b!1501733 (= e!840568 e!840569)))

(declare-fun res!1021628 () Bool)

(assert (=> b!1501733 (=> (not res!1021628) (not e!840569))))

(declare-fun lt!653493 () (_ BitVec 32))

(assert (=> b!1501733 (= res!1021628 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653493 #b00000000000000000000000000000000) (bvslt lt!653493 (size!48885 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501733 (= lt!653493 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1501734 () Bool)

(assert (=> b!1501734 (= e!840569 false)))

(declare-fun lt!653492 () SeekEntryResult!12437)

(assert (=> b!1501734 (= lt!653492 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653493 vacantBefore!10 (select (arr!48334 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501735 () Bool)

(declare-fun res!1021629 () Bool)

(assert (=> b!1501735 (=> (not res!1021629) (not e!840568))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501735 (= res!1021629 (and (= (size!48885 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48885 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48885 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501736 () Bool)

(declare-fun res!1021622 () Bool)

(assert (=> b!1501736 (=> (not res!1021622) (not e!840568))))

(assert (=> b!1501736 (= res!1021622 (not (= (select (arr!48334 a!2850) index!625) (select (arr!48334 a!2850) j!87))))))

(declare-fun b!1501737 () Bool)

(declare-fun res!1021624 () Bool)

(assert (=> b!1501737 (=> (not res!1021624) (not e!840568))))

(assert (=> b!1501737 (= res!1021624 (validKeyInArray!0 (select (arr!48334 a!2850) i!996)))))

(declare-fun b!1501738 () Bool)

(declare-fun res!1021623 () Bool)

(assert (=> b!1501738 (=> (not res!1021623) (not e!840568))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501738 (= res!1021623 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48885 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48885 a!2850)) (= (select (arr!48334 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48334 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48885 a!2850))))))

(assert (= (and start!127964 res!1021625) b!1501735))

(assert (= (and b!1501735 res!1021629) b!1501737))

(assert (= (and b!1501737 res!1021624) b!1501730))

(assert (= (and b!1501730 res!1021627) b!1501732))

(assert (= (and b!1501732 res!1021631) b!1501731))

(assert (= (and b!1501731 res!1021630) b!1501738))

(assert (= (and b!1501738 res!1021623) b!1501729))

(assert (= (and b!1501729 res!1021626) b!1501736))

(assert (= (and b!1501736 res!1021622) b!1501733))

(assert (= (and b!1501733 res!1021628) b!1501734))

(declare-fun m!1384873 () Bool)

(assert (=> b!1501737 m!1384873))

(assert (=> b!1501737 m!1384873))

(declare-fun m!1384875 () Bool)

(assert (=> b!1501737 m!1384875))

(declare-fun m!1384877 () Bool)

(assert (=> b!1501736 m!1384877))

(declare-fun m!1384879 () Bool)

(assert (=> b!1501736 m!1384879))

(declare-fun m!1384881 () Bool)

(assert (=> b!1501731 m!1384881))

(declare-fun m!1384883 () Bool)

(assert (=> start!127964 m!1384883))

(declare-fun m!1384885 () Bool)

(assert (=> start!127964 m!1384885))

(assert (=> b!1501730 m!1384879))

(assert (=> b!1501730 m!1384879))

(declare-fun m!1384887 () Bool)

(assert (=> b!1501730 m!1384887))

(declare-fun m!1384889 () Bool)

(assert (=> b!1501733 m!1384889))

(declare-fun m!1384891 () Bool)

(assert (=> b!1501732 m!1384891))

(declare-fun m!1384893 () Bool)

(assert (=> b!1501738 m!1384893))

(declare-fun m!1384895 () Bool)

(assert (=> b!1501738 m!1384895))

(declare-fun m!1384897 () Bool)

(assert (=> b!1501738 m!1384897))

(assert (=> b!1501729 m!1384879))

(assert (=> b!1501729 m!1384879))

(declare-fun m!1384899 () Bool)

(assert (=> b!1501729 m!1384899))

(assert (=> b!1501734 m!1384879))

(assert (=> b!1501734 m!1384879))

(declare-fun m!1384901 () Bool)

(assert (=> b!1501734 m!1384901))

(check-sat (not b!1501732) (not b!1501729) (not b!1501730) (not b!1501737) (not b!1501731) (not b!1501734) (not start!127964) (not b!1501733))
(check-sat)
