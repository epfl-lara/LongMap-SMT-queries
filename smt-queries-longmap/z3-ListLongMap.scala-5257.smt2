; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70664 () Bool)

(assert start!70664)

(declare-fun b_free!12951 () Bool)

(declare-fun b_next!12951 () Bool)

(assert (=> start!70664 (= b_free!12951 (not b_next!12951))))

(declare-fun tp!45592 () Bool)

(declare-fun b_and!21805 () Bool)

(assert (=> start!70664 (= tp!45592 b_and!21805)))

(declare-fun b!820866 () Bool)

(declare-fun res!560030 () Bool)

(declare-fun e!456110 () Bool)

(assert (=> b!820866 (=> (not res!560030) (not e!456110))))

(declare-datatypes ((array!45516 0))(
  ( (array!45517 (arr!21810 (Array (_ BitVec 32) (_ BitVec 64))) (size!22231 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45516)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45516 (_ BitVec 32)) Bool)

(assert (=> b!820866 (= res!560030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!560031 () Bool)

(assert (=> start!70664 (=> (not res!560031) (not e!456110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70664 (= res!560031 (validMask!0 mask!1312))))

(assert (=> start!70664 e!456110))

(declare-fun tp_is_empty!14661 () Bool)

(assert (=> start!70664 tp_is_empty!14661))

(declare-fun array_inv!17433 (array!45516) Bool)

(assert (=> start!70664 (array_inv!17433 _keys!976)))

(assert (=> start!70664 true))

(declare-datatypes ((V!24549 0))(
  ( (V!24550 (val!7378 Int)) )
))
(declare-datatypes ((ValueCell!6915 0))(
  ( (ValueCellFull!6915 (v!9809 V!24549)) (EmptyCell!6915) )
))
(declare-datatypes ((array!45518 0))(
  ( (array!45519 (arr!21811 (Array (_ BitVec 32) ValueCell!6915)) (size!22232 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45518)

(declare-fun e!456109 () Bool)

(declare-fun array_inv!17434 (array!45518) Bool)

(assert (=> start!70664 (and (array_inv!17434 _values!788) e!456109)))

(assert (=> start!70664 tp!45592))

(declare-fun b!820867 () Bool)

(declare-fun res!560032 () Bool)

(assert (=> b!820867 (=> (not res!560032) (not e!456110))))

(declare-datatypes ((List!15546 0))(
  ( (Nil!15543) (Cons!15542 (h!16671 (_ BitVec 64)) (t!21879 List!15546)) )
))
(declare-fun arrayNoDuplicates!0 (array!45516 (_ BitVec 32) List!15546) Bool)

(assert (=> b!820867 (= res!560032 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15543))))

(declare-fun mapNonEmpty!23596 () Bool)

(declare-fun mapRes!23596 () Bool)

(declare-fun tp!45591 () Bool)

(declare-fun e!456112 () Bool)

(assert (=> mapNonEmpty!23596 (= mapRes!23596 (and tp!45591 e!456112))))

(declare-fun mapKey!23596 () (_ BitVec 32))

(declare-fun mapValue!23596 () ValueCell!6915)

(declare-fun mapRest!23596 () (Array (_ BitVec 32) ValueCell!6915))

(assert (=> mapNonEmpty!23596 (= (arr!21811 _values!788) (store mapRest!23596 mapKey!23596 mapValue!23596))))

(declare-fun b!820868 () Bool)

(declare-fun e!456108 () Bool)

(assert (=> b!820868 (= e!456108 tp_is_empty!14661)))

(declare-fun b!820869 () Bool)

(assert (=> b!820869 (= e!456109 (and e!456108 mapRes!23596))))

(declare-fun condMapEmpty!23596 () Bool)

(declare-fun mapDefault!23596 () ValueCell!6915)

(assert (=> b!820869 (= condMapEmpty!23596 (= (arr!21811 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6915)) mapDefault!23596)))))

(declare-fun mapIsEmpty!23596 () Bool)

(assert (=> mapIsEmpty!23596 mapRes!23596))

(declare-fun b!820870 () Bool)

(declare-fun res!560029 () Bool)

(assert (=> b!820870 (=> (not res!560029) (not e!456110))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820870 (= res!560029 (and (= (size!22232 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22231 _keys!976) (size!22232 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820871 () Bool)

(assert (=> b!820871 (= e!456112 tp_is_empty!14661)))

(declare-fun b!820872 () Bool)

(assert (=> b!820872 (= e!456110 (not true))))

(declare-datatypes ((tuple2!9726 0))(
  ( (tuple2!9727 (_1!4874 (_ BitVec 64)) (_2!4874 V!24549)) )
))
(declare-datatypes ((List!15547 0))(
  ( (Nil!15544) (Cons!15543 (h!16672 tuple2!9726) (t!21880 List!15547)) )
))
(declare-datatypes ((ListLongMap!8549 0))(
  ( (ListLongMap!8550 (toList!4290 List!15547)) )
))
(declare-fun lt!368948 () ListLongMap!8549)

(declare-fun lt!368950 () ListLongMap!8549)

(assert (=> b!820872 (= lt!368948 lt!368950)))

(declare-fun zeroValueBefore!34 () V!24549)

(declare-fun zeroValueAfter!34 () V!24549)

(declare-fun minValue!754 () V!24549)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28057 0))(
  ( (Unit!28058) )
))
(declare-fun lt!368949 () Unit!28057)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!426 (array!45516 array!45518 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24549 V!24549 V!24549 V!24549 (_ BitVec 32) Int) Unit!28057)

(assert (=> b!820872 (= lt!368949 (lemmaNoChangeToArrayThenSameMapNoExtras!426 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2316 (array!45516 array!45518 (_ BitVec 32) (_ BitVec 32) V!24549 V!24549 (_ BitVec 32) Int) ListLongMap!8549)

(assert (=> b!820872 (= lt!368950 (getCurrentListMapNoExtraKeys!2316 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820872 (= lt!368948 (getCurrentListMapNoExtraKeys!2316 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70664 res!560031) b!820870))

(assert (= (and b!820870 res!560029) b!820866))

(assert (= (and b!820866 res!560030) b!820867))

(assert (= (and b!820867 res!560032) b!820872))

(assert (= (and b!820869 condMapEmpty!23596) mapIsEmpty!23596))

(assert (= (and b!820869 (not condMapEmpty!23596)) mapNonEmpty!23596))

(get-info :version)

(assert (= (and mapNonEmpty!23596 ((_ is ValueCellFull!6915) mapValue!23596)) b!820871))

(assert (= (and b!820869 ((_ is ValueCellFull!6915) mapDefault!23596)) b!820868))

(assert (= start!70664 b!820869))

(declare-fun m!762759 () Bool)

(assert (=> start!70664 m!762759))

(declare-fun m!762761 () Bool)

(assert (=> start!70664 m!762761))

(declare-fun m!762763 () Bool)

(assert (=> start!70664 m!762763))

(declare-fun m!762765 () Bool)

(assert (=> b!820866 m!762765))

(declare-fun m!762767 () Bool)

(assert (=> b!820872 m!762767))

(declare-fun m!762769 () Bool)

(assert (=> b!820872 m!762769))

(declare-fun m!762771 () Bool)

(assert (=> b!820872 m!762771))

(declare-fun m!762773 () Bool)

(assert (=> mapNonEmpty!23596 m!762773))

(declare-fun m!762775 () Bool)

(assert (=> b!820867 m!762775))

(check-sat (not start!70664) (not b_next!12951) (not b!820867) (not b!820866) tp_is_empty!14661 (not mapNonEmpty!23596) b_and!21805 (not b!820872))
(check-sat b_and!21805 (not b_next!12951))
