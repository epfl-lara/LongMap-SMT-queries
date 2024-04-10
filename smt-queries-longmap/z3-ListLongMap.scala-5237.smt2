; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70504 () Bool)

(assert start!70504)

(declare-fun b_free!12831 () Bool)

(declare-fun b_next!12831 () Bool)

(assert (=> start!70504 (= b_free!12831 (not b_next!12831))))

(declare-fun tp!45226 () Bool)

(declare-fun b_and!21661 () Bool)

(assert (=> start!70504 (= tp!45226 b_and!21661)))

(declare-fun b!818976 () Bool)

(declare-fun e!454721 () Bool)

(assert (=> b!818976 (= e!454721 true)))

(declare-datatypes ((V!24389 0))(
  ( (V!24390 (val!7318 Int)) )
))
(declare-datatypes ((tuple2!9622 0))(
  ( (tuple2!9623 (_1!4822 (_ BitVec 64)) (_2!4822 V!24389)) )
))
(declare-fun lt!367254 () tuple2!9622)

(declare-datatypes ((List!15453 0))(
  ( (Nil!15450) (Cons!15449 (h!16578 tuple2!9622) (t!21782 List!15453)) )
))
(declare-datatypes ((ListLongMap!8445 0))(
  ( (ListLongMap!8446 (toList!4238 List!15453)) )
))
(declare-fun lt!367258 () ListLongMap!8445)

(declare-fun lt!367259 () tuple2!9622)

(declare-fun lt!367256 () ListLongMap!8445)

(declare-fun +!1835 (ListLongMap!8445 tuple2!9622) ListLongMap!8445)

(assert (=> b!818976 (= lt!367256 (+!1835 (+!1835 lt!367258 lt!367259) lt!367254))))

(declare-fun lt!367253 () ListLongMap!8445)

(declare-fun lt!367257 () ListLongMap!8445)

(assert (=> b!818976 (= (+!1835 lt!367253 lt!367254) (+!1835 lt!367257 lt!367254))))

(declare-fun zeroValueBefore!34 () V!24389)

(declare-fun zeroValueAfter!34 () V!24389)

(declare-datatypes ((Unit!27957 0))(
  ( (Unit!27958) )
))
(declare-fun lt!367262 () Unit!27957)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!176 (ListLongMap!8445 (_ BitVec 64) V!24389 V!24389) Unit!27957)

(assert (=> b!818976 (= lt!367262 (addSameAsAddTwiceSameKeyDiffValues!176 lt!367253 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818976 (= lt!367254 (tuple2!9623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454723 () Bool)

(assert (=> b!818976 e!454723))

(declare-fun res!558888 () Bool)

(assert (=> b!818976 (=> (not res!558888) (not e!454723))))

(declare-fun lt!367260 () ListLongMap!8445)

(assert (=> b!818976 (= res!558888 (= lt!367260 lt!367257))))

(assert (=> b!818976 (= lt!367257 (+!1835 lt!367253 lt!367259))))

(assert (=> b!818976 (= lt!367259 (tuple2!9623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45280 0))(
  ( (array!45281 (arr!21694 (Array (_ BitVec 32) (_ BitVec 64))) (size!22115 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45280)

(declare-fun lt!367255 () ListLongMap!8445)

(declare-fun minValue!754 () V!24389)

(declare-datatypes ((ValueCell!6855 0))(
  ( (ValueCellFull!6855 (v!9747 V!24389)) (EmptyCell!6855) )
))
(declare-datatypes ((array!45282 0))(
  ( (array!45283 (arr!21695 (Array (_ BitVec 32) ValueCell!6855)) (size!22116 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45282)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2442 (array!45280 array!45282 (_ BitVec 32) (_ BitVec 32) V!24389 V!24389 (_ BitVec 32) Int) ListLongMap!8445)

(assert (=> b!818976 (= lt!367255 (getCurrentListMap!2442 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818976 (= lt!367260 (getCurrentListMap!2442 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818977 () Bool)

(declare-fun res!558887 () Bool)

(declare-fun e!454718 () Bool)

(assert (=> b!818977 (=> (not res!558887) (not e!454718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45280 (_ BitVec 32)) Bool)

(assert (=> b!818977 (= res!558887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818978 () Bool)

(declare-fun e!454724 () Bool)

(declare-fun e!454719 () Bool)

(declare-fun mapRes!23410 () Bool)

(assert (=> b!818978 (= e!454724 (and e!454719 mapRes!23410))))

(declare-fun condMapEmpty!23410 () Bool)

(declare-fun mapDefault!23410 () ValueCell!6855)

(assert (=> b!818978 (= condMapEmpty!23410 (= (arr!21695 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6855)) mapDefault!23410)))))

(declare-fun mapIsEmpty!23410 () Bool)

(assert (=> mapIsEmpty!23410 mapRes!23410))

(declare-fun b!818979 () Bool)

(declare-fun res!558886 () Bool)

(assert (=> b!818979 (=> (not res!558886) (not e!454718))))

(declare-datatypes ((List!15454 0))(
  ( (Nil!15451) (Cons!15450 (h!16579 (_ BitVec 64)) (t!21783 List!15454)) )
))
(declare-fun arrayNoDuplicates!0 (array!45280 (_ BitVec 32) List!15454) Bool)

(assert (=> b!818979 (= res!558886 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15451))))

(declare-fun b!818980 () Bool)

(assert (=> b!818980 (= e!454718 (not e!454721))))

(declare-fun res!558885 () Bool)

(assert (=> b!818980 (=> res!558885 e!454721)))

(assert (=> b!818980 (= res!558885 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!818980 (= lt!367253 lt!367258)))

(declare-fun lt!367261 () Unit!27957)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!383 (array!45280 array!45282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24389 V!24389 V!24389 V!24389 (_ BitVec 32) Int) Unit!27957)

(assert (=> b!818980 (= lt!367261 (lemmaNoChangeToArrayThenSameMapNoExtras!383 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2273 (array!45280 array!45282 (_ BitVec 32) (_ BitVec 32) V!24389 V!24389 (_ BitVec 32) Int) ListLongMap!8445)

(assert (=> b!818980 (= lt!367258 (getCurrentListMapNoExtraKeys!2273 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818980 (= lt!367253 (getCurrentListMapNoExtraKeys!2273 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23410 () Bool)

(declare-fun tp!45225 () Bool)

(declare-fun e!454722 () Bool)

(assert (=> mapNonEmpty!23410 (= mapRes!23410 (and tp!45225 e!454722))))

(declare-fun mapKey!23410 () (_ BitVec 32))

(declare-fun mapRest!23410 () (Array (_ BitVec 32) ValueCell!6855))

(declare-fun mapValue!23410 () ValueCell!6855)

(assert (=> mapNonEmpty!23410 (= (arr!21695 _values!788) (store mapRest!23410 mapKey!23410 mapValue!23410))))

(declare-fun b!818981 () Bool)

(assert (=> b!818981 (= e!454723 (= lt!367255 (+!1835 lt!367258 (tuple2!9623 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun res!558884 () Bool)

(assert (=> start!70504 (=> (not res!558884) (not e!454718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70504 (= res!558884 (validMask!0 mask!1312))))

(assert (=> start!70504 e!454718))

(declare-fun tp_is_empty!14541 () Bool)

(assert (=> start!70504 tp_is_empty!14541))

(declare-fun array_inv!17343 (array!45280) Bool)

(assert (=> start!70504 (array_inv!17343 _keys!976)))

(assert (=> start!70504 true))

(declare-fun array_inv!17344 (array!45282) Bool)

(assert (=> start!70504 (and (array_inv!17344 _values!788) e!454724)))

(assert (=> start!70504 tp!45226))

(declare-fun b!818982 () Bool)

(assert (=> b!818982 (= e!454719 tp_is_empty!14541)))

(declare-fun b!818983 () Bool)

(assert (=> b!818983 (= e!454722 tp_is_empty!14541)))

(declare-fun b!818984 () Bool)

(declare-fun res!558883 () Bool)

(assert (=> b!818984 (=> (not res!558883) (not e!454718))))

(assert (=> b!818984 (= res!558883 (and (= (size!22116 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22115 _keys!976) (size!22116 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!70504 res!558884) b!818984))

(assert (= (and b!818984 res!558883) b!818977))

(assert (= (and b!818977 res!558887) b!818979))

(assert (= (and b!818979 res!558886) b!818980))

(assert (= (and b!818980 (not res!558885)) b!818976))

(assert (= (and b!818976 res!558888) b!818981))

(assert (= (and b!818978 condMapEmpty!23410) mapIsEmpty!23410))

(assert (= (and b!818978 (not condMapEmpty!23410)) mapNonEmpty!23410))

(get-info :version)

(assert (= (and mapNonEmpty!23410 ((_ is ValueCellFull!6855) mapValue!23410)) b!818983))

(assert (= (and b!818978 ((_ is ValueCellFull!6855) mapDefault!23410)) b!818982))

(assert (= start!70504 b!818978))

(declare-fun m!760465 () Bool)

(assert (=> b!818977 m!760465))

(declare-fun m!760467 () Bool)

(assert (=> start!70504 m!760467))

(declare-fun m!760469 () Bool)

(assert (=> start!70504 m!760469))

(declare-fun m!760471 () Bool)

(assert (=> start!70504 m!760471))

(declare-fun m!760473 () Bool)

(assert (=> b!818979 m!760473))

(declare-fun m!760475 () Bool)

(assert (=> b!818981 m!760475))

(declare-fun m!760477 () Bool)

(assert (=> mapNonEmpty!23410 m!760477))

(declare-fun m!760479 () Bool)

(assert (=> b!818976 m!760479))

(declare-fun m!760481 () Bool)

(assert (=> b!818976 m!760481))

(declare-fun m!760483 () Bool)

(assert (=> b!818976 m!760483))

(declare-fun m!760485 () Bool)

(assert (=> b!818976 m!760485))

(declare-fun m!760487 () Bool)

(assert (=> b!818976 m!760487))

(declare-fun m!760489 () Bool)

(assert (=> b!818976 m!760489))

(assert (=> b!818976 m!760483))

(declare-fun m!760491 () Bool)

(assert (=> b!818976 m!760491))

(declare-fun m!760493 () Bool)

(assert (=> b!818976 m!760493))

(declare-fun m!760495 () Bool)

(assert (=> b!818980 m!760495))

(declare-fun m!760497 () Bool)

(assert (=> b!818980 m!760497))

(declare-fun m!760499 () Bool)

(assert (=> b!818980 m!760499))

(check-sat (not b!818979) (not mapNonEmpty!23410) (not b!818980) (not b!818981) (not b_next!12831) (not b!818976) tp_is_empty!14541 (not start!70504) b_and!21661 (not b!818977))
(check-sat b_and!21661 (not b_next!12831))
