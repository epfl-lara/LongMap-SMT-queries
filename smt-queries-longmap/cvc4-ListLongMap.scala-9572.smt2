; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113298 () Bool)

(assert start!113298)

(declare-fun b_free!31349 () Bool)

(declare-fun b_next!31349 () Bool)

(assert (=> start!113298 (= b_free!31349 (not b_next!31349))))

(declare-fun tp!109852 () Bool)

(declare-fun b_and!50571 () Bool)

(assert (=> start!113298 (= tp!109852 b_and!50571)))

(declare-fun b!1344279 () Bool)

(declare-fun res!891898 () Bool)

(declare-fun e!765094 () Bool)

(assert (=> b!1344279 (=> (not res!891898) (not e!765094))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91540 0))(
  ( (array!91541 (arr!44226 (Array (_ BitVec 32) (_ BitVec 64))) (size!44776 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91540)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344279 (= res!891898 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44776 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344280 () Bool)

(declare-fun res!891896 () Bool)

(assert (=> b!1344280 (=> (not res!891896) (not e!765094))))

(declare-datatypes ((List!31316 0))(
  ( (Nil!31313) (Cons!31312 (h!32521 (_ BitVec 64)) (t!45840 List!31316)) )
))
(declare-fun arrayNoDuplicates!0 (array!91540 (_ BitVec 32) List!31316) Bool)

(assert (=> b!1344280 (= res!891896 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31313))))

(declare-fun b!1344281 () Bool)

(declare-fun res!891899 () Bool)

(assert (=> b!1344281 (=> (not res!891899) (not e!765094))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91540 (_ BitVec 32)) Bool)

(assert (=> b!1344281 (= res!891899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344282 () Bool)

(assert (=> b!1344282 (= e!765094 false)))

(declare-fun lt!595173 () Bool)

(declare-datatypes ((V!54901 0))(
  ( (V!54902 (val!18749 Int)) )
))
(declare-fun minValue!1245 () V!54901)

(declare-fun zeroValue!1245 () V!54901)

(declare-datatypes ((ValueCell!17776 0))(
  ( (ValueCellFull!17776 (v!21397 V!54901)) (EmptyCell!17776) )
))
(declare-datatypes ((array!91542 0))(
  ( (array!91543 (arr!44227 (Array (_ BitVec 32) ValueCell!17776)) (size!44777 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91542)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24160 0))(
  ( (tuple2!24161 (_1!12091 (_ BitVec 64)) (_2!12091 V!54901)) )
))
(declare-datatypes ((List!31317 0))(
  ( (Nil!31314) (Cons!31313 (h!32522 tuple2!24160) (t!45841 List!31317)) )
))
(declare-datatypes ((ListLongMap!21817 0))(
  ( (ListLongMap!21818 (toList!10924 List!31317)) )
))
(declare-fun contains!9100 (ListLongMap!21817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5880 (array!91540 array!91542 (_ BitVec 32) (_ BitVec 32) V!54901 V!54901 (_ BitVec 32) Int) ListLongMap!21817)

(assert (=> b!1344282 (= lt!595173 (contains!9100 (getCurrentListMap!5880 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1344283 () Bool)

(declare-fun e!765098 () Bool)

(declare-fun e!765095 () Bool)

(declare-fun mapRes!57730 () Bool)

(assert (=> b!1344283 (= e!765098 (and e!765095 mapRes!57730))))

(declare-fun condMapEmpty!57730 () Bool)

(declare-fun mapDefault!57730 () ValueCell!17776)

