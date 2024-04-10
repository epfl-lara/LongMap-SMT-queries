; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12146 () Bool)

(assert start!12146)

(declare-fun b!102638 () Bool)

(declare-fun b_free!2497 () Bool)

(declare-fun b_next!2497 () Bool)

(assert (=> b!102638 (= b_free!2497 (not b_next!2497))))

(declare-fun tp!9804 () Bool)

(declare-fun b_and!6343 () Bool)

(assert (=> b!102638 (= tp!9804 b_and!6343)))

(declare-fun b!102648 () Bool)

(declare-fun b_free!2499 () Bool)

(declare-fun b_next!2499 () Bool)

(assert (=> b!102648 (= b_free!2499 (not b_next!2499))))

(declare-fun tp!9802 () Bool)

(declare-fun b_and!6345 () Bool)

(assert (=> b!102648 (= tp!9802 b_and!6345)))

(declare-fun mapIsEmpty!3875 () Bool)

(declare-fun mapRes!3875 () Bool)

(assert (=> mapIsEmpty!3875 mapRes!3875))

(declare-fun mapIsEmpty!3876 () Bool)

(declare-fun mapRes!3876 () Bool)

(assert (=> mapIsEmpty!3876 mapRes!3876))

(declare-fun b!102635 () Bool)

(declare-fun e!66847 () Bool)

(declare-fun e!66855 () Bool)

(assert (=> b!102635 (= e!66847 e!66855)))

(declare-fun b!102636 () Bool)

(declare-datatypes ((Unit!3135 0))(
  ( (Unit!3136) )
))
(declare-fun e!66854 () Unit!3135)

(declare-fun Unit!3137 () Unit!3135)

(assert (=> b!102636 (= e!66854 Unit!3137)))

(declare-fun b!102637 () Bool)

(declare-fun res!51334 () Bool)

(declare-fun e!66844 () Bool)

(assert (=> b!102637 (=> (not res!51334) (not e!66844))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3201 0))(
  ( (V!3202 (val!1377 Int)) )
))
(declare-datatypes ((array!4317 0))(
  ( (array!4318 (arr!2049 (Array (_ BitVec 32) (_ BitVec 64))) (size!2303 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!989 0))(
  ( (ValueCellFull!989 (v!2865 V!3201)) (EmptyCell!989) )
))
(declare-datatypes ((array!4319 0))(
  ( (array!4320 (arr!2050 (Array (_ BitVec 32) ValueCell!989)) (size!2304 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!886 0))(
  ( (LongMapFixedSize!887 (defaultEntry!2554 Int) (mask!6687 (_ BitVec 32)) (extraKeys!2363 (_ BitVec 32)) (zeroValue!2431 V!3201) (minValue!2431 V!3201) (_size!492 (_ BitVec 32)) (_keys!4256 array!4317) (_values!2537 array!4319) (_vacant!492 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!686 0))(
  ( (Cell!687 (v!2866 LongMapFixedSize!886)) )
))
(declare-datatypes ((LongMap!686 0))(
  ( (LongMap!687 (underlying!354 Cell!686)) )
))
(declare-fun thiss!992 () LongMap!686)

(assert (=> b!102637 (= res!51334 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2303 (_keys!4256 (v!2866 (underlying!354 thiss!992)))))))))

(declare-fun tp_is_empty!2665 () Bool)

(declare-fun e!66857 () Bool)

(declare-fun array_inv!1287 (array!4317) Bool)

(declare-fun array_inv!1288 (array!4319) Bool)

(assert (=> b!102638 (= e!66855 (and tp!9804 tp_is_empty!2665 (array_inv!1287 (_keys!4256 (v!2866 (underlying!354 thiss!992)))) (array_inv!1288 (_values!2537 (v!2866 (underlying!354 thiss!992)))) e!66857))))

(declare-fun res!51333 () Bool)

(assert (=> start!12146 (=> (not res!51333) (not e!66844))))

(declare-fun valid!411 (LongMap!686) Bool)

(assert (=> start!12146 (= res!51333 (valid!411 thiss!992))))

(assert (=> start!12146 e!66844))

(declare-fun e!66856 () Bool)

(assert (=> start!12146 e!66856))

(assert (=> start!12146 true))

(declare-fun e!66858 () Bool)

(assert (=> start!12146 e!66858))

(declare-fun b!102639 () Bool)

(declare-fun e!66853 () Bool)

(assert (=> b!102639 (= e!66853 tp_is_empty!2665)))

(declare-fun b!102640 () Bool)

(declare-fun e!66846 () Bool)

(assert (=> b!102640 (= e!66844 e!66846)))

(declare-fun res!51335 () Bool)

(assert (=> b!102640 (=> (not res!51335) (not e!66846))))

(declare-datatypes ((tuple2!2388 0))(
  ( (tuple2!2389 (_1!1205 (_ BitVec 64)) (_2!1205 V!3201)) )
))
(declare-datatypes ((List!1605 0))(
  ( (Nil!1602) (Cons!1601 (h!2197 tuple2!2388) (t!5651 List!1605)) )
))
(declare-datatypes ((ListLongMap!1561 0))(
  ( (ListLongMap!1562 (toList!796 List!1605)) )
))
(declare-fun lt!52174 () ListLongMap!1561)

(declare-fun lt!52183 () ListLongMap!1561)

(assert (=> b!102640 (= res!51335 (= lt!52174 lt!52183))))

(declare-fun newMap!16 () LongMapFixedSize!886)

(declare-fun map!1278 (LongMapFixedSize!886) ListLongMap!1561)

(assert (=> b!102640 (= lt!52183 (map!1278 newMap!16))))

(declare-fun getCurrentListMap!485 (array!4317 array!4319 (_ BitVec 32) (_ BitVec 32) V!3201 V!3201 (_ BitVec 32) Int) ListLongMap!1561)

(assert (=> b!102640 (= lt!52174 (getCurrentListMap!485 (_keys!4256 (v!2866 (underlying!354 thiss!992))) (_values!2537 (v!2866 (underlying!354 thiss!992))) (mask!6687 (v!2866 (underlying!354 thiss!992))) (extraKeys!2363 (v!2866 (underlying!354 thiss!992))) (zeroValue!2431 (v!2866 (underlying!354 thiss!992))) (minValue!2431 (v!2866 (underlying!354 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2554 (v!2866 (underlying!354 thiss!992)))))))

(declare-fun b!102641 () Bool)

(declare-fun res!51337 () Bool)

(assert (=> b!102641 (=> (not res!51337) (not e!66844))))

(declare-fun valid!412 (LongMapFixedSize!886) Bool)

(assert (=> b!102641 (= res!51337 (valid!412 newMap!16))))

(declare-fun b!102642 () Bool)

(declare-fun e!66848 () Bool)

(assert (=> b!102642 (= e!66848 tp_is_empty!2665)))

(declare-fun b!102643 () Bool)

(declare-fun e!66852 () Bool)

(assert (=> b!102643 (= e!66846 e!66852)))

(declare-fun res!51336 () Bool)

(assert (=> b!102643 (=> (not res!51336) (not e!66852))))

(assert (=> b!102643 (= res!51336 (and (not (= (select (arr!2049 (_keys!4256 (v!2866 (underlying!354 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2049 (_keys!4256 (v!2866 (underlying!354 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!52172 () V!3201)

(declare-fun get!1316 (ValueCell!989 V!3201) V!3201)

(declare-fun dynLambda!380 (Int (_ BitVec 64)) V!3201)

(assert (=> b!102643 (= lt!52172 (get!1316 (select (arr!2050 (_values!2537 (v!2866 (underlying!354 thiss!992)))) from!355) (dynLambda!380 (defaultEntry!2554 (v!2866 (underlying!354 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!102644 () Bool)

(declare-fun e!66860 () Bool)

(assert (=> b!102644 (= e!66860 tp_is_empty!2665)))

(declare-fun b!102645 () Bool)

(assert (=> b!102645 (= e!66857 (and e!66860 mapRes!3876))))

(declare-fun condMapEmpty!3875 () Bool)

(declare-fun mapDefault!3876 () ValueCell!989)

