; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93868 () Bool)

(assert start!93868)

(declare-fun res!708204 () Bool)

(declare-fun e!603766 () Bool)

(assert (=> start!93868 (=> (not res!708204) (not e!603766))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93868 (= res!708204 (validMask!0 mask!1515))))

(assert (=> start!93868 e!603766))

(assert (=> start!93868 true))

(declare-datatypes ((V!38385 0))(
  ( (V!38386 (val!12519 Int)) )
))
(declare-datatypes ((ValueCell!11765 0))(
  ( (ValueCellFull!11765 (v!15125 V!38385)) (EmptyCell!11765) )
))
(declare-datatypes ((array!66951 0))(
  ( (array!66952 (arr!32179 (Array (_ BitVec 32) ValueCell!11765)) (size!32716 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66951)

(declare-fun e!603768 () Bool)

(declare-fun array_inv!24950 (array!66951) Bool)

(assert (=> start!93868 (and (array_inv!24950 _values!955) e!603768)))

(declare-datatypes ((array!66953 0))(
  ( (array!66954 (arr!32180 (Array (_ BitVec 32) (_ BitVec 64))) (size!32717 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66953)

(declare-fun array_inv!24951 (array!66953) Bool)

(assert (=> start!93868 (array_inv!24951 _keys!1163)))

(declare-fun mapNonEmpty!39070 () Bool)

(declare-fun mapRes!39070 () Bool)

(declare-fun tp!74876 () Bool)

(declare-fun e!603767 () Bool)

(assert (=> mapNonEmpty!39070 (= mapRes!39070 (and tp!74876 e!603767))))

(declare-fun mapValue!39070 () ValueCell!11765)

(declare-fun mapKey!39070 () (_ BitVec 32))

(declare-fun mapRest!39070 () (Array (_ BitVec 32) ValueCell!11765))

(assert (=> mapNonEmpty!39070 (= (arr!32179 _values!955) (store mapRest!39070 mapKey!39070 mapValue!39070))))

(declare-fun b!1060684 () Bool)

(declare-fun e!603764 () Bool)

(declare-fun tp_is_empty!24937 () Bool)

(assert (=> b!1060684 (= e!603764 tp_is_empty!24937)))

(declare-fun b!1060685 () Bool)

(assert (=> b!1060685 (= e!603767 tp_is_empty!24937)))

(declare-fun b!1060686 () Bool)

(assert (=> b!1060686 (= e!603768 (and e!603764 mapRes!39070))))

(declare-fun condMapEmpty!39070 () Bool)

(declare-fun mapDefault!39070 () ValueCell!11765)

(assert (=> b!1060686 (= condMapEmpty!39070 (= (arr!32179 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11765)) mapDefault!39070)))))

(declare-fun b!1060687 () Bool)

(declare-fun res!708203 () Bool)

(assert (=> b!1060687 (=> (not res!708203) (not e!603766))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060687 (= res!708203 (and (= (size!32716 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32717 _keys!1163) (size!32716 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060688 () Bool)

(declare-fun res!708205 () Bool)

(assert (=> b!1060688 (=> (not res!708205) (not e!603766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66953 (_ BitVec 32)) Bool)

(assert (=> b!1060688 (= res!708205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060689 () Bool)

(assert (=> b!1060689 (= e!603766 false)))

(declare-fun lt!467625 () Bool)

(declare-datatypes ((List!22413 0))(
  ( (Nil!22410) (Cons!22409 (h!23627 (_ BitVec 64)) (t!31712 List!22413)) )
))
(declare-fun arrayNoDuplicates!0 (array!66953 (_ BitVec 32) List!22413) Bool)

(assert (=> b!1060689 (= lt!467625 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22410))))

(declare-fun mapIsEmpty!39070 () Bool)

(assert (=> mapIsEmpty!39070 mapRes!39070))

(assert (= (and start!93868 res!708204) b!1060687))

(assert (= (and b!1060687 res!708203) b!1060688))

(assert (= (and b!1060688 res!708205) b!1060689))

(assert (= (and b!1060686 condMapEmpty!39070) mapIsEmpty!39070))

(assert (= (and b!1060686 (not condMapEmpty!39070)) mapNonEmpty!39070))

(get-info :version)

(assert (= (and mapNonEmpty!39070 ((_ is ValueCellFull!11765) mapValue!39070)) b!1060685))

(assert (= (and b!1060686 ((_ is ValueCellFull!11765) mapDefault!39070)) b!1060684))

(assert (= start!93868 b!1060686))

(declare-fun m!980483 () Bool)

(assert (=> start!93868 m!980483))

(declare-fun m!980485 () Bool)

(assert (=> start!93868 m!980485))

(declare-fun m!980487 () Bool)

(assert (=> start!93868 m!980487))

(declare-fun m!980489 () Bool)

(assert (=> mapNonEmpty!39070 m!980489))

(declare-fun m!980491 () Bool)

(assert (=> b!1060688 m!980491))

(declare-fun m!980493 () Bool)

(assert (=> b!1060689 m!980493))

(check-sat (not b!1060688) tp_is_empty!24937 (not b!1060689) (not start!93868) (not mapNonEmpty!39070))
(check-sat)
