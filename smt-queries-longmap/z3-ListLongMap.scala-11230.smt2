; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130962 () Bool)

(assert start!130962)

(declare-fun b!1536820 () Bool)

(declare-fun e!855303 () Bool)

(declare-fun e!855301 () Bool)

(assert (=> b!1536820 (= e!855303 e!855301)))

(declare-fun res!1054096 () Bool)

(assert (=> b!1536820 (=> (not res!1054096) (not e!855301))))

(declare-datatypes ((SeekEntryResult!13403 0))(
  ( (MissingZero!13403 (index!56007 (_ BitVec 32))) (Found!13403 (index!56008 (_ BitVec 32))) (Intermediate!13403 (undefined!14215 Bool) (index!56009 (_ BitVec 32)) (x!137736 (_ BitVec 32))) (Undefined!13403) (MissingVacant!13403 (index!56010 (_ BitVec 32))) )
))
(declare-fun lt!664319 () SeekEntryResult!13403)

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102058 0))(
  ( (array!102059 (arr!49246 (Array (_ BitVec 32) (_ BitVec 64))) (size!49798 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102058)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102058 (_ BitVec 32)) SeekEntryResult!13403)

(assert (=> b!1536820 (= res!1054096 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49246 a!2792) j!64) a!2792 mask!2480) lt!664319))))

(assert (=> b!1536820 (= lt!664319 (Found!13403 j!64))))

(declare-fun b!1536821 () Bool)

(declare-fun res!1054097 () Bool)

(assert (=> b!1536821 (=> (not res!1054097) (not e!855303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536821 (= res!1054097 (validKeyInArray!0 (select (arr!49246 a!2792) j!64)))))

(declare-fun b!1536822 () Bool)

(declare-fun res!1054094 () Bool)

(assert (=> b!1536822 (=> (not res!1054094) (not e!855301))))

(assert (=> b!1536822 (= res!1054094 (not (= (select (arr!49246 a!2792) index!463) (select (arr!49246 a!2792) j!64))))))

(declare-fun b!1536823 () Bool)

(declare-fun res!1054091 () Bool)

(assert (=> b!1536823 (=> (not res!1054091) (not e!855303))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536823 (= res!1054091 (validKeyInArray!0 (select (arr!49246 a!2792) i!951)))))

(declare-fun b!1536824 () Bool)

(declare-fun res!1054095 () Bool)

(assert (=> b!1536824 (=> (not res!1054095) (not e!855303))))

(declare-datatypes ((List!35798 0))(
  ( (Nil!35795) (Cons!35794 (h!37240 (_ BitVec 64)) (t!50484 List!35798)) )
))
(declare-fun arrayNoDuplicates!0 (array!102058 (_ BitVec 32) List!35798) Bool)

(assert (=> b!1536824 (= res!1054095 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35795))))

(declare-fun b!1536825 () Bool)

(declare-fun res!1054089 () Bool)

(assert (=> b!1536825 (=> (not res!1054089) (not e!855303))))

(assert (=> b!1536825 (= res!1054089 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49798 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49798 a!2792)) (= (select (arr!49246 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536826 () Bool)

(declare-fun e!855302 () Bool)

(assert (=> b!1536826 (= e!855301 e!855302)))

(declare-fun res!1054092 () Bool)

(assert (=> b!1536826 (=> (not res!1054092) (not e!855302))))

(declare-fun lt!664317 () (_ BitVec 32))

(assert (=> b!1536826 (= res!1054092 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664317 #b00000000000000000000000000000000) (bvslt lt!664317 (size!49798 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536826 (= lt!664317 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536827 () Bool)

(declare-fun res!1054099 () Bool)

(assert (=> b!1536827 (=> (not res!1054099) (not e!855303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102058 (_ BitVec 32)) Bool)

(assert (=> b!1536827 (= res!1054099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536828 () Bool)

(declare-fun e!855300 () Bool)

(assert (=> b!1536828 (= e!855302 e!855300)))

(declare-fun res!1054098 () Bool)

(assert (=> b!1536828 (=> (not res!1054098) (not e!855300))))

(declare-fun lt!664320 () SeekEntryResult!13403)

(assert (=> b!1536828 (= res!1054098 (= lt!664320 lt!664319))))

(assert (=> b!1536828 (= lt!664320 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664317 vacantIndex!5 (select (arr!49246 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536829 () Bool)

(declare-fun res!1054093 () Bool)

(assert (=> b!1536829 (=> (not res!1054093) (not e!855303))))

(assert (=> b!1536829 (= res!1054093 (and (= (size!49798 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49798 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49798 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1054090 () Bool)

(assert (=> start!130962 (=> (not res!1054090) (not e!855303))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130962 (= res!1054090 (validMask!0 mask!2480))))

(assert (=> start!130962 e!855303))

(assert (=> start!130962 true))

(declare-fun array_inv!38479 (array!102058) Bool)

(assert (=> start!130962 (array_inv!38479 a!2792)))

(declare-fun b!1536819 () Bool)

(assert (=> b!1536819 (= e!855300 (not true))))

(assert (=> b!1536819 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664317 vacantIndex!5 (select (store (arr!49246 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102059 (store (arr!49246 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49798 a!2792)) mask!2480) lt!664320)))

(declare-datatypes ((Unit!51213 0))(
  ( (Unit!51214) )
))
(declare-fun lt!664318 () Unit!51213)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51213)

(assert (=> b!1536819 (= lt!664318 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664317 vacantIndex!5 mask!2480))))

(assert (= (and start!130962 res!1054090) b!1536829))

(assert (= (and b!1536829 res!1054093) b!1536823))

(assert (= (and b!1536823 res!1054091) b!1536821))

(assert (= (and b!1536821 res!1054097) b!1536827))

(assert (= (and b!1536827 res!1054099) b!1536824))

(assert (= (and b!1536824 res!1054095) b!1536825))

(assert (= (and b!1536825 res!1054089) b!1536820))

(assert (= (and b!1536820 res!1054096) b!1536822))

(assert (= (and b!1536822 res!1054094) b!1536826))

(assert (= (and b!1536826 res!1054092) b!1536828))

(assert (= (and b!1536828 res!1054098) b!1536819))

(declare-fun m!1418735 () Bool)

(assert (=> start!130962 m!1418735))

(declare-fun m!1418737 () Bool)

(assert (=> start!130962 m!1418737))

(declare-fun m!1418739 () Bool)

(assert (=> b!1536821 m!1418739))

(assert (=> b!1536821 m!1418739))

(declare-fun m!1418741 () Bool)

(assert (=> b!1536821 m!1418741))

(assert (=> b!1536820 m!1418739))

(assert (=> b!1536820 m!1418739))

(declare-fun m!1418743 () Bool)

(assert (=> b!1536820 m!1418743))

(declare-fun m!1418745 () Bool)

(assert (=> b!1536825 m!1418745))

(declare-fun m!1418747 () Bool)

(assert (=> b!1536823 m!1418747))

(assert (=> b!1536823 m!1418747))

(declare-fun m!1418749 () Bool)

(assert (=> b!1536823 m!1418749))

(declare-fun m!1418751 () Bool)

(assert (=> b!1536819 m!1418751))

(declare-fun m!1418753 () Bool)

(assert (=> b!1536819 m!1418753))

(assert (=> b!1536819 m!1418753))

(declare-fun m!1418755 () Bool)

(assert (=> b!1536819 m!1418755))

(declare-fun m!1418757 () Bool)

(assert (=> b!1536819 m!1418757))

(assert (=> b!1536828 m!1418739))

(assert (=> b!1536828 m!1418739))

(declare-fun m!1418759 () Bool)

(assert (=> b!1536828 m!1418759))

(declare-fun m!1418761 () Bool)

(assert (=> b!1536822 m!1418761))

(assert (=> b!1536822 m!1418739))

(declare-fun m!1418763 () Bool)

(assert (=> b!1536827 m!1418763))

(declare-fun m!1418765 () Bool)

(assert (=> b!1536826 m!1418765))

(declare-fun m!1418767 () Bool)

(assert (=> b!1536824 m!1418767))

(check-sat (not b!1536828) (not b!1536824) (not b!1536819) (not b!1536823) (not start!130962) (not b!1536827) (not b!1536826) (not b!1536821) (not b!1536820))
(check-sat)
