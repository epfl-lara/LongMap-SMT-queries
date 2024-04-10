; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70204 () Bool)

(assert start!70204)

(declare-fun b_free!12597 () Bool)

(declare-fun b_next!12597 () Bool)

(assert (=> start!70204 (= b_free!12597 (not b_next!12597))))

(declare-fun tp!44511 () Bool)

(declare-fun b_and!21385 () Bool)

(assert (=> start!70204 (= tp!44511 b_and!21385)))

(declare-fun b!815607 () Bool)

(declare-fun res!556919 () Bool)

(declare-fun e!452288 () Bool)

(assert (=> b!815607 (=> (not res!556919) (not e!452288))))

(declare-datatypes ((array!44816 0))(
  ( (array!44817 (arr!21466 (Array (_ BitVec 32) (_ BitVec 64))) (size!21887 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44816)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44816 (_ BitVec 32)) Bool)

(assert (=> b!815607 (= res!556919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815608 () Bool)

(declare-fun e!452286 () Bool)

(assert (=> b!815608 (= e!452288 (not e!452286))))

(declare-fun res!556917 () Bool)

(assert (=> b!815608 (=> res!556917 e!452286)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!815608 (= res!556917 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24077 0))(
  ( (V!24078 (val!7201 Int)) )
))
(declare-datatypes ((tuple2!9446 0))(
  ( (tuple2!9447 (_1!4734 (_ BitVec 64)) (_2!4734 V!24077)) )
))
(declare-datatypes ((List!15277 0))(
  ( (Nil!15274) (Cons!15273 (h!16402 tuple2!9446) (t!21598 List!15277)) )
))
(declare-datatypes ((ListLongMap!8269 0))(
  ( (ListLongMap!8270 (toList!4150 List!15277)) )
))
(declare-fun lt!365148 () ListLongMap!8269)

(declare-fun lt!365149 () ListLongMap!8269)

(assert (=> b!815608 (= lt!365148 lt!365149)))

(declare-fun zeroValueAfter!34 () V!24077)

(declare-fun minValue!754 () V!24077)

(declare-datatypes ((ValueCell!6738 0))(
  ( (ValueCellFull!6738 (v!9628 V!24077)) (EmptyCell!6738) )
))
(declare-datatypes ((array!44818 0))(
  ( (array!44819 (arr!21467 (Array (_ BitVec 32) ValueCell!6738)) (size!21888 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44818)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27796 0))(
  ( (Unit!27797) )
))
(declare-fun lt!365146 () Unit!27796)

(declare-fun zeroValueBefore!34 () V!24077)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!309 (array!44816 array!44818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24077 V!24077 V!24077 V!24077 (_ BitVec 32) Int) Unit!27796)

(assert (=> b!815608 (= lt!365146 (lemmaNoChangeToArrayThenSameMapNoExtras!309 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2199 (array!44816 array!44818 (_ BitVec 32) (_ BitVec 32) V!24077 V!24077 (_ BitVec 32) Int) ListLongMap!8269)

(assert (=> b!815608 (= lt!365149 (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815608 (= lt!365148 (getCurrentListMapNoExtraKeys!2199 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23047 () Bool)

(declare-fun mapRes!23047 () Bool)

(assert (=> mapIsEmpty!23047 mapRes!23047))

(declare-fun b!815609 () Bool)

(declare-fun res!556916 () Bool)

(assert (=> b!815609 (=> (not res!556916) (not e!452288))))

(assert (=> b!815609 (= res!556916 (and (= (size!21888 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21887 _keys!976) (size!21888 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556915 () Bool)

(assert (=> start!70204 (=> (not res!556915) (not e!452288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70204 (= res!556915 (validMask!0 mask!1312))))

(assert (=> start!70204 e!452288))

(declare-fun tp_is_empty!14307 () Bool)

(assert (=> start!70204 tp_is_empty!14307))

(declare-fun array_inv!17177 (array!44816) Bool)

(assert (=> start!70204 (array_inv!17177 _keys!976)))

(assert (=> start!70204 true))

(declare-fun e!452284 () Bool)

(declare-fun array_inv!17178 (array!44818) Bool)

(assert (=> start!70204 (and (array_inv!17178 _values!788) e!452284)))

(assert (=> start!70204 tp!44511))

(declare-fun b!815610 () Bool)

(assert (=> b!815610 (= e!452286 true)))

(declare-fun lt!365150 () ListLongMap!8269)

(declare-fun getCurrentListMap!2379 (array!44816 array!44818 (_ BitVec 32) (_ BitVec 32) V!24077 V!24077 (_ BitVec 32) Int) ListLongMap!8269)

(assert (=> b!815610 (= lt!365150 (getCurrentListMap!2379 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365147 () ListLongMap!8269)

(declare-fun +!1785 (ListLongMap!8269 tuple2!9446) ListLongMap!8269)

(assert (=> b!815610 (= lt!365147 (+!1785 (getCurrentListMap!2379 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9447 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815611 () Bool)

(declare-fun e!452283 () Bool)

(assert (=> b!815611 (= e!452283 tp_is_empty!14307)))

(declare-fun b!815612 () Bool)

(declare-fun res!556918 () Bool)

(assert (=> b!815612 (=> (not res!556918) (not e!452288))))

(declare-datatypes ((List!15278 0))(
  ( (Nil!15275) (Cons!15274 (h!16403 (_ BitVec 64)) (t!21599 List!15278)) )
))
(declare-fun arrayNoDuplicates!0 (array!44816 (_ BitVec 32) List!15278) Bool)

(assert (=> b!815612 (= res!556918 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15275))))

(declare-fun mapNonEmpty!23047 () Bool)

(declare-fun tp!44512 () Bool)

(declare-fun e!452287 () Bool)

(assert (=> mapNonEmpty!23047 (= mapRes!23047 (and tp!44512 e!452287))))

(declare-fun mapValue!23047 () ValueCell!6738)

(declare-fun mapKey!23047 () (_ BitVec 32))

(declare-fun mapRest!23047 () (Array (_ BitVec 32) ValueCell!6738))

(assert (=> mapNonEmpty!23047 (= (arr!21467 _values!788) (store mapRest!23047 mapKey!23047 mapValue!23047))))

(declare-fun b!815613 () Bool)

(assert (=> b!815613 (= e!452284 (and e!452283 mapRes!23047))))

(declare-fun condMapEmpty!23047 () Bool)

(declare-fun mapDefault!23047 () ValueCell!6738)

(assert (=> b!815613 (= condMapEmpty!23047 (= (arr!21467 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6738)) mapDefault!23047)))))

(declare-fun b!815614 () Bool)

(assert (=> b!815614 (= e!452287 tp_is_empty!14307)))

(assert (= (and start!70204 res!556915) b!815609))

(assert (= (and b!815609 res!556916) b!815607))

(assert (= (and b!815607 res!556919) b!815612))

(assert (= (and b!815612 res!556918) b!815608))

(assert (= (and b!815608 (not res!556917)) b!815610))

(assert (= (and b!815613 condMapEmpty!23047) mapIsEmpty!23047))

(assert (= (and b!815613 (not condMapEmpty!23047)) mapNonEmpty!23047))

(get-info :version)

(assert (= (and mapNonEmpty!23047 ((_ is ValueCellFull!6738) mapValue!23047)) b!815614))

(assert (= (and b!815613 ((_ is ValueCellFull!6738) mapDefault!23047)) b!815611))

(assert (= start!70204 b!815613))

(declare-fun m!757253 () Bool)

(assert (=> b!815612 m!757253))

(declare-fun m!757255 () Bool)

(assert (=> b!815610 m!757255))

(declare-fun m!757257 () Bool)

(assert (=> b!815610 m!757257))

(assert (=> b!815610 m!757257))

(declare-fun m!757259 () Bool)

(assert (=> b!815610 m!757259))

(declare-fun m!757261 () Bool)

(assert (=> b!815608 m!757261))

(declare-fun m!757263 () Bool)

(assert (=> b!815608 m!757263))

(declare-fun m!757265 () Bool)

(assert (=> b!815608 m!757265))

(declare-fun m!757267 () Bool)

(assert (=> mapNonEmpty!23047 m!757267))

(declare-fun m!757269 () Bool)

(assert (=> start!70204 m!757269))

(declare-fun m!757271 () Bool)

(assert (=> start!70204 m!757271))

(declare-fun m!757273 () Bool)

(assert (=> start!70204 m!757273))

(declare-fun m!757275 () Bool)

(assert (=> b!815607 m!757275))

(check-sat (not b_next!12597) (not b!815610) b_and!21385 (not b!815612) (not start!70204) (not mapNonEmpty!23047) (not b!815607) (not b!815608) tp_is_empty!14307)
(check-sat b_and!21385 (not b_next!12597))
