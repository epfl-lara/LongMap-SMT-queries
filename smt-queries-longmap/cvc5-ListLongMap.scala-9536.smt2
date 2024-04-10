; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113078 () Bool)

(assert start!113078)

(declare-fun b_free!31129 () Bool)

(declare-fun b_next!31129 () Bool)

(assert (=> start!113078 (= b_free!31129 (not b_next!31129))))

(declare-fun tp!109191 () Bool)

(declare-fun b_and!50165 () Bool)

(assert (=> start!113078 (= tp!109191 b_and!50165)))

(declare-fun b!1340345 () Bool)

(declare-fun res!889139 () Bool)

(declare-fun e!763447 () Bool)

(assert (=> b!1340345 (=> (not res!889139) (not e!763447))))

(declare-datatypes ((array!91110 0))(
  ( (array!91111 (arr!44011 (Array (_ BitVec 32) (_ BitVec 64))) (size!44561 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91110)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91110 (_ BitVec 32)) Bool)

(assert (=> b!1340345 (= res!889139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340346 () Bool)

(declare-fun e!763448 () Bool)

(declare-fun tp_is_empty!37129 () Bool)

(assert (=> b!1340346 (= e!763448 tp_is_empty!37129)))

(declare-fun b!1340347 () Bool)

(declare-fun res!889143 () Bool)

(assert (=> b!1340347 (=> (not res!889143) (not e!763447))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340347 (= res!889143 (not (= (select (arr!44011 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340348 () Bool)

(declare-fun res!889142 () Bool)

(assert (=> b!1340348 (=> (not res!889142) (not e!763447))))

(declare-datatypes ((V!54609 0))(
  ( (V!54610 (val!18639 Int)) )
))
(declare-fun minValue!1245 () V!54609)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17666 0))(
  ( (ValueCellFull!17666 (v!21287 V!54609)) (EmptyCell!17666) )
))
(declare-datatypes ((array!91112 0))(
  ( (array!91113 (arr!44012 (Array (_ BitVec 32) ValueCell!17666)) (size!44562 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91112)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!54609)

(declare-datatypes ((tuple2!23988 0))(
  ( (tuple2!23989 (_1!12005 (_ BitVec 64)) (_2!12005 V!54609)) )
))
(declare-datatypes ((List!31151 0))(
  ( (Nil!31148) (Cons!31147 (h!32356 tuple2!23988) (t!45491 List!31151)) )
))
(declare-datatypes ((ListLongMap!21645 0))(
  ( (ListLongMap!21646 (toList!10838 List!31151)) )
))
(declare-fun contains!9014 (ListLongMap!21645 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5806 (array!91110 array!91112 (_ BitVec 32) (_ BitVec 32) V!54609 V!54609 (_ BitVec 32) Int) ListLongMap!21645)

(assert (=> b!1340348 (= res!889142 (contains!9014 (getCurrentListMap!5806 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun res!889144 () Bool)

(assert (=> start!113078 (=> (not res!889144) (not e!763447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113078 (= res!889144 (validMask!0 mask!1977))))

(assert (=> start!113078 e!763447))

(assert (=> start!113078 tp_is_empty!37129))

(assert (=> start!113078 true))

(declare-fun array_inv!33183 (array!91110) Bool)

(assert (=> start!113078 (array_inv!33183 _keys!1571)))

(declare-fun e!763444 () Bool)

(declare-fun array_inv!33184 (array!91112) Bool)

(assert (=> start!113078 (and (array_inv!33184 _values!1303) e!763444)))

(assert (=> start!113078 tp!109191))

(declare-fun b!1340349 () Bool)

(declare-fun res!889146 () Bool)

(assert (=> b!1340349 (=> (not res!889146) (not e!763447))))

(declare-datatypes ((List!31152 0))(
  ( (Nil!31149) (Cons!31148 (h!32357 (_ BitVec 64)) (t!45492 List!31152)) )
))
(declare-fun arrayNoDuplicates!0 (array!91110 (_ BitVec 32) List!31152) Bool)

(assert (=> b!1340349 (= res!889146 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31149))))

(declare-fun b!1340350 () Bool)

(declare-fun mapRes!57400 () Bool)

(assert (=> b!1340350 (= e!763444 (and e!763448 mapRes!57400))))

(declare-fun condMapEmpty!57400 () Bool)

(declare-fun mapDefault!57400 () ValueCell!17666)

