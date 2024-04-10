; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135492 () Bool)

(assert start!135492)

(declare-fun b!1574226 () Bool)

(declare-fun e!877912 () Bool)

(declare-datatypes ((array!105213 0))(
  ( (array!105214 (arr!50756 (Array (_ BitVec 32) (_ BitVec 64))) (size!51306 (_ BitVec 32))) )
))
(declare-fun _keys!591 () array!105213)

(declare-fun i!537 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!105213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1574226 (= e!877912 (not (arrayContainsKey!0 _keys!591 (select (arr!50756 _keys!591) i!537) i!537)))))

(declare-fun b!1574225 () Bool)

(declare-fun res!1075516 () Bool)

(assert (=> b!1574225 (=> (not res!1075516) (not e!877912))))

(assert (=> b!1574225 (= res!1075516 (bvslt (size!51306 _keys!591) #b01111111111111111111111111111111))))

(declare-fun res!1075517 () Bool)

(assert (=> start!135492 (=> (not res!1075517) (not e!877912))))

(declare-fun mask!877 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135492 (= res!1075517 (validMask!0 mask!877))))

(assert (=> start!135492 e!877912))

(assert (=> start!135492 true))

(declare-fun array_inv!39483 (array!105213) Bool)

(assert (=> start!135492 (array_inv!39483 _keys!591)))

(declare-fun b!1574224 () Bool)

(declare-fun res!1075518 () Bool)

(assert (=> b!1574224 (=> (not res!1075518) (not e!877912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574224 (= res!1075518 (validKeyInArray!0 (select (arr!50756 _keys!591) i!537)))))

(declare-fun b!1574223 () Bool)

(declare-fun res!1075515 () Bool)

(assert (=> b!1574223 (=> (not res!1075515) (not e!877912))))

(assert (=> b!1574223 (= res!1075515 (and (= (size!51306 _keys!591) (bvadd #b00000000000000000000000000000001 mask!877)) (bvsge i!537 #b00000000000000000000000000000000) (bvsle i!537 (size!51306 _keys!591)) (bvslt i!537 (size!51306 _keys!591))))))

(assert (= (and start!135492 res!1075517) b!1574223))

(assert (= (and b!1574223 res!1075515) b!1574224))

(assert (= (and b!1574224 res!1075518) b!1574225))

(assert (= (and b!1574225 res!1075516) b!1574226))

(declare-fun m!1447475 () Bool)

(assert (=> b!1574226 m!1447475))

(assert (=> b!1574226 m!1447475))

(declare-fun m!1447477 () Bool)

(assert (=> b!1574226 m!1447477))

(declare-fun m!1447479 () Bool)

(assert (=> start!135492 m!1447479))

(declare-fun m!1447481 () Bool)

(assert (=> start!135492 m!1447481))

(assert (=> b!1574224 m!1447475))

(assert (=> b!1574224 m!1447475))

(declare-fun m!1447483 () Bool)

(assert (=> b!1574224 m!1447483))

(check-sat (not b!1574226) (not start!135492) (not b!1574224))
(check-sat)
(get-model)

(declare-fun d!165163 () Bool)

(declare-fun res!1075535 () Bool)

(declare-fun e!877924 () Bool)

(assert (=> d!165163 (=> res!1075535 e!877924)))

(assert (=> d!165163 (= res!1075535 (= (select (arr!50756 _keys!591) i!537) (select (arr!50756 _keys!591) i!537)))))

(assert (=> d!165163 (= (arrayContainsKey!0 _keys!591 (select (arr!50756 _keys!591) i!537) i!537) e!877924)))

(declare-fun b!1574243 () Bool)

(declare-fun e!877925 () Bool)

(assert (=> b!1574243 (= e!877924 e!877925)))

(declare-fun res!1075536 () Bool)

(assert (=> b!1574243 (=> (not res!1075536) (not e!877925))))

(assert (=> b!1574243 (= res!1075536 (bvslt (bvadd i!537 #b00000000000000000000000000000001) (size!51306 _keys!591)))))

(declare-fun b!1574244 () Bool)

(assert (=> b!1574244 (= e!877925 (arrayContainsKey!0 _keys!591 (select (arr!50756 _keys!591) i!537) (bvadd i!537 #b00000000000000000000000000000001)))))

(assert (= (and d!165163 (not res!1075535)) b!1574243))

(assert (= (and b!1574243 res!1075536) b!1574244))

(assert (=> d!165163 m!1447475))

(assert (=> b!1574244 m!1447475))

(declare-fun m!1447495 () Bool)

(assert (=> b!1574244 m!1447495))

(assert (=> b!1574226 d!165163))

(declare-fun d!165165 () Bool)

(assert (=> d!165165 (= (validMask!0 mask!877) (and (or (= mask!877 #b00000000000000000000000000000111) (= mask!877 #b00000000000000000000000000001111) (= mask!877 #b00000000000000000000000000011111) (= mask!877 #b00000000000000000000000000111111) (= mask!877 #b00000000000000000000000001111111) (= mask!877 #b00000000000000000000000011111111) (= mask!877 #b00000000000000000000000111111111) (= mask!877 #b00000000000000000000001111111111) (= mask!877 #b00000000000000000000011111111111) (= mask!877 #b00000000000000000000111111111111) (= mask!877 #b00000000000000000001111111111111) (= mask!877 #b00000000000000000011111111111111) (= mask!877 #b00000000000000000111111111111111) (= mask!877 #b00000000000000001111111111111111) (= mask!877 #b00000000000000011111111111111111) (= mask!877 #b00000000000000111111111111111111) (= mask!877 #b00000000000001111111111111111111) (= mask!877 #b00000000000011111111111111111111) (= mask!877 #b00000000000111111111111111111111) (= mask!877 #b00000000001111111111111111111111) (= mask!877 #b00000000011111111111111111111111) (= mask!877 #b00000000111111111111111111111111) (= mask!877 #b00000001111111111111111111111111) (= mask!877 #b00000011111111111111111111111111) (= mask!877 #b00000111111111111111111111111111) (= mask!877 #b00001111111111111111111111111111) (= mask!877 #b00011111111111111111111111111111) (= mask!877 #b00111111111111111111111111111111)) (bvsle mask!877 #b00111111111111111111111111111111)))))

(assert (=> start!135492 d!165165))

(declare-fun d!165175 () Bool)

(assert (=> d!165175 (= (array_inv!39483 _keys!591) (bvsge (size!51306 _keys!591) #b00000000000000000000000000000000))))

(assert (=> start!135492 d!165175))

(declare-fun d!165177 () Bool)

(assert (=> d!165177 (= (validKeyInArray!0 (select (arr!50756 _keys!591) i!537)) (and (not (= (select (arr!50756 _keys!591) i!537) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!50756 _keys!591) i!537) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574224 d!165177))

(check-sat (not b!1574244))
(check-sat)
