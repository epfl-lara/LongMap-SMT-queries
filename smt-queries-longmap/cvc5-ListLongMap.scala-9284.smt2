; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111052 () Bool)

(assert start!111052)

(declare-fun b_free!29887 () Bool)

(declare-fun b_next!29887 () Bool)

(assert (=> start!111052 (= b_free!29887 (not b_next!29887))))

(declare-fun tp!104982 () Bool)

(declare-fun b_and!48095 () Bool)

(assert (=> start!111052 (= tp!104982 b_and!48095)))

(declare-fun mapIsEmpty!55054 () Bool)

(declare-fun mapRes!55054 () Bool)

(assert (=> mapIsEmpty!55054 mapRes!55054))

(declare-fun b!1314818 () Bool)

(declare-fun res!872873 () Bool)

(declare-fun e!750014 () Bool)

(assert (=> b!1314818 (=> (not res!872873) (not e!750014))))

(declare-datatypes ((array!88200 0))(
  ( (array!88201 (arr!42580 (Array (_ BitVec 32) (_ BitVec 64))) (size!43130 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88200)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88200 (_ BitVec 32)) Bool)

(assert (=> b!1314818 (= res!872873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!872874 () Bool)

(assert (=> start!111052 (=> (not res!872874) (not e!750014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111052 (= res!872874 (validMask!0 mask!2040))))

(assert (=> start!111052 e!750014))

(assert (=> start!111052 tp!104982))

(declare-fun array_inv!32155 (array!88200) Bool)

(assert (=> start!111052 (array_inv!32155 _keys!1628)))

(assert (=> start!111052 true))

(declare-fun tp_is_empty!35617 () Bool)

(assert (=> start!111052 tp_is_empty!35617))

(declare-datatypes ((V!52593 0))(
  ( (V!52594 (val!17883 Int)) )
))
(declare-datatypes ((ValueCell!16910 0))(
  ( (ValueCellFull!16910 (v!20510 V!52593)) (EmptyCell!16910) )
))
(declare-datatypes ((array!88202 0))(
  ( (array!88203 (arr!42581 (Array (_ BitVec 32) ValueCell!16910)) (size!43131 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88202)

(declare-fun e!750017 () Bool)

(declare-fun array_inv!32156 (array!88202) Bool)

(assert (=> start!111052 (and (array_inv!32156 _values!1354) e!750017)))

(declare-fun b!1314819 () Bool)

(declare-fun res!872872 () Bool)

(assert (=> b!1314819 (=> (not res!872872) (not e!750014))))

(declare-datatypes ((List!30200 0))(
  ( (Nil!30197) (Cons!30196 (h!31405 (_ BitVec 64)) (t!43806 List!30200)) )
))
(declare-fun arrayNoDuplicates!0 (array!88200 (_ BitVec 32) List!30200) Bool)

(assert (=> b!1314819 (= res!872872 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30197))))

(declare-fun b!1314820 () Bool)

(declare-fun res!872871 () Bool)

(assert (=> b!1314820 (=> (not res!872871) (not e!750014))))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(assert (=> b!1314820 (= res!872871 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43130 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314821 () Bool)

(declare-fun e!750013 () Bool)

(assert (=> b!1314821 (= e!750013 tp_is_empty!35617)))

(declare-fun b!1314822 () Bool)

(assert (=> b!1314822 (= e!750014 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52593)

(declare-fun zeroValue!1296 () V!52593)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun lt!585840 () Bool)

(declare-datatypes ((tuple2!23064 0))(
  ( (tuple2!23065 (_1!11543 (_ BitVec 64)) (_2!11543 V!52593)) )
))
(declare-datatypes ((List!30201 0))(
  ( (Nil!30198) (Cons!30197 (h!31406 tuple2!23064) (t!43807 List!30201)) )
))
(declare-datatypes ((ListLongMap!20721 0))(
  ( (ListLongMap!20722 (toList!10376 List!30201)) )
))
(declare-fun contains!8526 (ListLongMap!20721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5389 (array!88200 array!88202 (_ BitVec 32) (_ BitVec 32) V!52593 V!52593 (_ BitVec 32) Int) ListLongMap!20721)

(assert (=> b!1314822 (= lt!585840 (contains!8526 (getCurrentListMap!5389 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!55054 () Bool)

(declare-fun tp!104983 () Bool)

(assert (=> mapNonEmpty!55054 (= mapRes!55054 (and tp!104983 e!750013))))

(declare-fun mapRest!55054 () (Array (_ BitVec 32) ValueCell!16910))

(declare-fun mapKey!55054 () (_ BitVec 32))

(declare-fun mapValue!55054 () ValueCell!16910)

(assert (=> mapNonEmpty!55054 (= (arr!42581 _values!1354) (store mapRest!55054 mapKey!55054 mapValue!55054))))

(declare-fun b!1314823 () Bool)

(declare-fun res!872870 () Bool)

(assert (=> b!1314823 (=> (not res!872870) (not e!750014))))

(assert (=> b!1314823 (= res!872870 (and (= (size!43131 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43130 _keys!1628) (size!43131 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314824 () Bool)

(declare-fun e!750015 () Bool)

(assert (=> b!1314824 (= e!750015 tp_is_empty!35617)))

(declare-fun b!1314825 () Bool)

(assert (=> b!1314825 (= e!750017 (and e!750015 mapRes!55054))))

(declare-fun condMapEmpty!55054 () Bool)

(declare-fun mapDefault!55054 () ValueCell!16910)

