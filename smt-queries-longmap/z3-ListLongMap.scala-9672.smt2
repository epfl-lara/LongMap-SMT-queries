; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114170 () Bool)

(assert start!114170)

(declare-fun b!1356217 () Bool)

(declare-fun res!901046 () Bool)

(declare-fun e!769987 () Bool)

(assert (=> b!1356217 (=> (not res!901046) (not e!769987))))

(declare-datatypes ((array!92301 0))(
  ( (array!92302 (arr!44599 (Array (_ BitVec 32) (_ BitVec 64))) (size!45151 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92301)

(declare-datatypes ((List!31718 0))(
  ( (Nil!31715) (Cons!31714 (h!32923 (_ BitVec 64)) (t!46368 List!31718)) )
))
(declare-fun arrayNoDuplicates!0 (array!92301 (_ BitVec 32) List!31718) Bool)

(assert (=> b!1356217 (= res!901046 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31715))))

(declare-fun b!1356218 () Bool)

(declare-fun res!901055 () Bool)

(assert (=> b!1356218 (=> (not res!901055) (not e!769987))))

(declare-fun acc!759 () List!31718)

(declare-fun contains!9338 (List!31718 (_ BitVec 64)) Bool)

(assert (=> b!1356218 (= res!901055 (not (contains!9338 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356219 () Bool)

(declare-fun res!901049 () Bool)

(assert (=> b!1356219 (=> (not res!901049) (not e!769987))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356219 (= res!901049 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45151 a!3742))))))

(declare-fun b!1356220 () Bool)

(declare-fun e!769990 () Bool)

(assert (=> b!1356220 (= e!769990 (not true))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1356220 (arrayNoDuplicates!0 (array!92302 (store (arr!44599 a!3742) i!1404 l!3587) (size!45151 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-datatypes ((Unit!44454 0))(
  ( (Unit!44455) )
))
(declare-fun lt!598792 () Unit!44454)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92301 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31718) Unit!44454)

(assert (=> b!1356220 (= lt!598792 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356221 () Bool)

(declare-fun res!901052 () Bool)

(assert (=> b!1356221 (=> (not res!901052) (not e!769987))))

(declare-fun noDuplicate!2253 (List!31718) Bool)

(assert (=> b!1356221 (= res!901052 (noDuplicate!2253 acc!759))))

(declare-fun b!1356222 () Bool)

(declare-fun res!901050 () Bool)

(assert (=> b!1356222 (=> (not res!901050) (not e!769987))))

(assert (=> b!1356222 (= res!901050 (not (contains!9338 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356223 () Bool)

(declare-fun res!901047 () Bool)

(assert (=> b!1356223 (=> (not res!901047) (not e!769987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356223 (= res!901047 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356224 () Bool)

(declare-fun e!769989 () Unit!44454)

(declare-fun Unit!44456 () Unit!44454)

(assert (=> b!1356224 (= e!769989 Unit!44456)))

(declare-fun b!1356225 () Bool)

(declare-fun res!901053 () Bool)

(assert (=> b!1356225 (=> (not res!901053) (not e!769990))))

(assert (=> b!1356225 (= res!901053 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(declare-fun b!1356226 () Bool)

(assert (=> b!1356226 (= e!769987 e!769990)))

(declare-fun res!901045 () Bool)

(assert (=> b!1356226 (=> (not res!901045) (not e!769990))))

(declare-fun lt!598791 () Bool)

(assert (=> b!1356226 (= res!901045 (and (not (= from!3120 i!1404)) (not lt!598791) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!598788 () Unit!44454)

(assert (=> b!1356226 (= lt!598788 e!769989)))

(declare-fun c!127028 () Bool)

(assert (=> b!1356226 (= c!127028 lt!598791)))

(assert (=> b!1356226 (= lt!598791 (validKeyInArray!0 (select (arr!44599 a!3742) from!3120)))))

(declare-fun res!901048 () Bool)

(assert (=> start!114170 (=> (not res!901048) (not e!769987))))

(assert (=> start!114170 (= res!901048 (and (bvslt (size!45151 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45151 a!3742))))))

(assert (=> start!114170 e!769987))

(assert (=> start!114170 true))

(declare-fun array_inv!33832 (array!92301) Bool)

(assert (=> start!114170 (array_inv!33832 a!3742)))

(declare-fun b!1356216 () Bool)

(declare-fun res!901054 () Bool)

(assert (=> b!1356216 (=> (not res!901054) (not e!769987))))

(assert (=> b!1356216 (= res!901054 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356227 () Bool)

(declare-fun lt!598790 () Unit!44454)

(assert (=> b!1356227 (= e!769989 lt!598790)))

(declare-fun lt!598789 () Unit!44454)

(declare-fun lemmaListSubSeqRefl!0 (List!31718) Unit!44454)

(assert (=> b!1356227 (= lt!598789 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!794 (List!31718 List!31718) Bool)

(assert (=> b!1356227 (subseq!794 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92301 List!31718 List!31718 (_ BitVec 32)) Unit!44454)

(declare-fun $colon$colon!811 (List!31718 (_ BitVec 64)) List!31718)

(assert (=> b!1356227 (= lt!598790 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!811 acc!759 (select (arr!44599 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356227 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356228 () Bool)

(declare-fun res!901051 () Bool)

(assert (=> b!1356228 (=> (not res!901051) (not e!769987))))

(assert (=> b!1356228 (= res!901051 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45151 a!3742)))))

(assert (= (and start!114170 res!901048) b!1356221))

(assert (= (and b!1356221 res!901052) b!1356218))

(assert (= (and b!1356218 res!901055) b!1356222))

(assert (= (and b!1356222 res!901050) b!1356217))

(assert (= (and b!1356217 res!901046) b!1356216))

(assert (= (and b!1356216 res!901054) b!1356219))

(assert (= (and b!1356219 res!901049) b!1356223))

(assert (= (and b!1356223 res!901047) b!1356228))

(assert (= (and b!1356228 res!901051) b!1356226))

(assert (= (and b!1356226 c!127028) b!1356227))

(assert (= (and b!1356226 (not c!127028)) b!1356224))

(assert (= (and b!1356226 res!901045) b!1356225))

(assert (= (and b!1356225 res!901053) b!1356220))

(declare-fun m!1241785 () Bool)

(assert (=> b!1356227 m!1241785))

(declare-fun m!1241787 () Bool)

(assert (=> b!1356227 m!1241787))

(declare-fun m!1241789 () Bool)

(assert (=> b!1356227 m!1241789))

(declare-fun m!1241791 () Bool)

(assert (=> b!1356227 m!1241791))

(declare-fun m!1241793 () Bool)

(assert (=> b!1356227 m!1241793))

(assert (=> b!1356227 m!1241787))

(assert (=> b!1356227 m!1241789))

(declare-fun m!1241795 () Bool)

(assert (=> b!1356227 m!1241795))

(declare-fun m!1241797 () Bool)

(assert (=> b!1356216 m!1241797))

(declare-fun m!1241799 () Bool)

(assert (=> start!114170 m!1241799))

(declare-fun m!1241801 () Bool)

(assert (=> b!1356221 m!1241801))

(assert (=> b!1356226 m!1241787))

(assert (=> b!1356226 m!1241787))

(declare-fun m!1241803 () Bool)

(assert (=> b!1356226 m!1241803))

(declare-fun m!1241805 () Bool)

(assert (=> b!1356218 m!1241805))

(declare-fun m!1241807 () Bool)

(assert (=> b!1356223 m!1241807))

(assert (=> b!1356225 m!1241793))

(declare-fun m!1241809 () Bool)

(assert (=> b!1356217 m!1241809))

(declare-fun m!1241811 () Bool)

(assert (=> b!1356220 m!1241811))

(declare-fun m!1241813 () Bool)

(assert (=> b!1356220 m!1241813))

(declare-fun m!1241815 () Bool)

(assert (=> b!1356220 m!1241815))

(declare-fun m!1241817 () Bool)

(assert (=> b!1356222 m!1241817))

(check-sat (not start!114170) (not b!1356216) (not b!1356222) (not b!1356220) (not b!1356223) (not b!1356217) (not b!1356221) (not b!1356225) (not b!1356227) (not b!1356218) (not b!1356226))
(check-sat)
