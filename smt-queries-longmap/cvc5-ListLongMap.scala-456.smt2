; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8348 () Bool)

(assert start!8348)

(declare-fun b!55519 () Bool)

(declare-fun b_free!1861 () Bool)

(declare-fun b_next!1861 () Bool)

(assert (=> b!55519 (= b_free!1861 (not b_next!1861))))

(declare-fun tp!7686 () Bool)

(declare-fun b_and!3263 () Bool)

(assert (=> b!55519 (= tp!7686 b_and!3263)))

(declare-fun b!55515 () Bool)

(declare-fun b_free!1863 () Bool)

(declare-fun b_next!1863 () Bool)

(assert (=> b!55515 (= b_free!1863 (not b_next!1863))))

(declare-fun tp!7685 () Bool)

(declare-fun b_and!3265 () Bool)

(assert (=> b!55515 (= tp!7685 b_and!3265)))

(declare-fun b!55500 () Bool)

(declare-fun res!31264 () Bool)

(declare-fun e!36479 () Bool)

(assert (=> b!55500 (=> res!31264 e!36479)))

(declare-datatypes ((V!2777 0))(
  ( (V!2778 (val!1218 Int)) )
))
(declare-datatypes ((array!3617 0))(
  ( (array!3618 (arr!1731 (Array (_ BitVec 32) (_ BitVec 64))) (size!1960 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!830 0))(
  ( (ValueCellFull!830 (v!2322 V!2777)) (EmptyCell!830) )
))
(declare-datatypes ((array!3619 0))(
  ( (array!3620 (arr!1732 (Array (_ BitVec 32) ValueCell!830)) (size!1961 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!568 0))(
  ( (LongMapFixedSize!569 (defaultEntry!1998 Int) (mask!5857 (_ BitVec 32)) (extraKeys!1889 (_ BitVec 32)) (zeroValue!1916 V!2777) (minValue!1916 V!2777) (_size!333 (_ BitVec 32)) (_keys!3618 array!3617) (_values!1981 array!3619) (_vacant!333 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!384 0))(
  ( (Cell!385 (v!2323 LongMapFixedSize!568)) )
))
(declare-datatypes ((LongMap!384 0))(
  ( (LongMap!385 (underlying!203 Cell!384)) )
))
(declare-fun thiss!992 () LongMap!384)

(declare-datatypes ((List!1397 0))(
  ( (Nil!1394) (Cons!1393 (h!1973 (_ BitVec 64)) (t!4627 List!1397)) )
))
(declare-fun lt!21960 () List!1397)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!3617 (_ BitVec 32) List!1397) Bool)

(assert (=> b!55500 (= res!31264 (not (arrayNoDuplicates!0 (_keys!3618 (v!2323 (underlying!203 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!21960)))))

(declare-fun b!55501 () Bool)

(declare-fun e!36470 () Bool)

(declare-fun tp_is_empty!2347 () Bool)

(assert (=> b!55501 (= e!36470 tp_is_empty!2347)))

(declare-fun b!55502 () Bool)

(declare-fun e!36467 () Bool)

(declare-fun e!36468 () Bool)

(assert (=> b!55502 (= e!36467 e!36468)))

(declare-fun mapIsEmpty!2711 () Bool)

(declare-fun mapRes!2712 () Bool)

(assert (=> mapIsEmpty!2711 mapRes!2712))

(declare-fun b!55503 () Bool)

(declare-fun e!36475 () Bool)

(assert (=> b!55503 (= e!36475 e!36467)))

(declare-fun b!55504 () Bool)

(declare-fun e!36474 () Bool)

(declare-fun e!36476 () Bool)

(declare-fun mapRes!2711 () Bool)

(assert (=> b!55504 (= e!36474 (and e!36476 mapRes!2711))))

(declare-fun condMapEmpty!2711 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!568)

(declare-fun mapDefault!2712 () ValueCell!830)

