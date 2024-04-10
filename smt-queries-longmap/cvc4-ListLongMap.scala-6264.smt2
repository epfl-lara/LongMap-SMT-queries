; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80064 () Bool)

(assert start!80064)

(declare-fun b!941283 () Bool)

(declare-fun b_free!17909 () Bool)

(declare-fun b_next!17909 () Bool)

(assert (=> b!941283 (= b_free!17909 (not b_next!17909))))

(declare-fun tp!62205 () Bool)

(declare-fun b_and!29321 () Bool)

(assert (=> b!941283 (= tp!62205 b_and!29321)))

(declare-fun res!632818 () Bool)

(declare-fun e!529172 () Bool)

(assert (=> start!80064 (=> (not res!632818) (not e!529172))))

(declare-datatypes ((V!32187 0))(
  ( (V!32188 (val!10259 Int)) )
))
(declare-datatypes ((ValueCell!9727 0))(
  ( (ValueCellFull!9727 (v!12790 V!32187)) (EmptyCell!9727) )
))
(declare-datatypes ((array!56784 0))(
  ( (array!56785 (arr!27326 (Array (_ BitVec 32) ValueCell!9727)) (size!27787 (_ BitVec 32))) )
))
(declare-datatypes ((array!56786 0))(
  ( (array!56787 (arr!27327 (Array (_ BitVec 32) (_ BitVec 64))) (size!27788 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4604 0))(
  ( (LongMapFixedSize!4605 (defaultEntry!5593 Int) (mask!27154 (_ BitVec 32)) (extraKeys!5325 (_ BitVec 32)) (zeroValue!5429 V!32187) (minValue!5429 V!32187) (_size!2357 (_ BitVec 32)) (_keys!10444 array!56786) (_values!5616 array!56784) (_vacant!2357 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4604)

(declare-fun valid!1763 (LongMapFixedSize!4604) Bool)

(assert (=> start!80064 (= res!632818 (valid!1763 thiss!1141))))

(assert (=> start!80064 e!529172))

(declare-fun e!529174 () Bool)

(assert (=> start!80064 e!529174))

(assert (=> start!80064 true))

(declare-fun b!941281 () Bool)

(declare-fun e!529173 () Bool)

(declare-fun tp_is_empty!20417 () Bool)

(assert (=> b!941281 (= e!529173 tp_is_empty!20417)))

(declare-fun b!941282 () Bool)

(declare-fun res!632815 () Bool)

(assert (=> b!941282 (=> (not res!632815) (not e!529172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941282 (= res!632815 (validMask!0 (mask!27154 thiss!1141)))))

(declare-fun e!529175 () Bool)

(declare-fun array_inv!21236 (array!56786) Bool)

(declare-fun array_inv!21237 (array!56784) Bool)

(assert (=> b!941283 (= e!529174 (and tp!62205 tp_is_empty!20417 (array_inv!21236 (_keys!10444 thiss!1141)) (array_inv!21237 (_values!5616 thiss!1141)) e!529175))))

(declare-fun b!941284 () Bool)

(declare-fun e!529176 () Bool)

(assert (=> b!941284 (= e!529176 tp_is_empty!20417)))

(declare-fun b!941285 () Bool)

(declare-fun res!632817 () Bool)

(assert (=> b!941285 (=> (not res!632817) (not e!529172))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9021 0))(
  ( (MissingZero!9021 (index!38455 (_ BitVec 32))) (Found!9021 (index!38456 (_ BitVec 32))) (Intermediate!9021 (undefined!9833 Bool) (index!38457 (_ BitVec 32)) (x!80762 (_ BitVec 32))) (Undefined!9021) (MissingVacant!9021 (index!38458 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56786 (_ BitVec 32)) SeekEntryResult!9021)

(assert (=> b!941285 (= res!632817 (not (is-Found!9021 (seekEntry!0 key!756 (_keys!10444 thiss!1141) (mask!27154 thiss!1141)))))))

(declare-fun b!941286 () Bool)

(assert (=> b!941286 (= e!529172 (not (= (size!27787 (_values!5616 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27154 thiss!1141)))))))

(declare-fun mapNonEmpty!32419 () Bool)

(declare-fun mapRes!32419 () Bool)

(declare-fun tp!62204 () Bool)

(assert (=> mapNonEmpty!32419 (= mapRes!32419 (and tp!62204 e!529176))))

(declare-fun mapValue!32419 () ValueCell!9727)

(declare-fun mapRest!32419 () (Array (_ BitVec 32) ValueCell!9727))

(declare-fun mapKey!32419 () (_ BitVec 32))

(assert (=> mapNonEmpty!32419 (= (arr!27326 (_values!5616 thiss!1141)) (store mapRest!32419 mapKey!32419 mapValue!32419))))

(declare-fun b!941287 () Bool)

(assert (=> b!941287 (= e!529175 (and e!529173 mapRes!32419))))

(declare-fun condMapEmpty!32419 () Bool)

(declare-fun mapDefault!32419 () ValueCell!9727)

