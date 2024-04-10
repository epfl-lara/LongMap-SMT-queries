; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3294 () Bool)

(assert start!3294)

(declare-fun b!20200 () Bool)

(declare-fun b_free!711 () Bool)

(declare-fun b_next!711 () Bool)

(assert (=> b!20200 (= b_free!711 (not b_next!711))))

(declare-fun tp!3361 () Bool)

(declare-fun b_and!1387 () Bool)

(assert (=> b!20200 (= tp!3361 b_and!1387)))

(declare-fun mapNonEmpty!934 () Bool)

(declare-fun mapRes!934 () Bool)

(declare-fun tp!3360 () Bool)

(declare-fun e!13193 () Bool)

(assert (=> mapNonEmpty!934 (= mapRes!934 (and tp!3360 e!13193))))

(declare-datatypes ((V!1125 0))(
  ( (V!1126 (val!514 Int)) )
))
(declare-datatypes ((ValueCell!288 0))(
  ( (ValueCellFull!288 (v!1545 V!1125)) (EmptyCell!288) )
))
(declare-fun mapRest!934 () (Array (_ BitVec 32) ValueCell!288))

(declare-datatypes ((array!1175 0))(
  ( (array!1176 (arr!559 (Array (_ BitVec 32) ValueCell!288)) (size!652 (_ BitVec 32))) )
))
(declare-datatypes ((array!1177 0))(
  ( (array!1178 (arr!560 (Array (_ BitVec 32) (_ BitVec 64))) (size!653 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!162 0))(
  ( (LongMapFixedSize!163 (defaultEntry!1704 Int) (mask!4666 (_ BitVec 32)) (extraKeys!1610 (_ BitVec 32)) (zeroValue!1634 V!1125) (minValue!1634 V!1125) (_size!119 (_ BitVec 32)) (_keys!3128 array!1177) (_values!1696 array!1175) (_vacant!119 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!162 0))(
  ( (Cell!163 (v!1546 LongMapFixedSize!162)) )
))
(declare-datatypes ((LongMap!162 0))(
  ( (LongMap!163 (underlying!92 Cell!162)) )
))
(declare-fun thiss!938 () LongMap!162)

(declare-fun mapValue!934 () ValueCell!288)

(declare-fun mapKey!934 () (_ BitVec 32))

(assert (=> mapNonEmpty!934 (= (arr!559 (_values!1696 (v!1546 (underlying!92 thiss!938)))) (store mapRest!934 mapKey!934 mapValue!934))))

(declare-fun b!20196 () Bool)

(declare-fun tp_is_empty!975 () Bool)

(assert (=> b!20196 (= e!13193 tp_is_empty!975)))

(declare-fun b!20197 () Bool)

(declare-datatypes ((tuple2!842 0))(
  ( (tuple2!843 (_1!424 Bool) (_2!424 LongMapFixedSize!162)) )
))
(declare-fun lt!5883 () tuple2!842)

(declare-fun call!988 () tuple2!842)

(assert (=> b!20197 (= lt!5883 call!988)))

(declare-datatypes ((tuple2!844 0))(
  ( (tuple2!845 (_1!425 Bool) (_2!425 Cell!162)) )
))
(declare-fun e!13184 () tuple2!844)

(assert (=> b!20197 (= e!13184 (tuple2!845 (_1!424 lt!5883) (Cell!163 (_2!424 lt!5883))))))

(declare-fun b!20198 () Bool)

(declare-fun e!13190 () tuple2!844)

(assert (=> b!20198 (= e!13190 e!13184)))

(declare-fun c!2171 () Bool)

(declare-fun lt!5888 () Bool)

(assert (=> b!20198 (= c!2171 (and (not lt!5888) (= (bvand (extraKeys!1610 (v!1546 (underlying!92 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!984 () Bool)

(declare-fun call!987 () tuple2!842)

(assert (=> bm!984 (= call!988 call!987)))

(declare-fun b!20199 () Bool)

(declare-fun e!13187 () Bool)

(declare-fun e!13185 () Bool)

(assert (=> b!20199 (= e!13187 e!13185)))

(declare-fun e!13192 () Bool)

(declare-fun array_inv!379 (array!1177) Bool)

(declare-fun array_inv!380 (array!1175) Bool)

(assert (=> b!20200 (= e!13185 (and tp!3361 tp_is_empty!975 (array_inv!379 (_keys!3128 (v!1546 (underlying!92 thiss!938)))) (array_inv!380 (_values!1696 (v!1546 (underlying!92 thiss!938)))) e!13192))))

(declare-fun mapIsEmpty!934 () Bool)

(assert (=> mapIsEmpty!934 mapRes!934))

(declare-fun b!20201 () Bool)

(declare-fun e!13191 () Bool)

(assert (=> b!20201 (= e!13192 (and e!13191 mapRes!934))))

(declare-fun condMapEmpty!934 () Bool)

(declare-fun mapDefault!934 () ValueCell!288)

(assert (=> b!20201 (= condMapEmpty!934 (= (arr!559 (_values!1696 (v!1546 (underlying!92 thiss!938)))) ((as const (Array (_ BitVec 32) ValueCell!288)) mapDefault!934)))))

(declare-fun b!20202 () Bool)

(declare-fun e!13189 () tuple2!844)

(declare-fun lt!5886 () LongMapFixedSize!162)

(assert (=> b!20202 (= e!13189 (tuple2!845 true (Cell!163 lt!5886)))))

(declare-fun b!20203 () Bool)

(declare-fun lt!5885 () tuple2!842)

(assert (=> b!20203 (= e!13189 (tuple2!845 (_1!424 lt!5885) (Cell!163 (_2!424 lt!5885))))))

(assert (=> b!20203 (= lt!5885 call!988)))

(declare-fun b!20204 () Bool)

(declare-fun e!13186 () Bool)

(assert (=> b!20204 (= e!13186 false)))

(declare-fun lt!5889 () tuple2!844)

(assert (=> b!20204 (= lt!5889 e!13190)))

(declare-fun c!2172 () Bool)

(assert (=> b!20204 (= c!2172 (and (not lt!5888) (not (= (bvand (extraKeys!1610 (v!1546 (underlying!92 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!20204 (= lt!5888 (= (bvand (extraKeys!1610 (v!1546 (underlying!92 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun getNewLongMapFixedSize!20 ((_ BitVec 32) Int) LongMapFixedSize!162)

(declare-fun computeNewMask!16 (LongMap!162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20204 (= lt!5886 (getNewLongMapFixedSize!20 (computeNewMask!16 thiss!938 (mask!4666 (v!1546 (underlying!92 thiss!938))) (_vacant!119 (v!1546 (underlying!92 thiss!938))) (_size!119 (v!1546 (underlying!92 thiss!938)))) (defaultEntry!1704 (v!1546 (underlying!92 thiss!938)))))))

(declare-fun b!20205 () Bool)

(assert (=> b!20205 (= e!13191 tp_is_empty!975)))

(declare-fun res!13411 () Bool)

(assert (=> start!3294 (=> (not res!13411) (not e!13186))))

(declare-fun valid!80 (LongMap!162) Bool)

(assert (=> start!3294 (= res!13411 (valid!80 thiss!938))))

(assert (=> start!3294 e!13186))

(declare-fun e!13188 () Bool)

(assert (=> start!3294 e!13188))

(declare-fun bm!985 () Bool)

(declare-fun lt!5887 () tuple2!842)

(declare-fun update!16 (LongMapFixedSize!162 (_ BitVec 64) V!1125) tuple2!842)

(assert (=> bm!985 (= call!987 (update!16 (ite c!2172 (_2!424 lt!5887) lt!5886) (ite c!2172 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!2171 #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000)) (ite c!2172 (minValue!1634 (v!1546 (underlying!92 thiss!938))) (ite c!2171 (zeroValue!1634 (v!1546 (underlying!92 thiss!938))) (minValue!1634 (v!1546 (underlying!92 thiss!938)))))))))

(declare-fun b!20206 () Bool)

(declare-fun lt!5884 () tuple2!842)

(assert (=> b!20206 (= e!13190 (tuple2!845 (and (_1!424 lt!5887) (_1!424 lt!5884)) (Cell!163 (_2!424 lt!5884))))))

(assert (=> b!20206 (= lt!5887 (update!16 lt!5886 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1634 (v!1546 (underlying!92 thiss!938)))))))

(assert (=> b!20206 (= lt!5884 call!987)))

(declare-fun b!20207 () Bool)

(assert (=> b!20207 (= e!13188 e!13187)))

(declare-fun b!20208 () Bool)

(declare-fun c!2170 () Bool)

(assert (=> b!20208 (= c!2170 (and (not (= (bvand (extraKeys!1610 (v!1546 (underlying!92 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!5888))))

(assert (=> b!20208 (= e!13184 e!13189)))

(assert (= (and start!3294 res!13411) b!20204))

(assert (= (and b!20204 c!2172) b!20206))

(assert (= (and b!20204 (not c!2172)) b!20198))

(assert (= (and b!20198 c!2171) b!20197))

(assert (= (and b!20198 (not c!2171)) b!20208))

(assert (= (and b!20208 c!2170) b!20203))

(assert (= (and b!20208 (not c!2170)) b!20202))

(assert (= (or b!20197 b!20203) bm!984))

(assert (= (or b!20206 bm!984) bm!985))

(assert (= (and b!20201 condMapEmpty!934) mapIsEmpty!934))

(assert (= (and b!20201 (not condMapEmpty!934)) mapNonEmpty!934))

(get-info :version)

(assert (= (and mapNonEmpty!934 ((_ is ValueCellFull!288) mapValue!934)) b!20196))

(assert (= (and b!20201 ((_ is ValueCellFull!288) mapDefault!934)) b!20205))

(assert (= b!20200 b!20201))

(assert (= b!20199 b!20200))

(assert (= b!20207 b!20199))

(assert (= start!3294 b!20207))

(declare-fun m!14195 () Bool)

(assert (=> b!20200 m!14195))

(declare-fun m!14197 () Bool)

(assert (=> b!20200 m!14197))

(declare-fun m!14199 () Bool)

(assert (=> bm!985 m!14199))

(declare-fun m!14201 () Bool)

(assert (=> b!20204 m!14201))

(assert (=> b!20204 m!14201))

(declare-fun m!14203 () Bool)

(assert (=> b!20204 m!14203))

(declare-fun m!14205 () Bool)

(assert (=> b!20206 m!14205))

(declare-fun m!14207 () Bool)

(assert (=> start!3294 m!14207))

(declare-fun m!14209 () Bool)

(assert (=> mapNonEmpty!934 m!14209))

(check-sat (not mapNonEmpty!934) (not b_next!711) (not bm!985) b_and!1387 (not start!3294) tp_is_empty!975 (not b!20204) (not b!20200) (not b!20206))
(check-sat b_and!1387 (not b_next!711))
