; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2986 () Bool)

(assert start!2986)

(declare-fun b!17299 () Bool)

(declare-fun b_free!593 () Bool)

(declare-fun b_next!593 () Bool)

(assert (=> b!17299 (= b_free!593 (not b_next!593))))

(declare-fun tp!2970 () Bool)

(declare-fun b_and!1241 () Bool)

(assert (=> b!17299 (= tp!2970 b_and!1241)))

(declare-fun b!17292 () Bool)

(declare-fun e!10792 () Bool)

(declare-fun tp_is_empty!857 () Bool)

(assert (=> b!17292 (= e!10792 tp_is_empty!857)))

(declare-fun b!17294 () Bool)

(declare-fun e!10791 () Bool)

(declare-fun e!10798 () Bool)

(assert (=> b!17294 (= e!10791 e!10798)))

(declare-fun res!12537 () Bool)

(assert (=> b!17294 (=> (not res!12537) (not e!10798))))

(declare-datatypes ((V!967 0))(
  ( (V!968 (val!455 Int)) )
))
(declare-datatypes ((ValueCell!229 0))(
  ( (ValueCellFull!229 (v!1414 V!967)) (EmptyCell!229) )
))
(declare-datatypes ((array!919 0))(
  ( (array!920 (arr!441 (Array (_ BitVec 32) ValueCell!229)) (size!531 (_ BitVec 32))) )
))
(declare-datatypes ((array!921 0))(
  ( (array!922 (arr!442 (Array (_ BitVec 32) (_ BitVec 64))) (size!532 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!44 0))(
  ( (LongMapFixedSize!45 (defaultEntry!1633 Int) (mask!4546 (_ BitVec 32)) (extraKeys!1546 (_ BitVec 32)) (zeroValue!1569 V!967) (minValue!1569 V!967) (_size!54 (_ BitVec 32)) (_keys!3058 array!921) (_values!1630 array!919) (_vacant!54 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!44 0))(
  ( (Cell!45 (v!1415 LongMapFixedSize!44)) )
))
(declare-datatypes ((LongMap!44 0))(
  ( (LongMap!45 (underlying!33 Cell!44)) )
))
(declare-datatypes ((tuple2!712 0))(
  ( (tuple2!713 (_1!357 Bool) (_2!357 LongMap!44)) )
))
(declare-fun lt!4485 () tuple2!712)

(assert (=> b!17294 (= res!12537 (_1!357 lt!4485))))

(declare-fun e!10793 () tuple2!712)

(assert (=> b!17294 (= lt!4485 e!10793)))

(declare-fun c!1738 () Bool)

(declare-fun thiss!848 () LongMap!44)

(declare-fun imbalanced!6 (LongMap!44) Bool)

(assert (=> b!17294 (= c!1738 (imbalanced!6 thiss!848))))

(declare-fun b!17295 () Bool)

(assert (=> b!17295 (= e!10793 (tuple2!713 true thiss!848))))

(declare-fun b!17296 () Bool)

(declare-fun e!10794 () Bool)

(declare-fun e!10790 () Bool)

(assert (=> b!17296 (= e!10794 e!10790)))

(declare-fun mapNonEmpty!720 () Bool)

(declare-fun mapRes!720 () Bool)

(declare-fun tp!2969 () Bool)

(assert (=> mapNonEmpty!720 (= mapRes!720 (and tp!2969 e!10792))))

(declare-fun mapKey!720 () (_ BitVec 32))

(declare-fun mapRest!720 () (Array (_ BitVec 32) ValueCell!229))

(declare-fun mapValue!720 () ValueCell!229)

(assert (=> mapNonEmpty!720 (= (arr!441 (_values!1630 (v!1415 (underlying!33 thiss!848)))) (store mapRest!720 mapKey!720 mapValue!720))))

(declare-fun res!12538 () Bool)

(assert (=> start!2986 (=> (not res!12538) (not e!10791))))

(declare-fun valid!23 (LongMap!44) Bool)

(assert (=> start!2986 (= res!12538 (valid!23 thiss!848))))

(assert (=> start!2986 e!10791))

(declare-fun e!10797 () Bool)

(assert (=> start!2986 e!10797))

(assert (=> start!2986 true))

(assert (=> start!2986 tp_is_empty!857))

(declare-fun b!17293 () Bool)

(declare-fun repack!3 (LongMap!44) tuple2!712)

(assert (=> b!17293 (= e!10793 (repack!3 thiss!848))))

(declare-fun b!17297 () Bool)

(assert (=> b!17297 (= e!10797 e!10794)))

(declare-fun mapIsEmpty!720 () Bool)

(assert (=> mapIsEmpty!720 mapRes!720))

(declare-fun b!17298 () Bool)

(declare-fun e!10796 () Bool)

(declare-fun e!10795 () Bool)

(assert (=> b!17298 (= e!10796 (and e!10795 mapRes!720))))

(declare-fun condMapEmpty!720 () Bool)

(declare-fun mapDefault!720 () ValueCell!229)

