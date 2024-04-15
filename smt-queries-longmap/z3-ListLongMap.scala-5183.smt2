; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70064 () Bool)

(assert start!70064)

(declare-fun b_free!12505 () Bool)

(declare-fun b_next!12505 () Bool)

(assert (=> start!70064 (= b_free!12505 (not b_next!12505))))

(declare-fun tp!44230 () Bool)

(declare-fun b_and!21251 () Bool)

(assert (=> start!70064 (= tp!44230 b_and!21251)))

(declare-fun b!814211 () Bool)

(declare-fun res!556184 () Bool)

(declare-fun e!451321 () Bool)

(assert (=> b!814211 (=> (not res!556184) (not e!451321))))

(declare-datatypes ((array!44629 0))(
  ( (array!44630 (arr!21375 (Array (_ BitVec 32) (_ BitVec 64))) (size!21796 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44629)

(declare-datatypes ((List!15238 0))(
  ( (Nil!15235) (Cons!15234 (h!16363 (_ BitVec 64)) (t!21546 List!15238)) )
))
(declare-fun arrayNoDuplicates!0 (array!44629 (_ BitVec 32) List!15238) Bool)

(assert (=> b!814211 (= res!556184 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15235))))

(declare-fun b!814212 () Bool)

(declare-fun res!556181 () Bool)

(assert (=> b!814212 (=> (not res!556181) (not e!451321))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23955 0))(
  ( (V!23956 (val!7155 Int)) )
))
(declare-datatypes ((ValueCell!6692 0))(
  ( (ValueCellFull!6692 (v!9576 V!23955)) (EmptyCell!6692) )
))
(declare-datatypes ((array!44631 0))(
  ( (array!44632 (arr!21376 (Array (_ BitVec 32) ValueCell!6692)) (size!21797 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44631)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814212 (= res!556181 (and (= (size!21797 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21796 _keys!976) (size!21797 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814213 () Bool)

(declare-fun e!451319 () Bool)

(declare-fun tp_is_empty!14215 () Bool)

(assert (=> b!814213 (= e!451319 tp_is_empty!14215)))

(declare-fun mapIsEmpty!22903 () Bool)

(declare-fun mapRes!22903 () Bool)

(assert (=> mapIsEmpty!22903 mapRes!22903))

(declare-fun b!814214 () Bool)

(declare-fun e!451320 () Bool)

(assert (=> b!814214 (= e!451320 (and e!451319 mapRes!22903))))

(declare-fun condMapEmpty!22903 () Bool)

(declare-fun mapDefault!22903 () ValueCell!6692)

(assert (=> b!814214 (= condMapEmpty!22903 (= (arr!21376 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6692)) mapDefault!22903)))))

(declare-fun b!814215 () Bool)

(declare-fun res!556183 () Bool)

(assert (=> b!814215 (=> (not res!556183) (not e!451321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44629 (_ BitVec 32)) Bool)

(assert (=> b!814215 (= res!556183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814216 () Bool)

(assert (=> b!814216 (= e!451321 (not true))))

(declare-datatypes ((tuple2!9410 0))(
  ( (tuple2!9411 (_1!4716 (_ BitVec 64)) (_2!4716 V!23955)) )
))
(declare-datatypes ((List!15239 0))(
  ( (Nil!15236) (Cons!15235 (h!16364 tuple2!9410) (t!21547 List!15239)) )
))
(declare-datatypes ((ListLongMap!8223 0))(
  ( (ListLongMap!8224 (toList!4127 List!15239)) )
))
(declare-fun lt!364381 () ListLongMap!8223)

(declare-fun lt!364383 () ListLongMap!8223)

(assert (=> b!814216 (= lt!364381 lt!364383)))

(declare-fun zeroValueBefore!34 () V!23955)

(declare-fun zeroValueAfter!34 () V!23955)

(declare-fun minValue!754 () V!23955)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27688 0))(
  ( (Unit!27689) )
))
(declare-fun lt!364382 () Unit!27688)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!285 (array!44629 array!44631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23955 V!23955 V!23955 V!23955 (_ BitVec 32) Int) Unit!27688)

(assert (=> b!814216 (= lt!364382 (lemmaNoChangeToArrayThenSameMapNoExtras!285 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2192 (array!44629 array!44631 (_ BitVec 32) (_ BitVec 32) V!23955 V!23955 (_ BitVec 32) Int) ListLongMap!8223)

(assert (=> b!814216 (= lt!364383 (getCurrentListMapNoExtraKeys!2192 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814216 (= lt!364381 (getCurrentListMapNoExtraKeys!2192 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814217 () Bool)

(declare-fun e!451322 () Bool)

(assert (=> b!814217 (= e!451322 tp_is_empty!14215)))

(declare-fun res!556182 () Bool)

(assert (=> start!70064 (=> (not res!556182) (not e!451321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70064 (= res!556182 (validMask!0 mask!1312))))

(assert (=> start!70064 e!451321))

(assert (=> start!70064 tp_is_empty!14215))

(declare-fun array_inv!17187 (array!44629) Bool)

(assert (=> start!70064 (array_inv!17187 _keys!976)))

(assert (=> start!70064 true))

(declare-fun array_inv!17188 (array!44631) Bool)

(assert (=> start!70064 (and (array_inv!17188 _values!788) e!451320)))

(assert (=> start!70064 tp!44230))

(declare-fun mapNonEmpty!22903 () Bool)

(declare-fun tp!44229 () Bool)

(assert (=> mapNonEmpty!22903 (= mapRes!22903 (and tp!44229 e!451322))))

(declare-fun mapValue!22903 () ValueCell!6692)

(declare-fun mapRest!22903 () (Array (_ BitVec 32) ValueCell!6692))

(declare-fun mapKey!22903 () (_ BitVec 32))

(assert (=> mapNonEmpty!22903 (= (arr!21376 _values!788) (store mapRest!22903 mapKey!22903 mapValue!22903))))

(assert (= (and start!70064 res!556182) b!814212))

(assert (= (and b!814212 res!556181) b!814215))

(assert (= (and b!814215 res!556183) b!814211))

(assert (= (and b!814211 res!556184) b!814216))

(assert (= (and b!814214 condMapEmpty!22903) mapIsEmpty!22903))

(assert (= (and b!814214 (not condMapEmpty!22903)) mapNonEmpty!22903))

(get-info :version)

(assert (= (and mapNonEmpty!22903 ((_ is ValueCellFull!6692) mapValue!22903)) b!814217))

(assert (= (and b!814214 ((_ is ValueCellFull!6692) mapDefault!22903)) b!814213))

(assert (= start!70064 b!814214))

(declare-fun m!755517 () Bool)

(assert (=> b!814211 m!755517))

(declare-fun m!755519 () Bool)

(assert (=> mapNonEmpty!22903 m!755519))

(declare-fun m!755521 () Bool)

(assert (=> b!814216 m!755521))

(declare-fun m!755523 () Bool)

(assert (=> b!814216 m!755523))

(declare-fun m!755525 () Bool)

(assert (=> b!814216 m!755525))

(declare-fun m!755527 () Bool)

(assert (=> b!814215 m!755527))

(declare-fun m!755529 () Bool)

(assert (=> start!70064 m!755529))

(declare-fun m!755531 () Bool)

(assert (=> start!70064 m!755531))

(declare-fun m!755533 () Bool)

(assert (=> start!70064 m!755533))

(check-sat (not b!814216) (not b_next!12505) (not b!814211) tp_is_empty!14215 b_and!21251 (not b!814215) (not start!70064) (not mapNonEmpty!22903))
(check-sat b_and!21251 (not b_next!12505))
