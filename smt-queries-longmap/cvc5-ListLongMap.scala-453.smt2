; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8330 () Bool)

(assert start!8330)

(declare-fun b!54994 () Bool)

(declare-fun b_free!1825 () Bool)

(declare-fun b_next!1825 () Bool)

(assert (=> b!54994 (= b_free!1825 (not b_next!1825))))

(declare-fun tp!7578 () Bool)

(declare-fun b_and!3191 () Bool)

(assert (=> b!54994 (= tp!7578 b_and!3191)))

(declare-fun b!54989 () Bool)

(declare-fun b_free!1827 () Bool)

(declare-fun b_next!1827 () Bool)

(assert (=> b!54989 (= b_free!1827 (not b_next!1827))))

(declare-fun tp!7577 () Bool)

(declare-fun b_and!3193 () Bool)

(assert (=> b!54989 (= tp!7577 b_and!3193)))

(declare-fun b!54979 () Bool)

(declare-fun e!36039 () Bool)

(declare-fun e!36045 () Bool)

(assert (=> b!54979 (= e!36039 e!36045)))

(declare-fun b!54980 () Bool)

(declare-fun e!36034 () Bool)

(assert (=> b!54980 (= e!36034 true)))

(declare-fun lt!21802 () Bool)

(declare-datatypes ((V!2753 0))(
  ( (V!2754 (val!1209 Int)) )
))
(declare-datatypes ((array!3581 0))(
  ( (array!3582 (arr!1713 (Array (_ BitVec 32) (_ BitVec 64))) (size!1942 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!821 0))(
  ( (ValueCellFull!821 (v!2304 V!2753)) (EmptyCell!821) )
))
(declare-datatypes ((array!3583 0))(
  ( (array!3584 (arr!1714 (Array (_ BitVec 32) ValueCell!821)) (size!1943 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!550 0))(
  ( (LongMapFixedSize!551 (defaultEntry!1989 Int) (mask!5842 (_ BitVec 32)) (extraKeys!1880 (_ BitVec 32)) (zeroValue!1907 V!2753) (minValue!1907 V!2753) (_size!324 (_ BitVec 32)) (_keys!3609 array!3581) (_values!1972 array!3583) (_vacant!324 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!366 0))(
  ( (Cell!367 (v!2305 LongMapFixedSize!550)) )
))
(declare-datatypes ((LongMap!366 0))(
  ( (LongMap!367 (underlying!194 Cell!366)) )
))
(declare-fun thiss!992 () LongMap!366)

(declare-datatypes ((List!1386 0))(
  ( (Nil!1383) (Cons!1382 (h!1962 (_ BitVec 64)) (t!4580 List!1386)) )
))
(declare-fun arrayNoDuplicates!0 (array!3581 (_ BitVec 32) List!1386) Bool)

(assert (=> b!54980 (= lt!21802 (arrayNoDuplicates!0 (_keys!3609 (v!2305 (underlying!194 thiss!992))) #b00000000000000000000000000000000 Nil!1383))))

(declare-fun mapNonEmpty!2657 () Bool)

(declare-fun mapRes!2657 () Bool)

(declare-fun tp!7575 () Bool)

(declare-fun e!36044 () Bool)

(assert (=> mapNonEmpty!2657 (= mapRes!2657 (and tp!7575 e!36044))))

(declare-fun mapValue!2657 () ValueCell!821)

(declare-fun mapKey!2658 () (_ BitVec 32))

(declare-fun newMap!16 () LongMapFixedSize!550)

(declare-fun mapRest!2658 () (Array (_ BitVec 32) ValueCell!821))

(assert (=> mapNonEmpty!2657 (= (arr!1714 (_values!1972 newMap!16)) (store mapRest!2658 mapKey!2658 mapValue!2657))))

(declare-fun b!54982 () Bool)

(declare-fun e!36036 () Bool)

(assert (=> b!54982 (= e!36036 (not e!36034))))

(declare-fun res!31026 () Bool)

(assert (=> b!54982 (=> res!31026 e!36034)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54982 (= res!31026 (or (bvsge (size!1942 (_keys!3609 (v!2305 (underlying!194 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1942 (_keys!3609 (v!2305 (underlying!194 thiss!992))))) (bvsgt from!355 (size!1942 (_keys!3609 (v!2305 (underlying!194 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3581 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!54982 (arrayContainsKey!0 (_keys!3609 (v!2305 (underlying!194 thiss!992))) (select (arr!1713 (_keys!3609 (v!2305 (underlying!194 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1443 0))(
  ( (Unit!1444) )
))
(declare-fun lt!21804 () Unit!1443)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!11 (array!3581 array!3583 (_ BitVec 32) (_ BitVec 32) V!2753 V!2753 (_ BitVec 64) (_ BitVec 32) Int) Unit!1443)

(assert (=> b!54982 (= lt!21804 (lemmaListMapContainsThenArrayContainsFrom!11 (_keys!3609 (v!2305 (underlying!194 thiss!992))) (_values!1972 (v!2305 (underlying!194 thiss!992))) (mask!5842 (v!2305 (underlying!194 thiss!992))) (extraKeys!1880 (v!2305 (underlying!194 thiss!992))) (zeroValue!1907 (v!2305 (underlying!194 thiss!992))) (minValue!1907 (v!2305 (underlying!194 thiss!992))) (select (arr!1713 (_keys!3609 (v!2305 (underlying!194 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1989 (v!2305 (underlying!194 thiss!992)))))))

(declare-fun b!54983 () Bool)

(declare-fun e!36035 () Bool)

(assert (=> b!54983 (= e!36045 e!36035)))

(declare-fun b!54984 () Bool)

(declare-fun e!36047 () Bool)

(declare-fun tp_is_empty!2329 () Bool)

(assert (=> b!54984 (= e!36047 tp_is_empty!2329)))

(declare-fun mapIsEmpty!2657 () Bool)

(assert (=> mapIsEmpty!2657 mapRes!2657))

(declare-fun b!54985 () Bool)

(declare-fun res!31027 () Bool)

(declare-fun e!36033 () Bool)

(assert (=> b!54985 (=> (not res!31027) (not e!36033))))

(declare-fun valid!215 (LongMapFixedSize!550) Bool)

(assert (=> b!54985 (= res!31027 (valid!215 newMap!16))))

(declare-fun b!54986 () Bool)

(declare-fun res!31024 () Bool)

(assert (=> b!54986 (=> (not res!31024) (not e!36033))))

(assert (=> b!54986 (= res!31024 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1942 (_keys!3609 (v!2305 (underlying!194 thiss!992)))))))))

(declare-fun b!54987 () Bool)

(declare-fun e!36038 () Bool)

(declare-fun e!36043 () Bool)

(assert (=> b!54987 (= e!36038 (and e!36043 mapRes!2657))))

(declare-fun condMapEmpty!2657 () Bool)

(declare-fun mapDefault!2658 () ValueCell!821)

