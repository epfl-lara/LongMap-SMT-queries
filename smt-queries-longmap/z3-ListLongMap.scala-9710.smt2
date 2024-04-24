; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115096 () Bool)

(assert start!115096)

(declare-fun b!1362910 () Bool)

(declare-fun e!773341 () Bool)

(declare-fun e!773340 () Bool)

(assert (=> b!1362910 (= e!773341 e!773340)))

(declare-fun res!906239 () Bool)

(assert (=> b!1362910 (=> (not res!906239) (not e!773340))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!600692 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362910 (= res!906239 (and (not (= from!3120 i!1404)) lt!600692))))

(declare-datatypes ((Unit!44813 0))(
  ( (Unit!44814) )
))
(declare-fun lt!600693 () Unit!44813)

(declare-fun e!773344 () Unit!44813)

(assert (=> b!1362910 (= lt!600693 e!773344)))

(declare-fun c!127786 () Bool)

(assert (=> b!1362910 (= c!127786 lt!600692)))

(declare-datatypes ((array!92722 0))(
  ( (array!92723 (arr!44791 (Array (_ BitVec 32) (_ BitVec 64))) (size!45342 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92722)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362910 (= lt!600692 (validKeyInArray!0 (select (arr!44791 a!3742) from!3120)))))

(declare-fun b!1362911 () Bool)

(declare-fun res!906234 () Bool)

(assert (=> b!1362911 (=> (not res!906234) (not e!773341))))

(declare-datatypes ((List!31819 0))(
  ( (Nil!31816) (Cons!31815 (h!33033 (_ BitVec 64)) (t!46496 List!31819)) )
))
(declare-fun acc!759 () List!31819)

(declare-fun contains!9531 (List!31819 (_ BitVec 64)) Bool)

(assert (=> b!1362911 (= res!906234 (not (contains!9531 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362912 () Bool)

(declare-fun res!906242 () Bool)

(assert (=> b!1362912 (=> (not res!906242) (not e!773341))))

(assert (=> b!1362912 (= res!906242 (not (contains!9531 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362913 () Bool)

(declare-fun res!906235 () Bool)

(assert (=> b!1362913 (=> (not res!906235) (not e!773341))))

(assert (=> b!1362913 (= res!906235 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45342 a!3742))))))

(declare-fun b!1362914 () Bool)

(declare-fun res!906240 () Bool)

(assert (=> b!1362914 (=> (not res!906240) (not e!773341))))

(declare-fun arrayNoDuplicates!0 (array!92722 (_ BitVec 32) List!31819) Bool)

(assert (=> b!1362914 (= res!906240 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!906236 () Bool)

(assert (=> start!115096 (=> (not res!906236) (not e!773341))))

(assert (=> start!115096 (= res!906236 (and (bvslt (size!45342 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45342 a!3742))))))

(assert (=> start!115096 e!773341))

(assert (=> start!115096 true))

(declare-fun array_inv!34072 (array!92722) Bool)

(assert (=> start!115096 (array_inv!34072 a!3742)))

(declare-fun b!1362915 () Bool)

(declare-fun res!906245 () Bool)

(declare-fun e!773343 () Bool)

(assert (=> b!1362915 (=> (not res!906245) (not e!773343))))

(declare-fun lt!600691 () List!31819)

(assert (=> b!1362915 (= res!906245 (not (contains!9531 lt!600691 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362916 () Bool)

(declare-fun res!906246 () Bool)

(assert (=> b!1362916 (=> (not res!906246) (not e!773341))))

(assert (=> b!1362916 (= res!906246 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45342 a!3742)))))

(declare-fun b!1362917 () Bool)

(declare-fun res!906243 () Bool)

(assert (=> b!1362917 (=> (not res!906243) (not e!773341))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1362917 (= res!906243 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362918 () Bool)

(declare-fun res!906244 () Bool)

(assert (=> b!1362918 (=> (not res!906244) (not e!773341))))

(declare-fun noDuplicate!2362 (List!31819) Bool)

(assert (=> b!1362918 (= res!906244 (noDuplicate!2362 acc!759))))

(declare-fun b!1362919 () Bool)

(declare-fun Unit!44815 () Unit!44813)

(assert (=> b!1362919 (= e!773344 Unit!44815)))

(declare-fun b!1362920 () Bool)

(declare-fun res!906237 () Bool)

(assert (=> b!1362920 (=> (not res!906237) (not e!773343))))

(assert (=> b!1362920 (= res!906237 (not (contains!9531 lt!600691 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362921 () Bool)

(declare-fun lt!600689 () Unit!44813)

(assert (=> b!1362921 (= e!773344 lt!600689)))

(declare-fun lt!600690 () Unit!44813)

(declare-fun lemmaListSubSeqRefl!0 (List!31819) Unit!44813)

(assert (=> b!1362921 (= lt!600690 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!890 (List!31819 List!31819) Bool)

(assert (=> b!1362921 (subseq!890 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92722 List!31819 List!31819 (_ BitVec 32)) Unit!44813)

(declare-fun $colon$colon!892 (List!31819 (_ BitVec 64)) List!31819)

(assert (=> b!1362921 (= lt!600689 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!892 acc!759 (select (arr!44791 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362921 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362922 () Bool)

(declare-fun res!906233 () Bool)

(assert (=> b!1362922 (=> (not res!906233) (not e!773343))))

(assert (=> b!1362922 (= res!906233 (noDuplicate!2362 lt!600691))))

(declare-fun b!1362923 () Bool)

(declare-fun res!906238 () Bool)

(assert (=> b!1362923 (=> (not res!906238) (not e!773341))))

(assert (=> b!1362923 (= res!906238 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31816))))

(declare-fun b!1362924 () Bool)

(assert (=> b!1362924 (= e!773343 false)))

(declare-fun lt!600688 () Bool)

(assert (=> b!1362924 (= lt!600688 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!600691))))

(declare-fun b!1362925 () Bool)

(assert (=> b!1362925 (= e!773340 e!773343)))

(declare-fun res!906241 () Bool)

(assert (=> b!1362925 (=> (not res!906241) (not e!773343))))

(assert (=> b!1362925 (= res!906241 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1362925 (= lt!600691 ($colon$colon!892 acc!759 (select (arr!44791 a!3742) from!3120)))))

(assert (= (and start!115096 res!906236) b!1362918))

(assert (= (and b!1362918 res!906244) b!1362911))

(assert (= (and b!1362911 res!906234) b!1362912))

(assert (= (and b!1362912 res!906242) b!1362923))

(assert (= (and b!1362923 res!906238) b!1362914))

(assert (= (and b!1362914 res!906240) b!1362913))

(assert (= (and b!1362913 res!906235) b!1362917))

(assert (= (and b!1362917 res!906243) b!1362916))

(assert (= (and b!1362916 res!906246) b!1362910))

(assert (= (and b!1362910 c!127786) b!1362921))

(assert (= (and b!1362910 (not c!127786)) b!1362919))

(assert (= (and b!1362910 res!906239) b!1362925))

(assert (= (and b!1362925 res!906241) b!1362922))

(assert (= (and b!1362922 res!906233) b!1362920))

(assert (= (and b!1362920 res!906237) b!1362915))

(assert (= (and b!1362915 res!906245) b!1362924))

(declare-fun m!1248301 () Bool)

(assert (=> b!1362922 m!1248301))

(declare-fun m!1248303 () Bool)

(assert (=> b!1362920 m!1248303))

(declare-fun m!1248305 () Bool)

(assert (=> b!1362917 m!1248305))

(declare-fun m!1248307 () Bool)

(assert (=> b!1362914 m!1248307))

(declare-fun m!1248309 () Bool)

(assert (=> b!1362921 m!1248309))

(declare-fun m!1248311 () Bool)

(assert (=> b!1362921 m!1248311))

(declare-fun m!1248313 () Bool)

(assert (=> b!1362921 m!1248313))

(declare-fun m!1248315 () Bool)

(assert (=> b!1362921 m!1248315))

(declare-fun m!1248317 () Bool)

(assert (=> b!1362921 m!1248317))

(assert (=> b!1362921 m!1248311))

(assert (=> b!1362921 m!1248313))

(declare-fun m!1248319 () Bool)

(assert (=> b!1362921 m!1248319))

(declare-fun m!1248321 () Bool)

(assert (=> b!1362923 m!1248321))

(declare-fun m!1248323 () Bool)

(assert (=> b!1362912 m!1248323))

(declare-fun m!1248325 () Bool)

(assert (=> b!1362918 m!1248325))

(declare-fun m!1248327 () Bool)

(assert (=> b!1362924 m!1248327))

(declare-fun m!1248329 () Bool)

(assert (=> b!1362911 m!1248329))

(declare-fun m!1248331 () Bool)

(assert (=> start!115096 m!1248331))

(assert (=> b!1362910 m!1248311))

(assert (=> b!1362910 m!1248311))

(declare-fun m!1248333 () Bool)

(assert (=> b!1362910 m!1248333))

(declare-fun m!1248335 () Bool)

(assert (=> b!1362915 m!1248335))

(assert (=> b!1362925 m!1248311))

(assert (=> b!1362925 m!1248311))

(assert (=> b!1362925 m!1248313))

(check-sat (not b!1362911) (not start!115096) (not b!1362917) (not b!1362922) (not b!1362925) (not b!1362914) (not b!1362918) (not b!1362912) (not b!1362915) (not b!1362923) (not b!1362920) (not b!1362910) (not b!1362921) (not b!1362924))
(check-sat)
