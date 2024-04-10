; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96112 () Bool)

(assert start!96112)

(declare-fun b_free!22765 () Bool)

(declare-fun b_next!22765 () Bool)

(assert (=> start!96112 (= b_free!22765 (not b_next!22765))))

(declare-fun tp!80144 () Bool)

(declare-fun b_and!36205 () Bool)

(assert (=> start!96112 (= tp!80144 b_and!36205)))

(declare-fun mapIsEmpty!41905 () Bool)

(declare-fun mapRes!41905 () Bool)

(assert (=> mapIsEmpty!41905 mapRes!41905))

(declare-fun b!1090579 () Bool)

(declare-fun res!727565 () Bool)

(declare-fun e!622868 () Bool)

(assert (=> b!1090579 (=> (not res!727565) (not e!622868))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090579 (= res!727565 (validKeyInArray!0 k!904))))

(declare-fun b!1090580 () Bool)

(declare-fun e!622873 () Bool)

(assert (=> b!1090580 (= e!622873 true)))

(declare-datatypes ((V!40817 0))(
  ( (V!40818 (val!13440 Int)) )
))
(declare-datatypes ((tuple2!17084 0))(
  ( (tuple2!17085 (_1!8553 (_ BitVec 64)) (_2!8553 V!40817)) )
))
(declare-datatypes ((List!23672 0))(
  ( (Nil!23669) (Cons!23668 (h!24877 tuple2!17084) (t!33495 List!23672)) )
))
(declare-datatypes ((ListLongMap!15053 0))(
  ( (ListLongMap!15054 (toList!7542 List!23672)) )
))
(declare-fun lt!486667 () ListLongMap!15053)

(declare-fun lt!486663 () ListLongMap!15053)

(declare-fun -!865 (ListLongMap!15053 (_ BitVec 64)) ListLongMap!15053)

(assert (=> b!1090580 (= (-!865 lt!486667 k!904) lt!486663)))

(declare-fun minValue!831 () V!40817)

(declare-datatypes ((Unit!35896 0))(
  ( (Unit!35897) )
))
(declare-fun lt!486670 () Unit!35896)

(declare-fun lt!486659 () ListLongMap!15053)

(declare-fun addRemoveCommutativeForDiffKeys!89 (ListLongMap!15053 (_ BitVec 64) V!40817 (_ BitVec 64)) Unit!35896)

(assert (=> b!1090580 (= lt!486670 (addRemoveCommutativeForDiffKeys!89 lt!486659 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1090581 () Bool)

(declare-fun e!622871 () Bool)

(declare-fun e!622867 () Bool)

(assert (=> b!1090581 (= e!622871 (and e!622867 mapRes!41905))))

(declare-fun condMapEmpty!41905 () Bool)

(declare-datatypes ((ValueCell!12674 0))(
  ( (ValueCellFull!12674 (v!16061 V!40817)) (EmptyCell!12674) )
))
(declare-datatypes ((array!70457 0))(
  ( (array!70458 (arr!33902 (Array (_ BitVec 32) ValueCell!12674)) (size!34438 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70457)

(declare-fun mapDefault!41905 () ValueCell!12674)

