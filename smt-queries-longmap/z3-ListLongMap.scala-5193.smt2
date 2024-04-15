; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70138 () Bool)

(assert start!70138)

(declare-fun b_free!12565 () Bool)

(declare-fun b_next!12565 () Bool)

(assert (=> start!70138 (= b_free!12565 (not b_next!12565))))

(declare-fun tp!44412 () Bool)

(declare-fun b_and!21319 () Bool)

(assert (=> start!70138 (= tp!44412 b_and!21319)))

(declare-fun b!814926 () Bool)

(declare-fun e!451827 () Bool)

(declare-fun tp_is_empty!14275 () Bool)

(assert (=> b!814926 (= e!451827 tp_is_empty!14275)))

(declare-fun b!814927 () Bool)

(declare-fun e!451828 () Bool)

(assert (=> b!814927 (= e!451828 tp_is_empty!14275)))

(declare-fun b!814928 () Bool)

(declare-fun res!556574 () Bool)

(declare-fun e!451824 () Bool)

(assert (=> b!814928 (=> (not res!556574) (not e!451824))))

(declare-datatypes ((array!44741 0))(
  ( (array!44742 (arr!21430 (Array (_ BitVec 32) (_ BitVec 64))) (size!21851 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44741)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44741 (_ BitVec 32)) Bool)

(assert (=> b!814928 (= res!556574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814929 () Bool)

(declare-fun res!556575 () Bool)

(assert (=> b!814929 (=> (not res!556575) (not e!451824))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24035 0))(
  ( (V!24036 (val!7185 Int)) )
))
(declare-datatypes ((ValueCell!6722 0))(
  ( (ValueCellFull!6722 (v!9606 V!24035)) (EmptyCell!6722) )
))
(declare-datatypes ((array!44743 0))(
  ( (array!44744 (arr!21431 (Array (_ BitVec 32) ValueCell!6722)) (size!21852 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44743)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814929 (= res!556575 (and (= (size!21852 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21851 _keys!976) (size!21852 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22996 () Bool)

(declare-fun mapRes!22996 () Bool)

(assert (=> mapIsEmpty!22996 mapRes!22996))

(declare-fun b!814930 () Bool)

(declare-fun e!451825 () Bool)

(assert (=> b!814930 (= e!451825 (and e!451828 mapRes!22996))))

(declare-fun condMapEmpty!22996 () Bool)

(declare-fun mapDefault!22996 () ValueCell!6722)

(assert (=> b!814930 (= condMapEmpty!22996 (= (arr!21431 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6722)) mapDefault!22996)))))

(declare-fun b!814931 () Bool)

(declare-fun res!556573 () Bool)

(assert (=> b!814931 (=> (not res!556573) (not e!451824))))

(declare-datatypes ((List!15274 0))(
  ( (Nil!15271) (Cons!15270 (h!16399 (_ BitVec 64)) (t!21584 List!15274)) )
))
(declare-fun arrayNoDuplicates!0 (array!44741 (_ BitVec 32) List!15274) Bool)

(assert (=> b!814931 (= res!556573 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15271))))

(declare-fun res!556572 () Bool)

(assert (=> start!70138 (=> (not res!556572) (not e!451824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70138 (= res!556572 (validMask!0 mask!1312))))

(assert (=> start!70138 e!451824))

(assert (=> start!70138 tp_is_empty!14275))

(declare-fun array_inv!17227 (array!44741) Bool)

(assert (=> start!70138 (array_inv!17227 _keys!976)))

(assert (=> start!70138 true))

(declare-fun array_inv!17228 (array!44743) Bool)

(assert (=> start!70138 (and (array_inv!17228 _values!788) e!451825)))

(assert (=> start!70138 tp!44412))

(declare-fun b!814932 () Bool)

(assert (=> b!814932 (= e!451824 (not true))))

(declare-datatypes ((tuple2!9444 0))(
  ( (tuple2!9445 (_1!4733 (_ BitVec 64)) (_2!4733 V!24035)) )
))
(declare-datatypes ((List!15275 0))(
  ( (Nil!15272) (Cons!15271 (h!16400 tuple2!9444) (t!21585 List!15275)) )
))
(declare-datatypes ((ListLongMap!8257 0))(
  ( (ListLongMap!8258 (toList!4144 List!15275)) )
))
(declare-fun lt!364691 () ListLongMap!8257)

(declare-fun lt!364692 () ListLongMap!8257)

(assert (=> b!814932 (= lt!364691 lt!364692)))

(declare-fun zeroValueBefore!34 () V!24035)

(declare-fun zeroValueAfter!34 () V!24035)

(declare-fun minValue!754 () V!24035)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27722 0))(
  ( (Unit!27723) )
))
(declare-fun lt!364693 () Unit!27722)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!302 (array!44741 array!44743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24035 V!24035 V!24035 V!24035 (_ BitVec 32) Int) Unit!27722)

(assert (=> b!814932 (= lt!364693 (lemmaNoChangeToArrayThenSameMapNoExtras!302 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2209 (array!44741 array!44743 (_ BitVec 32) (_ BitVec 32) V!24035 V!24035 (_ BitVec 32) Int) ListLongMap!8257)

(assert (=> b!814932 (= lt!364692 (getCurrentListMapNoExtraKeys!2209 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814932 (= lt!364691 (getCurrentListMapNoExtraKeys!2209 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!22996 () Bool)

(declare-fun tp!44413 () Bool)

(assert (=> mapNonEmpty!22996 (= mapRes!22996 (and tp!44413 e!451827))))

(declare-fun mapValue!22996 () ValueCell!6722)

(declare-fun mapKey!22996 () (_ BitVec 32))

(declare-fun mapRest!22996 () (Array (_ BitVec 32) ValueCell!6722))

(assert (=> mapNonEmpty!22996 (= (arr!21431 _values!788) (store mapRest!22996 mapKey!22996 mapValue!22996))))

(assert (= (and start!70138 res!556572) b!814929))

(assert (= (and b!814929 res!556575) b!814928))

(assert (= (and b!814928 res!556574) b!814931))

(assert (= (and b!814931 res!556573) b!814932))

(assert (= (and b!814930 condMapEmpty!22996) mapIsEmpty!22996))

(assert (= (and b!814930 (not condMapEmpty!22996)) mapNonEmpty!22996))

(get-info :version)

(assert (= (and mapNonEmpty!22996 ((_ is ValueCellFull!6722) mapValue!22996)) b!814926))

(assert (= (and b!814930 ((_ is ValueCellFull!6722) mapDefault!22996)) b!814927))

(assert (= start!70138 b!814930))

(declare-fun m!756123 () Bool)

(assert (=> start!70138 m!756123))

(declare-fun m!756125 () Bool)

(assert (=> start!70138 m!756125))

(declare-fun m!756127 () Bool)

(assert (=> start!70138 m!756127))

(declare-fun m!756129 () Bool)

(assert (=> b!814932 m!756129))

(declare-fun m!756131 () Bool)

(assert (=> b!814932 m!756131))

(declare-fun m!756133 () Bool)

(assert (=> b!814932 m!756133))

(declare-fun m!756135 () Bool)

(assert (=> b!814928 m!756135))

(declare-fun m!756137 () Bool)

(assert (=> b!814931 m!756137))

(declare-fun m!756139 () Bool)

(assert (=> mapNonEmpty!22996 m!756139))

(check-sat (not start!70138) (not b!814931) (not b!814928) b_and!21319 (not mapNonEmpty!22996) tp_is_empty!14275 (not b!814932) (not b_next!12565))
(check-sat b_and!21319 (not b_next!12565))
