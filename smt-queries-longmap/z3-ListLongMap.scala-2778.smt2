; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40526 () Bool)

(assert start!40526)

(declare-fun b_free!10567 () Bool)

(declare-fun b_next!10567 () Bool)

(assert (=> start!40526 (= b_free!10567 (not b_next!10567))))

(declare-fun tp!37517 () Bool)

(declare-fun b_and!18541 () Bool)

(assert (=> start!40526 (= tp!37517 b_and!18541)))

(declare-fun mapIsEmpty!19488 () Bool)

(declare-fun mapRes!19488 () Bool)

(assert (=> mapIsEmpty!19488 mapRes!19488))

(declare-fun mapNonEmpty!19488 () Bool)

(declare-fun tp!37518 () Bool)

(declare-fun e!262280 () Bool)

(assert (=> mapNonEmpty!19488 (= mapRes!19488 (and tp!37518 e!262280))))

(declare-datatypes ((V!16979 0))(
  ( (V!16980 (val!5997 Int)) )
))
(declare-datatypes ((ValueCell!5609 0))(
  ( (ValueCellFull!5609 (v!8246 V!16979)) (EmptyCell!5609) )
))
(declare-datatypes ((array!27619 0))(
  ( (array!27620 (arr!13256 (Array (_ BitVec 32) ValueCell!5609)) (size!13609 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27619)

(declare-fun mapRest!19488 () (Array (_ BitVec 32) ValueCell!5609))

(declare-fun mapValue!19488 () ValueCell!5609)

(declare-fun mapKey!19488 () (_ BitVec 32))

(assert (=> mapNonEmpty!19488 (= (arr!13256 _values!549) (store mapRest!19488 mapKey!19488 mapValue!19488))))

(declare-fun b!446557 () Bool)

(declare-fun tp_is_empty!11905 () Bool)

(assert (=> b!446557 (= e!262280 tp_is_empty!11905)))

(declare-fun b!446558 () Bool)

(declare-fun res!265158 () Bool)

(declare-fun e!262283 () Bool)

(assert (=> b!446558 (=> (not res!265158) (not e!262283))))

(declare-datatypes ((array!27621 0))(
  ( (array!27622 (arr!13257 (Array (_ BitVec 32) (_ BitVec 64))) (size!13610 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27621)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446558 (= res!265158 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446559 () Bool)

(declare-fun res!265154 () Bool)

(assert (=> b!446559 (=> (not res!265154) (not e!262283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446559 (= res!265154 (validKeyInArray!0 k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!203621 () array!27621)

(declare-fun zeroValue!515 () V!16979)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!16979)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun b!446560 () Bool)

(declare-fun minValue!515 () V!16979)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun e!262284 () Bool)

(declare-datatypes ((tuple2!7874 0))(
  ( (tuple2!7875 (_1!3948 (_ BitVec 64)) (_2!3948 V!16979)) )
))
(declare-datatypes ((List!7933 0))(
  ( (Nil!7930) (Cons!7929 (h!8785 tuple2!7874) (t!13684 List!7933)) )
))
(declare-datatypes ((ListLongMap!6777 0))(
  ( (ListLongMap!6778 (toList!3404 List!7933)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1602 (array!27621 array!27619 (_ BitVec 32) (_ BitVec 32) V!16979 V!16979 (_ BitVec 32) Int) ListLongMap!6777)

(assert (=> b!446560 (= e!262284 (not (= (getCurrentListMapNoExtraKeys!1602 lt!203621 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) (getCurrentListMapNoExtraKeys!1602 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))))

(declare-fun b!446561 () Bool)

(declare-fun res!265163 () Bool)

(assert (=> b!446561 (=> (not res!265163) (not e!262283))))

(assert (=> b!446561 (= res!265163 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13610 _keys!709))))))

(declare-fun res!265153 () Bool)

(assert (=> start!40526 (=> (not res!265153) (not e!262283))))

(assert (=> start!40526 (= res!265153 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13610 _keys!709))))))

(assert (=> start!40526 e!262283))

(assert (=> start!40526 tp_is_empty!11905))

(assert (=> start!40526 tp!37517))

(assert (=> start!40526 true))

(declare-fun e!262281 () Bool)

(declare-fun array_inv!9660 (array!27619) Bool)

(assert (=> start!40526 (and (array_inv!9660 _values!549) e!262281)))

(declare-fun array_inv!9661 (array!27621) Bool)

(assert (=> start!40526 (array_inv!9661 _keys!709)))

(declare-fun b!446556 () Bool)

(declare-fun res!265156 () Bool)

(assert (=> b!446556 (=> (not res!265156) (not e!262283))))

(assert (=> b!446556 (= res!265156 (and (= (size!13609 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13610 _keys!709) (size!13609 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446562 () Bool)

(declare-fun res!265162 () Bool)

(assert (=> b!446562 (=> (not res!265162) (not e!262283))))

(declare-datatypes ((List!7934 0))(
  ( (Nil!7931) (Cons!7930 (h!8786 (_ BitVec 64)) (t!13685 List!7934)) )
))
(declare-fun arrayNoDuplicates!0 (array!27621 (_ BitVec 32) List!7934) Bool)

(assert (=> b!446562 (= res!265162 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7931))))

(declare-fun b!446563 () Bool)

(declare-fun res!265161 () Bool)

(assert (=> b!446563 (=> (not res!265161) (not e!262284))))

(assert (=> b!446563 (= res!265161 (and (bvsgt from!863 i!563) (bvsgt (bvadd #b00000000000000000000000000000001 from!863) (size!13610 _keys!709))))))

(declare-fun b!446564 () Bool)

(assert (=> b!446564 (= e!262283 e!262284)))

(declare-fun res!265157 () Bool)

(assert (=> b!446564 (=> (not res!265157) (not e!262284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27621 (_ BitVec 32)) Bool)

(assert (=> b!446564 (= res!265157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203621 mask!1025))))

(assert (=> b!446564 (= lt!203621 (array!27622 (store (arr!13257 _keys!709) i!563 k0!794) (size!13610 _keys!709)))))

(declare-fun b!446565 () Bool)

(declare-fun res!265155 () Bool)

(assert (=> b!446565 (=> (not res!265155) (not e!262283))))

(assert (=> b!446565 (= res!265155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446566 () Bool)

(declare-fun e!262279 () Bool)

(assert (=> b!446566 (= e!262281 (and e!262279 mapRes!19488))))

(declare-fun condMapEmpty!19488 () Bool)

(declare-fun mapDefault!19488 () ValueCell!5609)

(assert (=> b!446566 (= condMapEmpty!19488 (= (arr!13256 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5609)) mapDefault!19488)))))

(declare-fun b!446567 () Bool)

(declare-fun res!265164 () Bool)

(assert (=> b!446567 (=> (not res!265164) (not e!262284))))

(assert (=> b!446567 (= res!265164 (arrayNoDuplicates!0 lt!203621 #b00000000000000000000000000000000 Nil!7931))))

(declare-fun b!446568 () Bool)

(declare-fun res!265160 () Bool)

(assert (=> b!446568 (=> (not res!265160) (not e!262283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446568 (= res!265160 (validMask!0 mask!1025))))

(declare-fun b!446569 () Bool)

(declare-fun res!265159 () Bool)

(assert (=> b!446569 (=> (not res!265159) (not e!262283))))

(assert (=> b!446569 (= res!265159 (or (= (select (arr!13257 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13257 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446570 () Bool)

(assert (=> b!446570 (= e!262279 tp_is_empty!11905)))

(assert (= (and start!40526 res!265153) b!446568))

(assert (= (and b!446568 res!265160) b!446556))

(assert (= (and b!446556 res!265156) b!446565))

(assert (= (and b!446565 res!265155) b!446562))

(assert (= (and b!446562 res!265162) b!446561))

(assert (= (and b!446561 res!265163) b!446559))

(assert (= (and b!446559 res!265154) b!446569))

(assert (= (and b!446569 res!265159) b!446558))

(assert (= (and b!446558 res!265158) b!446564))

(assert (= (and b!446564 res!265157) b!446567))

(assert (= (and b!446567 res!265164) b!446563))

(assert (= (and b!446563 res!265161) b!446560))

(assert (= (and b!446566 condMapEmpty!19488) mapIsEmpty!19488))

(assert (= (and b!446566 (not condMapEmpty!19488)) mapNonEmpty!19488))

(get-info :version)

(assert (= (and mapNonEmpty!19488 ((_ is ValueCellFull!5609) mapValue!19488)) b!446557))

(assert (= (and b!446566 ((_ is ValueCellFull!5609) mapDefault!19488)) b!446570))

(assert (= start!40526 b!446566))

(declare-fun m!431181 () Bool)

(assert (=> start!40526 m!431181))

(declare-fun m!431183 () Bool)

(assert (=> start!40526 m!431183))

(declare-fun m!431185 () Bool)

(assert (=> b!446564 m!431185))

(declare-fun m!431187 () Bool)

(assert (=> b!446564 m!431187))

(declare-fun m!431189 () Bool)

(assert (=> mapNonEmpty!19488 m!431189))

(declare-fun m!431191 () Bool)

(assert (=> b!446559 m!431191))

(declare-fun m!431193 () Bool)

(assert (=> b!446562 m!431193))

(declare-fun m!431195 () Bool)

(assert (=> b!446568 m!431195))

(declare-fun m!431197 () Bool)

(assert (=> b!446567 m!431197))

(declare-fun m!431199 () Bool)

(assert (=> b!446569 m!431199))

(declare-fun m!431201 () Bool)

(assert (=> b!446560 m!431201))

(declare-fun m!431203 () Bool)

(assert (=> b!446560 m!431203))

(declare-fun m!431205 () Bool)

(assert (=> b!446560 m!431205))

(declare-fun m!431207 () Bool)

(assert (=> b!446565 m!431207))

(declare-fun m!431209 () Bool)

(assert (=> b!446558 m!431209))

(check-sat tp_is_empty!11905 (not b!446562) (not b_next!10567) (not b!446568) (not b!446565) (not b!446564) (not mapNonEmpty!19488) (not b!446558) (not b!446559) b_and!18541 (not start!40526) (not b!446560) (not b!446567))
(check-sat b_and!18541 (not b_next!10567))
(get-model)

(declare-fun b!446669 () Bool)

(declare-fun e!262328 () Bool)

(declare-fun call!29650 () Bool)

(assert (=> b!446669 (= e!262328 call!29650)))

(declare-fun d!73979 () Bool)

(declare-fun res!265241 () Bool)

(declare-fun e!262327 () Bool)

(assert (=> d!73979 (=> res!265241 e!262327)))

(assert (=> d!73979 (= res!265241 (bvsge #b00000000000000000000000000000000 (size!13610 _keys!709)))))

(assert (=> d!73979 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!262327)))

(declare-fun b!446670 () Bool)

(assert (=> b!446670 (= e!262327 e!262328)))

(declare-fun c!55860 () Bool)

(assert (=> b!446670 (= c!55860 (validKeyInArray!0 (select (arr!13257 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446671 () Bool)

(declare-fun e!262329 () Bool)

(assert (=> b!446671 (= e!262328 e!262329)))

(declare-fun lt!203636 () (_ BitVec 64))

(assert (=> b!446671 (= lt!203636 (select (arr!13257 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13135 0))(
  ( (Unit!13136) )
))
(declare-fun lt!203634 () Unit!13135)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27621 (_ BitVec 64) (_ BitVec 32)) Unit!13135)

(assert (=> b!446671 (= lt!203634 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!203636 #b00000000000000000000000000000000))))

(assert (=> b!446671 (arrayContainsKey!0 _keys!709 lt!203636 #b00000000000000000000000000000000)))

(declare-fun lt!203635 () Unit!13135)

(assert (=> b!446671 (= lt!203635 lt!203634)))

(declare-fun res!265242 () Bool)

(declare-datatypes ((SeekEntryResult!3525 0))(
  ( (MissingZero!3525 (index!16279 (_ BitVec 32))) (Found!3525 (index!16280 (_ BitVec 32))) (Intermediate!3525 (undefined!4337 Bool) (index!16281 (_ BitVec 32)) (x!42049 (_ BitVec 32))) (Undefined!3525) (MissingVacant!3525 (index!16282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27621 (_ BitVec 32)) SeekEntryResult!3525)

(assert (=> b!446671 (= res!265242 (= (seekEntryOrOpen!0 (select (arr!13257 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3525 #b00000000000000000000000000000000)))))

(assert (=> b!446671 (=> (not res!265242) (not e!262329))))

(declare-fun bm!29647 () Bool)

(assert (=> bm!29647 (= call!29650 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!446672 () Bool)

(assert (=> b!446672 (= e!262329 call!29650)))

(assert (= (and d!73979 (not res!265241)) b!446670))

(assert (= (and b!446670 c!55860) b!446671))

(assert (= (and b!446670 (not c!55860)) b!446669))

(assert (= (and b!446671 res!265242) b!446672))

(assert (= (or b!446672 b!446669) bm!29647))

(declare-fun m!431271 () Bool)

(assert (=> b!446670 m!431271))

(assert (=> b!446670 m!431271))

(declare-fun m!431273 () Bool)

(assert (=> b!446670 m!431273))

(assert (=> b!446671 m!431271))

(declare-fun m!431275 () Bool)

(assert (=> b!446671 m!431275))

(declare-fun m!431277 () Bool)

(assert (=> b!446671 m!431277))

(assert (=> b!446671 m!431271))

(declare-fun m!431279 () Bool)

(assert (=> b!446671 m!431279))

(declare-fun m!431281 () Bool)

(assert (=> bm!29647 m!431281))

(assert (=> b!446565 d!73979))

(declare-fun b!446673 () Bool)

(declare-fun e!262331 () Bool)

(declare-fun call!29651 () Bool)

(assert (=> b!446673 (= e!262331 call!29651)))

(declare-fun d!73981 () Bool)

(declare-fun res!265243 () Bool)

(declare-fun e!262330 () Bool)

(assert (=> d!73981 (=> res!265243 e!262330)))

(assert (=> d!73981 (= res!265243 (bvsge #b00000000000000000000000000000000 (size!13610 lt!203621)))))

(assert (=> d!73981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203621 mask!1025) e!262330)))

(declare-fun b!446674 () Bool)

(assert (=> b!446674 (= e!262330 e!262331)))

(declare-fun c!55861 () Bool)

(assert (=> b!446674 (= c!55861 (validKeyInArray!0 (select (arr!13257 lt!203621) #b00000000000000000000000000000000)))))

(declare-fun b!446675 () Bool)

(declare-fun e!262332 () Bool)

(assert (=> b!446675 (= e!262331 e!262332)))

(declare-fun lt!203639 () (_ BitVec 64))

(assert (=> b!446675 (= lt!203639 (select (arr!13257 lt!203621) #b00000000000000000000000000000000))))

(declare-fun lt!203637 () Unit!13135)

(assert (=> b!446675 (= lt!203637 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!203621 lt!203639 #b00000000000000000000000000000000))))

(assert (=> b!446675 (arrayContainsKey!0 lt!203621 lt!203639 #b00000000000000000000000000000000)))

(declare-fun lt!203638 () Unit!13135)

(assert (=> b!446675 (= lt!203638 lt!203637)))

(declare-fun res!265244 () Bool)

(assert (=> b!446675 (= res!265244 (= (seekEntryOrOpen!0 (select (arr!13257 lt!203621) #b00000000000000000000000000000000) lt!203621 mask!1025) (Found!3525 #b00000000000000000000000000000000)))))

(assert (=> b!446675 (=> (not res!265244) (not e!262332))))

(declare-fun bm!29648 () Bool)

(assert (=> bm!29648 (= call!29651 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!203621 mask!1025))))

(declare-fun b!446676 () Bool)

(assert (=> b!446676 (= e!262332 call!29651)))

(assert (= (and d!73981 (not res!265243)) b!446674))

(assert (= (and b!446674 c!55861) b!446675))

(assert (= (and b!446674 (not c!55861)) b!446673))

(assert (= (and b!446675 res!265244) b!446676))

(assert (= (or b!446676 b!446673) bm!29648))

(declare-fun m!431283 () Bool)

(assert (=> b!446674 m!431283))

(assert (=> b!446674 m!431283))

(declare-fun m!431285 () Bool)

(assert (=> b!446674 m!431285))

(assert (=> b!446675 m!431283))

(declare-fun m!431287 () Bool)

(assert (=> b!446675 m!431287))

(declare-fun m!431289 () Bool)

(assert (=> b!446675 m!431289))

(assert (=> b!446675 m!431283))

(declare-fun m!431291 () Bool)

(assert (=> b!446675 m!431291))

(declare-fun m!431293 () Bool)

(assert (=> bm!29648 m!431293))

(assert (=> b!446564 d!73981))

(declare-fun d!73983 () Bool)

(assert (=> d!73983 (= (array_inv!9660 _values!549) (bvsge (size!13609 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40526 d!73983))

(declare-fun d!73985 () Bool)

(assert (=> d!73985 (= (array_inv!9661 _keys!709) (bvsge (size!13610 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40526 d!73985))

(declare-fun d!73987 () Bool)

(assert (=> d!73987 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!446559 d!73987))

(declare-fun d!73989 () Bool)

(declare-fun res!265249 () Bool)

(declare-fun e!262337 () Bool)

(assert (=> d!73989 (=> res!265249 e!262337)))

(assert (=> d!73989 (= res!265249 (= (select (arr!13257 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!73989 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!262337)))

(declare-fun b!446681 () Bool)

(declare-fun e!262338 () Bool)

(assert (=> b!446681 (= e!262337 e!262338)))

(declare-fun res!265250 () Bool)

(assert (=> b!446681 (=> (not res!265250) (not e!262338))))

(assert (=> b!446681 (= res!265250 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13610 _keys!709)))))

(declare-fun b!446682 () Bool)

(assert (=> b!446682 (= e!262338 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73989 (not res!265249)) b!446681))

(assert (= (and b!446681 res!265250) b!446682))

(assert (=> d!73989 m!431271))

(declare-fun m!431295 () Bool)

(assert (=> b!446682 m!431295))

(assert (=> b!446558 d!73989))

(declare-fun d!73991 () Bool)

(assert (=> d!73991 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!446568 d!73991))

(declare-fun b!446693 () Bool)

(declare-fun e!262349 () Bool)

(declare-fun e!262347 () Bool)

(assert (=> b!446693 (= e!262349 e!262347)))

(declare-fun res!265258 () Bool)

(assert (=> b!446693 (=> (not res!265258) (not e!262347))))

(declare-fun e!262348 () Bool)

(assert (=> b!446693 (= res!265258 (not e!262348))))

(declare-fun res!265259 () Bool)

(assert (=> b!446693 (=> (not res!265259) (not e!262348))))

(assert (=> b!446693 (= res!265259 (validKeyInArray!0 (select (arr!13257 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!446694 () Bool)

(declare-fun e!262350 () Bool)

(declare-fun call!29654 () Bool)

(assert (=> b!446694 (= e!262350 call!29654)))

(declare-fun b!446695 () Bool)

(assert (=> b!446695 (= e!262350 call!29654)))

(declare-fun b!446696 () Bool)

(assert (=> b!446696 (= e!262347 e!262350)))

(declare-fun c!55864 () Bool)

(assert (=> b!446696 (= c!55864 (validKeyInArray!0 (select (arr!13257 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!73993 () Bool)

(declare-fun res!265257 () Bool)

(assert (=> d!73993 (=> res!265257 e!262349)))

(assert (=> d!73993 (= res!265257 (bvsge #b00000000000000000000000000000000 (size!13610 _keys!709)))))

(assert (=> d!73993 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7931) e!262349)))

(declare-fun bm!29651 () Bool)

(assert (=> bm!29651 (= call!29654 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55864 (Cons!7930 (select (arr!13257 _keys!709) #b00000000000000000000000000000000) Nil!7931) Nil!7931)))))

(declare-fun b!446697 () Bool)

(declare-fun contains!2481 (List!7934 (_ BitVec 64)) Bool)

(assert (=> b!446697 (= e!262348 (contains!2481 Nil!7931 (select (arr!13257 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!73993 (not res!265257)) b!446693))

(assert (= (and b!446693 res!265259) b!446697))

(assert (= (and b!446693 res!265258) b!446696))

(assert (= (and b!446696 c!55864) b!446695))

(assert (= (and b!446696 (not c!55864)) b!446694))

(assert (= (or b!446695 b!446694) bm!29651))

(assert (=> b!446693 m!431271))

(assert (=> b!446693 m!431271))

(assert (=> b!446693 m!431273))

(assert (=> b!446696 m!431271))

(assert (=> b!446696 m!431271))

(assert (=> b!446696 m!431273))

(assert (=> bm!29651 m!431271))

(declare-fun m!431297 () Bool)

(assert (=> bm!29651 m!431297))

(assert (=> b!446697 m!431271))

(assert (=> b!446697 m!431271))

(declare-fun m!431299 () Bool)

(assert (=> b!446697 m!431299))

(assert (=> b!446562 d!73993))

(declare-fun b!446698 () Bool)

(declare-fun e!262353 () Bool)

(declare-fun e!262351 () Bool)

(assert (=> b!446698 (= e!262353 e!262351)))

(declare-fun res!265261 () Bool)

(assert (=> b!446698 (=> (not res!265261) (not e!262351))))

(declare-fun e!262352 () Bool)

(assert (=> b!446698 (= res!265261 (not e!262352))))

(declare-fun res!265262 () Bool)

(assert (=> b!446698 (=> (not res!265262) (not e!262352))))

(assert (=> b!446698 (= res!265262 (validKeyInArray!0 (select (arr!13257 lt!203621) #b00000000000000000000000000000000)))))

(declare-fun b!446699 () Bool)

(declare-fun e!262354 () Bool)

(declare-fun call!29655 () Bool)

(assert (=> b!446699 (= e!262354 call!29655)))

(declare-fun b!446700 () Bool)

(assert (=> b!446700 (= e!262354 call!29655)))

(declare-fun b!446701 () Bool)

(assert (=> b!446701 (= e!262351 e!262354)))

(declare-fun c!55865 () Bool)

(assert (=> b!446701 (= c!55865 (validKeyInArray!0 (select (arr!13257 lt!203621) #b00000000000000000000000000000000)))))

(declare-fun d!73995 () Bool)

(declare-fun res!265260 () Bool)

(assert (=> d!73995 (=> res!265260 e!262353)))

(assert (=> d!73995 (= res!265260 (bvsge #b00000000000000000000000000000000 (size!13610 lt!203621)))))

(assert (=> d!73995 (= (arrayNoDuplicates!0 lt!203621 #b00000000000000000000000000000000 Nil!7931) e!262353)))

(declare-fun bm!29652 () Bool)

(assert (=> bm!29652 (= call!29655 (arrayNoDuplicates!0 lt!203621 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55865 (Cons!7930 (select (arr!13257 lt!203621) #b00000000000000000000000000000000) Nil!7931) Nil!7931)))))

(declare-fun b!446702 () Bool)

(assert (=> b!446702 (= e!262352 (contains!2481 Nil!7931 (select (arr!13257 lt!203621) #b00000000000000000000000000000000)))))

(assert (= (and d!73995 (not res!265260)) b!446698))

(assert (= (and b!446698 res!265262) b!446702))

(assert (= (and b!446698 res!265261) b!446701))

(assert (= (and b!446701 c!55865) b!446700))

(assert (= (and b!446701 (not c!55865)) b!446699))

(assert (= (or b!446700 b!446699) bm!29652))

(assert (=> b!446698 m!431283))

(assert (=> b!446698 m!431283))

(assert (=> b!446698 m!431285))

(assert (=> b!446701 m!431283))

(assert (=> b!446701 m!431283))

(assert (=> b!446701 m!431285))

(assert (=> bm!29652 m!431283))

(declare-fun m!431301 () Bool)

(assert (=> bm!29652 m!431301))

(assert (=> b!446702 m!431283))

(assert (=> b!446702 m!431283))

(declare-fun m!431303 () Bool)

(assert (=> b!446702 m!431303))

(assert (=> b!446567 d!73995))

(declare-fun b!446727 () Bool)

(declare-fun e!262372 () Bool)

(declare-fun lt!203660 () ListLongMap!6777)

(assert (=> b!446727 (= e!262372 (= lt!203660 (getCurrentListMapNoExtraKeys!1602 lt!203621 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun bm!29655 () Bool)

(declare-fun call!29658 () ListLongMap!6777)

(assert (=> bm!29655 (= call!29658 (getCurrentListMapNoExtraKeys!1602 lt!203621 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446728 () Bool)

(declare-fun e!262371 () ListLongMap!6777)

(assert (=> b!446728 (= e!262371 call!29658)))

(declare-fun b!446729 () Bool)

(declare-fun e!262374 () Bool)

(assert (=> b!446729 (= e!262374 e!262372)))

(declare-fun c!55874 () Bool)

(assert (=> b!446729 (= c!55874 (bvslt from!863 (size!13610 lt!203621)))))

(declare-fun b!446730 () Bool)

(declare-fun e!262369 () Bool)

(assert (=> b!446730 (= e!262369 e!262374)))

(declare-fun c!55876 () Bool)

(declare-fun e!262375 () Bool)

(assert (=> b!446730 (= c!55876 e!262375)))

(declare-fun res!265274 () Bool)

(assert (=> b!446730 (=> (not res!265274) (not e!262375))))

(assert (=> b!446730 (= res!265274 (bvslt from!863 (size!13610 lt!203621)))))

(declare-fun b!446731 () Bool)

(declare-fun isEmpty!561 (ListLongMap!6777) Bool)

(assert (=> b!446731 (= e!262372 (isEmpty!561 lt!203660))))

(declare-fun b!446732 () Bool)

(declare-fun lt!203654 () Unit!13135)

(declare-fun lt!203659 () Unit!13135)

(assert (=> b!446732 (= lt!203654 lt!203659)))

(declare-fun lt!203658 () V!16979)

(declare-fun lt!203656 () (_ BitVec 64))

(declare-fun lt!203655 () ListLongMap!6777)

(declare-fun lt!203657 () (_ BitVec 64))

(declare-fun contains!2482 (ListLongMap!6777 (_ BitVec 64)) Bool)

(declare-fun +!1558 (ListLongMap!6777 tuple2!7874) ListLongMap!6777)

(assert (=> b!446732 (not (contains!2482 (+!1558 lt!203655 (tuple2!7875 lt!203657 lt!203658)) lt!203656))))

(declare-fun addStillNotContains!145 (ListLongMap!6777 (_ BitVec 64) V!16979 (_ BitVec 64)) Unit!13135)

(assert (=> b!446732 (= lt!203659 (addStillNotContains!145 lt!203655 lt!203657 lt!203658 lt!203656))))

(assert (=> b!446732 (= lt!203656 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6551 (ValueCell!5609 V!16979) V!16979)

(declare-fun dynLambda!849 (Int (_ BitVec 64)) V!16979)

(assert (=> b!446732 (= lt!203658 (get!6551 (select (arr!13256 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549))) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446732 (= lt!203657 (select (arr!13257 lt!203621) from!863))))

(assert (=> b!446732 (= lt!203655 call!29658)))

(assert (=> b!446732 (= e!262371 (+!1558 call!29658 (tuple2!7875 (select (arr!13257 lt!203621) from!863) (get!6551 (select (arr!13256 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549))) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446733 () Bool)

(declare-fun res!265273 () Bool)

(assert (=> b!446733 (=> (not res!265273) (not e!262369))))

(assert (=> b!446733 (= res!265273 (not (contains!2482 lt!203660 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446734 () Bool)

(assert (=> b!446734 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13610 lt!203621)))))

(assert (=> b!446734 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13609 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549)))))))

(declare-fun e!262370 () Bool)

(declare-fun apply!311 (ListLongMap!6777 (_ BitVec 64)) V!16979)

(assert (=> b!446734 (= e!262370 (= (apply!311 lt!203660 (select (arr!13257 lt!203621) from!863)) (get!6551 (select (arr!13256 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549))) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!446735 () Bool)

(declare-fun e!262373 () ListLongMap!6777)

(assert (=> b!446735 (= e!262373 (ListLongMap!6778 Nil!7930))))

(declare-fun b!446736 () Bool)

(assert (=> b!446736 (= e!262373 e!262371)))

(declare-fun c!55875 () Bool)

(assert (=> b!446736 (= c!55875 (validKeyInArray!0 (select (arr!13257 lt!203621) from!863)))))

(declare-fun b!446737 () Bool)

(assert (=> b!446737 (= e!262375 (validKeyInArray!0 (select (arr!13257 lt!203621) from!863)))))

(assert (=> b!446737 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!446738 () Bool)

(assert (=> b!446738 (= e!262374 e!262370)))

(assert (=> b!446738 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13610 lt!203621)))))

(declare-fun res!265272 () Bool)

(assert (=> b!446738 (= res!265272 (contains!2482 lt!203660 (select (arr!13257 lt!203621) from!863)))))

(assert (=> b!446738 (=> (not res!265272) (not e!262370))))

(declare-fun d!73997 () Bool)

(assert (=> d!73997 e!262369))

(declare-fun res!265271 () Bool)

(assert (=> d!73997 (=> (not res!265271) (not e!262369))))

(assert (=> d!73997 (= res!265271 (not (contains!2482 lt!203660 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73997 (= lt!203660 e!262373)))

(declare-fun c!55877 () Bool)

(assert (=> d!73997 (= c!55877 (bvsge from!863 (size!13610 lt!203621)))))

(assert (=> d!73997 (validMask!0 mask!1025)))

(assert (=> d!73997 (= (getCurrentListMapNoExtraKeys!1602 lt!203621 (array!27620 (store (arr!13256 _values!549) i!563 (ValueCellFull!5609 v!412)) (size!13609 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203660)))

(assert (= (and d!73997 c!55877) b!446735))

(assert (= (and d!73997 (not c!55877)) b!446736))

(assert (= (and b!446736 c!55875) b!446732))

(assert (= (and b!446736 (not c!55875)) b!446728))

(assert (= (or b!446732 b!446728) bm!29655))

(assert (= (and d!73997 res!265271) b!446733))

(assert (= (and b!446733 res!265273) b!446730))

(assert (= (and b!446730 res!265274) b!446737))

(assert (= (and b!446730 c!55876) b!446738))

(assert (= (and b!446730 (not c!55876)) b!446729))

(assert (= (and b!446738 res!265272) b!446734))

(assert (= (and b!446729 c!55874) b!446727))

(assert (= (and b!446729 (not c!55874)) b!446731))

(declare-fun b_lambda!9443 () Bool)

(assert (=> (not b_lambda!9443) (not b!446732)))

(declare-fun t!13691 () Bool)

(declare-fun tb!3711 () Bool)

(assert (=> (and start!40526 (= defaultEntry!557 defaultEntry!557) t!13691) tb!3711))

(declare-fun result!6963 () Bool)

(assert (=> tb!3711 (= result!6963 tp_is_empty!11905)))

(assert (=> b!446732 t!13691))

(declare-fun b_and!18547 () Bool)

(assert (= b_and!18541 (and (=> t!13691 result!6963) b_and!18547)))

(declare-fun b_lambda!9445 () Bool)

(assert (=> (not b_lambda!9445) (not b!446734)))

(assert (=> b!446734 t!13691))

(declare-fun b_and!18549 () Bool)

(assert (= b_and!18547 (and (=> t!13691 result!6963) b_and!18549)))

(declare-fun m!431305 () Bool)

(assert (=> b!446736 m!431305))

(assert (=> b!446736 m!431305))

(declare-fun m!431307 () Bool)

(assert (=> b!446736 m!431307))

(declare-fun m!431309 () Bool)

(assert (=> bm!29655 m!431309))

(assert (=> b!446738 m!431305))

(assert (=> b!446738 m!431305))

(declare-fun m!431311 () Bool)

(assert (=> b!446738 m!431311))

(declare-fun m!431313 () Bool)

(assert (=> b!446734 m!431313))

(declare-fun m!431315 () Bool)

(assert (=> b!446734 m!431315))

(assert (=> b!446734 m!431313))

(assert (=> b!446734 m!431315))

(declare-fun m!431317 () Bool)

(assert (=> b!446734 m!431317))

(assert (=> b!446734 m!431305))

(declare-fun m!431319 () Bool)

(assert (=> b!446734 m!431319))

(assert (=> b!446734 m!431305))

(declare-fun m!431321 () Bool)

(assert (=> b!446733 m!431321))

(declare-fun m!431323 () Bool)

(assert (=> d!73997 m!431323))

(assert (=> d!73997 m!431195))

(declare-fun m!431325 () Bool)

(assert (=> b!446731 m!431325))

(assert (=> b!446727 m!431309))

(assert (=> b!446737 m!431305))

(assert (=> b!446737 m!431305))

(assert (=> b!446737 m!431307))

(assert (=> b!446732 m!431313))

(declare-fun m!431327 () Bool)

(assert (=> b!446732 m!431327))

(assert (=> b!446732 m!431315))

(declare-fun m!431329 () Bool)

(assert (=> b!446732 m!431329))

(declare-fun m!431331 () Bool)

(assert (=> b!446732 m!431331))

(assert (=> b!446732 m!431313))

(assert (=> b!446732 m!431315))

(assert (=> b!446732 m!431317))

(assert (=> b!446732 m!431305))

(assert (=> b!446732 m!431329))

(declare-fun m!431333 () Bool)

(assert (=> b!446732 m!431333))

(assert (=> b!446560 d!73997))

(declare-fun e!262379 () Bool)

(declare-fun b!446741 () Bool)

(declare-fun lt!203667 () ListLongMap!6777)

(assert (=> b!446741 (= e!262379 (= lt!203667 (getCurrentListMapNoExtraKeys!1602 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun call!29659 () ListLongMap!6777)

(declare-fun bm!29656 () Bool)

(assert (=> bm!29656 (= call!29659 (getCurrentListMapNoExtraKeys!1602 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!446742 () Bool)

(declare-fun e!262378 () ListLongMap!6777)

(assert (=> b!446742 (= e!262378 call!29659)))

(declare-fun b!446743 () Bool)

(declare-fun e!262381 () Bool)

(assert (=> b!446743 (= e!262381 e!262379)))

(declare-fun c!55878 () Bool)

(assert (=> b!446743 (= c!55878 (bvslt from!863 (size!13610 _keys!709)))))

(declare-fun b!446744 () Bool)

(declare-fun e!262376 () Bool)

(assert (=> b!446744 (= e!262376 e!262381)))

(declare-fun c!55880 () Bool)

(declare-fun e!262382 () Bool)

(assert (=> b!446744 (= c!55880 e!262382)))

(declare-fun res!265278 () Bool)

(assert (=> b!446744 (=> (not res!265278) (not e!262382))))

(assert (=> b!446744 (= res!265278 (bvslt from!863 (size!13610 _keys!709)))))

(declare-fun b!446745 () Bool)

(assert (=> b!446745 (= e!262379 (isEmpty!561 lt!203667))))

(declare-fun b!446746 () Bool)

(declare-fun lt!203661 () Unit!13135)

(declare-fun lt!203666 () Unit!13135)

(assert (=> b!446746 (= lt!203661 lt!203666)))

(declare-fun lt!203662 () ListLongMap!6777)

(declare-fun lt!203664 () (_ BitVec 64))

(declare-fun lt!203665 () V!16979)

(declare-fun lt!203663 () (_ BitVec 64))

(assert (=> b!446746 (not (contains!2482 (+!1558 lt!203662 (tuple2!7875 lt!203664 lt!203665)) lt!203663))))

(assert (=> b!446746 (= lt!203666 (addStillNotContains!145 lt!203662 lt!203664 lt!203665 lt!203663))))

(assert (=> b!446746 (= lt!203663 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!446746 (= lt!203665 (get!6551 (select (arr!13256 _values!549) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!446746 (= lt!203664 (select (arr!13257 _keys!709) from!863))))

(assert (=> b!446746 (= lt!203662 call!29659)))

(assert (=> b!446746 (= e!262378 (+!1558 call!29659 (tuple2!7875 (select (arr!13257 _keys!709) from!863) (get!6551 (select (arr!13256 _values!549) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!446747 () Bool)

(declare-fun res!265277 () Bool)

(assert (=> b!446747 (=> (not res!265277) (not e!262376))))

(assert (=> b!446747 (= res!265277 (not (contains!2482 lt!203667 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446748 () Bool)

(assert (=> b!446748 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13610 _keys!709)))))

(assert (=> b!446748 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13609 _values!549)))))

(declare-fun e!262377 () Bool)

(assert (=> b!446748 (= e!262377 (= (apply!311 lt!203667 (select (arr!13257 _keys!709) from!863)) (get!6551 (select (arr!13256 _values!549) from!863) (dynLambda!849 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!446749 () Bool)

(declare-fun e!262380 () ListLongMap!6777)

(assert (=> b!446749 (= e!262380 (ListLongMap!6778 Nil!7930))))

(declare-fun b!446750 () Bool)

(assert (=> b!446750 (= e!262380 e!262378)))

(declare-fun c!55879 () Bool)

(assert (=> b!446750 (= c!55879 (validKeyInArray!0 (select (arr!13257 _keys!709) from!863)))))

(declare-fun b!446751 () Bool)

(assert (=> b!446751 (= e!262382 (validKeyInArray!0 (select (arr!13257 _keys!709) from!863)))))

(assert (=> b!446751 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!446752 () Bool)

(assert (=> b!446752 (= e!262381 e!262377)))

(assert (=> b!446752 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13610 _keys!709)))))

(declare-fun res!265276 () Bool)

(assert (=> b!446752 (= res!265276 (contains!2482 lt!203667 (select (arr!13257 _keys!709) from!863)))))

(assert (=> b!446752 (=> (not res!265276) (not e!262377))))

(declare-fun d!73999 () Bool)

(assert (=> d!73999 e!262376))

(declare-fun res!265275 () Bool)

(assert (=> d!73999 (=> (not res!265275) (not e!262376))))

(assert (=> d!73999 (= res!265275 (not (contains!2482 lt!203667 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73999 (= lt!203667 e!262380)))

(declare-fun c!55881 () Bool)

(assert (=> d!73999 (= c!55881 (bvsge from!863 (size!13610 _keys!709)))))

(assert (=> d!73999 (validMask!0 mask!1025)))

(assert (=> d!73999 (= (getCurrentListMapNoExtraKeys!1602 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!203667)))

(assert (= (and d!73999 c!55881) b!446749))

(assert (= (and d!73999 (not c!55881)) b!446750))

(assert (= (and b!446750 c!55879) b!446746))

(assert (= (and b!446750 (not c!55879)) b!446742))

(assert (= (or b!446746 b!446742) bm!29656))

(assert (= (and d!73999 res!265275) b!446747))

(assert (= (and b!446747 res!265277) b!446744))

(assert (= (and b!446744 res!265278) b!446751))

(assert (= (and b!446744 c!55880) b!446752))

(assert (= (and b!446744 (not c!55880)) b!446743))

(assert (= (and b!446752 res!265276) b!446748))

(assert (= (and b!446743 c!55878) b!446741))

(assert (= (and b!446743 (not c!55878)) b!446745))

(declare-fun b_lambda!9447 () Bool)

(assert (=> (not b_lambda!9447) (not b!446746)))

(assert (=> b!446746 t!13691))

(declare-fun b_and!18551 () Bool)

(assert (= b_and!18549 (and (=> t!13691 result!6963) b_and!18551)))

(declare-fun b_lambda!9449 () Bool)

(assert (=> (not b_lambda!9449) (not b!446748)))

(assert (=> b!446748 t!13691))

(declare-fun b_and!18553 () Bool)

(assert (= b_and!18551 (and (=> t!13691 result!6963) b_and!18553)))

(declare-fun m!431335 () Bool)

(assert (=> b!446750 m!431335))

(assert (=> b!446750 m!431335))

(declare-fun m!431337 () Bool)

(assert (=> b!446750 m!431337))

(declare-fun m!431339 () Bool)

(assert (=> bm!29656 m!431339))

(assert (=> b!446752 m!431335))

(assert (=> b!446752 m!431335))

(declare-fun m!431341 () Bool)

(assert (=> b!446752 m!431341))

(declare-fun m!431343 () Bool)

(assert (=> b!446748 m!431343))

(assert (=> b!446748 m!431315))

(assert (=> b!446748 m!431343))

(assert (=> b!446748 m!431315))

(declare-fun m!431345 () Bool)

(assert (=> b!446748 m!431345))

(assert (=> b!446748 m!431335))

(declare-fun m!431347 () Bool)

(assert (=> b!446748 m!431347))

(assert (=> b!446748 m!431335))

(declare-fun m!431349 () Bool)

(assert (=> b!446747 m!431349))

(declare-fun m!431351 () Bool)

(assert (=> d!73999 m!431351))

(assert (=> d!73999 m!431195))

(declare-fun m!431353 () Bool)

(assert (=> b!446745 m!431353))

(assert (=> b!446741 m!431339))

(assert (=> b!446751 m!431335))

(assert (=> b!446751 m!431335))

(assert (=> b!446751 m!431337))

(assert (=> b!446746 m!431343))

(declare-fun m!431355 () Bool)

(assert (=> b!446746 m!431355))

(assert (=> b!446746 m!431315))

(declare-fun m!431357 () Bool)

(assert (=> b!446746 m!431357))

(declare-fun m!431359 () Bool)

(assert (=> b!446746 m!431359))

(assert (=> b!446746 m!431343))

(assert (=> b!446746 m!431315))

(assert (=> b!446746 m!431345))

(assert (=> b!446746 m!431335))

(assert (=> b!446746 m!431357))

(declare-fun m!431361 () Bool)

(assert (=> b!446746 m!431361))

(assert (=> b!446560 d!73999))

(declare-fun mapNonEmpty!19497 () Bool)

(declare-fun mapRes!19497 () Bool)

(declare-fun tp!37533 () Bool)

(declare-fun e!262388 () Bool)

(assert (=> mapNonEmpty!19497 (= mapRes!19497 (and tp!37533 e!262388))))

(declare-fun mapKey!19497 () (_ BitVec 32))

(declare-fun mapRest!19497 () (Array (_ BitVec 32) ValueCell!5609))

(declare-fun mapValue!19497 () ValueCell!5609)

(assert (=> mapNonEmpty!19497 (= mapRest!19488 (store mapRest!19497 mapKey!19497 mapValue!19497))))

(declare-fun b!446759 () Bool)

(assert (=> b!446759 (= e!262388 tp_is_empty!11905)))

(declare-fun condMapEmpty!19497 () Bool)

(declare-fun mapDefault!19497 () ValueCell!5609)

(assert (=> mapNonEmpty!19488 (= condMapEmpty!19497 (= mapRest!19488 ((as const (Array (_ BitVec 32) ValueCell!5609)) mapDefault!19497)))))

(declare-fun e!262387 () Bool)

(assert (=> mapNonEmpty!19488 (= tp!37518 (and e!262387 mapRes!19497))))

(declare-fun b!446760 () Bool)

(assert (=> b!446760 (= e!262387 tp_is_empty!11905)))

(declare-fun mapIsEmpty!19497 () Bool)

(assert (=> mapIsEmpty!19497 mapRes!19497))

(assert (= (and mapNonEmpty!19488 condMapEmpty!19497) mapIsEmpty!19497))

(assert (= (and mapNonEmpty!19488 (not condMapEmpty!19497)) mapNonEmpty!19497))

(assert (= (and mapNonEmpty!19497 ((_ is ValueCellFull!5609) mapValue!19497)) b!446759))

(assert (= (and mapNonEmpty!19488 ((_ is ValueCellFull!5609) mapDefault!19497)) b!446760))

(declare-fun m!431363 () Bool)

(assert (=> mapNonEmpty!19497 m!431363))

(declare-fun b_lambda!9451 () Bool)

(assert (= b_lambda!9449 (or (and start!40526 b_free!10567) b_lambda!9451)))

(declare-fun b_lambda!9453 () Bool)

(assert (= b_lambda!9447 (or (and start!40526 b_free!10567) b_lambda!9453)))

(declare-fun b_lambda!9455 () Bool)

(assert (= b_lambda!9445 (or (and start!40526 b_free!10567) b_lambda!9455)))

(declare-fun b_lambda!9457 () Bool)

(assert (= b_lambda!9443 (or (and start!40526 b_free!10567) b_lambda!9457)))

(check-sat (not b!446670) (not b!446734) tp_is_empty!11905 (not b!446747) (not d!73999) (not b_lambda!9451) (not b!446741) b_and!18553 (not bm!29656) (not b!446698) (not b!446674) (not b_lambda!9455) (not b!446727) (not b!446751) (not d!73997) (not b!446733) (not bm!29651) (not b!446745) (not b_next!10567) (not bm!29652) (not bm!29647) (not b!446671) (not b_lambda!9453) (not b!446736) (not b!446737) (not b!446702) (not b!446750) (not bm!29648) (not b_lambda!9457) (not bm!29655) (not b!446732) (not b!446746) (not b!446696) (not b!446731) (not b!446682) (not b!446738) (not b!446697) (not b!446701) (not b!446752) (not b!446693) (not b!446748) (not b!446675) (not mapNonEmpty!19497))
(check-sat b_and!18553 (not b_next!10567))
