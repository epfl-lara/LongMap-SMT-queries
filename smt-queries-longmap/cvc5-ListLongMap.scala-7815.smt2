; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97634 () Bool)

(assert start!97634)

(declare-fun b!1115601 () Bool)

(declare-fun res!744797 () Bool)

(declare-fun e!635709 () Bool)

(assert (=> b!1115601 (=> (not res!744797) (not e!635709))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72631 0))(
  ( (array!72632 (arr!34968 (Array (_ BitVec 32) (_ BitVec 64))) (size!35504 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72631)

(assert (=> b!1115601 (= res!744797 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35504 _keys!1208))))))

(declare-fun b!1115602 () Bool)

(declare-fun res!744798 () Bool)

(assert (=> b!1115602 (=> (not res!744798) (not e!635709))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42281 0))(
  ( (V!42282 (val!13989 Int)) )
))
(declare-datatypes ((ValueCell!13223 0))(
  ( (ValueCellFull!13223 (v!16622 V!42281)) (EmptyCell!13223) )
))
(declare-datatypes ((array!72633 0))(
  ( (array!72634 (arr!34969 (Array (_ BitVec 32) ValueCell!13223)) (size!35505 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72633)

(assert (=> b!1115602 (= res!744798 (and (= (size!35505 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35504 _keys!1208) (size!35505 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1115603 () Bool)

(declare-fun res!744793 () Bool)

(assert (=> b!1115603 (=> (not res!744793) (not e!635709))))

(declare-datatypes ((List!24351 0))(
  ( (Nil!24348) (Cons!24347 (h!25556 (_ BitVec 64)) (t!34832 List!24351)) )
))
(declare-fun arrayNoDuplicates!0 (array!72631 (_ BitVec 32) List!24351) Bool)

(assert (=> b!1115603 (= res!744793 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24348))))

(declare-fun b!1115604 () Bool)

(declare-fun res!744802 () Bool)

(declare-fun e!635705 () Bool)

(assert (=> b!1115604 (=> (not res!744802) (not e!635705))))

(declare-fun lt!497005 () array!72631)

(assert (=> b!1115604 (= res!744802 (arrayNoDuplicates!0 lt!497005 #b00000000000000000000000000000000 Nil!24348))))

(declare-fun b!1115605 () Bool)

(declare-fun res!744794 () Bool)

(assert (=> b!1115605 (=> (not res!744794) (not e!635709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1115605 (= res!744794 (validMask!0 mask!1564))))

(declare-fun b!1115606 () Bool)

(declare-fun res!744795 () Bool)

(assert (=> b!1115606 (=> (not res!744795) (not e!635709))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1115606 (= res!744795 (= (select (arr!34968 _keys!1208) i!673) k!934))))

(declare-fun b!1115607 () Bool)

(declare-fun e!635708 () Bool)

(declare-fun tp_is_empty!27865 () Bool)

(assert (=> b!1115607 (= e!635708 tp_is_empty!27865)))

(declare-fun b!1115608 () Bool)

(declare-fun e!635707 () Bool)

(assert (=> b!1115608 (= e!635707 tp_is_empty!27865)))

(declare-fun b!1115609 () Bool)

(declare-fun e!635704 () Bool)

(declare-fun mapRes!43615 () Bool)

(assert (=> b!1115609 (= e!635704 (and e!635708 mapRes!43615))))

(declare-fun condMapEmpty!43615 () Bool)

(declare-fun mapDefault!43615 () ValueCell!13223)

