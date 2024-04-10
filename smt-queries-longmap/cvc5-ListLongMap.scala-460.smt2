; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8372 () Bool)

(assert start!8372)

(declare-fun b!56285 () Bool)

(declare-fun b_free!1909 () Bool)

(declare-fun b_next!1909 () Bool)

(assert (=> b!56285 (= b_free!1909 (not b_next!1909))))

(declare-fun tp!7828 () Bool)

(declare-fun b_and!3359 () Bool)

(assert (=> b!56285 (= tp!7828 b_and!3359)))

(declare-fun b!56289 () Bool)

(declare-fun b_free!1911 () Bool)

(declare-fun b_next!1911 () Bool)

(assert (=> b!56289 (= b_free!1911 (not b_next!1911))))

(declare-fun tp!7829 () Bool)

(declare-fun b_and!3361 () Bool)

(assert (=> b!56289 (= tp!7829 b_and!3361)))

(declare-fun b!56280 () Bool)

(declare-fun e!37044 () Bool)

(assert (=> b!56280 (= e!37044 true)))

(declare-datatypes ((V!2809 0))(
  ( (V!2810 (val!1230 Int)) )
))
(declare-datatypes ((array!3665 0))(
  ( (array!3666 (arr!1755 (Array (_ BitVec 32) (_ BitVec 64))) (size!1984 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!842 0))(
  ( (ValueCellFull!842 (v!2346 V!2809)) (EmptyCell!842) )
))
(declare-datatypes ((array!3667 0))(
  ( (array!3668 (arr!1756 (Array (_ BitVec 32) ValueCell!842)) (size!1985 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!592 0))(
  ( (LongMapFixedSize!593 (defaultEntry!2010 Int) (mask!5877 (_ BitVec 32)) (extraKeys!1901 (_ BitVec 32)) (zeroValue!1928 V!2809) (minValue!1928 V!2809) (_size!345 (_ BitVec 32)) (_keys!3630 array!3665) (_values!1993 array!3667) (_vacant!345 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!408 0))(
  ( (Cell!409 (v!2347 LongMapFixedSize!592)) )
))
(declare-datatypes ((LongMap!408 0))(
  ( (LongMap!409 (underlying!215 Cell!408)) )
))
(declare-fun thiss!992 () LongMap!408)

(declare-fun lt!22212 () Bool)

(declare-datatypes ((List!1413 0))(
  ( (Nil!1410) (Cons!1409 (h!1989 (_ BitVec 64)) (t!4691 List!1413)) )
))
(declare-fun lt!22211 () List!1413)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun contains!670 (List!1413 (_ BitVec 64)) Bool)

(assert (=> b!56280 (= lt!22212 (contains!670 lt!22211 (select (arr!1755 (_keys!3630 (v!2347 (underlying!215 thiss!992)))) from!355)))))

(declare-fun mapIsEmpty!2783 () Bool)

(declare-fun mapRes!2784 () Bool)

(assert (=> mapIsEmpty!2783 mapRes!2784))

(declare-fun mapNonEmpty!2783 () Bool)

(declare-fun tp!7830 () Bool)

(declare-fun e!37047 () Bool)

(assert (=> mapNonEmpty!2783 (= mapRes!2784 (and tp!7830 e!37047))))

(declare-fun newMap!16 () LongMapFixedSize!592)

(declare-fun mapRest!2784 () (Array (_ BitVec 32) ValueCell!842))

(declare-fun mapValue!2784 () ValueCell!842)

(declare-fun mapKey!2784 () (_ BitVec 32))

(assert (=> mapNonEmpty!2783 (= (arr!1756 (_values!1993 newMap!16)) (store mapRest!2784 mapKey!2784 mapValue!2784))))

(declare-fun b!56281 () Bool)

(declare-fun tp_is_empty!2371 () Bool)

(assert (=> b!56281 (= e!37047 tp_is_empty!2371)))

(declare-fun b!56282 () Bool)

(declare-fun res!31654 () Bool)

(declare-fun e!37040 () Bool)

(assert (=> b!56282 (=> (not res!31654) (not e!37040))))

(assert (=> b!56282 (= res!31654 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1984 (_keys!3630 (v!2347 (underlying!215 thiss!992)))))))))

(declare-fun b!56283 () Bool)

(declare-fun e!37042 () Bool)

(assert (=> b!56283 (= e!37042 tp_is_empty!2371)))

(declare-fun b!56284 () Bool)

(declare-fun e!37054 () Bool)

(assert (=> b!56284 (= e!37054 tp_is_empty!2371)))

(declare-fun e!37050 () Bool)

(declare-fun e!37043 () Bool)

(declare-fun array_inv!1087 (array!3665) Bool)

(declare-fun array_inv!1088 (array!3667) Bool)

(assert (=> b!56285 (= e!37043 (and tp!7828 tp_is_empty!2371 (array_inv!1087 (_keys!3630 (v!2347 (underlying!215 thiss!992)))) (array_inv!1088 (_values!1993 (v!2347 (underlying!215 thiss!992)))) e!37050))))

(declare-fun b!56286 () Bool)

(declare-fun e!37041 () Bool)

(assert (=> b!56286 (= e!37041 (and e!37042 mapRes!2784))))

(declare-fun condMapEmpty!2784 () Bool)

(declare-fun mapDefault!2784 () ValueCell!842)

