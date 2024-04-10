; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70008 () Bool)

(assert start!70008)

(declare-fun b_free!12429 () Bool)

(declare-fun b_next!12429 () Bool)

(assert (=> start!70008 (= b_free!12429 (not b_next!12429))))

(declare-fun tp!44001 () Bool)

(declare-fun b_and!21201 () Bool)

(assert (=> start!70008 (= tp!44001 b_and!21201)))

(declare-fun res!555832 () Bool)

(declare-fun e!450900 () Bool)

(assert (=> start!70008 (=> (not res!555832) (not e!450900))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70008 (= res!555832 (validMask!0 mask!1312))))

(assert (=> start!70008 e!450900))

(declare-fun tp_is_empty!14139 () Bool)

(assert (=> start!70008 tp_is_empty!14139))

(declare-datatypes ((array!44486 0))(
  ( (array!44487 (arr!21303 (Array (_ BitVec 32) (_ BitVec 64))) (size!21724 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44486)

(declare-fun array_inv!17059 (array!44486) Bool)

(assert (=> start!70008 (array_inv!17059 _keys!976)))

(assert (=> start!70008 true))

(declare-datatypes ((V!23853 0))(
  ( (V!23854 (val!7117 Int)) )
))
(declare-datatypes ((ValueCell!6654 0))(
  ( (ValueCellFull!6654 (v!9544 V!23853)) (EmptyCell!6654) )
))
(declare-datatypes ((array!44488 0))(
  ( (array!44489 (arr!21304 (Array (_ BitVec 32) ValueCell!6654)) (size!21725 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44488)

(declare-fun e!450901 () Bool)

(declare-fun array_inv!17060 (array!44488) Bool)

(assert (=> start!70008 (and (array_inv!17060 _values!788) e!450901)))

(assert (=> start!70008 tp!44001))

(declare-fun mapIsEmpty!22789 () Bool)

(declare-fun mapRes!22789 () Bool)

(assert (=> mapIsEmpty!22789 mapRes!22789))

(declare-fun b!813659 () Bool)

(assert (=> b!813659 (= e!450900 false)))

(declare-datatypes ((tuple2!9322 0))(
  ( (tuple2!9323 (_1!4672 (_ BitVec 64)) (_2!4672 V!23853)) )
))
(declare-datatypes ((List!15153 0))(
  ( (Nil!15150) (Cons!15149 (h!16278 tuple2!9322) (t!21470 List!15153)) )
))
(declare-datatypes ((ListLongMap!8145 0))(
  ( (ListLongMap!8146 (toList!4088 List!15153)) )
))
(declare-fun lt!364358 () ListLongMap!8145)

(declare-fun zeroValueAfter!34 () V!23853)

(declare-fun minValue!754 () V!23853)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2138 (array!44486 array!44488 (_ BitVec 32) (_ BitVec 32) V!23853 V!23853 (_ BitVec 32) Int) ListLongMap!8145)

(assert (=> b!813659 (= lt!364358 (getCurrentListMapNoExtraKeys!2138 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23853)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364359 () ListLongMap!8145)

(assert (=> b!813659 (= lt!364359 (getCurrentListMapNoExtraKeys!2138 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813660 () Bool)

(declare-fun e!450899 () Bool)

(assert (=> b!813660 (= e!450901 (and e!450899 mapRes!22789))))

(declare-fun condMapEmpty!22789 () Bool)

(declare-fun mapDefault!22789 () ValueCell!6654)

(assert (=> b!813660 (= condMapEmpty!22789 (= (arr!21304 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6654)) mapDefault!22789)))))

(declare-fun b!813661 () Bool)

(declare-fun res!555831 () Bool)

(assert (=> b!813661 (=> (not res!555831) (not e!450900))))

(assert (=> b!813661 (= res!555831 (and (= (size!21725 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21724 _keys!976) (size!21725 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!813662 () Bool)

(declare-fun e!450903 () Bool)

(assert (=> b!813662 (= e!450903 tp_is_empty!14139)))

(declare-fun b!813663 () Bool)

(declare-fun res!555834 () Bool)

(assert (=> b!813663 (=> (not res!555834) (not e!450900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44486 (_ BitVec 32)) Bool)

(assert (=> b!813663 (= res!555834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22789 () Bool)

(declare-fun tp!44002 () Bool)

(assert (=> mapNonEmpty!22789 (= mapRes!22789 (and tp!44002 e!450903))))

(declare-fun mapValue!22789 () ValueCell!6654)

(declare-fun mapKey!22789 () (_ BitVec 32))

(declare-fun mapRest!22789 () (Array (_ BitVec 32) ValueCell!6654))

(assert (=> mapNonEmpty!22789 (= (arr!21304 _values!788) (store mapRest!22789 mapKey!22789 mapValue!22789))))

(declare-fun b!813664 () Bool)

(assert (=> b!813664 (= e!450899 tp_is_empty!14139)))

(declare-fun b!813665 () Bool)

(declare-fun res!555833 () Bool)

(assert (=> b!813665 (=> (not res!555833) (not e!450900))))

(declare-datatypes ((List!15154 0))(
  ( (Nil!15151) (Cons!15150 (h!16279 (_ BitVec 64)) (t!21471 List!15154)) )
))
(declare-fun arrayNoDuplicates!0 (array!44486 (_ BitVec 32) List!15154) Bool)

(assert (=> b!813665 (= res!555833 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15151))))

(assert (= (and start!70008 res!555832) b!813661))

(assert (= (and b!813661 res!555831) b!813663))

(assert (= (and b!813663 res!555834) b!813665))

(assert (= (and b!813665 res!555833) b!813659))

(assert (= (and b!813660 condMapEmpty!22789) mapIsEmpty!22789))

(assert (= (and b!813660 (not condMapEmpty!22789)) mapNonEmpty!22789))

(get-info :version)

(assert (= (and mapNonEmpty!22789 ((_ is ValueCellFull!6654) mapValue!22789)) b!813662))

(assert (= (and b!813660 ((_ is ValueCellFull!6654) mapDefault!22789)) b!813664))

(assert (= start!70008 b!813660))

(declare-fun m!755637 () Bool)

(assert (=> b!813663 m!755637))

(declare-fun m!755639 () Bool)

(assert (=> mapNonEmpty!22789 m!755639))

(declare-fun m!755641 () Bool)

(assert (=> start!70008 m!755641))

(declare-fun m!755643 () Bool)

(assert (=> start!70008 m!755643))

(declare-fun m!755645 () Bool)

(assert (=> start!70008 m!755645))

(declare-fun m!755647 () Bool)

(assert (=> b!813659 m!755647))

(declare-fun m!755649 () Bool)

(assert (=> b!813659 m!755649))

(declare-fun m!755651 () Bool)

(assert (=> b!813665 m!755651))

(check-sat b_and!21201 (not b_next!12429) (not start!70008) (not b!813659) (not b!813663) tp_is_empty!14139 (not mapNonEmpty!22789) (not b!813665))
(check-sat b_and!21201 (not b_next!12429))
