; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113042 () Bool)

(assert start!113042)

(declare-fun b_free!31093 () Bool)

(declare-fun b_next!31093 () Bool)

(assert (=> start!113042 (= b_free!31093 (not b_next!31093))))

(declare-fun tp!109084 () Bool)

(declare-fun b_and!50123 () Bool)

(assert (=> start!113042 (= tp!109084 b_and!50123)))

(declare-fun res!888797 () Bool)

(declare-fun e!763177 () Bool)

(assert (=> start!113042 (=> (not res!888797) (not e!763177))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113042 (= res!888797 (validMask!0 mask!1977))))

(assert (=> start!113042 e!763177))

(declare-fun tp_is_empty!37093 () Bool)

(assert (=> start!113042 tp_is_empty!37093))

(assert (=> start!113042 true))

(declare-datatypes ((array!91040 0))(
  ( (array!91041 (arr!43976 (Array (_ BitVec 32) (_ BitVec 64))) (size!44526 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91040)

(declare-fun array_inv!33161 (array!91040) Bool)

(assert (=> start!113042 (array_inv!33161 _keys!1571)))

(declare-datatypes ((V!54561 0))(
  ( (V!54562 (val!18621 Int)) )
))
(declare-datatypes ((ValueCell!17648 0))(
  ( (ValueCellFull!17648 (v!21269 V!54561)) (EmptyCell!17648) )
))
(declare-datatypes ((array!91042 0))(
  ( (array!91043 (arr!43977 (Array (_ BitVec 32) ValueCell!17648)) (size!44527 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91042)

(declare-fun e!763175 () Bool)

(declare-fun array_inv!33162 (array!91042) Bool)

(assert (=> start!113042 (and (array_inv!33162 _values!1303) e!763175)))

(assert (=> start!113042 tp!109084))

(declare-fun b!1339836 () Bool)

(declare-fun res!888799 () Bool)

(assert (=> b!1339836 (=> (not res!888799) (not e!763177))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339836 (= res!888799 (and (= (size!44527 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44526 _keys!1571) (size!44527 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339837 () Bool)

(declare-fun res!888798 () Bool)

(assert (=> b!1339837 (=> (not res!888798) (not e!763177))))

(declare-datatypes ((List!31129 0))(
  ( (Nil!31126) (Cons!31125 (h!32334 (_ BitVec 64)) (t!45461 List!31129)) )
))
(declare-fun arrayNoDuplicates!0 (array!91040 (_ BitVec 32) List!31129) Bool)

(assert (=> b!1339837 (= res!888798 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31126))))

(declare-fun b!1339838 () Bool)

(assert (=> b!1339838 (= e!763177 false)))

(declare-fun minValue!1245 () V!54561)

(declare-fun zeroValue!1245 () V!54561)

(declare-fun lt!593934 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23962 0))(
  ( (tuple2!23963 (_1!11992 (_ BitVec 64)) (_2!11992 V!54561)) )
))
(declare-datatypes ((List!31130 0))(
  ( (Nil!31127) (Cons!31126 (h!32335 tuple2!23962) (t!45462 List!31130)) )
))
(declare-datatypes ((ListLongMap!21619 0))(
  ( (ListLongMap!21620 (toList!10825 List!31130)) )
))
(declare-fun contains!9001 (ListLongMap!21619 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5794 (array!91040 array!91042 (_ BitVec 32) (_ BitVec 32) V!54561 V!54561 (_ BitVec 32) Int) ListLongMap!21619)

(assert (=> b!1339838 (= lt!593934 (contains!9001 (getCurrentListMap!5794 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapIsEmpty!57346 () Bool)

(declare-fun mapRes!57346 () Bool)

(assert (=> mapIsEmpty!57346 mapRes!57346))

(declare-fun b!1339839 () Bool)

(declare-fun res!888801 () Bool)

(assert (=> b!1339839 (=> (not res!888801) (not e!763177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91040 (_ BitVec 32)) Bool)

(assert (=> b!1339839 (= res!888801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339840 () Bool)

(declare-fun e!763174 () Bool)

(assert (=> b!1339840 (= e!763175 (and e!763174 mapRes!57346))))

(declare-fun condMapEmpty!57346 () Bool)

(declare-fun mapDefault!57346 () ValueCell!17648)
