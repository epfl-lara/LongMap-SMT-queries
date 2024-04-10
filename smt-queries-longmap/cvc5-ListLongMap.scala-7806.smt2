; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97580 () Bool)

(assert start!97580)

(declare-fun b!1114548 () Bool)

(declare-fun res!743984 () Bool)

(declare-fun e!635218 () Bool)

(assert (=> b!1114548 (=> (not res!743984) (not e!635218))))

(declare-datatypes ((array!72529 0))(
  ( (array!72530 (arr!34917 (Array (_ BitVec 32) (_ BitVec 64))) (size!35453 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72529)

(declare-datatypes ((List!24331 0))(
  ( (Nil!24328) (Cons!24327 (h!25536 (_ BitVec 64)) (t!34812 List!24331)) )
))
(declare-fun arrayNoDuplicates!0 (array!72529 (_ BitVec 32) List!24331) Bool)

(assert (=> b!1114548 (= res!743984 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24328))))

(declare-fun b!1114549 () Bool)

(declare-fun e!635221 () Bool)

(declare-fun tp_is_empty!27811 () Bool)

(assert (=> b!1114549 (= e!635221 tp_is_empty!27811)))

(declare-fun b!1114550 () Bool)

(declare-fun res!743983 () Bool)

(assert (=> b!1114550 (=> (not res!743983) (not e!635218))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72529 (_ BitVec 32)) Bool)

(assert (=> b!1114550 (= res!743983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114551 () Bool)

(declare-fun res!743990 () Bool)

(assert (=> b!1114551 (=> (not res!743990) (not e!635218))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1114551 (= res!743990 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35453 _keys!1208))))))

(declare-fun res!743989 () Bool)

(assert (=> start!97580 (=> (not res!743989) (not e!635218))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97580 (= res!743989 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35453 _keys!1208))))))

(assert (=> start!97580 e!635218))

(declare-fun array_inv!26842 (array!72529) Bool)

(assert (=> start!97580 (array_inv!26842 _keys!1208)))

(assert (=> start!97580 true))

(declare-datatypes ((V!42209 0))(
  ( (V!42210 (val!13962 Int)) )
))
(declare-datatypes ((ValueCell!13196 0))(
  ( (ValueCellFull!13196 (v!16595 V!42209)) (EmptyCell!13196) )
))
(declare-datatypes ((array!72531 0))(
  ( (array!72532 (arr!34918 (Array (_ BitVec 32) ValueCell!13196)) (size!35454 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72531)

(declare-fun e!635220 () Bool)

(declare-fun array_inv!26843 (array!72531) Bool)

(assert (=> start!97580 (and (array_inv!26843 _values!996) e!635220)))

(declare-fun mapIsEmpty!43534 () Bool)

(declare-fun mapRes!43534 () Bool)

(assert (=> mapIsEmpty!43534 mapRes!43534))

(declare-fun b!1114552 () Bool)

(declare-fun res!743991 () Bool)

(assert (=> b!1114552 (=> (not res!743991) (not e!635218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114552 (= res!743991 (validMask!0 mask!1564))))

(declare-fun b!1114553 () Bool)

(declare-fun res!743985 () Bool)

(assert (=> b!1114553 (=> (not res!743985) (not e!635218))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114553 (= res!743985 (and (= (size!35454 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35453 _keys!1208) (size!35454 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114554 () Bool)

(declare-fun e!635222 () Bool)

(assert (=> b!1114554 (= e!635218 e!635222)))

(declare-fun res!743986 () Bool)

(assert (=> b!1114554 (=> (not res!743986) (not e!635222))))

(declare-fun lt!496844 () array!72529)

(assert (=> b!1114554 (= res!743986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496844 mask!1564))))

(assert (=> b!1114554 (= lt!496844 (array!72530 (store (arr!34917 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35453 _keys!1208)))))

(declare-fun b!1114555 () Bool)

(declare-fun res!743988 () Bool)

(assert (=> b!1114555 (=> (not res!743988) (not e!635218))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114555 (= res!743988 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!43534 () Bool)

(declare-fun tp!82778 () Bool)

(declare-fun e!635219 () Bool)

(assert (=> mapNonEmpty!43534 (= mapRes!43534 (and tp!82778 e!635219))))

(declare-fun mapValue!43534 () ValueCell!13196)

(declare-fun mapKey!43534 () (_ BitVec 32))

(declare-fun mapRest!43534 () (Array (_ BitVec 32) ValueCell!13196))

(assert (=> mapNonEmpty!43534 (= (arr!34918 _values!996) (store mapRest!43534 mapKey!43534 mapValue!43534))))

(declare-fun b!1114556 () Bool)

(declare-fun res!743992 () Bool)

(assert (=> b!1114556 (=> (not res!743992) (not e!635222))))

(assert (=> b!1114556 (= res!743992 (arrayNoDuplicates!0 lt!496844 #b00000000000000000000000000000000 Nil!24328))))

(declare-fun b!1114557 () Bool)

(assert (=> b!1114557 (= e!635220 (and e!635221 mapRes!43534))))

(declare-fun condMapEmpty!43534 () Bool)

(declare-fun mapDefault!43534 () ValueCell!13196)

