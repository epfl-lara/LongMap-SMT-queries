; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15576 () Bool)

(assert start!15576)

(declare-fun b!155011 () Bool)

(declare-fun b_free!3243 () Bool)

(declare-fun b_next!3243 () Bool)

(assert (=> b!155011 (= b_free!3243 (not b_next!3243))))

(declare-fun tp!12253 () Bool)

(declare-fun b_and!9657 () Bool)

(assert (=> b!155011 (= tp!12253 b_and!9657)))

(declare-fun b!155004 () Bool)

(declare-fun res!73173 () Bool)

(declare-fun e!101262 () Bool)

(assert (=> b!155004 (=> (not res!73173) (not e!101262))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155004 (= res!73173 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155005 () Bool)

(declare-fun e!101260 () Bool)

(declare-fun tp_is_empty!3045 () Bool)

(assert (=> b!155005 (= e!101260 tp_is_empty!3045)))

(declare-fun b!155006 () Bool)

(declare-fun e!101261 () Bool)

(assert (=> b!155006 (= e!101261 tp_is_empty!3045)))

(declare-fun res!73170 () Bool)

(assert (=> start!15576 (=> (not res!73170) (not e!101262))))

(declare-datatypes ((V!3707 0))(
  ( (V!3708 (val!1567 Int)) )
))
(declare-datatypes ((ValueCell!1179 0))(
  ( (ValueCellFull!1179 (v!3432 V!3707)) (EmptyCell!1179) )
))
(declare-datatypes ((array!5143 0))(
  ( (array!5144 (arr!2429 (Array (_ BitVec 32) (_ BitVec 64))) (size!2707 (_ BitVec 32))) )
))
(declare-datatypes ((array!5145 0))(
  ( (array!5146 (arr!2430 (Array (_ BitVec 32) ValueCell!1179)) (size!2708 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1266 0))(
  ( (LongMapFixedSize!1267 (defaultEntry!3075 Int) (mask!7488 (_ BitVec 32)) (extraKeys!2816 (_ BitVec 32)) (zeroValue!2918 V!3707) (minValue!2918 V!3707) (_size!682 (_ BitVec 32)) (_keys!4850 array!5143) (_values!3058 array!5145) (_vacant!682 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1266)

(declare-fun valid!624 (LongMapFixedSize!1266) Bool)

(assert (=> start!15576 (= res!73170 (valid!624 thiss!1248))))

(assert (=> start!15576 e!101262))

(declare-fun e!101265 () Bool)

(assert (=> start!15576 e!101265))

(assert (=> start!15576 true))

(declare-fun b!155007 () Bool)

(declare-fun res!73171 () Bool)

(assert (=> b!155007 (=> (not res!73171) (not e!101262))))

(assert (=> b!155007 (= res!73171 (and (= (size!2708 (_values!3058 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7488 thiss!1248))) (= (size!2707 (_keys!4850 thiss!1248)) (size!2708 (_values!3058 thiss!1248))) (bvsge (mask!7488 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2816 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2816 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2816 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2816 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2816 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2816 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2816 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155008 () Bool)

(declare-fun res!73174 () Bool)

(assert (=> b!155008 (=> (not res!73174) (not e!101262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155008 (= res!73174 (validMask!0 (mask!7488 thiss!1248)))))

(declare-fun b!155009 () Bool)

(declare-fun res!73172 () Bool)

(assert (=> b!155009 (=> (not res!73172) (not e!101262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5143 (_ BitVec 32)) Bool)

(assert (=> b!155009 (= res!73172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4850 thiss!1248) (mask!7488 thiss!1248)))))

(declare-fun mapIsEmpty!5210 () Bool)

(declare-fun mapRes!5210 () Bool)

(assert (=> mapIsEmpty!5210 mapRes!5210))

(declare-fun b!155010 () Bool)

(declare-fun e!101264 () Bool)

(assert (=> b!155010 (= e!101264 (and e!101261 mapRes!5210))))

(declare-fun condMapEmpty!5210 () Bool)

(declare-fun mapDefault!5210 () ValueCell!1179)

(assert (=> b!155010 (= condMapEmpty!5210 (= (arr!2430 (_values!3058 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1179)) mapDefault!5210)))))

(declare-fun array_inv!1533 (array!5143) Bool)

(declare-fun array_inv!1534 (array!5145) Bool)

(assert (=> b!155011 (= e!101265 (and tp!12253 tp_is_empty!3045 (array_inv!1533 (_keys!4850 thiss!1248)) (array_inv!1534 (_values!3058 thiss!1248)) e!101264))))

(declare-fun mapNonEmpty!5210 () Bool)

(declare-fun tp!12254 () Bool)

(assert (=> mapNonEmpty!5210 (= mapRes!5210 (and tp!12254 e!101260))))

(declare-fun mapRest!5210 () (Array (_ BitVec 32) ValueCell!1179))

(declare-fun mapKey!5210 () (_ BitVec 32))

(declare-fun mapValue!5210 () ValueCell!1179)

(assert (=> mapNonEmpty!5210 (= (arr!2430 (_values!3058 thiss!1248)) (store mapRest!5210 mapKey!5210 mapValue!5210))))

(declare-fun b!155012 () Bool)

(assert (=> b!155012 (= e!101262 false)))

(declare-fun lt!81316 () Bool)

(declare-datatypes ((List!1812 0))(
  ( (Nil!1809) (Cons!1808 (h!2417 (_ BitVec 64)) (t!6614 List!1812)) )
))
(declare-fun arrayNoDuplicates!0 (array!5143 (_ BitVec 32) List!1812) Bool)

(assert (=> b!155012 (= lt!81316 (arrayNoDuplicates!0 (_keys!4850 thiss!1248) #b00000000000000000000000000000000 Nil!1809))))

(assert (= (and start!15576 res!73170) b!155004))

(assert (= (and b!155004 res!73173) b!155008))

(assert (= (and b!155008 res!73174) b!155007))

(assert (= (and b!155007 res!73171) b!155009))

(assert (= (and b!155009 res!73172) b!155012))

(assert (= (and b!155010 condMapEmpty!5210) mapIsEmpty!5210))

(assert (= (and b!155010 (not condMapEmpty!5210)) mapNonEmpty!5210))

(get-info :version)

(assert (= (and mapNonEmpty!5210 ((_ is ValueCellFull!1179) mapValue!5210)) b!155005))

(assert (= (and b!155010 ((_ is ValueCellFull!1179) mapDefault!5210)) b!155006))

(assert (= b!155011 b!155010))

(assert (= start!15576 b!155011))

(declare-fun m!189113 () Bool)

(assert (=> mapNonEmpty!5210 m!189113))

(declare-fun m!189115 () Bool)

(assert (=> b!155012 m!189115))

(declare-fun m!189117 () Bool)

(assert (=> b!155011 m!189117))

(declare-fun m!189119 () Bool)

(assert (=> b!155011 m!189119))

(declare-fun m!189121 () Bool)

(assert (=> start!15576 m!189121))

(declare-fun m!189123 () Bool)

(assert (=> b!155008 m!189123))

(declare-fun m!189125 () Bool)

(assert (=> b!155009 m!189125))

(check-sat (not b_next!3243) (not b!155011) (not b!155008) (not mapNonEmpty!5210) b_and!9657 (not start!15576) tp_is_empty!3045 (not b!155009) (not b!155012))
(check-sat b_and!9657 (not b_next!3243))
