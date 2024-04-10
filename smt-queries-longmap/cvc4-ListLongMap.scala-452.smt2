; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8328 () Bool)

(assert start!8328)

(declare-fun b!54928 () Bool)

(declare-fun b_free!1821 () Bool)

(declare-fun b_next!1821 () Bool)

(assert (=> b!54928 (= b_free!1821 (not b_next!1821))))

(declare-fun tp!7563 () Bool)

(declare-fun b_and!3183 () Bool)

(assert (=> b!54928 (= tp!7563 b_and!3183)))

(declare-fun b!54941 () Bool)

(declare-fun b_free!1823 () Bool)

(declare-fun b_next!1823 () Bool)

(assert (=> b!54941 (= b_free!1823 (not b_next!1823))))

(declare-fun tp!7565 () Bool)

(declare-fun b_and!3185 () Bool)

(assert (=> b!54941 (= tp!7565 b_and!3185)))

(declare-fun b!54926 () Bool)

(declare-fun e!35996 () Bool)

(declare-fun e!35988 () Bool)

(assert (=> b!54926 (= e!35996 e!35988)))

(declare-fun mapNonEmpty!2651 () Bool)

(declare-fun mapRes!2651 () Bool)

(declare-fun tp!7564 () Bool)

(declare-fun e!35990 () Bool)

(assert (=> mapNonEmpty!2651 (= mapRes!2651 (and tp!7564 e!35990))))

(declare-fun mapKey!2652 () (_ BitVec 32))

(declare-datatypes ((V!2749 0))(
  ( (V!2750 (val!1208 Int)) )
))
(declare-datatypes ((ValueCell!820 0))(
  ( (ValueCellFull!820 (v!2302 V!2749)) (EmptyCell!820) )
))
(declare-fun mapValue!2651 () ValueCell!820)

(declare-datatypes ((array!3577 0))(
  ( (array!3578 (arr!1711 (Array (_ BitVec 32) (_ BitVec 64))) (size!1940 (_ BitVec 32))) )
))
(declare-datatypes ((array!3579 0))(
  ( (array!3580 (arr!1712 (Array (_ BitVec 32) ValueCell!820)) (size!1941 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!548 0))(
  ( (LongMapFixedSize!549 (defaultEntry!1988 Int) (mask!5839 (_ BitVec 32)) (extraKeys!1879 (_ BitVec 32)) (zeroValue!1906 V!2749) (minValue!1906 V!2749) (_size!323 (_ BitVec 32)) (_keys!3608 array!3577) (_values!1971 array!3579) (_vacant!323 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!548)

(declare-fun mapRest!2652 () (Array (_ BitVec 32) ValueCell!820))

(assert (=> mapNonEmpty!2651 (= (arr!1712 (_values!1971 newMap!16)) (store mapRest!2652 mapKey!2652 mapValue!2651))))

(declare-fun b!54927 () Bool)

(declare-fun tp_is_empty!2327 () Bool)

(assert (=> b!54927 (= e!35990 tp_is_empty!2327)))

(declare-fun e!35994 () Bool)

(declare-fun e!35991 () Bool)

(declare-datatypes ((Cell!364 0))(
  ( (Cell!365 (v!2303 LongMapFixedSize!548)) )
))
(declare-datatypes ((LongMap!364 0))(
  ( (LongMap!365 (underlying!193 Cell!364)) )
))
(declare-fun thiss!992 () LongMap!364)

(declare-fun array_inv!1059 (array!3577) Bool)

(declare-fun array_inv!1060 (array!3579) Bool)

(assert (=> b!54928 (= e!35994 (and tp!7563 tp_is_empty!2327 (array_inv!1059 (_keys!3608 (v!2303 (underlying!193 thiss!992)))) (array_inv!1060 (_values!1971 (v!2303 (underlying!193 thiss!992)))) e!35991))))

(declare-fun b!54929 () Bool)

(declare-fun e!35992 () Bool)

(assert (=> b!54929 (= e!35992 tp_is_empty!2327)))

(declare-fun b!54930 () Bool)

(declare-fun mapRes!2652 () Bool)

(assert (=> b!54930 (= e!35991 (and e!35992 mapRes!2652))))

(declare-fun condMapEmpty!2652 () Bool)

(declare-fun mapDefault!2651 () ValueCell!820)

