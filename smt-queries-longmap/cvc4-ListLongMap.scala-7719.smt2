; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96974 () Bool)

(assert start!96974)

(declare-fun b!1103232 () Bool)

(declare-fun e!629752 () Bool)

(declare-fun tp_is_empty!27293 () Bool)

(assert (=> b!1103232 (= e!629752 tp_is_empty!27293)))

(declare-fun res!736031 () Bool)

(declare-fun e!629749 () Bool)

(assert (=> start!96974 (=> (not res!736031) (not e!629749))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71505 0))(
  ( (array!71506 (arr!34412 (Array (_ BitVec 32) (_ BitVec 64))) (size!34948 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71505)

(assert (=> start!96974 (= res!736031 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34948 _keys!1208))))))

(assert (=> start!96974 e!629749))

(declare-fun array_inv!26502 (array!71505) Bool)

(assert (=> start!96974 (array_inv!26502 _keys!1208)))

(assert (=> start!96974 true))

(declare-datatypes ((V!41517 0))(
  ( (V!41518 (val!13703 Int)) )
))
(declare-datatypes ((ValueCell!12937 0))(
  ( (ValueCellFull!12937 (v!16334 V!41517)) (EmptyCell!12937) )
))
(declare-datatypes ((array!71507 0))(
  ( (array!71508 (arr!34413 (Array (_ BitVec 32) ValueCell!12937)) (size!34949 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71507)

(declare-fun e!629748 () Bool)

(declare-fun array_inv!26503 (array!71507) Bool)

(assert (=> start!96974 (and (array_inv!26503 _values!996) e!629748)))

(declare-fun b!1103233 () Bool)

(declare-fun res!736030 () Bool)

(assert (=> b!1103233 (=> (not res!736030) (not e!629749))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1103233 (= res!736030 (and (= (size!34949 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34948 _keys!1208) (size!34949 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103234 () Bool)

(declare-fun res!736033 () Bool)

(assert (=> b!1103234 (=> (not res!736033) (not e!629749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103234 (= res!736033 (validMask!0 mask!1564))))

(declare-fun b!1103235 () Bool)

(assert (=> b!1103235 (= e!629749 (and (bvsle #b00000000000000000000000000000000 (size!34948 _keys!1208)) (bvsge (size!34948 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!42736 () Bool)

(declare-fun mapRes!42736 () Bool)

(assert (=> mapIsEmpty!42736 mapRes!42736))

(declare-fun b!1103236 () Bool)

(declare-fun e!629750 () Bool)

(assert (=> b!1103236 (= e!629750 tp_is_empty!27293)))

(declare-fun b!1103237 () Bool)

(declare-fun res!736032 () Bool)

(assert (=> b!1103237 (=> (not res!736032) (not e!629749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71505 (_ BitVec 32)) Bool)

(assert (=> b!1103237 (= res!736032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103238 () Bool)

(assert (=> b!1103238 (= e!629748 (and e!629750 mapRes!42736))))

(declare-fun condMapEmpty!42736 () Bool)

(declare-fun mapDefault!42736 () ValueCell!12937)

