; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41510 () Bool)

(assert start!41510)

(declare-fun b_free!11191 () Bool)

(declare-fun b_next!11191 () Bool)

(assert (=> start!41510 (= b_free!11191 (not b_next!11191))))

(declare-fun tp!39570 () Bool)

(declare-fun b_and!19505 () Bool)

(assert (=> start!41510 (= tp!39570 b_and!19505)))

(declare-fun b!463581 () Bool)

(declare-fun e!270706 () Bool)

(declare-fun tp_is_empty!12619 () Bool)

(assert (=> b!463581 (= e!270706 tp_is_empty!12619)))

(declare-fun mapNonEmpty!20605 () Bool)

(declare-fun mapRes!20605 () Bool)

(declare-fun tp!39571 () Bool)

(assert (=> mapNonEmpty!20605 (= mapRes!20605 (and tp!39571 e!270706))))

(declare-datatypes ((V!17931 0))(
  ( (V!17932 (val!6354 Int)) )
))
(declare-datatypes ((ValueCell!5966 0))(
  ( (ValueCellFull!5966 (v!8635 V!17931)) (EmptyCell!5966) )
))
(declare-fun mapRest!20605 () (Array (_ BitVec 32) ValueCell!5966))

(declare-fun mapValue!20605 () ValueCell!5966)

(declare-datatypes ((array!29029 0))(
  ( (array!29030 (arr!13946 (Array (_ BitVec 32) ValueCell!5966)) (size!14299 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29029)

(declare-fun mapKey!20605 () (_ BitVec 32))

(assert (=> mapNonEmpty!20605 (= (arr!13946 _values!833) (store mapRest!20605 mapKey!20605 mapValue!20605))))

(declare-fun b!463582 () Bool)

(declare-fun e!270708 () Bool)

(declare-fun e!270707 () Bool)

(assert (=> b!463582 (= e!270708 (and e!270707 mapRes!20605))))

(declare-fun condMapEmpty!20605 () Bool)

(declare-fun mapDefault!20605 () ValueCell!5966)

(assert (=> b!463582 (= condMapEmpty!20605 (= (arr!13946 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5966)) mapDefault!20605)))))

(declare-fun b!463583 () Bool)

(assert (=> b!463583 (= e!270707 tp_is_empty!12619)))

(declare-fun b!463584 () Bool)

(declare-fun res!277210 () Bool)

(declare-fun e!270704 () Bool)

(assert (=> b!463584 (=> (not res!277210) (not e!270704))))

(declare-datatypes ((array!29031 0))(
  ( (array!29032 (arr!13947 (Array (_ BitVec 32) (_ BitVec 64))) (size!14300 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29031)

(declare-datatypes ((List!8441 0))(
  ( (Nil!8438) (Cons!8437 (h!9293 (_ BitVec 64)) (t!14378 List!8441)) )
))
(declare-fun arrayNoDuplicates!0 (array!29031 (_ BitVec 32) List!8441) Bool)

(assert (=> b!463584 (= res!277210 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8438))))

(declare-fun b!463585 () Bool)

(declare-fun res!277211 () Bool)

(assert (=> b!463585 (=> (not res!277211) (not e!270704))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463585 (= res!277211 (and (= (size!14299 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14300 _keys!1025) (size!14299 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463586 () Bool)

(assert (=> b!463586 (= e!270704 false)))

(declare-datatypes ((tuple2!8354 0))(
  ( (tuple2!8355 (_1!4188 (_ BitVec 64)) (_2!4188 V!17931)) )
))
(declare-datatypes ((List!8442 0))(
  ( (Nil!8439) (Cons!8438 (h!9294 tuple2!8354) (t!14379 List!8442)) )
))
(declare-datatypes ((ListLongMap!7257 0))(
  ( (ListLongMap!7258 (toList!3644 List!8442)) )
))
(declare-fun lt!209264 () ListLongMap!7257)

(declare-fun zeroValue!794 () V!17931)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17931)

(declare-fun getCurrentListMapNoExtraKeys!1836 (array!29031 array!29029 (_ BitVec 32) (_ BitVec 32) V!17931 V!17931 (_ BitVec 32) Int) ListLongMap!7257)

(assert (=> b!463586 (= lt!209264 (getCurrentListMapNoExtraKeys!1836 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17931)

(declare-fun lt!209263 () ListLongMap!7257)

(assert (=> b!463586 (= lt!209263 (getCurrentListMapNoExtraKeys!1836 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463587 () Bool)

(declare-fun res!277208 () Bool)

(assert (=> b!463587 (=> (not res!277208) (not e!270704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29031 (_ BitVec 32)) Bool)

(assert (=> b!463587 (= res!277208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20605 () Bool)

(assert (=> mapIsEmpty!20605 mapRes!20605))

(declare-fun res!277209 () Bool)

(assert (=> start!41510 (=> (not res!277209) (not e!270704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41510 (= res!277209 (validMask!0 mask!1365))))

(assert (=> start!41510 e!270704))

(assert (=> start!41510 tp_is_empty!12619))

(assert (=> start!41510 tp!39570))

(assert (=> start!41510 true))

(declare-fun array_inv!10148 (array!29031) Bool)

(assert (=> start!41510 (array_inv!10148 _keys!1025)))

(declare-fun array_inv!10149 (array!29029) Bool)

(assert (=> start!41510 (and (array_inv!10149 _values!833) e!270708)))

(assert (= (and start!41510 res!277209) b!463585))

(assert (= (and b!463585 res!277211) b!463587))

(assert (= (and b!463587 res!277208) b!463584))

(assert (= (and b!463584 res!277210) b!463586))

(assert (= (and b!463582 condMapEmpty!20605) mapIsEmpty!20605))

(assert (= (and b!463582 (not condMapEmpty!20605)) mapNonEmpty!20605))

(get-info :version)

(assert (= (and mapNonEmpty!20605 ((_ is ValueCellFull!5966) mapValue!20605)) b!463581))

(assert (= (and b!463582 ((_ is ValueCellFull!5966) mapDefault!20605)) b!463583))

(assert (= start!41510 b!463582))

(declare-fun m!445611 () Bool)

(assert (=> b!463584 m!445611))

(declare-fun m!445613 () Bool)

(assert (=> mapNonEmpty!20605 m!445613))

(declare-fun m!445615 () Bool)

(assert (=> start!41510 m!445615))

(declare-fun m!445617 () Bool)

(assert (=> start!41510 m!445617))

(declare-fun m!445619 () Bool)

(assert (=> start!41510 m!445619))

(declare-fun m!445621 () Bool)

(assert (=> b!463586 m!445621))

(declare-fun m!445623 () Bool)

(assert (=> b!463586 m!445623))

(declare-fun m!445625 () Bool)

(assert (=> b!463587 m!445625))

(check-sat (not b!463587) (not b!463584) b_and!19505 (not start!41510) (not b_next!11191) (not b!463586) tp_is_empty!12619 (not mapNonEmpty!20605))
(check-sat b_and!19505 (not b_next!11191))
