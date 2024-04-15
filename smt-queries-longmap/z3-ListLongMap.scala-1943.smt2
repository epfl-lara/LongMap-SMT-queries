; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34364 () Bool)

(assert start!34364)

(declare-fun b_free!7327 () Bool)

(declare-fun b_next!7327 () Bool)

(assert (=> start!34364 (= b_free!7327 (not b_next!7327))))

(declare-fun tp!25524 () Bool)

(declare-fun b_and!14507 () Bool)

(assert (=> start!34364 (= tp!25524 b_and!14507)))

(declare-fun b!343013 () Bool)

(declare-fun res!189634 () Bool)

(declare-fun e!210323 () Bool)

(assert (=> b!343013 (=> (not res!189634) (not e!210323))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10683 0))(
  ( (V!10684 (val!3684 Int)) )
))
(declare-datatypes ((ValueCell!3296 0))(
  ( (ValueCellFull!3296 (v!5853 V!10683)) (EmptyCell!3296) )
))
(declare-datatypes ((array!18139 0))(
  ( (array!18140 (arr!8587 (Array (_ BitVec 32) ValueCell!3296)) (size!8940 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18139)

(declare-datatypes ((array!18141 0))(
  ( (array!18142 (arr!8588 (Array (_ BitVec 32) (_ BitVec 64))) (size!8941 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18141)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!343013 (= res!189634 (and (= (size!8940 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8941 _keys!1895) (size!8940 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!343014 () Bool)

(declare-fun res!189633 () Bool)

(assert (=> b!343014 (=> (not res!189633) (not e!210323))))

(declare-datatypes ((List!4910 0))(
  ( (Nil!4907) (Cons!4906 (h!5762 (_ BitVec 64)) (t!10015 List!4910)) )
))
(declare-fun arrayNoDuplicates!0 (array!18141 (_ BitVec 32) List!4910) Bool)

(assert (=> b!343014 (= res!189633 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4907))))

(declare-fun b!343015 () Bool)

(declare-fun e!210320 () Bool)

(declare-datatypes ((SeekEntryResult!3309 0))(
  ( (MissingZero!3309 (index!15415 (_ BitVec 32))) (Found!3309 (index!15416 (_ BitVec 32))) (Intermediate!3309 (undefined!4121 Bool) (index!15417 (_ BitVec 32)) (x!34160 (_ BitVec 32))) (Undefined!3309) (MissingVacant!3309 (index!15418 (_ BitVec 32))) )
))
(declare-fun lt!162208 () SeekEntryResult!3309)

(assert (=> b!343015 (= e!210320 (and (= (select (arr!8588 _keys!1895) (index!15418 lt!162208)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)) (bvsge (size!8941 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!343016 () Bool)

(declare-fun res!189635 () Bool)

(assert (=> b!343016 (=> (not res!189635) (not e!210323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18141 (_ BitVec 32)) Bool)

(assert (=> b!343016 (= res!189635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343017 () Bool)

(declare-fun res!189636 () Bool)

(assert (=> b!343017 (=> (not res!189636) (not e!210320))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!343017 (= res!189636 (inRange!0 (index!15418 lt!162208) mask!2385))))

(declare-fun mapIsEmpty!12354 () Bool)

(declare-fun mapRes!12354 () Bool)

(assert (=> mapIsEmpty!12354 mapRes!12354))

(declare-fun res!189641 () Bool)

(assert (=> start!34364 (=> (not res!189641) (not e!210323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34364 (= res!189641 (validMask!0 mask!2385))))

(assert (=> start!34364 e!210323))

(assert (=> start!34364 true))

(declare-fun tp_is_empty!7279 () Bool)

(assert (=> start!34364 tp_is_empty!7279))

(assert (=> start!34364 tp!25524))

(declare-fun e!210318 () Bool)

(declare-fun array_inv!6386 (array!18139) Bool)

(assert (=> start!34364 (and (array_inv!6386 _values!1525) e!210318)))

(declare-fun array_inv!6387 (array!18141) Bool)

(assert (=> start!34364 (array_inv!6387 _keys!1895)))

(declare-fun b!343018 () Bool)

(declare-fun e!210319 () Bool)

(assert (=> b!343018 (= e!210319 tp_is_empty!7279)))

(declare-fun b!343019 () Bool)

(declare-fun e!210322 () Bool)

(assert (=> b!343019 (= e!210322 e!210320)))

(declare-fun res!189637 () Bool)

(assert (=> b!343019 (=> (not res!189637) (not e!210320))))

(declare-fun lt!162209 () Bool)

(assert (=> b!343019 (= res!189637 (not lt!162209))))

(declare-datatypes ((Unit!10697 0))(
  ( (Unit!10698) )
))
(declare-fun lt!162207 () Unit!10697)

(declare-fun e!210325 () Unit!10697)

(assert (=> b!343019 (= lt!162207 e!210325)))

(declare-fun c!52838 () Bool)

(assert (=> b!343019 (= c!52838 lt!162209)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!343019 (= lt!162209 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!343020 () Bool)

(declare-fun Unit!10699 () Unit!10697)

(assert (=> b!343020 (= e!210325 Unit!10699)))

(declare-fun b!343021 () Bool)

(declare-fun Unit!10700 () Unit!10697)

(assert (=> b!343021 (= e!210325 Unit!10700)))

(declare-fun zeroValue!1467 () V!10683)

(declare-fun lt!162210 () Unit!10697)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10683)

(declare-fun lemmaArrayContainsKeyThenInListMap!315 (array!18141 array!18139 (_ BitVec 32) (_ BitVec 32) V!10683 V!10683 (_ BitVec 64) (_ BitVec 32) Int) Unit!10697)

(declare-fun arrayScanForKey!0 (array!18141 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!343021 (= lt!162210 (lemmaArrayContainsKeyThenInListMap!315 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!343021 false))

(declare-fun mapNonEmpty!12354 () Bool)

(declare-fun tp!25523 () Bool)

(assert (=> mapNonEmpty!12354 (= mapRes!12354 (and tp!25523 e!210319))))

(declare-fun mapValue!12354 () ValueCell!3296)

(declare-fun mapRest!12354 () (Array (_ BitVec 32) ValueCell!3296))

(declare-fun mapKey!12354 () (_ BitVec 32))

(assert (=> mapNonEmpty!12354 (= (arr!8587 _values!1525) (store mapRest!12354 mapKey!12354 mapValue!12354))))

(declare-fun b!343022 () Bool)

(declare-fun e!210321 () Bool)

(assert (=> b!343022 (= e!210318 (and e!210321 mapRes!12354))))

(declare-fun condMapEmpty!12354 () Bool)

(declare-fun mapDefault!12354 () ValueCell!3296)

(assert (=> b!343022 (= condMapEmpty!12354 (= (arr!8587 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3296)) mapDefault!12354)))))

(declare-fun b!343023 () Bool)

(declare-fun res!189638 () Bool)

(assert (=> b!343023 (=> (not res!189638) (not e!210323))))

(declare-datatypes ((tuple2!5290 0))(
  ( (tuple2!5291 (_1!2656 (_ BitVec 64)) (_2!2656 V!10683)) )
))
(declare-datatypes ((List!4911 0))(
  ( (Nil!4908) (Cons!4907 (h!5763 tuple2!5290) (t!10016 List!4911)) )
))
(declare-datatypes ((ListLongMap!4193 0))(
  ( (ListLongMap!4194 (toList!2112 List!4911)) )
))
(declare-fun contains!2180 (ListLongMap!4193 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1618 (array!18141 array!18139 (_ BitVec 32) (_ BitVec 32) V!10683 V!10683 (_ BitVec 32) Int) ListLongMap!4193)

(assert (=> b!343023 (= res!189638 (not (contains!2180 (getCurrentListMap!1618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!343024 () Bool)

(declare-fun res!189640 () Bool)

(assert (=> b!343024 (=> (not res!189640) (not e!210323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343024 (= res!189640 (validKeyInArray!0 k0!1348))))

(declare-fun b!343025 () Bool)

(assert (=> b!343025 (= e!210323 e!210322)))

(declare-fun res!189639 () Bool)

(assert (=> b!343025 (=> (not res!189639) (not e!210322))))

(get-info :version)

(assert (=> b!343025 (= res!189639 (and (not ((_ is Found!3309) lt!162208)) (not ((_ is MissingZero!3309) lt!162208)) ((_ is MissingVacant!3309) lt!162208)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18141 (_ BitVec 32)) SeekEntryResult!3309)

(assert (=> b!343025 (= lt!162208 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343026 () Bool)

(assert (=> b!343026 (= e!210321 tp_is_empty!7279)))

(assert (= (and start!34364 res!189641) b!343013))

(assert (= (and b!343013 res!189634) b!343016))

(assert (= (and b!343016 res!189635) b!343014))

(assert (= (and b!343014 res!189633) b!343024))

(assert (= (and b!343024 res!189640) b!343023))

(assert (= (and b!343023 res!189638) b!343025))

(assert (= (and b!343025 res!189639) b!343019))

(assert (= (and b!343019 c!52838) b!343021))

(assert (= (and b!343019 (not c!52838)) b!343020))

(assert (= (and b!343019 res!189637) b!343017))

(assert (= (and b!343017 res!189636) b!343015))

(assert (= (and b!343022 condMapEmpty!12354) mapIsEmpty!12354))

(assert (= (and b!343022 (not condMapEmpty!12354)) mapNonEmpty!12354))

(assert (= (and mapNonEmpty!12354 ((_ is ValueCellFull!3296) mapValue!12354)) b!343018))

(assert (= (and b!343022 ((_ is ValueCellFull!3296) mapDefault!12354)) b!343026))

(assert (= start!34364 b!343022))

(declare-fun m!344475 () Bool)

(assert (=> b!343019 m!344475))

(declare-fun m!344477 () Bool)

(assert (=> b!343014 m!344477))

(declare-fun m!344479 () Bool)

(assert (=> b!343015 m!344479))

(declare-fun m!344481 () Bool)

(assert (=> b!343025 m!344481))

(declare-fun m!344483 () Bool)

(assert (=> b!343016 m!344483))

(declare-fun m!344485 () Bool)

(assert (=> b!343021 m!344485))

(assert (=> b!343021 m!344485))

(declare-fun m!344487 () Bool)

(assert (=> b!343021 m!344487))

(declare-fun m!344489 () Bool)

(assert (=> b!343023 m!344489))

(assert (=> b!343023 m!344489))

(declare-fun m!344491 () Bool)

(assert (=> b!343023 m!344491))

(declare-fun m!344493 () Bool)

(assert (=> b!343024 m!344493))

(declare-fun m!344495 () Bool)

(assert (=> start!34364 m!344495))

(declare-fun m!344497 () Bool)

(assert (=> start!34364 m!344497))

(declare-fun m!344499 () Bool)

(assert (=> start!34364 m!344499))

(declare-fun m!344501 () Bool)

(assert (=> mapNonEmpty!12354 m!344501))

(declare-fun m!344503 () Bool)

(assert (=> b!343017 m!344503))

(check-sat (not b!343019) (not b!343024) (not b_next!7327) (not b!343014) tp_is_empty!7279 (not b!343021) (not mapNonEmpty!12354) (not b!343016) b_and!14507 (not b!343023) (not b!343025) (not start!34364) (not b!343017))
(check-sat b_and!14507 (not b_next!7327))
(get-model)

(declare-fun b!343121 () Bool)

(declare-fun e!210385 () Bool)

(declare-fun contains!2181 (List!4910 (_ BitVec 64)) Bool)

(assert (=> b!343121 (= e!210385 (contains!2181 Nil!4907 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26621 () Bool)

(declare-fun call!26624 () Bool)

(declare-fun c!52847 () Bool)

(assert (=> bm!26621 (= call!26624 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52847 (Cons!4906 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000) Nil!4907) Nil!4907)))))

(declare-fun d!70845 () Bool)

(declare-fun res!189703 () Bool)

(declare-fun e!210384 () Bool)

(assert (=> d!70845 (=> res!189703 e!210384)))

(assert (=> d!70845 (= res!189703 (bvsge #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(assert (=> d!70845 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4907) e!210384)))

(declare-fun b!343122 () Bool)

(declare-fun e!210382 () Bool)

(assert (=> b!343122 (= e!210384 e!210382)))

(declare-fun res!189702 () Bool)

(assert (=> b!343122 (=> (not res!189702) (not e!210382))))

(assert (=> b!343122 (= res!189702 (not e!210385))))

(declare-fun res!189704 () Bool)

(assert (=> b!343122 (=> (not res!189704) (not e!210385))))

(assert (=> b!343122 (= res!189704 (validKeyInArray!0 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343123 () Bool)

(declare-fun e!210383 () Bool)

(assert (=> b!343123 (= e!210382 e!210383)))

(assert (=> b!343123 (= c!52847 (validKeyInArray!0 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343124 () Bool)

(assert (=> b!343124 (= e!210383 call!26624)))

(declare-fun b!343125 () Bool)

(assert (=> b!343125 (= e!210383 call!26624)))

(assert (= (and d!70845 (not res!189703)) b!343122))

(assert (= (and b!343122 res!189704) b!343121))

(assert (= (and b!343122 res!189702) b!343123))

(assert (= (and b!343123 c!52847) b!343125))

(assert (= (and b!343123 (not c!52847)) b!343124))

(assert (= (or b!343125 b!343124) bm!26621))

(declare-fun m!344565 () Bool)

(assert (=> b!343121 m!344565))

(assert (=> b!343121 m!344565))

(declare-fun m!344567 () Bool)

(assert (=> b!343121 m!344567))

(assert (=> bm!26621 m!344565))

(declare-fun m!344569 () Bool)

(assert (=> bm!26621 m!344569))

(assert (=> b!343122 m!344565))

(assert (=> b!343122 m!344565))

(declare-fun m!344571 () Bool)

(assert (=> b!343122 m!344571))

(assert (=> b!343123 m!344565))

(assert (=> b!343123 m!344565))

(assert (=> b!343123 m!344571))

(assert (=> b!343014 d!70845))

(declare-fun d!70847 () Bool)

(assert (=> d!70847 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!343024 d!70847))

(declare-fun d!70849 () Bool)

(declare-fun e!210390 () Bool)

(assert (=> d!70849 e!210390))

(declare-fun res!189707 () Bool)

(assert (=> d!70849 (=> res!189707 e!210390)))

(declare-fun lt!162243 () Bool)

(assert (=> d!70849 (= res!189707 (not lt!162243))))

(declare-fun lt!162245 () Bool)

(assert (=> d!70849 (= lt!162243 lt!162245)))

(declare-fun lt!162244 () Unit!10697)

(declare-fun e!210391 () Unit!10697)

(assert (=> d!70849 (= lt!162244 e!210391)))

(declare-fun c!52850 () Bool)

(assert (=> d!70849 (= c!52850 lt!162245)))

(declare-fun containsKey!327 (List!4911 (_ BitVec 64)) Bool)

(assert (=> d!70849 (= lt!162245 (containsKey!327 (toList!2112 (getCurrentListMap!1618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70849 (= (contains!2180 (getCurrentListMap!1618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!162243)))

(declare-fun b!343132 () Bool)

(declare-fun lt!162246 () Unit!10697)

(assert (=> b!343132 (= e!210391 lt!162246)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!276 (List!4911 (_ BitVec 64)) Unit!10697)

(assert (=> b!343132 (= lt!162246 (lemmaContainsKeyImpliesGetValueByKeyDefined!276 (toList!2112 (getCurrentListMap!1618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!341 0))(
  ( (Some!340 (v!5856 V!10683)) (None!339) )
))
(declare-fun isDefined!277 (Option!341) Bool)

(declare-fun getValueByKey!335 (List!4911 (_ BitVec 64)) Option!341)

(assert (=> b!343132 (isDefined!277 (getValueByKey!335 (toList!2112 (getCurrentListMap!1618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!343133 () Bool)

(declare-fun Unit!10704 () Unit!10697)

(assert (=> b!343133 (= e!210391 Unit!10704)))

(declare-fun b!343134 () Bool)

(assert (=> b!343134 (= e!210390 (isDefined!277 (getValueByKey!335 (toList!2112 (getCurrentListMap!1618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70849 c!52850) b!343132))

(assert (= (and d!70849 (not c!52850)) b!343133))

(assert (= (and d!70849 (not res!189707)) b!343134))

(declare-fun m!344573 () Bool)

(assert (=> d!70849 m!344573))

(declare-fun m!344575 () Bool)

(assert (=> b!343132 m!344575))

(declare-fun m!344577 () Bool)

(assert (=> b!343132 m!344577))

(assert (=> b!343132 m!344577))

(declare-fun m!344579 () Bool)

(assert (=> b!343132 m!344579))

(assert (=> b!343134 m!344577))

(assert (=> b!343134 m!344577))

(assert (=> b!343134 m!344579))

(assert (=> b!343023 d!70849))

(declare-fun b!343177 () Bool)

(declare-fun e!210429 () Bool)

(assert (=> b!343177 (= e!210429 (validKeyInArray!0 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26636 () Bool)

(declare-fun call!26642 () ListLongMap!4193)

(declare-fun call!26645 () ListLongMap!4193)

(assert (=> bm!26636 (= call!26642 call!26645)))

(declare-fun call!26644 () ListLongMap!4193)

(declare-fun c!52863 () Bool)

(declare-fun call!26639 () ListLongMap!4193)

(declare-fun bm!26637 () Bool)

(declare-fun c!52864 () Bool)

(declare-fun +!732 (ListLongMap!4193 tuple2!5290) ListLongMap!4193)

(assert (=> bm!26637 (= call!26639 (+!732 (ite c!52864 call!26645 (ite c!52863 call!26642 call!26644)) (ite (or c!52864 c!52863) (tuple2!5291 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!343178 () Bool)

(declare-fun e!210427 () ListLongMap!4193)

(declare-fun call!26641 () ListLongMap!4193)

(assert (=> b!343178 (= e!210427 call!26641)))

(declare-fun bm!26638 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!595 (array!18141 array!18139 (_ BitVec 32) (_ BitVec 32) V!10683 V!10683 (_ BitVec 32) Int) ListLongMap!4193)

(assert (=> bm!26638 (= call!26645 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!343179 () Bool)

(declare-fun e!210421 () ListLongMap!4193)

(assert (=> b!343179 (= e!210421 call!26644)))

(declare-fun b!343180 () Bool)

(declare-fun e!210420 () ListLongMap!4193)

(assert (=> b!343180 (= e!210420 e!210427)))

(assert (=> b!343180 (= c!52863 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!343181 () Bool)

(declare-fun e!210419 () Bool)

(declare-fun call!26640 () Bool)

(assert (=> b!343181 (= e!210419 (not call!26640))))

(declare-fun b!343182 () Bool)

(assert (=> b!343182 (= e!210420 (+!732 call!26639 (tuple2!5291 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!343183 () Bool)

(declare-fun e!210424 () Bool)

(assert (=> b!343183 (= e!210424 (validKeyInArray!0 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343184 () Bool)

(assert (=> b!343184 (= e!210421 call!26641)))

(declare-fun b!343185 () Bool)

(declare-fun e!210425 () Bool)

(declare-fun e!210423 () Bool)

(assert (=> b!343185 (= e!210425 e!210423)))

(declare-fun res!189734 () Bool)

(declare-fun call!26643 () Bool)

(assert (=> b!343185 (= res!189734 call!26643)))

(assert (=> b!343185 (=> (not res!189734) (not e!210423))))

(declare-fun d!70851 () Bool)

(declare-fun e!210426 () Bool)

(assert (=> d!70851 e!210426))

(declare-fun res!189732 () Bool)

(assert (=> d!70851 (=> (not res!189732) (not e!210426))))

(assert (=> d!70851 (= res!189732 (or (bvsge #b00000000000000000000000000000000 (size!8941 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)))))))

(declare-fun lt!162306 () ListLongMap!4193)

(declare-fun lt!162309 () ListLongMap!4193)

(assert (=> d!70851 (= lt!162306 lt!162309)))

(declare-fun lt!162293 () Unit!10697)

(declare-fun e!210422 () Unit!10697)

(assert (=> d!70851 (= lt!162293 e!210422)))

(declare-fun c!52867 () Bool)

(assert (=> d!70851 (= c!52867 e!210424)))

(declare-fun res!189730 () Bool)

(assert (=> d!70851 (=> (not res!189730) (not e!210424))))

(assert (=> d!70851 (= res!189730 (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(assert (=> d!70851 (= lt!162309 e!210420)))

(assert (=> d!70851 (= c!52864 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70851 (validMask!0 mask!2385)))

(assert (=> d!70851 (= (getCurrentListMap!1618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!162306)))

(declare-fun b!343186 () Bool)

(declare-fun e!210428 () Bool)

(declare-fun apply!279 (ListLongMap!4193 (_ BitVec 64)) V!10683)

(declare-fun get!4645 (ValueCell!3296 V!10683) V!10683)

(declare-fun dynLambda!613 (Int (_ BitVec 64)) V!10683)

(assert (=> b!343186 (= e!210428 (= (apply!279 lt!162306 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000)) (get!4645 (select (arr!8587 _values!1525) #b00000000000000000000000000000000) (dynLambda!613 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!343186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8940 _values!1525)))))

(assert (=> b!343186 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(declare-fun b!343187 () Bool)

(declare-fun res!189726 () Bool)

(assert (=> b!343187 (=> (not res!189726) (not e!210426))))

(assert (=> b!343187 (= res!189726 e!210425)))

(declare-fun c!52865 () Bool)

(assert (=> b!343187 (= c!52865 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!343188 () Bool)

(assert (=> b!343188 (= e!210425 (not call!26643))))

(declare-fun b!343189 () Bool)

(declare-fun lt!162297 () Unit!10697)

(assert (=> b!343189 (= e!210422 lt!162297)))

(declare-fun lt!162312 () ListLongMap!4193)

(assert (=> b!343189 (= lt!162312 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162296 () (_ BitVec 64))

(assert (=> b!343189 (= lt!162296 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162305 () (_ BitVec 64))

(assert (=> b!343189 (= lt!162305 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162304 () Unit!10697)

(declare-fun addStillContains!255 (ListLongMap!4193 (_ BitVec 64) V!10683 (_ BitVec 64)) Unit!10697)

(assert (=> b!343189 (= lt!162304 (addStillContains!255 lt!162312 lt!162296 zeroValue!1467 lt!162305))))

(assert (=> b!343189 (contains!2180 (+!732 lt!162312 (tuple2!5291 lt!162296 zeroValue!1467)) lt!162305)))

(declare-fun lt!162300 () Unit!10697)

(assert (=> b!343189 (= lt!162300 lt!162304)))

(declare-fun lt!162291 () ListLongMap!4193)

(assert (=> b!343189 (= lt!162291 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162294 () (_ BitVec 64))

(assert (=> b!343189 (= lt!162294 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162303 () (_ BitVec 64))

(assert (=> b!343189 (= lt!162303 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162295 () Unit!10697)

(declare-fun addApplyDifferent!255 (ListLongMap!4193 (_ BitVec 64) V!10683 (_ BitVec 64)) Unit!10697)

(assert (=> b!343189 (= lt!162295 (addApplyDifferent!255 lt!162291 lt!162294 minValue!1467 lt!162303))))

(assert (=> b!343189 (= (apply!279 (+!732 lt!162291 (tuple2!5291 lt!162294 minValue!1467)) lt!162303) (apply!279 lt!162291 lt!162303))))

(declare-fun lt!162310 () Unit!10697)

(assert (=> b!343189 (= lt!162310 lt!162295)))

(declare-fun lt!162299 () ListLongMap!4193)

(assert (=> b!343189 (= lt!162299 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162311 () (_ BitVec 64))

(assert (=> b!343189 (= lt!162311 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162298 () (_ BitVec 64))

(assert (=> b!343189 (= lt!162298 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162301 () Unit!10697)

(assert (=> b!343189 (= lt!162301 (addApplyDifferent!255 lt!162299 lt!162311 zeroValue!1467 lt!162298))))

(assert (=> b!343189 (= (apply!279 (+!732 lt!162299 (tuple2!5291 lt!162311 zeroValue!1467)) lt!162298) (apply!279 lt!162299 lt!162298))))

(declare-fun lt!162302 () Unit!10697)

(assert (=> b!343189 (= lt!162302 lt!162301)))

(declare-fun lt!162307 () ListLongMap!4193)

(assert (=> b!343189 (= lt!162307 (getCurrentListMapNoExtraKeys!595 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!162308 () (_ BitVec 64))

(assert (=> b!343189 (= lt!162308 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!162292 () (_ BitVec 64))

(assert (=> b!343189 (= lt!162292 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!343189 (= lt!162297 (addApplyDifferent!255 lt!162307 lt!162308 minValue!1467 lt!162292))))

(assert (=> b!343189 (= (apply!279 (+!732 lt!162307 (tuple2!5291 lt!162308 minValue!1467)) lt!162292) (apply!279 lt!162307 lt!162292))))

(declare-fun b!343190 () Bool)

(assert (=> b!343190 (= e!210423 (= (apply!279 lt!162306 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!343191 () Bool)

(declare-fun e!210430 () Bool)

(assert (=> b!343191 (= e!210430 e!210428)))

(declare-fun res!189727 () Bool)

(assert (=> b!343191 (=> (not res!189727) (not e!210428))))

(assert (=> b!343191 (= res!189727 (contains!2180 lt!162306 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!343191 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(declare-fun b!343192 () Bool)

(assert (=> b!343192 (= e!210426 e!210419)))

(declare-fun c!52868 () Bool)

(assert (=> b!343192 (= c!52868 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!343193 () Bool)

(declare-fun res!189733 () Bool)

(assert (=> b!343193 (=> (not res!189733) (not e!210426))))

(assert (=> b!343193 (= res!189733 e!210430)))

(declare-fun res!189728 () Bool)

(assert (=> b!343193 (=> res!189728 e!210430)))

(assert (=> b!343193 (= res!189728 (not e!210429))))

(declare-fun res!189729 () Bool)

(assert (=> b!343193 (=> (not res!189729) (not e!210429))))

(assert (=> b!343193 (= res!189729 (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(declare-fun b!343194 () Bool)

(declare-fun Unit!10705 () Unit!10697)

(assert (=> b!343194 (= e!210422 Unit!10705)))

(declare-fun bm!26639 () Bool)

(assert (=> bm!26639 (= call!26644 call!26642)))

(declare-fun b!343195 () Bool)

(declare-fun e!210418 () Bool)

(assert (=> b!343195 (= e!210418 (= (apply!279 lt!162306 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26640 () Bool)

(assert (=> bm!26640 (= call!26640 (contains!2180 lt!162306 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!343196 () Bool)

(assert (=> b!343196 (= e!210419 e!210418)))

(declare-fun res!189731 () Bool)

(assert (=> b!343196 (= res!189731 call!26640)))

(assert (=> b!343196 (=> (not res!189731) (not e!210418))))

(declare-fun bm!26641 () Bool)

(assert (=> bm!26641 (= call!26643 (contains!2180 lt!162306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26642 () Bool)

(assert (=> bm!26642 (= call!26641 call!26639)))

(declare-fun b!343197 () Bool)

(declare-fun c!52866 () Bool)

(assert (=> b!343197 (= c!52866 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!343197 (= e!210427 e!210421)))

(assert (= (and d!70851 c!52864) b!343182))

(assert (= (and d!70851 (not c!52864)) b!343180))

(assert (= (and b!343180 c!52863) b!343178))

(assert (= (and b!343180 (not c!52863)) b!343197))

(assert (= (and b!343197 c!52866) b!343184))

(assert (= (and b!343197 (not c!52866)) b!343179))

(assert (= (or b!343184 b!343179) bm!26639))

(assert (= (or b!343178 bm!26639) bm!26636))

(assert (= (or b!343178 b!343184) bm!26642))

(assert (= (or b!343182 bm!26636) bm!26638))

(assert (= (or b!343182 bm!26642) bm!26637))

(assert (= (and d!70851 res!189730) b!343183))

(assert (= (and d!70851 c!52867) b!343189))

(assert (= (and d!70851 (not c!52867)) b!343194))

(assert (= (and d!70851 res!189732) b!343193))

(assert (= (and b!343193 res!189729) b!343177))

(assert (= (and b!343193 (not res!189728)) b!343191))

(assert (= (and b!343191 res!189727) b!343186))

(assert (= (and b!343193 res!189733) b!343187))

(assert (= (and b!343187 c!52865) b!343185))

(assert (= (and b!343187 (not c!52865)) b!343188))

(assert (= (and b!343185 res!189734) b!343190))

(assert (= (or b!343185 b!343188) bm!26641))

(assert (= (and b!343187 res!189726) b!343192))

(assert (= (and b!343192 c!52868) b!343196))

(assert (= (and b!343192 (not c!52868)) b!343181))

(assert (= (and b!343196 res!189731) b!343195))

(assert (= (or b!343196 b!343181) bm!26640))

(declare-fun b_lambda!8437 () Bool)

(assert (=> (not b_lambda!8437) (not b!343186)))

(declare-fun t!10020 () Bool)

(declare-fun tb!3065 () Bool)

(assert (=> (and start!34364 (= defaultEntry!1528 defaultEntry!1528) t!10020) tb!3065))

(declare-fun result!5541 () Bool)

(assert (=> tb!3065 (= result!5541 tp_is_empty!7279)))

(assert (=> b!343186 t!10020))

(declare-fun b_and!14513 () Bool)

(assert (= b_and!14507 (and (=> t!10020 result!5541) b_and!14513)))

(declare-fun m!344581 () Bool)

(assert (=> bm!26641 m!344581))

(declare-fun m!344583 () Bool)

(assert (=> b!343195 m!344583))

(declare-fun m!344585 () Bool)

(assert (=> b!343190 m!344585))

(declare-fun m!344587 () Bool)

(assert (=> bm!26638 m!344587))

(declare-fun m!344589 () Bool)

(assert (=> bm!26640 m!344589))

(assert (=> b!343177 m!344565))

(assert (=> b!343177 m!344565))

(assert (=> b!343177 m!344571))

(declare-fun m!344591 () Bool)

(assert (=> b!343189 m!344591))

(declare-fun m!344593 () Bool)

(assert (=> b!343189 m!344593))

(declare-fun m!344595 () Bool)

(assert (=> b!343189 m!344595))

(declare-fun m!344597 () Bool)

(assert (=> b!343189 m!344597))

(declare-fun m!344599 () Bool)

(assert (=> b!343189 m!344599))

(declare-fun m!344601 () Bool)

(assert (=> b!343189 m!344601))

(declare-fun m!344603 () Bool)

(assert (=> b!343189 m!344603))

(declare-fun m!344605 () Bool)

(assert (=> b!343189 m!344605))

(declare-fun m!344607 () Bool)

(assert (=> b!343189 m!344607))

(assert (=> b!343189 m!344591))

(assert (=> b!343189 m!344601))

(assert (=> b!343189 m!344565))

(declare-fun m!344609 () Bool)

(assert (=> b!343189 m!344609))

(declare-fun m!344611 () Bool)

(assert (=> b!343189 m!344611))

(declare-fun m!344613 () Bool)

(assert (=> b!343189 m!344613))

(declare-fun m!344615 () Bool)

(assert (=> b!343189 m!344615))

(assert (=> b!343189 m!344595))

(declare-fun m!344617 () Bool)

(assert (=> b!343189 m!344617))

(assert (=> b!343189 m!344587))

(assert (=> b!343189 m!344607))

(declare-fun m!344619 () Bool)

(assert (=> b!343189 m!344619))

(assert (=> d!70851 m!344495))

(declare-fun m!344621 () Bool)

(assert (=> bm!26637 m!344621))

(declare-fun m!344623 () Bool)

(assert (=> b!343182 m!344623))

(assert (=> b!343191 m!344565))

(assert (=> b!343191 m!344565))

(declare-fun m!344625 () Bool)

(assert (=> b!343191 m!344625))

(assert (=> b!343186 m!344565))

(declare-fun m!344627 () Bool)

(assert (=> b!343186 m!344627))

(declare-fun m!344629 () Bool)

(assert (=> b!343186 m!344629))

(assert (=> b!343186 m!344565))

(declare-fun m!344631 () Bool)

(assert (=> b!343186 m!344631))

(assert (=> b!343186 m!344631))

(assert (=> b!343186 m!344629))

(declare-fun m!344633 () Bool)

(assert (=> b!343186 m!344633))

(assert (=> b!343183 m!344565))

(assert (=> b!343183 m!344565))

(assert (=> b!343183 m!344571))

(assert (=> b!343023 d!70851))

(declare-fun d!70853 () Bool)

(declare-fun res!189739 () Bool)

(declare-fun e!210435 () Bool)

(assert (=> d!70853 (=> res!189739 e!210435)))

(assert (=> d!70853 (= res!189739 (= (select (arr!8588 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70853 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!210435)))

(declare-fun b!343204 () Bool)

(declare-fun e!210436 () Bool)

(assert (=> b!343204 (= e!210435 e!210436)))

(declare-fun res!189740 () Bool)

(assert (=> b!343204 (=> (not res!189740) (not e!210436))))

(assert (=> b!343204 (= res!189740 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8941 _keys!1895)))))

(declare-fun b!343205 () Bool)

(assert (=> b!343205 (= e!210436 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70853 (not res!189739)) b!343204))

(assert (= (and b!343204 res!189740) b!343205))

(assert (=> d!70853 m!344565))

(declare-fun m!344635 () Bool)

(assert (=> b!343205 m!344635))

(assert (=> b!343019 d!70853))

(declare-fun d!70855 () Bool)

(declare-fun lt!162320 () SeekEntryResult!3309)

(assert (=> d!70855 (and (or ((_ is Undefined!3309) lt!162320) (not ((_ is Found!3309) lt!162320)) (and (bvsge (index!15416 lt!162320) #b00000000000000000000000000000000) (bvslt (index!15416 lt!162320) (size!8941 _keys!1895)))) (or ((_ is Undefined!3309) lt!162320) ((_ is Found!3309) lt!162320) (not ((_ is MissingZero!3309) lt!162320)) (and (bvsge (index!15415 lt!162320) #b00000000000000000000000000000000) (bvslt (index!15415 lt!162320) (size!8941 _keys!1895)))) (or ((_ is Undefined!3309) lt!162320) ((_ is Found!3309) lt!162320) ((_ is MissingZero!3309) lt!162320) (not ((_ is MissingVacant!3309) lt!162320)) (and (bvsge (index!15418 lt!162320) #b00000000000000000000000000000000) (bvslt (index!15418 lt!162320) (size!8941 _keys!1895)))) (or ((_ is Undefined!3309) lt!162320) (ite ((_ is Found!3309) lt!162320) (= (select (arr!8588 _keys!1895) (index!15416 lt!162320)) k0!1348) (ite ((_ is MissingZero!3309) lt!162320) (= (select (arr!8588 _keys!1895) (index!15415 lt!162320)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3309) lt!162320) (= (select (arr!8588 _keys!1895) (index!15418 lt!162320)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!210445 () SeekEntryResult!3309)

(assert (=> d!70855 (= lt!162320 e!210445)))

(declare-fun c!52875 () Bool)

(declare-fun lt!162321 () SeekEntryResult!3309)

(assert (=> d!70855 (= c!52875 (and ((_ is Intermediate!3309) lt!162321) (undefined!4121 lt!162321)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18141 (_ BitVec 32)) SeekEntryResult!3309)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70855 (= lt!162321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70855 (validMask!0 mask!2385)))

(assert (=> d!70855 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!162320)))

(declare-fun b!343218 () Bool)

(declare-fun e!210443 () SeekEntryResult!3309)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18141 (_ BitVec 32)) SeekEntryResult!3309)

(assert (=> b!343218 (= e!210443 (seekKeyOrZeroReturnVacant!0 (x!34160 lt!162321) (index!15417 lt!162321) (index!15417 lt!162321) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!343219 () Bool)

(assert (=> b!343219 (= e!210445 Undefined!3309)))

(declare-fun b!343220 () Bool)

(declare-fun e!210444 () SeekEntryResult!3309)

(assert (=> b!343220 (= e!210445 e!210444)))

(declare-fun lt!162319 () (_ BitVec 64))

(assert (=> b!343220 (= lt!162319 (select (arr!8588 _keys!1895) (index!15417 lt!162321)))))

(declare-fun c!52876 () Bool)

(assert (=> b!343220 (= c!52876 (= lt!162319 k0!1348))))

(declare-fun b!343221 () Bool)

(assert (=> b!343221 (= e!210444 (Found!3309 (index!15417 lt!162321)))))

(declare-fun b!343222 () Bool)

(assert (=> b!343222 (= e!210443 (MissingZero!3309 (index!15417 lt!162321)))))

(declare-fun b!343223 () Bool)

(declare-fun c!52877 () Bool)

(assert (=> b!343223 (= c!52877 (= lt!162319 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!343223 (= e!210444 e!210443)))

(assert (= (and d!70855 c!52875) b!343219))

(assert (= (and d!70855 (not c!52875)) b!343220))

(assert (= (and b!343220 c!52876) b!343221))

(assert (= (and b!343220 (not c!52876)) b!343223))

(assert (= (and b!343223 c!52877) b!343222))

(assert (= (and b!343223 (not c!52877)) b!343218))

(assert (=> d!70855 m!344495))

(declare-fun m!344637 () Bool)

(assert (=> d!70855 m!344637))

(declare-fun m!344639 () Bool)

(assert (=> d!70855 m!344639))

(declare-fun m!344641 () Bool)

(assert (=> d!70855 m!344641))

(assert (=> d!70855 m!344637))

(declare-fun m!344643 () Bool)

(assert (=> d!70855 m!344643))

(declare-fun m!344645 () Bool)

(assert (=> d!70855 m!344645))

(declare-fun m!344647 () Bool)

(assert (=> b!343218 m!344647))

(declare-fun m!344649 () Bool)

(assert (=> b!343220 m!344649))

(assert (=> b!343025 d!70855))

(declare-fun d!70857 () Bool)

(assert (=> d!70857 (contains!2180 (getCurrentListMap!1618 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!162324 () Unit!10697)

(declare-fun choose!1312 (array!18141 array!18139 (_ BitVec 32) (_ BitVec 32) V!10683 V!10683 (_ BitVec 64) (_ BitVec 32) Int) Unit!10697)

(assert (=> d!70857 (= lt!162324 (choose!1312 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70857 (validMask!0 mask!2385)))

(assert (=> d!70857 (= (lemmaArrayContainsKeyThenInListMap!315 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!162324)))

(declare-fun bs!11736 () Bool)

(assert (= bs!11736 d!70857))

(assert (=> bs!11736 m!344489))

(assert (=> bs!11736 m!344489))

(assert (=> bs!11736 m!344491))

(assert (=> bs!11736 m!344485))

(declare-fun m!344651 () Bool)

(assert (=> bs!11736 m!344651))

(assert (=> bs!11736 m!344495))

(assert (=> b!343021 d!70857))

(declare-fun d!70859 () Bool)

(declare-fun lt!162327 () (_ BitVec 32))

(assert (=> d!70859 (and (or (bvslt lt!162327 #b00000000000000000000000000000000) (bvsge lt!162327 (size!8941 _keys!1895)) (and (bvsge lt!162327 #b00000000000000000000000000000000) (bvslt lt!162327 (size!8941 _keys!1895)))) (bvsge lt!162327 #b00000000000000000000000000000000) (bvslt lt!162327 (size!8941 _keys!1895)) (= (select (arr!8588 _keys!1895) lt!162327) k0!1348))))

(declare-fun e!210448 () (_ BitVec 32))

(assert (=> d!70859 (= lt!162327 e!210448)))

(declare-fun c!52880 () Bool)

(assert (=> d!70859 (= c!52880 (= (select (arr!8588 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70859 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8941 _keys!1895)) (bvslt (size!8941 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70859 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!162327)))

(declare-fun b!343228 () Bool)

(assert (=> b!343228 (= e!210448 #b00000000000000000000000000000000)))

(declare-fun b!343229 () Bool)

(assert (=> b!343229 (= e!210448 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70859 c!52880) b!343228))

(assert (= (and d!70859 (not c!52880)) b!343229))

(declare-fun m!344653 () Bool)

(assert (=> d!70859 m!344653))

(assert (=> d!70859 m!344565))

(declare-fun m!344655 () Bool)

(assert (=> b!343229 m!344655))

(assert (=> b!343021 d!70859))

(declare-fun b!343238 () Bool)

(declare-fun e!210455 () Bool)

(declare-fun e!210456 () Bool)

(assert (=> b!343238 (= e!210455 e!210456)))

(declare-fun lt!162334 () (_ BitVec 64))

(assert (=> b!343238 (= lt!162334 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!162335 () Unit!10697)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18141 (_ BitVec 64) (_ BitVec 32)) Unit!10697)

(assert (=> b!343238 (= lt!162335 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!162334 #b00000000000000000000000000000000))))

(assert (=> b!343238 (arrayContainsKey!0 _keys!1895 lt!162334 #b00000000000000000000000000000000)))

(declare-fun lt!162336 () Unit!10697)

(assert (=> b!343238 (= lt!162336 lt!162335)))

(declare-fun res!189745 () Bool)

(assert (=> b!343238 (= res!189745 (= (seekEntryOrOpen!0 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3309 #b00000000000000000000000000000000)))))

(assert (=> b!343238 (=> (not res!189745) (not e!210456))))

(declare-fun d!70861 () Bool)

(declare-fun res!189746 () Bool)

(declare-fun e!210457 () Bool)

(assert (=> d!70861 (=> res!189746 e!210457)))

(assert (=> d!70861 (= res!189746 (bvsge #b00000000000000000000000000000000 (size!8941 _keys!1895)))))

(assert (=> d!70861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!210457)))

(declare-fun bm!26645 () Bool)

(declare-fun call!26648 () Bool)

(assert (=> bm!26645 (= call!26648 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!343239 () Bool)

(assert (=> b!343239 (= e!210455 call!26648)))

(declare-fun b!343240 () Bool)

(assert (=> b!343240 (= e!210457 e!210455)))

(declare-fun c!52883 () Bool)

(assert (=> b!343240 (= c!52883 (validKeyInArray!0 (select (arr!8588 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!343241 () Bool)

(assert (=> b!343241 (= e!210456 call!26648)))

(assert (= (and d!70861 (not res!189746)) b!343240))

(assert (= (and b!343240 c!52883) b!343238))

(assert (= (and b!343240 (not c!52883)) b!343239))

(assert (= (and b!343238 res!189745) b!343241))

(assert (= (or b!343241 b!343239) bm!26645))

(assert (=> b!343238 m!344565))

(declare-fun m!344657 () Bool)

(assert (=> b!343238 m!344657))

(declare-fun m!344659 () Bool)

(assert (=> b!343238 m!344659))

(assert (=> b!343238 m!344565))

(declare-fun m!344661 () Bool)

(assert (=> b!343238 m!344661))

(declare-fun m!344663 () Bool)

(assert (=> bm!26645 m!344663))

(assert (=> b!343240 m!344565))

(assert (=> b!343240 m!344565))

(assert (=> b!343240 m!344571))

(assert (=> b!343016 d!70861))

(declare-fun d!70863 () Bool)

(assert (=> d!70863 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34364 d!70863))

(declare-fun d!70865 () Bool)

(assert (=> d!70865 (= (array_inv!6386 _values!1525) (bvsge (size!8940 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34364 d!70865))

(declare-fun d!70867 () Bool)

(assert (=> d!70867 (= (array_inv!6387 _keys!1895) (bvsge (size!8941 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34364 d!70867))

(declare-fun d!70869 () Bool)

(assert (=> d!70869 (= (inRange!0 (index!15418 lt!162208) mask!2385) (and (bvsge (index!15418 lt!162208) #b00000000000000000000000000000000) (bvslt (index!15418 lt!162208) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!343017 d!70869))

(declare-fun b!343249 () Bool)

(declare-fun e!210463 () Bool)

(assert (=> b!343249 (= e!210463 tp_is_empty!7279)))

(declare-fun mapNonEmpty!12363 () Bool)

(declare-fun mapRes!12363 () Bool)

(declare-fun tp!25539 () Bool)

(declare-fun e!210462 () Bool)

(assert (=> mapNonEmpty!12363 (= mapRes!12363 (and tp!25539 e!210462))))

(declare-fun mapValue!12363 () ValueCell!3296)

(declare-fun mapRest!12363 () (Array (_ BitVec 32) ValueCell!3296))

(declare-fun mapKey!12363 () (_ BitVec 32))

(assert (=> mapNonEmpty!12363 (= mapRest!12354 (store mapRest!12363 mapKey!12363 mapValue!12363))))

(declare-fun b!343248 () Bool)

(assert (=> b!343248 (= e!210462 tp_is_empty!7279)))

(declare-fun condMapEmpty!12363 () Bool)

(declare-fun mapDefault!12363 () ValueCell!3296)

(assert (=> mapNonEmpty!12354 (= condMapEmpty!12363 (= mapRest!12354 ((as const (Array (_ BitVec 32) ValueCell!3296)) mapDefault!12363)))))

(assert (=> mapNonEmpty!12354 (= tp!25523 (and e!210463 mapRes!12363))))

(declare-fun mapIsEmpty!12363 () Bool)

(assert (=> mapIsEmpty!12363 mapRes!12363))

(assert (= (and mapNonEmpty!12354 condMapEmpty!12363) mapIsEmpty!12363))

(assert (= (and mapNonEmpty!12354 (not condMapEmpty!12363)) mapNonEmpty!12363))

(assert (= (and mapNonEmpty!12363 ((_ is ValueCellFull!3296) mapValue!12363)) b!343248))

(assert (= (and mapNonEmpty!12354 ((_ is ValueCellFull!3296) mapDefault!12363)) b!343249))

(declare-fun m!344665 () Bool)

(assert (=> mapNonEmpty!12363 m!344665))

(declare-fun b_lambda!8439 () Bool)

(assert (= b_lambda!8437 (or (and start!34364 b_free!7327) b_lambda!8439)))

(check-sat (not b!343229) b_and!14513 (not b!343195) (not b!343177) (not b!343218) (not b!343122) (not b!343190) (not b!343132) (not d!70851) (not b!343182) (not b!343121) (not bm!26641) (not b!343134) (not bm!26637) (not b!343123) (not b!343240) (not bm!26621) (not d!70855) (not d!70857) (not b!343191) (not d!70849) (not b!343238) (not b!343186) (not bm!26638) (not b_lambda!8439) (not b_next!7327) (not b!343205) tp_is_empty!7279 (not bm!26640) (not b!343183) (not mapNonEmpty!12363) (not b!343189) (not bm!26645))
(check-sat b_and!14513 (not b_next!7327))
