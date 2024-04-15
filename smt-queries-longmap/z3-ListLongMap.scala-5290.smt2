; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70910 () Bool)

(assert start!70910)

(declare-fun b_free!13147 () Bool)

(declare-fun b_next!13147 () Bool)

(assert (=> start!70910 (= b_free!13147 (not b_next!13147))))

(declare-fun tp!46192 () Bool)

(declare-fun b_and!22017 () Bool)

(assert (=> start!70910 (= tp!46192 b_and!22017)))

(declare-fun b!823534 () Bool)

(declare-fun e!458068 () Bool)

(declare-fun tp_is_empty!14857 () Bool)

(assert (=> b!823534 (= e!458068 tp_is_empty!14857)))

(declare-fun res!561609 () Bool)

(declare-fun e!458065 () Bool)

(assert (=> start!70910 (=> (not res!561609) (not e!458065))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70910 (= res!561609 (validMask!0 mask!1312))))

(assert (=> start!70910 e!458065))

(assert (=> start!70910 tp_is_empty!14857))

(declare-datatypes ((array!45875 0))(
  ( (array!45876 (arr!21986 (Array (_ BitVec 32) (_ BitVec 64))) (size!22407 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45875)

(declare-fun array_inv!17615 (array!45875) Bool)

(assert (=> start!70910 (array_inv!17615 _keys!976)))

(assert (=> start!70910 true))

(declare-datatypes ((V!24811 0))(
  ( (V!24812 (val!7476 Int)) )
))
(declare-datatypes ((ValueCell!7013 0))(
  ( (ValueCellFull!7013 (v!9903 V!24811)) (EmptyCell!7013) )
))
(declare-datatypes ((array!45877 0))(
  ( (array!45878 (arr!21987 (Array (_ BitVec 32) ValueCell!7013)) (size!22408 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45877)

(declare-fun e!458064 () Bool)

(declare-fun array_inv!17616 (array!45877) Bool)

(assert (=> start!70910 (and (array_inv!17616 _values!788) e!458064)))

(assert (=> start!70910 tp!46192))

(declare-fun b!823535 () Bool)

(declare-fun res!561607 () Bool)

(assert (=> b!823535 (=> (not res!561607) (not e!458065))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823535 (= res!561607 (and (= (size!22408 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22407 _keys!976) (size!22408 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823536 () Bool)

(declare-fun res!561608 () Bool)

(assert (=> b!823536 (=> (not res!561608) (not e!458065))))

(declare-datatypes ((List!15693 0))(
  ( (Nil!15690) (Cons!15689 (h!16818 (_ BitVec 64)) (t!22025 List!15693)) )
))
(declare-fun arrayNoDuplicates!0 (array!45875 (_ BitVec 32) List!15693) Bool)

(assert (=> b!823536 (= res!561608 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15690))))

(declare-fun b!823537 () Bool)

(assert (=> b!823537 (= e!458065 (not true))))

(declare-datatypes ((tuple2!9892 0))(
  ( (tuple2!9893 (_1!4957 (_ BitVec 64)) (_2!4957 V!24811)) )
))
(declare-datatypes ((List!15694 0))(
  ( (Nil!15691) (Cons!15690 (h!16819 tuple2!9892) (t!22026 List!15694)) )
))
(declare-datatypes ((ListLongMap!8705 0))(
  ( (ListLongMap!8706 (toList!4368 List!15694)) )
))
(declare-fun lt!371285 () ListLongMap!8705)

(declare-fun lt!371287 () ListLongMap!8705)

(assert (=> b!823537 (= lt!371285 lt!371287)))

(declare-datatypes ((Unit!28160 0))(
  ( (Unit!28161) )
))
(declare-fun lt!371286 () Unit!28160)

(declare-fun zeroValueBefore!34 () V!24811)

(declare-fun zeroValueAfter!34 () V!24811)

(declare-fun minValue!754 () V!24811)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!505 (array!45875 array!45877 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24811 V!24811 V!24811 V!24811 (_ BitVec 32) Int) Unit!28160)

(assert (=> b!823537 (= lt!371286 (lemmaNoChangeToArrayThenSameMapNoExtras!505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2412 (array!45875 array!45877 (_ BitVec 32) (_ BitVec 32) V!24811 V!24811 (_ BitVec 32) Int) ListLongMap!8705)

(assert (=> b!823537 (= lt!371287 (getCurrentListMapNoExtraKeys!2412 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823537 (= lt!371285 (getCurrentListMapNoExtraKeys!2412 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823538 () Bool)

(declare-fun res!561610 () Bool)

(assert (=> b!823538 (=> (not res!561610) (not e!458065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45875 (_ BitVec 32)) Bool)

(assert (=> b!823538 (= res!561610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23902 () Bool)

(declare-fun mapRes!23902 () Bool)

(assert (=> mapIsEmpty!23902 mapRes!23902))

(declare-fun b!823539 () Bool)

(declare-fun e!458066 () Bool)

(assert (=> b!823539 (= e!458066 tp_is_empty!14857)))

(declare-fun b!823540 () Bool)

(assert (=> b!823540 (= e!458064 (and e!458066 mapRes!23902))))

(declare-fun condMapEmpty!23902 () Bool)

(declare-fun mapDefault!23902 () ValueCell!7013)

(assert (=> b!823540 (= condMapEmpty!23902 (= (arr!21987 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7013)) mapDefault!23902)))))

(declare-fun mapNonEmpty!23902 () Bool)

(declare-fun tp!46191 () Bool)

(assert (=> mapNonEmpty!23902 (= mapRes!23902 (and tp!46191 e!458068))))

(declare-fun mapValue!23902 () ValueCell!7013)

(declare-fun mapRest!23902 () (Array (_ BitVec 32) ValueCell!7013))

(declare-fun mapKey!23902 () (_ BitVec 32))

(assert (=> mapNonEmpty!23902 (= (arr!21987 _values!788) (store mapRest!23902 mapKey!23902 mapValue!23902))))

(assert (= (and start!70910 res!561609) b!823535))

(assert (= (and b!823535 res!561607) b!823538))

(assert (= (and b!823538 res!561610) b!823536))

(assert (= (and b!823536 res!561608) b!823537))

(assert (= (and b!823540 condMapEmpty!23902) mapIsEmpty!23902))

(assert (= (and b!823540 (not condMapEmpty!23902)) mapNonEmpty!23902))

(get-info :version)

(assert (= (and mapNonEmpty!23902 ((_ is ValueCellFull!7013) mapValue!23902)) b!823534))

(assert (= (and b!823540 ((_ is ValueCellFull!7013) mapDefault!23902)) b!823539))

(assert (= start!70910 b!823540))

(declare-fun m!765221 () Bool)

(assert (=> start!70910 m!765221))

(declare-fun m!765223 () Bool)

(assert (=> start!70910 m!765223))

(declare-fun m!765225 () Bool)

(assert (=> start!70910 m!765225))

(declare-fun m!765227 () Bool)

(assert (=> mapNonEmpty!23902 m!765227))

(declare-fun m!765229 () Bool)

(assert (=> b!823538 m!765229))

(declare-fun m!765231 () Bool)

(assert (=> b!823537 m!765231))

(declare-fun m!765233 () Bool)

(assert (=> b!823537 m!765233))

(declare-fun m!765235 () Bool)

(assert (=> b!823537 m!765235))

(declare-fun m!765237 () Bool)

(assert (=> b!823536 m!765237))

(check-sat (not b_next!13147) (not b!823538) tp_is_empty!14857 (not start!70910) (not b!823537) (not mapNonEmpty!23902) (not b!823536) b_and!22017)
(check-sat b_and!22017 (not b_next!13147))
