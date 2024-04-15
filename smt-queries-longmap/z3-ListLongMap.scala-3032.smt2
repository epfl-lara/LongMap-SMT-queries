; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42552 () Bool)

(assert start!42552)

(declare-fun b_free!12001 () Bool)

(declare-fun b_next!12001 () Bool)

(assert (=> start!42552 (= b_free!12001 (not b_next!12001))))

(declare-fun tp!42043 () Bool)

(declare-fun b_and!20455 () Bool)

(assert (=> start!42552 (= tp!42043 b_and!20455)))

(declare-fun mapIsEmpty!21862 () Bool)

(declare-fun mapRes!21862 () Bool)

(assert (=> mapIsEmpty!21862 mapRes!21862))

(declare-fun b!474628 () Bool)

(declare-fun e!278617 () Bool)

(declare-fun tp_is_empty!13429 () Bool)

(assert (=> b!474628 (= e!278617 tp_is_empty!13429)))

(declare-fun b!474629 () Bool)

(declare-fun e!278618 () Bool)

(assert (=> b!474629 (= e!278618 false)))

(declare-datatypes ((V!19011 0))(
  ( (V!19012 (val!6759 Int)) )
))
(declare-fun zeroValue!794 () V!19011)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8966 0))(
  ( (tuple2!8967 (_1!4494 (_ BitVec 64)) (_2!4494 V!19011)) )
))
(declare-datatypes ((List!9028 0))(
  ( (Nil!9025) (Cons!9024 (h!9880 tuple2!8966) (t!14993 List!9028)) )
))
(declare-datatypes ((ListLongMap!7869 0))(
  ( (ListLongMap!7870 (toList!3950 List!9028)) )
))
(declare-fun lt!216088 () ListLongMap!7869)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30587 0))(
  ( (array!30588 (arr!14711 (Array (_ BitVec 32) (_ BitVec 64))) (size!15064 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30587)

(declare-datatypes ((ValueCell!6371 0))(
  ( (ValueCellFull!6371 (v!9046 V!19011)) (EmptyCell!6371) )
))
(declare-datatypes ((array!30589 0))(
  ( (array!30590 (arr!14712 (Array (_ BitVec 32) ValueCell!6371)) (size!15065 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30589)

(declare-fun minValueAfter!38 () V!19011)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2117 (array!30587 array!30589 (_ BitVec 32) (_ BitVec 32) V!19011 V!19011 (_ BitVec 32) Int) ListLongMap!7869)

(assert (=> b!474629 (= lt!216088 (getCurrentListMapNoExtraKeys!2117 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19011)

(declare-fun lt!216089 () ListLongMap!7869)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474629 (= lt!216089 (getCurrentListMapNoExtraKeys!2117 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474630 () Bool)

(declare-fun res!283495 () Bool)

(assert (=> b!474630 (=> (not res!283495) (not e!278618))))

(declare-datatypes ((List!9029 0))(
  ( (Nil!9026) (Cons!9025 (h!9881 (_ BitVec 64)) (t!14994 List!9029)) )
))
(declare-fun arrayNoDuplicates!0 (array!30587 (_ BitVec 32) List!9029) Bool)

(assert (=> b!474630 (= res!283495 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!9026))))

(declare-fun b!474632 () Bool)

(declare-fun e!278616 () Bool)

(assert (=> b!474632 (= e!278616 (and e!278617 mapRes!21862))))

(declare-fun condMapEmpty!21862 () Bool)

(declare-fun mapDefault!21862 () ValueCell!6371)

(assert (=> b!474632 (= condMapEmpty!21862 (= (arr!14712 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6371)) mapDefault!21862)))))

(declare-fun b!474633 () Bool)

(declare-fun e!278615 () Bool)

(assert (=> b!474633 (= e!278615 tp_is_empty!13429)))

(declare-fun mapNonEmpty!21862 () Bool)

(declare-fun tp!42042 () Bool)

(assert (=> mapNonEmpty!21862 (= mapRes!21862 (and tp!42042 e!278615))))

(declare-fun mapValue!21862 () ValueCell!6371)

(declare-fun mapRest!21862 () (Array (_ BitVec 32) ValueCell!6371))

(declare-fun mapKey!21862 () (_ BitVec 32))

(assert (=> mapNonEmpty!21862 (= (arr!14712 _values!833) (store mapRest!21862 mapKey!21862 mapValue!21862))))

(declare-fun b!474634 () Bool)

(declare-fun res!283497 () Bool)

(assert (=> b!474634 (=> (not res!283497) (not e!278618))))

(assert (=> b!474634 (= res!283497 (and (= (size!15065 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15064 _keys!1025) (size!15065 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474631 () Bool)

(declare-fun res!283494 () Bool)

(assert (=> b!474631 (=> (not res!283494) (not e!278618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30587 (_ BitVec 32)) Bool)

(assert (=> b!474631 (= res!283494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!283496 () Bool)

(assert (=> start!42552 (=> (not res!283496) (not e!278618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42552 (= res!283496 (validMask!0 mask!1365))))

(assert (=> start!42552 e!278618))

(assert (=> start!42552 tp_is_empty!13429))

(assert (=> start!42552 tp!42043))

(assert (=> start!42552 true))

(declare-fun array_inv!10694 (array!30587) Bool)

(assert (=> start!42552 (array_inv!10694 _keys!1025)))

(declare-fun array_inv!10695 (array!30589) Bool)

(assert (=> start!42552 (and (array_inv!10695 _values!833) e!278616)))

(assert (= (and start!42552 res!283496) b!474634))

(assert (= (and b!474634 res!283497) b!474631))

(assert (= (and b!474631 res!283494) b!474630))

(assert (= (and b!474630 res!283495) b!474629))

(assert (= (and b!474632 condMapEmpty!21862) mapIsEmpty!21862))

(assert (= (and b!474632 (not condMapEmpty!21862)) mapNonEmpty!21862))

(get-info :version)

(assert (= (and mapNonEmpty!21862 ((_ is ValueCellFull!6371) mapValue!21862)) b!474633))

(assert (= (and b!474632 ((_ is ValueCellFull!6371) mapDefault!21862)) b!474628))

(assert (= start!42552 b!474632))

(declare-fun m!456473 () Bool)

(assert (=> start!42552 m!456473))

(declare-fun m!456475 () Bool)

(assert (=> start!42552 m!456475))

(declare-fun m!456477 () Bool)

(assert (=> start!42552 m!456477))

(declare-fun m!456479 () Bool)

(assert (=> b!474629 m!456479))

(declare-fun m!456481 () Bool)

(assert (=> b!474629 m!456481))

(declare-fun m!456483 () Bool)

(assert (=> b!474631 m!456483))

(declare-fun m!456485 () Bool)

(assert (=> b!474630 m!456485))

(declare-fun m!456487 () Bool)

(assert (=> mapNonEmpty!21862 m!456487))

(check-sat (not mapNonEmpty!21862) (not b!474630) tp_is_empty!13429 (not start!42552) (not b_next!12001) (not b!474629) b_and!20455 (not b!474631))
(check-sat b_and!20455 (not b_next!12001))
