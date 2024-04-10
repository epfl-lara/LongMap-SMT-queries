; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70098 () Bool)

(assert start!70098)

(declare-fun b_free!12519 () Bool)

(declare-fun b_next!12519 () Bool)

(assert (=> start!70098 (= b_free!12519 (not b_next!12519))))

(declare-fun tp!44271 () Bool)

(declare-fun b_and!21291 () Bool)

(assert (=> start!70098 (= tp!44271 b_and!21291)))

(declare-fun mapNonEmpty!22924 () Bool)

(declare-fun mapRes!22924 () Bool)

(declare-fun tp!44272 () Bool)

(declare-fun e!451576 () Bool)

(assert (=> mapNonEmpty!22924 (= mapRes!22924 (and tp!44272 e!451576))))

(declare-fun mapKey!22924 () (_ BitVec 32))

(declare-datatypes ((V!23973 0))(
  ( (V!23974 (val!7162 Int)) )
))
(declare-datatypes ((ValueCell!6699 0))(
  ( (ValueCellFull!6699 (v!9589 V!23973)) (EmptyCell!6699) )
))
(declare-datatypes ((array!44660 0))(
  ( (array!44661 (arr!21390 (Array (_ BitVec 32) ValueCell!6699)) (size!21811 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44660)

(declare-fun mapValue!22924 () ValueCell!6699)

(declare-fun mapRest!22924 () (Array (_ BitVec 32) ValueCell!6699))

(assert (=> mapNonEmpty!22924 (= (arr!21390 _values!788) (store mapRest!22924 mapKey!22924 mapValue!22924))))

(declare-fun b!814604 () Bool)

(declare-fun res!556372 () Bool)

(declare-fun e!451578 () Bool)

(assert (=> b!814604 (=> (not res!556372) (not e!451578))))

(declare-datatypes ((array!44662 0))(
  ( (array!44663 (arr!21391 (Array (_ BitVec 32) (_ BitVec 64))) (size!21812 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44662)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44662 (_ BitVec 32)) Bool)

(assert (=> b!814604 (= res!556372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22924 () Bool)

(assert (=> mapIsEmpty!22924 mapRes!22924))

(declare-fun b!814605 () Bool)

(declare-fun e!451575 () Bool)

(declare-fun tp_is_empty!14229 () Bool)

(assert (=> b!814605 (= e!451575 tp_is_empty!14229)))

(declare-fun res!556374 () Bool)

(assert (=> start!70098 (=> (not res!556374) (not e!451578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70098 (= res!556374 (validMask!0 mask!1312))))

(assert (=> start!70098 e!451578))

(assert (=> start!70098 tp_is_empty!14229))

(declare-fun array_inv!17117 (array!44662) Bool)

(assert (=> start!70098 (array_inv!17117 _keys!976)))

(assert (=> start!70098 true))

(declare-fun e!451574 () Bool)

(declare-fun array_inv!17118 (array!44660) Bool)

(assert (=> start!70098 (and (array_inv!17118 _values!788) e!451574)))

(assert (=> start!70098 tp!44271))

(declare-fun b!814606 () Bool)

(declare-fun res!556371 () Bool)

(assert (=> b!814606 (=> (not res!556371) (not e!451578))))

(declare-datatypes ((List!15219 0))(
  ( (Nil!15216) (Cons!15215 (h!16344 (_ BitVec 64)) (t!21536 List!15219)) )
))
(declare-fun arrayNoDuplicates!0 (array!44662 (_ BitVec 32) List!15219) Bool)

(assert (=> b!814606 (= res!556371 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15216))))

(declare-fun b!814607 () Bool)

(assert (=> b!814607 (= e!451576 tp_is_empty!14229)))

(declare-fun b!814608 () Bool)

(assert (=> b!814608 (= e!451578 (not true))))

(declare-datatypes ((tuple2!9388 0))(
  ( (tuple2!9389 (_1!4705 (_ BitVec 64)) (_2!4705 V!23973)) )
))
(declare-datatypes ((List!15220 0))(
  ( (Nil!15217) (Cons!15216 (h!16345 tuple2!9388) (t!21537 List!15220)) )
))
(declare-datatypes ((ListLongMap!8211 0))(
  ( (ListLongMap!8212 (toList!4121 List!15220)) )
))
(declare-fun lt!364689 () ListLongMap!8211)

(declare-fun lt!364688 () ListLongMap!8211)

(assert (=> b!814608 (= lt!364689 lt!364688)))

(declare-fun zeroValueBefore!34 () V!23973)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23973)

(declare-fun minValue!754 () V!23973)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27740 0))(
  ( (Unit!27741) )
))
(declare-fun lt!364687 () Unit!27740)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!281 (array!44662 array!44660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23973 V!23973 V!23973 V!23973 (_ BitVec 32) Int) Unit!27740)

(assert (=> b!814608 (= lt!364687 (lemmaNoChangeToArrayThenSameMapNoExtras!281 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2171 (array!44662 array!44660 (_ BitVec 32) (_ BitVec 32) V!23973 V!23973 (_ BitVec 32) Int) ListLongMap!8211)

(assert (=> b!814608 (= lt!364688 (getCurrentListMapNoExtraKeys!2171 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814608 (= lt!364689 (getCurrentListMapNoExtraKeys!2171 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814609 () Bool)

(assert (=> b!814609 (= e!451574 (and e!451575 mapRes!22924))))

(declare-fun condMapEmpty!22924 () Bool)

(declare-fun mapDefault!22924 () ValueCell!6699)

(assert (=> b!814609 (= condMapEmpty!22924 (= (arr!21390 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6699)) mapDefault!22924)))))

(declare-fun b!814610 () Bool)

(declare-fun res!556373 () Bool)

(assert (=> b!814610 (=> (not res!556373) (not e!451578))))

(assert (=> b!814610 (= res!556373 (and (= (size!21811 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21812 _keys!976) (size!21811 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70098 res!556374) b!814610))

(assert (= (and b!814610 res!556373) b!814604))

(assert (= (and b!814604 res!556372) b!814606))

(assert (= (and b!814606 res!556371) b!814608))

(assert (= (and b!814609 condMapEmpty!22924) mapIsEmpty!22924))

(assert (= (and b!814609 (not condMapEmpty!22924)) mapNonEmpty!22924))

(get-info :version)

(assert (= (and mapNonEmpty!22924 ((_ is ValueCellFull!6699) mapValue!22924)) b!814607))

(assert (= (and b!814609 ((_ is ValueCellFull!6699) mapDefault!22924)) b!814605))

(assert (= start!70098 b!814609))

(declare-fun m!756395 () Bool)

(assert (=> b!814604 m!756395))

(declare-fun m!756397 () Bool)

(assert (=> start!70098 m!756397))

(declare-fun m!756399 () Bool)

(assert (=> start!70098 m!756399))

(declare-fun m!756401 () Bool)

(assert (=> start!70098 m!756401))

(declare-fun m!756403 () Bool)

(assert (=> b!814608 m!756403))

(declare-fun m!756405 () Bool)

(assert (=> b!814608 m!756405))

(declare-fun m!756407 () Bool)

(assert (=> b!814608 m!756407))

(declare-fun m!756409 () Bool)

(assert (=> b!814606 m!756409))

(declare-fun m!756411 () Bool)

(assert (=> mapNonEmpty!22924 m!756411))

(check-sat (not b!814608) (not start!70098) (not b!814604) b_and!21291 (not mapNonEmpty!22924) (not b_next!12519) tp_is_empty!14229 (not b!814606))
(check-sat b_and!21291 (not b_next!12519))
