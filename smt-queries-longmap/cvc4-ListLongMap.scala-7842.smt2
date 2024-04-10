; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97800 () Bool)

(assert start!97800)

(declare-fun b_free!23501 () Bool)

(declare-fun b_next!23501 () Bool)

(assert (=> start!97800 (= b_free!23501 (not b_next!23501))))

(declare-fun tp!83207 () Bool)

(declare-fun b_and!37785 () Bool)

(assert (=> start!97800 (= tp!83207 b_and!37785)))

(declare-fun b!1118946 () Bool)

(declare-fun res!747389 () Bool)

(declare-fun e!637298 () Bool)

(assert (=> b!1118946 (=> (not res!747389) (not e!637298))))

(declare-datatypes ((array!72951 0))(
  ( (array!72952 (arr!35128 (Array (_ BitVec 32) (_ BitVec 64))) (size!35664 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72951)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72951 (_ BitVec 32)) Bool)

(assert (=> b!1118946 (= res!747389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118947 () Bool)

(declare-fun e!637297 () Bool)

(declare-fun e!637300 () Bool)

(declare-fun mapRes!43864 () Bool)

(assert (=> b!1118947 (= e!637297 (and e!637300 mapRes!43864))))

(declare-fun condMapEmpty!43864 () Bool)

(declare-datatypes ((V!42501 0))(
  ( (V!42502 (val!14072 Int)) )
))
(declare-datatypes ((ValueCell!13306 0))(
  ( (ValueCellFull!13306 (v!16705 V!42501)) (EmptyCell!13306) )
))
(declare-datatypes ((array!72953 0))(
  ( (array!72954 (arr!35129 (Array (_ BitVec 32) ValueCell!13306)) (size!35665 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72953)

(declare-fun mapDefault!43864 () ValueCell!13306)

