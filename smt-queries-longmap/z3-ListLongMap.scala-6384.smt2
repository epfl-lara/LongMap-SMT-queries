; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82224 () Bool)

(assert start!82224)

(declare-fun b!957833 () Bool)

(declare-fun e!539857 () Bool)

(declare-fun e!539856 () Bool)

(declare-fun mapRes!33583 () Bool)

(assert (=> b!957833 (= e!539857 (and e!539856 mapRes!33583))))

(declare-fun condMapEmpty!33583 () Bool)

(declare-datatypes ((V!33089 0))(
  ( (V!33090 (val!10590 Int)) )
))
(declare-datatypes ((ValueCell!10058 0))(
  ( (ValueCellFull!10058 (v!13143 V!33089)) (EmptyCell!10058) )
))
(declare-datatypes ((array!58292 0))(
  ( (array!58293 (arr!28020 (Array (_ BitVec 32) ValueCell!10058)) (size!28500 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58292)

(declare-fun mapDefault!33583 () ValueCell!10058)

(assert (=> b!957833 (= condMapEmpty!33583 (= (arr!28020 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10058)) mapDefault!33583)))))

(declare-fun mapNonEmpty!33583 () Bool)

(declare-fun tp!64189 () Bool)

(declare-fun e!539855 () Bool)

(assert (=> mapNonEmpty!33583 (= mapRes!33583 (and tp!64189 e!539855))))

(declare-fun mapKey!33583 () (_ BitVec 32))

(declare-fun mapValue!33583 () ValueCell!10058)

(declare-fun mapRest!33583 () (Array (_ BitVec 32) ValueCell!10058))

(assert (=> mapNonEmpty!33583 (= (arr!28020 _values!1386) (store mapRest!33583 mapKey!33583 mapValue!33583))))

(declare-fun mapIsEmpty!33583 () Bool)

(assert (=> mapIsEmpty!33583 mapRes!33583))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58294 0))(
  ( (array!58295 (arr!28021 (Array (_ BitVec 32) (_ BitVec 64))) (size!28501 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58294)

(declare-fun b!957832 () Bool)

(declare-fun e!539854 () Bool)

(assert (=> b!957832 (= e!539854 (and (= (size!28500 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28501 _keys!1668) (size!28500 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011) (= (size!28501 _keys!1668) (bvadd #b00000000000000000000000000000001 mask!2088)) (bvsgt #b00000000000000000000000000000000 (size!28501 _keys!1668))))))

(declare-fun res!641018 () Bool)

(assert (=> start!82224 (=> (not res!641018) (not e!539854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82224 (= res!641018 (validMask!0 mask!2088))))

(assert (=> start!82224 e!539854))

(assert (=> start!82224 true))

(declare-fun array_inv!21811 (array!58292) Bool)

(assert (=> start!82224 (and (array_inv!21811 _values!1386) e!539857)))

(declare-fun array_inv!21812 (array!58294) Bool)

(assert (=> start!82224 (array_inv!21812 _keys!1668)))

(declare-fun b!957834 () Bool)

(declare-fun tp_is_empty!21079 () Bool)

(assert (=> b!957834 (= e!539856 tp_is_empty!21079)))

(declare-fun b!957835 () Bool)

(assert (=> b!957835 (= e!539855 tp_is_empty!21079)))

(assert (= (and start!82224 res!641018) b!957832))

(assert (= (and b!957833 condMapEmpty!33583) mapIsEmpty!33583))

(assert (= (and b!957833 (not condMapEmpty!33583)) mapNonEmpty!33583))

(get-info :version)

(assert (= (and mapNonEmpty!33583 ((_ is ValueCellFull!10058) mapValue!33583)) b!957835))

(assert (= (and b!957833 ((_ is ValueCellFull!10058) mapDefault!33583)) b!957834))

(assert (= start!82224 b!957833))

(declare-fun m!889391 () Bool)

(assert (=> mapNonEmpty!33583 m!889391))

(declare-fun m!889393 () Bool)

(assert (=> start!82224 m!889393))

(declare-fun m!889395 () Bool)

(assert (=> start!82224 m!889395))

(declare-fun m!889397 () Bool)

(assert (=> start!82224 m!889397))

(check-sat (not start!82224) (not mapNonEmpty!33583) tp_is_empty!21079)
(check-sat)
(get-model)

(declare-fun d!116185 () Bool)

(assert (=> d!116185 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82224 d!116185))

(declare-fun d!116187 () Bool)

(assert (=> d!116187 (= (array_inv!21811 _values!1386) (bvsge (size!28500 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82224 d!116187))

(declare-fun d!116189 () Bool)

(assert (=> d!116189 (= (array_inv!21812 _keys!1668) (bvsge (size!28501 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82224 d!116189))

(declare-fun b!957867 () Bool)

(declare-fun e!539892 () Bool)

(assert (=> b!957867 (= e!539892 tp_is_empty!21079)))

(declare-fun condMapEmpty!33592 () Bool)

(declare-fun mapDefault!33592 () ValueCell!10058)

(assert (=> mapNonEmpty!33583 (= condMapEmpty!33592 (= mapRest!33583 ((as const (Array (_ BitVec 32) ValueCell!10058)) mapDefault!33592)))))

(declare-fun mapRes!33592 () Bool)

(assert (=> mapNonEmpty!33583 (= tp!64189 (and e!539892 mapRes!33592))))

(declare-fun mapIsEmpty!33592 () Bool)

(assert (=> mapIsEmpty!33592 mapRes!33592))

(declare-fun mapNonEmpty!33592 () Bool)

(declare-fun tp!64198 () Bool)

(declare-fun e!539893 () Bool)

(assert (=> mapNonEmpty!33592 (= mapRes!33592 (and tp!64198 e!539893))))

(declare-fun mapValue!33592 () ValueCell!10058)

(declare-fun mapKey!33592 () (_ BitVec 32))

(declare-fun mapRest!33592 () (Array (_ BitVec 32) ValueCell!10058))

(assert (=> mapNonEmpty!33592 (= mapRest!33583 (store mapRest!33592 mapKey!33592 mapValue!33592))))

(declare-fun b!957866 () Bool)

(assert (=> b!957866 (= e!539893 tp_is_empty!21079)))

(assert (= (and mapNonEmpty!33583 condMapEmpty!33592) mapIsEmpty!33592))

(assert (= (and mapNonEmpty!33583 (not condMapEmpty!33592)) mapNonEmpty!33592))

(assert (= (and mapNonEmpty!33592 ((_ is ValueCellFull!10058) mapValue!33592)) b!957866))

(assert (= (and mapNonEmpty!33583 ((_ is ValueCellFull!10058) mapDefault!33592)) b!957867))

(declare-fun m!889415 () Bool)

(assert (=> mapNonEmpty!33592 m!889415))

(check-sat (not mapNonEmpty!33592) tp_is_empty!21079)
(check-sat)
