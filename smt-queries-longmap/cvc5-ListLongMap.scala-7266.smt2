; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!92778 () Bool)

(assert start!92778)

(declare-fun b!1053865 () Bool)

(declare-fun e!598609 () Bool)

(declare-fun e!598605 () Bool)

(assert (=> b!1053865 (= e!598609 e!598605)))

(declare-fun res!702847 () Bool)

(assert (=> b!1053865 (=> (not res!702847) (not e!598605))))

(declare-fun lt!465239 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053865 (= res!702847 (not (= lt!465239 i!1381)))))

(declare-datatypes ((array!66471 0))(
  ( (array!66472 (arr!31969 (Array (_ BitVec 32) (_ BitVec 64))) (size!32505 (_ BitVec 32))) )
))
(declare-fun lt!465240 () array!66471)

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66471 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053865 (= lt!465239 (arrayScanForKey!0 lt!465240 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053866 () Bool)

(declare-fun e!598604 () Bool)

(declare-fun e!598608 () Bool)

(assert (=> b!1053866 (= e!598604 e!598608)))

(declare-fun res!702848 () Bool)

(assert (=> b!1053866 (=> res!702848 e!598608)))

(assert (=> b!1053866 (= res!702848 (bvsle lt!465239 i!1381))))

(declare-fun b!1053867 () Bool)

(assert (=> b!1053867 (= e!598605 (not true))))

(assert (=> b!1053867 e!598604))

(declare-fun res!702854 () Bool)

(assert (=> b!1053867 (=> (not res!702854) (not e!598604))))

(declare-fun a!3488 () array!66471)

(assert (=> b!1053867 (= res!702854 (= (select (store (arr!31969 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465239) k!2747))))

(declare-fun res!702851 () Bool)

(declare-fun e!598607 () Bool)

(assert (=> start!92778 (=> (not res!702851) (not e!598607))))

(assert (=> start!92778 (= res!702851 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32505 a!3488)) (bvslt (size!32505 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92778 e!598607))

(assert (=> start!92778 true))

(declare-fun array_inv!24749 (array!66471) Bool)

(assert (=> start!92778 (array_inv!24749 a!3488)))

(declare-fun b!1053868 () Bool)

(declare-fun arrayContainsKey!0 (array!66471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053868 (= e!598608 (arrayContainsKey!0 a!3488 k!2747 lt!465239))))

(declare-fun b!1053869 () Bool)

(declare-fun res!702853 () Bool)

(assert (=> b!1053869 (=> (not res!702853) (not e!598607))))

(declare-datatypes ((List!22281 0))(
  ( (Nil!22278) (Cons!22277 (h!23486 (_ BitVec 64)) (t!31588 List!22281)) )
))
(declare-fun arrayNoDuplicates!0 (array!66471 (_ BitVec 32) List!22281) Bool)

(assert (=> b!1053869 (= res!702853 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22278))))

(declare-fun b!1053870 () Bool)

(declare-fun res!702850 () Bool)

(assert (=> b!1053870 (=> (not res!702850) (not e!598607))))

(assert (=> b!1053870 (= res!702850 (= (select (arr!31969 a!3488) i!1381) k!2747))))

(declare-fun b!1053871 () Bool)

(declare-fun res!702849 () Bool)

(assert (=> b!1053871 (=> (not res!702849) (not e!598607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053871 (= res!702849 (validKeyInArray!0 k!2747))))

(declare-fun b!1053872 () Bool)

(assert (=> b!1053872 (= e!598607 e!598609)))

(declare-fun res!702852 () Bool)

(assert (=> b!1053872 (=> (not res!702852) (not e!598609))))

(assert (=> b!1053872 (= res!702852 (arrayContainsKey!0 lt!465240 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053872 (= lt!465240 (array!66472 (store (arr!31969 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32505 a!3488)))))

(assert (= (and start!92778 res!702851) b!1053869))

(assert (= (and b!1053869 res!702853) b!1053871))

(assert (= (and b!1053871 res!702849) b!1053870))

(assert (= (and b!1053870 res!702850) b!1053872))

(assert (= (and b!1053872 res!702852) b!1053865))

(assert (= (and b!1053865 res!702847) b!1053867))

(assert (= (and b!1053867 res!702854) b!1053866))

(assert (= (and b!1053866 (not res!702848)) b!1053868))

(declare-fun m!974045 () Bool)

(assert (=> b!1053865 m!974045))

(declare-fun m!974047 () Bool)

(assert (=> b!1053870 m!974047))

(declare-fun m!974049 () Bool)

(assert (=> b!1053871 m!974049))

(declare-fun m!974051 () Bool)

(assert (=> b!1053872 m!974051))

(declare-fun m!974053 () Bool)

(assert (=> b!1053872 m!974053))

(assert (=> b!1053867 m!974053))

(declare-fun m!974055 () Bool)

(assert (=> b!1053867 m!974055))

(declare-fun m!974057 () Bool)

(assert (=> start!92778 m!974057))

(declare-fun m!974059 () Bool)

(assert (=> b!1053869 m!974059))

(declare-fun m!974061 () Bool)

(assert (=> b!1053868 m!974061))

(push 1)

