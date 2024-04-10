; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113280 () Bool)

(assert start!113280)

(declare-fun b_free!31331 () Bool)

(declare-fun b_next!31331 () Bool)

(assert (=> start!113280 (= b_free!31331 (not b_next!31331))))

(declare-fun tp!109797 () Bool)

(declare-fun b_and!50553 () Bool)

(assert (=> start!113280 (= tp!109797 b_and!50553)))

(declare-fun b!1344063 () Bool)

(declare-fun e!764962 () Bool)

(declare-fun tp_is_empty!37331 () Bool)

(assert (=> b!1344063 (= e!764962 tp_is_empty!37331)))

(declare-fun b!1344064 () Bool)

(declare-fun e!764959 () Bool)

(assert (=> b!1344064 (= e!764959 tp_is_empty!37331)))

(declare-fun mapIsEmpty!57703 () Bool)

(declare-fun mapRes!57703 () Bool)

(assert (=> mapIsEmpty!57703 mapRes!57703))

(declare-fun b!1344065 () Bool)

(declare-fun e!764963 () Bool)

(assert (=> b!1344065 (= e!764963 false)))

(declare-datatypes ((V!54877 0))(
  ( (V!54878 (val!18740 Int)) )
))
(declare-fun minValue!1245 () V!54877)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91506 0))(
  ( (array!91507 (arr!44209 (Array (_ BitVec 32) (_ BitVec 64))) (size!44759 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91506)

(declare-fun lt!595146 () Bool)

(declare-fun zeroValue!1245 () V!54877)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17767 0))(
  ( (ValueCellFull!17767 (v!21388 V!54877)) (EmptyCell!17767) )
))
(declare-datatypes ((array!91508 0))(
  ( (array!91509 (arr!44210 (Array (_ BitVec 32) ValueCell!17767)) (size!44760 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91508)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24146 0))(
  ( (tuple2!24147 (_1!12084 (_ BitVec 64)) (_2!12084 V!54877)) )
))
(declare-datatypes ((List!31302 0))(
  ( (Nil!31299) (Cons!31298 (h!32507 tuple2!24146) (t!45826 List!31302)) )
))
(declare-datatypes ((ListLongMap!21803 0))(
  ( (ListLongMap!21804 (toList!10917 List!31302)) )
))
(declare-fun contains!9093 (ListLongMap!21803 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5873 (array!91506 array!91508 (_ BitVec 32) (_ BitVec 32) V!54877 V!54877 (_ BitVec 32) Int) ListLongMap!21803)

(assert (=> b!1344065 (= lt!595146 (contains!9093 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1344066 () Bool)

(declare-fun res!891762 () Bool)

(assert (=> b!1344066 (=> (not res!891762) (not e!764963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91506 (_ BitVec 32)) Bool)

(assert (=> b!1344066 (= res!891762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344067 () Bool)

(declare-fun e!764960 () Bool)

(assert (=> b!1344067 (= e!764960 (and e!764962 mapRes!57703))))

(declare-fun condMapEmpty!57703 () Bool)

(declare-fun mapDefault!57703 () ValueCell!17767)

