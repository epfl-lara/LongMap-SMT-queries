; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71016 () Bool)

(assert start!71016)

(declare-fun b_free!13087 () Bool)

(declare-fun b_next!13087 () Bool)

(assert (=> start!71016 (= b_free!13087 (not b_next!13087))))

(declare-fun tp!46009 () Bool)

(declare-fun b_and!21981 () Bool)

(assert (=> start!71016 (= tp!46009 b_and!21981)))

(declare-fun b!823793 () Bool)

(declare-fun res!561551 () Bool)

(declare-fun e!458161 () Bool)

(assert (=> b!823793 (=> (not res!561551) (not e!458161))))

(declare-datatypes ((array!45791 0))(
  ( (array!45792 (arr!21940 (Array (_ BitVec 32) (_ BitVec 64))) (size!22360 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45791)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45791 (_ BitVec 32)) Bool)

(assert (=> b!823793 (= res!561551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823794 () Bool)

(declare-fun e!458162 () Bool)

(declare-fun e!458164 () Bool)

(declare-fun mapRes!23809 () Bool)

(assert (=> b!823794 (= e!458162 (and e!458164 mapRes!23809))))

(declare-fun condMapEmpty!23809 () Bool)

(declare-datatypes ((V!24731 0))(
  ( (V!24732 (val!7446 Int)) )
))
(declare-datatypes ((ValueCell!6983 0))(
  ( (ValueCellFull!6983 (v!9878 V!24731)) (EmptyCell!6983) )
))
(declare-datatypes ((array!45793 0))(
  ( (array!45794 (arr!21941 (Array (_ BitVec 32) ValueCell!6983)) (size!22361 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45793)

(declare-fun mapDefault!23809 () ValueCell!6983)

(assert (=> b!823794 (= condMapEmpty!23809 (= (arr!21941 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6983)) mapDefault!23809)))))

(declare-fun b!823795 () Bool)

(declare-fun tp_is_empty!14797 () Bool)

(assert (=> b!823795 (= e!458164 tp_is_empty!14797)))

(declare-fun res!561550 () Bool)

(assert (=> start!71016 (=> (not res!561550) (not e!458161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71016 (= res!561550 (validMask!0 mask!1312))))

(assert (=> start!71016 e!458161))

(assert (=> start!71016 tp_is_empty!14797))

(declare-fun array_inv!17551 (array!45791) Bool)

(assert (=> start!71016 (array_inv!17551 _keys!976)))

(assert (=> start!71016 true))

(declare-fun array_inv!17552 (array!45793) Bool)

(assert (=> start!71016 (and (array_inv!17552 _values!788) e!458162)))

(assert (=> start!71016 tp!46009))

(declare-fun b!823796 () Bool)

(declare-fun e!458163 () Bool)

(assert (=> b!823796 (= e!458163 true)))

(declare-datatypes ((tuple2!9758 0))(
  ( (tuple2!9759 (_1!4890 (_ BitVec 64)) (_2!4890 V!24731)) )
))
(declare-datatypes ((List!15544 0))(
  ( (Nil!15541) (Cons!15540 (h!16675 tuple2!9758) (t!21875 List!15544)) )
))
(declare-datatypes ((ListLongMap!8583 0))(
  ( (ListLongMap!8584 (toList!4307 List!15544)) )
))
(declare-fun lt!370973 () ListLongMap!8583)

(declare-fun lt!370968 () ListLongMap!8583)

(declare-fun lt!370976 () tuple2!9758)

(declare-fun +!1896 (ListLongMap!8583 tuple2!9758) ListLongMap!8583)

(assert (=> b!823796 (= lt!370973 (+!1896 lt!370968 lt!370976))))

(declare-fun lt!370975 () ListLongMap!8583)

(declare-fun zeroValueAfter!34 () V!24731)

(declare-fun minValue!754 () V!24731)

(declare-datatypes ((Unit!28165 0))(
  ( (Unit!28166) )
))
(declare-fun lt!370970 () Unit!28165)

(declare-fun addCommutativeForDiffKeys!454 (ListLongMap!8583 (_ BitVec 64) V!24731 (_ BitVec 64) V!24731) Unit!28165)

(assert (=> b!823796 (= lt!370970 (addCommutativeForDiffKeys!454 lt!370975 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370972 () ListLongMap!8583)

(assert (=> b!823796 (= lt!370972 lt!370973)))

(declare-fun lt!370974 () tuple2!9758)

(assert (=> b!823796 (= lt!370973 (+!1896 (+!1896 lt!370975 lt!370976) lt!370974))))

(assert (=> b!823796 (= lt!370976 (tuple2!9759 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370967 () ListLongMap!8583)

(assert (=> b!823796 (= lt!370967 lt!370968)))

(assert (=> b!823796 (= lt!370968 (+!1896 lt!370975 lt!370974))))

(assert (=> b!823796 (= lt!370974 (tuple2!9759 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2460 (array!45791 array!45793 (_ BitVec 32) (_ BitVec 32) V!24731 V!24731 (_ BitVec 32) Int) ListLongMap!8583)

(assert (=> b!823796 (= lt!370972 (getCurrentListMap!2460 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24731)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823796 (= lt!370967 (getCurrentListMap!2460 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23809 () Bool)

(declare-fun tp!46008 () Bool)

(declare-fun e!458160 () Bool)

(assert (=> mapNonEmpty!23809 (= mapRes!23809 (and tp!46008 e!458160))))

(declare-fun mapValue!23809 () ValueCell!6983)

(declare-fun mapRest!23809 () (Array (_ BitVec 32) ValueCell!6983))

(declare-fun mapKey!23809 () (_ BitVec 32))

(assert (=> mapNonEmpty!23809 (= (arr!21941 _values!788) (store mapRest!23809 mapKey!23809 mapValue!23809))))

(declare-fun b!823797 () Bool)

(assert (=> b!823797 (= e!458161 (not e!458163))))

(declare-fun res!561553 () Bool)

(assert (=> b!823797 (=> res!561553 e!458163)))

(assert (=> b!823797 (= res!561553 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370969 () ListLongMap!8583)

(assert (=> b!823797 (= lt!370975 lt!370969)))

(declare-fun lt!370971 () Unit!28165)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!479 (array!45791 array!45793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24731 V!24731 V!24731 V!24731 (_ BitVec 32) Int) Unit!28165)

(assert (=> b!823797 (= lt!370971 (lemmaNoChangeToArrayThenSameMapNoExtras!479 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2391 (array!45791 array!45793 (_ BitVec 32) (_ BitVec 32) V!24731 V!24731 (_ BitVec 32) Int) ListLongMap!8583)

(assert (=> b!823797 (= lt!370969 (getCurrentListMapNoExtraKeys!2391 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823797 (= lt!370975 (getCurrentListMapNoExtraKeys!2391 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823798 () Bool)

(assert (=> b!823798 (= e!458160 tp_is_empty!14797)))

(declare-fun mapIsEmpty!23809 () Bool)

(assert (=> mapIsEmpty!23809 mapRes!23809))

(declare-fun b!823799 () Bool)

(declare-fun res!561554 () Bool)

(assert (=> b!823799 (=> (not res!561554) (not e!458161))))

(declare-datatypes ((List!15545 0))(
  ( (Nil!15542) (Cons!15541 (h!16676 (_ BitVec 64)) (t!21876 List!15545)) )
))
(declare-fun arrayNoDuplicates!0 (array!45791 (_ BitVec 32) List!15545) Bool)

(assert (=> b!823799 (= res!561554 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15542))))

(declare-fun b!823800 () Bool)

(declare-fun res!561552 () Bool)

(assert (=> b!823800 (=> (not res!561552) (not e!458161))))

(assert (=> b!823800 (= res!561552 (and (= (size!22361 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22360 _keys!976) (size!22361 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71016 res!561550) b!823800))

(assert (= (and b!823800 res!561552) b!823793))

(assert (= (and b!823793 res!561551) b!823799))

(assert (= (and b!823799 res!561554) b!823797))

(assert (= (and b!823797 (not res!561553)) b!823796))

(assert (= (and b!823794 condMapEmpty!23809) mapIsEmpty!23809))

(assert (= (and b!823794 (not condMapEmpty!23809)) mapNonEmpty!23809))

(get-info :version)

(assert (= (and mapNonEmpty!23809 ((_ is ValueCellFull!6983) mapValue!23809)) b!823798))

(assert (= (and b!823794 ((_ is ValueCellFull!6983) mapDefault!23809)) b!823795))

(assert (= start!71016 b!823794))

(declare-fun m!766163 () Bool)

(assert (=> b!823799 m!766163))

(declare-fun m!766165 () Bool)

(assert (=> b!823797 m!766165))

(declare-fun m!766167 () Bool)

(assert (=> b!823797 m!766167))

(declare-fun m!766169 () Bool)

(assert (=> b!823797 m!766169))

(declare-fun m!766171 () Bool)

(assert (=> b!823793 m!766171))

(declare-fun m!766173 () Bool)

(assert (=> start!71016 m!766173))

(declare-fun m!766175 () Bool)

(assert (=> start!71016 m!766175))

(declare-fun m!766177 () Bool)

(assert (=> start!71016 m!766177))

(declare-fun m!766179 () Bool)

(assert (=> mapNonEmpty!23809 m!766179))

(declare-fun m!766181 () Bool)

(assert (=> b!823796 m!766181))

(declare-fun m!766183 () Bool)

(assert (=> b!823796 m!766183))

(declare-fun m!766185 () Bool)

(assert (=> b!823796 m!766185))

(declare-fun m!766187 () Bool)

(assert (=> b!823796 m!766187))

(assert (=> b!823796 m!766185))

(declare-fun m!766189 () Bool)

(assert (=> b!823796 m!766189))

(declare-fun m!766191 () Bool)

(assert (=> b!823796 m!766191))

(declare-fun m!766193 () Bool)

(assert (=> b!823796 m!766193))

(check-sat (not b_next!13087) (not b!823797) b_and!21981 (not b!823796) (not start!71016) tp_is_empty!14797 (not b!823793) (not b!823799) (not mapNonEmpty!23809))
(check-sat b_and!21981 (not b_next!13087))
