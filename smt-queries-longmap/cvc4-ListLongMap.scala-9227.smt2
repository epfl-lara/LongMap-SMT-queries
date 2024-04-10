; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110714 () Bool)

(assert start!110714)

(declare-fun b_free!29549 () Bool)

(declare-fun b_next!29549 () Bool)

(assert (=> start!110714 (= b_free!29549 (not b_next!29549))))

(declare-fun tp!103969 () Bool)

(declare-fun b_and!47757 () Bool)

(assert (=> start!110714 (= tp!103969 b_and!47757)))

(declare-fun b!1310227 () Bool)

(declare-fun e!747481 () Bool)

(declare-fun tp_is_empty!35279 () Bool)

(assert (=> b!1310227 (= e!747481 tp_is_empty!35279)))

(declare-fun b!1310228 () Bool)

(declare-fun res!869808 () Bool)

(declare-fun e!747480 () Bool)

(assert (=> b!1310228 (=> (not res!869808) (not e!747480))))

(declare-datatypes ((array!87546 0))(
  ( (array!87547 (arr!42253 (Array (_ BitVec 32) (_ BitVec 64))) (size!42803 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87546)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1310228 (= res!869808 (not (= (select (arr!42253 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1310229 () Bool)

(assert (=> b!1310229 (= e!747480 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52141 0))(
  ( (V!52142 (val!17714 Int)) )
))
(declare-fun minValue!1296 () V!52141)

(declare-datatypes ((ValueCell!16741 0))(
  ( (ValueCellFull!16741 (v!20341 V!52141)) (EmptyCell!16741) )
))
(declare-datatypes ((array!87548 0))(
  ( (array!87549 (arr!42254 (Array (_ BitVec 32) ValueCell!16741)) (size!42804 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87548)

(declare-fun zeroValue!1296 () V!52141)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!22818 0))(
  ( (tuple2!22819 (_1!11420 (_ BitVec 64)) (_2!11420 V!52141)) )
))
(declare-datatypes ((List!29957 0))(
  ( (Nil!29954) (Cons!29953 (h!31162 tuple2!22818) (t!43563 List!29957)) )
))
(declare-datatypes ((ListLongMap!20475 0))(
  ( (ListLongMap!20476 (toList!10253 List!29957)) )
))
(declare-fun contains!8403 (ListLongMap!20475 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5266 (array!87546 array!87548 (_ BitVec 32) (_ BitVec 32) V!52141 V!52141 (_ BitVec 32) Int) ListLongMap!20475)

(assert (=> b!1310229 (contains!8403 (getCurrentListMap!5266 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43326 0))(
  ( (Unit!43327) )
))
(declare-fun lt!585342 () Unit!43326)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!9 (array!87546 array!87548 (_ BitVec 32) (_ BitVec 32) V!52141 V!52141 (_ BitVec 64) (_ BitVec 32) Int) Unit!43326)

(assert (=> b!1310229 (= lt!585342 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!9 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310230 () Bool)

(declare-fun res!869802 () Bool)

(assert (=> b!1310230 (=> (not res!869802) (not e!747480))))

(assert (=> b!1310230 (= res!869802 (contains!8403 (getCurrentListMap!5266 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310231 () Bool)

(declare-fun e!747478 () Bool)

(declare-fun e!747482 () Bool)

(declare-fun mapRes!54547 () Bool)

(assert (=> b!1310231 (= e!747478 (and e!747482 mapRes!54547))))

(declare-fun condMapEmpty!54547 () Bool)

(declare-fun mapDefault!54547 () ValueCell!16741)

