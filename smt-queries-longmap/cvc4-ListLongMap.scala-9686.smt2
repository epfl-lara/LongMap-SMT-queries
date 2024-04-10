; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114354 () Bool)

(assert start!114354)

(declare-fun b!1357798 () Bool)

(declare-fun res!902514 () Bool)

(declare-fun e!770627 () Bool)

(assert (=> b!1357798 (=> (not res!902514) (not e!770627))))

(declare-datatypes ((List!31709 0))(
  ( (Nil!31706) (Cons!31705 (h!32914 (_ BitVec 64)) (t!46373 List!31709)) )
))
(declare-fun acc!759 () List!31709)

(declare-fun contains!9418 (List!31709 (_ BitVec 64)) Bool)

(assert (=> b!1357798 (= res!902514 (not (contains!9418 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357799 () Bool)

(declare-fun res!902515 () Bool)

(declare-fun e!770629 () Bool)

(assert (=> b!1357799 (=> res!902515 e!770629)))

(declare-fun lt!599225 () List!31709)

(declare-fun noDuplicate!2275 (List!31709) Bool)

(assert (=> b!1357799 (= res!902515 (not (noDuplicate!2275 lt!599225)))))

(declare-fun b!1357800 () Bool)

(assert (=> b!1357800 (= e!770629 true)))

(declare-fun lt!599226 () Bool)

(assert (=> b!1357800 (= lt!599226 (contains!9418 lt!599225 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357801 () Bool)

(declare-fun res!902507 () Bool)

(assert (=> b!1357801 (=> (not res!902507) (not e!770627))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357801 (= res!902507 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357802 () Bool)

(declare-fun res!902511 () Bool)

(assert (=> b!1357802 (=> res!902511 e!770629)))

(assert (=> b!1357802 (= res!902511 (contains!9418 lt!599225 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357803 () Bool)

(declare-fun res!902512 () Bool)

(assert (=> b!1357803 (=> (not res!902512) (not e!770627))))

(declare-datatypes ((array!92446 0))(
  ( (array!92447 (arr!44668 (Array (_ BitVec 32) (_ BitVec 64))) (size!45218 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92446)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92446 (_ BitVec 32) List!31709) Bool)

(assert (=> b!1357803 (= res!902512 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357804 () Bool)

(declare-fun res!902513 () Bool)

(assert (=> b!1357804 (=> (not res!902513) (not e!770627))))

(assert (=> b!1357804 (= res!902513 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31706))))

(declare-fun b!1357805 () Bool)

(declare-fun res!902509 () Bool)

(assert (=> b!1357805 (=> (not res!902509) (not e!770627))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357805 (= res!902509 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45218 a!3742))))))

(declare-fun b!1357806 () Bool)

(declare-fun res!902517 () Bool)

(assert (=> b!1357806 (=> (not res!902517) (not e!770627))))

(assert (=> b!1357806 (= res!902517 (noDuplicate!2275 acc!759))))

(declare-fun b!1357808 () Bool)

(declare-fun res!902510 () Bool)

(assert (=> b!1357808 (=> (not res!902510) (not e!770627))))

(assert (=> b!1357808 (= res!902510 (validKeyInArray!0 (select (arr!44668 a!3742) from!3120)))))

(declare-fun b!1357809 () Bool)

(assert (=> b!1357809 (= e!770627 (not e!770629))))

(declare-fun res!902516 () Bool)

(assert (=> b!1357809 (=> res!902516 e!770629)))

(assert (=> b!1357809 (= res!902516 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!823 (List!31709 (_ BitVec 64)) List!31709)

(assert (=> b!1357809 (= lt!599225 ($colon$colon!823 acc!759 (select (arr!44668 a!3742) from!3120)))))

(declare-fun subseq!820 (List!31709 List!31709) Bool)

(assert (=> b!1357809 (subseq!820 acc!759 acc!759)))

(declare-datatypes ((Unit!44671 0))(
  ( (Unit!44672) )
))
(declare-fun lt!599227 () Unit!44671)

(declare-fun lemmaListSubSeqRefl!0 (List!31709) Unit!44671)

(assert (=> b!1357809 (= lt!599227 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357810 () Bool)

(declare-fun res!902506 () Bool)

(assert (=> b!1357810 (=> (not res!902506) (not e!770627))))

(assert (=> b!1357810 (= res!902506 (not (contains!9418 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!902508 () Bool)

(assert (=> start!114354 (=> (not res!902508) (not e!770627))))

(assert (=> start!114354 (= res!902508 (and (bvslt (size!45218 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45218 a!3742))))))

(assert (=> start!114354 e!770627))

(assert (=> start!114354 true))

(declare-fun array_inv!33696 (array!92446) Bool)

(assert (=> start!114354 (array_inv!33696 a!3742)))

(declare-fun b!1357807 () Bool)

(declare-fun res!902518 () Bool)

(assert (=> b!1357807 (=> (not res!902518) (not e!770627))))

(assert (=> b!1357807 (= res!902518 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45218 a!3742)))))

(assert (= (and start!114354 res!902508) b!1357806))

(assert (= (and b!1357806 res!902517) b!1357810))

(assert (= (and b!1357810 res!902506) b!1357798))

(assert (= (and b!1357798 res!902514) b!1357804))

(assert (= (and b!1357804 res!902513) b!1357803))

(assert (= (and b!1357803 res!902512) b!1357805))

(assert (= (and b!1357805 res!902509) b!1357801))

(assert (= (and b!1357801 res!902507) b!1357807))

(assert (= (and b!1357807 res!902518) b!1357808))

(assert (= (and b!1357808 res!902510) b!1357809))

(assert (= (and b!1357809 (not res!902516)) b!1357799))

(assert (= (and b!1357799 (not res!902515)) b!1357802))

(assert (= (and b!1357802 (not res!902511)) b!1357800))

(declare-fun m!1243471 () Bool)

(assert (=> b!1357806 m!1243471))

(declare-fun m!1243473 () Bool)

(assert (=> b!1357798 m!1243473))

(declare-fun m!1243475 () Bool)

(assert (=> b!1357804 m!1243475))

(declare-fun m!1243477 () Bool)

(assert (=> b!1357800 m!1243477))

(declare-fun m!1243479 () Bool)

(assert (=> b!1357799 m!1243479))

(declare-fun m!1243481 () Bool)

(assert (=> b!1357801 m!1243481))

(declare-fun m!1243483 () Bool)

(assert (=> b!1357803 m!1243483))

(declare-fun m!1243485 () Bool)

(assert (=> b!1357808 m!1243485))

(assert (=> b!1357808 m!1243485))

(declare-fun m!1243487 () Bool)

(assert (=> b!1357808 m!1243487))

(declare-fun m!1243489 () Bool)

(assert (=> b!1357810 m!1243489))

(declare-fun m!1243491 () Bool)

(assert (=> b!1357802 m!1243491))

(assert (=> b!1357809 m!1243485))

(assert (=> b!1357809 m!1243485))

(declare-fun m!1243493 () Bool)

(assert (=> b!1357809 m!1243493))

(declare-fun m!1243495 () Bool)

(assert (=> b!1357809 m!1243495))

(declare-fun m!1243497 () Bool)

(assert (=> b!1357809 m!1243497))

(declare-fun m!1243499 () Bool)

(assert (=> start!114354 m!1243499))

(push 1)

(assert (not b!1357802))

(assert (not b!1357801))

(assert (not b!1357808))

(assert (not b!1357803))

(assert (not b!1357798))

(assert (not b!1357806))

(assert (not b!1357810))

(assert (not b!1357809))

(assert (not b!1357799))

(assert (not b!1357800))

(assert (not b!1357804))

(assert (not start!114354))

(check-sat)

