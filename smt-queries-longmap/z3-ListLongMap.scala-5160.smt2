; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69936 () Bool)

(assert start!69936)

(declare-fun b_free!12369 () Bool)

(declare-fun b_next!12369 () Bool)

(assert (=> start!69936 (= b_free!12369 (not b_next!12369))))

(declare-fun tp!43818 () Bool)

(declare-fun b_and!21137 () Bool)

(assert (=> start!69936 (= tp!43818 b_and!21137)))

(declare-fun res!555444 () Bool)

(declare-fun e!450403 () Bool)

(assert (=> start!69936 (=> (not res!555444) (not e!450403))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69936 (= res!555444 (validMask!0 mask!1312))))

(assert (=> start!69936 e!450403))

(declare-fun tp_is_empty!14079 () Bool)

(assert (=> start!69936 tp_is_empty!14079))

(declare-datatypes ((array!44374 0))(
  ( (array!44375 (arr!21248 (Array (_ BitVec 32) (_ BitVec 64))) (size!21669 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44374)

(declare-fun array_inv!17021 (array!44374) Bool)

(assert (=> start!69936 (array_inv!17021 _keys!976)))

(assert (=> start!69936 true))

(declare-datatypes ((V!23773 0))(
  ( (V!23774 (val!7087 Int)) )
))
(declare-datatypes ((ValueCell!6624 0))(
  ( (ValueCellFull!6624 (v!9514 V!23773)) (EmptyCell!6624) )
))
(declare-datatypes ((array!44376 0))(
  ( (array!44377 (arr!21249 (Array (_ BitVec 32) ValueCell!6624)) (size!21670 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44376)

(declare-fun e!450401 () Bool)

(declare-fun array_inv!17022 (array!44376) Bool)

(assert (=> start!69936 (and (array_inv!17022 _values!788) e!450401)))

(assert (=> start!69936 tp!43818))

(declare-fun b!812956 () Bool)

(assert (=> b!812956 (= e!450403 false)))

(declare-fun zeroValueBefore!34 () V!23773)

(declare-datatypes ((tuple2!9286 0))(
  ( (tuple2!9287 (_1!4654 (_ BitVec 64)) (_2!4654 V!23773)) )
))
(declare-datatypes ((List!15116 0))(
  ( (Nil!15113) (Cons!15112 (h!16241 tuple2!9286) (t!21431 List!15116)) )
))
(declare-datatypes ((ListLongMap!8109 0))(
  ( (ListLongMap!8110 (toList!4070 List!15116)) )
))
(declare-fun lt!364215 () ListLongMap!8109)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23773)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2120 (array!44374 array!44376 (_ BitVec 32) (_ BitVec 32) V!23773 V!23773 (_ BitVec 32) Int) ListLongMap!8109)

(assert (=> b!812956 (= lt!364215 (getCurrentListMapNoExtraKeys!2120 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!812957 () Bool)

(declare-fun res!555447 () Bool)

(assert (=> b!812957 (=> (not res!555447) (not e!450403))))

(declare-datatypes ((List!15117 0))(
  ( (Nil!15114) (Cons!15113 (h!16242 (_ BitVec 64)) (t!21432 List!15117)) )
))
(declare-fun arrayNoDuplicates!0 (array!44374 (_ BitVec 32) List!15117) Bool)

(assert (=> b!812957 (= res!555447 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15114))))

(declare-fun mapIsEmpty!22696 () Bool)

(declare-fun mapRes!22696 () Bool)

(assert (=> mapIsEmpty!22696 mapRes!22696))

(declare-fun b!812958 () Bool)

(declare-fun res!555446 () Bool)

(assert (=> b!812958 (=> (not res!555446) (not e!450403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44374 (_ BitVec 32)) Bool)

(assert (=> b!812958 (= res!555446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22696 () Bool)

(declare-fun tp!43819 () Bool)

(declare-fun e!450402 () Bool)

(assert (=> mapNonEmpty!22696 (= mapRes!22696 (and tp!43819 e!450402))))

(declare-fun mapRest!22696 () (Array (_ BitVec 32) ValueCell!6624))

(declare-fun mapKey!22696 () (_ BitVec 32))

(declare-fun mapValue!22696 () ValueCell!6624)

(assert (=> mapNonEmpty!22696 (= (arr!21249 _values!788) (store mapRest!22696 mapKey!22696 mapValue!22696))))

(declare-fun b!812959 () Bool)

(declare-fun e!450404 () Bool)

(assert (=> b!812959 (= e!450404 tp_is_empty!14079)))

(declare-fun b!812960 () Bool)

(assert (=> b!812960 (= e!450401 (and e!450404 mapRes!22696))))

(declare-fun condMapEmpty!22696 () Bool)

(declare-fun mapDefault!22696 () ValueCell!6624)

(assert (=> b!812960 (= condMapEmpty!22696 (= (arr!21249 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6624)) mapDefault!22696)))))

(declare-fun b!812961 () Bool)

(declare-fun res!555445 () Bool)

(assert (=> b!812961 (=> (not res!555445) (not e!450403))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812961 (= res!555445 (and (= (size!21670 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21669 _keys!976) (size!21670 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812962 () Bool)

(assert (=> b!812962 (= e!450402 tp_is_empty!14079)))

(assert (= (and start!69936 res!555444) b!812961))

(assert (= (and b!812961 res!555445) b!812958))

(assert (= (and b!812958 res!555446) b!812957))

(assert (= (and b!812957 res!555447) b!812956))

(assert (= (and b!812960 condMapEmpty!22696) mapIsEmpty!22696))

(assert (= (and b!812960 (not condMapEmpty!22696)) mapNonEmpty!22696))

(get-info :version)

(assert (= (and mapNonEmpty!22696 ((_ is ValueCellFull!6624) mapValue!22696)) b!812962))

(assert (= (and b!812960 ((_ is ValueCellFull!6624) mapDefault!22696)) b!812959))

(assert (= start!69936 b!812960))

(declare-fun m!755159 () Bool)

(assert (=> b!812957 m!755159))

(declare-fun m!755161 () Bool)

(assert (=> b!812958 m!755161))

(declare-fun m!755163 () Bool)

(assert (=> start!69936 m!755163))

(declare-fun m!755165 () Bool)

(assert (=> start!69936 m!755165))

(declare-fun m!755167 () Bool)

(assert (=> start!69936 m!755167))

(declare-fun m!755169 () Bool)

(assert (=> b!812956 m!755169))

(declare-fun m!755171 () Bool)

(assert (=> mapNonEmpty!22696 m!755171))

(check-sat (not b!812957) tp_is_empty!14079 (not b_next!12369) (not mapNonEmpty!22696) b_and!21137 (not b!812958) (not b!812956) (not start!69936))
(check-sat b_and!21137 (not b_next!12369))
