; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90768 () Bool)

(assert start!90768)

(declare-fun b!1036909 () Bool)

(declare-fun b_free!20857 () Bool)

(declare-fun b_next!20857 () Bool)

(assert (=> b!1036909 (= b_free!20857 (not b_next!20857))))

(declare-fun tp!73699 () Bool)

(declare-fun b_and!33367 () Bool)

(assert (=> b!1036909 (= tp!73699 b_and!33367)))

(declare-fun mapNonEmpty!38376 () Bool)

(declare-fun mapRes!38376 () Bool)

(declare-fun tp!73698 () Bool)

(declare-fun e!586450 () Bool)

(assert (=> mapNonEmpty!38376 (= mapRes!38376 (and tp!73698 e!586450))))

(declare-datatypes ((V!37643 0))(
  ( (V!37644 (val!12339 Int)) )
))
(declare-datatypes ((ValueCell!11585 0))(
  ( (ValueCellFull!11585 (v!14915 V!37643)) (EmptyCell!11585) )
))
(declare-fun mapRest!38376 () (Array (_ BitVec 32) ValueCell!11585))

(declare-fun mapValue!38376 () ValueCell!11585)

(declare-fun mapKey!38376 () (_ BitVec 32))

(declare-datatypes ((array!65297 0))(
  ( (array!65298 (arr!31429 (Array (_ BitVec 32) (_ BitVec 64))) (size!31958 (_ BitVec 32))) )
))
(declare-datatypes ((array!65299 0))(
  ( (array!65300 (arr!31430 (Array (_ BitVec 32) ValueCell!11585)) (size!31959 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5764 0))(
  ( (LongMapFixedSize!5765 (defaultEntry!6260 Int) (mask!30211 (_ BitVec 32)) (extraKeys!5990 (_ BitVec 32)) (zeroValue!6094 V!37643) (minValue!6096 V!37643) (_size!2937 (_ BitVec 32)) (_keys!11485 array!65297) (_values!6283 array!65299) (_vacant!2937 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5764)

(assert (=> mapNonEmpty!38376 (= (arr!31430 (_values!6283 thiss!1427)) (store mapRest!38376 mapKey!38376 mapValue!38376))))

(declare-fun b!1036904 () Bool)

(declare-fun e!586449 () Bool)

(assert (=> b!1036904 (= e!586449 (and (= (size!31959 (_values!6283 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30211 thiss!1427))) (= (size!31958 (_keys!11485 thiss!1427)) (size!31959 (_values!6283 thiss!1427))) (bvsge (mask!30211 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5990 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5990 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (not (= (bvand (bvand (extraKeys!5990 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1036905 () Bool)

(declare-fun res!691932 () Bool)

(assert (=> b!1036905 (=> (not res!691932) (not e!586449))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036905 (= res!691932 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036906 () Bool)

(declare-fun res!691934 () Bool)

(assert (=> b!1036906 (=> (not res!691934) (not e!586449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1036906 (= res!691934 (validMask!0 (mask!30211 thiss!1427)))))

(declare-fun mapIsEmpty!38376 () Bool)

(assert (=> mapIsEmpty!38376 mapRes!38376))

(declare-fun b!1036907 () Bool)

(declare-fun tp_is_empty!24577 () Bool)

(assert (=> b!1036907 (= e!586450 tp_is_empty!24577)))

(declare-fun b!1036908 () Bool)

(declare-fun e!586446 () Bool)

(assert (=> b!1036908 (= e!586446 tp_is_empty!24577)))

(declare-fun res!691933 () Bool)

(assert (=> start!90768 (=> (not res!691933) (not e!586449))))

(declare-fun valid!2183 (LongMapFixedSize!5764) Bool)

(assert (=> start!90768 (= res!691933 (valid!2183 thiss!1427))))

(assert (=> start!90768 e!586449))

(declare-fun e!586448 () Bool)

(assert (=> start!90768 e!586448))

(assert (=> start!90768 true))

(declare-fun e!586447 () Bool)

(declare-fun array_inv!24321 (array!65297) Bool)

(declare-fun array_inv!24322 (array!65299) Bool)

(assert (=> b!1036909 (= e!586448 (and tp!73699 tp_is_empty!24577 (array_inv!24321 (_keys!11485 thiss!1427)) (array_inv!24322 (_values!6283 thiss!1427)) e!586447))))

(declare-fun b!1036910 () Bool)

(assert (=> b!1036910 (= e!586447 (and e!586446 mapRes!38376))))

(declare-fun condMapEmpty!38376 () Bool)

(declare-fun mapDefault!38376 () ValueCell!11585)

(assert (=> b!1036910 (= condMapEmpty!38376 (= (arr!31430 (_values!6283 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11585)) mapDefault!38376)))))

(assert (= (and start!90768 res!691933) b!1036905))

(assert (= (and b!1036905 res!691932) b!1036906))

(assert (= (and b!1036906 res!691934) b!1036904))

(assert (= (and b!1036910 condMapEmpty!38376) mapIsEmpty!38376))

(assert (= (and b!1036910 (not condMapEmpty!38376)) mapNonEmpty!38376))

(get-info :version)

(assert (= (and mapNonEmpty!38376 ((_ is ValueCellFull!11585) mapValue!38376)) b!1036907))

(assert (= (and b!1036910 ((_ is ValueCellFull!11585) mapDefault!38376)) b!1036908))

(assert (= b!1036909 b!1036910))

(assert (= start!90768 b!1036909))

(declare-fun m!957117 () Bool)

(assert (=> mapNonEmpty!38376 m!957117))

(declare-fun m!957119 () Bool)

(assert (=> b!1036906 m!957119))

(declare-fun m!957121 () Bool)

(assert (=> start!90768 m!957121))

(declare-fun m!957123 () Bool)

(assert (=> b!1036909 m!957123))

(declare-fun m!957125 () Bool)

(assert (=> b!1036909 m!957125))

(check-sat b_and!33367 (not start!90768) (not mapNonEmpty!38376) tp_is_empty!24577 (not b!1036906) (not b!1036909) (not b_next!20857))
(check-sat b_and!33367 (not b_next!20857))
