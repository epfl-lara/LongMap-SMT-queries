; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42116 () Bool)

(assert start!42116)

(declare-fun b_free!11649 () Bool)

(declare-fun b_next!11649 () Bool)

(assert (=> start!42116 (= b_free!11649 (not b_next!11649))))

(declare-fun tp!40969 () Bool)

(declare-fun b_and!20071 () Bool)

(assert (=> start!42116 (= tp!40969 b_and!20071)))

(declare-fun mapNonEmpty!21316 () Bool)

(declare-fun mapRes!21316 () Bool)

(declare-fun tp!40968 () Bool)

(declare-fun e!275423 () Bool)

(assert (=> mapNonEmpty!21316 (= mapRes!21316 (and tp!40968 e!275423))))

(declare-datatypes ((V!18541 0))(
  ( (V!18542 (val!6583 Int)) )
))
(declare-datatypes ((ValueCell!6195 0))(
  ( (ValueCellFull!6195 (v!8874 V!18541)) (EmptyCell!6195) )
))
(declare-datatypes ((array!29927 0))(
  ( (array!29928 (arr!14387 (Array (_ BitVec 32) ValueCell!6195)) (size!14739 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29927)

(declare-fun mapRest!21316 () (Array (_ BitVec 32) ValueCell!6195))

(declare-fun mapKey!21316 () (_ BitVec 32))

(declare-fun mapValue!21316 () ValueCell!6195)

(assert (=> mapNonEmpty!21316 (= (arr!14387 _values!833) (store mapRest!21316 mapKey!21316 mapValue!21316))))

(declare-fun b!470195 () Bool)

(declare-fun e!275422 () Bool)

(declare-fun e!275424 () Bool)

(assert (=> b!470195 (= e!275422 (and e!275424 mapRes!21316))))

(declare-fun condMapEmpty!21316 () Bool)

(declare-fun mapDefault!21316 () ValueCell!6195)

(assert (=> b!470195 (= condMapEmpty!21316 (= (arr!14387 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6195)) mapDefault!21316)))))

(declare-fun b!470196 () Bool)

(declare-fun tp_is_empty!13077 () Bool)

(assert (=> b!470196 (= e!275424 tp_is_empty!13077)))

(declare-fun b!470197 () Bool)

(assert (=> b!470197 (= e!275423 tp_is_empty!13077)))

(declare-fun b!470198 () Bool)

(declare-fun res!280962 () Bool)

(declare-fun e!275425 () Bool)

(assert (=> b!470198 (=> (not res!280962) (not e!275425))))

(declare-datatypes ((array!29929 0))(
  ( (array!29930 (arr!14388 (Array (_ BitVec 32) (_ BitVec 64))) (size!14740 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29929)

(declare-datatypes ((List!8748 0))(
  ( (Nil!8745) (Cons!8744 (h!9600 (_ BitVec 64)) (t!14710 List!8748)) )
))
(declare-fun arrayNoDuplicates!0 (array!29929 (_ BitVec 32) List!8748) Bool)

(assert (=> b!470198 (= res!280962 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8745))))

(declare-fun res!280960 () Bool)

(assert (=> start!42116 (=> (not res!280960) (not e!275425))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42116 (= res!280960 (validMask!0 mask!1365))))

(assert (=> start!42116 e!275425))

(assert (=> start!42116 tp_is_empty!13077))

(assert (=> start!42116 tp!40969))

(assert (=> start!42116 true))

(declare-fun array_inv!10378 (array!29929) Bool)

(assert (=> start!42116 (array_inv!10378 _keys!1025)))

(declare-fun array_inv!10379 (array!29927) Bool)

(assert (=> start!42116 (and (array_inv!10379 _values!833) e!275422)))

(declare-fun b!470199 () Bool)

(assert (=> b!470199 (= e!275425 (not true))))

(declare-datatypes ((tuple2!8670 0))(
  ( (tuple2!8671 (_1!4346 (_ BitVec 64)) (_2!4346 V!18541)) )
))
(declare-datatypes ((List!8749 0))(
  ( (Nil!8746) (Cons!8745 (h!9601 tuple2!8670) (t!14711 List!8749)) )
))
(declare-datatypes ((ListLongMap!7583 0))(
  ( (ListLongMap!7584 (toList!3807 List!8749)) )
))
(declare-fun lt!213351 () ListLongMap!7583)

(declare-fun lt!213349 () ListLongMap!7583)

(assert (=> b!470199 (= lt!213351 lt!213349)))

(declare-fun minValueBefore!38 () V!18541)

(declare-fun zeroValue!794 () V!18541)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13773 0))(
  ( (Unit!13774) )
))
(declare-fun lt!213350 () Unit!13773)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18541)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!150 (array!29929 array!29927 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18541 V!18541 V!18541 V!18541 (_ BitVec 32) Int) Unit!13773)

(assert (=> b!470199 (= lt!213350 (lemmaNoChangeToArrayThenSameMapNoExtras!150 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1970 (array!29929 array!29927 (_ BitVec 32) (_ BitVec 32) V!18541 V!18541 (_ BitVec 32) Int) ListLongMap!7583)

(assert (=> b!470199 (= lt!213349 (getCurrentListMapNoExtraKeys!1970 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470199 (= lt!213351 (getCurrentListMapNoExtraKeys!1970 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470200 () Bool)

(declare-fun res!280961 () Bool)

(assert (=> b!470200 (=> (not res!280961) (not e!275425))))

(assert (=> b!470200 (= res!280961 (and (= (size!14739 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14740 _keys!1025) (size!14739 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21316 () Bool)

(assert (=> mapIsEmpty!21316 mapRes!21316))

(declare-fun b!470201 () Bool)

(declare-fun res!280959 () Bool)

(assert (=> b!470201 (=> (not res!280959) (not e!275425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29929 (_ BitVec 32)) Bool)

(assert (=> b!470201 (= res!280959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42116 res!280960) b!470200))

(assert (= (and b!470200 res!280961) b!470201))

(assert (= (and b!470201 res!280959) b!470198))

(assert (= (and b!470198 res!280962) b!470199))

(assert (= (and b!470195 condMapEmpty!21316) mapIsEmpty!21316))

(assert (= (and b!470195 (not condMapEmpty!21316)) mapNonEmpty!21316))

(get-info :version)

(assert (= (and mapNonEmpty!21316 ((_ is ValueCellFull!6195) mapValue!21316)) b!470197))

(assert (= (and b!470195 ((_ is ValueCellFull!6195) mapDefault!21316)) b!470196))

(assert (= start!42116 b!470195))

(declare-fun m!452519 () Bool)

(assert (=> b!470201 m!452519))

(declare-fun m!452521 () Bool)

(assert (=> start!42116 m!452521))

(declare-fun m!452523 () Bool)

(assert (=> start!42116 m!452523))

(declare-fun m!452525 () Bool)

(assert (=> start!42116 m!452525))

(declare-fun m!452527 () Bool)

(assert (=> mapNonEmpty!21316 m!452527))

(declare-fun m!452529 () Bool)

(assert (=> b!470198 m!452529))

(declare-fun m!452531 () Bool)

(assert (=> b!470199 m!452531))

(declare-fun m!452533 () Bool)

(assert (=> b!470199 m!452533))

(declare-fun m!452535 () Bool)

(assert (=> b!470199 m!452535))

(check-sat (not start!42116) b_and!20071 (not b_next!11649) (not mapNonEmpty!21316) (not b!470199) tp_is_empty!13077 (not b!470198) (not b!470201))
(check-sat b_and!20071 (not b_next!11649))
