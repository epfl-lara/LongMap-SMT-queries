; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41516 () Bool)

(assert start!41516)

(declare-fun b_free!11197 () Bool)

(declare-fun b_next!11197 () Bool)

(assert (=> start!41516 (= b_free!11197 (not b_next!11197))))

(declare-fun tp!39589 () Bool)

(declare-fun b_and!19547 () Bool)

(assert (=> start!41516 (= tp!39589 b_and!19547)))

(declare-fun res!277366 () Bool)

(declare-fun e!270887 () Bool)

(assert (=> start!41516 (=> (not res!277366) (not e!270887))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41516 (= res!277366 (validMask!0 mask!1365))))

(assert (=> start!41516 e!270887))

(declare-fun tp_is_empty!12625 () Bool)

(assert (=> start!41516 tp_is_empty!12625))

(assert (=> start!41516 tp!39589))

(assert (=> start!41516 true))

(declare-datatypes ((array!29044 0))(
  ( (array!29045 (arr!13953 (Array (_ BitVec 32) (_ BitVec 64))) (size!14305 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29044)

(declare-fun array_inv!10164 (array!29044) Bool)

(assert (=> start!41516 (array_inv!10164 _keys!1025)))

(declare-datatypes ((V!17939 0))(
  ( (V!17940 (val!6357 Int)) )
))
(declare-datatypes ((ValueCell!5969 0))(
  ( (ValueCellFull!5969 (v!8645 V!17939)) (EmptyCell!5969) )
))
(declare-datatypes ((array!29046 0))(
  ( (array!29047 (arr!13954 (Array (_ BitVec 32) ValueCell!5969)) (size!14306 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29046)

(declare-fun e!270884 () Bool)

(declare-fun array_inv!10165 (array!29046) Bool)

(assert (=> start!41516 (and (array_inv!10165 _values!833) e!270884)))

(declare-fun mapNonEmpty!20614 () Bool)

(declare-fun mapRes!20614 () Bool)

(declare-fun tp!39588 () Bool)

(declare-fun e!270885 () Bool)

(assert (=> mapNonEmpty!20614 (= mapRes!20614 (and tp!39588 e!270885))))

(declare-fun mapKey!20614 () (_ BitVec 32))

(declare-fun mapValue!20614 () ValueCell!5969)

(declare-fun mapRest!20614 () (Array (_ BitVec 32) ValueCell!5969))

(assert (=> mapNonEmpty!20614 (= (arr!13954 _values!833) (store mapRest!20614 mapKey!20614 mapValue!20614))))

(declare-fun b!463854 () Bool)

(assert (=> b!463854 (= e!270885 tp_is_empty!12625)))

(declare-fun b!463855 () Bool)

(declare-fun res!277367 () Bool)

(assert (=> b!463855 (=> (not res!277367) (not e!270887))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29044 (_ BitVec 32)) Bool)

(assert (=> b!463855 (= res!277367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463856 () Bool)

(assert (=> b!463856 (= e!270887 false)))

(declare-fun zeroValue!794 () V!17939)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8274 0))(
  ( (tuple2!8275 (_1!4148 (_ BitVec 64)) (_2!4148 V!17939)) )
))
(declare-datatypes ((List!8353 0))(
  ( (Nil!8350) (Cons!8349 (h!9205 tuple2!8274) (t!14291 List!8353)) )
))
(declare-datatypes ((ListLongMap!7189 0))(
  ( (ListLongMap!7190 (toList!3610 List!8353)) )
))
(declare-fun lt!209528 () ListLongMap!7189)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!17939)

(declare-fun getCurrentListMapNoExtraKeys!1837 (array!29044 array!29046 (_ BitVec 32) (_ BitVec 32) V!17939 V!17939 (_ BitVec 32) Int) ListLongMap!7189)

(assert (=> b!463856 (= lt!209528 (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17939)

(declare-fun lt!209527 () ListLongMap!7189)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463856 (= lt!209527 (getCurrentListMapNoExtraKeys!1837 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20614 () Bool)

(assert (=> mapIsEmpty!20614 mapRes!20614))

(declare-fun b!463857 () Bool)

(declare-fun res!277369 () Bool)

(assert (=> b!463857 (=> (not res!277369) (not e!270887))))

(declare-datatypes ((List!8354 0))(
  ( (Nil!8351) (Cons!8350 (h!9206 (_ BitVec 64)) (t!14292 List!8354)) )
))
(declare-fun arrayNoDuplicates!0 (array!29044 (_ BitVec 32) List!8354) Bool)

(assert (=> b!463857 (= res!277369 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8351))))

(declare-fun b!463858 () Bool)

(declare-fun e!270888 () Bool)

(assert (=> b!463858 (= e!270888 tp_is_empty!12625)))

(declare-fun b!463859 () Bool)

(assert (=> b!463859 (= e!270884 (and e!270888 mapRes!20614))))

(declare-fun condMapEmpty!20614 () Bool)

(declare-fun mapDefault!20614 () ValueCell!5969)

(assert (=> b!463859 (= condMapEmpty!20614 (= (arr!13954 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5969)) mapDefault!20614)))))

(declare-fun b!463860 () Bool)

(declare-fun res!277368 () Bool)

(assert (=> b!463860 (=> (not res!277368) (not e!270887))))

(assert (=> b!463860 (= res!277368 (and (= (size!14306 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14305 _keys!1025) (size!14306 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41516 res!277366) b!463860))

(assert (= (and b!463860 res!277368) b!463855))

(assert (= (and b!463855 res!277367) b!463857))

(assert (= (and b!463857 res!277369) b!463856))

(assert (= (and b!463859 condMapEmpty!20614) mapIsEmpty!20614))

(assert (= (and b!463859 (not condMapEmpty!20614)) mapNonEmpty!20614))

(get-info :version)

(assert (= (and mapNonEmpty!20614 ((_ is ValueCellFull!5969) mapValue!20614)) b!463854))

(assert (= (and b!463859 ((_ is ValueCellFull!5969) mapDefault!20614)) b!463858))

(assert (= start!41516 b!463859))

(declare-fun m!446575 () Bool)

(assert (=> b!463855 m!446575))

(declare-fun m!446577 () Bool)

(assert (=> b!463857 m!446577))

(declare-fun m!446579 () Bool)

(assert (=> mapNonEmpty!20614 m!446579))

(declare-fun m!446581 () Bool)

(assert (=> b!463856 m!446581))

(declare-fun m!446583 () Bool)

(assert (=> b!463856 m!446583))

(declare-fun m!446585 () Bool)

(assert (=> start!41516 m!446585))

(declare-fun m!446587 () Bool)

(assert (=> start!41516 m!446587))

(declare-fun m!446589 () Bool)

(assert (=> start!41516 m!446589))

(check-sat b_and!19547 (not start!41516) tp_is_empty!12625 (not b!463856) (not b!463857) (not b_next!11197) (not b!463855) (not mapNonEmpty!20614))
(check-sat b_and!19547 (not b_next!11197))
