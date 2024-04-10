; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84410 () Bool)

(assert start!84410)

(declare-fun b_free!19981 () Bool)

(declare-fun b_next!19981 () Bool)

(assert (=> start!84410 (= b_free!19981 (not b_next!19981))))

(declare-fun tp!69720 () Bool)

(declare-fun b_and!32025 () Bool)

(assert (=> start!84410 (= tp!69720 b_and!32025)))

(declare-fun b!987310 () Bool)

(declare-fun res!660508 () Bool)

(declare-fun e!556741 () Bool)

(assert (=> b!987310 (=> (not res!660508) (not e!556741))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35913 0))(
  ( (V!35914 (val!11649 Int)) )
))
(declare-datatypes ((ValueCell!11117 0))(
  ( (ValueCellFull!11117 (v!14212 V!35913)) (EmptyCell!11117) )
))
(declare-datatypes ((array!62351 0))(
  ( (array!62352 (arr!30032 (Array (_ BitVec 32) ValueCell!11117)) (size!30511 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62351)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62353 0))(
  ( (array!62354 (arr!30033 (Array (_ BitVec 32) (_ BitVec 64))) (size!30512 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62353)

(assert (=> b!987310 (= res!660508 (and (= (size!30511 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30512 _keys!1544) (size!30511 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987311 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987311 (= e!556741 (not (bvslt from!1932 (size!30511 _values!1278))))))

(declare-datatypes ((tuple2!14836 0))(
  ( (tuple2!14837 (_1!7429 (_ BitVec 64)) (_2!7429 V!35913)) )
))
(declare-datatypes ((List!20767 0))(
  ( (Nil!20764) (Cons!20763 (h!21925 tuple2!14836) (t!29676 List!20767)) )
))
(declare-datatypes ((ListLongMap!13533 0))(
  ( (ListLongMap!13534 (toList!6782 List!20767)) )
))
(declare-fun lt!437681 () ListLongMap!13533)

(declare-fun lt!437677 () tuple2!14836)

(declare-fun lt!437679 () tuple2!14836)

(declare-fun +!3067 (ListLongMap!13533 tuple2!14836) ListLongMap!13533)

(assert (=> b!987311 (= (+!3067 (+!3067 lt!437681 lt!437677) lt!437679) (+!3067 (+!3067 lt!437681 lt!437679) lt!437677))))

(declare-fun lt!437680 () V!35913)

(assert (=> b!987311 (= lt!437679 (tuple2!14837 (select (arr!30033 _keys!1544) from!1932) lt!437680))))

(declare-fun minValue!1220 () V!35913)

(assert (=> b!987311 (= lt!437677 (tuple2!14837 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32767 0))(
  ( (Unit!32768) )
))
(declare-fun lt!437678 () Unit!32767)

(declare-fun addCommutativeForDiffKeys!691 (ListLongMap!13533 (_ BitVec 64) V!35913 (_ BitVec 64) V!35913) Unit!32767)

(assert (=> b!987311 (= lt!437678 (addCommutativeForDiffKeys!691 lt!437681 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30033 _keys!1544) from!1932) lt!437680))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15577 (ValueCell!11117 V!35913) V!35913)

(declare-fun dynLambda!1850 (Int (_ BitVec 64)) V!35913)

(assert (=> b!987311 (= lt!437680 (get!15577 (select (arr!30032 _values!1278) from!1932) (dynLambda!1850 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35913)

(declare-fun getCurrentListMapNoExtraKeys!3473 (array!62353 array!62351 (_ BitVec 32) (_ BitVec 32) V!35913 V!35913 (_ BitVec 32) Int) ListLongMap!13533)

(assert (=> b!987311 (= lt!437681 (+!3067 (getCurrentListMapNoExtraKeys!3473 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14837 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987312 () Bool)

(declare-fun e!556742 () Bool)

(declare-fun e!556743 () Bool)

(declare-fun mapRes!36827 () Bool)

(assert (=> b!987312 (= e!556742 (and e!556743 mapRes!36827))))

(declare-fun condMapEmpty!36827 () Bool)

(declare-fun mapDefault!36827 () ValueCell!11117)

