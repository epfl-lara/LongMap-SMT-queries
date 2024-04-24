; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71388 () Bool)

(assert start!71388)

(declare-fun b_free!13369 () Bool)

(declare-fun b_next!13369 () Bool)

(assert (=> start!71388 (= b_free!13369 (not b_next!13369))))

(declare-fun tp!46870 () Bool)

(declare-fun b_and!22317 () Bool)

(assert (=> start!71388 (= tp!46870 b_and!22317)))

(declare-fun res!564256 () Bool)

(declare-fun e!461436 () Bool)

(assert (=> start!71388 (=> (not res!564256) (not e!461436))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71388 (= res!564256 (validMask!0 mask!1312))))

(assert (=> start!71388 e!461436))

(declare-fun tp_is_empty!15079 () Bool)

(assert (=> start!71388 tp_is_empty!15079))

(declare-datatypes ((array!46337 0))(
  ( (array!46338 (arr!22208 (Array (_ BitVec 32) (_ BitVec 64))) (size!22628 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46337)

(declare-fun array_inv!17739 (array!46337) Bool)

(assert (=> start!71388 (array_inv!17739 _keys!976)))

(assert (=> start!71388 true))

(declare-datatypes ((V!25107 0))(
  ( (V!25108 (val!7587 Int)) )
))
(declare-datatypes ((ValueCell!7124 0))(
  ( (ValueCellFull!7124 (v!10022 V!25107)) (EmptyCell!7124) )
))
(declare-datatypes ((array!46339 0))(
  ( (array!46340 (arr!22209 (Array (_ BitVec 32) ValueCell!7124)) (size!22629 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46339)

(declare-fun e!461434 () Bool)

(declare-fun array_inv!17740 (array!46339) Bool)

(assert (=> start!71388 (and (array_inv!17740 _values!788) e!461434)))

(assert (=> start!71388 tp!46870))

(declare-fun b!828217 () Bool)

(declare-fun res!564257 () Bool)

(assert (=> b!828217 (=> (not res!564257) (not e!461436))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828217 (= res!564257 (and (= (size!22629 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22628 _keys!976) (size!22629 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828218 () Bool)

(declare-fun e!461433 () Bool)

(declare-fun mapRes!24247 () Bool)

(assert (=> b!828218 (= e!461434 (and e!461433 mapRes!24247))))

(declare-fun condMapEmpty!24247 () Bool)

(declare-fun mapDefault!24247 () ValueCell!7124)

(assert (=> b!828218 (= condMapEmpty!24247 (= (arr!22209 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7124)) mapDefault!24247)))))

(declare-fun b!828219 () Bool)

(declare-fun res!564255 () Bool)

(assert (=> b!828219 (=> (not res!564255) (not e!461436))))

(declare-datatypes ((List!15758 0))(
  ( (Nil!15755) (Cons!15754 (h!16889 (_ BitVec 64)) (t!22099 List!15758)) )
))
(declare-fun arrayNoDuplicates!0 (array!46337 (_ BitVec 32) List!15758) Bool)

(assert (=> b!828219 (= res!564255 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15755))))

(declare-fun b!828220 () Bool)

(declare-fun res!564258 () Bool)

(assert (=> b!828220 (=> (not res!564258) (not e!461436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46337 (_ BitVec 32)) Bool)

(assert (=> b!828220 (= res!564258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828221 () Bool)

(assert (=> b!828221 (= e!461433 tp_is_empty!15079)))

(declare-fun mapIsEmpty!24247 () Bool)

(assert (=> mapIsEmpty!24247 mapRes!24247))

(declare-fun b!828222 () Bool)

(assert (=> b!828222 (= e!461436 false)))

(declare-fun zeroValueAfter!34 () V!25107)

(declare-fun minValue!754 () V!25107)

(declare-datatypes ((tuple2!9984 0))(
  ( (tuple2!9985 (_1!5003 (_ BitVec 64)) (_2!5003 V!25107)) )
))
(declare-datatypes ((List!15759 0))(
  ( (Nil!15756) (Cons!15755 (h!16890 tuple2!9984) (t!22100 List!15759)) )
))
(declare-datatypes ((ListLongMap!8809 0))(
  ( (ListLongMap!8810 (toList!4420 List!15759)) )
))
(declare-fun lt!375227 () ListLongMap!8809)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2497 (array!46337 array!46339 (_ BitVec 32) (_ BitVec 32) V!25107 V!25107 (_ BitVec 32) Int) ListLongMap!8809)

(assert (=> b!828222 (= lt!375227 (getCurrentListMapNoExtraKeys!2497 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25107)

(declare-fun lt!375226 () ListLongMap!8809)

(assert (=> b!828222 (= lt!375226 (getCurrentListMapNoExtraKeys!2497 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828223 () Bool)

(declare-fun e!461437 () Bool)

(assert (=> b!828223 (= e!461437 tp_is_empty!15079)))

(declare-fun mapNonEmpty!24247 () Bool)

(declare-fun tp!46869 () Bool)

(assert (=> mapNonEmpty!24247 (= mapRes!24247 (and tp!46869 e!461437))))

(declare-fun mapRest!24247 () (Array (_ BitVec 32) ValueCell!7124))

(declare-fun mapValue!24247 () ValueCell!7124)

(declare-fun mapKey!24247 () (_ BitVec 32))

(assert (=> mapNonEmpty!24247 (= (arr!22209 _values!788) (store mapRest!24247 mapKey!24247 mapValue!24247))))

(assert (= (and start!71388 res!564256) b!828217))

(assert (= (and b!828217 res!564257) b!828220))

(assert (= (and b!828220 res!564258) b!828219))

(assert (= (and b!828219 res!564255) b!828222))

(assert (= (and b!828218 condMapEmpty!24247) mapIsEmpty!24247))

(assert (= (and b!828218 (not condMapEmpty!24247)) mapNonEmpty!24247))

(get-info :version)

(assert (= (and mapNonEmpty!24247 ((_ is ValueCellFull!7124) mapValue!24247)) b!828223))

(assert (= (and b!828218 ((_ is ValueCellFull!7124) mapDefault!24247)) b!828221))

(assert (= start!71388 b!828218))

(declare-fun m!771713 () Bool)

(assert (=> mapNonEmpty!24247 m!771713))

(declare-fun m!771715 () Bool)

(assert (=> start!71388 m!771715))

(declare-fun m!771717 () Bool)

(assert (=> start!71388 m!771717))

(declare-fun m!771719 () Bool)

(assert (=> start!71388 m!771719))

(declare-fun m!771721 () Bool)

(assert (=> b!828219 m!771721))

(declare-fun m!771723 () Bool)

(assert (=> b!828222 m!771723))

(declare-fun m!771725 () Bool)

(assert (=> b!828222 m!771725))

(declare-fun m!771727 () Bool)

(assert (=> b!828220 m!771727))

(check-sat tp_is_empty!15079 (not b!828220) (not b_next!13369) (not start!71388) (not b!828219) b_and!22317 (not mapNonEmpty!24247) (not b!828222))
(check-sat b_and!22317 (not b_next!13369))
