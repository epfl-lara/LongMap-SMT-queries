; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70268 () Bool)

(assert start!70268)

(declare-fun b_free!12523 () Bool)

(declare-fun b_next!12523 () Bool)

(assert (=> start!70268 (= b_free!12523 (not b_next!12523))))

(declare-fun tp!44284 () Bool)

(declare-fun b_and!21305 () Bool)

(assert (=> start!70268 (= tp!44284 b_and!21305)))

(declare-fun b!815540 () Bool)

(declare-fun e!452185 () Bool)

(assert (=> b!815540 (= e!452185 (not true))))

(declare-datatypes ((V!23979 0))(
  ( (V!23980 (val!7164 Int)) )
))
(declare-datatypes ((tuple2!9308 0))(
  ( (tuple2!9309 (_1!4665 (_ BitVec 64)) (_2!4665 V!23979)) )
))
(declare-datatypes ((List!15126 0))(
  ( (Nil!15123) (Cons!15122 (h!16257 tuple2!9308) (t!21435 List!15126)) )
))
(declare-datatypes ((ListLongMap!8133 0))(
  ( (ListLongMap!8134 (toList!4082 List!15126)) )
))
(declare-fun lt!365061 () ListLongMap!8133)

(declare-fun lt!365059 () ListLongMap!8133)

(assert (=> b!815540 (= lt!365061 lt!365059)))

(declare-fun zeroValueBefore!34 () V!23979)

(declare-datatypes ((array!44667 0))(
  ( (array!44668 (arr!21389 (Array (_ BitVec 32) (_ BitVec 64))) (size!21809 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44667)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23979)

(declare-fun minValue!754 () V!23979)

(declare-datatypes ((ValueCell!6701 0))(
  ( (ValueCellFull!6701 (v!9591 V!23979)) (EmptyCell!6701) )
))
(declare-datatypes ((array!44669 0))(
  ( (array!44670 (arr!21390 (Array (_ BitVec 32) ValueCell!6701)) (size!21810 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44669)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27731 0))(
  ( (Unit!27732) )
))
(declare-fun lt!365060 () Unit!27731)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!277 (array!44667 array!44669 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23979 V!23979 V!23979 V!23979 (_ BitVec 32) Int) Unit!27731)

(assert (=> b!815540 (= lt!365060 (lemmaNoChangeToArrayThenSameMapNoExtras!277 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2189 (array!44667 array!44669 (_ BitVec 32) (_ BitVec 32) V!23979 V!23979 (_ BitVec 32) Int) ListLongMap!8133)

(assert (=> b!815540 (= lt!365059 (getCurrentListMapNoExtraKeys!2189 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815540 (= lt!365061 (getCurrentListMapNoExtraKeys!2189 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815541 () Bool)

(declare-fun e!452183 () Bool)

(declare-fun e!452182 () Bool)

(declare-fun mapRes!22930 () Bool)

(assert (=> b!815541 (= e!452183 (and e!452182 mapRes!22930))))

(declare-fun condMapEmpty!22930 () Bool)

(declare-fun mapDefault!22930 () ValueCell!6701)

(assert (=> b!815541 (= condMapEmpty!22930 (= (arr!21390 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6701)) mapDefault!22930)))))

(declare-fun b!815542 () Bool)

(declare-fun res!556744 () Bool)

(assert (=> b!815542 (=> (not res!556744) (not e!452185))))

(declare-datatypes ((List!15127 0))(
  ( (Nil!15124) (Cons!15123 (h!16258 (_ BitVec 64)) (t!21436 List!15127)) )
))
(declare-fun arrayNoDuplicates!0 (array!44667 (_ BitVec 32) List!15127) Bool)

(assert (=> b!815542 (= res!556744 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15124))))

(declare-fun b!815543 () Bool)

(declare-fun tp_is_empty!14233 () Bool)

(assert (=> b!815543 (= e!452182 tp_is_empty!14233)))

(declare-fun res!556741 () Bool)

(assert (=> start!70268 (=> (not res!556741) (not e!452185))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70268 (= res!556741 (validMask!0 mask!1312))))

(assert (=> start!70268 e!452185))

(assert (=> start!70268 tp_is_empty!14233))

(declare-fun array_inv!17167 (array!44667) Bool)

(assert (=> start!70268 (array_inv!17167 _keys!976)))

(assert (=> start!70268 true))

(declare-fun array_inv!17168 (array!44669) Bool)

(assert (=> start!70268 (and (array_inv!17168 _values!788) e!452183)))

(assert (=> start!70268 tp!44284))

(declare-fun b!815544 () Bool)

(declare-fun e!452186 () Bool)

(assert (=> b!815544 (= e!452186 tp_is_empty!14233)))

(declare-fun mapNonEmpty!22930 () Bool)

(declare-fun tp!44283 () Bool)

(assert (=> mapNonEmpty!22930 (= mapRes!22930 (and tp!44283 e!452186))))

(declare-fun mapKey!22930 () (_ BitVec 32))

(declare-fun mapRest!22930 () (Array (_ BitVec 32) ValueCell!6701))

(declare-fun mapValue!22930 () ValueCell!6701)

(assert (=> mapNonEmpty!22930 (= (arr!21390 _values!788) (store mapRest!22930 mapKey!22930 mapValue!22930))))

(declare-fun b!815545 () Bool)

(declare-fun res!556743 () Bool)

(assert (=> b!815545 (=> (not res!556743) (not e!452185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44667 (_ BitVec 32)) Bool)

(assert (=> b!815545 (= res!556743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815546 () Bool)

(declare-fun res!556742 () Bool)

(assert (=> b!815546 (=> (not res!556742) (not e!452185))))

(assert (=> b!815546 (= res!556742 (and (= (size!21810 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21809 _keys!976) (size!21810 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22930 () Bool)

(assert (=> mapIsEmpty!22930 mapRes!22930))

(assert (= (and start!70268 res!556741) b!815546))

(assert (= (and b!815546 res!556742) b!815545))

(assert (= (and b!815545 res!556743) b!815542))

(assert (= (and b!815542 res!556744) b!815540))

(assert (= (and b!815541 condMapEmpty!22930) mapIsEmpty!22930))

(assert (= (and b!815541 (not condMapEmpty!22930)) mapNonEmpty!22930))

(get-info :version)

(assert (= (and mapNonEmpty!22930 ((_ is ValueCellFull!6701) mapValue!22930)) b!815544))

(assert (= (and b!815541 ((_ is ValueCellFull!6701) mapDefault!22930)) b!815543))

(assert (= start!70268 b!815541))

(declare-fun m!757713 () Bool)

(assert (=> start!70268 m!757713))

(declare-fun m!757715 () Bool)

(assert (=> start!70268 m!757715))

(declare-fun m!757717 () Bool)

(assert (=> start!70268 m!757717))

(declare-fun m!757719 () Bool)

(assert (=> b!815542 m!757719))

(declare-fun m!757721 () Bool)

(assert (=> b!815545 m!757721))

(declare-fun m!757723 () Bool)

(assert (=> mapNonEmpty!22930 m!757723))

(declare-fun m!757725 () Bool)

(assert (=> b!815540 m!757725))

(declare-fun m!757727 () Bool)

(assert (=> b!815540 m!757727))

(declare-fun m!757729 () Bool)

(assert (=> b!815540 m!757729))

(check-sat (not b!815542) b_and!21305 (not start!70268) (not b_next!12523) (not mapNonEmpty!22930) (not b!815540) (not b!815545) tp_is_empty!14233)
(check-sat b_and!21305 (not b_next!12523))
