; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70244 () Bool)

(assert start!70244)

(declare-fun b_free!12499 () Bool)

(declare-fun b_next!12499 () Bool)

(assert (=> start!70244 (= b_free!12499 (not b_next!12499))))

(declare-fun tp!44211 () Bool)

(declare-fun b_and!21281 () Bool)

(assert (=> start!70244 (= tp!44211 b_and!21281)))

(declare-fun b!815288 () Bool)

(declare-fun e!452002 () Bool)

(declare-fun e!452004 () Bool)

(declare-fun mapRes!22894 () Bool)

(assert (=> b!815288 (= e!452002 (and e!452004 mapRes!22894))))

(declare-fun condMapEmpty!22894 () Bool)

(declare-datatypes ((V!23947 0))(
  ( (V!23948 (val!7152 Int)) )
))
(declare-datatypes ((ValueCell!6689 0))(
  ( (ValueCellFull!6689 (v!9579 V!23947)) (EmptyCell!6689) )
))
(declare-datatypes ((array!44621 0))(
  ( (array!44622 (arr!21366 (Array (_ BitVec 32) ValueCell!6689)) (size!21786 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44621)

(declare-fun mapDefault!22894 () ValueCell!6689)

(assert (=> b!815288 (= condMapEmpty!22894 (= (arr!21366 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6689)) mapDefault!22894)))))

(declare-fun b!815289 () Bool)

(declare-fun e!452003 () Bool)

(declare-fun tp_is_empty!14209 () Bool)

(assert (=> b!815289 (= e!452003 tp_is_empty!14209)))

(declare-fun b!815290 () Bool)

(declare-fun res!556599 () Bool)

(declare-fun e!452005 () Bool)

(assert (=> b!815290 (=> (not res!556599) (not e!452005))))

(declare-datatypes ((array!44623 0))(
  ( (array!44624 (arr!21367 (Array (_ BitVec 32) (_ BitVec 64))) (size!21787 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44623)

(declare-datatypes ((List!15108 0))(
  ( (Nil!15105) (Cons!15104 (h!16239 (_ BitVec 64)) (t!21417 List!15108)) )
))
(declare-fun arrayNoDuplicates!0 (array!44623 (_ BitVec 32) List!15108) Bool)

(assert (=> b!815290 (= res!556599 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15105))))

(declare-fun res!556598 () Bool)

(assert (=> start!70244 (=> (not res!556598) (not e!452005))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70244 (= res!556598 (validMask!0 mask!1312))))

(assert (=> start!70244 e!452005))

(assert (=> start!70244 tp_is_empty!14209))

(declare-fun array_inv!17151 (array!44623) Bool)

(assert (=> start!70244 (array_inv!17151 _keys!976)))

(assert (=> start!70244 true))

(declare-fun array_inv!17152 (array!44621) Bool)

(assert (=> start!70244 (and (array_inv!17152 _values!788) e!452002)))

(assert (=> start!70244 tp!44211))

(declare-fun mapNonEmpty!22894 () Bool)

(declare-fun tp!44212 () Bool)

(assert (=> mapNonEmpty!22894 (= mapRes!22894 (and tp!44212 e!452003))))

(declare-fun mapRest!22894 () (Array (_ BitVec 32) ValueCell!6689))

(declare-fun mapKey!22894 () (_ BitVec 32))

(declare-fun mapValue!22894 () ValueCell!6689)

(assert (=> mapNonEmpty!22894 (= (arr!21366 _values!788) (store mapRest!22894 mapKey!22894 mapValue!22894))))

(declare-fun b!815291 () Bool)

(assert (=> b!815291 (= e!452004 tp_is_empty!14209)))

(declare-fun b!815292 () Bool)

(assert (=> b!815292 (= e!452005 (not true))))

(declare-datatypes ((tuple2!9290 0))(
  ( (tuple2!9291 (_1!4656 (_ BitVec 64)) (_2!4656 V!23947)) )
))
(declare-datatypes ((List!15109 0))(
  ( (Nil!15106) (Cons!15105 (h!16240 tuple2!9290) (t!21418 List!15109)) )
))
(declare-datatypes ((ListLongMap!8115 0))(
  ( (ListLongMap!8116 (toList!4073 List!15109)) )
))
(declare-fun lt!364952 () ListLongMap!8115)

(declare-fun lt!364951 () ListLongMap!8115)

(assert (=> b!815292 (= lt!364952 lt!364951)))

(declare-fun zeroValueBefore!34 () V!23947)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23947)

(declare-fun minValue!754 () V!23947)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27713 0))(
  ( (Unit!27714) )
))
(declare-fun lt!364953 () Unit!27713)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!268 (array!44623 array!44621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23947 V!23947 V!23947 V!23947 (_ BitVec 32) Int) Unit!27713)

(assert (=> b!815292 (= lt!364953 (lemmaNoChangeToArrayThenSameMapNoExtras!268 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2180 (array!44623 array!44621 (_ BitVec 32) (_ BitVec 32) V!23947 V!23947 (_ BitVec 32) Int) ListLongMap!8115)

(assert (=> b!815292 (= lt!364951 (getCurrentListMapNoExtraKeys!2180 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815292 (= lt!364952 (getCurrentListMapNoExtraKeys!2180 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815293 () Bool)

(declare-fun res!556597 () Bool)

(assert (=> b!815293 (=> (not res!556597) (not e!452005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44623 (_ BitVec 32)) Bool)

(assert (=> b!815293 (= res!556597 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815294 () Bool)

(declare-fun res!556600 () Bool)

(assert (=> b!815294 (=> (not res!556600) (not e!452005))))

(assert (=> b!815294 (= res!556600 (and (= (size!21786 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21787 _keys!976) (size!21786 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22894 () Bool)

(assert (=> mapIsEmpty!22894 mapRes!22894))

(assert (= (and start!70244 res!556598) b!815294))

(assert (= (and b!815294 res!556600) b!815293))

(assert (= (and b!815293 res!556597) b!815290))

(assert (= (and b!815290 res!556599) b!815292))

(assert (= (and b!815288 condMapEmpty!22894) mapIsEmpty!22894))

(assert (= (and b!815288 (not condMapEmpty!22894)) mapNonEmpty!22894))

(get-info :version)

(assert (= (and mapNonEmpty!22894 ((_ is ValueCellFull!6689) mapValue!22894)) b!815289))

(assert (= (and b!815288 ((_ is ValueCellFull!6689) mapDefault!22894)) b!815291))

(assert (= start!70244 b!815288))

(declare-fun m!757497 () Bool)

(assert (=> b!815292 m!757497))

(declare-fun m!757499 () Bool)

(assert (=> b!815292 m!757499))

(declare-fun m!757501 () Bool)

(assert (=> b!815292 m!757501))

(declare-fun m!757503 () Bool)

(assert (=> mapNonEmpty!22894 m!757503))

(declare-fun m!757505 () Bool)

(assert (=> start!70244 m!757505))

(declare-fun m!757507 () Bool)

(assert (=> start!70244 m!757507))

(declare-fun m!757509 () Bool)

(assert (=> start!70244 m!757509))

(declare-fun m!757511 () Bool)

(assert (=> b!815290 m!757511))

(declare-fun m!757513 () Bool)

(assert (=> b!815293 m!757513))

(check-sat (not b!815292) (not b_next!12499) (not start!70244) (not b!815293) tp_is_empty!14209 b_and!21281 (not mapNonEmpty!22894) (not b!815290))
(check-sat b_and!21281 (not b_next!12499))
