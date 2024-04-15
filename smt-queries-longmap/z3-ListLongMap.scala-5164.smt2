; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69938 () Bool)

(assert start!69938)

(declare-fun b_free!12391 () Bool)

(declare-fun b_next!12391 () Bool)

(assert (=> start!69938 (= b_free!12391 (not b_next!12391))))

(declare-fun tp!43884 () Bool)

(declare-fun b_and!21133 () Bool)

(assert (=> start!69938 (= tp!43884 b_and!21133)))

(declare-fun b!812941 () Bool)

(declare-fun res!555472 () Bool)

(declare-fun e!450416 () Bool)

(assert (=> b!812941 (=> (not res!555472) (not e!450416))))

(declare-datatypes ((array!44415 0))(
  ( (array!44416 (arr!21269 (Array (_ BitVec 32) (_ BitVec 64))) (size!21690 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44415)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44415 (_ BitVec 32)) Bool)

(assert (=> b!812941 (= res!555472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!22729 () Bool)

(declare-fun mapRes!22729 () Bool)

(assert (=> mapIsEmpty!22729 mapRes!22729))

(declare-fun b!812942 () Bool)

(declare-fun e!450418 () Bool)

(declare-fun tp_is_empty!14101 () Bool)

(assert (=> b!812942 (= e!450418 tp_is_empty!14101)))

(declare-fun res!555471 () Bool)

(assert (=> start!69938 (=> (not res!555471) (not e!450416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69938 (= res!555471 (validMask!0 mask!1312))))

(assert (=> start!69938 e!450416))

(assert (=> start!69938 tp_is_empty!14101))

(declare-fun array_inv!17115 (array!44415) Bool)

(assert (=> start!69938 (array_inv!17115 _keys!976)))

(assert (=> start!69938 true))

(declare-datatypes ((V!23803 0))(
  ( (V!23804 (val!7098 Int)) )
))
(declare-datatypes ((ValueCell!6635 0))(
  ( (ValueCellFull!6635 (v!9519 V!23803)) (EmptyCell!6635) )
))
(declare-datatypes ((array!44417 0))(
  ( (array!44418 (arr!21270 (Array (_ BitVec 32) ValueCell!6635)) (size!21691 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44417)

(declare-fun e!450420 () Bool)

(declare-fun array_inv!17116 (array!44417) Bool)

(assert (=> start!69938 (and (array_inv!17116 _values!788) e!450420)))

(assert (=> start!69938 tp!43884))

(declare-fun b!812943 () Bool)

(assert (=> b!812943 (= e!450420 (and e!450418 mapRes!22729))))

(declare-fun condMapEmpty!22729 () Bool)

(declare-fun mapDefault!22729 () ValueCell!6635)

(assert (=> b!812943 (= condMapEmpty!22729 (= (arr!21270 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6635)) mapDefault!22729)))))

(declare-fun b!812944 () Bool)

(declare-fun res!555470 () Bool)

(assert (=> b!812944 (=> (not res!555470) (not e!450416))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812944 (= res!555470 (and (= (size!21691 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21690 _keys!976) (size!21691 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812945 () Bool)

(declare-fun e!450417 () Bool)

(assert (=> b!812945 (= e!450417 tp_is_empty!14101)))

(declare-fun b!812946 () Bool)

(declare-fun res!555473 () Bool)

(assert (=> b!812946 (=> (not res!555473) (not e!450416))))

(declare-datatypes ((List!15167 0))(
  ( (Nil!15164) (Cons!15163 (h!16292 (_ BitVec 64)) (t!21473 List!15167)) )
))
(declare-fun arrayNoDuplicates!0 (array!44415 (_ BitVec 32) List!15167) Bool)

(assert (=> b!812946 (= res!555473 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15164))))

(declare-fun mapNonEmpty!22729 () Bool)

(declare-fun tp!43885 () Bool)

(assert (=> mapNonEmpty!22729 (= mapRes!22729 (and tp!43885 e!450417))))

(declare-fun mapRest!22729 () (Array (_ BitVec 32) ValueCell!6635))

(declare-fun mapValue!22729 () ValueCell!6635)

(declare-fun mapKey!22729 () (_ BitVec 32))

(assert (=> mapNonEmpty!22729 (= (arr!21270 _values!788) (store mapRest!22729 mapKey!22729 mapValue!22729))))

(declare-fun b!812947 () Bool)

(assert (=> b!812947 (= e!450416 false)))

(declare-fun zeroValueBefore!34 () V!23803)

(declare-datatypes ((tuple2!9344 0))(
  ( (tuple2!9345 (_1!4683 (_ BitVec 64)) (_2!4683 V!23803)) )
))
(declare-datatypes ((List!15168 0))(
  ( (Nil!15165) (Cons!15164 (h!16293 tuple2!9344) (t!21474 List!15168)) )
))
(declare-datatypes ((ListLongMap!8157 0))(
  ( (ListLongMap!8158 (toList!4094 List!15168)) )
))
(declare-fun lt!364005 () ListLongMap!8157)

(declare-fun minValue!754 () V!23803)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2159 (array!44415 array!44417 (_ BitVec 32) (_ BitVec 32) V!23803 V!23803 (_ BitVec 32) Int) ListLongMap!8157)

(assert (=> b!812947 (= lt!364005 (getCurrentListMapNoExtraKeys!2159 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!69938 res!555471) b!812944))

(assert (= (and b!812944 res!555470) b!812941))

(assert (= (and b!812941 res!555472) b!812946))

(assert (= (and b!812946 res!555473) b!812947))

(assert (= (and b!812943 condMapEmpty!22729) mapIsEmpty!22729))

(assert (= (and b!812943 (not condMapEmpty!22729)) mapNonEmpty!22729))

(get-info :version)

(assert (= (and mapNonEmpty!22729 ((_ is ValueCellFull!6635) mapValue!22729)) b!812945))

(assert (= (and b!812943 ((_ is ValueCellFull!6635) mapDefault!22729)) b!812942))

(assert (= start!69938 b!812943))

(declare-fun m!754561 () Bool)

(assert (=> mapNonEmpty!22729 m!754561))

(declare-fun m!754563 () Bool)

(assert (=> b!812946 m!754563))

(declare-fun m!754565 () Bool)

(assert (=> b!812941 m!754565))

(declare-fun m!754567 () Bool)

(assert (=> start!69938 m!754567))

(declare-fun m!754569 () Bool)

(assert (=> start!69938 m!754569))

(declare-fun m!754571 () Bool)

(assert (=> start!69938 m!754571))

(declare-fun m!754573 () Bool)

(assert (=> b!812947 m!754573))

(check-sat (not b!812941) (not b!812947) tp_is_empty!14101 (not start!69938) (not mapNonEmpty!22729) (not b_next!12391) (not b!812946) b_and!21133)
(check-sat b_and!21133 (not b_next!12391))
