; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69920 () Bool)

(assert start!69920)

(declare-fun b_free!12373 () Bool)

(declare-fun b_next!12373 () Bool)

(assert (=> start!69920 (= b_free!12373 (not b_next!12373))))

(declare-fun tp!43831 () Bool)

(declare-fun b_and!21115 () Bool)

(assert (=> start!69920 (= tp!43831 b_and!21115)))

(declare-fun b!812752 () Bool)

(declare-fun res!555364 () Bool)

(declare-fun e!450283 () Bool)

(assert (=> b!812752 (=> (not res!555364) (not e!450283))))

(declare-datatypes ((array!44385 0))(
  ( (array!44386 (arr!21254 (Array (_ BitVec 32) (_ BitVec 64))) (size!21675 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44385)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23779 0))(
  ( (V!23780 (val!7089 Int)) )
))
(declare-datatypes ((ValueCell!6626 0))(
  ( (ValueCellFull!6626 (v!9510 V!23779)) (EmptyCell!6626) )
))
(declare-datatypes ((array!44387 0))(
  ( (array!44388 (arr!21255 (Array (_ BitVec 32) ValueCell!6626)) (size!21676 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44387)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812752 (= res!555364 (and (= (size!21676 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21675 _keys!976) (size!21676 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22702 () Bool)

(declare-fun mapRes!22702 () Bool)

(declare-fun tp!43830 () Bool)

(declare-fun e!450285 () Bool)

(assert (=> mapNonEmpty!22702 (= mapRes!22702 (and tp!43830 e!450285))))

(declare-fun mapKey!22702 () (_ BitVec 32))

(declare-fun mapValue!22702 () ValueCell!6626)

(declare-fun mapRest!22702 () (Array (_ BitVec 32) ValueCell!6626))

(assert (=> mapNonEmpty!22702 (= (arr!21255 _values!788) (store mapRest!22702 mapKey!22702 mapValue!22702))))

(declare-fun res!555363 () Bool)

(assert (=> start!69920 (=> (not res!555363) (not e!450283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69920 (= res!555363 (validMask!0 mask!1312))))

(assert (=> start!69920 e!450283))

(declare-fun tp_is_empty!14083 () Bool)

(assert (=> start!69920 tp_is_empty!14083))

(declare-fun array_inv!17105 (array!44385) Bool)

(assert (=> start!69920 (array_inv!17105 _keys!976)))

(assert (=> start!69920 true))

(declare-fun e!450282 () Bool)

(declare-fun array_inv!17106 (array!44387) Bool)

(assert (=> start!69920 (and (array_inv!17106 _values!788) e!450282)))

(assert (=> start!69920 tp!43831))

(declare-fun b!812753 () Bool)

(declare-fun e!450284 () Bool)

(assert (=> b!812753 (= e!450284 tp_is_empty!14083)))

(declare-fun b!812754 () Bool)

(declare-fun res!555365 () Bool)

(assert (=> b!812754 (=> (not res!555365) (not e!450283))))

(declare-datatypes ((List!15157 0))(
  ( (Nil!15154) (Cons!15153 (h!16282 (_ BitVec 64)) (t!21463 List!15157)) )
))
(declare-fun arrayNoDuplicates!0 (array!44385 (_ BitVec 32) List!15157) Bool)

(assert (=> b!812754 (= res!555365 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15154))))

(declare-fun b!812755 () Bool)

(assert (=> b!812755 (= e!450283 false)))

(declare-fun zeroValueBefore!34 () V!23779)

(declare-fun minValue!754 () V!23779)

(declare-datatypes ((tuple2!9334 0))(
  ( (tuple2!9335 (_1!4678 (_ BitVec 64)) (_2!4678 V!23779)) )
))
(declare-datatypes ((List!15158 0))(
  ( (Nil!15155) (Cons!15154 (h!16283 tuple2!9334) (t!21464 List!15158)) )
))
(declare-datatypes ((ListLongMap!8147 0))(
  ( (ListLongMap!8148 (toList!4089 List!15158)) )
))
(declare-fun lt!363978 () ListLongMap!8147)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2154 (array!44385 array!44387 (_ BitVec 32) (_ BitVec 32) V!23779 V!23779 (_ BitVec 32) Int) ListLongMap!8147)

(assert (=> b!812755 (= lt!363978 (getCurrentListMapNoExtraKeys!2154 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!812756 () Bool)

(assert (=> b!812756 (= e!450285 tp_is_empty!14083)))

(declare-fun mapIsEmpty!22702 () Bool)

(assert (=> mapIsEmpty!22702 mapRes!22702))

(declare-fun b!812757 () Bool)

(declare-fun res!555362 () Bool)

(assert (=> b!812757 (=> (not res!555362) (not e!450283))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44385 (_ BitVec 32)) Bool)

(assert (=> b!812757 (= res!555362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812758 () Bool)

(assert (=> b!812758 (= e!450282 (and e!450284 mapRes!22702))))

(declare-fun condMapEmpty!22702 () Bool)

(declare-fun mapDefault!22702 () ValueCell!6626)

(assert (=> b!812758 (= condMapEmpty!22702 (= (arr!21255 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6626)) mapDefault!22702)))))

(assert (= (and start!69920 res!555363) b!812752))

(assert (= (and b!812752 res!555364) b!812757))

(assert (= (and b!812757 res!555362) b!812754))

(assert (= (and b!812754 res!555365) b!812755))

(assert (= (and b!812758 condMapEmpty!22702) mapIsEmpty!22702))

(assert (= (and b!812758 (not condMapEmpty!22702)) mapNonEmpty!22702))

(get-info :version)

(assert (= (and mapNonEmpty!22702 ((_ is ValueCellFull!6626) mapValue!22702)) b!812756))

(assert (= (and b!812758 ((_ is ValueCellFull!6626) mapDefault!22702)) b!812753))

(assert (= start!69920 b!812758))

(declare-fun m!754435 () Bool)

(assert (=> b!812757 m!754435))

(declare-fun m!754437 () Bool)

(assert (=> start!69920 m!754437))

(declare-fun m!754439 () Bool)

(assert (=> start!69920 m!754439))

(declare-fun m!754441 () Bool)

(assert (=> start!69920 m!754441))

(declare-fun m!754443 () Bool)

(assert (=> b!812755 m!754443))

(declare-fun m!754445 () Bool)

(assert (=> mapNonEmpty!22702 m!754445))

(declare-fun m!754447 () Bool)

(assert (=> b!812754 m!754447))

(check-sat (not b!812755) (not mapNonEmpty!22702) (not b!812757) (not b_next!12373) tp_is_empty!14083 (not start!69920) (not b!812754) b_and!21115)
(check-sat b_and!21115 (not b_next!12373))
