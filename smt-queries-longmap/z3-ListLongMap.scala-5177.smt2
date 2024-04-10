; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70050 () Bool)

(assert start!70050)

(declare-fun b_free!12471 () Bool)

(declare-fun b_next!12471 () Bool)

(assert (=> start!70050 (= b_free!12471 (not b_next!12471))))

(declare-fun tp!44127 () Bool)

(declare-fun b_and!21243 () Bool)

(assert (=> start!70050 (= tp!44127 b_and!21243)))

(declare-fun mapIsEmpty!22852 () Bool)

(declare-fun mapRes!22852 () Bool)

(assert (=> mapIsEmpty!22852 mapRes!22852))

(declare-fun b!814101 () Bool)

(declare-fun e!451218 () Bool)

(declare-fun e!451214 () Bool)

(assert (=> b!814101 (= e!451218 (and e!451214 mapRes!22852))))

(declare-fun condMapEmpty!22852 () Bool)

(declare-datatypes ((V!23909 0))(
  ( (V!23910 (val!7138 Int)) )
))
(declare-datatypes ((ValueCell!6675 0))(
  ( (ValueCellFull!6675 (v!9565 V!23909)) (EmptyCell!6675) )
))
(declare-datatypes ((array!44568 0))(
  ( (array!44569 (arr!21344 (Array (_ BitVec 32) ValueCell!6675)) (size!21765 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44568)

(declare-fun mapDefault!22852 () ValueCell!6675)

(assert (=> b!814101 (= condMapEmpty!22852 (= (arr!21344 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6675)) mapDefault!22852)))))

(declare-fun b!814102 () Bool)

(declare-fun res!556083 () Bool)

(declare-fun e!451216 () Bool)

(assert (=> b!814102 (=> (not res!556083) (not e!451216))))

(declare-datatypes ((array!44570 0))(
  ( (array!44571 (arr!21345 (Array (_ BitVec 32) (_ BitVec 64))) (size!21766 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44570)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814102 (= res!556083 (and (= (size!21765 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21766 _keys!976) (size!21765 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814103 () Bool)

(declare-fun tp_is_empty!14181 () Bool)

(assert (=> b!814103 (= e!451214 tp_is_empty!14181)))

(declare-fun b!814104 () Bool)

(assert (=> b!814104 (= e!451216 false)))

(declare-fun zeroValueAfter!34 () V!23909)

(declare-fun minValue!754 () V!23909)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9354 0))(
  ( (tuple2!9355 (_1!4688 (_ BitVec 64)) (_2!4688 V!23909)) )
))
(declare-datatypes ((List!15185 0))(
  ( (Nil!15182) (Cons!15181 (h!16310 tuple2!9354) (t!21502 List!15185)) )
))
(declare-datatypes ((ListLongMap!8177 0))(
  ( (ListLongMap!8178 (toList!4104 List!15185)) )
))
(declare-fun lt!364485 () ListLongMap!8177)

(declare-fun getCurrentListMapNoExtraKeys!2154 (array!44570 array!44568 (_ BitVec 32) (_ BitVec 32) V!23909 V!23909 (_ BitVec 32) Int) ListLongMap!8177)

(assert (=> b!814104 (= lt!364485 (getCurrentListMapNoExtraKeys!2154 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23909)

(declare-fun lt!364484 () ListLongMap!8177)

(assert (=> b!814104 (= lt!364484 (getCurrentListMapNoExtraKeys!2154 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814105 () Bool)

(declare-fun res!556084 () Bool)

(assert (=> b!814105 (=> (not res!556084) (not e!451216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44570 (_ BitVec 32)) Bool)

(assert (=> b!814105 (= res!556084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!556085 () Bool)

(assert (=> start!70050 (=> (not res!556085) (not e!451216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70050 (= res!556085 (validMask!0 mask!1312))))

(assert (=> start!70050 e!451216))

(assert (=> start!70050 tp_is_empty!14181))

(declare-fun array_inv!17083 (array!44570) Bool)

(assert (=> start!70050 (array_inv!17083 _keys!976)))

(assert (=> start!70050 true))

(declare-fun array_inv!17084 (array!44568) Bool)

(assert (=> start!70050 (and (array_inv!17084 _values!788) e!451218)))

(assert (=> start!70050 tp!44127))

(declare-fun b!814100 () Bool)

(declare-fun res!556086 () Bool)

(assert (=> b!814100 (=> (not res!556086) (not e!451216))))

(declare-datatypes ((List!15186 0))(
  ( (Nil!15183) (Cons!15182 (h!16311 (_ BitVec 64)) (t!21503 List!15186)) )
))
(declare-fun arrayNoDuplicates!0 (array!44570 (_ BitVec 32) List!15186) Bool)

(assert (=> b!814100 (= res!556086 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15183))))

(declare-fun mapNonEmpty!22852 () Bool)

(declare-fun tp!44128 () Bool)

(declare-fun e!451217 () Bool)

(assert (=> mapNonEmpty!22852 (= mapRes!22852 (and tp!44128 e!451217))))

(declare-fun mapValue!22852 () ValueCell!6675)

(declare-fun mapRest!22852 () (Array (_ BitVec 32) ValueCell!6675))

(declare-fun mapKey!22852 () (_ BitVec 32))

(assert (=> mapNonEmpty!22852 (= (arr!21344 _values!788) (store mapRest!22852 mapKey!22852 mapValue!22852))))

(declare-fun b!814106 () Bool)

(assert (=> b!814106 (= e!451217 tp_is_empty!14181)))

(assert (= (and start!70050 res!556085) b!814102))

(assert (= (and b!814102 res!556083) b!814105))

(assert (= (and b!814105 res!556084) b!814100))

(assert (= (and b!814100 res!556086) b!814104))

(assert (= (and b!814101 condMapEmpty!22852) mapIsEmpty!22852))

(assert (= (and b!814101 (not condMapEmpty!22852)) mapNonEmpty!22852))

(get-info :version)

(assert (= (and mapNonEmpty!22852 ((_ is ValueCellFull!6675) mapValue!22852)) b!814106))

(assert (= (and b!814101 ((_ is ValueCellFull!6675) mapDefault!22852)) b!814103))

(assert (= start!70050 b!814101))

(declare-fun m!755973 () Bool)

(assert (=> b!814104 m!755973))

(declare-fun m!755975 () Bool)

(assert (=> b!814104 m!755975))

(declare-fun m!755977 () Bool)

(assert (=> mapNonEmpty!22852 m!755977))

(declare-fun m!755979 () Bool)

(assert (=> b!814105 m!755979))

(declare-fun m!755981 () Bool)

(assert (=> b!814100 m!755981))

(declare-fun m!755983 () Bool)

(assert (=> start!70050 m!755983))

(declare-fun m!755985 () Bool)

(assert (=> start!70050 m!755985))

(declare-fun m!755987 () Bool)

(assert (=> start!70050 m!755987))

(check-sat (not b_next!12471) b_and!21243 (not mapNonEmpty!22852) tp_is_empty!14181 (not b!814104) (not b!814105) (not b!814100) (not start!70050))
(check-sat b_and!21243 (not b_next!12471))
