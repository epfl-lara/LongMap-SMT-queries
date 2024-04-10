; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84152 () Bool)

(assert start!84152)

(declare-fun b_free!19853 () Bool)

(declare-fun b_next!19853 () Bool)

(assert (=> start!84152 (= b_free!19853 (not b_next!19853))))

(declare-fun tp!69162 () Bool)

(declare-fun b_and!31783 () Bool)

(assert (=> start!84152 (= tp!69162 b_and!31783)))

(declare-fun b!983967 () Bool)

(declare-fun e!554720 () Bool)

(declare-fun tp_is_empty!22955 () Bool)

(assert (=> b!983967 (= e!554720 tp_is_empty!22955)))

(declare-fun mapNonEmpty!36461 () Bool)

(declare-fun mapRes!36461 () Bool)

(declare-fun tp!69163 () Bool)

(declare-fun e!554722 () Bool)

(assert (=> mapNonEmpty!36461 (= mapRes!36461 (and tp!69163 e!554722))))

(declare-datatypes ((V!35589 0))(
  ( (V!35590 (val!11528 Int)) )
))
(declare-datatypes ((ValueCell!10996 0))(
  ( (ValueCellFull!10996 (v!14090 V!35589)) (EmptyCell!10996) )
))
(declare-datatypes ((array!61891 0))(
  ( (array!61892 (arr!29803 (Array (_ BitVec 32) ValueCell!10996)) (size!30282 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61891)

(declare-fun mapValue!36461 () ValueCell!10996)

(declare-fun mapRest!36461 () (Array (_ BitVec 32) ValueCell!10996))

(declare-fun mapKey!36461 () (_ BitVec 32))

(assert (=> mapNonEmpty!36461 (= (arr!29803 _values!1278) (store mapRest!36461 mapKey!36461 mapValue!36461))))

(declare-fun b!983968 () Bool)

(declare-fun e!554719 () Bool)

(assert (=> b!983968 (= e!554719 (not true))))

(declare-datatypes ((tuple2!14740 0))(
  ( (tuple2!14741 (_1!7381 (_ BitVec 64)) (_2!7381 V!35589)) )
))
(declare-datatypes ((List!20632 0))(
  ( (Nil!20629) (Cons!20628 (h!21790 tuple2!14740) (t!29429 List!20632)) )
))
(declare-datatypes ((ListLongMap!13437 0))(
  ( (ListLongMap!13438 (toList!6734 List!20632)) )
))
(declare-fun lt!436613 () ListLongMap!13437)

(declare-fun lt!436615 () tuple2!14740)

(declare-fun lt!436616 () tuple2!14740)

(declare-fun +!3027 (ListLongMap!13437 tuple2!14740) ListLongMap!13437)

(assert (=> b!983968 (= (+!3027 (+!3027 lt!436613 lt!436615) lt!436616) (+!3027 (+!3027 lt!436613 lt!436616) lt!436615))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!436612 () V!35589)

(declare-datatypes ((array!61893 0))(
  ( (array!61894 (arr!29804 (Array (_ BitVec 32) (_ BitVec 64))) (size!30283 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61893)

(assert (=> b!983968 (= lt!436616 (tuple2!14741 (select (arr!29804 _keys!1544) from!1932) lt!436612))))

(declare-fun minValue!1220 () V!35589)

(assert (=> b!983968 (= lt!436615 (tuple2!14741 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32693 0))(
  ( (Unit!32694) )
))
(declare-fun lt!436614 () Unit!32693)

(declare-fun addCommutativeForDiffKeys!655 (ListLongMap!13437 (_ BitVec 64) V!35589 (_ BitVec 64) V!35589) Unit!32693)

(assert (=> b!983968 (= lt!436614 (addCommutativeForDiffKeys!655 lt!436613 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29804 _keys!1544) from!1932) lt!436612))))

(declare-fun res!658408 () Bool)

(declare-fun e!554724 () Bool)

(assert (=> start!84152 (=> (not res!658408) (not e!554724))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84152 (= res!658408 (validMask!0 mask!1948))))

(assert (=> start!84152 e!554724))

(assert (=> start!84152 true))

(assert (=> start!84152 tp_is_empty!22955))

(declare-fun e!554723 () Bool)

(declare-fun array_inv!23045 (array!61891) Bool)

(assert (=> start!84152 (and (array_inv!23045 _values!1278) e!554723)))

(assert (=> start!84152 tp!69162))

(declare-fun array_inv!23046 (array!61893) Bool)

(assert (=> start!84152 (array_inv!23046 _keys!1544)))

(declare-fun b!983969 () Bool)

(declare-fun res!658414 () Bool)

(assert (=> b!983969 (=> (not res!658414) (not e!554724))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983969 (= res!658414 (and (= (size!30282 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30283 _keys!1544) (size!30282 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983970 () Bool)

(declare-fun res!658410 () Bool)

(assert (=> b!983970 (=> (not res!658410) (not e!554724))))

(declare-datatypes ((List!20633 0))(
  ( (Nil!20630) (Cons!20629 (h!21791 (_ BitVec 64)) (t!29430 List!20633)) )
))
(declare-fun arrayNoDuplicates!0 (array!61893 (_ BitVec 32) List!20633) Bool)

(assert (=> b!983970 (= res!658410 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20630))))

(declare-fun b!983971 () Bool)

(declare-fun res!658415 () Bool)

(assert (=> b!983971 (=> (not res!658415) (not e!554724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983971 (= res!658415 (validKeyInArray!0 (select (arr!29804 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36461 () Bool)

(assert (=> mapIsEmpty!36461 mapRes!36461))

(declare-fun b!983972 () Bool)

(declare-fun res!658413 () Bool)

(assert (=> b!983972 (=> (not res!658413) (not e!554724))))

(assert (=> b!983972 (= res!658413 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!983973 () Bool)

(declare-fun res!658409 () Bool)

(assert (=> b!983973 (=> (not res!658409) (not e!554724))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61893 (_ BitVec 32)) Bool)

(assert (=> b!983973 (= res!658409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983974 () Bool)

(assert (=> b!983974 (= e!554724 e!554719)))

(declare-fun res!658412 () Bool)

(assert (=> b!983974 (=> (not res!658412) (not e!554719))))

(assert (=> b!983974 (= res!658412 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29804 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15454 (ValueCell!10996 V!35589) V!35589)

(declare-fun dynLambda!1809 (Int (_ BitVec 64)) V!35589)

(assert (=> b!983974 (= lt!436612 (get!15454 (select (arr!29803 _values!1278) from!1932) (dynLambda!1809 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35589)

(declare-fun getCurrentListMapNoExtraKeys!3429 (array!61893 array!61891 (_ BitVec 32) (_ BitVec 32) V!35589 V!35589 (_ BitVec 32) Int) ListLongMap!13437)

(assert (=> b!983974 (= lt!436613 (getCurrentListMapNoExtraKeys!3429 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983975 () Bool)

(assert (=> b!983975 (= e!554722 tp_is_empty!22955)))

(declare-fun b!983976 () Bool)

(declare-fun res!658411 () Bool)

(assert (=> b!983976 (=> (not res!658411) (not e!554724))))

(assert (=> b!983976 (= res!658411 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30283 _keys!1544))))))

(declare-fun b!983977 () Bool)

(assert (=> b!983977 (= e!554723 (and e!554720 mapRes!36461))))

(declare-fun condMapEmpty!36461 () Bool)

(declare-fun mapDefault!36461 () ValueCell!10996)

