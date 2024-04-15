; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93638 () Bool)

(assert start!93638)

(declare-fun b!1059312 () Bool)

(declare-fun e!602909 () Bool)

(declare-fun e!602908 () Bool)

(declare-fun mapRes!39088 () Bool)

(assert (=> b!1059312 (= e!602909 (and e!602908 mapRes!39088))))

(declare-fun condMapEmpty!39088 () Bool)

(declare-datatypes ((V!38401 0))(
  ( (V!38402 (val!12525 Int)) )
))
(declare-datatypes ((ValueCell!11771 0))(
  ( (ValueCellFull!11771 (v!15134 V!38401)) (EmptyCell!11771) )
))
(declare-datatypes ((array!66866 0))(
  ( (array!66867 (arr!32143 (Array (_ BitVec 32) ValueCell!11771)) (size!32681 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66866)

(declare-fun mapDefault!39088 () ValueCell!11771)

(assert (=> b!1059312 (= condMapEmpty!39088 (= (arr!32143 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11771)) mapDefault!39088)))))

(declare-fun b!1059313 () Bool)

(declare-fun tp_is_empty!24949 () Bool)

(assert (=> b!1059313 (= e!602908 tp_is_empty!24949)))

(declare-fun b!1059314 () Bool)

(declare-fun res!707666 () Bool)

(declare-fun e!602906 () Bool)

(assert (=> b!1059314 (=> (not res!707666) (not e!602906))))

(declare-datatypes ((array!66868 0))(
  ( (array!66869 (arr!32144 (Array (_ BitVec 32) (_ BitVec 64))) (size!32682 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66868)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66868 (_ BitVec 32)) Bool)

(assert (=> b!1059314 (= res!707666 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!707667 () Bool)

(assert (=> start!93638 (=> (not res!707667) (not e!602906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93638 (= res!707667 (validMask!0 mask!1515))))

(assert (=> start!93638 e!602906))

(assert (=> start!93638 true))

(declare-fun array_inv!24920 (array!66866) Bool)

(assert (=> start!93638 (and (array_inv!24920 _values!955) e!602909)))

(declare-fun array_inv!24921 (array!66868) Bool)

(assert (=> start!93638 (array_inv!24921 _keys!1163)))

(declare-fun b!1059315 () Bool)

(declare-fun e!602910 () Bool)

(assert (=> b!1059315 (= e!602910 tp_is_empty!24949)))

(declare-fun mapIsEmpty!39088 () Bool)

(assert (=> mapIsEmpty!39088 mapRes!39088))

(declare-fun b!1059316 () Bool)

(declare-fun res!707668 () Bool)

(assert (=> b!1059316 (=> (not res!707668) (not e!602906))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1059316 (= res!707668 (and (= (size!32681 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32682 _keys!1163) (size!32681 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39088 () Bool)

(declare-fun tp!74894 () Bool)

(assert (=> mapNonEmpty!39088 (= mapRes!39088 (and tp!74894 e!602910))))

(declare-fun mapValue!39088 () ValueCell!11771)

(declare-fun mapRest!39088 () (Array (_ BitVec 32) ValueCell!11771))

(declare-fun mapKey!39088 () (_ BitVec 32))

(assert (=> mapNonEmpty!39088 (= (arr!32143 _values!955) (store mapRest!39088 mapKey!39088 mapValue!39088))))

(declare-fun b!1059317 () Bool)

(assert (=> b!1059317 (= e!602906 false)))

(declare-fun lt!466928 () Bool)

(declare-datatypes ((List!22459 0))(
  ( (Nil!22456) (Cons!22455 (h!23664 (_ BitVec 64)) (t!31757 List!22459)) )
))
(declare-fun arrayNoDuplicates!0 (array!66868 (_ BitVec 32) List!22459) Bool)

(assert (=> b!1059317 (= lt!466928 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22456))))

(assert (= (and start!93638 res!707667) b!1059316))

(assert (= (and b!1059316 res!707668) b!1059314))

(assert (= (and b!1059314 res!707666) b!1059317))

(assert (= (and b!1059312 condMapEmpty!39088) mapIsEmpty!39088))

(assert (= (and b!1059312 (not condMapEmpty!39088)) mapNonEmpty!39088))

(get-info :version)

(assert (= (and mapNonEmpty!39088 ((_ is ValueCellFull!11771) mapValue!39088)) b!1059315))

(assert (= (and b!1059312 ((_ is ValueCellFull!11771) mapDefault!39088)) b!1059313))

(assert (= start!93638 b!1059312))

(declare-fun m!978257 () Bool)

(assert (=> b!1059314 m!978257))

(declare-fun m!978259 () Bool)

(assert (=> start!93638 m!978259))

(declare-fun m!978261 () Bool)

(assert (=> start!93638 m!978261))

(declare-fun m!978263 () Bool)

(assert (=> start!93638 m!978263))

(declare-fun m!978265 () Bool)

(assert (=> mapNonEmpty!39088 m!978265))

(declare-fun m!978267 () Bool)

(assert (=> b!1059317 m!978267))

(check-sat (not b!1059314) (not mapNonEmpty!39088) (not start!93638) tp_is_empty!24949 (not b!1059317))
(check-sat)
