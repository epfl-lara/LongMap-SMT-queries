; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3768 () Bool)

(assert start!3768)

(declare-fun b!26306 () Bool)

(declare-fun e!17110 () Bool)

(declare-fun tp_is_empty!1089 () Bool)

(assert (=> b!26306 (= e!17110 tp_is_empty!1089)))

(declare-fun b!26307 () Bool)

(declare-fun res!15630 () Bool)

(declare-fun e!17111 () Bool)

(assert (=> b!26307 (=> (not res!15630) (not e!17111))))

(declare-datatypes ((array!1423 0))(
  ( (array!1424 (arr!669 (Array (_ BitVec 32) (_ BitVec 64))) (size!770 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1423)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1423 (_ BitVec 32)) Bool)

(assert (=> b!26307 (= res!15630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1150 () Bool)

(declare-fun mapRes!1150 () Bool)

(declare-fun tp!3670 () Bool)

(declare-fun e!17114 () Bool)

(assert (=> mapNonEmpty!1150 (= mapRes!1150 (and tp!3670 e!17114))))

(declare-datatypes ((V!1277 0))(
  ( (V!1278 (val!571 Int)) )
))
(declare-datatypes ((ValueCell!345 0))(
  ( (ValueCellFull!345 (v!1657 V!1277)) (EmptyCell!345) )
))
(declare-datatypes ((array!1425 0))(
  ( (array!1426 (arr!670 (Array (_ BitVec 32) ValueCell!345)) (size!771 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1425)

(declare-fun mapKey!1150 () (_ BitVec 32))

(declare-fun mapValue!1150 () ValueCell!345)

(declare-fun mapRest!1150 () (Array (_ BitVec 32) ValueCell!345))

(assert (=> mapNonEmpty!1150 (= (arr!670 _values!1501) (store mapRest!1150 mapKey!1150 mapValue!1150))))

(declare-fun mapIsEmpty!1150 () Bool)

(assert (=> mapIsEmpty!1150 mapRes!1150))

(declare-fun b!26308 () Bool)

(assert (=> b!26308 (= e!17111 false)))

(declare-fun lt!10343 () Bool)

(declare-datatypes ((List!586 0))(
  ( (Nil!583) (Cons!582 (h!1149 (_ BitVec 64)) (t!3273 List!586)) )
))
(declare-fun arrayNoDuplicates!0 (array!1423 (_ BitVec 32) List!586) Bool)

(assert (=> b!26308 (= lt!10343 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!583))))

(declare-fun res!15628 () Bool)

(assert (=> start!3768 (=> (not res!15628) (not e!17111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3768 (= res!15628 (validMask!0 mask!2294))))

(assert (=> start!3768 e!17111))

(assert (=> start!3768 true))

(declare-fun e!17112 () Bool)

(declare-fun array_inv!455 (array!1425) Bool)

(assert (=> start!3768 (and (array_inv!455 _values!1501) e!17112)))

(declare-fun array_inv!456 (array!1423) Bool)

(assert (=> start!3768 (array_inv!456 _keys!1833)))

(declare-fun b!26309 () Bool)

(assert (=> b!26309 (= e!17114 tp_is_empty!1089)))

(declare-fun b!26310 () Bool)

(assert (=> b!26310 (= e!17112 (and e!17110 mapRes!1150))))

(declare-fun condMapEmpty!1150 () Bool)

(declare-fun mapDefault!1150 () ValueCell!345)

(assert (=> b!26310 (= condMapEmpty!1150 (= (arr!670 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!345)) mapDefault!1150)))))

(declare-fun b!26311 () Bool)

(declare-fun res!15629 () Bool)

(assert (=> b!26311 (=> (not res!15629) (not e!17111))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26311 (= res!15629 (and (= (size!771 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!770 _keys!1833) (size!771 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!3768 res!15628) b!26311))

(assert (= (and b!26311 res!15629) b!26307))

(assert (= (and b!26307 res!15630) b!26308))

(assert (= (and b!26310 condMapEmpty!1150) mapIsEmpty!1150))

(assert (= (and b!26310 (not condMapEmpty!1150)) mapNonEmpty!1150))

(get-info :version)

(assert (= (and mapNonEmpty!1150 ((_ is ValueCellFull!345) mapValue!1150)) b!26309))

(assert (= (and b!26310 ((_ is ValueCellFull!345) mapDefault!1150)) b!26306))

(assert (= start!3768 b!26310))

(declare-fun m!21125 () Bool)

(assert (=> b!26307 m!21125))

(declare-fun m!21127 () Bool)

(assert (=> mapNonEmpty!1150 m!21127))

(declare-fun m!21129 () Bool)

(assert (=> b!26308 m!21129))

(declare-fun m!21131 () Bool)

(assert (=> start!3768 m!21131))

(declare-fun m!21133 () Bool)

(assert (=> start!3768 m!21133))

(declare-fun m!21135 () Bool)

(assert (=> start!3768 m!21135))

(check-sat (not start!3768) (not b!26308) (not mapNonEmpty!1150) (not b!26307) tp_is_empty!1089)
(check-sat)
