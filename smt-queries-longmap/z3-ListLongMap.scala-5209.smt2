; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70288 () Bool)

(assert start!70288)

(declare-fun b_free!12663 () Bool)

(declare-fun b_next!12663 () Bool)

(assert (=> start!70288 (= b_free!12663 (not b_next!12663))))

(declare-fun tp!44712 () Bool)

(declare-fun b_and!21463 () Bool)

(assert (=> start!70288 (= tp!44712 b_and!21463)))

(declare-fun b!816583 () Bool)

(declare-fun e!452991 () Bool)

(declare-fun e!452989 () Bool)

(assert (=> b!816583 (= e!452991 (not e!452989))))

(declare-fun res!557495 () Bool)

(assert (=> b!816583 (=> res!557495 e!452989)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816583 (= res!557495 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24165 0))(
  ( (V!24166 (val!7234 Int)) )
))
(declare-datatypes ((tuple2!9506 0))(
  ( (tuple2!9507 (_1!4764 (_ BitVec 64)) (_2!4764 V!24165)) )
))
(declare-datatypes ((List!15334 0))(
  ( (Nil!15331) (Cons!15330 (h!16459 tuple2!9506) (t!21657 List!15334)) )
))
(declare-datatypes ((ListLongMap!8329 0))(
  ( (ListLongMap!8330 (toList!4180 List!15334)) )
))
(declare-fun lt!365763 () ListLongMap!8329)

(declare-fun lt!365766 () ListLongMap!8329)

(assert (=> b!816583 (= lt!365763 lt!365766)))

(declare-fun zeroValueBefore!34 () V!24165)

(declare-datatypes ((array!44946 0))(
  ( (array!44947 (arr!21530 (Array (_ BitVec 32) (_ BitVec 64))) (size!21951 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44946)

(declare-fun minValue!754 () V!24165)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!24165)

(declare-datatypes ((Unit!27846 0))(
  ( (Unit!27847) )
))
(declare-fun lt!365767 () Unit!27846)

(declare-datatypes ((ValueCell!6771 0))(
  ( (ValueCellFull!6771 (v!9662 V!24165)) (EmptyCell!6771) )
))
(declare-datatypes ((array!44948 0))(
  ( (array!44949 (arr!21531 (Array (_ BitVec 32) ValueCell!6771)) (size!21952 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44948)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!333 (array!44946 array!44948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24165 V!24165 V!24165 V!24165 (_ BitVec 32) Int) Unit!27846)

(assert (=> b!816583 (= lt!365767 (lemmaNoChangeToArrayThenSameMapNoExtras!333 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2223 (array!44946 array!44948 (_ BitVec 32) (_ BitVec 32) V!24165 V!24165 (_ BitVec 32) Int) ListLongMap!8329)

(assert (=> b!816583 (= lt!365766 (getCurrentListMapNoExtraKeys!2223 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816583 (= lt!365763 (getCurrentListMapNoExtraKeys!2223 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816584 () Bool)

(declare-fun res!557493 () Bool)

(assert (=> b!816584 (=> (not res!557493) (not e!452991))))

(declare-datatypes ((List!15335 0))(
  ( (Nil!15332) (Cons!15331 (h!16460 (_ BitVec 64)) (t!21658 List!15335)) )
))
(declare-fun arrayNoDuplicates!0 (array!44946 (_ BitVec 32) List!15335) Bool)

(assert (=> b!816584 (= res!557493 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15332))))

(declare-fun mapNonEmpty!23149 () Bool)

(declare-fun mapRes!23149 () Bool)

(declare-fun tp!44713 () Bool)

(declare-fun e!452988 () Bool)

(assert (=> mapNonEmpty!23149 (= mapRes!23149 (and tp!44713 e!452988))))

(declare-fun mapRest!23149 () (Array (_ BitVec 32) ValueCell!6771))

(declare-fun mapValue!23149 () ValueCell!6771)

(declare-fun mapKey!23149 () (_ BitVec 32))

(assert (=> mapNonEmpty!23149 (= (arr!21531 _values!788) (store mapRest!23149 mapKey!23149 mapValue!23149))))

(declare-fun b!816585 () Bool)

(declare-fun tp_is_empty!14373 () Bool)

(assert (=> b!816585 (= e!452988 tp_is_empty!14373)))

(declare-fun b!816586 () Bool)

(declare-fun res!557496 () Bool)

(assert (=> b!816586 (=> (not res!557496) (not e!452991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44946 (_ BitVec 32)) Bool)

(assert (=> b!816586 (= res!557496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23149 () Bool)

(assert (=> mapIsEmpty!23149 mapRes!23149))

(declare-fun b!816587 () Bool)

(declare-fun e!452990 () Bool)

(assert (=> b!816587 (= e!452990 tp_is_empty!14373)))

(declare-fun b!816588 () Bool)

(declare-fun e!452987 () Bool)

(assert (=> b!816588 (= e!452987 (and e!452990 mapRes!23149))))

(declare-fun condMapEmpty!23149 () Bool)

(declare-fun mapDefault!23149 () ValueCell!6771)

(assert (=> b!816588 (= condMapEmpty!23149 (= (arr!21531 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6771)) mapDefault!23149)))))

(declare-fun b!816589 () Bool)

(assert (=> b!816589 (= e!452989 true)))

(declare-fun lt!365765 () ListLongMap!8329)

(declare-fun getCurrentListMap!2405 (array!44946 array!44948 (_ BitVec 32) (_ BitVec 32) V!24165 V!24165 (_ BitVec 32) Int) ListLongMap!8329)

(assert (=> b!816589 (= lt!365765 (getCurrentListMap!2405 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365764 () ListLongMap!8329)

(declare-fun +!1811 (ListLongMap!8329 tuple2!9506) ListLongMap!8329)

(assert (=> b!816589 (= lt!365764 (+!1811 (getCurrentListMap!2405 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9507 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816590 () Bool)

(declare-fun res!557492 () Bool)

(assert (=> b!816590 (=> (not res!557492) (not e!452991))))

(assert (=> b!816590 (= res!557492 (and (= (size!21952 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21951 _keys!976) (size!21952 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!557494 () Bool)

(assert (=> start!70288 (=> (not res!557494) (not e!452991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70288 (= res!557494 (validMask!0 mask!1312))))

(assert (=> start!70288 e!452991))

(assert (=> start!70288 tp_is_empty!14373))

(declare-fun array_inv!17227 (array!44946) Bool)

(assert (=> start!70288 (array_inv!17227 _keys!976)))

(assert (=> start!70288 true))

(declare-fun array_inv!17228 (array!44948) Bool)

(assert (=> start!70288 (and (array_inv!17228 _values!788) e!452987)))

(assert (=> start!70288 tp!44712))

(assert (= (and start!70288 res!557494) b!816590))

(assert (= (and b!816590 res!557492) b!816586))

(assert (= (and b!816586 res!557496) b!816584))

(assert (= (and b!816584 res!557493) b!816583))

(assert (= (and b!816583 (not res!557495)) b!816589))

(assert (= (and b!816588 condMapEmpty!23149) mapIsEmpty!23149))

(assert (= (and b!816588 (not condMapEmpty!23149)) mapNonEmpty!23149))

(get-info :version)

(assert (= (and mapNonEmpty!23149 ((_ is ValueCellFull!6771) mapValue!23149)) b!816585))

(assert (= (and b!816588 ((_ is ValueCellFull!6771) mapDefault!23149)) b!816587))

(assert (= start!70288 b!816588))

(declare-fun m!758215 () Bool)

(assert (=> start!70288 m!758215))

(declare-fun m!758217 () Bool)

(assert (=> start!70288 m!758217))

(declare-fun m!758219 () Bool)

(assert (=> start!70288 m!758219))

(declare-fun m!758221 () Bool)

(assert (=> b!816584 m!758221))

(declare-fun m!758223 () Bool)

(assert (=> b!816586 m!758223))

(declare-fun m!758225 () Bool)

(assert (=> mapNonEmpty!23149 m!758225))

(declare-fun m!758227 () Bool)

(assert (=> b!816589 m!758227))

(declare-fun m!758229 () Bool)

(assert (=> b!816589 m!758229))

(assert (=> b!816589 m!758229))

(declare-fun m!758231 () Bool)

(assert (=> b!816589 m!758231))

(declare-fun m!758233 () Bool)

(assert (=> b!816583 m!758233))

(declare-fun m!758235 () Bool)

(assert (=> b!816583 m!758235))

(declare-fun m!758237 () Bool)

(assert (=> b!816583 m!758237))

(check-sat (not b!816589) (not b_next!12663) b_and!21463 (not b!816583) (not b!816586) (not b!816584) tp_is_empty!14373 (not start!70288) (not mapNonEmpty!23149))
(check-sat b_and!21463 (not b_next!12663))
