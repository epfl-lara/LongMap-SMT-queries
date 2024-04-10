; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3340 () Bool)

(assert start!3340)

(declare-fun b!20962 () Bool)

(declare-fun b_free!727 () Bool)

(declare-fun b_next!727 () Bool)

(assert (=> b!20962 (= b_free!727 (not b_next!727))))

(declare-fun tp!3415 () Bool)

(declare-fun b_and!1411 () Bool)

(assert (=> b!20962 (= tp!3415 b_and!1411)))

(declare-fun res!13631 () Bool)

(declare-fun e!13684 () Bool)

(assert (=> start!3340 (=> (not res!13631) (not e!13684))))

(declare-datatypes ((V!1147 0))(
  ( (V!1148 (val!522 Int)) )
))
(declare-datatypes ((ValueCell!296 0))(
  ( (ValueCellFull!296 (v!1563 V!1147)) (EmptyCell!296) )
))
(declare-datatypes ((array!1211 0))(
  ( (array!1212 (arr!575 (Array (_ BitVec 32) ValueCell!296)) (size!668 (_ BitVec 32))) )
))
(declare-datatypes ((array!1213 0))(
  ( (array!1214 (arr!576 (Array (_ BitVec 32) (_ BitVec 64))) (size!669 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!178 0))(
  ( (LongMapFixedSize!179 (defaultEntry!1714 Int) (mask!4684 (_ BitVec 32)) (extraKeys!1618 (_ BitVec 32)) (zeroValue!1642 V!1147) (minValue!1642 V!1147) (_size!129 (_ BitVec 32)) (_keys!3136 array!1213) (_values!1704 array!1211) (_vacant!129 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!178 0))(
  ( (Cell!179 (v!1564 LongMapFixedSize!178)) )
))
(declare-datatypes ((LongMap!178 0))(
  ( (LongMap!179 (underlying!100 Cell!178)) )
))
(declare-fun thiss!938 () LongMap!178)

(declare-fun valid!89 (LongMap!178) Bool)

(assert (=> start!3340 (= res!13631 (valid!89 thiss!938))))

(assert (=> start!3340 e!13684))

(declare-fun e!13678 () Bool)

(assert (=> start!3340 e!13678))

(declare-fun b!20956 () Bool)

(declare-fun e!13680 () Bool)

(declare-fun e!13679 () Bool)

(assert (=> b!20956 (= e!13680 e!13679)))

(declare-fun b!20957 () Bool)

(declare-fun c!2361 () Bool)

(declare-fun lt!6408 () Bool)

(assert (=> b!20957 (= c!2361 (and (not (= (bvand (extraKeys!1618 (v!1564 (underlying!100 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!6408))))

(declare-datatypes ((tuple2!878 0))(
  ( (tuple2!879 (_1!442 Bool) (_2!442 Cell!178)) )
))
(declare-fun e!13676 () tuple2!878)

(declare-fun e!13683 () tuple2!878)

(assert (=> b!20957 (= e!13676 e!13683)))

(declare-fun b!20958 () Bool)

(declare-fun e!13687 () tuple2!878)

(declare-datatypes ((tuple2!880 0))(
  ( (tuple2!881 (_1!443 Bool) (_2!443 LongMapFixedSize!178)) )
))
(declare-fun lt!6410 () tuple2!880)

(declare-fun lt!6411 () tuple2!880)

(assert (=> b!20958 (= e!13687 (tuple2!879 (and (_1!443 lt!6410) (_1!443 lt!6411)) (Cell!179 (_2!443 lt!6411))))))

(declare-fun lt!6413 () LongMapFixedSize!178)

(declare-fun update!21 (LongMapFixedSize!178 (_ BitVec 64) V!1147) tuple2!880)

(assert (=> b!20958 (= lt!6410 (update!21 lt!6413 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1642 (v!1564 (underlying!100 thiss!938)))))))

(declare-fun call!1227 () tuple2!880)

(assert (=> b!20958 (= lt!6411 call!1227)))

(declare-fun b!20959 () Bool)

(assert (=> b!20959 (= e!13683 (tuple2!879 true (Cell!179 lt!6413)))))

(declare-fun b!20960 () Bool)

(assert (=> b!20960 (= e!13678 e!13680)))

(declare-fun b!20961 () Bool)

(declare-fun e!13686 () Bool)

(declare-fun lt!6409 () tuple2!878)

(assert (=> b!20961 (= e!13686 (bvslt (bvadd #b00000000000000000000000000000001 (mask!4684 (v!1564 (_2!442 lt!6409)))) (_size!129 (v!1564 (underlying!100 thiss!938)))))))

(declare-fun tp_is_empty!991 () Bool)

(declare-fun e!13681 () Bool)

(declare-fun array_inv!389 (array!1213) Bool)

(declare-fun array_inv!390 (array!1211) Bool)

(assert (=> b!20962 (= e!13679 (and tp!3415 tp_is_empty!991 (array_inv!389 (_keys!3136 (v!1564 (underlying!100 thiss!938)))) (array_inv!390 (_values!1704 (v!1564 (underlying!100 thiss!938)))) e!13681))))

(declare-fun b!20963 () Bool)

(declare-fun e!13677 () Bool)

(assert (=> b!20963 (= e!13677 tp_is_empty!991)))

(declare-fun mapNonEmpty!964 () Bool)

(declare-fun mapRes!964 () Bool)

(declare-fun tp!3414 () Bool)

(declare-fun e!13682 () Bool)

(assert (=> mapNonEmpty!964 (= mapRes!964 (and tp!3414 e!13682))))

(declare-fun mapValue!964 () ValueCell!296)

(declare-fun mapKey!964 () (_ BitVec 32))

(declare-fun mapRest!964 () (Array (_ BitVec 32) ValueCell!296))

(assert (=> mapNonEmpty!964 (= (arr!575 (_values!1704 (v!1564 (underlying!100 thiss!938)))) (store mapRest!964 mapKey!964 mapValue!964))))

(declare-fun b!20964 () Bool)

(assert (=> b!20964 (= e!13681 (and e!13677 mapRes!964))))

(declare-fun condMapEmpty!964 () Bool)

(declare-fun mapDefault!964 () ValueCell!296)

