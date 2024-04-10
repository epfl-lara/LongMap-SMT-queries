; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110420 () Bool)

(assert start!110420)

(declare-fun mapIsEmpty!54121 () Bool)

(declare-fun mapRes!54121 () Bool)

(assert (=> mapIsEmpty!54121 mapRes!54121))

(declare-fun b!1306461 () Bool)

(declare-fun res!867320 () Bool)

(declare-fun e!745335 () Bool)

(assert (=> b!1306461 (=> (not res!867320) (not e!745335))))

(declare-datatypes ((array!87008 0))(
  ( (array!87009 (arr!41985 (Array (_ BitVec 32) (_ BitVec 64))) (size!42535 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87008)

(assert (=> b!1306461 (= res!867320 (and (bvsle #b00000000000000000000000000000000 (size!42535 _keys!1628)) (bvslt (size!42535 _keys!1628) #b01111111111111111111111111111111)))))

(declare-fun res!867322 () Bool)

(assert (=> start!110420 (=> (not res!867322) (not e!745335))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110420 (= res!867322 (validMask!0 mask!2040))))

(assert (=> start!110420 e!745335))

(assert (=> start!110420 true))

(declare-datatypes ((V!51765 0))(
  ( (V!51766 (val!17573 Int)) )
))
(declare-datatypes ((ValueCell!16600 0))(
  ( (ValueCellFull!16600 (v!20199 V!51765)) (EmptyCell!16600) )
))
(declare-datatypes ((array!87010 0))(
  ( (array!87011 (arr!41986 (Array (_ BitVec 32) ValueCell!16600)) (size!42536 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87010)

(declare-fun e!745336 () Bool)

(declare-fun array_inv!31741 (array!87010) Bool)

(assert (=> start!110420 (and (array_inv!31741 _values!1354) e!745336)))

(declare-fun array_inv!31742 (array!87008) Bool)

(assert (=> start!110420 (array_inv!31742 _keys!1628)))

(declare-fun b!1306462 () Bool)

(declare-fun e!745338 () Bool)

(declare-datatypes ((List!29790 0))(
  ( (Nil!29787) (Cons!29786 (h!30995 (_ BitVec 64)) (t!43396 List!29790)) )
))
(declare-fun contains!8326 (List!29790 (_ BitVec 64)) Bool)

(assert (=> b!1306462 (= e!745338 (contains!8326 Nil!29787 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1306463 () Bool)

(declare-fun res!867321 () Bool)

(assert (=> b!1306463 (=> (not res!867321) (not e!745335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87008 (_ BitVec 32)) Bool)

(assert (=> b!1306463 (= res!867321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306464 () Bool)

(declare-fun e!745337 () Bool)

(assert (=> b!1306464 (= e!745336 (and e!745337 mapRes!54121))))

(declare-fun condMapEmpty!54121 () Bool)

(declare-fun mapDefault!54121 () ValueCell!16600)

