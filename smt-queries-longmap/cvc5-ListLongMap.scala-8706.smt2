; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105686 () Bool)

(assert start!105686)

(declare-fun b_free!27271 () Bool)

(declare-fun b_next!27271 () Bool)

(assert (=> start!105686 (= b_free!27271 (not b_next!27271))))

(declare-fun tp!95338 () Bool)

(declare-fun b_and!45155 () Bool)

(assert (=> start!105686 (= tp!95338 b_and!45155)))

(declare-fun b!1258879 () Bool)

(declare-fun e!716050 () Bool)

(declare-fun e!716052 () Bool)

(assert (=> b!1258879 (= e!716050 (not e!716052))))

(declare-fun res!839012 () Bool)

(assert (=> b!1258879 (=> res!839012 e!716052)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258879 (= res!839012 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48263 0))(
  ( (V!48264 (val!16149 Int)) )
))
(declare-datatypes ((tuple2!20864 0))(
  ( (tuple2!20865 (_1!10443 (_ BitVec 64)) (_2!10443 V!48263)) )
))
(declare-datatypes ((List!28075 0))(
  ( (Nil!28072) (Cons!28071 (h!29280 tuple2!20864) (t!41570 List!28075)) )
))
(declare-datatypes ((ListLongMap!18737 0))(
  ( (ListLongMap!18738 (toList!9384 List!28075)) )
))
(declare-fun lt!569464 () ListLongMap!18737)

(declare-fun lt!569467 () ListLongMap!18737)

(assert (=> b!1258879 (= lt!569464 lt!569467)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48263)

(declare-datatypes ((Unit!41951 0))(
  ( (Unit!41952) )
))
(declare-fun lt!569468 () Unit!41951)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48263)

(declare-datatypes ((array!81966 0))(
  ( (array!81967 (arr!39538 (Array (_ BitVec 32) (_ BitVec 64))) (size!40074 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81966)

(declare-datatypes ((ValueCell!15323 0))(
  ( (ValueCellFull!15323 (v!18851 V!48263)) (EmptyCell!15323) )
))
(declare-datatypes ((array!81968 0))(
  ( (array!81969 (arr!39539 (Array (_ BitVec 32) ValueCell!15323)) (size!40075 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81968)

(declare-fun minValueBefore!43 () V!48263)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1125 (array!81966 array!81968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48263 V!48263 V!48263 V!48263 (_ BitVec 32) Int) Unit!41951)

(assert (=> b!1258879 (= lt!569468 (lemmaNoChangeToArrayThenSameMapNoExtras!1125 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5761 (array!81966 array!81968 (_ BitVec 32) (_ BitVec 32) V!48263 V!48263 (_ BitVec 32) Int) ListLongMap!18737)

(assert (=> b!1258879 (= lt!569467 (getCurrentListMapNoExtraKeys!5761 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258879 (= lt!569464 (getCurrentListMapNoExtraKeys!5761 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258880 () Bool)

(declare-fun e!716048 () Bool)

(declare-fun e!716046 () Bool)

(declare-fun mapRes!50056 () Bool)

(assert (=> b!1258880 (= e!716048 (and e!716046 mapRes!50056))))

(declare-fun condMapEmpty!50056 () Bool)

(declare-fun mapDefault!50056 () ValueCell!15323)

