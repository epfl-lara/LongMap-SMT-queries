; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93794 () Bool)

(assert start!93794)

(declare-fun b!1060284 () Bool)

(declare-fun e!603448 () Bool)

(declare-fun tp_is_empty!24907 () Bool)

(assert (=> b!1060284 (= e!603448 tp_is_empty!24907)))

(declare-fun mapIsEmpty!39010 () Bool)

(declare-fun mapRes!39010 () Bool)

(assert (=> mapIsEmpty!39010 mapRes!39010))

(declare-fun b!1060285 () Bool)

(declare-fun e!603446 () Bool)

(assert (=> b!1060285 (= e!603446 tp_is_empty!24907)))

(declare-fun b!1060286 () Bool)

(declare-fun e!603445 () Bool)

(assert (=> b!1060286 (= e!603445 (and e!603446 mapRes!39010))))

(declare-fun condMapEmpty!39010 () Bool)

(declare-datatypes ((V!38345 0))(
  ( (V!38346 (val!12504 Int)) )
))
(declare-datatypes ((ValueCell!11750 0))(
  ( (ValueCellFull!11750 (v!15109 V!38345)) (EmptyCell!11750) )
))
(declare-datatypes ((array!66885 0))(
  ( (array!66886 (arr!32151 (Array (_ BitVec 32) ValueCell!11750)) (size!32688 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66885)

(declare-fun mapDefault!39010 () ValueCell!11750)

(assert (=> b!1060286 (= condMapEmpty!39010 (= (arr!32151 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11750)) mapDefault!39010)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun e!603447 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66887 0))(
  ( (array!66888 (arr!32152 (Array (_ BitVec 32) (_ BitVec 64))) (size!32689 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66887)

(declare-fun b!1060287 () Bool)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060287 (= e!603447 (and (= (size!32688 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32689 _keys!1163) (size!32688 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (size!32689 _keys!1163) (bvadd #b00000000000000000000000000000001 mask!1515)) (bvsgt #b00000000000000000000000000000000 (size!32689 _keys!1163))))))

(declare-fun res!708002 () Bool)

(assert (=> start!93794 (=> (not res!708002) (not e!603447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93794 (= res!708002 (validMask!0 mask!1515))))

(assert (=> start!93794 e!603447))

(assert (=> start!93794 true))

(declare-fun array_inv!24932 (array!66885) Bool)

(assert (=> start!93794 (and (array_inv!24932 _values!955) e!603445)))

(declare-fun array_inv!24933 (array!66887) Bool)

(assert (=> start!93794 (array_inv!24933 _keys!1163)))

(declare-fun mapNonEmpty!39010 () Bool)

(declare-fun tp!74816 () Bool)

(assert (=> mapNonEmpty!39010 (= mapRes!39010 (and tp!74816 e!603448))))

(declare-fun mapKey!39010 () (_ BitVec 32))

(declare-fun mapValue!39010 () ValueCell!11750)

(declare-fun mapRest!39010 () (Array (_ BitVec 32) ValueCell!11750))

(assert (=> mapNonEmpty!39010 (= (arr!32151 _values!955) (store mapRest!39010 mapKey!39010 mapValue!39010))))

(assert (= (and start!93794 res!708002) b!1060287))

(assert (= (and b!1060286 condMapEmpty!39010) mapIsEmpty!39010))

(assert (= (and b!1060286 (not condMapEmpty!39010)) mapNonEmpty!39010))

(get-info :version)

(assert (= (and mapNonEmpty!39010 ((_ is ValueCellFull!11750) mapValue!39010)) b!1060284))

(assert (= (and b!1060286 ((_ is ValueCellFull!11750) mapDefault!39010)) b!1060285))

(assert (= start!93794 b!1060286))

(declare-fun m!980239 () Bool)

(assert (=> start!93794 m!980239))

(declare-fun m!980241 () Bool)

(assert (=> start!93794 m!980241))

(declare-fun m!980243 () Bool)

(assert (=> start!93794 m!980243))

(declare-fun m!980245 () Bool)

(assert (=> mapNonEmpty!39010 m!980245))

(check-sat (not start!93794) (not mapNonEmpty!39010) tp_is_empty!24907)
(check-sat)
(get-model)

(declare-fun d!129139 () Bool)

(assert (=> d!129139 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93794 d!129139))

(declare-fun d!129141 () Bool)

(assert (=> d!129141 (= (array_inv!24932 _values!955) (bvsge (size!32688 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93794 d!129141))

(declare-fun d!129143 () Bool)

(assert (=> d!129143 (= (array_inv!24933 _keys!1163) (bvsge (size!32689 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93794 d!129143))

(declare-fun condMapEmpty!39019 () Bool)

(declare-fun mapDefault!39019 () ValueCell!11750)

(assert (=> mapNonEmpty!39010 (= condMapEmpty!39019 (= mapRest!39010 ((as const (Array (_ BitVec 32) ValueCell!11750)) mapDefault!39019)))))

(declare-fun e!603484 () Bool)

(declare-fun mapRes!39019 () Bool)

(assert (=> mapNonEmpty!39010 (= tp!74816 (and e!603484 mapRes!39019))))

(declare-fun mapIsEmpty!39019 () Bool)

(assert (=> mapIsEmpty!39019 mapRes!39019))

(declare-fun b!1060318 () Bool)

(declare-fun e!603483 () Bool)

(assert (=> b!1060318 (= e!603483 tp_is_empty!24907)))

(declare-fun b!1060319 () Bool)

(assert (=> b!1060319 (= e!603484 tp_is_empty!24907)))

(declare-fun mapNonEmpty!39019 () Bool)

(declare-fun tp!74825 () Bool)

(assert (=> mapNonEmpty!39019 (= mapRes!39019 (and tp!74825 e!603483))))

(declare-fun mapKey!39019 () (_ BitVec 32))

(declare-fun mapValue!39019 () ValueCell!11750)

(declare-fun mapRest!39019 () (Array (_ BitVec 32) ValueCell!11750))

(assert (=> mapNonEmpty!39019 (= mapRest!39010 (store mapRest!39019 mapKey!39019 mapValue!39019))))

(assert (= (and mapNonEmpty!39010 condMapEmpty!39019) mapIsEmpty!39019))

(assert (= (and mapNonEmpty!39010 (not condMapEmpty!39019)) mapNonEmpty!39019))

(assert (= (and mapNonEmpty!39019 ((_ is ValueCellFull!11750) mapValue!39019)) b!1060318))

(assert (= (and mapNonEmpty!39010 ((_ is ValueCellFull!11750) mapDefault!39019)) b!1060319))

(declare-fun m!980263 () Bool)

(assert (=> mapNonEmpty!39019 m!980263))

(check-sat (not mapNonEmpty!39019) tp_is_empty!24907)
(check-sat)
