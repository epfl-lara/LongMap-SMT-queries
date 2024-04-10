; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111744 () Bool)

(assert start!111744)

(declare-fun b_free!30401 () Bool)

(declare-fun b_next!30401 () Bool)

(assert (=> start!111744 (= b_free!30401 (not b_next!30401))))

(declare-fun tp!106678 () Bool)

(declare-fun b_and!48939 () Bool)

(assert (=> start!111744 (= tp!106678 b_and!48939)))

(declare-fun b!1324108 () Bool)

(declare-fun e!754848 () Bool)

(declare-fun tp_is_empty!36221 () Bool)

(assert (=> b!1324108 (= e!754848 tp_is_empty!36221)))

(declare-fun b!1324109 () Bool)

(declare-fun res!878887 () Bool)

(declare-fun e!754845 () Bool)

(assert (=> b!1324109 (=> (not res!878887) (not e!754845))))

(declare-datatypes ((array!89358 0))(
  ( (array!89359 (arr!43153 (Array (_ BitVec 32) (_ BitVec 64))) (size!43703 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89358)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89358 (_ BitVec 32)) Bool)

(assert (=> b!1324109 (= res!878887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324110 () Bool)

(assert (=> b!1324110 (= e!754845 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53397 0))(
  ( (V!53398 (val!18185 Int)) )
))
(declare-fun zeroValue!1279 () V!53397)

(declare-datatypes ((ValueCell!17212 0))(
  ( (ValueCellFull!17212 (v!20815 V!53397)) (EmptyCell!17212) )
))
(declare-datatypes ((array!89360 0))(
  ( (array!89361 (arr!43154 (Array (_ BitVec 32) ValueCell!17212)) (size!43704 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89360)

(declare-fun minValue!1279 () V!53397)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun lt!589434 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23448 0))(
  ( (tuple2!23449 (_1!11735 (_ BitVec 64)) (_2!11735 V!53397)) )
))
(declare-datatypes ((List!30589 0))(
  ( (Nil!30586) (Cons!30585 (h!31794 tuple2!23448) (t!44515 List!30589)) )
))
(declare-datatypes ((ListLongMap!21105 0))(
  ( (ListLongMap!21106 (toList!10568 List!30589)) )
))
(declare-fun contains!8723 (ListLongMap!21105 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5564 (array!89358 array!89360 (_ BitVec 32) (_ BitVec 32) V!53397 V!53397 (_ BitVec 32) Int) ListLongMap!21105)

(assert (=> b!1324110 (= lt!589434 (contains!8723 (getCurrentListMap!5564 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!878888 () Bool)

(assert (=> start!111744 (=> (not res!878888) (not e!754845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111744 (= res!878888 (validMask!0 mask!2019))))

(assert (=> start!111744 e!754845))

(declare-fun array_inv!32577 (array!89358) Bool)

(assert (=> start!111744 (array_inv!32577 _keys!1609)))

(assert (=> start!111744 true))

(assert (=> start!111744 tp_is_empty!36221))

(declare-fun e!754847 () Bool)

(declare-fun array_inv!32578 (array!89360) Bool)

(assert (=> start!111744 (and (array_inv!32578 _values!1337) e!754847)))

(assert (=> start!111744 tp!106678))

(declare-fun b!1324111 () Bool)

(declare-fun res!878885 () Bool)

(assert (=> b!1324111 (=> (not res!878885) (not e!754845))))

(declare-datatypes ((List!30590 0))(
  ( (Nil!30587) (Cons!30586 (h!31795 (_ BitVec 64)) (t!44516 List!30590)) )
))
(declare-fun arrayNoDuplicates!0 (array!89358 (_ BitVec 32) List!30590) Bool)

(assert (=> b!1324111 (= res!878885 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30587))))

(declare-fun b!1324112 () Bool)

(declare-fun e!754846 () Bool)

(assert (=> b!1324112 (= e!754846 tp_is_empty!36221)))

(declare-fun b!1324113 () Bool)

(declare-fun res!878886 () Bool)

(assert (=> b!1324113 (=> (not res!878886) (not e!754845))))

(assert (=> b!1324113 (= res!878886 (and (= (size!43704 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43703 _keys!1609) (size!43704 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324114 () Bool)

(declare-fun mapRes!55979 () Bool)

(assert (=> b!1324114 (= e!754847 (and e!754846 mapRes!55979))))

(declare-fun condMapEmpty!55979 () Bool)

(declare-fun mapDefault!55979 () ValueCell!17212)

