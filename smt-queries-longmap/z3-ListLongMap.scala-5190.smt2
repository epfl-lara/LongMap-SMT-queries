; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70120 () Bool)

(assert start!70120)

(declare-fun b_free!12547 () Bool)

(declare-fun b_next!12547 () Bool)

(assert (=> start!70120 (= b_free!12547 (not b_next!12547))))

(declare-fun tp!44359 () Bool)

(declare-fun b_and!21301 () Bool)

(assert (=> start!70120 (= tp!44359 b_and!21301)))

(declare-fun b!814737 () Bool)

(declare-fun res!556467 () Bool)

(declare-fun e!451692 () Bool)

(assert (=> b!814737 (=> (not res!556467) (not e!451692))))

(declare-datatypes ((array!44707 0))(
  ( (array!44708 (arr!21413 (Array (_ BitVec 32) (_ BitVec 64))) (size!21834 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44707)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24011 0))(
  ( (V!24012 (val!7176 Int)) )
))
(declare-datatypes ((ValueCell!6713 0))(
  ( (ValueCellFull!6713 (v!9597 V!24011)) (EmptyCell!6713) )
))
(declare-datatypes ((array!44709 0))(
  ( (array!44710 (arr!21414 (Array (_ BitVec 32) ValueCell!6713)) (size!21835 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44709)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814737 (= res!556467 (and (= (size!21835 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21834 _keys!976) (size!21835 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22969 () Bool)

(declare-fun mapRes!22969 () Bool)

(assert (=> mapIsEmpty!22969 mapRes!22969))

(declare-fun mapNonEmpty!22969 () Bool)

(declare-fun tp!44358 () Bool)

(declare-fun e!451693 () Bool)

(assert (=> mapNonEmpty!22969 (= mapRes!22969 (and tp!44358 e!451693))))

(declare-fun mapKey!22969 () (_ BitVec 32))

(declare-fun mapValue!22969 () ValueCell!6713)

(declare-fun mapRest!22969 () (Array (_ BitVec 32) ValueCell!6713))

(assert (=> mapNonEmpty!22969 (= (arr!21414 _values!788) (store mapRest!22969 mapKey!22969 mapValue!22969))))

(declare-fun b!814738 () Bool)

(declare-fun res!556466 () Bool)

(assert (=> b!814738 (=> (not res!556466) (not e!451692))))

(declare-datatypes ((List!15264 0))(
  ( (Nil!15261) (Cons!15260 (h!16389 (_ BitVec 64)) (t!21574 List!15264)) )
))
(declare-fun arrayNoDuplicates!0 (array!44707 (_ BitVec 32) List!15264) Bool)

(assert (=> b!814738 (= res!556466 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15261))))

(declare-fun res!556464 () Bool)

(assert (=> start!70120 (=> (not res!556464) (not e!451692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70120 (= res!556464 (validMask!0 mask!1312))))

(assert (=> start!70120 e!451692))

(declare-fun tp_is_empty!14257 () Bool)

(assert (=> start!70120 tp_is_empty!14257))

(declare-fun array_inv!17213 (array!44707) Bool)

(assert (=> start!70120 (array_inv!17213 _keys!976)))

(assert (=> start!70120 true))

(declare-fun e!451690 () Bool)

(declare-fun array_inv!17214 (array!44709) Bool)

(assert (=> start!70120 (and (array_inv!17214 _values!788) e!451690)))

(assert (=> start!70120 tp!44359))

(declare-fun b!814739 () Bool)

(assert (=> b!814739 (= e!451693 tp_is_empty!14257)))

(declare-fun b!814740 () Bool)

(assert (=> b!814740 (= e!451692 (not true))))

(declare-datatypes ((tuple2!9436 0))(
  ( (tuple2!9437 (_1!4729 (_ BitVec 64)) (_2!4729 V!24011)) )
))
(declare-datatypes ((List!15265 0))(
  ( (Nil!15262) (Cons!15261 (h!16390 tuple2!9436) (t!21575 List!15265)) )
))
(declare-datatypes ((ListLongMap!8249 0))(
  ( (ListLongMap!8250 (toList!4140 List!15265)) )
))
(declare-fun lt!364611 () ListLongMap!8249)

(declare-fun lt!364612 () ListLongMap!8249)

(assert (=> b!814740 (= lt!364611 lt!364612)))

(declare-fun zeroValueBefore!34 () V!24011)

(declare-fun zeroValueAfter!34 () V!24011)

(declare-fun minValue!754 () V!24011)

(declare-datatypes ((Unit!27714 0))(
  ( (Unit!27715) )
))
(declare-fun lt!364610 () Unit!27714)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!298 (array!44707 array!44709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24011 V!24011 V!24011 V!24011 (_ BitVec 32) Int) Unit!27714)

(assert (=> b!814740 (= lt!364610 (lemmaNoChangeToArrayThenSameMapNoExtras!298 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2205 (array!44707 array!44709 (_ BitVec 32) (_ BitVec 32) V!24011 V!24011 (_ BitVec 32) Int) ListLongMap!8249)

(assert (=> b!814740 (= lt!364612 (getCurrentListMapNoExtraKeys!2205 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814740 (= lt!364611 (getCurrentListMapNoExtraKeys!2205 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814741 () Bool)

(declare-fun res!556465 () Bool)

(assert (=> b!814741 (=> (not res!556465) (not e!451692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44707 (_ BitVec 32)) Bool)

(assert (=> b!814741 (= res!556465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814742 () Bool)

(declare-fun e!451691 () Bool)

(assert (=> b!814742 (= e!451690 (and e!451691 mapRes!22969))))

(declare-fun condMapEmpty!22969 () Bool)

(declare-fun mapDefault!22969 () ValueCell!6713)

(assert (=> b!814742 (= condMapEmpty!22969 (= (arr!21414 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6713)) mapDefault!22969)))))

(declare-fun b!814743 () Bool)

(assert (=> b!814743 (= e!451691 tp_is_empty!14257)))

(assert (= (and start!70120 res!556464) b!814737))

(assert (= (and b!814737 res!556467) b!814741))

(assert (= (and b!814741 res!556465) b!814738))

(assert (= (and b!814738 res!556466) b!814740))

(assert (= (and b!814742 condMapEmpty!22969) mapIsEmpty!22969))

(assert (= (and b!814742 (not condMapEmpty!22969)) mapNonEmpty!22969))

(get-info :version)

(assert (= (and mapNonEmpty!22969 ((_ is ValueCellFull!6713) mapValue!22969)) b!814739))

(assert (= (and b!814742 ((_ is ValueCellFull!6713) mapDefault!22969)) b!814743))

(assert (= start!70120 b!814742))

(declare-fun m!755961 () Bool)

(assert (=> mapNonEmpty!22969 m!755961))

(declare-fun m!755963 () Bool)

(assert (=> b!814741 m!755963))

(declare-fun m!755965 () Bool)

(assert (=> b!814740 m!755965))

(declare-fun m!755967 () Bool)

(assert (=> b!814740 m!755967))

(declare-fun m!755969 () Bool)

(assert (=> b!814740 m!755969))

(declare-fun m!755971 () Bool)

(assert (=> start!70120 m!755971))

(declare-fun m!755973 () Bool)

(assert (=> start!70120 m!755973))

(declare-fun m!755975 () Bool)

(assert (=> start!70120 m!755975))

(declare-fun m!755977 () Bool)

(assert (=> b!814738 m!755977))

(check-sat tp_is_empty!14257 (not start!70120) (not mapNonEmpty!22969) (not b!814738) (not b!814740) (not b_next!12547) (not b!814741) b_and!21301)
(check-sat b_and!21301 (not b_next!12547))
