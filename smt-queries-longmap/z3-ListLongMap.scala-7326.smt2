; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93874 () Bool)

(assert start!93874)

(declare-fun b!1060738 () Bool)

(declare-fun e!603813 () Bool)

(declare-fun tp_is_empty!24943 () Bool)

(assert (=> b!1060738 (= e!603813 tp_is_empty!24943)))

(declare-fun b!1060739 () Bool)

(declare-fun e!603809 () Bool)

(assert (=> b!1060739 (= e!603809 tp_is_empty!24943)))

(declare-fun b!1060740 () Bool)

(declare-fun e!603812 () Bool)

(assert (=> b!1060740 (= e!603812 false)))

(declare-fun lt!467634 () Bool)

(declare-datatypes ((array!66963 0))(
  ( (array!66964 (arr!32185 (Array (_ BitVec 32) (_ BitVec 64))) (size!32722 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66963)

(declare-datatypes ((List!22416 0))(
  ( (Nil!22413) (Cons!22412 (h!23630 (_ BitVec 64)) (t!31715 List!22416)) )
))
(declare-fun arrayNoDuplicates!0 (array!66963 (_ BitVec 32) List!22416) Bool)

(assert (=> b!1060740 (= lt!467634 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22413))))

(declare-fun b!1060741 () Bool)

(declare-fun res!708230 () Bool)

(assert (=> b!1060741 (=> (not res!708230) (not e!603812))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38393 0))(
  ( (V!38394 (val!12522 Int)) )
))
(declare-datatypes ((ValueCell!11768 0))(
  ( (ValueCellFull!11768 (v!15128 V!38393)) (EmptyCell!11768) )
))
(declare-datatypes ((array!66965 0))(
  ( (array!66966 (arr!32186 (Array (_ BitVec 32) ValueCell!11768)) (size!32723 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66965)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1060741 (= res!708230 (and (= (size!32723 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32722 _keys!1163) (size!32723 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060742 () Bool)

(declare-fun e!603810 () Bool)

(declare-fun mapRes!39079 () Bool)

(assert (=> b!1060742 (= e!603810 (and e!603813 mapRes!39079))))

(declare-fun condMapEmpty!39079 () Bool)

(declare-fun mapDefault!39079 () ValueCell!11768)

(assert (=> b!1060742 (= condMapEmpty!39079 (= (arr!32186 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11768)) mapDefault!39079)))))

(declare-fun b!1060743 () Bool)

(declare-fun res!708232 () Bool)

(assert (=> b!1060743 (=> (not res!708232) (not e!603812))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66963 (_ BitVec 32)) Bool)

(assert (=> b!1060743 (= res!708232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapIsEmpty!39079 () Bool)

(assert (=> mapIsEmpty!39079 mapRes!39079))

(declare-fun mapNonEmpty!39079 () Bool)

(declare-fun tp!74885 () Bool)

(assert (=> mapNonEmpty!39079 (= mapRes!39079 (and tp!74885 e!603809))))

(declare-fun mapRest!39079 () (Array (_ BitVec 32) ValueCell!11768))

(declare-fun mapValue!39079 () ValueCell!11768)

(declare-fun mapKey!39079 () (_ BitVec 32))

(assert (=> mapNonEmpty!39079 (= (arr!32186 _values!955) (store mapRest!39079 mapKey!39079 mapValue!39079))))

(declare-fun res!708231 () Bool)

(assert (=> start!93874 (=> (not res!708231) (not e!603812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93874 (= res!708231 (validMask!0 mask!1515))))

(assert (=> start!93874 e!603812))

(assert (=> start!93874 true))

(declare-fun array_inv!24956 (array!66965) Bool)

(assert (=> start!93874 (and (array_inv!24956 _values!955) e!603810)))

(declare-fun array_inv!24957 (array!66963) Bool)

(assert (=> start!93874 (array_inv!24957 _keys!1163)))

(assert (= (and start!93874 res!708231) b!1060741))

(assert (= (and b!1060741 res!708230) b!1060743))

(assert (= (and b!1060743 res!708232) b!1060740))

(assert (= (and b!1060742 condMapEmpty!39079) mapIsEmpty!39079))

(assert (= (and b!1060742 (not condMapEmpty!39079)) mapNonEmpty!39079))

(get-info :version)

(assert (= (and mapNonEmpty!39079 ((_ is ValueCellFull!11768) mapValue!39079)) b!1060739))

(assert (= (and b!1060742 ((_ is ValueCellFull!11768) mapDefault!39079)) b!1060738))

(assert (= start!93874 b!1060742))

(declare-fun m!980519 () Bool)

(assert (=> b!1060740 m!980519))

(declare-fun m!980521 () Bool)

(assert (=> b!1060743 m!980521))

(declare-fun m!980523 () Bool)

(assert (=> mapNonEmpty!39079 m!980523))

(declare-fun m!980525 () Bool)

(assert (=> start!93874 m!980525))

(declare-fun m!980527 () Bool)

(assert (=> start!93874 m!980527))

(declare-fun m!980529 () Bool)

(assert (=> start!93874 m!980529))

(check-sat (not b!1060743) (not start!93874) tp_is_empty!24943 (not b!1060740) (not mapNonEmpty!39079))
(check-sat)
