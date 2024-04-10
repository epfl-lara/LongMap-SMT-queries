; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15570 () Bool)

(assert start!15570)

(declare-fun b!154924 () Bool)

(declare-fun b_free!3237 () Bool)

(declare-fun b_next!3237 () Bool)

(assert (=> b!154924 (= b_free!3237 (not b_next!3237))))

(declare-fun tp!12235 () Bool)

(declare-fun b_and!9651 () Bool)

(assert (=> b!154924 (= tp!12235 b_and!9651)))

(declare-fun b!154923 () Bool)

(declare-fun res!73126 () Bool)

(declare-fun e!101208 () Bool)

(assert (=> b!154923 (=> (not res!73126) (not e!101208))))

(declare-datatypes ((V!3699 0))(
  ( (V!3700 (val!1564 Int)) )
))
(declare-datatypes ((ValueCell!1176 0))(
  ( (ValueCellFull!1176 (v!3429 V!3699)) (EmptyCell!1176) )
))
(declare-datatypes ((array!5131 0))(
  ( (array!5132 (arr!2423 (Array (_ BitVec 32) (_ BitVec 64))) (size!2701 (_ BitVec 32))) )
))
(declare-datatypes ((array!5133 0))(
  ( (array!5134 (arr!2424 (Array (_ BitVec 32) ValueCell!1176)) (size!2702 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1260 0))(
  ( (LongMapFixedSize!1261 (defaultEntry!3072 Int) (mask!7483 (_ BitVec 32)) (extraKeys!2813 (_ BitVec 32)) (zeroValue!2915 V!3699) (minValue!2915 V!3699) (_size!679 (_ BitVec 32)) (_keys!4847 array!5131) (_values!3055 array!5133) (_vacant!679 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1260)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!154923 (= res!73126 (validMask!0 (mask!7483 thiss!1248)))))

(declare-fun tp_is_empty!3039 () Bool)

(declare-fun e!101210 () Bool)

(declare-fun e!101207 () Bool)

(declare-fun array_inv!1529 (array!5131) Bool)

(declare-fun array_inv!1530 (array!5133) Bool)

(assert (=> b!154924 (= e!101210 (and tp!12235 tp_is_empty!3039 (array_inv!1529 (_keys!4847 thiss!1248)) (array_inv!1530 (_values!3055 thiss!1248)) e!101207))))

(declare-fun b!154925 () Bool)

(declare-fun res!73129 () Bool)

(assert (=> b!154925 (=> (not res!73129) (not e!101208))))

(assert (=> b!154925 (= res!73129 (and (= (size!2702 (_values!3055 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7483 thiss!1248))) (= (size!2701 (_keys!4847 thiss!1248)) (size!2702 (_values!3055 thiss!1248))) (bvsge (mask!7483 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2813 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2813 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2813 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2813 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2813 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2813 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2813 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!154926 () Bool)

(declare-fun res!73127 () Bool)

(assert (=> b!154926 (=> (not res!73127) (not e!101208))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!154926 (= res!73127 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!154927 () Bool)

(declare-fun res!73128 () Bool)

(assert (=> b!154927 (=> (not res!73128) (not e!101208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5131 (_ BitVec 32)) Bool)

(assert (=> b!154927 (= res!73128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4847 thiss!1248) (mask!7483 thiss!1248)))))

(declare-fun mapIsEmpty!5201 () Bool)

(declare-fun mapRes!5201 () Bool)

(assert (=> mapIsEmpty!5201 mapRes!5201))

(declare-fun mapNonEmpty!5201 () Bool)

(declare-fun tp!12236 () Bool)

(declare-fun e!101211 () Bool)

(assert (=> mapNonEmpty!5201 (= mapRes!5201 (and tp!12236 e!101211))))

(declare-fun mapValue!5201 () ValueCell!1176)

(declare-fun mapRest!5201 () (Array (_ BitVec 32) ValueCell!1176))

(declare-fun mapKey!5201 () (_ BitVec 32))

(assert (=> mapNonEmpty!5201 (= (arr!2424 (_values!3055 thiss!1248)) (store mapRest!5201 mapKey!5201 mapValue!5201))))

(declare-fun b!154929 () Bool)

(declare-fun e!101206 () Bool)

(assert (=> b!154929 (= e!101206 tp_is_empty!3039)))

(declare-fun b!154930 () Bool)

(assert (=> b!154930 (= e!101207 (and e!101206 mapRes!5201))))

(declare-fun condMapEmpty!5201 () Bool)

(declare-fun mapDefault!5201 () ValueCell!1176)

(assert (=> b!154930 (= condMapEmpty!5201 (= (arr!2424 (_values!3055 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1176)) mapDefault!5201)))))

(declare-fun b!154931 () Bool)

(assert (=> b!154931 (= e!101211 tp_is_empty!3039)))

(declare-fun res!73125 () Bool)

(assert (=> start!15570 (=> (not res!73125) (not e!101208))))

(declare-fun valid!622 (LongMapFixedSize!1260) Bool)

(assert (=> start!15570 (= res!73125 (valid!622 thiss!1248))))

(assert (=> start!15570 e!101208))

(assert (=> start!15570 e!101210))

(assert (=> start!15570 true))

(declare-fun b!154928 () Bool)

(assert (=> b!154928 (= e!101208 false)))

(declare-fun lt!81307 () Bool)

(declare-datatypes ((List!1811 0))(
  ( (Nil!1808) (Cons!1807 (h!2416 (_ BitVec 64)) (t!6613 List!1811)) )
))
(declare-fun arrayNoDuplicates!0 (array!5131 (_ BitVec 32) List!1811) Bool)

(assert (=> b!154928 (= lt!81307 (arrayNoDuplicates!0 (_keys!4847 thiss!1248) #b00000000000000000000000000000000 Nil!1808))))

(assert (= (and start!15570 res!73125) b!154926))

(assert (= (and b!154926 res!73127) b!154923))

(assert (= (and b!154923 res!73126) b!154925))

(assert (= (and b!154925 res!73129) b!154927))

(assert (= (and b!154927 res!73128) b!154928))

(assert (= (and b!154930 condMapEmpty!5201) mapIsEmpty!5201))

(assert (= (and b!154930 (not condMapEmpty!5201)) mapNonEmpty!5201))

(get-info :version)

(assert (= (and mapNonEmpty!5201 ((_ is ValueCellFull!1176) mapValue!5201)) b!154931))

(assert (= (and b!154930 ((_ is ValueCellFull!1176) mapDefault!5201)) b!154929))

(assert (= b!154924 b!154930))

(assert (= start!15570 b!154924))

(declare-fun m!189071 () Bool)

(assert (=> start!15570 m!189071))

(declare-fun m!189073 () Bool)

(assert (=> mapNonEmpty!5201 m!189073))

(declare-fun m!189075 () Bool)

(assert (=> b!154928 m!189075))

(declare-fun m!189077 () Bool)

(assert (=> b!154924 m!189077))

(declare-fun m!189079 () Bool)

(assert (=> b!154924 m!189079))

(declare-fun m!189081 () Bool)

(assert (=> b!154923 m!189081))

(declare-fun m!189083 () Bool)

(assert (=> b!154927 m!189083))

(check-sat tp_is_empty!3039 (not mapNonEmpty!5201) b_and!9651 (not b!154924) (not b!154923) (not start!15570) (not b!154928) (not b_next!3237) (not b!154927))
(check-sat b_and!9651 (not b_next!3237))
