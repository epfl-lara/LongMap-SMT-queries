; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70858 () Bool)

(assert start!70858)

(declare-fun b_free!13095 () Bool)

(declare-fun b_next!13095 () Bool)

(assert (=> start!70858 (= b_free!13095 (not b_next!13095))))

(declare-fun tp!46032 () Bool)

(declare-fun b_and!21979 () Bool)

(assert (=> start!70858 (= tp!46032 b_and!21979)))

(declare-fun res!561266 () Bool)

(declare-fun e!457657 () Bool)

(assert (=> start!70858 (=> (not res!561266) (not e!457657))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70858 (= res!561266 (validMask!0 mask!1312))))

(assert (=> start!70858 e!457657))

(declare-fun tp_is_empty!14805 () Bool)

(assert (=> start!70858 tp_is_empty!14805))

(declare-datatypes ((array!45804 0))(
  ( (array!45805 (arr!21951 (Array (_ BitVec 32) (_ BitVec 64))) (size!22372 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45804)

(declare-fun array_inv!17533 (array!45804) Bool)

(assert (=> start!70858 (array_inv!17533 _keys!976)))

(assert (=> start!70858 true))

(declare-datatypes ((V!24741 0))(
  ( (V!24742 (val!7450 Int)) )
))
(declare-datatypes ((ValueCell!6987 0))(
  ( (ValueCellFull!6987 (v!9882 V!24741)) (EmptyCell!6987) )
))
(declare-datatypes ((array!45806 0))(
  ( (array!45807 (arr!21952 (Array (_ BitVec 32) ValueCell!6987)) (size!22373 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45806)

(declare-fun e!457653 () Bool)

(declare-fun array_inv!17534 (array!45806) Bool)

(assert (=> start!70858 (and (array_inv!17534 _values!788) e!457653)))

(assert (=> start!70858 tp!46032))

(declare-fun b!822995 () Bool)

(declare-fun e!457658 () Bool)

(declare-fun mapRes!23821 () Bool)

(assert (=> b!822995 (= e!457653 (and e!457658 mapRes!23821))))

(declare-fun condMapEmpty!23821 () Bool)

(declare-fun mapDefault!23821 () ValueCell!6987)

(assert (=> b!822995 (= condMapEmpty!23821 (= (arr!21952 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6987)) mapDefault!23821)))))

(declare-fun b!822996 () Bool)

(declare-fun e!457656 () Bool)

(assert (=> b!822996 (= e!457656 true)))

(declare-datatypes ((tuple2!9846 0))(
  ( (tuple2!9847 (_1!4934 (_ BitVec 64)) (_2!4934 V!24741)) )
))
(declare-datatypes ((List!15659 0))(
  ( (Nil!15656) (Cons!15655 (h!16784 tuple2!9846) (t!21998 List!15659)) )
))
(declare-datatypes ((ListLongMap!8669 0))(
  ( (ListLongMap!8670 (toList!4350 List!15659)) )
))
(declare-fun lt!370742 () ListLongMap!8669)

(declare-fun lt!370733 () ListLongMap!8669)

(declare-fun lt!370739 () tuple2!9846)

(declare-fun +!1899 (ListLongMap!8669 tuple2!9846) ListLongMap!8669)

(assert (=> b!822996 (= lt!370742 (+!1899 lt!370733 lt!370739))))

(declare-fun zeroValueAfter!34 () V!24741)

(declare-fun minValue!754 () V!24741)

(declare-fun lt!370740 () ListLongMap!8669)

(declare-datatypes ((Unit!28166 0))(
  ( (Unit!28167) )
))
(declare-fun lt!370735 () Unit!28166)

(declare-fun addCommutativeForDiffKeys!462 (ListLongMap!8669 (_ BitVec 64) V!24741 (_ BitVec 64) V!24741) Unit!28166)

(assert (=> b!822996 (= lt!370735 (addCommutativeForDiffKeys!462 lt!370740 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370736 () ListLongMap!8669)

(assert (=> b!822996 (= lt!370736 lt!370742)))

(declare-fun lt!370737 () tuple2!9846)

(assert (=> b!822996 (= lt!370742 (+!1899 (+!1899 lt!370740 lt!370739) lt!370737))))

(assert (=> b!822996 (= lt!370739 (tuple2!9847 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370741 () ListLongMap!8669)

(assert (=> b!822996 (= lt!370741 lt!370733)))

(assert (=> b!822996 (= lt!370733 (+!1899 lt!370740 lt!370737))))

(assert (=> b!822996 (= lt!370737 (tuple2!9847 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2513 (array!45804 array!45806 (_ BitVec 32) (_ BitVec 32) V!24741 V!24741 (_ BitVec 32) Int) ListLongMap!8669)

(assert (=> b!822996 (= lt!370736 (getCurrentListMap!2513 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24741)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822996 (= lt!370741 (getCurrentListMap!2513 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822997 () Bool)

(assert (=> b!822997 (= e!457658 tp_is_empty!14805)))

(declare-fun b!822998 () Bool)

(assert (=> b!822998 (= e!457657 (not e!457656))))

(declare-fun res!561265 () Bool)

(assert (=> b!822998 (=> res!561265 e!457656)))

(assert (=> b!822998 (= res!561265 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370738 () ListLongMap!8669)

(assert (=> b!822998 (= lt!370740 lt!370738)))

(declare-fun lt!370734 () Unit!28166)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!477 (array!45804 array!45806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24741 V!24741 V!24741 V!24741 (_ BitVec 32) Int) Unit!28166)

(assert (=> b!822998 (= lt!370734 (lemmaNoChangeToArrayThenSameMapNoExtras!477 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2367 (array!45804 array!45806 (_ BitVec 32) (_ BitVec 32) V!24741 V!24741 (_ BitVec 32) Int) ListLongMap!8669)

(assert (=> b!822998 (= lt!370738 (getCurrentListMapNoExtraKeys!2367 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822998 (= lt!370740 (getCurrentListMapNoExtraKeys!2367 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822999 () Bool)

(declare-fun res!561264 () Bool)

(assert (=> b!822999 (=> (not res!561264) (not e!457657))))

(declare-datatypes ((List!15660 0))(
  ( (Nil!15657) (Cons!15656 (h!16785 (_ BitVec 64)) (t!21999 List!15660)) )
))
(declare-fun arrayNoDuplicates!0 (array!45804 (_ BitVec 32) List!15660) Bool)

(assert (=> b!822999 (= res!561264 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15657))))

(declare-fun b!823000 () Bool)

(declare-fun res!561267 () Bool)

(assert (=> b!823000 (=> (not res!561267) (not e!457657))))

(assert (=> b!823000 (= res!561267 (and (= (size!22373 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22372 _keys!976) (size!22373 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823001 () Bool)

(declare-fun e!457655 () Bool)

(assert (=> b!823001 (= e!457655 tp_is_empty!14805)))

(declare-fun mapNonEmpty!23821 () Bool)

(declare-fun tp!46033 () Bool)

(assert (=> mapNonEmpty!23821 (= mapRes!23821 (and tp!46033 e!457655))))

(declare-fun mapKey!23821 () (_ BitVec 32))

(declare-fun mapValue!23821 () ValueCell!6987)

(declare-fun mapRest!23821 () (Array (_ BitVec 32) ValueCell!6987))

(assert (=> mapNonEmpty!23821 (= (arr!21952 _values!788) (store mapRest!23821 mapKey!23821 mapValue!23821))))

(declare-fun mapIsEmpty!23821 () Bool)

(assert (=> mapIsEmpty!23821 mapRes!23821))

(declare-fun b!823002 () Bool)

(declare-fun res!561268 () Bool)

(assert (=> b!823002 (=> (not res!561268) (not e!457657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45804 (_ BitVec 32)) Bool)

(assert (=> b!823002 (= res!561268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!70858 res!561266) b!823000))

(assert (= (and b!823000 res!561267) b!823002))

(assert (= (and b!823002 res!561268) b!822999))

(assert (= (and b!822999 res!561264) b!822998))

(assert (= (and b!822998 (not res!561265)) b!822996))

(assert (= (and b!822995 condMapEmpty!23821) mapIsEmpty!23821))

(assert (= (and b!822995 (not condMapEmpty!23821)) mapNonEmpty!23821))

(get-info :version)

(assert (= (and mapNonEmpty!23821 ((_ is ValueCellFull!6987) mapValue!23821)) b!823001))

(assert (= (and b!822995 ((_ is ValueCellFull!6987) mapDefault!23821)) b!822997))

(assert (= start!70858 b!822995))

(declare-fun m!765009 () Bool)

(assert (=> b!823002 m!765009))

(declare-fun m!765011 () Bool)

(assert (=> b!822998 m!765011))

(declare-fun m!765013 () Bool)

(assert (=> b!822998 m!765013))

(declare-fun m!765015 () Bool)

(assert (=> b!822998 m!765015))

(declare-fun m!765017 () Bool)

(assert (=> b!822996 m!765017))

(declare-fun m!765019 () Bool)

(assert (=> b!822996 m!765019))

(declare-fun m!765021 () Bool)

(assert (=> b!822996 m!765021))

(assert (=> b!822996 m!765021))

(declare-fun m!765023 () Bool)

(assert (=> b!822996 m!765023))

(declare-fun m!765025 () Bool)

(assert (=> b!822996 m!765025))

(declare-fun m!765027 () Bool)

(assert (=> b!822996 m!765027))

(declare-fun m!765029 () Bool)

(assert (=> b!822996 m!765029))

(declare-fun m!765031 () Bool)

(assert (=> start!70858 m!765031))

(declare-fun m!765033 () Bool)

(assert (=> start!70858 m!765033))

(declare-fun m!765035 () Bool)

(assert (=> start!70858 m!765035))

(declare-fun m!765037 () Bool)

(assert (=> b!822999 m!765037))

(declare-fun m!765039 () Bool)

(assert (=> mapNonEmpty!23821 m!765039))

(check-sat (not b!822998) (not b!822996) (not mapNonEmpty!23821) (not b_next!13095) (not start!70858) (not b!823002) tp_is_empty!14805 b_and!21979 (not b!822999))
(check-sat b_and!21979 (not b_next!13095))
