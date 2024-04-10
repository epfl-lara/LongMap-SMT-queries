; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111368 () Bool)

(assert start!111368)

(declare-fun b_free!30025 () Bool)

(declare-fun b_next!30025 () Bool)

(assert (=> start!111368 (= b_free!30025 (not b_next!30025))))

(declare-fun tp!105550 () Bool)

(declare-fun b_and!48245 () Bool)

(assert (=> start!111368 (= tp!105550 b_and!48245)))

(declare-fun b!1317820 () Bool)

(declare-fun e!752029 () Bool)

(assert (=> b!1317820 (= e!752029 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52897 0))(
  ( (V!52898 (val!17997 Int)) )
))
(declare-fun zeroValue!1279 () V!52897)

(declare-datatypes ((ValueCell!17024 0))(
  ( (ValueCellFull!17024 (v!20627 V!52897)) (EmptyCell!17024) )
))
(declare-datatypes ((array!88642 0))(
  ( (array!88643 (arr!42795 (Array (_ BitVec 32) ValueCell!17024)) (size!43345 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88642)

(declare-fun minValue!1279 () V!52897)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!88644 0))(
  ( (array!88645 (arr!42796 (Array (_ BitVec 32) (_ BitVec 64))) (size!43346 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88644)

(declare-fun lt!586413 () Bool)

(declare-datatypes ((tuple2!23162 0))(
  ( (tuple2!23163 (_1!11592 (_ BitVec 64)) (_2!11592 V!52897)) )
))
(declare-datatypes ((List!30320 0))(
  ( (Nil!30317) (Cons!30316 (h!31525 tuple2!23162) (t!43928 List!30320)) )
))
(declare-datatypes ((ListLongMap!20819 0))(
  ( (ListLongMap!20820 (toList!10425 List!30320)) )
))
(declare-fun contains!8580 (ListLongMap!20819 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5438 (array!88644 array!88642 (_ BitVec 32) (_ BitVec 32) V!52897 V!52897 (_ BitVec 32) Int) ListLongMap!20819)

(assert (=> b!1317820 (= lt!586413 (contains!8580 (getCurrentListMap!5438 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1317821 () Bool)

(declare-fun res!874609 () Bool)

(assert (=> b!1317821 (=> (not res!874609) (not e!752029))))

(declare-datatypes ((List!30321 0))(
  ( (Nil!30318) (Cons!30317 (h!31526 (_ BitVec 64)) (t!43929 List!30321)) )
))
(declare-fun arrayNoDuplicates!0 (array!88644 (_ BitVec 32) List!30321) Bool)

(assert (=> b!1317821 (= res!874609 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30318))))

(declare-fun b!1317822 () Bool)

(declare-fun e!752025 () Bool)

(declare-fun tp_is_empty!35845 () Bool)

(assert (=> b!1317822 (= e!752025 tp_is_empty!35845)))

(declare-fun b!1317823 () Bool)

(declare-fun res!874610 () Bool)

(assert (=> b!1317823 (=> (not res!874610) (not e!752029))))

(assert (=> b!1317823 (= res!874610 (and (= (size!43345 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43346 _keys!1609) (size!43345 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317824 () Bool)

(declare-fun res!874608 () Bool)

(assert (=> b!1317824 (=> (not res!874608) (not e!752029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88644 (_ BitVec 32)) Bool)

(assert (=> b!1317824 (= res!874608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55415 () Bool)

(declare-fun mapRes!55415 () Bool)

(assert (=> mapIsEmpty!55415 mapRes!55415))

(declare-fun b!1317826 () Bool)

(declare-fun e!752028 () Bool)

(assert (=> b!1317826 (= e!752028 (and e!752025 mapRes!55415))))

(declare-fun condMapEmpty!55415 () Bool)

(declare-fun mapDefault!55415 () ValueCell!17024)

