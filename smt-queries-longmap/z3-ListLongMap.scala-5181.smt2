; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70074 () Bool)

(assert start!70074)

(declare-fun b_free!12495 () Bool)

(declare-fun b_next!12495 () Bool)

(assert (=> start!70074 (= b_free!12495 (not b_next!12495))))

(declare-fun tp!44199 () Bool)

(declare-fun b_and!21267 () Bool)

(assert (=> start!70074 (= tp!44199 b_and!21267)))

(declare-fun res!556227 () Bool)

(declare-fun e!451395 () Bool)

(assert (=> start!70074 (=> (not res!556227) (not e!451395))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70074 (= res!556227 (validMask!0 mask!1312))))

(assert (=> start!70074 e!451395))

(declare-fun tp_is_empty!14205 () Bool)

(assert (=> start!70074 tp_is_empty!14205))

(declare-datatypes ((array!44614 0))(
  ( (array!44615 (arr!21367 (Array (_ BitVec 32) (_ BitVec 64))) (size!21788 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44614)

(declare-fun array_inv!17097 (array!44614) Bool)

(assert (=> start!70074 (array_inv!17097 _keys!976)))

(assert (=> start!70074 true))

(declare-datatypes ((V!23941 0))(
  ( (V!23942 (val!7150 Int)) )
))
(declare-datatypes ((ValueCell!6687 0))(
  ( (ValueCellFull!6687 (v!9577 V!23941)) (EmptyCell!6687) )
))
(declare-datatypes ((array!44616 0))(
  ( (array!44617 (arr!21368 (Array (_ BitVec 32) ValueCell!6687)) (size!21789 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44616)

(declare-fun e!451396 () Bool)

(declare-fun array_inv!17098 (array!44616) Bool)

(assert (=> start!70074 (and (array_inv!17098 _values!788) e!451396)))

(assert (=> start!70074 tp!44199))

(declare-fun b!814352 () Bool)

(declare-fun e!451394 () Bool)

(assert (=> b!814352 (= e!451394 tp_is_empty!14205)))

(declare-fun b!814353 () Bool)

(declare-fun e!451397 () Bool)

(declare-fun mapRes!22888 () Bool)

(assert (=> b!814353 (= e!451396 (and e!451397 mapRes!22888))))

(declare-fun condMapEmpty!22888 () Bool)

(declare-fun mapDefault!22888 () ValueCell!6687)

(assert (=> b!814353 (= condMapEmpty!22888 (= (arr!21368 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6687)) mapDefault!22888)))))

(declare-fun b!814354 () Bool)

(assert (=> b!814354 (= e!451397 tp_is_empty!14205)))

(declare-fun mapIsEmpty!22888 () Bool)

(assert (=> mapIsEmpty!22888 mapRes!22888))

(declare-fun mapNonEmpty!22888 () Bool)

(declare-fun tp!44200 () Bool)

(assert (=> mapNonEmpty!22888 (= mapRes!22888 (and tp!44200 e!451394))))

(declare-fun mapKey!22888 () (_ BitVec 32))

(declare-fun mapRest!22888 () (Array (_ BitVec 32) ValueCell!6687))

(declare-fun mapValue!22888 () ValueCell!6687)

(assert (=> mapNonEmpty!22888 (= (arr!21368 _values!788) (store mapRest!22888 mapKey!22888 mapValue!22888))))

(declare-fun b!814355 () Bool)

(declare-fun res!556228 () Bool)

(assert (=> b!814355 (=> (not res!556228) (not e!451395))))

(declare-datatypes ((List!15203 0))(
  ( (Nil!15200) (Cons!15199 (h!16328 (_ BitVec 64)) (t!21520 List!15203)) )
))
(declare-fun arrayNoDuplicates!0 (array!44614 (_ BitVec 32) List!15203) Bool)

(assert (=> b!814355 (= res!556228 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15200))))

(declare-fun b!814356 () Bool)

(declare-fun res!556230 () Bool)

(assert (=> b!814356 (=> (not res!556230) (not e!451395))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44614 (_ BitVec 32)) Bool)

(assert (=> b!814356 (= res!556230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814357 () Bool)

(assert (=> b!814357 (= e!451395 (not true))))

(declare-datatypes ((tuple2!9370 0))(
  ( (tuple2!9371 (_1!4696 (_ BitVec 64)) (_2!4696 V!23941)) )
))
(declare-datatypes ((List!15204 0))(
  ( (Nil!15201) (Cons!15200 (h!16329 tuple2!9370) (t!21521 List!15204)) )
))
(declare-datatypes ((ListLongMap!8193 0))(
  ( (ListLongMap!8194 (toList!4112 List!15204)) )
))
(declare-fun lt!364581 () ListLongMap!8193)

(declare-fun lt!364580 () ListLongMap!8193)

(assert (=> b!814357 (= lt!364581 lt!364580)))

(declare-datatypes ((Unit!27722 0))(
  ( (Unit!27723) )
))
(declare-fun lt!364579 () Unit!27722)

(declare-fun zeroValueBefore!34 () V!23941)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23941)

(declare-fun minValue!754 () V!23941)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!272 (array!44614 array!44616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23941 V!23941 V!23941 V!23941 (_ BitVec 32) Int) Unit!27722)

(assert (=> b!814357 (= lt!364579 (lemmaNoChangeToArrayThenSameMapNoExtras!272 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2162 (array!44614 array!44616 (_ BitVec 32) (_ BitVec 32) V!23941 V!23941 (_ BitVec 32) Int) ListLongMap!8193)

(assert (=> b!814357 (= lt!364580 (getCurrentListMapNoExtraKeys!2162 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814357 (= lt!364581 (getCurrentListMapNoExtraKeys!2162 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814358 () Bool)

(declare-fun res!556229 () Bool)

(assert (=> b!814358 (=> (not res!556229) (not e!451395))))

(assert (=> b!814358 (= res!556229 (and (= (size!21789 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21788 _keys!976) (size!21789 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70074 res!556227) b!814358))

(assert (= (and b!814358 res!556229) b!814356))

(assert (= (and b!814356 res!556230) b!814355))

(assert (= (and b!814355 res!556228) b!814357))

(assert (= (and b!814353 condMapEmpty!22888) mapIsEmpty!22888))

(assert (= (and b!814353 (not condMapEmpty!22888)) mapNonEmpty!22888))

(get-info :version)

(assert (= (and mapNonEmpty!22888 ((_ is ValueCellFull!6687) mapValue!22888)) b!814352))

(assert (= (and b!814353 ((_ is ValueCellFull!6687) mapDefault!22888)) b!814354))

(assert (= start!70074 b!814353))

(declare-fun m!756179 () Bool)

(assert (=> b!814357 m!756179))

(declare-fun m!756181 () Bool)

(assert (=> b!814357 m!756181))

(declare-fun m!756183 () Bool)

(assert (=> b!814357 m!756183))

(declare-fun m!756185 () Bool)

(assert (=> b!814356 m!756185))

(declare-fun m!756187 () Bool)

(assert (=> mapNonEmpty!22888 m!756187))

(declare-fun m!756189 () Bool)

(assert (=> b!814355 m!756189))

(declare-fun m!756191 () Bool)

(assert (=> start!70074 m!756191))

(declare-fun m!756193 () Bool)

(assert (=> start!70074 m!756193))

(declare-fun m!756195 () Bool)

(assert (=> start!70074 m!756195))

(check-sat (not b!814356) (not b!814355) (not b_next!12495) (not b!814357) (not start!70074) b_and!21267 (not mapNonEmpty!22888) tp_is_empty!14205)
(check-sat b_and!21267 (not b_next!12495))
