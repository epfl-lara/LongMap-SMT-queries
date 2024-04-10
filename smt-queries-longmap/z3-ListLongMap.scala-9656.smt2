; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114076 () Bool)

(assert start!114076)

(declare-fun b!1354378 () Bool)

(declare-fun res!899448 () Bool)

(declare-fun e!769417 () Bool)

(assert (=> b!1354378 (=> (not res!899448) (not e!769417))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92258 0))(
  ( (array!92259 (arr!44577 (Array (_ BitVec 32) (_ BitVec 64))) (size!45127 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92258)

(assert (=> b!1354378 (= res!899448 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45127 a!3742))))))

(declare-fun b!1354379 () Bool)

(declare-datatypes ((Unit!44472 0))(
  ( (Unit!44473) )
))
(declare-fun e!769416 () Unit!44472)

(declare-fun lt!598230 () Unit!44472)

(assert (=> b!1354379 (= e!769416 lt!598230)))

(declare-fun lt!598234 () Unit!44472)

(declare-datatypes ((List!31618 0))(
  ( (Nil!31615) (Cons!31614 (h!32823 (_ BitVec 64)) (t!46276 List!31618)) )
))
(declare-fun acc!759 () List!31618)

(declare-fun lemmaListSubSeqRefl!0 (List!31618) Unit!44472)

(assert (=> b!1354379 (= lt!598234 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!747 (List!31618 List!31618) Bool)

(assert (=> b!1354379 (subseq!747 acc!759 acc!759)))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92258 List!31618 List!31618 (_ BitVec 32)) Unit!44472)

(declare-fun $colon$colon!762 (List!31618 (_ BitVec 64)) List!31618)

(assert (=> b!1354379 (= lt!598230 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!762 acc!759 (select (arr!44577 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92258 (_ BitVec 32) List!31618) Bool)

(assert (=> b!1354379 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354380 () Bool)

(declare-fun res!899450 () Bool)

(assert (=> b!1354380 (=> (not res!899450) (not e!769417))))

(assert (=> b!1354380 (= res!899450 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31615))))

(declare-fun b!1354381 () Bool)

(declare-fun Unit!44474 () Unit!44472)

(assert (=> b!1354381 (= e!769416 Unit!44474)))

(declare-fun b!1354382 () Bool)

(declare-fun res!899458 () Bool)

(assert (=> b!1354382 (=> (not res!899458) (not e!769417))))

(assert (=> b!1354382 (= res!899458 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45127 a!3742)))))

(declare-fun b!1354383 () Bool)

(declare-fun e!769419 () Bool)

(assert (=> b!1354383 (= e!769417 e!769419)))

(declare-fun res!899457 () Bool)

(assert (=> b!1354383 (=> (not res!899457) (not e!769419))))

(declare-fun lt!598233 () Bool)

(assert (=> b!1354383 (= res!899457 (and (not (= from!3120 i!1404)) lt!598233))))

(declare-fun lt!598231 () Unit!44472)

(assert (=> b!1354383 (= lt!598231 e!769416)))

(declare-fun c!126905 () Bool)

(assert (=> b!1354383 (= c!126905 lt!598233)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354383 (= lt!598233 (validKeyInArray!0 (select (arr!44577 a!3742) from!3120)))))

(declare-fun b!1354384 () Bool)

(declare-fun res!899452 () Bool)

(assert (=> b!1354384 (=> (not res!899452) (not e!769417))))

(declare-fun noDuplicate!2184 (List!31618) Bool)

(assert (=> b!1354384 (= res!899452 (noDuplicate!2184 acc!759))))

(declare-fun b!1354385 () Bool)

(declare-fun res!899461 () Bool)

(declare-fun e!769418 () Bool)

(assert (=> b!1354385 (=> (not res!899461) (not e!769418))))

(declare-fun lt!598229 () List!31618)

(declare-fun contains!9327 (List!31618 (_ BitVec 64)) Bool)

(assert (=> b!1354385 (= res!899461 (not (contains!9327 lt!598229 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354386 () Bool)

(declare-fun res!899453 () Bool)

(assert (=> b!1354386 (=> (not res!899453) (not e!769417))))

(assert (=> b!1354386 (= res!899453 (not (contains!9327 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354387 () Bool)

(declare-fun res!899459 () Bool)

(assert (=> b!1354387 (=> (not res!899459) (not e!769417))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354387 (= res!899459 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354388 () Bool)

(declare-fun res!899460 () Bool)

(assert (=> b!1354388 (=> (not res!899460) (not e!769418))))

(assert (=> b!1354388 (= res!899460 (not (contains!9327 lt!598229 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354389 () Bool)

(declare-fun res!899455 () Bool)

(assert (=> b!1354389 (=> (not res!899455) (not e!769417))))

(assert (=> b!1354389 (= res!899455 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354390 () Bool)

(assert (=> b!1354390 (= e!769419 e!769418)))

(declare-fun res!899454 () Bool)

(assert (=> b!1354390 (=> (not res!899454) (not e!769418))))

(assert (=> b!1354390 (= res!899454 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1354390 (= lt!598229 ($colon$colon!762 acc!759 (select (arr!44577 a!3742) from!3120)))))

(declare-fun res!899451 () Bool)

(assert (=> start!114076 (=> (not res!899451) (not e!769417))))

(assert (=> start!114076 (= res!899451 (and (bvslt (size!45127 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45127 a!3742))))))

(assert (=> start!114076 e!769417))

(assert (=> start!114076 true))

(declare-fun array_inv!33605 (array!92258) Bool)

(assert (=> start!114076 (array_inv!33605 a!3742)))

(declare-fun b!1354391 () Bool)

(declare-fun res!899456 () Bool)

(assert (=> b!1354391 (=> (not res!899456) (not e!769417))))

(assert (=> b!1354391 (= res!899456 (not (contains!9327 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354392 () Bool)

(assert (=> b!1354392 (= e!769418 false)))

(declare-fun lt!598232 () Bool)

(assert (=> b!1354392 (= lt!598232 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598229))))

(declare-fun b!1354393 () Bool)

(declare-fun res!899449 () Bool)

(assert (=> b!1354393 (=> (not res!899449) (not e!769418))))

(assert (=> b!1354393 (= res!899449 (noDuplicate!2184 lt!598229))))

(assert (= (and start!114076 res!899451) b!1354384))

(assert (= (and b!1354384 res!899452) b!1354391))

(assert (= (and b!1354391 res!899456) b!1354386))

(assert (= (and b!1354386 res!899453) b!1354380))

(assert (= (and b!1354380 res!899450) b!1354389))

(assert (= (and b!1354389 res!899455) b!1354378))

(assert (= (and b!1354378 res!899448) b!1354387))

(assert (= (and b!1354387 res!899459) b!1354382))

(assert (= (and b!1354382 res!899458) b!1354383))

(assert (= (and b!1354383 c!126905) b!1354379))

(assert (= (and b!1354383 (not c!126905)) b!1354381))

(assert (= (and b!1354383 res!899457) b!1354390))

(assert (= (and b!1354390 res!899454) b!1354393))

(assert (= (and b!1354393 res!899449) b!1354388))

(assert (= (and b!1354388 res!899460) b!1354385))

(assert (= (and b!1354385 res!899461) b!1354392))

(declare-fun m!1240765 () Bool)

(assert (=> start!114076 m!1240765))

(declare-fun m!1240767 () Bool)

(assert (=> b!1354392 m!1240767))

(declare-fun m!1240769 () Bool)

(assert (=> b!1354387 m!1240769))

(declare-fun m!1240771 () Bool)

(assert (=> b!1354389 m!1240771))

(declare-fun m!1240773 () Bool)

(assert (=> b!1354390 m!1240773))

(assert (=> b!1354390 m!1240773))

(declare-fun m!1240775 () Bool)

(assert (=> b!1354390 m!1240775))

(declare-fun m!1240777 () Bool)

(assert (=> b!1354384 m!1240777))

(declare-fun m!1240779 () Bool)

(assert (=> b!1354386 m!1240779))

(declare-fun m!1240781 () Bool)

(assert (=> b!1354388 m!1240781))

(assert (=> b!1354383 m!1240773))

(assert (=> b!1354383 m!1240773))

(declare-fun m!1240783 () Bool)

(assert (=> b!1354383 m!1240783))

(declare-fun m!1240785 () Bool)

(assert (=> b!1354379 m!1240785))

(assert (=> b!1354379 m!1240773))

(assert (=> b!1354379 m!1240775))

(declare-fun m!1240787 () Bool)

(assert (=> b!1354379 m!1240787))

(declare-fun m!1240789 () Bool)

(assert (=> b!1354379 m!1240789))

(assert (=> b!1354379 m!1240773))

(assert (=> b!1354379 m!1240775))

(declare-fun m!1240791 () Bool)

(assert (=> b!1354379 m!1240791))

(declare-fun m!1240793 () Bool)

(assert (=> b!1354393 m!1240793))

(declare-fun m!1240795 () Bool)

(assert (=> b!1354391 m!1240795))

(declare-fun m!1240797 () Bool)

(assert (=> b!1354385 m!1240797))

(declare-fun m!1240799 () Bool)

(assert (=> b!1354380 m!1240799))

(check-sat (not b!1354390) (not b!1354392) (not b!1354383) (not b!1354385) (not b!1354387) (not b!1354388) (not b!1354391) (not start!114076) (not b!1354386) (not b!1354389) (not b!1354393) (not b!1354384) (not b!1354380) (not b!1354379))
(check-sat)
