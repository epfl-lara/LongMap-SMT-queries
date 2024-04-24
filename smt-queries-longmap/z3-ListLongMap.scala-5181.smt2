; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70238 () Bool)

(assert start!70238)

(declare-fun b_free!12493 () Bool)

(declare-fun b_next!12493 () Bool)

(assert (=> start!70238 (= b_free!12493 (not b_next!12493))))

(declare-fun tp!44194 () Bool)

(declare-fun b_and!21275 () Bool)

(assert (=> start!70238 (= tp!44194 b_and!21275)))

(declare-fun b!815225 () Bool)

(declare-fun e!451958 () Bool)

(declare-fun e!451960 () Bool)

(declare-fun mapRes!22885 () Bool)

(assert (=> b!815225 (= e!451958 (and e!451960 mapRes!22885))))

(declare-fun condMapEmpty!22885 () Bool)

(declare-datatypes ((V!23939 0))(
  ( (V!23940 (val!7149 Int)) )
))
(declare-datatypes ((ValueCell!6686 0))(
  ( (ValueCellFull!6686 (v!9576 V!23939)) (EmptyCell!6686) )
))
(declare-datatypes ((array!44609 0))(
  ( (array!44610 (arr!21360 (Array (_ BitVec 32) ValueCell!6686)) (size!21780 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44609)

(declare-fun mapDefault!22885 () ValueCell!6686)

(assert (=> b!815225 (= condMapEmpty!22885 (= (arr!21360 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6686)) mapDefault!22885)))))

(declare-fun b!815226 () Bool)

(declare-fun e!451957 () Bool)

(assert (=> b!815226 (= e!451957 (not true))))

(declare-datatypes ((tuple2!9284 0))(
  ( (tuple2!9285 (_1!4653 (_ BitVec 64)) (_2!4653 V!23939)) )
))
(declare-datatypes ((List!15102 0))(
  ( (Nil!15099) (Cons!15098 (h!16233 tuple2!9284) (t!21411 List!15102)) )
))
(declare-datatypes ((ListLongMap!8109 0))(
  ( (ListLongMap!8110 (toList!4070 List!15102)) )
))
(declare-fun lt!364925 () ListLongMap!8109)

(declare-fun lt!364924 () ListLongMap!8109)

(assert (=> b!815226 (= lt!364925 lt!364924)))

(declare-fun zeroValueBefore!34 () V!23939)

(declare-datatypes ((array!44611 0))(
  ( (array!44612 (arr!21361 (Array (_ BitVec 32) (_ BitVec 64))) (size!21781 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44611)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!23939)

(declare-fun minValue!754 () V!23939)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27707 0))(
  ( (Unit!27708) )
))
(declare-fun lt!364926 () Unit!27707)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!265 (array!44611 array!44609 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23939 V!23939 V!23939 V!23939 (_ BitVec 32) Int) Unit!27707)

(assert (=> b!815226 (= lt!364926 (lemmaNoChangeToArrayThenSameMapNoExtras!265 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2177 (array!44611 array!44609 (_ BitVec 32) (_ BitVec 32) V!23939 V!23939 (_ BitVec 32) Int) ListLongMap!8109)

(assert (=> b!815226 (= lt!364924 (getCurrentListMapNoExtraKeys!2177 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815226 (= lt!364925 (getCurrentListMapNoExtraKeys!2177 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!815227 () Bool)

(declare-fun e!451959 () Bool)

(declare-fun tp_is_empty!14203 () Bool)

(assert (=> b!815227 (= e!451959 tp_is_empty!14203)))

(declare-fun mapIsEmpty!22885 () Bool)

(assert (=> mapIsEmpty!22885 mapRes!22885))

(declare-fun b!815228 () Bool)

(assert (=> b!815228 (= e!451960 tp_is_empty!14203)))

(declare-fun b!815229 () Bool)

(declare-fun res!556562 () Bool)

(assert (=> b!815229 (=> (not res!556562) (not e!451957))))

(assert (=> b!815229 (= res!556562 (and (= (size!21780 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21781 _keys!976) (size!21780 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556561 () Bool)

(assert (=> start!70238 (=> (not res!556561) (not e!451957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70238 (= res!556561 (validMask!0 mask!1312))))

(assert (=> start!70238 e!451957))

(assert (=> start!70238 tp_is_empty!14203))

(declare-fun array_inv!17147 (array!44611) Bool)

(assert (=> start!70238 (array_inv!17147 _keys!976)))

(assert (=> start!70238 true))

(declare-fun array_inv!17148 (array!44609) Bool)

(assert (=> start!70238 (and (array_inv!17148 _values!788) e!451958)))

(assert (=> start!70238 tp!44194))

(declare-fun mapNonEmpty!22885 () Bool)

(declare-fun tp!44193 () Bool)

(assert (=> mapNonEmpty!22885 (= mapRes!22885 (and tp!44193 e!451959))))

(declare-fun mapRest!22885 () (Array (_ BitVec 32) ValueCell!6686))

(declare-fun mapValue!22885 () ValueCell!6686)

(declare-fun mapKey!22885 () (_ BitVec 32))

(assert (=> mapNonEmpty!22885 (= (arr!21360 _values!788) (store mapRest!22885 mapKey!22885 mapValue!22885))))

(declare-fun b!815230 () Bool)

(declare-fun res!556563 () Bool)

(assert (=> b!815230 (=> (not res!556563) (not e!451957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44611 (_ BitVec 32)) Bool)

(assert (=> b!815230 (= res!556563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815231 () Bool)

(declare-fun res!556564 () Bool)

(assert (=> b!815231 (=> (not res!556564) (not e!451957))))

(declare-datatypes ((List!15103 0))(
  ( (Nil!15100) (Cons!15099 (h!16234 (_ BitVec 64)) (t!21412 List!15103)) )
))
(declare-fun arrayNoDuplicates!0 (array!44611 (_ BitVec 32) List!15103) Bool)

(assert (=> b!815231 (= res!556564 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15100))))

(assert (= (and start!70238 res!556561) b!815229))

(assert (= (and b!815229 res!556562) b!815230))

(assert (= (and b!815230 res!556563) b!815231))

(assert (= (and b!815231 res!556564) b!815226))

(assert (= (and b!815225 condMapEmpty!22885) mapIsEmpty!22885))

(assert (= (and b!815225 (not condMapEmpty!22885)) mapNonEmpty!22885))

(get-info :version)

(assert (= (and mapNonEmpty!22885 ((_ is ValueCellFull!6686) mapValue!22885)) b!815227))

(assert (= (and b!815225 ((_ is ValueCellFull!6686) mapDefault!22885)) b!815228))

(assert (= start!70238 b!815225))

(declare-fun m!757443 () Bool)

(assert (=> mapNonEmpty!22885 m!757443))

(declare-fun m!757445 () Bool)

(assert (=> b!815231 m!757445))

(declare-fun m!757447 () Bool)

(assert (=> b!815226 m!757447))

(declare-fun m!757449 () Bool)

(assert (=> b!815226 m!757449))

(declare-fun m!757451 () Bool)

(assert (=> b!815226 m!757451))

(declare-fun m!757453 () Bool)

(assert (=> start!70238 m!757453))

(declare-fun m!757455 () Bool)

(assert (=> start!70238 m!757455))

(declare-fun m!757457 () Bool)

(assert (=> start!70238 m!757457))

(declare-fun m!757459 () Bool)

(assert (=> b!815230 m!757459))

(check-sat (not mapNonEmpty!22885) (not b!815230) (not b_next!12493) tp_is_empty!14203 (not b!815231) b_and!21275 (not start!70238) (not b!815226))
(check-sat b_and!21275 (not b_next!12493))
