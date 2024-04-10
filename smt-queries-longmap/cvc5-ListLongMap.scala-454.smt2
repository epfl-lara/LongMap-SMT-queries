; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8336 () Bool)

(assert start!8336)

(declare-fun b!55145 () Bool)

(declare-fun b_free!1837 () Bool)

(declare-fun b_next!1837 () Bool)

(assert (=> b!55145 (= b_free!1837 (not b_next!1837))))

(declare-fun tp!7613 () Bool)

(declare-fun b_and!3215 () Bool)

(assert (=> b!55145 (= tp!7613 b_and!3215)))

(declare-fun b!55149 () Bool)

(declare-fun b_free!1839 () Bool)

(declare-fun b_next!1839 () Bool)

(assert (=> b!55149 (= b_free!1839 (not b_next!1839))))

(declare-fun tp!7614 () Bool)

(declare-fun b_and!3217 () Bool)

(assert (=> b!55149 (= tp!7614 b_and!3217)))

(declare-fun b!55138 () Bool)

(declare-fun e!36185 () Bool)

(declare-fun tp_is_empty!2335 () Bool)

(assert (=> b!55138 (= e!36185 tp_is_empty!2335)))

(declare-fun b!55139 () Bool)

(declare-fun e!36181 () Bool)

(declare-fun e!36186 () Bool)

(assert (=> b!55139 (= e!36181 (not e!36186))))

(declare-fun res!31091 () Bool)

(assert (=> b!55139 (=> res!31091 e!36186)))

(declare-datatypes ((V!2761 0))(
  ( (V!2762 (val!1212 Int)) )
))
(declare-datatypes ((array!3593 0))(
  ( (array!3594 (arr!1719 (Array (_ BitVec 32) (_ BitVec 64))) (size!1948 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!824 0))(
  ( (ValueCellFull!824 (v!2310 V!2761)) (EmptyCell!824) )
))
(declare-datatypes ((array!3595 0))(
  ( (array!3596 (arr!1720 (Array (_ BitVec 32) ValueCell!824)) (size!1949 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!556 0))(
  ( (LongMapFixedSize!557 (defaultEntry!1992 Int) (mask!5847 (_ BitVec 32)) (extraKeys!1883 (_ BitVec 32)) (zeroValue!1910 V!2761) (minValue!1910 V!2761) (_size!327 (_ BitVec 32)) (_keys!3612 array!3593) (_values!1975 array!3595) (_vacant!327 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!372 0))(
  ( (Cell!373 (v!2311 LongMapFixedSize!556)) )
))
(declare-datatypes ((LongMap!372 0))(
  ( (LongMap!373 (underlying!197 Cell!372)) )
))
(declare-fun thiss!992 () LongMap!372)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!55139 (= res!31091 (or (bvsge (size!1948 (_keys!3612 (v!2311 (underlying!197 thiss!992)))) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (size!1948 (_keys!3612 (v!2311 (underlying!197 thiss!992))))) (bvsgt from!355 (size!1948 (_keys!3612 (v!2311 (underlying!197 thiss!992)))))))))

(declare-fun arrayContainsKey!0 (array!3593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55139 (arrayContainsKey!0 (_keys!3612 (v!2311 (underlying!197 thiss!992))) (select (arr!1719 (_keys!3612 (v!2311 (underlying!197 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-datatypes ((Unit!1447 0))(
  ( (Unit!1448) )
))
(declare-fun lt!21847 () Unit!1447)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!13 (array!3593 array!3595 (_ BitVec 32) (_ BitVec 32) V!2761 V!2761 (_ BitVec 64) (_ BitVec 32) Int) Unit!1447)

(assert (=> b!55139 (= lt!21847 (lemmaListMapContainsThenArrayContainsFrom!13 (_keys!3612 (v!2311 (underlying!197 thiss!992))) (_values!1975 (v!2311 (underlying!197 thiss!992))) (mask!5847 (v!2311 (underlying!197 thiss!992))) (extraKeys!1883 (v!2311 (underlying!197 thiss!992))) (zeroValue!1910 (v!2311 (underlying!197 thiss!992))) (minValue!1910 (v!2311 (underlying!197 thiss!992))) (select (arr!1719 (_keys!3612 (v!2311 (underlying!197 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1992 (v!2311 (underlying!197 thiss!992)))))))

(declare-fun b!55140 () Bool)

(declare-fun e!36184 () Bool)

(declare-fun e!36176 () Bool)

(declare-fun mapRes!2676 () Bool)

(assert (=> b!55140 (= e!36184 (and e!36176 mapRes!2676))))

(declare-fun condMapEmpty!2675 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!556)

(declare-fun mapDefault!2676 () ValueCell!824)

