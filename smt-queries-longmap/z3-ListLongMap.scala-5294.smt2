; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70934 () Bool)

(assert start!70934)

(declare-fun b_free!13171 () Bool)

(declare-fun b_next!13171 () Bool)

(assert (=> start!70934 (= b_free!13171 (not b_next!13171))))

(declare-fun tp!46264 () Bool)

(declare-fun b_and!22041 () Bool)

(assert (=> start!70934 (= tp!46264 b_and!22041)))

(declare-fun b!823786 () Bool)

(declare-fun res!561753 () Bool)

(declare-fun e!458245 () Bool)

(assert (=> b!823786 (=> (not res!561753) (not e!458245))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24843 0))(
  ( (V!24844 (val!7488 Int)) )
))
(declare-datatypes ((ValueCell!7025 0))(
  ( (ValueCellFull!7025 (v!9915 V!24843)) (EmptyCell!7025) )
))
(declare-datatypes ((array!45923 0))(
  ( (array!45924 (arr!22010 (Array (_ BitVec 32) ValueCell!7025)) (size!22431 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45923)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((array!45925 0))(
  ( (array!45926 (arr!22011 (Array (_ BitVec 32) (_ BitVec 64))) (size!22432 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45925)

(assert (=> b!823786 (= res!561753 (and (= (size!22431 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22432 _keys!976) (size!22431 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823787 () Bool)

(declare-fun e!458248 () Bool)

(declare-fun tp_is_empty!14881 () Bool)

(assert (=> b!823787 (= e!458248 tp_is_empty!14881)))

(declare-fun b!823788 () Bool)

(assert (=> b!823788 (= e!458245 (not true))))

(declare-datatypes ((tuple2!9912 0))(
  ( (tuple2!9913 (_1!4967 (_ BitVec 64)) (_2!4967 V!24843)) )
))
(declare-datatypes ((List!15712 0))(
  ( (Nil!15709) (Cons!15708 (h!16837 tuple2!9912) (t!22044 List!15712)) )
))
(declare-datatypes ((ListLongMap!8725 0))(
  ( (ListLongMap!8726 (toList!4378 List!15712)) )
))
(declare-fun lt!371394 () ListLongMap!8725)

(declare-fun lt!371393 () ListLongMap!8725)

(assert (=> b!823788 (= lt!371394 lt!371393)))

(declare-fun zeroValueBefore!34 () V!24843)

(declare-fun zeroValueAfter!34 () V!24843)

(declare-fun minValue!754 () V!24843)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28180 0))(
  ( (Unit!28181) )
))
(declare-fun lt!371395 () Unit!28180)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!515 (array!45925 array!45923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24843 V!24843 V!24843 V!24843 (_ BitVec 32) Int) Unit!28180)

(assert (=> b!823788 (= lt!371395 (lemmaNoChangeToArrayThenSameMapNoExtras!515 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2422 (array!45925 array!45923 (_ BitVec 32) (_ BitVec 32) V!24843 V!24843 (_ BitVec 32) Int) ListLongMap!8725)

(assert (=> b!823788 (= lt!371393 (getCurrentListMapNoExtraKeys!2422 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823788 (= lt!371394 (getCurrentListMapNoExtraKeys!2422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23938 () Bool)

(declare-fun mapRes!23938 () Bool)

(declare-fun tp!46263 () Bool)

(assert (=> mapNonEmpty!23938 (= mapRes!23938 (and tp!46263 e!458248))))

(declare-fun mapValue!23938 () ValueCell!7025)

(declare-fun mapKey!23938 () (_ BitVec 32))

(declare-fun mapRest!23938 () (Array (_ BitVec 32) ValueCell!7025))

(assert (=> mapNonEmpty!23938 (= (arr!22010 _values!788) (store mapRest!23938 mapKey!23938 mapValue!23938))))

(declare-fun b!823789 () Bool)

(declare-fun e!458244 () Bool)

(assert (=> b!823789 (= e!458244 tp_is_empty!14881)))

(declare-fun b!823791 () Bool)

(declare-fun res!561751 () Bool)

(assert (=> b!823791 (=> (not res!561751) (not e!458245))))

(declare-datatypes ((List!15713 0))(
  ( (Nil!15710) (Cons!15709 (h!16838 (_ BitVec 64)) (t!22045 List!15713)) )
))
(declare-fun arrayNoDuplicates!0 (array!45925 (_ BitVec 32) List!15713) Bool)

(assert (=> b!823791 (= res!561751 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15710))))

(declare-fun mapIsEmpty!23938 () Bool)

(assert (=> mapIsEmpty!23938 mapRes!23938))

(declare-fun b!823792 () Bool)

(declare-fun res!561752 () Bool)

(assert (=> b!823792 (=> (not res!561752) (not e!458245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45925 (_ BitVec 32)) Bool)

(assert (=> b!823792 (= res!561752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823790 () Bool)

(declare-fun e!458247 () Bool)

(assert (=> b!823790 (= e!458247 (and e!458244 mapRes!23938))))

(declare-fun condMapEmpty!23938 () Bool)

(declare-fun mapDefault!23938 () ValueCell!7025)

(assert (=> b!823790 (= condMapEmpty!23938 (= (arr!22010 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7025)) mapDefault!23938)))))

(declare-fun res!561754 () Bool)

(assert (=> start!70934 (=> (not res!561754) (not e!458245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70934 (= res!561754 (validMask!0 mask!1312))))

(assert (=> start!70934 e!458245))

(assert (=> start!70934 tp_is_empty!14881))

(declare-fun array_inv!17631 (array!45925) Bool)

(assert (=> start!70934 (array_inv!17631 _keys!976)))

(assert (=> start!70934 true))

(declare-fun array_inv!17632 (array!45923) Bool)

(assert (=> start!70934 (and (array_inv!17632 _values!788) e!458247)))

(assert (=> start!70934 tp!46264))

(assert (= (and start!70934 res!561754) b!823786))

(assert (= (and b!823786 res!561753) b!823792))

(assert (= (and b!823792 res!561752) b!823791))

(assert (= (and b!823791 res!561751) b!823788))

(assert (= (and b!823790 condMapEmpty!23938) mapIsEmpty!23938))

(assert (= (and b!823790 (not condMapEmpty!23938)) mapNonEmpty!23938))

(get-info :version)

(assert (= (and mapNonEmpty!23938 ((_ is ValueCellFull!7025) mapValue!23938)) b!823787))

(assert (= (and b!823790 ((_ is ValueCellFull!7025) mapDefault!23938)) b!823789))

(assert (= start!70934 b!823790))

(declare-fun m!765437 () Bool)

(assert (=> b!823791 m!765437))

(declare-fun m!765439 () Bool)

(assert (=> mapNonEmpty!23938 m!765439))

(declare-fun m!765441 () Bool)

(assert (=> b!823788 m!765441))

(declare-fun m!765443 () Bool)

(assert (=> b!823788 m!765443))

(declare-fun m!765445 () Bool)

(assert (=> b!823788 m!765445))

(declare-fun m!765447 () Bool)

(assert (=> start!70934 m!765447))

(declare-fun m!765449 () Bool)

(assert (=> start!70934 m!765449))

(declare-fun m!765451 () Bool)

(assert (=> start!70934 m!765451))

(declare-fun m!765453 () Bool)

(assert (=> b!823792 m!765453))

(check-sat (not start!70934) (not b!823791) tp_is_empty!14881 (not b!823792) (not b!823788) b_and!22041 (not b_next!13171) (not mapNonEmpty!23938))
(check-sat b_and!22041 (not b_next!13171))
