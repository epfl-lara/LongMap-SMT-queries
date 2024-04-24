; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70392 () Bool)

(assert start!70392)

(declare-fun b_free!12619 () Bool)

(declare-fun b_next!12619 () Bool)

(assert (=> start!70392 (= b_free!12619 (not b_next!12619))))

(declare-fun tp!44577 () Bool)

(declare-fun b_and!21417 () Bool)

(assert (=> start!70392 (= tp!44577 b_and!21417)))

(declare-fun b!816765 () Bool)

(declare-fun e!453061 () Bool)

(declare-fun e!453060 () Bool)

(assert (=> b!816765 (= e!453061 (not e!453060))))

(declare-fun res!557428 () Bool)

(assert (=> b!816765 (=> res!557428 e!453060)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816765 (= res!557428 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24107 0))(
  ( (V!24108 (val!7212 Int)) )
))
(declare-datatypes ((tuple2!9384 0))(
  ( (tuple2!9385 (_1!4703 (_ BitVec 64)) (_2!4703 V!24107)) )
))
(declare-datatypes ((List!15196 0))(
  ( (Nil!15193) (Cons!15192 (h!16327 tuple2!9384) (t!21509 List!15196)) )
))
(declare-datatypes ((ListLongMap!8209 0))(
  ( (ListLongMap!8210 (toList!4120 List!15196)) )
))
(declare-fun lt!365667 () ListLongMap!8209)

(declare-fun lt!365665 () ListLongMap!8209)

(assert (=> b!816765 (= lt!365667 lt!365665)))

(declare-fun zeroValueBefore!34 () V!24107)

(declare-datatypes ((array!44859 0))(
  ( (array!44860 (arr!21483 (Array (_ BitVec 32) (_ BitVec 64))) (size!21903 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44859)

(declare-fun zeroValueAfter!34 () V!24107)

(declare-fun minValue!754 () V!24107)

(declare-datatypes ((ValueCell!6749 0))(
  ( (ValueCellFull!6749 (v!9639 V!24107)) (EmptyCell!6749) )
))
(declare-datatypes ((array!44861 0))(
  ( (array!44862 (arr!21484 (Array (_ BitVec 32) ValueCell!6749)) (size!21904 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44861)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27803 0))(
  ( (Unit!27804) )
))
(declare-fun lt!365668 () Unit!27803)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!313 (array!44859 array!44861 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24107 V!24107 V!24107 V!24107 (_ BitVec 32) Int) Unit!27803)

(assert (=> b!816765 (= lt!365668 (lemmaNoChangeToArrayThenSameMapNoExtras!313 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2225 (array!44859 array!44861 (_ BitVec 32) (_ BitVec 32) V!24107 V!24107 (_ BitVec 32) Int) ListLongMap!8209)

(assert (=> b!816765 (= lt!365665 (getCurrentListMapNoExtraKeys!2225 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816765 (= lt!365667 (getCurrentListMapNoExtraKeys!2225 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816766 () Bool)

(declare-fun res!557429 () Bool)

(assert (=> b!816766 (=> (not res!557429) (not e!453061))))

(declare-datatypes ((List!15197 0))(
  ( (Nil!15194) (Cons!15193 (h!16328 (_ BitVec 64)) (t!21510 List!15197)) )
))
(declare-fun arrayNoDuplicates!0 (array!44859 (_ BitVec 32) List!15197) Bool)

(assert (=> b!816766 (= res!557429 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15194))))

(declare-fun b!816767 () Bool)

(declare-fun e!453064 () Bool)

(declare-fun tp_is_empty!14329 () Bool)

(assert (=> b!816767 (= e!453064 tp_is_empty!14329)))

(declare-fun b!816768 () Bool)

(declare-fun res!557427 () Bool)

(assert (=> b!816768 (=> (not res!557427) (not e!453061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44859 (_ BitVec 32)) Bool)

(assert (=> b!816768 (= res!557427 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23080 () Bool)

(declare-fun mapRes!23080 () Bool)

(declare-fun tp!44578 () Bool)

(assert (=> mapNonEmpty!23080 (= mapRes!23080 (and tp!44578 e!453064))))

(declare-fun mapKey!23080 () (_ BitVec 32))

(declare-fun mapRest!23080 () (Array (_ BitVec 32) ValueCell!6749))

(declare-fun mapValue!23080 () ValueCell!6749)

(assert (=> mapNonEmpty!23080 (= (arr!21484 _values!788) (store mapRest!23080 mapKey!23080 mapValue!23080))))

(declare-fun mapIsEmpty!23080 () Bool)

(assert (=> mapIsEmpty!23080 mapRes!23080))

(declare-fun b!816769 () Bool)

(declare-fun res!557426 () Bool)

(assert (=> b!816769 (=> (not res!557426) (not e!453061))))

(assert (=> b!816769 (= res!557426 (and (= (size!21904 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21903 _keys!976) (size!21904 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816770 () Bool)

(declare-fun e!453059 () Bool)

(assert (=> b!816770 (= e!453059 tp_is_empty!14329)))

(declare-fun b!816771 () Bool)

(assert (=> b!816771 (= e!453060 true)))

(declare-fun lt!365669 () ListLongMap!8209)

(declare-fun getCurrentListMap!2339 (array!44859 array!44861 (_ BitVec 32) (_ BitVec 32) V!24107 V!24107 (_ BitVec 32) Int) ListLongMap!8209)

(assert (=> b!816771 (= lt!365669 (getCurrentListMap!2339 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365666 () ListLongMap!8209)

(declare-fun +!1799 (ListLongMap!8209 tuple2!9384) ListLongMap!8209)

(assert (=> b!816771 (= lt!365666 (+!1799 (getCurrentListMap!2339 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9385 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816772 () Bool)

(declare-fun e!453063 () Bool)

(assert (=> b!816772 (= e!453063 (and e!453059 mapRes!23080))))

(declare-fun condMapEmpty!23080 () Bool)

(declare-fun mapDefault!23080 () ValueCell!6749)

(assert (=> b!816772 (= condMapEmpty!23080 (= (arr!21484 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6749)) mapDefault!23080)))))

(declare-fun res!557430 () Bool)

(assert (=> start!70392 (=> (not res!557430) (not e!453061))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70392 (= res!557430 (validMask!0 mask!1312))))

(assert (=> start!70392 e!453061))

(assert (=> start!70392 tp_is_empty!14329))

(declare-fun array_inv!17229 (array!44859) Bool)

(assert (=> start!70392 (array_inv!17229 _keys!976)))

(assert (=> start!70392 true))

(declare-fun array_inv!17230 (array!44861) Bool)

(assert (=> start!70392 (and (array_inv!17230 _values!788) e!453063)))

(assert (=> start!70392 tp!44577))

(assert (= (and start!70392 res!557430) b!816769))

(assert (= (and b!816769 res!557426) b!816768))

(assert (= (and b!816768 res!557427) b!816766))

(assert (= (and b!816766 res!557429) b!816765))

(assert (= (and b!816765 (not res!557428)) b!816771))

(assert (= (and b!816772 condMapEmpty!23080) mapIsEmpty!23080))

(assert (= (and b!816772 (not condMapEmpty!23080)) mapNonEmpty!23080))

(get-info :version)

(assert (= (and mapNonEmpty!23080 ((_ is ValueCellFull!6749) mapValue!23080)) b!816767))

(assert (= (and b!816772 ((_ is ValueCellFull!6749) mapDefault!23080)) b!816770))

(assert (= start!70392 b!816772))

(declare-fun m!758799 () Bool)

(assert (=> b!816765 m!758799))

(declare-fun m!758801 () Bool)

(assert (=> b!816765 m!758801))

(declare-fun m!758803 () Bool)

(assert (=> b!816765 m!758803))

(declare-fun m!758805 () Bool)

(assert (=> b!816766 m!758805))

(declare-fun m!758807 () Bool)

(assert (=> b!816771 m!758807))

(declare-fun m!758809 () Bool)

(assert (=> b!816771 m!758809))

(assert (=> b!816771 m!758809))

(declare-fun m!758811 () Bool)

(assert (=> b!816771 m!758811))

(declare-fun m!758813 () Bool)

(assert (=> start!70392 m!758813))

(declare-fun m!758815 () Bool)

(assert (=> start!70392 m!758815))

(declare-fun m!758817 () Bool)

(assert (=> start!70392 m!758817))

(declare-fun m!758819 () Bool)

(assert (=> mapNonEmpty!23080 m!758819))

(declare-fun m!758821 () Bool)

(assert (=> b!816768 m!758821))

(check-sat (not start!70392) (not b!816771) tp_is_empty!14329 b_and!21417 (not b_next!12619) (not mapNonEmpty!23080) (not b!816768) (not b!816765) (not b!816766))
(check-sat b_and!21417 (not b_next!12619))
