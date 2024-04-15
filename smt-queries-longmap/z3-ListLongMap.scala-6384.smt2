; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82038 () Bool)

(assert start!82038)

(declare-fun b!956690 () Bool)

(declare-fun e!539125 () Bool)

(declare-fun e!539126 () Bool)

(declare-fun mapRes!33583 () Bool)

(assert (=> b!956690 (= e!539125 (and e!539126 mapRes!33583))))

(declare-fun condMapEmpty!33583 () Bool)

(declare-datatypes ((V!33089 0))(
  ( (V!33090 (val!10590 Int)) )
))
(declare-datatypes ((ValueCell!10058 0))(
  ( (ValueCellFull!10058 (v!13145 V!33089)) (EmptyCell!10058) )
))
(declare-datatypes ((array!58200 0))(
  ( (array!58201 (arr!27979 (Array (_ BitVec 32) ValueCell!10058)) (size!28460 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58200)

(declare-fun mapDefault!33583 () ValueCell!10058)

(assert (=> b!956690 (= condMapEmpty!33583 (= (arr!27979 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10058)) mapDefault!33583)))))

(declare-fun mapNonEmpty!33583 () Bool)

(declare-fun tp!64189 () Bool)

(declare-fun e!539127 () Bool)

(assert (=> mapNonEmpty!33583 (= mapRes!33583 (and tp!64189 e!539127))))

(declare-fun mapRest!33583 () (Array (_ BitVec 32) ValueCell!10058))

(declare-fun mapKey!33583 () (_ BitVec 32))

(declare-fun mapValue!33583 () ValueCell!10058)

(assert (=> mapNonEmpty!33583 (= (arr!27979 _values!1386) (store mapRest!33583 mapKey!33583 mapValue!33583))))

(declare-fun res!640564 () Bool)

(declare-fun e!539123 () Bool)

(assert (=> start!82038 (=> (not res!640564) (not e!539123))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82038 (= res!640564 (validMask!0 mask!2088))))

(assert (=> start!82038 e!539123))

(assert (=> start!82038 true))

(declare-fun array_inv!21767 (array!58200) Bool)

(assert (=> start!82038 (and (array_inv!21767 _values!1386) e!539125)))

(declare-datatypes ((array!58202 0))(
  ( (array!58203 (arr!27980 (Array (_ BitVec 32) (_ BitVec 64))) (size!28461 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58202)

(declare-fun array_inv!21768 (array!58202) Bool)

(assert (=> start!82038 (array_inv!21768 _keys!1668)))

(declare-fun mapIsEmpty!33583 () Bool)

(assert (=> mapIsEmpty!33583 mapRes!33583))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-fun b!956691 () Bool)

(assert (=> b!956691 (= e!539123 (and (= (size!28460 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28461 _keys!1668) (size!28460 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011) (= (size!28461 _keys!1668) (bvadd #b00000000000000000000000000000001 mask!2088)) (bvsgt #b00000000000000000000000000000000 (size!28461 _keys!1668))))))

(declare-fun b!956692 () Bool)

(declare-fun tp_is_empty!21079 () Bool)

(assert (=> b!956692 (= e!539127 tp_is_empty!21079)))

(declare-fun b!956693 () Bool)

(assert (=> b!956693 (= e!539126 tp_is_empty!21079)))

(assert (= (and start!82038 res!640564) b!956691))

(assert (= (and b!956690 condMapEmpty!33583) mapIsEmpty!33583))

(assert (= (and b!956690 (not condMapEmpty!33583)) mapNonEmpty!33583))

(get-info :version)

(assert (= (and mapNonEmpty!33583 ((_ is ValueCellFull!10058) mapValue!33583)) b!956692))

(assert (= (and b!956690 ((_ is ValueCellFull!10058) mapDefault!33583)) b!956693))

(assert (= start!82038 b!956690))

(declare-fun m!887339 () Bool)

(assert (=> mapNonEmpty!33583 m!887339))

(declare-fun m!887341 () Bool)

(assert (=> start!82038 m!887341))

(declare-fun m!887343 () Bool)

(assert (=> start!82038 m!887343))

(declare-fun m!887345 () Bool)

(assert (=> start!82038 m!887345))

(check-sat (not start!82038) (not mapNonEmpty!33583) tp_is_empty!21079)
(check-sat)
(get-model)

(declare-fun d!115665 () Bool)

(assert (=> d!115665 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82038 d!115665))

(declare-fun d!115667 () Bool)

(assert (=> d!115667 (= (array_inv!21767 _values!1386) (bvsge (size!28460 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82038 d!115667))

(declare-fun d!115669 () Bool)

(assert (=> d!115669 (= (array_inv!21768 _keys!1668) (bvsge (size!28461 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82038 d!115669))

(declare-fun mapIsEmpty!33592 () Bool)

(declare-fun mapRes!33592 () Bool)

(assert (=> mapIsEmpty!33592 mapRes!33592))

(declare-fun condMapEmpty!33592 () Bool)

(declare-fun mapDefault!33592 () ValueCell!10058)

(assert (=> mapNonEmpty!33583 (= condMapEmpty!33592 (= mapRest!33583 ((as const (Array (_ BitVec 32) ValueCell!10058)) mapDefault!33592)))))

(declare-fun e!539163 () Bool)

(assert (=> mapNonEmpty!33583 (= tp!64189 (and e!539163 mapRes!33592))))

(declare-fun b!956724 () Bool)

(declare-fun e!539162 () Bool)

(assert (=> b!956724 (= e!539162 tp_is_empty!21079)))

(declare-fun b!956725 () Bool)

(assert (=> b!956725 (= e!539163 tp_is_empty!21079)))

(declare-fun mapNonEmpty!33592 () Bool)

(declare-fun tp!64198 () Bool)

(assert (=> mapNonEmpty!33592 (= mapRes!33592 (and tp!64198 e!539162))))

(declare-fun mapValue!33592 () ValueCell!10058)

(declare-fun mapRest!33592 () (Array (_ BitVec 32) ValueCell!10058))

(declare-fun mapKey!33592 () (_ BitVec 32))

(assert (=> mapNonEmpty!33592 (= mapRest!33583 (store mapRest!33592 mapKey!33592 mapValue!33592))))

(assert (= (and mapNonEmpty!33583 condMapEmpty!33592) mapIsEmpty!33592))

(assert (= (and mapNonEmpty!33583 (not condMapEmpty!33592)) mapNonEmpty!33592))

(assert (= (and mapNonEmpty!33592 ((_ is ValueCellFull!10058) mapValue!33592)) b!956724))

(assert (= (and mapNonEmpty!33583 ((_ is ValueCellFull!10058) mapDefault!33592)) b!956725))

(declare-fun m!887363 () Bool)

(assert (=> mapNonEmpty!33592 m!887363))

(check-sat (not mapNonEmpty!33592) tp_is_empty!21079)
(check-sat)
