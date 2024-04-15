; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84510 () Bool)

(assert start!84510)

(declare-fun b_free!20023 () Bool)

(declare-fun b_next!20023 () Bool)

(assert (=> start!84510 (= b_free!20023 (not b_next!20023))))

(declare-fun tp!69855 () Bool)

(declare-fun b_and!32091 () Bool)

(assert (=> start!84510 (= tp!69855 b_and!32091)))

(declare-fun b!988433 () Bool)

(declare-fun res!661154 () Bool)

(declare-fun e!557342 () Bool)

(assert (=> b!988433 (=> (not res!661154) (not e!557342))))

(declare-datatypes ((array!62370 0))(
  ( (array!62371 (arr!30040 (Array (_ BitVec 32) (_ BitVec 64))) (size!30521 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62370)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62370 (_ BitVec 32)) Bool)

(assert (=> b!988433 (= res!661154 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988434 () Bool)

(declare-fun res!661155 () Bool)

(assert (=> b!988434 (=> (not res!661155) (not e!557342))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!988434 (= res!661155 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30521 _keys!1544))))))

(declare-fun b!988435 () Bool)

(declare-fun e!557344 () Bool)

(declare-fun tp_is_empty!23239 () Bool)

(assert (=> b!988435 (= e!557344 tp_is_empty!23239)))

(declare-fun b!988436 () Bool)

(declare-fun res!661150 () Bool)

(assert (=> b!988436 (=> (not res!661150) (not e!557342))))

(declare-datatypes ((V!35969 0))(
  ( (V!35970 (val!11670 Int)) )
))
(declare-datatypes ((ValueCell!11138 0))(
  ( (ValueCellFull!11138 (v!14236 V!35969)) (EmptyCell!11138) )
))
(declare-datatypes ((array!62372 0))(
  ( (array!62373 (arr!30041 (Array (_ BitVec 32) ValueCell!11138)) (size!30522 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62372)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!988436 (= res!661150 (and (= (size!30522 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30521 _keys!1544) (size!30522 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988437 () Bool)

(declare-fun res!661153 () Bool)

(assert (=> b!988437 (=> (not res!661153) (not e!557342))))

(declare-datatypes ((List!20837 0))(
  ( (Nil!20834) (Cons!20833 (h!21995 (_ BitVec 64)) (t!29765 List!20837)) )
))
(declare-fun arrayNoDuplicates!0 (array!62370 (_ BitVec 32) List!20837) Bool)

(assert (=> b!988437 (= res!661153 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20834))))

(declare-fun mapNonEmpty!36897 () Bool)

(declare-fun mapRes!36897 () Bool)

(declare-fun tp!69854 () Bool)

(declare-fun e!557345 () Bool)

(assert (=> mapNonEmpty!36897 (= mapRes!36897 (and tp!69854 e!557345))))

(declare-fun mapKey!36897 () (_ BitVec 32))

(declare-fun mapRest!36897 () (Array (_ BitVec 32) ValueCell!11138))

(declare-fun mapValue!36897 () ValueCell!11138)

(assert (=> mapNonEmpty!36897 (= (arr!30041 _values!1278) (store mapRest!36897 mapKey!36897 mapValue!36897))))

(declare-fun b!988438 () Bool)

(assert (=> b!988438 (= e!557342 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30040 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14948 0))(
  ( (tuple2!14949 (_1!7485 (_ BitVec 64)) (_2!7485 V!35969)) )
))
(declare-datatypes ((List!20838 0))(
  ( (Nil!20835) (Cons!20834 (h!21996 tuple2!14948) (t!29766 List!20838)) )
))
(declare-datatypes ((ListLongMap!13635 0))(
  ( (ListLongMap!13636 (toList!6833 List!20838)) )
))
(declare-fun lt!438305 () ListLongMap!13635)

(declare-fun minValue!1220 () V!35969)

(declare-fun zeroValue!1220 () V!35969)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3536 (array!62370 array!62372 (_ BitVec 32) (_ BitVec 32) V!35969 V!35969 (_ BitVec 32) Int) ListLongMap!13635)

(assert (=> b!988438 (= lt!438305 (getCurrentListMapNoExtraKeys!3536 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988439 () Bool)

(declare-fun res!661156 () Bool)

(assert (=> b!988439 (=> (not res!661156) (not e!557342))))

(assert (=> b!988439 (= res!661156 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!661152 () Bool)

(assert (=> start!84510 (=> (not res!661152) (not e!557342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84510 (= res!661152 (validMask!0 mask!1948))))

(assert (=> start!84510 e!557342))

(assert (=> start!84510 true))

(assert (=> start!84510 tp_is_empty!23239))

(declare-fun e!557343 () Bool)

(declare-fun array_inv!23217 (array!62372) Bool)

(assert (=> start!84510 (and (array_inv!23217 _values!1278) e!557343)))

(assert (=> start!84510 tp!69855))

(declare-fun array_inv!23218 (array!62370) Bool)

(assert (=> start!84510 (array_inv!23218 _keys!1544)))

(declare-fun b!988440 () Bool)

(assert (=> b!988440 (= e!557345 tp_is_empty!23239)))

(declare-fun mapIsEmpty!36897 () Bool)

(assert (=> mapIsEmpty!36897 mapRes!36897))

(declare-fun b!988441 () Bool)

(declare-fun res!661151 () Bool)

(assert (=> b!988441 (=> (not res!661151) (not e!557342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988441 (= res!661151 (validKeyInArray!0 (select (arr!30040 _keys!1544) from!1932)))))

(declare-fun b!988442 () Bool)

(assert (=> b!988442 (= e!557343 (and e!557344 mapRes!36897))))

(declare-fun condMapEmpty!36897 () Bool)

(declare-fun mapDefault!36897 () ValueCell!11138)

(assert (=> b!988442 (= condMapEmpty!36897 (= (arr!30041 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11138)) mapDefault!36897)))))

(assert (= (and start!84510 res!661152) b!988436))

(assert (= (and b!988436 res!661150) b!988433))

(assert (= (and b!988433 res!661154) b!988437))

(assert (= (and b!988437 res!661153) b!988434))

(assert (= (and b!988434 res!661155) b!988441))

(assert (= (and b!988441 res!661151) b!988439))

(assert (= (and b!988439 res!661156) b!988438))

(assert (= (and b!988442 condMapEmpty!36897) mapIsEmpty!36897))

(assert (= (and b!988442 (not condMapEmpty!36897)) mapNonEmpty!36897))

(get-info :version)

(assert (= (and mapNonEmpty!36897 ((_ is ValueCellFull!11138) mapValue!36897)) b!988440))

(assert (= (and b!988442 ((_ is ValueCellFull!11138) mapDefault!36897)) b!988435))

(assert (= start!84510 b!988442))

(declare-fun m!915083 () Bool)

(assert (=> start!84510 m!915083))

(declare-fun m!915085 () Bool)

(assert (=> start!84510 m!915085))

(declare-fun m!915087 () Bool)

(assert (=> start!84510 m!915087))

(declare-fun m!915089 () Bool)

(assert (=> b!988437 m!915089))

(declare-fun m!915091 () Bool)

(assert (=> b!988433 m!915091))

(declare-fun m!915093 () Bool)

(assert (=> b!988438 m!915093))

(declare-fun m!915095 () Bool)

(assert (=> b!988438 m!915095))

(declare-fun m!915097 () Bool)

(assert (=> mapNonEmpty!36897 m!915097))

(assert (=> b!988441 m!915093))

(assert (=> b!988441 m!915093))

(declare-fun m!915099 () Bool)

(assert (=> b!988441 m!915099))

(check-sat (not b!988433) (not b!988441) (not b!988438) (not mapNonEmpty!36897) (not b!988437) tp_is_empty!23239 b_and!32091 (not start!84510) (not b_next!20023))
(check-sat b_and!32091 (not b_next!20023))
(get-model)

(declare-fun bm!41856 () Bool)

(declare-fun call!41859 () Bool)

(assert (=> bm!41856 (= call!41859 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!988512 () Bool)

(declare-fun e!557383 () Bool)

(declare-fun e!557384 () Bool)

(assert (=> b!988512 (= e!557383 e!557384)))

(declare-fun c!100162 () Bool)

(assert (=> b!988512 (= c!100162 (validKeyInArray!0 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988513 () Bool)

(declare-fun e!557385 () Bool)

(assert (=> b!988513 (= e!557384 e!557385)))

(declare-fun lt!438319 () (_ BitVec 64))

(assert (=> b!988513 (= lt!438319 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32682 0))(
  ( (Unit!32683) )
))
(declare-fun lt!438318 () Unit!32682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62370 (_ BitVec 64) (_ BitVec 32)) Unit!32682)

(assert (=> b!988513 (= lt!438318 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438319 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!988513 (arrayContainsKey!0 _keys!1544 lt!438319 #b00000000000000000000000000000000)))

(declare-fun lt!438320 () Unit!32682)

(assert (=> b!988513 (= lt!438320 lt!438318)))

(declare-fun res!661203 () Bool)

(declare-datatypes ((SeekEntryResult!9204 0))(
  ( (MissingZero!9204 (index!39187 (_ BitVec 32))) (Found!9204 (index!39188 (_ BitVec 32))) (Intermediate!9204 (undefined!10016 Bool) (index!39189 (_ BitVec 32)) (x!86028 (_ BitVec 32))) (Undefined!9204) (MissingVacant!9204 (index!39190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62370 (_ BitVec 32)) SeekEntryResult!9204)

(assert (=> b!988513 (= res!661203 (= (seekEntryOrOpen!0 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9204 #b00000000000000000000000000000000)))))

(assert (=> b!988513 (=> (not res!661203) (not e!557385))))

(declare-fun b!988514 () Bool)

(assert (=> b!988514 (= e!557385 call!41859)))

(declare-fun b!988511 () Bool)

(assert (=> b!988511 (= e!557384 call!41859)))

(declare-fun d!117059 () Bool)

(declare-fun res!661204 () Bool)

(assert (=> d!117059 (=> res!661204 e!557383)))

(assert (=> d!117059 (= res!661204 (bvsge #b00000000000000000000000000000000 (size!30521 _keys!1544)))))

(assert (=> d!117059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!557383)))

(assert (= (and d!117059 (not res!661204)) b!988512))

(assert (= (and b!988512 c!100162) b!988513))

(assert (= (and b!988512 (not c!100162)) b!988511))

(assert (= (and b!988513 res!661203) b!988514))

(assert (= (or b!988514 b!988511) bm!41856))

(declare-fun m!915137 () Bool)

(assert (=> bm!41856 m!915137))

(declare-fun m!915139 () Bool)

(assert (=> b!988512 m!915139))

(assert (=> b!988512 m!915139))

(declare-fun m!915141 () Bool)

(assert (=> b!988512 m!915141))

(assert (=> b!988513 m!915139))

(declare-fun m!915143 () Bool)

(assert (=> b!988513 m!915143))

(declare-fun m!915145 () Bool)

(assert (=> b!988513 m!915145))

(assert (=> b!988513 m!915139))

(declare-fun m!915147 () Bool)

(assert (=> b!988513 m!915147))

(assert (=> b!988433 d!117059))

(declare-fun d!117061 () Bool)

(assert (=> d!117061 (= (validKeyInArray!0 (select (arr!30040 _keys!1544) from!1932)) (and (not (= (select (arr!30040 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30040 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!988441 d!117061))

(declare-fun b!988525 () Bool)

(declare-fun e!557395 () Bool)

(declare-fun call!41862 () Bool)

(assert (=> b!988525 (= e!557395 call!41862)))

(declare-fun b!988526 () Bool)

(declare-fun e!557394 () Bool)

(declare-fun e!557397 () Bool)

(assert (=> b!988526 (= e!557394 e!557397)))

(declare-fun res!661212 () Bool)

(assert (=> b!988526 (=> (not res!661212) (not e!557397))))

(declare-fun e!557396 () Bool)

(assert (=> b!988526 (= res!661212 (not e!557396))))

(declare-fun res!661213 () Bool)

(assert (=> b!988526 (=> (not res!661213) (not e!557396))))

(assert (=> b!988526 (= res!661213 (validKeyInArray!0 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988527 () Bool)

(assert (=> b!988527 (= e!557397 e!557395)))

(declare-fun c!100165 () Bool)

(assert (=> b!988527 (= c!100165 (validKeyInArray!0 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!988528 () Bool)

(assert (=> b!988528 (= e!557395 call!41862)))

(declare-fun d!117063 () Bool)

(declare-fun res!661211 () Bool)

(assert (=> d!117063 (=> res!661211 e!557394)))

(assert (=> d!117063 (= res!661211 (bvsge #b00000000000000000000000000000000 (size!30521 _keys!1544)))))

(assert (=> d!117063 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20834) e!557394)))

(declare-fun b!988529 () Bool)

(declare-fun contains!5688 (List!20837 (_ BitVec 64)) Bool)

(assert (=> b!988529 (= e!557396 (contains!5688 Nil!20834 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41859 () Bool)

(assert (=> bm!41859 (= call!41862 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100165 (Cons!20833 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000) Nil!20834) Nil!20834)))))

(assert (= (and d!117063 (not res!661211)) b!988526))

(assert (= (and b!988526 res!661213) b!988529))

(assert (= (and b!988526 res!661212) b!988527))

(assert (= (and b!988527 c!100165) b!988528))

(assert (= (and b!988527 (not c!100165)) b!988525))

(assert (= (or b!988528 b!988525) bm!41859))

(assert (=> b!988526 m!915139))

(assert (=> b!988526 m!915139))

(assert (=> b!988526 m!915141))

(assert (=> b!988527 m!915139))

(assert (=> b!988527 m!915139))

(assert (=> b!988527 m!915141))

(assert (=> b!988529 m!915139))

(assert (=> b!988529 m!915139))

(declare-fun m!915149 () Bool)

(assert (=> b!988529 m!915149))

(assert (=> bm!41859 m!915139))

(declare-fun m!915151 () Bool)

(assert (=> bm!41859 m!915151))

(assert (=> b!988437 d!117063))

(declare-fun b!988554 () Bool)

(declare-fun e!557415 () Bool)

(assert (=> b!988554 (= e!557415 (validKeyInArray!0 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988554 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun bm!41862 () Bool)

(declare-fun call!41865 () ListLongMap!13635)

(assert (=> bm!41862 (= call!41865 (getCurrentListMapNoExtraKeys!3536 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!988555 () Bool)

(declare-fun e!557417 () ListLongMap!13635)

(assert (=> b!988555 (= e!557417 (ListLongMap!13636 Nil!20835))))

(declare-fun b!988556 () Bool)

(assert (=> b!988556 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30521 _keys!1544)))))

(assert (=> b!988556 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30522 _values!1278)))))

(declare-fun lt!438341 () ListLongMap!13635)

(declare-fun e!557412 () Bool)

(declare-fun apply!887 (ListLongMap!13635 (_ BitVec 64)) V!35969)

(declare-fun get!15603 (ValueCell!11138 V!35969) V!35969)

(declare-fun dynLambda!1852 (Int (_ BitVec 64)) V!35969)

(assert (=> b!988556 (= e!557412 (= (apply!887 lt!438341 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15603 (select (arr!30041 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1852 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!988557 () Bool)

(declare-fun e!557414 () ListLongMap!13635)

(assert (=> b!988557 (= e!557414 call!41865)))

(declare-fun b!988558 () Bool)

(declare-fun e!557413 () Bool)

(declare-fun isEmpty!727 (ListLongMap!13635) Bool)

(assert (=> b!988558 (= e!557413 (isEmpty!727 lt!438341))))

(declare-fun b!988559 () Bool)

(assert (=> b!988559 (= e!557413 (= lt!438341 (getCurrentListMapNoExtraKeys!3536 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!988560 () Bool)

(declare-fun res!661222 () Bool)

(declare-fun e!557416 () Bool)

(assert (=> b!988560 (=> (not res!661222) (not e!557416))))

(declare-fun contains!5689 (ListLongMap!13635 (_ BitVec 64)) Bool)

(assert (=> b!988560 (= res!661222 (not (contains!5689 lt!438341 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!988562 () Bool)

(assert (=> b!988562 (= e!557417 e!557414)))

(declare-fun c!100177 () Bool)

(assert (=> b!988562 (= c!100177 (validKeyInArray!0 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!988563 () Bool)

(declare-fun e!557418 () Bool)

(assert (=> b!988563 (= e!557416 e!557418)))

(declare-fun c!100176 () Bool)

(assert (=> b!988563 (= c!100176 e!557415)))

(declare-fun res!661225 () Bool)

(assert (=> b!988563 (=> (not res!661225) (not e!557415))))

(assert (=> b!988563 (= res!661225 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30521 _keys!1544)))))

(declare-fun d!117065 () Bool)

(assert (=> d!117065 e!557416))

(declare-fun res!661224 () Bool)

(assert (=> d!117065 (=> (not res!661224) (not e!557416))))

(assert (=> d!117065 (= res!661224 (not (contains!5689 lt!438341 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117065 (= lt!438341 e!557417)))

(declare-fun c!100174 () Bool)

(assert (=> d!117065 (= c!100174 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30521 _keys!1544)))))

(assert (=> d!117065 (validMask!0 mask!1948)))

(assert (=> d!117065 (= (getCurrentListMapNoExtraKeys!3536 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438341)))

(declare-fun b!988561 () Bool)

(assert (=> b!988561 (= e!557418 e!557412)))

(assert (=> b!988561 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30521 _keys!1544)))))

(declare-fun res!661223 () Bool)

(assert (=> b!988561 (= res!661223 (contains!5689 lt!438341 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!988561 (=> (not res!661223) (not e!557412))))

(declare-fun b!988564 () Bool)

(assert (=> b!988564 (= e!557418 e!557413)))

(declare-fun c!100175 () Bool)

(assert (=> b!988564 (= c!100175 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30521 _keys!1544)))))

(declare-fun b!988565 () Bool)

(declare-fun lt!438335 () Unit!32682)

(declare-fun lt!438337 () Unit!32682)

(assert (=> b!988565 (= lt!438335 lt!438337)))

(declare-fun lt!438336 () V!35969)

(declare-fun lt!438338 () (_ BitVec 64))

(declare-fun lt!438340 () (_ BitVec 64))

(declare-fun lt!438339 () ListLongMap!13635)

(declare-fun +!3104 (ListLongMap!13635 tuple2!14948) ListLongMap!13635)

(assert (=> b!988565 (not (contains!5689 (+!3104 lt!438339 (tuple2!14949 lt!438338 lt!438336)) lt!438340))))

(declare-fun addStillNotContains!234 (ListLongMap!13635 (_ BitVec 64) V!35969 (_ BitVec 64)) Unit!32682)

(assert (=> b!988565 (= lt!438337 (addStillNotContains!234 lt!438339 lt!438338 lt!438336 lt!438340))))

(assert (=> b!988565 (= lt!438340 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!988565 (= lt!438336 (get!15603 (select (arr!30041 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1852 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!988565 (= lt!438338 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!988565 (= lt!438339 call!41865)))

(assert (=> b!988565 (= e!557414 (+!3104 call!41865 (tuple2!14949 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15603 (select (arr!30041 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1852 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117065 c!100174) b!988555))

(assert (= (and d!117065 (not c!100174)) b!988562))

(assert (= (and b!988562 c!100177) b!988565))

(assert (= (and b!988562 (not c!100177)) b!988557))

(assert (= (or b!988565 b!988557) bm!41862))

(assert (= (and d!117065 res!661224) b!988560))

(assert (= (and b!988560 res!661222) b!988563))

(assert (= (and b!988563 res!661225) b!988554))

(assert (= (and b!988563 c!100176) b!988561))

(assert (= (and b!988563 (not c!100176)) b!988564))

(assert (= (and b!988561 res!661223) b!988556))

(assert (= (and b!988564 c!100175) b!988559))

(assert (= (and b!988564 (not c!100175)) b!988558))

(declare-fun b_lambda!15059 () Bool)

(assert (=> (not b_lambda!15059) (not b!988556)))

(declare-fun t!29771 () Bool)

(declare-fun tb!6781 () Bool)

(assert (=> (and start!84510 (= defaultEntry!1281 defaultEntry!1281) t!29771) tb!6781))

(declare-fun result!13565 () Bool)

(assert (=> tb!6781 (= result!13565 tp_is_empty!23239)))

(assert (=> b!988556 t!29771))

(declare-fun b_and!32097 () Bool)

(assert (= b_and!32091 (and (=> t!29771 result!13565) b_and!32097)))

(declare-fun b_lambda!15061 () Bool)

(assert (=> (not b_lambda!15061) (not b!988565)))

(assert (=> b!988565 t!29771))

(declare-fun b_and!32099 () Bool)

(assert (= b_and!32097 (and (=> t!29771 result!13565) b_and!32099)))

(declare-fun m!915153 () Bool)

(assert (=> b!988562 m!915153))

(assert (=> b!988562 m!915153))

(declare-fun m!915155 () Bool)

(assert (=> b!988562 m!915155))

(declare-fun m!915157 () Bool)

(assert (=> b!988560 m!915157))

(declare-fun m!915159 () Bool)

(assert (=> b!988565 m!915159))

(declare-fun m!915161 () Bool)

(assert (=> b!988565 m!915161))

(declare-fun m!915163 () Bool)

(assert (=> b!988565 m!915163))

(declare-fun m!915165 () Bool)

(assert (=> b!988565 m!915165))

(declare-fun m!915167 () Bool)

(assert (=> b!988565 m!915167))

(assert (=> b!988565 m!915165))

(assert (=> b!988565 m!915153))

(declare-fun m!915169 () Bool)

(assert (=> b!988565 m!915169))

(assert (=> b!988565 m!915159))

(declare-fun m!915171 () Bool)

(assert (=> b!988565 m!915171))

(assert (=> b!988565 m!915163))

(assert (=> b!988554 m!915153))

(assert (=> b!988554 m!915153))

(assert (=> b!988554 m!915155))

(assert (=> b!988556 m!915163))

(assert (=> b!988556 m!915165))

(assert (=> b!988556 m!915167))

(assert (=> b!988556 m!915165))

(assert (=> b!988556 m!915153))

(assert (=> b!988556 m!915153))

(declare-fun m!915173 () Bool)

(assert (=> b!988556 m!915173))

(assert (=> b!988556 m!915163))

(assert (=> b!988561 m!915153))

(assert (=> b!988561 m!915153))

(declare-fun m!915175 () Bool)

(assert (=> b!988561 m!915175))

(declare-fun m!915177 () Bool)

(assert (=> bm!41862 m!915177))

(assert (=> b!988559 m!915177))

(declare-fun m!915179 () Bool)

(assert (=> d!117065 m!915179))

(assert (=> d!117065 m!915083))

(declare-fun m!915181 () Bool)

(assert (=> b!988558 m!915181))

(assert (=> b!988438 d!117065))

(declare-fun d!117067 () Bool)

(assert (=> d!117067 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84510 d!117067))

(declare-fun d!117069 () Bool)

(assert (=> d!117069 (= (array_inv!23217 _values!1278) (bvsge (size!30522 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84510 d!117069))

(declare-fun d!117071 () Bool)

(assert (=> d!117071 (= (array_inv!23218 _keys!1544) (bvsge (size!30521 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84510 d!117071))

(declare-fun mapNonEmpty!36906 () Bool)

(declare-fun mapRes!36906 () Bool)

(declare-fun tp!69870 () Bool)

(declare-fun e!557424 () Bool)

(assert (=> mapNonEmpty!36906 (= mapRes!36906 (and tp!69870 e!557424))))

(declare-fun mapKey!36906 () (_ BitVec 32))

(declare-fun mapRest!36906 () (Array (_ BitVec 32) ValueCell!11138))

(declare-fun mapValue!36906 () ValueCell!11138)

(assert (=> mapNonEmpty!36906 (= mapRest!36897 (store mapRest!36906 mapKey!36906 mapValue!36906))))

(declare-fun condMapEmpty!36906 () Bool)

(declare-fun mapDefault!36906 () ValueCell!11138)

(assert (=> mapNonEmpty!36897 (= condMapEmpty!36906 (= mapRest!36897 ((as const (Array (_ BitVec 32) ValueCell!11138)) mapDefault!36906)))))

(declare-fun e!557423 () Bool)

(assert (=> mapNonEmpty!36897 (= tp!69854 (and e!557423 mapRes!36906))))

(declare-fun b!988574 () Bool)

(assert (=> b!988574 (= e!557424 tp_is_empty!23239)))

(declare-fun mapIsEmpty!36906 () Bool)

(assert (=> mapIsEmpty!36906 mapRes!36906))

(declare-fun b!988575 () Bool)

(assert (=> b!988575 (= e!557423 tp_is_empty!23239)))

(assert (= (and mapNonEmpty!36897 condMapEmpty!36906) mapIsEmpty!36906))

(assert (= (and mapNonEmpty!36897 (not condMapEmpty!36906)) mapNonEmpty!36906))

(assert (= (and mapNonEmpty!36906 ((_ is ValueCellFull!11138) mapValue!36906)) b!988574))

(assert (= (and mapNonEmpty!36897 ((_ is ValueCellFull!11138) mapDefault!36906)) b!988575))

(declare-fun m!915183 () Bool)

(assert (=> mapNonEmpty!36906 m!915183))

(declare-fun b_lambda!15063 () Bool)

(assert (= b_lambda!15061 (or (and start!84510 b_free!20023) b_lambda!15063)))

(declare-fun b_lambda!15065 () Bool)

(assert (= b_lambda!15059 (or (and start!84510 b_free!20023) b_lambda!15065)))

(check-sat (not b!988560) (not b_lambda!15065) (not b!988512) (not bm!41859) (not b!988565) b_and!32099 (not b!988513) (not bm!41856) tp_is_empty!23239 (not mapNonEmpty!36906) (not b!988529) (not b!988562) (not b!988526) (not d!117065) (not b!988561) (not b!988554) (not b!988527) (not b!988556) (not b!988559) (not b!988558) (not bm!41862) (not b_next!20023) (not b_lambda!15063))
(check-sat b_and!32099 (not b_next!20023))
