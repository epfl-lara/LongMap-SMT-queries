; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96148 () Bool)

(assert start!96148)

(declare-fun b_free!22801 () Bool)

(declare-fun b_next!22801 () Bool)

(assert (=> start!96148 (= b_free!22801 (not b_next!22801))))

(declare-fun tp!80251 () Bool)

(declare-fun b_and!36277 () Bool)

(assert (=> start!96148 (= tp!80251 b_and!36277)))

(declare-fun res!728152 () Bool)

(declare-fun e!623302 () Bool)

(assert (=> start!96148 (=> (not res!728152) (not e!623302))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96148 (= res!728152 (validMask!0 mask!1414))))

(assert (=> start!96148 e!623302))

(assert (=> start!96148 tp!80251))

(assert (=> start!96148 true))

(declare-fun tp_is_empty!26803 () Bool)

(assert (=> start!96148 tp_is_empty!26803))

(declare-datatypes ((array!70525 0))(
  ( (array!70526 (arr!33936 (Array (_ BitVec 32) (_ BitVec 64))) (size!34472 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70525)

(declare-fun array_inv!26168 (array!70525) Bool)

(assert (=> start!96148 (array_inv!26168 _keys!1070)))

(declare-datatypes ((V!40865 0))(
  ( (V!40866 (val!13458 Int)) )
))
(declare-datatypes ((ValueCell!12692 0))(
  ( (ValueCellFull!12692 (v!16079 V!40865)) (EmptyCell!12692) )
))
(declare-datatypes ((array!70527 0))(
  ( (array!70528 (arr!33937 (Array (_ BitVec 32) ValueCell!12692)) (size!34473 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70527)

(declare-fun e!623299 () Bool)

(declare-fun array_inv!26169 (array!70527) Bool)

(assert (=> start!96148 (and (array_inv!26169 _values!874) e!623299)))

(declare-fun b!1091371 () Bool)

(declare-fun e!623301 () Bool)

(assert (=> b!1091371 (= e!623301 tp_is_empty!26803)))

(declare-fun b!1091372 () Bool)

(declare-fun e!623304 () Bool)

(assert (=> b!1091372 (= e!623304 true)))

(declare-datatypes ((tuple2!17118 0))(
  ( (tuple2!17119 (_1!8570 (_ BitVec 64)) (_2!8570 V!40865)) )
))
(declare-datatypes ((List!23702 0))(
  ( (Nil!23699) (Cons!23698 (h!24907 tuple2!17118) (t!33561 List!23702)) )
))
(declare-datatypes ((ListLongMap!15087 0))(
  ( (ListLongMap!15088 (toList!7559 List!23702)) )
))
(declare-fun lt!487360 () ListLongMap!15087)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun lt!487364 () ListLongMap!15087)

(declare-fun -!880 (ListLongMap!15087 (_ BitVec 64)) ListLongMap!15087)

(assert (=> b!1091372 (= (-!880 lt!487360 k!904) lt!487364)))

(declare-fun minValue!831 () V!40865)

(declare-fun lt!487372 () ListLongMap!15087)

(declare-datatypes ((Unit!35926 0))(
  ( (Unit!35927) )
))
(declare-fun lt!487370 () Unit!35926)

(declare-fun addRemoveCommutativeForDiffKeys!102 (ListLongMap!15087 (_ BitVec 64) V!40865 (_ BitVec 64)) Unit!35926)

(assert (=> b!1091372 (= lt!487370 (addRemoveCommutativeForDiffKeys!102 lt!487372 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1091373 () Bool)

(declare-fun res!728156 () Bool)

(assert (=> b!1091373 (=> (not res!728156) (not e!623302))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1091373 (= res!728156 (= (select (arr!33936 _keys!1070) i!650) k!904))))

(declare-fun b!1091374 () Bool)

(declare-fun res!728151 () Bool)

(assert (=> b!1091374 (=> (not res!728151) (not e!623302))))

(assert (=> b!1091374 (= res!728151 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34472 _keys!1070))))))

(declare-fun b!1091375 () Bool)

(declare-fun e!623305 () Bool)

(declare-fun mapRes!41959 () Bool)

(assert (=> b!1091375 (= e!623299 (and e!623305 mapRes!41959))))

(declare-fun condMapEmpty!41959 () Bool)

(declare-fun mapDefault!41959 () ValueCell!12692)

