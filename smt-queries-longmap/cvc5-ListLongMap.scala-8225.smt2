; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100258 () Bool)

(assert start!100258)

(declare-fun b!1195905 () Bool)

(declare-fun e!679522 () Bool)

(declare-fun tp_is_empty!30325 () Bool)

(assert (=> b!1195905 (= e!679522 tp_is_empty!30325)))

(declare-fun b!1195906 () Bool)

(declare-fun res!795818 () Bool)

(declare-fun e!679524 () Bool)

(assert (=> b!1195906 (=> (not res!795818) (not e!679524))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77431 0))(
  ( (array!77432 (arr!37362 (Array (_ BitVec 32) (_ BitVec 64))) (size!37898 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77431)

(assert (=> b!1195906 (= res!795818 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37898 _keys!1208))))))

(declare-fun b!1195907 () Bool)

(declare-fun e!679521 () Bool)

(assert (=> b!1195907 (= e!679521 tp_is_empty!30325)))

(declare-fun b!1195908 () Bool)

(declare-fun res!795822 () Bool)

(assert (=> b!1195908 (=> (not res!795822) (not e!679524))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77431 (_ BitVec 32)) Bool)

(assert (=> b!1195908 (= res!795822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195909 () Bool)

(declare-fun res!795823 () Bool)

(assert (=> b!1195909 (=> (not res!795823) (not e!679524))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195909 (= res!795823 (validKeyInArray!0 k!934))))

(declare-fun b!1195910 () Bool)

(declare-fun res!795824 () Bool)

(assert (=> b!1195910 (=> (not res!795824) (not e!679524))))

(assert (=> b!1195910 (= res!795824 (= (select (arr!37362 _keys!1208) i!673) k!934))))

(declare-fun b!1195911 () Bool)

(declare-fun res!795825 () Bool)

(assert (=> b!1195911 (=> (not res!795825) (not e!679524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195911 (= res!795825 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47324 () Bool)

(declare-fun mapRes!47324 () Bool)

(assert (=> mapIsEmpty!47324 mapRes!47324))

(declare-fun b!1195912 () Bool)

(declare-fun res!795821 () Bool)

(declare-fun e!679523 () Bool)

(assert (=> b!1195912 (=> (not res!795821) (not e!679523))))

(declare-fun lt!542999 () array!77431)

(declare-datatypes ((List!26290 0))(
  ( (Nil!26287) (Cons!26286 (h!27495 (_ BitVec 64)) (t!38961 List!26290)) )
))
(declare-fun arrayNoDuplicates!0 (array!77431 (_ BitVec 32) List!26290) Bool)

(assert (=> b!1195912 (= res!795821 (arrayNoDuplicates!0 lt!542999 #b00000000000000000000000000000000 Nil!26287))))

(declare-fun b!1195913 () Bool)

(declare-fun res!795817 () Bool)

(assert (=> b!1195913 (=> (not res!795817) (not e!679524))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45561 0))(
  ( (V!45562 (val!15219 Int)) )
))
(declare-datatypes ((ValueCell!14453 0))(
  ( (ValueCellFull!14453 (v!17857 V!45561)) (EmptyCell!14453) )
))
(declare-datatypes ((array!77433 0))(
  ( (array!77434 (arr!37363 (Array (_ BitVec 32) ValueCell!14453)) (size!37899 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77433)

(assert (=> b!1195913 (= res!795817 (and (= (size!37899 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37898 _keys!1208) (size!37899 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195914 () Bool)

(assert (=> b!1195914 (= e!679524 e!679523)))

(declare-fun res!795819 () Bool)

(assert (=> b!1195914 (=> (not res!795819) (not e!679523))))

(assert (=> b!1195914 (= res!795819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542999 mask!1564))))

(assert (=> b!1195914 (= lt!542999 (array!77432 (store (arr!37362 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37898 _keys!1208)))))

(declare-fun mapNonEmpty!47324 () Bool)

(declare-fun tp!89934 () Bool)

(assert (=> mapNonEmpty!47324 (= mapRes!47324 (and tp!89934 e!679522))))

(declare-fun mapRest!47324 () (Array (_ BitVec 32) ValueCell!14453))

(declare-fun mapKey!47324 () (_ BitVec 32))

(declare-fun mapValue!47324 () ValueCell!14453)

(assert (=> mapNonEmpty!47324 (= (arr!37363 _values!996) (store mapRest!47324 mapKey!47324 mapValue!47324))))

(declare-fun b!1195916 () Bool)

(declare-fun e!679520 () Bool)

(assert (=> b!1195916 (= e!679520 (and e!679521 mapRes!47324))))

(declare-fun condMapEmpty!47324 () Bool)

(declare-fun mapDefault!47324 () ValueCell!14453)

