; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82050 () Bool)

(assert start!82050)

(declare-fun b!956738 () Bool)

(declare-fun res!640579 () Bool)

(declare-fun e!539174 () Bool)

(assert (=> b!956738 (=> (not res!640579) (not e!539174))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((V!33097 0))(
  ( (V!33098 (val!10593 Int)) )
))
(declare-datatypes ((ValueCell!10061 0))(
  ( (ValueCellFull!10061 (v!13148 V!33097)) (EmptyCell!10061) )
))
(declare-datatypes ((array!58212 0))(
  ( (array!58213 (arr!27984 (Array (_ BitVec 32) ValueCell!10061)) (size!28465 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58212)

(declare-datatypes ((array!58214 0))(
  ( (array!58215 (arr!27985 (Array (_ BitVec 32) (_ BitVec 64))) (size!28466 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58214)

(assert (=> b!956738 (= res!640579 (and (= (size!28465 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28466 _keys!1668) (size!28465 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33595 () Bool)

(declare-fun mapRes!33595 () Bool)

(declare-fun tp!64201 () Bool)

(declare-fun e!539178 () Bool)

(assert (=> mapNonEmpty!33595 (= mapRes!33595 (and tp!64201 e!539178))))

(declare-fun mapKey!33595 () (_ BitVec 32))

(declare-fun mapRest!33595 () (Array (_ BitVec 32) ValueCell!10061))

(declare-fun mapValue!33595 () ValueCell!10061)

(assert (=> mapNonEmpty!33595 (= (arr!27984 _values!1386) (store mapRest!33595 mapKey!33595 mapValue!33595))))

(declare-fun b!956739 () Bool)

(declare-fun e!539177 () Bool)

(declare-fun e!539176 () Bool)

(assert (=> b!956739 (= e!539177 (and e!539176 mapRes!33595))))

(declare-fun condMapEmpty!33595 () Bool)

(declare-fun mapDefault!33595 () ValueCell!10061)

(assert (=> b!956739 (= condMapEmpty!33595 (= (arr!27984 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10061)) mapDefault!33595)))))

(declare-fun res!640577 () Bool)

(assert (=> start!82050 (=> (not res!640577) (not e!539174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82050 (= res!640577 (validMask!0 mask!2088))))

(assert (=> start!82050 e!539174))

(assert (=> start!82050 true))

(declare-fun array_inv!21771 (array!58212) Bool)

(assert (=> start!82050 (and (array_inv!21771 _values!1386) e!539177)))

(declare-fun array_inv!21772 (array!58214) Bool)

(assert (=> start!82050 (array_inv!21772 _keys!1668)))

(declare-fun mapIsEmpty!33595 () Bool)

(assert (=> mapIsEmpty!33595 mapRes!33595))

(declare-fun b!956740 () Bool)

(declare-fun tp_is_empty!21085 () Bool)

(assert (=> b!956740 (= e!539176 tp_is_empty!21085)))

(declare-fun b!956741 () Bool)

(declare-fun res!640578 () Bool)

(assert (=> b!956741 (=> (not res!640578) (not e!539174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58214 (_ BitVec 32)) Bool)

(assert (=> b!956741 (= res!640578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!956742 () Bool)

(assert (=> b!956742 (= e!539178 tp_is_empty!21085)))

(declare-fun b!956743 () Bool)

(assert (=> b!956743 (= e!539174 (bvsgt #b00000000000000000000000000000000 (size!28466 _keys!1668)))))

(assert (= (and start!82050 res!640577) b!956738))

(assert (= (and b!956738 res!640579) b!956741))

(assert (= (and b!956741 res!640578) b!956743))

(assert (= (and b!956739 condMapEmpty!33595) mapIsEmpty!33595))

(assert (= (and b!956739 (not condMapEmpty!33595)) mapNonEmpty!33595))

(get-info :version)

(assert (= (and mapNonEmpty!33595 ((_ is ValueCellFull!10061) mapValue!33595)) b!956742))

(assert (= (and b!956739 ((_ is ValueCellFull!10061) mapDefault!33595)) b!956740))

(assert (= start!82050 b!956739))

(declare-fun m!887365 () Bool)

(assert (=> mapNonEmpty!33595 m!887365))

(declare-fun m!887367 () Bool)

(assert (=> start!82050 m!887367))

(declare-fun m!887369 () Bool)

(assert (=> start!82050 m!887369))

(declare-fun m!887371 () Bool)

(assert (=> start!82050 m!887371))

(declare-fun m!887373 () Bool)

(assert (=> b!956741 m!887373))

(check-sat (not start!82050) (not b!956741) (not mapNonEmpty!33595) tp_is_empty!21085)
(check-sat)
(get-model)

(declare-fun d!115673 () Bool)

(assert (=> d!115673 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82050 d!115673))

(declare-fun d!115675 () Bool)

(assert (=> d!115675 (= (array_inv!21771 _values!1386) (bvsge (size!28465 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82050 d!115675))

(declare-fun d!115677 () Bool)

(assert (=> d!115677 (= (array_inv!21772 _keys!1668) (bvsge (size!28466 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82050 d!115677))

(declare-fun b!956788 () Bool)

(declare-fun e!539217 () Bool)

(declare-fun e!539216 () Bool)

(assert (=> b!956788 (= e!539217 e!539216)))

(declare-fun c!99831 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956788 (= c!99831 (validKeyInArray!0 (select (arr!27985 _keys!1668) #b00000000000000000000000000000000)))))

(declare-fun bm!41679 () Bool)

(declare-fun call!41682 () Bool)

(assert (=> bm!41679 (= call!41682 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(declare-fun b!956789 () Bool)

(declare-fun e!539215 () Bool)

(assert (=> b!956789 (= e!539216 e!539215)))

(declare-fun lt!430033 () (_ BitVec 64))

(assert (=> b!956789 (= lt!430033 (select (arr!27985 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32012 0))(
  ( (Unit!32013) )
))
(declare-fun lt!430035 () Unit!32012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58214 (_ BitVec 64) (_ BitVec 32)) Unit!32012)

(assert (=> b!956789 (= lt!430035 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430033 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!956789 (arrayContainsKey!0 _keys!1668 lt!430033 #b00000000000000000000000000000000)))

(declare-fun lt!430034 () Unit!32012)

(assert (=> b!956789 (= lt!430034 lt!430035)))

(declare-fun res!640603 () Bool)

(declare-datatypes ((SeekEntryResult!9184 0))(
  ( (MissingZero!9184 (index!39107 (_ BitVec 32))) (Found!9184 (index!39108 (_ BitVec 32))) (Intermediate!9184 (undefined!9996 Bool) (index!39109 (_ BitVec 32)) (x!82467 (_ BitVec 32))) (Undefined!9184) (MissingVacant!9184 (index!39110 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58214 (_ BitVec 32)) SeekEntryResult!9184)

(assert (=> b!956789 (= res!640603 (= (seekEntryOrOpen!0 (select (arr!27985 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9184 #b00000000000000000000000000000000)))))

(assert (=> b!956789 (=> (not res!640603) (not e!539215))))

(declare-fun b!956790 () Bool)

(assert (=> b!956790 (= e!539215 call!41682)))

(declare-fun b!956791 () Bool)

(assert (=> b!956791 (= e!539216 call!41682)))

(declare-fun d!115679 () Bool)

(declare-fun res!640602 () Bool)

(assert (=> d!115679 (=> res!640602 e!539217)))

(assert (=> d!115679 (= res!640602 (bvsge #b00000000000000000000000000000000 (size!28466 _keys!1668)))))

(assert (=> d!115679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!539217)))

(assert (= (and d!115679 (not res!640602)) b!956788))

(assert (= (and b!956788 c!99831) b!956789))

(assert (= (and b!956788 (not c!99831)) b!956791))

(assert (= (and b!956789 res!640603) b!956790))

(assert (= (or b!956790 b!956791) bm!41679))

(declare-fun m!887395 () Bool)

(assert (=> b!956788 m!887395))

(assert (=> b!956788 m!887395))

(declare-fun m!887397 () Bool)

(assert (=> b!956788 m!887397))

(declare-fun m!887399 () Bool)

(assert (=> bm!41679 m!887399))

(assert (=> b!956789 m!887395))

(declare-fun m!887401 () Bool)

(assert (=> b!956789 m!887401))

(declare-fun m!887403 () Bool)

(assert (=> b!956789 m!887403))

(assert (=> b!956789 m!887395))

(declare-fun m!887405 () Bool)

(assert (=> b!956789 m!887405))

(assert (=> b!956741 d!115679))

(declare-fun b!956799 () Bool)

(declare-fun e!539223 () Bool)

(assert (=> b!956799 (= e!539223 tp_is_empty!21085)))

(declare-fun condMapEmpty!33604 () Bool)

(declare-fun mapDefault!33604 () ValueCell!10061)

(assert (=> mapNonEmpty!33595 (= condMapEmpty!33604 (= mapRest!33595 ((as const (Array (_ BitVec 32) ValueCell!10061)) mapDefault!33604)))))

(declare-fun mapRes!33604 () Bool)

(assert (=> mapNonEmpty!33595 (= tp!64201 (and e!539223 mapRes!33604))))

(declare-fun mapNonEmpty!33604 () Bool)

(declare-fun tp!64210 () Bool)

(declare-fun e!539222 () Bool)

(assert (=> mapNonEmpty!33604 (= mapRes!33604 (and tp!64210 e!539222))))

(declare-fun mapRest!33604 () (Array (_ BitVec 32) ValueCell!10061))

(declare-fun mapValue!33604 () ValueCell!10061)

(declare-fun mapKey!33604 () (_ BitVec 32))

(assert (=> mapNonEmpty!33604 (= mapRest!33595 (store mapRest!33604 mapKey!33604 mapValue!33604))))

(declare-fun b!956798 () Bool)

(assert (=> b!956798 (= e!539222 tp_is_empty!21085)))

(declare-fun mapIsEmpty!33604 () Bool)

(assert (=> mapIsEmpty!33604 mapRes!33604))

(assert (= (and mapNonEmpty!33595 condMapEmpty!33604) mapIsEmpty!33604))

(assert (= (and mapNonEmpty!33595 (not condMapEmpty!33604)) mapNonEmpty!33604))

(assert (= (and mapNonEmpty!33604 ((_ is ValueCellFull!10061) mapValue!33604)) b!956798))

(assert (= (and mapNonEmpty!33595 ((_ is ValueCellFull!10061) mapDefault!33604)) b!956799))

(declare-fun m!887407 () Bool)

(assert (=> mapNonEmpty!33604 m!887407))

(check-sat (not b!956788) (not bm!41679) tp_is_empty!21085 (not b!956789) (not mapNonEmpty!33604))
(check-sat)
