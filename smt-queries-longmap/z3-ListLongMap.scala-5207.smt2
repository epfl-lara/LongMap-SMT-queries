; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70276 () Bool)

(assert start!70276)

(declare-fun b_free!12651 () Bool)

(declare-fun b_next!12651 () Bool)

(assert (=> start!70276 (= b_free!12651 (not b_next!12651))))

(declare-fun tp!44676 () Bool)

(declare-fun b_and!21451 () Bool)

(assert (=> start!70276 (= tp!44676 b_and!21451)))

(declare-fun b!816439 () Bool)

(declare-fun res!557402 () Bool)

(declare-fun e!452879 () Bool)

(assert (=> b!816439 (=> (not res!557402) (not e!452879))))

(declare-datatypes ((array!44924 0))(
  ( (array!44925 (arr!21519 (Array (_ BitVec 32) (_ BitVec 64))) (size!21940 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44924)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24149 0))(
  ( (V!24150 (val!7228 Int)) )
))
(declare-datatypes ((ValueCell!6765 0))(
  ( (ValueCellFull!6765 (v!9656 V!24149)) (EmptyCell!6765) )
))
(declare-datatypes ((array!44926 0))(
  ( (array!44927 (arr!21520 (Array (_ BitVec 32) ValueCell!6765)) (size!21941 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44926)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816439 (= res!557402 (and (= (size!21941 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21940 _keys!976) (size!21941 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816440 () Bool)

(declare-fun res!557405 () Bool)

(assert (=> b!816440 (=> (not res!557405) (not e!452879))))

(declare-datatypes ((List!15325 0))(
  ( (Nil!15322) (Cons!15321 (h!16450 (_ BitVec 64)) (t!21648 List!15325)) )
))
(declare-fun arrayNoDuplicates!0 (array!44924 (_ BitVec 32) List!15325) Bool)

(assert (=> b!816440 (= res!557405 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15322))))

(declare-fun b!816441 () Bool)

(declare-fun e!452881 () Bool)

(declare-fun tp_is_empty!14361 () Bool)

(assert (=> b!816441 (= e!452881 tp_is_empty!14361)))

(declare-fun b!816442 () Bool)

(declare-fun res!557406 () Bool)

(assert (=> b!816442 (=> (not res!557406) (not e!452879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44924 (_ BitVec 32)) Bool)

(assert (=> b!816442 (= res!557406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816443 () Bool)

(declare-fun e!452884 () Bool)

(assert (=> b!816443 (= e!452884 tp_is_empty!14361)))

(declare-fun mapIsEmpty!23131 () Bool)

(declare-fun mapRes!23131 () Bool)

(assert (=> mapIsEmpty!23131 mapRes!23131))

(declare-fun b!816444 () Bool)

(declare-fun e!452882 () Bool)

(assert (=> b!816444 (= e!452882 true)))

(declare-fun zeroValueAfter!34 () V!24149)

(declare-fun defaultEntry!796 () Int)

(declare-fun minValue!754 () V!24149)

(declare-datatypes ((tuple2!9496 0))(
  ( (tuple2!9497 (_1!4759 (_ BitVec 64)) (_2!4759 V!24149)) )
))
(declare-datatypes ((List!15326 0))(
  ( (Nil!15323) (Cons!15322 (h!16451 tuple2!9496) (t!21649 List!15326)) )
))
(declare-datatypes ((ListLongMap!8319 0))(
  ( (ListLongMap!8320 (toList!4175 List!15326)) )
))
(declare-fun lt!365674 () ListLongMap!8319)

(declare-fun getCurrentListMap!2400 (array!44924 array!44926 (_ BitVec 32) (_ BitVec 32) V!24149 V!24149 (_ BitVec 32) Int) ListLongMap!8319)

(assert (=> b!816444 (= lt!365674 (getCurrentListMap!2400 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24149)

(declare-fun lt!365676 () ListLongMap!8319)

(declare-fun +!1806 (ListLongMap!8319 tuple2!9496) ListLongMap!8319)

(assert (=> b!816444 (= lt!365676 (+!1806 (getCurrentListMap!2400 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9497 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816445 () Bool)

(assert (=> b!816445 (= e!452879 (not e!452882))))

(declare-fun res!557403 () Bool)

(assert (=> b!816445 (=> res!557403 e!452882)))

(assert (=> b!816445 (= res!557403 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365675 () ListLongMap!8319)

(declare-fun lt!365673 () ListLongMap!8319)

(assert (=> b!816445 (= lt!365675 lt!365673)))

(declare-datatypes ((Unit!27838 0))(
  ( (Unit!27839) )
))
(declare-fun lt!365677 () Unit!27838)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!329 (array!44924 array!44926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24149 V!24149 V!24149 V!24149 (_ BitVec 32) Int) Unit!27838)

(assert (=> b!816445 (= lt!365677 (lemmaNoChangeToArrayThenSameMapNoExtras!329 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2219 (array!44924 array!44926 (_ BitVec 32) (_ BitVec 32) V!24149 V!24149 (_ BitVec 32) Int) ListLongMap!8319)

(assert (=> b!816445 (= lt!365673 (getCurrentListMapNoExtraKeys!2219 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816445 (= lt!365675 (getCurrentListMapNoExtraKeys!2219 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816446 () Bool)

(declare-fun e!452883 () Bool)

(assert (=> b!816446 (= e!452883 (and e!452881 mapRes!23131))))

(declare-fun condMapEmpty!23131 () Bool)

(declare-fun mapDefault!23131 () ValueCell!6765)

(assert (=> b!816446 (= condMapEmpty!23131 (= (arr!21520 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6765)) mapDefault!23131)))))

(declare-fun mapNonEmpty!23131 () Bool)

(declare-fun tp!44677 () Bool)

(assert (=> mapNonEmpty!23131 (= mapRes!23131 (and tp!44677 e!452884))))

(declare-fun mapValue!23131 () ValueCell!6765)

(declare-fun mapRest!23131 () (Array (_ BitVec 32) ValueCell!6765))

(declare-fun mapKey!23131 () (_ BitVec 32))

(assert (=> mapNonEmpty!23131 (= (arr!21520 _values!788) (store mapRest!23131 mapKey!23131 mapValue!23131))))

(declare-fun res!557404 () Bool)

(assert (=> start!70276 (=> (not res!557404) (not e!452879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70276 (= res!557404 (validMask!0 mask!1312))))

(assert (=> start!70276 e!452879))

(assert (=> start!70276 tp_is_empty!14361))

(declare-fun array_inv!17219 (array!44924) Bool)

(assert (=> start!70276 (array_inv!17219 _keys!976)))

(assert (=> start!70276 true))

(declare-fun array_inv!17220 (array!44926) Bool)

(assert (=> start!70276 (and (array_inv!17220 _values!788) e!452883)))

(assert (=> start!70276 tp!44676))

(assert (= (and start!70276 res!557404) b!816439))

(assert (= (and b!816439 res!557402) b!816442))

(assert (= (and b!816442 res!557406) b!816440))

(assert (= (and b!816440 res!557405) b!816445))

(assert (= (and b!816445 (not res!557403)) b!816444))

(assert (= (and b!816446 condMapEmpty!23131) mapIsEmpty!23131))

(assert (= (and b!816446 (not condMapEmpty!23131)) mapNonEmpty!23131))

(get-info :version)

(assert (= (and mapNonEmpty!23131 ((_ is ValueCellFull!6765) mapValue!23131)) b!816443))

(assert (= (and b!816446 ((_ is ValueCellFull!6765) mapDefault!23131)) b!816441))

(assert (= start!70276 b!816446))

(declare-fun m!758071 () Bool)

(assert (=> start!70276 m!758071))

(declare-fun m!758073 () Bool)

(assert (=> start!70276 m!758073))

(declare-fun m!758075 () Bool)

(assert (=> start!70276 m!758075))

(declare-fun m!758077 () Bool)

(assert (=> b!816440 m!758077))

(declare-fun m!758079 () Bool)

(assert (=> b!816442 m!758079))

(declare-fun m!758081 () Bool)

(assert (=> b!816445 m!758081))

(declare-fun m!758083 () Bool)

(assert (=> b!816445 m!758083))

(declare-fun m!758085 () Bool)

(assert (=> b!816445 m!758085))

(declare-fun m!758087 () Bool)

(assert (=> mapNonEmpty!23131 m!758087))

(declare-fun m!758089 () Bool)

(assert (=> b!816444 m!758089))

(declare-fun m!758091 () Bool)

(assert (=> b!816444 m!758091))

(assert (=> b!816444 m!758091))

(declare-fun m!758093 () Bool)

(assert (=> b!816444 m!758093))

(check-sat b_and!21451 (not b!816442) tp_is_empty!14361 (not b!816445) (not start!70276) (not b!816440) (not b_next!12651) (not mapNonEmpty!23131) (not b!816444))
(check-sat b_and!21451 (not b_next!12651))
