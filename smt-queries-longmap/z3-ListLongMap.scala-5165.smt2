; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69944 () Bool)

(assert start!69944)

(declare-fun b_free!12397 () Bool)

(declare-fun b_next!12397 () Bool)

(assert (=> start!69944 (= b_free!12397 (not b_next!12397))))

(declare-fun tp!43902 () Bool)

(declare-fun b_and!21139 () Bool)

(assert (=> start!69944 (= tp!43902 b_and!21139)))

(declare-fun b!813004 () Bool)

(declare-fun res!555507 () Bool)

(declare-fun e!450464 () Bool)

(assert (=> b!813004 (=> (not res!555507) (not e!450464))))

(declare-datatypes ((array!44425 0))(
  ( (array!44426 (arr!21274 (Array (_ BitVec 32) (_ BitVec 64))) (size!21695 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44425)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44425 (_ BitVec 32)) Bool)

(assert (=> b!813004 (= res!555507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813005 () Bool)

(declare-fun res!555509 () Bool)

(assert (=> b!813005 (=> (not res!555509) (not e!450464))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23811 0))(
  ( (V!23812 (val!7101 Int)) )
))
(declare-datatypes ((ValueCell!6638 0))(
  ( (ValueCellFull!6638 (v!9522 V!23811)) (EmptyCell!6638) )
))
(declare-datatypes ((array!44427 0))(
  ( (array!44428 (arr!21275 (Array (_ BitVec 32) ValueCell!6638)) (size!21696 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44427)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813005 (= res!555509 (and (= (size!21696 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21695 _keys!976) (size!21696 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813006 () Bool)

(declare-fun e!450461 () Bool)

(declare-fun tp_is_empty!14107 () Bool)

(assert (=> b!813006 (= e!450461 tp_is_empty!14107)))

(declare-fun b!813007 () Bool)

(declare-fun res!555506 () Bool)

(assert (=> b!813007 (=> (not res!555506) (not e!450464))))

(declare-datatypes ((List!15170 0))(
  ( (Nil!15167) (Cons!15166 (h!16295 (_ BitVec 64)) (t!21476 List!15170)) )
))
(declare-fun arrayNoDuplicates!0 (array!44425 (_ BitVec 32) List!15170) Bool)

(assert (=> b!813007 (= res!555506 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15167))))

(declare-fun mapNonEmpty!22738 () Bool)

(declare-fun mapRes!22738 () Bool)

(declare-fun tp!43903 () Bool)

(declare-fun e!450462 () Bool)

(assert (=> mapNonEmpty!22738 (= mapRes!22738 (and tp!43903 e!450462))))

(declare-fun mapRest!22738 () (Array (_ BitVec 32) ValueCell!6638))

(declare-fun mapValue!22738 () ValueCell!6638)

(declare-fun mapKey!22738 () (_ BitVec 32))

(assert (=> mapNonEmpty!22738 (= (arr!21275 _values!788) (store mapRest!22738 mapKey!22738 mapValue!22738))))

(declare-fun b!813008 () Bool)

(assert (=> b!813008 (= e!450462 tp_is_empty!14107)))

(declare-fun b!813009 () Bool)

(assert (=> b!813009 (= e!450464 false)))

(declare-fun zeroValueBefore!34 () V!23811)

(declare-datatypes ((tuple2!9346 0))(
  ( (tuple2!9347 (_1!4684 (_ BitVec 64)) (_2!4684 V!23811)) )
))
(declare-datatypes ((List!15171 0))(
  ( (Nil!15168) (Cons!15167 (h!16296 tuple2!9346) (t!21477 List!15171)) )
))
(declare-datatypes ((ListLongMap!8159 0))(
  ( (ListLongMap!8160 (toList!4095 List!15171)) )
))
(declare-fun lt!364014 () ListLongMap!8159)

(declare-fun minValue!754 () V!23811)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2160 (array!44425 array!44427 (_ BitVec 32) (_ BitVec 32) V!23811 V!23811 (_ BitVec 32) Int) ListLongMap!8159)

(assert (=> b!813009 (= lt!364014 (getCurrentListMapNoExtraKeys!2160 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813010 () Bool)

(declare-fun e!450465 () Bool)

(assert (=> b!813010 (= e!450465 (and e!450461 mapRes!22738))))

(declare-fun condMapEmpty!22738 () Bool)

(declare-fun mapDefault!22738 () ValueCell!6638)

(assert (=> b!813010 (= condMapEmpty!22738 (= (arr!21275 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6638)) mapDefault!22738)))))

(declare-fun mapIsEmpty!22738 () Bool)

(assert (=> mapIsEmpty!22738 mapRes!22738))

(declare-fun res!555508 () Bool)

(assert (=> start!69944 (=> (not res!555508) (not e!450464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69944 (= res!555508 (validMask!0 mask!1312))))

(assert (=> start!69944 e!450464))

(assert (=> start!69944 tp_is_empty!14107))

(declare-fun array_inv!17119 (array!44425) Bool)

(assert (=> start!69944 (array_inv!17119 _keys!976)))

(assert (=> start!69944 true))

(declare-fun array_inv!17120 (array!44427) Bool)

(assert (=> start!69944 (and (array_inv!17120 _values!788) e!450465)))

(assert (=> start!69944 tp!43902))

(assert (= (and start!69944 res!555508) b!813005))

(assert (= (and b!813005 res!555509) b!813004))

(assert (= (and b!813004 res!555507) b!813007))

(assert (= (and b!813007 res!555506) b!813009))

(assert (= (and b!813010 condMapEmpty!22738) mapIsEmpty!22738))

(assert (= (and b!813010 (not condMapEmpty!22738)) mapNonEmpty!22738))

(get-info :version)

(assert (= (and mapNonEmpty!22738 ((_ is ValueCellFull!6638) mapValue!22738)) b!813008))

(assert (= (and b!813010 ((_ is ValueCellFull!6638) mapDefault!22738)) b!813006))

(assert (= start!69944 b!813010))

(declare-fun m!754603 () Bool)

(assert (=> start!69944 m!754603))

(declare-fun m!754605 () Bool)

(assert (=> start!69944 m!754605))

(declare-fun m!754607 () Bool)

(assert (=> start!69944 m!754607))

(declare-fun m!754609 () Bool)

(assert (=> b!813009 m!754609))

(declare-fun m!754611 () Bool)

(assert (=> b!813004 m!754611))

(declare-fun m!754613 () Bool)

(assert (=> mapNonEmpty!22738 m!754613))

(declare-fun m!754615 () Bool)

(assert (=> b!813007 m!754615))

(check-sat b_and!21139 tp_is_empty!14107 (not b_next!12397) (not mapNonEmpty!22738) (not b!813009) (not b!813007) (not b!813004) (not start!69944))
(check-sat b_and!21139 (not b_next!12397))
