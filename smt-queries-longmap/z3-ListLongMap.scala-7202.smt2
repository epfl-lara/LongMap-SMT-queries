; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92276 () Bool)

(assert start!92276)

(declare-fun b!1048708 () Bool)

(declare-fun e!594863 () Bool)

(declare-fun e!594867 () Bool)

(assert (=> b!1048708 (= e!594863 e!594867)))

(declare-fun res!697837 () Bool)

(assert (=> b!1048708 (=> res!697837 e!594867)))

(declare-fun lt!463266 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1048708 (= res!697837 (bvsle lt!463266 i!1381))))

(declare-fun b!1048709 () Bool)

(declare-fun res!697839 () Bool)

(declare-fun e!594865 () Bool)

(assert (=> b!1048709 (=> (not res!697839) (not e!594865))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048709 (= res!697839 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048710 () Bool)

(declare-fun res!697840 () Bool)

(assert (=> b!1048710 (=> (not res!697840) (not e!594865))))

(declare-datatypes ((array!66077 0))(
  ( (array!66078 (arr!31778 (Array (_ BitVec 32) (_ BitVec 64))) (size!32314 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66077)

(declare-datatypes ((List!22090 0))(
  ( (Nil!22087) (Cons!22086 (h!23295 (_ BitVec 64)) (t!31397 List!22090)) )
))
(declare-fun arrayNoDuplicates!0 (array!66077 (_ BitVec 32) List!22090) Bool)

(assert (=> b!1048710 (= res!697840 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22087))))

(declare-fun b!1048711 () Bool)

(declare-fun e!594866 () Bool)

(declare-fun e!594864 () Bool)

(assert (=> b!1048711 (= e!594866 e!594864)))

(declare-fun res!697835 () Bool)

(assert (=> b!1048711 (=> (not res!697835) (not e!594864))))

(assert (=> b!1048711 (= res!697835 (not (= lt!463266 i!1381)))))

(declare-fun lt!463265 () array!66077)

(declare-fun arrayScanForKey!0 (array!66077 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048711 (= lt!463266 (arrayScanForKey!0 lt!463265 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048712 () Bool)

(assert (=> b!1048712 (= e!594865 e!594866)))

(declare-fun res!697834 () Bool)

(assert (=> b!1048712 (=> (not res!697834) (not e!594866))))

(declare-fun arrayContainsKey!0 (array!66077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048712 (= res!697834 (arrayContainsKey!0 lt!463265 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048712 (= lt!463265 (array!66078 (store (arr!31778 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32314 a!3488)))))

(declare-fun res!697836 () Bool)

(assert (=> start!92276 (=> (not res!697836) (not e!594865))))

(assert (=> start!92276 (= res!697836 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32314 a!3488)) (bvslt (size!32314 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92276 e!594865))

(assert (=> start!92276 true))

(declare-fun array_inv!24558 (array!66077) Bool)

(assert (=> start!92276 (array_inv!24558 a!3488)))

(declare-fun b!1048713 () Bool)

(declare-fun res!697838 () Bool)

(assert (=> b!1048713 (=> (not res!697838) (not e!594865))))

(assert (=> b!1048713 (= res!697838 (= (select (arr!31778 a!3488) i!1381) k0!2747))))

(declare-fun b!1048714 () Bool)

(assert (=> b!1048714 (= e!594867 (arrayContainsKey!0 a!3488 k0!2747 lt!463266))))

(declare-fun b!1048715 () Bool)

(assert (=> b!1048715 (= e!594864 (not true))))

(assert (=> b!1048715 e!594863))

(declare-fun res!697841 () Bool)

(assert (=> b!1048715 (=> (not res!697841) (not e!594863))))

(assert (=> b!1048715 (= res!697841 (= (select (store (arr!31778 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463266) k0!2747))))

(assert (= (and start!92276 res!697836) b!1048710))

(assert (= (and b!1048710 res!697840) b!1048709))

(assert (= (and b!1048709 res!697839) b!1048713))

(assert (= (and b!1048713 res!697838) b!1048712))

(assert (= (and b!1048712 res!697834) b!1048711))

(assert (= (and b!1048711 res!697835) b!1048715))

(assert (= (and b!1048715 res!697841) b!1048708))

(assert (= (and b!1048708 (not res!697837)) b!1048714))

(declare-fun m!969611 () Bool)

(assert (=> b!1048709 m!969611))

(declare-fun m!969613 () Bool)

(assert (=> start!92276 m!969613))

(declare-fun m!969615 () Bool)

(assert (=> b!1048715 m!969615))

(declare-fun m!969617 () Bool)

(assert (=> b!1048715 m!969617))

(declare-fun m!969619 () Bool)

(assert (=> b!1048713 m!969619))

(declare-fun m!969621 () Bool)

(assert (=> b!1048711 m!969621))

(declare-fun m!969623 () Bool)

(assert (=> b!1048710 m!969623))

(declare-fun m!969625 () Bool)

(assert (=> b!1048712 m!969625))

(assert (=> b!1048712 m!969615))

(declare-fun m!969627 () Bool)

(assert (=> b!1048714 m!969627))

(check-sat (not b!1048714) (not b!1048712) (not b!1048709) (not start!92276) (not b!1048711) (not b!1048710))
