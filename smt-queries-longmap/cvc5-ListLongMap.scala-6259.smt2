; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80020 () Bool)

(assert start!80020)

(declare-fun b!940810 () Bool)

(declare-fun b_free!17875 () Bool)

(declare-fun b_next!17875 () Bool)

(assert (=> b!940810 (= b_free!17875 (not b_next!17875))))

(declare-fun tp!62099 () Bool)

(declare-fun b_and!29287 () Bool)

(assert (=> b!940810 (= tp!62099 b_and!29287)))

(declare-fun b!940806 () Bool)

(declare-fun res!632573 () Bool)

(declare-fun e!528792 () Bool)

(assert (=> b!940806 (=> (not res!632573) (not e!528792))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!940806 (= res!632573 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940807 () Bool)

(declare-fun e!528796 () Bool)

(declare-fun tp_is_empty!20383 () Bool)

(assert (=> b!940807 (= e!528796 tp_is_empty!20383)))

(declare-fun b!940808 () Bool)

(declare-fun e!528790 () Bool)

(assert (=> b!940808 (= e!528790 tp_is_empty!20383)))

(declare-fun b!940809 () Bool)

(declare-fun e!528795 () Bool)

(declare-fun mapRes!32365 () Bool)

(assert (=> b!940809 (= e!528795 (and e!528790 mapRes!32365))))

(declare-fun condMapEmpty!32365 () Bool)

(declare-datatypes ((V!32143 0))(
  ( (V!32144 (val!10242 Int)) )
))
(declare-datatypes ((ValueCell!9710 0))(
  ( (ValueCellFull!9710 (v!12773 V!32143)) (EmptyCell!9710) )
))
(declare-datatypes ((array!56714 0))(
  ( (array!56715 (arr!27292 (Array (_ BitVec 32) ValueCell!9710)) (size!27753 (_ BitVec 32))) )
))
(declare-datatypes ((array!56716 0))(
  ( (array!56717 (arr!27293 (Array (_ BitVec 32) (_ BitVec 64))) (size!27754 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4570 0))(
  ( (LongMapFixedSize!4571 (defaultEntry!5576 Int) (mask!27125 (_ BitVec 32)) (extraKeys!5308 (_ BitVec 32)) (zeroValue!5412 V!32143) (minValue!5412 V!32143) (_size!2340 (_ BitVec 32)) (_keys!10426 array!56716) (_values!5599 array!56714) (_vacant!2340 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4570)

(declare-fun mapDefault!32365 () ValueCell!9710)

