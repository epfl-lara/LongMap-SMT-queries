; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105066 () Bool)

(assert start!105066)

(declare-fun b_free!26813 () Bool)

(declare-fun b_next!26813 () Bool)

(assert (=> start!105066 (= b_free!26813 (not b_next!26813))))

(declare-fun tp!93937 () Bool)

(declare-fun b_and!44609 () Bool)

(assert (=> start!105066 (= tp!93937 b_and!44609)))

(declare-fun b!1252158 () Bool)

(declare-fun res!835087 () Bool)

(declare-fun e!711145 () Bool)

(assert (=> b!1252158 (=> (not res!835087) (not e!711145))))

(declare-datatypes ((array!81090 0))(
  ( (array!81091 (arr!39109 (Array (_ BitVec 32) (_ BitVec 64))) (size!39645 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81090)

(declare-datatypes ((List!27765 0))(
  ( (Nil!27762) (Cons!27761 (h!28970 (_ BitVec 64)) (t!41242 List!27765)) )
))
(declare-fun arrayNoDuplicates!0 (array!81090 (_ BitVec 32) List!27765) Bool)

(assert (=> b!1252158 (= res!835087 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27762))))

(declare-fun b!1252159 () Bool)

(declare-fun e!711144 () Bool)

(declare-fun tp_is_empty!31715 () Bool)

(assert (=> b!1252159 (= e!711144 tp_is_empty!31715)))

(declare-fun mapIsEmpty!49342 () Bool)

(declare-fun mapRes!49342 () Bool)

(assert (=> mapIsEmpty!49342 mapRes!49342))

(declare-fun res!835088 () Bool)

(assert (=> start!105066 (=> (not res!835088) (not e!711145))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105066 (= res!835088 (validMask!0 mask!1466))))

(assert (=> start!105066 e!711145))

(assert (=> start!105066 true))

(assert (=> start!105066 tp!93937))

(assert (=> start!105066 tp_is_empty!31715))

(declare-fun array_inv!29829 (array!81090) Bool)

(assert (=> start!105066 (array_inv!29829 _keys!1118)))

(declare-datatypes ((V!47651 0))(
  ( (V!47652 (val!15920 Int)) )
))
(declare-datatypes ((ValueCell!15094 0))(
  ( (ValueCellFull!15094 (v!18618 V!47651)) (EmptyCell!15094) )
))
(declare-datatypes ((array!81092 0))(
  ( (array!81093 (arr!39110 (Array (_ BitVec 32) ValueCell!15094)) (size!39646 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81092)

(declare-fun e!711143 () Bool)

(declare-fun array_inv!29830 (array!81092) Bool)

(assert (=> start!105066 (and (array_inv!29830 _values!914) e!711143)))

(declare-fun b!1252160 () Bool)

(assert (=> b!1252160 (= e!711143 (and e!711144 mapRes!49342))))

(declare-fun condMapEmpty!49342 () Bool)

(declare-fun mapDefault!49342 () ValueCell!15094)

