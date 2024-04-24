; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70954 () Bool)

(assert start!70954)

(declare-fun b_free!13045 () Bool)

(declare-fun b_next!13045 () Bool)

(assert (=> start!70954 (= b_free!13045 (not b_next!13045))))

(declare-fun tp!45879 () Bool)

(declare-fun b_and!21927 () Bool)

(assert (=> start!70954 (= tp!45879 b_and!21927)))

(declare-fun b!823108 () Bool)

(declare-fun e!457668 () Bool)

(declare-fun e!457672 () Bool)

(assert (=> b!823108 (= e!457668 (not e!457672))))

(declare-fun res!561157 () Bool)

(assert (=> b!823108 (=> res!561157 e!457672)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823108 (= res!561157 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!24675 0))(
  ( (V!24676 (val!7425 Int)) )
))
(declare-datatypes ((tuple2!9722 0))(
  ( (tuple2!9723 (_1!4872 (_ BitVec 64)) (_2!4872 V!24675)) )
))
(declare-datatypes ((List!15510 0))(
  ( (Nil!15507) (Cons!15506 (h!16641 tuple2!9722) (t!21839 List!15510)) )
))
(declare-datatypes ((ListLongMap!8547 0))(
  ( (ListLongMap!8548 (toList!4289 List!15510)) )
))
(declare-fun lt!370188 () ListLongMap!8547)

(declare-fun lt!370187 () ListLongMap!8547)

(assert (=> b!823108 (= lt!370188 lt!370187)))

(declare-datatypes ((array!45705 0))(
  ( (array!45706 (arr!21898 (Array (_ BitVec 32) (_ BitVec 64))) (size!22318 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45705)

(declare-fun zeroValueAfter!34 () V!24675)

(declare-fun minValue!754 () V!24675)

(declare-datatypes ((ValueCell!6962 0))(
  ( (ValueCellFull!6962 (v!9856 V!24675)) (EmptyCell!6962) )
))
(declare-datatypes ((array!45707 0))(
  ( (array!45708 (arr!21899 (Array (_ BitVec 32) ValueCell!6962)) (size!22319 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45707)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28127 0))(
  ( (Unit!28128) )
))
(declare-fun lt!370189 () Unit!28127)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24675)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!464 (array!45705 array!45707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24675 V!24675 V!24675 V!24675 (_ BitVec 32) Int) Unit!28127)

(assert (=> b!823108 (= lt!370189 (lemmaNoChangeToArrayThenSameMapNoExtras!464 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2376 (array!45705 array!45707 (_ BitVec 32) (_ BitVec 32) V!24675 V!24675 (_ BitVec 32) Int) ListLongMap!8547)

(assert (=> b!823108 (= lt!370187 (getCurrentListMapNoExtraKeys!2376 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823108 (= lt!370188 (getCurrentListMapNoExtraKeys!2376 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23743 () Bool)

(declare-fun mapRes!23743 () Bool)

(assert (=> mapIsEmpty!23743 mapRes!23743))

(declare-fun mapNonEmpty!23743 () Bool)

(declare-fun tp!45880 () Bool)

(declare-fun e!457671 () Bool)

(assert (=> mapNonEmpty!23743 (= mapRes!23743 (and tp!45880 e!457671))))

(declare-fun mapKey!23743 () (_ BitVec 32))

(declare-fun mapRest!23743 () (Array (_ BitVec 32) ValueCell!6962))

(declare-fun mapValue!23743 () ValueCell!6962)

(assert (=> mapNonEmpty!23743 (= (arr!21899 _values!788) (store mapRest!23743 mapKey!23743 mapValue!23743))))

(declare-fun b!823109 () Bool)

(declare-fun res!561159 () Bool)

(assert (=> b!823109 (=> (not res!561159) (not e!457668))))

(assert (=> b!823109 (= res!561159 (and (= (size!22319 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22318 _keys!976) (size!22319 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823110 () Bool)

(declare-fun e!457670 () Bool)

(declare-fun tp_is_empty!14755 () Bool)

(assert (=> b!823110 (= e!457670 tp_is_empty!14755)))

(declare-fun b!823111 () Bool)

(declare-fun res!561160 () Bool)

(assert (=> b!823111 (=> (not res!561160) (not e!457668))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45705 (_ BitVec 32)) Bool)

(assert (=> b!823111 (= res!561160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!561156 () Bool)

(assert (=> start!70954 (=> (not res!561156) (not e!457668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70954 (= res!561156 (validMask!0 mask!1312))))

(assert (=> start!70954 e!457668))

(assert (=> start!70954 tp_is_empty!14755))

(declare-fun array_inv!17521 (array!45705) Bool)

(assert (=> start!70954 (array_inv!17521 _keys!976)))

(assert (=> start!70954 true))

(declare-fun e!457669 () Bool)

(declare-fun array_inv!17522 (array!45707) Bool)

(assert (=> start!70954 (and (array_inv!17522 _values!788) e!457669)))

(assert (=> start!70954 tp!45879))

(declare-fun b!823112 () Bool)

(declare-fun res!561158 () Bool)

(assert (=> b!823112 (=> (not res!561158) (not e!457668))))

(declare-datatypes ((List!15511 0))(
  ( (Nil!15508) (Cons!15507 (h!16642 (_ BitVec 64)) (t!21840 List!15511)) )
))
(declare-fun arrayNoDuplicates!0 (array!45705 (_ BitVec 32) List!15511) Bool)

(assert (=> b!823112 (= res!561158 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15508))))

(declare-fun b!823113 () Bool)

(assert (=> b!823113 (= e!457671 tp_is_empty!14755)))

(declare-fun b!823114 () Bool)

(assert (=> b!823114 (= e!457669 (and e!457670 mapRes!23743))))

(declare-fun condMapEmpty!23743 () Bool)

(declare-fun mapDefault!23743 () ValueCell!6962)

(assert (=> b!823114 (= condMapEmpty!23743 (= (arr!21899 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6962)) mapDefault!23743)))))

(declare-fun b!823115 () Bool)

(assert (=> b!823115 (= e!457672 true)))

(declare-fun lt!370191 () ListLongMap!8547)

(declare-fun lt!370185 () ListLongMap!8547)

(declare-fun lt!370184 () tuple2!9722)

(declare-fun +!1879 (ListLongMap!8547 tuple2!9722) ListLongMap!8547)

(assert (=> b!823115 (= lt!370191 (+!1879 lt!370185 lt!370184))))

(declare-fun lt!370182 () Unit!28127)

(declare-fun addCommutativeForDiffKeys!437 (ListLongMap!8547 (_ BitVec 64) V!24675 (_ BitVec 64) V!24675) Unit!28127)

(assert (=> b!823115 (= lt!370182 (addCommutativeForDiffKeys!437 lt!370188 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370190 () ListLongMap!8547)

(assert (=> b!823115 (= lt!370190 lt!370191)))

(declare-fun lt!370186 () tuple2!9722)

(assert (=> b!823115 (= lt!370191 (+!1879 (+!1879 lt!370188 lt!370184) lt!370186))))

(assert (=> b!823115 (= lt!370184 (tuple2!9723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370183 () ListLongMap!8547)

(assert (=> b!823115 (= lt!370183 lt!370185)))

(assert (=> b!823115 (= lt!370185 (+!1879 lt!370188 lt!370186))))

(assert (=> b!823115 (= lt!370186 (tuple2!9723 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun getCurrentListMap!2443 (array!45705 array!45707 (_ BitVec 32) (_ BitVec 32) V!24675 V!24675 (_ BitVec 32) Int) ListLongMap!8547)

(assert (=> b!823115 (= lt!370190 (getCurrentListMap!2443 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823115 (= lt!370183 (getCurrentListMap!2443 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70954 res!561156) b!823109))

(assert (= (and b!823109 res!561159) b!823111))

(assert (= (and b!823111 res!561160) b!823112))

(assert (= (and b!823112 res!561158) b!823108))

(assert (= (and b!823108 (not res!561157)) b!823115))

(assert (= (and b!823114 condMapEmpty!23743) mapIsEmpty!23743))

(assert (= (and b!823114 (not condMapEmpty!23743)) mapNonEmpty!23743))

(get-info :version)

(assert (= (and mapNonEmpty!23743 ((_ is ValueCellFull!6962) mapValue!23743)) b!823113))

(assert (= (and b!823114 ((_ is ValueCellFull!6962) mapDefault!23743)) b!823110))

(assert (= start!70954 b!823114))

(declare-fun m!765275 () Bool)

(assert (=> mapNonEmpty!23743 m!765275))

(declare-fun m!765277 () Bool)

(assert (=> b!823115 m!765277))

(declare-fun m!765279 () Bool)

(assert (=> b!823115 m!765279))

(declare-fun m!765281 () Bool)

(assert (=> b!823115 m!765281))

(assert (=> b!823115 m!765277))

(declare-fun m!765283 () Bool)

(assert (=> b!823115 m!765283))

(declare-fun m!765285 () Bool)

(assert (=> b!823115 m!765285))

(declare-fun m!765287 () Bool)

(assert (=> b!823115 m!765287))

(declare-fun m!765289 () Bool)

(assert (=> b!823115 m!765289))

(declare-fun m!765291 () Bool)

(assert (=> b!823111 m!765291))

(declare-fun m!765293 () Bool)

(assert (=> b!823112 m!765293))

(declare-fun m!765295 () Bool)

(assert (=> start!70954 m!765295))

(declare-fun m!765297 () Bool)

(assert (=> start!70954 m!765297))

(declare-fun m!765299 () Bool)

(assert (=> start!70954 m!765299))

(declare-fun m!765301 () Bool)

(assert (=> b!823108 m!765301))

(declare-fun m!765303 () Bool)

(assert (=> b!823108 m!765303))

(declare-fun m!765305 () Bool)

(assert (=> b!823108 m!765305))

(check-sat (not b_next!13045) (not mapNonEmpty!23743) (not b!823108) (not start!70954) (not b!823112) b_and!21927 tp_is_empty!14755 (not b!823111) (not b!823115))
(check-sat b_and!21927 (not b_next!13045))
