; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113600 () Bool)

(assert start!113600)

(declare-fun b_free!31567 () Bool)

(declare-fun b_next!31567 () Bool)

(assert (=> start!113600 (= b_free!31567 (not b_next!31567))))

(declare-fun tp!110512 () Bool)

(declare-fun b_and!50925 () Bool)

(assert (=> start!113600 (= tp!110512 b_and!50925)))

(declare-fun b!1348562 () Bool)

(declare-fun res!894750 () Bool)

(declare-fun e!767176 () Bool)

(assert (=> b!1348562 (=> (not res!894750) (not e!767176))))

(declare-datatypes ((array!91962 0))(
  ( (array!91963 (arr!44435 (Array (_ BitVec 32) (_ BitVec 64))) (size!44985 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91962)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91962 (_ BitVec 32)) Bool)

(assert (=> b!1348562 (= res!894750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348564 () Bool)

(declare-fun e!767178 () Bool)

(declare-fun tp_is_empty!37567 () Bool)

(assert (=> b!1348564 (= e!767178 tp_is_empty!37567)))

(declare-fun b!1348565 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((V!55193 0))(
  ( (V!55194 (val!18858 Int)) )
))
(declare-datatypes ((ValueCell!17885 0))(
  ( (ValueCellFull!17885 (v!21510 V!55193)) (EmptyCell!17885) )
))
(declare-datatypes ((array!91964 0))(
  ( (array!91965 (arr!44436 (Array (_ BitVec 32) ValueCell!17885)) (size!44986 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91964)

(assert (=> b!1348565 (= e!767176 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1960 (size!44986 _values!1303))))))

(declare-fun b!1348566 () Bool)

(declare-fun res!894755 () Bool)

(assert (=> b!1348566 (=> (not res!894755) (not e!767176))))

(declare-datatypes ((List!31468 0))(
  ( (Nil!31465) (Cons!31464 (h!32673 (_ BitVec 64)) (t!46106 List!31468)) )
))
(declare-fun arrayNoDuplicates!0 (array!91962 (_ BitVec 32) List!31468) Bool)

(assert (=> b!1348566 (= res!894755 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31465))))

(declare-fun b!1348567 () Bool)

(declare-fun res!894753 () Bool)

(assert (=> b!1348567 (=> (not res!894753) (not e!767176))))

(assert (=> b!1348567 (= res!894753 (and (= (size!44986 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44985 _keys!1571) (size!44986 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58064 () Bool)

(declare-fun mapRes!58064 () Bool)

(assert (=> mapIsEmpty!58064 mapRes!58064))

(declare-fun b!1348568 () Bool)

(declare-fun res!894749 () Bool)

(assert (=> b!1348568 (=> (not res!894749) (not e!767176))))

(declare-fun minValue!1245 () V!55193)

(declare-fun zeroValue!1245 () V!55193)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24316 0))(
  ( (tuple2!24317 (_1!12169 (_ BitVec 64)) (_2!12169 V!55193)) )
))
(declare-datatypes ((List!31469 0))(
  ( (Nil!31466) (Cons!31465 (h!32674 tuple2!24316) (t!46107 List!31469)) )
))
(declare-datatypes ((ListLongMap!21973 0))(
  ( (ListLongMap!21974 (toList!11002 List!31469)) )
))
(declare-fun contains!9182 (ListLongMap!21973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5951 (array!91962 array!91964 (_ BitVec 32) (_ BitVec 32) V!55193 V!55193 (_ BitVec 32) Int) ListLongMap!21973)

(assert (=> b!1348568 (= res!894749 (contains!9182 (getCurrentListMap!5951 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1348569 () Bool)

(declare-fun e!767174 () Bool)

(assert (=> b!1348569 (= e!767174 tp_is_empty!37567)))

(declare-fun b!1348570 () Bool)

(declare-fun e!767175 () Bool)

(assert (=> b!1348570 (= e!767175 (and e!767174 mapRes!58064))))

(declare-fun condMapEmpty!58064 () Bool)

(declare-fun mapDefault!58064 () ValueCell!17885)

