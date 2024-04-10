; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100300 () Bool)

(assert start!100300)

(declare-fun b_free!25687 () Bool)

(declare-fun b_next!25687 () Bool)

(assert (=> start!100300 (= b_free!25687 (not b_next!25687))))

(declare-fun tp!90009 () Bool)

(declare-fun b_and!42241 () Bool)

(assert (=> start!100300 (= tp!90009 b_and!42241)))

(declare-fun b!1196763 () Bool)

(declare-datatypes ((V!45617 0))(
  ( (V!45618 (val!15240 Int)) )
))
(declare-datatypes ((tuple2!19502 0))(
  ( (tuple2!19503 (_1!9762 (_ BitVec 64)) (_2!9762 V!45617)) )
))
(declare-datatypes ((List!26313 0))(
  ( (Nil!26310) (Cons!26309 (h!27518 tuple2!19502) (t!38992 List!26313)) )
))
(declare-datatypes ((ListLongMap!17471 0))(
  ( (ListLongMap!17472 (toList!8751 List!26313)) )
))
(declare-fun call!57183 () ListLongMap!17471)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!57182 () ListLongMap!17471)

(declare-fun e!679926 () Bool)

(declare-fun -!1771 (ListLongMap!17471 (_ BitVec 64)) ListLongMap!17471)

(assert (=> b!1196763 (= e!679926 (= call!57182 (-!1771 call!57183 k!934)))))

(declare-fun b!1196764 () Bool)

(declare-fun res!796459 () Bool)

(declare-fun e!679925 () Bool)

(assert (=> b!1196764 (=> (not res!796459) (not e!679925))))

(declare-datatypes ((array!77513 0))(
  ( (array!77514 (arr!37403 (Array (_ BitVec 32) (_ BitVec 64))) (size!37939 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77513)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14474 0))(
  ( (ValueCellFull!14474 (v!17878 V!45617)) (EmptyCell!14474) )
))
(declare-datatypes ((array!77515 0))(
  ( (array!77516 (arr!37404 (Array (_ BitVec 32) ValueCell!14474)) (size!37940 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77515)

(assert (=> b!1196764 (= res!796459 (and (= (size!37940 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37939 _keys!1208) (size!37940 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196765 () Bool)

(declare-fun e!679922 () Bool)

(assert (=> b!1196765 (= e!679925 e!679922)))

(declare-fun res!796461 () Bool)

(assert (=> b!1196765 (=> (not res!796461) (not e!679922))))

(declare-fun lt!543136 () array!77513)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77513 (_ BitVec 32)) Bool)

(assert (=> b!1196765 (= res!796461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543136 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196765 (= lt!543136 (array!77514 (store (arr!37403 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37939 _keys!1208)))))

(declare-fun b!1196766 () Bool)

(declare-fun e!679921 () Bool)

(declare-fun e!679920 () Bool)

(declare-fun mapRes!47387 () Bool)

(assert (=> b!1196766 (= e!679921 (and e!679920 mapRes!47387))))

(declare-fun condMapEmpty!47387 () Bool)

(declare-fun mapDefault!47387 () ValueCell!14474)

