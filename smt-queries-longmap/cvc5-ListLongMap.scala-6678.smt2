; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84040 () Bool)

(assert start!84040)

(declare-fun b_free!19795 () Bool)

(declare-fun b_next!19795 () Bool)

(assert (=> start!84040 (= b_free!19795 (not b_next!19795))))

(declare-fun tp!68907 () Bool)

(declare-fun b_and!31673 () Bool)

(assert (=> start!84040 (= tp!68907 b_and!31673)))

(declare-fun b!982454 () Bool)

(declare-fun res!657453 () Bool)

(declare-fun e!553801 () Bool)

(assert (=> b!982454 (=> (not res!657453) (not e!553801))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61677 0))(
  ( (array!61678 (arr!29696 (Array (_ BitVec 32) (_ BitVec 64))) (size!30175 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61677)

(assert (=> b!982454 (= res!657453 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30175 _keys!1544))))))

(declare-fun b!982455 () Bool)

(declare-fun e!553803 () Bool)

(assert (=> b!982455 (= e!553803 (not true))))

(declare-datatypes ((V!35441 0))(
  ( (V!35442 (val!11472 Int)) )
))
(declare-datatypes ((tuple2!14694 0))(
  ( (tuple2!14695 (_1!7358 (_ BitVec 64)) (_2!7358 V!35441)) )
))
(declare-datatypes ((List!20575 0))(
  ( (Nil!20572) (Cons!20571 (h!21733 tuple2!14694) (t!29320 List!20575)) )
))
(declare-datatypes ((ListLongMap!13391 0))(
  ( (ListLongMap!13392 (toList!6711 List!20575)) )
))
(declare-fun lt!436144 () ListLongMap!13391)

(declare-fun lt!436141 () tuple2!14694)

(declare-fun lt!436143 () tuple2!14694)

(declare-fun +!3009 (ListLongMap!13391 tuple2!14694) ListLongMap!13391)

(assert (=> b!982455 (= (+!3009 (+!3009 lt!436144 lt!436141) lt!436143) (+!3009 (+!3009 lt!436144 lt!436143) lt!436141))))

(declare-fun lt!436142 () V!35441)

(assert (=> b!982455 (= lt!436143 (tuple2!14695 (select (arr!29696 _keys!1544) from!1932) lt!436142))))

(declare-fun zeroValue!1220 () V!35441)

(assert (=> b!982455 (= lt!436141 (tuple2!14695 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32657 0))(
  ( (Unit!32658) )
))
(declare-fun lt!436145 () Unit!32657)

(declare-fun addCommutativeForDiffKeys!637 (ListLongMap!13391 (_ BitVec 64) V!35441 (_ BitVec 64) V!35441) Unit!32657)

(assert (=> b!982455 (= lt!436145 (addCommutativeForDiffKeys!637 lt!436144 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29696 _keys!1544) from!1932) lt!436142))))

(declare-fun b!982456 () Bool)

(declare-fun res!657458 () Bool)

(assert (=> b!982456 (=> (not res!657458) (not e!553801))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982456 (= res!657458 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982457 () Bool)

(declare-fun res!657457 () Bool)

(assert (=> b!982457 (=> (not res!657457) (not e!553801))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61677 (_ BitVec 32)) Bool)

(assert (=> b!982457 (= res!657457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982458 () Bool)

(declare-fun e!553802 () Bool)

(declare-fun tp_is_empty!22843 () Bool)

(assert (=> b!982458 (= e!553802 tp_is_empty!22843)))

(declare-fun res!657456 () Bool)

(assert (=> start!84040 (=> (not res!657456) (not e!553801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84040 (= res!657456 (validMask!0 mask!1948))))

(assert (=> start!84040 e!553801))

(assert (=> start!84040 true))

(assert (=> start!84040 tp_is_empty!22843))

(declare-datatypes ((ValueCell!10940 0))(
  ( (ValueCellFull!10940 (v!14034 V!35441)) (EmptyCell!10940) )
))
(declare-datatypes ((array!61679 0))(
  ( (array!61680 (arr!29697 (Array (_ BitVec 32) ValueCell!10940)) (size!30176 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61679)

(declare-fun e!553806 () Bool)

(declare-fun array_inv!22963 (array!61679) Bool)

(assert (=> start!84040 (and (array_inv!22963 _values!1278) e!553806)))

(assert (=> start!84040 tp!68907))

(declare-fun array_inv!22964 (array!61677) Bool)

(assert (=> start!84040 (array_inv!22964 _keys!1544)))

(declare-fun b!982459 () Bool)

(declare-fun e!553804 () Bool)

(assert (=> b!982459 (= e!553804 tp_is_empty!22843)))

(declare-fun b!982460 () Bool)

(declare-fun res!657452 () Bool)

(assert (=> b!982460 (=> (not res!657452) (not e!553801))))

(assert (=> b!982460 (= res!657452 (and (= (size!30176 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30175 _keys!1544) (size!30176 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982461 () Bool)

(assert (=> b!982461 (= e!553801 e!553803)))

(declare-fun res!657454 () Bool)

(assert (=> b!982461 (=> (not res!657454) (not e!553803))))

(assert (=> b!982461 (= res!657454 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29696 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15403 (ValueCell!10940 V!35441) V!35441)

(declare-fun dynLambda!1794 (Int (_ BitVec 64)) V!35441)

(assert (=> b!982461 (= lt!436142 (get!15403 (select (arr!29697 _values!1278) from!1932) (dynLambda!1794 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35441)

(declare-fun getCurrentListMapNoExtraKeys!3411 (array!61677 array!61679 (_ BitVec 32) (_ BitVec 32) V!35441 V!35441 (_ BitVec 32) Int) ListLongMap!13391)

(assert (=> b!982461 (= lt!436144 (getCurrentListMapNoExtraKeys!3411 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36293 () Bool)

(declare-fun mapRes!36293 () Bool)

(assert (=> mapIsEmpty!36293 mapRes!36293))

(declare-fun mapNonEmpty!36293 () Bool)

(declare-fun tp!68908 () Bool)

(assert (=> mapNonEmpty!36293 (= mapRes!36293 (and tp!68908 e!553804))))

(declare-fun mapValue!36293 () ValueCell!10940)

(declare-fun mapRest!36293 () (Array (_ BitVec 32) ValueCell!10940))

(declare-fun mapKey!36293 () (_ BitVec 32))

(assert (=> mapNonEmpty!36293 (= (arr!29697 _values!1278) (store mapRest!36293 mapKey!36293 mapValue!36293))))

(declare-fun b!982462 () Bool)

(declare-fun res!657455 () Bool)

(assert (=> b!982462 (=> (not res!657455) (not e!553801))))

(declare-datatypes ((List!20576 0))(
  ( (Nil!20573) (Cons!20572 (h!21734 (_ BitVec 64)) (t!29321 List!20576)) )
))
(declare-fun arrayNoDuplicates!0 (array!61677 (_ BitVec 32) List!20576) Bool)

(assert (=> b!982462 (= res!657455 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20573))))

(declare-fun b!982463 () Bool)

(declare-fun res!657451 () Bool)

(assert (=> b!982463 (=> (not res!657451) (not e!553801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982463 (= res!657451 (validKeyInArray!0 (select (arr!29696 _keys!1544) from!1932)))))

(declare-fun b!982464 () Bool)

(assert (=> b!982464 (= e!553806 (and e!553802 mapRes!36293))))

(declare-fun condMapEmpty!36293 () Bool)

(declare-fun mapDefault!36293 () ValueCell!10940)

