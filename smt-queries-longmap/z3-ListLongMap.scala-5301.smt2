; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71176 () Bool)

(assert start!71176)

(declare-fun b_free!13213 () Bool)

(declare-fun b_next!13213 () Bool)

(assert (=> start!71176 (= b_free!13213 (not b_next!13213))))

(declare-fun tp!46392 () Bool)

(declare-fun b_and!22127 () Bool)

(assert (=> start!71176 (= tp!46392 b_and!22127)))

(declare-fun b!825490 () Bool)

(declare-fun e!459380 () Bool)

(declare-fun e!459381 () Bool)

(assert (=> b!825490 (= e!459380 (not e!459381))))

(declare-fun res!562526 () Bool)

(assert (=> b!825490 (=> res!562526 e!459381)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!825490 (= res!562526 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24899 0))(
  ( (V!24900 (val!7509 Int)) )
))
(declare-datatypes ((tuple2!9862 0))(
  ( (tuple2!9863 (_1!4942 (_ BitVec 64)) (_2!4942 V!24899)) )
))
(declare-datatypes ((List!15645 0))(
  ( (Nil!15642) (Cons!15641 (h!16776 tuple2!9862) (t!21980 List!15645)) )
))
(declare-datatypes ((ListLongMap!8687 0))(
  ( (ListLongMap!8688 (toList!4359 List!15645)) )
))
(declare-fun lt!372260 () ListLongMap!8687)

(declare-fun lt!372258 () ListLongMap!8687)

(assert (=> b!825490 (= lt!372260 lt!372258)))

(declare-fun zeroValueBefore!34 () V!24899)

(declare-datatypes ((array!46039 0))(
  ( (array!46040 (arr!22062 (Array (_ BitVec 32) (_ BitVec 64))) (size!22482 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46039)

(declare-fun zeroValueAfter!34 () V!24899)

(declare-fun minValue!754 () V!24899)

(declare-datatypes ((ValueCell!7046 0))(
  ( (ValueCellFull!7046 (v!9942 V!24899)) (EmptyCell!7046) )
))
(declare-datatypes ((array!46041 0))(
  ( (array!46042 (arr!22063 (Array (_ BitVec 32) ValueCell!7046)) (size!22483 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46041)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28269 0))(
  ( (Unit!28270) )
))
(declare-fun lt!372257 () Unit!28269)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!529 (array!46039 array!46041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24899 V!24899 V!24899 V!24899 (_ BitVec 32) Int) Unit!28269)

(assert (=> b!825490 (= lt!372257 (lemmaNoChangeToArrayThenSameMapNoExtras!529 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2441 (array!46039 array!46041 (_ BitVec 32) (_ BitVec 32) V!24899 V!24899 (_ BitVec 32) Int) ListLongMap!8687)

(assert (=> b!825490 (= lt!372258 (getCurrentListMapNoExtraKeys!2441 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825490 (= lt!372260 (getCurrentListMapNoExtraKeys!2441 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825491 () Bool)

(declare-fun res!562527 () Bool)

(assert (=> b!825491 (=> (not res!562527) (not e!459380))))

(declare-datatypes ((List!15646 0))(
  ( (Nil!15643) (Cons!15642 (h!16777 (_ BitVec 64)) (t!21981 List!15646)) )
))
(declare-fun arrayNoDuplicates!0 (array!46039 (_ BitVec 32) List!15646) Bool)

(assert (=> b!825491 (= res!562527 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15643))))

(declare-fun mapNonEmpty!24004 () Bool)

(declare-fun mapRes!24004 () Bool)

(declare-fun tp!46393 () Bool)

(declare-fun e!459384 () Bool)

(assert (=> mapNonEmpty!24004 (= mapRes!24004 (and tp!46393 e!459384))))

(declare-fun mapValue!24004 () ValueCell!7046)

(declare-fun mapRest!24004 () (Array (_ BitVec 32) ValueCell!7046))

(declare-fun mapKey!24004 () (_ BitVec 32))

(assert (=> mapNonEmpty!24004 (= (arr!22063 _values!788) (store mapRest!24004 mapKey!24004 mapValue!24004))))

(declare-fun mapIsEmpty!24004 () Bool)

(assert (=> mapIsEmpty!24004 mapRes!24004))

(declare-fun b!825492 () Bool)

(declare-fun e!459382 () Bool)

(declare-fun tp_is_empty!14923 () Bool)

(assert (=> b!825492 (= e!459382 tp_is_empty!14923)))

(declare-fun b!825493 () Bool)

(declare-fun res!562525 () Bool)

(assert (=> b!825493 (=> (not res!562525) (not e!459380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46039 (_ BitVec 32)) Bool)

(assert (=> b!825493 (= res!562525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!562528 () Bool)

(assert (=> start!71176 (=> (not res!562528) (not e!459380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71176 (= res!562528 (validMask!0 mask!1312))))

(assert (=> start!71176 e!459380))

(assert (=> start!71176 tp_is_empty!14923))

(declare-fun array_inv!17639 (array!46039) Bool)

(assert (=> start!71176 (array_inv!17639 _keys!976)))

(assert (=> start!71176 true))

(declare-fun e!459385 () Bool)

(declare-fun array_inv!17640 (array!46041) Bool)

(assert (=> start!71176 (and (array_inv!17640 _values!788) e!459385)))

(assert (=> start!71176 tp!46392))

(declare-fun b!825494 () Bool)

(assert (=> b!825494 (= e!459384 tp_is_empty!14923)))

(declare-fun b!825495 () Bool)

(declare-fun res!562524 () Bool)

(assert (=> b!825495 (=> (not res!562524) (not e!459380))))

(assert (=> b!825495 (= res!562524 (and (= (size!22483 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22482 _keys!976) (size!22483 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825496 () Bool)

(assert (=> b!825496 (= e!459385 (and e!459382 mapRes!24004))))

(declare-fun condMapEmpty!24004 () Bool)

(declare-fun mapDefault!24004 () ValueCell!7046)

(assert (=> b!825496 (= condMapEmpty!24004 (= (arr!22063 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7046)) mapDefault!24004)))))

(declare-fun b!825497 () Bool)

(assert (=> b!825497 (= e!459381 true)))

(declare-fun lt!372259 () ListLongMap!8687)

(declare-fun getCurrentListMap!2486 (array!46039 array!46041 (_ BitVec 32) (_ BitVec 32) V!24899 V!24899 (_ BitVec 32) Int) ListLongMap!8687)

(assert (=> b!825497 (= lt!372259 (getCurrentListMap!2486 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71176 res!562528) b!825495))

(assert (= (and b!825495 res!562524) b!825493))

(assert (= (and b!825493 res!562525) b!825491))

(assert (= (and b!825491 res!562527) b!825490))

(assert (= (and b!825490 (not res!562526)) b!825497))

(assert (= (and b!825496 condMapEmpty!24004) mapIsEmpty!24004))

(assert (= (and b!825496 (not condMapEmpty!24004)) mapNonEmpty!24004))

(get-info :version)

(assert (= (and mapNonEmpty!24004 ((_ is ValueCellFull!7046) mapValue!24004)) b!825494))

(assert (= (and b!825496 ((_ is ValueCellFull!7046) mapDefault!24004)) b!825492))

(assert (= start!71176 b!825496))

(declare-fun m!767939 () Bool)

(assert (=> b!825497 m!767939))

(declare-fun m!767941 () Bool)

(assert (=> mapNonEmpty!24004 m!767941))

(declare-fun m!767943 () Bool)

(assert (=> start!71176 m!767943))

(declare-fun m!767945 () Bool)

(assert (=> start!71176 m!767945))

(declare-fun m!767947 () Bool)

(assert (=> start!71176 m!767947))

(declare-fun m!767949 () Bool)

(assert (=> b!825490 m!767949))

(declare-fun m!767951 () Bool)

(assert (=> b!825490 m!767951))

(declare-fun m!767953 () Bool)

(assert (=> b!825490 m!767953))

(declare-fun m!767955 () Bool)

(assert (=> b!825491 m!767955))

(declare-fun m!767957 () Bool)

(assert (=> b!825493 m!767957))

(check-sat (not b!825491) (not b!825490) (not b!825497) tp_is_empty!14923 (not b_next!13213) (not start!71176) (not mapNonEmpty!24004) b_and!22127 (not b!825493))
(check-sat b_and!22127 (not b_next!13213))
