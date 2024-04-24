; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128480 () Bool)

(assert start!128480)

(declare-fun res!1026195 () Bool)

(declare-fun e!842315 () Bool)

(assert (=> start!128480 (=> (not res!1026195) (not e!842315))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128480 (= res!1026195 (validMask!0 mask!2661))))

(assert (=> start!128480 e!842315))

(assert (=> start!128480 true))

(declare-datatypes ((array!100492 0))(
  ( (array!100493 (arr!48493 (Array (_ BitVec 32) (_ BitVec 64))) (size!49044 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100492)

(declare-fun array_inv!37774 (array!100492) Bool)

(assert (=> start!128480 (array_inv!37774 a!2850)))

(declare-fun b!1506774 () Bool)

(declare-fun res!1026190 () Bool)

(declare-fun e!842313 () Bool)

(assert (=> b!1506774 (=> (not res!1026190) (not e!842313))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1506774 (= res!1026190 (not (= (select (arr!48493 a!2850) index!625) (select (arr!48493 a!2850) j!87))))))

(declare-fun b!1506775 () Bool)

(declare-fun res!1026197 () Bool)

(declare-fun e!842316 () Bool)

(assert (=> b!1506775 (=> (not res!1026197) (not e!842316))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12584 0))(
  ( (MissingZero!12584 (index!52728 (_ BitVec 32))) (Found!12584 (index!52729 (_ BitVec 32))) (Intermediate!12584 (undefined!13396 Bool) (index!52730 (_ BitVec 32)) (x!134615 (_ BitVec 32))) (Undefined!12584) (MissingVacant!12584 (index!52731 (_ BitVec 32))) )
))
(declare-fun lt!654514 () SeekEntryResult!12584)

(declare-fun lt!654512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100492 (_ BitVec 32)) SeekEntryResult!12584)

(assert (=> b!1506775 (= res!1026197 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654512 vacantBefore!10 (select (arr!48493 a!2850) j!87) a!2850 mask!2661) lt!654514))))

(declare-fun b!1506776 () Bool)

(declare-fun res!1026189 () Bool)

(assert (=> b!1506776 (=> (not res!1026189) (not e!842315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506776 (= res!1026189 (validKeyInArray!0 (select (arr!48493 a!2850) j!87)))))

(declare-fun b!1506777 () Bool)

(declare-fun res!1026188 () Bool)

(assert (=> b!1506777 (=> (not res!1026188) (not e!842315))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1506777 (= res!1026188 (and (= (size!49044 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49044 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49044 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1506778 () Bool)

(assert (=> b!1506778 (= e!842315 e!842313)))

(declare-fun res!1026194 () Bool)

(assert (=> b!1506778 (=> (not res!1026194) (not e!842313))))

(assert (=> b!1506778 (= res!1026194 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48493 a!2850) j!87) a!2850 mask!2661) lt!654514))))

(assert (=> b!1506778 (= lt!654514 (Found!12584 j!87))))

(declare-fun b!1506779 () Bool)

(declare-fun res!1026196 () Bool)

(assert (=> b!1506779 (=> (not res!1026196) (not e!842315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100492 (_ BitVec 32)) Bool)

(assert (=> b!1506779 (= res!1026196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1506780 () Bool)

(declare-fun res!1026187 () Bool)

(assert (=> b!1506780 (=> (not res!1026187) (not e!842315))))

(declare-datatypes ((List!34972 0))(
  ( (Nil!34969) (Cons!34968 (h!36380 (_ BitVec 64)) (t!49658 List!34972)) )
))
(declare-fun arrayNoDuplicates!0 (array!100492 (_ BitVec 32) List!34972) Bool)

(assert (=> b!1506780 (= res!1026187 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34969))))

(declare-fun b!1506781 () Bool)

(assert (=> b!1506781 (= e!842313 e!842316)))

(declare-fun res!1026193 () Bool)

(assert (=> b!1506781 (=> (not res!1026193) (not e!842316))))

(assert (=> b!1506781 (= res!1026193 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!654512 #b00000000000000000000000000000000) (bvslt lt!654512 (size!49044 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506781 (= lt!654512 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1506782 () Bool)

(declare-fun res!1026192 () Bool)

(assert (=> b!1506782 (=> (not res!1026192) (not e!842315))))

(assert (=> b!1506782 (= res!1026192 (validKeyInArray!0 (select (arr!48493 a!2850) i!996)))))

(declare-fun b!1506783 () Bool)

(declare-fun res!1026191 () Bool)

(assert (=> b!1506783 (=> (not res!1026191) (not e!842315))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1506783 (= res!1026191 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49044 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49044 a!2850)) (= (select (arr!48493 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48493 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49044 a!2850))))))

(declare-fun b!1506784 () Bool)

(assert (=> b!1506784 (= e!842316 (not true))))

(assert (=> b!1506784 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654512 vacantAfter!10 (select (store (arr!48493 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100493 (store (arr!48493 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49044 a!2850)) mask!2661) lt!654514)))

(declare-datatypes ((Unit!50209 0))(
  ( (Unit!50210) )
))
(declare-fun lt!654513 () Unit!50209)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50209)

(assert (=> b!1506784 (= lt!654513 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!654512 vacantBefore!10 vacantAfter!10 mask!2661))))

(assert (= (and start!128480 res!1026195) b!1506777))

(assert (= (and b!1506777 res!1026188) b!1506782))

(assert (= (and b!1506782 res!1026192) b!1506776))

(assert (= (and b!1506776 res!1026189) b!1506779))

(assert (= (and b!1506779 res!1026196) b!1506780))

(assert (= (and b!1506780 res!1026187) b!1506783))

(assert (= (and b!1506783 res!1026191) b!1506778))

(assert (= (and b!1506778 res!1026194) b!1506774))

(assert (= (and b!1506774 res!1026190) b!1506781))

(assert (= (and b!1506781 res!1026193) b!1506775))

(assert (= (and b!1506775 res!1026197) b!1506784))

(declare-fun m!1389831 () Bool)

(assert (=> b!1506775 m!1389831))

(assert (=> b!1506775 m!1389831))

(declare-fun m!1389833 () Bool)

(assert (=> b!1506775 m!1389833))

(assert (=> b!1506778 m!1389831))

(assert (=> b!1506778 m!1389831))

(declare-fun m!1389835 () Bool)

(assert (=> b!1506778 m!1389835))

(declare-fun m!1389837 () Bool)

(assert (=> b!1506779 m!1389837))

(assert (=> b!1506776 m!1389831))

(assert (=> b!1506776 m!1389831))

(declare-fun m!1389839 () Bool)

(assert (=> b!1506776 m!1389839))

(declare-fun m!1389841 () Bool)

(assert (=> start!128480 m!1389841))

(declare-fun m!1389843 () Bool)

(assert (=> start!128480 m!1389843))

(declare-fun m!1389845 () Bool)

(assert (=> b!1506774 m!1389845))

(assert (=> b!1506774 m!1389831))

(declare-fun m!1389847 () Bool)

(assert (=> b!1506781 m!1389847))

(declare-fun m!1389849 () Bool)

(assert (=> b!1506783 m!1389849))

(declare-fun m!1389851 () Bool)

(assert (=> b!1506783 m!1389851))

(declare-fun m!1389853 () Bool)

(assert (=> b!1506783 m!1389853))

(declare-fun m!1389855 () Bool)

(assert (=> b!1506782 m!1389855))

(assert (=> b!1506782 m!1389855))

(declare-fun m!1389857 () Bool)

(assert (=> b!1506782 m!1389857))

(assert (=> b!1506784 m!1389851))

(declare-fun m!1389859 () Bool)

(assert (=> b!1506784 m!1389859))

(assert (=> b!1506784 m!1389859))

(declare-fun m!1389861 () Bool)

(assert (=> b!1506784 m!1389861))

(declare-fun m!1389863 () Bool)

(assert (=> b!1506784 m!1389863))

(declare-fun m!1389865 () Bool)

(assert (=> b!1506780 m!1389865))

(check-sat (not b!1506776) (not b!1506781) (not b!1506782) (not b!1506779) (not b!1506778) (not b!1506775) (not b!1506780) (not start!128480) (not b!1506784))
(check-sat)
