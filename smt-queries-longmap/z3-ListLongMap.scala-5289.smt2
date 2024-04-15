; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70904 () Bool)

(assert start!70904)

(declare-fun b_free!13141 () Bool)

(declare-fun b_next!13141 () Bool)

(assert (=> start!70904 (= b_free!13141 (not b_next!13141))))

(declare-fun tp!46174 () Bool)

(declare-fun b_and!22011 () Bool)

(assert (=> start!70904 (= tp!46174 b_and!22011)))

(declare-fun b!823471 () Bool)

(declare-fun res!561572 () Bool)

(declare-fun e!458022 () Bool)

(assert (=> b!823471 (=> (not res!561572) (not e!458022))))

(declare-datatypes ((array!45863 0))(
  ( (array!45864 (arr!21980 (Array (_ BitVec 32) (_ BitVec 64))) (size!22401 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45863)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24803 0))(
  ( (V!24804 (val!7473 Int)) )
))
(declare-datatypes ((ValueCell!7010 0))(
  ( (ValueCellFull!7010 (v!9900 V!24803)) (EmptyCell!7010) )
))
(declare-datatypes ((array!45865 0))(
  ( (array!45866 (arr!21981 (Array (_ BitVec 32) ValueCell!7010)) (size!22402 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45865)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823471 (= res!561572 (and (= (size!22402 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22401 _keys!976) (size!22402 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!561571 () Bool)

(assert (=> start!70904 (=> (not res!561571) (not e!458022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70904 (= res!561571 (validMask!0 mask!1312))))

(assert (=> start!70904 e!458022))

(declare-fun tp_is_empty!14851 () Bool)

(assert (=> start!70904 tp_is_empty!14851))

(declare-fun array_inv!17609 (array!45863) Bool)

(assert (=> start!70904 (array_inv!17609 _keys!976)))

(assert (=> start!70904 true))

(declare-fun e!458019 () Bool)

(declare-fun array_inv!17610 (array!45865) Bool)

(assert (=> start!70904 (and (array_inv!17610 _values!788) e!458019)))

(assert (=> start!70904 tp!46174))

(declare-fun mapIsEmpty!23893 () Bool)

(declare-fun mapRes!23893 () Bool)

(assert (=> mapIsEmpty!23893 mapRes!23893))

(declare-fun b!823472 () Bool)

(declare-fun e!458020 () Bool)

(assert (=> b!823472 (= e!458020 tp_is_empty!14851)))

(declare-fun b!823473 () Bool)

(assert (=> b!823473 (= e!458022 (not true))))

(declare-datatypes ((tuple2!9886 0))(
  ( (tuple2!9887 (_1!4954 (_ BitVec 64)) (_2!4954 V!24803)) )
))
(declare-datatypes ((List!15687 0))(
  ( (Nil!15684) (Cons!15683 (h!16812 tuple2!9886) (t!22019 List!15687)) )
))
(declare-datatypes ((ListLongMap!8699 0))(
  ( (ListLongMap!8700 (toList!4365 List!15687)) )
))
(declare-fun lt!371260 () ListLongMap!8699)

(declare-fun lt!371258 () ListLongMap!8699)

(assert (=> b!823473 (= lt!371260 lt!371258)))

(declare-fun zeroValueBefore!34 () V!24803)

(declare-fun zeroValueAfter!34 () V!24803)

(declare-fun minValue!754 () V!24803)

(declare-datatypes ((Unit!28154 0))(
  ( (Unit!28155) )
))
(declare-fun lt!371259 () Unit!28154)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!502 (array!45863 array!45865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24803 V!24803 V!24803 V!24803 (_ BitVec 32) Int) Unit!28154)

(assert (=> b!823473 (= lt!371259 (lemmaNoChangeToArrayThenSameMapNoExtras!502 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2409 (array!45863 array!45865 (_ BitVec 32) (_ BitVec 32) V!24803 V!24803 (_ BitVec 32) Int) ListLongMap!8699)

(assert (=> b!823473 (= lt!371258 (getCurrentListMapNoExtraKeys!2409 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823473 (= lt!371260 (getCurrentListMapNoExtraKeys!2409 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823474 () Bool)

(declare-fun res!561573 () Bool)

(assert (=> b!823474 (=> (not res!561573) (not e!458022))))

(declare-datatypes ((List!15688 0))(
  ( (Nil!15685) (Cons!15684 (h!16813 (_ BitVec 64)) (t!22020 List!15688)) )
))
(declare-fun arrayNoDuplicates!0 (array!45863 (_ BitVec 32) List!15688) Bool)

(assert (=> b!823474 (= res!561573 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15685))))

(declare-fun b!823475 () Bool)

(declare-fun res!561574 () Bool)

(assert (=> b!823475 (=> (not res!561574) (not e!458022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45863 (_ BitVec 32)) Bool)

(assert (=> b!823475 (= res!561574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23893 () Bool)

(declare-fun tp!46173 () Bool)

(declare-fun e!458021 () Bool)

(assert (=> mapNonEmpty!23893 (= mapRes!23893 (and tp!46173 e!458021))))

(declare-fun mapValue!23893 () ValueCell!7010)

(declare-fun mapKey!23893 () (_ BitVec 32))

(declare-fun mapRest!23893 () (Array (_ BitVec 32) ValueCell!7010))

(assert (=> mapNonEmpty!23893 (= (arr!21981 _values!788) (store mapRest!23893 mapKey!23893 mapValue!23893))))

(declare-fun b!823476 () Bool)

(assert (=> b!823476 (= e!458021 tp_is_empty!14851)))

(declare-fun b!823477 () Bool)

(assert (=> b!823477 (= e!458019 (and e!458020 mapRes!23893))))

(declare-fun condMapEmpty!23893 () Bool)

(declare-fun mapDefault!23893 () ValueCell!7010)

(assert (=> b!823477 (= condMapEmpty!23893 (= (arr!21981 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7010)) mapDefault!23893)))))

(assert (= (and start!70904 res!561571) b!823471))

(assert (= (and b!823471 res!561572) b!823475))

(assert (= (and b!823475 res!561574) b!823474))

(assert (= (and b!823474 res!561573) b!823473))

(assert (= (and b!823477 condMapEmpty!23893) mapIsEmpty!23893))

(assert (= (and b!823477 (not condMapEmpty!23893)) mapNonEmpty!23893))

(get-info :version)

(assert (= (and mapNonEmpty!23893 ((_ is ValueCellFull!7010) mapValue!23893)) b!823476))

(assert (= (and b!823477 ((_ is ValueCellFull!7010) mapDefault!23893)) b!823472))

(assert (= start!70904 b!823477))

(declare-fun m!765167 () Bool)

(assert (=> b!823474 m!765167))

(declare-fun m!765169 () Bool)

(assert (=> mapNonEmpty!23893 m!765169))

(declare-fun m!765171 () Bool)

(assert (=> b!823475 m!765171))

(declare-fun m!765173 () Bool)

(assert (=> b!823473 m!765173))

(declare-fun m!765175 () Bool)

(assert (=> b!823473 m!765175))

(declare-fun m!765177 () Bool)

(assert (=> b!823473 m!765177))

(declare-fun m!765179 () Bool)

(assert (=> start!70904 m!765179))

(declare-fun m!765181 () Bool)

(assert (=> start!70904 m!765181))

(declare-fun m!765183 () Bool)

(assert (=> start!70904 m!765183))

(check-sat (not b!823473) (not b_next!13141) tp_is_empty!14851 (not start!70904) (not b!823474) (not b!823475) (not mapNonEmpty!23893) b_and!22011)
(check-sat b_and!22011 (not b_next!13141))
