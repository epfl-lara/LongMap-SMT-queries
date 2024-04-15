; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71202 () Bool)

(assert start!71202)

(declare-fun b_free!13369 () Bool)

(declare-fun b_next!13369 () Bool)

(assert (=> start!71202 (= b_free!13369 (not b_next!13369))))

(declare-fun tp!46869 () Bool)

(declare-fun b_and!22281 () Bool)

(assert (=> start!71202 (= tp!46869 b_and!22281)))

(declare-fun b!827077 () Bool)

(declare-fun e!460706 () Bool)

(declare-fun tp_is_empty!15079 () Bool)

(assert (=> b!827077 (= e!460706 tp_is_empty!15079)))

(declare-fun mapNonEmpty!24247 () Bool)

(declare-fun mapRes!24247 () Bool)

(declare-fun tp!46870 () Bool)

(assert (=> mapNonEmpty!24247 (= mapRes!24247 (and tp!46870 e!460706))))

(declare-datatypes ((V!25107 0))(
  ( (V!25108 (val!7587 Int)) )
))
(declare-datatypes ((ValueCell!7124 0))(
  ( (ValueCellFull!7124 (v!10016 V!25107)) (EmptyCell!7124) )
))
(declare-fun mapRest!24247 () (Array (_ BitVec 32) ValueCell!7124))

(declare-fun mapValue!24247 () ValueCell!7124)

(declare-datatypes ((array!46301 0))(
  ( (array!46302 (arr!22195 (Array (_ BitVec 32) ValueCell!7124)) (size!22616 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46301)

(declare-fun mapKey!24247 () (_ BitVec 32))

(assert (=> mapNonEmpty!24247 (= (arr!22195 _values!788) (store mapRest!24247 mapKey!24247 mapValue!24247))))

(declare-fun b!827078 () Bool)

(declare-fun e!460708 () Bool)

(assert (=> b!827078 (= e!460708 tp_is_empty!15079)))

(declare-fun mapIsEmpty!24247 () Bool)

(assert (=> mapIsEmpty!24247 mapRes!24247))

(declare-fun b!827079 () Bool)

(declare-fun res!563804 () Bool)

(declare-fun e!460705 () Bool)

(assert (=> b!827079 (=> (not res!563804) (not e!460705))))

(declare-datatypes ((array!46303 0))(
  ( (array!46304 (arr!22196 (Array (_ BitVec 32) (_ BitVec 64))) (size!22617 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46303)

(declare-datatypes ((List!15856 0))(
  ( (Nil!15853) (Cons!15852 (h!16981 (_ BitVec 64)) (t!22196 List!15856)) )
))
(declare-fun arrayNoDuplicates!0 (array!46303 (_ BitVec 32) List!15856) Bool)

(assert (=> b!827079 (= res!563804 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15853))))

(declare-fun b!827080 () Bool)

(declare-fun res!563806 () Bool)

(assert (=> b!827080 (=> (not res!563806) (not e!460705))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46303 (_ BitVec 32)) Bool)

(assert (=> b!827080 (= res!563806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!563805 () Bool)

(assert (=> start!71202 (=> (not res!563805) (not e!460705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71202 (= res!563805 (validMask!0 mask!1312))))

(assert (=> start!71202 e!460705))

(assert (=> start!71202 tp_is_empty!15079))

(declare-fun array_inv!17753 (array!46303) Bool)

(assert (=> start!71202 (array_inv!17753 _keys!976)))

(assert (=> start!71202 true))

(declare-fun e!460709 () Bool)

(declare-fun array_inv!17754 (array!46301) Bool)

(assert (=> start!71202 (and (array_inv!17754 _values!788) e!460709)))

(assert (=> start!71202 tp!46869))

(declare-fun b!827081 () Bool)

(assert (=> b!827081 (= e!460709 (and e!460708 mapRes!24247))))

(declare-fun condMapEmpty!24247 () Bool)

(declare-fun mapDefault!24247 () ValueCell!7124)

(assert (=> b!827081 (= condMapEmpty!24247 (= (arr!22195 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7124)) mapDefault!24247)))))

(declare-fun b!827082 () Bool)

(declare-fun res!563803 () Bool)

(assert (=> b!827082 (=> (not res!563803) (not e!460705))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827082 (= res!563803 (and (= (size!22616 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22617 _keys!976) (size!22616 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827083 () Bool)

(assert (=> b!827083 (= e!460705 false)))

(declare-datatypes ((tuple2!10066 0))(
  ( (tuple2!10067 (_1!5044 (_ BitVec 64)) (_2!5044 V!25107)) )
))
(declare-datatypes ((List!15857 0))(
  ( (Nil!15854) (Cons!15853 (h!16982 tuple2!10066) (t!22197 List!15857)) )
))
(declare-datatypes ((ListLongMap!8879 0))(
  ( (ListLongMap!8880 (toList!4455 List!15857)) )
))
(declare-fun lt!374630 () ListLongMap!8879)

(declare-fun zeroValueAfter!34 () V!25107)

(declare-fun minValue!754 () V!25107)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2487 (array!46303 array!46301 (_ BitVec 32) (_ BitVec 32) V!25107 V!25107 (_ BitVec 32) Int) ListLongMap!8879)

(assert (=> b!827083 (= lt!374630 (getCurrentListMapNoExtraKeys!2487 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25107)

(declare-fun lt!374629 () ListLongMap!8879)

(assert (=> b!827083 (= lt!374629 (getCurrentListMapNoExtraKeys!2487 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71202 res!563805) b!827082))

(assert (= (and b!827082 res!563803) b!827080))

(assert (= (and b!827080 res!563806) b!827079))

(assert (= (and b!827079 res!563804) b!827083))

(assert (= (and b!827081 condMapEmpty!24247) mapIsEmpty!24247))

(assert (= (and b!827081 (not condMapEmpty!24247)) mapNonEmpty!24247))

(get-info :version)

(assert (= (and mapNonEmpty!24247 ((_ is ValueCellFull!7124) mapValue!24247)) b!827077))

(assert (= (and b!827081 ((_ is ValueCellFull!7124) mapDefault!24247)) b!827078))

(assert (= start!71202 b!827081))

(declare-fun m!769679 () Bool)

(assert (=> start!71202 m!769679))

(declare-fun m!769681 () Bool)

(assert (=> start!71202 m!769681))

(declare-fun m!769683 () Bool)

(assert (=> start!71202 m!769683))

(declare-fun m!769685 () Bool)

(assert (=> b!827083 m!769685))

(declare-fun m!769687 () Bool)

(assert (=> b!827083 m!769687))

(declare-fun m!769689 () Bool)

(assert (=> mapNonEmpty!24247 m!769689))

(declare-fun m!769691 () Bool)

(assert (=> b!827080 m!769691))

(declare-fun m!769693 () Bool)

(assert (=> b!827079 m!769693))

(check-sat b_and!22281 (not b!827079) (not start!71202) tp_is_empty!15079 (not b_next!13369) (not b!827083) (not mapNonEmpty!24247) (not b!827080))
(check-sat b_and!22281 (not b_next!13369))
