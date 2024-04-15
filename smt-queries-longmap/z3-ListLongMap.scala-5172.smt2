; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69998 () Bool)

(assert start!69998)

(declare-fun b_free!12439 () Bool)

(declare-fun b_next!12439 () Bool)

(assert (=> start!69998 (= b_free!12439 (not b_next!12439))))

(declare-fun tp!44031 () Bool)

(declare-fun b_and!21185 () Bool)

(assert (=> start!69998 (= tp!44031 b_and!21185)))

(declare-fun b!813518 () Bool)

(declare-fun res!555785 () Bool)

(declare-fun e!450827 () Bool)

(assert (=> b!813518 (=> (not res!555785) (not e!450827))))

(declare-datatypes ((array!44503 0))(
  ( (array!44504 (arr!21312 (Array (_ BitVec 32) (_ BitVec 64))) (size!21733 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44503)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44503 (_ BitVec 32)) Bool)

(assert (=> b!813518 (= res!555785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!555786 () Bool)

(assert (=> start!69998 (=> (not res!555786) (not e!450827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69998 (= res!555786 (validMask!0 mask!1312))))

(assert (=> start!69998 e!450827))

(declare-fun tp_is_empty!14149 () Bool)

(assert (=> start!69998 tp_is_empty!14149))

(declare-fun array_inv!17145 (array!44503) Bool)

(assert (=> start!69998 (array_inv!17145 _keys!976)))

(assert (=> start!69998 true))

(declare-datatypes ((V!23867 0))(
  ( (V!23868 (val!7122 Int)) )
))
(declare-datatypes ((ValueCell!6659 0))(
  ( (ValueCellFull!6659 (v!9543 V!23867)) (EmptyCell!6659) )
))
(declare-datatypes ((array!44505 0))(
  ( (array!44506 (arr!21313 (Array (_ BitVec 32) ValueCell!6659)) (size!21734 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44505)

(declare-fun e!450825 () Bool)

(declare-fun array_inv!17146 (array!44505) Bool)

(assert (=> start!69998 (and (array_inv!17146 _values!788) e!450825)))

(assert (=> start!69998 tp!44031))

(declare-fun b!813519 () Bool)

(declare-fun e!450828 () Bool)

(assert (=> b!813519 (= e!450828 tp_is_empty!14149)))

(declare-fun b!813520 () Bool)

(declare-fun res!555788 () Bool)

(assert (=> b!813520 (=> (not res!555788) (not e!450827))))

(declare-datatypes ((List!15196 0))(
  ( (Nil!15193) (Cons!15192 (h!16321 (_ BitVec 64)) (t!21504 List!15196)) )
))
(declare-fun arrayNoDuplicates!0 (array!44503 (_ BitVec 32) List!15196) Bool)

(assert (=> b!813520 (= res!555788 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15193))))

(declare-fun b!813521 () Bool)

(declare-fun e!450824 () Bool)

(declare-fun mapRes!22804 () Bool)

(assert (=> b!813521 (= e!450825 (and e!450824 mapRes!22804))))

(declare-fun condMapEmpty!22804 () Bool)

(declare-fun mapDefault!22804 () ValueCell!6659)

(assert (=> b!813521 (= condMapEmpty!22804 (= (arr!21313 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6659)) mapDefault!22804)))))

(declare-fun b!813522 () Bool)

(assert (=> b!813522 (= e!450827 false)))

(declare-fun zeroValueAfter!34 () V!23867)

(declare-fun minValue!754 () V!23867)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((tuple2!9370 0))(
  ( (tuple2!9371 (_1!4696 (_ BitVec 64)) (_2!4696 V!23867)) )
))
(declare-datatypes ((List!15197 0))(
  ( (Nil!15194) (Cons!15193 (h!16322 tuple2!9370) (t!21505 List!15197)) )
))
(declare-datatypes ((ListLongMap!8183 0))(
  ( (ListLongMap!8184 (toList!4107 List!15197)) )
))
(declare-fun lt!364145 () ListLongMap!8183)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2172 (array!44503 array!44505 (_ BitVec 32) (_ BitVec 32) V!23867 V!23867 (_ BitVec 32) Int) ListLongMap!8183)

(assert (=> b!813522 (= lt!364145 (getCurrentListMapNoExtraKeys!2172 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23867)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364146 () ListLongMap!8183)

(assert (=> b!813522 (= lt!364146 (getCurrentListMapNoExtraKeys!2172 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!22804 () Bool)

(assert (=> mapIsEmpty!22804 mapRes!22804))

(declare-fun b!813523 () Bool)

(assert (=> b!813523 (= e!450824 tp_is_empty!14149)))

(declare-fun b!813524 () Bool)

(declare-fun res!555787 () Bool)

(assert (=> b!813524 (=> (not res!555787) (not e!450827))))

(assert (=> b!813524 (= res!555787 (and (= (size!21734 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21733 _keys!976) (size!21734 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22804 () Bool)

(declare-fun tp!44032 () Bool)

(assert (=> mapNonEmpty!22804 (= mapRes!22804 (and tp!44032 e!450828))))

(declare-fun mapValue!22804 () ValueCell!6659)

(declare-fun mapRest!22804 () (Array (_ BitVec 32) ValueCell!6659))

(declare-fun mapKey!22804 () (_ BitVec 32))

(assert (=> mapNonEmpty!22804 (= (arr!21313 _values!788) (store mapRest!22804 mapKey!22804 mapValue!22804))))

(assert (= (and start!69998 res!555786) b!813524))

(assert (= (and b!813524 res!555787) b!813518))

(assert (= (and b!813518 res!555785) b!813520))

(assert (= (and b!813520 res!555788) b!813522))

(assert (= (and b!813521 condMapEmpty!22804) mapIsEmpty!22804))

(assert (= (and b!813521 (not condMapEmpty!22804)) mapNonEmpty!22804))

(get-info :version)

(assert (= (and mapNonEmpty!22804 ((_ is ValueCellFull!6659) mapValue!22804)) b!813519))

(assert (= (and b!813521 ((_ is ValueCellFull!6659) mapDefault!22804)) b!813523))

(assert (= start!69998 b!813521))

(declare-fun m!754965 () Bool)

(assert (=> mapNonEmpty!22804 m!754965))

(declare-fun m!754967 () Bool)

(assert (=> b!813522 m!754967))

(declare-fun m!754969 () Bool)

(assert (=> b!813522 m!754969))

(declare-fun m!754971 () Bool)

(assert (=> b!813520 m!754971))

(declare-fun m!754973 () Bool)

(assert (=> start!69998 m!754973))

(declare-fun m!754975 () Bool)

(assert (=> start!69998 m!754975))

(declare-fun m!754977 () Bool)

(assert (=> start!69998 m!754977))

(declare-fun m!754979 () Bool)

(assert (=> b!813518 m!754979))

(check-sat (not b_next!12439) b_and!21185 (not start!69998) (not b!813518) (not b!813520) (not b!813522) (not mapNonEmpty!22804) tp_is_empty!14149)
(check-sat b_and!21185 (not b_next!12439))
