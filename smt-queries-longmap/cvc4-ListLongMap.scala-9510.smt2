; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112838 () Bool)

(assert start!112838)

(declare-fun b_free!31067 () Bool)

(declare-fun b_next!31067 () Bool)

(assert (=> start!112838 (= b_free!31067 (not b_next!31067))))

(declare-fun tp!108852 () Bool)

(declare-fun b_and!50085 () Bool)

(assert (=> start!112838 (= tp!108852 b_and!50085)))

(declare-fun b!1338274 () Bool)

(declare-fun res!888002 () Bool)

(declare-fun e!762004 () Bool)

(assert (=> b!1338274 (=> (not res!888002) (not e!762004))))

(declare-datatypes ((array!90812 0))(
  ( (array!90813 (arr!43868 (Array (_ BitVec 32) (_ BitVec 64))) (size!44418 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90812)

(declare-datatypes ((List!31089 0))(
  ( (Nil!31086) (Cons!31085 (h!32294 (_ BitVec 64)) (t!45419 List!31089)) )
))
(declare-fun arrayNoDuplicates!0 (array!90812 (_ BitVec 32) List!31089) Bool)

(assert (=> b!1338274 (= res!888002 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31086))))

(declare-fun b!1338275 () Bool)

(declare-fun res!887997 () Bool)

(assert (=> b!1338275 (=> (not res!887997) (not e!762004))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338275 (= res!887997 (not (validKeyInArray!0 (select (arr!43868 _keys!1590) from!1980))))))

(declare-fun b!1338276 () Bool)

(declare-fun res!888001 () Bool)

(assert (=> b!1338276 (=> (not res!888001) (not e!762004))))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1338276 (= res!888001 (not (= (select (arr!43868 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1338277 () Bool)

(declare-fun e!762006 () Bool)

(declare-fun e!762003 () Bool)

(declare-fun mapRes!57153 () Bool)

(assert (=> b!1338277 (= e!762006 (and e!762003 mapRes!57153))))

(declare-fun condMapEmpty!57153 () Bool)

(declare-datatypes ((V!54405 0))(
  ( (V!54406 (val!18563 Int)) )
))
(declare-datatypes ((ValueCell!17590 0))(
  ( (ValueCellFull!17590 (v!21208 V!54405)) (EmptyCell!17590) )
))
(declare-datatypes ((array!90814 0))(
  ( (array!90815 (arr!43869 (Array (_ BitVec 32) ValueCell!17590)) (size!44419 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90814)

(declare-fun mapDefault!57153 () ValueCell!17590)

