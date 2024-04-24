; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93880 () Bool)

(assert start!93880)

(declare-fun b!1060792 () Bool)

(declare-fun res!708257 () Bool)

(declare-fun e!603854 () Bool)

(assert (=> b!1060792 (=> (not res!708257) (not e!603854))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38401 0))(
  ( (V!38402 (val!12525 Int)) )
))
(declare-datatypes ((ValueCell!11771 0))(
  ( (ValueCellFull!11771 (v!15131 V!38401)) (EmptyCell!11771) )
))
(declare-datatypes ((array!66973 0))(
  ( (array!66974 (arr!32190 (Array (_ BitVec 32) ValueCell!11771)) (size!32727 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66973)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66975 0))(
  ( (array!66976 (arr!32191 (Array (_ BitVec 32) (_ BitVec 64))) (size!32728 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66975)

(assert (=> b!1060792 (= res!708257 (and (= (size!32727 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32728 _keys!1163) (size!32727 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39088 () Bool)

(declare-fun mapRes!39088 () Bool)

(assert (=> mapIsEmpty!39088 mapRes!39088))

(declare-fun b!1060793 () Bool)

(declare-fun res!708258 () Bool)

(assert (=> b!1060793 (=> (not res!708258) (not e!603854))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66975 (_ BitVec 32)) Bool)

(assert (=> b!1060793 (= res!708258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060794 () Bool)

(declare-fun e!603858 () Bool)

(declare-fun tp_is_empty!24949 () Bool)

(assert (=> b!1060794 (= e!603858 tp_is_empty!24949)))

(declare-fun res!708259 () Bool)

(assert (=> start!93880 (=> (not res!708259) (not e!603854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93880 (= res!708259 (validMask!0 mask!1515))))

(assert (=> start!93880 e!603854))

(assert (=> start!93880 true))

(declare-fun e!603857 () Bool)

(declare-fun array_inv!24960 (array!66973) Bool)

(assert (=> start!93880 (and (array_inv!24960 _values!955) e!603857)))

(declare-fun array_inv!24961 (array!66975) Bool)

(assert (=> start!93880 (array_inv!24961 _keys!1163)))

(declare-fun mapNonEmpty!39088 () Bool)

(declare-fun tp!74894 () Bool)

(assert (=> mapNonEmpty!39088 (= mapRes!39088 (and tp!74894 e!603858))))

(declare-fun mapValue!39088 () ValueCell!11771)

(declare-fun mapRest!39088 () (Array (_ BitVec 32) ValueCell!11771))

(declare-fun mapKey!39088 () (_ BitVec 32))

(assert (=> mapNonEmpty!39088 (= (arr!32190 _values!955) (store mapRest!39088 mapKey!39088 mapValue!39088))))

(declare-fun b!1060795 () Bool)

(declare-fun e!603855 () Bool)

(assert (=> b!1060795 (= e!603855 tp_is_empty!24949)))

(declare-fun b!1060796 () Bool)

(assert (=> b!1060796 (= e!603857 (and e!603855 mapRes!39088))))

(declare-fun condMapEmpty!39088 () Bool)

(declare-fun mapDefault!39088 () ValueCell!11771)

(assert (=> b!1060796 (= condMapEmpty!39088 (= (arr!32190 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11771)) mapDefault!39088)))))

(declare-fun b!1060797 () Bool)

(assert (=> b!1060797 (= e!603854 false)))

(declare-fun lt!467643 () Bool)

(declare-datatypes ((List!22417 0))(
  ( (Nil!22414) (Cons!22413 (h!23631 (_ BitVec 64)) (t!31716 List!22417)) )
))
(declare-fun arrayNoDuplicates!0 (array!66975 (_ BitVec 32) List!22417) Bool)

(assert (=> b!1060797 (= lt!467643 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22414))))

(assert (= (and start!93880 res!708259) b!1060792))

(assert (= (and b!1060792 res!708257) b!1060793))

(assert (= (and b!1060793 res!708258) b!1060797))

(assert (= (and b!1060796 condMapEmpty!39088) mapIsEmpty!39088))

(assert (= (and b!1060796 (not condMapEmpty!39088)) mapNonEmpty!39088))

(get-info :version)

(assert (= (and mapNonEmpty!39088 ((_ is ValueCellFull!11771) mapValue!39088)) b!1060794))

(assert (= (and b!1060796 ((_ is ValueCellFull!11771) mapDefault!39088)) b!1060795))

(assert (= start!93880 b!1060796))

(declare-fun m!980555 () Bool)

(assert (=> b!1060793 m!980555))

(declare-fun m!980557 () Bool)

(assert (=> start!93880 m!980557))

(declare-fun m!980559 () Bool)

(assert (=> start!93880 m!980559))

(declare-fun m!980561 () Bool)

(assert (=> start!93880 m!980561))

(declare-fun m!980563 () Bool)

(assert (=> mapNonEmpty!39088 m!980563))

(declare-fun m!980565 () Bool)

(assert (=> b!1060797 m!980565))

(check-sat (not mapNonEmpty!39088) (not b!1060793) (not b!1060797) tp_is_empty!24949 (not start!93880))
(check-sat)
