; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4090 () Bool)

(assert start!4090)

(declare-fun b_free!995 () Bool)

(declare-fun b_next!995 () Bool)

(assert (=> start!4090 (= b_free!995 (not b_next!995))))

(declare-fun tp!4404 () Bool)

(declare-fun b_and!1805 () Bool)

(assert (=> start!4090 (= tp!4404 b_and!1805)))

(declare-fun b!30315 () Bool)

(declare-fun res!18257 () Bool)

(declare-fun e!19472 () Bool)

(assert (=> b!30315 (=> (not res!18257) (not e!19472))))

(declare-datatypes ((array!1927 0))(
  ( (array!1928 (arr!917 (Array (_ BitVec 32) (_ BitVec 64))) (size!1018 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1927)

(declare-datatypes ((List!754 0))(
  ( (Nil!751) (Cons!750 (h!1317 (_ BitVec 64)) (t!3447 List!754)) )
))
(declare-fun arrayNoDuplicates!0 (array!1927 (_ BitVec 32) List!754) Bool)

(assert (=> b!30315 (= res!18257 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!751))))

(declare-fun mapNonEmpty!1552 () Bool)

(declare-fun mapRes!1552 () Bool)

(declare-fun tp!4405 () Bool)

(declare-fun e!19475 () Bool)

(assert (=> mapNonEmpty!1552 (= mapRes!1552 (and tp!4405 e!19475))))

(declare-datatypes ((V!1623 0))(
  ( (V!1624 (val!701 Int)) )
))
(declare-datatypes ((ValueCell!475 0))(
  ( (ValueCellFull!475 (v!1790 V!1623)) (EmptyCell!475) )
))
(declare-datatypes ((array!1929 0))(
  ( (array!1930 (arr!918 (Array (_ BitVec 32) ValueCell!475)) (size!1019 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1929)

(declare-fun mapRest!1552 () (Array (_ BitVec 32) ValueCell!475))

(declare-fun mapValue!1552 () ValueCell!475)

(declare-fun mapKey!1552 () (_ BitVec 32))

(assert (=> mapNonEmpty!1552 (= (arr!918 _values!1501) (store mapRest!1552 mapKey!1552 mapValue!1552))))

(declare-fun b!30316 () Bool)

(declare-fun res!18255 () Bool)

(assert (=> b!30316 (=> (not res!18255) (not e!19472))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30316 (= res!18255 (validKeyInArray!0 k!1304))))

(declare-fun b!30317 () Bool)

(declare-fun res!18261 () Bool)

(assert (=> b!30317 (=> (not res!18261) (not e!19472))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!30317 (= res!18261 (and (= (size!1019 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1018 _keys!1833) (size!1019 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30318 () Bool)

(declare-fun e!19471 () Bool)

(declare-fun e!19474 () Bool)

(assert (=> b!30318 (= e!19471 (and e!19474 mapRes!1552))))

(declare-fun condMapEmpty!1552 () Bool)

(declare-fun mapDefault!1552 () ValueCell!475)

