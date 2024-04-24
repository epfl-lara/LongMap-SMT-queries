; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71382 () Bool)

(assert start!71382)

(declare-fun b_free!13363 () Bool)

(declare-fun b_next!13363 () Bool)

(assert (=> start!71382 (= b_free!13363 (not b_next!13363))))

(declare-fun tp!46852 () Bool)

(declare-fun b_and!22311 () Bool)

(assert (=> start!71382 (= tp!46852 b_and!22311)))

(declare-fun b!828154 () Bool)

(declare-fun e!461390 () Bool)

(assert (=> b!828154 (= e!461390 false)))

(declare-datatypes ((array!46325 0))(
  ( (array!46326 (arr!22202 (Array (_ BitVec 32) (_ BitVec 64))) (size!22622 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46325)

(declare-datatypes ((V!25099 0))(
  ( (V!25100 (val!7584 Int)) )
))
(declare-fun zeroValueAfter!34 () V!25099)

(declare-fun minValue!754 () V!25099)

(declare-datatypes ((ValueCell!7121 0))(
  ( (ValueCellFull!7121 (v!10019 V!25099)) (EmptyCell!7121) )
))
(declare-datatypes ((array!46327 0))(
  ( (array!46328 (arr!22203 (Array (_ BitVec 32) ValueCell!7121)) (size!22623 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46327)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9980 0))(
  ( (tuple2!9981 (_1!5001 (_ BitVec 64)) (_2!5001 V!25099)) )
))
(declare-datatypes ((List!15754 0))(
  ( (Nil!15751) (Cons!15750 (h!16885 tuple2!9980) (t!22095 List!15754)) )
))
(declare-datatypes ((ListLongMap!8805 0))(
  ( (ListLongMap!8806 (toList!4418 List!15754)) )
))
(declare-fun lt!375209 () ListLongMap!8805)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2495 (array!46325 array!46327 (_ BitVec 32) (_ BitVec 32) V!25099 V!25099 (_ BitVec 32) Int) ListLongMap!8805)

(assert (=> b!828154 (= lt!375209 (getCurrentListMapNoExtraKeys!2495 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25099)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!375208 () ListLongMap!8805)

(assert (=> b!828154 (= lt!375208 (getCurrentListMapNoExtraKeys!2495 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828155 () Bool)

(declare-fun res!564219 () Bool)

(assert (=> b!828155 (=> (not res!564219) (not e!461390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46325 (_ BitVec 32)) Bool)

(assert (=> b!828155 (= res!564219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24238 () Bool)

(declare-fun mapRes!24238 () Bool)

(declare-fun tp!46851 () Bool)

(declare-fun e!461389 () Bool)

(assert (=> mapNonEmpty!24238 (= mapRes!24238 (and tp!46851 e!461389))))

(declare-fun mapKey!24238 () (_ BitVec 32))

(declare-fun mapRest!24238 () (Array (_ BitVec 32) ValueCell!7121))

(declare-fun mapValue!24238 () ValueCell!7121)

(assert (=> mapNonEmpty!24238 (= (arr!22203 _values!788) (store mapRest!24238 mapKey!24238 mapValue!24238))))

(declare-fun b!828157 () Bool)

(declare-fun res!564222 () Bool)

(assert (=> b!828157 (=> (not res!564222) (not e!461390))))

(assert (=> b!828157 (= res!564222 (and (= (size!22623 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22622 _keys!976) (size!22623 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828158 () Bool)

(declare-fun e!461392 () Bool)

(declare-fun tp_is_empty!15073 () Bool)

(assert (=> b!828158 (= e!461392 tp_is_empty!15073)))

(declare-fun b!828159 () Bool)

(declare-fun e!461388 () Bool)

(assert (=> b!828159 (= e!461388 (and e!461392 mapRes!24238))))

(declare-fun condMapEmpty!24238 () Bool)

(declare-fun mapDefault!24238 () ValueCell!7121)

(assert (=> b!828159 (= condMapEmpty!24238 (= (arr!22203 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7121)) mapDefault!24238)))))

(declare-fun mapIsEmpty!24238 () Bool)

(assert (=> mapIsEmpty!24238 mapRes!24238))

(declare-fun b!828160 () Bool)

(assert (=> b!828160 (= e!461389 tp_is_empty!15073)))

(declare-fun b!828156 () Bool)

(declare-fun res!564221 () Bool)

(assert (=> b!828156 (=> (not res!564221) (not e!461390))))

(declare-datatypes ((List!15755 0))(
  ( (Nil!15752) (Cons!15751 (h!16886 (_ BitVec 64)) (t!22096 List!15755)) )
))
(declare-fun arrayNoDuplicates!0 (array!46325 (_ BitVec 32) List!15755) Bool)

(assert (=> b!828156 (= res!564221 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15752))))

(declare-fun res!564220 () Bool)

(assert (=> start!71382 (=> (not res!564220) (not e!461390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71382 (= res!564220 (validMask!0 mask!1312))))

(assert (=> start!71382 e!461390))

(assert (=> start!71382 tp_is_empty!15073))

(declare-fun array_inv!17735 (array!46325) Bool)

(assert (=> start!71382 (array_inv!17735 _keys!976)))

(assert (=> start!71382 true))

(declare-fun array_inv!17736 (array!46327) Bool)

(assert (=> start!71382 (and (array_inv!17736 _values!788) e!461388)))

(assert (=> start!71382 tp!46852))

(assert (= (and start!71382 res!564220) b!828157))

(assert (= (and b!828157 res!564222) b!828155))

(assert (= (and b!828155 res!564219) b!828156))

(assert (= (and b!828156 res!564221) b!828154))

(assert (= (and b!828159 condMapEmpty!24238) mapIsEmpty!24238))

(assert (= (and b!828159 (not condMapEmpty!24238)) mapNonEmpty!24238))

(get-info :version)

(assert (= (and mapNonEmpty!24238 ((_ is ValueCellFull!7121) mapValue!24238)) b!828160))

(assert (= (and b!828159 ((_ is ValueCellFull!7121) mapDefault!24238)) b!828158))

(assert (= start!71382 b!828159))

(declare-fun m!771665 () Bool)

(assert (=> b!828156 m!771665))

(declare-fun m!771667 () Bool)

(assert (=> mapNonEmpty!24238 m!771667))

(declare-fun m!771669 () Bool)

(assert (=> start!71382 m!771669))

(declare-fun m!771671 () Bool)

(assert (=> start!71382 m!771671))

(declare-fun m!771673 () Bool)

(assert (=> start!71382 m!771673))

(declare-fun m!771675 () Bool)

(assert (=> b!828155 m!771675))

(declare-fun m!771677 () Bool)

(assert (=> b!828154 m!771677))

(declare-fun m!771679 () Bool)

(assert (=> b!828154 m!771679))

(check-sat b_and!22311 (not b!828154) (not start!71382) (not b!828156) tp_is_empty!15073 (not b_next!13363) (not mapNonEmpty!24238) (not b!828155))
(check-sat b_and!22311 (not b_next!13363))
