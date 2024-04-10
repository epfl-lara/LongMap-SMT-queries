; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78874 () Bool)

(assert start!78874)

(declare-fun b_free!17087 () Bool)

(declare-fun b_next!17087 () Bool)

(assert (=> start!78874 (= b_free!17087 (not b_next!17087))))

(declare-fun tp!59702 () Bool)

(declare-fun b_and!27911 () Bool)

(assert (=> start!78874 (= tp!59702 b_and!27911)))

(declare-fun b!921763 () Bool)

(declare-fun res!621616 () Bool)

(declare-fun e!517238 () Bool)

(assert (=> b!921763 (=> (not res!621616) (not e!517238))))

(declare-datatypes ((array!55168 0))(
  ( (array!55169 (arr!26529 (Array (_ BitVec 32) (_ BitVec 64))) (size!26988 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55168)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55168 (_ BitVec 32)) Bool)

(assert (=> b!921763 (= res!621616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921764 () Bool)

(declare-fun res!621611 () Bool)

(assert (=> b!921764 (=> (not res!621611) (not e!517238))))

(declare-datatypes ((List!18614 0))(
  ( (Nil!18611) (Cons!18610 (h!19756 (_ BitVec 64)) (t!26431 List!18614)) )
))
(declare-fun arrayNoDuplicates!0 (array!55168 (_ BitVec 32) List!18614) Bool)

(assert (=> b!921764 (= res!621611 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18611))))

(declare-fun mapNonEmpty!31149 () Bool)

(declare-fun mapRes!31149 () Bool)

(declare-fun tp!59701 () Bool)

(declare-fun e!517236 () Bool)

(assert (=> mapNonEmpty!31149 (= mapRes!31149 (and tp!59701 e!517236))))

(declare-datatypes ((V!31091 0))(
  ( (V!31092 (val!9848 Int)) )
))
(declare-datatypes ((ValueCell!9316 0))(
  ( (ValueCellFull!9316 (v!12366 V!31091)) (EmptyCell!9316) )
))
(declare-fun mapValue!31149 () ValueCell!9316)

(declare-fun mapKey!31149 () (_ BitVec 32))

(declare-fun mapRest!31149 () (Array (_ BitVec 32) ValueCell!9316))

(declare-datatypes ((array!55170 0))(
  ( (array!55171 (arr!26530 (Array (_ BitVec 32) ValueCell!9316)) (size!26989 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55170)

(assert (=> mapNonEmpty!31149 (= (arr!26530 _values!1231) (store mapRest!31149 mapKey!31149 mapValue!31149))))

(declare-fun b!921765 () Bool)

(declare-fun e!517234 () Bool)

(declare-fun tp_is_empty!19595 () Bool)

(assert (=> b!921765 (= e!517234 tp_is_empty!19595)))

(declare-fun b!921766 () Bool)

(declare-fun e!517237 () Bool)

(assert (=> b!921766 (= e!517237 (and e!517234 mapRes!31149))))

(declare-fun condMapEmpty!31149 () Bool)

(declare-fun mapDefault!31149 () ValueCell!9316)

