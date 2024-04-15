; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43252 () Bool)

(assert start!43252)

(declare-fun b_free!12133 () Bool)

(declare-fun b_next!12133 () Bool)

(assert (=> start!43252 (= b_free!12133 (not b_next!12133))))

(declare-fun tp!42670 () Bool)

(declare-fun b_and!20859 () Bool)

(assert (=> start!43252 (= tp!42670 b_and!20859)))

(declare-fun b!479092 () Bool)

(declare-fun res!285819 () Bool)

(declare-fun e!281837 () Bool)

(assert (=> b!479092 (=> (not res!285819) (not e!281837))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!30955 0))(
  ( (array!30956 (arr!14884 (Array (_ BitVec 32) (_ BitVec 64))) (size!15243 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30955)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19265 0))(
  ( (V!19266 (val!6870 Int)) )
))
(declare-datatypes ((ValueCell!6461 0))(
  ( (ValueCellFull!6461 (v!9153 V!19265)) (EmptyCell!6461) )
))
(declare-datatypes ((array!30957 0))(
  ( (array!30958 (arr!14885 (Array (_ BitVec 32) ValueCell!6461)) (size!15244 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30957)

(assert (=> b!479092 (= res!285819 (and (= (size!15244 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15243 _keys!1874) (size!15244 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479093 () Bool)

(assert (=> b!479093 (= e!281837 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19265)

(declare-fun zeroValue!1458 () V!19265)

(declare-fun lt!217618 () Bool)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9076 0))(
  ( (tuple2!9077 (_1!4549 (_ BitVec 64)) (_2!4549 V!19265)) )
))
(declare-datatypes ((List!9138 0))(
  ( (Nil!9135) (Cons!9134 (h!9990 tuple2!9076) (t!15335 List!9138)) )
))
(declare-datatypes ((ListLongMap!7979 0))(
  ( (ListLongMap!7980 (toList!4005 List!9138)) )
))
(declare-fun contains!2580 (ListLongMap!7979 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2258 (array!30955 array!30957 (_ BitVec 32) (_ BitVec 32) V!19265 V!19265 (_ BitVec 32) Int) ListLongMap!7979)

(assert (=> b!479093 (= lt!217618 (contains!2580 (getCurrentListMap!2258 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479094 () Bool)

(declare-fun res!285817 () Bool)

(assert (=> b!479094 (=> (not res!285817) (not e!281837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30955 (_ BitVec 32)) Bool)

(assert (=> b!479094 (= res!285817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479095 () Bool)

(declare-fun e!281840 () Bool)

(declare-fun tp_is_empty!13645 () Bool)

(assert (=> b!479095 (= e!281840 tp_is_empty!13645)))

(declare-fun b!479096 () Bool)

(declare-fun e!281838 () Bool)

(assert (=> b!479096 (= e!281838 tp_is_empty!13645)))

(declare-fun mapNonEmpty!22165 () Bool)

(declare-fun mapRes!22165 () Bool)

(declare-fun tp!42669 () Bool)

(assert (=> mapNonEmpty!22165 (= mapRes!22165 (and tp!42669 e!281840))))

(declare-fun mapValue!22165 () ValueCell!6461)

(declare-fun mapRest!22165 () (Array (_ BitVec 32) ValueCell!6461))

(declare-fun mapKey!22165 () (_ BitVec 32))

(assert (=> mapNonEmpty!22165 (= (arr!14885 _values!1516) (store mapRest!22165 mapKey!22165 mapValue!22165))))

(declare-fun b!479097 () Bool)

(declare-fun e!281839 () Bool)

(assert (=> b!479097 (= e!281839 (and e!281838 mapRes!22165))))

(declare-fun condMapEmpty!22165 () Bool)

(declare-fun mapDefault!22165 () ValueCell!6461)

(assert (=> b!479097 (= condMapEmpty!22165 (= (arr!14885 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6461)) mapDefault!22165)))))

(declare-fun b!479098 () Bool)

(declare-fun res!285816 () Bool)

(assert (=> b!479098 (=> (not res!285816) (not e!281837))))

(declare-datatypes ((List!9139 0))(
  ( (Nil!9136) (Cons!9135 (h!9991 (_ BitVec 64)) (t!15336 List!9139)) )
))
(declare-fun arrayNoDuplicates!0 (array!30955 (_ BitVec 32) List!9139) Bool)

(assert (=> b!479098 (= res!285816 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9136))))

(declare-fun mapIsEmpty!22165 () Bool)

(assert (=> mapIsEmpty!22165 mapRes!22165))

(declare-fun res!285818 () Bool)

(assert (=> start!43252 (=> (not res!285818) (not e!281837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43252 (= res!285818 (validMask!0 mask!2352))))

(assert (=> start!43252 e!281837))

(assert (=> start!43252 true))

(assert (=> start!43252 tp_is_empty!13645))

(declare-fun array_inv!10832 (array!30957) Bool)

(assert (=> start!43252 (and (array_inv!10832 _values!1516) e!281839)))

(assert (=> start!43252 tp!42670))

(declare-fun array_inv!10833 (array!30955) Bool)

(assert (=> start!43252 (array_inv!10833 _keys!1874)))

(assert (= (and start!43252 res!285818) b!479092))

(assert (= (and b!479092 res!285819) b!479094))

(assert (= (and b!479094 res!285817) b!479098))

(assert (= (and b!479098 res!285816) b!479093))

(assert (= (and b!479097 condMapEmpty!22165) mapIsEmpty!22165))

(assert (= (and b!479097 (not condMapEmpty!22165)) mapNonEmpty!22165))

(get-info :version)

(assert (= (and mapNonEmpty!22165 ((_ is ValueCellFull!6461) mapValue!22165)) b!479095))

(assert (= (and b!479097 ((_ is ValueCellFull!6461) mapDefault!22165)) b!479096))

(assert (= start!43252 b!479097))

(declare-fun m!460593 () Bool)

(assert (=> mapNonEmpty!22165 m!460593))

(declare-fun m!460595 () Bool)

(assert (=> b!479094 m!460595))

(declare-fun m!460597 () Bool)

(assert (=> start!43252 m!460597))

(declare-fun m!460599 () Bool)

(assert (=> start!43252 m!460599))

(declare-fun m!460601 () Bool)

(assert (=> start!43252 m!460601))

(declare-fun m!460603 () Bool)

(assert (=> b!479093 m!460603))

(assert (=> b!479093 m!460603))

(declare-fun m!460605 () Bool)

(assert (=> b!479093 m!460605))

(declare-fun m!460607 () Bool)

(assert (=> b!479098 m!460607))

(check-sat (not start!43252) tp_is_empty!13645 (not b!479098) (not b!479094) b_and!20859 (not mapNonEmpty!22165) (not b_next!12133) (not b!479093))
(check-sat b_and!20859 (not b_next!12133))
