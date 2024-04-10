; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113088 () Bool)

(assert start!113088)

(declare-fun b_free!31139 () Bool)

(declare-fun b_next!31139 () Bool)

(assert (=> start!113088 (= b_free!31139 (not b_next!31139))))

(declare-fun tp!109222 () Bool)

(declare-fun b_and!50185 () Bool)

(assert (=> start!113088 (= tp!109222 b_and!50185)))

(declare-fun b!1340535 () Bool)

(declare-fun res!889276 () Bool)

(declare-fun e!763523 () Bool)

(assert (=> b!1340535 (=> (not res!889276) (not e!763523))))

(declare-datatypes ((V!54621 0))(
  ( (V!54622 (val!18644 Int)) )
))
(declare-fun minValue!1245 () V!54621)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91130 0))(
  ( (array!91131 (arr!44021 (Array (_ BitVec 32) (_ BitVec 64))) (size!44571 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91130)

(declare-fun zeroValue!1245 () V!54621)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17671 0))(
  ( (ValueCellFull!17671 (v!21292 V!54621)) (EmptyCell!17671) )
))
(declare-datatypes ((array!91132 0))(
  ( (array!91133 (arr!44022 (Array (_ BitVec 32) ValueCell!17671)) (size!44572 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91132)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!23996 0))(
  ( (tuple2!23997 (_1!12009 (_ BitVec 64)) (_2!12009 V!54621)) )
))
(declare-datatypes ((List!31159 0))(
  ( (Nil!31156) (Cons!31155 (h!32364 tuple2!23996) (t!45509 List!31159)) )
))
(declare-datatypes ((ListLongMap!21653 0))(
  ( (ListLongMap!21654 (toList!10842 List!31159)) )
))
(declare-fun contains!9018 (ListLongMap!21653 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5810 (array!91130 array!91132 (_ BitVec 32) (_ BitVec 32) V!54621 V!54621 (_ BitVec 32) Int) ListLongMap!21653)

(assert (=> b!1340535 (= res!889276 (contains!9018 (getCurrentListMap!5810 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun res!889274 () Bool)

(assert (=> start!113088 (=> (not res!889274) (not e!763523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113088 (= res!889274 (validMask!0 mask!1977))))

(assert (=> start!113088 e!763523))

(declare-fun tp_is_empty!37139 () Bool)

(assert (=> start!113088 tp_is_empty!37139))

(assert (=> start!113088 true))

(declare-fun array_inv!33191 (array!91130) Bool)

(assert (=> start!113088 (array_inv!33191 _keys!1571)))

(declare-fun e!763522 () Bool)

(declare-fun array_inv!33192 (array!91132) Bool)

(assert (=> start!113088 (and (array_inv!33192 _values!1303) e!763522)))

(assert (=> start!113088 tp!109222))

(declare-fun b!1340536 () Bool)

(declare-fun res!889278 () Bool)

(assert (=> b!1340536 (=> (not res!889278) (not e!763523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340536 (= res!889278 (validKeyInArray!0 (select (arr!44021 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57415 () Bool)

(declare-fun mapRes!57415 () Bool)

(declare-fun tp!109221 () Bool)

(declare-fun e!763520 () Bool)

(assert (=> mapNonEmpty!57415 (= mapRes!57415 (and tp!109221 e!763520))))

(declare-fun mapValue!57415 () ValueCell!17671)

(declare-fun mapKey!57415 () (_ BitVec 32))

(declare-fun mapRest!57415 () (Array (_ BitVec 32) ValueCell!17671))

(assert (=> mapNonEmpty!57415 (= (arr!44022 _values!1303) (store mapRest!57415 mapKey!57415 mapValue!57415))))

(declare-fun b!1340537 () Bool)

(declare-fun res!889273 () Bool)

(assert (=> b!1340537 (=> (not res!889273) (not e!763523))))

(declare-datatypes ((List!31160 0))(
  ( (Nil!31157) (Cons!31156 (h!32365 (_ BitVec 64)) (t!45510 List!31160)) )
))
(declare-fun arrayNoDuplicates!0 (array!91130 (_ BitVec 32) List!31160) Bool)

(assert (=> b!1340537 (= res!889273 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31157))))

(declare-fun b!1340538 () Bool)

(declare-fun res!889280 () Bool)

(assert (=> b!1340538 (=> (not res!889280) (not e!763523))))

(assert (=> b!1340538 (= res!889280 (and (= (size!44572 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44571 _keys!1571) (size!44572 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340539 () Bool)

(declare-fun e!763521 () Bool)

(assert (=> b!1340539 (= e!763522 (and e!763521 mapRes!57415))))

(declare-fun condMapEmpty!57415 () Bool)

(declare-fun mapDefault!57415 () ValueCell!17671)

