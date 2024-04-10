; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18074 () Bool)

(assert start!18074)

(declare-fun b!179992 () Bool)

(declare-fun b_free!4445 () Bool)

(declare-fun b_next!4445 () Bool)

(assert (=> b!179992 (= b_free!4445 (not b_next!4445))))

(declare-fun tp!16066 () Bool)

(declare-fun b_and!10979 () Bool)

(assert (=> b!179992 (= tp!16066 b_and!10979)))

(declare-fun e!118545 () Bool)

(declare-fun tp_is_empty!4217 () Bool)

(declare-datatypes ((V!5269 0))(
  ( (V!5270 (val!2153 Int)) )
))
(declare-datatypes ((ValueCell!1765 0))(
  ( (ValueCellFull!1765 (v!4042 V!5269)) (EmptyCell!1765) )
))
(declare-datatypes ((array!7603 0))(
  ( (array!7604 (arr!3601 (Array (_ BitVec 32) (_ BitVec 64))) (size!3909 (_ BitVec 32))) )
))
(declare-datatypes ((array!7605 0))(
  ( (array!7606 (arr!3602 (Array (_ BitVec 32) ValueCell!1765)) (size!3910 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2438 0))(
  ( (LongMapFixedSize!2439 (defaultEntry!3695 Int) (mask!8688 (_ BitVec 32)) (extraKeys!3432 (_ BitVec 32)) (zeroValue!3536 V!5269) (minValue!3536 V!5269) (_size!1268 (_ BitVec 32)) (_keys!5586 array!7603) (_values!3678 array!7605) (_vacant!1268 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2438)

(declare-fun e!118544 () Bool)

(declare-fun array_inv!2319 (array!7603) Bool)

(declare-fun array_inv!2320 (array!7605) Bool)

(assert (=> b!179992 (= e!118545 (and tp!16066 tp_is_empty!4217 (array_inv!2319 (_keys!5586 thiss!1248)) (array_inv!2320 (_values!3678 thiss!1248)) e!118544))))

(declare-fun b!179993 () Bool)

(declare-fun e!118546 () Bool)

(assert (=> b!179993 (= e!118546 false)))

(declare-datatypes ((tuple2!3346 0))(
  ( (tuple2!3347 (_1!1684 (_ BitVec 64)) (_2!1684 V!5269)) )
))
(declare-datatypes ((List!2287 0))(
  ( (Nil!2284) (Cons!2283 (h!2908 tuple2!3346) (t!7135 List!2287)) )
))
(declare-datatypes ((ListLongMap!2273 0))(
  ( (ListLongMap!2274 (toList!1152 List!2287)) )
))
(declare-fun lt!88870 () ListLongMap!2273)

(declare-fun map!1929 (LongMapFixedSize!2438) ListLongMap!2273)

(assert (=> b!179993 (= lt!88870 (map!1929 thiss!1248))))

(declare-datatypes ((Unit!5478 0))(
  ( (Unit!5479) )
))
(declare-fun lt!88869 () Unit!5478)

(declare-fun e!118549 () Unit!5478)

(assert (=> b!179993 (= lt!88869 e!118549)))

(declare-fun c!32246 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1228 (ListLongMap!2273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!804 (array!7603 array!7605 (_ BitVec 32) (_ BitVec 32) V!5269 V!5269 (_ BitVec 32) Int) ListLongMap!2273)

(assert (=> b!179993 (= c!32246 (contains!1228 (getCurrentListMap!804 (_keys!5586 thiss!1248) (_values!3678 thiss!1248) (mask!8688 thiss!1248) (extraKeys!3432 thiss!1248) (zeroValue!3536 thiss!1248) (minValue!3536 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3695 thiss!1248)) key!828))))

(declare-fun b!179994 () Bool)

(declare-fun res!85262 () Bool)

(assert (=> b!179994 (=> (not res!85262) (not e!118546))))

(declare-datatypes ((SeekEntryResult!588 0))(
  ( (MissingZero!588 (index!4520 (_ BitVec 32))) (Found!588 (index!4521 (_ BitVec 32))) (Intermediate!588 (undefined!1400 Bool) (index!4522 (_ BitVec 32)) (x!19670 (_ BitVec 32))) (Undefined!588) (MissingVacant!588 (index!4523 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7603 (_ BitVec 32)) SeekEntryResult!588)

(assert (=> b!179994 (= res!85262 (is-Undefined!588 (seekEntryOrOpen!0 key!828 (_keys!5586 thiss!1248) (mask!8688 thiss!1248))))))

(declare-fun b!179995 () Bool)

(declare-fun e!118543 () Bool)

(declare-fun mapRes!7219 () Bool)

(assert (=> b!179995 (= e!118544 (and e!118543 mapRes!7219))))

(declare-fun condMapEmpty!7219 () Bool)

(declare-fun mapDefault!7219 () ValueCell!1765)

