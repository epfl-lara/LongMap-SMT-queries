; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41498 () Bool)

(assert start!41498)

(declare-fun b_free!11179 () Bool)

(declare-fun b_next!11179 () Bool)

(assert (=> start!41498 (= b_free!11179 (not b_next!11179))))

(declare-fun tp!39534 () Bool)

(declare-fun b_and!19529 () Bool)

(assert (=> start!41498 (= tp!39534 b_and!19529)))

(declare-fun b!463665 () Bool)

(declare-fun e!270749 () Bool)

(declare-fun tp_is_empty!12607 () Bool)

(assert (=> b!463665 (= e!270749 tp_is_empty!12607)))

(declare-fun mapIsEmpty!20587 () Bool)

(declare-fun mapRes!20587 () Bool)

(assert (=> mapIsEmpty!20587 mapRes!20587))

(declare-fun b!463666 () Bool)

(declare-fun e!270751 () Bool)

(assert (=> b!463666 (= e!270751 (and e!270749 mapRes!20587))))

(declare-fun condMapEmpty!20587 () Bool)

(declare-datatypes ((V!17915 0))(
  ( (V!17916 (val!6348 Int)) )
))
(declare-datatypes ((ValueCell!5960 0))(
  ( (ValueCellFull!5960 (v!8636 V!17915)) (EmptyCell!5960) )
))
(declare-datatypes ((array!29008 0))(
  ( (array!29009 (arr!13935 (Array (_ BitVec 32) ValueCell!5960)) (size!14287 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29008)

(declare-fun mapDefault!20587 () ValueCell!5960)

(assert (=> b!463666 (= condMapEmpty!20587 (= (arr!13935 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5960)) mapDefault!20587)))))

(declare-fun b!463667 () Bool)

(declare-fun e!270753 () Bool)

(assert (=> b!463667 (= e!270753 false)))

(declare-fun zeroValue!794 () V!17915)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29010 0))(
  ( (array!29011 (arr!13936 (Array (_ BitVec 32) (_ BitVec 64))) (size!14288 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29010)

(declare-fun minValueAfter!38 () V!17915)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8258 0))(
  ( (tuple2!8259 (_1!4140 (_ BitVec 64)) (_2!4140 V!17915)) )
))
(declare-datatypes ((List!8339 0))(
  ( (Nil!8336) (Cons!8335 (h!9191 tuple2!8258) (t!14277 List!8339)) )
))
(declare-datatypes ((ListLongMap!7173 0))(
  ( (ListLongMap!7174 (toList!3602 List!8339)) )
))
(declare-fun lt!209473 () ListLongMap!7173)

(declare-fun getCurrentListMapNoExtraKeys!1829 (array!29010 array!29008 (_ BitVec 32) (_ BitVec 32) V!17915 V!17915 (_ BitVec 32) Int) ListLongMap!7173)

(assert (=> b!463667 (= lt!209473 (getCurrentListMapNoExtraKeys!1829 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17915)

(declare-fun lt!209474 () ListLongMap!7173)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463667 (= lt!209474 (getCurrentListMapNoExtraKeys!1829 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20587 () Bool)

(declare-fun tp!39535 () Bool)

(declare-fun e!270750 () Bool)

(assert (=> mapNonEmpty!20587 (= mapRes!20587 (and tp!39535 e!270750))))

(declare-fun mapValue!20587 () ValueCell!5960)

(declare-fun mapKey!20587 () (_ BitVec 32))

(declare-fun mapRest!20587 () (Array (_ BitVec 32) ValueCell!5960))

(assert (=> mapNonEmpty!20587 (= (arr!13935 _values!833) (store mapRest!20587 mapKey!20587 mapValue!20587))))

(declare-fun b!463668 () Bool)

(assert (=> b!463668 (= e!270750 tp_is_empty!12607)))

(declare-fun b!463669 () Bool)

(declare-fun res!277259 () Bool)

(assert (=> b!463669 (=> (not res!277259) (not e!270753))))

(assert (=> b!463669 (= res!277259 (and (= (size!14287 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14288 _keys!1025) (size!14287 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!277260 () Bool)

(assert (=> start!41498 (=> (not res!277260) (not e!270753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41498 (= res!277260 (validMask!0 mask!1365))))

(assert (=> start!41498 e!270753))

(assert (=> start!41498 tp_is_empty!12607))

(assert (=> start!41498 tp!39534))

(assert (=> start!41498 true))

(declare-fun array_inv!10154 (array!29010) Bool)

(assert (=> start!41498 (array_inv!10154 _keys!1025)))

(declare-fun array_inv!10155 (array!29008) Bool)

(assert (=> start!41498 (and (array_inv!10155 _values!833) e!270751)))

(declare-fun b!463670 () Bool)

(declare-fun res!277258 () Bool)

(assert (=> b!463670 (=> (not res!277258) (not e!270753))))

(declare-datatypes ((List!8340 0))(
  ( (Nil!8337) (Cons!8336 (h!9192 (_ BitVec 64)) (t!14278 List!8340)) )
))
(declare-fun arrayNoDuplicates!0 (array!29010 (_ BitVec 32) List!8340) Bool)

(assert (=> b!463670 (= res!277258 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8337))))

(declare-fun b!463671 () Bool)

(declare-fun res!277261 () Bool)

(assert (=> b!463671 (=> (not res!277261) (not e!270753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29010 (_ BitVec 32)) Bool)

(assert (=> b!463671 (= res!277261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41498 res!277260) b!463669))

(assert (= (and b!463669 res!277259) b!463671))

(assert (= (and b!463671 res!277261) b!463670))

(assert (= (and b!463670 res!277258) b!463667))

(assert (= (and b!463666 condMapEmpty!20587) mapIsEmpty!20587))

(assert (= (and b!463666 (not condMapEmpty!20587)) mapNonEmpty!20587))

(get-info :version)

(assert (= (and mapNonEmpty!20587 ((_ is ValueCellFull!5960) mapValue!20587)) b!463668))

(assert (= (and b!463666 ((_ is ValueCellFull!5960) mapDefault!20587)) b!463665))

(assert (= start!41498 b!463666))

(declare-fun m!446431 () Bool)

(assert (=> mapNonEmpty!20587 m!446431))

(declare-fun m!446433 () Bool)

(assert (=> start!41498 m!446433))

(declare-fun m!446435 () Bool)

(assert (=> start!41498 m!446435))

(declare-fun m!446437 () Bool)

(assert (=> start!41498 m!446437))

(declare-fun m!446439 () Bool)

(assert (=> b!463667 m!446439))

(declare-fun m!446441 () Bool)

(assert (=> b!463667 m!446441))

(declare-fun m!446443 () Bool)

(assert (=> b!463670 m!446443))

(declare-fun m!446445 () Bool)

(assert (=> b!463671 m!446445))

(check-sat b_and!19529 (not b!463671) (not mapNonEmpty!20587) (not b!463670) tp_is_empty!12607 (not b!463667) (not start!41498) (not b_next!11179))
(check-sat b_and!19529 (not b_next!11179))
