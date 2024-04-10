; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41562 () Bool)

(assert start!41562)

(declare-fun b_free!11229 () Bool)

(declare-fun b_next!11229 () Bool)

(assert (=> start!41562 (= b_free!11229 (not b_next!11229))))

(declare-fun tp!39685 () Bool)

(declare-fun b_and!19569 () Bool)

(assert (=> start!41562 (= tp!39685 b_and!19569)))

(declare-fun b!464251 () Bool)

(declare-fun res!277566 () Bool)

(declare-fun e!271164 () Bool)

(assert (=> b!464251 (=> (not res!277566) (not e!271164))))

(declare-datatypes ((array!29103 0))(
  ( (array!29104 (arr!13983 (Array (_ BitVec 32) (_ BitVec 64))) (size!14335 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29103)

(declare-datatypes ((List!8442 0))(
  ( (Nil!8439) (Cons!8438 (h!9294 (_ BitVec 64)) (t!14388 List!8442)) )
))
(declare-fun arrayNoDuplicates!0 (array!29103 (_ BitVec 32) List!8442) Bool)

(assert (=> b!464251 (= res!277566 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8439))))

(declare-fun b!464252 () Bool)

(declare-fun res!277568 () Bool)

(assert (=> b!464252 (=> (not res!277568) (not e!271164))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29103 (_ BitVec 32)) Bool)

(assert (=> b!464252 (= res!277568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!464253 () Bool)

(declare-fun e!271163 () Bool)

(declare-fun tp_is_empty!12657 () Bool)

(assert (=> b!464253 (= e!271163 tp_is_empty!12657)))

(declare-fun b!464254 () Bool)

(declare-fun e!271165 () Bool)

(assert (=> b!464254 (= e!271165 tp_is_empty!12657)))

(declare-fun b!464255 () Bool)

(assert (=> b!464255 (= e!271164 (not true))))

(declare-datatypes ((V!17981 0))(
  ( (V!17982 (val!6373 Int)) )
))
(declare-datatypes ((tuple2!8348 0))(
  ( (tuple2!8349 (_1!4185 (_ BitVec 64)) (_2!4185 V!17981)) )
))
(declare-datatypes ((List!8443 0))(
  ( (Nil!8440) (Cons!8439 (h!9295 tuple2!8348) (t!14389 List!8443)) )
))
(declare-datatypes ((ListLongMap!7261 0))(
  ( (ListLongMap!7262 (toList!3646 List!8443)) )
))
(declare-fun lt!209634 () ListLongMap!7261)

(declare-fun lt!209635 () ListLongMap!7261)

(assert (=> b!464255 (= lt!209634 lt!209635)))

(declare-fun zeroValue!794 () V!17981)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13460 0))(
  ( (Unit!13461) )
))
(declare-fun lt!209636 () Unit!13460)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!17981)

(declare-datatypes ((ValueCell!5985 0))(
  ( (ValueCellFull!5985 (v!8660 V!17981)) (EmptyCell!5985) )
))
(declare-datatypes ((array!29105 0))(
  ( (array!29106 (arr!13984 (Array (_ BitVec 32) ValueCell!5985)) (size!14336 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29105)

(declare-fun minValueAfter!38 () V!17981)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!6 (array!29103 array!29105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17981 V!17981 V!17981 V!17981 (_ BitVec 32) Int) Unit!13460)

(assert (=> b!464255 (= lt!209636 (lemmaNoChangeToArrayThenSameMapNoExtras!6 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1826 (array!29103 array!29105 (_ BitVec 32) (_ BitVec 32) V!17981 V!17981 (_ BitVec 32) Int) ListLongMap!7261)

(assert (=> b!464255 (= lt!209635 (getCurrentListMapNoExtraKeys!1826 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464255 (= lt!209634 (getCurrentListMapNoExtraKeys!1826 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!464256 () Bool)

(declare-fun e!271167 () Bool)

(declare-fun mapRes!20662 () Bool)

(assert (=> b!464256 (= e!271167 (and e!271163 mapRes!20662))))

(declare-fun condMapEmpty!20662 () Bool)

(declare-fun mapDefault!20662 () ValueCell!5985)

(assert (=> b!464256 (= condMapEmpty!20662 (= (arr!13984 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5985)) mapDefault!20662)))))

(declare-fun res!277565 () Bool)

(assert (=> start!41562 (=> (not res!277565) (not e!271164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41562 (= res!277565 (validMask!0 mask!1365))))

(assert (=> start!41562 e!271164))

(assert (=> start!41562 tp_is_empty!12657))

(assert (=> start!41562 tp!39685))

(assert (=> start!41562 true))

(declare-fun array_inv!10100 (array!29103) Bool)

(assert (=> start!41562 (array_inv!10100 _keys!1025)))

(declare-fun array_inv!10101 (array!29105) Bool)

(assert (=> start!41562 (and (array_inv!10101 _values!833) e!271167)))

(declare-fun mapNonEmpty!20662 () Bool)

(declare-fun tp!39684 () Bool)

(assert (=> mapNonEmpty!20662 (= mapRes!20662 (and tp!39684 e!271165))))

(declare-fun mapKey!20662 () (_ BitVec 32))

(declare-fun mapValue!20662 () ValueCell!5985)

(declare-fun mapRest!20662 () (Array (_ BitVec 32) ValueCell!5985))

(assert (=> mapNonEmpty!20662 (= (arr!13984 _values!833) (store mapRest!20662 mapKey!20662 mapValue!20662))))

(declare-fun b!464257 () Bool)

(declare-fun res!277567 () Bool)

(assert (=> b!464257 (=> (not res!277567) (not e!271164))))

(assert (=> b!464257 (= res!277567 (and (= (size!14336 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14335 _keys!1025) (size!14336 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20662 () Bool)

(assert (=> mapIsEmpty!20662 mapRes!20662))

(assert (= (and start!41562 res!277565) b!464257))

(assert (= (and b!464257 res!277567) b!464252))

(assert (= (and b!464252 res!277568) b!464251))

(assert (= (and b!464251 res!277566) b!464255))

(assert (= (and b!464256 condMapEmpty!20662) mapIsEmpty!20662))

(assert (= (and b!464256 (not condMapEmpty!20662)) mapNonEmpty!20662))

(get-info :version)

(assert (= (and mapNonEmpty!20662 ((_ is ValueCellFull!5985) mapValue!20662)) b!464254))

(assert (= (and b!464256 ((_ is ValueCellFull!5985) mapDefault!20662)) b!464253))

(assert (= start!41562 b!464256))

(declare-fun m!446663 () Bool)

(assert (=> mapNonEmpty!20662 m!446663))

(declare-fun m!446665 () Bool)

(assert (=> start!41562 m!446665))

(declare-fun m!446667 () Bool)

(assert (=> start!41562 m!446667))

(declare-fun m!446669 () Bool)

(assert (=> start!41562 m!446669))

(declare-fun m!446671 () Bool)

(assert (=> b!464252 m!446671))

(declare-fun m!446673 () Bool)

(assert (=> b!464255 m!446673))

(declare-fun m!446675 () Bool)

(assert (=> b!464255 m!446675))

(declare-fun m!446677 () Bool)

(assert (=> b!464255 m!446677))

(declare-fun m!446679 () Bool)

(assert (=> b!464251 m!446679))

(check-sat (not start!41562) (not b!464251) tp_is_empty!12657 (not b!464255) b_and!19569 (not b_next!11229) (not b!464252) (not mapNonEmpty!20662))
(check-sat b_and!19569 (not b_next!11229))
