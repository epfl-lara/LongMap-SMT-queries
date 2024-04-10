; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93426 () Bool)

(assert start!93426)

(declare-fun b!1058151 () Bool)

(declare-fun res!706725 () Bool)

(declare-fun e!601949 () Bool)

(assert (=> b!1058151 (=> (not res!706725) (not e!601949))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058151 (= res!706725 (validKeyInArray!0 k!2747))))

(declare-fun b!1058152 () Bool)

(declare-fun e!601946 () Bool)

(assert (=> b!1058152 (= e!601946 true)))

(declare-fun lt!466733 () Bool)

(declare-datatypes ((List!22395 0))(
  ( (Nil!22392) (Cons!22391 (h!23600 (_ BitVec 64)) (t!31702 List!22395)) )
))
(declare-fun contains!6207 (List!22395 (_ BitVec 64)) Bool)

(assert (=> b!1058152 (= lt!466733 (contains!6207 Nil!22392 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058153 () Bool)

(declare-fun e!601947 () Bool)

(declare-fun e!601944 () Bool)

(assert (=> b!1058153 (= e!601947 e!601944)))

(declare-fun res!706728 () Bool)

(assert (=> b!1058153 (=> (not res!706728) (not e!601944))))

(declare-fun lt!466732 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1058153 (= res!706728 (not (= lt!466732 i!1381)))))

(declare-datatypes ((array!66729 0))(
  ( (array!66730 (arr!32083 (Array (_ BitVec 32) (_ BitVec 64))) (size!32619 (_ BitVec 32))) )
))
(declare-fun lt!466730 () array!66729)

(declare-fun arrayScanForKey!0 (array!66729 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058153 (= lt!466732 (arrayScanForKey!0 lt!466730 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1058154 () Bool)

(declare-fun res!706736 () Bool)

(assert (=> b!1058154 (=> (not res!706736) (not e!601949))))

(declare-fun a!3488 () array!66729)

(assert (=> b!1058154 (= res!706736 (= (select (arr!32083 a!3488) i!1381) k!2747))))

(declare-fun b!1058155 () Bool)

(declare-fun e!601951 () Bool)

(declare-fun e!601950 () Bool)

(assert (=> b!1058155 (= e!601951 e!601950)))

(declare-fun res!706730 () Bool)

(assert (=> b!1058155 (=> res!706730 e!601950)))

(assert (=> b!1058155 (= res!706730 (or (bvsgt lt!466732 i!1381) (bvsle i!1381 lt!466732)))))

(declare-fun b!1058156 () Bool)

(declare-fun res!706735 () Bool)

(assert (=> b!1058156 (=> res!706735 e!601946)))

(assert (=> b!1058156 (= res!706735 (contains!6207 Nil!22392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1058157 () Bool)

(declare-fun res!706727 () Bool)

(assert (=> b!1058157 (=> res!706727 e!601946)))

(declare-fun noDuplicate!1563 (List!22395) Bool)

(assert (=> b!1058157 (= res!706727 (not (noDuplicate!1563 Nil!22392)))))

(declare-fun b!1058158 () Bool)

(declare-fun arrayContainsKey!0 (array!66729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058158 (= e!601950 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(declare-fun b!1058159 () Bool)

(declare-fun e!601945 () Bool)

(assert (=> b!1058159 (= e!601945 e!601946)))

(declare-fun res!706733 () Bool)

(assert (=> b!1058159 (=> res!706733 e!601946)))

(declare-fun lt!466729 () (_ BitVec 32))

(assert (=> b!1058159 (= res!706733 (or (bvslt lt!466732 #b00000000000000000000000000000000) (bvsge lt!466729 (size!32619 a!3488)) (bvsge lt!466732 (size!32619 a!3488))))))

(assert (=> b!1058159 (arrayContainsKey!0 a!3488 k!2747 lt!466729)))

(declare-datatypes ((Unit!34688 0))(
  ( (Unit!34689) )
))
(declare-fun lt!466731 () Unit!34688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66729 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34688)

(assert (=> b!1058159 (= lt!466731 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 i!1381 lt!466729))))

(assert (=> b!1058159 (= lt!466729 (bvadd #b00000000000000000000000000000001 lt!466732))))

(declare-fun arrayNoDuplicates!0 (array!66729 (_ BitVec 32) List!22395) Bool)

(assert (=> b!1058159 (arrayNoDuplicates!0 a!3488 lt!466732 Nil!22392)))

(declare-fun lt!466734 () Unit!34688)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66729 (_ BitVec 32) (_ BitVec 32)) Unit!34688)

(assert (=> b!1058159 (= lt!466734 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!466732))))

(declare-fun res!706732 () Bool)

(assert (=> start!93426 (=> (not res!706732) (not e!601949))))

(assert (=> start!93426 (= res!706732 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32619 a!3488)) (bvslt (size!32619 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93426 e!601949))

(assert (=> start!93426 true))

(declare-fun array_inv!24863 (array!66729) Bool)

(assert (=> start!93426 (array_inv!24863 a!3488)))

(declare-fun b!1058160 () Bool)

(assert (=> b!1058160 (= e!601949 e!601947)))

(declare-fun res!706731 () Bool)

(assert (=> b!1058160 (=> (not res!706731) (not e!601947))))

(assert (=> b!1058160 (= res!706731 (arrayContainsKey!0 lt!466730 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058160 (= lt!466730 (array!66730 (store (arr!32083 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32619 a!3488)))))

(declare-fun b!1058161 () Bool)

(declare-fun res!706729 () Bool)

(assert (=> b!1058161 (=> (not res!706729) (not e!601949))))

(assert (=> b!1058161 (= res!706729 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22392))))

(declare-fun b!1058162 () Bool)

(assert (=> b!1058162 (= e!601944 (not e!601945))))

(declare-fun res!706726 () Bool)

(assert (=> b!1058162 (=> res!706726 e!601945)))

(assert (=> b!1058162 (= res!706726 (or (bvsgt lt!466732 i!1381) (bvsle i!1381 lt!466732)))))

(assert (=> b!1058162 e!601951))

(declare-fun res!706734 () Bool)

(assert (=> b!1058162 (=> (not res!706734) (not e!601951))))

(assert (=> b!1058162 (= res!706734 (= (select (store (arr!32083 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466732) k!2747))))

(assert (= (and start!93426 res!706732) b!1058161))

(assert (= (and b!1058161 res!706729) b!1058151))

(assert (= (and b!1058151 res!706725) b!1058154))

(assert (= (and b!1058154 res!706736) b!1058160))

(assert (= (and b!1058160 res!706731) b!1058153))

(assert (= (and b!1058153 res!706728) b!1058162))

(assert (= (and b!1058162 res!706734) b!1058155))

(assert (= (and b!1058155 (not res!706730)) b!1058158))

(assert (= (and b!1058162 (not res!706726)) b!1058159))

(assert (= (and b!1058159 (not res!706733)) b!1058157))

(assert (= (and b!1058157 (not res!706727)) b!1058156))

(assert (= (and b!1058156 (not res!706735)) b!1058152))

(declare-fun m!977795 () Bool)

(assert (=> b!1058160 m!977795))

(declare-fun m!977797 () Bool)

(assert (=> b!1058160 m!977797))

(declare-fun m!977799 () Bool)

(assert (=> b!1058156 m!977799))

(declare-fun m!977801 () Bool)

(assert (=> b!1058161 m!977801))

(declare-fun m!977803 () Bool)

(assert (=> b!1058157 m!977803))

(declare-fun m!977805 () Bool)

(assert (=> b!1058158 m!977805))

(declare-fun m!977807 () Bool)

(assert (=> b!1058152 m!977807))

(declare-fun m!977809 () Bool)

(assert (=> b!1058159 m!977809))

(declare-fun m!977811 () Bool)

(assert (=> b!1058159 m!977811))

(declare-fun m!977813 () Bool)

(assert (=> b!1058159 m!977813))

(declare-fun m!977815 () Bool)

(assert (=> b!1058159 m!977815))

(assert (=> b!1058162 m!977797))

(declare-fun m!977817 () Bool)

(assert (=> b!1058162 m!977817))

(declare-fun m!977819 () Bool)

(assert (=> b!1058151 m!977819))

(declare-fun m!977821 () Bool)

(assert (=> start!93426 m!977821))

(declare-fun m!977823 () Bool)

(assert (=> b!1058153 m!977823))

(declare-fun m!977825 () Bool)

(assert (=> b!1058154 m!977825))

(push 1)

