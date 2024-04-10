; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13232 () Bool)

(assert start!13232)

(declare-fun b!116734 () Bool)

(declare-fun b_free!2769 () Bool)

(declare-fun b_next!2769 () Bool)

(assert (=> b!116734 (= b_free!2769 (not b_next!2769))))

(declare-fun tp!10680 () Bool)

(declare-fun b_and!7275 () Bool)

(assert (=> b!116734 (= tp!10680 b_and!7275)))

(declare-fun b!116723 () Bool)

(declare-fun b_free!2771 () Bool)

(declare-fun b_next!2771 () Bool)

(assert (=> b!116723 (= b_free!2771 (not b_next!2771))))

(declare-fun tp!10682 () Bool)

(declare-fun b_and!7277 () Bool)

(assert (=> b!116723 (= tp!10682 b_and!7277)))

(declare-fun mapIsEmpty!4345 () Bool)

(declare-fun mapRes!4346 () Bool)

(assert (=> mapIsEmpty!4345 mapRes!4346))

(declare-fun b!116722 () Bool)

(declare-fun res!57148 () Bool)

(declare-fun e!76270 () Bool)

(assert (=> b!116722 (=> (not res!57148) (not e!76270))))

(declare-datatypes ((V!3381 0))(
  ( (V!3382 (val!1445 Int)) )
))
(declare-datatypes ((array!4609 0))(
  ( (array!4610 (arr!2185 (Array (_ BitVec 32) (_ BitVec 64))) (size!2446 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1057 0))(
  ( (ValueCellFull!1057 (v!3059 V!3381)) (EmptyCell!1057) )
))
(declare-datatypes ((array!4611 0))(
  ( (array!4612 (arr!2186 (Array (_ BitVec 32) ValueCell!1057)) (size!2447 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1022 0))(
  ( (LongMapFixedSize!1023 (defaultEntry!2723 Int) (mask!6943 (_ BitVec 32)) (extraKeys!2512 (_ BitVec 32)) (zeroValue!2590 V!3381) (minValue!2590 V!3381) (_size!560 (_ BitVec 32)) (_keys!4446 array!4609) (_values!2706 array!4611) (_vacant!560 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!820 0))(
  ( (Cell!821 (v!3060 LongMapFixedSize!1022)) )
))
(declare-datatypes ((LongMap!820 0))(
  ( (LongMap!821 (underlying!421 Cell!820)) )
))
(declare-fun thiss!992 () LongMap!820)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!116722 (= res!57148 (and (or (= (select (arr!2185 (_keys!4446 (v!3060 (underlying!421 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2185 (_keys!4446 (v!3060 (underlying!421 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun tp_is_empty!2801 () Bool)

(declare-fun e!76274 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1022)

(declare-fun e!76266 () Bool)

(declare-fun array_inv!1377 (array!4609) Bool)

(declare-fun array_inv!1378 (array!4611) Bool)

(assert (=> b!116723 (= e!76274 (and tp!10682 tp_is_empty!2801 (array_inv!1377 (_keys!4446 newMap!16)) (array_inv!1378 (_values!2706 newMap!16)) e!76266))))

(declare-fun b!116724 () Bool)

(declare-fun e!76275 () Bool)

(declare-fun e!76267 () Bool)

(assert (=> b!116724 (= e!76275 e!76267)))

(declare-fun res!57151 () Bool)

(assert (=> start!13232 (=> (not res!57151) (not e!76270))))

(declare-fun valid!486 (LongMap!820) Bool)

(assert (=> start!13232 (= res!57151 (valid!486 thiss!992))))

(assert (=> start!13232 e!76270))

(assert (=> start!13232 e!76275))

(assert (=> start!13232 true))

(assert (=> start!13232 e!76274))

(declare-fun b!116725 () Bool)

(declare-fun res!57153 () Bool)

(assert (=> b!116725 (=> (not res!57153) (not e!76270))))

(declare-fun valid!487 (LongMapFixedSize!1022) Bool)

(assert (=> b!116725 (= res!57153 (valid!487 newMap!16))))

(declare-fun b!116726 () Bool)

(assert (=> b!116726 (= e!76270 (not (valid!487 (v!3060 (underlying!421 thiss!992)))))))

(declare-fun b!116727 () Bool)

(declare-fun e!76277 () Bool)

(assert (=> b!116727 (= e!76277 tp_is_empty!2801)))

(declare-fun mapIsEmpty!4346 () Bool)

(declare-fun mapRes!4345 () Bool)

(assert (=> mapIsEmpty!4346 mapRes!4345))

(declare-fun b!116728 () Bool)

(declare-fun res!57150 () Bool)

(assert (=> b!116728 (=> (not res!57150) (not e!76270))))

(assert (=> b!116728 (= res!57150 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2446 (_keys!4446 (v!3060 (underlying!421 thiss!992)))))))))

(declare-fun b!116729 () Bool)

(declare-fun res!57149 () Bool)

(assert (=> b!116729 (=> (not res!57149) (not e!76270))))

(assert (=> b!116729 (= res!57149 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6943 newMap!16)) (_size!560 (v!3060 (underlying!421 thiss!992)))))))

(declare-fun b!116730 () Bool)

(declare-fun res!57152 () Bool)

(assert (=> b!116730 (=> (not res!57152) (not e!76270))))

(declare-datatypes ((tuple2!2546 0))(
  ( (tuple2!2547 (_1!1284 (_ BitVec 64)) (_2!1284 V!3381)) )
))
(declare-datatypes ((List!1683 0))(
  ( (Nil!1680) (Cons!1679 (h!2279 tuple2!2546) (t!5949 List!1683)) )
))
(declare-datatypes ((ListLongMap!1661 0))(
  ( (ListLongMap!1662 (toList!846 List!1683)) )
))
(declare-fun getCurrentListMap!527 (array!4609 array!4611 (_ BitVec 32) (_ BitVec 32) V!3381 V!3381 (_ BitVec 32) Int) ListLongMap!1661)

(declare-fun map!1364 (LongMapFixedSize!1022) ListLongMap!1661)

(assert (=> b!116730 (= res!57152 (= (getCurrentListMap!527 (_keys!4446 (v!3060 (underlying!421 thiss!992))) (_values!2706 (v!3060 (underlying!421 thiss!992))) (mask!6943 (v!3060 (underlying!421 thiss!992))) (extraKeys!2512 (v!3060 (underlying!421 thiss!992))) (zeroValue!2590 (v!3060 (underlying!421 thiss!992))) (minValue!2590 (v!3060 (underlying!421 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2723 (v!3060 (underlying!421 thiss!992)))) (map!1364 newMap!16)))))

(declare-fun b!116731 () Bool)

(declare-fun e!76268 () Bool)

(declare-fun e!76269 () Bool)

(assert (=> b!116731 (= e!76268 (and e!76269 mapRes!4345))))

(declare-fun condMapEmpty!4346 () Bool)

(declare-fun mapDefault!4345 () ValueCell!1057)

