; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80284 () Bool)

(assert start!80284)

(declare-fun b!943111 () Bool)

(declare-fun b_free!17983 () Bool)

(declare-fun b_next!17983 () Bool)

(assert (=> b!943111 (= b_free!17983 (not b_next!17983))))

(declare-fun tp!62454 () Bool)

(declare-fun b_and!29395 () Bool)

(assert (=> b!943111 (= tp!62454 b_and!29395)))

(declare-fun b!943102 () Bool)

(declare-fun e!530260 () Bool)

(assert (=> b!943102 (= e!530260 false)))

(declare-fun lt!425224 () Bool)

(declare-datatypes ((V!32287 0))(
  ( (V!32288 (val!10296 Int)) )
))
(declare-datatypes ((ValueCell!9764 0))(
  ( (ValueCellFull!9764 (v!12827 V!32287)) (EmptyCell!9764) )
))
(declare-datatypes ((array!56948 0))(
  ( (array!56949 (arr!27400 (Array (_ BitVec 32) ValueCell!9764)) (size!27865 (_ BitVec 32))) )
))
(declare-datatypes ((array!56950 0))(
  ( (array!56951 (arr!27401 (Array (_ BitVec 32) (_ BitVec 64))) (size!27866 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4678 0))(
  ( (LongMapFixedSize!4679 (defaultEntry!5630 Int) (mask!27252 (_ BitVec 32)) (extraKeys!5362 (_ BitVec 32)) (zeroValue!5466 V!32287) (minValue!5466 V!32287) (_size!2394 (_ BitVec 32)) (_keys!10504 array!56950) (_values!5653 array!56948) (_vacant!2394 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4678)

(declare-datatypes ((List!19239 0))(
  ( (Nil!19236) (Cons!19235 (h!20385 (_ BitVec 64)) (t!27554 List!19239)) )
))
(declare-fun arrayNoDuplicates!0 (array!56950 (_ BitVec 32) List!19239) Bool)

(assert (=> b!943102 (= lt!425224 (arrayNoDuplicates!0 (_keys!10504 thiss!1141) #b00000000000000000000000000000000 Nil!19236))))

(declare-fun b!943103 () Bool)

(declare-fun e!530258 () Bool)

(declare-fun tp_is_empty!20491 () Bool)

(assert (=> b!943103 (= e!530258 tp_is_empty!20491)))

(declare-fun b!943104 () Bool)

(declare-fun res!633711 () Bool)

(assert (=> b!943104 (=> (not res!633711) (not e!530260))))

(assert (=> b!943104 (= res!633711 (and (= (size!27865 (_values!5653 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27252 thiss!1141))) (= (size!27866 (_keys!10504 thiss!1141)) (size!27865 (_values!5653 thiss!1141))) (bvsge (mask!27252 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5362 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5362 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943105 () Bool)

(declare-fun res!633710 () Bool)

(assert (=> b!943105 (=> (not res!633710) (not e!530260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943105 (= res!633710 (validMask!0 (mask!27252 thiss!1141)))))

(declare-fun mapNonEmpty!32558 () Bool)

(declare-fun mapRes!32558 () Bool)

(declare-fun tp!62455 () Bool)

(assert (=> mapNonEmpty!32558 (= mapRes!32558 (and tp!62455 e!530258))))

(declare-fun mapRest!32558 () (Array (_ BitVec 32) ValueCell!9764))

(declare-fun mapKey!32558 () (_ BitVec 32))

(declare-fun mapValue!32558 () ValueCell!9764)

(assert (=> mapNonEmpty!32558 (= (arr!27400 (_values!5653 thiss!1141)) (store mapRest!32558 mapKey!32558 mapValue!32558))))

(declare-fun b!943107 () Bool)

(declare-fun res!633713 () Bool)

(assert (=> b!943107 (=> (not res!633713) (not e!530260))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!943107 (= res!633713 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943108 () Bool)

(declare-fun res!633714 () Bool)

(assert (=> b!943108 (=> (not res!633714) (not e!530260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56950 (_ BitVec 32)) Bool)

(assert (=> b!943108 (= res!633714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10504 thiss!1141) (mask!27252 thiss!1141)))))

(declare-fun b!943109 () Bool)

(declare-fun e!530259 () Bool)

(assert (=> b!943109 (= e!530259 tp_is_empty!20491)))

(declare-fun b!943110 () Bool)

(declare-fun e!530262 () Bool)

(assert (=> b!943110 (= e!530262 (and e!530259 mapRes!32558))))

(declare-fun condMapEmpty!32558 () Bool)

(declare-fun mapDefault!32558 () ValueCell!9764)

