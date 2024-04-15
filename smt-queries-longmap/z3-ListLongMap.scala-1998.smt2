; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34902 () Bool)

(assert start!34902)

(declare-fun b_free!7657 () Bool)

(declare-fun b_next!7657 () Bool)

(assert (=> start!34902 (= b_free!7657 (not b_next!7657))))

(declare-fun tp!26544 () Bool)

(declare-fun b_and!14857 () Bool)

(assert (=> start!34902 (= tp!26544 b_and!14857)))

(declare-fun b!349429 () Bool)

(declare-fun res!193697 () Bool)

(declare-fun e!214034 () Bool)

(assert (=> b!349429 (=> (not res!193697) (not e!214034))))

(declare-datatypes ((SeekEntryResult!3429 0))(
  ( (MissingZero!3429 (index!15895 (_ BitVec 32))) (Found!3429 (index!15896 (_ BitVec 32))) (Intermediate!3429 (undefined!4241 Bool) (index!15897 (_ BitVec 32)) (x!34820 (_ BitVec 32))) (Undefined!3429) (MissingVacant!3429 (index!15898 (_ BitVec 32))) )
))
(declare-fun lt!164039 () SeekEntryResult!3429)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!349429 (= res!193697 (inRange!0 (index!15895 lt!164039) mask!2385))))

(declare-fun b!349430 () Bool)

(declare-fun res!193696 () Bool)

(declare-fun e!214037 () Bool)

(assert (=> b!349430 (=> (not res!193696) (not e!214037))))

(declare-datatypes ((V!11123 0))(
  ( (V!11124 (val!3849 Int)) )
))
(declare-datatypes ((ValueCell!3461 0))(
  ( (ValueCellFull!3461 (v!6028 V!11123)) (EmptyCell!3461) )
))
(declare-datatypes ((array!18781 0))(
  ( (array!18782 (arr!8898 (Array (_ BitVec 32) ValueCell!3461)) (size!9251 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18781)

(declare-datatypes ((array!18783 0))(
  ( (array!18784 (arr!8899 (Array (_ BitVec 32) (_ BitVec 64))) (size!9252 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18783)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!349430 (= res!193696 (and (= (size!9251 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9252 _keys!1895) (size!9251 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349431 () Bool)

(declare-fun res!193695 () Bool)

(assert (=> b!349431 (=> (not res!193695) (not e!214037))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349431 (= res!193695 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12879 () Bool)

(declare-fun mapRes!12879 () Bool)

(assert (=> mapIsEmpty!12879 mapRes!12879))

(declare-fun b!349432 () Bool)

(assert (=> b!349432 (= e!214034 (or (bvslt (index!15895 lt!164039) #b00000000000000000000000000000000) (bvsge (index!15895 lt!164039) (size!9252 _keys!1895))))))

(declare-fun b!349433 () Bool)

(declare-fun e!214036 () Bool)

(assert (=> b!349433 (= e!214036 e!214034)))

(declare-fun res!193691 () Bool)

(assert (=> b!349433 (=> (not res!193691) (not e!214034))))

(declare-fun lt!164040 () Bool)

(assert (=> b!349433 (= res!193691 (not lt!164040))))

(declare-datatypes ((Unit!10810 0))(
  ( (Unit!10811) )
))
(declare-fun lt!164038 () Unit!10810)

(declare-fun e!214035 () Unit!10810)

(assert (=> b!349433 (= lt!164038 e!214035)))

(declare-fun c!53225 () Bool)

(assert (=> b!349433 (= c!53225 lt!164040)))

(declare-fun arrayContainsKey!0 (array!18783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349433 (= lt!164040 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349434 () Bool)

(declare-fun res!193698 () Bool)

(assert (=> b!349434 (=> (not res!193698) (not e!214037))))

(declare-fun zeroValue!1467 () V!11123)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11123)

(declare-datatypes ((tuple2!5524 0))(
  ( (tuple2!5525 (_1!2773 (_ BitVec 64)) (_2!2773 V!11123)) )
))
(declare-datatypes ((List!5138 0))(
  ( (Nil!5135) (Cons!5134 (h!5990 tuple2!5524) (t!10263 List!5138)) )
))
(declare-datatypes ((ListLongMap!4427 0))(
  ( (ListLongMap!4428 (toList!2229 List!5138)) )
))
(declare-fun contains!2307 (ListLongMap!4427 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1734 (array!18783 array!18781 (_ BitVec 32) (_ BitVec 32) V!11123 V!11123 (_ BitVec 32) Int) ListLongMap!4427)

(assert (=> b!349434 (= res!193698 (not (contains!2307 (getCurrentListMap!1734 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349436 () Bool)

(declare-fun res!193690 () Bool)

(assert (=> b!349436 (=> (not res!193690) (not e!214037))))

(declare-datatypes ((List!5139 0))(
  ( (Nil!5136) (Cons!5135 (h!5991 (_ BitVec 64)) (t!10264 List!5139)) )
))
(declare-fun arrayNoDuplicates!0 (array!18783 (_ BitVec 32) List!5139) Bool)

(assert (=> b!349436 (= res!193690 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5136))))

(declare-fun mapNonEmpty!12879 () Bool)

(declare-fun tp!26543 () Bool)

(declare-fun e!214040 () Bool)

(assert (=> mapNonEmpty!12879 (= mapRes!12879 (and tp!26543 e!214040))))

(declare-fun mapValue!12879 () ValueCell!3461)

(declare-fun mapRest!12879 () (Array (_ BitVec 32) ValueCell!3461))

(declare-fun mapKey!12879 () (_ BitVec 32))

(assert (=> mapNonEmpty!12879 (= (arr!8898 _values!1525) (store mapRest!12879 mapKey!12879 mapValue!12879))))

(declare-fun b!349437 () Bool)

(declare-fun res!193692 () Bool)

(assert (=> b!349437 (=> (not res!193692) (not e!214037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18783 (_ BitVec 32)) Bool)

(assert (=> b!349437 (= res!193692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349438 () Bool)

(assert (=> b!349438 (= e!214037 e!214036)))

(declare-fun res!193693 () Bool)

(assert (=> b!349438 (=> (not res!193693) (not e!214036))))

(get-info :version)

(assert (=> b!349438 (= res!193693 (and (not ((_ is Found!3429) lt!164039)) ((_ is MissingZero!3429) lt!164039)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18783 (_ BitVec 32)) SeekEntryResult!3429)

(assert (=> b!349438 (= lt!164039 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349439 () Bool)

(declare-fun Unit!10812 () Unit!10810)

(assert (=> b!349439 (= e!214035 Unit!10812)))

(declare-fun b!349440 () Bool)

(declare-fun e!214033 () Bool)

(declare-fun tp_is_empty!7609 () Bool)

(assert (=> b!349440 (= e!214033 tp_is_empty!7609)))

(declare-fun b!349441 () Bool)

(declare-fun e!214039 () Bool)

(assert (=> b!349441 (= e!214039 (and e!214033 mapRes!12879))))

(declare-fun condMapEmpty!12879 () Bool)

(declare-fun mapDefault!12879 () ValueCell!3461)

(assert (=> b!349441 (= condMapEmpty!12879 (= (arr!8898 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3461)) mapDefault!12879)))))

(declare-fun b!349442 () Bool)

(declare-fun Unit!10813 () Unit!10810)

(assert (=> b!349442 (= e!214035 Unit!10813)))

(declare-fun lt!164037 () Unit!10810)

(declare-fun lemmaArrayContainsKeyThenInListMap!320 (array!18783 array!18781 (_ BitVec 32) (_ BitVec 32) V!11123 V!11123 (_ BitVec 64) (_ BitVec 32) Int) Unit!10810)

(declare-fun arrayScanForKey!0 (array!18783 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349442 (= lt!164037 (lemmaArrayContainsKeyThenInListMap!320 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!349442 false))

(declare-fun res!193694 () Bool)

(assert (=> start!34902 (=> (not res!193694) (not e!214037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34902 (= res!193694 (validMask!0 mask!2385))))

(assert (=> start!34902 e!214037))

(assert (=> start!34902 true))

(assert (=> start!34902 tp_is_empty!7609))

(assert (=> start!34902 tp!26544))

(declare-fun array_inv!6598 (array!18781) Bool)

(assert (=> start!34902 (and (array_inv!6598 _values!1525) e!214039)))

(declare-fun array_inv!6599 (array!18783) Bool)

(assert (=> start!34902 (array_inv!6599 _keys!1895)))

(declare-fun b!349435 () Bool)

(assert (=> b!349435 (= e!214040 tp_is_empty!7609)))

(assert (= (and start!34902 res!193694) b!349430))

(assert (= (and b!349430 res!193696) b!349437))

(assert (= (and b!349437 res!193692) b!349436))

(assert (= (and b!349436 res!193690) b!349431))

(assert (= (and b!349431 res!193695) b!349434))

(assert (= (and b!349434 res!193698) b!349438))

(assert (= (and b!349438 res!193693) b!349433))

(assert (= (and b!349433 c!53225) b!349442))

(assert (= (and b!349433 (not c!53225)) b!349439))

(assert (= (and b!349433 res!193691) b!349429))

(assert (= (and b!349429 res!193697) b!349432))

(assert (= (and b!349441 condMapEmpty!12879) mapIsEmpty!12879))

(assert (= (and b!349441 (not condMapEmpty!12879)) mapNonEmpty!12879))

(assert (= (and mapNonEmpty!12879 ((_ is ValueCellFull!3461) mapValue!12879)) b!349435))

(assert (= (and b!349441 ((_ is ValueCellFull!3461) mapDefault!12879)) b!349440))

(assert (= start!34902 b!349441))

(declare-fun m!349401 () Bool)

(assert (=> b!349431 m!349401))

(declare-fun m!349403 () Bool)

(assert (=> b!349436 m!349403))

(declare-fun m!349405 () Bool)

(assert (=> start!34902 m!349405))

(declare-fun m!349407 () Bool)

(assert (=> start!34902 m!349407))

(declare-fun m!349409 () Bool)

(assert (=> start!34902 m!349409))

(declare-fun m!349411 () Bool)

(assert (=> b!349438 m!349411))

(declare-fun m!349413 () Bool)

(assert (=> b!349434 m!349413))

(assert (=> b!349434 m!349413))

(declare-fun m!349415 () Bool)

(assert (=> b!349434 m!349415))

(declare-fun m!349417 () Bool)

(assert (=> b!349433 m!349417))

(declare-fun m!349419 () Bool)

(assert (=> b!349437 m!349419))

(declare-fun m!349421 () Bool)

(assert (=> b!349429 m!349421))

(declare-fun m!349423 () Bool)

(assert (=> mapNonEmpty!12879 m!349423))

(declare-fun m!349425 () Bool)

(assert (=> b!349442 m!349425))

(assert (=> b!349442 m!349425))

(declare-fun m!349427 () Bool)

(assert (=> b!349442 m!349427))

(check-sat (not b!349437) (not start!34902) b_and!14857 tp_is_empty!7609 (not mapNonEmpty!12879) (not b!349434) (not b!349436) (not b_next!7657) (not b!349433) (not b!349431) (not b!349442) (not b!349429) (not b!349438))
(check-sat b_and!14857 (not b_next!7657))
(get-model)

(declare-fun d!71167 () Bool)

(assert (=> d!71167 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349431 d!71167))

(declare-fun d!71169 () Bool)

(assert (=> d!71169 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34902 d!71169))

(declare-fun d!71171 () Bool)

(assert (=> d!71171 (= (array_inv!6598 _values!1525) (bvsge (size!9251 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34902 d!71171))

(declare-fun d!71173 () Bool)

(assert (=> d!71173 (= (array_inv!6599 _keys!1895) (bvsge (size!9252 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34902 d!71173))

(declare-fun b!349537 () Bool)

(declare-fun e!214099 () Bool)

(declare-fun e!214098 () Bool)

(assert (=> b!349537 (= e!214099 e!214098)))

(declare-fun res!193761 () Bool)

(assert (=> b!349537 (=> (not res!193761) (not e!214098))))

(declare-fun e!214100 () Bool)

(assert (=> b!349537 (= res!193761 (not e!214100))))

(declare-fun res!193759 () Bool)

(assert (=> b!349537 (=> (not res!193759) (not e!214100))))

(assert (=> b!349537 (= res!193759 (validKeyInArray!0 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26891 () Bool)

(declare-fun call!26894 () Bool)

(declare-fun c!53234 () Bool)

(assert (=> bm!26891 (= call!26894 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53234 (Cons!5135 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000) Nil!5136) Nil!5136)))))

(declare-fun b!349538 () Bool)

(declare-fun e!214097 () Bool)

(assert (=> b!349538 (= e!214097 call!26894)))

(declare-fun d!71175 () Bool)

(declare-fun res!193760 () Bool)

(assert (=> d!71175 (=> res!193760 e!214099)))

(assert (=> d!71175 (= res!193760 (bvsge #b00000000000000000000000000000000 (size!9252 _keys!1895)))))

(assert (=> d!71175 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5136) e!214099)))

(declare-fun b!349539 () Bool)

(assert (=> b!349539 (= e!214098 e!214097)))

(assert (=> b!349539 (= c!53234 (validKeyInArray!0 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349540 () Bool)

(declare-fun contains!2308 (List!5139 (_ BitVec 64)) Bool)

(assert (=> b!349540 (= e!214100 (contains!2308 Nil!5136 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349541 () Bool)

(assert (=> b!349541 (= e!214097 call!26894)))

(assert (= (and d!71175 (not res!193760)) b!349537))

(assert (= (and b!349537 res!193759) b!349540))

(assert (= (and b!349537 res!193761) b!349539))

(assert (= (and b!349539 c!53234) b!349538))

(assert (= (and b!349539 (not c!53234)) b!349541))

(assert (= (or b!349538 b!349541) bm!26891))

(declare-fun m!349485 () Bool)

(assert (=> b!349537 m!349485))

(assert (=> b!349537 m!349485))

(declare-fun m!349487 () Bool)

(assert (=> b!349537 m!349487))

(assert (=> bm!26891 m!349485))

(declare-fun m!349489 () Bool)

(assert (=> bm!26891 m!349489))

(assert (=> b!349539 m!349485))

(assert (=> b!349539 m!349485))

(assert (=> b!349539 m!349487))

(assert (=> b!349540 m!349485))

(assert (=> b!349540 m!349485))

(declare-fun m!349491 () Bool)

(assert (=> b!349540 m!349491))

(assert (=> b!349436 d!71175))

(declare-fun d!71177 () Bool)

(assert (=> d!71177 (contains!2307 (getCurrentListMap!1734 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!164067 () Unit!10810)

(declare-fun choose!1313 (array!18783 array!18781 (_ BitVec 32) (_ BitVec 32) V!11123 V!11123 (_ BitVec 64) (_ BitVec 32) Int) Unit!10810)

(assert (=> d!71177 (= lt!164067 (choose!1313 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71177 (validMask!0 mask!2385)))

(assert (=> d!71177 (= (lemmaArrayContainsKeyThenInListMap!320 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!164067)))

(declare-fun bs!11903 () Bool)

(assert (= bs!11903 d!71177))

(assert (=> bs!11903 m!349413))

(assert (=> bs!11903 m!349413))

(assert (=> bs!11903 m!349415))

(assert (=> bs!11903 m!349425))

(declare-fun m!349493 () Bool)

(assert (=> bs!11903 m!349493))

(assert (=> bs!11903 m!349405))

(assert (=> b!349442 d!71177))

(declare-fun d!71179 () Bool)

(declare-fun lt!164070 () (_ BitVec 32))

(assert (=> d!71179 (and (or (bvslt lt!164070 #b00000000000000000000000000000000) (bvsge lt!164070 (size!9252 _keys!1895)) (and (bvsge lt!164070 #b00000000000000000000000000000000) (bvslt lt!164070 (size!9252 _keys!1895)))) (bvsge lt!164070 #b00000000000000000000000000000000) (bvslt lt!164070 (size!9252 _keys!1895)) (= (select (arr!8899 _keys!1895) lt!164070) k0!1348))))

(declare-fun e!214103 () (_ BitVec 32))

(assert (=> d!71179 (= lt!164070 e!214103)))

(declare-fun c!53237 () Bool)

(assert (=> d!71179 (= c!53237 (= (select (arr!8899 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71179 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9252 _keys!1895)) (bvslt (size!9252 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71179 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164070)))

(declare-fun b!349546 () Bool)

(assert (=> b!349546 (= e!214103 #b00000000000000000000000000000000)))

(declare-fun b!349547 () Bool)

(assert (=> b!349547 (= e!214103 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71179 c!53237) b!349546))

(assert (= (and d!71179 (not c!53237)) b!349547))

(declare-fun m!349495 () Bool)

(assert (=> d!71179 m!349495))

(assert (=> d!71179 m!349485))

(declare-fun m!349497 () Bool)

(assert (=> b!349547 m!349497))

(assert (=> b!349442 d!71179))

(declare-fun d!71181 () Bool)

(declare-fun res!193766 () Bool)

(declare-fun e!214108 () Bool)

(assert (=> d!71181 (=> res!193766 e!214108)))

(assert (=> d!71181 (= res!193766 (= (select (arr!8899 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71181 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!214108)))

(declare-fun b!349552 () Bool)

(declare-fun e!214109 () Bool)

(assert (=> b!349552 (= e!214108 e!214109)))

(declare-fun res!193767 () Bool)

(assert (=> b!349552 (=> (not res!193767) (not e!214109))))

(assert (=> b!349552 (= res!193767 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9252 _keys!1895)))))

(declare-fun b!349553 () Bool)

(assert (=> b!349553 (= e!214109 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71181 (not res!193766)) b!349552))

(assert (= (and b!349552 res!193767) b!349553))

(assert (=> d!71181 m!349485))

(declare-fun m!349499 () Bool)

(assert (=> b!349553 m!349499))

(assert (=> b!349433 d!71181))

(declare-fun b!349562 () Bool)

(declare-fun e!214117 () Bool)

(declare-fun call!26897 () Bool)

(assert (=> b!349562 (= e!214117 call!26897)))

(declare-fun b!349563 () Bool)

(declare-fun e!214116 () Bool)

(declare-fun e!214118 () Bool)

(assert (=> b!349563 (= e!214116 e!214118)))

(declare-fun c!53240 () Bool)

(assert (=> b!349563 (= c!53240 (validKeyInArray!0 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349564 () Bool)

(assert (=> b!349564 (= e!214118 call!26897)))

(declare-fun b!349565 () Bool)

(assert (=> b!349565 (= e!214118 e!214117)))

(declare-fun lt!164078 () (_ BitVec 64))

(assert (=> b!349565 (= lt!164078 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164079 () Unit!10810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18783 (_ BitVec 64) (_ BitVec 32)) Unit!10810)

(assert (=> b!349565 (= lt!164079 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164078 #b00000000000000000000000000000000))))

(assert (=> b!349565 (arrayContainsKey!0 _keys!1895 lt!164078 #b00000000000000000000000000000000)))

(declare-fun lt!164077 () Unit!10810)

(assert (=> b!349565 (= lt!164077 lt!164079)))

(declare-fun res!193772 () Bool)

(assert (=> b!349565 (= res!193772 (= (seekEntryOrOpen!0 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3429 #b00000000000000000000000000000000)))))

(assert (=> b!349565 (=> (not res!193772) (not e!214117))))

(declare-fun d!71183 () Bool)

(declare-fun res!193773 () Bool)

(assert (=> d!71183 (=> res!193773 e!214116)))

(assert (=> d!71183 (= res!193773 (bvsge #b00000000000000000000000000000000 (size!9252 _keys!1895)))))

(assert (=> d!71183 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!214116)))

(declare-fun bm!26894 () Bool)

(assert (=> bm!26894 (= call!26897 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!71183 (not res!193773)) b!349563))

(assert (= (and b!349563 c!53240) b!349565))

(assert (= (and b!349563 (not c!53240)) b!349564))

(assert (= (and b!349565 res!193772) b!349562))

(assert (= (or b!349562 b!349564) bm!26894))

(assert (=> b!349563 m!349485))

(assert (=> b!349563 m!349485))

(assert (=> b!349563 m!349487))

(assert (=> b!349565 m!349485))

(declare-fun m!349501 () Bool)

(assert (=> b!349565 m!349501))

(declare-fun m!349503 () Bool)

(assert (=> b!349565 m!349503))

(assert (=> b!349565 m!349485))

(declare-fun m!349505 () Bool)

(assert (=> b!349565 m!349505))

(declare-fun m!349507 () Bool)

(assert (=> bm!26894 m!349507))

(assert (=> b!349437 d!71183))

(declare-fun b!349578 () Bool)

(declare-fun e!214125 () SeekEntryResult!3429)

(declare-fun lt!164086 () SeekEntryResult!3429)

(assert (=> b!349578 (= e!214125 (Found!3429 (index!15897 lt!164086)))))

(declare-fun b!349579 () Bool)

(declare-fun e!214127 () SeekEntryResult!3429)

(assert (=> b!349579 (= e!214127 e!214125)))

(declare-fun lt!164087 () (_ BitVec 64))

(assert (=> b!349579 (= lt!164087 (select (arr!8899 _keys!1895) (index!15897 lt!164086)))))

(declare-fun c!53249 () Bool)

(assert (=> b!349579 (= c!53249 (= lt!164087 k0!1348))))

(declare-fun b!349580 () Bool)

(declare-fun e!214126 () SeekEntryResult!3429)

(assert (=> b!349580 (= e!214126 (MissingZero!3429 (index!15897 lt!164086)))))

(declare-fun d!71185 () Bool)

(declare-fun lt!164088 () SeekEntryResult!3429)

(assert (=> d!71185 (and (or ((_ is Undefined!3429) lt!164088) (not ((_ is Found!3429) lt!164088)) (and (bvsge (index!15896 lt!164088) #b00000000000000000000000000000000) (bvslt (index!15896 lt!164088) (size!9252 _keys!1895)))) (or ((_ is Undefined!3429) lt!164088) ((_ is Found!3429) lt!164088) (not ((_ is MissingZero!3429) lt!164088)) (and (bvsge (index!15895 lt!164088) #b00000000000000000000000000000000) (bvslt (index!15895 lt!164088) (size!9252 _keys!1895)))) (or ((_ is Undefined!3429) lt!164088) ((_ is Found!3429) lt!164088) ((_ is MissingZero!3429) lt!164088) (not ((_ is MissingVacant!3429) lt!164088)) (and (bvsge (index!15898 lt!164088) #b00000000000000000000000000000000) (bvslt (index!15898 lt!164088) (size!9252 _keys!1895)))) (or ((_ is Undefined!3429) lt!164088) (ite ((_ is Found!3429) lt!164088) (= (select (arr!8899 _keys!1895) (index!15896 lt!164088)) k0!1348) (ite ((_ is MissingZero!3429) lt!164088) (= (select (arr!8899 _keys!1895) (index!15895 lt!164088)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3429) lt!164088) (= (select (arr!8899 _keys!1895) (index!15898 lt!164088)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71185 (= lt!164088 e!214127)))

(declare-fun c!53247 () Bool)

(assert (=> d!71185 (= c!53247 (and ((_ is Intermediate!3429) lt!164086) (undefined!4241 lt!164086)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18783 (_ BitVec 32)) SeekEntryResult!3429)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71185 (= lt!164086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71185 (validMask!0 mask!2385)))

(assert (=> d!71185 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164088)))

(declare-fun b!349581 () Bool)

(declare-fun c!53248 () Bool)

(assert (=> b!349581 (= c!53248 (= lt!164087 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!349581 (= e!214125 e!214126)))

(declare-fun b!349582 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18783 (_ BitVec 32)) SeekEntryResult!3429)

(assert (=> b!349582 (= e!214126 (seekKeyOrZeroReturnVacant!0 (x!34820 lt!164086) (index!15897 lt!164086) (index!15897 lt!164086) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349583 () Bool)

(assert (=> b!349583 (= e!214127 Undefined!3429)))

(assert (= (and d!71185 c!53247) b!349583))

(assert (= (and d!71185 (not c!53247)) b!349579))

(assert (= (and b!349579 c!53249) b!349578))

(assert (= (and b!349579 (not c!53249)) b!349581))

(assert (= (and b!349581 c!53248) b!349580))

(assert (= (and b!349581 (not c!53248)) b!349582))

(declare-fun m!349509 () Bool)

(assert (=> b!349579 m!349509))

(assert (=> d!71185 m!349405))

(declare-fun m!349511 () Bool)

(assert (=> d!71185 m!349511))

(declare-fun m!349513 () Bool)

(assert (=> d!71185 m!349513))

(declare-fun m!349515 () Bool)

(assert (=> d!71185 m!349515))

(declare-fun m!349517 () Bool)

(assert (=> d!71185 m!349517))

(declare-fun m!349519 () Bool)

(assert (=> d!71185 m!349519))

(assert (=> d!71185 m!349513))

(declare-fun m!349521 () Bool)

(assert (=> b!349582 m!349521))

(assert (=> b!349438 d!71185))

(declare-fun d!71187 () Bool)

(assert (=> d!71187 (= (inRange!0 (index!15895 lt!164039) mask!2385) (and (bvsge (index!15895 lt!164039) #b00000000000000000000000000000000) (bvslt (index!15895 lt!164039) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!349429 d!71187))

(declare-fun d!71189 () Bool)

(declare-fun e!214132 () Bool)

(assert (=> d!71189 e!214132))

(declare-fun res!193776 () Bool)

(assert (=> d!71189 (=> res!193776 e!214132)))

(declare-fun lt!164097 () Bool)

(assert (=> d!71189 (= res!193776 (not lt!164097))))

(declare-fun lt!164098 () Bool)

(assert (=> d!71189 (= lt!164097 lt!164098)))

(declare-fun lt!164100 () Unit!10810)

(declare-fun e!214133 () Unit!10810)

(assert (=> d!71189 (= lt!164100 e!214133)))

(declare-fun c!53252 () Bool)

(assert (=> d!71189 (= c!53252 lt!164098)))

(declare-fun containsKey!337 (List!5138 (_ BitVec 64)) Bool)

(assert (=> d!71189 (= lt!164098 (containsKey!337 (toList!2229 (getCurrentListMap!1734 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71189 (= (contains!2307 (getCurrentListMap!1734 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164097)))

(declare-fun b!349590 () Bool)

(declare-fun lt!164099 () Unit!10810)

(assert (=> b!349590 (= e!214133 lt!164099)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!286 (List!5138 (_ BitVec 64)) Unit!10810)

(assert (=> b!349590 (= lt!164099 (lemmaContainsKeyImpliesGetValueByKeyDefined!286 (toList!2229 (getCurrentListMap!1734 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!351 0))(
  ( (Some!350 (v!6031 V!11123)) (None!349) )
))
(declare-fun isDefined!287 (Option!351) Bool)

(declare-fun getValueByKey!345 (List!5138 (_ BitVec 64)) Option!351)

(assert (=> b!349590 (isDefined!287 (getValueByKey!345 (toList!2229 (getCurrentListMap!1734 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!349591 () Bool)

(declare-fun Unit!10821 () Unit!10810)

(assert (=> b!349591 (= e!214133 Unit!10821)))

(declare-fun b!349592 () Bool)

(assert (=> b!349592 (= e!214132 (isDefined!287 (getValueByKey!345 (toList!2229 (getCurrentListMap!1734 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71189 c!53252) b!349590))

(assert (= (and d!71189 (not c!53252)) b!349591))

(assert (= (and d!71189 (not res!193776)) b!349592))

(declare-fun m!349523 () Bool)

(assert (=> d!71189 m!349523))

(declare-fun m!349525 () Bool)

(assert (=> b!349590 m!349525))

(declare-fun m!349527 () Bool)

(assert (=> b!349590 m!349527))

(assert (=> b!349590 m!349527))

(declare-fun m!349529 () Bool)

(assert (=> b!349590 m!349529))

(assert (=> b!349592 m!349527))

(assert (=> b!349592 m!349527))

(assert (=> b!349592 m!349529))

(assert (=> b!349434 d!71189))

(declare-fun bm!26909 () Bool)

(declare-fun call!26918 () ListLongMap!4427)

(declare-fun call!26915 () ListLongMap!4427)

(assert (=> bm!26909 (= call!26918 call!26915)))

(declare-fun b!349635 () Bool)

(declare-fun e!214163 () Bool)

(assert (=> b!349635 (= e!214163 (validKeyInArray!0 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349636 () Bool)

(declare-fun e!214169 () ListLongMap!4427)

(assert (=> b!349636 (= e!214169 call!26918)))

(declare-fun b!349637 () Bool)

(declare-fun e!214168 () ListLongMap!4427)

(declare-fun e!214166 () ListLongMap!4427)

(assert (=> b!349637 (= e!214168 e!214166)))

(declare-fun c!53270 () Bool)

(assert (=> b!349637 (= c!53270 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26910 () Bool)

(declare-fun call!26917 () Bool)

(declare-fun lt!164148 () ListLongMap!4427)

(assert (=> bm!26910 (= call!26917 (contains!2307 lt!164148 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!349638 () Bool)

(declare-fun e!214171 () Bool)

(declare-fun e!214167 () Bool)

(assert (=> b!349638 (= e!214171 e!214167)))

(declare-fun res!193800 () Bool)

(assert (=> b!349638 (= res!193800 call!26917)))

(assert (=> b!349638 (=> (not res!193800) (not e!214167))))

(declare-fun b!349639 () Bool)

(declare-fun e!214162 () Bool)

(declare-fun e!214165 () Bool)

(assert (=> b!349639 (= e!214162 e!214165)))

(declare-fun c!53267 () Bool)

(assert (=> b!349639 (= c!53267 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349640 () Bool)

(declare-fun e!214164 () Unit!10810)

(declare-fun lt!164150 () Unit!10810)

(assert (=> b!349640 (= e!214164 lt!164150)))

(declare-fun lt!164163 () ListLongMap!4427)

(declare-fun getCurrentListMapNoExtraKeys!605 (array!18783 array!18781 (_ BitVec 32) (_ BitVec 32) V!11123 V!11123 (_ BitVec 32) Int) ListLongMap!4427)

(assert (=> b!349640 (= lt!164163 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164165 () (_ BitVec 64))

(assert (=> b!349640 (= lt!164165 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164145 () (_ BitVec 64))

(assert (=> b!349640 (= lt!164145 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164166 () Unit!10810)

(declare-fun addStillContains!265 (ListLongMap!4427 (_ BitVec 64) V!11123 (_ BitVec 64)) Unit!10810)

(assert (=> b!349640 (= lt!164166 (addStillContains!265 lt!164163 lt!164165 zeroValue!1467 lt!164145))))

(declare-fun +!742 (ListLongMap!4427 tuple2!5524) ListLongMap!4427)

(assert (=> b!349640 (contains!2307 (+!742 lt!164163 (tuple2!5525 lt!164165 zeroValue!1467)) lt!164145)))

(declare-fun lt!164160 () Unit!10810)

(assert (=> b!349640 (= lt!164160 lt!164166)))

(declare-fun lt!164162 () ListLongMap!4427)

(assert (=> b!349640 (= lt!164162 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164156 () (_ BitVec 64))

(assert (=> b!349640 (= lt!164156 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164152 () (_ BitVec 64))

(assert (=> b!349640 (= lt!164152 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164159 () Unit!10810)

(declare-fun addApplyDifferent!265 (ListLongMap!4427 (_ BitVec 64) V!11123 (_ BitVec 64)) Unit!10810)

(assert (=> b!349640 (= lt!164159 (addApplyDifferent!265 lt!164162 lt!164156 minValue!1467 lt!164152))))

(declare-fun apply!289 (ListLongMap!4427 (_ BitVec 64)) V!11123)

(assert (=> b!349640 (= (apply!289 (+!742 lt!164162 (tuple2!5525 lt!164156 minValue!1467)) lt!164152) (apply!289 lt!164162 lt!164152))))

(declare-fun lt!164151 () Unit!10810)

(assert (=> b!349640 (= lt!164151 lt!164159)))

(declare-fun lt!164147 () ListLongMap!4427)

(assert (=> b!349640 (= lt!164147 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164149 () (_ BitVec 64))

(assert (=> b!349640 (= lt!164149 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164158 () (_ BitVec 64))

(assert (=> b!349640 (= lt!164158 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164155 () Unit!10810)

(assert (=> b!349640 (= lt!164155 (addApplyDifferent!265 lt!164147 lt!164149 zeroValue!1467 lt!164158))))

(assert (=> b!349640 (= (apply!289 (+!742 lt!164147 (tuple2!5525 lt!164149 zeroValue!1467)) lt!164158) (apply!289 lt!164147 lt!164158))))

(declare-fun lt!164164 () Unit!10810)

(assert (=> b!349640 (= lt!164164 lt!164155)))

(declare-fun lt!164154 () ListLongMap!4427)

(assert (=> b!349640 (= lt!164154 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164146 () (_ BitVec 64))

(assert (=> b!349640 (= lt!164146 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164153 () (_ BitVec 64))

(assert (=> b!349640 (= lt!164153 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!349640 (= lt!164150 (addApplyDifferent!265 lt!164154 lt!164146 minValue!1467 lt!164153))))

(assert (=> b!349640 (= (apply!289 (+!742 lt!164154 (tuple2!5525 lt!164146 minValue!1467)) lt!164153) (apply!289 lt!164154 lt!164153))))

(declare-fun b!349641 () Bool)

(declare-fun res!193798 () Bool)

(assert (=> b!349641 (=> (not res!193798) (not e!214162))))

(declare-fun e!214172 () Bool)

(assert (=> b!349641 (= res!193798 e!214172)))

(declare-fun res!193801 () Bool)

(assert (=> b!349641 (=> res!193801 e!214172)))

(assert (=> b!349641 (= res!193801 (not e!214163))))

(declare-fun res!193797 () Bool)

(assert (=> b!349641 (=> (not res!193797) (not e!214163))))

(assert (=> b!349641 (= res!193797 (bvslt #b00000000000000000000000000000000 (size!9252 _keys!1895)))))

(declare-fun b!349642 () Bool)

(declare-fun e!214160 () Bool)

(assert (=> b!349642 (= e!214172 e!214160)))

(declare-fun res!193795 () Bool)

(assert (=> b!349642 (=> (not res!193795) (not e!214160))))

(assert (=> b!349642 (= res!193795 (contains!2307 lt!164148 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!349642 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9252 _keys!1895)))))

(declare-fun b!349643 () Bool)

(declare-fun e!214161 () Bool)

(assert (=> b!349643 (= e!214165 e!214161)))

(declare-fun res!193803 () Bool)

(declare-fun call!26912 () Bool)

(assert (=> b!349643 (= res!193803 call!26912)))

(assert (=> b!349643 (=> (not res!193803) (not e!214161))))

(declare-fun b!349644 () Bool)

(declare-fun get!4765 (ValueCell!3461 V!11123) V!11123)

(declare-fun dynLambda!623 (Int (_ BitVec 64)) V!11123)

(assert (=> b!349644 (= e!214160 (= (apply!289 lt!164148 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000)) (get!4765 (select (arr!8898 _values!1525) #b00000000000000000000000000000000) (dynLambda!623 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349644 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9251 _values!1525)))))

(assert (=> b!349644 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9252 _keys!1895)))))

(declare-fun bm!26911 () Bool)

(declare-fun call!26916 () ListLongMap!4427)

(declare-fun call!26914 () ListLongMap!4427)

(assert (=> bm!26911 (= call!26916 call!26914)))

(declare-fun b!349645 () Bool)

(declare-fun c!53266 () Bool)

(assert (=> b!349645 (= c!53266 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!349645 (= e!214166 e!214169)))

(declare-fun b!349646 () Bool)

(assert (=> b!349646 (= e!214161 (= (apply!289 lt!164148 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26912 () Bool)

(assert (=> bm!26912 (= call!26914 (getCurrentListMapNoExtraKeys!605 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun d!71191 () Bool)

(assert (=> d!71191 e!214162))

(declare-fun res!193802 () Bool)

(assert (=> d!71191 (=> (not res!193802) (not e!214162))))

(assert (=> d!71191 (= res!193802 (or (bvsge #b00000000000000000000000000000000 (size!9252 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9252 _keys!1895)))))))

(declare-fun lt!164161 () ListLongMap!4427)

(assert (=> d!71191 (= lt!164148 lt!164161)))

(declare-fun lt!164157 () Unit!10810)

(assert (=> d!71191 (= lt!164157 e!214164)))

(declare-fun c!53268 () Bool)

(declare-fun e!214170 () Bool)

(assert (=> d!71191 (= c!53268 e!214170)))

(declare-fun res!193799 () Bool)

(assert (=> d!71191 (=> (not res!193799) (not e!214170))))

(assert (=> d!71191 (= res!193799 (bvslt #b00000000000000000000000000000000 (size!9252 _keys!1895)))))

(assert (=> d!71191 (= lt!164161 e!214168)))

(declare-fun c!53269 () Bool)

(assert (=> d!71191 (= c!53269 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71191 (validMask!0 mask!2385)))

(assert (=> d!71191 (= (getCurrentListMap!1734 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164148)))

(declare-fun call!26913 () ListLongMap!4427)

(declare-fun bm!26913 () Bool)

(assert (=> bm!26913 (= call!26915 (+!742 (ite c!53269 call!26914 (ite c!53270 call!26916 call!26913)) (ite (or c!53269 c!53270) (tuple2!5525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!349647 () Bool)

(assert (=> b!349647 (= e!214168 (+!742 call!26915 (tuple2!5525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!349648 () Bool)

(declare-fun Unit!10822 () Unit!10810)

(assert (=> b!349648 (= e!214164 Unit!10822)))

(declare-fun b!349649 () Bool)

(assert (=> b!349649 (= e!214165 (not call!26912))))

(declare-fun b!349650 () Bool)

(assert (=> b!349650 (= e!214166 call!26918)))

(declare-fun b!349651 () Bool)

(assert (=> b!349651 (= e!214167 (= (apply!289 lt!164148 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!349652 () Bool)

(declare-fun res!193796 () Bool)

(assert (=> b!349652 (=> (not res!193796) (not e!214162))))

(assert (=> b!349652 (= res!193796 e!214171)))

(declare-fun c!53265 () Bool)

(assert (=> b!349652 (= c!53265 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!349653 () Bool)

(assert (=> b!349653 (= e!214169 call!26913)))

(declare-fun b!349654 () Bool)

(assert (=> b!349654 (= e!214170 (validKeyInArray!0 (select (arr!8899 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26914 () Bool)

(assert (=> bm!26914 (= call!26913 call!26916)))

(declare-fun b!349655 () Bool)

(assert (=> b!349655 (= e!214171 (not call!26917))))

(declare-fun bm!26915 () Bool)

(assert (=> bm!26915 (= call!26912 (contains!2307 lt!164148 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71191 c!53269) b!349647))

(assert (= (and d!71191 (not c!53269)) b!349637))

(assert (= (and b!349637 c!53270) b!349650))

(assert (= (and b!349637 (not c!53270)) b!349645))

(assert (= (and b!349645 c!53266) b!349636))

(assert (= (and b!349645 (not c!53266)) b!349653))

(assert (= (or b!349636 b!349653) bm!26914))

(assert (= (or b!349650 bm!26914) bm!26911))

(assert (= (or b!349650 b!349636) bm!26909))

(assert (= (or b!349647 bm!26911) bm!26912))

(assert (= (or b!349647 bm!26909) bm!26913))

(assert (= (and d!71191 res!193799) b!349654))

(assert (= (and d!71191 c!53268) b!349640))

(assert (= (and d!71191 (not c!53268)) b!349648))

(assert (= (and d!71191 res!193802) b!349641))

(assert (= (and b!349641 res!193797) b!349635))

(assert (= (and b!349641 (not res!193801)) b!349642))

(assert (= (and b!349642 res!193795) b!349644))

(assert (= (and b!349641 res!193798) b!349652))

(assert (= (and b!349652 c!53265) b!349638))

(assert (= (and b!349652 (not c!53265)) b!349655))

(assert (= (and b!349638 res!193800) b!349651))

(assert (= (or b!349638 b!349655) bm!26910))

(assert (= (and b!349652 res!193796) b!349639))

(assert (= (and b!349639 c!53267) b!349643))

(assert (= (and b!349639 (not c!53267)) b!349649))

(assert (= (and b!349643 res!193803) b!349646))

(assert (= (or b!349643 b!349649) bm!26915))

(declare-fun b_lambda!8477 () Bool)

(assert (=> (not b_lambda!8477) (not b!349644)))

(declare-fun t!10267 () Bool)

(declare-fun tb!3085 () Bool)

(assert (=> (and start!34902 (= defaultEntry!1528 defaultEntry!1528) t!10267) tb!3085))

(declare-fun result!5601 () Bool)

(assert (=> tb!3085 (= result!5601 tp_is_empty!7609)))

(assert (=> b!349644 t!10267))

(declare-fun b_and!14863 () Bool)

(assert (= b_and!14857 (and (=> t!10267 result!5601) b_and!14863)))

(declare-fun m!349531 () Bool)

(assert (=> b!349640 m!349531))

(declare-fun m!349533 () Bool)

(assert (=> b!349640 m!349533))

(declare-fun m!349535 () Bool)

(assert (=> b!349640 m!349535))

(assert (=> b!349640 m!349533))

(declare-fun m!349537 () Bool)

(assert (=> b!349640 m!349537))

(declare-fun m!349539 () Bool)

(assert (=> b!349640 m!349539))

(declare-fun m!349541 () Bool)

(assert (=> b!349640 m!349541))

(declare-fun m!349543 () Bool)

(assert (=> b!349640 m!349543))

(declare-fun m!349545 () Bool)

(assert (=> b!349640 m!349545))

(declare-fun m!349547 () Bool)

(assert (=> b!349640 m!349547))

(declare-fun m!349549 () Bool)

(assert (=> b!349640 m!349549))

(assert (=> b!349640 m!349539))

(declare-fun m!349551 () Bool)

(assert (=> b!349640 m!349551))

(declare-fun m!349553 () Bool)

(assert (=> b!349640 m!349553))

(declare-fun m!349555 () Bool)

(assert (=> b!349640 m!349555))

(declare-fun m!349557 () Bool)

(assert (=> b!349640 m!349557))

(assert (=> b!349640 m!349555))

(declare-fun m!349559 () Bool)

(assert (=> b!349640 m!349559))

(assert (=> b!349640 m!349485))

(assert (=> b!349640 m!349557))

(declare-fun m!349561 () Bool)

(assert (=> b!349640 m!349561))

(declare-fun m!349563 () Bool)

(assert (=> b!349651 m!349563))

(assert (=> d!71191 m!349405))

(assert (=> bm!26912 m!349545))

(declare-fun m!349565 () Bool)

(assert (=> b!349647 m!349565))

(assert (=> b!349635 m!349485))

(assert (=> b!349635 m!349485))

(assert (=> b!349635 m!349487))

(declare-fun m!349567 () Bool)

(assert (=> b!349646 m!349567))

(assert (=> b!349642 m!349485))

(assert (=> b!349642 m!349485))

(declare-fun m!349569 () Bool)

(assert (=> b!349642 m!349569))

(declare-fun m!349571 () Bool)

(assert (=> bm!26910 m!349571))

(assert (=> b!349644 m!349485))

(declare-fun m!349573 () Bool)

(assert (=> b!349644 m!349573))

(assert (=> b!349644 m!349485))

(declare-fun m!349575 () Bool)

(assert (=> b!349644 m!349575))

(assert (=> b!349644 m!349575))

(declare-fun m!349577 () Bool)

(assert (=> b!349644 m!349577))

(declare-fun m!349579 () Bool)

(assert (=> b!349644 m!349579))

(assert (=> b!349644 m!349577))

(declare-fun m!349581 () Bool)

(assert (=> bm!26915 m!349581))

(assert (=> b!349654 m!349485))

(assert (=> b!349654 m!349485))

(assert (=> b!349654 m!349487))

(declare-fun m!349583 () Bool)

(assert (=> bm!26913 m!349583))

(assert (=> b!349434 d!71191))

(declare-fun b!349664 () Bool)

(declare-fun e!214178 () Bool)

(assert (=> b!349664 (= e!214178 tp_is_empty!7609)))

(declare-fun b!349665 () Bool)

(declare-fun e!214177 () Bool)

(assert (=> b!349665 (= e!214177 tp_is_empty!7609)))

(declare-fun condMapEmpty!12888 () Bool)

(declare-fun mapDefault!12888 () ValueCell!3461)

(assert (=> mapNonEmpty!12879 (= condMapEmpty!12888 (= mapRest!12879 ((as const (Array (_ BitVec 32) ValueCell!3461)) mapDefault!12888)))))

(declare-fun mapRes!12888 () Bool)

(assert (=> mapNonEmpty!12879 (= tp!26543 (and e!214177 mapRes!12888))))

(declare-fun mapNonEmpty!12888 () Bool)

(declare-fun tp!26559 () Bool)

(assert (=> mapNonEmpty!12888 (= mapRes!12888 (and tp!26559 e!214178))))

(declare-fun mapKey!12888 () (_ BitVec 32))

(declare-fun mapValue!12888 () ValueCell!3461)

(declare-fun mapRest!12888 () (Array (_ BitVec 32) ValueCell!3461))

(assert (=> mapNonEmpty!12888 (= mapRest!12879 (store mapRest!12888 mapKey!12888 mapValue!12888))))

(declare-fun mapIsEmpty!12888 () Bool)

(assert (=> mapIsEmpty!12888 mapRes!12888))

(assert (= (and mapNonEmpty!12879 condMapEmpty!12888) mapIsEmpty!12888))

(assert (= (and mapNonEmpty!12879 (not condMapEmpty!12888)) mapNonEmpty!12888))

(assert (= (and mapNonEmpty!12888 ((_ is ValueCellFull!3461) mapValue!12888)) b!349664))

(assert (= (and mapNonEmpty!12879 ((_ is ValueCellFull!3461) mapDefault!12888)) b!349665))

(declare-fun m!349585 () Bool)

(assert (=> mapNonEmpty!12888 m!349585))

(declare-fun b_lambda!8479 () Bool)

(assert (= b_lambda!8477 (or (and start!34902 b_free!7657) b_lambda!8479)))

(check-sat (not b!349582) (not b!349646) (not bm!26891) tp_is_empty!7609 (not b!349540) (not d!71177) (not b_next!7657) (not bm!26912) (not b!349654) (not bm!26894) (not b!349644) (not bm!26913) (not b!349565) (not b!349635) (not b!349539) (not b!349640) (not b!349590) (not d!71189) (not d!71185) (not b!349647) (not bm!26910) b_and!14863 (not d!71191) (not b_lambda!8479) (not b!349553) (not b!349651) (not b!349547) (not bm!26915) (not b!349642) (not mapNonEmpty!12888) (not b!349563) (not b!349592) (not b!349537))
(check-sat b_and!14863 (not b_next!7657))
