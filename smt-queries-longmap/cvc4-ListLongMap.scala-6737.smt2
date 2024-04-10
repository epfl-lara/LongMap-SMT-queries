; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84414 () Bool)

(assert start!84414)

(declare-fun b_free!19985 () Bool)

(declare-fun b_next!19985 () Bool)

(assert (=> start!84414 (= b_free!19985 (not b_next!19985))))

(declare-fun tp!69732 () Bool)

(declare-fun b_and!32033 () Bool)

(assert (=> start!84414 (= tp!69732 b_and!32033)))

(declare-fun mapIsEmpty!36833 () Bool)

(declare-fun mapRes!36833 () Bool)

(assert (=> mapIsEmpty!36833 mapRes!36833))

(declare-fun res!660553 () Bool)

(declare-fun e!556772 () Bool)

(assert (=> start!84414 (=> (not res!660553) (not e!556772))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84414 (= res!660553 (validMask!0 mask!1948))))

(assert (=> start!84414 e!556772))

(assert (=> start!84414 true))

(declare-fun tp_is_empty!23201 () Bool)

(assert (=> start!84414 tp_is_empty!23201))

(declare-datatypes ((V!35917 0))(
  ( (V!35918 (val!11651 Int)) )
))
(declare-datatypes ((ValueCell!11119 0))(
  ( (ValueCellFull!11119 (v!14214 V!35917)) (EmptyCell!11119) )
))
(declare-datatypes ((array!62359 0))(
  ( (array!62360 (arr!30036 (Array (_ BitVec 32) ValueCell!11119)) (size!30515 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62359)

(declare-fun e!556773 () Bool)

(declare-fun array_inv!23207 (array!62359) Bool)

(assert (=> start!84414 (and (array_inv!23207 _values!1278) e!556773)))

(assert (=> start!84414 tp!69732))

(declare-datatypes ((array!62361 0))(
  ( (array!62362 (arr!30037 (Array (_ BitVec 32) (_ BitVec 64))) (size!30516 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62361)

(declare-fun array_inv!23208 (array!62361) Bool)

(assert (=> start!84414 (array_inv!23208 _keys!1544)))

(declare-fun b!987374 () Bool)

(declare-fun res!660549 () Bool)

(assert (=> b!987374 (=> (not res!660549) (not e!556772))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987374 (= res!660549 (and (= (size!30515 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30516 _keys!1544) (size!30515 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987375 () Bool)

(declare-fun res!660551 () Bool)

(assert (=> b!987375 (=> (not res!660551) (not e!556772))))

(declare-datatypes ((List!20770 0))(
  ( (Nil!20767) (Cons!20766 (h!21928 (_ BitVec 64)) (t!29683 List!20770)) )
))
(declare-fun arrayNoDuplicates!0 (array!62361 (_ BitVec 32) List!20770) Bool)

(assert (=> b!987375 (= res!660551 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20767))))

(declare-fun b!987376 () Bool)

(declare-fun res!660550 () Bool)

(assert (=> b!987376 (=> (not res!660550) (not e!556772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62361 (_ BitVec 32)) Bool)

(assert (=> b!987376 (= res!660550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987377 () Bool)

(declare-fun res!660554 () Bool)

(assert (=> b!987377 (=> (not res!660554) (not e!556772))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987377 (= res!660554 (validKeyInArray!0 (select (arr!30037 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36833 () Bool)

(declare-fun tp!69733 () Bool)

(declare-fun e!556770 () Bool)

(assert (=> mapNonEmpty!36833 (= mapRes!36833 (and tp!69733 e!556770))))

(declare-fun mapValue!36833 () ValueCell!11119)

(declare-fun mapKey!36833 () (_ BitVec 32))

(declare-fun mapRest!36833 () (Array (_ BitVec 32) ValueCell!11119))

(assert (=> mapNonEmpty!36833 (= (arr!30036 _values!1278) (store mapRest!36833 mapKey!36833 mapValue!36833))))

(declare-fun b!987378 () Bool)

(declare-fun e!556771 () Bool)

(assert (=> b!987378 (= e!556771 tp_is_empty!23201)))

(declare-fun b!987379 () Bool)

(declare-fun res!660548 () Bool)

(assert (=> b!987379 (=> (not res!660548) (not e!556772))))

(assert (=> b!987379 (= res!660548 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30516 _keys!1544))))))

(declare-fun b!987380 () Bool)

(assert (=> b!987380 (= e!556772 (not (bvslt from!1932 (size!30515 _values!1278))))))

(declare-datatypes ((tuple2!14840 0))(
  ( (tuple2!14841 (_1!7431 (_ BitVec 64)) (_2!7431 V!35917)) )
))
(declare-datatypes ((List!20771 0))(
  ( (Nil!20768) (Cons!20767 (h!21929 tuple2!14840) (t!29684 List!20771)) )
))
(declare-datatypes ((ListLongMap!13537 0))(
  ( (ListLongMap!13538 (toList!6784 List!20771)) )
))
(declare-fun lt!437711 () ListLongMap!13537)

(declare-fun lt!437708 () tuple2!14840)

(declare-fun lt!437709 () tuple2!14840)

(declare-fun +!3069 (ListLongMap!13537 tuple2!14840) ListLongMap!13537)

(assert (=> b!987380 (= (+!3069 (+!3069 lt!437711 lt!437708) lt!437709) (+!3069 (+!3069 lt!437711 lt!437709) lt!437708))))

(declare-fun lt!437707 () V!35917)

(assert (=> b!987380 (= lt!437709 (tuple2!14841 (select (arr!30037 _keys!1544) from!1932) lt!437707))))

(declare-fun minValue!1220 () V!35917)

(assert (=> b!987380 (= lt!437708 (tuple2!14841 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32771 0))(
  ( (Unit!32772) )
))
(declare-fun lt!437710 () Unit!32771)

(declare-fun addCommutativeForDiffKeys!693 (ListLongMap!13537 (_ BitVec 64) V!35917 (_ BitVec 64) V!35917) Unit!32771)

(assert (=> b!987380 (= lt!437710 (addCommutativeForDiffKeys!693 lt!437711 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30037 _keys!1544) from!1932) lt!437707))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15579 (ValueCell!11119 V!35917) V!35917)

(declare-fun dynLambda!1852 (Int (_ BitVec 64)) V!35917)

(assert (=> b!987380 (= lt!437707 (get!15579 (select (arr!30036 _values!1278) from!1932) (dynLambda!1852 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35917)

(declare-fun getCurrentListMapNoExtraKeys!3475 (array!62361 array!62359 (_ BitVec 32) (_ BitVec 32) V!35917 V!35917 (_ BitVec 32) Int) ListLongMap!13537)

(assert (=> b!987380 (= lt!437711 (+!3069 (getCurrentListMapNoExtraKeys!3475 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14841 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987381 () Bool)

(assert (=> b!987381 (= e!556773 (and e!556771 mapRes!36833))))

(declare-fun condMapEmpty!36833 () Bool)

(declare-fun mapDefault!36833 () ValueCell!11119)

