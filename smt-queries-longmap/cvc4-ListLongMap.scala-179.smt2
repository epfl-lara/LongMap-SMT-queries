; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3476 () Bool)

(assert start!3476)

(declare-fun b!22855 () Bool)

(declare-fun b_free!755 () Bool)

(declare-fun b_next!755 () Bool)

(assert (=> b!22855 (= b_free!755 (not b_next!755))))

(declare-fun tp!3509 () Bool)

(declare-fun b_and!1473 () Bool)

(assert (=> b!22855 (= tp!3509 b_and!1473)))

(declare-fun b!22850 () Bool)

(declare-fun e!14877 () Bool)

(declare-fun tp_is_empty!1019 () Bool)

(assert (=> b!22850 (= e!14877 tp_is_empty!1019)))

(declare-fun mapIsEmpty!1016 () Bool)

(declare-fun mapRes!1016 () Bool)

(assert (=> mapIsEmpty!1016 mapRes!1016))

(declare-fun c!2855 () Bool)

(declare-fun bm!1744 () Bool)

(declare-datatypes ((V!1183 0))(
  ( (V!1184 (val!536 Int)) )
))
(declare-datatypes ((ValueCell!310 0))(
  ( (ValueCellFull!310 (v!1598 V!1183)) (EmptyCell!310) )
))
(declare-datatypes ((array!1273 0))(
  ( (array!1274 (arr!603 (Array (_ BitVec 32) ValueCell!310)) (size!699 (_ BitVec 32))) )
))
(declare-datatypes ((array!1275 0))(
  ( (array!1276 (arr!604 (Array (_ BitVec 32) (_ BitVec 64))) (size!700 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!206 0))(
  ( (LongMapFixedSize!207 (defaultEntry!1740 Int) (mask!4724 (_ BitVec 32)) (extraKeys!1639 (_ BitVec 32)) (zeroValue!1664 V!1183) (minValue!1664 V!1183) (_size!147 (_ BitVec 32)) (_keys!3162 array!1275) (_values!1727 array!1273) (_vacant!147 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!946 0))(
  ( (tuple2!947 (_1!482 Bool) (_2!482 LongMapFixedSize!206)) )
))
(declare-fun call!1747 () tuple2!946)

(declare-fun c!2853 () Bool)

(declare-fun lt!7944 () LongMapFixedSize!206)

(declare-datatypes ((Cell!206 0))(
  ( (Cell!207 (v!1599 LongMapFixedSize!206)) )
))
(declare-datatypes ((LongMap!206 0))(
  ( (LongMap!207 (underlying!114 Cell!206)) )
))
(declare-fun thiss!938 () LongMap!206)

(declare-fun update!31 (LongMapFixedSize!206 (_ BitVec 64) V!1183) tuple2!946)

(assert (=> bm!1744 (= call!1747 (update!31 lt!7944 (ite (or c!2853 c!2855) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!2853 c!2855) (zeroValue!1664 (v!1599 (underlying!114 thiss!938))) (minValue!1664 (v!1599 (underlying!114 thiss!938))))))))

(declare-fun b!22851 () Bool)

(declare-fun e!14875 () Bool)

(assert (=> b!22851 (= e!14875 tp_is_empty!1019)))

(declare-fun bm!1745 () Bool)

(declare-fun call!1748 () tuple2!946)

(assert (=> bm!1745 (= call!1748 call!1747)))

(declare-fun b!22852 () Bool)

(declare-fun e!14870 () Bool)

(declare-fun e!14876 () Bool)

(assert (=> b!22852 (= e!14870 e!14876)))

(declare-fun b!22853 () Bool)

(declare-datatypes ((tuple2!948 0))(
  ( (tuple2!949 (_1!483 Bool) (_2!483 Cell!206)) )
))
(declare-fun e!14867 () tuple2!948)

(declare-fun lt!7942 () tuple2!946)

(declare-fun lt!7943 () tuple2!946)

(assert (=> b!22853 (= e!14867 (tuple2!949 (and (_1!482 lt!7942) (_1!482 lt!7943)) (Cell!207 (_2!482 lt!7943))))))

(assert (=> b!22853 (= lt!7942 call!1747)))

(assert (=> b!22853 (= lt!7943 (update!31 (_2!482 lt!7942) #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1664 (v!1599 (underlying!114 thiss!938)))))))

(declare-fun b!22854 () Bool)

(declare-fun c!2854 () Bool)

(declare-fun lt!7941 () Bool)

(assert (=> b!22854 (= c!2854 (and (not (= (bvand (extraKeys!1639 (v!1599 (underlying!114 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!7941))))

(declare-fun e!14878 () tuple2!948)

(declare-fun e!14873 () tuple2!948)

(assert (=> b!22854 (= e!14878 e!14873)))

(declare-fun e!14874 () Bool)

(declare-fun e!14869 () Bool)

(declare-fun array_inv!407 (array!1275) Bool)

(declare-fun array_inv!408 (array!1273) Bool)

(assert (=> b!22855 (= e!14869 (and tp!3509 tp_is_empty!1019 (array_inv!407 (_keys!3162 (v!1599 (underlying!114 thiss!938)))) (array_inv!408 (_values!1727 (v!1599 (underlying!114 thiss!938)))) e!14874))))

(declare-fun b!22856 () Bool)

(assert (=> b!22856 (= e!14867 e!14878)))

(assert (=> b!22856 (= c!2855 (and (not lt!7941) (= (bvand (extraKeys!1639 (v!1599 (underlying!114 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!22857 () Bool)

(assert (=> b!22857 (= e!14873 (tuple2!949 true (Cell!207 lt!7944)))))

(declare-fun b!22858 () Bool)

(declare-fun e!14868 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!22858 (= e!14868 (not (validMask!0 (mask!4724 (v!1599 (underlying!114 thiss!938))))))))

(declare-fun b!22859 () Bool)

(declare-fun e!14871 () Bool)

(assert (=> b!22859 (= e!14871 e!14868)))

(declare-fun res!14250 () Bool)

(assert (=> b!22859 (=> (not res!14250) (not e!14868))))

(assert (=> b!22859 (= res!14250 (_1!483 e!14867))))

(assert (=> b!22859 (= c!2853 (and (not lt!7941) (not (= (bvand (extraKeys!1639 (v!1599 (underlying!114 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!22859 (= lt!7941 (= (bvand (extraKeys!1639 (v!1599 (underlying!114 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!32 ((_ BitVec 32) Int) LongMapFixedSize!206)

(declare-fun computeNewMask!28 (LongMap!206 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!22859 (= lt!7944 (getNewLongMapFixedSize!32 (computeNewMask!28 thiss!938 (mask!4724 (v!1599 (underlying!114 thiss!938))) (_vacant!147 (v!1599 (underlying!114 thiss!938))) (_size!147 (v!1599 (underlying!114 thiss!938)))) (defaultEntry!1740 (v!1599 (underlying!114 thiss!938)))))))

(declare-fun b!22860 () Bool)

(assert (=> b!22860 (= e!14876 e!14869)))

(declare-fun mapNonEmpty!1016 () Bool)

(declare-fun tp!3508 () Bool)

(assert (=> mapNonEmpty!1016 (= mapRes!1016 (and tp!3508 e!14877))))

(declare-fun mapRest!1016 () (Array (_ BitVec 32) ValueCell!310))

(declare-fun mapKey!1016 () (_ BitVec 32))

(declare-fun mapValue!1016 () ValueCell!310)

(assert (=> mapNonEmpty!1016 (= (arr!603 (_values!1727 (v!1599 (underlying!114 thiss!938)))) (store mapRest!1016 mapKey!1016 mapValue!1016))))

(declare-fun b!22861 () Bool)

(assert (=> b!22861 (= e!14874 (and e!14875 mapRes!1016))))

(declare-fun condMapEmpty!1016 () Bool)

(declare-fun mapDefault!1016 () ValueCell!310)

