; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71190 () Bool)

(assert start!71190)

(declare-fun b_free!13357 () Bool)

(declare-fun b_next!13357 () Bool)

(assert (=> start!71190 (= b_free!13357 (not b_next!13357))))

(declare-fun tp!46833 () Bool)

(declare-fun b_and!22269 () Bool)

(assert (=> start!71190 (= tp!46833 b_and!22269)))

(declare-fun b!826952 () Bool)

(declare-fun e!460615 () Bool)

(assert (=> b!826952 (= e!460615 false)))

(declare-datatypes ((array!46277 0))(
  ( (array!46278 (arr!22183 (Array (_ BitVec 32) (_ BitVec 64))) (size!22604 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46277)

(declare-datatypes ((V!25091 0))(
  ( (V!25092 (val!7581 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25091)

(declare-fun minValue!754 () V!25091)

(declare-datatypes ((ValueCell!7118 0))(
  ( (ValueCellFull!7118 (v!10010 V!25091)) (EmptyCell!7118) )
))
(declare-datatypes ((array!46279 0))(
  ( (array!46280 (arr!22184 (Array (_ BitVec 32) ValueCell!7118)) (size!22605 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46279)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!10056 0))(
  ( (tuple2!10057 (_1!5039 (_ BitVec 64)) (_2!5039 V!25091)) )
))
(declare-datatypes ((List!15845 0))(
  ( (Nil!15842) (Cons!15841 (h!16970 tuple2!10056) (t!22185 List!15845)) )
))
(declare-datatypes ((ListLongMap!8869 0))(
  ( (ListLongMap!8870 (toList!4450 List!15845)) )
))
(declare-fun lt!374594 () ListLongMap!8869)

(declare-fun getCurrentListMapNoExtraKeys!2482 (array!46277 array!46279 (_ BitVec 32) (_ BitVec 32) V!25091 V!25091 (_ BitVec 32) Int) ListLongMap!8869)

(assert (=> b!826952 (= lt!374594 (getCurrentListMapNoExtraKeys!2482 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25091)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!374593 () ListLongMap!8869)

(assert (=> b!826952 (= lt!374593 (getCurrentListMapNoExtraKeys!2482 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826953 () Bool)

(declare-fun e!460617 () Bool)

(declare-fun tp_is_empty!15067 () Bool)

(assert (=> b!826953 (= e!460617 tp_is_empty!15067)))

(declare-fun b!826954 () Bool)

(declare-fun res!563732 () Bool)

(assert (=> b!826954 (=> (not res!563732) (not e!460615))))

(assert (=> b!826954 (= res!563732 (and (= (size!22605 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22604 _keys!976) (size!22605 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826955 () Bool)

(declare-fun e!460616 () Bool)

(assert (=> b!826955 (= e!460616 tp_is_empty!15067)))

(declare-fun mapIsEmpty!24229 () Bool)

(declare-fun mapRes!24229 () Bool)

(assert (=> mapIsEmpty!24229 mapRes!24229))

(declare-fun b!826956 () Bool)

(declare-fun e!460618 () Bool)

(assert (=> b!826956 (= e!460618 (and e!460616 mapRes!24229))))

(declare-fun condMapEmpty!24229 () Bool)

(declare-fun mapDefault!24229 () ValueCell!7118)

(assert (=> b!826956 (= condMapEmpty!24229 (= (arr!22184 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7118)) mapDefault!24229)))))

(declare-fun res!563731 () Bool)

(assert (=> start!71190 (=> (not res!563731) (not e!460615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71190 (= res!563731 (validMask!0 mask!1312))))

(assert (=> start!71190 e!460615))

(assert (=> start!71190 tp_is_empty!15067))

(declare-fun array_inv!17743 (array!46277) Bool)

(assert (=> start!71190 (array_inv!17743 _keys!976)))

(assert (=> start!71190 true))

(declare-fun array_inv!17744 (array!46279) Bool)

(assert (=> start!71190 (and (array_inv!17744 _values!788) e!460618)))

(assert (=> start!71190 tp!46833))

(declare-fun b!826951 () Bool)

(declare-fun res!563733 () Bool)

(assert (=> b!826951 (=> (not res!563733) (not e!460615))))

(declare-datatypes ((List!15846 0))(
  ( (Nil!15843) (Cons!15842 (h!16971 (_ BitVec 64)) (t!22186 List!15846)) )
))
(declare-fun arrayNoDuplicates!0 (array!46277 (_ BitVec 32) List!15846) Bool)

(assert (=> b!826951 (= res!563733 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15843))))

(declare-fun mapNonEmpty!24229 () Bool)

(declare-fun tp!46834 () Bool)

(assert (=> mapNonEmpty!24229 (= mapRes!24229 (and tp!46834 e!460617))))

(declare-fun mapRest!24229 () (Array (_ BitVec 32) ValueCell!7118))

(declare-fun mapKey!24229 () (_ BitVec 32))

(declare-fun mapValue!24229 () ValueCell!7118)

(assert (=> mapNonEmpty!24229 (= (arr!22184 _values!788) (store mapRest!24229 mapKey!24229 mapValue!24229))))

(declare-fun b!826957 () Bool)

(declare-fun res!563734 () Bool)

(assert (=> b!826957 (=> (not res!563734) (not e!460615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46277 (_ BitVec 32)) Bool)

(assert (=> b!826957 (= res!563734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71190 res!563731) b!826954))

(assert (= (and b!826954 res!563732) b!826957))

(assert (= (and b!826957 res!563734) b!826951))

(assert (= (and b!826951 res!563733) b!826952))

(assert (= (and b!826956 condMapEmpty!24229) mapIsEmpty!24229))

(assert (= (and b!826956 (not condMapEmpty!24229)) mapNonEmpty!24229))

(get-info :version)

(assert (= (and mapNonEmpty!24229 ((_ is ValueCellFull!7118) mapValue!24229)) b!826953))

(assert (= (and b!826956 ((_ is ValueCellFull!7118) mapDefault!24229)) b!826955))

(assert (= start!71190 b!826956))

(declare-fun m!769583 () Bool)

(assert (=> b!826951 m!769583))

(declare-fun m!769585 () Bool)

(assert (=> mapNonEmpty!24229 m!769585))

(declare-fun m!769587 () Bool)

(assert (=> b!826957 m!769587))

(declare-fun m!769589 () Bool)

(assert (=> b!826952 m!769589))

(declare-fun m!769591 () Bool)

(assert (=> b!826952 m!769591))

(declare-fun m!769593 () Bool)

(assert (=> start!71190 m!769593))

(declare-fun m!769595 () Bool)

(assert (=> start!71190 m!769595))

(declare-fun m!769597 () Bool)

(assert (=> start!71190 m!769597))

(check-sat (not b_next!13357) (not b!826952) b_and!22269 (not b!826951) (not start!71190) (not mapNonEmpty!24229) tp_is_empty!15067 (not b!826957))
(check-sat b_and!22269 (not b_next!13357))
