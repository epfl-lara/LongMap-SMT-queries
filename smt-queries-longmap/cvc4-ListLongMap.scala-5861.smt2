; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75700 () Bool)

(assert start!75700)

(declare-fun b!890049 () Bool)

(declare-fun b_free!15671 () Bool)

(declare-fun b_next!15671 () Bool)

(assert (=> b!890049 (= b_free!15671 (not b_next!15671))))

(declare-fun tp!54981 () Bool)

(declare-fun b_and!25911 () Bool)

(assert (=> b!890049 (= tp!54981 b_and!25911)))

(declare-fun e!496277 () Bool)

(declare-fun e!496272 () Bool)

(declare-datatypes ((array!51978 0))(
  ( (array!51979 (arr!24995 (Array (_ BitVec 32) (_ BitVec 64))) (size!25439 (_ BitVec 32))) )
))
(declare-datatypes ((V!28963 0))(
  ( (V!28964 (val!9050 Int)) )
))
(declare-datatypes ((ValueCell!8518 0))(
  ( (ValueCellFull!8518 (v!11528 V!28963)) (EmptyCell!8518) )
))
(declare-datatypes ((array!51980 0))(
  ( (array!51981 (arr!24996 (Array (_ BitVec 32) ValueCell!8518)) (size!25440 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4052 0))(
  ( (LongMapFixedSize!4053 (defaultEntry!5223 Int) (mask!25686 (_ BitVec 32)) (extraKeys!4917 (_ BitVec 32)) (zeroValue!5021 V!28963) (minValue!5021 V!28963) (_size!2081 (_ BitVec 32)) (_keys!9906 array!51978) (_values!5208 array!51980) (_vacant!2081 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4052)

(declare-fun tp_is_empty!17999 () Bool)

(declare-fun array_inv!19656 (array!51978) Bool)

(declare-fun array_inv!19657 (array!51980) Bool)

(assert (=> b!890049 (= e!496277 (and tp!54981 tp_is_empty!17999 (array_inv!19656 (_keys!9906 thiss!1181)) (array_inv!19657 (_values!5208 thiss!1181)) e!496272))))

(declare-fun b!890050 () Bool)

(declare-fun e!496276 () Bool)

(assert (=> b!890050 (= e!496276 tp_is_empty!17999)))

(declare-fun res!603115 () Bool)

(declare-fun e!496273 () Bool)

(assert (=> start!75700 (=> (not res!603115) (not e!496273))))

(declare-fun valid!1573 (LongMapFixedSize!4052) Bool)

(assert (=> start!75700 (= res!603115 (valid!1573 thiss!1181))))

(assert (=> start!75700 e!496273))

(assert (=> start!75700 e!496277))

(assert (=> start!75700 true))

(declare-fun mapNonEmpty!28553 () Bool)

(declare-fun mapRes!28553 () Bool)

(declare-fun tp!54982 () Bool)

(assert (=> mapNonEmpty!28553 (= mapRes!28553 (and tp!54982 e!496276))))

(declare-fun mapRest!28553 () (Array (_ BitVec 32) ValueCell!8518))

(declare-fun mapValue!28553 () ValueCell!8518)

(declare-fun mapKey!28553 () (_ BitVec 32))

(assert (=> mapNonEmpty!28553 (= (arr!24996 (_values!5208 thiss!1181)) (store mapRest!28553 mapKey!28553 mapValue!28553))))

(declare-fun b!890051 () Bool)

(declare-fun e!496275 () Bool)

(declare-datatypes ((SeekEntryResult!8789 0))(
  ( (MissingZero!8789 (index!37527 (_ BitVec 32))) (Found!8789 (index!37528 (_ BitVec 32))) (Intermediate!8789 (undefined!9601 Bool) (index!37529 (_ BitVec 32)) (x!75589 (_ BitVec 32))) (Undefined!8789) (MissingVacant!8789 (index!37530 (_ BitVec 32))) )
))
(declare-fun lt!402172 () SeekEntryResult!8789)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890051 (= e!496275 (inRange!0 (index!37528 lt!402172) (mask!25686 thiss!1181)))))

(declare-fun b!890052 () Bool)

(declare-fun res!603114 () Bool)

(assert (=> b!890052 (=> (not res!603114) (not e!496273))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890052 (= res!603114 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890053 () Bool)

(declare-fun e!496274 () Bool)

(assert (=> b!890053 (= e!496272 (and e!496274 mapRes!28553))))

(declare-fun condMapEmpty!28553 () Bool)

(declare-fun mapDefault!28553 () ValueCell!8518)

