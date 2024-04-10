; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93532 () Bool)

(assert start!93532)

(declare-fun res!707448 () Bool)

(declare-fun e!602506 () Bool)

(assert (=> start!93532 (=> (not res!707448) (not e!602506))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66822 0))(
  ( (array!66823 (arr!32127 (Array (_ BitVec 32) (_ BitVec 64))) (size!32663 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66822)

(assert (=> start!93532 (= res!707448 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32663 a!3475)) (bvslt (size!32663 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93532 e!602506))

(assert (=> start!93532 true))

(declare-fun array_inv!24907 (array!66822) Bool)

(assert (=> start!93532 (array_inv!24907 a!3475)))

(declare-fun b!1058874 () Bool)

(declare-fun res!707450 () Bool)

(assert (=> b!1058874 (=> (not res!707450) (not e!602506))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058874 (= res!707450 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1058875 () Bool)

(declare-fun res!707449 () Bool)

(assert (=> b!1058875 (=> (not res!707449) (not e!602506))))

(assert (=> b!1058875 (= res!707449 (not (= (select (arr!32127 a!3475) from!2850) k!2741)))))

(declare-fun lt!467058 () (_ BitVec 32))

(declare-fun b!1058876 () Bool)

(assert (=> b!1058876 (= e!602506 (or (bvslt lt!467058 #b00000000000000000000000000000000) (bvsge lt!467058 (size!32663 a!3475)) (not (= (select (arr!32127 a!3475) lt!467058) k!2741))))))

(declare-fun arrayScanForKey!0 (array!66822 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058876 (= lt!467058 (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)))))

(assert (= (and start!93532 res!707448) b!1058874))

(assert (= (and b!1058874 res!707450) b!1058875))

(assert (= (and b!1058875 res!707449) b!1058876))

(declare-fun m!978509 () Bool)

(assert (=> start!93532 m!978509))

(declare-fun m!978511 () Bool)

(assert (=> b!1058874 m!978511))

(declare-fun m!978513 () Bool)

(assert (=> b!1058875 m!978513))

(declare-fun m!978515 () Bool)

(assert (=> b!1058876 m!978515))

(declare-fun m!978517 () Bool)

(assert (=> b!1058876 m!978517))

(push 1)

(assert (not start!93532))

(assert (not b!1058876))

(assert (not b!1058874))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128661 () Bool)

(assert (=> d!128661 (= (array_inv!24907 a!3475) (bvsge (size!32663 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93532 d!128661))

(declare-fun d!128663 () Bool)

(declare-fun lt!467067 () (_ BitVec 32))

(assert (=> d!128663 (and (or (bvslt lt!467067 #b00000000000000000000000000000000) (bvsge lt!467067 (size!32663 a!3475)) (and (bvsge lt!467067 #b00000000000000000000000000000000) (bvslt lt!467067 (size!32663 a!3475)))) (bvsge lt!467067 #b00000000000000000000000000000000) (bvslt lt!467067 (size!32663 a!3475)) (= (select (arr!32127 a!3475) lt!467067) k!2741))))

(declare-fun e!602521 () (_ BitVec 32))

(assert (=> d!128663 (= lt!467067 e!602521)))

(declare-fun c!107181 () Bool)

(assert (=> d!128663 (= c!107181 (= (select (arr!32127 a!3475) (bvadd #b00000000000000000000000000000001 from!2850)) k!2741))))

(assert (=> d!128663 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2850) (size!32663 a!3475)) (bvslt (size!32663 a!3475) #b01111111111111111111111111111111))))

(assert (=> d!128663 (= (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)) lt!467067)))

(declare-fun b!1058899 () Bool)

(assert (=> b!1058899 (= e!602521 (bvadd #b00000000000000000000000000000001 from!2850))))

(declare-fun b!1058900 () Bool)

(assert (=> b!1058900 (= e!602521 (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128663 c!107181) b!1058899))

(assert (= (and d!128663 (not c!107181)) b!1058900))

(declare-fun m!978533 () Bool)

(assert (=> d!128663 m!978533))

(declare-fun m!978535 () Bool)

(assert (=> d!128663 m!978535))

(declare-fun m!978537 () Bool)

(assert (=> b!1058900 m!978537))

(assert (=> b!1058876 d!128663))

(declare-fun d!128669 () Bool)

(declare-fun res!707467 () Bool)

(declare-fun e!602532 () Bool)

(assert (=> d!128669 (=> res!707467 e!602532)))

(assert (=> d!128669 (= res!707467 (= (select (arr!32127 a!3475) from!2850) k!2741))))

(assert (=> d!128669 (= (arrayContainsKey!0 a!3475 k!2741 from!2850) e!602532)))

(declare-fun b!1058911 () Bool)

(declare-fun e!602533 () Bool)

(assert (=> b!1058911 (= e!602532 e!602533)))

(declare-fun res!707468 () Bool)

(assert (=> b!1058911 (=> (not res!707468) (not e!602533))))

(assert (=> b!1058911 (= res!707468 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32663 a!3475)))))

(declare-fun b!1058912 () Bool)

(assert (=> b!1058912 (= e!602533 (arrayContainsKey!0 a!3475 k!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128669 (not res!707467)) b!1058911))

(assert (= (and b!1058911 res!707468) b!1058912))

(assert (=> d!128669 m!978513))

(declare-fun m!978541 () Bool)

(assert (=> b!1058912 m!978541))

(assert (=> b!1058874 d!128669))

(push 1)

(assert (not b!1058900))

(assert (not b!1058912))

(check-sat)

(pop 1)

