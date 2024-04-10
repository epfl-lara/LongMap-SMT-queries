; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83992 () Bool)

(assert start!83992)

(declare-fun b_free!19747 () Bool)

(declare-fun b_next!19747 () Bool)

(assert (=> start!83992 (= b_free!19747 (not b_next!19747))))

(declare-fun tp!68764 () Bool)

(declare-fun b_and!31577 () Bool)

(assert (=> start!83992 (= tp!68764 b_and!31577)))

(declare-fun b!981614 () Bool)

(declare-fun e!553374 () Bool)

(declare-fun tp_is_empty!22795 () Bool)

(assert (=> b!981614 (= e!553374 tp_is_empty!22795)))

(declare-fun mapIsEmpty!36221 () Bool)

(declare-fun mapRes!36221 () Bool)

(assert (=> mapIsEmpty!36221 mapRes!36221))

(declare-fun b!981615 () Bool)

(declare-fun res!656875 () Bool)

(declare-fun e!553369 () Bool)

(assert (=> b!981615 (=> (not res!656875) (not e!553369))))

(declare-datatypes ((array!61585 0))(
  ( (array!61586 (arr!29650 (Array (_ BitVec 32) (_ BitVec 64))) (size!30129 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61585)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61585 (_ BitVec 32)) Bool)

(assert (=> b!981615 (= res!656875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!981616 () Bool)

(declare-fun res!656878 () Bool)

(assert (=> b!981616 (=> (not res!656878) (not e!553369))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981616 (= res!656878 (validKeyInArray!0 (select (arr!29650 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36221 () Bool)

(declare-fun tp!68763 () Bool)

(declare-fun e!553373 () Bool)

(assert (=> mapNonEmpty!36221 (= mapRes!36221 (and tp!68763 e!553373))))

(declare-datatypes ((V!35377 0))(
  ( (V!35378 (val!11448 Int)) )
))
(declare-datatypes ((ValueCell!10916 0))(
  ( (ValueCellFull!10916 (v!14010 V!35377)) (EmptyCell!10916) )
))
(declare-datatypes ((array!61587 0))(
  ( (array!61588 (arr!29651 (Array (_ BitVec 32) ValueCell!10916)) (size!30130 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61587)

(declare-fun mapRest!36221 () (Array (_ BitVec 32) ValueCell!10916))

(declare-fun mapValue!36221 () ValueCell!10916)

(declare-fun mapKey!36221 () (_ BitVec 32))

(assert (=> mapNonEmpty!36221 (= (arr!29651 _values!1278) (store mapRest!36221 mapKey!36221 mapValue!36221))))

(declare-fun res!656877 () Bool)

(assert (=> start!83992 (=> (not res!656877) (not e!553369))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83992 (= res!656877 (validMask!0 mask!1948))))

(assert (=> start!83992 e!553369))

(assert (=> start!83992 true))

(assert (=> start!83992 tp_is_empty!22795))

(declare-fun e!553371 () Bool)

(declare-fun array_inv!22925 (array!61587) Bool)

(assert (=> start!83992 (and (array_inv!22925 _values!1278) e!553371)))

(assert (=> start!83992 tp!68764))

(declare-fun array_inv!22926 (array!61585) Bool)

(assert (=> start!83992 (array_inv!22926 _keys!1544)))

(declare-fun b!981617 () Bool)

(declare-fun res!656881 () Bool)

(assert (=> b!981617 (=> (not res!656881) (not e!553369))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981617 (= res!656881 (and (= (size!30130 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30129 _keys!1544) (size!30130 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981618 () Bool)

(declare-fun res!656880 () Bool)

(assert (=> b!981618 (=> (not res!656880) (not e!553369))))

(assert (=> b!981618 (= res!656880 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981619 () Bool)

(declare-fun res!656876 () Bool)

(assert (=> b!981619 (=> (not res!656876) (not e!553369))))

(declare-datatypes ((List!20536 0))(
  ( (Nil!20533) (Cons!20532 (h!21694 (_ BitVec 64)) (t!29233 List!20536)) )
))
(declare-fun arrayNoDuplicates!0 (array!61585 (_ BitVec 32) List!20536) Bool)

(assert (=> b!981619 (= res!656876 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20533))))

(declare-fun b!981620 () Bool)

(assert (=> b!981620 (= e!553373 tp_is_empty!22795)))

(declare-fun b!981621 () Bool)

(declare-fun e!553370 () Bool)

(assert (=> b!981621 (= e!553370 (not true))))

(declare-datatypes ((tuple2!14652 0))(
  ( (tuple2!14653 (_1!7337 (_ BitVec 64)) (_2!7337 V!35377)) )
))
(declare-datatypes ((List!20537 0))(
  ( (Nil!20534) (Cons!20533 (h!21695 tuple2!14652) (t!29234 List!20537)) )
))
(declare-datatypes ((ListLongMap!13349 0))(
  ( (ListLongMap!13350 (toList!6690 List!20537)) )
))
(declare-fun lt!435782 () ListLongMap!13349)

(declare-fun lt!435785 () tuple2!14652)

(declare-fun lt!435781 () tuple2!14652)

(declare-fun +!2991 (ListLongMap!13349 tuple2!14652) ListLongMap!13349)

(assert (=> b!981621 (= (+!2991 (+!2991 lt!435782 lt!435785) lt!435781) (+!2991 (+!2991 lt!435782 lt!435781) lt!435785))))

(declare-fun lt!435783 () V!35377)

(assert (=> b!981621 (= lt!435781 (tuple2!14653 (select (arr!29650 _keys!1544) from!1932) lt!435783))))

(declare-fun zeroValue!1220 () V!35377)

(assert (=> b!981621 (= lt!435785 (tuple2!14653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32621 0))(
  ( (Unit!32622) )
))
(declare-fun lt!435784 () Unit!32621)

(declare-fun addCommutativeForDiffKeys!619 (ListLongMap!13349 (_ BitVec 64) V!35377 (_ BitVec 64) V!35377) Unit!32621)

(assert (=> b!981621 (= lt!435784 (addCommutativeForDiffKeys!619 lt!435782 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29650 _keys!1544) from!1932) lt!435783))))

(declare-fun b!981622 () Bool)

(declare-fun res!656882 () Bool)

(assert (=> b!981622 (=> (not res!656882) (not e!553369))))

(assert (=> b!981622 (= res!656882 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30129 _keys!1544))))))

(declare-fun b!981623 () Bool)

(assert (=> b!981623 (= e!553371 (and e!553374 mapRes!36221))))

(declare-fun condMapEmpty!36221 () Bool)

(declare-fun mapDefault!36221 () ValueCell!10916)

