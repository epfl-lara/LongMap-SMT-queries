; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41992 () Bool)

(assert start!41992)

(declare-fun b_free!11565 () Bool)

(declare-fun b_next!11565 () Bool)

(assert (=> start!41992 (= b_free!11565 (not b_next!11565))))

(declare-fun tp!40710 () Bool)

(declare-fun b_and!19963 () Bool)

(assert (=> start!41992 (= tp!40710 b_and!19963)))

(declare-fun res!280183 () Bool)

(declare-fun e!274447 () Bool)

(assert (=> start!41992 (=> (not res!280183) (not e!274447))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41992 (= res!280183 (validMask!0 mask!1365))))

(assert (=> start!41992 e!274447))

(declare-fun tp_is_empty!12993 () Bool)

(assert (=> start!41992 tp_is_empty!12993))

(assert (=> start!41992 tp!40710))

(assert (=> start!41992 true))

(declare-datatypes ((array!29761 0))(
  ( (array!29762 (arr!14306 (Array (_ BitVec 32) (_ BitVec 64))) (size!14658 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29761)

(declare-fun array_inv!10326 (array!29761) Bool)

(assert (=> start!41992 (array_inv!10326 _keys!1025)))

(declare-datatypes ((V!18429 0))(
  ( (V!18430 (val!6541 Int)) )
))
(declare-datatypes ((ValueCell!6153 0))(
  ( (ValueCellFull!6153 (v!8830 V!18429)) (EmptyCell!6153) )
))
(declare-datatypes ((array!29763 0))(
  ( (array!29764 (arr!14307 (Array (_ BitVec 32) ValueCell!6153)) (size!14659 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29763)

(declare-fun e!274448 () Bool)

(declare-fun array_inv!10327 (array!29763) Bool)

(assert (=> start!41992 (and (array_inv!10327 _values!833) e!274448)))

(declare-fun b!468834 () Bool)

(declare-fun res!280184 () Bool)

(assert (=> b!468834 (=> (not res!280184) (not e!274447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29761 (_ BitVec 32)) Bool)

(assert (=> b!468834 (= res!280184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468835 () Bool)

(declare-fun e!274449 () Bool)

(assert (=> b!468835 (= e!274449 true)))

(declare-datatypes ((tuple2!8602 0))(
  ( (tuple2!8603 (_1!4312 (_ BitVec 64)) (_2!4312 V!18429)) )
))
(declare-datatypes ((List!8685 0))(
  ( (Nil!8682) (Cons!8681 (h!9537 tuple2!8602) (t!14643 List!8685)) )
))
(declare-datatypes ((ListLongMap!7515 0))(
  ( (ListLongMap!7516 (toList!3773 List!8685)) )
))
(declare-fun lt!212187 () ListLongMap!7515)

(declare-fun lt!212190 () tuple2!8602)

(declare-fun minValueBefore!38 () V!18429)

(declare-fun +!1684 (ListLongMap!7515 tuple2!8602) ListLongMap!7515)

(assert (=> b!468835 (= (+!1684 lt!212187 lt!212190) (+!1684 (+!1684 lt!212187 (tuple2!8603 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212190))))

(declare-fun minValueAfter!38 () V!18429)

(assert (=> b!468835 (= lt!212190 (tuple2!8603 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13701 0))(
  ( (Unit!13702) )
))
(declare-fun lt!212186 () Unit!13701)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!97 (ListLongMap!7515 (_ BitVec 64) V!18429 V!18429) Unit!13701)

(assert (=> b!468835 (= lt!212186 (addSameAsAddTwiceSameKeyDiffValues!97 lt!212187 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212191 () ListLongMap!7515)

(declare-fun zeroValue!794 () V!18429)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMap!2198 (array!29761 array!29763 (_ BitVec 32) (_ BitVec 32) V!18429 V!18429 (_ BitVec 32) Int) ListLongMap!7515)

(assert (=> b!468835 (= lt!212191 (getCurrentListMap!2198 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!212189 () ListLongMap!7515)

(assert (=> b!468835 (= lt!212189 (getCurrentListMap!2198 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468836 () Bool)

(declare-fun res!280181 () Bool)

(assert (=> b!468836 (=> (not res!280181) (not e!274447))))

(assert (=> b!468836 (= res!280181 (and (= (size!14659 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14658 _keys!1025) (size!14659 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21184 () Bool)

(declare-fun mapRes!21184 () Bool)

(assert (=> mapIsEmpty!21184 mapRes!21184))

(declare-fun b!468837 () Bool)

(assert (=> b!468837 (= e!274447 (not e!274449))))

(declare-fun res!280180 () Bool)

(assert (=> b!468837 (=> res!280180 e!274449)))

(assert (=> b!468837 (= res!280180 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!212185 () ListLongMap!7515)

(assert (=> b!468837 (= lt!212187 lt!212185)))

(declare-fun lt!212188 () Unit!13701)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!123 (array!29761 array!29763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18429 V!18429 V!18429 V!18429 (_ BitVec 32) Int) Unit!13701)

(assert (=> b!468837 (= lt!212188 (lemmaNoChangeToArrayThenSameMapNoExtras!123 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1943 (array!29761 array!29763 (_ BitVec 32) (_ BitVec 32) V!18429 V!18429 (_ BitVec 32) Int) ListLongMap!7515)

(assert (=> b!468837 (= lt!212185 (getCurrentListMapNoExtraKeys!1943 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468837 (= lt!212187 (getCurrentListMapNoExtraKeys!1943 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468838 () Bool)

(declare-fun e!274451 () Bool)

(assert (=> b!468838 (= e!274451 tp_is_empty!12993)))

(declare-fun b!468839 () Bool)

(declare-fun res!280182 () Bool)

(assert (=> b!468839 (=> (not res!280182) (not e!274447))))

(declare-datatypes ((List!8686 0))(
  ( (Nil!8683) (Cons!8682 (h!9538 (_ BitVec 64)) (t!14644 List!8686)) )
))
(declare-fun arrayNoDuplicates!0 (array!29761 (_ BitVec 32) List!8686) Bool)

(assert (=> b!468839 (= res!280182 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8683))))

(declare-fun mapNonEmpty!21184 () Bool)

(declare-fun tp!40711 () Bool)

(declare-fun e!274446 () Bool)

(assert (=> mapNonEmpty!21184 (= mapRes!21184 (and tp!40711 e!274446))))

(declare-fun mapValue!21184 () ValueCell!6153)

(declare-fun mapKey!21184 () (_ BitVec 32))

(declare-fun mapRest!21184 () (Array (_ BitVec 32) ValueCell!6153))

(assert (=> mapNonEmpty!21184 (= (arr!14307 _values!833) (store mapRest!21184 mapKey!21184 mapValue!21184))))

(declare-fun b!468840 () Bool)

(assert (=> b!468840 (= e!274448 (and e!274451 mapRes!21184))))

(declare-fun condMapEmpty!21184 () Bool)

(declare-fun mapDefault!21184 () ValueCell!6153)

(assert (=> b!468840 (= condMapEmpty!21184 (= (arr!14307 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6153)) mapDefault!21184)))))

(declare-fun b!468841 () Bool)

(assert (=> b!468841 (= e!274446 tp_is_empty!12993)))

(assert (= (and start!41992 res!280183) b!468836))

(assert (= (and b!468836 res!280181) b!468834))

(assert (= (and b!468834 res!280184) b!468839))

(assert (= (and b!468839 res!280182) b!468837))

(assert (= (and b!468837 (not res!280180)) b!468835))

(assert (= (and b!468840 condMapEmpty!21184) mapIsEmpty!21184))

(assert (= (and b!468840 (not condMapEmpty!21184)) mapNonEmpty!21184))

(get-info :version)

(assert (= (and mapNonEmpty!21184 ((_ is ValueCellFull!6153) mapValue!21184)) b!468841))

(assert (= (and b!468840 ((_ is ValueCellFull!6153) mapDefault!21184)) b!468838))

(assert (= start!41992 b!468840))

(declare-fun m!450871 () Bool)

(assert (=> start!41992 m!450871))

(declare-fun m!450873 () Bool)

(assert (=> start!41992 m!450873))

(declare-fun m!450875 () Bool)

(assert (=> start!41992 m!450875))

(declare-fun m!450877 () Bool)

(assert (=> b!468837 m!450877))

(declare-fun m!450879 () Bool)

(assert (=> b!468837 m!450879))

(declare-fun m!450881 () Bool)

(assert (=> b!468837 m!450881))

(declare-fun m!450883 () Bool)

(assert (=> mapNonEmpty!21184 m!450883))

(declare-fun m!450885 () Bool)

(assert (=> b!468834 m!450885))

(declare-fun m!450887 () Bool)

(assert (=> b!468835 m!450887))

(declare-fun m!450889 () Bool)

(assert (=> b!468835 m!450889))

(declare-fun m!450891 () Bool)

(assert (=> b!468835 m!450891))

(assert (=> b!468835 m!450889))

(declare-fun m!450893 () Bool)

(assert (=> b!468835 m!450893))

(declare-fun m!450895 () Bool)

(assert (=> b!468835 m!450895))

(declare-fun m!450897 () Bool)

(assert (=> b!468835 m!450897))

(declare-fun m!450899 () Bool)

(assert (=> b!468839 m!450899))

(check-sat b_and!19963 (not b!468837) (not b!468834) (not b_next!11565) (not b!468839) tp_is_empty!12993 (not mapNonEmpty!21184) (not b!468835) (not start!41992))
(check-sat b_and!19963 (not b_next!11565))
