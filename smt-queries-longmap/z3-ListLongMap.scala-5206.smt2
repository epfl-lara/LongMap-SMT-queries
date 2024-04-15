; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70248 () Bool)

(assert start!70248)

(declare-fun b_free!12643 () Bool)

(declare-fun b_next!12643 () Bool)

(assert (=> start!70248 (= b_free!12643 (not b_next!12643))))

(declare-fun tp!44653 () Bool)

(declare-fun b_and!21417 () Bool)

(assert (=> start!70248 (= tp!44653 b_and!21417)))

(declare-fun b!816097 () Bool)

(declare-fun e!452661 () Bool)

(declare-fun tp_is_empty!14353 () Bool)

(assert (=> b!816097 (= e!452661 tp_is_empty!14353)))

(declare-fun mapNonEmpty!23119 () Bool)

(declare-fun mapRes!23119 () Bool)

(declare-fun tp!44652 () Bool)

(declare-fun e!452662 () Bool)

(assert (=> mapNonEmpty!23119 (= mapRes!23119 (and tp!44652 e!452662))))

(declare-datatypes ((V!24139 0))(
  ( (V!24140 (val!7224 Int)) )
))
(declare-datatypes ((ValueCell!6761 0))(
  ( (ValueCellFull!6761 (v!9646 V!24139)) (EmptyCell!6761) )
))
(declare-datatypes ((array!44891 0))(
  ( (array!44892 (arr!21503 (Array (_ BitVec 32) ValueCell!6761)) (size!21924 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44891)

(declare-fun mapRest!23119 () (Array (_ BitVec 32) ValueCell!6761))

(declare-fun mapKey!23119 () (_ BitVec 32))

(declare-fun mapValue!23119 () ValueCell!6761)

(assert (=> mapNonEmpty!23119 (= (arr!21503 _values!788) (store mapRest!23119 mapKey!23119 mapValue!23119))))

(declare-fun b!816098 () Bool)

(assert (=> b!816098 (= e!452662 tp_is_empty!14353)))

(declare-fun b!816099 () Bool)

(declare-fun e!452657 () Bool)

(assert (=> b!816099 (= e!452657 (and e!452661 mapRes!23119))))

(declare-fun condMapEmpty!23119 () Bool)

(declare-fun mapDefault!23119 () ValueCell!6761)

(assert (=> b!816099 (= condMapEmpty!23119 (= (arr!21503 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6761)) mapDefault!23119)))))

(declare-fun b!816100 () Bool)

(declare-fun e!452660 () Bool)

(declare-fun e!452659 () Bool)

(assert (=> b!816100 (= e!452660 (not e!452659))))

(declare-fun res!557237 () Bool)

(assert (=> b!816100 (=> res!557237 e!452659)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816100 (= res!557237 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9506 0))(
  ( (tuple2!9507 (_1!4764 (_ BitVec 64)) (_2!4764 V!24139)) )
))
(declare-datatypes ((List!15331 0))(
  ( (Nil!15328) (Cons!15327 (h!16456 tuple2!9506) (t!21645 List!15331)) )
))
(declare-datatypes ((ListLongMap!8319 0))(
  ( (ListLongMap!8320 (toList!4175 List!15331)) )
))
(declare-fun lt!365372 () ListLongMap!8319)

(declare-fun lt!365371 () ListLongMap!8319)

(assert (=> b!816100 (= lt!365372 lt!365371)))

(declare-fun zeroValueBefore!34 () V!24139)

(declare-datatypes ((Unit!27780 0))(
  ( (Unit!27781) )
))
(declare-fun lt!365370 () Unit!27780)

(declare-datatypes ((array!44893 0))(
  ( (array!44894 (arr!21504 (Array (_ BitVec 32) (_ BitVec 64))) (size!21925 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44893)

(declare-fun zeroValueAfter!34 () V!24139)

(declare-fun minValue!754 () V!24139)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!330 (array!44893 array!44891 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24139 V!24139 V!24139 V!24139 (_ BitVec 32) Int) Unit!27780)

(assert (=> b!816100 (= lt!365370 (lemmaNoChangeToArrayThenSameMapNoExtras!330 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2237 (array!44893 array!44891 (_ BitVec 32) (_ BitVec 32) V!24139 V!24139 (_ BitVec 32) Int) ListLongMap!8319)

(assert (=> b!816100 (= lt!365371 (getCurrentListMapNoExtraKeys!2237 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816100 (= lt!365372 (getCurrentListMapNoExtraKeys!2237 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!557239 () Bool)

(assert (=> start!70248 (=> (not res!557239) (not e!452660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70248 (= res!557239 (validMask!0 mask!1312))))

(assert (=> start!70248 e!452660))

(assert (=> start!70248 tp_is_empty!14353))

(declare-fun array_inv!17285 (array!44893) Bool)

(assert (=> start!70248 (array_inv!17285 _keys!976)))

(assert (=> start!70248 true))

(declare-fun array_inv!17286 (array!44891) Bool)

(assert (=> start!70248 (and (array_inv!17286 _values!788) e!452657)))

(assert (=> start!70248 tp!44653))

(declare-fun b!816101 () Bool)

(declare-fun res!557238 () Bool)

(assert (=> b!816101 (=> (not res!557238) (not e!452660))))

(declare-datatypes ((List!15332 0))(
  ( (Nil!15329) (Cons!15328 (h!16457 (_ BitVec 64)) (t!21646 List!15332)) )
))
(declare-fun arrayNoDuplicates!0 (array!44893 (_ BitVec 32) List!15332) Bool)

(assert (=> b!816101 (= res!557238 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15329))))

(declare-fun b!816102 () Bool)

(declare-fun res!557240 () Bool)

(assert (=> b!816102 (=> (not res!557240) (not e!452660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44893 (_ BitVec 32)) Bool)

(assert (=> b!816102 (= res!557240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816103 () Bool)

(assert (=> b!816103 (= e!452659 true)))

(declare-fun lt!365374 () ListLongMap!8319)

(declare-fun getCurrentListMap!2350 (array!44893 array!44891 (_ BitVec 32) (_ BitVec 32) V!24139 V!24139 (_ BitVec 32) Int) ListLongMap!8319)

(assert (=> b!816103 (= lt!365374 (getCurrentListMap!2350 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365373 () ListLongMap!8319)

(declare-fun +!1838 (ListLongMap!8319 tuple2!9506) ListLongMap!8319)

(assert (=> b!816103 (= lt!365373 (+!1838 (getCurrentListMap!2350 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816104 () Bool)

(declare-fun res!557236 () Bool)

(assert (=> b!816104 (=> (not res!557236) (not e!452660))))

(assert (=> b!816104 (= res!557236 (and (= (size!21924 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21925 _keys!976) (size!21924 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23119 () Bool)

(assert (=> mapIsEmpty!23119 mapRes!23119))

(assert (= (and start!70248 res!557239) b!816104))

(assert (= (and b!816104 res!557236) b!816102))

(assert (= (and b!816102 res!557240) b!816101))

(assert (= (and b!816101 res!557238) b!816100))

(assert (= (and b!816100 (not res!557237)) b!816103))

(assert (= (and b!816099 condMapEmpty!23119) mapIsEmpty!23119))

(assert (= (and b!816099 (not condMapEmpty!23119)) mapNonEmpty!23119))

(get-info :version)

(assert (= (and mapNonEmpty!23119 ((_ is ValueCellFull!6761) mapValue!23119)) b!816098))

(assert (= (and b!816099 ((_ is ValueCellFull!6761) mapDefault!23119)) b!816097))

(assert (= start!70248 b!816099))

(declare-fun m!757223 () Bool)

(assert (=> start!70248 m!757223))

(declare-fun m!757225 () Bool)

(assert (=> start!70248 m!757225))

(declare-fun m!757227 () Bool)

(assert (=> start!70248 m!757227))

(declare-fun m!757229 () Bool)

(assert (=> b!816102 m!757229))

(declare-fun m!757231 () Bool)

(assert (=> b!816101 m!757231))

(declare-fun m!757233 () Bool)

(assert (=> b!816100 m!757233))

(declare-fun m!757235 () Bool)

(assert (=> b!816100 m!757235))

(declare-fun m!757237 () Bool)

(assert (=> b!816100 m!757237))

(declare-fun m!757239 () Bool)

(assert (=> b!816103 m!757239))

(declare-fun m!757241 () Bool)

(assert (=> b!816103 m!757241))

(assert (=> b!816103 m!757241))

(declare-fun m!757243 () Bool)

(assert (=> b!816103 m!757243))

(declare-fun m!757245 () Bool)

(assert (=> mapNonEmpty!23119 m!757245))

(check-sat (not b_next!12643) (not b!816102) (not mapNonEmpty!23119) (not b!816103) (not b!816100) b_and!21417 tp_is_empty!14353 (not start!70248) (not b!816101))
(check-sat b_and!21417 (not b_next!12643))
