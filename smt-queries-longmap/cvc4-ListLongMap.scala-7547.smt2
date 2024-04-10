; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95606 () Bool)

(assert start!95606)

(declare-fun b_free!22259 () Bool)

(declare-fun b_next!22259 () Bool)

(assert (=> start!95606 (= b_free!22259 (not b_next!22259))))

(declare-fun tp!78626 () Bool)

(declare-fun b_and!35237 () Bool)

(assert (=> start!95606 (= tp!78626 b_and!35237)))

(declare-fun mapIsEmpty!41146 () Bool)

(declare-fun mapRes!41146 () Bool)

(assert (=> mapIsEmpty!41146 mapRes!41146))

(declare-fun b!1080177 () Bool)

(declare-fun e!617513 () Bool)

(declare-fun tp_is_empty!26261 () Bool)

(assert (=> b!1080177 (= e!617513 tp_is_empty!26261)))

(declare-fun mapNonEmpty!41146 () Bool)

(declare-fun tp!78625 () Bool)

(declare-fun e!617512 () Bool)

(assert (=> mapNonEmpty!41146 (= mapRes!41146 (and tp!78625 e!617512))))

(declare-datatypes ((V!40141 0))(
  ( (V!40142 (val!13187 Int)) )
))
(declare-datatypes ((ValueCell!12421 0))(
  ( (ValueCellFull!12421 (v!15808 V!40141)) (EmptyCell!12421) )
))
(declare-datatypes ((array!69475 0))(
  ( (array!69476 (arr!33411 (Array (_ BitVec 32) ValueCell!12421)) (size!33947 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69475)

(declare-fun mapKey!41146 () (_ BitVec 32))

(declare-fun mapValue!41146 () ValueCell!12421)

(declare-fun mapRest!41146 () (Array (_ BitVec 32) ValueCell!12421))

(assert (=> mapNonEmpty!41146 (= (arr!33411 _values!874) (store mapRest!41146 mapKey!41146 mapValue!41146))))

(declare-fun b!1080178 () Bool)

(declare-fun res!719898 () Bool)

(declare-fun e!617510 () Bool)

(assert (=> b!1080178 (=> (not res!719898) (not e!617510))))

(declare-datatypes ((array!69477 0))(
  ( (array!69478 (arr!33412 (Array (_ BitVec 32) (_ BitVec 64))) (size!33948 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69477)

(declare-datatypes ((List!23281 0))(
  ( (Nil!23278) (Cons!23277 (h!24486 (_ BitVec 64)) (t!32640 List!23281)) )
))
(declare-fun arrayNoDuplicates!0 (array!69477 (_ BitVec 32) List!23281) Bool)

(assert (=> b!1080178 (= res!719898 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23278))))

(declare-fun b!1080179 () Bool)

(declare-fun res!719893 () Bool)

(assert (=> b!1080179 (=> (not res!719893) (not e!617510))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080179 (= res!719893 (validKeyInArray!0 k!904))))

(declare-fun res!719901 () Bool)

(assert (=> start!95606 (=> (not res!719901) (not e!617510))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95606 (= res!719901 (validMask!0 mask!1414))))

(assert (=> start!95606 e!617510))

(assert (=> start!95606 tp!78626))

(assert (=> start!95606 true))

(assert (=> start!95606 tp_is_empty!26261))

(declare-fun array_inv!25798 (array!69477) Bool)

(assert (=> start!95606 (array_inv!25798 _keys!1070)))

(declare-fun e!617509 () Bool)

(declare-fun array_inv!25799 (array!69475) Bool)

(assert (=> start!95606 (and (array_inv!25799 _values!874) e!617509)))

(declare-fun b!1080180 () Bool)

(declare-fun res!719895 () Bool)

(declare-fun e!617511 () Bool)

(assert (=> b!1080180 (=> (not res!719895) (not e!617511))))

(declare-fun lt!478953 () array!69477)

(assert (=> b!1080180 (= res!719895 (arrayNoDuplicates!0 lt!478953 #b00000000000000000000000000000000 Nil!23278))))

(declare-fun b!1080181 () Bool)

(assert (=> b!1080181 (= e!617511 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40141)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((tuple2!16702 0))(
  ( (tuple2!16703 (_1!8362 (_ BitVec 64)) (_2!8362 V!40141)) )
))
(declare-datatypes ((List!23282 0))(
  ( (Nil!23279) (Cons!23278 (h!24487 tuple2!16702) (t!32641 List!23282)) )
))
(declare-datatypes ((ListLongMap!14671 0))(
  ( (ListLongMap!14672 (toList!7351 List!23282)) )
))
(declare-fun lt!478954 () ListLongMap!14671)

(declare-fun zeroValue!831 () V!40141)

(declare-fun getCurrentListMapNoExtraKeys!3899 (array!69477 array!69475 (_ BitVec 32) (_ BitVec 32) V!40141 V!40141 (_ BitVec 32) Int) ListLongMap!14671)

(assert (=> b!1080181 (= lt!478954 (getCurrentListMapNoExtraKeys!3899 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080181 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35522 0))(
  ( (Unit!35523) )
))
(declare-fun lt!478952 () Unit!35522)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69477 (_ BitVec 64) (_ BitVec 32)) Unit!35522)

(assert (=> b!1080181 (= lt!478952 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1080182 () Bool)

(declare-fun res!719897 () Bool)

(assert (=> b!1080182 (=> (not res!719897) (not e!617510))))

(assert (=> b!1080182 (= res!719897 (= (select (arr!33412 _keys!1070) i!650) k!904))))

(declare-fun b!1080183 () Bool)

(assert (=> b!1080183 (= e!617509 (and e!617513 mapRes!41146))))

(declare-fun condMapEmpty!41146 () Bool)

(declare-fun mapDefault!41146 () ValueCell!12421)

