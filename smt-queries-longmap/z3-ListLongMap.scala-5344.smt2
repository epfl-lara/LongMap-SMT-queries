; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71592 () Bool)

(assert start!71592)

(declare-fun b_free!13471 () Bool)

(declare-fun b_next!13471 () Bool)

(assert (=> start!71592 (= b_free!13471 (not b_next!13471))))

(declare-fun tp!47193 () Bool)

(declare-fun b_and!22487 () Bool)

(assert (=> start!71592 (= tp!47193 b_and!22487)))

(declare-fun b!830393 () Bool)

(declare-fun e!462948 () Bool)

(declare-fun tp_is_empty!15181 () Bool)

(assert (=> b!830393 (= e!462948 tp_is_empty!15181)))

(declare-fun b!830394 () Bool)

(declare-fun res!565412 () Bool)

(declare-fun e!462950 () Bool)

(assert (=> b!830394 (=> (not res!565412) (not e!462950))))

(declare-datatypes ((array!46541 0))(
  ( (array!46542 (arr!22304 (Array (_ BitVec 32) (_ BitVec 64))) (size!22724 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46541)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25243 0))(
  ( (V!25244 (val!7638 Int)) )
))
(declare-datatypes ((ValueCell!7175 0))(
  ( (ValueCellFull!7175 (v!10078 V!25243)) (EmptyCell!7175) )
))
(declare-datatypes ((array!46543 0))(
  ( (array!46544 (arr!22305 (Array (_ BitVec 32) ValueCell!7175)) (size!22725 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46543)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!830394 (= res!565412 (and (= (size!22725 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22724 _keys!976) (size!22725 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24418 () Bool)

(declare-fun mapRes!24418 () Bool)

(assert (=> mapIsEmpty!24418 mapRes!24418))

(declare-fun b!830395 () Bool)

(declare-fun e!462951 () Bool)

(assert (=> b!830395 (= e!462951 tp_is_empty!15181)))

(declare-fun b!830396 () Bool)

(declare-fun e!462946 () Bool)

(assert (=> b!830396 (= e!462950 (not e!462946))))

(declare-fun res!565409 () Bool)

(assert (=> b!830396 (=> res!565409 e!462946)))

(assert (=> b!830396 (= res!565409 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10056 0))(
  ( (tuple2!10057 (_1!5039 (_ BitVec 64)) (_2!5039 V!25243)) )
))
(declare-datatypes ((List!15829 0))(
  ( (Nil!15826) (Cons!15825 (h!16960 tuple2!10056) (t!22182 List!15829)) )
))
(declare-datatypes ((ListLongMap!8881 0))(
  ( (ListLongMap!8882 (toList!4456 List!15829)) )
))
(declare-fun lt!376509 () ListLongMap!8881)

(declare-fun lt!376505 () ListLongMap!8881)

(assert (=> b!830396 (= lt!376509 lt!376505)))

(declare-fun zeroValueBefore!34 () V!25243)

(declare-fun zeroValueAfter!34 () V!25243)

(declare-fun minValue!754 () V!25243)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28426 0))(
  ( (Unit!28427) )
))
(declare-fun lt!376507 () Unit!28426)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!595 (array!46541 array!46543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25243 V!25243 V!25243 V!25243 (_ BitVec 32) Int) Unit!28426)

(assert (=> b!830396 (= lt!376507 (lemmaNoChangeToArrayThenSameMapNoExtras!595 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2528 (array!46541 array!46543 (_ BitVec 32) (_ BitVec 32) V!25243 V!25243 (_ BitVec 32) Int) ListLongMap!8881)

(assert (=> b!830396 (= lt!376505 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830396 (= lt!376509 (getCurrentListMapNoExtraKeys!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830397 () Bool)

(declare-fun e!462947 () Bool)

(assert (=> b!830397 (= e!462947 (and e!462951 mapRes!24418))))

(declare-fun condMapEmpty!24418 () Bool)

(declare-fun mapDefault!24418 () ValueCell!7175)

(assert (=> b!830397 (= condMapEmpty!24418 (= (arr!22305 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7175)) mapDefault!24418)))))

(declare-fun b!830398 () Bool)

(declare-fun res!565410 () Bool)

(assert (=> b!830398 (=> (not res!565410) (not e!462950))))

(declare-datatypes ((List!15830 0))(
  ( (Nil!15827) (Cons!15826 (h!16961 (_ BitVec 64)) (t!22183 List!15830)) )
))
(declare-fun arrayNoDuplicates!0 (array!46541 (_ BitVec 32) List!15830) Bool)

(assert (=> b!830398 (= res!565410 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15827))))

(declare-fun b!830399 () Bool)

(assert (=> b!830399 (= e!462946 true)))

(declare-fun e!462949 () Bool)

(assert (=> b!830399 e!462949))

(declare-fun res!565411 () Bool)

(assert (=> b!830399 (=> (not res!565411) (not e!462949))))

(declare-fun lt!376508 () tuple2!10056)

(declare-fun lt!376510 () ListLongMap!8881)

(declare-fun +!1979 (ListLongMap!8881 tuple2!10056) ListLongMap!8881)

(assert (=> b!830399 (= res!565411 (= lt!376510 (+!1979 lt!376509 lt!376508)))))

(assert (=> b!830399 (= lt!376508 (tuple2!10057 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!376506 () ListLongMap!8881)

(declare-fun getCurrentListMap!2551 (array!46541 array!46543 (_ BitVec 32) (_ BitVec 32) V!25243 V!25243 (_ BitVec 32) Int) ListLongMap!8881)

(assert (=> b!830399 (= lt!376506 (getCurrentListMap!2551 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!830399 (= lt!376510 (getCurrentListMap!2551 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!830400 () Bool)

(assert (=> b!830400 (= e!462949 (= lt!376506 (+!1979 (+!1979 lt!376509 (tuple2!10057 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!376508)))))

(declare-fun mapNonEmpty!24418 () Bool)

(declare-fun tp!47194 () Bool)

(assert (=> mapNonEmpty!24418 (= mapRes!24418 (and tp!47194 e!462948))))

(declare-fun mapKey!24418 () (_ BitVec 32))

(declare-fun mapValue!24418 () ValueCell!7175)

(declare-fun mapRest!24418 () (Array (_ BitVec 32) ValueCell!7175))

(assert (=> mapNonEmpty!24418 (= (arr!22305 _values!788) (store mapRest!24418 mapKey!24418 mapValue!24418))))

(declare-fun res!565408 () Bool)

(assert (=> start!71592 (=> (not res!565408) (not e!462950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71592 (= res!565408 (validMask!0 mask!1312))))

(assert (=> start!71592 e!462950))

(assert (=> start!71592 tp_is_empty!15181))

(declare-fun array_inv!17807 (array!46541) Bool)

(assert (=> start!71592 (array_inv!17807 _keys!976)))

(assert (=> start!71592 true))

(declare-fun array_inv!17808 (array!46543) Bool)

(assert (=> start!71592 (and (array_inv!17808 _values!788) e!462947)))

(assert (=> start!71592 tp!47193))

(declare-fun b!830401 () Bool)

(declare-fun res!565413 () Bool)

(assert (=> b!830401 (=> (not res!565413) (not e!462950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46541 (_ BitVec 32)) Bool)

(assert (=> b!830401 (= res!565413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71592 res!565408) b!830394))

(assert (= (and b!830394 res!565412) b!830401))

(assert (= (and b!830401 res!565413) b!830398))

(assert (= (and b!830398 res!565410) b!830396))

(assert (= (and b!830396 (not res!565409)) b!830399))

(assert (= (and b!830399 res!565411) b!830400))

(assert (= (and b!830397 condMapEmpty!24418) mapIsEmpty!24418))

(assert (= (and b!830397 (not condMapEmpty!24418)) mapNonEmpty!24418))

(get-info :version)

(assert (= (and mapNonEmpty!24418 ((_ is ValueCellFull!7175) mapValue!24418)) b!830393))

(assert (= (and b!830397 ((_ is ValueCellFull!7175) mapDefault!24418)) b!830395))

(assert (= start!71592 b!830397))

(declare-fun m!773767 () Bool)

(assert (=> b!830396 m!773767))

(declare-fun m!773769 () Bool)

(assert (=> b!830396 m!773769))

(declare-fun m!773771 () Bool)

(assert (=> b!830396 m!773771))

(declare-fun m!773773 () Bool)

(assert (=> b!830400 m!773773))

(assert (=> b!830400 m!773773))

(declare-fun m!773775 () Bool)

(assert (=> b!830400 m!773775))

(declare-fun m!773777 () Bool)

(assert (=> mapNonEmpty!24418 m!773777))

(declare-fun m!773779 () Bool)

(assert (=> start!71592 m!773779))

(declare-fun m!773781 () Bool)

(assert (=> start!71592 m!773781))

(declare-fun m!773783 () Bool)

(assert (=> start!71592 m!773783))

(declare-fun m!773785 () Bool)

(assert (=> b!830399 m!773785))

(declare-fun m!773787 () Bool)

(assert (=> b!830399 m!773787))

(declare-fun m!773789 () Bool)

(assert (=> b!830399 m!773789))

(declare-fun m!773791 () Bool)

(assert (=> b!830401 m!773791))

(declare-fun m!773793 () Bool)

(assert (=> b!830398 m!773793))

(check-sat (not b_next!13471) (not b!830401) (not b!830399) (not b!830398) b_and!22487 (not start!71592) (not mapNonEmpty!24418) (not b!830400) (not b!830396) tp_is_empty!15181)
(check-sat b_and!22487 (not b_next!13471))
