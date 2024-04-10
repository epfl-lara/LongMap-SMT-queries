; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15064 () Bool)

(assert start!15064)

(declare-fun b!144644 () Bool)

(declare-fun b_free!3065 () Bool)

(declare-fun b_next!3065 () Bool)

(assert (=> b!144644 (= b_free!3065 (not b_next!3065))))

(declare-fun tp!11690 () Bool)

(declare-fun b_and!9015 () Bool)

(assert (=> b!144644 (= tp!11690 b_and!9015)))

(declare-fun b!144637 () Bool)

(declare-fun b_free!3067 () Bool)

(declare-fun b_next!3067 () Bool)

(assert (=> b!144637 (= b_free!3067 (not b_next!3067))))

(declare-fun tp!11688 () Bool)

(declare-fun b_and!9017 () Bool)

(assert (=> b!144637 (= tp!11688 b_and!9017)))

(declare-fun b!144625 () Bool)

(declare-fun e!94258 () Bool)

(declare-fun e!94260 () Bool)

(assert (=> b!144625 (= e!94258 e!94260)))

(declare-fun res!68898 () Bool)

(assert (=> b!144625 (=> (not res!68898) (not e!94260))))

(declare-datatypes ((V!3579 0))(
  ( (V!3580 (val!1519 Int)) )
))
(declare-datatypes ((tuple2!2722 0))(
  ( (tuple2!2723 (_1!1372 (_ BitVec 64)) (_2!1372 V!3579)) )
))
(declare-datatypes ((List!1758 0))(
  ( (Nil!1755) (Cons!1754 (h!2362 tuple2!2722) (t!6403 List!1758)) )
))
(declare-datatypes ((ListLongMap!1757 0))(
  ( (ListLongMap!1758 (toList!894 List!1758)) )
))
(declare-fun lt!75956 () ListLongMap!1757)

(declare-datatypes ((array!4939 0))(
  ( (array!4940 (arr!2333 (Array (_ BitVec 32) (_ BitVec 64))) (size!2608 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1131 0))(
  ( (ValueCellFull!1131 (v!3319 V!3579)) (EmptyCell!1131) )
))
(declare-datatypes ((array!4941 0))(
  ( (array!4942 (arr!2334 (Array (_ BitVec 32) ValueCell!1131)) (size!2609 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1170 0))(
  ( (LongMapFixedSize!1171 (defaultEntry!2989 Int) (mask!7353 (_ BitVec 32)) (extraKeys!2736 (_ BitVec 32)) (zeroValue!2835 V!3579) (minValue!2835 V!3579) (_size!634 (_ BitVec 32)) (_keys!4756 array!4939) (_values!2972 array!4941) (_vacant!634 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!954 0))(
  ( (Cell!955 (v!3320 LongMapFixedSize!1170)) )
))
(declare-datatypes ((LongMap!954 0))(
  ( (LongMap!955 (underlying!488 Cell!954)) )
))
(declare-fun thiss!992 () LongMap!954)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!75955 () ListLongMap!1757)

(assert (=> b!144625 (= res!68898 (and (= lt!75956 lt!75955) (not (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!1170)

(declare-fun map!1451 (LongMapFixedSize!1170) ListLongMap!1757)

(assert (=> b!144625 (= lt!75955 (map!1451 newMap!16))))

(declare-fun getCurrentListMap!564 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 32) Int) ListLongMap!1757)

(assert (=> b!144625 (= lt!75956 (getCurrentListMap!564 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!144626 () Bool)

(declare-fun e!94262 () Bool)

(declare-fun e!94254 () Bool)

(declare-fun mapRes!4909 () Bool)

(assert (=> b!144626 (= e!94262 (and e!94254 mapRes!4909))))

(declare-fun condMapEmpty!4910 () Bool)

(declare-fun mapDefault!4910 () ValueCell!1131)

(assert (=> b!144626 (= condMapEmpty!4910 (= (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1131)) mapDefault!4910)))))

(declare-fun b!144627 () Bool)

(declare-fun e!94266 () Bool)

(declare-fun tp_is_empty!2949 () Bool)

(assert (=> b!144627 (= e!94266 tp_is_empty!2949)))

(declare-fun b!144628 () Bool)

(declare-fun res!68892 () Bool)

(assert (=> b!144628 (=> (not res!68892) (not e!94258))))

(assert (=> b!144628 (= res!68892 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun b!144629 () Bool)

(declare-fun e!94255 () Bool)

(declare-fun e!94265 () Bool)

(assert (=> b!144629 (= e!94255 (not e!94265))))

(declare-fun res!68890 () Bool)

(assert (=> b!144629 (=> res!68890 e!94265)))

(assert (=> b!144629 (= res!68890 (or (bvsge (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992)))))))))

(declare-datatypes ((List!1759 0))(
  ( (Nil!1756) (Cons!1755 (h!2363 (_ BitVec 64)) (t!6404 List!1759)) )
))
(declare-fun lt!75953 () List!1759)

(assert (=> b!144629 (= lt!75953 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1756))))

(declare-fun arrayNoDuplicates!0 (array!4939 (_ BitVec 32) List!1759) Bool)

(assert (=> b!144629 (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) from!355 Nil!1756)))

(declare-datatypes ((Unit!4578 0))(
  ( (Unit!4579) )
))
(declare-fun lt!75954 () Unit!4578)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4939 (_ BitVec 32) (_ BitVec 32)) Unit!4578)

(assert (=> b!144629 (= lt!75954 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!4939 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!144629 (arrayContainsKey!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!75957 () Unit!4578)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!145 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 64) (_ BitVec 32) Int) Unit!4578)

(assert (=> b!144629 (= lt!75957 (lemmaListMapContainsThenArrayContainsFrom!145 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!144630 () Bool)

(assert (=> b!144630 (= e!94260 e!94255)))

(declare-fun res!68893 () Bool)

(assert (=> b!144630 (=> (not res!68893) (not e!94255))))

(declare-fun contains!936 (ListLongMap!1757 (_ BitVec 64)) Bool)

(assert (=> b!144630 (= res!68893 (contains!936 lt!75955 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2724 0))(
  ( (tuple2!2725 (_1!1373 Bool) (_2!1373 LongMapFixedSize!1170)) )
))
(declare-fun lt!75958 () tuple2!2724)

(declare-fun update!217 (LongMapFixedSize!1170 (_ BitVec 64) V!3579) tuple2!2724)

(declare-fun get!1549 (ValueCell!1131 V!3579) V!3579)

(declare-fun dynLambda!448 (Int (_ BitVec 64)) V!3579)

(assert (=> b!144630 (= lt!75958 (update!217 newMap!16 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!144631 () Bool)

(assert (=> b!144631 (= e!94265 (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!75953))))

(declare-fun b!144632 () Bool)

(declare-fun res!68896 () Bool)

(assert (=> b!144632 (=> (not res!68896) (not e!94258))))

(assert (=> b!144632 (= res!68896 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7353 newMap!16)) (_size!634 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!144633 () Bool)

(declare-fun res!68895 () Bool)

(assert (=> b!144633 (=> (not res!68895) (not e!94258))))

(declare-fun valid!565 (LongMapFixedSize!1170) Bool)

(assert (=> b!144633 (= res!68895 (valid!565 newMap!16))))

(declare-fun b!144634 () Bool)

(assert (=> b!144634 (= e!94254 tp_is_empty!2949)))

(declare-fun b!144635 () Bool)

(declare-fun e!94268 () Bool)

(assert (=> b!144635 (= e!94268 tp_is_empty!2949)))

(declare-fun res!68897 () Bool)

(assert (=> start!15064 (=> (not res!68897) (not e!94258))))

(declare-fun valid!566 (LongMap!954) Bool)

(assert (=> start!15064 (= res!68897 (valid!566 thiss!992))))

(assert (=> start!15064 e!94258))

(declare-fun e!94263 () Bool)

(assert (=> start!15064 e!94263))

(assert (=> start!15064 true))

(declare-fun e!94261 () Bool)

(assert (=> start!15064 e!94261))

(declare-fun mapNonEmpty!4909 () Bool)

(declare-fun tp!11689 () Bool)

(assert (=> mapNonEmpty!4909 (= mapRes!4909 (and tp!11689 e!94266))))

(declare-fun mapKey!4910 () (_ BitVec 32))

(declare-fun mapValue!4910 () ValueCell!1131)

(declare-fun mapRest!4909 () (Array (_ BitVec 32) ValueCell!1131))

(assert (=> mapNonEmpty!4909 (= (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) (store mapRest!4909 mapKey!4910 mapValue!4910))))

(declare-fun b!144636 () Bool)

(declare-fun res!68894 () Bool)

(assert (=> b!144636 (=> res!68894 e!94265)))

(declare-fun contains!937 (List!1759 (_ BitVec 64)) Bool)

(assert (=> b!144636 (= res!68894 (contains!937 lt!75953 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94259 () Bool)

(declare-fun array_inv!1469 (array!4939) Bool)

(declare-fun array_inv!1470 (array!4941) Bool)

(assert (=> b!144637 (= e!94261 (and tp!11688 tp_is_empty!2949 (array_inv!1469 (_keys!4756 newMap!16)) (array_inv!1470 (_values!2972 newMap!16)) e!94259))))

(declare-fun b!144638 () Bool)

(declare-fun e!94264 () Bool)

(declare-fun mapRes!4910 () Bool)

(assert (=> b!144638 (= e!94259 (and e!94264 mapRes!4910))))

(declare-fun condMapEmpty!4909 () Bool)

(declare-fun mapDefault!4909 () ValueCell!1131)

(assert (=> b!144638 (= condMapEmpty!4909 (= (arr!2334 (_values!2972 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1131)) mapDefault!4909)))))

(declare-fun mapIsEmpty!4909 () Bool)

(assert (=> mapIsEmpty!4909 mapRes!4909))

(declare-fun mapIsEmpty!4910 () Bool)

(assert (=> mapIsEmpty!4910 mapRes!4910))

(declare-fun mapNonEmpty!4910 () Bool)

(declare-fun tp!11687 () Bool)

(assert (=> mapNonEmpty!4910 (= mapRes!4910 (and tp!11687 e!94268))))

(declare-fun mapKey!4909 () (_ BitVec 32))

(declare-fun mapRest!4910 () (Array (_ BitVec 32) ValueCell!1131))

(declare-fun mapValue!4909 () ValueCell!1131)

(assert (=> mapNonEmpty!4910 (= (arr!2334 (_values!2972 newMap!16)) (store mapRest!4910 mapKey!4909 mapValue!4909))))

(declare-fun b!144639 () Bool)

(declare-fun res!68889 () Bool)

(assert (=> b!144639 (=> res!68889 e!94265)))

(assert (=> b!144639 (= res!68889 (contains!937 lt!75953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144640 () Bool)

(declare-fun e!94256 () Bool)

(assert (=> b!144640 (= e!94263 e!94256)))

(declare-fun b!144641 () Bool)

(declare-fun e!94267 () Bool)

(assert (=> b!144641 (= e!94256 e!94267)))

(declare-fun b!144642 () Bool)

(declare-fun res!68891 () Bool)

(assert (=> b!144642 (=> res!68891 e!94265)))

(declare-fun noDuplicate!55 (List!1759) Bool)

(assert (=> b!144642 (= res!68891 (not (noDuplicate!55 lt!75953)))))

(declare-fun b!144643 () Bool)

(assert (=> b!144643 (= e!94264 tp_is_empty!2949)))

(assert (=> b!144644 (= e!94267 (and tp!11690 tp_is_empty!2949 (array_inv!1469 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (array_inv!1470 (_values!2972 (v!3320 (underlying!488 thiss!992)))) e!94262))))

(assert (= (and start!15064 res!68897) b!144628))

(assert (= (and b!144628 res!68892) b!144633))

(assert (= (and b!144633 res!68895) b!144632))

(assert (= (and b!144632 res!68896) b!144625))

(assert (= (and b!144625 res!68898) b!144630))

(assert (= (and b!144630 res!68893) b!144629))

(assert (= (and b!144629 (not res!68890)) b!144642))

(assert (= (and b!144642 (not res!68891)) b!144639))

(assert (= (and b!144639 (not res!68889)) b!144636))

(assert (= (and b!144636 (not res!68894)) b!144631))

(assert (= (and b!144626 condMapEmpty!4910) mapIsEmpty!4909))

(assert (= (and b!144626 (not condMapEmpty!4910)) mapNonEmpty!4909))

(get-info :version)

(assert (= (and mapNonEmpty!4909 ((_ is ValueCellFull!1131) mapValue!4910)) b!144627))

(assert (= (and b!144626 ((_ is ValueCellFull!1131) mapDefault!4910)) b!144634))

(assert (= b!144644 b!144626))

(assert (= b!144641 b!144644))

(assert (= b!144640 b!144641))

(assert (= start!15064 b!144640))

(assert (= (and b!144638 condMapEmpty!4909) mapIsEmpty!4910))

(assert (= (and b!144638 (not condMapEmpty!4909)) mapNonEmpty!4910))

(assert (= (and mapNonEmpty!4910 ((_ is ValueCellFull!1131) mapValue!4909)) b!144635))

(assert (= (and b!144638 ((_ is ValueCellFull!1131) mapDefault!4909)) b!144643))

(assert (= b!144637 b!144638))

(assert (= start!15064 b!144637))

(declare-fun b_lambda!6489 () Bool)

(assert (=> (not b_lambda!6489) (not b!144630)))

(declare-fun t!6400 () Bool)

(declare-fun tb!2605 () Bool)

(assert (=> (and b!144644 (= (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))) t!6400) tb!2605))

(declare-fun result!4261 () Bool)

(assert (=> tb!2605 (= result!4261 tp_is_empty!2949)))

(assert (=> b!144630 t!6400))

(declare-fun b_and!9019 () Bool)

(assert (= b_and!9015 (and (=> t!6400 result!4261) b_and!9019)))

(declare-fun t!6402 () Bool)

(declare-fun tb!2607 () Bool)

(assert (=> (and b!144637 (= (defaultEntry!2989 newMap!16) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))) t!6402) tb!2607))

(declare-fun result!4265 () Bool)

(assert (= result!4265 result!4261))

(assert (=> b!144630 t!6402))

(declare-fun b_and!9021 () Bool)

(assert (= b_and!9017 (and (=> t!6402 result!4265) b_and!9021)))

(declare-fun m!174467 () Bool)

(assert (=> b!144639 m!174467))

(declare-fun m!174469 () Bool)

(assert (=> b!144633 m!174469))

(declare-fun m!174471 () Bool)

(assert (=> b!144625 m!174471))

(declare-fun m!174473 () Bool)

(assert (=> b!144625 m!174473))

(declare-fun m!174475 () Bool)

(assert (=> b!144625 m!174475))

(declare-fun m!174477 () Bool)

(assert (=> b!144630 m!174477))

(declare-fun m!174479 () Bool)

(assert (=> b!144630 m!174479))

(declare-fun m!174481 () Bool)

(assert (=> b!144630 m!174481))

(assert (=> b!144630 m!174471))

(assert (=> b!144630 m!174471))

(declare-fun m!174483 () Bool)

(assert (=> b!144630 m!174483))

(assert (=> b!144630 m!174479))

(assert (=> b!144630 m!174471))

(assert (=> b!144630 m!174481))

(declare-fun m!174485 () Bool)

(assert (=> b!144630 m!174485))

(assert (=> b!144630 m!174477))

(declare-fun m!174487 () Bool)

(assert (=> start!15064 m!174487))

(declare-fun m!174489 () Bool)

(assert (=> b!144644 m!174489))

(declare-fun m!174491 () Bool)

(assert (=> b!144644 m!174491))

(declare-fun m!174493 () Bool)

(assert (=> b!144642 m!174493))

(declare-fun m!174495 () Bool)

(assert (=> b!144637 m!174495))

(declare-fun m!174497 () Bool)

(assert (=> b!144637 m!174497))

(declare-fun m!174499 () Bool)

(assert (=> b!144629 m!174499))

(declare-fun m!174501 () Bool)

(assert (=> b!144629 m!174501))

(assert (=> b!144629 m!174471))

(declare-fun m!174503 () Bool)

(assert (=> b!144629 m!174503))

(assert (=> b!144629 m!174471))

(assert (=> b!144629 m!174471))

(declare-fun m!174505 () Bool)

(assert (=> b!144629 m!174505))

(declare-fun m!174507 () Bool)

(assert (=> mapNonEmpty!4910 m!174507))

(declare-fun m!174509 () Bool)

(assert (=> b!144631 m!174509))

(declare-fun m!174511 () Bool)

(assert (=> b!144636 m!174511))

(declare-fun m!174513 () Bool)

(assert (=> mapNonEmpty!4909 m!174513))

(check-sat b_and!9019 (not b!144629) (not b!144644) (not b!144631) (not b!144630) (not mapNonEmpty!4910) (not b!144642) (not start!15064) (not b!144633) (not b!144636) (not b_next!3067) (not b_next!3065) (not b_lambda!6489) (not b!144625) tp_is_empty!2949 b_and!9021 (not mapNonEmpty!4909) (not b!144637) (not b!144639))
(check-sat b_and!9019 b_and!9021 (not b_next!3065) (not b_next!3067))
(get-model)

(declare-fun b_lambda!6493 () Bool)

(assert (= b_lambda!6489 (or (and b!144644 b_free!3065) (and b!144637 b_free!3067 (= (defaultEntry!2989 newMap!16) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))))) b_lambda!6493)))

(check-sat b_and!9019 (not b!144629) (not b!144644) (not b!144631) (not b!144630) (not mapNonEmpty!4910) (not b!144642) (not b!144625) (not b!144633) (not b!144636) (not b_next!3067) (not b_next!3065) (not b_lambda!6493) (not start!15064) tp_is_empty!2949 b_and!9021 (not mapNonEmpty!4909) (not b!144637) (not b!144639))
(check-sat b_and!9019 b_and!9021 (not b_next!3065) (not b_next!3067))
(get-model)

(declare-fun d!46093 () Bool)

(declare-fun lt!75979 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!141 (List!1759) (InoxSet (_ BitVec 64)))

(assert (=> d!46093 (= lt!75979 (select (content!141 lt!75953) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94321 () Bool)

(assert (=> d!46093 (= lt!75979 e!94321)))

(declare-fun res!68933 () Bool)

(assert (=> d!46093 (=> (not res!68933) (not e!94321))))

(assert (=> d!46093 (= res!68933 ((_ is Cons!1755) lt!75953))))

(assert (=> d!46093 (= (contains!937 lt!75953 #b1000000000000000000000000000000000000000000000000000000000000000) lt!75979)))

(declare-fun b!144713 () Bool)

(declare-fun e!94322 () Bool)

(assert (=> b!144713 (= e!94321 e!94322)))

(declare-fun res!68934 () Bool)

(assert (=> b!144713 (=> res!68934 e!94322)))

(assert (=> b!144713 (= res!68934 (= (h!2363 lt!75953) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144714 () Bool)

(assert (=> b!144714 (= e!94322 (contains!937 (t!6404 lt!75953) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46093 res!68933) b!144713))

(assert (= (and b!144713 (not res!68934)) b!144714))

(declare-fun m!174563 () Bool)

(assert (=> d!46093 m!174563))

(declare-fun m!174565 () Bool)

(assert (=> d!46093 m!174565))

(declare-fun m!174567 () Bool)

(assert (=> b!144714 m!174567))

(assert (=> b!144636 d!46093))

(declare-fun d!46095 () Bool)

(assert (=> d!46095 (= (map!1451 newMap!16) (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun bs!6104 () Bool)

(assert (= bs!6104 d!46095))

(declare-fun m!174569 () Bool)

(assert (=> bs!6104 m!174569))

(assert (=> b!144625 d!46095))

(declare-fun d!46097 () Bool)

(declare-fun e!94352 () Bool)

(assert (=> d!46097 e!94352))

(declare-fun res!68955 () Bool)

(assert (=> d!46097 (=> (not res!68955) (not e!94352))))

(assert (=> d!46097 (= res!68955 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun lt!76030 () ListLongMap!1757)

(declare-fun lt!76042 () ListLongMap!1757)

(assert (=> d!46097 (= lt!76030 lt!76042)))

(declare-fun lt!76040 () Unit!4578)

(declare-fun e!94353 () Unit!4578)

(assert (=> d!46097 (= lt!76040 e!94353)))

(declare-fun c!27393 () Bool)

(declare-fun e!94349 () Bool)

(assert (=> d!46097 (= c!27393 e!94349)))

(declare-fun res!68958 () Bool)

(assert (=> d!46097 (=> (not res!68958) (not e!94349))))

(assert (=> d!46097 (= res!68958 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun e!94351 () ListLongMap!1757)

(assert (=> d!46097 (= lt!76042 e!94351)))

(declare-fun c!27390 () Bool)

(assert (=> d!46097 (= c!27390 (and (not (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!46097 (validMask!0 (mask!7353 (v!3320 (underlying!488 thiss!992))))))

(assert (=> d!46097 (= (getCurrentListMap!564 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))) lt!76030)))

(declare-fun b!144757 () Bool)

(declare-fun e!94357 () Bool)

(declare-fun call!16112 () Bool)

(assert (=> b!144757 (= e!94357 (not call!16112))))

(declare-fun b!144758 () Bool)

(declare-fun e!94354 () Bool)

(assert (=> b!144758 (= e!94352 e!94354)))

(declare-fun c!27389 () Bool)

(assert (=> b!144758 (= c!27389 (not (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!94356 () Bool)

(declare-fun b!144759 () Bool)

(declare-fun apply!123 (ListLongMap!1757 (_ BitVec 64)) V!3579)

(assert (=> b!144759 (= e!94356 (= (apply!123 lt!76030 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144759 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2609 (_values!2972 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> b!144759 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun bm!16104 () Bool)

(declare-fun call!16108 () ListLongMap!1757)

(declare-fun call!16109 () ListLongMap!1757)

(assert (=> bm!16104 (= call!16108 call!16109)))

(declare-fun bm!16105 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!148 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 32) Int) ListLongMap!1757)

(assert (=> bm!16105 (= call!16109 (getCurrentListMapNoExtraKeys!148 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!144760 () Bool)

(declare-fun e!94350 () ListLongMap!1757)

(assert (=> b!144760 (= e!94351 e!94350)))

(declare-fun c!27394 () Bool)

(assert (=> b!144760 (= c!27394 (and (not (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!16106 () Bool)

(declare-fun call!16110 () ListLongMap!1757)

(declare-fun call!16113 () ListLongMap!1757)

(declare-fun +!182 (ListLongMap!1757 tuple2!2722) ListLongMap!1757)

(assert (=> bm!16106 (= call!16113 (+!182 (ite c!27390 call!16109 (ite c!27394 call!16108 call!16110)) (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun b!144761 () Bool)

(declare-fun e!94361 () ListLongMap!1757)

(declare-fun call!16107 () ListLongMap!1757)

(assert (=> b!144761 (= e!94361 call!16107)))

(declare-fun b!144762 () Bool)

(assert (=> b!144762 (= e!94361 call!16110)))

(declare-fun b!144763 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!144763 (= e!94349 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144764 () Bool)

(declare-fun e!94359 () Bool)

(assert (=> b!144764 (= e!94359 e!94356)))

(declare-fun res!68956 () Bool)

(assert (=> b!144764 (=> (not res!68956) (not e!94356))))

(assert (=> b!144764 (= res!68956 (contains!936 lt!76030 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!144764 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!144765 () Bool)

(declare-fun res!68959 () Bool)

(assert (=> b!144765 (=> (not res!68959) (not e!94352))))

(assert (=> b!144765 (= res!68959 e!94357)))

(declare-fun c!27391 () Bool)

(assert (=> b!144765 (= c!27391 (not (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!144766 () Bool)

(declare-fun e!94355 () Bool)

(assert (=> b!144766 (= e!94355 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!144767 () Bool)

(declare-fun call!16111 () Bool)

(assert (=> b!144767 (= e!94354 (not call!16111))))

(declare-fun b!144768 () Bool)

(declare-fun e!94360 () Bool)

(assert (=> b!144768 (= e!94357 e!94360)))

(declare-fun res!68954 () Bool)

(assert (=> b!144768 (= res!68954 call!16112)))

(assert (=> b!144768 (=> (not res!68954) (not e!94360))))

(declare-fun bm!16107 () Bool)

(assert (=> bm!16107 (= call!16111 (contains!936 lt!76030 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144769 () Bool)

(declare-fun Unit!4582 () Unit!4578)

(assert (=> b!144769 (= e!94353 Unit!4582)))

(declare-fun bm!16108 () Bool)

(assert (=> bm!16108 (= call!16112 (contains!936 lt!76030 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144770 () Bool)

(declare-fun e!94358 () Bool)

(assert (=> b!144770 (= e!94354 e!94358)))

(declare-fun res!68957 () Bool)

(assert (=> b!144770 (= res!68957 call!16111)))

(assert (=> b!144770 (=> (not res!68957) (not e!94358))))

(declare-fun b!144771 () Bool)

(declare-fun lt!76039 () Unit!4578)

(assert (=> b!144771 (= e!94353 lt!76039)))

(declare-fun lt!76025 () ListLongMap!1757)

(assert (=> b!144771 (= lt!76025 (getCurrentListMapNoExtraKeys!148 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun lt!76035 () (_ BitVec 64))

(assert (=> b!144771 (= lt!76035 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76041 () (_ BitVec 64))

(assert (=> b!144771 (= lt!76041 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76033 () Unit!4578)

(declare-fun addStillContains!99 (ListLongMap!1757 (_ BitVec 64) V!3579 (_ BitVec 64)) Unit!4578)

(assert (=> b!144771 (= lt!76033 (addStillContains!99 lt!76025 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76041))))

(assert (=> b!144771 (contains!936 (+!182 lt!76025 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76041)))

(declare-fun lt!76036 () Unit!4578)

(assert (=> b!144771 (= lt!76036 lt!76033)))

(declare-fun lt!76045 () ListLongMap!1757)

(assert (=> b!144771 (= lt!76045 (getCurrentListMapNoExtraKeys!148 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun lt!76044 () (_ BitVec 64))

(assert (=> b!144771 (= lt!76044 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76037 () (_ BitVec 64))

(assert (=> b!144771 (= lt!76037 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76027 () Unit!4578)

(declare-fun addApplyDifferent!99 (ListLongMap!1757 (_ BitVec 64) V!3579 (_ BitVec 64)) Unit!4578)

(assert (=> b!144771 (= lt!76027 (addApplyDifferent!99 lt!76045 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76037))))

(assert (=> b!144771 (= (apply!123 (+!182 lt!76045 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76037) (apply!123 lt!76045 lt!76037))))

(declare-fun lt!76038 () Unit!4578)

(assert (=> b!144771 (= lt!76038 lt!76027)))

(declare-fun lt!76029 () ListLongMap!1757)

(assert (=> b!144771 (= lt!76029 (getCurrentListMapNoExtraKeys!148 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun lt!76034 () (_ BitVec 64))

(assert (=> b!144771 (= lt!76034 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76043 () (_ BitVec 64))

(assert (=> b!144771 (= lt!76043 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!76024 () Unit!4578)

(assert (=> b!144771 (= lt!76024 (addApplyDifferent!99 lt!76029 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76043))))

(assert (=> b!144771 (= (apply!123 (+!182 lt!76029 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76043) (apply!123 lt!76029 lt!76043))))

(declare-fun lt!76032 () Unit!4578)

(assert (=> b!144771 (= lt!76032 lt!76024)))

(declare-fun lt!76028 () ListLongMap!1757)

(assert (=> b!144771 (= lt!76028 (getCurrentListMapNoExtraKeys!148 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun lt!76031 () (_ BitVec 64))

(assert (=> b!144771 (= lt!76031 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76026 () (_ BitVec 64))

(assert (=> b!144771 (= lt!76026 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!144771 (= lt!76039 (addApplyDifferent!99 lt!76028 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76026))))

(assert (=> b!144771 (= (apply!123 (+!182 lt!76028 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76026) (apply!123 lt!76028 lt!76026))))

(declare-fun b!144772 () Bool)

(declare-fun res!68953 () Bool)

(assert (=> b!144772 (=> (not res!68953) (not e!94352))))

(assert (=> b!144772 (= res!68953 e!94359)))

(declare-fun res!68960 () Bool)

(assert (=> b!144772 (=> res!68960 e!94359)))

(assert (=> b!144772 (= res!68960 (not e!94355))))

(declare-fun res!68961 () Bool)

(assert (=> b!144772 (=> (not res!68961) (not e!94355))))

(assert (=> b!144772 (= res!68961 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!144773 () Bool)

(assert (=> b!144773 (= e!94358 (= (apply!123 lt!76030 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!144774 () Bool)

(declare-fun c!27392 () Bool)

(assert (=> b!144774 (= c!27392 (and (not (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!144774 (= e!94350 e!94361)))

(declare-fun b!144775 () Bool)

(assert (=> b!144775 (= e!94351 (+!182 call!16113 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!144776 () Bool)

(assert (=> b!144776 (= e!94360 (= (apply!123 lt!76030 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!144777 () Bool)

(assert (=> b!144777 (= e!94350 call!16107)))

(declare-fun bm!16109 () Bool)

(assert (=> bm!16109 (= call!16110 call!16108)))

(declare-fun bm!16110 () Bool)

(assert (=> bm!16110 (= call!16107 call!16113)))

(assert (= (and d!46097 c!27390) b!144775))

(assert (= (and d!46097 (not c!27390)) b!144760))

(assert (= (and b!144760 c!27394) b!144777))

(assert (= (and b!144760 (not c!27394)) b!144774))

(assert (= (and b!144774 c!27392) b!144761))

(assert (= (and b!144774 (not c!27392)) b!144762))

(assert (= (or b!144761 b!144762) bm!16109))

(assert (= (or b!144777 bm!16109) bm!16104))

(assert (= (or b!144777 b!144761) bm!16110))

(assert (= (or b!144775 bm!16104) bm!16105))

(assert (= (or b!144775 bm!16110) bm!16106))

(assert (= (and d!46097 res!68958) b!144763))

(assert (= (and d!46097 c!27393) b!144771))

(assert (= (and d!46097 (not c!27393)) b!144769))

(assert (= (and d!46097 res!68955) b!144772))

(assert (= (and b!144772 res!68961) b!144766))

(assert (= (and b!144772 (not res!68960)) b!144764))

(assert (= (and b!144764 res!68956) b!144759))

(assert (= (and b!144772 res!68953) b!144765))

(assert (= (and b!144765 c!27391) b!144768))

(assert (= (and b!144765 (not c!27391)) b!144757))

(assert (= (and b!144768 res!68954) b!144776))

(assert (= (or b!144768 b!144757) bm!16108))

(assert (= (and b!144765 res!68959) b!144758))

(assert (= (and b!144758 c!27389) b!144770))

(assert (= (and b!144758 (not c!27389)) b!144767))

(assert (= (and b!144770 res!68957) b!144773))

(assert (= (or b!144770 b!144767) bm!16107))

(declare-fun b_lambda!6495 () Bool)

(assert (=> (not b_lambda!6495) (not b!144759)))

(assert (=> b!144759 t!6400))

(declare-fun b_and!9031 () Bool)

(assert (= b_and!9019 (and (=> t!6400 result!4261) b_and!9031)))

(assert (=> b!144759 t!6402))

(declare-fun b_and!9033 () Bool)

(assert (= b_and!9021 (and (=> t!6402 result!4265) b_and!9033)))

(declare-fun m!174571 () Bool)

(assert (=> b!144764 m!174571))

(assert (=> b!144764 m!174571))

(declare-fun m!174573 () Bool)

(assert (=> b!144764 m!174573))

(declare-fun m!174575 () Bool)

(assert (=> bm!16105 m!174575))

(assert (=> b!144759 m!174479))

(assert (=> b!144759 m!174571))

(assert (=> b!144759 m!174571))

(declare-fun m!174577 () Bool)

(assert (=> b!144759 m!174577))

(declare-fun m!174579 () Bool)

(assert (=> b!144759 m!174579))

(assert (=> b!144759 m!174579))

(assert (=> b!144759 m!174479))

(declare-fun m!174581 () Bool)

(assert (=> b!144759 m!174581))

(declare-fun m!174583 () Bool)

(assert (=> b!144776 m!174583))

(assert (=> b!144763 m!174571))

(assert (=> b!144763 m!174571))

(declare-fun m!174585 () Bool)

(assert (=> b!144763 m!174585))

(declare-fun m!174587 () Bool)

(assert (=> b!144773 m!174587))

(declare-fun m!174589 () Bool)

(assert (=> d!46097 m!174589))

(assert (=> b!144766 m!174571))

(assert (=> b!144766 m!174571))

(assert (=> b!144766 m!174585))

(declare-fun m!174591 () Bool)

(assert (=> bm!16108 m!174591))

(declare-fun m!174593 () Bool)

(assert (=> bm!16106 m!174593))

(declare-fun m!174595 () Bool)

(assert (=> b!144775 m!174595))

(declare-fun m!174597 () Bool)

(assert (=> bm!16107 m!174597))

(declare-fun m!174599 () Bool)

(assert (=> b!144771 m!174599))

(declare-fun m!174601 () Bool)

(assert (=> b!144771 m!174601))

(declare-fun m!174603 () Bool)

(assert (=> b!144771 m!174603))

(declare-fun m!174605 () Bool)

(assert (=> b!144771 m!174605))

(declare-fun m!174607 () Bool)

(assert (=> b!144771 m!174607))

(declare-fun m!174609 () Bool)

(assert (=> b!144771 m!174609))

(declare-fun m!174611 () Bool)

(assert (=> b!144771 m!174611))

(assert (=> b!144771 m!174575))

(assert (=> b!144771 m!174599))

(declare-fun m!174613 () Bool)

(assert (=> b!144771 m!174613))

(declare-fun m!174615 () Bool)

(assert (=> b!144771 m!174615))

(declare-fun m!174617 () Bool)

(assert (=> b!144771 m!174617))

(assert (=> b!144771 m!174603))

(declare-fun m!174619 () Bool)

(assert (=> b!144771 m!174619))

(declare-fun m!174621 () Bool)

(assert (=> b!144771 m!174621))

(assert (=> b!144771 m!174571))

(assert (=> b!144771 m!174605))

(assert (=> b!144771 m!174609))

(declare-fun m!174623 () Bool)

(assert (=> b!144771 m!174623))

(declare-fun m!174625 () Bool)

(assert (=> b!144771 m!174625))

(declare-fun m!174627 () Bool)

(assert (=> b!144771 m!174627))

(assert (=> b!144625 d!46097))

(declare-fun d!46099 () Bool)

(declare-fun res!68966 () Bool)

(declare-fun e!94366 () Bool)

(assert (=> d!46099 (=> res!68966 e!94366)))

(assert (=> d!46099 (= res!68966 ((_ is Nil!1756) lt!75953))))

(assert (=> d!46099 (= (noDuplicate!55 lt!75953) e!94366)))

(declare-fun b!144782 () Bool)

(declare-fun e!94367 () Bool)

(assert (=> b!144782 (= e!94366 e!94367)))

(declare-fun res!68967 () Bool)

(assert (=> b!144782 (=> (not res!68967) (not e!94367))))

(assert (=> b!144782 (= res!68967 (not (contains!937 (t!6404 lt!75953) (h!2363 lt!75953))))))

(declare-fun b!144783 () Bool)

(assert (=> b!144783 (= e!94367 (noDuplicate!55 (t!6404 lt!75953)))))

(assert (= (and d!46099 (not res!68966)) b!144782))

(assert (= (and b!144782 res!68967) b!144783))

(declare-fun m!174629 () Bool)

(assert (=> b!144782 m!174629))

(declare-fun m!174631 () Bool)

(assert (=> b!144783 m!174631))

(assert (=> b!144642 d!46099))

(declare-fun d!46101 () Bool)

(declare-fun res!68974 () Bool)

(declare-fun e!94370 () Bool)

(assert (=> d!46101 (=> (not res!68974) (not e!94370))))

(declare-fun simpleValid!99 (LongMapFixedSize!1170) Bool)

(assert (=> d!46101 (= res!68974 (simpleValid!99 newMap!16))))

(assert (=> d!46101 (= (valid!565 newMap!16) e!94370)))

(declare-fun b!144790 () Bool)

(declare-fun res!68975 () Bool)

(assert (=> b!144790 (=> (not res!68975) (not e!94370))))

(declare-fun arrayCountValidKeys!0 (array!4939 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!144790 (= res!68975 (= (arrayCountValidKeys!0 (_keys!4756 newMap!16) #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))) (_size!634 newMap!16)))))

(declare-fun b!144791 () Bool)

(declare-fun res!68976 () Bool)

(assert (=> b!144791 (=> (not res!68976) (not e!94370))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4939 (_ BitVec 32)) Bool)

(assert (=> b!144791 (= res!68976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4756 newMap!16) (mask!7353 newMap!16)))))

(declare-fun b!144792 () Bool)

(assert (=> b!144792 (= e!94370 (arrayNoDuplicates!0 (_keys!4756 newMap!16) #b00000000000000000000000000000000 Nil!1756))))

(assert (= (and d!46101 res!68974) b!144790))

(assert (= (and b!144790 res!68975) b!144791))

(assert (= (and b!144791 res!68976) b!144792))

(declare-fun m!174633 () Bool)

(assert (=> d!46101 m!174633))

(declare-fun m!174635 () Bool)

(assert (=> b!144790 m!174635))

(declare-fun m!174637 () Bool)

(assert (=> b!144791 m!174637))

(declare-fun m!174639 () Bool)

(assert (=> b!144792 m!174639))

(assert (=> b!144633 d!46101))

(declare-fun d!46103 () Bool)

(assert (=> d!46103 (= (valid!566 thiss!992) (valid!565 (v!3320 (underlying!488 thiss!992))))))

(declare-fun bs!6105 () Bool)

(assert (= bs!6105 d!46103))

(declare-fun m!174641 () Bool)

(assert (=> bs!6105 m!174641))

(assert (=> start!15064 d!46103))

(declare-fun d!46105 () Bool)

(declare-fun lt!76046 () Bool)

(assert (=> d!46105 (= lt!76046 (select (content!141 lt!75953) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94371 () Bool)

(assert (=> d!46105 (= lt!76046 e!94371)))

(declare-fun res!68977 () Bool)

(assert (=> d!46105 (=> (not res!68977) (not e!94371))))

(assert (=> d!46105 (= res!68977 ((_ is Cons!1755) lt!75953))))

(assert (=> d!46105 (= (contains!937 lt!75953 #b0000000000000000000000000000000000000000000000000000000000000000) lt!76046)))

(declare-fun b!144793 () Bool)

(declare-fun e!94372 () Bool)

(assert (=> b!144793 (= e!94371 e!94372)))

(declare-fun res!68978 () Bool)

(assert (=> b!144793 (=> res!68978 e!94372)))

(assert (=> b!144793 (= res!68978 (= (h!2363 lt!75953) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144794 () Bool)

(assert (=> b!144794 (= e!94372 (contains!937 (t!6404 lt!75953) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46105 res!68977) b!144793))

(assert (= (and b!144793 (not res!68978)) b!144794))

(assert (=> d!46105 m!174563))

(declare-fun m!174643 () Bool)

(assert (=> d!46105 m!174643))

(declare-fun m!174645 () Bool)

(assert (=> b!144794 m!174645))

(assert (=> b!144639 d!46105))

(declare-fun b!144805 () Bool)

(declare-fun e!94384 () Bool)

(declare-fun call!16116 () Bool)

(assert (=> b!144805 (= e!94384 call!16116)))

(declare-fun b!144806 () Bool)

(assert (=> b!144806 (= e!94384 call!16116)))

(declare-fun b!144807 () Bool)

(declare-fun e!94383 () Bool)

(assert (=> b!144807 (= e!94383 e!94384)))

(declare-fun c!27397 () Bool)

(assert (=> b!144807 (= c!27397 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!46107 () Bool)

(declare-fun res!68987 () Bool)

(declare-fun e!94382 () Bool)

(assert (=> d!46107 (=> res!68987 e!94382)))

(assert (=> d!46107 (= res!68987 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46107 (= (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!75953) e!94382)))

(declare-fun e!94381 () Bool)

(declare-fun b!144808 () Bool)

(assert (=> b!144808 (= e!94381 (contains!937 lt!75953 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!16113 () Bool)

(assert (=> bm!16113 (= call!16116 (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (ite c!27397 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75953) lt!75953)))))

(declare-fun b!144809 () Bool)

(assert (=> b!144809 (= e!94382 e!94383)))

(declare-fun res!68985 () Bool)

(assert (=> b!144809 (=> (not res!68985) (not e!94383))))

(assert (=> b!144809 (= res!68985 (not e!94381))))

(declare-fun res!68986 () Bool)

(assert (=> b!144809 (=> (not res!68986) (not e!94381))))

(assert (=> b!144809 (= res!68986 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!46107 (not res!68987)) b!144809))

(assert (= (and b!144809 res!68986) b!144808))

(assert (= (and b!144809 res!68985) b!144807))

(assert (= (and b!144807 c!27397) b!144805))

(assert (= (and b!144807 (not c!27397)) b!144806))

(assert (= (or b!144805 b!144806) bm!16113))

(assert (=> b!144807 m!174571))

(assert (=> b!144807 m!174571))

(assert (=> b!144807 m!174585))

(assert (=> b!144808 m!174571))

(assert (=> b!144808 m!174571))

(declare-fun m!174647 () Bool)

(assert (=> b!144808 m!174647))

(assert (=> bm!16113 m!174571))

(declare-fun m!174649 () Bool)

(assert (=> bm!16113 m!174649))

(assert (=> b!144809 m!174571))

(assert (=> b!144809 m!174571))

(assert (=> b!144809 m!174585))

(assert (=> b!144631 d!46107))

(declare-fun d!46109 () Bool)

(declare-fun e!94389 () Bool)

(assert (=> d!46109 e!94389))

(declare-fun res!68990 () Bool)

(assert (=> d!46109 (=> res!68990 e!94389)))

(declare-fun lt!76058 () Bool)

(assert (=> d!46109 (= res!68990 (not lt!76058))))

(declare-fun lt!76057 () Bool)

(assert (=> d!46109 (= lt!76058 lt!76057)))

(declare-fun lt!76055 () Unit!4578)

(declare-fun e!94390 () Unit!4578)

(assert (=> d!46109 (= lt!76055 e!94390)))

(declare-fun c!27400 () Bool)

(assert (=> d!46109 (= c!27400 lt!76057)))

(declare-fun containsKey!183 (List!1758 (_ BitVec 64)) Bool)

(assert (=> d!46109 (= lt!76057 (containsKey!183 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46109 (= (contains!936 lt!75955 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) lt!76058)))

(declare-fun b!144816 () Bool)

(declare-fun lt!76056 () Unit!4578)

(assert (=> b!144816 (= e!94390 lt!76056)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!131 (List!1758 (_ BitVec 64)) Unit!4578)

(assert (=> b!144816 (= lt!76056 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-datatypes ((Option!185 0))(
  ( (Some!184 (v!3325 V!3579)) (None!183) )
))
(declare-fun isDefined!132 (Option!185) Bool)

(declare-fun getValueByKey!179 (List!1758 (_ BitVec 64)) Option!185)

(assert (=> b!144816 (isDefined!132 (getValueByKey!179 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!144817 () Bool)

(declare-fun Unit!4583 () Unit!4578)

(assert (=> b!144817 (= e!94390 Unit!4583)))

(declare-fun b!144818 () Bool)

(assert (=> b!144818 (= e!94389 (isDefined!132 (getValueByKey!179 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (= (and d!46109 c!27400) b!144816))

(assert (= (and d!46109 (not c!27400)) b!144817))

(assert (= (and d!46109 (not res!68990)) b!144818))

(assert (=> d!46109 m!174471))

(declare-fun m!174651 () Bool)

(assert (=> d!46109 m!174651))

(assert (=> b!144816 m!174471))

(declare-fun m!174653 () Bool)

(assert (=> b!144816 m!174653))

(assert (=> b!144816 m!174471))

(declare-fun m!174655 () Bool)

(assert (=> b!144816 m!174655))

(assert (=> b!144816 m!174655))

(declare-fun m!174657 () Bool)

(assert (=> b!144816 m!174657))

(assert (=> b!144818 m!174471))

(assert (=> b!144818 m!174655))

(assert (=> b!144818 m!174655))

(assert (=> b!144818 m!174657))

(assert (=> b!144630 d!46109))

(declare-fun b!144899 () Bool)

(declare-fun e!94443 () Bool)

(declare-fun call!16185 () ListLongMap!1757)

(declare-fun call!16171 () ListLongMap!1757)

(assert (=> b!144899 (= e!94443 (= call!16185 call!16171))))

(declare-fun b!144900 () Bool)

(declare-fun e!94453 () Unit!4578)

(declare-fun lt!76128 () Unit!4578)

(assert (=> b!144900 (= e!94453 lt!76128)))

(declare-fun call!16188 () Unit!4578)

(assert (=> b!144900 (= lt!76128 call!16188)))

(declare-datatypes ((SeekEntryResult!282 0))(
  ( (MissingZero!282 (index!3294 (_ BitVec 32))) (Found!282 (index!3295 (_ BitVec 32))) (Intermediate!282 (undefined!1094 Bool) (index!3296 (_ BitVec 32)) (x!16514 (_ BitVec 32))) (Undefined!282) (MissingVacant!282 (index!3297 (_ BitVec 32))) )
))
(declare-fun lt!76131 () SeekEntryResult!282)

(declare-fun call!16181 () SeekEntryResult!282)

(assert (=> b!144900 (= lt!76131 call!16181)))

(declare-fun c!27437 () Bool)

(assert (=> b!144900 (= c!27437 ((_ is MissingZero!282) lt!76131))))

(declare-fun e!94435 () Bool)

(assert (=> b!144900 e!94435))

(declare-fun b!144901 () Bool)

(declare-fun lt!76135 () tuple2!2724)

(declare-fun call!16183 () tuple2!2724)

(assert (=> b!144901 (= lt!76135 call!16183)))

(declare-fun e!94451 () tuple2!2724)

(assert (=> b!144901 (= e!94451 (tuple2!2725 (_1!1373 lt!76135) (_2!1373 lt!76135)))))

(declare-fun b!144902 () Bool)

(declare-fun e!94444 () Bool)

(declare-fun call!16178 () Bool)

(assert (=> b!144902 (= e!94444 (not call!16178))))

(declare-fun call!16169 () ListLongMap!1757)

(declare-fun c!27429 () Bool)

(declare-fun call!16177 () ListLongMap!1757)

(declare-fun call!16170 () ListLongMap!1757)

(declare-fun call!16168 () ListLongMap!1757)

(declare-fun c!27435 () Bool)

(declare-fun bm!16162 () Bool)

(assert (=> bm!16162 (= call!16168 (+!182 (ite c!27429 (ite c!27435 call!16177 call!16170) call!16169) (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!144903 () Bool)

(declare-fun lt!76113 () Unit!4578)

(assert (=> b!144903 (= lt!76113 e!94453)))

(declare-fun c!27432 () Bool)

(declare-fun call!16172 () Bool)

(assert (=> b!144903 (= c!27432 call!16172)))

(declare-fun e!94448 () tuple2!2724)

(assert (=> b!144903 (= e!94448 (tuple2!2725 false newMap!16))))

(declare-fun b!144904 () Bool)

(declare-fun e!94441 () Bool)

(declare-fun call!16184 () Bool)

(assert (=> b!144904 (= e!94441 (not call!16184))))

(declare-fun b!144905 () Bool)

(declare-fun e!94434 () Bool)

(assert (=> b!144905 (= e!94434 ((_ is Undefined!282) lt!76131))))

(declare-fun call!16167 () SeekEntryResult!282)

(declare-fun bm!16163 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4939 (_ BitVec 32)) SeekEntryResult!282)

(assert (=> bm!16163 (= call!16167 (seekEntryOrOpen!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4756 newMap!16) (mask!7353 newMap!16)))))

(declare-fun b!144906 () Bool)

(declare-fun lt!76116 () SeekEntryResult!282)

(declare-fun e!94439 () Bool)

(assert (=> b!144906 (= e!94439 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76116)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!144907 () Bool)

(declare-fun c!27428 () Bool)

(declare-fun lt!76138 () SeekEntryResult!282)

(assert (=> b!144907 (= c!27428 ((_ is MissingVacant!282) lt!76138))))

(declare-fun e!94433 () tuple2!2724)

(assert (=> b!144907 (= e!94448 e!94433)))

(declare-fun c!27430 () Bool)

(declare-fun c!27431 () Bool)

(declare-fun c!27427 () Bool)

(declare-fun call!16186 () Bool)

(declare-fun lt!76127 () SeekEntryResult!282)

(declare-fun bm!16164 () Bool)

(declare-fun lt!76125 () SeekEntryResult!282)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!16164 (= call!16186 (inRange!0 (ite c!27431 (ite c!27432 (index!3295 lt!76116) (ite c!27437 (index!3294 lt!76131) (index!3297 lt!76131))) (ite c!27430 (index!3295 lt!76127) (ite c!27427 (index!3294 lt!76125) (index!3297 lt!76125)))) (mask!7353 newMap!16)))))

(declare-fun b!144908 () Bool)

(declare-fun e!94450 () tuple2!2724)

(assert (=> b!144908 (= e!94450 e!94448)))

(assert (=> b!144908 (= lt!76138 (seekEntryOrOpen!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4756 newMap!16) (mask!7353 newMap!16)))))

(assert (=> b!144908 (= c!27431 ((_ is Undefined!282) lt!76138))))

(declare-fun b!144909 () Bool)

(declare-fun res!69029 () Bool)

(declare-fun call!16176 () Bool)

(assert (=> b!144909 (= res!69029 call!16176)))

(declare-fun e!94438 () Bool)

(assert (=> b!144909 (=> (not res!69029) (not e!94438))))

(declare-fun lt!76134 () (_ BitVec 32))

(declare-fun bm!16165 () Bool)

(declare-fun call!16174 () ListLongMap!1757)

(assert (=> bm!16165 (= call!16174 (getCurrentListMap!564 (_keys!4756 newMap!16) (ite (or c!27429 c!27431) (_values!2972 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16)))) (mask!7353 newMap!16) (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) (zeroValue!2835 newMap!16) (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun bm!16166 () Bool)

(declare-fun call!16179 () Bool)

(assert (=> bm!16166 (= call!16178 call!16179)))

(declare-fun b!144910 () Bool)

(declare-fun res!69026 () Bool)

(declare-fun e!94446 () Bool)

(assert (=> b!144910 (=> (not res!69026) (not e!94446))))

(declare-fun call!16173 () Bool)

(assert (=> b!144910 (= res!69026 call!16173)))

(assert (=> b!144910 (= e!94435 e!94446)))

(declare-fun d!46111 () Bool)

(declare-fun e!94452 () Bool)

(assert (=> d!46111 e!94452))

(declare-fun res!69031 () Bool)

(assert (=> d!46111 (=> (not res!69031) (not e!94452))))

(declare-fun lt!76120 () tuple2!2724)

(assert (=> d!46111 (= res!69031 (valid!565 (_2!1373 lt!76120)))))

(assert (=> d!46111 (= lt!76120 e!94450)))

(assert (=> d!46111 (= c!27429 (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvneg (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (=> d!46111 (valid!565 newMap!16)))

(assert (=> d!46111 (= (update!217 newMap!16 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!76120)))

(declare-fun b!144911 () Bool)

(assert (=> b!144911 (= e!94452 e!94443)))

(declare-fun c!27438 () Bool)

(assert (=> b!144911 (= c!27438 (_1!1373 lt!76120))))

(declare-fun b!144912 () Bool)

(declare-fun e!94440 () Bool)

(assert (=> b!144912 (= e!94440 ((_ is Undefined!282) lt!76125))))

(declare-fun bm!16167 () Bool)

(declare-fun call!16175 () ListLongMap!1757)

(assert (=> bm!16167 (= call!16175 call!16168)))

(declare-fun bm!16168 () Bool)

(assert (=> bm!16168 (= call!16179 (arrayContainsKey!0 (_keys!4756 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!144913 () Bool)

(declare-fun res!69028 () Bool)

(declare-fun call!16187 () Bool)

(assert (=> b!144913 (= res!69028 call!16187)))

(assert (=> b!144913 (=> (not res!69028) (not e!94439))))

(declare-fun bm!16169 () Bool)

(declare-fun updateHelperNewKey!68 (LongMapFixedSize!1170 (_ BitVec 64) V!3579 (_ BitVec 32)) tuple2!2724)

(assert (=> bm!16169 (= call!16183 (updateHelperNewKey!68 newMap!16 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138))))))

(declare-fun bm!16170 () Bool)

(declare-fun call!16165 () SeekEntryResult!282)

(assert (=> bm!16170 (= call!16165 call!16167)))

(declare-fun b!144914 () Bool)

(declare-fun e!94442 () Bool)

(assert (=> b!144914 (= e!94442 (not call!16178))))

(declare-fun b!144915 () Bool)

(assert (=> b!144915 (= e!94440 e!94444)))

(declare-fun res!69030 () Bool)

(declare-fun call!16180 () Bool)

(assert (=> b!144915 (= res!69030 call!16180)))

(assert (=> b!144915 (=> (not res!69030) (not e!94444))))

(declare-fun b!144916 () Bool)

(declare-fun c!27436 () Bool)

(assert (=> b!144916 (= c!27436 ((_ is MissingVacant!282) lt!76125))))

(declare-fun e!94436 () Bool)

(assert (=> b!144916 (= e!94436 e!94440)))

(declare-fun b!144917 () Bool)

(assert (=> b!144917 (= e!94434 e!94441)))

(declare-fun res!69020 () Bool)

(assert (=> b!144917 (= res!69020 call!16173)))

(assert (=> b!144917 (=> (not res!69020) (not e!94441))))

(declare-fun b!144918 () Bool)

(declare-fun c!27433 () Bool)

(assert (=> b!144918 (= c!27433 ((_ is MissingVacant!282) lt!76131))))

(assert (=> b!144918 (= e!94435 e!94434)))

(declare-fun b!144919 () Bool)

(declare-fun lt!76123 () tuple2!2724)

(assert (=> b!144919 (= e!94433 (tuple2!2725 (_1!1373 lt!76123) (_2!1373 lt!76123)))))

(assert (=> b!144919 (= lt!76123 call!16183)))

(declare-fun bm!16171 () Bool)

(assert (=> bm!16171 (= call!16171 (map!1451 newMap!16))))

(declare-fun b!144920 () Bool)

(declare-fun e!94447 () ListLongMap!1757)

(declare-fun lt!76129 () array!4941)

(assert (=> b!144920 (= e!94447 (getCurrentListMap!564 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun b!144921 () Bool)

(declare-fun res!69025 () Bool)

(assert (=> b!144921 (=> (not res!69025) (not e!94442))))

(assert (=> b!144921 (= res!69025 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3294 lt!76125)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144922 () Bool)

(assert (=> b!144922 (= e!94433 e!94451)))

(declare-fun c!27434 () Bool)

(assert (=> b!144922 (= c!27434 ((_ is MissingZero!282) lt!76138))))

(declare-fun bm!16172 () Bool)

(assert (=> bm!16172 (= call!16185 (map!1451 (_2!1373 lt!76120)))))

(declare-fun bm!16173 () Bool)

(assert (=> bm!16173 (= call!16176 call!16186)))

(declare-fun b!144923 () Bool)

(declare-fun res!69021 () Bool)

(assert (=> b!144923 (=> (not res!69021) (not e!94442))))

(assert (=> b!144923 (= res!69021 call!16180)))

(assert (=> b!144923 (= e!94436 e!94442)))

(declare-fun b!144924 () Bool)

(declare-fun Unit!4584 () Unit!4578)

(assert (=> b!144924 (= e!94453 Unit!4584)))

(declare-fun lt!76115 () Unit!4578)

(declare-fun call!16182 () Unit!4578)

(assert (=> b!144924 (= lt!76115 call!16182)))

(assert (=> b!144924 (= lt!76116 call!16181)))

(declare-fun res!69024 () Bool)

(assert (=> b!144924 (= res!69024 ((_ is Found!282) lt!76116))))

(assert (=> b!144924 (=> (not res!69024) (not e!94439))))

(assert (=> b!144924 e!94439))

(declare-fun lt!76137 () Unit!4578)

(assert (=> b!144924 (= lt!76137 lt!76115)))

(assert (=> b!144924 false))

(declare-fun bm!16174 () Bool)

(assert (=> bm!16174 (= call!16170 call!16169)))

(declare-fun bm!16175 () Bool)

(declare-fun c!27439 () Bool)

(assert (=> bm!16175 (= c!27439 c!27431)))

(assert (=> bm!16175 (= call!16172 (contains!936 e!94447 (ite c!27431 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76138)))))))

(declare-fun bm!16176 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 64) Int) Unit!4578)

(assert (=> bm!16176 (= call!16182 (lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2989 newMap!16)))))

(declare-fun b!144925 () Bool)

(declare-fun e!94445 () Bool)

(assert (=> b!144925 (= e!94445 (= call!16185 (+!182 call!16171 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!16177 () Bool)

(declare-fun call!16166 () ListLongMap!1757)

(assert (=> bm!16177 (= call!16166 call!16174)))

(declare-fun bm!16178 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 64) Int) Unit!4578)

(assert (=> bm!16178 (= call!16188 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2989 newMap!16)))))

(declare-fun b!144926 () Bool)

(declare-fun e!94437 () Unit!4578)

(declare-fun Unit!4585 () Unit!4578)

(assert (=> b!144926 (= e!94437 Unit!4585)))

(declare-fun lt!76133 () Unit!4578)

(assert (=> b!144926 (= lt!76133 call!16188)))

(assert (=> b!144926 (= lt!76125 call!16165)))

(assert (=> b!144926 (= c!27427 ((_ is MissingZero!282) lt!76125))))

(assert (=> b!144926 e!94436))

(declare-fun lt!76130 () Unit!4578)

(assert (=> b!144926 (= lt!76130 lt!76133)))

(assert (=> b!144926 false))

(declare-fun b!144927 () Bool)

(assert (=> b!144927 (= e!94438 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76127)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun bm!16179 () Bool)

(declare-fun lt!76122 () (_ BitVec 32))

(assert (=> bm!16179 (= call!16169 (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun b!144928 () Bool)

(declare-fun lt!76118 () Unit!4578)

(declare-fun lt!76114 () Unit!4578)

(assert (=> b!144928 (= lt!76118 lt!76114)))

(assert (=> b!144928 (= call!16175 call!16170)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!68 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 V!3579 Int) Unit!4578)

(assert (=> b!144928 (= lt!76114 (lemmaChangeZeroKeyThenAddPairToListMap!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) lt!76122 (zeroValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2835 newMap!16) (defaultEntry!2989 newMap!16)))))

(assert (=> b!144928 (= lt!76122 (bvor (extraKeys!2736 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!94449 () tuple2!2724)

(assert (=> b!144928 (= e!94449 (tuple2!2725 true (LongMapFixedSize!1171 (defaultEntry!2989 newMap!16) (mask!7353 newMap!16) (bvor (extraKeys!2736 newMap!16) #b00000000000000000000000000000001) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2835 newMap!16) (_size!634 newMap!16) (_keys!4756 newMap!16) (_values!2972 newMap!16) (_vacant!634 newMap!16))))))

(declare-fun b!144929 () Bool)

(declare-fun res!69019 () Bool)

(assert (=> b!144929 (= res!69019 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3297 lt!76131)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144929 (=> (not res!69019) (not e!94441))))

(declare-fun b!144930 () Bool)

(declare-fun lt!76124 () Unit!4578)

(declare-fun lt!76119 () Unit!4578)

(assert (=> b!144930 (= lt!76124 lt!76119)))

(assert (=> b!144930 call!16172))

(declare-fun lemmaValidKeyInArrayIsInListMap!129 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 32) Int) Unit!4578)

(assert (=> b!144930 (= lt!76119 (lemmaValidKeyInArrayIsInListMap!129 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (index!3295 lt!76138) (defaultEntry!2989 newMap!16)))))

(assert (=> b!144930 (= lt!76129 (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16))))))

(declare-fun lt!76136 () Unit!4578)

(declare-fun lt!76132 () Unit!4578)

(assert (=> b!144930 (= lt!76136 lt!76132)))

(assert (=> b!144930 (= call!16168 call!16166)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!68 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 32) (_ BitVec 64) V!3579 Int) Unit!4578)

(assert (=> b!144930 (= lt!76132 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (index!3295 lt!76138) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76117 () Unit!4578)

(assert (=> b!144930 (= lt!76117 e!94437)))

(assert (=> b!144930 (= c!27430 (contains!936 call!16169 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!144930 (= e!94451 (tuple2!2725 true (LongMapFixedSize!1171 (defaultEntry!2989 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (_size!634 newMap!16) (_keys!4756 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16))) (_vacant!634 newMap!16))))))

(declare-fun bm!16180 () Bool)

(assert (=> bm!16180 (= call!16181 call!16167)))

(declare-fun bm!16181 () Bool)

(assert (=> bm!16181 (= call!16180 call!16176)))

(declare-fun b!144931 () Bool)

(assert (=> b!144931 (= e!94450 e!94449)))

(assert (=> b!144931 (= c!27435 (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!144932 () Bool)

(declare-fun res!69022 () Bool)

(assert (=> b!144932 (=> (not res!69022) (not e!94446))))

(assert (=> b!144932 (= res!69022 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3294 lt!76131)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!16182 () Bool)

(assert (=> bm!16182 (= call!16177 call!16174)))

(declare-fun bm!16183 () Bool)

(assert (=> bm!16183 (= call!16173 call!16187)))

(declare-fun b!144933 () Bool)

(declare-fun lt!76126 () Unit!4578)

(assert (=> b!144933 (= e!94437 lt!76126)))

(assert (=> b!144933 (= lt!76126 call!16182)))

(assert (=> b!144933 (= lt!76127 call!16165)))

(declare-fun res!69032 () Bool)

(assert (=> b!144933 (= res!69032 ((_ is Found!282) lt!76127))))

(assert (=> b!144933 (=> (not res!69032) (not e!94438))))

(assert (=> b!144933 e!94438))

(declare-fun b!144934 () Bool)

(assert (=> b!144934 (= e!94447 call!16166)))

(declare-fun bm!16184 () Bool)

(assert (=> bm!16184 (= call!16184 call!16179)))

(declare-fun b!144935 () Bool)

(declare-fun res!69023 () Bool)

(assert (=> b!144935 (= res!69023 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3297 lt!76125)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144935 (=> (not res!69023) (not e!94444))))

(declare-fun b!144936 () Bool)

(assert (=> b!144936 (= e!94446 (not call!16184))))

(declare-fun b!144937 () Bool)

(assert (=> b!144937 (= e!94443 e!94445)))

(declare-fun res!69027 () Bool)

(assert (=> b!144937 (= res!69027 (contains!936 call!16185 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!144937 (=> (not res!69027) (not e!94445))))

(declare-fun b!144938 () Bool)

(declare-fun lt!76121 () Unit!4578)

(declare-fun lt!76139 () Unit!4578)

(assert (=> b!144938 (= lt!76121 lt!76139)))

(assert (=> b!144938 (= call!16175 call!16177)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!68 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 V!3579 Int) Unit!4578)

(assert (=> b!144938 (= lt!76139 (lemmaChangeLongMinValueKeyThenAddPairToListMap!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) lt!76134 (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2989 newMap!16)))))

(assert (=> b!144938 (= lt!76134 (bvor (extraKeys!2736 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!144938 (= e!94449 (tuple2!2725 true (LongMapFixedSize!1171 (defaultEntry!2989 newMap!16) (mask!7353 newMap!16) (bvor (extraKeys!2736 newMap!16) #b00000000000000000000000000000010) (zeroValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!634 newMap!16) (_keys!4756 newMap!16) (_values!2972 newMap!16) (_vacant!634 newMap!16))))))

(declare-fun bm!16185 () Bool)

(assert (=> bm!16185 (= call!16187 call!16186)))

(assert (= (and d!46111 c!27429) b!144931))

(assert (= (and d!46111 (not c!27429)) b!144908))

(assert (= (and b!144931 c!27435) b!144928))

(assert (= (and b!144931 (not c!27435)) b!144938))

(assert (= (or b!144928 b!144938) bm!16174))

(assert (= (or b!144928 b!144938) bm!16182))

(assert (= (or b!144928 b!144938) bm!16167))

(assert (= (and b!144908 c!27431) b!144903))

(assert (= (and b!144908 (not c!27431)) b!144907))

(assert (= (and b!144903 c!27432) b!144924))

(assert (= (and b!144903 (not c!27432)) b!144900))

(assert (= (and b!144924 res!69024) b!144913))

(assert (= (and b!144913 res!69028) b!144906))

(assert (= (and b!144900 c!27437) b!144910))

(assert (= (and b!144900 (not c!27437)) b!144918))

(assert (= (and b!144910 res!69026) b!144932))

(assert (= (and b!144932 res!69022) b!144936))

(assert (= (and b!144918 c!27433) b!144917))

(assert (= (and b!144918 (not c!27433)) b!144905))

(assert (= (and b!144917 res!69020) b!144929))

(assert (= (and b!144929 res!69019) b!144904))

(assert (= (or b!144910 b!144917) bm!16183))

(assert (= (or b!144936 b!144904) bm!16184))

(assert (= (or b!144913 bm!16183) bm!16185))

(assert (= (or b!144924 b!144900) bm!16180))

(assert (= (and b!144907 c!27428) b!144919))

(assert (= (and b!144907 (not c!27428)) b!144922))

(assert (= (and b!144922 c!27434) b!144901))

(assert (= (and b!144922 (not c!27434)) b!144930))

(assert (= (and b!144930 c!27430) b!144933))

(assert (= (and b!144930 (not c!27430)) b!144926))

(assert (= (and b!144933 res!69032) b!144909))

(assert (= (and b!144909 res!69029) b!144927))

(assert (= (and b!144926 c!27427) b!144923))

(assert (= (and b!144926 (not c!27427)) b!144916))

(assert (= (and b!144923 res!69021) b!144921))

(assert (= (and b!144921 res!69025) b!144914))

(assert (= (and b!144916 c!27436) b!144915))

(assert (= (and b!144916 (not c!27436)) b!144912))

(assert (= (and b!144915 res!69030) b!144935))

(assert (= (and b!144935 res!69023) b!144902))

(assert (= (or b!144923 b!144915) bm!16181))

(assert (= (or b!144914 b!144902) bm!16166))

(assert (= (or b!144909 bm!16181) bm!16173))

(assert (= (or b!144933 b!144926) bm!16170))

(assert (= (or b!144919 b!144901) bm!16169))

(assert (= (or b!144903 b!144930) bm!16177))

(assert (= (or b!144924 b!144933) bm!16176))

(assert (= (or b!144900 b!144926) bm!16178))

(assert (= (or bm!16185 bm!16173) bm!16164))

(assert (= (or bm!16184 bm!16166) bm!16168))

(assert (= (or bm!16180 bm!16170) bm!16163))

(assert (= (or b!144903 b!144930) bm!16175))

(assert (= (and bm!16175 c!27439) b!144934))

(assert (= (and bm!16175 (not c!27439)) b!144920))

(assert (= (or bm!16174 b!144930) bm!16179))

(assert (= (or bm!16182 bm!16177) bm!16165))

(assert (= (or bm!16167 b!144930) bm!16162))

(assert (= (and d!46111 res!69031) b!144911))

(assert (= (and b!144911 c!27438) b!144937))

(assert (= (and b!144911 (not c!27438)) b!144899))

(assert (= (and b!144937 res!69027) b!144925))

(assert (= (or b!144937 b!144925 b!144899) bm!16172))

(assert (= (or b!144925 b!144899) bm!16171))

(declare-fun m!174659 () Bool)

(assert (=> bm!16165 m!174659))

(declare-fun m!174661 () Bool)

(assert (=> bm!16165 m!174661))

(declare-fun m!174663 () Bool)

(assert (=> b!144925 m!174663))

(declare-fun m!174665 () Bool)

(assert (=> d!46111 m!174665))

(assert (=> d!46111 m!174469))

(declare-fun m!174667 () Bool)

(assert (=> b!144935 m!174667))

(declare-fun m!174669 () Bool)

(assert (=> bm!16179 m!174669))

(declare-fun m!174671 () Bool)

(assert (=> b!144929 m!174671))

(assert (=> bm!16176 m!174471))

(declare-fun m!174673 () Bool)

(assert (=> bm!16176 m!174673))

(declare-fun m!174675 () Bool)

(assert (=> bm!16162 m!174675))

(assert (=> b!144937 m!174471))

(declare-fun m!174677 () Bool)

(assert (=> b!144937 m!174677))

(assert (=> bm!16168 m!174471))

(declare-fun m!174679 () Bool)

(assert (=> bm!16168 m!174679))

(declare-fun m!174681 () Bool)

(assert (=> b!144921 m!174681))

(declare-fun m!174683 () Bool)

(assert (=> bm!16164 m!174683))

(declare-fun m!174685 () Bool)

(assert (=> b!144927 m!174685))

(assert (=> bm!16169 m!174471))

(assert (=> bm!16169 m!174481))

(declare-fun m!174687 () Bool)

(assert (=> bm!16169 m!174687))

(declare-fun m!174689 () Bool)

(assert (=> b!144920 m!174689))

(assert (=> b!144908 m!174471))

(declare-fun m!174691 () Bool)

(assert (=> b!144908 m!174691))

(declare-fun m!174693 () Bool)

(assert (=> b!144932 m!174693))

(assert (=> bm!16163 m!174471))

(assert (=> bm!16163 m!174691))

(assert (=> b!144938 m!174481))

(declare-fun m!174695 () Bool)

(assert (=> b!144938 m!174695))

(assert (=> bm!16171 m!174473))

(assert (=> bm!16178 m!174471))

(declare-fun m!174697 () Bool)

(assert (=> bm!16178 m!174697))

(declare-fun m!174699 () Bool)

(assert (=> bm!16172 m!174699))

(declare-fun m!174701 () Bool)

(assert (=> b!144930 m!174701))

(assert (=> b!144930 m!174659))

(assert (=> b!144930 m!174471))

(assert (=> b!144930 m!174481))

(declare-fun m!174703 () Bool)

(assert (=> b!144930 m!174703))

(assert (=> b!144930 m!174471))

(declare-fun m!174705 () Bool)

(assert (=> b!144930 m!174705))

(assert (=> b!144928 m!174481))

(declare-fun m!174707 () Bool)

(assert (=> b!144928 m!174707))

(declare-fun m!174709 () Bool)

(assert (=> bm!16175 m!174709))

(declare-fun m!174711 () Bool)

(assert (=> bm!16175 m!174711))

(declare-fun m!174713 () Bool)

(assert (=> b!144906 m!174713))

(assert (=> b!144630 d!46111))

(declare-fun d!46113 () Bool)

(declare-fun c!27442 () Bool)

(assert (=> d!46113 (= c!27442 ((_ is ValueCellFull!1131) (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun e!94456 () V!3579)

(assert (=> d!46113 (= (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94456)))

(declare-fun b!144943 () Bool)

(declare-fun get!1551 (ValueCell!1131 V!3579) V!3579)

(assert (=> b!144943 (= e!94456 (get!1551 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!144944 () Bool)

(declare-fun get!1552 (ValueCell!1131 V!3579) V!3579)

(assert (=> b!144944 (= e!94456 (get!1552 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46113 c!27442) b!144943))

(assert (= (and d!46113 (not c!27442)) b!144944))

(assert (=> b!144943 m!174477))

(assert (=> b!144943 m!174479))

(declare-fun m!174715 () Bool)

(assert (=> b!144943 m!174715))

(assert (=> b!144944 m!174477))

(assert (=> b!144944 m!174479))

(declare-fun m!174717 () Bool)

(assert (=> b!144944 m!174717))

(assert (=> b!144630 d!46113))

(declare-fun b!144945 () Bool)

(declare-fun e!94460 () Bool)

(declare-fun call!16189 () Bool)

(assert (=> b!144945 (= e!94460 call!16189)))

(declare-fun b!144946 () Bool)

(assert (=> b!144946 (= e!94460 call!16189)))

(declare-fun b!144947 () Bool)

(declare-fun e!94459 () Bool)

(assert (=> b!144947 (= e!94459 e!94460)))

(declare-fun c!27443 () Bool)

(assert (=> b!144947 (= c!27443 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun d!46115 () Bool)

(declare-fun res!69035 () Bool)

(declare-fun e!94458 () Bool)

(assert (=> d!46115 (=> res!69035 e!94458)))

(assert (=> d!46115 (= res!69035 (bvsge from!355 (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46115 (= (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) from!355 Nil!1756) e!94458)))

(declare-fun b!144948 () Bool)

(declare-fun e!94457 () Bool)

(assert (=> b!144948 (= e!94457 (contains!937 Nil!1756 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun bm!16186 () Bool)

(assert (=> bm!16186 (= call!16189 (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27443 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1756) Nil!1756)))))

(declare-fun b!144949 () Bool)

(assert (=> b!144949 (= e!94458 e!94459)))

(declare-fun res!69033 () Bool)

(assert (=> b!144949 (=> (not res!69033) (not e!94459))))

(assert (=> b!144949 (= res!69033 (not e!94457))))

(declare-fun res!69034 () Bool)

(assert (=> b!144949 (=> (not res!69034) (not e!94457))))

(assert (=> b!144949 (= res!69034 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (= (and d!46115 (not res!69035)) b!144949))

(assert (= (and b!144949 res!69034) b!144948))

(assert (= (and b!144949 res!69033) b!144947))

(assert (= (and b!144947 c!27443) b!144945))

(assert (= (and b!144947 (not c!27443)) b!144946))

(assert (= (or b!144945 b!144946) bm!16186))

(assert (=> b!144947 m!174471))

(assert (=> b!144947 m!174471))

(declare-fun m!174719 () Bool)

(assert (=> b!144947 m!174719))

(assert (=> b!144948 m!174471))

(assert (=> b!144948 m!174471))

(declare-fun m!174721 () Bool)

(assert (=> b!144948 m!174721))

(assert (=> bm!16186 m!174471))

(declare-fun m!174723 () Bool)

(assert (=> bm!16186 m!174723))

(assert (=> b!144949 m!174471))

(assert (=> b!144949 m!174471))

(assert (=> b!144949 m!174719))

(assert (=> b!144629 d!46115))

(declare-fun d!46117 () Bool)

(assert (=> d!46117 (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) from!355 Nil!1756)))

(declare-fun lt!76142 () Unit!4578)

(declare-fun choose!39 (array!4939 (_ BitVec 32) (_ BitVec 32)) Unit!4578)

(assert (=> d!46117 (= lt!76142 (choose!39 (_keys!4756 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!46117 (bvslt (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!46117 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355) lt!76142)))

(declare-fun bs!6106 () Bool)

(assert (= bs!6106 d!46117))

(assert (=> bs!6106 m!174501))

(declare-fun m!174725 () Bool)

(assert (=> bs!6106 m!174725))

(assert (=> b!144629 d!46117))

(declare-fun d!46119 () Bool)

(declare-fun res!69040 () Bool)

(declare-fun e!94465 () Bool)

(assert (=> d!46119 (=> res!69040 e!94465)))

(assert (=> d!46119 (= res!69040 (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46119 (= (arrayContainsKey!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!94465)))

(declare-fun b!144954 () Bool)

(declare-fun e!94466 () Bool)

(assert (=> b!144954 (= e!94465 e!94466)))

(declare-fun res!69041 () Bool)

(assert (=> b!144954 (=> (not res!69041) (not e!94466))))

(assert (=> b!144954 (= res!69041 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!144955 () Bool)

(assert (=> b!144955 (= e!94466 (arrayContainsKey!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!46119 (not res!69040)) b!144954))

(assert (= (and b!144954 res!69041) b!144955))

(assert (=> d!46119 m!174571))

(assert (=> b!144955 m!174471))

(declare-fun m!174727 () Bool)

(assert (=> b!144955 m!174727))

(assert (=> b!144629 d!46119))

(declare-fun d!46121 () Bool)

(declare-fun e!94469 () Bool)

(assert (=> d!46121 e!94469))

(declare-fun c!27446 () Bool)

(assert (=> d!46121 (= c!27446 (and (not (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!76145 () Unit!4578)

(declare-fun choose!889 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 64) (_ BitVec 32) Int) Unit!4578)

(assert (=> d!46121 (= lt!76145 (choose!889 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))))))

(assert (=> d!46121 (validMask!0 (mask!7353 (v!3320 (underlying!488 thiss!992))))))

(assert (=> d!46121 (= (lemmaListMapContainsThenArrayContainsFrom!145 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))) lt!76145)))

(declare-fun b!144960 () Bool)

(assert (=> b!144960 (= e!94469 (arrayContainsKey!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!144961 () Bool)

(assert (=> b!144961 (= e!94469 (ite (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46121 c!27446) b!144960))

(assert (= (and d!46121 (not c!27446)) b!144961))

(assert (=> d!46121 m!174471))

(declare-fun m!174729 () Bool)

(assert (=> d!46121 m!174729))

(assert (=> d!46121 m!174589))

(assert (=> b!144960 m!174471))

(assert (=> b!144960 m!174505))

(assert (=> b!144629 d!46121))

(declare-fun d!46123 () Bool)

(assert (=> d!46123 (= (array_inv!1469 (_keys!4756 newMap!16)) (bvsge (size!2608 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144637 d!46123))

(declare-fun d!46125 () Bool)

(assert (=> d!46125 (= (array_inv!1470 (_values!2972 newMap!16)) (bvsge (size!2609 (_values!2972 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!144637 d!46125))

(declare-fun d!46127 () Bool)

(assert (=> d!46127 (= (array_inv!1469 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvsge (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!144644 d!46127))

(declare-fun d!46129 () Bool)

(assert (=> d!46129 (= (array_inv!1470 (_values!2972 (v!3320 (underlying!488 thiss!992)))) (bvsge (size!2609 (_values!2972 (v!3320 (underlying!488 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!144644 d!46129))

(declare-fun mapNonEmpty!4919 () Bool)

(declare-fun mapRes!4919 () Bool)

(declare-fun tp!11705 () Bool)

(declare-fun e!94475 () Bool)

(assert (=> mapNonEmpty!4919 (= mapRes!4919 (and tp!11705 e!94475))))

(declare-fun mapRest!4919 () (Array (_ BitVec 32) ValueCell!1131))

(declare-fun mapValue!4919 () ValueCell!1131)

(declare-fun mapKey!4919 () (_ BitVec 32))

(assert (=> mapNonEmpty!4919 (= mapRest!4910 (store mapRest!4919 mapKey!4919 mapValue!4919))))

(declare-fun b!144969 () Bool)

(declare-fun e!94474 () Bool)

(assert (=> b!144969 (= e!94474 tp_is_empty!2949)))

(declare-fun mapIsEmpty!4919 () Bool)

(assert (=> mapIsEmpty!4919 mapRes!4919))

(declare-fun condMapEmpty!4919 () Bool)

(declare-fun mapDefault!4919 () ValueCell!1131)

(assert (=> mapNonEmpty!4910 (= condMapEmpty!4919 (= mapRest!4910 ((as const (Array (_ BitVec 32) ValueCell!1131)) mapDefault!4919)))))

(assert (=> mapNonEmpty!4910 (= tp!11687 (and e!94474 mapRes!4919))))

(declare-fun b!144968 () Bool)

(assert (=> b!144968 (= e!94475 tp_is_empty!2949)))

(assert (= (and mapNonEmpty!4910 condMapEmpty!4919) mapIsEmpty!4919))

(assert (= (and mapNonEmpty!4910 (not condMapEmpty!4919)) mapNonEmpty!4919))

(assert (= (and mapNonEmpty!4919 ((_ is ValueCellFull!1131) mapValue!4919)) b!144968))

(assert (= (and mapNonEmpty!4910 ((_ is ValueCellFull!1131) mapDefault!4919)) b!144969))

(declare-fun m!174731 () Bool)

(assert (=> mapNonEmpty!4919 m!174731))

(declare-fun mapNonEmpty!4920 () Bool)

(declare-fun mapRes!4920 () Bool)

(declare-fun tp!11706 () Bool)

(declare-fun e!94477 () Bool)

(assert (=> mapNonEmpty!4920 (= mapRes!4920 (and tp!11706 e!94477))))

(declare-fun mapValue!4920 () ValueCell!1131)

(declare-fun mapRest!4920 () (Array (_ BitVec 32) ValueCell!1131))

(declare-fun mapKey!4920 () (_ BitVec 32))

(assert (=> mapNonEmpty!4920 (= mapRest!4909 (store mapRest!4920 mapKey!4920 mapValue!4920))))

(declare-fun b!144971 () Bool)

(declare-fun e!94476 () Bool)

(assert (=> b!144971 (= e!94476 tp_is_empty!2949)))

(declare-fun mapIsEmpty!4920 () Bool)

(assert (=> mapIsEmpty!4920 mapRes!4920))

(declare-fun condMapEmpty!4920 () Bool)

(declare-fun mapDefault!4920 () ValueCell!1131)

(assert (=> mapNonEmpty!4909 (= condMapEmpty!4920 (= mapRest!4909 ((as const (Array (_ BitVec 32) ValueCell!1131)) mapDefault!4920)))))

(assert (=> mapNonEmpty!4909 (= tp!11689 (and e!94476 mapRes!4920))))

(declare-fun b!144970 () Bool)

(assert (=> b!144970 (= e!94477 tp_is_empty!2949)))

(assert (= (and mapNonEmpty!4909 condMapEmpty!4920) mapIsEmpty!4920))

(assert (= (and mapNonEmpty!4909 (not condMapEmpty!4920)) mapNonEmpty!4920))

(assert (= (and mapNonEmpty!4920 ((_ is ValueCellFull!1131) mapValue!4920)) b!144970))

(assert (= (and mapNonEmpty!4909 ((_ is ValueCellFull!1131) mapDefault!4920)) b!144971))

(declare-fun m!174733 () Bool)

(assert (=> mapNonEmpty!4920 m!174733))

(declare-fun b_lambda!6497 () Bool)

(assert (= b_lambda!6495 (or (and b!144644 b_free!3065) (and b!144637 b_free!3067 (= (defaultEntry!2989 newMap!16) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))))) b_lambda!6497)))

(check-sat (not bm!16165) (not b!144955) (not b!144771) (not mapNonEmpty!4919) (not b!144807) (not b!144809) (not bm!16178) (not b_lambda!6493) (not bm!16106) (not b!144947) (not b!144943) (not b!144944) (not bm!16108) (not d!46121) (not b!144794) (not b_next!3067) (not b!144766) (not b_next!3065) (not b!144937) (not bm!16175) (not b!144759) (not d!46103) (not d!46111) (not b!144920) (not b!144949) (not b!144792) (not bm!16179) (not b!144714) (not b!144948) b_and!9033 (not b!144775) (not d!46095) (not mapNonEmpty!4920) (not b!144818) (not d!46093) (not bm!16168) (not b!144773) (not bm!16171) (not b!144925) (not b!144776) (not b!144791) (not b!144808) (not b!144930) (not b!144938) (not bm!16107) (not bm!16105) (not b!144782) (not bm!16113) (not d!46097) (not d!46101) (not bm!16169) (not bm!16162) (not b!144763) (not bm!16163) b_and!9031 (not b_lambda!6497) (not b!144960) (not bm!16164) (not bm!16186) (not b!144790) (not b!144908) (not d!46117) (not d!46105) (not b!144783) (not d!46109) (not bm!16176) tp_is_empty!2949 (not b!144928) (not bm!16172) (not b!144816) (not b!144764))
(check-sat b_and!9031 b_and!9033 (not b_next!3065) (not b_next!3067))
(get-model)

(declare-fun call!16200 () SeekEntryResult!282)

(declare-fun bm!16195 () Bool)

(assert (=> bm!16195 (= call!16200 (seekEntryOrOpen!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4756 newMap!16) (mask!7353 newMap!16)))))

(declare-fun b!145006 () Bool)

(declare-fun e!94498 () Unit!4578)

(declare-fun lt!76213 () Unit!4578)

(assert (=> b!145006 (= e!94498 lt!76213)))

(assert (=> b!145006 (= lt!76213 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76212 () SeekEntryResult!282)

(assert (=> b!145006 (= lt!76212 call!16200)))

(declare-fun c!27457 () Bool)

(assert (=> b!145006 (= c!27457 ((_ is MissingZero!282) lt!76212))))

(declare-fun e!94495 () Bool)

(assert (=> b!145006 e!94495))

(declare-fun b!145007 () Bool)

(declare-fun e!94494 () Unit!4578)

(declare-fun Unit!4586 () Unit!4578)

(assert (=> b!145007 (= e!94494 Unit!4586)))

(declare-fun lt!76211 () Unit!4578)

(declare-fun lemmaArrayContainsKeyThenInListMap!48 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 64) (_ BitVec 32) Int) Unit!4578)

(assert (=> b!145007 (= lt!76211 (lemmaArrayContainsKeyThenInListMap!48 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(assert (=> b!145007 (contains!936 (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355))))

(declare-fun lt!76215 () Unit!4578)

(assert (=> b!145007 (= lt!76215 lt!76211)))

(assert (=> b!145007 false))

(declare-fun bm!16196 () Bool)

(declare-fun lt!76227 () SeekEntryResult!282)

(declare-fun call!16201 () Bool)

(declare-fun c!27455 () Bool)

(assert (=> bm!16196 (= call!16201 (inRange!0 (ite c!27455 (index!3295 lt!76227) (ite c!27457 (index!3294 lt!76212) (index!3297 lt!76212))) (mask!7353 newMap!16)))))

(declare-fun b!145008 () Bool)

(declare-fun e!94499 () Bool)

(declare-fun e!94497 () Bool)

(assert (=> b!145008 (= e!94499 e!94497)))

(declare-fun res!69067 () Bool)

(declare-fun call!16199 () Bool)

(assert (=> b!145008 (= res!69067 call!16199)))

(assert (=> b!145008 (=> (not res!69067) (not e!94497))))

(declare-fun d!46131 () Bool)

(declare-fun e!94496 () Bool)

(assert (=> d!46131 e!94496))

(declare-fun res!69066 () Bool)

(assert (=> d!46131 (=> (not res!69066) (not e!94496))))

(declare-fun lt!76233 () tuple2!2724)

(assert (=> d!46131 (= res!69066 (_1!1373 lt!76233))))

(assert (=> d!46131 (= lt!76233 (tuple2!2725 true (LongMapFixedSize!1171 (defaultEntry!2989 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (bvadd (_size!634 newMap!16) #b00000000000000000000000000000001) (array!4940 (store (arr!2333 (_keys!4756 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2608 (_keys!4756 newMap!16))) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16))) (_vacant!634 newMap!16))))))

(declare-fun lt!76214 () Unit!4578)

(declare-fun lt!76221 () Unit!4578)

(assert (=> d!46131 (= lt!76214 lt!76221)))

(declare-fun lt!76220 () array!4939)

(declare-fun lt!76219 () array!4941)

(assert (=> d!46131 (contains!936 (getCurrentListMap!564 lt!76220 lt!76219 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) (select (store (arr!2333 (_keys!4756 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138))))))

(assert (=> d!46131 (= lt!76221 (lemmaValidKeyInArrayIsInListMap!129 lt!76220 lt!76219 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (defaultEntry!2989 newMap!16)))))

(assert (=> d!46131 (= lt!76219 (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16))))))

(assert (=> d!46131 (= lt!76220 (array!4940 (store (arr!2333 (_keys!4756 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2608 (_keys!4756 newMap!16))))))

(declare-fun lt!76229 () Unit!4578)

(declare-fun lt!76210 () Unit!4578)

(assert (=> d!46131 (= lt!76229 lt!76210)))

(declare-fun lt!76222 () array!4939)

(assert (=> d!46131 (= (arrayCountValidKeys!0 lt!76222 (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (bvadd (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4939 (_ BitVec 32)) Unit!4578)

(assert (=> d!46131 (= lt!76210 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!76222 (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138))))))

(assert (=> d!46131 (= lt!76222 (array!4940 (store (arr!2333 (_keys!4756 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2608 (_keys!4756 newMap!16))))))

(declare-fun lt!76228 () Unit!4578)

(declare-fun lt!76226 () Unit!4578)

(assert (=> d!46131 (= lt!76228 lt!76226)))

(declare-fun lt!76208 () array!4939)

(assert (=> d!46131 (arrayContainsKey!0 lt!76208 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4939 (_ BitVec 64) (_ BitVec 32)) Unit!4578)

(assert (=> d!46131 (= lt!76226 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!76208 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138))))))

(assert (=> d!46131 (= lt!76208 (array!4940 (store (arr!2333 (_keys!4756 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2608 (_keys!4756 newMap!16))))))

(declare-fun lt!76209 () Unit!4578)

(declare-fun lt!76231 () Unit!4578)

(assert (=> d!46131 (= lt!76209 lt!76231)))

(assert (=> d!46131 (= (+!182 (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!564 (array!4940 (store (arr!2333 (_keys!4756 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2608 (_keys!4756 newMap!16))) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16))) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!48 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 32) (_ BitVec 64) V!3579 Int) Unit!4578)

(assert (=> d!46131 (= lt!76231 (lemmaAddValidKeyToArrayThenAddPairToListMap!48 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76235 () Unit!4578)

(declare-fun lt!76207 () Unit!4578)

(assert (=> d!46131 (= lt!76235 lt!76207)))

(assert (=> d!46131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4940 (store (arr!2333 (_keys!4756 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2608 (_keys!4756 newMap!16))) (mask!7353 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4939 (_ BitVec 32) (_ BitVec 32)) Unit!4578)

(assert (=> d!46131 (= lt!76207 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4756 newMap!16) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (mask!7353 newMap!16)))))

(declare-fun lt!76234 () Unit!4578)

(declare-fun lt!76232 () Unit!4578)

(assert (=> d!46131 (= lt!76234 lt!76232)))

(assert (=> d!46131 (= (arrayCountValidKeys!0 (array!4940 (store (arr!2333 (_keys!4756 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2608 (_keys!4756 newMap!16))) #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4756 newMap!16) #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4939 (_ BitVec 32) (_ BitVec 64)) Unit!4578)

(assert (=> d!46131 (= lt!76232 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4756 newMap!16) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun lt!76216 () Unit!4578)

(declare-fun lt!76206 () Unit!4578)

(assert (=> d!46131 (= lt!76216 lt!76206)))

(declare-fun lt!76224 () (_ BitVec 32))

(declare-fun lt!76218 () List!1759)

(assert (=> d!46131 (arrayNoDuplicates!0 (array!4940 (store (arr!2333 (_keys!4756 newMap!16)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (size!2608 (_keys!4756 newMap!16))) lt!76224 lt!76218)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4939 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1759) Unit!4578)

(assert (=> d!46131 (= lt!76206 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4756 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138)) lt!76224 lt!76218))))

(assert (=> d!46131 (= lt!76218 Nil!1756)))

(assert (=> d!46131 (= lt!76224 #b00000000000000000000000000000000)))

(declare-fun lt!76225 () Unit!4578)

(assert (=> d!46131 (= lt!76225 e!94494)))

(declare-fun c!27456 () Bool)

(assert (=> d!46131 (= c!27456 (arrayContainsKey!0 (_keys!4756 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!76230 () Unit!4578)

(assert (=> d!46131 (= lt!76230 e!94498)))

(assert (=> d!46131 (= c!27455 (contains!936 (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46131 (valid!565 newMap!16)))

(assert (=> d!46131 (= (updateHelperNewKey!68 newMap!16 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!27428 (index!3297 lt!76138) (index!3294 lt!76138))) lt!76233)))

(declare-fun b!145009 () Bool)

(declare-fun res!69061 () Bool)

(assert (=> b!145009 (= res!69061 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3297 lt!76212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145009 (=> (not res!69061) (not e!94497))))

(declare-fun b!145010 () Bool)

(declare-fun c!27458 () Bool)

(assert (=> b!145010 (= c!27458 ((_ is MissingVacant!282) lt!76212))))

(assert (=> b!145010 (= e!94495 e!94499)))

(declare-fun b!145011 () Bool)

(assert (=> b!145011 (= e!94496 (= (map!1451 (_2!1373 lt!76233)) (+!182 (map!1451 newMap!16) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!145012 () Bool)

(declare-fun call!16198 () Bool)

(assert (=> b!145012 (= e!94497 (not call!16198))))

(declare-fun e!94500 () Bool)

(declare-fun b!145013 () Bool)

(assert (=> b!145013 (= e!94500 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76227)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145014 () Bool)

(declare-fun Unit!4587 () Unit!4578)

(assert (=> b!145014 (= e!94494 Unit!4587)))

(declare-fun b!145015 () Bool)

(declare-fun res!69062 () Bool)

(assert (=> b!145015 (= res!69062 call!16201)))

(assert (=> b!145015 (=> (not res!69062) (not e!94500))))

(declare-fun b!145016 () Bool)

(assert (=> b!145016 (= e!94499 ((_ is Undefined!282) lt!76212))))

(declare-fun b!145017 () Bool)

(declare-fun e!94501 () Bool)

(assert (=> b!145017 (= e!94501 (not call!16198))))

(declare-fun bm!16197 () Bool)

(assert (=> bm!16197 (= call!16198 (arrayContainsKey!0 (_keys!4756 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!145018 () Bool)

(declare-fun res!69068 () Bool)

(assert (=> b!145018 (=> (not res!69068) (not e!94501))))

(assert (=> b!145018 (= res!69068 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3294 lt!76212)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145019 () Bool)

(declare-fun res!69063 () Bool)

(assert (=> b!145019 (=> (not res!69063) (not e!94496))))

(assert (=> b!145019 (= res!69063 (contains!936 (map!1451 (_2!1373 lt!76233)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145020 () Bool)

(declare-fun res!69065 () Bool)

(assert (=> b!145020 (=> (not res!69065) (not e!94501))))

(assert (=> b!145020 (= res!69065 call!16199)))

(assert (=> b!145020 (= e!94495 e!94501)))

(declare-fun b!145021 () Bool)

(declare-fun Unit!4588 () Unit!4578)

(assert (=> b!145021 (= e!94498 Unit!4588)))

(declare-fun lt!76217 () Unit!4578)

(assert (=> b!145021 (= lt!76217 (lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2989 newMap!16)))))

(assert (=> b!145021 (= lt!76227 call!16200)))

(declare-fun res!69060 () Bool)

(assert (=> b!145021 (= res!69060 ((_ is Found!282) lt!76227))))

(assert (=> b!145021 (=> (not res!69060) (not e!94500))))

(assert (=> b!145021 e!94500))

(declare-fun lt!76223 () Unit!4578)

(assert (=> b!145021 (= lt!76223 lt!76217)))

(assert (=> b!145021 false))

(declare-fun b!145022 () Bool)

(declare-fun res!69064 () Bool)

(assert (=> b!145022 (=> (not res!69064) (not e!94496))))

(assert (=> b!145022 (= res!69064 (valid!565 (_2!1373 lt!76233)))))

(declare-fun bm!16198 () Bool)

(assert (=> bm!16198 (= call!16199 call!16201)))

(assert (= (and d!46131 c!27455) b!145021))

(assert (= (and d!46131 (not c!27455)) b!145006))

(assert (= (and b!145021 res!69060) b!145015))

(assert (= (and b!145015 res!69062) b!145013))

(assert (= (and b!145006 c!27457) b!145020))

(assert (= (and b!145006 (not c!27457)) b!145010))

(assert (= (and b!145020 res!69065) b!145018))

(assert (= (and b!145018 res!69068) b!145017))

(assert (= (and b!145010 c!27458) b!145008))

(assert (= (and b!145010 (not c!27458)) b!145016))

(assert (= (and b!145008 res!69067) b!145009))

(assert (= (and b!145009 res!69061) b!145012))

(assert (= (or b!145020 b!145008) bm!16198))

(assert (= (or b!145017 b!145012) bm!16197))

(assert (= (or b!145015 bm!16198) bm!16196))

(assert (= (or b!145021 b!145006) bm!16195))

(assert (= (and d!46131 c!27456) b!145007))

(assert (= (and d!46131 (not c!27456)) b!145014))

(assert (= (and d!46131 res!69066) b!145022))

(assert (= (and b!145022 res!69064) b!145019))

(assert (= (and b!145019 res!69063) b!145011))

(assert (=> d!46131 m!174635))

(declare-fun m!174735 () Bool)

(assert (=> d!46131 m!174735))

(declare-fun m!174737 () Bool)

(assert (=> d!46131 m!174737))

(assert (=> d!46131 m!174471))

(declare-fun m!174739 () Bool)

(assert (=> d!46131 m!174739))

(assert (=> d!46131 m!174471))

(declare-fun m!174741 () Bool)

(assert (=> d!46131 m!174741))

(declare-fun m!174743 () Bool)

(assert (=> d!46131 m!174743))

(declare-fun m!174745 () Bool)

(assert (=> d!46131 m!174745))

(assert (=> d!46131 m!174471))

(assert (=> d!46131 m!174481))

(declare-fun m!174747 () Bool)

(assert (=> d!46131 m!174747))

(declare-fun m!174749 () Bool)

(assert (=> d!46131 m!174749))

(declare-fun m!174751 () Bool)

(assert (=> d!46131 m!174751))

(declare-fun m!174753 () Bool)

(assert (=> d!46131 m!174753))

(assert (=> d!46131 m!174471))

(assert (=> d!46131 m!174679))

(assert (=> d!46131 m!174469))

(declare-fun m!174755 () Bool)

(assert (=> d!46131 m!174755))

(assert (=> d!46131 m!174735))

(assert (=> d!46131 m!174755))

(declare-fun m!174757 () Bool)

(assert (=> d!46131 m!174757))

(assert (=> d!46131 m!174471))

(declare-fun m!174759 () Bool)

(assert (=> d!46131 m!174759))

(declare-fun m!174761 () Bool)

(assert (=> d!46131 m!174761))

(assert (=> d!46131 m!174471))

(declare-fun m!174763 () Bool)

(assert (=> d!46131 m!174763))

(assert (=> d!46131 m!174569))

(declare-fun m!174765 () Bool)

(assert (=> d!46131 m!174765))

(assert (=> d!46131 m!174569))

(assert (=> d!46131 m!174471))

(declare-fun m!174767 () Bool)

(assert (=> d!46131 m!174767))

(assert (=> d!46131 m!174569))

(declare-fun m!174769 () Bool)

(assert (=> d!46131 m!174769))

(assert (=> d!46131 m!174471))

(declare-fun m!174771 () Bool)

(assert (=> d!46131 m!174771))

(declare-fun m!174773 () Bool)

(assert (=> d!46131 m!174773))

(declare-fun m!174775 () Bool)

(assert (=> bm!16196 m!174775))

(declare-fun m!174777 () Bool)

(assert (=> b!145009 m!174777))

(declare-fun m!174779 () Bool)

(assert (=> b!145019 m!174779))

(assert (=> b!145019 m!174779))

(assert (=> b!145019 m!174471))

(declare-fun m!174781 () Bool)

(assert (=> b!145019 m!174781))

(assert (=> bm!16197 m!174471))

(assert (=> bm!16197 m!174679))

(assert (=> b!145007 m!174471))

(declare-fun m!174783 () Bool)

(assert (=> b!145007 m!174783))

(assert (=> b!145007 m!174569))

(assert (=> b!145007 m!174569))

(assert (=> b!145007 m!174471))

(assert (=> b!145007 m!174767))

(declare-fun m!174785 () Bool)

(assert (=> b!145018 m!174785))

(declare-fun m!174787 () Bool)

(assert (=> b!145022 m!174787))

(assert (=> b!145006 m!174471))

(assert (=> b!145006 m!174697))

(assert (=> b!145021 m!174471))

(assert (=> b!145021 m!174673))

(assert (=> bm!16195 m!174471))

(assert (=> bm!16195 m!174691))

(assert (=> b!145011 m!174779))

(assert (=> b!145011 m!174473))

(assert (=> b!145011 m!174473))

(declare-fun m!174789 () Bool)

(assert (=> b!145011 m!174789))

(declare-fun m!174791 () Bool)

(assert (=> b!145013 m!174791))

(assert (=> bm!16169 d!46131))

(declare-fun b!145039 () Bool)

(declare-fun e!94512 () Bool)

(declare-fun lt!76241 () SeekEntryResult!282)

(assert (=> b!145039 (= e!94512 ((_ is Undefined!282) lt!76241))))

(declare-fun b!145040 () Bool)

(assert (=> b!145040 (and (bvsge (index!3294 lt!76241) #b00000000000000000000000000000000) (bvslt (index!3294 lt!76241) (size!2608 (_keys!4756 newMap!16))))))

(declare-fun res!69078 () Bool)

(assert (=> b!145040 (= res!69078 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3294 lt!76241)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94511 () Bool)

(assert (=> b!145040 (=> (not res!69078) (not e!94511))))

(declare-fun d!46133 () Bool)

(declare-fun e!94510 () Bool)

(assert (=> d!46133 e!94510))

(declare-fun c!27463 () Bool)

(assert (=> d!46133 (= c!27463 ((_ is MissingZero!282) lt!76241))))

(assert (=> d!46133 (= lt!76241 (seekEntryOrOpen!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4756 newMap!16) (mask!7353 newMap!16)))))

(declare-fun lt!76240 () Unit!4578)

(declare-fun choose!890 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 64) Int) Unit!4578)

(assert (=> d!46133 (= lt!76240 (choose!890 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2989 newMap!16)))))

(assert (=> d!46133 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46133 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2989 newMap!16)) lt!76240)))

(declare-fun call!16207 () Bool)

(declare-fun bm!16203 () Bool)

(assert (=> bm!16203 (= call!16207 (arrayContainsKey!0 (_keys!4756 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!145041 () Bool)

(assert (=> b!145041 (= e!94510 e!94512)))

(declare-fun c!27464 () Bool)

(assert (=> b!145041 (= c!27464 ((_ is MissingVacant!282) lt!76241))))

(declare-fun b!145042 () Bool)

(declare-fun res!69080 () Bool)

(declare-fun e!94513 () Bool)

(assert (=> b!145042 (=> (not res!69080) (not e!94513))))

(assert (=> b!145042 (= res!69080 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3297 lt!76241)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145042 (and (bvsge (index!3297 lt!76241) #b00000000000000000000000000000000) (bvslt (index!3297 lt!76241) (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145043 () Bool)

(assert (=> b!145043 (= e!94513 (not call!16207))))

(declare-fun bm!16204 () Bool)

(declare-fun call!16206 () Bool)

(assert (=> bm!16204 (= call!16206 (inRange!0 (ite c!27463 (index!3294 lt!76241) (index!3297 lt!76241)) (mask!7353 newMap!16)))))

(declare-fun b!145044 () Bool)

(assert (=> b!145044 (= e!94510 e!94511)))

(declare-fun res!69079 () Bool)

(assert (=> b!145044 (= res!69079 call!16206)))

(assert (=> b!145044 (=> (not res!69079) (not e!94511))))

(declare-fun b!145045 () Bool)

(assert (=> b!145045 (= e!94511 (not call!16207))))

(declare-fun b!145046 () Bool)

(declare-fun res!69077 () Bool)

(assert (=> b!145046 (=> (not res!69077) (not e!94513))))

(assert (=> b!145046 (= res!69077 call!16206)))

(assert (=> b!145046 (= e!94512 e!94513)))

(assert (= (and d!46133 c!27463) b!145044))

(assert (= (and d!46133 (not c!27463)) b!145041))

(assert (= (and b!145044 res!69079) b!145040))

(assert (= (and b!145040 res!69078) b!145045))

(assert (= (and b!145041 c!27464) b!145046))

(assert (= (and b!145041 (not c!27464)) b!145039))

(assert (= (and b!145046 res!69077) b!145042))

(assert (= (and b!145042 res!69080) b!145043))

(assert (= (or b!145044 b!145046) bm!16204))

(assert (= (or b!145045 b!145043) bm!16203))

(assert (=> bm!16203 m!174471))

(assert (=> bm!16203 m!174679))

(declare-fun m!174793 () Bool)

(assert (=> b!145042 m!174793))

(declare-fun m!174795 () Bool)

(assert (=> bm!16204 m!174795))

(declare-fun m!174797 () Bool)

(assert (=> b!145040 m!174797))

(assert (=> d!46133 m!174471))

(assert (=> d!46133 m!174691))

(assert (=> d!46133 m!174471))

(declare-fun m!174799 () Bool)

(assert (=> d!46133 m!174799))

(declare-fun m!174801 () Bool)

(assert (=> d!46133 m!174801))

(assert (=> bm!16178 d!46133))

(declare-fun d!46135 () Bool)

(declare-fun res!69081 () Bool)

(declare-fun e!94514 () Bool)

(assert (=> d!46135 (=> (not res!69081) (not e!94514))))

(assert (=> d!46135 (= res!69081 (simpleValid!99 (v!3320 (underlying!488 thiss!992))))))

(assert (=> d!46135 (= (valid!565 (v!3320 (underlying!488 thiss!992))) e!94514)))

(declare-fun b!145047 () Bool)

(declare-fun res!69082 () Bool)

(assert (=> b!145047 (=> (not res!69082) (not e!94514))))

(assert (=> b!145047 (= res!69082 (= (arrayCountValidKeys!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))) (_size!634 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!145048 () Bool)

(declare-fun res!69083 () Bool)

(assert (=> b!145048 (=> (not res!69083) (not e!94514))))

(assert (=> b!145048 (= res!69083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!145049 () Bool)

(assert (=> b!145049 (= e!94514 (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 Nil!1756))))

(assert (= (and d!46135 res!69081) b!145047))

(assert (= (and b!145047 res!69082) b!145048))

(assert (= (and b!145048 res!69083) b!145049))

(declare-fun m!174803 () Bool)

(assert (=> d!46135 m!174803))

(declare-fun m!174805 () Bool)

(assert (=> b!145047 m!174805))

(declare-fun m!174807 () Bool)

(assert (=> b!145048 m!174807))

(declare-fun m!174809 () Bool)

(assert (=> b!145049 m!174809))

(assert (=> d!46103 d!46135))

(declare-fun d!46137 () Bool)

(declare-fun e!94517 () Bool)

(assert (=> d!46137 e!94517))

(declare-fun res!69088 () Bool)

(assert (=> d!46137 (=> (not res!69088) (not e!94517))))

(declare-fun lt!76252 () ListLongMap!1757)

(assert (=> d!46137 (= res!69088 (contains!936 lt!76252 (_1!1372 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!76250 () List!1758)

(assert (=> d!46137 (= lt!76252 (ListLongMap!1758 lt!76250))))

(declare-fun lt!76253 () Unit!4578)

(declare-fun lt!76251 () Unit!4578)

(assert (=> d!46137 (= lt!76253 lt!76251)))

(assert (=> d!46137 (= (getValueByKey!179 lt!76250 (_1!1372 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!184 (_2!1372 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!93 (List!1758 (_ BitVec 64) V!3579) Unit!4578)

(assert (=> d!46137 (= lt!76251 (lemmaContainsTupThenGetReturnValue!93 lt!76250 (_1!1372 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1372 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!96 (List!1758 (_ BitVec 64) V!3579) List!1758)

(assert (=> d!46137 (= lt!76250 (insertStrictlySorted!96 (toList!894 call!16171) (_1!1372 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1372 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!46137 (= (+!182 call!16171 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!76252)))

(declare-fun b!145054 () Bool)

(declare-fun res!69089 () Bool)

(assert (=> b!145054 (=> (not res!69089) (not e!94517))))

(assert (=> b!145054 (= res!69089 (= (getValueByKey!179 (toList!894 lt!76252) (_1!1372 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!184 (_2!1372 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!145055 () Bool)

(declare-fun contains!940 (List!1758 tuple2!2722) Bool)

(assert (=> b!145055 (= e!94517 (contains!940 (toList!894 lt!76252) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!46137 res!69088) b!145054))

(assert (= (and b!145054 res!69089) b!145055))

(declare-fun m!174811 () Bool)

(assert (=> d!46137 m!174811))

(declare-fun m!174813 () Bool)

(assert (=> d!46137 m!174813))

(declare-fun m!174815 () Bool)

(assert (=> d!46137 m!174815))

(declare-fun m!174817 () Bool)

(assert (=> d!46137 m!174817))

(declare-fun m!174819 () Bool)

(assert (=> b!145054 m!174819))

(declare-fun m!174821 () Bool)

(assert (=> b!145055 m!174821))

(assert (=> b!144925 d!46137))

(declare-fun d!46139 () Bool)

(assert (=> d!46139 (= (+!182 (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) lt!76134 (zeroValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76256 () Unit!4578)

(declare-fun choose!891 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 V!3579 Int) Unit!4578)

(assert (=> d!46139 (= lt!76256 (choose!891 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) lt!76134 (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2989 newMap!16)))))

(assert (=> d!46139 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46139 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) lt!76134 (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2989 newMap!16)) lt!76256)))

(declare-fun bs!6107 () Bool)

(assert (= bs!6107 d!46139))

(assert (=> bs!6107 m!174569))

(declare-fun m!174823 () Bool)

(assert (=> bs!6107 m!174823))

(assert (=> bs!6107 m!174481))

(declare-fun m!174825 () Bool)

(assert (=> bs!6107 m!174825))

(assert (=> bs!6107 m!174569))

(assert (=> bs!6107 m!174801))

(assert (=> bs!6107 m!174481))

(declare-fun m!174827 () Bool)

(assert (=> bs!6107 m!174827))

(assert (=> b!144938 d!46139))

(declare-fun d!46141 () Bool)

(declare-fun res!69090 () Bool)

(declare-fun e!94518 () Bool)

(assert (=> d!46141 (=> res!69090 e!94518)))

(assert (=> d!46141 (= res!69090 (= (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46141 (= (arrayContainsKey!0 (_keys!4756 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b00000000000000000000000000000000) e!94518)))

(declare-fun b!145056 () Bool)

(declare-fun e!94519 () Bool)

(assert (=> b!145056 (= e!94518 e!94519)))

(declare-fun res!69091 () Bool)

(assert (=> b!145056 (=> (not res!69091) (not e!94519))))

(assert (=> b!145056 (= res!69091 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145057 () Bool)

(assert (=> b!145057 (= e!94519 (arrayContainsKey!0 (_keys!4756 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!46141 (not res!69090)) b!145056))

(assert (= (and b!145056 res!69091) b!145057))

(declare-fun m!174829 () Bool)

(assert (=> d!46141 m!174829))

(assert (=> b!145057 m!174471))

(declare-fun m!174831 () Bool)

(assert (=> b!145057 m!174831))

(assert (=> bm!16168 d!46141))

(declare-fun d!46143 () Bool)

(declare-fun get!1553 (Option!185) V!3579)

(assert (=> d!46143 (= (apply!123 lt!76030 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1553 (getValueByKey!179 (toList!894 lt!76030) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6108 () Bool)

(assert (= bs!6108 d!46143))

(declare-fun m!174833 () Bool)

(assert (=> bs!6108 m!174833))

(assert (=> bs!6108 m!174833))

(declare-fun m!174835 () Bool)

(assert (=> bs!6108 m!174835))

(assert (=> b!144776 d!46143))

(declare-fun d!46145 () Bool)

(assert (=> d!46145 (= (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144809 d!46145))

(declare-fun d!46147 () Bool)

(declare-fun e!94522 () Bool)

(assert (=> d!46147 e!94522))

(declare-fun res!69094 () Bool)

(assert (=> d!46147 (=> (not res!69094) (not e!94522))))

(assert (=> d!46147 (= res!69094 (and (bvsge (index!3295 lt!76138) #b00000000000000000000000000000000) (bvslt (index!3295 lt!76138) (size!2608 (_keys!4756 newMap!16)))))))

(declare-fun lt!76259 () Unit!4578)

(declare-fun choose!892 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 32) Int) Unit!4578)

(assert (=> d!46147 (= lt!76259 (choose!892 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (index!3295 lt!76138) (defaultEntry!2989 newMap!16)))))

(assert (=> d!46147 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46147 (= (lemmaValidKeyInArrayIsInListMap!129 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (index!3295 lt!76138) (defaultEntry!2989 newMap!16)) lt!76259)))

(declare-fun b!145060 () Bool)

(assert (=> b!145060 (= e!94522 (contains!936 (getCurrentListMap!564 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76138))))))

(assert (= (and d!46147 res!69094) b!145060))

(declare-fun m!174837 () Bool)

(assert (=> d!46147 m!174837))

(assert (=> d!46147 m!174801))

(assert (=> b!145060 m!174689))

(assert (=> b!145060 m!174709))

(assert (=> b!145060 m!174689))

(assert (=> b!145060 m!174709))

(declare-fun m!174839 () Bool)

(assert (=> b!145060 m!174839))

(assert (=> b!144930 d!46147))

(declare-fun d!46149 () Bool)

(declare-fun e!94525 () Bool)

(assert (=> d!46149 e!94525))

(declare-fun res!69097 () Bool)

(assert (=> d!46149 (=> (not res!69097) (not e!94525))))

(assert (=> d!46149 (= res!69097 (and (bvsge (index!3295 lt!76138) #b00000000000000000000000000000000) (bvslt (index!3295 lt!76138) (size!2609 (_values!2972 newMap!16)))))))

(declare-fun lt!76262 () Unit!4578)

(declare-fun choose!893 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 32) (_ BitVec 64) V!3579 Int) Unit!4578)

(assert (=> d!46149 (= lt!76262 (choose!893 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (index!3295 lt!76138) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2989 newMap!16)))))

(assert (=> d!46149 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46149 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (index!3295 lt!76138) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2989 newMap!16)) lt!76262)))

(declare-fun b!145063 () Bool)

(assert (=> b!145063 (= e!94525 (= (+!182 (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!564 (_keys!4756 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16))) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16))))))

(assert (= (and d!46149 res!69097) b!145063))

(assert (=> d!46149 m!174471))

(assert (=> d!46149 m!174481))

(declare-fun m!174841 () Bool)

(assert (=> d!46149 m!174841))

(assert (=> d!46149 m!174801))

(assert (=> b!145063 m!174569))

(assert (=> b!145063 m!174569))

(assert (=> b!145063 m!174769))

(assert (=> b!145063 m!174659))

(declare-fun m!174843 () Bool)

(assert (=> b!145063 m!174843))

(assert (=> b!144930 d!46149))

(declare-fun d!46151 () Bool)

(declare-fun e!94526 () Bool)

(assert (=> d!46151 e!94526))

(declare-fun res!69098 () Bool)

(assert (=> d!46151 (=> res!69098 e!94526)))

(declare-fun lt!76266 () Bool)

(assert (=> d!46151 (= res!69098 (not lt!76266))))

(declare-fun lt!76265 () Bool)

(assert (=> d!46151 (= lt!76266 lt!76265)))

(declare-fun lt!76263 () Unit!4578)

(declare-fun e!94527 () Unit!4578)

(assert (=> d!46151 (= lt!76263 e!94527)))

(declare-fun c!27465 () Bool)

(assert (=> d!46151 (= c!27465 lt!76265)))

(assert (=> d!46151 (= lt!76265 (containsKey!183 (toList!894 call!16169) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46151 (= (contains!936 call!16169 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) lt!76266)))

(declare-fun b!145064 () Bool)

(declare-fun lt!76264 () Unit!4578)

(assert (=> b!145064 (= e!94527 lt!76264)))

(assert (=> b!145064 (= lt!76264 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!894 call!16169) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!145064 (isDefined!132 (getValueByKey!179 (toList!894 call!16169) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145065 () Bool)

(declare-fun Unit!4589 () Unit!4578)

(assert (=> b!145065 (= e!94527 Unit!4589)))

(declare-fun b!145066 () Bool)

(assert (=> b!145066 (= e!94526 (isDefined!132 (getValueByKey!179 (toList!894 call!16169) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (= (and d!46151 c!27465) b!145064))

(assert (= (and d!46151 (not c!27465)) b!145065))

(assert (= (and d!46151 (not res!69098)) b!145066))

(assert (=> d!46151 m!174471))

(declare-fun m!174845 () Bool)

(assert (=> d!46151 m!174845))

(assert (=> b!145064 m!174471))

(declare-fun m!174847 () Bool)

(assert (=> b!145064 m!174847))

(assert (=> b!145064 m!174471))

(declare-fun m!174849 () Bool)

(assert (=> b!145064 m!174849))

(assert (=> b!145064 m!174849))

(declare-fun m!174851 () Bool)

(assert (=> b!145064 m!174851))

(assert (=> b!145066 m!174471))

(assert (=> b!145066 m!174849))

(assert (=> b!145066 m!174849))

(assert (=> b!145066 m!174851))

(assert (=> b!144930 d!46151))

(declare-fun d!46153 () Bool)

(declare-fun lt!76267 () Bool)

(assert (=> d!46153 (= lt!76267 (select (content!141 Nil!1756) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun e!94528 () Bool)

(assert (=> d!46153 (= lt!76267 e!94528)))

(declare-fun res!69099 () Bool)

(assert (=> d!46153 (=> (not res!69099) (not e!94528))))

(assert (=> d!46153 (= res!69099 ((_ is Cons!1755) Nil!1756))))

(assert (=> d!46153 (= (contains!937 Nil!1756 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) lt!76267)))

(declare-fun b!145067 () Bool)

(declare-fun e!94529 () Bool)

(assert (=> b!145067 (= e!94528 e!94529)))

(declare-fun res!69100 () Bool)

(assert (=> b!145067 (=> res!69100 e!94529)))

(assert (=> b!145067 (= res!69100 (= (h!2363 Nil!1756) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145068 () Bool)

(assert (=> b!145068 (= e!94529 (contains!937 (t!6404 Nil!1756) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (= (and d!46153 res!69099) b!145067))

(assert (= (and b!145067 (not res!69100)) b!145068))

(declare-fun m!174853 () Bool)

(assert (=> d!46153 m!174853))

(assert (=> d!46153 m!174471))

(declare-fun m!174855 () Bool)

(assert (=> d!46153 m!174855))

(assert (=> b!145068 m!174471))

(declare-fun m!174857 () Bool)

(assert (=> b!145068 m!174857))

(assert (=> b!144948 d!46153))

(declare-fun d!46155 () Bool)

(declare-fun lt!76268 () Bool)

(assert (=> d!46155 (= lt!76268 (select (content!141 lt!75953) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!94530 () Bool)

(assert (=> d!46155 (= lt!76268 e!94530)))

(declare-fun res!69101 () Bool)

(assert (=> d!46155 (=> (not res!69101) (not e!94530))))

(assert (=> d!46155 (= res!69101 ((_ is Cons!1755) lt!75953))))

(assert (=> d!46155 (= (contains!937 lt!75953 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!76268)))

(declare-fun b!145069 () Bool)

(declare-fun e!94531 () Bool)

(assert (=> b!145069 (= e!94530 e!94531)))

(declare-fun res!69102 () Bool)

(assert (=> b!145069 (=> res!69102 e!94531)))

(assert (=> b!145069 (= res!69102 (= (h!2363 lt!75953) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145070 () Bool)

(assert (=> b!145070 (= e!94531 (contains!937 (t!6404 lt!75953) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!46155 res!69101) b!145069))

(assert (= (and b!145069 (not res!69102)) b!145070))

(assert (=> d!46155 m!174563))

(assert (=> d!46155 m!174571))

(declare-fun m!174859 () Bool)

(assert (=> d!46155 m!174859))

(assert (=> b!145070 m!174571))

(declare-fun m!174861 () Bool)

(assert (=> b!145070 m!174861))

(assert (=> b!144808 d!46155))

(assert (=> b!144763 d!46145))

(declare-fun d!46157 () Bool)

(assert (=> d!46157 (= (+!182 (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) lt!76122 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76271 () Unit!4578)

(declare-fun choose!894 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 V!3579 Int) Unit!4578)

(assert (=> d!46157 (= lt!76271 (choose!894 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) lt!76122 (zeroValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2835 newMap!16) (defaultEntry!2989 newMap!16)))))

(assert (=> d!46157 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46157 (= (lemmaChangeZeroKeyThenAddPairToListMap!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) lt!76122 (zeroValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2835 newMap!16) (defaultEntry!2989 newMap!16)) lt!76271)))

(declare-fun bs!6109 () Bool)

(assert (= bs!6109 d!46157))

(assert (=> bs!6109 m!174481))

(declare-fun m!174863 () Bool)

(assert (=> bs!6109 m!174863))

(assert (=> bs!6109 m!174569))

(declare-fun m!174865 () Bool)

(assert (=> bs!6109 m!174865))

(assert (=> bs!6109 m!174481))

(declare-fun m!174867 () Bool)

(assert (=> bs!6109 m!174867))

(assert (=> bs!6109 m!174801))

(assert (=> bs!6109 m!174569))

(assert (=> b!144928 d!46157))

(declare-fun d!46159 () Bool)

(declare-fun res!69103 () Bool)

(declare-fun e!94532 () Bool)

(assert (=> d!46159 (=> res!69103 e!94532)))

(assert (=> d!46159 (= res!69103 ((_ is Nil!1756) (t!6404 lt!75953)))))

(assert (=> d!46159 (= (noDuplicate!55 (t!6404 lt!75953)) e!94532)))

(declare-fun b!145071 () Bool)

(declare-fun e!94533 () Bool)

(assert (=> b!145071 (= e!94532 e!94533)))

(declare-fun res!69104 () Bool)

(assert (=> b!145071 (=> (not res!69104) (not e!94533))))

(assert (=> b!145071 (= res!69104 (not (contains!937 (t!6404 (t!6404 lt!75953)) (h!2363 (t!6404 lt!75953)))))))

(declare-fun b!145072 () Bool)

(assert (=> b!145072 (= e!94533 (noDuplicate!55 (t!6404 (t!6404 lt!75953))))))

(assert (= (and d!46159 (not res!69103)) b!145071))

(assert (= (and b!145071 res!69104) b!145072))

(declare-fun m!174869 () Bool)

(assert (=> b!145071 m!174869))

(declare-fun m!174871 () Bool)

(assert (=> b!145072 m!174871))

(assert (=> b!144783 d!46159))

(declare-fun d!46161 () Bool)

(declare-fun e!94534 () Bool)

(assert (=> d!46161 e!94534))

(declare-fun res!69105 () Bool)

(assert (=> d!46161 (=> res!69105 e!94534)))

(declare-fun lt!76275 () Bool)

(assert (=> d!46161 (= res!69105 (not lt!76275))))

(declare-fun lt!76274 () Bool)

(assert (=> d!46161 (= lt!76275 lt!76274)))

(declare-fun lt!76272 () Unit!4578)

(declare-fun e!94535 () Unit!4578)

(assert (=> d!46161 (= lt!76272 e!94535)))

(declare-fun c!27466 () Bool)

(assert (=> d!46161 (= c!27466 lt!76274)))

(assert (=> d!46161 (= lt!76274 (containsKey!183 (toList!894 lt!76030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46161 (= (contains!936 lt!76030 #b0000000000000000000000000000000000000000000000000000000000000000) lt!76275)))

(declare-fun b!145073 () Bool)

(declare-fun lt!76273 () Unit!4578)

(assert (=> b!145073 (= e!94535 lt!76273)))

(assert (=> b!145073 (= lt!76273 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!894 lt!76030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145073 (isDefined!132 (getValueByKey!179 (toList!894 lt!76030) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145074 () Bool)

(declare-fun Unit!4590 () Unit!4578)

(assert (=> b!145074 (= e!94535 Unit!4590)))

(declare-fun b!145075 () Bool)

(assert (=> b!145075 (= e!94534 (isDefined!132 (getValueByKey!179 (toList!894 lt!76030) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46161 c!27466) b!145073))

(assert (= (and d!46161 (not c!27466)) b!145074))

(assert (= (and d!46161 (not res!69105)) b!145075))

(declare-fun m!174873 () Bool)

(assert (=> d!46161 m!174873))

(declare-fun m!174875 () Bool)

(assert (=> b!145073 m!174875))

(assert (=> b!145073 m!174833))

(assert (=> b!145073 m!174833))

(declare-fun m!174877 () Bool)

(assert (=> b!145073 m!174877))

(assert (=> b!145075 m!174833))

(assert (=> b!145075 m!174833))

(assert (=> b!145075 m!174877))

(assert (=> bm!16108 d!46161))

(declare-fun d!46163 () Bool)

(declare-fun res!69106 () Bool)

(declare-fun e!94536 () Bool)

(assert (=> d!46163 (=> res!69106 e!94536)))

(assert (=> d!46163 (= res!69106 (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46163 (= (arrayContainsKey!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!94536)))

(declare-fun b!145076 () Bool)

(declare-fun e!94537 () Bool)

(assert (=> b!145076 (= e!94536 e!94537)))

(declare-fun res!69107 () Bool)

(assert (=> b!145076 (=> (not res!69107) (not e!94537))))

(assert (=> b!145076 (= res!69107 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!145077 () Bool)

(assert (=> b!145077 (= e!94537 (arrayContainsKey!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!46163 (not res!69106)) b!145076))

(assert (= (and b!145076 res!69107) b!145077))

(declare-fun m!174879 () Bool)

(assert (=> d!46163 m!174879))

(assert (=> b!145077 m!174471))

(declare-fun m!174881 () Bool)

(assert (=> b!145077 m!174881))

(assert (=> b!144955 d!46163))

(declare-fun d!46165 () Bool)

(declare-fun res!69113 () Bool)

(declare-fun e!94546 () Bool)

(assert (=> d!46165 (=> res!69113 e!94546)))

(assert (=> d!46165 (= res!69113 (bvsge #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(assert (=> d!46165 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4756 newMap!16) (mask!7353 newMap!16)) e!94546)))

(declare-fun b!145086 () Bool)

(declare-fun e!94544 () Bool)

(assert (=> b!145086 (= e!94546 e!94544)))

(declare-fun c!27469 () Bool)

(assert (=> b!145086 (= c!27469 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145087 () Bool)

(declare-fun call!16210 () Bool)

(assert (=> b!145087 (= e!94544 call!16210)))

(declare-fun bm!16207 () Bool)

(assert (=> bm!16207 (= call!16210 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4756 newMap!16) (mask!7353 newMap!16)))))

(declare-fun b!145088 () Bool)

(declare-fun e!94545 () Bool)

(assert (=> b!145088 (= e!94545 call!16210)))

(declare-fun b!145089 () Bool)

(assert (=> b!145089 (= e!94544 e!94545)))

(declare-fun lt!76283 () (_ BitVec 64))

(assert (=> b!145089 (= lt!76283 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76282 () Unit!4578)

(assert (=> b!145089 (= lt!76282 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4756 newMap!16) lt!76283 #b00000000000000000000000000000000))))

(assert (=> b!145089 (arrayContainsKey!0 (_keys!4756 newMap!16) lt!76283 #b00000000000000000000000000000000)))

(declare-fun lt!76284 () Unit!4578)

(assert (=> b!145089 (= lt!76284 lt!76282)))

(declare-fun res!69112 () Bool)

(assert (=> b!145089 (= res!69112 (= (seekEntryOrOpen!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000) (_keys!4756 newMap!16) (mask!7353 newMap!16)) (Found!282 #b00000000000000000000000000000000)))))

(assert (=> b!145089 (=> (not res!69112) (not e!94545))))

(assert (= (and d!46165 (not res!69113)) b!145086))

(assert (= (and b!145086 c!27469) b!145089))

(assert (= (and b!145086 (not c!27469)) b!145087))

(assert (= (and b!145089 res!69112) b!145088))

(assert (= (or b!145088 b!145087) bm!16207))

(assert (=> b!145086 m!174829))

(assert (=> b!145086 m!174829))

(declare-fun m!174883 () Bool)

(assert (=> b!145086 m!174883))

(declare-fun m!174885 () Bool)

(assert (=> bm!16207 m!174885))

(assert (=> b!145089 m!174829))

(declare-fun m!174887 () Bool)

(assert (=> b!145089 m!174887))

(declare-fun m!174889 () Bool)

(assert (=> b!145089 m!174889))

(assert (=> b!145089 m!174829))

(declare-fun m!174891 () Bool)

(assert (=> b!145089 m!174891))

(assert (=> b!144791 d!46165))

(declare-fun d!46167 () Bool)

(declare-fun e!94547 () Bool)

(assert (=> d!46167 e!94547))

(declare-fun res!69114 () Bool)

(assert (=> d!46167 (=> res!69114 e!94547)))

(declare-fun lt!76288 () Bool)

(assert (=> d!46167 (= res!69114 (not lt!76288))))

(declare-fun lt!76287 () Bool)

(assert (=> d!46167 (= lt!76288 lt!76287)))

(declare-fun lt!76285 () Unit!4578)

(declare-fun e!94548 () Unit!4578)

(assert (=> d!46167 (= lt!76285 e!94548)))

(declare-fun c!27470 () Bool)

(assert (=> d!46167 (= c!27470 lt!76287)))

(assert (=> d!46167 (= lt!76287 (containsKey!183 (toList!894 lt!76030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!46167 (= (contains!936 lt!76030 #b1000000000000000000000000000000000000000000000000000000000000000) lt!76288)))

(declare-fun b!145090 () Bool)

(declare-fun lt!76286 () Unit!4578)

(assert (=> b!145090 (= e!94548 lt!76286)))

(assert (=> b!145090 (= lt!76286 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!894 lt!76030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!145090 (isDefined!132 (getValueByKey!179 (toList!894 lt!76030) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145091 () Bool)

(declare-fun Unit!4591 () Unit!4578)

(assert (=> b!145091 (= e!94548 Unit!4591)))

(declare-fun b!145092 () Bool)

(assert (=> b!145092 (= e!94547 (isDefined!132 (getValueByKey!179 (toList!894 lt!76030) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46167 c!27470) b!145090))

(assert (= (and d!46167 (not c!27470)) b!145091))

(assert (= (and d!46167 (not res!69114)) b!145092))

(declare-fun m!174893 () Bool)

(assert (=> d!46167 m!174893))

(declare-fun m!174895 () Bool)

(assert (=> b!145090 m!174895))

(declare-fun m!174897 () Bool)

(assert (=> b!145090 m!174897))

(assert (=> b!145090 m!174897))

(declare-fun m!174899 () Bool)

(assert (=> b!145090 m!174899))

(assert (=> b!145092 m!174897))

(assert (=> b!145092 m!174897))

(assert (=> b!145092 m!174899))

(assert (=> bm!16107 d!46167))

(declare-fun d!46169 () Bool)

(assert (=> d!46169 (= (inRange!0 (ite c!27431 (ite c!27432 (index!3295 lt!76116) (ite c!27437 (index!3294 lt!76131) (index!3297 lt!76131))) (ite c!27430 (index!3295 lt!76127) (ite c!27427 (index!3294 lt!76125) (index!3297 lt!76125)))) (mask!7353 newMap!16)) (and (bvsge (ite c!27431 (ite c!27432 (index!3295 lt!76116) (ite c!27437 (index!3294 lt!76131) (index!3297 lt!76131))) (ite c!27430 (index!3295 lt!76127) (ite c!27427 (index!3294 lt!76125) (index!3297 lt!76125)))) #b00000000000000000000000000000000) (bvslt (ite c!27431 (ite c!27432 (index!3295 lt!76116) (ite c!27437 (index!3294 lt!76131) (index!3297 lt!76131))) (ite c!27430 (index!3295 lt!76127) (ite c!27427 (index!3294 lt!76125) (index!3297 lt!76125)))) (bvadd (mask!7353 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!16164 d!46169))

(declare-fun d!46171 () Bool)

(assert (=> d!46171 (= (get!1552 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!144944 d!46171))

(declare-fun d!46173 () Bool)

(assert (=> d!46173 (= (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (and (not (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!144949 d!46173))

(assert (=> bm!16171 d!46095))

(declare-fun b!145103 () Bool)

(declare-fun res!69124 () Bool)

(declare-fun e!94551 () Bool)

(assert (=> b!145103 (=> (not res!69124) (not e!94551))))

(declare-fun size!2612 (LongMapFixedSize!1170) (_ BitVec 32))

(assert (=> b!145103 (= res!69124 (= (size!2612 newMap!16) (bvadd (_size!634 newMap!16) (bvsdiv (bvadd (extraKeys!2736 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!46175 () Bool)

(declare-fun res!69126 () Bool)

(assert (=> d!46175 (=> (not res!69126) (not e!94551))))

(assert (=> d!46175 (= res!69126 (validMask!0 (mask!7353 newMap!16)))))

(assert (=> d!46175 (= (simpleValid!99 newMap!16) e!94551)))

(declare-fun b!145102 () Bool)

(declare-fun res!69125 () Bool)

(assert (=> b!145102 (=> (not res!69125) (not e!94551))))

(assert (=> b!145102 (= res!69125 (bvsge (size!2612 newMap!16) (_size!634 newMap!16)))))

(declare-fun b!145104 () Bool)

(assert (=> b!145104 (= e!94551 (and (bvsge (extraKeys!2736 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2736 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!634 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!145101 () Bool)

(declare-fun res!69123 () Bool)

(assert (=> b!145101 (=> (not res!69123) (not e!94551))))

(assert (=> b!145101 (= res!69123 (and (= (size!2609 (_values!2972 newMap!16)) (bvadd (mask!7353 newMap!16) #b00000000000000000000000000000001)) (= (size!2608 (_keys!4756 newMap!16)) (size!2609 (_values!2972 newMap!16))) (bvsge (_size!634 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!634 newMap!16) (bvadd (mask!7353 newMap!16) #b00000000000000000000000000000001))))))

(assert (= (and d!46175 res!69126) b!145101))

(assert (= (and b!145101 res!69123) b!145102))

(assert (= (and b!145102 res!69125) b!145103))

(assert (= (and b!145103 res!69124) b!145104))

(declare-fun m!174901 () Bool)

(assert (=> b!145103 m!174901))

(assert (=> d!46175 m!174801))

(assert (=> b!145102 m!174901))

(assert (=> d!46101 d!46175))

(declare-fun d!46177 () Bool)

(declare-fun c!27473 () Bool)

(assert (=> d!46177 (= c!27473 ((_ is Nil!1756) lt!75953))))

(declare-fun e!94554 () (InoxSet (_ BitVec 64)))

(assert (=> d!46177 (= (content!141 lt!75953) e!94554)))

(declare-fun b!145109 () Bool)

(assert (=> b!145109 (= e!94554 ((as const (Array (_ BitVec 64) Bool)) false))))

(declare-fun b!145110 () Bool)

(assert (=> b!145110 (= e!94554 ((_ map or) (store ((as const (Array (_ BitVec 64) Bool)) false) (h!2363 lt!75953) true) (content!141 (t!6404 lt!75953))))))

(assert (= (and d!46177 c!27473) b!145109))

(assert (= (and d!46177 (not c!27473)) b!145110))

(declare-fun m!174903 () Bool)

(assert (=> b!145110 m!174903))

(declare-fun m!174905 () Bool)

(assert (=> b!145110 m!174905))

(assert (=> d!46105 d!46177))

(assert (=> d!46117 d!46115))

(declare-fun d!46179 () Bool)

(assert (=> d!46179 (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) from!355 Nil!1756)))

(assert (=> d!46179 true))

(declare-fun _$71!174 () Unit!4578)

(assert (=> d!46179 (= (choose!39 (_keys!4756 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!174)))

(declare-fun bs!6110 () Bool)

(assert (= bs!6110 d!46179))

(assert (=> bs!6110 m!174501))

(assert (=> d!46117 d!46179))

(assert (=> b!144960 d!46119))

(declare-fun d!46181 () Bool)

(assert (=> d!46181 (= (apply!123 lt!76030 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1553 (getValueByKey!179 (toList!894 lt!76030) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!6111 () Bool)

(assert (= bs!6111 d!46181))

(assert (=> bs!6111 m!174897))

(assert (=> bs!6111 m!174897))

(declare-fun m!174907 () Bool)

(assert (=> bs!6111 m!174907))

(assert (=> b!144773 d!46181))

(assert (=> d!46093 d!46177))

(declare-fun d!46183 () Bool)

(declare-fun e!94557 () Bool)

(assert (=> d!46183 e!94557))

(declare-fun c!27476 () Bool)

(assert (=> d!46183 (= c!27476 (and (not (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!46183 true))

(declare-fun _$29!174 () Unit!4578)

(assert (=> d!46183 (= (choose!889 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))) _$29!174)))

(declare-fun b!145115 () Bool)

(assert (=> b!145115 (= e!94557 (arrayContainsKey!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!145116 () Bool)

(assert (=> b!145116 (= e!94557 (ite (= (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!46183 c!27476) b!145115))

(assert (= (and d!46183 (not c!27476)) b!145116))

(assert (=> b!145115 m!174471))

(assert (=> b!145115 m!174505))

(assert (=> d!46121 d!46183))

(declare-fun d!46185 () Bool)

(assert (=> d!46185 (= (validMask!0 (mask!7353 (v!3320 (underlying!488 thiss!992)))) (and (or (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000000111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000001111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000011111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000000111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000001111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000011111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000000111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000001111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000011111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000000111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000001111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000011111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000000111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000001111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000011111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000000111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000001111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000011111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000000111111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000001111111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000011111111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000000111111111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000001111111111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000011111111111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00000111111111111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00001111111111111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00011111111111111111111111111111) (= (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7353 (v!3320 (underlying!488 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> d!46121 d!46185))

(declare-fun d!46187 () Bool)

(assert (=> d!46187 (= (apply!123 (+!182 lt!76045 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76037) (get!1553 (getValueByKey!179 (toList!894 (+!182 lt!76045 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) lt!76037)))))

(declare-fun bs!6112 () Bool)

(assert (= bs!6112 d!46187))

(declare-fun m!174909 () Bool)

(assert (=> bs!6112 m!174909))

(assert (=> bs!6112 m!174909))

(declare-fun m!174911 () Bool)

(assert (=> bs!6112 m!174911))

(assert (=> b!144771 d!46187))

(declare-fun d!46189 () Bool)

(assert (=> d!46189 (contains!936 (+!182 lt!76025 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76041)))

(declare-fun lt!76291 () Unit!4578)

(declare-fun choose!895 (ListLongMap!1757 (_ BitVec 64) V!3579 (_ BitVec 64)) Unit!4578)

(assert (=> d!46189 (= lt!76291 (choose!895 lt!76025 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76041))))

(assert (=> d!46189 (contains!936 lt!76025 lt!76041)))

(assert (=> d!46189 (= (addStillContains!99 lt!76025 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76041) lt!76291)))

(declare-fun bs!6113 () Bool)

(assert (= bs!6113 d!46189))

(assert (=> bs!6113 m!174609))

(assert (=> bs!6113 m!174609))

(assert (=> bs!6113 m!174623))

(declare-fun m!174913 () Bool)

(assert (=> bs!6113 m!174913))

(declare-fun m!174915 () Bool)

(assert (=> bs!6113 m!174915))

(assert (=> b!144771 d!46189))

(declare-fun d!46191 () Bool)

(declare-fun e!94558 () Bool)

(assert (=> d!46191 e!94558))

(declare-fun res!69127 () Bool)

(assert (=> d!46191 (=> (not res!69127) (not e!94558))))

(declare-fun lt!76294 () ListLongMap!1757)

(assert (=> d!46191 (= res!69127 (contains!936 lt!76294 (_1!1372 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lt!76292 () List!1758)

(assert (=> d!46191 (= lt!76294 (ListLongMap!1758 lt!76292))))

(declare-fun lt!76295 () Unit!4578)

(declare-fun lt!76293 () Unit!4578)

(assert (=> d!46191 (= lt!76295 lt!76293)))

(assert (=> d!46191 (= (getValueByKey!179 lt!76292 (_1!1372 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) (Some!184 (_2!1372 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46191 (= lt!76293 (lemmaContainsTupThenGetReturnValue!93 lt!76292 (_1!1372 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) (_2!1372 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46191 (= lt!76292 (insertStrictlySorted!96 (toList!894 lt!76028) (_1!1372 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) (_2!1372 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46191 (= (+!182 lt!76028 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76294)))

(declare-fun b!145118 () Bool)

(declare-fun res!69128 () Bool)

(assert (=> b!145118 (=> (not res!69128) (not e!94558))))

(assert (=> b!145118 (= res!69128 (= (getValueByKey!179 (toList!894 lt!76294) (_1!1372 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) (Some!184 (_2!1372 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun b!145119 () Bool)

(assert (=> b!145119 (= e!94558 (contains!940 (toList!894 lt!76294) (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))

(assert (= (and d!46191 res!69127) b!145118))

(assert (= (and b!145118 res!69128) b!145119))

(declare-fun m!174917 () Bool)

(assert (=> d!46191 m!174917))

(declare-fun m!174919 () Bool)

(assert (=> d!46191 m!174919))

(declare-fun m!174921 () Bool)

(assert (=> d!46191 m!174921))

(declare-fun m!174923 () Bool)

(assert (=> d!46191 m!174923))

(declare-fun m!174925 () Bool)

(assert (=> b!145118 m!174925))

(declare-fun m!174927 () Bool)

(assert (=> b!145119 m!174927))

(assert (=> b!144771 d!46191))

(declare-fun d!46193 () Bool)

(declare-fun e!94559 () Bool)

(assert (=> d!46193 e!94559))

(declare-fun res!69129 () Bool)

(assert (=> d!46193 (=> (not res!69129) (not e!94559))))

(declare-fun lt!76298 () ListLongMap!1757)

(assert (=> d!46193 (= res!69129 (contains!936 lt!76298 (_1!1372 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lt!76296 () List!1758)

(assert (=> d!46193 (= lt!76298 (ListLongMap!1758 lt!76296))))

(declare-fun lt!76299 () Unit!4578)

(declare-fun lt!76297 () Unit!4578)

(assert (=> d!46193 (= lt!76299 lt!76297)))

(assert (=> d!46193 (= (getValueByKey!179 lt!76296 (_1!1372 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))) (Some!184 (_2!1372 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46193 (= lt!76297 (lemmaContainsTupThenGetReturnValue!93 lt!76296 (_1!1372 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) (_2!1372 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46193 (= lt!76296 (insertStrictlySorted!96 (toList!894 lt!76025) (_1!1372 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) (_2!1372 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46193 (= (+!182 lt!76025 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76298)))

(declare-fun b!145120 () Bool)

(declare-fun res!69130 () Bool)

(assert (=> b!145120 (=> (not res!69130) (not e!94559))))

(assert (=> b!145120 (= res!69130 (= (getValueByKey!179 (toList!894 lt!76298) (_1!1372 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))) (Some!184 (_2!1372 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun b!145121 () Bool)

(assert (=> b!145121 (= e!94559 (contains!940 (toList!894 lt!76298) (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))))))

(assert (= (and d!46193 res!69129) b!145120))

(assert (= (and b!145120 res!69130) b!145121))

(declare-fun m!174929 () Bool)

(assert (=> d!46193 m!174929))

(declare-fun m!174931 () Bool)

(assert (=> d!46193 m!174931))

(declare-fun m!174933 () Bool)

(assert (=> d!46193 m!174933))

(declare-fun m!174935 () Bool)

(assert (=> d!46193 m!174935))

(declare-fun m!174937 () Bool)

(assert (=> b!145120 m!174937))

(declare-fun m!174939 () Bool)

(assert (=> b!145121 m!174939))

(assert (=> b!144771 d!46193))

(declare-fun b!145146 () Bool)

(declare-fun lt!76318 () Unit!4578)

(declare-fun lt!76315 () Unit!4578)

(assert (=> b!145146 (= lt!76318 lt!76315)))

(declare-fun lt!76314 () (_ BitVec 64))

(declare-fun lt!76320 () V!3579)

(declare-fun lt!76317 () ListLongMap!1757)

(declare-fun lt!76316 () (_ BitVec 64))

(assert (=> b!145146 (not (contains!936 (+!182 lt!76317 (tuple2!2723 lt!76314 lt!76320)) lt!76316))))

(declare-fun addStillNotContains!67 (ListLongMap!1757 (_ BitVec 64) V!3579 (_ BitVec 64)) Unit!4578)

(assert (=> b!145146 (= lt!76315 (addStillNotContains!67 lt!76317 lt!76314 lt!76320 lt!76316))))

(assert (=> b!145146 (= lt!76316 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!145146 (= lt!76320 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!145146 (= lt!76314 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!16213 () ListLongMap!1757)

(assert (=> b!145146 (= lt!76317 call!16213)))

(declare-fun e!94575 () ListLongMap!1757)

(assert (=> b!145146 (= e!94575 (+!182 call!16213 (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!16210 () Bool)

(assert (=> bm!16210 (= call!16213 (getCurrentListMapNoExtraKeys!148 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))))))

(declare-fun b!145147 () Bool)

(declare-fun e!94577 () Bool)

(declare-fun e!94576 () Bool)

(assert (=> b!145147 (= e!94577 e!94576)))

(assert (=> b!145147 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun res!69141 () Bool)

(declare-fun lt!76319 () ListLongMap!1757)

(assert (=> b!145147 (= res!69141 (contains!936 lt!76319 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145147 (=> (not res!69141) (not e!94576))))

(declare-fun b!145148 () Bool)

(declare-fun e!94574 () ListLongMap!1757)

(assert (=> b!145148 (= e!94574 e!94575)))

(declare-fun c!27487 () Bool)

(assert (=> b!145148 (= c!27487 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145149 () Bool)

(declare-fun e!94578 () Bool)

(assert (=> b!145149 (= e!94578 e!94577)))

(declare-fun c!27485 () Bool)

(declare-fun e!94580 () Bool)

(assert (=> b!145149 (= c!27485 e!94580)))

(declare-fun res!69140 () Bool)

(assert (=> b!145149 (=> (not res!69140) (not e!94580))))

(assert (=> b!145149 (= res!69140 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!145151 () Bool)

(declare-fun e!94579 () Bool)

(assert (=> b!145151 (= e!94577 e!94579)))

(declare-fun c!27486 () Bool)

(assert (=> b!145151 (= c!27486 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!145152 () Bool)

(assert (=> b!145152 (= e!94575 call!16213)))

(declare-fun b!145153 () Bool)

(assert (=> b!145153 (= e!94574 (ListLongMap!1758 Nil!1755))))

(declare-fun b!145154 () Bool)

(declare-fun isEmpty!424 (ListLongMap!1757) Bool)

(assert (=> b!145154 (= e!94579 (isEmpty!424 lt!76319))))

(declare-fun b!145155 () Bool)

(assert (=> b!145155 (= e!94580 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145155 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!145156 () Bool)

(assert (=> b!145156 (= e!94579 (= lt!76319 (getCurrentListMapNoExtraKeys!148 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))))))))

(declare-fun b!145157 () Bool)

(declare-fun res!69139 () Bool)

(assert (=> b!145157 (=> (not res!69139) (not e!94578))))

(assert (=> b!145157 (= res!69139 (not (contains!936 lt!76319 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!145150 () Bool)

(assert (=> b!145150 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> b!145150 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2609 (_values!2972 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> b!145150 (= e!94576 (= (apply!123 lt!76319 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!46195 () Bool)

(assert (=> d!46195 e!94578))

(declare-fun res!69142 () Bool)

(assert (=> d!46195 (=> (not res!69142) (not e!94578))))

(assert (=> d!46195 (= res!69142 (not (contains!936 lt!76319 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!46195 (= lt!76319 e!94574)))

(declare-fun c!27488 () Bool)

(assert (=> d!46195 (= c!27488 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46195 (validMask!0 (mask!7353 (v!3320 (underlying!488 thiss!992))))))

(assert (=> d!46195 (= (getCurrentListMapNoExtraKeys!148 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (_values!2972 (v!3320 (underlying!488 thiss!992))) (mask!7353 (v!3320 (underlying!488 thiss!992))) (extraKeys!2736 (v!3320 (underlying!488 thiss!992))) (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) (minValue!2835 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992)))) lt!76319)))

(assert (= (and d!46195 c!27488) b!145153))

(assert (= (and d!46195 (not c!27488)) b!145148))

(assert (= (and b!145148 c!27487) b!145146))

(assert (= (and b!145148 (not c!27487)) b!145152))

(assert (= (or b!145146 b!145152) bm!16210))

(assert (= (and d!46195 res!69142) b!145157))

(assert (= (and b!145157 res!69139) b!145149))

(assert (= (and b!145149 res!69140) b!145155))

(assert (= (and b!145149 c!27485) b!145147))

(assert (= (and b!145149 (not c!27485)) b!145151))

(assert (= (and b!145147 res!69141) b!145150))

(assert (= (and b!145151 c!27486) b!145156))

(assert (= (and b!145151 (not c!27486)) b!145154))

(declare-fun b_lambda!6499 () Bool)

(assert (=> (not b_lambda!6499) (not b!145146)))

(assert (=> b!145146 t!6400))

(declare-fun b_and!9035 () Bool)

(assert (= b_and!9031 (and (=> t!6400 result!4261) b_and!9035)))

(assert (=> b!145146 t!6402))

(declare-fun b_and!9037 () Bool)

(assert (= b_and!9033 (and (=> t!6402 result!4265) b_and!9037)))

(declare-fun b_lambda!6501 () Bool)

(assert (=> (not b_lambda!6501) (not b!145150)))

(assert (=> b!145150 t!6400))

(declare-fun b_and!9039 () Bool)

(assert (= b_and!9035 (and (=> t!6400 result!4261) b_and!9039)))

(assert (=> b!145150 t!6402))

(declare-fun b_and!9041 () Bool)

(assert (= b_and!9037 (and (=> t!6402 result!4265) b_and!9041)))

(assert (=> b!145150 m!174571))

(assert (=> b!145150 m!174579))

(assert (=> b!145150 m!174571))

(declare-fun m!174941 () Bool)

(assert (=> b!145150 m!174941))

(assert (=> b!145150 m!174579))

(assert (=> b!145150 m!174479))

(assert (=> b!145150 m!174581))

(assert (=> b!145150 m!174479))

(assert (=> b!145148 m!174571))

(assert (=> b!145148 m!174571))

(assert (=> b!145148 m!174585))

(declare-fun m!174943 () Bool)

(assert (=> b!145146 m!174943))

(declare-fun m!174945 () Bool)

(assert (=> b!145146 m!174945))

(assert (=> b!145146 m!174571))

(assert (=> b!145146 m!174579))

(declare-fun m!174947 () Bool)

(assert (=> b!145146 m!174947))

(assert (=> b!145146 m!174943))

(assert (=> b!145146 m!174579))

(assert (=> b!145146 m!174479))

(assert (=> b!145146 m!174581))

(declare-fun m!174949 () Bool)

(assert (=> b!145146 m!174949))

(assert (=> b!145146 m!174479))

(declare-fun m!174951 () Bool)

(assert (=> d!46195 m!174951))

(assert (=> d!46195 m!174589))

(declare-fun m!174953 () Bool)

(assert (=> b!145156 m!174953))

(assert (=> bm!16210 m!174953))

(assert (=> b!145155 m!174571))

(assert (=> b!145155 m!174571))

(assert (=> b!145155 m!174585))

(assert (=> b!145147 m!174571))

(assert (=> b!145147 m!174571))

(declare-fun m!174955 () Bool)

(assert (=> b!145147 m!174955))

(declare-fun m!174957 () Bool)

(assert (=> b!145154 m!174957))

(declare-fun m!174959 () Bool)

(assert (=> b!145157 m!174959))

(assert (=> b!144771 d!46195))

(declare-fun d!46197 () Bool)

(assert (=> d!46197 (= (apply!123 lt!76029 lt!76043) (get!1553 (getValueByKey!179 (toList!894 lt!76029) lt!76043)))))

(declare-fun bs!6114 () Bool)

(assert (= bs!6114 d!46197))

(declare-fun m!174961 () Bool)

(assert (=> bs!6114 m!174961))

(assert (=> bs!6114 m!174961))

(declare-fun m!174963 () Bool)

(assert (=> bs!6114 m!174963))

(assert (=> b!144771 d!46197))

(declare-fun d!46199 () Bool)

(declare-fun e!94581 () Bool)

(assert (=> d!46199 e!94581))

(declare-fun res!69143 () Bool)

(assert (=> d!46199 (=> (not res!69143) (not e!94581))))

(declare-fun lt!76323 () ListLongMap!1757)

(assert (=> d!46199 (= res!69143 (contains!936 lt!76323 (_1!1372 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lt!76321 () List!1758)

(assert (=> d!46199 (= lt!76323 (ListLongMap!1758 lt!76321))))

(declare-fun lt!76324 () Unit!4578)

(declare-fun lt!76322 () Unit!4578)

(assert (=> d!46199 (= lt!76324 lt!76322)))

(assert (=> d!46199 (= (getValueByKey!179 lt!76321 (_1!1372 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))) (Some!184 (_2!1372 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46199 (= lt!76322 (lemmaContainsTupThenGetReturnValue!93 lt!76321 (_1!1372 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) (_2!1372 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46199 (= lt!76321 (insertStrictlySorted!96 (toList!894 lt!76029) (_1!1372 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) (_2!1372 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46199 (= (+!182 lt!76029 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76323)))

(declare-fun b!145158 () Bool)

(declare-fun res!69144 () Bool)

(assert (=> b!145158 (=> (not res!69144) (not e!94581))))

(assert (=> b!145158 (= res!69144 (= (getValueByKey!179 (toList!894 lt!76323) (_1!1372 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))) (Some!184 (_2!1372 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun b!145159 () Bool)

(assert (=> b!145159 (= e!94581 (contains!940 (toList!894 lt!76323) (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))))))

(assert (= (and d!46199 res!69143) b!145158))

(assert (= (and b!145158 res!69144) b!145159))

(declare-fun m!174965 () Bool)

(assert (=> d!46199 m!174965))

(declare-fun m!174967 () Bool)

(assert (=> d!46199 m!174967))

(declare-fun m!174969 () Bool)

(assert (=> d!46199 m!174969))

(declare-fun m!174971 () Bool)

(assert (=> d!46199 m!174971))

(declare-fun m!174973 () Bool)

(assert (=> b!145158 m!174973))

(declare-fun m!174975 () Bool)

(assert (=> b!145159 m!174975))

(assert (=> b!144771 d!46199))

(declare-fun d!46201 () Bool)

(assert (=> d!46201 (= (apply!123 (+!182 lt!76028 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76026) (apply!123 lt!76028 lt!76026))))

(declare-fun lt!76327 () Unit!4578)

(declare-fun choose!896 (ListLongMap!1757 (_ BitVec 64) V!3579 (_ BitVec 64)) Unit!4578)

(assert (=> d!46201 (= lt!76327 (choose!896 lt!76028 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76026))))

(declare-fun e!94584 () Bool)

(assert (=> d!46201 e!94584))

(declare-fun res!69147 () Bool)

(assert (=> d!46201 (=> (not res!69147) (not e!94584))))

(assert (=> d!46201 (= res!69147 (contains!936 lt!76028 lt!76026))))

(assert (=> d!46201 (= (addApplyDifferent!99 lt!76028 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76026) lt!76327)))

(declare-fun b!145163 () Bool)

(assert (=> b!145163 (= e!94584 (not (= lt!76026 lt!76031)))))

(assert (= (and d!46201 res!69147) b!145163))

(declare-fun m!174977 () Bool)

(assert (=> d!46201 m!174977))

(assert (=> d!46201 m!174603))

(assert (=> d!46201 m!174619))

(assert (=> d!46201 m!174625))

(declare-fun m!174979 () Bool)

(assert (=> d!46201 m!174979))

(assert (=> d!46201 m!174603))

(assert (=> b!144771 d!46201))

(declare-fun d!46203 () Bool)

(assert (=> d!46203 (= (apply!123 (+!182 lt!76045 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76037) (apply!123 lt!76045 lt!76037))))

(declare-fun lt!76328 () Unit!4578)

(assert (=> d!46203 (= lt!76328 (choose!896 lt!76045 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76037))))

(declare-fun e!94585 () Bool)

(assert (=> d!46203 e!94585))

(declare-fun res!69148 () Bool)

(assert (=> d!46203 (=> (not res!69148) (not e!94585))))

(assert (=> d!46203 (= res!69148 (contains!936 lt!76045 lt!76037))))

(assert (=> d!46203 (= (addApplyDifferent!99 lt!76045 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76037) lt!76328)))

(declare-fun b!145164 () Bool)

(assert (=> b!145164 (= e!94585 (not (= lt!76037 lt!76044)))))

(assert (= (and d!46203 res!69148) b!145164))

(declare-fun m!174981 () Bool)

(assert (=> d!46203 m!174981))

(assert (=> d!46203 m!174599))

(assert (=> d!46203 m!174601))

(assert (=> d!46203 m!174613))

(declare-fun m!174983 () Bool)

(assert (=> d!46203 m!174983))

(assert (=> d!46203 m!174599))

(assert (=> b!144771 d!46203))

(declare-fun d!46205 () Bool)

(assert (=> d!46205 (= (apply!123 lt!76028 lt!76026) (get!1553 (getValueByKey!179 (toList!894 lt!76028) lt!76026)))))

(declare-fun bs!6115 () Bool)

(assert (= bs!6115 d!46205))

(declare-fun m!174985 () Bool)

(assert (=> bs!6115 m!174985))

(assert (=> bs!6115 m!174985))

(declare-fun m!174987 () Bool)

(assert (=> bs!6115 m!174987))

(assert (=> b!144771 d!46205))

(declare-fun d!46207 () Bool)

(assert (=> d!46207 (= (apply!123 (+!182 lt!76029 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76043) (apply!123 lt!76029 lt!76043))))

(declare-fun lt!76329 () Unit!4578)

(assert (=> d!46207 (= lt!76329 (choose!896 lt!76029 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76043))))

(declare-fun e!94586 () Bool)

(assert (=> d!46207 e!94586))

(declare-fun res!69149 () Bool)

(assert (=> d!46207 (=> (not res!69149) (not e!94586))))

(assert (=> d!46207 (= res!69149 (contains!936 lt!76029 lt!76043))))

(assert (=> d!46207 (= (addApplyDifferent!99 lt!76029 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))) lt!76043) lt!76329)))

(declare-fun b!145165 () Bool)

(assert (=> b!145165 (= e!94586 (not (= lt!76043 lt!76034)))))

(assert (= (and d!46207 res!69149) b!145165))

(declare-fun m!174989 () Bool)

(assert (=> d!46207 m!174989))

(assert (=> d!46207 m!174605))

(assert (=> d!46207 m!174607))

(assert (=> d!46207 m!174615))

(declare-fun m!174991 () Bool)

(assert (=> d!46207 m!174991))

(assert (=> d!46207 m!174605))

(assert (=> b!144771 d!46207))

(declare-fun d!46209 () Bool)

(assert (=> d!46209 (= (apply!123 (+!182 lt!76029 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76043) (get!1553 (getValueByKey!179 (toList!894 (+!182 lt!76029 (tuple2!2723 lt!76034 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))) lt!76043)))))

(declare-fun bs!6116 () Bool)

(assert (= bs!6116 d!46209))

(declare-fun m!174993 () Bool)

(assert (=> bs!6116 m!174993))

(assert (=> bs!6116 m!174993))

(declare-fun m!174995 () Bool)

(assert (=> bs!6116 m!174995))

(assert (=> b!144771 d!46209))

(declare-fun d!46211 () Bool)

(assert (=> d!46211 (= (apply!123 lt!76045 lt!76037) (get!1553 (getValueByKey!179 (toList!894 lt!76045) lt!76037)))))

(declare-fun bs!6117 () Bool)

(assert (= bs!6117 d!46211))

(declare-fun m!174997 () Bool)

(assert (=> bs!6117 m!174997))

(assert (=> bs!6117 m!174997))

(declare-fun m!174999 () Bool)

(assert (=> bs!6117 m!174999))

(assert (=> b!144771 d!46211))

(declare-fun d!46213 () Bool)

(assert (=> d!46213 (= (apply!123 (+!182 lt!76028 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76026) (get!1553 (getValueByKey!179 (toList!894 (+!182 lt!76028 (tuple2!2723 lt!76031 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) lt!76026)))))

(declare-fun bs!6118 () Bool)

(assert (= bs!6118 d!46213))

(declare-fun m!175001 () Bool)

(assert (=> bs!6118 m!175001))

(assert (=> bs!6118 m!175001))

(declare-fun m!175003 () Bool)

(assert (=> bs!6118 m!175003))

(assert (=> b!144771 d!46213))

(declare-fun d!46215 () Bool)

(declare-fun e!94587 () Bool)

(assert (=> d!46215 e!94587))

(declare-fun res!69150 () Bool)

(assert (=> d!46215 (=> (not res!69150) (not e!94587))))

(declare-fun lt!76332 () ListLongMap!1757)

(assert (=> d!46215 (= res!69150 (contains!936 lt!76332 (_1!1372 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lt!76330 () List!1758)

(assert (=> d!46215 (= lt!76332 (ListLongMap!1758 lt!76330))))

(declare-fun lt!76333 () Unit!4578)

(declare-fun lt!76331 () Unit!4578)

(assert (=> d!46215 (= lt!76333 lt!76331)))

(assert (=> d!46215 (= (getValueByKey!179 lt!76330 (_1!1372 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) (Some!184 (_2!1372 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46215 (= lt!76331 (lemmaContainsTupThenGetReturnValue!93 lt!76330 (_1!1372 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) (_2!1372 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46215 (= lt!76330 (insertStrictlySorted!96 (toList!894 lt!76045) (_1!1372 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) (_2!1372 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46215 (= (+!182 lt!76045 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76332)))

(declare-fun b!145166 () Bool)

(declare-fun res!69151 () Bool)

(assert (=> b!145166 (=> (not res!69151) (not e!94587))))

(assert (=> b!145166 (= res!69151 (= (getValueByKey!179 (toList!894 lt!76332) (_1!1372 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) (Some!184 (_2!1372 (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun b!145167 () Bool)

(assert (=> b!145167 (= e!94587 (contains!940 (toList!894 lt!76332) (tuple2!2723 lt!76044 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))

(assert (= (and d!46215 res!69150) b!145166))

(assert (= (and b!145166 res!69151) b!145167))

(declare-fun m!175005 () Bool)

(assert (=> d!46215 m!175005))

(declare-fun m!175007 () Bool)

(assert (=> d!46215 m!175007))

(declare-fun m!175009 () Bool)

(assert (=> d!46215 m!175009))

(declare-fun m!175011 () Bool)

(assert (=> d!46215 m!175011))

(declare-fun m!175013 () Bool)

(assert (=> b!145166 m!175013))

(declare-fun m!175015 () Bool)

(assert (=> b!145167 m!175015))

(assert (=> b!144771 d!46215))

(declare-fun d!46217 () Bool)

(declare-fun e!94588 () Bool)

(assert (=> d!46217 e!94588))

(declare-fun res!69152 () Bool)

(assert (=> d!46217 (=> res!69152 e!94588)))

(declare-fun lt!76337 () Bool)

(assert (=> d!46217 (= res!69152 (not lt!76337))))

(declare-fun lt!76336 () Bool)

(assert (=> d!46217 (= lt!76337 lt!76336)))

(declare-fun lt!76334 () Unit!4578)

(declare-fun e!94589 () Unit!4578)

(assert (=> d!46217 (= lt!76334 e!94589)))

(declare-fun c!27489 () Bool)

(assert (=> d!46217 (= c!27489 lt!76336)))

(assert (=> d!46217 (= lt!76336 (containsKey!183 (toList!894 (+!182 lt!76025 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))) lt!76041))))

(assert (=> d!46217 (= (contains!936 (+!182 lt!76025 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76041) lt!76337)))

(declare-fun b!145168 () Bool)

(declare-fun lt!76335 () Unit!4578)

(assert (=> b!145168 (= e!94589 lt!76335)))

(assert (=> b!145168 (= lt!76335 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!894 (+!182 lt!76025 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))) lt!76041))))

(assert (=> b!145168 (isDefined!132 (getValueByKey!179 (toList!894 (+!182 lt!76025 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))) lt!76041))))

(declare-fun b!145169 () Bool)

(declare-fun Unit!4592 () Unit!4578)

(assert (=> b!145169 (= e!94589 Unit!4592)))

(declare-fun b!145170 () Bool)

(assert (=> b!145170 (= e!94588 (isDefined!132 (getValueByKey!179 (toList!894 (+!182 lt!76025 (tuple2!2723 lt!76035 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))))) lt!76041)))))

(assert (= (and d!46217 c!27489) b!145168))

(assert (= (and d!46217 (not c!27489)) b!145169))

(assert (= (and d!46217 (not res!69152)) b!145170))

(declare-fun m!175017 () Bool)

(assert (=> d!46217 m!175017))

(declare-fun m!175019 () Bool)

(assert (=> b!145168 m!175019))

(declare-fun m!175021 () Bool)

(assert (=> b!145168 m!175021))

(assert (=> b!145168 m!175021))

(declare-fun m!175023 () Bool)

(assert (=> b!145168 m!175023))

(assert (=> b!145170 m!175021))

(assert (=> b!145170 m!175021))

(assert (=> b!145170 m!175023))

(assert (=> b!144771 d!46217))

(declare-fun d!46219 () Bool)

(assert (=> d!46219 (= (map!1451 (_2!1373 lt!76120)) (getCurrentListMap!564 (_keys!4756 (_2!1373 lt!76120)) (_values!2972 (_2!1373 lt!76120)) (mask!7353 (_2!1373 lt!76120)) (extraKeys!2736 (_2!1373 lt!76120)) (zeroValue!2835 (_2!1373 lt!76120)) (minValue!2835 (_2!1373 lt!76120)) #b00000000000000000000000000000000 (defaultEntry!2989 (_2!1373 lt!76120))))))

(declare-fun bs!6119 () Bool)

(assert (= bs!6119 d!46219))

(declare-fun m!175025 () Bool)

(assert (=> bs!6119 m!175025))

(assert (=> bm!16172 d!46219))

(declare-fun d!46221 () Bool)

(declare-fun res!69157 () Bool)

(declare-fun e!94594 () Bool)

(assert (=> d!46221 (=> res!69157 e!94594)))

(assert (=> d!46221 (= res!69157 (and ((_ is Cons!1754) (toList!894 lt!75955)) (= (_1!1372 (h!2362 (toList!894 lt!75955))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (=> d!46221 (= (containsKey!183 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) e!94594)))

(declare-fun b!145175 () Bool)

(declare-fun e!94595 () Bool)

(assert (=> b!145175 (= e!94594 e!94595)))

(declare-fun res!69158 () Bool)

(assert (=> b!145175 (=> (not res!69158) (not e!94595))))

(assert (=> b!145175 (= res!69158 (and (or (not ((_ is Cons!1754) (toList!894 lt!75955))) (bvsle (_1!1372 (h!2362 (toList!894 lt!75955))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355))) ((_ is Cons!1754) (toList!894 lt!75955)) (bvslt (_1!1372 (h!2362 (toList!894 lt!75955))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(declare-fun b!145176 () Bool)

(assert (=> b!145176 (= e!94595 (containsKey!183 (t!6403 (toList!894 lt!75955)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (= (and d!46221 (not res!69157)) b!145175))

(assert (= (and b!145175 res!69158) b!145176))

(assert (=> b!145176 m!174471))

(declare-fun m!175027 () Bool)

(assert (=> b!145176 m!175027))

(assert (=> d!46109 d!46221))

(declare-fun d!46223 () Bool)

(declare-fun lt!76338 () Bool)

(assert (=> d!46223 (= lt!76338 (select (content!141 (t!6404 lt!75953)) (h!2363 lt!75953)))))

(declare-fun e!94596 () Bool)

(assert (=> d!46223 (= lt!76338 e!94596)))

(declare-fun res!69159 () Bool)

(assert (=> d!46223 (=> (not res!69159) (not e!94596))))

(assert (=> d!46223 (= res!69159 ((_ is Cons!1755) (t!6404 lt!75953)))))

(assert (=> d!46223 (= (contains!937 (t!6404 lt!75953) (h!2363 lt!75953)) lt!76338)))

(declare-fun b!145177 () Bool)

(declare-fun e!94597 () Bool)

(assert (=> b!145177 (= e!94596 e!94597)))

(declare-fun res!69160 () Bool)

(assert (=> b!145177 (=> res!69160 e!94597)))

(assert (=> b!145177 (= res!69160 (= (h!2363 (t!6404 lt!75953)) (h!2363 lt!75953)))))

(declare-fun b!145178 () Bool)

(assert (=> b!145178 (= e!94597 (contains!937 (t!6404 (t!6404 lt!75953)) (h!2363 lt!75953)))))

(assert (= (and d!46223 res!69159) b!145177))

(assert (= (and b!145177 (not res!69160)) b!145178))

(assert (=> d!46223 m!174905))

(declare-fun m!175029 () Bool)

(assert (=> d!46223 m!175029))

(declare-fun m!175031 () Bool)

(assert (=> b!145178 m!175031))

(assert (=> b!144782 d!46223))

(declare-fun d!46225 () Bool)

(declare-fun e!94598 () Bool)

(assert (=> d!46225 e!94598))

(declare-fun res!69161 () Bool)

(assert (=> d!46225 (=> (not res!69161) (not e!94598))))

(declare-fun lt!76341 () ListLongMap!1757)

(assert (=> d!46225 (= res!69161 (contains!936 lt!76341 (_1!1372 (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun lt!76339 () List!1758)

(assert (=> d!46225 (= lt!76341 (ListLongMap!1758 lt!76339))))

(declare-fun lt!76342 () Unit!4578)

(declare-fun lt!76340 () Unit!4578)

(assert (=> d!46225 (= lt!76342 lt!76340)))

(assert (=> d!46225 (= (getValueByKey!179 lt!76339 (_1!1372 (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))) (Some!184 (_2!1372 (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))))

(assert (=> d!46225 (= lt!76340 (lemmaContainsTupThenGetReturnValue!93 lt!76339 (_1!1372 (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) (_2!1372 (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))))

(assert (=> d!46225 (= lt!76339 (insertStrictlySorted!96 (toList!894 (ite c!27390 call!16109 (ite c!27394 call!16108 call!16110))) (_1!1372 (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) (_2!1372 (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))))

(assert (=> d!46225 (= (+!182 (ite c!27390 call!16109 (ite c!27394 call!16108 call!16110)) (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) lt!76341)))

(declare-fun b!145179 () Bool)

(declare-fun res!69162 () Bool)

(assert (=> b!145179 (=> (not res!69162) (not e!94598))))

(assert (=> b!145179 (= res!69162 (= (getValueByKey!179 (toList!894 lt!76341) (_1!1372 (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))) (Some!184 (_2!1372 (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))))

(declare-fun b!145180 () Bool)

(assert (=> b!145180 (= e!94598 (contains!940 (toList!894 lt!76341) (ite (or c!27390 c!27394) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 (v!3320 (underlying!488 thiss!992)))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (= (and d!46225 res!69161) b!145179))

(assert (= (and b!145179 res!69162) b!145180))

(declare-fun m!175033 () Bool)

(assert (=> d!46225 m!175033))

(declare-fun m!175035 () Bool)

(assert (=> d!46225 m!175035))

(declare-fun m!175037 () Bool)

(assert (=> d!46225 m!175037))

(declare-fun m!175039 () Bool)

(assert (=> d!46225 m!175039))

(declare-fun m!175041 () Bool)

(assert (=> b!145179 m!175041))

(declare-fun m!175043 () Bool)

(assert (=> b!145180 m!175043))

(assert (=> bm!16106 d!46225))

(assert (=> bm!16105 d!46195))

(declare-fun d!46227 () Bool)

(declare-fun e!94599 () Bool)

(assert (=> d!46227 e!94599))

(declare-fun res!69163 () Bool)

(assert (=> d!46227 (=> res!69163 e!94599)))

(declare-fun lt!76346 () Bool)

(assert (=> d!46227 (= res!69163 (not lt!76346))))

(declare-fun lt!76345 () Bool)

(assert (=> d!46227 (= lt!76346 lt!76345)))

(declare-fun lt!76343 () Unit!4578)

(declare-fun e!94600 () Unit!4578)

(assert (=> d!46227 (= lt!76343 e!94600)))

(declare-fun c!27490 () Bool)

(assert (=> d!46227 (= c!27490 lt!76345)))

(assert (=> d!46227 (= lt!76345 (containsKey!183 (toList!894 call!16185) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> d!46227 (= (contains!936 call!16185 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) lt!76346)))

(declare-fun b!145181 () Bool)

(declare-fun lt!76344 () Unit!4578)

(assert (=> b!145181 (= e!94600 lt!76344)))

(assert (=> b!145181 (= lt!76344 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!894 call!16185) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!145181 (isDefined!132 (getValueByKey!179 (toList!894 call!16185) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145182 () Bool)

(declare-fun Unit!4593 () Unit!4578)

(assert (=> b!145182 (= e!94600 Unit!4593)))

(declare-fun b!145183 () Bool)

(assert (=> b!145183 (= e!94599 (isDefined!132 (getValueByKey!179 (toList!894 call!16185) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(assert (= (and d!46227 c!27490) b!145181))

(assert (= (and d!46227 (not c!27490)) b!145182))

(assert (= (and d!46227 (not res!69163)) b!145183))

(assert (=> d!46227 m!174471))

(declare-fun m!175045 () Bool)

(assert (=> d!46227 m!175045))

(assert (=> b!145181 m!174471))

(declare-fun m!175047 () Bool)

(assert (=> b!145181 m!175047))

(assert (=> b!145181 m!174471))

(declare-fun m!175049 () Bool)

(assert (=> b!145181 m!175049))

(assert (=> b!145181 m!175049))

(declare-fun m!175051 () Bool)

(assert (=> b!145181 m!175051))

(assert (=> b!145183 m!174471))

(assert (=> b!145183 m!175049))

(assert (=> b!145183 m!175049))

(assert (=> b!145183 m!175051))

(assert (=> b!144937 d!46227))

(declare-fun d!46229 () Bool)

(declare-fun e!94601 () Bool)

(assert (=> d!46229 e!94601))

(declare-fun res!69164 () Bool)

(assert (=> d!46229 (=> (not res!69164) (not e!94601))))

(declare-fun lt!76349 () ListLongMap!1757)

(assert (=> d!46229 (= res!69164 (contains!936 lt!76349 (_1!1372 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(declare-fun lt!76347 () List!1758)

(assert (=> d!46229 (= lt!76349 (ListLongMap!1758 lt!76347))))

(declare-fun lt!76350 () Unit!4578)

(declare-fun lt!76348 () Unit!4578)

(assert (=> d!46229 (= lt!76350 lt!76348)))

(assert (=> d!46229 (= (getValueByKey!179 lt!76347 (_1!1372 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) (Some!184 (_2!1372 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46229 (= lt!76348 (lemmaContainsTupThenGetReturnValue!93 lt!76347 (_1!1372 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) (_2!1372 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46229 (= lt!76347 (insertStrictlySorted!96 (toList!894 call!16113) (_1!1372 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) (_2!1372 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))))))

(assert (=> d!46229 (= (+!182 call!16113 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))) lt!76349)))

(declare-fun b!145184 () Bool)

(declare-fun res!69165 () Bool)

(assert (=> b!145184 (=> (not res!69165) (not e!94601))))

(assert (=> b!145184 (= res!69165 (= (getValueByKey!179 (toList!894 lt!76349) (_1!1372 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992)))))) (Some!184 (_2!1372 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))))

(declare-fun b!145185 () Bool)

(assert (=> b!145185 (= e!94601 (contains!940 (toList!894 lt!76349) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 (v!3320 (underlying!488 thiss!992))))))))

(assert (= (and d!46229 res!69164) b!145184))

(assert (= (and b!145184 res!69165) b!145185))

(declare-fun m!175053 () Bool)

(assert (=> d!46229 m!175053))

(declare-fun m!175055 () Bool)

(assert (=> d!46229 m!175055))

(declare-fun m!175057 () Bool)

(assert (=> d!46229 m!175057))

(declare-fun m!175059 () Bool)

(assert (=> d!46229 m!175059))

(declare-fun m!175061 () Bool)

(assert (=> b!145184 m!175061))

(declare-fun m!175063 () Bool)

(assert (=> b!145185 m!175063))

(assert (=> b!144775 d!46229))

(declare-fun d!46231 () Bool)

(assert (=> d!46231 (= (apply!123 lt!76030 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1553 (getValueByKey!179 (toList!894 lt!76030) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!6120 () Bool)

(assert (= bs!6120 d!46231))

(assert (=> bs!6120 m!174571))

(declare-fun m!175065 () Bool)

(assert (=> bs!6120 m!175065))

(assert (=> bs!6120 m!175065))

(declare-fun m!175067 () Bool)

(assert (=> bs!6120 m!175067))

(assert (=> b!144759 d!46231))

(declare-fun d!46233 () Bool)

(declare-fun c!27491 () Bool)

(assert (=> d!46233 (= c!27491 ((_ is ValueCellFull!1131) (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!94602 () V!3579)

(assert (=> d!46233 (= (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!94602)))

(declare-fun b!145186 () Bool)

(assert (=> b!145186 (= e!94602 (get!1551 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!145187 () Bool)

(assert (=> b!145187 (= e!94602 (get!1552 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!46233 c!27491) b!145186))

(assert (= (and d!46233 (not c!27491)) b!145187))

(assert (=> b!145186 m!174579))

(assert (=> b!145186 m!174479))

(declare-fun m!175069 () Bool)

(assert (=> b!145186 m!175069))

(assert (=> b!145187 m!174579))

(assert (=> b!145187 m!174479))

(declare-fun m!175071 () Bool)

(assert (=> b!145187 m!175071))

(assert (=> b!144759 d!46233))

(declare-fun d!46235 () Bool)

(declare-fun lt!76351 () Bool)

(assert (=> d!46235 (= lt!76351 (select (content!141 (t!6404 lt!75953)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94603 () Bool)

(assert (=> d!46235 (= lt!76351 e!94603)))

(declare-fun res!69166 () Bool)

(assert (=> d!46235 (=> (not res!69166) (not e!94603))))

(assert (=> d!46235 (= res!69166 ((_ is Cons!1755) (t!6404 lt!75953)))))

(assert (=> d!46235 (= (contains!937 (t!6404 lt!75953) #b1000000000000000000000000000000000000000000000000000000000000000) lt!76351)))

(declare-fun b!145188 () Bool)

(declare-fun e!94604 () Bool)

(assert (=> b!145188 (= e!94603 e!94604)))

(declare-fun res!69167 () Bool)

(assert (=> b!145188 (=> res!69167 e!94604)))

(assert (=> b!145188 (= res!69167 (= (h!2363 (t!6404 lt!75953)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145189 () Bool)

(assert (=> b!145189 (= e!94604 (contains!937 (t!6404 (t!6404 lt!75953)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46235 res!69166) b!145188))

(assert (= (and b!145188 (not res!69167)) b!145189))

(assert (=> d!46235 m!174905))

(declare-fun m!175073 () Bool)

(assert (=> d!46235 m!175073))

(declare-fun m!175075 () Bool)

(assert (=> b!145189 m!175075))

(assert (=> b!144714 d!46235))

(declare-fun d!46237 () Bool)

(declare-fun e!94607 () Bool)

(assert (=> d!46237 e!94607))

(declare-fun res!69172 () Bool)

(assert (=> d!46237 (=> (not res!69172) (not e!94607))))

(declare-fun lt!76357 () SeekEntryResult!282)

(assert (=> d!46237 (= res!69172 ((_ is Found!282) lt!76357))))

(assert (=> d!46237 (= lt!76357 (seekEntryOrOpen!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4756 newMap!16) (mask!7353 newMap!16)))))

(declare-fun lt!76356 () Unit!4578)

(declare-fun choose!897 (array!4939 array!4941 (_ BitVec 32) (_ BitVec 32) V!3579 V!3579 (_ BitVec 64) Int) Unit!4578)

(assert (=> d!46237 (= lt!76356 (choose!897 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2989 newMap!16)))))

(assert (=> d!46237 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46237 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!68 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (defaultEntry!2989 newMap!16)) lt!76356)))

(declare-fun b!145194 () Bool)

(declare-fun res!69173 () Bool)

(assert (=> b!145194 (=> (not res!69173) (not e!94607))))

(assert (=> b!145194 (= res!69173 (inRange!0 (index!3295 lt!76357) (mask!7353 newMap!16)))))

(declare-fun b!145195 () Bool)

(assert (=> b!145195 (= e!94607 (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76357)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!145195 (and (bvsge (index!3295 lt!76357) #b00000000000000000000000000000000) (bvslt (index!3295 lt!76357) (size!2608 (_keys!4756 newMap!16))))))

(assert (= (and d!46237 res!69172) b!145194))

(assert (= (and b!145194 res!69173) b!145195))

(assert (=> d!46237 m!174471))

(assert (=> d!46237 m!174691))

(assert (=> d!46237 m!174471))

(declare-fun m!175077 () Bool)

(assert (=> d!46237 m!175077))

(assert (=> d!46237 m!174801))

(declare-fun m!175079 () Bool)

(assert (=> b!145194 m!175079))

(declare-fun m!175081 () Bool)

(assert (=> b!145195 m!175081))

(assert (=> bm!16176 d!46237))

(declare-fun d!46239 () Bool)

(declare-fun isEmpty!425 (Option!185) Bool)

(assert (=> d!46239 (= (isDefined!132 (getValueByKey!179 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355))) (not (isEmpty!425 (getValueByKey!179 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))))

(declare-fun bs!6121 () Bool)

(assert (= bs!6121 d!46239))

(assert (=> bs!6121 m!174655))

(declare-fun m!175083 () Bool)

(assert (=> bs!6121 m!175083))

(assert (=> b!144818 d!46239))

(declare-fun d!46241 () Bool)

(declare-fun c!27496 () Bool)

(assert (=> d!46241 (= c!27496 (and ((_ is Cons!1754) (toList!894 lt!75955)) (= (_1!1372 (h!2362 (toList!894 lt!75955))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355))))))

(declare-fun e!94612 () Option!185)

(assert (=> d!46241 (= (getValueByKey!179 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) e!94612)))

(declare-fun b!145204 () Bool)

(assert (=> b!145204 (= e!94612 (Some!184 (_2!1372 (h!2362 (toList!894 lt!75955)))))))

(declare-fun b!145206 () Bool)

(declare-fun e!94613 () Option!185)

(assert (=> b!145206 (= e!94613 (getValueByKey!179 (t!6403 (toList!894 lt!75955)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145207 () Bool)

(assert (=> b!145207 (= e!94613 None!183)))

(declare-fun b!145205 () Bool)

(assert (=> b!145205 (= e!94612 e!94613)))

(declare-fun c!27497 () Bool)

(assert (=> b!145205 (= c!27497 (and ((_ is Cons!1754) (toList!894 lt!75955)) (not (= (_1!1372 (h!2362 (toList!894 lt!75955))) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))))

(assert (= (and d!46241 c!27496) b!145204))

(assert (= (and d!46241 (not c!27496)) b!145205))

(assert (= (and b!145205 c!27497) b!145206))

(assert (= (and b!145205 (not c!27497)) b!145207))

(assert (=> b!145206 m!174471))

(declare-fun m!175085 () Bool)

(assert (=> b!145206 m!175085))

(assert (=> b!144818 d!46241))

(assert (=> b!144766 d!46145))

(declare-fun b!145208 () Bool)

(declare-fun e!94617 () Bool)

(declare-fun call!16214 () Bool)

(assert (=> b!145208 (= e!94617 call!16214)))

(declare-fun b!145209 () Bool)

(assert (=> b!145209 (= e!94617 call!16214)))

(declare-fun b!145210 () Bool)

(declare-fun e!94616 () Bool)

(assert (=> b!145210 (= e!94616 e!94617)))

(declare-fun c!27498 () Bool)

(assert (=> b!145210 (= c!27498 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun d!46243 () Bool)

(declare-fun res!69176 () Bool)

(declare-fun e!94615 () Bool)

(assert (=> d!46243 (=> res!69176 e!94615)))

(assert (=> d!46243 (= res!69176 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46243 (= (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (ite c!27397 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75953) lt!75953)) e!94615)))

(declare-fun e!94614 () Bool)

(declare-fun b!145211 () Bool)

(assert (=> b!145211 (= e!94614 (contains!937 (ite c!27397 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75953) lt!75953) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!16211 () Bool)

(assert (=> bm!16211 (= call!16214 (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27498 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (ite c!27397 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75953) lt!75953)) (ite c!27397 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) lt!75953) lt!75953))))))

(declare-fun b!145212 () Bool)

(assert (=> b!145212 (= e!94615 e!94616)))

(declare-fun res!69174 () Bool)

(assert (=> b!145212 (=> (not res!69174) (not e!94616))))

(assert (=> b!145212 (= res!69174 (not e!94614))))

(declare-fun res!69175 () Bool)

(assert (=> b!145212 (=> (not res!69175) (not e!94614))))

(assert (=> b!145212 (= res!69175 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!46243 (not res!69176)) b!145212))

(assert (= (and b!145212 res!69175) b!145211))

(assert (= (and b!145212 res!69174) b!145210))

(assert (= (and b!145210 c!27498) b!145208))

(assert (= (and b!145210 (not c!27498)) b!145209))

(assert (= (or b!145208 b!145209) bm!16211))

(assert (=> b!145210 m!174879))

(assert (=> b!145210 m!174879))

(declare-fun m!175087 () Bool)

(assert (=> b!145210 m!175087))

(assert (=> b!145211 m!174879))

(assert (=> b!145211 m!174879))

(declare-fun m!175089 () Bool)

(assert (=> b!145211 m!175089))

(assert (=> bm!16211 m!174879))

(declare-fun m!175091 () Bool)

(assert (=> bm!16211 m!175091))

(assert (=> b!145212 m!174879))

(assert (=> b!145212 m!174879))

(assert (=> b!145212 m!175087))

(assert (=> bm!16113 d!46243))

(assert (=> b!144947 d!46173))

(declare-fun d!46245 () Bool)

(assert (=> d!46245 (isDefined!132 (getValueByKey!179 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun lt!76360 () Unit!4578)

(declare-fun choose!898 (List!1758 (_ BitVec 64)) Unit!4578)

(assert (=> d!46245 (= lt!76360 (choose!898 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun e!94620 () Bool)

(assert (=> d!46245 e!94620))

(declare-fun res!69179 () Bool)

(assert (=> d!46245 (=> (not res!69179) (not e!94620))))

(declare-fun isStrictlySorted!328 (List!1758) Bool)

(assert (=> d!46245 (= res!69179 (isStrictlySorted!328 (toList!894 lt!75955)))))

(assert (=> d!46245 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) lt!76360)))

(declare-fun b!145215 () Bool)

(assert (=> b!145215 (= e!94620 (containsKey!183 (toList!894 lt!75955) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (= (and d!46245 res!69179) b!145215))

(assert (=> d!46245 m!174471))

(assert (=> d!46245 m!174655))

(assert (=> d!46245 m!174655))

(assert (=> d!46245 m!174657))

(assert (=> d!46245 m!174471))

(declare-fun m!175093 () Bool)

(assert (=> d!46245 m!175093))

(declare-fun m!175095 () Bool)

(assert (=> d!46245 m!175095))

(assert (=> b!145215 m!174471))

(assert (=> b!145215 m!174651))

(assert (=> b!144816 d!46245))

(assert (=> b!144816 d!46239))

(assert (=> b!144816 d!46241))

(declare-fun d!46247 () Bool)

(declare-fun e!94621 () Bool)

(assert (=> d!46247 e!94621))

(declare-fun res!69180 () Bool)

(assert (=> d!46247 (=> res!69180 e!94621)))

(declare-fun lt!76364 () Bool)

(assert (=> d!46247 (= res!69180 (not lt!76364))))

(declare-fun lt!76363 () Bool)

(assert (=> d!46247 (= lt!76364 lt!76363)))

(declare-fun lt!76361 () Unit!4578)

(declare-fun e!94622 () Unit!4578)

(assert (=> d!46247 (= lt!76361 e!94622)))

(declare-fun c!27499 () Bool)

(assert (=> d!46247 (= c!27499 lt!76363)))

(assert (=> d!46247 (= lt!76363 (containsKey!183 (toList!894 lt!76030) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!46247 (= (contains!936 lt!76030 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!76364)))

(declare-fun b!145216 () Bool)

(declare-fun lt!76362 () Unit!4578)

(assert (=> b!145216 (= e!94622 lt!76362)))

(assert (=> b!145216 (= lt!76362 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!894 lt!76030) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!145216 (isDefined!132 (getValueByKey!179 (toList!894 lt!76030) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!145217 () Bool)

(declare-fun Unit!4594 () Unit!4578)

(assert (=> b!145217 (= e!94622 Unit!4594)))

(declare-fun b!145218 () Bool)

(assert (=> b!145218 (= e!94621 (isDefined!132 (getValueByKey!179 (toList!894 lt!76030) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!46247 c!27499) b!145216))

(assert (= (and d!46247 (not c!27499)) b!145217))

(assert (= (and d!46247 (not res!69180)) b!145218))

(assert (=> d!46247 m!174571))

(declare-fun m!175097 () Bool)

(assert (=> d!46247 m!175097))

(assert (=> b!145216 m!174571))

(declare-fun m!175099 () Bool)

(assert (=> b!145216 m!175099))

(assert (=> b!145216 m!174571))

(assert (=> b!145216 m!175065))

(assert (=> b!145216 m!175065))

(declare-fun m!175101 () Bool)

(assert (=> b!145216 m!175101))

(assert (=> b!145218 m!174571))

(assert (=> b!145218 m!175065))

(assert (=> b!145218 m!175065))

(assert (=> b!145218 m!175101))

(assert (=> b!144764 d!46247))

(declare-fun d!46249 () Bool)

(declare-fun e!94626 () Bool)

(assert (=> d!46249 e!94626))

(declare-fun res!69183 () Bool)

(assert (=> d!46249 (=> (not res!69183) (not e!94626))))

(assert (=> d!46249 (= res!69183 (or (bvsge #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))))

(declare-fun lt!76371 () ListLongMap!1757)

(declare-fun lt!76383 () ListLongMap!1757)

(assert (=> d!46249 (= lt!76371 lt!76383)))

(declare-fun lt!76381 () Unit!4578)

(declare-fun e!94627 () Unit!4578)

(assert (=> d!46249 (= lt!76381 e!94627)))

(declare-fun c!27504 () Bool)

(declare-fun e!94623 () Bool)

(assert (=> d!46249 (= c!27504 e!94623)))

(declare-fun res!69186 () Bool)

(assert (=> d!46249 (=> (not res!69186) (not e!94623))))

(assert (=> d!46249 (= res!69186 (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun e!94625 () ListLongMap!1757)

(assert (=> d!46249 (= lt!76383 e!94625)))

(declare-fun c!27501 () Bool)

(assert (=> d!46249 (= c!27501 (and (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46249 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46249 (= (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) lt!76371)))

(declare-fun b!145219 () Bool)

(declare-fun e!94631 () Bool)

(declare-fun call!16220 () Bool)

(assert (=> b!145219 (= e!94631 (not call!16220))))

(declare-fun b!145220 () Bool)

(declare-fun e!94628 () Bool)

(assert (=> b!145220 (= e!94626 e!94628)))

(declare-fun c!27500 () Bool)

(assert (=> b!145220 (= c!27500 (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145221 () Bool)

(declare-fun e!94630 () Bool)

(assert (=> b!145221 (= e!94630 (= (apply!123 lt!76371 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)) (get!1549 (select (arr!2334 (_values!2972 newMap!16)) #b00000000000000000000000000000000) (dynLambda!448 (defaultEntry!2989 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2609 (_values!2972 newMap!16))))))

(assert (=> b!145221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun bm!16212 () Bool)

(declare-fun call!16216 () ListLongMap!1757)

(declare-fun call!16217 () ListLongMap!1757)

(assert (=> bm!16212 (= call!16216 call!16217)))

(declare-fun bm!16213 () Bool)

(assert (=> bm!16213 (= call!16217 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun b!145222 () Bool)

(declare-fun e!94624 () ListLongMap!1757)

(assert (=> b!145222 (= e!94625 e!94624)))

(declare-fun c!27505 () Bool)

(assert (=> b!145222 (= c!27505 (and (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!16221 () ListLongMap!1757)

(declare-fun call!16218 () ListLongMap!1757)

(declare-fun bm!16214 () Bool)

(assert (=> bm!16214 (= call!16221 (+!182 (ite c!27501 call!16217 (ite c!27505 call!16216 call!16218)) (ite (or c!27501 c!27505) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 newMap!16)) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 newMap!16)))))))

(declare-fun b!145223 () Bool)

(declare-fun e!94635 () ListLongMap!1757)

(declare-fun call!16215 () ListLongMap!1757)

(assert (=> b!145223 (= e!94635 call!16215)))

(declare-fun b!145224 () Bool)

(assert (=> b!145224 (= e!94635 call!16218)))

(declare-fun b!145225 () Bool)

(assert (=> b!145225 (= e!94623 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145226 () Bool)

(declare-fun e!94633 () Bool)

(assert (=> b!145226 (= e!94633 e!94630)))

(declare-fun res!69184 () Bool)

(assert (=> b!145226 (=> (not res!69184) (not e!94630))))

(assert (=> b!145226 (= res!69184 (contains!936 lt!76371 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!145226 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145227 () Bool)

(declare-fun res!69187 () Bool)

(assert (=> b!145227 (=> (not res!69187) (not e!94626))))

(assert (=> b!145227 (= res!69187 e!94631)))

(declare-fun c!27502 () Bool)

(assert (=> b!145227 (= c!27502 (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!145228 () Bool)

(declare-fun e!94629 () Bool)

(assert (=> b!145228 (= e!94629 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145229 () Bool)

(declare-fun call!16219 () Bool)

(assert (=> b!145229 (= e!94628 (not call!16219))))

(declare-fun b!145230 () Bool)

(declare-fun e!94634 () Bool)

(assert (=> b!145230 (= e!94631 e!94634)))

(declare-fun res!69182 () Bool)

(assert (=> b!145230 (= res!69182 call!16220)))

(assert (=> b!145230 (=> (not res!69182) (not e!94634))))

(declare-fun bm!16215 () Bool)

(assert (=> bm!16215 (= call!16219 (contains!936 lt!76371 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145231 () Bool)

(declare-fun Unit!4595 () Unit!4578)

(assert (=> b!145231 (= e!94627 Unit!4595)))

(declare-fun bm!16216 () Bool)

(assert (=> bm!16216 (= call!16220 (contains!936 lt!76371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145232 () Bool)

(declare-fun e!94632 () Bool)

(assert (=> b!145232 (= e!94628 e!94632)))

(declare-fun res!69185 () Bool)

(assert (=> b!145232 (= res!69185 call!16219)))

(assert (=> b!145232 (=> (not res!69185) (not e!94632))))

(declare-fun b!145233 () Bool)

(declare-fun lt!76380 () Unit!4578)

(assert (=> b!145233 (= e!94627 lt!76380)))

(declare-fun lt!76366 () ListLongMap!1757)

(assert (=> b!145233 (= lt!76366 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76376 () (_ BitVec 64))

(assert (=> b!145233 (= lt!76376 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76382 () (_ BitVec 64))

(assert (=> b!145233 (= lt!76382 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76374 () Unit!4578)

(assert (=> b!145233 (= lt!76374 (addStillContains!99 lt!76366 lt!76376 (zeroValue!2835 newMap!16) lt!76382))))

(assert (=> b!145233 (contains!936 (+!182 lt!76366 (tuple2!2723 lt!76376 (zeroValue!2835 newMap!16))) lt!76382)))

(declare-fun lt!76377 () Unit!4578)

(assert (=> b!145233 (= lt!76377 lt!76374)))

(declare-fun lt!76386 () ListLongMap!1757)

(assert (=> b!145233 (= lt!76386 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76385 () (_ BitVec 64))

(assert (=> b!145233 (= lt!76385 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76378 () (_ BitVec 64))

(assert (=> b!145233 (= lt!76378 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76368 () Unit!4578)

(assert (=> b!145233 (= lt!76368 (addApplyDifferent!99 lt!76386 lt!76385 (minValue!2835 newMap!16) lt!76378))))

(assert (=> b!145233 (= (apply!123 (+!182 lt!76386 (tuple2!2723 lt!76385 (minValue!2835 newMap!16))) lt!76378) (apply!123 lt!76386 lt!76378))))

(declare-fun lt!76379 () Unit!4578)

(assert (=> b!145233 (= lt!76379 lt!76368)))

(declare-fun lt!76370 () ListLongMap!1757)

(assert (=> b!145233 (= lt!76370 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76375 () (_ BitVec 64))

(assert (=> b!145233 (= lt!76375 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76384 () (_ BitVec 64))

(assert (=> b!145233 (= lt!76384 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76365 () Unit!4578)

(assert (=> b!145233 (= lt!76365 (addApplyDifferent!99 lt!76370 lt!76375 (zeroValue!2835 newMap!16) lt!76384))))

(assert (=> b!145233 (= (apply!123 (+!182 lt!76370 (tuple2!2723 lt!76375 (zeroValue!2835 newMap!16))) lt!76384) (apply!123 lt!76370 lt!76384))))

(declare-fun lt!76373 () Unit!4578)

(assert (=> b!145233 (= lt!76373 lt!76365)))

(declare-fun lt!76369 () ListLongMap!1757)

(assert (=> b!145233 (= lt!76369 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76372 () (_ BitVec 64))

(assert (=> b!145233 (= lt!76372 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76367 () (_ BitVec 64))

(assert (=> b!145233 (= lt!76367 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145233 (= lt!76380 (addApplyDifferent!99 lt!76369 lt!76372 (minValue!2835 newMap!16) lt!76367))))

(assert (=> b!145233 (= (apply!123 (+!182 lt!76369 (tuple2!2723 lt!76372 (minValue!2835 newMap!16))) lt!76367) (apply!123 lt!76369 lt!76367))))

(declare-fun b!145234 () Bool)

(declare-fun res!69181 () Bool)

(assert (=> b!145234 (=> (not res!69181) (not e!94626))))

(assert (=> b!145234 (= res!69181 e!94633)))

(declare-fun res!69188 () Bool)

(assert (=> b!145234 (=> res!69188 e!94633)))

(assert (=> b!145234 (= res!69188 (not e!94629))))

(declare-fun res!69189 () Bool)

(assert (=> b!145234 (=> (not res!69189) (not e!94629))))

(assert (=> b!145234 (= res!69189 (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145235 () Bool)

(assert (=> b!145235 (= e!94632 (= (apply!123 lt!76371 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2835 newMap!16)))))

(declare-fun b!145236 () Bool)

(declare-fun c!27503 () Bool)

(assert (=> b!145236 (= c!27503 (and (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!145236 (= e!94624 e!94635)))

(declare-fun b!145237 () Bool)

(assert (=> b!145237 (= e!94625 (+!182 call!16221 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 newMap!16))))))

(declare-fun b!145238 () Bool)

(assert (=> b!145238 (= e!94634 (= (apply!123 lt!76371 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2835 newMap!16)))))

(declare-fun b!145239 () Bool)

(assert (=> b!145239 (= e!94624 call!16215)))

(declare-fun bm!16217 () Bool)

(assert (=> bm!16217 (= call!16218 call!16216)))

(declare-fun bm!16218 () Bool)

(assert (=> bm!16218 (= call!16215 call!16221)))

(assert (= (and d!46249 c!27501) b!145237))

(assert (= (and d!46249 (not c!27501)) b!145222))

(assert (= (and b!145222 c!27505) b!145239))

(assert (= (and b!145222 (not c!27505)) b!145236))

(assert (= (and b!145236 c!27503) b!145223))

(assert (= (and b!145236 (not c!27503)) b!145224))

(assert (= (or b!145223 b!145224) bm!16217))

(assert (= (or b!145239 bm!16217) bm!16212))

(assert (= (or b!145239 b!145223) bm!16218))

(assert (= (or b!145237 bm!16212) bm!16213))

(assert (= (or b!145237 bm!16218) bm!16214))

(assert (= (and d!46249 res!69186) b!145225))

(assert (= (and d!46249 c!27504) b!145233))

(assert (= (and d!46249 (not c!27504)) b!145231))

(assert (= (and d!46249 res!69183) b!145234))

(assert (= (and b!145234 res!69189) b!145228))

(assert (= (and b!145234 (not res!69188)) b!145226))

(assert (= (and b!145226 res!69184) b!145221))

(assert (= (and b!145234 res!69181) b!145227))

(assert (= (and b!145227 c!27502) b!145230))

(assert (= (and b!145227 (not c!27502)) b!145219))

(assert (= (and b!145230 res!69182) b!145238))

(assert (= (or b!145230 b!145219) bm!16216))

(assert (= (and b!145227 res!69187) b!145220))

(assert (= (and b!145220 c!27500) b!145232))

(assert (= (and b!145220 (not c!27500)) b!145229))

(assert (= (and b!145232 res!69185) b!145235))

(assert (= (or b!145232 b!145229) bm!16215))

(declare-fun b_lambda!6503 () Bool)

(assert (=> (not b_lambda!6503) (not b!145221)))

(declare-fun t!6412 () Bool)

(declare-fun tb!2613 () Bool)

(assert (=> (and b!144644 (= (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2989 newMap!16)) t!6412) tb!2613))

(declare-fun result!4275 () Bool)

(assert (=> tb!2613 (= result!4275 tp_is_empty!2949)))

(assert (=> b!145221 t!6412))

(declare-fun b_and!9043 () Bool)

(assert (= b_and!9039 (and (=> t!6412 result!4275) b_and!9043)))

(declare-fun t!6414 () Bool)

(declare-fun tb!2615 () Bool)

(assert (=> (and b!144637 (= (defaultEntry!2989 newMap!16) (defaultEntry!2989 newMap!16)) t!6414) tb!2615))

(declare-fun result!4277 () Bool)

(assert (= result!4277 result!4275))

(assert (=> b!145221 t!6414))

(declare-fun b_and!9045 () Bool)

(assert (= b_and!9041 (and (=> t!6414 result!4277) b_and!9045)))

(assert (=> b!145226 m!174829))

(assert (=> b!145226 m!174829))

(declare-fun m!175103 () Bool)

(assert (=> b!145226 m!175103))

(declare-fun m!175105 () Bool)

(assert (=> bm!16213 m!175105))

(declare-fun m!175107 () Bool)

(assert (=> b!145221 m!175107))

(assert (=> b!145221 m!174829))

(assert (=> b!145221 m!174829))

(declare-fun m!175109 () Bool)

(assert (=> b!145221 m!175109))

(declare-fun m!175111 () Bool)

(assert (=> b!145221 m!175111))

(assert (=> b!145221 m!175111))

(assert (=> b!145221 m!175107))

(declare-fun m!175113 () Bool)

(assert (=> b!145221 m!175113))

(declare-fun m!175115 () Bool)

(assert (=> b!145238 m!175115))

(assert (=> b!145225 m!174829))

(assert (=> b!145225 m!174829))

(assert (=> b!145225 m!174883))

(declare-fun m!175117 () Bool)

(assert (=> b!145235 m!175117))

(assert (=> d!46249 m!174801))

(assert (=> b!145228 m!174829))

(assert (=> b!145228 m!174829))

(assert (=> b!145228 m!174883))

(declare-fun m!175119 () Bool)

(assert (=> bm!16216 m!175119))

(declare-fun m!175121 () Bool)

(assert (=> bm!16214 m!175121))

(declare-fun m!175123 () Bool)

(assert (=> b!145237 m!175123))

(declare-fun m!175125 () Bool)

(assert (=> bm!16215 m!175125))

(declare-fun m!175127 () Bool)

(assert (=> b!145233 m!175127))

(declare-fun m!175129 () Bool)

(assert (=> b!145233 m!175129))

(declare-fun m!175131 () Bool)

(assert (=> b!145233 m!175131))

(declare-fun m!175133 () Bool)

(assert (=> b!145233 m!175133))

(declare-fun m!175135 () Bool)

(assert (=> b!145233 m!175135))

(declare-fun m!175137 () Bool)

(assert (=> b!145233 m!175137))

(declare-fun m!175139 () Bool)

(assert (=> b!145233 m!175139))

(assert (=> b!145233 m!175105))

(assert (=> b!145233 m!175127))

(declare-fun m!175141 () Bool)

(assert (=> b!145233 m!175141))

(declare-fun m!175143 () Bool)

(assert (=> b!145233 m!175143))

(declare-fun m!175145 () Bool)

(assert (=> b!145233 m!175145))

(assert (=> b!145233 m!175131))

(declare-fun m!175147 () Bool)

(assert (=> b!145233 m!175147))

(declare-fun m!175149 () Bool)

(assert (=> b!145233 m!175149))

(assert (=> b!145233 m!174829))

(assert (=> b!145233 m!175133))

(assert (=> b!145233 m!175137))

(declare-fun m!175151 () Bool)

(assert (=> b!145233 m!175151))

(declare-fun m!175153 () Bool)

(assert (=> b!145233 m!175153))

(declare-fun m!175155 () Bool)

(assert (=> b!145233 m!175155))

(assert (=> d!46095 d!46249))

(declare-fun d!46251 () Bool)

(declare-fun e!94636 () Bool)

(assert (=> d!46251 e!94636))

(declare-fun res!69190 () Bool)

(assert (=> d!46251 (=> (not res!69190) (not e!94636))))

(declare-fun lt!76389 () ListLongMap!1757)

(assert (=> d!46251 (= res!69190 (contains!936 lt!76389 (_1!1372 (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!76387 () List!1758)

(assert (=> d!46251 (= lt!76389 (ListLongMap!1758 lt!76387))))

(declare-fun lt!76390 () Unit!4578)

(declare-fun lt!76388 () Unit!4578)

(assert (=> d!46251 (= lt!76390 lt!76388)))

(assert (=> d!46251 (= (getValueByKey!179 lt!76387 (_1!1372 (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!184 (_2!1372 (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46251 (= lt!76388 (lemmaContainsTupThenGetReturnValue!93 lt!76387 (_1!1372 (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1372 (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46251 (= lt!76387 (insertStrictlySorted!96 (toList!894 (ite c!27429 (ite c!27435 call!16177 call!16170) call!16169)) (_1!1372 (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1372 (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!46251 (= (+!182 (ite c!27429 (ite c!27435 call!16177 call!16170) call!16169) (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!76389)))

(declare-fun b!145240 () Bool)

(declare-fun res!69191 () Bool)

(assert (=> b!145240 (=> (not res!69191) (not e!94636))))

(assert (=> b!145240 (= res!69191 (= (getValueByKey!179 (toList!894 lt!76389) (_1!1372 (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!184 (_2!1372 (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!145241 () Bool)

(assert (=> b!145241 (= e!94636 (contains!940 (toList!894 lt!76389) (ite c!27429 (ite c!27435 (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2723 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!46251 res!69190) b!145240))

(assert (= (and b!145240 res!69191) b!145241))

(declare-fun m!175157 () Bool)

(assert (=> d!46251 m!175157))

(declare-fun m!175159 () Bool)

(assert (=> d!46251 m!175159))

(declare-fun m!175161 () Bool)

(assert (=> d!46251 m!175161))

(declare-fun m!175163 () Bool)

(assert (=> d!46251 m!175163))

(declare-fun m!175165 () Bool)

(assert (=> b!145240 m!175165))

(declare-fun m!175167 () Bool)

(assert (=> b!145241 m!175167))

(assert (=> bm!16162 d!46251))

(declare-fun d!46253 () Bool)

(declare-fun e!94640 () Bool)

(assert (=> d!46253 e!94640))

(declare-fun res!69194 () Bool)

(assert (=> d!46253 (=> (not res!69194) (not e!94640))))

(assert (=> d!46253 (= res!69194 (or (bvsge #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))))

(declare-fun lt!76397 () ListLongMap!1757)

(declare-fun lt!76409 () ListLongMap!1757)

(assert (=> d!46253 (= lt!76397 lt!76409)))

(declare-fun lt!76407 () Unit!4578)

(declare-fun e!94641 () Unit!4578)

(assert (=> d!46253 (= lt!76407 e!94641)))

(declare-fun c!27510 () Bool)

(declare-fun e!94637 () Bool)

(assert (=> d!46253 (= c!27510 e!94637)))

(declare-fun res!69197 () Bool)

(assert (=> d!46253 (=> (not res!69197) (not e!94637))))

(assert (=> d!46253 (= res!69197 (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun e!94639 () ListLongMap!1757)

(assert (=> d!46253 (= lt!76409 e!94639)))

(declare-fun c!27507 () Bool)

(assert (=> d!46253 (= c!27507 (and (not (= (bvand (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46253 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46253 (= (getCurrentListMap!564 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) lt!76397)))

(declare-fun b!145242 () Bool)

(declare-fun e!94645 () Bool)

(declare-fun call!16227 () Bool)

(assert (=> b!145242 (= e!94645 (not call!16227))))

(declare-fun b!145243 () Bool)

(declare-fun e!94642 () Bool)

(assert (=> b!145243 (= e!94640 e!94642)))

(declare-fun c!27506 () Bool)

(assert (=> b!145243 (= c!27506 (not (= (bvand (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145244 () Bool)

(declare-fun e!94644 () Bool)

(assert (=> b!145244 (= e!94644 (= (apply!123 lt!76397 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)) (get!1549 (select (arr!2334 (_values!2972 newMap!16)) #b00000000000000000000000000000000) (dynLambda!448 (defaultEntry!2989 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2609 (_values!2972 newMap!16))))))

(assert (=> b!145244 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun bm!16219 () Bool)

(declare-fun call!16223 () ListLongMap!1757)

(declare-fun call!16224 () ListLongMap!1757)

(assert (=> bm!16219 (= call!16223 call!16224)))

(declare-fun bm!16220 () Bool)

(assert (=> bm!16220 (= call!16224 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun b!145245 () Bool)

(declare-fun e!94638 () ListLongMap!1757)

(assert (=> b!145245 (= e!94639 e!94638)))

(declare-fun c!27511 () Bool)

(assert (=> b!145245 (= c!27511 (and (not (= (bvand (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!16225 () ListLongMap!1757)

(declare-fun call!16228 () ListLongMap!1757)

(declare-fun bm!16221 () Bool)

(assert (=> bm!16221 (= call!16228 (+!182 (ite c!27507 call!16224 (ite c!27511 call!16223 call!16225)) (ite (or c!27507 c!27511) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16))) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 newMap!16)))))))

(declare-fun b!145246 () Bool)

(declare-fun e!94649 () ListLongMap!1757)

(declare-fun call!16222 () ListLongMap!1757)

(assert (=> b!145246 (= e!94649 call!16222)))

(declare-fun b!145247 () Bool)

(assert (=> b!145247 (= e!94649 call!16225)))

(declare-fun b!145248 () Bool)

(assert (=> b!145248 (= e!94637 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145249 () Bool)

(declare-fun e!94647 () Bool)

(assert (=> b!145249 (= e!94647 e!94644)))

(declare-fun res!69195 () Bool)

(assert (=> b!145249 (=> (not res!69195) (not e!94644))))

(assert (=> b!145249 (= res!69195 (contains!936 lt!76397 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!145249 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145250 () Bool)

(declare-fun res!69198 () Bool)

(assert (=> b!145250 (=> (not res!69198) (not e!94640))))

(assert (=> b!145250 (= res!69198 e!94645)))

(declare-fun c!27508 () Bool)

(assert (=> b!145250 (= c!27508 (not (= (bvand (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!145251 () Bool)

(declare-fun e!94643 () Bool)

(assert (=> b!145251 (= e!94643 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145252 () Bool)

(declare-fun call!16226 () Bool)

(assert (=> b!145252 (= e!94642 (not call!16226))))

(declare-fun b!145253 () Bool)

(declare-fun e!94648 () Bool)

(assert (=> b!145253 (= e!94645 e!94648)))

(declare-fun res!69193 () Bool)

(assert (=> b!145253 (= res!69193 call!16227)))

(assert (=> b!145253 (=> (not res!69193) (not e!94648))))

(declare-fun bm!16222 () Bool)

(assert (=> bm!16222 (= call!16226 (contains!936 lt!76397 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145254 () Bool)

(declare-fun Unit!4596 () Unit!4578)

(assert (=> b!145254 (= e!94641 Unit!4596)))

(declare-fun bm!16223 () Bool)

(assert (=> bm!16223 (= call!16227 (contains!936 lt!76397 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145255 () Bool)

(declare-fun e!94646 () Bool)

(assert (=> b!145255 (= e!94642 e!94646)))

(declare-fun res!69196 () Bool)

(assert (=> b!145255 (= res!69196 call!16226)))

(assert (=> b!145255 (=> (not res!69196) (not e!94646))))

(declare-fun b!145256 () Bool)

(declare-fun lt!76406 () Unit!4578)

(assert (=> b!145256 (= e!94641 lt!76406)))

(declare-fun lt!76392 () ListLongMap!1757)

(assert (=> b!145256 (= lt!76392 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76402 () (_ BitVec 64))

(assert (=> b!145256 (= lt!76402 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76408 () (_ BitVec 64))

(assert (=> b!145256 (= lt!76408 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76400 () Unit!4578)

(assert (=> b!145256 (= lt!76400 (addStillContains!99 lt!76392 lt!76402 (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)) lt!76408))))

(assert (=> b!145256 (contains!936 (+!182 lt!76392 (tuple2!2723 lt!76402 (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)))) lt!76408)))

(declare-fun lt!76403 () Unit!4578)

(assert (=> b!145256 (= lt!76403 lt!76400)))

(declare-fun lt!76412 () ListLongMap!1757)

(assert (=> b!145256 (= lt!76412 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76411 () (_ BitVec 64))

(assert (=> b!145256 (= lt!76411 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76404 () (_ BitVec 64))

(assert (=> b!145256 (= lt!76404 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76394 () Unit!4578)

(assert (=> b!145256 (= lt!76394 (addApplyDifferent!99 lt!76412 lt!76411 (minValue!2835 newMap!16) lt!76404))))

(assert (=> b!145256 (= (apply!123 (+!182 lt!76412 (tuple2!2723 lt!76411 (minValue!2835 newMap!16))) lt!76404) (apply!123 lt!76412 lt!76404))))

(declare-fun lt!76405 () Unit!4578)

(assert (=> b!145256 (= lt!76405 lt!76394)))

(declare-fun lt!76396 () ListLongMap!1757)

(assert (=> b!145256 (= lt!76396 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76401 () (_ BitVec 64))

(assert (=> b!145256 (= lt!76401 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76410 () (_ BitVec 64))

(assert (=> b!145256 (= lt!76410 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76391 () Unit!4578)

(assert (=> b!145256 (= lt!76391 (addApplyDifferent!99 lt!76396 lt!76401 (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)) lt!76410))))

(assert (=> b!145256 (= (apply!123 (+!182 lt!76396 (tuple2!2723 lt!76401 (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)))) lt!76410) (apply!123 lt!76396 lt!76410))))

(declare-fun lt!76399 () Unit!4578)

(assert (=> b!145256 (= lt!76399 lt!76391)))

(declare-fun lt!76395 () ListLongMap!1757)

(assert (=> b!145256 (= lt!76395 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (_values!2972 newMap!16) (mask!7353 newMap!16) (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16)) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76398 () (_ BitVec 64))

(assert (=> b!145256 (= lt!76398 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76393 () (_ BitVec 64))

(assert (=> b!145256 (= lt!76393 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145256 (= lt!76406 (addApplyDifferent!99 lt!76395 lt!76398 (minValue!2835 newMap!16) lt!76393))))

(assert (=> b!145256 (= (apply!123 (+!182 lt!76395 (tuple2!2723 lt!76398 (minValue!2835 newMap!16))) lt!76393) (apply!123 lt!76395 lt!76393))))

(declare-fun b!145257 () Bool)

(declare-fun res!69192 () Bool)

(assert (=> b!145257 (=> (not res!69192) (not e!94640))))

(assert (=> b!145257 (= res!69192 e!94647)))

(declare-fun res!69199 () Bool)

(assert (=> b!145257 (=> res!69199 e!94647)))

(assert (=> b!145257 (= res!69199 (not e!94643))))

(declare-fun res!69200 () Bool)

(assert (=> b!145257 (=> (not res!69200) (not e!94643))))

(assert (=> b!145257 (= res!69200 (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145258 () Bool)

(assert (=> b!145258 (= e!94646 (= (apply!123 lt!76397 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2835 newMap!16)))))

(declare-fun c!27509 () Bool)

(declare-fun b!145259 () Bool)

(assert (=> b!145259 (= c!27509 (and (not (= (bvand (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!27429 c!27435) lt!76122 (extraKeys!2736 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!145259 (= e!94638 e!94649)))

(declare-fun b!145260 () Bool)

(assert (=> b!145260 (= e!94639 (+!182 call!16228 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 newMap!16))))))

(declare-fun b!145261 () Bool)

(assert (=> b!145261 (= e!94648 (= (apply!123 lt!76397 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!27429 c!27435) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2835 newMap!16))))))

(declare-fun b!145262 () Bool)

(assert (=> b!145262 (= e!94638 call!16222)))

(declare-fun bm!16224 () Bool)

(assert (=> bm!16224 (= call!16225 call!16223)))

(declare-fun bm!16225 () Bool)

(assert (=> bm!16225 (= call!16222 call!16228)))

(assert (= (and d!46253 c!27507) b!145260))

(assert (= (and d!46253 (not c!27507)) b!145245))

(assert (= (and b!145245 c!27511) b!145262))

(assert (= (and b!145245 (not c!27511)) b!145259))

(assert (= (and b!145259 c!27509) b!145246))

(assert (= (and b!145259 (not c!27509)) b!145247))

(assert (= (or b!145246 b!145247) bm!16224))

(assert (= (or b!145262 bm!16224) bm!16219))

(assert (= (or b!145262 b!145246) bm!16225))

(assert (= (or b!145260 bm!16219) bm!16220))

(assert (= (or b!145260 bm!16225) bm!16221))

(assert (= (and d!46253 res!69197) b!145248))

(assert (= (and d!46253 c!27510) b!145256))

(assert (= (and d!46253 (not c!27510)) b!145254))

(assert (= (and d!46253 res!69194) b!145257))

(assert (= (and b!145257 res!69200) b!145251))

(assert (= (and b!145257 (not res!69199)) b!145249))

(assert (= (and b!145249 res!69195) b!145244))

(assert (= (and b!145257 res!69192) b!145250))

(assert (= (and b!145250 c!27508) b!145253))

(assert (= (and b!145250 (not c!27508)) b!145242))

(assert (= (and b!145253 res!69193) b!145261))

(assert (= (or b!145253 b!145242) bm!16223))

(assert (= (and b!145250 res!69198) b!145243))

(assert (= (and b!145243 c!27506) b!145255))

(assert (= (and b!145243 (not c!27506)) b!145252))

(assert (= (and b!145255 res!69196) b!145258))

(assert (= (or b!145255 b!145252) bm!16222))

(declare-fun b_lambda!6505 () Bool)

(assert (=> (not b_lambda!6505) (not b!145244)))

(assert (=> b!145244 t!6412))

(declare-fun b_and!9047 () Bool)

(assert (= b_and!9043 (and (=> t!6412 result!4275) b_and!9047)))

(assert (=> b!145244 t!6414))

(declare-fun b_and!9049 () Bool)

(assert (= b_and!9045 (and (=> t!6414 result!4277) b_and!9049)))

(assert (=> b!145249 m!174829))

(assert (=> b!145249 m!174829))

(declare-fun m!175169 () Bool)

(assert (=> b!145249 m!175169))

(declare-fun m!175171 () Bool)

(assert (=> bm!16220 m!175171))

(assert (=> b!145244 m!175107))

(assert (=> b!145244 m!174829))

(assert (=> b!145244 m!174829))

(declare-fun m!175173 () Bool)

(assert (=> b!145244 m!175173))

(assert (=> b!145244 m!175111))

(assert (=> b!145244 m!175111))

(assert (=> b!145244 m!175107))

(assert (=> b!145244 m!175113))

(declare-fun m!175175 () Bool)

(assert (=> b!145261 m!175175))

(assert (=> b!145248 m!174829))

(assert (=> b!145248 m!174829))

(assert (=> b!145248 m!174883))

(declare-fun m!175177 () Bool)

(assert (=> b!145258 m!175177))

(assert (=> d!46253 m!174801))

(assert (=> b!145251 m!174829))

(assert (=> b!145251 m!174829))

(assert (=> b!145251 m!174883))

(declare-fun m!175179 () Bool)

(assert (=> bm!16223 m!175179))

(declare-fun m!175181 () Bool)

(assert (=> bm!16221 m!175181))

(declare-fun m!175183 () Bool)

(assert (=> b!145260 m!175183))

(declare-fun m!175185 () Bool)

(assert (=> bm!16222 m!175185))

(declare-fun m!175187 () Bool)

(assert (=> b!145256 m!175187))

(declare-fun m!175189 () Bool)

(assert (=> b!145256 m!175189))

(declare-fun m!175191 () Bool)

(assert (=> b!145256 m!175191))

(declare-fun m!175193 () Bool)

(assert (=> b!145256 m!175193))

(declare-fun m!175195 () Bool)

(assert (=> b!145256 m!175195))

(declare-fun m!175197 () Bool)

(assert (=> b!145256 m!175197))

(declare-fun m!175199 () Bool)

(assert (=> b!145256 m!175199))

(assert (=> b!145256 m!175171))

(assert (=> b!145256 m!175187))

(declare-fun m!175201 () Bool)

(assert (=> b!145256 m!175201))

(declare-fun m!175203 () Bool)

(assert (=> b!145256 m!175203))

(declare-fun m!175205 () Bool)

(assert (=> b!145256 m!175205))

(assert (=> b!145256 m!175191))

(declare-fun m!175207 () Bool)

(assert (=> b!145256 m!175207))

(declare-fun m!175209 () Bool)

(assert (=> b!145256 m!175209))

(assert (=> b!145256 m!174829))

(assert (=> b!145256 m!175193))

(assert (=> b!145256 m!175197))

(declare-fun m!175211 () Bool)

(assert (=> b!145256 m!175211))

(declare-fun m!175213 () Bool)

(assert (=> b!145256 m!175213))

(declare-fun m!175215 () Bool)

(assert (=> b!145256 m!175215))

(assert (=> bm!16179 d!46253))

(assert (=> b!144807 d!46145))

(declare-fun lt!76419 () SeekEntryResult!282)

(declare-fun d!46255 () Bool)

(assert (=> d!46255 (and (or ((_ is Undefined!282) lt!76419) (not ((_ is Found!282) lt!76419)) (and (bvsge (index!3295 lt!76419) #b00000000000000000000000000000000) (bvslt (index!3295 lt!76419) (size!2608 (_keys!4756 newMap!16))))) (or ((_ is Undefined!282) lt!76419) ((_ is Found!282) lt!76419) (not ((_ is MissingZero!282) lt!76419)) (and (bvsge (index!3294 lt!76419) #b00000000000000000000000000000000) (bvslt (index!3294 lt!76419) (size!2608 (_keys!4756 newMap!16))))) (or ((_ is Undefined!282) lt!76419) ((_ is Found!282) lt!76419) ((_ is MissingZero!282) lt!76419) (not ((_ is MissingVacant!282) lt!76419)) (and (bvsge (index!3297 lt!76419) #b00000000000000000000000000000000) (bvslt (index!3297 lt!76419) (size!2608 (_keys!4756 newMap!16))))) (or ((_ is Undefined!282) lt!76419) (ite ((_ is Found!282) lt!76419) (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76419)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)) (ite ((_ is MissingZero!282) lt!76419) (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3294 lt!76419)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!282) lt!76419) (= (select (arr!2333 (_keys!4756 newMap!16)) (index!3297 lt!76419)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!94656 () SeekEntryResult!282)

(assert (=> d!46255 (= lt!76419 e!94656)))

(declare-fun c!27519 () Bool)

(declare-fun lt!76421 () SeekEntryResult!282)

(assert (=> d!46255 (= c!27519 (and ((_ is Intermediate!282) lt!76421) (undefined!1094 lt!76421)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4939 (_ BitVec 32)) SeekEntryResult!282)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!46255 (= lt!76421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (mask!7353 newMap!16)) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4756 newMap!16) (mask!7353 newMap!16)))))

(assert (=> d!46255 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46255 (= (seekEntryOrOpen!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4756 newMap!16) (mask!7353 newMap!16)) lt!76419)))

(declare-fun b!145275 () Bool)

(declare-fun e!94657 () SeekEntryResult!282)

(assert (=> b!145275 (= e!94657 (Found!282 (index!3296 lt!76421)))))

(declare-fun b!145276 () Bool)

(declare-fun c!27520 () Bool)

(declare-fun lt!76420 () (_ BitVec 64))

(assert (=> b!145276 (= c!27520 (= lt!76420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94658 () SeekEntryResult!282)

(assert (=> b!145276 (= e!94657 e!94658)))

(declare-fun b!145277 () Bool)

(assert (=> b!145277 (= e!94658 (MissingZero!282 (index!3296 lt!76421)))))

(declare-fun b!145278 () Bool)

(assert (=> b!145278 (= e!94656 e!94657)))

(assert (=> b!145278 (= lt!76420 (select (arr!2333 (_keys!4756 newMap!16)) (index!3296 lt!76421)))))

(declare-fun c!27518 () Bool)

(assert (=> b!145278 (= c!27518 (= lt!76420 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(declare-fun b!145279 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4939 (_ BitVec 32)) SeekEntryResult!282)

(assert (=> b!145279 (= e!94658 (seekKeyOrZeroReturnVacant!0 (x!16514 lt!76421) (index!3296 lt!76421) (index!3296 lt!76421) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (_keys!4756 newMap!16) (mask!7353 newMap!16)))))

(declare-fun b!145280 () Bool)

(assert (=> b!145280 (= e!94656 Undefined!282)))

(assert (= (and d!46255 c!27519) b!145280))

(assert (= (and d!46255 (not c!27519)) b!145278))

(assert (= (and b!145278 c!27518) b!145275))

(assert (= (and b!145278 (not c!27518)) b!145276))

(assert (= (and b!145276 c!27520) b!145277))

(assert (= (and b!145276 (not c!27520)) b!145279))

(assert (=> d!46255 m!174471))

(declare-fun m!175217 () Bool)

(assert (=> d!46255 m!175217))

(assert (=> d!46255 m!174801))

(assert (=> d!46255 m!175217))

(assert (=> d!46255 m!174471))

(declare-fun m!175219 () Bool)

(assert (=> d!46255 m!175219))

(declare-fun m!175221 () Bool)

(assert (=> d!46255 m!175221))

(declare-fun m!175223 () Bool)

(assert (=> d!46255 m!175223))

(declare-fun m!175225 () Bool)

(assert (=> d!46255 m!175225))

(declare-fun m!175227 () Bool)

(assert (=> b!145278 m!175227))

(assert (=> b!145279 m!174471))

(declare-fun m!175229 () Bool)

(assert (=> b!145279 m!175229))

(assert (=> b!144908 d!46255))

(declare-fun b!145281 () Bool)

(declare-fun e!94662 () Bool)

(declare-fun call!16229 () Bool)

(assert (=> b!145281 (= e!94662 call!16229)))

(declare-fun b!145282 () Bool)

(assert (=> b!145282 (= e!94662 call!16229)))

(declare-fun b!145283 () Bool)

(declare-fun e!94661 () Bool)

(assert (=> b!145283 (= e!94661 e!94662)))

(declare-fun c!27521 () Bool)

(assert (=> b!145283 (= c!27521 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!46257 () Bool)

(declare-fun res!69203 () Bool)

(declare-fun e!94660 () Bool)

(assert (=> d!46257 (=> res!69203 e!94660)))

(assert (=> d!46257 (= res!69203 (bvsge #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(assert (=> d!46257 (= (arrayNoDuplicates!0 (_keys!4756 newMap!16) #b00000000000000000000000000000000 Nil!1756) e!94660)))

(declare-fun b!145284 () Bool)

(declare-fun e!94659 () Bool)

(assert (=> b!145284 (= e!94659 (contains!937 Nil!1756 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16226 () Bool)

(assert (=> bm!16226 (= call!16229 (arrayNoDuplicates!0 (_keys!4756 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!27521 (Cons!1755 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000) Nil!1756) Nil!1756)))))

(declare-fun b!145285 () Bool)

(assert (=> b!145285 (= e!94660 e!94661)))

(declare-fun res!69201 () Bool)

(assert (=> b!145285 (=> (not res!69201) (not e!94661))))

(assert (=> b!145285 (= res!69201 (not e!94659))))

(declare-fun res!69202 () Bool)

(assert (=> b!145285 (=> (not res!69202) (not e!94659))))

(assert (=> b!145285 (= res!69202 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!46257 (not res!69203)) b!145285))

(assert (= (and b!145285 res!69202) b!145284))

(assert (= (and b!145285 res!69201) b!145283))

(assert (= (and b!145283 c!27521) b!145281))

(assert (= (and b!145283 (not c!27521)) b!145282))

(assert (= (or b!145281 b!145282) bm!16226))

(assert (=> b!145283 m!174829))

(assert (=> b!145283 m!174829))

(assert (=> b!145283 m!174883))

(assert (=> b!145284 m!174829))

(assert (=> b!145284 m!174829))

(declare-fun m!175231 () Bool)

(assert (=> b!145284 m!175231))

(assert (=> bm!16226 m!174829))

(declare-fun m!175233 () Bool)

(assert (=> bm!16226 m!175233))

(assert (=> b!145285 m!174829))

(assert (=> b!145285 m!174829))

(assert (=> b!145285 m!174883))

(assert (=> b!144792 d!46257))

(declare-fun d!46259 () Bool)

(declare-fun e!94666 () Bool)

(assert (=> d!46259 e!94666))

(declare-fun res!69206 () Bool)

(assert (=> d!46259 (=> (not res!69206) (not e!94666))))

(assert (=> d!46259 (= res!69206 (or (bvsge #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))))

(declare-fun lt!76428 () ListLongMap!1757)

(declare-fun lt!76440 () ListLongMap!1757)

(assert (=> d!46259 (= lt!76428 lt!76440)))

(declare-fun lt!76438 () Unit!4578)

(declare-fun e!94667 () Unit!4578)

(assert (=> d!46259 (= lt!76438 e!94667)))

(declare-fun c!27526 () Bool)

(declare-fun e!94663 () Bool)

(assert (=> d!46259 (= c!27526 e!94663)))

(declare-fun res!69209 () Bool)

(assert (=> d!46259 (=> (not res!69209) (not e!94663))))

(assert (=> d!46259 (= res!69209 (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun e!94665 () ListLongMap!1757)

(assert (=> d!46259 (= lt!76440 e!94665)))

(declare-fun c!27523 () Bool)

(assert (=> d!46259 (= c!27523 (and (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46259 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46259 (= (getCurrentListMap!564 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) lt!76428)))

(declare-fun b!145286 () Bool)

(declare-fun e!94671 () Bool)

(declare-fun call!16235 () Bool)

(assert (=> b!145286 (= e!94671 (not call!16235))))

(declare-fun b!145287 () Bool)

(declare-fun e!94668 () Bool)

(assert (=> b!145287 (= e!94666 e!94668)))

(declare-fun c!27522 () Bool)

(assert (=> b!145287 (= c!27522 (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!145288 () Bool)

(declare-fun e!94670 () Bool)

(assert (=> b!145288 (= e!94670 (= (apply!123 lt!76428 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)) (get!1549 (select (arr!2334 lt!76129) #b00000000000000000000000000000000) (dynLambda!448 (defaultEntry!2989 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2609 lt!76129)))))

(assert (=> b!145288 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun bm!16227 () Bool)

(declare-fun call!16231 () ListLongMap!1757)

(declare-fun call!16232 () ListLongMap!1757)

(assert (=> bm!16227 (= call!16231 call!16232)))

(declare-fun bm!16228 () Bool)

(assert (=> bm!16228 (= call!16232 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun b!145289 () Bool)

(declare-fun e!94664 () ListLongMap!1757)

(assert (=> b!145289 (= e!94665 e!94664)))

(declare-fun c!27527 () Bool)

(assert (=> b!145289 (= c!27527 (and (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!16236 () ListLongMap!1757)

(declare-fun bm!16229 () Bool)

(declare-fun call!16233 () ListLongMap!1757)

(assert (=> bm!16229 (= call!16236 (+!182 (ite c!27523 call!16232 (ite c!27527 call!16231 call!16233)) (ite (or c!27523 c!27527) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 newMap!16)) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 newMap!16)))))))

(declare-fun b!145290 () Bool)

(declare-fun e!94675 () ListLongMap!1757)

(declare-fun call!16230 () ListLongMap!1757)

(assert (=> b!145290 (= e!94675 call!16230)))

(declare-fun b!145291 () Bool)

(assert (=> b!145291 (= e!94675 call!16233)))

(declare-fun b!145292 () Bool)

(assert (=> b!145292 (= e!94663 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145293 () Bool)

(declare-fun e!94673 () Bool)

(assert (=> b!145293 (= e!94673 e!94670)))

(declare-fun res!69207 () Bool)

(assert (=> b!145293 (=> (not res!69207) (not e!94670))))

(assert (=> b!145293 (= res!69207 (contains!936 lt!76428 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!145293 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145294 () Bool)

(declare-fun res!69210 () Bool)

(assert (=> b!145294 (=> (not res!69210) (not e!94666))))

(assert (=> b!145294 (= res!69210 e!94671)))

(declare-fun c!27524 () Bool)

(assert (=> b!145294 (= c!27524 (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!145295 () Bool)

(declare-fun e!94669 () Bool)

(assert (=> b!145295 (= e!94669 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145296 () Bool)

(declare-fun call!16234 () Bool)

(assert (=> b!145296 (= e!94668 (not call!16234))))

(declare-fun b!145297 () Bool)

(declare-fun e!94674 () Bool)

(assert (=> b!145297 (= e!94671 e!94674)))

(declare-fun res!69205 () Bool)

(assert (=> b!145297 (= res!69205 call!16235)))

(assert (=> b!145297 (=> (not res!69205) (not e!94674))))

(declare-fun bm!16230 () Bool)

(assert (=> bm!16230 (= call!16234 (contains!936 lt!76428 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145298 () Bool)

(declare-fun Unit!4597 () Unit!4578)

(assert (=> b!145298 (= e!94667 Unit!4597)))

(declare-fun bm!16231 () Bool)

(assert (=> bm!16231 (= call!16235 (contains!936 lt!76428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145299 () Bool)

(declare-fun e!94672 () Bool)

(assert (=> b!145299 (= e!94668 e!94672)))

(declare-fun res!69208 () Bool)

(assert (=> b!145299 (= res!69208 call!16234)))

(assert (=> b!145299 (=> (not res!69208) (not e!94672))))

(declare-fun b!145300 () Bool)

(declare-fun lt!76437 () Unit!4578)

(assert (=> b!145300 (= e!94667 lt!76437)))

(declare-fun lt!76423 () ListLongMap!1757)

(assert (=> b!145300 (= lt!76423 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76433 () (_ BitVec 64))

(assert (=> b!145300 (= lt!76433 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76439 () (_ BitVec 64))

(assert (=> b!145300 (= lt!76439 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76431 () Unit!4578)

(assert (=> b!145300 (= lt!76431 (addStillContains!99 lt!76423 lt!76433 (zeroValue!2835 newMap!16) lt!76439))))

(assert (=> b!145300 (contains!936 (+!182 lt!76423 (tuple2!2723 lt!76433 (zeroValue!2835 newMap!16))) lt!76439)))

(declare-fun lt!76434 () Unit!4578)

(assert (=> b!145300 (= lt!76434 lt!76431)))

(declare-fun lt!76443 () ListLongMap!1757)

(assert (=> b!145300 (= lt!76443 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76442 () (_ BitVec 64))

(assert (=> b!145300 (= lt!76442 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76435 () (_ BitVec 64))

(assert (=> b!145300 (= lt!76435 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76425 () Unit!4578)

(assert (=> b!145300 (= lt!76425 (addApplyDifferent!99 lt!76443 lt!76442 (minValue!2835 newMap!16) lt!76435))))

(assert (=> b!145300 (= (apply!123 (+!182 lt!76443 (tuple2!2723 lt!76442 (minValue!2835 newMap!16))) lt!76435) (apply!123 lt!76443 lt!76435))))

(declare-fun lt!76436 () Unit!4578)

(assert (=> b!145300 (= lt!76436 lt!76425)))

(declare-fun lt!76427 () ListLongMap!1757)

(assert (=> b!145300 (= lt!76427 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76432 () (_ BitVec 64))

(assert (=> b!145300 (= lt!76432 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76441 () (_ BitVec 64))

(assert (=> b!145300 (= lt!76441 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76422 () Unit!4578)

(assert (=> b!145300 (= lt!76422 (addApplyDifferent!99 lt!76427 lt!76432 (zeroValue!2835 newMap!16) lt!76441))))

(assert (=> b!145300 (= (apply!123 (+!182 lt!76427 (tuple2!2723 lt!76432 (zeroValue!2835 newMap!16))) lt!76441) (apply!123 lt!76427 lt!76441))))

(declare-fun lt!76430 () Unit!4578)

(assert (=> b!145300 (= lt!76430 lt!76422)))

(declare-fun lt!76426 () ListLongMap!1757)

(assert (=> b!145300 (= lt!76426 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) lt!76129 (mask!7353 newMap!16) (extraKeys!2736 newMap!16) (zeroValue!2835 newMap!16) (minValue!2835 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76429 () (_ BitVec 64))

(assert (=> b!145300 (= lt!76429 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76424 () (_ BitVec 64))

(assert (=> b!145300 (= lt!76424 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145300 (= lt!76437 (addApplyDifferent!99 lt!76426 lt!76429 (minValue!2835 newMap!16) lt!76424))))

(assert (=> b!145300 (= (apply!123 (+!182 lt!76426 (tuple2!2723 lt!76429 (minValue!2835 newMap!16))) lt!76424) (apply!123 lt!76426 lt!76424))))

(declare-fun b!145301 () Bool)

(declare-fun res!69204 () Bool)

(assert (=> b!145301 (=> (not res!69204) (not e!94666))))

(assert (=> b!145301 (= res!69204 e!94673)))

(declare-fun res!69211 () Bool)

(assert (=> b!145301 (=> res!69211 e!94673)))

(assert (=> b!145301 (= res!69211 (not e!94669))))

(declare-fun res!69212 () Bool)

(assert (=> b!145301 (=> (not res!69212) (not e!94669))))

(assert (=> b!145301 (= res!69212 (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145302 () Bool)

(assert (=> b!145302 (= e!94672 (= (apply!123 lt!76428 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2835 newMap!16)))))

(declare-fun b!145303 () Bool)

(declare-fun c!27525 () Bool)

(assert (=> b!145303 (= c!27525 (and (not (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2736 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!145303 (= e!94664 e!94675)))

(declare-fun b!145304 () Bool)

(assert (=> b!145304 (= e!94665 (+!182 call!16236 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2835 newMap!16))))))

(declare-fun b!145305 () Bool)

(assert (=> b!145305 (= e!94674 (= (apply!123 lt!76428 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2835 newMap!16)))))

(declare-fun b!145306 () Bool)

(assert (=> b!145306 (= e!94664 call!16230)))

(declare-fun bm!16232 () Bool)

(assert (=> bm!16232 (= call!16233 call!16231)))

(declare-fun bm!16233 () Bool)

(assert (=> bm!16233 (= call!16230 call!16236)))

(assert (= (and d!46259 c!27523) b!145304))

(assert (= (and d!46259 (not c!27523)) b!145289))

(assert (= (and b!145289 c!27527) b!145306))

(assert (= (and b!145289 (not c!27527)) b!145303))

(assert (= (and b!145303 c!27525) b!145290))

(assert (= (and b!145303 (not c!27525)) b!145291))

(assert (= (or b!145290 b!145291) bm!16232))

(assert (= (or b!145306 bm!16232) bm!16227))

(assert (= (or b!145306 b!145290) bm!16233))

(assert (= (or b!145304 bm!16227) bm!16228))

(assert (= (or b!145304 bm!16233) bm!16229))

(assert (= (and d!46259 res!69209) b!145292))

(assert (= (and d!46259 c!27526) b!145300))

(assert (= (and d!46259 (not c!27526)) b!145298))

(assert (= (and d!46259 res!69206) b!145301))

(assert (= (and b!145301 res!69212) b!145295))

(assert (= (and b!145301 (not res!69211)) b!145293))

(assert (= (and b!145293 res!69207) b!145288))

(assert (= (and b!145301 res!69204) b!145294))

(assert (= (and b!145294 c!27524) b!145297))

(assert (= (and b!145294 (not c!27524)) b!145286))

(assert (= (and b!145297 res!69205) b!145305))

(assert (= (or b!145297 b!145286) bm!16231))

(assert (= (and b!145294 res!69210) b!145287))

(assert (= (and b!145287 c!27522) b!145299))

(assert (= (and b!145287 (not c!27522)) b!145296))

(assert (= (and b!145299 res!69208) b!145302))

(assert (= (or b!145299 b!145296) bm!16230))

(declare-fun b_lambda!6507 () Bool)

(assert (=> (not b_lambda!6507) (not b!145288)))

(assert (=> b!145288 t!6412))

(declare-fun b_and!9051 () Bool)

(assert (= b_and!9047 (and (=> t!6412 result!4275) b_and!9051)))

(assert (=> b!145288 t!6414))

(declare-fun b_and!9053 () Bool)

(assert (= b_and!9049 (and (=> t!6414 result!4277) b_and!9053)))

(assert (=> b!145293 m!174829))

(assert (=> b!145293 m!174829))

(declare-fun m!175235 () Bool)

(assert (=> b!145293 m!175235))

(declare-fun m!175237 () Bool)

(assert (=> bm!16228 m!175237))

(assert (=> b!145288 m!175107))

(assert (=> b!145288 m!174829))

(assert (=> b!145288 m!174829))

(declare-fun m!175239 () Bool)

(assert (=> b!145288 m!175239))

(declare-fun m!175241 () Bool)

(assert (=> b!145288 m!175241))

(assert (=> b!145288 m!175241))

(assert (=> b!145288 m!175107))

(declare-fun m!175243 () Bool)

(assert (=> b!145288 m!175243))

(declare-fun m!175245 () Bool)

(assert (=> b!145305 m!175245))

(assert (=> b!145292 m!174829))

(assert (=> b!145292 m!174829))

(assert (=> b!145292 m!174883))

(declare-fun m!175247 () Bool)

(assert (=> b!145302 m!175247))

(assert (=> d!46259 m!174801))

(assert (=> b!145295 m!174829))

(assert (=> b!145295 m!174829))

(assert (=> b!145295 m!174883))

(declare-fun m!175249 () Bool)

(assert (=> bm!16231 m!175249))

(declare-fun m!175251 () Bool)

(assert (=> bm!16229 m!175251))

(declare-fun m!175253 () Bool)

(assert (=> b!145304 m!175253))

(declare-fun m!175255 () Bool)

(assert (=> bm!16230 m!175255))

(declare-fun m!175257 () Bool)

(assert (=> b!145300 m!175257))

(declare-fun m!175259 () Bool)

(assert (=> b!145300 m!175259))

(declare-fun m!175261 () Bool)

(assert (=> b!145300 m!175261))

(declare-fun m!175263 () Bool)

(assert (=> b!145300 m!175263))

(declare-fun m!175265 () Bool)

(assert (=> b!145300 m!175265))

(declare-fun m!175267 () Bool)

(assert (=> b!145300 m!175267))

(declare-fun m!175269 () Bool)

(assert (=> b!145300 m!175269))

(assert (=> b!145300 m!175237))

(assert (=> b!145300 m!175257))

(declare-fun m!175271 () Bool)

(assert (=> b!145300 m!175271))

(declare-fun m!175273 () Bool)

(assert (=> b!145300 m!175273))

(declare-fun m!175275 () Bool)

(assert (=> b!145300 m!175275))

(assert (=> b!145300 m!175261))

(declare-fun m!175277 () Bool)

(assert (=> b!145300 m!175277))

(declare-fun m!175279 () Bool)

(assert (=> b!145300 m!175279))

(assert (=> b!145300 m!174829))

(assert (=> b!145300 m!175263))

(assert (=> b!145300 m!175267))

(declare-fun m!175281 () Bool)

(assert (=> b!145300 m!175281))

(declare-fun m!175283 () Bool)

(assert (=> b!145300 m!175283))

(declare-fun m!175285 () Bool)

(assert (=> b!145300 m!175285))

(assert (=> b!144920 d!46259))

(declare-fun b!145316 () Bool)

(declare-fun e!94680 () (_ BitVec 32))

(declare-fun e!94681 () (_ BitVec 32))

(assert (=> b!145316 (= e!94680 e!94681)))

(declare-fun c!27533 () Bool)

(assert (=> b!145316 (= c!27533 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!16236 () Bool)

(declare-fun call!16239 () (_ BitVec 32))

(assert (=> bm!16236 (= call!16239 (arrayCountValidKeys!0 (_keys!4756 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145315 () Bool)

(assert (=> b!145315 (= e!94681 (bvadd #b00000000000000000000000000000001 call!16239))))

(declare-fun d!46261 () Bool)

(declare-fun lt!76446 () (_ BitVec 32))

(assert (=> d!46261 (and (bvsge lt!76446 #b00000000000000000000000000000000) (bvsle lt!76446 (bvsub (size!2608 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!46261 (= lt!76446 e!94680)))

(declare-fun c!27532 () Bool)

(assert (=> d!46261 (= c!27532 (bvsge #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(assert (=> d!46261 (and (bvsle #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2608 (_keys!4756 newMap!16)) (size!2608 (_keys!4756 newMap!16))))))

(assert (=> d!46261 (= (arrayCountValidKeys!0 (_keys!4756 newMap!16) #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))) lt!76446)))

(declare-fun b!145317 () Bool)

(assert (=> b!145317 (= e!94681 call!16239)))

(declare-fun b!145318 () Bool)

(assert (=> b!145318 (= e!94680 #b00000000000000000000000000000000)))

(assert (= (and d!46261 c!27532) b!145318))

(assert (= (and d!46261 (not c!27532)) b!145316))

(assert (= (and b!145316 c!27533) b!145315))

(assert (= (and b!145316 (not c!27533)) b!145317))

(assert (= (or b!145315 b!145317) bm!16236))

(assert (=> b!145316 m!174829))

(assert (=> b!145316 m!174829))

(assert (=> b!145316 m!174883))

(declare-fun m!175287 () Bool)

(assert (=> bm!16236 m!175287))

(assert (=> b!144790 d!46261))

(declare-fun b!145319 () Bool)

(declare-fun e!94685 () Bool)

(declare-fun call!16240 () Bool)

(assert (=> b!145319 (= e!94685 call!16240)))

(declare-fun b!145320 () Bool)

(assert (=> b!145320 (= e!94685 call!16240)))

(declare-fun b!145321 () Bool)

(declare-fun e!94684 () Bool)

(assert (=> b!145321 (= e!94684 e!94685)))

(declare-fun c!27534 () Bool)

(assert (=> b!145321 (= c!27534 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!46263 () Bool)

(declare-fun res!69215 () Bool)

(declare-fun e!94683 () Bool)

(assert (=> d!46263 (=> res!69215 e!94683)))

(assert (=> d!46263 (= res!69215 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2608 (_keys!4756 (v!3320 (underlying!488 thiss!992))))))))

(assert (=> d!46263 (= (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!27443 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1756) Nil!1756)) e!94683)))

(declare-fun b!145322 () Bool)

(declare-fun e!94682 () Bool)

(assert (=> b!145322 (= e!94682 (contains!937 (ite c!27443 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1756) Nil!1756) (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!16237 () Bool)

(assert (=> bm!16237 (= call!16240 (arrayNoDuplicates!0 (_keys!4756 (v!3320 (underlying!488 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!27534 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!27443 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1756) Nil!1756)) (ite c!27443 (Cons!1755 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) Nil!1756) Nil!1756))))))

(declare-fun b!145323 () Bool)

(assert (=> b!145323 (= e!94683 e!94684)))

(declare-fun res!69213 () Bool)

(assert (=> b!145323 (=> (not res!69213) (not e!94684))))

(assert (=> b!145323 (= res!69213 (not e!94682))))

(declare-fun res!69214 () Bool)

(assert (=> b!145323 (=> (not res!69214) (not e!94682))))

(assert (=> b!145323 (= res!69214 (validKeyInArray!0 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!46263 (not res!69215)) b!145323))

(assert (= (and b!145323 res!69214) b!145322))

(assert (= (and b!145323 res!69213) b!145321))

(assert (= (and b!145321 c!27534) b!145319))

(assert (= (and b!145321 (not c!27534)) b!145320))

(assert (= (or b!145319 b!145320) bm!16237))

(declare-fun m!175289 () Bool)

(assert (=> b!145321 m!175289))

(assert (=> b!145321 m!175289))

(declare-fun m!175291 () Bool)

(assert (=> b!145321 m!175291))

(assert (=> b!145322 m!175289))

(assert (=> b!145322 m!175289))

(declare-fun m!175293 () Bool)

(assert (=> b!145322 m!175293))

(assert (=> bm!16237 m!175289))

(declare-fun m!175295 () Bool)

(assert (=> bm!16237 m!175295))

(assert (=> b!145323 m!175289))

(assert (=> b!145323 m!175289))

(assert (=> b!145323 m!175291))

(assert (=> bm!16186 d!46263))

(assert (=> bm!16163 d!46255))

(declare-fun d!46265 () Bool)

(assert (=> d!46265 (= (get!1551 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3319 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355)))))

(assert (=> b!144943 d!46265))

(declare-fun d!46267 () Bool)

(declare-fun e!94686 () Bool)

(assert (=> d!46267 e!94686))

(declare-fun res!69216 () Bool)

(assert (=> d!46267 (=> res!69216 e!94686)))

(declare-fun lt!76450 () Bool)

(assert (=> d!46267 (= res!69216 (not lt!76450))))

(declare-fun lt!76449 () Bool)

(assert (=> d!46267 (= lt!76450 lt!76449)))

(declare-fun lt!76447 () Unit!4578)

(declare-fun e!94687 () Unit!4578)

(assert (=> d!46267 (= lt!76447 e!94687)))

(declare-fun c!27535 () Bool)

(assert (=> d!46267 (= c!27535 lt!76449)))

(assert (=> d!46267 (= lt!76449 (containsKey!183 (toList!894 e!94447) (ite c!27431 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76138)))))))

(assert (=> d!46267 (= (contains!936 e!94447 (ite c!27431 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76138)))) lt!76450)))

(declare-fun b!145324 () Bool)

(declare-fun lt!76448 () Unit!4578)

(assert (=> b!145324 (= e!94687 lt!76448)))

(assert (=> b!145324 (= lt!76448 (lemmaContainsKeyImpliesGetValueByKeyDefined!131 (toList!894 e!94447) (ite c!27431 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76138)))))))

(assert (=> b!145324 (isDefined!132 (getValueByKey!179 (toList!894 e!94447) (ite c!27431 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76138)))))))

(declare-fun b!145325 () Bool)

(declare-fun Unit!4598 () Unit!4578)

(assert (=> b!145325 (= e!94687 Unit!4598)))

(declare-fun b!145326 () Bool)

(assert (=> b!145326 (= e!94686 (isDefined!132 (getValueByKey!179 (toList!894 e!94447) (ite c!27431 (select (arr!2333 (_keys!4756 (v!3320 (underlying!488 thiss!992)))) from!355) (select (arr!2333 (_keys!4756 newMap!16)) (index!3295 lt!76138))))))))

(assert (= (and d!46267 c!27535) b!145324))

(assert (= (and d!46267 (not c!27535)) b!145325))

(assert (= (and d!46267 (not res!69216)) b!145326))

(declare-fun m!175297 () Bool)

(assert (=> d!46267 m!175297))

(declare-fun m!175299 () Bool)

(assert (=> b!145324 m!175299))

(declare-fun m!175301 () Bool)

(assert (=> b!145324 m!175301))

(assert (=> b!145324 m!175301))

(declare-fun m!175303 () Bool)

(assert (=> b!145324 m!175303))

(assert (=> b!145326 m!175301))

(assert (=> b!145326 m!175301))

(assert (=> b!145326 m!175303))

(assert (=> bm!16175 d!46267))

(declare-fun d!46269 () Bool)

(declare-fun res!69217 () Bool)

(declare-fun e!94688 () Bool)

(assert (=> d!46269 (=> (not res!69217) (not e!94688))))

(assert (=> d!46269 (= res!69217 (simpleValid!99 (_2!1373 lt!76120)))))

(assert (=> d!46269 (= (valid!565 (_2!1373 lt!76120)) e!94688)))

(declare-fun b!145327 () Bool)

(declare-fun res!69218 () Bool)

(assert (=> b!145327 (=> (not res!69218) (not e!94688))))

(assert (=> b!145327 (= res!69218 (= (arrayCountValidKeys!0 (_keys!4756 (_2!1373 lt!76120)) #b00000000000000000000000000000000 (size!2608 (_keys!4756 (_2!1373 lt!76120)))) (_size!634 (_2!1373 lt!76120))))))

(declare-fun b!145328 () Bool)

(declare-fun res!69219 () Bool)

(assert (=> b!145328 (=> (not res!69219) (not e!94688))))

(assert (=> b!145328 (= res!69219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4756 (_2!1373 lt!76120)) (mask!7353 (_2!1373 lt!76120))))))

(declare-fun b!145329 () Bool)

(assert (=> b!145329 (= e!94688 (arrayNoDuplicates!0 (_keys!4756 (_2!1373 lt!76120)) #b00000000000000000000000000000000 Nil!1756))))

(assert (= (and d!46269 res!69217) b!145327))

(assert (= (and b!145327 res!69218) b!145328))

(assert (= (and b!145328 res!69219) b!145329))

(declare-fun m!175305 () Bool)

(assert (=> d!46269 m!175305))

(declare-fun m!175307 () Bool)

(assert (=> b!145327 m!175307))

(declare-fun m!175309 () Bool)

(assert (=> b!145328 m!175309))

(declare-fun m!175311 () Bool)

(assert (=> b!145329 m!175311))

(assert (=> d!46111 d!46269))

(assert (=> d!46111 d!46101))

(declare-fun d!46271 () Bool)

(declare-fun lt!76451 () Bool)

(assert (=> d!46271 (= lt!76451 (select (content!141 (t!6404 lt!75953)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!94689 () Bool)

(assert (=> d!46271 (= lt!76451 e!94689)))

(declare-fun res!69220 () Bool)

(assert (=> d!46271 (=> (not res!69220) (not e!94689))))

(assert (=> d!46271 (= res!69220 ((_ is Cons!1755) (t!6404 lt!75953)))))

(assert (=> d!46271 (= (contains!937 (t!6404 lt!75953) #b0000000000000000000000000000000000000000000000000000000000000000) lt!76451)))

(declare-fun b!145330 () Bool)

(declare-fun e!94690 () Bool)

(assert (=> b!145330 (= e!94689 e!94690)))

(declare-fun res!69221 () Bool)

(assert (=> b!145330 (=> res!69221 e!94690)))

(assert (=> b!145330 (= res!69221 (= (h!2363 (t!6404 lt!75953)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145331 () Bool)

(assert (=> b!145331 (= e!94690 (contains!937 (t!6404 (t!6404 lt!75953)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!46271 res!69220) b!145330))

(assert (= (and b!145330 (not res!69221)) b!145331))

(assert (=> d!46271 m!174905))

(declare-fun m!175313 () Bool)

(assert (=> d!46271 m!175313))

(declare-fun m!175315 () Bool)

(assert (=> b!145331 m!175315))

(assert (=> b!144794 d!46271))

(declare-fun d!46273 () Bool)

(declare-fun e!94694 () Bool)

(assert (=> d!46273 e!94694))

(declare-fun res!69224 () Bool)

(assert (=> d!46273 (=> (not res!69224) (not e!94694))))

(assert (=> d!46273 (= res!69224 (or (bvsge #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))))

(declare-fun lt!76458 () ListLongMap!1757)

(declare-fun lt!76470 () ListLongMap!1757)

(assert (=> d!46273 (= lt!76458 lt!76470)))

(declare-fun lt!76468 () Unit!4578)

(declare-fun e!94695 () Unit!4578)

(assert (=> d!46273 (= lt!76468 e!94695)))

(declare-fun c!27540 () Bool)

(declare-fun e!94691 () Bool)

(assert (=> d!46273 (= c!27540 e!94691)))

(declare-fun res!69227 () Bool)

(assert (=> d!46273 (=> (not res!69227) (not e!94691))))

(assert (=> d!46273 (= res!69227 (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun e!94693 () ListLongMap!1757)

(assert (=> d!46273 (= lt!76470 e!94693)))

(declare-fun c!27537 () Bool)

(assert (=> d!46273 (= c!27537 (and (not (= (bvand (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!46273 (validMask!0 (mask!7353 newMap!16))))

(assert (=> d!46273 (= (getCurrentListMap!564 (_keys!4756 newMap!16) (ite (or c!27429 c!27431) (_values!2972 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16)))) (mask!7353 newMap!16) (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) (zeroValue!2835 newMap!16) (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)) lt!76458)))

(declare-fun b!145332 () Bool)

(declare-fun e!94699 () Bool)

(declare-fun call!16246 () Bool)

(assert (=> b!145332 (= e!94699 (not call!16246))))

(declare-fun b!145333 () Bool)

(declare-fun e!94696 () Bool)

(assert (=> b!145333 (= e!94694 e!94696)))

(declare-fun c!27536 () Bool)

(assert (=> b!145333 (= c!27536 (not (= (bvand (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!94698 () Bool)

(declare-fun b!145334 () Bool)

(assert (=> b!145334 (= e!94698 (= (apply!123 lt!76458 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)) (get!1549 (select (arr!2334 (ite (or c!27429 c!27431) (_values!2972 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!448 (defaultEntry!2989 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!145334 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2609 (ite (or c!27429 c!27431) (_values!2972 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16)))))))))

(assert (=> b!145334 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun bm!16238 () Bool)

(declare-fun call!16242 () ListLongMap!1757)

(declare-fun call!16243 () ListLongMap!1757)

(assert (=> bm!16238 (= call!16242 call!16243)))

(declare-fun bm!16239 () Bool)

(assert (=> bm!16239 (= call!16243 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (ite (or c!27429 c!27431) (_values!2972 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16)))) (mask!7353 newMap!16) (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) (zeroValue!2835 newMap!16) (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun b!145335 () Bool)

(declare-fun e!94692 () ListLongMap!1757)

(assert (=> b!145335 (= e!94693 e!94692)))

(declare-fun c!27541 () Bool)

(assert (=> b!145335 (= c!27541 (and (not (= (bvand (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!16244 () ListLongMap!1757)

(declare-fun call!16247 () ListLongMap!1757)

(declare-fun bm!16240 () Bool)

(assert (=> bm!16240 (= call!16247 (+!182 (ite c!27537 call!16243 (ite c!27541 call!16242 call!16244)) (ite (or c!27537 c!27541) (tuple2!2723 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2835 newMap!16)) (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16))))))))

(declare-fun b!145336 () Bool)

(declare-fun e!94703 () ListLongMap!1757)

(declare-fun call!16241 () ListLongMap!1757)

(assert (=> b!145336 (= e!94703 call!16241)))

(declare-fun b!145337 () Bool)

(assert (=> b!145337 (= e!94703 call!16244)))

(declare-fun b!145338 () Bool)

(assert (=> b!145338 (= e!94691 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145339 () Bool)

(declare-fun e!94701 () Bool)

(assert (=> b!145339 (= e!94701 e!94698)))

(declare-fun res!69225 () Bool)

(assert (=> b!145339 (=> (not res!69225) (not e!94698))))

(assert (=> b!145339 (= res!69225 (contains!936 lt!76458 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!145339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145340 () Bool)

(declare-fun res!69228 () Bool)

(assert (=> b!145340 (=> (not res!69228) (not e!94694))))

(assert (=> b!145340 (= res!69228 e!94699)))

(declare-fun c!27538 () Bool)

(assert (=> b!145340 (= c!27538 (not (= (bvand (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!145341 () Bool)

(declare-fun e!94697 () Bool)

(assert (=> b!145341 (= e!94697 (validKeyInArray!0 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!145342 () Bool)

(declare-fun call!16245 () Bool)

(assert (=> b!145342 (= e!94696 (not call!16245))))

(declare-fun b!145343 () Bool)

(declare-fun e!94702 () Bool)

(assert (=> b!145343 (= e!94699 e!94702)))

(declare-fun res!69223 () Bool)

(assert (=> b!145343 (= res!69223 call!16246)))

(assert (=> b!145343 (=> (not res!69223) (not e!94702))))

(declare-fun bm!16241 () Bool)

(assert (=> bm!16241 (= call!16245 (contains!936 lt!76458 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145344 () Bool)

(declare-fun Unit!4599 () Unit!4578)

(assert (=> b!145344 (= e!94695 Unit!4599)))

(declare-fun bm!16242 () Bool)

(assert (=> bm!16242 (= call!16246 (contains!936 lt!76458 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!145345 () Bool)

(declare-fun e!94700 () Bool)

(assert (=> b!145345 (= e!94696 e!94700)))

(declare-fun res!69226 () Bool)

(assert (=> b!145345 (= res!69226 call!16245)))

(assert (=> b!145345 (=> (not res!69226) (not e!94700))))

(declare-fun b!145346 () Bool)

(declare-fun lt!76467 () Unit!4578)

(assert (=> b!145346 (= e!94695 lt!76467)))

(declare-fun lt!76453 () ListLongMap!1757)

(assert (=> b!145346 (= lt!76453 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (ite (or c!27429 c!27431) (_values!2972 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16)))) (mask!7353 newMap!16) (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) (zeroValue!2835 newMap!16) (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76463 () (_ BitVec 64))

(assert (=> b!145346 (= lt!76463 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76469 () (_ BitVec 64))

(assert (=> b!145346 (= lt!76469 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76461 () Unit!4578)

(assert (=> b!145346 (= lt!76461 (addStillContains!99 lt!76453 lt!76463 (zeroValue!2835 newMap!16) lt!76469))))

(assert (=> b!145346 (contains!936 (+!182 lt!76453 (tuple2!2723 lt!76463 (zeroValue!2835 newMap!16))) lt!76469)))

(declare-fun lt!76464 () Unit!4578)

(assert (=> b!145346 (= lt!76464 lt!76461)))

(declare-fun lt!76473 () ListLongMap!1757)

(assert (=> b!145346 (= lt!76473 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (ite (or c!27429 c!27431) (_values!2972 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16)))) (mask!7353 newMap!16) (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) (zeroValue!2835 newMap!16) (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76472 () (_ BitVec 64))

(assert (=> b!145346 (= lt!76472 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76465 () (_ BitVec 64))

(assert (=> b!145346 (= lt!76465 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76455 () Unit!4578)

(assert (=> b!145346 (= lt!76455 (addApplyDifferent!99 lt!76473 lt!76472 (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)) lt!76465))))

(assert (=> b!145346 (= (apply!123 (+!182 lt!76473 (tuple2!2723 lt!76472 (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)))) lt!76465) (apply!123 lt!76473 lt!76465))))

(declare-fun lt!76466 () Unit!4578)

(assert (=> b!145346 (= lt!76466 lt!76455)))

(declare-fun lt!76457 () ListLongMap!1757)

(assert (=> b!145346 (= lt!76457 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (ite (or c!27429 c!27431) (_values!2972 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16)))) (mask!7353 newMap!16) (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) (zeroValue!2835 newMap!16) (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76462 () (_ BitVec 64))

(assert (=> b!145346 (= lt!76462 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76471 () (_ BitVec 64))

(assert (=> b!145346 (= lt!76471 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!76452 () Unit!4578)

(assert (=> b!145346 (= lt!76452 (addApplyDifferent!99 lt!76457 lt!76462 (zeroValue!2835 newMap!16) lt!76471))))

(assert (=> b!145346 (= (apply!123 (+!182 lt!76457 (tuple2!2723 lt!76462 (zeroValue!2835 newMap!16))) lt!76471) (apply!123 lt!76457 lt!76471))))

(declare-fun lt!76460 () Unit!4578)

(assert (=> b!145346 (= lt!76460 lt!76452)))

(declare-fun lt!76456 () ListLongMap!1757)

(assert (=> b!145346 (= lt!76456 (getCurrentListMapNoExtraKeys!148 (_keys!4756 newMap!16) (ite (or c!27429 c!27431) (_values!2972 newMap!16) (array!4942 (store (arr!2334 (_values!2972 newMap!16)) (index!3295 lt!76138) (ValueCellFull!1131 (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2609 (_values!2972 newMap!16)))) (mask!7353 newMap!16) (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) (zeroValue!2835 newMap!16) (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2989 newMap!16)))))

(declare-fun lt!76459 () (_ BitVec 64))

(assert (=> b!145346 (= lt!76459 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!76454 () (_ BitVec 64))

(assert (=> b!145346 (= lt!76454 (select (arr!2333 (_keys!4756 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!145346 (= lt!76467 (addApplyDifferent!99 lt!76456 lt!76459 (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)) lt!76454))))

(assert (=> b!145346 (= (apply!123 (+!182 lt!76456 (tuple2!2723 lt!76459 (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)))) lt!76454) (apply!123 lt!76456 lt!76454))))

(declare-fun b!145347 () Bool)

(declare-fun res!69222 () Bool)

(assert (=> b!145347 (=> (not res!69222) (not e!94694))))

(assert (=> b!145347 (= res!69222 e!94701)))

(declare-fun res!69229 () Bool)

(assert (=> b!145347 (=> res!69229 e!94701)))

(assert (=> b!145347 (= res!69229 (not e!94697))))

(declare-fun res!69230 () Bool)

(assert (=> b!145347 (=> (not res!69230) (not e!94697))))

(assert (=> b!145347 (= res!69230 (bvslt #b00000000000000000000000000000000 (size!2608 (_keys!4756 newMap!16))))))

(declare-fun b!145348 () Bool)

(assert (=> b!145348 (= e!94700 (= (apply!123 lt!76458 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16))))))

(declare-fun c!27539 () Bool)

(declare-fun b!145349 () Bool)

(assert (=> b!145349 (= c!27539 (and (not (= (bvand (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!27429 (ite c!27435 (extraKeys!2736 newMap!16) lt!76134) (extraKeys!2736 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!145349 (= e!94692 e!94703)))

(declare-fun b!145350 () Bool)

(assert (=> b!145350 (= e!94693 (+!182 call!16247 (tuple2!2723 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!27429 (ite c!27435 (minValue!2835 newMap!16) (get!1549 (select (arr!2334 (_values!2972 (v!3320 (underlying!488 thiss!992)))) from!355) (dynLambda!448 (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2835 newMap!16)))))))

(declare-fun b!145351 () Bool)

(assert (=> b!145351 (= e!94702 (= (apply!123 lt!76458 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2835 newMap!16)))))

(declare-fun b!145352 () Bool)

(assert (=> b!145352 (= e!94692 call!16241)))

(declare-fun bm!16243 () Bool)

(assert (=> bm!16243 (= call!16244 call!16242)))

(declare-fun bm!16244 () Bool)

(assert (=> bm!16244 (= call!16241 call!16247)))

(assert (= (and d!46273 c!27537) b!145350))

(assert (= (and d!46273 (not c!27537)) b!145335))

(assert (= (and b!145335 c!27541) b!145352))

(assert (= (and b!145335 (not c!27541)) b!145349))

(assert (= (and b!145349 c!27539) b!145336))

(assert (= (and b!145349 (not c!27539)) b!145337))

(assert (= (or b!145336 b!145337) bm!16243))

(assert (= (or b!145352 bm!16243) bm!16238))

(assert (= (or b!145352 b!145336) bm!16244))

(assert (= (or b!145350 bm!16238) bm!16239))

(assert (= (or b!145350 bm!16244) bm!16240))

(assert (= (and d!46273 res!69227) b!145338))

(assert (= (and d!46273 c!27540) b!145346))

(assert (= (and d!46273 (not c!27540)) b!145344))

(assert (= (and d!46273 res!69224) b!145347))

(assert (= (and b!145347 res!69230) b!145341))

(assert (= (and b!145347 (not res!69229)) b!145339))

(assert (= (and b!145339 res!69225) b!145334))

(assert (= (and b!145347 res!69222) b!145340))

(assert (= (and b!145340 c!27538) b!145343))

(assert (= (and b!145340 (not c!27538)) b!145332))

(assert (= (and b!145343 res!69223) b!145351))

(assert (= (or b!145343 b!145332) bm!16242))

(assert (= (and b!145340 res!69228) b!145333))

(assert (= (and b!145333 c!27536) b!145345))

(assert (= (and b!145333 (not c!27536)) b!145342))

(assert (= (and b!145345 res!69226) b!145348))

(assert (= (or b!145345 b!145342) bm!16241))

(declare-fun b_lambda!6509 () Bool)

(assert (=> (not b_lambda!6509) (not b!145334)))

(assert (=> b!145334 t!6412))

(declare-fun b_and!9055 () Bool)

(assert (= b_and!9051 (and (=> t!6412 result!4275) b_and!9055)))

(assert (=> b!145334 t!6414))

(declare-fun b_and!9057 () Bool)

(assert (= b_and!9053 (and (=> t!6414 result!4277) b_and!9057)))

(assert (=> b!145339 m!174829))

(assert (=> b!145339 m!174829))

(declare-fun m!175317 () Bool)

(assert (=> b!145339 m!175317))

(declare-fun m!175319 () Bool)

(assert (=> bm!16239 m!175319))

(assert (=> b!145334 m!175107))

(assert (=> b!145334 m!174829))

(assert (=> b!145334 m!174829))

(declare-fun m!175321 () Bool)

(assert (=> b!145334 m!175321))

(declare-fun m!175323 () Bool)

(assert (=> b!145334 m!175323))

(assert (=> b!145334 m!175323))

(assert (=> b!145334 m!175107))

(declare-fun m!175325 () Bool)

(assert (=> b!145334 m!175325))

(declare-fun m!175327 () Bool)

(assert (=> b!145351 m!175327))

(assert (=> b!145338 m!174829))

(assert (=> b!145338 m!174829))

(assert (=> b!145338 m!174883))

(declare-fun m!175329 () Bool)

(assert (=> b!145348 m!175329))

(assert (=> d!46273 m!174801))

(assert (=> b!145341 m!174829))

(assert (=> b!145341 m!174829))

(assert (=> b!145341 m!174883))

(declare-fun m!175331 () Bool)

(assert (=> bm!16242 m!175331))

(declare-fun m!175333 () Bool)

(assert (=> bm!16240 m!175333))

(declare-fun m!175335 () Bool)

(assert (=> b!145350 m!175335))

(declare-fun m!175337 () Bool)

(assert (=> bm!16241 m!175337))

(declare-fun m!175339 () Bool)

(assert (=> b!145346 m!175339))

(declare-fun m!175341 () Bool)

(assert (=> b!145346 m!175341))

(declare-fun m!175343 () Bool)

(assert (=> b!145346 m!175343))

(declare-fun m!175345 () Bool)

(assert (=> b!145346 m!175345))

(declare-fun m!175347 () Bool)

(assert (=> b!145346 m!175347))

(declare-fun m!175349 () Bool)

(assert (=> b!145346 m!175349))

(declare-fun m!175351 () Bool)

(assert (=> b!145346 m!175351))

(assert (=> b!145346 m!175319))

(assert (=> b!145346 m!175339))

(declare-fun m!175353 () Bool)

(assert (=> b!145346 m!175353))

(declare-fun m!175355 () Bool)

(assert (=> b!145346 m!175355))

(declare-fun m!175357 () Bool)

(assert (=> b!145346 m!175357))

(assert (=> b!145346 m!175343))

(declare-fun m!175359 () Bool)

(assert (=> b!145346 m!175359))

(declare-fun m!175361 () Bool)

(assert (=> b!145346 m!175361))

(assert (=> b!145346 m!174829))

(assert (=> b!145346 m!175345))

(assert (=> b!145346 m!175349))

(declare-fun m!175363 () Bool)

(assert (=> b!145346 m!175363))

(declare-fun m!175365 () Bool)

(assert (=> b!145346 m!175365))

(declare-fun m!175367 () Bool)

(assert (=> b!145346 m!175367))

(assert (=> bm!16165 d!46273))

(assert (=> d!46097 d!46185))

(declare-fun mapNonEmpty!4921 () Bool)

(declare-fun mapRes!4921 () Bool)

(declare-fun tp!11707 () Bool)

(declare-fun e!94705 () Bool)

(assert (=> mapNonEmpty!4921 (= mapRes!4921 (and tp!11707 e!94705))))

(declare-fun mapKey!4921 () (_ BitVec 32))

(declare-fun mapValue!4921 () ValueCell!1131)

(declare-fun mapRest!4921 () (Array (_ BitVec 32) ValueCell!1131))

(assert (=> mapNonEmpty!4921 (= mapRest!4920 (store mapRest!4921 mapKey!4921 mapValue!4921))))

(declare-fun b!145354 () Bool)

(declare-fun e!94704 () Bool)

(assert (=> b!145354 (= e!94704 tp_is_empty!2949)))

(declare-fun mapIsEmpty!4921 () Bool)

(assert (=> mapIsEmpty!4921 mapRes!4921))

(declare-fun condMapEmpty!4921 () Bool)

(declare-fun mapDefault!4921 () ValueCell!1131)

(assert (=> mapNonEmpty!4920 (= condMapEmpty!4921 (= mapRest!4920 ((as const (Array (_ BitVec 32) ValueCell!1131)) mapDefault!4921)))))

(assert (=> mapNonEmpty!4920 (= tp!11706 (and e!94704 mapRes!4921))))

(declare-fun b!145353 () Bool)

(assert (=> b!145353 (= e!94705 tp_is_empty!2949)))

(assert (= (and mapNonEmpty!4920 condMapEmpty!4921) mapIsEmpty!4921))

(assert (= (and mapNonEmpty!4920 (not condMapEmpty!4921)) mapNonEmpty!4921))

(assert (= (and mapNonEmpty!4921 ((_ is ValueCellFull!1131) mapValue!4921)) b!145353))

(assert (= (and mapNonEmpty!4920 ((_ is ValueCellFull!1131) mapDefault!4921)) b!145354))

(declare-fun m!175369 () Bool)

(assert (=> mapNonEmpty!4921 m!175369))

(declare-fun mapNonEmpty!4922 () Bool)

(declare-fun mapRes!4922 () Bool)

(declare-fun tp!11708 () Bool)

(declare-fun e!94707 () Bool)

(assert (=> mapNonEmpty!4922 (= mapRes!4922 (and tp!11708 e!94707))))

(declare-fun mapRest!4922 () (Array (_ BitVec 32) ValueCell!1131))

(declare-fun mapValue!4922 () ValueCell!1131)

(declare-fun mapKey!4922 () (_ BitVec 32))

(assert (=> mapNonEmpty!4922 (= mapRest!4919 (store mapRest!4922 mapKey!4922 mapValue!4922))))

(declare-fun b!145356 () Bool)

(declare-fun e!94706 () Bool)

(assert (=> b!145356 (= e!94706 tp_is_empty!2949)))

(declare-fun mapIsEmpty!4922 () Bool)

(assert (=> mapIsEmpty!4922 mapRes!4922))

(declare-fun condMapEmpty!4922 () Bool)

(declare-fun mapDefault!4922 () ValueCell!1131)

(assert (=> mapNonEmpty!4919 (= condMapEmpty!4922 (= mapRest!4919 ((as const (Array (_ BitVec 32) ValueCell!1131)) mapDefault!4922)))))

(assert (=> mapNonEmpty!4919 (= tp!11705 (and e!94706 mapRes!4922))))

(declare-fun b!145355 () Bool)

(assert (=> b!145355 (= e!94707 tp_is_empty!2949)))

(assert (= (and mapNonEmpty!4919 condMapEmpty!4922) mapIsEmpty!4922))

(assert (= (and mapNonEmpty!4919 (not condMapEmpty!4922)) mapNonEmpty!4922))

(assert (= (and mapNonEmpty!4922 ((_ is ValueCellFull!1131) mapValue!4922)) b!145355))

(assert (= (and mapNonEmpty!4919 ((_ is ValueCellFull!1131) mapDefault!4922)) b!145356))

(declare-fun m!175371 () Bool)

(assert (=> mapNonEmpty!4922 m!175371))

(declare-fun b_lambda!6511 () Bool)

(assert (= b_lambda!6499 (or (and b!144644 b_free!3065) (and b!144637 b_free!3067 (= (defaultEntry!2989 newMap!16) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))))) b_lambda!6511)))

(declare-fun b_lambda!6513 () Bool)

(assert (= b_lambda!6501 (or (and b!144644 b_free!3065) (and b!144637 b_free!3067 (= (defaultEntry!2989 newMap!16) (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))))) b_lambda!6513)))

(declare-fun b_lambda!6515 () Bool)

(assert (= b_lambda!6505 (or (and b!144644 b_free!3065 (= (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2989 newMap!16))) (and b!144637 b_free!3067) b_lambda!6515)))

(declare-fun b_lambda!6517 () Bool)

(assert (= b_lambda!6503 (or (and b!144644 b_free!3065 (= (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2989 newMap!16))) (and b!144637 b_free!3067) b_lambda!6517)))

(declare-fun b_lambda!6519 () Bool)

(assert (= b_lambda!6507 (or (and b!144644 b_free!3065 (= (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2989 newMap!16))) (and b!144637 b_free!3067) b_lambda!6519)))

(declare-fun b_lambda!6521 () Bool)

(assert (= b_lambda!6509 (or (and b!144644 b_free!3065 (= (defaultEntry!2989 (v!3320 (underlying!488 thiss!992))) (defaultEntry!2989 newMap!16))) (and b!144637 b_free!3067) b_lambda!6521)))

(check-sat (not d!46187) (not b!145077) (not b!145090) (not d!46213) (not d!46161) (not b!145055) (not b!145285) (not b!145154) (not d!46175) (not b!145054) (not b!145321) (not b!145007) (not d!46137) (not b!145215) (not b!145244) (not bm!16195) (not d!46211) (not b!145316) (not b!145221) (not bm!16214) (not b!145249) (not bm!16230) (not b!145156) (not b!145218) (not b_lambda!6511) (not b!145216) (not b_next!3067) (not bm!16241) (not b_next!3065) (not b!145047) (not b!145261) (not b!145226) (not d!46205) (not d!46199) (not b!145350) (not b!145233) b_and!9057 (not d!46201) (not b!145351) (not d!46267) (not b!145186) (not d!46151) (not bm!16236) (not b!145256) (not bm!16213) (not b!145338) (not b!145155) (not b!145115) (not b!145103) (not bm!16222) (not d!46207) (not b!145167) (not d!46189) (not mapNonEmpty!4921) (not b_lambda!6515) (not b!145071) (not d!46269) (not d!46147) (not bm!16203) (not b!145066) (not b!145170) (not d!46209) (not d!46225) (not b!145110) (not b!145237) (not b!145178) (not b!145341) (not b!145304) (not b!145146) (not b!145075) (not bm!16223) (not b!145011) (not b_lambda!6521) (not d!46245) (not b!145348) (not b!145158) (not bm!16220) (not bm!16226) (not b!145179) (not b!145240) (not b!145006) (not d!46139) (not b!145302) (not b!145322) (not d!46273) (not d!46217) (not d!46181) (not bm!16240) (not d!46179) (not b!145119) (not b!145211) (not d!46247) (not b!145194) (not d!46255) (not b!145305) (not bm!16242) (not b!145225) (not b!145089) (not b!145258) (not b!145019) (not bm!16237) (not b!145049) (not bm!16221) (not d!46251) (not b!145073) (not b!145057) (not d!46271) (not b!145072) (not b!145183) (not b!145323) (not b!145241) (not d!46239) (not b!145251) (not b!145060) (not d!46149) (not b!145206) (not b!145283) (not b!145284) (not b!145159) (not b!145121) (not d!46135) (not d!46227) (not b!145324) (not b_lambda!6513) (not bm!16204) (not d!46193) (not d!46197) (not b!145339) (not bm!16228) (not d!46219) (not b!145147) (not b!145180) b_and!9055 (not b!145021) (not b!145063) (not b!145288) (not b!145238) (not b!145102) (not d!46237) (not d!46167) (not d!46253) (not b!145328) (not bm!16229) (not b!145168) (not d!46133) (not b_lambda!6517) (not bm!16196) (not bm!16207) (not mapNonEmpty!4922) (not b!145295) (not d!46143) (not d!46249) (not b!145189) (not b!145293) (not d!46153) (not d!46215) (not b_lambda!6497) (not bm!16215) (not d!46195) (not b!145086) (not b!145212) (not b!145331) (not bm!16211) (not b!145292) (not b!145346) (not b!145068) (not b!145260) (not b_lambda!6519) (not b!145210) (not b!145150) (not d!46155) (not b!145048) (not bm!16231) (not bm!16210) (not b!145181) (not b!145022) (not d!46191) (not bm!16197) (not d!46203) (not bm!16216) (not b!145157) (not b!145070) (not b!145326) (not d!46235) (not b!145248) (not bm!16239) (not b!145334) (not b!145300) (not b!145092) (not b!145329) (not b!145185) (not b!145228) (not b!145235) (not b!145187) (not d!46131) (not b!145166) (not d!46223) (not b_lambda!6493) (not b!145327) (not d!46157) tp_is_empty!2949 (not b!145120) (not d!46229) (not b!145184) (not b!145176) (not b!145148) (not d!46259) (not b!145064) (not d!46231) (not b!145118) (not b!145279))
(check-sat b_and!9055 b_and!9057 (not b_next!3065) (not b_next!3067))
