; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42190 () Bool)

(assert start!42190)

(declare-fun b_free!11709 () Bool)

(declare-fun b_next!11709 () Bool)

(assert (=> start!42190 (= b_free!11709 (not b_next!11709))))

(declare-fun tp!41151 () Bool)

(declare-fun b_and!20139 () Bool)

(assert (=> start!42190 (= tp!41151 b_and!20139)))

(declare-fun b!470910 () Bool)

(declare-fun e!275926 () Bool)

(assert (=> b!470910 (= e!275926 (not true))))

(declare-datatypes ((V!18621 0))(
  ( (V!18622 (val!6613 Int)) )
))
(declare-datatypes ((tuple2!8710 0))(
  ( (tuple2!8711 (_1!4366 (_ BitVec 64)) (_2!4366 V!18621)) )
))
(declare-datatypes ((List!8790 0))(
  ( (Nil!8787) (Cons!8786 (h!9642 tuple2!8710) (t!14754 List!8790)) )
))
(declare-datatypes ((ListLongMap!7623 0))(
  ( (ListLongMap!7624 (toList!3827 List!8790)) )
))
(declare-fun lt!213660 () ListLongMap!7623)

(declare-fun lt!213661 () ListLongMap!7623)

(assert (=> b!470910 (= lt!213660 lt!213661)))

(declare-fun minValueBefore!38 () V!18621)

(declare-fun zeroValue!794 () V!18621)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13813 0))(
  ( (Unit!13814) )
))
(declare-fun lt!213659 () Unit!13813)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30043 0))(
  ( (array!30044 (arr!14444 (Array (_ BitVec 32) (_ BitVec 64))) (size!14796 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30043)

(declare-datatypes ((ValueCell!6225 0))(
  ( (ValueCellFull!6225 (v!8904 V!18621)) (EmptyCell!6225) )
))
(declare-datatypes ((array!30045 0))(
  ( (array!30046 (arr!14445 (Array (_ BitVec 32) ValueCell!6225)) (size!14797 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30045)

(declare-fun minValueAfter!38 () V!18621)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!170 (array!30043 array!30045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18621 V!18621 V!18621 V!18621 (_ BitVec 32) Int) Unit!13813)

(assert (=> b!470910 (= lt!213659 (lemmaNoChangeToArrayThenSameMapNoExtras!170 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1990 (array!30043 array!30045 (_ BitVec 32) (_ BitVec 32) V!18621 V!18621 (_ BitVec 32) Int) ListLongMap!7623)

(assert (=> b!470910 (= lt!213661 (getCurrentListMapNoExtraKeys!1990 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470910 (= lt!213660 (getCurrentListMapNoExtraKeys!1990 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470911 () Bool)

(declare-fun e!275930 () Bool)

(declare-fun tp_is_empty!13137 () Bool)

(assert (=> b!470911 (= e!275930 tp_is_empty!13137)))

(declare-fun res!281350 () Bool)

(assert (=> start!42190 (=> (not res!281350) (not e!275926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42190 (= res!281350 (validMask!0 mask!1365))))

(assert (=> start!42190 e!275926))

(assert (=> start!42190 tp_is_empty!13137))

(assert (=> start!42190 tp!41151))

(assert (=> start!42190 true))

(declare-fun array_inv!10418 (array!30043) Bool)

(assert (=> start!42190 (array_inv!10418 _keys!1025)))

(declare-fun e!275927 () Bool)

(declare-fun array_inv!10419 (array!30045) Bool)

(assert (=> start!42190 (and (array_inv!10419 _values!833) e!275927)))

(declare-fun b!470912 () Bool)

(declare-fun e!275929 () Bool)

(assert (=> b!470912 (= e!275929 tp_is_empty!13137)))

(declare-fun b!470913 () Bool)

(declare-fun mapRes!21409 () Bool)

(assert (=> b!470913 (= e!275927 (and e!275929 mapRes!21409))))

(declare-fun condMapEmpty!21409 () Bool)

(declare-fun mapDefault!21409 () ValueCell!6225)

(assert (=> b!470913 (= condMapEmpty!21409 (= (arr!14445 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6225)) mapDefault!21409)))))

(declare-fun mapIsEmpty!21409 () Bool)

(assert (=> mapIsEmpty!21409 mapRes!21409))

(declare-fun b!470914 () Bool)

(declare-fun res!281353 () Bool)

(assert (=> b!470914 (=> (not res!281353) (not e!275926))))

(assert (=> b!470914 (= res!281353 (and (= (size!14797 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14796 _keys!1025) (size!14797 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470915 () Bool)

(declare-fun res!281351 () Bool)

(assert (=> b!470915 (=> (not res!281351) (not e!275926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30043 (_ BitVec 32)) Bool)

(assert (=> b!470915 (= res!281351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470916 () Bool)

(declare-fun res!281352 () Bool)

(assert (=> b!470916 (=> (not res!281352) (not e!275926))))

(declare-datatypes ((List!8791 0))(
  ( (Nil!8788) (Cons!8787 (h!9643 (_ BitVec 64)) (t!14755 List!8791)) )
))
(declare-fun arrayNoDuplicates!0 (array!30043 (_ BitVec 32) List!8791) Bool)

(assert (=> b!470916 (= res!281352 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8788))))

(declare-fun mapNonEmpty!21409 () Bool)

(declare-fun tp!41152 () Bool)

(assert (=> mapNonEmpty!21409 (= mapRes!21409 (and tp!41152 e!275930))))

(declare-fun mapValue!21409 () ValueCell!6225)

(declare-fun mapRest!21409 () (Array (_ BitVec 32) ValueCell!6225))

(declare-fun mapKey!21409 () (_ BitVec 32))

(assert (=> mapNonEmpty!21409 (= (arr!14445 _values!833) (store mapRest!21409 mapKey!21409 mapValue!21409))))

(assert (= (and start!42190 res!281350) b!470914))

(assert (= (and b!470914 res!281353) b!470915))

(assert (= (and b!470915 res!281351) b!470916))

(assert (= (and b!470916 res!281352) b!470910))

(assert (= (and b!470913 condMapEmpty!21409) mapIsEmpty!21409))

(assert (= (and b!470913 (not condMapEmpty!21409)) mapNonEmpty!21409))

(get-info :version)

(assert (= (and mapNonEmpty!21409 ((_ is ValueCellFull!6225) mapValue!21409)) b!470911))

(assert (= (and b!470913 ((_ is ValueCellFull!6225) mapDefault!21409)) b!470912))

(assert (= start!42190 b!470913))

(declare-fun m!453125 () Bool)

(assert (=> b!470910 m!453125))

(declare-fun m!453127 () Bool)

(assert (=> b!470910 m!453127))

(declare-fun m!453129 () Bool)

(assert (=> b!470910 m!453129))

(declare-fun m!453131 () Bool)

(assert (=> start!42190 m!453131))

(declare-fun m!453133 () Bool)

(assert (=> start!42190 m!453133))

(declare-fun m!453135 () Bool)

(assert (=> start!42190 m!453135))

(declare-fun m!453137 () Bool)

(assert (=> b!470915 m!453137))

(declare-fun m!453139 () Bool)

(assert (=> mapNonEmpty!21409 m!453139))

(declare-fun m!453141 () Bool)

(assert (=> b!470916 m!453141))

(check-sat (not b_next!11709) (not b!470915) tp_is_empty!13137 (not b!470910) (not b!470916) (not mapNonEmpty!21409) b_and!20139 (not start!42190))
(check-sat b_and!20139 (not b_next!11709))
