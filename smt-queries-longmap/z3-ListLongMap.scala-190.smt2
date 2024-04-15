; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3750 () Bool)

(assert start!3750)

(declare-fun b!26180 () Bool)

(declare-fun e!17010 () Bool)

(declare-fun tp_is_empty!1081 () Bool)

(assert (=> b!26180 (= e!17010 tp_is_empty!1081)))

(declare-fun b!26181 () Bool)

(declare-fun res!15560 () Bool)

(declare-fun e!17007 () Bool)

(assert (=> b!26181 (=> (not res!15560) (not e!17007))))

(declare-datatypes ((array!1389 0))(
  ( (array!1390 (arr!652 (Array (_ BitVec 32) (_ BitVec 64))) (size!753 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1389)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1389 (_ BitVec 32)) Bool)

(assert (=> b!26181 (= res!15560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!15562 () Bool)

(assert (=> start!3750 (=> (not res!15562) (not e!17007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3750 (= res!15562 (validMask!0 mask!2294))))

(assert (=> start!3750 e!17007))

(assert (=> start!3750 true))

(declare-datatypes ((V!1267 0))(
  ( (V!1268 (val!567 Int)) )
))
(declare-datatypes ((ValueCell!341 0))(
  ( (ValueCellFull!341 (v!1652 V!1267)) (EmptyCell!341) )
))
(declare-datatypes ((array!1391 0))(
  ( (array!1392 (arr!653 (Array (_ BitVec 32) ValueCell!341)) (size!754 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1391)

(declare-fun e!17008 () Bool)

(declare-fun array_inv!459 (array!1391) Bool)

(assert (=> start!3750 (and (array_inv!459 _values!1501) e!17008)))

(declare-fun array_inv!460 (array!1389) Bool)

(assert (=> start!3750 (array_inv!460 _keys!1833)))

(declare-fun mapIsEmpty!1138 () Bool)

(declare-fun mapRes!1138 () Bool)

(assert (=> mapIsEmpty!1138 mapRes!1138))

(declare-fun b!26182 () Bool)

(assert (=> b!26182 (= e!17008 (and e!17010 mapRes!1138))))

(declare-fun condMapEmpty!1138 () Bool)

(declare-fun mapDefault!1138 () ValueCell!341)

(assert (=> b!26182 (= condMapEmpty!1138 (= (arr!653 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!341)) mapDefault!1138)))))

(declare-fun b!26183 () Bool)

(assert (=> b!26183 (= e!17007 false)))

(declare-fun lt!10327 () Bool)

(declare-datatypes ((List!579 0))(
  ( (Nil!576) (Cons!575 (h!1142 (_ BitVec 64)) (t!3259 List!579)) )
))
(declare-fun arrayNoDuplicates!0 (array!1389 (_ BitVec 32) List!579) Bool)

(assert (=> b!26183 (= lt!10327 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!576))))

(declare-fun b!26184 () Bool)

(declare-fun e!17011 () Bool)

(assert (=> b!26184 (= e!17011 tp_is_empty!1081)))

(declare-fun b!26185 () Bool)

(declare-fun res!15561 () Bool)

(assert (=> b!26185 (=> (not res!15561) (not e!17007))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26185 (= res!15561 (and (= (size!754 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!753 _keys!1833) (size!754 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1138 () Bool)

(declare-fun tp!3658 () Bool)

(assert (=> mapNonEmpty!1138 (= mapRes!1138 (and tp!3658 e!17011))))

(declare-fun mapKey!1138 () (_ BitVec 32))

(declare-fun mapRest!1138 () (Array (_ BitVec 32) ValueCell!341))

(declare-fun mapValue!1138 () ValueCell!341)

(assert (=> mapNonEmpty!1138 (= (arr!653 _values!1501) (store mapRest!1138 mapKey!1138 mapValue!1138))))

(assert (= (and start!3750 res!15562) b!26185))

(assert (= (and b!26185 res!15561) b!26181))

(assert (= (and b!26181 res!15560) b!26183))

(assert (= (and b!26182 condMapEmpty!1138) mapIsEmpty!1138))

(assert (= (and b!26182 (not condMapEmpty!1138)) mapNonEmpty!1138))

(get-info :version)

(assert (= (and mapNonEmpty!1138 ((_ is ValueCellFull!341) mapValue!1138)) b!26184))

(assert (= (and b!26182 ((_ is ValueCellFull!341) mapDefault!1138)) b!26180))

(assert (= start!3750 b!26182))

(declare-fun m!21007 () Bool)

(assert (=> b!26181 m!21007))

(declare-fun m!21009 () Bool)

(assert (=> start!3750 m!21009))

(declare-fun m!21011 () Bool)

(assert (=> start!3750 m!21011))

(declare-fun m!21013 () Bool)

(assert (=> start!3750 m!21013))

(declare-fun m!21015 () Bool)

(assert (=> b!26183 m!21015))

(declare-fun m!21017 () Bool)

(assert (=> mapNonEmpty!1138 m!21017))

(check-sat (not b!26183) (not mapNonEmpty!1138) (not b!26181) (not start!3750) tp_is_empty!1081)
(check-sat)
