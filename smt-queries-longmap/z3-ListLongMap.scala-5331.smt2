; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71248 () Bool)

(assert start!71248)

(declare-fun b_free!13395 () Bool)

(declare-fun b_next!13395 () Bool)

(assert (=> start!71248 (= b_free!13395 (not b_next!13395))))

(declare-fun tp!46947 () Bool)

(declare-fun b_and!22333 () Bool)

(assert (=> start!71248 (= tp!46947 b_and!22333)))

(declare-fun res!564065 () Bool)

(declare-fun e!461051 () Bool)

(assert (=> start!71248 (=> (not res!564065) (not e!461051))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71248 (= res!564065 (validMask!0 mask!1312))))

(assert (=> start!71248 e!461051))

(declare-fun tp_is_empty!15105 () Bool)

(assert (=> start!71248 tp_is_empty!15105))

(declare-datatypes ((array!46378 0))(
  ( (array!46379 (arr!22233 (Array (_ BitVec 32) (_ BitVec 64))) (size!22654 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46378)

(declare-fun array_inv!17715 (array!46378) Bool)

(assert (=> start!71248 (array_inv!17715 _keys!976)))

(assert (=> start!71248 true))

(declare-datatypes ((V!25141 0))(
  ( (V!25142 (val!7600 Int)) )
))
(declare-datatypes ((ValueCell!7137 0))(
  ( (ValueCellFull!7137 (v!10035 V!25141)) (EmptyCell!7137) )
))
(declare-datatypes ((array!46380 0))(
  ( (array!46381 (arr!22234 (Array (_ BitVec 32) ValueCell!7137)) (size!22655 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46380)

(declare-fun e!461052 () Bool)

(declare-fun array_inv!17716 (array!46380) Bool)

(assert (=> start!71248 (and (array_inv!17716 _values!788) e!461052)))

(assert (=> start!71248 tp!46947))

(declare-fun b!827596 () Bool)

(declare-fun e!461050 () Bool)

(declare-fun mapRes!24286 () Bool)

(assert (=> b!827596 (= e!461052 (and e!461050 mapRes!24286))))

(declare-fun condMapEmpty!24286 () Bool)

(declare-fun mapDefault!24286 () ValueCell!7137)

(assert (=> b!827596 (= condMapEmpty!24286 (= (arr!22234 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7137)) mapDefault!24286)))))

(declare-fun b!827597 () Bool)

(assert (=> b!827597 (= e!461051 false)))

(declare-datatypes ((tuple2!10074 0))(
  ( (tuple2!10075 (_1!5048 (_ BitVec 64)) (_2!5048 V!25141)) )
))
(declare-datatypes ((List!15869 0))(
  ( (Nil!15866) (Cons!15865 (h!16994 tuple2!10074) (t!22218 List!15869)) )
))
(declare-datatypes ((ListLongMap!8897 0))(
  ( (ListLongMap!8898 (toList!4464 List!15869)) )
))
(declare-fun lt!374951 () ListLongMap!8897)

(declare-fun zeroValueAfter!34 () V!25141)

(declare-fun minValue!754 () V!25141)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2466 (array!46378 array!46380 (_ BitVec 32) (_ BitVec 32) V!25141 V!25141 (_ BitVec 32) Int) ListLongMap!8897)

(assert (=> b!827597 (= lt!374951 (getCurrentListMapNoExtraKeys!2466 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25141)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!374950 () ListLongMap!8897)

(assert (=> b!827597 (= lt!374950 (getCurrentListMapNoExtraKeys!2466 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24286 () Bool)

(assert (=> mapIsEmpty!24286 mapRes!24286))

(declare-fun b!827598 () Bool)

(declare-fun e!461054 () Bool)

(assert (=> b!827598 (= e!461054 tp_is_empty!15105)))

(declare-fun mapNonEmpty!24286 () Bool)

(declare-fun tp!46948 () Bool)

(assert (=> mapNonEmpty!24286 (= mapRes!24286 (and tp!46948 e!461054))))

(declare-fun mapRest!24286 () (Array (_ BitVec 32) ValueCell!7137))

(declare-fun mapKey!24286 () (_ BitVec 32))

(declare-fun mapValue!24286 () ValueCell!7137)

(assert (=> mapNonEmpty!24286 (= (arr!22234 _values!788) (store mapRest!24286 mapKey!24286 mapValue!24286))))

(declare-fun b!827599 () Bool)

(declare-fun res!564066 () Bool)

(assert (=> b!827599 (=> (not res!564066) (not e!461051))))

(assert (=> b!827599 (= res!564066 (and (= (size!22655 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22654 _keys!976) (size!22655 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827600 () Bool)

(declare-fun res!564067 () Bool)

(assert (=> b!827600 (=> (not res!564067) (not e!461051))))

(declare-datatypes ((List!15870 0))(
  ( (Nil!15867) (Cons!15866 (h!16995 (_ BitVec 64)) (t!22219 List!15870)) )
))
(declare-fun arrayNoDuplicates!0 (array!46378 (_ BitVec 32) List!15870) Bool)

(assert (=> b!827600 (= res!564067 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15867))))

(declare-fun b!827601 () Bool)

(assert (=> b!827601 (= e!461050 tp_is_empty!15105)))

(declare-fun b!827602 () Bool)

(declare-fun res!564068 () Bool)

(assert (=> b!827602 (=> (not res!564068) (not e!461051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46378 (_ BitVec 32)) Bool)

(assert (=> b!827602 (= res!564068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71248 res!564065) b!827599))

(assert (= (and b!827599 res!564066) b!827602))

(assert (= (and b!827602 res!564068) b!827600))

(assert (= (and b!827600 res!564067) b!827597))

(assert (= (and b!827596 condMapEmpty!24286) mapIsEmpty!24286))

(assert (= (and b!827596 (not condMapEmpty!24286)) mapNonEmpty!24286))

(get-info :version)

(assert (= (and mapNonEmpty!24286 ((_ is ValueCellFull!7137) mapValue!24286)) b!827598))

(assert (= (and b!827596 ((_ is ValueCellFull!7137) mapDefault!24286)) b!827601))

(assert (= start!71248 b!827596))

(declare-fun m!770639 () Bool)

(assert (=> b!827597 m!770639))

(declare-fun m!770641 () Bool)

(assert (=> b!827597 m!770641))

(declare-fun m!770643 () Bool)

(assert (=> mapNonEmpty!24286 m!770643))

(declare-fun m!770645 () Bool)

(assert (=> b!827600 m!770645))

(declare-fun m!770647 () Bool)

(assert (=> start!71248 m!770647))

(declare-fun m!770649 () Bool)

(assert (=> start!71248 m!770649))

(declare-fun m!770651 () Bool)

(assert (=> start!71248 m!770651))

(declare-fun m!770653 () Bool)

(assert (=> b!827602 m!770653))

(check-sat (not mapNonEmpty!24286) (not b!827597) (not b!827600) tp_is_empty!15105 b_and!22333 (not b_next!13395) (not start!71248) (not b!827602))
(check-sat b_and!22333 (not b_next!13395))
