; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111386 () Bool)

(assert start!111386)

(declare-fun b_free!30043 () Bool)

(declare-fun b_next!30043 () Bool)

(assert (=> start!111386 (= b_free!30043 (not b_next!30043))))

(declare-fun tp!105605 () Bool)

(declare-fun b_and!48263 () Bool)

(assert (=> start!111386 (= tp!105605 b_and!48263)))

(declare-fun b!1318036 () Bool)

(declare-fun e!752162 () Bool)

(assert (=> b!1318036 (= e!752162 false)))

(declare-datatypes ((array!88676 0))(
  ( (array!88677 (arr!42812 (Array (_ BitVec 32) (_ BitVec 64))) (size!43362 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88676)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52921 0))(
  ( (V!52922 (val!18006 Int)) )
))
(declare-fun zeroValue!1279 () V!52921)

(declare-datatypes ((ValueCell!17033 0))(
  ( (ValueCellFull!17033 (v!20636 V!52921)) (EmptyCell!17033) )
))
(declare-datatypes ((array!88678 0))(
  ( (array!88679 (arr!42813 (Array (_ BitVec 32) ValueCell!17033)) (size!43363 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88678)

(declare-fun minValue!1279 () V!52921)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun lt!586440 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23176 0))(
  ( (tuple2!23177 (_1!11599 (_ BitVec 64)) (_2!11599 V!52921)) )
))
(declare-datatypes ((List!30333 0))(
  ( (Nil!30330) (Cons!30329 (h!31538 tuple2!23176) (t!43941 List!30333)) )
))
(declare-datatypes ((ListLongMap!20833 0))(
  ( (ListLongMap!20834 (toList!10432 List!30333)) )
))
(declare-fun contains!8587 (ListLongMap!20833 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5445 (array!88676 array!88678 (_ BitVec 32) (_ BitVec 32) V!52921 V!52921 (_ BitVec 32) Int) ListLongMap!20833)

(assert (=> b!1318036 (= lt!586440 (contains!8587 (getCurrentListMap!5445 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapNonEmpty!55442 () Bool)

(declare-fun mapRes!55442 () Bool)

(declare-fun tp!105604 () Bool)

(declare-fun e!752163 () Bool)

(assert (=> mapNonEmpty!55442 (= mapRes!55442 (and tp!105604 e!752163))))

(declare-fun mapValue!55442 () ValueCell!17033)

(declare-fun mapRest!55442 () (Array (_ BitVec 32) ValueCell!17033))

(declare-fun mapKey!55442 () (_ BitVec 32))

(assert (=> mapNonEmpty!55442 (= (arr!42813 _values!1337) (store mapRest!55442 mapKey!55442 mapValue!55442))))

(declare-fun res!874745 () Bool)

(assert (=> start!111386 (=> (not res!874745) (not e!752162))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111386 (= res!874745 (validMask!0 mask!2019))))

(assert (=> start!111386 e!752162))

(declare-fun array_inv!32335 (array!88676) Bool)

(assert (=> start!111386 (array_inv!32335 _keys!1609)))

(assert (=> start!111386 true))

(declare-fun tp_is_empty!35863 () Bool)

(assert (=> start!111386 tp_is_empty!35863))

(declare-fun e!752160 () Bool)

(declare-fun array_inv!32336 (array!88678) Bool)

(assert (=> start!111386 (and (array_inv!32336 _values!1337) e!752160)))

(assert (=> start!111386 tp!105605))

(declare-fun b!1318037 () Bool)

(declare-fun e!752164 () Bool)

(assert (=> b!1318037 (= e!752160 (and e!752164 mapRes!55442))))

(declare-fun condMapEmpty!55442 () Bool)

(declare-fun mapDefault!55442 () ValueCell!17033)

