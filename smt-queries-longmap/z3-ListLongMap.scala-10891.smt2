; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127876 () Bool)

(assert start!127876)

(declare-fun b!1500828 () Bool)

(declare-fun res!1020807 () Bool)

(declare-fun e!840261 () Bool)

(assert (=> b!1500828 (=> (not res!1020807) (not e!840261))))

(declare-datatypes ((array!100102 0))(
  ( (array!100103 (arr!48307 (Array (_ BitVec 32) (_ BitVec 64))) (size!48858 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100102)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500828 (= res!1020807 (validKeyInArray!0 (select (arr!48307 a!2850) i!996)))))

(declare-fun b!1500829 () Bool)

(declare-fun res!1020812 () Bool)

(assert (=> b!1500829 (=> (not res!1020812) (not e!840261))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500829 (= res!1020812 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48858 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48858 a!2850)) (= (select (arr!48307 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48307 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48858 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun b!1500830 () Bool)

(assert (=> b!1500830 (= e!840261 (and (not (= (select (arr!48307 a!2850) index!625) (select (arr!48307 a!2850) j!87))) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1500831 () Bool)

(declare-fun res!1020810 () Bool)

(assert (=> b!1500831 (=> (not res!1020810) (not e!840261))))

(declare-datatypes ((List!34786 0))(
  ( (Nil!34783) (Cons!34782 (h!36194 (_ BitVec 64)) (t!49472 List!34786)) )
))
(declare-fun arrayNoDuplicates!0 (array!100102 (_ BitVec 32) List!34786) Bool)

(assert (=> b!1500831 (= res!1020810 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34783))))

(declare-fun b!1500832 () Bool)

(declare-fun res!1020811 () Bool)

(assert (=> b!1500832 (=> (not res!1020811) (not e!840261))))

(declare-datatypes ((SeekEntryResult!12410 0))(
  ( (MissingZero!12410 (index!52032 (_ BitVec 32))) (Found!12410 (index!52033 (_ BitVec 32))) (Intermediate!12410 (undefined!13222 Bool) (index!52034 (_ BitVec 32)) (x!133918 (_ BitVec 32))) (Undefined!12410) (MissingVacant!12410 (index!52035 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100102 (_ BitVec 32)) SeekEntryResult!12410)

(assert (=> b!1500832 (= res!1020811 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48307 a!2850) j!87) a!2850 mask!2661) (Found!12410 j!87)))))

(declare-fun res!1020809 () Bool)

(assert (=> start!127876 (=> (not res!1020809) (not e!840261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127876 (= res!1020809 (validMask!0 mask!2661))))

(assert (=> start!127876 e!840261))

(assert (=> start!127876 true))

(declare-fun array_inv!37588 (array!100102) Bool)

(assert (=> start!127876 (array_inv!37588 a!2850)))

(declare-fun b!1500833 () Bool)

(declare-fun res!1020805 () Bool)

(assert (=> b!1500833 (=> (not res!1020805) (not e!840261))))

(assert (=> b!1500833 (= res!1020805 (and (= (size!48858 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48858 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48858 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500834 () Bool)

(declare-fun res!1020806 () Bool)

(assert (=> b!1500834 (=> (not res!1020806) (not e!840261))))

(assert (=> b!1500834 (= res!1020806 (validKeyInArray!0 (select (arr!48307 a!2850) j!87)))))

(declare-fun b!1500835 () Bool)

(declare-fun res!1020808 () Bool)

(assert (=> b!1500835 (=> (not res!1020808) (not e!840261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100102 (_ BitVec 32)) Bool)

(assert (=> b!1500835 (= res!1020808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127876 res!1020809) b!1500833))

(assert (= (and b!1500833 res!1020805) b!1500828))

(assert (= (and b!1500828 res!1020807) b!1500834))

(assert (= (and b!1500834 res!1020806) b!1500835))

(assert (= (and b!1500835 res!1020808) b!1500831))

(assert (= (and b!1500831 res!1020810) b!1500829))

(assert (= (and b!1500829 res!1020812) b!1500832))

(assert (= (and b!1500832 res!1020811) b!1500830))

(declare-fun m!1384031 () Bool)

(assert (=> b!1500831 m!1384031))

(declare-fun m!1384033 () Bool)

(assert (=> b!1500835 m!1384033))

(declare-fun m!1384035 () Bool)

(assert (=> b!1500830 m!1384035))

(declare-fun m!1384037 () Bool)

(assert (=> b!1500830 m!1384037))

(declare-fun m!1384039 () Bool)

(assert (=> start!127876 m!1384039))

(declare-fun m!1384041 () Bool)

(assert (=> start!127876 m!1384041))

(declare-fun m!1384043 () Bool)

(assert (=> b!1500828 m!1384043))

(assert (=> b!1500828 m!1384043))

(declare-fun m!1384045 () Bool)

(assert (=> b!1500828 m!1384045))

(declare-fun m!1384047 () Bool)

(assert (=> b!1500829 m!1384047))

(declare-fun m!1384049 () Bool)

(assert (=> b!1500829 m!1384049))

(declare-fun m!1384051 () Bool)

(assert (=> b!1500829 m!1384051))

(assert (=> b!1500834 m!1384037))

(assert (=> b!1500834 m!1384037))

(declare-fun m!1384053 () Bool)

(assert (=> b!1500834 m!1384053))

(assert (=> b!1500832 m!1384037))

(assert (=> b!1500832 m!1384037))

(declare-fun m!1384055 () Bool)

(assert (=> b!1500832 m!1384055))

(check-sat (not start!127876) (not b!1500834) (not b!1500835) (not b!1500831) (not b!1500828) (not b!1500832))
(check-sat)
