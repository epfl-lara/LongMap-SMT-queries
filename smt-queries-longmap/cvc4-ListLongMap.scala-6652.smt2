; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83888 () Bool)

(assert start!83888)

(declare-fun b_free!19697 () Bool)

(declare-fun b_next!19697 () Bool)

(assert (=> start!83888 (= b_free!19697 (not b_next!19697))))

(declare-fun tp!68532 () Bool)

(declare-fun b_and!31483 () Bool)

(assert (=> start!83888 (= tp!68532 b_and!31483)))

(declare-fun b!980241 () Bool)

(declare-fun res!656016 () Bool)

(declare-fun e!552524 () Bool)

(assert (=> b!980241 (=> (not res!656016) (not e!552524))))

(declare-datatypes ((array!61391 0))(
  ( (array!61392 (arr!29553 (Array (_ BitVec 32) (_ BitVec 64))) (size!30032 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61391)

(declare-datatypes ((List!20485 0))(
  ( (Nil!20482) (Cons!20481 (h!21643 (_ BitVec 64)) (t!29138 List!20485)) )
))
(declare-fun arrayNoDuplicates!0 (array!61391 (_ BitVec 32) List!20485) Bool)

(assert (=> b!980241 (= res!656016 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20482))))

(declare-fun b!980242 () Bool)

(declare-fun res!656014 () Bool)

(assert (=> b!980242 (=> (not res!656014) (not e!552524))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35237 0))(
  ( (V!35238 (val!11396 Int)) )
))
(declare-datatypes ((ValueCell!10864 0))(
  ( (ValueCellFull!10864 (v!13958 V!35237)) (EmptyCell!10864) )
))
(declare-datatypes ((array!61393 0))(
  ( (array!61394 (arr!29554 (Array (_ BitVec 32) ValueCell!10864)) (size!30033 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61393)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980242 (= res!656014 (and (= (size!30033 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30032 _keys!1544) (size!30033 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!980243 () Bool)

(declare-fun res!656017 () Bool)

(assert (=> b!980243 (=> (not res!656017) (not e!552524))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980243 (= res!656017 (validKeyInArray!0 (select (arr!29553 _keys!1544) from!1932)))))

(declare-fun b!980244 () Bool)

(declare-fun res!656020 () Bool)

(assert (=> b!980244 (=> (not res!656020) (not e!552524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61391 (_ BitVec 32)) Bool)

(assert (=> b!980244 (= res!656020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980245 () Bool)

(declare-fun e!552526 () Bool)

(declare-fun e!552523 () Bool)

(declare-fun mapRes!36065 () Bool)

(assert (=> b!980245 (= e!552526 (and e!552523 mapRes!36065))))

(declare-fun condMapEmpty!36065 () Bool)

(declare-fun mapDefault!36065 () ValueCell!10864)

