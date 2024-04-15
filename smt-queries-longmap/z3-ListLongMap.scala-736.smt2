; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17172 () Bool)

(assert start!17172)

(declare-fun b!172297 () Bool)

(declare-fun b_free!4255 () Bool)

(declare-fun b_next!4255 () Bool)

(assert (=> b!172297 (= b_free!4255 (not b_next!4255))))

(declare-fun tp!15412 () Bool)

(declare-fun b_and!10669 () Bool)

(assert (=> b!172297 (= tp!15412 b_and!10669)))

(declare-fun res!81785 () Bool)

(declare-fun e!113726 () Bool)

(assert (=> start!17172 (=> (not res!81785) (not e!113726))))

(declare-datatypes ((V!5017 0))(
  ( (V!5018 (val!2058 Int)) )
))
(declare-datatypes ((ValueCell!1670 0))(
  ( (ValueCellFull!1670 (v!3920 V!5017)) (EmptyCell!1670) )
))
(declare-datatypes ((array!7155 0))(
  ( (array!7156 (arr!3400 (Array (_ BitVec 32) (_ BitVec 64))) (size!3698 (_ BitVec 32))) )
))
(declare-datatypes ((array!7157 0))(
  ( (array!7158 (arr!3401 (Array (_ BitVec 32) ValueCell!1670)) (size!3699 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2248 0))(
  ( (LongMapFixedSize!2249 (defaultEntry!3570 Int) (mask!8414 (_ BitVec 32)) (extraKeys!3309 (_ BitVec 32)) (zeroValue!3411 V!5017) (minValue!3413 V!5017) (_size!1173 (_ BitVec 32)) (_keys!5406 array!7155) (_values!3553 array!7157) (_vacant!1173 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2248)

(declare-fun valid!974 (LongMapFixedSize!2248) Bool)

(assert (=> start!17172 (= res!81785 (valid!974 thiss!1248))))

(assert (=> start!17172 e!113726))

(declare-fun e!113722 () Bool)

(assert (=> start!17172 e!113722))

(assert (=> start!17172 true))

(declare-fun b!172292 () Bool)

(declare-fun e!113723 () Bool)

(declare-fun tp_is_empty!4027 () Bool)

(assert (=> b!172292 (= e!113723 tp_is_empty!4027)))

(declare-fun b!172293 () Bool)

(declare-fun res!81787 () Bool)

(assert (=> b!172293 (=> (not res!81787) (not e!113726))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172293 (= res!81787 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!6850 () Bool)

(declare-fun mapRes!6850 () Bool)

(declare-fun tp!15411 () Bool)

(declare-fun e!113724 () Bool)

(assert (=> mapNonEmpty!6850 (= mapRes!6850 (and tp!15411 e!113724))))

(declare-fun mapValue!6850 () ValueCell!1670)

(declare-fun mapRest!6850 () (Array (_ BitVec 32) ValueCell!1670))

(declare-fun mapKey!6850 () (_ BitVec 32))

(assert (=> mapNonEmpty!6850 (= (arr!3401 (_values!3553 thiss!1248)) (store mapRest!6850 mapKey!6850 mapValue!6850))))

(declare-fun mapIsEmpty!6850 () Bool)

(assert (=> mapIsEmpty!6850 mapRes!6850))

(declare-fun b!172294 () Bool)

(assert (=> b!172294 (= e!113726 (and (= (size!3699 (_values!3553 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8414 thiss!1248))) (= (size!3698 (_keys!5406 thiss!1248)) (size!3699 (_values!3553 thiss!1248))) (bvslt (mask!8414 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!172295 () Bool)

(declare-fun e!113725 () Bool)

(assert (=> b!172295 (= e!113725 (and e!113723 mapRes!6850))))

(declare-fun condMapEmpty!6850 () Bool)

(declare-fun mapDefault!6850 () ValueCell!1670)

(assert (=> b!172295 (= condMapEmpty!6850 (= (arr!3401 (_values!3553 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1670)) mapDefault!6850)))))

(declare-fun b!172296 () Bool)

(declare-fun res!81786 () Bool)

(assert (=> b!172296 (=> (not res!81786) (not e!113726))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172296 (= res!81786 (validMask!0 (mask!8414 thiss!1248)))))

(declare-fun array_inv!2191 (array!7155) Bool)

(declare-fun array_inv!2192 (array!7157) Bool)

(assert (=> b!172297 (= e!113722 (and tp!15412 tp_is_empty!4027 (array_inv!2191 (_keys!5406 thiss!1248)) (array_inv!2192 (_values!3553 thiss!1248)) e!113725))))

(declare-fun b!172298 () Bool)

(assert (=> b!172298 (= e!113724 tp_is_empty!4027)))

(assert (= (and start!17172 res!81785) b!172293))

(assert (= (and b!172293 res!81787) b!172296))

(assert (= (and b!172296 res!81786) b!172294))

(assert (= (and b!172295 condMapEmpty!6850) mapIsEmpty!6850))

(assert (= (and b!172295 (not condMapEmpty!6850)) mapNonEmpty!6850))

(get-info :version)

(assert (= (and mapNonEmpty!6850 ((_ is ValueCellFull!1670) mapValue!6850)) b!172298))

(assert (= (and b!172295 ((_ is ValueCellFull!1670) mapDefault!6850)) b!172292))

(assert (= b!172297 b!172295))

(assert (= start!17172 b!172297))

(declare-fun m!200609 () Bool)

(assert (=> start!17172 m!200609))

(declare-fun m!200611 () Bool)

(assert (=> mapNonEmpty!6850 m!200611))

(declare-fun m!200613 () Bool)

(assert (=> b!172296 m!200613))

(declare-fun m!200615 () Bool)

(assert (=> b!172297 m!200615))

(declare-fun m!200617 () Bool)

(assert (=> b!172297 m!200617))

(check-sat (not b!172297) (not b!172296) (not mapNonEmpty!6850) (not start!17172) tp_is_empty!4027 b_and!10669 (not b_next!4255))
(check-sat b_and!10669 (not b_next!4255))
(get-model)

(declare-fun d!52361 () Bool)

(declare-fun res!81812 () Bool)

(declare-fun e!113765 () Bool)

(assert (=> d!52361 (=> (not res!81812) (not e!113765))))

(declare-fun simpleValid!139 (LongMapFixedSize!2248) Bool)

(assert (=> d!52361 (= res!81812 (simpleValid!139 thiss!1248))))

(assert (=> d!52361 (= (valid!974 thiss!1248) e!113765)))

(declare-fun b!172347 () Bool)

(declare-fun res!81813 () Bool)

(assert (=> b!172347 (=> (not res!81813) (not e!113765))))

(declare-fun arrayCountValidKeys!0 (array!7155 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!172347 (= res!81813 (= (arrayCountValidKeys!0 (_keys!5406 thiss!1248) #b00000000000000000000000000000000 (size!3698 (_keys!5406 thiss!1248))) (_size!1173 thiss!1248)))))

(declare-fun b!172348 () Bool)

(declare-fun res!81814 () Bool)

(assert (=> b!172348 (=> (not res!81814) (not e!113765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7155 (_ BitVec 32)) Bool)

(assert (=> b!172348 (= res!81814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5406 thiss!1248) (mask!8414 thiss!1248)))))

(declare-fun b!172349 () Bool)

(declare-datatypes ((List!2209 0))(
  ( (Nil!2206) (Cons!2205 (h!2822 (_ BitVec 64)) (t!7007 List!2209)) )
))
(declare-fun arrayNoDuplicates!0 (array!7155 (_ BitVec 32) List!2209) Bool)

(assert (=> b!172349 (= e!113765 (arrayNoDuplicates!0 (_keys!5406 thiss!1248) #b00000000000000000000000000000000 Nil!2206))))

(assert (= (and d!52361 res!81812) b!172347))

(assert (= (and b!172347 res!81813) b!172348))

(assert (= (and b!172348 res!81814) b!172349))

(declare-fun m!200639 () Bool)

(assert (=> d!52361 m!200639))

(declare-fun m!200641 () Bool)

(assert (=> b!172347 m!200641))

(declare-fun m!200643 () Bool)

(assert (=> b!172348 m!200643))

(declare-fun m!200645 () Bool)

(assert (=> b!172349 m!200645))

(assert (=> start!17172 d!52361))

(declare-fun d!52363 () Bool)

(assert (=> d!52363 (= (validMask!0 (mask!8414 thiss!1248)) (and (or (= (mask!8414 thiss!1248) #b00000000000000000000000000000111) (= (mask!8414 thiss!1248) #b00000000000000000000000000001111) (= (mask!8414 thiss!1248) #b00000000000000000000000000011111) (= (mask!8414 thiss!1248) #b00000000000000000000000000111111) (= (mask!8414 thiss!1248) #b00000000000000000000000001111111) (= (mask!8414 thiss!1248) #b00000000000000000000000011111111) (= (mask!8414 thiss!1248) #b00000000000000000000000111111111) (= (mask!8414 thiss!1248) #b00000000000000000000001111111111) (= (mask!8414 thiss!1248) #b00000000000000000000011111111111) (= (mask!8414 thiss!1248) #b00000000000000000000111111111111) (= (mask!8414 thiss!1248) #b00000000000000000001111111111111) (= (mask!8414 thiss!1248) #b00000000000000000011111111111111) (= (mask!8414 thiss!1248) #b00000000000000000111111111111111) (= (mask!8414 thiss!1248) #b00000000000000001111111111111111) (= (mask!8414 thiss!1248) #b00000000000000011111111111111111) (= (mask!8414 thiss!1248) #b00000000000000111111111111111111) (= (mask!8414 thiss!1248) #b00000000000001111111111111111111) (= (mask!8414 thiss!1248) #b00000000000011111111111111111111) (= (mask!8414 thiss!1248) #b00000000000111111111111111111111) (= (mask!8414 thiss!1248) #b00000000001111111111111111111111) (= (mask!8414 thiss!1248) #b00000000011111111111111111111111) (= (mask!8414 thiss!1248) #b00000000111111111111111111111111) (= (mask!8414 thiss!1248) #b00000001111111111111111111111111) (= (mask!8414 thiss!1248) #b00000011111111111111111111111111) (= (mask!8414 thiss!1248) #b00000111111111111111111111111111) (= (mask!8414 thiss!1248) #b00001111111111111111111111111111) (= (mask!8414 thiss!1248) #b00011111111111111111111111111111) (= (mask!8414 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8414 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172296 d!52363))

(declare-fun d!52365 () Bool)

(assert (=> d!52365 (= (array_inv!2191 (_keys!5406 thiss!1248)) (bvsge (size!3698 (_keys!5406 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172297 d!52365))

(declare-fun d!52367 () Bool)

(assert (=> d!52367 (= (array_inv!2192 (_values!3553 thiss!1248)) (bvsge (size!3699 (_values!3553 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172297 d!52367))

(declare-fun mapIsEmpty!6859 () Bool)

(declare-fun mapRes!6859 () Bool)

(assert (=> mapIsEmpty!6859 mapRes!6859))

(declare-fun b!172357 () Bool)

(declare-fun e!113771 () Bool)

(assert (=> b!172357 (= e!113771 tp_is_empty!4027)))

(declare-fun mapNonEmpty!6859 () Bool)

(declare-fun tp!15427 () Bool)

(declare-fun e!113770 () Bool)

(assert (=> mapNonEmpty!6859 (= mapRes!6859 (and tp!15427 e!113770))))

(declare-fun mapValue!6859 () ValueCell!1670)

(declare-fun mapKey!6859 () (_ BitVec 32))

(declare-fun mapRest!6859 () (Array (_ BitVec 32) ValueCell!1670))

(assert (=> mapNonEmpty!6859 (= mapRest!6850 (store mapRest!6859 mapKey!6859 mapValue!6859))))

(declare-fun condMapEmpty!6859 () Bool)

(declare-fun mapDefault!6859 () ValueCell!1670)

(assert (=> mapNonEmpty!6850 (= condMapEmpty!6859 (= mapRest!6850 ((as const (Array (_ BitVec 32) ValueCell!1670)) mapDefault!6859)))))

(assert (=> mapNonEmpty!6850 (= tp!15411 (and e!113771 mapRes!6859))))

(declare-fun b!172356 () Bool)

(assert (=> b!172356 (= e!113770 tp_is_empty!4027)))

(assert (= (and mapNonEmpty!6850 condMapEmpty!6859) mapIsEmpty!6859))

(assert (= (and mapNonEmpty!6850 (not condMapEmpty!6859)) mapNonEmpty!6859))

(assert (= (and mapNonEmpty!6859 ((_ is ValueCellFull!1670) mapValue!6859)) b!172356))

(assert (= (and mapNonEmpty!6850 ((_ is ValueCellFull!1670) mapDefault!6859)) b!172357))

(declare-fun m!200647 () Bool)

(assert (=> mapNonEmpty!6859 m!200647))

(check-sat (not b!172347) (not b!172349) (not d!52361) (not mapNonEmpty!6859) (not b!172348) tp_is_empty!4027 b_and!10669 (not b_next!4255))
(check-sat b_and!10669 (not b_next!4255))
