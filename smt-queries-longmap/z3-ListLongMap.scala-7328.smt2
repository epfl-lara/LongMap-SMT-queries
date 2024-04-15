; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93644 () Bool)

(assert start!93644)

(declare-fun mapNonEmpty!39097 () Bool)

(declare-fun mapRes!39097 () Bool)

(declare-fun tp!74903 () Bool)

(declare-fun e!602954 () Bool)

(assert (=> mapNonEmpty!39097 (= mapRes!39097 (and tp!74903 e!602954))))

(declare-fun mapKey!39097 () (_ BitVec 32))

(declare-datatypes ((V!38409 0))(
  ( (V!38410 (val!12528 Int)) )
))
(declare-datatypes ((ValueCell!11774 0))(
  ( (ValueCellFull!11774 (v!15137 V!38409)) (EmptyCell!11774) )
))
(declare-datatypes ((array!66876 0))(
  ( (array!66877 (arr!32148 (Array (_ BitVec 32) ValueCell!11774)) (size!32686 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66876)

(declare-fun mapValue!39097 () ValueCell!11774)

(declare-fun mapRest!39097 () (Array (_ BitVec 32) ValueCell!11774))

(assert (=> mapNonEmpty!39097 (= (arr!32148 _values!955) (store mapRest!39097 mapKey!39097 mapValue!39097))))

(declare-fun b!1059366 () Bool)

(declare-fun e!602952 () Bool)

(assert (=> b!1059366 (= e!602952 false)))

(declare-fun lt!466937 () Bool)

(declare-datatypes ((array!66878 0))(
  ( (array!66879 (arr!32149 (Array (_ BitVec 32) (_ BitVec 64))) (size!32687 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66878)

(declare-datatypes ((List!22460 0))(
  ( (Nil!22457) (Cons!22456 (h!23665 (_ BitVec 64)) (t!31758 List!22460)) )
))
(declare-fun arrayNoDuplicates!0 (array!66878 (_ BitVec 32) List!22460) Bool)

(assert (=> b!1059366 (= lt!466937 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22457))))

(declare-fun b!1059367 () Bool)

(declare-fun res!707693 () Bool)

(assert (=> b!1059367 (=> (not res!707693) (not e!602952))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059367 (= res!707693 (and (= (size!32686 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32687 _keys!1163) (size!32686 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39097 () Bool)

(assert (=> mapIsEmpty!39097 mapRes!39097))

(declare-fun b!1059368 () Bool)

(declare-fun e!602953 () Bool)

(declare-fun tp_is_empty!24955 () Bool)

(assert (=> b!1059368 (= e!602953 tp_is_empty!24955)))

(declare-fun b!1059369 () Bool)

(assert (=> b!1059369 (= e!602954 tp_is_empty!24955)))

(declare-fun res!707695 () Bool)

(assert (=> start!93644 (=> (not res!707695) (not e!602952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93644 (= res!707695 (validMask!0 mask!1515))))

(assert (=> start!93644 e!602952))

(assert (=> start!93644 true))

(declare-fun e!602951 () Bool)

(declare-fun array_inv!24924 (array!66876) Bool)

(assert (=> start!93644 (and (array_inv!24924 _values!955) e!602951)))

(declare-fun array_inv!24925 (array!66878) Bool)

(assert (=> start!93644 (array_inv!24925 _keys!1163)))

(declare-fun b!1059370 () Bool)

(assert (=> b!1059370 (= e!602951 (and e!602953 mapRes!39097))))

(declare-fun condMapEmpty!39097 () Bool)

(declare-fun mapDefault!39097 () ValueCell!11774)

(assert (=> b!1059370 (= condMapEmpty!39097 (= (arr!32148 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11774)) mapDefault!39097)))))

(declare-fun b!1059371 () Bool)

(declare-fun res!707694 () Bool)

(assert (=> b!1059371 (=> (not res!707694) (not e!602952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66878 (_ BitVec 32)) Bool)

(assert (=> b!1059371 (= res!707694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!93644 res!707695) b!1059367))

(assert (= (and b!1059367 res!707693) b!1059371))

(assert (= (and b!1059371 res!707694) b!1059366))

(assert (= (and b!1059370 condMapEmpty!39097) mapIsEmpty!39097))

(assert (= (and b!1059370 (not condMapEmpty!39097)) mapNonEmpty!39097))

(get-info :version)

(assert (= (and mapNonEmpty!39097 ((_ is ValueCellFull!11774) mapValue!39097)) b!1059369))

(assert (= (and b!1059370 ((_ is ValueCellFull!11774) mapDefault!39097)) b!1059368))

(assert (= start!93644 b!1059370))

(declare-fun m!978293 () Bool)

(assert (=> mapNonEmpty!39097 m!978293))

(declare-fun m!978295 () Bool)

(assert (=> b!1059366 m!978295))

(declare-fun m!978297 () Bool)

(assert (=> start!93644 m!978297))

(declare-fun m!978299 () Bool)

(assert (=> start!93644 m!978299))

(declare-fun m!978301 () Bool)

(assert (=> start!93644 m!978301))

(declare-fun m!978303 () Bool)

(assert (=> b!1059371 m!978303))

(check-sat (not start!93644) (not b!1059366) (not b!1059371) (not mapNonEmpty!39097) tp_is_empty!24955)
(check-sat)
