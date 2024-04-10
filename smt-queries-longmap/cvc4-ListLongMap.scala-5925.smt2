; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77158 () Bool)

(assert start!77158)

(declare-fun b!900548 () Bool)

(declare-fun b_free!16055 () Bool)

(declare-fun b_next!16055 () Bool)

(assert (=> b!900548 (= b_free!16055 (not b_next!16055))))

(declare-fun tp!56255 () Bool)

(declare-fun b_and!26377 () Bool)

(assert (=> b!900548 (= tp!56255 b_and!26377)))

(declare-fun b!900539 () Bool)

(declare-fun e!504051 () Bool)

(declare-datatypes ((SeekEntryResult!8941 0))(
  ( (MissingZero!8941 (index!38135 (_ BitVec 32))) (Found!8941 (index!38136 (_ BitVec 32))) (Intermediate!8941 (undefined!9753 Bool) (index!38137 (_ BitVec 32)) (x!76728 (_ BitVec 32))) (Undefined!8941) (MissingVacant!8941 (index!38138 (_ BitVec 32))) )
))
(declare-fun lt!406905 () SeekEntryResult!8941)

(declare-datatypes ((array!52816 0))(
  ( (array!52817 (arr!25379 (Array (_ BitVec 32) (_ BitVec 64))) (size!25838 (_ BitVec 32))) )
))
(declare-datatypes ((V!29475 0))(
  ( (V!29476 (val!9242 Int)) )
))
(declare-datatypes ((ValueCell!8710 0))(
  ( (ValueCellFull!8710 (v!11739 V!29475)) (EmptyCell!8710) )
))
(declare-datatypes ((array!52818 0))(
  ( (array!52819 (arr!25380 (Array (_ BitVec 32) ValueCell!8710)) (size!25839 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4436 0))(
  ( (LongMapFixedSize!4437 (defaultEntry!5452 Int) (mask!26239 (_ BitVec 32)) (extraKeys!5178 (_ BitVec 32)) (zeroValue!5282 V!29475) (minValue!5282 V!29475) (_size!2273 (_ BitVec 32)) (_keys!10256 array!52816) (_values!5469 array!52818) (_vacant!2273 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4436)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900539 (= e!504051 (inRange!0 (index!38136 lt!406905) (mask!26239 thiss!1181)))))

(declare-fun b!900540 () Bool)

(declare-fun e!504055 () Bool)

(declare-datatypes ((List!17857 0))(
  ( (Nil!17854) (Cons!17853 (h!18999 (_ BitVec 64)) (t!25210 List!17857)) )
))
(declare-fun arrayNoDuplicates!0 (array!52816 (_ BitVec 32) List!17857) Bool)

(assert (=> b!900540 (= e!504055 (arrayNoDuplicates!0 (_keys!10256 thiss!1181) #b00000000000000000000000000000000 Nil!17854))))

(declare-fun b!900541 () Bool)

(declare-fun res!608143 () Bool)

(assert (=> b!900541 (=> res!608143 e!504055)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52816 (_ BitVec 32)) Bool)

(assert (=> b!900541 (= res!608143 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10256 thiss!1181) (mask!26239 thiss!1181))))))

(declare-fun b!900542 () Bool)

(declare-fun res!608142 () Bool)

(declare-fun e!504056 () Bool)

(assert (=> b!900542 (=> (not res!608142) (not e!504056))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!900542 (= res!608142 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!29251 () Bool)

(declare-fun mapRes!29251 () Bool)

(declare-fun tp!56256 () Bool)

(declare-fun e!504054 () Bool)

(assert (=> mapNonEmpty!29251 (= mapRes!29251 (and tp!56256 e!504054))))

(declare-fun mapRest!29251 () (Array (_ BitVec 32) ValueCell!8710))

(declare-fun mapKey!29251 () (_ BitVec 32))

(declare-fun mapValue!29251 () ValueCell!8710)

(assert (=> mapNonEmpty!29251 (= (arr!25380 (_values!5469 thiss!1181)) (store mapRest!29251 mapKey!29251 mapValue!29251))))

(declare-fun b!900543 () Bool)

(declare-fun e!504049 () Bool)

(declare-fun e!504057 () Bool)

(assert (=> b!900543 (= e!504049 (and e!504057 mapRes!29251))))

(declare-fun condMapEmpty!29251 () Bool)

(declare-fun mapDefault!29251 () ValueCell!8710)

