; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42124 () Bool)

(assert start!42124)

(declare-fun b_free!11671 () Bool)

(declare-fun b_next!11671 () Bool)

(assert (=> start!42124 (= b_free!11671 (not b_next!11671))))

(declare-fun tp!41034 () Bool)

(declare-fun b_and!20103 () Bool)

(assert (=> start!42124 (= tp!41034 b_and!20103)))

(declare-fun b!470365 () Bool)

(declare-fun res!281086 () Bool)

(declare-fun e!275548 () Bool)

(assert (=> b!470365 (=> (not res!281086) (not e!275548))))

(declare-datatypes ((array!29954 0))(
  ( (array!29955 (arr!14400 (Array (_ BitVec 32) (_ BitVec 64))) (size!14752 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29954)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29954 (_ BitVec 32)) Bool)

(assert (=> b!470365 (= res!281086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470366 () Bool)

(assert (=> b!470366 (= e!275548 (not true))))

(declare-datatypes ((V!18571 0))(
  ( (V!18572 (val!6594 Int)) )
))
(declare-datatypes ((tuple2!8604 0))(
  ( (tuple2!8605 (_1!4313 (_ BitVec 64)) (_2!4313 V!18571)) )
))
(declare-datatypes ((List!8677 0))(
  ( (Nil!8674) (Cons!8673 (h!9529 tuple2!8604) (t!14631 List!8677)) )
))
(declare-datatypes ((ListLongMap!7519 0))(
  ( (ListLongMap!7520 (toList!3775 List!8677)) )
))
(declare-fun lt!213460 () ListLongMap!7519)

(declare-fun lt!213461 () ListLongMap!7519)

(assert (=> b!470366 (= lt!213460 lt!213461)))

(declare-fun minValueBefore!38 () V!18571)

(declare-fun zeroValue!794 () V!18571)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13763 0))(
  ( (Unit!13764) )
))
(declare-fun lt!213462 () Unit!13763)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6206 0))(
  ( (ValueCellFull!6206 (v!8886 V!18571)) (EmptyCell!6206) )
))
(declare-datatypes ((array!29956 0))(
  ( (array!29957 (arr!14401 (Array (_ BitVec 32) ValueCell!6206)) (size!14753 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29956)

(declare-fun minValueAfter!38 () V!18571)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!150 (array!29954 array!29956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18571 V!18571 V!18571 V!18571 (_ BitVec 32) Int) Unit!13763)

(assert (=> b!470366 (= lt!213462 (lemmaNoChangeToArrayThenSameMapNoExtras!150 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1990 (array!29954 array!29956 (_ BitVec 32) (_ BitVec 32) V!18571 V!18571 (_ BitVec 32) Int) ListLongMap!7519)

(assert (=> b!470366 (= lt!213461 (getCurrentListMapNoExtraKeys!1990 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470366 (= lt!213460 (getCurrentListMapNoExtraKeys!1990 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470367 () Bool)

(declare-fun e!275549 () Bool)

(declare-fun tp_is_empty!13099 () Bool)

(assert (=> b!470367 (= e!275549 tp_is_empty!13099)))

(declare-fun b!470368 () Bool)

(declare-fun e!275547 () Bool)

(declare-fun mapRes!21349 () Bool)

(assert (=> b!470368 (= e!275547 (and e!275549 mapRes!21349))))

(declare-fun condMapEmpty!21349 () Bool)

(declare-fun mapDefault!21349 () ValueCell!6206)

(assert (=> b!470368 (= condMapEmpty!21349 (= (arr!14401 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6206)) mapDefault!21349)))))

(declare-fun b!470369 () Bool)

(declare-fun res!281085 () Bool)

(assert (=> b!470369 (=> (not res!281085) (not e!275548))))

(declare-datatypes ((List!8678 0))(
  ( (Nil!8675) (Cons!8674 (h!9530 (_ BitVec 64)) (t!14632 List!8678)) )
))
(declare-fun arrayNoDuplicates!0 (array!29954 (_ BitVec 32) List!8678) Bool)

(assert (=> b!470369 (= res!281085 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8675))))

(declare-fun mapNonEmpty!21349 () Bool)

(declare-fun tp!41035 () Bool)

(declare-fun e!275550 () Bool)

(assert (=> mapNonEmpty!21349 (= mapRes!21349 (and tp!41035 e!275550))))

(declare-fun mapKey!21349 () (_ BitVec 32))

(declare-fun mapRest!21349 () (Array (_ BitVec 32) ValueCell!6206))

(declare-fun mapValue!21349 () ValueCell!6206)

(assert (=> mapNonEmpty!21349 (= (arr!14401 _values!833) (store mapRest!21349 mapKey!21349 mapValue!21349))))

(declare-fun b!470371 () Bool)

(assert (=> b!470371 (= e!275550 tp_is_empty!13099)))

(declare-fun mapIsEmpty!21349 () Bool)

(assert (=> mapIsEmpty!21349 mapRes!21349))

(declare-fun b!470370 () Bool)

(declare-fun res!281084 () Bool)

(assert (=> b!470370 (=> (not res!281084) (not e!275548))))

(assert (=> b!470370 (= res!281084 (and (= (size!14753 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14752 _keys!1025) (size!14753 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!281087 () Bool)

(assert (=> start!42124 (=> (not res!281087) (not e!275548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42124 (= res!281087 (validMask!0 mask!1365))))

(assert (=> start!42124 e!275548))

(assert (=> start!42124 tp_is_empty!13099))

(assert (=> start!42124 tp!41034))

(assert (=> start!42124 true))

(declare-fun array_inv!10482 (array!29954) Bool)

(assert (=> start!42124 (array_inv!10482 _keys!1025)))

(declare-fun array_inv!10483 (array!29956) Bool)

(assert (=> start!42124 (and (array_inv!10483 _values!833) e!275547)))

(assert (= (and start!42124 res!281087) b!470370))

(assert (= (and b!470370 res!281084) b!470365))

(assert (= (and b!470365 res!281086) b!470369))

(assert (= (and b!470369 res!281085) b!470366))

(assert (= (and b!470368 condMapEmpty!21349) mapIsEmpty!21349))

(assert (= (and b!470368 (not condMapEmpty!21349)) mapNonEmpty!21349))

(get-info :version)

(assert (= (and mapNonEmpty!21349 ((_ is ValueCellFull!6206) mapValue!21349)) b!470371))

(assert (= (and b!470368 ((_ is ValueCellFull!6206) mapDefault!21349)) b!470367))

(assert (= start!42124 b!470368))

(declare-fun m!452899 () Bool)

(assert (=> b!470366 m!452899))

(declare-fun m!452901 () Bool)

(assert (=> b!470366 m!452901))

(declare-fun m!452903 () Bool)

(assert (=> b!470366 m!452903))

(declare-fun m!452905 () Bool)

(assert (=> b!470369 m!452905))

(declare-fun m!452907 () Bool)

(assert (=> mapNonEmpty!21349 m!452907))

(declare-fun m!452909 () Bool)

(assert (=> start!42124 m!452909))

(declare-fun m!452911 () Bool)

(assert (=> start!42124 m!452911))

(declare-fun m!452913 () Bool)

(assert (=> start!42124 m!452913))

(declare-fun m!452915 () Bool)

(assert (=> b!470365 m!452915))

(check-sat b_and!20103 (not b!470366) (not b!470365) tp_is_empty!13099 (not start!42124) (not b_next!11671) (not b!470369) (not mapNonEmpty!21349))
(check-sat b_and!20103 (not b_next!11671))
