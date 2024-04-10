; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97114 () Bool)

(assert start!97114)

(declare-fun b!1104524 () Bool)

(declare-fun e!630462 () Bool)

(declare-fun e!630465 () Bool)

(assert (=> b!1104524 (= e!630462 e!630465)))

(declare-fun res!736910 () Bool)

(assert (=> b!1104524 (=> (not res!736910) (not e!630465))))

(declare-datatypes ((array!71647 0))(
  ( (array!71648 (arr!34477 (Array (_ BitVec 32) (_ BitVec 64))) (size!35013 (_ BitVec 32))) )
))
(declare-fun lt!495155 () array!71647)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71647 (_ BitVec 32)) Bool)

(assert (=> b!1104524 (= res!736910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495155 mask!1564))))

(declare-fun _keys!1208 () array!71647)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104524 (= lt!495155 (array!71648 (store (arr!34477 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35013 _keys!1208)))))

(declare-fun mapNonEmpty!42856 () Bool)

(declare-fun mapRes!42856 () Bool)

(declare-fun tp!81776 () Bool)

(declare-fun e!630463 () Bool)

(assert (=> mapNonEmpty!42856 (= mapRes!42856 (and tp!81776 e!630463))))

(declare-datatypes ((V!41609 0))(
  ( (V!41610 (val!13737 Int)) )
))
(declare-datatypes ((ValueCell!12971 0))(
  ( (ValueCellFull!12971 (v!16370 V!41609)) (EmptyCell!12971) )
))
(declare-fun mapRest!42856 () (Array (_ BitVec 32) ValueCell!12971))

(declare-fun mapValue!42856 () ValueCell!12971)

(declare-fun mapKey!42856 () (_ BitVec 32))

(declare-datatypes ((array!71649 0))(
  ( (array!71650 (arr!34478 (Array (_ BitVec 32) ValueCell!12971)) (size!35014 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71649)

(assert (=> mapNonEmpty!42856 (= (arr!34478 _values!996) (store mapRest!42856 mapKey!42856 mapValue!42856))))

(declare-fun b!1104525 () Bool)

(declare-fun res!736909 () Bool)

(assert (=> b!1104525 (=> (not res!736909) (not e!630462))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1104525 (= res!736909 (= (select (arr!34477 _keys!1208) i!673) k!934))))

(declare-fun b!1104526 () Bool)

(declare-fun res!736914 () Bool)

(assert (=> b!1104526 (=> (not res!736914) (not e!630462))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104526 (= res!736914 (and (= (size!35014 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35013 _keys!1208) (size!35014 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104527 () Bool)

(declare-fun res!736908 () Bool)

(assert (=> b!1104527 (=> (not res!736908) (not e!630462))))

(assert (=> b!1104527 (= res!736908 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35013 _keys!1208))))))

(declare-fun b!1104529 () Bool)

(declare-fun e!630466 () Bool)

(declare-fun tp_is_empty!27361 () Bool)

(assert (=> b!1104529 (= e!630466 tp_is_empty!27361)))

(declare-fun b!1104530 () Bool)

(declare-fun res!736913 () Bool)

(assert (=> b!1104530 (=> (not res!736913) (not e!630462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104530 (= res!736913 (validMask!0 mask!1564))))

(declare-fun b!1104531 () Bool)

(declare-fun e!630467 () Bool)

(assert (=> b!1104531 (= e!630467 (and e!630466 mapRes!42856))))

(declare-fun condMapEmpty!42856 () Bool)

(declare-fun mapDefault!42856 () ValueCell!12971)

