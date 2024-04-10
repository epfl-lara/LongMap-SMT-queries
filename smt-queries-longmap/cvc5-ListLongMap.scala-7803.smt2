; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97562 () Bool)

(assert start!97562)

(declare-fun b!1114197 () Bool)

(declare-fun res!743722 () Bool)

(declare-fun e!635056 () Bool)

(assert (=> b!1114197 (=> (not res!743722) (not e!635056))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114197 (= res!743722 (validKeyInArray!0 k!934))))

(declare-fun b!1114198 () Bool)

(declare-fun res!743718 () Bool)

(assert (=> b!1114198 (=> (not res!743718) (not e!635056))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72493 0))(
  ( (array!72494 (arr!34899 (Array (_ BitVec 32) (_ BitVec 64))) (size!35435 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72493)

(assert (=> b!1114198 (= res!743718 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35435 _keys!1208))))))

(declare-fun b!1114199 () Bool)

(declare-fun res!743721 () Bool)

(assert (=> b!1114199 (=> (not res!743721) (not e!635056))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114199 (= res!743721 (validMask!0 mask!1564))))

(declare-fun b!1114200 () Bool)

(declare-fun res!743716 () Bool)

(assert (=> b!1114200 (=> (not res!743716) (not e!635056))))

(declare-datatypes ((List!24325 0))(
  ( (Nil!24322) (Cons!24321 (h!25530 (_ BitVec 64)) (t!34806 List!24325)) )
))
(declare-fun arrayNoDuplicates!0 (array!72493 (_ BitVec 32) List!24325) Bool)

(assert (=> b!1114200 (= res!743716 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24322))))

(declare-fun b!1114201 () Bool)

(declare-fun e!635059 () Bool)

(assert (=> b!1114201 (= e!635056 e!635059)))

(declare-fun res!743715 () Bool)

(assert (=> b!1114201 (=> (not res!743715) (not e!635059))))

(declare-fun lt!496790 () array!72493)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72493 (_ BitVec 32)) Bool)

(assert (=> b!1114201 (= res!743715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496790 mask!1564))))

(assert (=> b!1114201 (= lt!496790 (array!72494 (store (arr!34899 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35435 _keys!1208)))))

(declare-fun b!1114202 () Bool)

(declare-fun res!743714 () Bool)

(assert (=> b!1114202 (=> (not res!743714) (not e!635056))))

(assert (=> b!1114202 (= res!743714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114203 () Bool)

(declare-fun res!743719 () Bool)

(assert (=> b!1114203 (=> (not res!743719) (not e!635059))))

(assert (=> b!1114203 (= res!743719 (arrayNoDuplicates!0 lt!496790 #b00000000000000000000000000000000 Nil!24322))))

(declare-fun b!1114204 () Bool)

(declare-fun res!743713 () Bool)

(assert (=> b!1114204 (=> (not res!743713) (not e!635056))))

(assert (=> b!1114204 (= res!743713 (= (select (arr!34899 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!43507 () Bool)

(declare-fun mapRes!43507 () Bool)

(declare-fun tp!82751 () Bool)

(declare-fun e!635061 () Bool)

(assert (=> mapNonEmpty!43507 (= mapRes!43507 (and tp!82751 e!635061))))

(declare-fun mapKey!43507 () (_ BitVec 32))

(declare-datatypes ((V!42185 0))(
  ( (V!42186 (val!13953 Int)) )
))
(declare-datatypes ((ValueCell!13187 0))(
  ( (ValueCellFull!13187 (v!16586 V!42185)) (EmptyCell!13187) )
))
(declare-fun mapRest!43507 () (Array (_ BitVec 32) ValueCell!13187))

(declare-datatypes ((array!72495 0))(
  ( (array!72496 (arr!34900 (Array (_ BitVec 32) ValueCell!13187)) (size!35436 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72495)

(declare-fun mapValue!43507 () ValueCell!13187)

(assert (=> mapNonEmpty!43507 (= (arr!34900 _values!996) (store mapRest!43507 mapKey!43507 mapValue!43507))))

(declare-fun b!1114205 () Bool)

(declare-fun e!635057 () Bool)

(declare-fun e!635060 () Bool)

(assert (=> b!1114205 (= e!635057 (and e!635060 mapRes!43507))))

(declare-fun condMapEmpty!43507 () Bool)

(declare-fun mapDefault!43507 () ValueCell!13187)

