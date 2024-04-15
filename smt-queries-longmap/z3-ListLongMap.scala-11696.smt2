; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136750 () Bool)

(assert start!136750)

(declare-fun res!1078494 () Bool)

(declare-fun e!880355 () Bool)

(assert (=> start!136750 (=> (not res!1078494) (not e!880355))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105713 0))(
  ( (array!105714 (arr!50966 (Array (_ BitVec 32) (_ BitVec 64))) (size!51518 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105713)

(assert (=> start!136750 (= res!1078494 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51518 a!3559)) (bvslt (size!51518 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136750 e!880355))

(assert (=> start!136750 true))

(declare-fun array_inv!39902 (array!105713) Bool)

(assert (=> start!136750 (array_inv!39902 a!3559)))

(declare-fun b!1578369 () Bool)

(declare-fun res!1078493 () Bool)

(assert (=> b!1578369 (=> (not res!1078493) (not e!880355))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578369 (= res!1078493 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1578370 () Bool)

(declare-fun res!1078492 () Bool)

(assert (=> b!1578370 (=> (not res!1078492) (not e!880355))))

(assert (=> b!1578370 (= res!1078492 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51518 a!3559))))))

(declare-fun b!1578371 () Bool)

(assert (=> b!1578371 (= e!880355 (not (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001))))))

(assert (= (and start!136750 res!1078494) b!1578369))

(assert (= (and b!1578369 res!1078493) b!1578370))

(assert (= (and b!1578370 res!1078492) b!1578371))

(declare-fun m!1449855 () Bool)

(assert (=> start!136750 m!1449855))

(declare-fun m!1449857 () Bool)

(assert (=> b!1578369 m!1449857))

(declare-fun m!1449859 () Bool)

(assert (=> b!1578371 m!1449859))

(check-sat (not start!136750) (not b!1578371) (not b!1578369))
(check-sat)
(get-model)

(declare-fun d!165883 () Bool)

(assert (=> d!165883 (= (array_inv!39902 a!3559) (bvsge (size!51518 a!3559) #b00000000000000000000000000000000))))

(assert (=> start!136750 d!165883))

(declare-fun d!165885 () Bool)

(declare-fun res!1078517 () Bool)

(declare-fun e!880372 () Bool)

(assert (=> d!165885 (=> res!1078517 e!880372)))

(assert (=> d!165885 (= res!1078517 (= (select (arr!50966 a!3559) (bvsub from!2937 #b00000000000000000000000000000001)) k0!2792))))

(assert (=> d!165885 (= (arrayContainsKey!0 a!3559 k0!2792 (bvsub from!2937 #b00000000000000000000000000000001)) e!880372)))

(declare-fun b!1578394 () Bool)

(declare-fun e!880373 () Bool)

(assert (=> b!1578394 (= e!880372 e!880373)))

(declare-fun res!1078518 () Bool)

(assert (=> b!1578394 (=> (not res!1078518) (not e!880373))))

(assert (=> b!1578394 (= res!1078518 (bvslt (bvadd (bvsub from!2937 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (size!51518 a!3559)))))

(declare-fun b!1578395 () Bool)

(assert (=> b!1578395 (= e!880373 (arrayContainsKey!0 a!3559 k0!2792 (bvadd (bvsub from!2937 #b00000000000000000000000000000001) #b00000000000000000000000000000001)))))

(assert (= (and d!165885 (not res!1078517)) b!1578394))

(assert (= (and b!1578394 res!1078518) b!1578395))

(declare-fun m!1449873 () Bool)

(assert (=> d!165885 m!1449873))

(declare-fun m!1449875 () Bool)

(assert (=> b!1578395 m!1449875))

(assert (=> b!1578371 d!165885))

(declare-fun d!165887 () Bool)

(declare-fun res!1078519 () Bool)

(declare-fun e!880374 () Bool)

(assert (=> d!165887 (=> res!1078519 e!880374)))

(assert (=> d!165887 (= res!1078519 (= (select (arr!50966 a!3559) from!2937) k0!2792))))

(assert (=> d!165887 (= (arrayContainsKey!0 a!3559 k0!2792 from!2937) e!880374)))

(declare-fun b!1578396 () Bool)

(declare-fun e!880375 () Bool)

(assert (=> b!1578396 (= e!880374 e!880375)))

(declare-fun res!1078520 () Bool)

(assert (=> b!1578396 (=> (not res!1078520) (not e!880375))))

(assert (=> b!1578396 (= res!1078520 (bvslt (bvadd from!2937 #b00000000000000000000000000000001) (size!51518 a!3559)))))

(declare-fun b!1578397 () Bool)

(assert (=> b!1578397 (= e!880375 (arrayContainsKey!0 a!3559 k0!2792 (bvadd from!2937 #b00000000000000000000000000000001)))))

(assert (= (and d!165887 (not res!1078519)) b!1578396))

(assert (= (and b!1578396 res!1078520) b!1578397))

(declare-fun m!1449877 () Bool)

(assert (=> d!165887 m!1449877))

(declare-fun m!1449879 () Bool)

(assert (=> b!1578397 m!1449879))

(assert (=> b!1578369 d!165887))

(check-sat (not b!1578395) (not b!1578397))
(check-sat)
