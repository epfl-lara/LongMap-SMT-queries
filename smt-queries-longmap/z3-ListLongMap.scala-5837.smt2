; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75390 () Bool)

(assert start!75390)

(declare-fun b!887716 () Bool)

(declare-fun b_free!15525 () Bool)

(declare-fun b_next!15525 () Bool)

(assert (=> b!887716 (= b_free!15525 (not b_next!15525))))

(declare-fun tp!54515 () Bool)

(declare-fun b_and!25761 () Bool)

(assert (=> b!887716 (= tp!54515 b_and!25761)))

(declare-fun b!887710 () Bool)

(declare-fun e!494424 () Bool)

(declare-fun tp_is_empty!17853 () Bool)

(assert (=> b!887710 (= e!494424 tp_is_empty!17853)))

(declare-fun mapNonEmpty!28306 () Bool)

(declare-fun mapRes!28306 () Bool)

(declare-fun tp!54516 () Bool)

(assert (=> mapNonEmpty!28306 (= mapRes!28306 (and tp!54516 e!494424))))

(declare-datatypes ((V!28769 0))(
  ( (V!28770 (val!8977 Int)) )
))
(declare-datatypes ((ValueCell!8445 0))(
  ( (ValueCellFull!8445 (v!11440 V!28769)) (EmptyCell!8445) )
))
(declare-fun mapRest!28306 () (Array (_ BitVec 32) ValueCell!8445))

(declare-datatypes ((array!51670 0))(
  ( (array!51671 (arr!24849 (Array (_ BitVec 32) (_ BitVec 64))) (size!25289 (_ BitVec 32))) )
))
(declare-datatypes ((array!51672 0))(
  ( (array!51673 (arr!24850 (Array (_ BitVec 32) ValueCell!8445)) (size!25290 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3906 0))(
  ( (LongMapFixedSize!3907 (defaultEntry!5144 Int) (mask!25546 (_ BitVec 32)) (extraKeys!4838 (_ BitVec 32)) (zeroValue!4942 V!28769) (minValue!4942 V!28769) (_size!2008 (_ BitVec 32)) (_keys!9821 array!51670) (_values!5129 array!51672) (_vacant!2008 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1066 0))(
  ( (Cell!1067 (v!11441 LongMapFixedSize!3906)) )
))
(declare-datatypes ((LongMap!1066 0))(
  ( (LongMap!1067 (underlying!544 Cell!1066)) )
))
(declare-fun thiss!821 () LongMap!1066)

(declare-fun mapKey!28306 () (_ BitVec 32))

(declare-fun mapValue!28306 () ValueCell!8445)

(assert (=> mapNonEmpty!28306 (= (arr!24850 (_values!5129 (v!11441 (underlying!544 thiss!821)))) (store mapRest!28306 mapKey!28306 mapValue!28306))))

(declare-fun b!887711 () Bool)

(declare-fun e!494419 () Bool)

(assert (=> b!887711 (= e!494419 tp_is_empty!17853)))

(declare-fun b!887712 () Bool)

(declare-fun e!494420 () Bool)

(declare-fun valid!1524 (LongMapFixedSize!3906) Bool)

(assert (=> b!887712 (= e!494420 (not (valid!1524 (v!11441 (underlying!544 thiss!821)))))))

(declare-fun mapIsEmpty!28306 () Bool)

(assert (=> mapIsEmpty!28306 mapRes!28306))

(declare-fun res!602189 () Bool)

(assert (=> start!75390 (=> (not res!602189) (not e!494420))))

(declare-fun valid!1525 (LongMap!1066) Bool)

(assert (=> start!75390 (= res!602189 (valid!1525 thiss!821))))

(assert (=> start!75390 e!494420))

(declare-fun e!494423 () Bool)

(assert (=> start!75390 e!494423))

(declare-fun b!887713 () Bool)

(declare-fun e!494421 () Bool)

(declare-fun e!494422 () Bool)

(assert (=> b!887713 (= e!494421 e!494422)))

(declare-fun b!887714 () Bool)

(declare-fun e!494426 () Bool)

(assert (=> b!887714 (= e!494426 (and e!494419 mapRes!28306))))

(declare-fun condMapEmpty!28306 () Bool)

(declare-fun mapDefault!28306 () ValueCell!8445)

(assert (=> b!887714 (= condMapEmpty!28306 (= (arr!24850 (_values!5129 (v!11441 (underlying!544 thiss!821)))) ((as const (Array (_ BitVec 32) ValueCell!8445)) mapDefault!28306)))))

(declare-fun b!887715 () Bool)

(assert (=> b!887715 (= e!494423 e!494421)))

(declare-fun array_inv!19558 (array!51670) Bool)

(declare-fun array_inv!19559 (array!51672) Bool)

(assert (=> b!887716 (= e!494422 (and tp!54515 tp_is_empty!17853 (array_inv!19558 (_keys!9821 (v!11441 (underlying!544 thiss!821)))) (array_inv!19559 (_values!5129 (v!11441 (underlying!544 thiss!821)))) e!494426))))

(assert (= (and start!75390 res!602189) b!887712))

(assert (= (and b!887714 condMapEmpty!28306) mapIsEmpty!28306))

(assert (= (and b!887714 (not condMapEmpty!28306)) mapNonEmpty!28306))

(get-info :version)

(assert (= (and mapNonEmpty!28306 ((_ is ValueCellFull!8445) mapValue!28306)) b!887710))

(assert (= (and b!887714 ((_ is ValueCellFull!8445) mapDefault!28306)) b!887711))

(assert (= b!887716 b!887714))

(assert (= b!887713 b!887716))

(assert (= b!887715 b!887713))

(assert (= start!75390 b!887715))

(declare-fun m!827259 () Bool)

(assert (=> mapNonEmpty!28306 m!827259))

(declare-fun m!827261 () Bool)

(assert (=> b!887712 m!827261))

(declare-fun m!827263 () Bool)

(assert (=> start!75390 m!827263))

(declare-fun m!827265 () Bool)

(assert (=> b!887716 m!827265))

(declare-fun m!827267 () Bool)

(assert (=> b!887716 m!827267))

(check-sat tp_is_empty!17853 (not start!75390) (not b_next!15525) (not mapNonEmpty!28306) (not b!887716) b_and!25761 (not b!887712))
(check-sat b_and!25761 (not b_next!15525))
(get-model)

(declare-fun d!109961 () Bool)

(declare-fun res!602199 () Bool)

(declare-fun e!494453 () Bool)

(assert (=> d!109961 (=> (not res!602199) (not e!494453))))

(declare-fun simpleValid!288 (LongMapFixedSize!3906) Bool)

(assert (=> d!109961 (= res!602199 (simpleValid!288 (v!11441 (underlying!544 thiss!821))))))

(assert (=> d!109961 (= (valid!1524 (v!11441 (underlying!544 thiss!821))) e!494453)))

(declare-fun b!887744 () Bool)

(declare-fun res!602200 () Bool)

(assert (=> b!887744 (=> (not res!602200) (not e!494453))))

(declare-fun arrayCountValidKeys!0 (array!51670 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!887744 (= res!602200 (= (arrayCountValidKeys!0 (_keys!9821 (v!11441 (underlying!544 thiss!821))) #b00000000000000000000000000000000 (size!25289 (_keys!9821 (v!11441 (underlying!544 thiss!821))))) (_size!2008 (v!11441 (underlying!544 thiss!821)))))))

(declare-fun b!887745 () Bool)

(declare-fun res!602201 () Bool)

(assert (=> b!887745 (=> (not res!602201) (not e!494453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51670 (_ BitVec 32)) Bool)

(assert (=> b!887745 (= res!602201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9821 (v!11441 (underlying!544 thiss!821))) (mask!25546 (v!11441 (underlying!544 thiss!821)))))))

(declare-fun b!887746 () Bool)

(declare-datatypes ((List!17685 0))(
  ( (Nil!17682) (Cons!17681 (h!18812 (_ BitVec 64)) (t!24980 List!17685)) )
))
(declare-fun arrayNoDuplicates!0 (array!51670 (_ BitVec 32) List!17685) Bool)

(assert (=> b!887746 (= e!494453 (arrayNoDuplicates!0 (_keys!9821 (v!11441 (underlying!544 thiss!821))) #b00000000000000000000000000000000 Nil!17682))))

(assert (= (and d!109961 res!602199) b!887744))

(assert (= (and b!887744 res!602200) b!887745))

(assert (= (and b!887745 res!602201) b!887746))

(declare-fun m!827279 () Bool)

(assert (=> d!109961 m!827279))

(declare-fun m!827281 () Bool)

(assert (=> b!887744 m!827281))

(declare-fun m!827283 () Bool)

(assert (=> b!887745 m!827283))

(declare-fun m!827285 () Bool)

(assert (=> b!887746 m!827285))

(assert (=> b!887712 d!109961))

(declare-fun d!109963 () Bool)

(assert (=> d!109963 (= (array_inv!19558 (_keys!9821 (v!11441 (underlying!544 thiss!821)))) (bvsge (size!25289 (_keys!9821 (v!11441 (underlying!544 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!887716 d!109963))

(declare-fun d!109965 () Bool)

(assert (=> d!109965 (= (array_inv!19559 (_values!5129 (v!11441 (underlying!544 thiss!821)))) (bvsge (size!25290 (_values!5129 (v!11441 (underlying!544 thiss!821)))) #b00000000000000000000000000000000))))

(assert (=> b!887716 d!109965))

(declare-fun d!109967 () Bool)

(assert (=> d!109967 (= (valid!1525 thiss!821) (valid!1524 (v!11441 (underlying!544 thiss!821))))))

(declare-fun bs!24887 () Bool)

(assert (= bs!24887 d!109967))

(assert (=> bs!24887 m!827261))

(assert (=> start!75390 d!109967))

(declare-fun mapIsEmpty!28312 () Bool)

(declare-fun mapRes!28312 () Bool)

(assert (=> mapIsEmpty!28312 mapRes!28312))

(declare-fun b!887753 () Bool)

(declare-fun e!494458 () Bool)

(assert (=> b!887753 (= e!494458 tp_is_empty!17853)))

(declare-fun condMapEmpty!28312 () Bool)

(declare-fun mapDefault!28312 () ValueCell!8445)

(assert (=> mapNonEmpty!28306 (= condMapEmpty!28312 (= mapRest!28306 ((as const (Array (_ BitVec 32) ValueCell!8445)) mapDefault!28312)))))

(declare-fun e!494459 () Bool)

(assert (=> mapNonEmpty!28306 (= tp!54516 (and e!494459 mapRes!28312))))

(declare-fun b!887754 () Bool)

(assert (=> b!887754 (= e!494459 tp_is_empty!17853)))

(declare-fun mapNonEmpty!28312 () Bool)

(declare-fun tp!54525 () Bool)

(assert (=> mapNonEmpty!28312 (= mapRes!28312 (and tp!54525 e!494458))))

(declare-fun mapKey!28312 () (_ BitVec 32))

(declare-fun mapValue!28312 () ValueCell!8445)

(declare-fun mapRest!28312 () (Array (_ BitVec 32) ValueCell!8445))

(assert (=> mapNonEmpty!28312 (= mapRest!28306 (store mapRest!28312 mapKey!28312 mapValue!28312))))

(assert (= (and mapNonEmpty!28306 condMapEmpty!28312) mapIsEmpty!28312))

(assert (= (and mapNonEmpty!28306 (not condMapEmpty!28312)) mapNonEmpty!28312))

(assert (= (and mapNonEmpty!28312 ((_ is ValueCellFull!8445) mapValue!28312)) b!887753))

(assert (= (and mapNonEmpty!28306 ((_ is ValueCellFull!8445) mapDefault!28312)) b!887754))

(declare-fun m!827287 () Bool)

(assert (=> mapNonEmpty!28312 m!827287))

(check-sat (not b!887745) tp_is_empty!17853 b_and!25761 (not d!109961) (not b!887746) (not mapNonEmpty!28312) (not b_next!15525) (not d!109967) (not b!887744))
(check-sat b_and!25761 (not b_next!15525))
