; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41498 () Bool)

(assert start!41498)

(declare-fun b_free!11179 () Bool)

(declare-fun b_next!11179 () Bool)

(assert (=> start!41498 (= b_free!11179 (not b_next!11179))))

(declare-fun tp!39534 () Bool)

(declare-fun b_and!19493 () Bool)

(assert (=> start!41498 (= tp!39534 b_and!19493)))

(declare-fun b!463455 () Bool)

(declare-fun e!270617 () Bool)

(declare-fun e!270614 () Bool)

(declare-fun mapRes!20587 () Bool)

(assert (=> b!463455 (= e!270617 (and e!270614 mapRes!20587))))

(declare-fun condMapEmpty!20587 () Bool)

(declare-datatypes ((V!17915 0))(
  ( (V!17916 (val!6348 Int)) )
))
(declare-datatypes ((ValueCell!5960 0))(
  ( (ValueCellFull!5960 (v!8629 V!17915)) (EmptyCell!5960) )
))
(declare-datatypes ((array!29007 0))(
  ( (array!29008 (arr!13935 (Array (_ BitVec 32) ValueCell!5960)) (size!14288 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29007)

(declare-fun mapDefault!20587 () ValueCell!5960)

(assert (=> b!463455 (= condMapEmpty!20587 (= (arr!13935 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5960)) mapDefault!20587)))))

(declare-fun res!277137 () Bool)

(declare-fun e!270618 () Bool)

(assert (=> start!41498 (=> (not res!277137) (not e!270618))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41498 (= res!277137 (validMask!0 mask!1365))))

(assert (=> start!41498 e!270618))

(declare-fun tp_is_empty!12607 () Bool)

(assert (=> start!41498 tp_is_empty!12607))

(assert (=> start!41498 tp!39534))

(assert (=> start!41498 true))

(declare-datatypes ((array!29009 0))(
  ( (array!29010 (arr!13936 (Array (_ BitVec 32) (_ BitVec 64))) (size!14289 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29009)

(declare-fun array_inv!10142 (array!29009) Bool)

(assert (=> start!41498 (array_inv!10142 _keys!1025)))

(declare-fun array_inv!10143 (array!29007) Bool)

(assert (=> start!41498 (and (array_inv!10143 _values!833) e!270617)))

(declare-fun b!463456 () Bool)

(declare-fun e!270616 () Bool)

(assert (=> b!463456 (= e!270616 tp_is_empty!12607)))

(declare-fun b!463457 () Bool)

(declare-fun res!277138 () Bool)

(assert (=> b!463457 (=> (not res!277138) (not e!270618))))

(declare-datatypes ((List!8432 0))(
  ( (Nil!8429) (Cons!8428 (h!9284 (_ BitVec 64)) (t!14369 List!8432)) )
))
(declare-fun arrayNoDuplicates!0 (array!29009 (_ BitVec 32) List!8432) Bool)

(assert (=> b!463457 (= res!277138 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8429))))

(declare-fun mapIsEmpty!20587 () Bool)

(assert (=> mapIsEmpty!20587 mapRes!20587))

(declare-fun b!463458 () Bool)

(assert (=> b!463458 (= e!270618 false)))

(declare-fun zeroValue!794 () V!17915)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8346 0))(
  ( (tuple2!8347 (_1!4184 (_ BitVec 64)) (_2!4184 V!17915)) )
))
(declare-datatypes ((List!8433 0))(
  ( (Nil!8430) (Cons!8429 (h!9285 tuple2!8346) (t!14370 List!8433)) )
))
(declare-datatypes ((ListLongMap!7249 0))(
  ( (ListLongMap!7250 (toList!3640 List!8433)) )
))
(declare-fun lt!209227 () ListLongMap!7249)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17915)

(declare-fun getCurrentListMapNoExtraKeys!1832 (array!29009 array!29007 (_ BitVec 32) (_ BitVec 32) V!17915 V!17915 (_ BitVec 32) Int) ListLongMap!7249)

(assert (=> b!463458 (= lt!209227 (getCurrentListMapNoExtraKeys!1832 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17915)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!209228 () ListLongMap!7249)

(assert (=> b!463458 (= lt!209228 (getCurrentListMapNoExtraKeys!1832 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20587 () Bool)

(declare-fun tp!39535 () Bool)

(assert (=> mapNonEmpty!20587 (= mapRes!20587 (and tp!39535 e!270616))))

(declare-fun mapRest!20587 () (Array (_ BitVec 32) ValueCell!5960))

(declare-fun mapKey!20587 () (_ BitVec 32))

(declare-fun mapValue!20587 () ValueCell!5960)

(assert (=> mapNonEmpty!20587 (= (arr!13935 _values!833) (store mapRest!20587 mapKey!20587 mapValue!20587))))

(declare-fun b!463459 () Bool)

(declare-fun res!277139 () Bool)

(assert (=> b!463459 (=> (not res!277139) (not e!270618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29009 (_ BitVec 32)) Bool)

(assert (=> b!463459 (= res!277139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463460 () Bool)

(declare-fun res!277136 () Bool)

(assert (=> b!463460 (=> (not res!277136) (not e!270618))))

(assert (=> b!463460 (= res!277136 (and (= (size!14288 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14289 _keys!1025) (size!14288 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463461 () Bool)

(assert (=> b!463461 (= e!270614 tp_is_empty!12607)))

(assert (= (and start!41498 res!277137) b!463460))

(assert (= (and b!463460 res!277136) b!463459))

(assert (= (and b!463459 res!277139) b!463457))

(assert (= (and b!463457 res!277138) b!463458))

(assert (= (and b!463455 condMapEmpty!20587) mapIsEmpty!20587))

(assert (= (and b!463455 (not condMapEmpty!20587)) mapNonEmpty!20587))

(get-info :version)

(assert (= (and mapNonEmpty!20587 ((_ is ValueCellFull!5960) mapValue!20587)) b!463456))

(assert (= (and b!463455 ((_ is ValueCellFull!5960) mapDefault!20587)) b!463461))

(assert (= start!41498 b!463455))

(declare-fun m!445515 () Bool)

(assert (=> b!463459 m!445515))

(declare-fun m!445517 () Bool)

(assert (=> mapNonEmpty!20587 m!445517))

(declare-fun m!445519 () Bool)

(assert (=> b!463458 m!445519))

(declare-fun m!445521 () Bool)

(assert (=> b!463458 m!445521))

(declare-fun m!445523 () Bool)

(assert (=> start!41498 m!445523))

(declare-fun m!445525 () Bool)

(assert (=> start!41498 m!445525))

(declare-fun m!445527 () Bool)

(assert (=> start!41498 m!445527))

(declare-fun m!445529 () Bool)

(assert (=> b!463457 m!445529))

(check-sat (not b!463458) (not start!41498) (not b_next!11179) (not mapNonEmpty!20587) (not b!463459) b_and!19493 tp_is_empty!12607 (not b!463457))
(check-sat b_and!19493 (not b_next!11179))
