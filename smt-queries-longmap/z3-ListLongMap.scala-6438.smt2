; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82606 () Bool)

(assert start!82606)

(declare-fun b!961977 () Bool)

(declare-fun e!542399 () Bool)

(declare-fun tp_is_empty!21403 () Bool)

(assert (=> b!961977 (= e!542399 tp_is_empty!21403)))

(declare-fun b!961978 () Bool)

(declare-fun res!643621 () Bool)

(declare-fun e!542402 () Bool)

(assert (=> b!961978 (=> (not res!643621) (not e!542402))))

(declare-datatypes ((array!58926 0))(
  ( (array!58927 (arr!28330 (Array (_ BitVec 32) (_ BitVec 64))) (size!28810 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58926)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58926 (_ BitVec 32)) Bool)

(assert (=> b!961978 (= res!643621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961979 () Bool)

(declare-fun res!643619 () Bool)

(assert (=> b!961979 (=> (not res!643619) (not e!542402))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33521 0))(
  ( (V!33522 (val!10752 Int)) )
))
(declare-datatypes ((ValueCell!10220 0))(
  ( (ValueCellFull!10220 (v!13306 V!33521)) (EmptyCell!10220) )
))
(declare-datatypes ((array!58928 0))(
  ( (array!58929 (arr!28331 (Array (_ BitVec 32) ValueCell!10220)) (size!28811 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58928)

(assert (=> b!961979 (= res!643619 (and (= (size!28811 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28810 _keys!1686) (size!28811 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34090 () Bool)

(declare-fun mapRes!34090 () Bool)

(declare-fun tp!65020 () Bool)

(declare-fun e!542400 () Bool)

(assert (=> mapNonEmpty!34090 (= mapRes!34090 (and tp!65020 e!542400))))

(declare-fun mapValue!34090 () ValueCell!10220)

(declare-fun mapKey!34090 () (_ BitVec 32))

(declare-fun mapRest!34090 () (Array (_ BitVec 32) ValueCell!10220))

(assert (=> mapNonEmpty!34090 (= (arr!28331 _values!1400) (store mapRest!34090 mapKey!34090 mapValue!34090))))

(declare-fun b!961980 () Bool)

(declare-fun e!542403 () Bool)

(assert (=> b!961980 (= e!542403 (and e!542399 mapRes!34090))))

(declare-fun condMapEmpty!34090 () Bool)

(declare-fun mapDefault!34090 () ValueCell!10220)

(assert (=> b!961980 (= condMapEmpty!34090 (= (arr!28331 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10220)) mapDefault!34090)))))

(declare-fun b!961981 () Bool)

(assert (=> b!961981 (= e!542402 (and (bvsle #b00000000000000000000000000000000 (size!28810 _keys!1686)) (bvsge (size!28810 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun b!961982 () Bool)

(assert (=> b!961982 (= e!542400 tp_is_empty!21403)))

(declare-fun res!643620 () Bool)

(assert (=> start!82606 (=> (not res!643620) (not e!542402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82606 (= res!643620 (validMask!0 mask!2110))))

(assert (=> start!82606 e!542402))

(assert (=> start!82606 true))

(declare-fun array_inv!22033 (array!58928) Bool)

(assert (=> start!82606 (and (array_inv!22033 _values!1400) e!542403)))

(declare-fun array_inv!22034 (array!58926) Bool)

(assert (=> start!82606 (array_inv!22034 _keys!1686)))

(declare-fun mapIsEmpty!34090 () Bool)

(assert (=> mapIsEmpty!34090 mapRes!34090))

(assert (= (and start!82606 res!643620) b!961979))

(assert (= (and b!961979 res!643619) b!961978))

(assert (= (and b!961978 res!643621) b!961981))

(assert (= (and b!961980 condMapEmpty!34090) mapIsEmpty!34090))

(assert (= (and b!961980 (not condMapEmpty!34090)) mapNonEmpty!34090))

(get-info :version)

(assert (= (and mapNonEmpty!34090 ((_ is ValueCellFull!10220) mapValue!34090)) b!961982))

(assert (= (and b!961980 ((_ is ValueCellFull!10220) mapDefault!34090)) b!961977))

(assert (= start!82606 b!961980))

(declare-fun m!892453 () Bool)

(assert (=> b!961978 m!892453))

(declare-fun m!892455 () Bool)

(assert (=> mapNonEmpty!34090 m!892455))

(declare-fun m!892457 () Bool)

(assert (=> start!82606 m!892457))

(declare-fun m!892459 () Bool)

(assert (=> start!82606 m!892459))

(declare-fun m!892461 () Bool)

(assert (=> start!82606 m!892461))

(check-sat (not b!961978) (not start!82606) (not mapNonEmpty!34090) tp_is_empty!21403)
(check-sat)
(get-model)

(declare-fun b!962027 () Bool)

(declare-fun e!542440 () Bool)

(declare-fun call!41768 () Bool)

(assert (=> b!962027 (= e!542440 call!41768)))

(declare-fun b!962028 () Bool)

(declare-fun e!542441 () Bool)

(assert (=> b!962028 (= e!542441 e!542440)))

(declare-fun lt!431075 () (_ BitVec 64))

(assert (=> b!962028 (= lt!431075 (select (arr!28330 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32168 0))(
  ( (Unit!32169) )
))
(declare-fun lt!431076 () Unit!32168)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58926 (_ BitVec 64) (_ BitVec 32)) Unit!32168)

(assert (=> b!962028 (= lt!431076 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!431075 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!962028 (arrayContainsKey!0 _keys!1686 lt!431075 #b00000000000000000000000000000000)))

(declare-fun lt!431077 () Unit!32168)

(assert (=> b!962028 (= lt!431077 lt!431076)))

(declare-fun res!643644 () Bool)

(declare-datatypes ((SeekEntryResult!9149 0))(
  ( (MissingZero!9149 (index!38967 (_ BitVec 32))) (Found!9149 (index!38968 (_ BitVec 32))) (Intermediate!9149 (undefined!9961 Bool) (index!38969 (_ BitVec 32)) (x!82887 (_ BitVec 32))) (Undefined!9149) (MissingVacant!9149 (index!38970 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58926 (_ BitVec 32)) SeekEntryResult!9149)

(assert (=> b!962028 (= res!643644 (= (seekEntryOrOpen!0 (select (arr!28330 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9149 #b00000000000000000000000000000000)))))

(assert (=> b!962028 (=> (not res!643644) (not e!542440))))

(declare-fun bm!41765 () Bool)

(assert (=> bm!41765 (= call!41768 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun b!962030 () Bool)

(assert (=> b!962030 (= e!542441 call!41768)))

(declare-fun d!116353 () Bool)

(declare-fun res!643645 () Bool)

(declare-fun e!542442 () Bool)

(assert (=> d!116353 (=> res!643645 e!542442)))

(assert (=> d!116353 (= res!643645 (bvsge #b00000000000000000000000000000000 (size!28810 _keys!1686)))))

(assert (=> d!116353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!542442)))

(declare-fun b!962029 () Bool)

(assert (=> b!962029 (= e!542442 e!542441)))

(declare-fun c!100193 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962029 (= c!100193 (validKeyInArray!0 (select (arr!28330 _keys!1686) #b00000000000000000000000000000000)))))

(assert (= (and d!116353 (not res!643645)) b!962029))

(assert (= (and b!962029 c!100193) b!962028))

(assert (= (and b!962029 (not c!100193)) b!962030))

(assert (= (and b!962028 res!643644) b!962027))

(assert (= (or b!962027 b!962030) bm!41765))

(declare-fun m!892483 () Bool)

(assert (=> b!962028 m!892483))

(declare-fun m!892485 () Bool)

(assert (=> b!962028 m!892485))

(declare-fun m!892487 () Bool)

(assert (=> b!962028 m!892487))

(assert (=> b!962028 m!892483))

(declare-fun m!892489 () Bool)

(assert (=> b!962028 m!892489))

(declare-fun m!892491 () Bool)

(assert (=> bm!41765 m!892491))

(assert (=> b!962029 m!892483))

(assert (=> b!962029 m!892483))

(declare-fun m!892493 () Bool)

(assert (=> b!962029 m!892493))

(assert (=> b!961978 d!116353))

(declare-fun d!116355 () Bool)

(assert (=> d!116355 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82606 d!116355))

(declare-fun d!116357 () Bool)

(assert (=> d!116357 (= (array_inv!22033 _values!1400) (bvsge (size!28811 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82606 d!116357))

(declare-fun d!116359 () Bool)

(assert (=> d!116359 (= (array_inv!22034 _keys!1686) (bvsge (size!28810 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82606 d!116359))

(declare-fun condMapEmpty!34099 () Bool)

(declare-fun mapDefault!34099 () ValueCell!10220)

(assert (=> mapNonEmpty!34090 (= condMapEmpty!34099 (= mapRest!34090 ((as const (Array (_ BitVec 32) ValueCell!10220)) mapDefault!34099)))))

(declare-fun e!542447 () Bool)

(declare-fun mapRes!34099 () Bool)

(assert (=> mapNonEmpty!34090 (= tp!65020 (and e!542447 mapRes!34099))))

(declare-fun mapIsEmpty!34099 () Bool)

(assert (=> mapIsEmpty!34099 mapRes!34099))

(declare-fun b!962037 () Bool)

(declare-fun e!542448 () Bool)

(assert (=> b!962037 (= e!542448 tp_is_empty!21403)))

(declare-fun mapNonEmpty!34099 () Bool)

(declare-fun tp!65029 () Bool)

(assert (=> mapNonEmpty!34099 (= mapRes!34099 (and tp!65029 e!542448))))

(declare-fun mapKey!34099 () (_ BitVec 32))

(declare-fun mapRest!34099 () (Array (_ BitVec 32) ValueCell!10220))

(declare-fun mapValue!34099 () ValueCell!10220)

(assert (=> mapNonEmpty!34099 (= mapRest!34090 (store mapRest!34099 mapKey!34099 mapValue!34099))))

(declare-fun b!962038 () Bool)

(assert (=> b!962038 (= e!542447 tp_is_empty!21403)))

(assert (= (and mapNonEmpty!34090 condMapEmpty!34099) mapIsEmpty!34099))

(assert (= (and mapNonEmpty!34090 (not condMapEmpty!34099)) mapNonEmpty!34099))

(assert (= (and mapNonEmpty!34099 ((_ is ValueCellFull!10220) mapValue!34099)) b!962037))

(assert (= (and mapNonEmpty!34090 ((_ is ValueCellFull!10220) mapDefault!34099)) b!962038))

(declare-fun m!892495 () Bool)

(assert (=> mapNonEmpty!34099 m!892495))

(check-sat (not b!962029) (not bm!41765) tp_is_empty!21403 (not b!962028) (not mapNonEmpty!34099))
(check-sat)
