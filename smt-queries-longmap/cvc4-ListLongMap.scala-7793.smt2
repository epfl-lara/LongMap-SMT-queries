; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97506 () Bool)

(assert start!97506)

(declare-fun mapNonEmpty!43423 () Bool)

(declare-fun mapRes!43423 () Bool)

(declare-fun tp!82667 () Bool)

(declare-fun e!634556 () Bool)

(assert (=> mapNonEmpty!43423 (= mapRes!43423 (and tp!82667 e!634556))))

(declare-fun mapKey!43423 () (_ BitVec 32))

(declare-datatypes ((V!42109 0))(
  ( (V!42110 (val!13925 Int)) )
))
(declare-datatypes ((ValueCell!13159 0))(
  ( (ValueCellFull!13159 (v!16558 V!42109)) (EmptyCell!13159) )
))
(declare-fun mapValue!43423 () ValueCell!13159)

(declare-fun mapRest!43423 () (Array (_ BitVec 32) ValueCell!13159))

(declare-datatypes ((array!72383 0))(
  ( (array!72384 (arr!34844 (Array (_ BitVec 32) ValueCell!13159)) (size!35380 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72383)

(assert (=> mapNonEmpty!43423 (= (arr!34844 _values!996) (store mapRest!43423 mapKey!43423 mapValue!43423))))

(declare-fun b!1113105 () Bool)

(declare-fun res!742875 () Bool)

(declare-fun e!634555 () Bool)

(assert (=> b!1113105 (=> (not res!742875) (not e!634555))))

(declare-datatypes ((array!72385 0))(
  ( (array!72386 (arr!34845 (Array (_ BitVec 32) (_ BitVec 64))) (size!35381 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72385)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1113105 (= res!742875 (and (= (size!35380 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35381 _keys!1208) (size!35380 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1113106 () Bool)

(declare-fun res!742881 () Bool)

(assert (=> b!1113106 (=> (not res!742881) (not e!634555))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1113106 (= res!742881 (= (select (arr!34845 _keys!1208) i!673) k!934))))

(declare-fun b!1113107 () Bool)

(declare-fun res!742876 () Bool)

(assert (=> b!1113107 (=> (not res!742876) (not e!634555))))

(assert (=> b!1113107 (= res!742876 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35381 _keys!1208))))))

(declare-fun b!1113109 () Bool)

(declare-fun e!634552 () Bool)

(declare-fun e!634557 () Bool)

(assert (=> b!1113109 (= e!634552 (and e!634557 mapRes!43423))))

(declare-fun condMapEmpty!43423 () Bool)

(declare-fun mapDefault!43423 () ValueCell!13159)

