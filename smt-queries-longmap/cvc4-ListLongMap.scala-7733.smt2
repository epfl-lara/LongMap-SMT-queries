; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97130 () Bool)

(assert start!97130)

(declare-fun b!1104812 () Bool)

(declare-fun res!737130 () Bool)

(declare-fun e!630611 () Bool)

(assert (=> b!1104812 (=> (not res!737130) (not e!630611))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71675 0))(
  ( (array!71676 (arr!34491 (Array (_ BitVec 32) (_ BitVec 64))) (size!35027 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71675)

(assert (=> b!1104812 (= res!737130 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35027 _keys!1208))))))

(declare-fun b!1104813 () Bool)

(declare-fun res!737129 () Bool)

(assert (=> b!1104813 (=> (not res!737129) (not e!630611))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41629 0))(
  ( (V!41630 (val!13745 Int)) )
))
(declare-datatypes ((ValueCell!12979 0))(
  ( (ValueCellFull!12979 (v!16378 V!41629)) (EmptyCell!12979) )
))
(declare-datatypes ((array!71677 0))(
  ( (array!71678 (arr!34492 (Array (_ BitVec 32) ValueCell!12979)) (size!35028 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71677)

(assert (=> b!1104813 (= res!737129 (and (= (size!35028 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35027 _keys!1208) (size!35028 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104814 () Bool)

(declare-fun e!630610 () Bool)

(declare-fun tp_is_empty!27377 () Bool)

(assert (=> b!1104814 (= e!630610 tp_is_empty!27377)))

(declare-fun b!1104815 () Bool)

(declare-fun res!737128 () Bool)

(assert (=> b!1104815 (=> (not res!737128) (not e!630611))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104815 (= res!737128 (validKeyInArray!0 k!934))))

(declare-fun b!1104816 () Bool)

(declare-fun res!737125 () Bool)

(assert (=> b!1104816 (=> (not res!737125) (not e!630611))))

(assert (=> b!1104816 (= res!737125 (= (select (arr!34491 _keys!1208) i!673) k!934))))

(declare-fun b!1104817 () Bool)

(declare-fun e!630609 () Bool)

(assert (=> b!1104817 (= e!630611 e!630609)))

(declare-fun res!737131 () Bool)

(assert (=> b!1104817 (=> (not res!737131) (not e!630609))))

(declare-fun lt!495202 () array!71675)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71675 (_ BitVec 32)) Bool)

(assert (=> b!1104817 (= res!737131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495202 mask!1564))))

(assert (=> b!1104817 (= lt!495202 (array!71676 (store (arr!34491 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35027 _keys!1208)))))

(declare-fun b!1104818 () Bool)

(declare-fun e!630606 () Bool)

(declare-fun e!630608 () Bool)

(declare-fun mapRes!42880 () Bool)

(assert (=> b!1104818 (= e!630606 (and e!630608 mapRes!42880))))

(declare-fun condMapEmpty!42880 () Bool)

(declare-fun mapDefault!42880 () ValueCell!12979)

