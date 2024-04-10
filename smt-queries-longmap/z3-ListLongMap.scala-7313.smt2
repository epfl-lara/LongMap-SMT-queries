; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93482 () Bool)

(assert start!93482)

(declare-fun res!707296 () Bool)

(declare-fun e!602379 () Bool)

(assert (=> start!93482 (=> (not res!707296) (not e!602379))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66785 0))(
  ( (array!66786 (arr!32111 (Array (_ BitVec 32) (_ BitVec 64))) (size!32647 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66785)

(assert (=> start!93482 (= res!707296 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32647 a!3475)) (bvslt (size!32647 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93482 e!602379))

(assert (=> start!93482 true))

(declare-fun array_inv!24891 (array!66785) Bool)

(assert (=> start!93482 (array_inv!24891 a!3475)))

(declare-fun b!1058722 () Bool)

(declare-fun res!707297 () Bool)

(assert (=> b!1058722 (=> (not res!707297) (not e!602379))))

(declare-fun k0!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058722 (= res!707297 (arrayContainsKey!0 a!3475 k0!2741 from!2850))))

(declare-fun b!1058723 () Bool)

(assert (=> b!1058723 (= e!602379 (and (not (= (select (arr!32111 a!3475) from!2850) k0!2741)) (or (bvslt (bvadd #b00000000000000000000000000000001 from!2850) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!2850) (size!32647 a!3475)))))))

(assert (= (and start!93482 res!707296) b!1058722))

(assert (= (and b!1058722 res!707297) b!1058723))

(declare-fun m!978383 () Bool)

(assert (=> start!93482 m!978383))

(declare-fun m!978385 () Bool)

(assert (=> b!1058722 m!978385))

(declare-fun m!978387 () Bool)

(assert (=> b!1058723 m!978387))

(check-sat (not b!1058722) (not start!93482))
(check-sat)
(get-model)

(declare-fun d!128619 () Bool)

(declare-fun res!707308 () Bool)

(declare-fun e!602391 () Bool)

(assert (=> d!128619 (=> res!707308 e!602391)))

(assert (=> d!128619 (= res!707308 (= (select (arr!32111 a!3475) from!2850) k0!2741))))

(assert (=> d!128619 (= (arrayContainsKey!0 a!3475 k0!2741 from!2850) e!602391)))

(declare-fun b!1058734 () Bool)

(declare-fun e!602392 () Bool)

(assert (=> b!1058734 (= e!602391 e!602392)))

(declare-fun res!707309 () Bool)

(assert (=> b!1058734 (=> (not res!707309) (not e!602392))))

(assert (=> b!1058734 (= res!707309 (bvslt (bvadd from!2850 #b00000000000000000000000000000001) (size!32647 a!3475)))))

(declare-fun b!1058735 () Bool)

(assert (=> b!1058735 (= e!602392 (arrayContainsKey!0 a!3475 k0!2741 (bvadd from!2850 #b00000000000000000000000000000001)))))

(assert (= (and d!128619 (not res!707308)) b!1058734))

(assert (= (and b!1058734 res!707309) b!1058735))

(assert (=> d!128619 m!978387))

(declare-fun m!978395 () Bool)

(assert (=> b!1058735 m!978395))

(assert (=> b!1058722 d!128619))

(declare-fun d!128621 () Bool)

(assert (=> d!128621 (= (array_inv!24891 a!3475) (bvsge (size!32647 a!3475) #b00000000000000000000000000000000))))

(assert (=> start!93482 d!128621))

(check-sat (not b!1058735))
(check-sat)
