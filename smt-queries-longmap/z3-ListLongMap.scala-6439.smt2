; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82620 () Bool)

(assert start!82620)

(declare-fun res!643654 () Bool)

(declare-fun e!542459 () Bool)

(assert (=> start!82620 (=> (not res!643654) (not e!542459))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82620 (= res!643654 (validMask!0 mask!2110))))

(assert (=> start!82620 e!542459))

(assert (=> start!82620 true))

(declare-datatypes ((V!33529 0))(
  ( (V!33530 (val!10755 Int)) )
))
(declare-datatypes ((ValueCell!10223 0))(
  ( (ValueCellFull!10223 (v!13309 V!33529)) (EmptyCell!10223) )
))
(declare-datatypes ((array!58940 0))(
  ( (array!58941 (arr!28336 (Array (_ BitVec 32) ValueCell!10223)) (size!28816 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58940)

(declare-fun e!542462 () Bool)

(declare-fun array_inv!22037 (array!58940) Bool)

(assert (=> start!82620 (and (array_inv!22037 _values!1400) e!542462)))

(declare-datatypes ((array!58942 0))(
  ( (array!58943 (arr!28337 (Array (_ BitVec 32) (_ BitVec 64))) (size!28817 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58942)

(declare-fun array_inv!22038 (array!58942) Bool)

(assert (=> start!82620 (array_inv!22038 _keys!1686)))

(declare-fun b!962053 () Bool)

(declare-fun e!542463 () Bool)

(declare-fun mapRes!34102 () Bool)

(assert (=> b!962053 (= e!542462 (and e!542463 mapRes!34102))))

(declare-fun condMapEmpty!34102 () Bool)

(declare-fun mapDefault!34102 () ValueCell!10223)

(assert (=> b!962053 (= condMapEmpty!34102 (= (arr!28336 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10223)) mapDefault!34102)))))

(declare-fun b!962054 () Bool)

(declare-fun res!643655 () Bool)

(assert (=> b!962054 (=> (not res!643655) (not e!542459))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58942 (_ BitVec 32)) Bool)

(assert (=> b!962054 (= res!643655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!962055 () Bool)

(declare-fun tp_is_empty!21409 () Bool)

(assert (=> b!962055 (= e!542463 tp_is_empty!21409)))

(declare-fun b!962056 () Bool)

(declare-fun res!643657 () Bool)

(assert (=> b!962056 (=> (not res!643657) (not e!542459))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962056 (= res!643657 (and (= (size!28816 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28817 _keys!1686) (size!28816 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!962057 () Bool)

(declare-datatypes ((List!19663 0))(
  ( (Nil!19660) (Cons!19659 (h!20827 (_ BitVec 64)) (t!28018 List!19663)) )
))
(declare-fun noDuplicate!1375 (List!19663) Bool)

(assert (=> b!962057 (= e!542459 (not (noDuplicate!1375 Nil!19660)))))

(declare-fun b!962058 () Bool)

(declare-fun res!643656 () Bool)

(assert (=> b!962058 (=> (not res!643656) (not e!542459))))

(assert (=> b!962058 (= res!643656 (and (bvsle #b00000000000000000000000000000000 (size!28817 _keys!1686)) (bvslt (size!28817 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!34102 () Bool)

(declare-fun tp!65032 () Bool)

(declare-fun e!542460 () Bool)

(assert (=> mapNonEmpty!34102 (= mapRes!34102 (and tp!65032 e!542460))))

(declare-fun mapKey!34102 () (_ BitVec 32))

(declare-fun mapRest!34102 () (Array (_ BitVec 32) ValueCell!10223))

(declare-fun mapValue!34102 () ValueCell!10223)

(assert (=> mapNonEmpty!34102 (= (arr!28336 _values!1400) (store mapRest!34102 mapKey!34102 mapValue!34102))))

(declare-fun b!962059 () Bool)

(assert (=> b!962059 (= e!542460 tp_is_empty!21409)))

(declare-fun mapIsEmpty!34102 () Bool)

(assert (=> mapIsEmpty!34102 mapRes!34102))

(assert (= (and start!82620 res!643654) b!962056))

(assert (= (and b!962056 res!643657) b!962054))

(assert (= (and b!962054 res!643655) b!962058))

(assert (= (and b!962058 res!643656) b!962057))

(assert (= (and b!962053 condMapEmpty!34102) mapIsEmpty!34102))

(assert (= (and b!962053 (not condMapEmpty!34102)) mapNonEmpty!34102))

(get-info :version)

(assert (= (and mapNonEmpty!34102 ((_ is ValueCellFull!10223) mapValue!34102)) b!962059))

(assert (= (and b!962053 ((_ is ValueCellFull!10223) mapDefault!34102)) b!962055))

(assert (= start!82620 b!962053))

(declare-fun m!892497 () Bool)

(assert (=> start!82620 m!892497))

(declare-fun m!892499 () Bool)

(assert (=> start!82620 m!892499))

(declare-fun m!892501 () Bool)

(assert (=> start!82620 m!892501))

(declare-fun m!892503 () Bool)

(assert (=> b!962054 m!892503))

(declare-fun m!892505 () Bool)

(assert (=> b!962057 m!892505))

(declare-fun m!892507 () Bool)

(assert (=> mapNonEmpty!34102 m!892507))

(check-sat tp_is_empty!21409 (not b!962054) (not start!82620) (not mapNonEmpty!34102) (not b!962057))
(check-sat)
(get-model)

(declare-fun d!116363 () Bool)

(declare-fun res!643686 () Bool)

(declare-fun e!542498 () Bool)

(assert (=> d!116363 (=> res!643686 e!542498)))

(assert (=> d!116363 (= res!643686 ((_ is Nil!19660) Nil!19660))))

(assert (=> d!116363 (= (noDuplicate!1375 Nil!19660) e!542498)))

(declare-fun b!962106 () Bool)

(declare-fun e!542499 () Bool)

(assert (=> b!962106 (= e!542498 e!542499)))

(declare-fun res!643687 () Bool)

(assert (=> b!962106 (=> (not res!643687) (not e!542499))))

(declare-fun contains!5393 (List!19663 (_ BitVec 64)) Bool)

(assert (=> b!962106 (= res!643687 (not (contains!5393 (t!28018 Nil!19660) (h!20827 Nil!19660))))))

(declare-fun b!962107 () Bool)

(assert (=> b!962107 (= e!542499 (noDuplicate!1375 (t!28018 Nil!19660)))))

(assert (= (and d!116363 (not res!643686)) b!962106))

(assert (= (and b!962106 res!643687) b!962107))

(declare-fun m!892533 () Bool)

(assert (=> b!962106 m!892533))

(declare-fun m!892535 () Bool)

(assert (=> b!962107 m!892535))

(assert (=> b!962057 d!116363))

(declare-fun bm!41768 () Bool)

(declare-fun call!41771 () Bool)

(assert (=> bm!41768 (= call!41771 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun b!962116 () Bool)

(declare-fun e!542508 () Bool)

(declare-fun e!542507 () Bool)

(assert (=> b!962116 (= e!542508 e!542507)))

(declare-fun c!100196 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962116 (= c!100196 (validKeyInArray!0 (select (arr!28337 _keys!1686) #b00000000000000000000000000000000)))))

(declare-fun b!962117 () Bool)

(declare-fun e!542506 () Bool)

(assert (=> b!962117 (= e!542507 e!542506)))

(declare-fun lt!431084 () (_ BitVec 64))

(assert (=> b!962117 (= lt!431084 (select (arr!28337 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32170 0))(
  ( (Unit!32171) )
))
(declare-fun lt!431086 () Unit!32170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58942 (_ BitVec 64) (_ BitVec 32)) Unit!32170)

(assert (=> b!962117 (= lt!431086 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!431084 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58942 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!962117 (arrayContainsKey!0 _keys!1686 lt!431084 #b00000000000000000000000000000000)))

(declare-fun lt!431085 () Unit!32170)

(assert (=> b!962117 (= lt!431085 lt!431086)))

(declare-fun res!643692 () Bool)

(declare-datatypes ((SeekEntryResult!9150 0))(
  ( (MissingZero!9150 (index!38971 (_ BitVec 32))) (Found!9150 (index!38972 (_ BitVec 32))) (Intermediate!9150 (undefined!9962 Bool) (index!38973 (_ BitVec 32)) (x!82898 (_ BitVec 32))) (Undefined!9150) (MissingVacant!9150 (index!38974 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58942 (_ BitVec 32)) SeekEntryResult!9150)

(assert (=> b!962117 (= res!643692 (= (seekEntryOrOpen!0 (select (arr!28337 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9150 #b00000000000000000000000000000000)))))

(assert (=> b!962117 (=> (not res!643692) (not e!542506))))

(declare-fun d!116365 () Bool)

(declare-fun res!643693 () Bool)

(assert (=> d!116365 (=> res!643693 e!542508)))

(assert (=> d!116365 (= res!643693 (bvsge #b00000000000000000000000000000000 (size!28817 _keys!1686)))))

(assert (=> d!116365 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!542508)))

(declare-fun b!962118 () Bool)

(assert (=> b!962118 (= e!542506 call!41771)))

(declare-fun b!962119 () Bool)

(assert (=> b!962119 (= e!542507 call!41771)))

(assert (= (and d!116365 (not res!643693)) b!962116))

(assert (= (and b!962116 c!100196) b!962117))

(assert (= (and b!962116 (not c!100196)) b!962119))

(assert (= (and b!962117 res!643692) b!962118))

(assert (= (or b!962118 b!962119) bm!41768))

(declare-fun m!892537 () Bool)

(assert (=> bm!41768 m!892537))

(declare-fun m!892539 () Bool)

(assert (=> b!962116 m!892539))

(assert (=> b!962116 m!892539))

(declare-fun m!892541 () Bool)

(assert (=> b!962116 m!892541))

(assert (=> b!962117 m!892539))

(declare-fun m!892543 () Bool)

(assert (=> b!962117 m!892543))

(declare-fun m!892545 () Bool)

(assert (=> b!962117 m!892545))

(assert (=> b!962117 m!892539))

(declare-fun m!892547 () Bool)

(assert (=> b!962117 m!892547))

(assert (=> b!962054 d!116365))

(declare-fun d!116367 () Bool)

(assert (=> d!116367 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82620 d!116367))

(declare-fun d!116369 () Bool)

(assert (=> d!116369 (= (array_inv!22037 _values!1400) (bvsge (size!28816 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82620 d!116369))

(declare-fun d!116371 () Bool)

(assert (=> d!116371 (= (array_inv!22038 _keys!1686) (bvsge (size!28817 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82620 d!116371))

(declare-fun b!962126 () Bool)

(declare-fun e!542514 () Bool)

(assert (=> b!962126 (= e!542514 tp_is_empty!21409)))

(declare-fun b!962127 () Bool)

(declare-fun e!542513 () Bool)

(assert (=> b!962127 (= e!542513 tp_is_empty!21409)))

(declare-fun condMapEmpty!34111 () Bool)

(declare-fun mapDefault!34111 () ValueCell!10223)

(assert (=> mapNonEmpty!34102 (= condMapEmpty!34111 (= mapRest!34102 ((as const (Array (_ BitVec 32) ValueCell!10223)) mapDefault!34111)))))

(declare-fun mapRes!34111 () Bool)

(assert (=> mapNonEmpty!34102 (= tp!65032 (and e!542513 mapRes!34111))))

(declare-fun mapIsEmpty!34111 () Bool)

(assert (=> mapIsEmpty!34111 mapRes!34111))

(declare-fun mapNonEmpty!34111 () Bool)

(declare-fun tp!65041 () Bool)

(assert (=> mapNonEmpty!34111 (= mapRes!34111 (and tp!65041 e!542514))))

(declare-fun mapValue!34111 () ValueCell!10223)

(declare-fun mapKey!34111 () (_ BitVec 32))

(declare-fun mapRest!34111 () (Array (_ BitVec 32) ValueCell!10223))

(assert (=> mapNonEmpty!34111 (= mapRest!34102 (store mapRest!34111 mapKey!34111 mapValue!34111))))

(assert (= (and mapNonEmpty!34102 condMapEmpty!34111) mapIsEmpty!34111))

(assert (= (and mapNonEmpty!34102 (not condMapEmpty!34111)) mapNonEmpty!34111))

(assert (= (and mapNonEmpty!34111 ((_ is ValueCellFull!10223) mapValue!34111)) b!962126))

(assert (= (and mapNonEmpty!34102 ((_ is ValueCellFull!10223) mapDefault!34111)) b!962127))

(declare-fun m!892549 () Bool)

(assert (=> mapNonEmpty!34111 m!892549))

(check-sat tp_is_empty!21409 (not b!962106) (not b!962107) (not mapNonEmpty!34111) (not bm!41768) (not b!962116) (not b!962117))
(check-sat)
