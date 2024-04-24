; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95172 () Bool)

(assert start!95172)

(declare-fun b_free!22141 () Bool)

(declare-fun b_next!22141 () Bool)

(assert (=> start!95172 (= b_free!22141 (not b_next!22141))))

(declare-fun tp!77887 () Bool)

(declare-fun b_and!35005 () Bool)

(assert (=> start!95172 (= tp!77887 b_and!35005)))

(declare-fun b!1074753 () Bool)

(declare-fun e!614105 () Bool)

(declare-fun tp_is_empty!25951 () Bool)

(assert (=> b!1074753 (= e!614105 tp_is_empty!25951)))

(declare-fun b!1074754 () Bool)

(declare-fun e!614108 () Bool)

(declare-fun mapRes!40639 () Bool)

(assert (=> b!1074754 (= e!614108 (and e!614105 mapRes!40639))))

(declare-fun condMapEmpty!40639 () Bool)

(declare-datatypes ((V!39737 0))(
  ( (V!39738 (val!13026 Int)) )
))
(declare-datatypes ((ValueCell!12272 0))(
  ( (ValueCellFull!12272 (v!15640 V!39737)) (EmptyCell!12272) )
))
(declare-datatypes ((array!68909 0))(
  ( (array!68910 (arr!33142 (Array (_ BitVec 32) ValueCell!12272)) (size!33679 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68909)

(declare-fun mapDefault!40639 () ValueCell!12272)

(assert (=> b!1074754 (= condMapEmpty!40639 (= (arr!33142 _values!955) ((as const (Array (_ BitVec 32) ValueCell!12272)) mapDefault!40639)))))

(declare-fun b!1074755 () Bool)

(declare-fun res!716457 () Bool)

(declare-fun e!614106 () Bool)

(assert (=> b!1074755 (=> (not res!716457) (not e!614106))))

(declare-datatypes ((array!68911 0))(
  ( (array!68912 (arr!33143 (Array (_ BitVec 32) (_ BitVec 64))) (size!33680 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68911)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68911 (_ BitVec 32)) Bool)

(assert (=> b!1074755 (= res!716457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1074756 () Bool)

(declare-fun e!614107 () Bool)

(assert (=> b!1074756 (= e!614107 tp_is_empty!25951)))

(declare-fun res!716455 () Bool)

(assert (=> start!95172 (=> (not res!716455) (not e!614106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95172 (= res!716455 (validMask!0 mask!1515))))

(assert (=> start!95172 e!614106))

(assert (=> start!95172 true))

(assert (=> start!95172 tp_is_empty!25951))

(declare-fun array_inv!25654 (array!68909) Bool)

(assert (=> start!95172 (and (array_inv!25654 _values!955) e!614108)))

(assert (=> start!95172 tp!77887))

(declare-fun array_inv!25655 (array!68911) Bool)

(assert (=> start!95172 (array_inv!25655 _keys!1163)))

(declare-fun mapIsEmpty!40639 () Bool)

(assert (=> mapIsEmpty!40639 mapRes!40639))

(declare-fun b!1074757 () Bool)

(declare-fun res!716458 () Bool)

(assert (=> b!1074757 (=> (not res!716458) (not e!614106))))

(declare-datatypes ((List!23129 0))(
  ( (Nil!23126) (Cons!23125 (h!24343 (_ BitVec 64)) (t!32458 List!23129)) )
))
(declare-fun arrayNoDuplicates!0 (array!68911 (_ BitVec 32) List!23129) Bool)

(assert (=> b!1074757 (= res!716458 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23126))))

(declare-fun mapNonEmpty!40639 () Bool)

(declare-fun tp!77888 () Bool)

(assert (=> mapNonEmpty!40639 (= mapRes!40639 (and tp!77888 e!614107))))

(declare-fun mapRest!40639 () (Array (_ BitVec 32) ValueCell!12272))

(declare-fun mapKey!40639 () (_ BitVec 32))

(declare-fun mapValue!40639 () ValueCell!12272)

(assert (=> mapNonEmpty!40639 (= (arr!33142 _values!955) (store mapRest!40639 mapKey!40639 mapValue!40639))))

(declare-fun b!1074758 () Bool)

(assert (=> b!1074758 (= e!614106 false)))

(declare-datatypes ((tuple2!16572 0))(
  ( (tuple2!16573 (_1!8297 (_ BitVec 64)) (_2!8297 V!39737)) )
))
(declare-datatypes ((List!23130 0))(
  ( (Nil!23127) (Cons!23126 (h!24344 tuple2!16572) (t!32459 List!23130)) )
))
(declare-datatypes ((ListLongMap!14549 0))(
  ( (ListLongMap!14550 (toList!7290 List!23130)) )
))
(declare-fun lt!476558 () ListLongMap!14549)

(declare-fun minValue!907 () V!39737)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39737)

(declare-fun getCurrentListMapNoExtraKeys!3888 (array!68911 array!68909 (_ BitVec 32) (_ BitVec 32) V!39737 V!39737 (_ BitVec 32) Int) ListLongMap!14549)

(assert (=> b!1074758 (= lt!476558 (getCurrentListMapNoExtraKeys!3888 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!39737)

(declare-fun lt!476559 () ListLongMap!14549)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1074758 (= lt!476559 (getCurrentListMapNoExtraKeys!3888 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074759 () Bool)

(declare-fun res!716456 () Bool)

(assert (=> b!1074759 (=> (not res!716456) (not e!614106))))

(assert (=> b!1074759 (= res!716456 (and (= (size!33679 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33680 _keys!1163) (size!33679 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!95172 res!716455) b!1074759))

(assert (= (and b!1074759 res!716456) b!1074755))

(assert (= (and b!1074755 res!716457) b!1074757))

(assert (= (and b!1074757 res!716458) b!1074758))

(assert (= (and b!1074754 condMapEmpty!40639) mapIsEmpty!40639))

(assert (= (and b!1074754 (not condMapEmpty!40639)) mapNonEmpty!40639))

(get-info :version)

(assert (= (and mapNonEmpty!40639 ((_ is ValueCellFull!12272) mapValue!40639)) b!1074756))

(assert (= (and b!1074754 ((_ is ValueCellFull!12272) mapDefault!40639)) b!1074753))

(assert (= start!95172 b!1074754))

(declare-fun m!994087 () Bool)

(assert (=> b!1074757 m!994087))

(declare-fun m!994089 () Bool)

(assert (=> b!1074755 m!994089))

(declare-fun m!994091 () Bool)

(assert (=> start!95172 m!994091))

(declare-fun m!994093 () Bool)

(assert (=> start!95172 m!994093))

(declare-fun m!994095 () Bool)

(assert (=> start!95172 m!994095))

(declare-fun m!994097 () Bool)

(assert (=> b!1074758 m!994097))

(declare-fun m!994099 () Bool)

(assert (=> b!1074758 m!994099))

(declare-fun m!994101 () Bool)

(assert (=> mapNonEmpty!40639 m!994101))

(check-sat (not b_next!22141) (not b!1074758) tp_is_empty!25951 (not b!1074755) (not start!95172) (not b!1074757) (not mapNonEmpty!40639) b_and!35005)
(check-sat b_and!35005 (not b_next!22141))
