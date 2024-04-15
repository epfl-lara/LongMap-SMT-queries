; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70928 () Bool)

(assert start!70928)

(declare-fun b_free!13165 () Bool)

(declare-fun b_next!13165 () Bool)

(assert (=> start!70928 (= b_free!13165 (not b_next!13165))))

(declare-fun tp!46245 () Bool)

(declare-fun b_and!22035 () Bool)

(assert (=> start!70928 (= tp!46245 b_and!22035)))

(declare-fun b!823723 () Bool)

(declare-fun res!561718 () Bool)

(declare-fun e!458201 () Bool)

(assert (=> b!823723 (=> (not res!561718) (not e!458201))))

(declare-datatypes ((array!45911 0))(
  ( (array!45912 (arr!22004 (Array (_ BitVec 32) (_ BitVec 64))) (size!22425 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45911)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24835 0))(
  ( (V!24836 (val!7485 Int)) )
))
(declare-datatypes ((ValueCell!7022 0))(
  ( (ValueCellFull!7022 (v!9912 V!24835)) (EmptyCell!7022) )
))
(declare-datatypes ((array!45913 0))(
  ( (array!45914 (arr!22005 (Array (_ BitVec 32) ValueCell!7022)) (size!22426 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45913)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823723 (= res!561718 (and (= (size!22426 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22425 _keys!976) (size!22426 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823724 () Bool)

(declare-fun res!561715 () Bool)

(assert (=> b!823724 (=> (not res!561715) (not e!458201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45911 (_ BitVec 32)) Bool)

(assert (=> b!823724 (= res!561715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!561716 () Bool)

(assert (=> start!70928 (=> (not res!561716) (not e!458201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70928 (= res!561716 (validMask!0 mask!1312))))

(assert (=> start!70928 e!458201))

(declare-fun tp_is_empty!14875 () Bool)

(assert (=> start!70928 tp_is_empty!14875))

(declare-fun array_inv!17627 (array!45911) Bool)

(assert (=> start!70928 (array_inv!17627 _keys!976)))

(assert (=> start!70928 true))

(declare-fun e!458200 () Bool)

(declare-fun array_inv!17628 (array!45913) Bool)

(assert (=> start!70928 (and (array_inv!17628 _values!788) e!458200)))

(assert (=> start!70928 tp!46245))

(declare-fun b!823725 () Bool)

(declare-fun e!458202 () Bool)

(assert (=> b!823725 (= e!458202 tp_is_empty!14875)))

(declare-fun b!823726 () Bool)

(declare-fun e!458199 () Bool)

(declare-fun mapRes!23929 () Bool)

(assert (=> b!823726 (= e!458200 (and e!458199 mapRes!23929))))

(declare-fun condMapEmpty!23929 () Bool)

(declare-fun mapDefault!23929 () ValueCell!7022)

(assert (=> b!823726 (= condMapEmpty!23929 (= (arr!22005 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7022)) mapDefault!23929)))))

(declare-fun b!823727 () Bool)

(assert (=> b!823727 (= e!458201 (not true))))

(declare-datatypes ((tuple2!9908 0))(
  ( (tuple2!9909 (_1!4965 (_ BitVec 64)) (_2!4965 V!24835)) )
))
(declare-datatypes ((List!15707 0))(
  ( (Nil!15704) (Cons!15703 (h!16832 tuple2!9908) (t!22039 List!15707)) )
))
(declare-datatypes ((ListLongMap!8721 0))(
  ( (ListLongMap!8722 (toList!4376 List!15707)) )
))
(declare-fun lt!371366 () ListLongMap!8721)

(declare-fun lt!371367 () ListLongMap!8721)

(assert (=> b!823727 (= lt!371366 lt!371367)))

(declare-fun zeroValueBefore!34 () V!24835)

(declare-fun zeroValueAfter!34 () V!24835)

(declare-fun minValue!754 () V!24835)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28176 0))(
  ( (Unit!28177) )
))
(declare-fun lt!371368 () Unit!28176)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!513 (array!45911 array!45913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24835 V!24835 V!24835 V!24835 (_ BitVec 32) Int) Unit!28176)

(assert (=> b!823727 (= lt!371368 (lemmaNoChangeToArrayThenSameMapNoExtras!513 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2420 (array!45911 array!45913 (_ BitVec 32) (_ BitVec 32) V!24835 V!24835 (_ BitVec 32) Int) ListLongMap!8721)

(assert (=> b!823727 (= lt!371367 (getCurrentListMapNoExtraKeys!2420 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823727 (= lt!371366 (getCurrentListMapNoExtraKeys!2420 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23929 () Bool)

(declare-fun tp!46246 () Bool)

(assert (=> mapNonEmpty!23929 (= mapRes!23929 (and tp!46246 e!458202))))

(declare-fun mapRest!23929 () (Array (_ BitVec 32) ValueCell!7022))

(declare-fun mapKey!23929 () (_ BitVec 32))

(declare-fun mapValue!23929 () ValueCell!7022)

(assert (=> mapNonEmpty!23929 (= (arr!22005 _values!788) (store mapRest!23929 mapKey!23929 mapValue!23929))))

(declare-fun mapIsEmpty!23929 () Bool)

(assert (=> mapIsEmpty!23929 mapRes!23929))

(declare-fun b!823728 () Bool)

(declare-fun res!561717 () Bool)

(assert (=> b!823728 (=> (not res!561717) (not e!458201))))

(declare-datatypes ((List!15708 0))(
  ( (Nil!15705) (Cons!15704 (h!16833 (_ BitVec 64)) (t!22040 List!15708)) )
))
(declare-fun arrayNoDuplicates!0 (array!45911 (_ BitVec 32) List!15708) Bool)

(assert (=> b!823728 (= res!561717 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15705))))

(declare-fun b!823729 () Bool)

(assert (=> b!823729 (= e!458199 tp_is_empty!14875)))

(assert (= (and start!70928 res!561716) b!823723))

(assert (= (and b!823723 res!561718) b!823724))

(assert (= (and b!823724 res!561715) b!823728))

(assert (= (and b!823728 res!561717) b!823727))

(assert (= (and b!823726 condMapEmpty!23929) mapIsEmpty!23929))

(assert (= (and b!823726 (not condMapEmpty!23929)) mapNonEmpty!23929))

(get-info :version)

(assert (= (and mapNonEmpty!23929 ((_ is ValueCellFull!7022) mapValue!23929)) b!823725))

(assert (= (and b!823726 ((_ is ValueCellFull!7022) mapDefault!23929)) b!823729))

(assert (= start!70928 b!823726))

(declare-fun m!765383 () Bool)

(assert (=> mapNonEmpty!23929 m!765383))

(declare-fun m!765385 () Bool)

(assert (=> b!823724 m!765385))

(declare-fun m!765387 () Bool)

(assert (=> start!70928 m!765387))

(declare-fun m!765389 () Bool)

(assert (=> start!70928 m!765389))

(declare-fun m!765391 () Bool)

(assert (=> start!70928 m!765391))

(declare-fun m!765393 () Bool)

(assert (=> b!823728 m!765393))

(declare-fun m!765395 () Bool)

(assert (=> b!823727 m!765395))

(declare-fun m!765397 () Bool)

(assert (=> b!823727 m!765397))

(declare-fun m!765399 () Bool)

(assert (=> b!823727 m!765399))

(check-sat (not b!823728) (not mapNonEmpty!23929) b_and!22035 (not start!70928) (not b_next!13165) (not b!823727) tp_is_empty!14875 (not b!823724))
(check-sat b_and!22035 (not b_next!13165))
