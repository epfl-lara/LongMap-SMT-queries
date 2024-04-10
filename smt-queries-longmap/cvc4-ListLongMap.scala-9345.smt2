; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111510 () Bool)

(assert start!111510)

(declare-fun b_free!30167 () Bool)

(declare-fun b_next!30167 () Bool)

(assert (=> start!111510 (= b_free!30167 (not b_next!30167))))

(declare-fun tp!105976 () Bool)

(declare-fun b_and!48493 () Bool)

(assert (=> start!111510 (= tp!105976 b_and!48493)))

(declare-fun b!1320140 () Bool)

(declare-fun res!876185 () Bool)

(declare-fun e!753090 () Bool)

(assert (=> b!1320140 (=> (not res!876185) (not e!753090))))

(declare-datatypes ((array!88904 0))(
  ( (array!88905 (arr!42926 (Array (_ BitVec 32) (_ BitVec 64))) (size!43476 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88904)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1320140 (= res!876185 (not (= (select (arr!42926 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1320141 () Bool)

(declare-fun res!876182 () Bool)

(assert (=> b!1320141 (=> (not res!876182) (not e!753090))))

(declare-datatypes ((V!53085 0))(
  ( (V!53086 (val!18068 Int)) )
))
(declare-datatypes ((ValueCell!17095 0))(
  ( (ValueCellFull!17095 (v!20698 V!53085)) (EmptyCell!17095) )
))
(declare-datatypes ((array!88906 0))(
  ( (array!88907 (arr!42927 (Array (_ BitVec 32) ValueCell!17095)) (size!43477 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88906)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1320141 (= res!876182 (and (= (size!43477 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43476 _keys!1609) (size!43477 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320142 () Bool)

(declare-fun e!753092 () Bool)

(declare-fun tp_is_empty!35987 () Bool)

(assert (=> b!1320142 (= e!753092 tp_is_empty!35987)))

(declare-fun b!1320143 () Bool)

(assert (=> b!1320143 (= e!753090 (not true))))

(declare-datatypes ((tuple2!23260 0))(
  ( (tuple2!23261 (_1!11641 (_ BitVec 64)) (_2!11641 V!53085)) )
))
(declare-datatypes ((List!30412 0))(
  ( (Nil!30409) (Cons!30408 (h!31617 tuple2!23260) (t!44128 List!30412)) )
))
(declare-datatypes ((ListLongMap!20917 0))(
  ( (ListLongMap!20918 (toList!10474 List!30412)) )
))
(declare-fun lt!586848 () ListLongMap!20917)

(declare-fun contains!8629 (ListLongMap!20917 (_ BitVec 64)) Bool)

(assert (=> b!1320143 (contains!8629 lt!586848 k!1164)))

(declare-datatypes ((Unit!43486 0))(
  ( (Unit!43487) )
))
(declare-fun lt!586849 () Unit!43486)

(declare-fun zeroValue!1279 () V!53085)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!129 ((_ BitVec 64) (_ BitVec 64) V!53085 ListLongMap!20917) Unit!43486)

(assert (=> b!1320143 (= lt!586849 (lemmaInListMapAfterAddingDiffThenInBefore!129 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586848))))

(declare-fun lt!586851 () ListLongMap!20917)

(assert (=> b!1320143 (contains!8629 lt!586851 k!1164)))

(declare-fun minValue!1279 () V!53085)

(declare-fun lt!586850 () Unit!43486)

(assert (=> b!1320143 (= lt!586850 (lemmaInListMapAfterAddingDiffThenInBefore!129 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586851))))

(declare-fun +!4533 (ListLongMap!20917 tuple2!23260) ListLongMap!20917)

(assert (=> b!1320143 (= lt!586851 (+!4533 lt!586848 (tuple2!23261 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6168 (array!88904 array!88906 (_ BitVec 32) (_ BitVec 32) V!53085 V!53085 (_ BitVec 32) Int) ListLongMap!20917)

(declare-fun get!21579 (ValueCell!17095 V!53085) V!53085)

(declare-fun dynLambda!3472 (Int (_ BitVec 64)) V!53085)

(assert (=> b!1320143 (= lt!586848 (+!4533 (getCurrentListMapNoExtraKeys!6168 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23261 (select (arr!42926 _keys!1609) from!2000) (get!21579 (select (arr!42927 _values!1337) from!2000) (dynLambda!3472 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1320144 () Bool)

(declare-fun res!876188 () Bool)

(assert (=> b!1320144 (=> (not res!876188) (not e!753090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320144 (= res!876188 (validKeyInArray!0 (select (arr!42926 _keys!1609) from!2000)))))

(declare-fun b!1320145 () Bool)

(declare-fun res!876187 () Bool)

(assert (=> b!1320145 (=> (not res!876187) (not e!753090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88904 (_ BitVec 32)) Bool)

(assert (=> b!1320145 (= res!876187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55628 () Bool)

(declare-fun mapRes!55628 () Bool)

(declare-fun tp!105977 () Bool)

(assert (=> mapNonEmpty!55628 (= mapRes!55628 (and tp!105977 e!753092))))

(declare-fun mapValue!55628 () ValueCell!17095)

(declare-fun mapKey!55628 () (_ BitVec 32))

(declare-fun mapRest!55628 () (Array (_ BitVec 32) ValueCell!17095))

(assert (=> mapNonEmpty!55628 (= (arr!42927 _values!1337) (store mapRest!55628 mapKey!55628 mapValue!55628))))

(declare-fun b!1320146 () Bool)

(declare-fun res!876183 () Bool)

(assert (=> b!1320146 (=> (not res!876183) (not e!753090))))

(declare-datatypes ((List!30413 0))(
  ( (Nil!30410) (Cons!30409 (h!31618 (_ BitVec 64)) (t!44129 List!30413)) )
))
(declare-fun arrayNoDuplicates!0 (array!88904 (_ BitVec 32) List!30413) Bool)

(assert (=> b!1320146 (= res!876183 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30410))))

(declare-fun b!1320147 () Bool)

(declare-fun res!876184 () Bool)

(assert (=> b!1320147 (=> (not res!876184) (not e!753090))))

(assert (=> b!1320147 (= res!876184 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43476 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320148 () Bool)

(declare-fun e!753091 () Bool)

(assert (=> b!1320148 (= e!753091 tp_is_empty!35987)))

(declare-fun mapIsEmpty!55628 () Bool)

(assert (=> mapIsEmpty!55628 mapRes!55628))

(declare-fun res!876181 () Bool)

(assert (=> start!111510 (=> (not res!876181) (not e!753090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111510 (= res!876181 (validMask!0 mask!2019))))

(assert (=> start!111510 e!753090))

(declare-fun array_inv!32409 (array!88904) Bool)

(assert (=> start!111510 (array_inv!32409 _keys!1609)))

(assert (=> start!111510 true))

(assert (=> start!111510 tp_is_empty!35987))

(declare-fun e!753093 () Bool)

(declare-fun array_inv!32410 (array!88906) Bool)

(assert (=> start!111510 (and (array_inv!32410 _values!1337) e!753093)))

(assert (=> start!111510 tp!105976))

(declare-fun b!1320149 () Bool)

(assert (=> b!1320149 (= e!753093 (and e!753091 mapRes!55628))))

(declare-fun condMapEmpty!55628 () Bool)

(declare-fun mapDefault!55628 () ValueCell!17095)

