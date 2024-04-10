; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97042 () Bool)

(assert start!97042)

(declare-fun b!1103811 () Bool)

(declare-fun res!736397 () Bool)

(declare-fun e!630109 () Bool)

(assert (=> b!1103811 (=> (not res!736397) (not e!630109))))

(declare-datatypes ((array!71583 0))(
  ( (array!71584 (arr!34448 (Array (_ BitVec 32) (_ BitVec 64))) (size!34984 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71583)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71583 (_ BitVec 32)) Bool)

(assert (=> b!1103811 (= res!736397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71584 (store (arr!34448 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34984 _keys!1208)) mask!1564))))

(declare-fun b!1103812 () Bool)

(declare-fun res!736399 () Bool)

(assert (=> b!1103812 (=> (not res!736399) (not e!630109))))

(assert (=> b!1103812 (= res!736399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103813 () Bool)

(declare-fun res!736398 () Bool)

(assert (=> b!1103813 (=> (not res!736398) (not e!630109))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103813 (= res!736398 (validKeyInArray!0 k!934))))

(declare-fun b!1103814 () Bool)

(assert (=> b!1103814 (= e!630109 (bvsgt #b00000000000000000000000000000000 (size!34984 _keys!1208)))))

(declare-fun b!1103816 () Bool)

(declare-fun e!630108 () Bool)

(declare-fun tp_is_empty!27331 () Bool)

(assert (=> b!1103816 (= e!630108 tp_is_empty!27331)))

(declare-fun mapNonEmpty!42802 () Bool)

(declare-fun mapRes!42802 () Bool)

(declare-fun tp!81722 () Bool)

(assert (=> mapNonEmpty!42802 (= mapRes!42802 (and tp!81722 e!630108))))

(declare-datatypes ((V!41569 0))(
  ( (V!41570 (val!13722 Int)) )
))
(declare-datatypes ((ValueCell!12956 0))(
  ( (ValueCellFull!12956 (v!16354 V!41569)) (EmptyCell!12956) )
))
(declare-fun mapRest!42802 () (Array (_ BitVec 32) ValueCell!12956))

(declare-fun mapKey!42802 () (_ BitVec 32))

(declare-datatypes ((array!71585 0))(
  ( (array!71586 (arr!34449 (Array (_ BitVec 32) ValueCell!12956)) (size!34985 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71585)

(declare-fun mapValue!42802 () ValueCell!12956)

(assert (=> mapNonEmpty!42802 (= (arr!34449 _values!996) (store mapRest!42802 mapKey!42802 mapValue!42802))))

(declare-fun b!1103817 () Bool)

(declare-fun res!736402 () Bool)

(assert (=> b!1103817 (=> (not res!736402) (not e!630109))))

(assert (=> b!1103817 (= res!736402 (= (select (arr!34448 _keys!1208) i!673) k!934))))

(declare-fun b!1103818 () Bool)

(declare-fun res!736401 () Bool)

(assert (=> b!1103818 (=> (not res!736401) (not e!630109))))

(declare-datatypes ((List!24047 0))(
  ( (Nil!24044) (Cons!24043 (h!25252 (_ BitVec 64)) (t!34312 List!24047)) )
))
(declare-fun arrayNoDuplicates!0 (array!71583 (_ BitVec 32) List!24047) Bool)

(assert (=> b!1103818 (= res!736401 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24044))))

(declare-fun mapIsEmpty!42802 () Bool)

(assert (=> mapIsEmpty!42802 mapRes!42802))

(declare-fun b!1103819 () Bool)

(declare-fun e!630107 () Bool)

(assert (=> b!1103819 (= e!630107 tp_is_empty!27331)))

(declare-fun b!1103815 () Bool)

(declare-fun e!630110 () Bool)

(assert (=> b!1103815 (= e!630110 (and e!630107 mapRes!42802))))

(declare-fun condMapEmpty!42802 () Bool)

(declare-fun mapDefault!42802 () ValueCell!12956)

