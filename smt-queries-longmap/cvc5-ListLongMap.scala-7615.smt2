; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96010 () Bool)

(assert start!96010)

(declare-fun b_free!22663 () Bool)

(declare-fun b_next!22663 () Bool)

(assert (=> start!96010 (= b_free!22663 (not b_next!22663))))

(declare-fun tp!79838 () Bool)

(declare-fun b_and!36001 () Bool)

(assert (=> start!96010 (= tp!79838 b_and!36001)))

(declare-fun b!1088326 () Bool)

(declare-fun e!621646 () Bool)

(declare-fun e!621643 () Bool)

(assert (=> b!1088326 (= e!621646 (not e!621643))))

(declare-fun res!725870 () Bool)

(assert (=> b!1088326 (=> res!725870 e!621643)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088326 (= res!725870 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40681 0))(
  ( (V!40682 (val!13389 Int)) )
))
(declare-fun minValue!831 () V!40681)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16996 0))(
  ( (tuple2!16997 (_1!8509 (_ BitVec 64)) (_2!8509 V!40681)) )
))
(declare-datatypes ((List!23583 0))(
  ( (Nil!23580) (Cons!23579 (h!24788 tuple2!16996) (t!33304 List!23583)) )
))
(declare-datatypes ((ListLongMap!14965 0))(
  ( (ListLongMap!14966 (toList!7498 List!23583)) )
))
(declare-fun lt!484699 () ListLongMap!14965)

(declare-fun zeroValue!831 () V!40681)

(declare-datatypes ((array!70255 0))(
  ( (array!70256 (arr!33801 (Array (_ BitVec 32) (_ BitVec 64))) (size!34337 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70255)

(declare-datatypes ((ValueCell!12623 0))(
  ( (ValueCellFull!12623 (v!16010 V!40681)) (EmptyCell!12623) )
))
(declare-datatypes ((array!70257 0))(
  ( (array!70258 (arr!33802 (Array (_ BitVec 32) ValueCell!12623)) (size!34338 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70257)

(declare-fun getCurrentListMap!4272 (array!70255 array!70257 (_ BitVec 32) (_ BitVec 32) V!40681 V!40681 (_ BitVec 32) Int) ListLongMap!14965)

(assert (=> b!1088326 (= lt!484699 (getCurrentListMap!4272 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484696 () array!70255)

(declare-fun lt!484698 () ListLongMap!14965)

(declare-fun lt!484704 () array!70257)

(assert (=> b!1088326 (= lt!484698 (getCurrentListMap!4272 lt!484696 lt!484704 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484708 () ListLongMap!14965)

(declare-fun lt!484703 () ListLongMap!14965)

(assert (=> b!1088326 (and (= lt!484708 lt!484703) (= lt!484703 lt!484708))))

(declare-fun lt!484700 () ListLongMap!14965)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun -!823 (ListLongMap!14965 (_ BitVec 64)) ListLongMap!14965)

(assert (=> b!1088326 (= lt!484703 (-!823 lt!484700 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((Unit!35812 0))(
  ( (Unit!35813) )
))
(declare-fun lt!484707 () Unit!35812)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!91 (array!70255 array!70257 (_ BitVec 32) (_ BitVec 32) V!40681 V!40681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35812)

(assert (=> b!1088326 (= lt!484707 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!91 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4032 (array!70255 array!70257 (_ BitVec 32) (_ BitVec 32) V!40681 V!40681 (_ BitVec 32) Int) ListLongMap!14965)

(assert (=> b!1088326 (= lt!484708 (getCurrentListMapNoExtraKeys!4032 lt!484696 lt!484704 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2169 (Int (_ BitVec 64)) V!40681)

(assert (=> b!1088326 (= lt!484704 (array!70258 (store (arr!33802 _values!874) i!650 (ValueCellFull!12623 (dynLambda!2169 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34338 _values!874)))))

(assert (=> b!1088326 (= lt!484700 (getCurrentListMapNoExtraKeys!4032 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088326 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!484697 () Unit!35812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70255 (_ BitVec 64) (_ BitVec 32)) Unit!35812)

(assert (=> b!1088326 (= lt!484697 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1088327 () Bool)

(declare-fun e!621647 () Bool)

(declare-fun tp_is_empty!26665 () Bool)

(assert (=> b!1088327 (= e!621647 tp_is_empty!26665)))

(declare-fun mapIsEmpty!41752 () Bool)

(declare-fun mapRes!41752 () Bool)

(assert (=> mapIsEmpty!41752 mapRes!41752))

(declare-fun b!1088328 () Bool)

(declare-fun res!725872 () Bool)

(declare-fun e!621650 () Bool)

(assert (=> b!1088328 (=> (not res!725872) (not e!621650))))

(declare-datatypes ((List!23584 0))(
  ( (Nil!23581) (Cons!23580 (h!24789 (_ BitVec 64)) (t!33305 List!23584)) )
))
(declare-fun arrayNoDuplicates!0 (array!70255 (_ BitVec 32) List!23584) Bool)

(assert (=> b!1088328 (= res!725872 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23581))))

(declare-fun b!1088329 () Bool)

(declare-fun e!621649 () Bool)

(assert (=> b!1088329 (= e!621643 e!621649)))

(declare-fun res!725866 () Bool)

(assert (=> b!1088329 (=> res!725866 e!621649)))

(assert (=> b!1088329 (= res!725866 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-fun lt!484701 () ListLongMap!14965)

(assert (=> b!1088329 (= lt!484698 lt!484701)))

(declare-fun lt!484705 () tuple2!16996)

(declare-fun +!3298 (ListLongMap!14965 tuple2!16996) ListLongMap!14965)

(assert (=> b!1088329 (= lt!484701 (+!3298 lt!484703 lt!484705))))

(declare-fun lt!484706 () ListLongMap!14965)

(assert (=> b!1088329 (= lt!484699 lt!484706)))

(assert (=> b!1088329 (= lt!484706 (+!3298 lt!484700 lt!484705))))

(assert (=> b!1088329 (= lt!484698 (+!3298 lt!484708 lt!484705))))

(assert (=> b!1088329 (= lt!484705 (tuple2!16997 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088330 () Bool)

(assert (=> b!1088330 (= e!621649 true)))

(assert (=> b!1088330 (= (-!823 lt!484706 k!904) lt!484701)))

(declare-fun lt!484702 () Unit!35812)

(declare-fun addRemoveCommutativeForDiffKeys!52 (ListLongMap!14965 (_ BitVec 64) V!40681 (_ BitVec 64)) Unit!35812)

(assert (=> b!1088330 (= lt!484702 (addRemoveCommutativeForDiffKeys!52 lt!484700 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun mapNonEmpty!41752 () Bool)

(declare-fun tp!79837 () Bool)

(assert (=> mapNonEmpty!41752 (= mapRes!41752 (and tp!79837 e!621647))))

(declare-fun mapKey!41752 () (_ BitVec 32))

(declare-fun mapRest!41752 () (Array (_ BitVec 32) ValueCell!12623))

(declare-fun mapValue!41752 () ValueCell!12623)

(assert (=> mapNonEmpty!41752 (= (arr!33802 _values!874) (store mapRest!41752 mapKey!41752 mapValue!41752))))

(declare-fun b!1088331 () Bool)

(declare-fun res!725868 () Bool)

(assert (=> b!1088331 (=> (not res!725868) (not e!621650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088331 (= res!725868 (validKeyInArray!0 k!904))))

(declare-fun b!1088332 () Bool)

(declare-fun res!725865 () Bool)

(assert (=> b!1088332 (=> (not res!725865) (not e!621650))))

(assert (=> b!1088332 (= res!725865 (and (= (size!34338 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34337 _keys!1070) (size!34338 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1088333 () Bool)

(declare-fun res!725873 () Bool)

(assert (=> b!1088333 (=> (not res!725873) (not e!621650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70255 (_ BitVec 32)) Bool)

(assert (=> b!1088333 (= res!725873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!725874 () Bool)

(assert (=> start!96010 (=> (not res!725874) (not e!621650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96010 (= res!725874 (validMask!0 mask!1414))))

(assert (=> start!96010 e!621650))

(assert (=> start!96010 tp!79838))

(assert (=> start!96010 true))

(assert (=> start!96010 tp_is_empty!26665))

(declare-fun array_inv!26066 (array!70255) Bool)

(assert (=> start!96010 (array_inv!26066 _keys!1070)))

(declare-fun e!621648 () Bool)

(declare-fun array_inv!26067 (array!70257) Bool)

(assert (=> start!96010 (and (array_inv!26067 _values!874) e!621648)))

(declare-fun b!1088334 () Bool)

(declare-fun res!725867 () Bool)

(assert (=> b!1088334 (=> (not res!725867) (not e!621650))))

(assert (=> b!1088334 (= res!725867 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34337 _keys!1070))))))

(declare-fun b!1088335 () Bool)

(declare-fun e!621644 () Bool)

(assert (=> b!1088335 (= e!621644 tp_is_empty!26665)))

(declare-fun b!1088336 () Bool)

(assert (=> b!1088336 (= e!621650 e!621646)))

(declare-fun res!725871 () Bool)

(assert (=> b!1088336 (=> (not res!725871) (not e!621646))))

(assert (=> b!1088336 (= res!725871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484696 mask!1414))))

(assert (=> b!1088336 (= lt!484696 (array!70256 (store (arr!33801 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34337 _keys!1070)))))

(declare-fun b!1088337 () Bool)

(assert (=> b!1088337 (= e!621648 (and e!621644 mapRes!41752))))

(declare-fun condMapEmpty!41752 () Bool)

(declare-fun mapDefault!41752 () ValueCell!12623)

