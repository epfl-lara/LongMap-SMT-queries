; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15732 () Bool)

(assert start!15732)

(declare-fun b!156996 () Bool)

(declare-fun b_free!3399 () Bool)

(declare-fun b_next!3399 () Bool)

(assert (=> b!156996 (= b_free!3399 (not b_next!3399))))

(declare-fun tp!12721 () Bool)

(declare-fun b_and!9813 () Bool)

(assert (=> b!156996 (= tp!12721 b_and!9813)))

(declare-fun b!156993 () Bool)

(declare-fun res!74225 () Bool)

(declare-fun e!102683 () Bool)

(assert (=> b!156993 (=> (not res!74225) (not e!102683))))

(declare-datatypes ((V!3915 0))(
  ( (V!3916 (val!1645 Int)) )
))
(declare-datatypes ((ValueCell!1257 0))(
  ( (ValueCellFull!1257 (v!3510 V!3915)) (EmptyCell!1257) )
))
(declare-datatypes ((array!5455 0))(
  ( (array!5456 (arr!2585 (Array (_ BitVec 32) (_ BitVec 64))) (size!2863 (_ BitVec 32))) )
))
(declare-datatypes ((array!5457 0))(
  ( (array!5458 (arr!2586 (Array (_ BitVec 32) ValueCell!1257)) (size!2864 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1422 0))(
  ( (LongMapFixedSize!1423 (defaultEntry!3153 Int) (mask!7618 (_ BitVec 32)) (extraKeys!2894 (_ BitVec 32)) (zeroValue!2996 V!3915) (minValue!2996 V!3915) (_size!760 (_ BitVec 32)) (_keys!4928 array!5455) (_values!3136 array!5457) (_vacant!760 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1422)

(assert (=> b!156993 (= res!74225 (and (= (size!2864 (_values!3136 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7618 thiss!1248))) (= (size!2863 (_keys!4928 thiss!1248)) (size!2864 (_values!3136 thiss!1248))) (bvsge (mask!7618 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2894 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2894 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2894 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2894 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2894 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2894 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2894 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5444 () Bool)

(declare-fun mapRes!5444 () Bool)

(assert (=> mapIsEmpty!5444 mapRes!5444))

(declare-fun b!156994 () Bool)

(declare-fun e!102685 () Bool)

(declare-fun e!102682 () Bool)

(assert (=> b!156994 (= e!102685 (and e!102682 mapRes!5444))))

(declare-fun condMapEmpty!5444 () Bool)

(declare-fun mapDefault!5444 () ValueCell!1257)

(assert (=> b!156994 (= condMapEmpty!5444 (= (arr!2586 (_values!3136 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1257)) mapDefault!5444)))))

(declare-fun b!156995 () Bool)

(declare-fun e!102684 () Bool)

(declare-fun tp_is_empty!3201 () Bool)

(assert (=> b!156995 (= e!102684 tp_is_empty!3201)))

(declare-fun e!102687 () Bool)

(declare-fun array_inv!1633 (array!5455) Bool)

(declare-fun array_inv!1634 (array!5457) Bool)

(assert (=> b!156996 (= e!102687 (and tp!12721 tp_is_empty!3201 (array_inv!1633 (_keys!4928 thiss!1248)) (array_inv!1634 (_values!3136 thiss!1248)) e!102685))))

(declare-fun b!156998 () Bool)

(declare-fun res!74224 () Bool)

(assert (=> b!156998 (=> (not res!74224) (not e!102683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156998 (= res!74224 (validMask!0 (mask!7618 thiss!1248)))))

(declare-fun mapNonEmpty!5444 () Bool)

(declare-fun tp!12722 () Bool)

(assert (=> mapNonEmpty!5444 (= mapRes!5444 (and tp!12722 e!102684))))

(declare-fun mapKey!5444 () (_ BitVec 32))

(declare-fun mapRest!5444 () (Array (_ BitVec 32) ValueCell!1257))

(declare-fun mapValue!5444 () ValueCell!1257)

(assert (=> mapNonEmpty!5444 (= (arr!2586 (_values!3136 thiss!1248)) (store mapRest!5444 mapKey!5444 mapValue!5444))))

(declare-fun b!156999 () Bool)

(assert (=> b!156999 (= e!102683 false)))

(declare-fun lt!81613 () Bool)

(declare-datatypes ((List!1867 0))(
  ( (Nil!1864) (Cons!1863 (h!2472 (_ BitVec 64)) (t!6669 List!1867)) )
))
(declare-fun arrayNoDuplicates!0 (array!5455 (_ BitVec 32) List!1867) Bool)

(assert (=> b!156999 (= lt!81613 (arrayNoDuplicates!0 (_keys!4928 thiss!1248) #b00000000000000000000000000000000 Nil!1864))))

(declare-fun b!157000 () Bool)

(declare-fun res!74223 () Bool)

(assert (=> b!157000 (=> (not res!74223) (not e!102683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5455 (_ BitVec 32)) Bool)

(assert (=> b!157000 (= res!74223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4928 thiss!1248) (mask!7618 thiss!1248)))))

(declare-fun b!157001 () Bool)

(declare-fun res!74226 () Bool)

(assert (=> b!157001 (=> (not res!74226) (not e!102683))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!157001 (= res!74226 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!74227 () Bool)

(assert (=> start!15732 (=> (not res!74227) (not e!102683))))

(declare-fun valid!677 (LongMapFixedSize!1422) Bool)

(assert (=> start!15732 (= res!74227 (valid!677 thiss!1248))))

(assert (=> start!15732 e!102683))

(assert (=> start!15732 e!102687))

(assert (=> start!15732 true))

(declare-fun b!156997 () Bool)

(assert (=> b!156997 (= e!102682 tp_is_empty!3201)))

(assert (= (and start!15732 res!74227) b!157001))

(assert (= (and b!157001 res!74226) b!156998))

(assert (= (and b!156998 res!74224) b!156993))

(assert (= (and b!156993 res!74225) b!157000))

(assert (= (and b!157000 res!74223) b!156999))

(assert (= (and b!156994 condMapEmpty!5444) mapIsEmpty!5444))

(assert (= (and b!156994 (not condMapEmpty!5444)) mapNonEmpty!5444))

(get-info :version)

(assert (= (and mapNonEmpty!5444 ((_ is ValueCellFull!1257) mapValue!5444)) b!156995))

(assert (= (and b!156994 ((_ is ValueCellFull!1257) mapDefault!5444)) b!156997))

(assert (= b!156996 b!156994))

(assert (= start!15732 b!156996))

(declare-fun m!190289 () Bool)

(assert (=> b!156998 m!190289))

(declare-fun m!190291 () Bool)

(assert (=> start!15732 m!190291))

(declare-fun m!190293 () Bool)

(assert (=> mapNonEmpty!5444 m!190293))

(declare-fun m!190295 () Bool)

(assert (=> b!157000 m!190295))

(declare-fun m!190297 () Bool)

(assert (=> b!156999 m!190297))

(declare-fun m!190299 () Bool)

(assert (=> b!156996 m!190299))

(declare-fun m!190301 () Bool)

(assert (=> b!156996 m!190301))

(check-sat (not b!156998) (not start!15732) (not b_next!3399) (not b!156999) tp_is_empty!3201 (not b!157000) (not b!156996) (not mapNonEmpty!5444) b_and!9813)
(check-sat b_and!9813 (not b_next!3399))
