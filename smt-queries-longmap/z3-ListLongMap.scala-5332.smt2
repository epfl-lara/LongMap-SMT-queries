; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71254 () Bool)

(assert start!71254)

(declare-fun b_free!13401 () Bool)

(declare-fun b_next!13401 () Bool)

(assert (=> start!71254 (= b_free!13401 (not b_next!13401))))

(declare-fun tp!46965 () Bool)

(declare-fun b_and!22339 () Bool)

(assert (=> start!71254 (= tp!46965 b_and!22339)))

(declare-fun b!827659 () Bool)

(declare-fun e!461095 () Bool)

(assert (=> b!827659 (= e!461095 false)))

(declare-datatypes ((array!46390 0))(
  ( (array!46391 (arr!22239 (Array (_ BitVec 32) (_ BitVec 64))) (size!22660 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46390)

(declare-datatypes ((V!25149 0))(
  ( (V!25150 (val!7603 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25149)

(declare-fun minValue!754 () V!25149)

(declare-datatypes ((ValueCell!7140 0))(
  ( (ValueCellFull!7140 (v!10038 V!25149)) (EmptyCell!7140) )
))
(declare-datatypes ((array!46392 0))(
  ( (array!46393 (arr!22240 (Array (_ BitVec 32) ValueCell!7140)) (size!22661 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46392)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!10078 0))(
  ( (tuple2!10079 (_1!5050 (_ BitVec 64)) (_2!5050 V!25149)) )
))
(declare-datatypes ((List!15873 0))(
  ( (Nil!15870) (Cons!15869 (h!16998 tuple2!10078) (t!22222 List!15873)) )
))
(declare-datatypes ((ListLongMap!8901 0))(
  ( (ListLongMap!8902 (toList!4466 List!15873)) )
))
(declare-fun lt!374968 () ListLongMap!8901)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2468 (array!46390 array!46392 (_ BitVec 32) (_ BitVec 32) V!25149 V!25149 (_ BitVec 32) Int) ListLongMap!8901)

(assert (=> b!827659 (= lt!374968 (getCurrentListMapNoExtraKeys!2468 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25149)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!374969 () ListLongMap!8901)

(assert (=> b!827659 (= lt!374969 (getCurrentListMapNoExtraKeys!2468 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!564102 () Bool)

(assert (=> start!71254 (=> (not res!564102) (not e!461095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71254 (= res!564102 (validMask!0 mask!1312))))

(assert (=> start!71254 e!461095))

(declare-fun tp_is_empty!15111 () Bool)

(assert (=> start!71254 tp_is_empty!15111))

(declare-fun array_inv!17721 (array!46390) Bool)

(assert (=> start!71254 (array_inv!17721 _keys!976)))

(assert (=> start!71254 true))

(declare-fun e!461097 () Bool)

(declare-fun array_inv!17722 (array!46392) Bool)

(assert (=> start!71254 (and (array_inv!17722 _values!788) e!461097)))

(assert (=> start!71254 tp!46965))

(declare-fun mapNonEmpty!24295 () Bool)

(declare-fun mapRes!24295 () Bool)

(declare-fun tp!46966 () Bool)

(declare-fun e!461099 () Bool)

(assert (=> mapNonEmpty!24295 (= mapRes!24295 (and tp!46966 e!461099))))

(declare-fun mapRest!24295 () (Array (_ BitVec 32) ValueCell!7140))

(declare-fun mapKey!24295 () (_ BitVec 32))

(declare-fun mapValue!24295 () ValueCell!7140)

(assert (=> mapNonEmpty!24295 (= (arr!22240 _values!788) (store mapRest!24295 mapKey!24295 mapValue!24295))))

(declare-fun b!827660 () Bool)

(declare-fun e!461098 () Bool)

(assert (=> b!827660 (= e!461098 tp_is_empty!15111)))

(declare-fun b!827661 () Bool)

(declare-fun res!564101 () Bool)

(assert (=> b!827661 (=> (not res!564101) (not e!461095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46390 (_ BitVec 32)) Bool)

(assert (=> b!827661 (= res!564101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827662 () Bool)

(assert (=> b!827662 (= e!461097 (and e!461098 mapRes!24295))))

(declare-fun condMapEmpty!24295 () Bool)

(declare-fun mapDefault!24295 () ValueCell!7140)

(assert (=> b!827662 (= condMapEmpty!24295 (= (arr!22240 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7140)) mapDefault!24295)))))

(declare-fun b!827663 () Bool)

(declare-fun res!564103 () Bool)

(assert (=> b!827663 (=> (not res!564103) (not e!461095))))

(assert (=> b!827663 (= res!564103 (and (= (size!22661 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22660 _keys!976) (size!22661 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827664 () Bool)

(assert (=> b!827664 (= e!461099 tp_is_empty!15111)))

(declare-fun mapIsEmpty!24295 () Bool)

(assert (=> mapIsEmpty!24295 mapRes!24295))

(declare-fun b!827665 () Bool)

(declare-fun res!564104 () Bool)

(assert (=> b!827665 (=> (not res!564104) (not e!461095))))

(declare-datatypes ((List!15874 0))(
  ( (Nil!15871) (Cons!15870 (h!16999 (_ BitVec 64)) (t!22223 List!15874)) )
))
(declare-fun arrayNoDuplicates!0 (array!46390 (_ BitVec 32) List!15874) Bool)

(assert (=> b!827665 (= res!564104 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15871))))

(assert (= (and start!71254 res!564102) b!827663))

(assert (= (and b!827663 res!564103) b!827661))

(assert (= (and b!827661 res!564101) b!827665))

(assert (= (and b!827665 res!564104) b!827659))

(assert (= (and b!827662 condMapEmpty!24295) mapIsEmpty!24295))

(assert (= (and b!827662 (not condMapEmpty!24295)) mapNonEmpty!24295))

(get-info :version)

(assert (= (and mapNonEmpty!24295 ((_ is ValueCellFull!7140) mapValue!24295)) b!827664))

(assert (= (and b!827662 ((_ is ValueCellFull!7140) mapDefault!24295)) b!827660))

(assert (= start!71254 b!827662))

(declare-fun m!770687 () Bool)

(assert (=> mapNonEmpty!24295 m!770687))

(declare-fun m!770689 () Bool)

(assert (=> b!827659 m!770689))

(declare-fun m!770691 () Bool)

(assert (=> b!827659 m!770691))

(declare-fun m!770693 () Bool)

(assert (=> start!71254 m!770693))

(declare-fun m!770695 () Bool)

(assert (=> start!71254 m!770695))

(declare-fun m!770697 () Bool)

(assert (=> start!71254 m!770697))

(declare-fun m!770699 () Bool)

(assert (=> b!827661 m!770699))

(declare-fun m!770701 () Bool)

(assert (=> b!827665 m!770701))

(check-sat tp_is_empty!15111 (not b!827665) (not b!827659) (not b_next!13401) (not start!71254) (not mapNonEmpty!24295) (not b!827661) b_and!22339)
(check-sat b_and!22339 (not b_next!13401))
