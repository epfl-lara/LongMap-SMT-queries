; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3750 () Bool)

(assert start!3750)

(declare-fun b!26108 () Bool)

(declare-fun res!15525 () Bool)

(declare-fun e!16953 () Bool)

(assert (=> b!26108 (=> (not res!15525) (not e!16953))))

(declare-datatypes ((array!1381 0))(
  ( (array!1382 (arr!648 (Array (_ BitVec 32) (_ BitVec 64))) (size!749 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1381)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1381 (_ BitVec 32)) Bool)

(assert (=> b!26108 (= res!15525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!15526 () Bool)

(assert (=> start!3750 (=> (not res!15526) (not e!16953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3750 (= res!15526 (validMask!0 mask!2294))))

(assert (=> start!3750 e!16953))

(assert (=> start!3750 true))

(declare-datatypes ((V!1259 0))(
  ( (V!1260 (val!564 Int)) )
))
(declare-datatypes ((ValueCell!338 0))(
  ( (ValueCellFull!338 (v!1650 V!1259)) (EmptyCell!338) )
))
(declare-datatypes ((array!1383 0))(
  ( (array!1384 (arr!649 (Array (_ BitVec 32) ValueCell!338)) (size!750 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1383)

(declare-fun e!16956 () Bool)

(declare-fun array_inv!455 (array!1383) Bool)

(assert (=> start!3750 (and (array_inv!455 _values!1501) e!16956)))

(declare-fun array_inv!456 (array!1381) Bool)

(assert (=> start!3750 (array_inv!456 _keys!1833)))

(declare-fun mapNonEmpty!1129 () Bool)

(declare-fun mapRes!1129 () Bool)

(declare-fun tp!3649 () Bool)

(declare-fun e!16955 () Bool)

(assert (=> mapNonEmpty!1129 (= mapRes!1129 (and tp!3649 e!16955))))

(declare-fun mapValue!1129 () ValueCell!338)

(declare-fun mapKey!1129 () (_ BitVec 32))

(declare-fun mapRest!1129 () (Array (_ BitVec 32) ValueCell!338))

(assert (=> mapNonEmpty!1129 (= (arr!649 _values!1501) (store mapRest!1129 mapKey!1129 mapValue!1129))))

(declare-fun b!26109 () Bool)

(declare-fun tp_is_empty!1075 () Bool)

(assert (=> b!26109 (= e!16955 tp_is_empty!1075)))

(declare-fun mapIsEmpty!1129 () Bool)

(assert (=> mapIsEmpty!1129 mapRes!1129))

(declare-fun b!26110 () Bool)

(assert (=> b!26110 (= e!16953 false)))

(declare-fun lt!10278 () Bool)

(declare-datatypes ((List!575 0))(
  ( (Nil!572) (Cons!571 (h!1138 (_ BitVec 64)) (t!3256 List!575)) )
))
(declare-fun arrayNoDuplicates!0 (array!1381 (_ BitVec 32) List!575) Bool)

(assert (=> b!26110 (= lt!10278 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!572))))

(declare-fun b!26111 () Bool)

(declare-fun e!16957 () Bool)

(assert (=> b!26111 (= e!16957 tp_is_empty!1075)))

(declare-fun b!26112 () Bool)

(declare-fun res!15527 () Bool)

(assert (=> b!26112 (=> (not res!15527) (not e!16953))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26112 (= res!15527 (and (= (size!750 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!749 _keys!1833) (size!750 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26113 () Bool)

(assert (=> b!26113 (= e!16956 (and e!16957 mapRes!1129))))

(declare-fun condMapEmpty!1129 () Bool)

(declare-fun mapDefault!1129 () ValueCell!338)

(assert (=> b!26113 (= condMapEmpty!1129 (= (arr!649 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!338)) mapDefault!1129)))))

(assert (= (and start!3750 res!15526) b!26112))

(assert (= (and b!26112 res!15527) b!26108))

(assert (= (and b!26108 res!15525) b!26110))

(assert (= (and b!26113 condMapEmpty!1129) mapIsEmpty!1129))

(assert (= (and b!26113 (not condMapEmpty!1129)) mapNonEmpty!1129))

(get-info :version)

(assert (= (and mapNonEmpty!1129 ((_ is ValueCellFull!338) mapValue!1129)) b!26109))

(assert (= (and b!26113 ((_ is ValueCellFull!338) mapDefault!1129)) b!26111))

(assert (= start!3750 b!26113))

(declare-fun m!20889 () Bool)

(assert (=> b!26108 m!20889))

(declare-fun m!20891 () Bool)

(assert (=> start!3750 m!20891))

(declare-fun m!20893 () Bool)

(assert (=> start!3750 m!20893))

(declare-fun m!20895 () Bool)

(assert (=> start!3750 m!20895))

(declare-fun m!20897 () Bool)

(assert (=> mapNonEmpty!1129 m!20897))

(declare-fun m!20899 () Bool)

(assert (=> b!26110 m!20899))

(check-sat (not b!26110) (not start!3750) (not b!26108) tp_is_empty!1075 (not mapNonEmpty!1129))
(check-sat)
