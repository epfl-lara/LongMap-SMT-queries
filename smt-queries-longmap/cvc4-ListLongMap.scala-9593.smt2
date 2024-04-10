; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113424 () Bool)

(assert start!113424)

(declare-fun b_free!31475 () Bool)

(declare-fun b_next!31475 () Bool)

(assert (=> start!113424 (= b_free!31475 (not b_next!31475))))

(declare-fun tp!110230 () Bool)

(declare-fun b_and!50763 () Bool)

(assert (=> start!113424 (= tp!110230 b_and!50763)))

(declare-fun b!1346442 () Bool)

(declare-fun res!893428 () Bool)

(declare-fun e!766124 () Bool)

(assert (=> b!1346442 (=> (not res!893428) (not e!766124))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91782 0))(
  ( (array!91783 (arr!44347 (Array (_ BitVec 32) (_ BitVec 64))) (size!44897 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91782)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55069 0))(
  ( (V!55070 (val!18812 Int)) )
))
(declare-datatypes ((ValueCell!17839 0))(
  ( (ValueCellFull!17839 (v!21460 V!55069)) (EmptyCell!17839) )
))
(declare-datatypes ((array!91784 0))(
  ( (array!91785 (arr!44348 (Array (_ BitVec 32) ValueCell!17839)) (size!44898 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91784)

(assert (=> b!1346442 (= res!893428 (and (= (size!44898 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44897 _keys!1571) (size!44898 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346443 () Bool)

(declare-fun res!893426 () Bool)

(assert (=> b!1346443 (=> (not res!893426) (not e!766124))))

(declare-datatypes ((List!31404 0))(
  ( (Nil!31401) (Cons!31400 (h!32609 (_ BitVec 64)) (t!45994 List!31404)) )
))
(declare-fun arrayNoDuplicates!0 (array!91782 (_ BitVec 32) List!31404) Bool)

(assert (=> b!1346443 (= res!893426 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31401))))

(declare-fun mapNonEmpty!57919 () Bool)

(declare-fun mapRes!57919 () Bool)

(declare-fun tp!110229 () Bool)

(declare-fun e!766122 () Bool)

(assert (=> mapNonEmpty!57919 (= mapRes!57919 (and tp!110229 e!766122))))

(declare-fun mapRest!57919 () (Array (_ BitVec 32) ValueCell!17839))

(declare-fun mapKey!57919 () (_ BitVec 32))

(declare-fun mapValue!57919 () ValueCell!17839)

(assert (=> mapNonEmpty!57919 (= (arr!44348 _values!1303) (store mapRest!57919 mapKey!57919 mapValue!57919))))

(declare-fun b!1346444 () Bool)

(declare-fun e!766123 () Bool)

(declare-fun e!766121 () Bool)

(assert (=> b!1346444 (= e!766123 (and e!766121 mapRes!57919))))

(declare-fun condMapEmpty!57919 () Bool)

(declare-fun mapDefault!57919 () ValueCell!17839)

