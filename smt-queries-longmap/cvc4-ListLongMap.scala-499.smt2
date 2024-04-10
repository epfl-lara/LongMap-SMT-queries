; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11316 () Bool)

(assert start!11316)

(declare-fun b!93659 () Bool)

(declare-fun b_free!2385 () Bool)

(declare-fun b_next!2385 () Bool)

(assert (=> b!93659 (= b_free!2385 (not b_next!2385))))

(declare-fun tp!9419 () Bool)

(declare-fun b_and!5719 () Bool)

(assert (=> b!93659 (= tp!9419 b_and!5719)))

(declare-fun b!93666 () Bool)

(declare-fun b_free!2387 () Bool)

(declare-fun b_next!2387 () Bool)

(assert (=> b!93666 (= b_free!2387 (not b_next!2387))))

(declare-fun tp!9420 () Bool)

(declare-fun b_and!5721 () Bool)

(assert (=> b!93666 (= tp!9420 b_and!5721)))

(declare-fun b!93655 () Bool)

(declare-fun e!61161 () Bool)

(declare-fun e!61165 () Bool)

(assert (=> b!93655 (= e!61161 e!61165)))

(declare-fun res!47503 () Bool)

(assert (=> b!93655 (=> (not res!47503) (not e!61165))))

(declare-datatypes ((V!3125 0))(
  ( (V!3126 (val!1349 Int)) )
))
(declare-datatypes ((array!4191 0))(
  ( (array!4192 (arr!1993 (Array (_ BitVec 32) (_ BitVec 64))) (size!2241 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!961 0))(
  ( (ValueCellFull!961 (v!2755 V!3125)) (EmptyCell!961) )
))
(declare-datatypes ((array!4193 0))(
  ( (array!4194 (arr!1994 (Array (_ BitVec 32) ValueCell!961)) (size!2242 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!830 0))(
  ( (LongMapFixedSize!831 (defaultEntry!2432 Int) (mask!6504 (_ BitVec 32)) (extraKeys!2261 (_ BitVec 32)) (zeroValue!2319 V!3125) (minValue!2319 V!3125) (_size!464 (_ BitVec 32)) (_keys!4114 array!4191) (_values!2415 array!4193) (_vacant!464 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!630 0))(
  ( (Cell!631 (v!2756 LongMapFixedSize!830)) )
))
(declare-datatypes ((LongMap!630 0))(
  ( (LongMap!631 (underlying!326 Cell!630)) )
))
(declare-fun thiss!992 () LongMap!630)

(declare-datatypes ((tuple2!2306 0))(
  ( (tuple2!2307 (_1!1164 (_ BitVec 64)) (_2!1164 V!3125)) )
))
(declare-datatypes ((List!1566 0))(
  ( (Nil!1563) (Cons!1562 (h!2154 tuple2!2306) (t!5460 List!1566)) )
))
(declare-datatypes ((ListLongMap!1517 0))(
  ( (ListLongMap!1518 (toList!774 List!1566)) )
))
(declare-fun lt!46373 () ListLongMap!1517)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!46370 () ListLongMap!1517)

(assert (=> b!93655 (= res!47503 (and (= lt!46373 lt!46370) (not (= (select (arr!1993 (_keys!4114 (v!2756 (underlying!326 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1993 (_keys!4114 (v!2756 (underlying!326 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!830)

(declare-fun map!1239 (LongMapFixedSize!830) ListLongMap!1517)

(assert (=> b!93655 (= lt!46370 (map!1239 newMap!16))))

(declare-fun getCurrentListMap!466 (array!4191 array!4193 (_ BitVec 32) (_ BitVec 32) V!3125 V!3125 (_ BitVec 32) Int) ListLongMap!1517)

(assert (=> b!93655 (= lt!46373 (getCurrentListMap!466 (_keys!4114 (v!2756 (underlying!326 thiss!992))) (_values!2415 (v!2756 (underlying!326 thiss!992))) (mask!6504 (v!2756 (underlying!326 thiss!992))) (extraKeys!2261 (v!2756 (underlying!326 thiss!992))) (zeroValue!2319 (v!2756 (underlying!326 thiss!992))) (minValue!2319 (v!2756 (underlying!326 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2432 (v!2756 (underlying!326 thiss!992)))))))

(declare-fun mapIsEmpty!3659 () Bool)

(declare-fun mapRes!3659 () Bool)

(assert (=> mapIsEmpty!3659 mapRes!3659))

(declare-fun b!93656 () Bool)

(declare-fun res!47506 () Bool)

(assert (=> b!93656 (=> (not res!47506) (not e!61161))))

(assert (=> b!93656 (= res!47506 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2241 (_keys!4114 (v!2756 (underlying!326 thiss!992)))))))))

(declare-fun res!47505 () Bool)

(assert (=> start!11316 (=> (not res!47505) (not e!61161))))

(declare-fun valid!371 (LongMap!630) Bool)

(assert (=> start!11316 (= res!47505 (valid!371 thiss!992))))

(assert (=> start!11316 e!61161))

(declare-fun e!61158 () Bool)

(assert (=> start!11316 e!61158))

(assert (=> start!11316 true))

(declare-fun e!61160 () Bool)

(assert (=> start!11316 e!61160))

(declare-fun b!93657 () Bool)

(declare-fun e!61163 () Bool)

(declare-fun tp_is_empty!2609 () Bool)

(assert (=> b!93657 (= e!61163 tp_is_empty!2609)))

(declare-fun b!93658 () Bool)

(declare-fun e!61151 () Bool)

(declare-fun e!61154 () Bool)

(assert (=> b!93658 (= e!61151 e!61154)))

(declare-fun e!61153 () Bool)

(declare-fun array_inv!1239 (array!4191) Bool)

(declare-fun array_inv!1240 (array!4193) Bool)

(assert (=> b!93659 (= e!61154 (and tp!9419 tp_is_empty!2609 (array_inv!1239 (_keys!4114 (v!2756 (underlying!326 thiss!992)))) (array_inv!1240 (_values!2415 (v!2756 (underlying!326 thiss!992)))) e!61153))))

(declare-fun mapNonEmpty!3659 () Bool)

(declare-fun tp!9418 () Bool)

(declare-fun e!61162 () Bool)

(assert (=> mapNonEmpty!3659 (= mapRes!3659 (and tp!9418 e!61162))))

(declare-fun mapRest!3659 () (Array (_ BitVec 32) ValueCell!961))

(declare-fun mapValue!3660 () ValueCell!961)

(declare-fun mapKey!3660 () (_ BitVec 32))

(assert (=> mapNonEmpty!3659 (= (arr!1994 (_values!2415 newMap!16)) (store mapRest!3659 mapKey!3660 mapValue!3660))))

(declare-fun b!93660 () Bool)

(declare-fun res!47504 () Bool)

(assert (=> b!93660 (=> (not res!47504) (not e!61161))))

(declare-fun valid!372 (LongMapFixedSize!830) Bool)

(assert (=> b!93660 (= res!47504 (valid!372 newMap!16))))

(declare-fun b!93661 () Bool)

(declare-fun e!61157 () Bool)

(assert (=> b!93661 (= e!61157 tp_is_empty!2609)))

(declare-fun b!93662 () Bool)

(assert (=> b!93662 (= e!61158 e!61151)))

(declare-fun b!93663 () Bool)

(declare-fun e!61156 () Bool)

(declare-fun e!61150 () Bool)

(assert (=> b!93663 (= e!61156 (and e!61150 mapRes!3659))))

(declare-fun condMapEmpty!3659 () Bool)

(declare-fun mapDefault!3660 () ValueCell!961)

