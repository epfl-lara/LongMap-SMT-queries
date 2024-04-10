; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70038 () Bool)

(assert start!70038)

(declare-fun b_free!12459 () Bool)

(declare-fun b_next!12459 () Bool)

(assert (=> start!70038 (= b_free!12459 (not b_next!12459))))

(declare-fun tp!44092 () Bool)

(declare-fun b_and!21231 () Bool)

(assert (=> start!70038 (= tp!44092 b_and!21231)))

(declare-fun b!813974 () Bool)

(declare-fun res!556013 () Bool)

(declare-fun e!451127 () Bool)

(assert (=> b!813974 (=> (not res!556013) (not e!451127))))

(declare-datatypes ((array!44544 0))(
  ( (array!44545 (arr!21332 (Array (_ BitVec 32) (_ BitVec 64))) (size!21753 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44544)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44544 (_ BitVec 32)) Bool)

(assert (=> b!813974 (= res!556013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22834 () Bool)

(declare-fun mapRes!22834 () Bool)

(declare-fun tp!44091 () Bool)

(declare-fun e!451128 () Bool)

(assert (=> mapNonEmpty!22834 (= mapRes!22834 (and tp!44091 e!451128))))

(declare-fun mapKey!22834 () (_ BitVec 32))

(declare-datatypes ((V!23893 0))(
  ( (V!23894 (val!7132 Int)) )
))
(declare-datatypes ((ValueCell!6669 0))(
  ( (ValueCellFull!6669 (v!9559 V!23893)) (EmptyCell!6669) )
))
(declare-datatypes ((array!44546 0))(
  ( (array!44547 (arr!21333 (Array (_ BitVec 32) ValueCell!6669)) (size!21754 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44546)

(declare-fun mapRest!22834 () (Array (_ BitVec 32) ValueCell!6669))

(declare-fun mapValue!22834 () ValueCell!6669)

(assert (=> mapNonEmpty!22834 (= (arr!21333 _values!788) (store mapRest!22834 mapKey!22834 mapValue!22834))))

(declare-fun b!813975 () Bool)

(declare-fun e!451125 () Bool)

(declare-fun tp_is_empty!14169 () Bool)

(assert (=> b!813975 (= e!451125 tp_is_empty!14169)))

(declare-fun res!556012 () Bool)

(assert (=> start!70038 (=> (not res!556012) (not e!451127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70038 (= res!556012 (validMask!0 mask!1312))))

(assert (=> start!70038 e!451127))

(assert (=> start!70038 tp_is_empty!14169))

(declare-fun array_inv!17079 (array!44544) Bool)

(assert (=> start!70038 (array_inv!17079 _keys!976)))

(assert (=> start!70038 true))

(declare-fun e!451126 () Bool)

(declare-fun array_inv!17080 (array!44546) Bool)

(assert (=> start!70038 (and (array_inv!17080 _values!788) e!451126)))

(assert (=> start!70038 tp!44092))

(declare-fun b!813976 () Bool)

(assert (=> b!813976 (= e!451127 false)))

(declare-fun zeroValueAfter!34 () V!23893)

(declare-fun minValue!754 () V!23893)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9344 0))(
  ( (tuple2!9345 (_1!4683 (_ BitVec 64)) (_2!4683 V!23893)) )
))
(declare-datatypes ((List!15177 0))(
  ( (Nil!15174) (Cons!15173 (h!16302 tuple2!9344) (t!21494 List!15177)) )
))
(declare-datatypes ((ListLongMap!8167 0))(
  ( (ListLongMap!8168 (toList!4099 List!15177)) )
))
(declare-fun lt!364449 () ListLongMap!8167)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2149 (array!44544 array!44546 (_ BitVec 32) (_ BitVec 32) V!23893 V!23893 (_ BitVec 32) Int) ListLongMap!8167)

(assert (=> b!813976 (= lt!364449 (getCurrentListMapNoExtraKeys!2149 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23893)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364448 () ListLongMap!8167)

(assert (=> b!813976 (= lt!364448 (getCurrentListMapNoExtraKeys!2149 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813977 () Bool)

(declare-fun res!556014 () Bool)

(assert (=> b!813977 (=> (not res!556014) (not e!451127))))

(assert (=> b!813977 (= res!556014 (and (= (size!21754 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21753 _keys!976) (size!21754 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22834 () Bool)

(assert (=> mapIsEmpty!22834 mapRes!22834))

(declare-fun b!813978 () Bool)

(assert (=> b!813978 (= e!451128 tp_is_empty!14169)))

(declare-fun b!813979 () Bool)

(declare-fun res!556011 () Bool)

(assert (=> b!813979 (=> (not res!556011) (not e!451127))))

(declare-datatypes ((List!15178 0))(
  ( (Nil!15175) (Cons!15174 (h!16303 (_ BitVec 64)) (t!21495 List!15178)) )
))
(declare-fun arrayNoDuplicates!0 (array!44544 (_ BitVec 32) List!15178) Bool)

(assert (=> b!813979 (= res!556011 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15175))))

(declare-fun b!813980 () Bool)

(assert (=> b!813980 (= e!451126 (and e!451125 mapRes!22834))))

(declare-fun condMapEmpty!22834 () Bool)

(declare-fun mapDefault!22834 () ValueCell!6669)

(assert (=> b!813980 (= condMapEmpty!22834 (= (arr!21333 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6669)) mapDefault!22834)))))

(assert (= (and start!70038 res!556012) b!813977))

(assert (= (and b!813977 res!556014) b!813974))

(assert (= (and b!813974 res!556013) b!813979))

(assert (= (and b!813979 res!556011) b!813976))

(assert (= (and b!813980 condMapEmpty!22834) mapIsEmpty!22834))

(assert (= (and b!813980 (not condMapEmpty!22834)) mapNonEmpty!22834))

(get-info :version)

(assert (= (and mapNonEmpty!22834 ((_ is ValueCellFull!6669) mapValue!22834)) b!813978))

(assert (= (and b!813980 ((_ is ValueCellFull!6669) mapDefault!22834)) b!813975))

(assert (= start!70038 b!813980))

(declare-fun m!755877 () Bool)

(assert (=> mapNonEmpty!22834 m!755877))

(declare-fun m!755879 () Bool)

(assert (=> b!813974 m!755879))

(declare-fun m!755881 () Bool)

(assert (=> b!813976 m!755881))

(declare-fun m!755883 () Bool)

(assert (=> b!813976 m!755883))

(declare-fun m!755885 () Bool)

(assert (=> b!813979 m!755885))

(declare-fun m!755887 () Bool)

(assert (=> start!70038 m!755887))

(declare-fun m!755889 () Bool)

(assert (=> start!70038 m!755889))

(declare-fun m!755891 () Bool)

(assert (=> start!70038 m!755891))

(check-sat (not b!813974) b_and!21231 (not start!70038) (not b_next!12459) tp_is_empty!14169 (not b!813976) (not b!813979) (not mapNonEmpty!22834))
(check-sat b_and!21231 (not b_next!12459))
