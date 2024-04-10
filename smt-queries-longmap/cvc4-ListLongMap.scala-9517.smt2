; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112968 () Bool)

(assert start!112968)

(declare-fun b!1339085 () Bool)

(declare-fun e!762619 () Bool)

(declare-fun tp_is_empty!37019 () Bool)

(assert (=> b!1339085 (= e!762619 tp_is_empty!37019)))

(declare-fun b!1339086 () Bool)

(declare-fun res!888379 () Bool)

(declare-fun e!762622 () Bool)

(assert (=> b!1339086 (=> (not res!888379) (not e!762622))))

(declare-datatypes ((array!90904 0))(
  ( (array!90905 (arr!43908 (Array (_ BitVec 32) (_ BitVec 64))) (size!44458 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90904)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90904 (_ BitVec 32)) Bool)

(assert (=> b!1339086 (= res!888379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339087 () Bool)

(assert (=> b!1339087 (= e!762622 false)))

(declare-fun lt!593832 () Bool)

(declare-datatypes ((List!31097 0))(
  ( (Nil!31094) (Cons!31093 (h!32302 (_ BitVec 64)) (t!45429 List!31097)) )
))
(declare-fun arrayNoDuplicates!0 (array!90904 (_ BitVec 32) List!31097) Bool)

(assert (=> b!1339087 (= lt!593832 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31094))))

(declare-fun b!1339088 () Bool)

(declare-fun e!762623 () Bool)

(assert (=> b!1339088 (= e!762623 tp_is_empty!37019)))

(declare-fun res!888380 () Bool)

(assert (=> start!112968 (=> (not res!888380) (not e!762622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112968 (= res!888380 (validMask!0 mask!1977))))

(assert (=> start!112968 e!762622))

(assert (=> start!112968 true))

(declare-datatypes ((V!54461 0))(
  ( (V!54462 (val!18584 Int)) )
))
(declare-datatypes ((ValueCell!17611 0))(
  ( (ValueCellFull!17611 (v!21232 V!54461)) (EmptyCell!17611) )
))
(declare-datatypes ((array!90906 0))(
  ( (array!90907 (arr!43909 (Array (_ BitVec 32) ValueCell!17611)) (size!44459 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90906)

(declare-fun e!762620 () Bool)

(declare-fun array_inv!33109 (array!90906) Bool)

(assert (=> start!112968 (and (array_inv!33109 _values!1303) e!762620)))

(declare-fun array_inv!33110 (array!90904) Bool)

(assert (=> start!112968 (array_inv!33110 _keys!1571)))

(declare-fun b!1339089 () Bool)

(declare-fun res!888381 () Bool)

(assert (=> b!1339089 (=> (not res!888381) (not e!762622))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339089 (= res!888381 (and (= (size!44459 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44458 _keys!1571) (size!44459 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339090 () Bool)

(declare-fun mapRes!57235 () Bool)

(assert (=> b!1339090 (= e!762620 (and e!762623 mapRes!57235))))

(declare-fun condMapEmpty!57235 () Bool)

(declare-fun mapDefault!57235 () ValueCell!17611)

