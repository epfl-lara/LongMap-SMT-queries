; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70518 () Bool)

(assert start!70518)

(declare-fun b_free!12709 () Bool)

(declare-fun b_next!12709 () Bool)

(assert (=> start!70518 (= b_free!12709 (not b_next!12709))))

(declare-fun tp!44853 () Bool)

(declare-fun b_and!21531 () Bool)

(assert (=> start!70518 (= tp!44853 b_and!21531)))

(declare-fun b!818193 () Bool)

(declare-fun e!454069 () Bool)

(assert (=> b!818193 (= e!454069 (not true))))

(declare-datatypes ((V!24227 0))(
  ( (V!24228 (val!7257 Int)) )
))
(declare-datatypes ((tuple2!9442 0))(
  ( (tuple2!9443 (_1!4732 (_ BitVec 64)) (_2!4732 V!24227)) )
))
(declare-datatypes ((List!15254 0))(
  ( (Nil!15251) (Cons!15250 (h!16385 tuple2!9442) (t!21571 List!15254)) )
))
(declare-datatypes ((ListLongMap!8267 0))(
  ( (ListLongMap!8268 (toList!4149 List!15254)) )
))
(declare-fun lt!366545 () ListLongMap!8267)

(declare-fun lt!366546 () ListLongMap!8267)

(assert (=> b!818193 (= lt!366545 lt!366546)))

(declare-datatypes ((array!45037 0))(
  ( (array!45038 (arr!21570 (Array (_ BitVec 32) (_ BitVec 64))) (size!21990 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45037)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24227)

(declare-fun minValue!754 () V!24227)

(declare-datatypes ((ValueCell!6794 0))(
  ( (ValueCellFull!6794 (v!9686 V!24227)) (EmptyCell!6794) )
))
(declare-datatypes ((array!45039 0))(
  ( (array!45040 (arr!21571 (Array (_ BitVec 32) ValueCell!6794)) (size!21991 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45039)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27853 0))(
  ( (Unit!27854) )
))
(declare-fun lt!366544 () Unit!27853)

(declare-fun zeroValueBefore!34 () V!24227)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!336 (array!45037 array!45039 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24227 V!24227 V!24227 V!24227 (_ BitVec 32) Int) Unit!27853)

(assert (=> b!818193 (= lt!366544 (lemmaNoChangeToArrayThenSameMapNoExtras!336 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2248 (array!45037 array!45039 (_ BitVec 32) (_ BitVec 32) V!24227 V!24227 (_ BitVec 32) Int) ListLongMap!8267)

(assert (=> b!818193 (= lt!366546 (getCurrentListMapNoExtraKeys!2248 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818193 (= lt!366545 (getCurrentListMapNoExtraKeys!2248 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23221 () Bool)

(declare-fun mapRes!23221 () Bool)

(declare-fun tp!44854 () Bool)

(declare-fun e!454072 () Bool)

(assert (=> mapNonEmpty!23221 (= mapRes!23221 (and tp!44854 e!454072))))

(declare-fun mapKey!23221 () (_ BitVec 32))

(declare-fun mapRest!23221 () (Array (_ BitVec 32) ValueCell!6794))

(declare-fun mapValue!23221 () ValueCell!6794)

(assert (=> mapNonEmpty!23221 (= (arr!21571 _values!788) (store mapRest!23221 mapKey!23221 mapValue!23221))))

(declare-fun b!818194 () Bool)

(declare-fun res!558246 () Bool)

(assert (=> b!818194 (=> (not res!558246) (not e!454069))))

(declare-datatypes ((List!15255 0))(
  ( (Nil!15252) (Cons!15251 (h!16386 (_ BitVec 64)) (t!21572 List!15255)) )
))
(declare-fun arrayNoDuplicates!0 (array!45037 (_ BitVec 32) List!15255) Bool)

(assert (=> b!818194 (= res!558246 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15252))))

(declare-fun b!818195 () Bool)

(declare-fun tp_is_empty!14419 () Bool)

(assert (=> b!818195 (= e!454072 tp_is_empty!14419)))

(declare-fun b!818196 () Bool)

(declare-fun res!558248 () Bool)

(assert (=> b!818196 (=> (not res!558248) (not e!454069))))

(assert (=> b!818196 (= res!558248 (and (= (size!21991 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21990 _keys!976) (size!21991 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818197 () Bool)

(declare-fun e!454070 () Bool)

(assert (=> b!818197 (= e!454070 tp_is_empty!14419)))

(declare-fun res!558245 () Bool)

(assert (=> start!70518 (=> (not res!558245) (not e!454069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70518 (= res!558245 (validMask!0 mask!1312))))

(assert (=> start!70518 e!454069))

(assert (=> start!70518 tp_is_empty!14419))

(declare-fun array_inv!17281 (array!45037) Bool)

(assert (=> start!70518 (array_inv!17281 _keys!976)))

(assert (=> start!70518 true))

(declare-fun e!454071 () Bool)

(declare-fun array_inv!17282 (array!45039) Bool)

(assert (=> start!70518 (and (array_inv!17282 _values!788) e!454071)))

(assert (=> start!70518 tp!44853))

(declare-fun mapIsEmpty!23221 () Bool)

(assert (=> mapIsEmpty!23221 mapRes!23221))

(declare-fun b!818198 () Bool)

(declare-fun res!558247 () Bool)

(assert (=> b!818198 (=> (not res!558247) (not e!454069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45037 (_ BitVec 32)) Bool)

(assert (=> b!818198 (= res!558247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818199 () Bool)

(assert (=> b!818199 (= e!454071 (and e!454070 mapRes!23221))))

(declare-fun condMapEmpty!23221 () Bool)

(declare-fun mapDefault!23221 () ValueCell!6794)

(assert (=> b!818199 (= condMapEmpty!23221 (= (arr!21571 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6794)) mapDefault!23221)))))

(assert (= (and start!70518 res!558245) b!818196))

(assert (= (and b!818196 res!558248) b!818198))

(assert (= (and b!818198 res!558247) b!818194))

(assert (= (and b!818194 res!558246) b!818193))

(assert (= (and b!818199 condMapEmpty!23221) mapIsEmpty!23221))

(assert (= (and b!818199 (not condMapEmpty!23221)) mapNonEmpty!23221))

(get-info :version)

(assert (= (and mapNonEmpty!23221 ((_ is ValueCellFull!6794) mapValue!23221)) b!818195))

(assert (= (and b!818199 ((_ is ValueCellFull!6794) mapDefault!23221)) b!818197))

(assert (= start!70518 b!818199))

(declare-fun m!760183 () Bool)

(assert (=> b!818198 m!760183))

(declare-fun m!760185 () Bool)

(assert (=> b!818193 m!760185))

(declare-fun m!760187 () Bool)

(assert (=> b!818193 m!760187))

(declare-fun m!760189 () Bool)

(assert (=> b!818193 m!760189))

(declare-fun m!760191 () Bool)

(assert (=> mapNonEmpty!23221 m!760191))

(declare-fun m!760193 () Bool)

(assert (=> start!70518 m!760193))

(declare-fun m!760195 () Bool)

(assert (=> start!70518 m!760195))

(declare-fun m!760197 () Bool)

(assert (=> start!70518 m!760197))

(declare-fun m!760199 () Bool)

(assert (=> b!818194 m!760199))

(check-sat (not b!818198) (not b!818194) (not start!70518) (not b!818193) (not b_next!12709) b_and!21531 (not mapNonEmpty!23221) tp_is_empty!14419)
(check-sat b_and!21531 (not b_next!12709))
