; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92266 () Bool)

(assert start!92266)

(declare-fun b!1048461 () Bool)

(declare-fun e!594704 () Bool)

(assert (=> b!1048461 (= e!594704 (not true))))

(declare-fun e!594705 () Bool)

(assert (=> b!1048461 e!594705))

(declare-fun res!697672 () Bool)

(assert (=> b!1048461 (=> (not res!697672) (not e!594705))))

(declare-fun lt!463041 () (_ BitVec 32))

(declare-datatypes ((array!66008 0))(
  ( (array!66009 (arr!31743 (Array (_ BitVec 32) (_ BitVec 64))) (size!32281 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66008)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048461 (= res!697672 (= (select (store (arr!31743 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463041) k0!2747))))

(declare-fun b!1048462 () Bool)

(declare-fun e!594700 () Bool)

(assert (=> b!1048462 (= e!594700 e!594704)))

(declare-fun res!697673 () Bool)

(assert (=> b!1048462 (=> (not res!697673) (not e!594704))))

(assert (=> b!1048462 (= res!697673 (not (= lt!463041 i!1381)))))

(declare-fun lt!463042 () array!66008)

(declare-fun arrayScanForKey!0 (array!66008 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048462 (= lt!463041 (arrayScanForKey!0 lt!463042 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048463 () Bool)

(declare-fun res!697677 () Bool)

(declare-fun e!594703 () Bool)

(assert (=> b!1048463 (=> (not res!697677) (not e!594703))))

(declare-datatypes ((List!22114 0))(
  ( (Nil!22111) (Cons!22110 (h!23319 (_ BitVec 64)) (t!31412 List!22114)) )
))
(declare-fun arrayNoDuplicates!0 (array!66008 (_ BitVec 32) List!22114) Bool)

(assert (=> b!1048463 (= res!697677 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22111))))

(declare-fun res!697671 () Bool)

(assert (=> start!92266 (=> (not res!697671) (not e!594703))))

(assert (=> start!92266 (= res!697671 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32281 a!3488)) (bvslt (size!32281 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92266 e!594703))

(assert (=> start!92266 true))

(declare-fun array_inv!24526 (array!66008) Bool)

(assert (=> start!92266 (array_inv!24526 a!3488)))

(declare-fun b!1048464 () Bool)

(declare-fun res!697676 () Bool)

(assert (=> b!1048464 (=> (not res!697676) (not e!594703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048464 (= res!697676 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048465 () Bool)

(declare-fun e!594702 () Bool)

(declare-fun arrayContainsKey!0 (array!66008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048465 (= e!594702 (arrayContainsKey!0 a!3488 k0!2747 lt!463041))))

(declare-fun b!1048466 () Bool)

(assert (=> b!1048466 (= e!594705 e!594702)))

(declare-fun res!697678 () Bool)

(assert (=> b!1048466 (=> res!697678 e!594702)))

(assert (=> b!1048466 (= res!697678 (bvsle lt!463041 i!1381))))

(declare-fun b!1048467 () Bool)

(declare-fun res!697675 () Bool)

(assert (=> b!1048467 (=> (not res!697675) (not e!594703))))

(assert (=> b!1048467 (= res!697675 (= (select (arr!31743 a!3488) i!1381) k0!2747))))

(declare-fun b!1048468 () Bool)

(assert (=> b!1048468 (= e!594703 e!594700)))

(declare-fun res!697674 () Bool)

(assert (=> b!1048468 (=> (not res!697674) (not e!594700))))

(assert (=> b!1048468 (= res!697674 (arrayContainsKey!0 lt!463042 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048468 (= lt!463042 (array!66009 (store (arr!31743 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32281 a!3488)))))

(assert (= (and start!92266 res!697671) b!1048463))

(assert (= (and b!1048463 res!697677) b!1048464))

(assert (= (and b!1048464 res!697676) b!1048467))

(assert (= (and b!1048467 res!697675) b!1048468))

(assert (= (and b!1048468 res!697674) b!1048462))

(assert (= (and b!1048462 res!697673) b!1048461))

(assert (= (and b!1048461 res!697672) b!1048466))

(assert (= (and b!1048466 (not res!697678)) b!1048465))

(declare-fun m!968923 () Bool)

(assert (=> b!1048468 m!968923))

(declare-fun m!968925 () Bool)

(assert (=> b!1048468 m!968925))

(declare-fun m!968927 () Bool)

(assert (=> b!1048464 m!968927))

(declare-fun m!968929 () Bool)

(assert (=> start!92266 m!968929))

(declare-fun m!968931 () Bool)

(assert (=> b!1048462 m!968931))

(declare-fun m!968933 () Bool)

(assert (=> b!1048465 m!968933))

(declare-fun m!968935 () Bool)

(assert (=> b!1048467 m!968935))

(assert (=> b!1048461 m!968925))

(declare-fun m!968937 () Bool)

(assert (=> b!1048461 m!968937))

(declare-fun m!968939 () Bool)

(assert (=> b!1048463 m!968939))

(check-sat (not b!1048463) (not b!1048468) (not b!1048462) (not b!1048465) (not start!92266) (not b!1048464))
(check-sat)
