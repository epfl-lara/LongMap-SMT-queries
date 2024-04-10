; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2998 () Bool)

(assert start!2998)

(declare-fun b!17512 () Bool)

(declare-fun b_free!605 () Bool)

(declare-fun b_next!605 () Bool)

(assert (=> b!17512 (= b_free!605 (not b_next!605))))

(declare-fun tp!3006 () Bool)

(declare-fun b_and!1253 () Bool)

(assert (=> b!17512 (= tp!3006 b_and!1253)))

(declare-fun b!17506 () Bool)

(declare-fun res!12608 () Bool)

(declare-fun e!10993 () Bool)

(assert (=> b!17506 (=> (not res!12608) (not e!10993))))

(declare-datatypes ((V!983 0))(
  ( (V!984 (val!461 Int)) )
))
(declare-datatypes ((ValueCell!235 0))(
  ( (ValueCellFull!235 (v!1426 V!983)) (EmptyCell!235) )
))
(declare-datatypes ((array!943 0))(
  ( (array!944 (arr!453 (Array (_ BitVec 32) (_ BitVec 64))) (size!543 (_ BitVec 32))) )
))
(declare-datatypes ((array!945 0))(
  ( (array!946 (arr!454 (Array (_ BitVec 32) ValueCell!235)) (size!544 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!56 0))(
  ( (LongMapFixedSize!57 (defaultEntry!1639 Int) (mask!4556 (_ BitVec 32)) (extraKeys!1552 (_ BitVec 32)) (zeroValue!1575 V!983) (minValue!1575 V!983) (_size!60 (_ BitVec 32)) (_keys!3064 array!943) (_values!1636 array!945) (_vacant!60 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!742 0))(
  ( (tuple2!743 (_1!372 Bool) (_2!372 LongMapFixedSize!56)) )
))
(declare-fun lt!4557 () tuple2!742)

(assert (=> b!17506 (= res!12608 (_1!372 lt!4557))))

(declare-fun b!17507 () Bool)

(declare-datatypes ((Cell!56 0))(
  ( (Cell!57 (v!1427 LongMapFixedSize!56)) )
))
(declare-datatypes ((LongMap!56 0))(
  ( (LongMap!57 (underlying!39 Cell!56)) )
))
(declare-datatypes ((tuple2!744 0))(
  ( (tuple2!745 (_1!373 Bool) (_2!373 LongMap!56)) )
))
(declare-fun e!10992 () tuple2!744)

(declare-fun thiss!848 () LongMap!56)

(assert (=> b!17507 (= e!10992 (tuple2!745 true thiss!848))))

(declare-fun b!17508 () Bool)

(declare-fun e!10990 () Bool)

(declare-fun e!10996 () Bool)

(assert (=> b!17508 (= e!10990 e!10996)))

(declare-fun res!12609 () Bool)

(assert (=> b!17508 (=> (not res!12609) (not e!10996))))

(declare-fun lt!4556 () tuple2!744)

(assert (=> b!17508 (= res!12609 (_1!373 lt!4556))))

(assert (=> b!17508 (= lt!4556 e!10992)))

(declare-fun c!1756 () Bool)

(declare-fun imbalanced!12 (LongMap!56) Bool)

(assert (=> b!17508 (= c!1756 (imbalanced!12 thiss!848))))

(declare-fun b!17509 () Bool)

(assert (=> b!17509 (= e!10996 e!10993)))

(declare-fun res!12610 () Bool)

(assert (=> b!17509 (=> (not res!12610) (not e!10993))))

(declare-fun lt!4558 () LongMap!56)

(declare-fun valid!29 (LongMap!56) Bool)

(assert (=> b!17509 (= res!12610 (valid!29 lt!4558))))

(assert (=> b!17509 (= lt!4558 (LongMap!57 (Cell!57 (_2!372 lt!4557))))))

(declare-fun key!682 () (_ BitVec 64))

(declare-fun v!259 () V!983)

(declare-fun update!9 (LongMapFixedSize!56 (_ BitVec 64) V!983) tuple2!742)

(assert (=> b!17509 (= lt!4557 (update!9 (v!1427 (underlying!39 (_2!373 lt!4556))) key!682 v!259))))

(declare-fun b!17510 () Bool)

(declare-fun e!10988 () Bool)

(declare-fun e!10994 () Bool)

(declare-fun mapRes!738 () Bool)

(assert (=> b!17510 (= e!10988 (and e!10994 mapRes!738))))

(declare-fun condMapEmpty!738 () Bool)

(declare-fun mapDefault!738 () ValueCell!235)

