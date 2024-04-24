; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75816 () Bool)

(assert start!75816)

(declare-fun b!890270 () Bool)

(declare-fun b_free!15619 () Bool)

(declare-fun b_next!15619 () Bool)

(assert (=> b!890270 (= b_free!15619 (not b_next!15619))))

(declare-fun tp!54827 () Bool)

(declare-fun b_and!25869 () Bool)

(assert (=> b!890270 (= tp!54827 b_and!25869)))

(declare-fun mapNonEmpty!28475 () Bool)

(declare-fun mapRes!28475 () Bool)

(declare-fun tp!54826 () Bool)

(declare-fun e!496309 () Bool)

(assert (=> mapNonEmpty!28475 (= mapRes!28475 (and tp!54826 e!496309))))

(declare-datatypes ((array!51913 0))(
  ( (array!51914 (arr!24958 (Array (_ BitVec 32) (_ BitVec 64))) (size!25403 (_ BitVec 32))) )
))
(declare-datatypes ((V!28895 0))(
  ( (V!28896 (val!9024 Int)) )
))
(declare-datatypes ((ValueCell!8492 0))(
  ( (ValueCellFull!8492 (v!11499 V!28895)) (EmptyCell!8492) )
))
(declare-datatypes ((array!51915 0))(
  ( (array!51916 (arr!24959 (Array (_ BitVec 32) ValueCell!8492)) (size!25404 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4000 0))(
  ( (LongMapFixedSize!4001 (defaultEntry!5197 Int) (mask!25687 (_ BitVec 32)) (extraKeys!4891 (_ BitVec 32)) (zeroValue!4995 V!28895) (minValue!4995 V!28895) (_size!2055 (_ BitVec 32)) (_keys!9908 array!51913) (_values!5182 array!51915) (_vacant!2055 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4000)

(declare-fun mapRest!28475 () (Array (_ BitVec 32) ValueCell!8492))

(declare-fun mapValue!28475 () ValueCell!8492)

(declare-fun mapKey!28475 () (_ BitVec 32))

(assert (=> mapNonEmpty!28475 (= (arr!24959 (_values!5182 thiss!1181)) (store mapRest!28475 mapKey!28475 mapValue!28475))))

(declare-fun mapIsEmpty!28475 () Bool)

(assert (=> mapIsEmpty!28475 mapRes!28475))

(declare-fun b!890266 () Bool)

(declare-fun res!603087 () Bool)

(declare-fun e!496311 () Bool)

(assert (=> b!890266 (=> (not res!603087) (not e!496311))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890266 (= res!603087 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890267 () Bool)

(declare-fun e!496314 () Bool)

(assert (=> b!890267 (= e!496311 e!496314)))

(declare-fun res!603088 () Bool)

(assert (=> b!890267 (=> (not res!603088) (not e!496314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890267 (= res!603088 (validMask!0 (mask!25687 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8724 0))(
  ( (MissingZero!8724 (index!37267 (_ BitVec 32))) (Found!8724 (index!37268 (_ BitVec 32))) (Intermediate!8724 (undefined!9536 Bool) (index!37269 (_ BitVec 32)) (x!75474 (_ BitVec 32))) (Undefined!8724) (MissingVacant!8724 (index!37270 (_ BitVec 32))) )
))
(declare-fun lt!402377 () SeekEntryResult!8724)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51913 (_ BitVec 32)) SeekEntryResult!8724)

(assert (=> b!890267 (= lt!402377 (seekEntry!0 key!785 (_keys!9908 thiss!1181) (mask!25687 thiss!1181)))))

(declare-fun b!890269 () Bool)

(assert (=> b!890269 (= e!496314 false)))

(declare-fun lt!402376 () Bool)

(declare-datatypes ((List!17653 0))(
  ( (Nil!17650) (Cons!17649 (h!18786 (_ BitVec 64)) (t!24944 List!17653)) )
))
(declare-fun arrayNoDuplicates!0 (array!51913 (_ BitVec 32) List!17653) Bool)

(assert (=> b!890269 (= lt!402376 (arrayNoDuplicates!0 (_keys!9908 thiss!1181) #b00000000000000000000000000000000 Nil!17650))))

(declare-fun e!496312 () Bool)

(declare-fun e!496313 () Bool)

(declare-fun tp_is_empty!17947 () Bool)

(declare-fun array_inv!19674 (array!51913) Bool)

(declare-fun array_inv!19675 (array!51915) Bool)

(assert (=> b!890270 (= e!496312 (and tp!54827 tp_is_empty!17947 (array_inv!19674 (_keys!9908 thiss!1181)) (array_inv!19675 (_values!5182 thiss!1181)) e!496313))))

(declare-fun b!890271 () Bool)

(declare-fun res!603085 () Bool)

(assert (=> b!890271 (=> (not res!603085) (not e!496314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51913 (_ BitVec 32)) Bool)

(assert (=> b!890271 (= res!603085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9908 thiss!1181) (mask!25687 thiss!1181)))))

(declare-fun b!890272 () Bool)

(declare-fun e!496308 () Bool)

(assert (=> b!890272 (= e!496308 tp_is_empty!17947)))

(declare-fun b!890268 () Bool)

(assert (=> b!890268 (= e!496309 tp_is_empty!17947)))

(declare-fun res!603084 () Bool)

(assert (=> start!75816 (=> (not res!603084) (not e!496311))))

(declare-fun valid!1569 (LongMapFixedSize!4000) Bool)

(assert (=> start!75816 (= res!603084 (valid!1569 thiss!1181))))

(assert (=> start!75816 e!496311))

(assert (=> start!75816 e!496312))

(assert (=> start!75816 true))

(declare-fun b!890273 () Bool)

(assert (=> b!890273 (= e!496313 (and e!496308 mapRes!28475))))

(declare-fun condMapEmpty!28475 () Bool)

(declare-fun mapDefault!28475 () ValueCell!8492)

(assert (=> b!890273 (= condMapEmpty!28475 (= (arr!24959 (_values!5182 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8492)) mapDefault!28475)))))

(declare-fun b!890274 () Bool)

(declare-fun res!603086 () Bool)

(assert (=> b!890274 (=> (not res!603086) (not e!496314))))

(assert (=> b!890274 (= res!603086 (and (= (size!25404 (_values!5182 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25687 thiss!1181))) (= (size!25403 (_keys!9908 thiss!1181)) (size!25404 (_values!5182 thiss!1181))) (bvsge (mask!25687 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4891 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4891 thiss!1181) #b00000000000000000000000000000011)))))

(assert (= (and start!75816 res!603084) b!890266))

(assert (= (and b!890266 res!603087) b!890267))

(assert (= (and b!890267 res!603088) b!890274))

(assert (= (and b!890274 res!603086) b!890271))

(assert (= (and b!890271 res!603085) b!890269))

(assert (= (and b!890273 condMapEmpty!28475) mapIsEmpty!28475))

(assert (= (and b!890273 (not condMapEmpty!28475)) mapNonEmpty!28475))

(get-info :version)

(assert (= (and mapNonEmpty!28475 ((_ is ValueCellFull!8492) mapValue!28475)) b!890268))

(assert (= (and b!890273 ((_ is ValueCellFull!8492) mapDefault!28475)) b!890272))

(assert (= b!890270 b!890273))

(assert (= start!75816 b!890270))

(declare-fun m!829603 () Bool)

(assert (=> start!75816 m!829603))

(declare-fun m!829605 () Bool)

(assert (=> b!890270 m!829605))

(declare-fun m!829607 () Bool)

(assert (=> b!890270 m!829607))

(declare-fun m!829609 () Bool)

(assert (=> b!890271 m!829609))

(declare-fun m!829611 () Bool)

(assert (=> mapNonEmpty!28475 m!829611))

(declare-fun m!829613 () Bool)

(assert (=> b!890267 m!829613))

(declare-fun m!829615 () Bool)

(assert (=> b!890267 m!829615))

(declare-fun m!829617 () Bool)

(assert (=> b!890269 m!829617))

(check-sat (not b!890270) (not b!890269) (not mapNonEmpty!28475) (not start!75816) (not b_next!15619) (not b!890271) tp_is_empty!17947 (not b!890267) b_and!25869)
(check-sat b_and!25869 (not b_next!15619))
