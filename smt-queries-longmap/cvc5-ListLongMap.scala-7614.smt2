; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96004 () Bool)

(assert start!96004)

(declare-fun b_free!22657 () Bool)

(declare-fun b_next!22657 () Bool)

(assert (=> start!96004 (= b_free!22657 (not b_next!22657))))

(declare-fun tp!79819 () Bool)

(declare-fun b_and!35989 () Bool)

(assert (=> start!96004 (= tp!79819 b_and!35989)))

(declare-fun b!1088194 () Bool)

(declare-fun res!725765 () Bool)

(declare-fun e!621577 () Bool)

(assert (=> b!1088194 (=> (not res!725765) (not e!621577))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1088194 (= res!725765 (validKeyInArray!0 k!904))))

(declare-fun b!1088195 () Bool)

(declare-fun res!725769 () Bool)

(assert (=> b!1088195 (=> (not res!725769) (not e!621577))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70243 0))(
  ( (array!70244 (arr!33795 (Array (_ BitVec 32) (_ BitVec 64))) (size!34331 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70243)

(assert (=> b!1088195 (= res!725769 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34331 _keys!1070))))))

(declare-fun b!1088196 () Bool)

(declare-fun e!621576 () Bool)

(declare-fun tp_is_empty!26659 () Bool)

(assert (=> b!1088196 (= e!621576 tp_is_empty!26659)))

(declare-fun b!1088197 () Bool)

(declare-fun res!725775 () Bool)

(assert (=> b!1088197 (=> (not res!725775) (not e!621577))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70243 (_ BitVec 32)) Bool)

(assert (=> b!1088197 (= res!725775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1088198 () Bool)

(declare-fun e!621575 () Bool)

(declare-fun e!621572 () Bool)

(assert (=> b!1088198 (= e!621575 e!621572)))

(declare-fun res!725766 () Bool)

(assert (=> b!1088198 (=> res!725766 e!621572)))

(assert (=> b!1088198 (= res!725766 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40673 0))(
  ( (V!40674 (val!13386 Int)) )
))
(declare-datatypes ((tuple2!16990 0))(
  ( (tuple2!16991 (_1!8506 (_ BitVec 64)) (_2!8506 V!40673)) )
))
(declare-datatypes ((List!23578 0))(
  ( (Nil!23575) (Cons!23574 (h!24783 tuple2!16990) (t!33293 List!23578)) )
))
(declare-datatypes ((ListLongMap!14959 0))(
  ( (ListLongMap!14960 (toList!7495 List!23578)) )
))
(declare-fun lt!484588 () ListLongMap!14959)

(declare-fun lt!484589 () ListLongMap!14959)

(assert (=> b!1088198 (= lt!484588 lt!484589)))

(declare-fun lt!484579 () ListLongMap!14959)

(declare-fun lt!484591 () tuple2!16990)

(declare-fun +!3296 (ListLongMap!14959 tuple2!16990) ListLongMap!14959)

(assert (=> b!1088198 (= lt!484589 (+!3296 lt!484579 lt!484591))))

(declare-fun lt!484587 () ListLongMap!14959)

(declare-fun lt!484586 () ListLongMap!14959)

(assert (=> b!1088198 (= lt!484587 lt!484586)))

(declare-fun lt!484585 () ListLongMap!14959)

(assert (=> b!1088198 (= lt!484586 (+!3296 lt!484585 lt!484591))))

(declare-fun lt!484582 () ListLongMap!14959)

(assert (=> b!1088198 (= lt!484588 (+!3296 lt!484582 lt!484591))))

(declare-fun zeroValue!831 () V!40673)

(assert (=> b!1088198 (= lt!484591 (tuple2!16991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1088199 () Bool)

(declare-fun e!621578 () Bool)

(assert (=> b!1088199 (= e!621578 (not e!621575))))

(declare-fun res!725767 () Bool)

(assert (=> b!1088199 (=> res!725767 e!621575)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1088199 (= res!725767 (or (not (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40673)

(declare-datatypes ((ValueCell!12620 0))(
  ( (ValueCellFull!12620 (v!16007 V!40673)) (EmptyCell!12620) )
))
(declare-datatypes ((array!70245 0))(
  ( (array!70246 (arr!33796 (Array (_ BitVec 32) ValueCell!12620)) (size!34332 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70245)

(declare-fun getCurrentListMap!4269 (array!70243 array!70245 (_ BitVec 32) (_ BitVec 32) V!40673 V!40673 (_ BitVec 32) Int) ListLongMap!14959)

(assert (=> b!1088199 (= lt!484587 (getCurrentListMap!4269 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!484584 () array!70243)

(declare-fun lt!484580 () array!70245)

(assert (=> b!1088199 (= lt!484588 (getCurrentListMap!4269 lt!484584 lt!484580 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1088199 (and (= lt!484582 lt!484579) (= lt!484579 lt!484582))))

(declare-fun -!820 (ListLongMap!14959 (_ BitVec 64)) ListLongMap!14959)

(assert (=> b!1088199 (= lt!484579 (-!820 lt!484585 k!904))))

(declare-datatypes ((Unit!35806 0))(
  ( (Unit!35807) )
))
(declare-fun lt!484583 () Unit!35806)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!88 (array!70243 array!70245 (_ BitVec 32) (_ BitVec 32) V!40673 V!40673 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35806)

(assert (=> b!1088199 (= lt!484583 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!88 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4029 (array!70243 array!70245 (_ BitVec 32) (_ BitVec 32) V!40673 V!40673 (_ BitVec 32) Int) ListLongMap!14959)

(assert (=> b!1088199 (= lt!484582 (getCurrentListMapNoExtraKeys!4029 lt!484584 lt!484580 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2166 (Int (_ BitVec 64)) V!40673)

(assert (=> b!1088199 (= lt!484580 (array!70246 (store (arr!33796 _values!874) i!650 (ValueCellFull!12620 (dynLambda!2166 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34332 _values!874)))))

(assert (=> b!1088199 (= lt!484585 (getCurrentListMapNoExtraKeys!4029 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70243 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1088199 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!484581 () Unit!35806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70243 (_ BitVec 64) (_ BitVec 32)) Unit!35806)

(assert (=> b!1088199 (= lt!484581 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1088200 () Bool)

(assert (=> b!1088200 (= e!621577 e!621578)))

(declare-fun res!725774 () Bool)

(assert (=> b!1088200 (=> (not res!725774) (not e!621578))))

(assert (=> b!1088200 (= res!725774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!484584 mask!1414))))

(assert (=> b!1088200 (= lt!484584 (array!70244 (store (arr!33795 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34331 _keys!1070)))))

(declare-fun mapNonEmpty!41743 () Bool)

(declare-fun mapRes!41743 () Bool)

(declare-fun tp!79820 () Bool)

(assert (=> mapNonEmpty!41743 (= mapRes!41743 (and tp!79820 e!621576))))

(declare-fun mapValue!41743 () ValueCell!12620)

(declare-fun mapKey!41743 () (_ BitVec 32))

(declare-fun mapRest!41743 () (Array (_ BitVec 32) ValueCell!12620))

(assert (=> mapNonEmpty!41743 (= (arr!33796 _values!874) (store mapRest!41743 mapKey!41743 mapValue!41743))))

(declare-fun b!1088201 () Bool)

(declare-fun e!621574 () Bool)

(declare-fun e!621571 () Bool)

(assert (=> b!1088201 (= e!621574 (and e!621571 mapRes!41743))))

(declare-fun condMapEmpty!41743 () Bool)

(declare-fun mapDefault!41743 () ValueCell!12620)

