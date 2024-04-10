; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69966 () Bool)

(assert start!69966)

(declare-fun b_free!12399 () Bool)

(declare-fun b_next!12399 () Bool)

(assert (=> start!69966 (= b_free!12399 (not b_next!12399))))

(declare-fun tp!43908 () Bool)

(declare-fun b_and!21167 () Bool)

(assert (=> start!69966 (= tp!43908 b_and!21167)))

(declare-fun b!813271 () Bool)

(declare-fun e!450628 () Bool)

(declare-fun tp_is_empty!14109 () Bool)

(assert (=> b!813271 (= e!450628 tp_is_empty!14109)))

(declare-fun b!813272 () Bool)

(declare-fun res!555626 () Bool)

(declare-fun e!450627 () Bool)

(assert (=> b!813272 (=> (not res!555626) (not e!450627))))

(declare-datatypes ((array!44428 0))(
  ( (array!44429 (arr!21275 (Array (_ BitVec 32) (_ BitVec 64))) (size!21696 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44428)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44428 (_ BitVec 32)) Bool)

(assert (=> b!813272 (= res!555626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813273 () Bool)

(assert (=> b!813273 (= e!450627 false)))

(declare-datatypes ((V!23813 0))(
  ( (V!23814 (val!7102 Int)) )
))
(declare-fun zeroValueBefore!34 () V!23813)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!23813)

(declare-datatypes ((ValueCell!6639 0))(
  ( (ValueCellFull!6639 (v!9529 V!23813)) (EmptyCell!6639) )
))
(declare-datatypes ((array!44430 0))(
  ( (array!44431 (arr!21276 (Array (_ BitVec 32) ValueCell!6639)) (size!21697 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44430)

(declare-datatypes ((tuple2!9300 0))(
  ( (tuple2!9301 (_1!4661 (_ BitVec 64)) (_2!4661 V!23813)) )
))
(declare-datatypes ((List!15132 0))(
  ( (Nil!15129) (Cons!15128 (h!16257 tuple2!9300) (t!21447 List!15132)) )
))
(declare-datatypes ((ListLongMap!8123 0))(
  ( (ListLongMap!8124 (toList!4077 List!15132)) )
))
(declare-fun lt!364260 () ListLongMap!8123)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2127 (array!44428 array!44430 (_ BitVec 32) (_ BitVec 32) V!23813 V!23813 (_ BitVec 32) Int) ListLongMap!8123)

(assert (=> b!813273 (= lt!364260 (getCurrentListMapNoExtraKeys!2127 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!555624 () Bool)

(assert (=> start!69966 (=> (not res!555624) (not e!450627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69966 (= res!555624 (validMask!0 mask!1312))))

(assert (=> start!69966 e!450627))

(assert (=> start!69966 tp_is_empty!14109))

(declare-fun array_inv!17037 (array!44428) Bool)

(assert (=> start!69966 (array_inv!17037 _keys!976)))

(assert (=> start!69966 true))

(declare-fun e!450626 () Bool)

(declare-fun array_inv!17038 (array!44430) Bool)

(assert (=> start!69966 (and (array_inv!17038 _values!788) e!450626)))

(assert (=> start!69966 tp!43908))

(declare-fun b!813274 () Bool)

(declare-fun mapRes!22741 () Bool)

(assert (=> b!813274 (= e!450626 (and e!450628 mapRes!22741))))

(declare-fun condMapEmpty!22741 () Bool)

(declare-fun mapDefault!22741 () ValueCell!6639)

(assert (=> b!813274 (= condMapEmpty!22741 (= (arr!21276 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6639)) mapDefault!22741)))))

(declare-fun mapIsEmpty!22741 () Bool)

(assert (=> mapIsEmpty!22741 mapRes!22741))

(declare-fun mapNonEmpty!22741 () Bool)

(declare-fun tp!43909 () Bool)

(declare-fun e!450630 () Bool)

(assert (=> mapNonEmpty!22741 (= mapRes!22741 (and tp!43909 e!450630))))

(declare-fun mapKey!22741 () (_ BitVec 32))

(declare-fun mapValue!22741 () ValueCell!6639)

(declare-fun mapRest!22741 () (Array (_ BitVec 32) ValueCell!6639))

(assert (=> mapNonEmpty!22741 (= (arr!21276 _values!788) (store mapRest!22741 mapKey!22741 mapValue!22741))))

(declare-fun b!813275 () Bool)

(assert (=> b!813275 (= e!450630 tp_is_empty!14109)))

(declare-fun b!813276 () Bool)

(declare-fun res!555627 () Bool)

(assert (=> b!813276 (=> (not res!555627) (not e!450627))))

(declare-datatypes ((List!15133 0))(
  ( (Nil!15130) (Cons!15129 (h!16258 (_ BitVec 64)) (t!21448 List!15133)) )
))
(declare-fun arrayNoDuplicates!0 (array!44428 (_ BitVec 32) List!15133) Bool)

(assert (=> b!813276 (= res!555627 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15130))))

(declare-fun b!813277 () Bool)

(declare-fun res!555625 () Bool)

(assert (=> b!813277 (=> (not res!555625) (not e!450627))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813277 (= res!555625 (and (= (size!21697 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21696 _keys!976) (size!21697 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!69966 res!555624) b!813277))

(assert (= (and b!813277 res!555625) b!813272))

(assert (= (and b!813272 res!555626) b!813276))

(assert (= (and b!813276 res!555627) b!813273))

(assert (= (and b!813274 condMapEmpty!22741) mapIsEmpty!22741))

(assert (= (and b!813274 (not condMapEmpty!22741)) mapNonEmpty!22741))

(get-info :version)

(assert (= (and mapNonEmpty!22741 ((_ is ValueCellFull!6639) mapValue!22741)) b!813275))

(assert (= (and b!813274 ((_ is ValueCellFull!6639) mapDefault!22741)) b!813271))

(assert (= start!69966 b!813274))

(declare-fun m!755369 () Bool)

(assert (=> b!813273 m!755369))

(declare-fun m!755371 () Bool)

(assert (=> b!813276 m!755371))

(declare-fun m!755373 () Bool)

(assert (=> b!813272 m!755373))

(declare-fun m!755375 () Bool)

(assert (=> start!69966 m!755375))

(declare-fun m!755377 () Bool)

(assert (=> start!69966 m!755377))

(declare-fun m!755379 () Bool)

(assert (=> start!69966 m!755379))

(declare-fun m!755381 () Bool)

(assert (=> mapNonEmpty!22741 m!755381))

(check-sat (not start!69966) b_and!21167 (not b!813273) tp_is_empty!14109 (not b!813272) (not mapNonEmpty!22741) (not b_next!12399) (not b!813276))
(check-sat b_and!21167 (not b_next!12399))
