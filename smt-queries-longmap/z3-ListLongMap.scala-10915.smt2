; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127706 () Bool)

(assert start!127706)

(declare-fun b!1500954 () Bool)

(declare-fun e!839667 () Bool)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1500954 (= e!839667 (not (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)))))))

(declare-datatypes ((array!100081 0))(
  ( (array!100082 (arr!48301 (Array (_ BitVec 32) (_ BitVec 64))) (size!48853 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100081)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun lt!652847 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12532 0))(
  ( (MissingZero!12532 (index!52520 (_ BitVec 32))) (Found!12532 (index!52521 (_ BitVec 32))) (Intermediate!12532 (undefined!13344 Bool) (index!52522 (_ BitVec 32)) (x!134193 (_ BitVec 32))) (Undefined!12532) (MissingVacant!12532 (index!52523 (_ BitVec 32))) )
))
(declare-fun lt!652848 () SeekEntryResult!12532)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100081 (_ BitVec 32)) SeekEntryResult!12532)

(assert (=> b!1500954 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652847 vacantAfter!10 (select (store (arr!48301 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100082 (store (arr!48301 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48853 a!2850)) mask!2661) lt!652848)))

(declare-datatypes ((Unit!50059 0))(
  ( (Unit!50060) )
))
(declare-fun lt!652849 () Unit!50059)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100081 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50059)

(assert (=> b!1500954 (= lt!652849 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!652847 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1500955 () Bool)

(declare-fun res!1022222 () Bool)

(declare-fun e!839665 () Bool)

(assert (=> b!1500955 (=> (not res!1022222) (not e!839665))))

(declare-datatypes ((List!34871 0))(
  ( (Nil!34868) (Cons!34867 (h!36265 (_ BitVec 64)) (t!49557 List!34871)) )
))
(declare-fun arrayNoDuplicates!0 (array!100081 (_ BitVec 32) List!34871) Bool)

(assert (=> b!1500955 (= res!1022222 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34868))))

(declare-fun b!1500957 () Bool)

(declare-fun res!1022220 () Bool)

(assert (=> b!1500957 (=> (not res!1022220) (not e!839665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500957 (= res!1022220 (validKeyInArray!0 (select (arr!48301 a!2850) j!87)))))

(declare-fun b!1500958 () Bool)

(declare-fun e!839664 () Bool)

(assert (=> b!1500958 (= e!839665 e!839664)))

(declare-fun res!1022224 () Bool)

(assert (=> b!1500958 (=> (not res!1022224) (not e!839664))))

(assert (=> b!1500958 (= res!1022224 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48301 a!2850) j!87) a!2850 mask!2661) lt!652848))))

(assert (=> b!1500958 (= lt!652848 (Found!12532 j!87))))

(declare-fun b!1500959 () Bool)

(declare-fun res!1022227 () Bool)

(assert (=> b!1500959 (=> (not res!1022227) (not e!839665))))

(assert (=> b!1500959 (= res!1022227 (and (= (size!48853 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48853 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48853 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500960 () Bool)

(declare-fun res!1022226 () Bool)

(assert (=> b!1500960 (=> (not res!1022226) (not e!839667))))

(assert (=> b!1500960 (= res!1022226 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652847 vacantBefore!10 (select (arr!48301 a!2850) j!87) a!2850 mask!2661) lt!652848))))

(declare-fun b!1500961 () Bool)

(declare-fun res!1022223 () Bool)

(assert (=> b!1500961 (=> (not res!1022223) (not e!839665))))

(assert (=> b!1500961 (= res!1022223 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48853 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48853 a!2850)) (= (select (arr!48301 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48301 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48853 a!2850))))))

(declare-fun b!1500962 () Bool)

(declare-fun res!1022221 () Bool)

(assert (=> b!1500962 (=> (not res!1022221) (not e!839665))))

(assert (=> b!1500962 (= res!1022221 (validKeyInArray!0 (select (arr!48301 a!2850) i!996)))))

(declare-fun b!1500963 () Bool)

(declare-fun res!1022228 () Bool)

(assert (=> b!1500963 (=> (not res!1022228) (not e!839664))))

(assert (=> b!1500963 (= res!1022228 (not (= (select (arr!48301 a!2850) index!625) (select (arr!48301 a!2850) j!87))))))

(declare-fun b!1500964 () Bool)

(assert (=> b!1500964 (= e!839664 e!839667)))

(declare-fun res!1022218 () Bool)

(assert (=> b!1500964 (=> (not res!1022218) (not e!839667))))

(assert (=> b!1500964 (= res!1022218 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652847 #b00000000000000000000000000000000) (bvslt lt!652847 (size!48853 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500964 (= lt!652847 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1022225 () Bool)

(assert (=> start!127706 (=> (not res!1022225) (not e!839665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127706 (= res!1022225 (validMask!0 mask!2661))))

(assert (=> start!127706 e!839665))

(assert (=> start!127706 true))

(declare-fun array_inv!37534 (array!100081) Bool)

(assert (=> start!127706 (array_inv!37534 a!2850)))

(declare-fun b!1500956 () Bool)

(declare-fun res!1022219 () Bool)

(assert (=> b!1500956 (=> (not res!1022219) (not e!839665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100081 (_ BitVec 32)) Bool)

(assert (=> b!1500956 (= res!1022219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127706 res!1022225) b!1500959))

(assert (= (and b!1500959 res!1022227) b!1500962))

(assert (= (and b!1500962 res!1022221) b!1500957))

(assert (= (and b!1500957 res!1022220) b!1500956))

(assert (= (and b!1500956 res!1022219) b!1500955))

(assert (= (and b!1500955 res!1022222) b!1500961))

(assert (= (and b!1500961 res!1022223) b!1500958))

(assert (= (and b!1500958 res!1022224) b!1500963))

(assert (= (and b!1500963 res!1022228) b!1500964))

(assert (= (and b!1500964 res!1022218) b!1500960))

(assert (= (and b!1500960 res!1022226) b!1500954))

(declare-fun m!1383619 () Bool)

(assert (=> b!1500964 m!1383619))

(declare-fun m!1383621 () Bool)

(assert (=> b!1500954 m!1383621))

(declare-fun m!1383623 () Bool)

(assert (=> b!1500954 m!1383623))

(assert (=> b!1500954 m!1383623))

(declare-fun m!1383625 () Bool)

(assert (=> b!1500954 m!1383625))

(declare-fun m!1383627 () Bool)

(assert (=> b!1500954 m!1383627))

(declare-fun m!1383629 () Bool)

(assert (=> b!1500956 m!1383629))

(declare-fun m!1383631 () Bool)

(assert (=> start!127706 m!1383631))

(declare-fun m!1383633 () Bool)

(assert (=> start!127706 m!1383633))

(declare-fun m!1383635 () Bool)

(assert (=> b!1500961 m!1383635))

(assert (=> b!1500961 m!1383621))

(declare-fun m!1383637 () Bool)

(assert (=> b!1500961 m!1383637))

(declare-fun m!1383639 () Bool)

(assert (=> b!1500955 m!1383639))

(declare-fun m!1383641 () Bool)

(assert (=> b!1500963 m!1383641))

(declare-fun m!1383643 () Bool)

(assert (=> b!1500963 m!1383643))

(declare-fun m!1383645 () Bool)

(assert (=> b!1500962 m!1383645))

(assert (=> b!1500962 m!1383645))

(declare-fun m!1383647 () Bool)

(assert (=> b!1500962 m!1383647))

(assert (=> b!1500958 m!1383643))

(assert (=> b!1500958 m!1383643))

(declare-fun m!1383649 () Bool)

(assert (=> b!1500958 m!1383649))

(assert (=> b!1500957 m!1383643))

(assert (=> b!1500957 m!1383643))

(declare-fun m!1383651 () Bool)

(assert (=> b!1500957 m!1383651))

(assert (=> b!1500960 m!1383643))

(assert (=> b!1500960 m!1383643))

(declare-fun m!1383653 () Bool)

(assert (=> b!1500960 m!1383653))

(check-sat (not b!1500955) (not b!1500954) (not start!127706) (not b!1500956) (not b!1500957) (not b!1500960) (not b!1500962) (not b!1500964) (not b!1500958))
(check-sat)
