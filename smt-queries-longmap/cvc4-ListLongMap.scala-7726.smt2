; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97046 () Bool)

(assert start!97046)

(declare-fun b!1103883 () Bool)

(declare-fun res!736458 () Bool)

(declare-fun e!630137 () Bool)

(assert (=> b!1103883 (=> (not res!736458) (not e!630137))))

(declare-datatypes ((array!71591 0))(
  ( (array!71592 (arr!34452 (Array (_ BitVec 32) (_ BitVec 64))) (size!34988 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71591)

(declare-datatypes ((List!24049 0))(
  ( (Nil!24046) (Cons!24045 (h!25254 (_ BitVec 64)) (t!34314 List!24049)) )
))
(declare-fun arrayNoDuplicates!0 (array!71591 (_ BitVec 32) List!24049) Bool)

(assert (=> b!1103883 (= res!736458 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24046))))

(declare-fun b!1103885 () Bool)

(declare-fun e!630138 () Bool)

(declare-fun tp_is_empty!27335 () Bool)

(assert (=> b!1103885 (= e!630138 tp_is_empty!27335)))

(declare-fun b!1103886 () Bool)

(declare-fun res!736453 () Bool)

(assert (=> b!1103886 (=> (not res!736453) (not e!630137))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41573 0))(
  ( (V!41574 (val!13724 Int)) )
))
(declare-datatypes ((ValueCell!12958 0))(
  ( (ValueCellFull!12958 (v!16356 V!41573)) (EmptyCell!12958) )
))
(declare-datatypes ((array!71593 0))(
  ( (array!71594 (arr!34453 (Array (_ BitVec 32) ValueCell!12958)) (size!34989 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71593)

(assert (=> b!1103886 (= res!736453 (and (= (size!34989 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34988 _keys!1208) (size!34989 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!42808 () Bool)

(declare-fun mapRes!42808 () Bool)

(declare-fun tp!81728 () Bool)

(declare-fun e!630139 () Bool)

(assert (=> mapNonEmpty!42808 (= mapRes!42808 (and tp!81728 e!630139))))

(declare-fun mapKey!42808 () (_ BitVec 32))

(declare-fun mapValue!42808 () ValueCell!12958)

(declare-fun mapRest!42808 () (Array (_ BitVec 32) ValueCell!12958))

(assert (=> mapNonEmpty!42808 (= (arr!34453 _values!996) (store mapRest!42808 mapKey!42808 mapValue!42808))))

(declare-fun b!1103887 () Bool)

(declare-fun res!736455 () Bool)

(assert (=> b!1103887 (=> (not res!736455) (not e!630137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103887 (= res!736455 (validMask!0 mask!1564))))

(declare-fun b!1103888 () Bool)

(declare-fun res!736451 () Bool)

(assert (=> b!1103888 (=> (not res!736451) (not e!630137))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103888 (= res!736451 (validKeyInArray!0 k!934))))

(declare-fun b!1103889 () Bool)

(declare-fun res!736452 () Bool)

(assert (=> b!1103889 (=> (not res!736452) (not e!630137))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1103889 (= res!736452 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34988 _keys!1208))))))

(declare-fun b!1103890 () Bool)

(assert (=> b!1103890 (= e!630137 (bvsgt #b00000000000000000000000000000000 (size!34988 _keys!1208)))))

(declare-fun b!1103891 () Bool)

(declare-fun e!630140 () Bool)

(assert (=> b!1103891 (= e!630140 (and e!630138 mapRes!42808))))

(declare-fun condMapEmpty!42808 () Bool)

(declare-fun mapDefault!42808 () ValueCell!12958)

