; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84554 () Bool)

(assert start!84554)

(declare-fun b_free!20035 () Bool)

(declare-fun b_next!20035 () Bool)

(assert (=> start!84554 (= b_free!20035 (not b_next!20035))))

(declare-fun tp!69892 () Bool)

(declare-fun b_and!32139 () Bool)

(assert (=> start!84554 (= tp!69892 b_and!32139)))

(declare-fun b!988942 () Bool)

(declare-fun e!557641 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((V!35985 0))(
  ( (V!35986 (val!11676 Int)) )
))
(declare-datatypes ((ValueCell!11144 0))(
  ( (ValueCellFull!11144 (v!14243 V!35985)) (EmptyCell!11144) )
))
(declare-datatypes ((array!62461 0))(
  ( (array!62462 (arr!30084 (Array (_ BitVec 32) ValueCell!11144)) (size!30563 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62461)

(assert (=> b!988942 (= e!557641 (not (bvslt from!1932 (size!30563 _values!1278))))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35985)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35985)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((array!62463 0))(
  ( (array!62464 (arr!30085 (Array (_ BitVec 32) (_ BitVec 64))) (size!30564 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62463)

(declare-datatypes ((tuple2!14878 0))(
  ( (tuple2!14879 (_1!7450 (_ BitVec 64)) (_2!7450 V!35985)) )
))
(declare-datatypes ((List!20808 0))(
  ( (Nil!20805) (Cons!20804 (h!21966 tuple2!14878) (t!29755 List!20808)) )
))
(declare-datatypes ((ListLongMap!13575 0))(
  ( (ListLongMap!13576 (toList!6803 List!20808)) )
))
(declare-fun lt!438648 () ListLongMap!13575)

(declare-fun getCurrentListMap!3862 (array!62463 array!62461 (_ BitVec 32) (_ BitVec 32) V!35985 V!35985 (_ BitVec 32) Int) ListLongMap!13575)

(assert (=> b!988942 (= lt!438648 (getCurrentListMap!3862 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438649 () ListLongMap!13575)

(declare-fun lt!438645 () tuple2!14878)

(declare-fun lt!438646 () tuple2!14878)

(declare-fun +!3081 (ListLongMap!13575 tuple2!14878) ListLongMap!13575)

(assert (=> b!988942 (= (+!3081 (+!3081 lt!438649 lt!438645) lt!438646) (+!3081 (+!3081 lt!438649 lt!438646) lt!438645))))

(declare-fun lt!438644 () V!35985)

(assert (=> b!988942 (= lt!438646 (tuple2!14879 (select (arr!30085 _keys!1544) from!1932) lt!438644))))

(assert (=> b!988942 (= lt!438645 (tuple2!14879 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32817 0))(
  ( (Unit!32818) )
))
(declare-fun lt!438647 () Unit!32817)

(declare-fun addCommutativeForDiffKeys!704 (ListLongMap!13575 (_ BitVec 64) V!35985 (_ BitVec 64) V!35985) Unit!32817)

(assert (=> b!988942 (= lt!438647 (addCommutativeForDiffKeys!704 lt!438649 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30085 _keys!1544) from!1932) lt!438644))))

(declare-fun b!988943 () Bool)

(declare-fun res!661426 () Bool)

(declare-fun e!557644 () Bool)

(assert (=> b!988943 (=> (not res!661426) (not e!557644))))

(assert (=> b!988943 (= res!661426 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30564 _keys!1544))))))

(declare-fun b!988944 () Bool)

(declare-fun e!557640 () Bool)

(declare-fun tp_is_empty!23251 () Bool)

(assert (=> b!988944 (= e!557640 tp_is_empty!23251)))

(declare-fun b!988945 () Bool)

(declare-fun res!661429 () Bool)

(assert (=> b!988945 (=> (not res!661429) (not e!557644))))

(declare-datatypes ((List!20809 0))(
  ( (Nil!20806) (Cons!20805 (h!21967 (_ BitVec 64)) (t!29756 List!20809)) )
))
(declare-fun arrayNoDuplicates!0 (array!62463 (_ BitVec 32) List!20809) Bool)

(assert (=> b!988945 (= res!661429 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20806))))

(declare-fun b!988946 () Bool)

(declare-fun res!661430 () Bool)

(assert (=> b!988946 (=> (not res!661430) (not e!557644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62463 (_ BitVec 32)) Bool)

(assert (=> b!988946 (= res!661430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!661427 () Bool)

(assert (=> start!84554 (=> (not res!661427) (not e!557644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84554 (= res!661427 (validMask!0 mask!1948))))

(assert (=> start!84554 e!557644))

(assert (=> start!84554 true))

(assert (=> start!84554 tp_is_empty!23251))

(declare-fun e!557643 () Bool)

(declare-fun array_inv!23243 (array!62461) Bool)

(assert (=> start!84554 (and (array_inv!23243 _values!1278) e!557643)))

(assert (=> start!84554 tp!69892))

(declare-fun array_inv!23244 (array!62463) Bool)

(assert (=> start!84554 (array_inv!23244 _keys!1544)))

(declare-fun mapIsEmpty!36918 () Bool)

(declare-fun mapRes!36918 () Bool)

(assert (=> mapIsEmpty!36918 mapRes!36918))

(declare-fun b!988947 () Bool)

(declare-fun res!661424 () Bool)

(assert (=> b!988947 (=> (not res!661424) (not e!557644))))

(assert (=> b!988947 (= res!661424 (and (= (size!30563 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30564 _keys!1544) (size!30563 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988948 () Bool)

(declare-fun e!557642 () Bool)

(assert (=> b!988948 (= e!557642 tp_is_empty!23251)))

(declare-fun b!988949 () Bool)

(declare-fun res!661425 () Bool)

(assert (=> b!988949 (=> (not res!661425) (not e!557644))))

(assert (=> b!988949 (= res!661425 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!988950 () Bool)

(assert (=> b!988950 (= e!557644 e!557641)))

(declare-fun res!661431 () Bool)

(assert (=> b!988950 (=> (not res!661431) (not e!557641))))

(assert (=> b!988950 (= res!661431 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30085 _keys!1544) from!1932))))))

(declare-fun get!15614 (ValueCell!11144 V!35985) V!35985)

(declare-fun dynLambda!1864 (Int (_ BitVec 64)) V!35985)

(assert (=> b!988950 (= lt!438644 (get!15614 (select (arr!30084 _values!1278) from!1932) (dynLambda!1864 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3494 (array!62463 array!62461 (_ BitVec 32) (_ BitVec 32) V!35985 V!35985 (_ BitVec 32) Int) ListLongMap!13575)

(assert (=> b!988950 (= lt!438649 (getCurrentListMapNoExtraKeys!3494 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988951 () Bool)

(assert (=> b!988951 (= e!557643 (and e!557642 mapRes!36918))))

(declare-fun condMapEmpty!36918 () Bool)

(declare-fun mapDefault!36918 () ValueCell!11144)

