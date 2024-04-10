; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93658 () Bool)

(assert start!93658)

(declare-fun b!1059591 () Bool)

(declare-fun e!603104 () Bool)

(declare-fun tp_is_empty!24963 () Bool)

(assert (=> b!1059591 (= e!603104 tp_is_empty!24963)))

(declare-fun mapNonEmpty!39109 () Bool)

(declare-fun mapRes!39109 () Bool)

(declare-fun tp!74915 () Bool)

(declare-fun e!603108 () Bool)

(assert (=> mapNonEmpty!39109 (= mapRes!39109 (and tp!74915 e!603108))))

(declare-fun mapKey!39109 () (_ BitVec 32))

(declare-datatypes ((V!38419 0))(
  ( (V!38420 (val!12532 Int)) )
))
(declare-datatypes ((ValueCell!11778 0))(
  ( (ValueCellFull!11778 (v!15142 V!38419)) (EmptyCell!11778) )
))
(declare-fun mapValue!39109 () ValueCell!11778)

(declare-fun mapRest!39109 () (Array (_ BitVec 32) ValueCell!11778))

(declare-datatypes ((array!66953 0))(
  ( (array!66954 (arr!32186 (Array (_ BitVec 32) ValueCell!11778)) (size!32722 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66953)

(assert (=> mapNonEmpty!39109 (= (arr!32186 _values!955) (store mapRest!39109 mapKey!39109 mapValue!39109))))

(declare-fun mapIsEmpty!39109 () Bool)

(assert (=> mapIsEmpty!39109 mapRes!39109))

(declare-fun res!707798 () Bool)

(declare-fun e!603105 () Bool)

(assert (=> start!93658 (=> (not res!707798) (not e!603105))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93658 (= res!707798 (validMask!0 mask!1515))))

(assert (=> start!93658 e!603105))

(assert (=> start!93658 true))

(declare-fun e!603106 () Bool)

(declare-fun array_inv!24952 (array!66953) Bool)

(assert (=> start!93658 (and (array_inv!24952 _values!955) e!603106)))

(declare-datatypes ((array!66955 0))(
  ( (array!66956 (arr!32187 (Array (_ BitVec 32) (_ BitVec 64))) (size!32723 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66955)

(declare-fun array_inv!24953 (array!66955) Bool)

(assert (=> start!93658 (array_inv!24953 _keys!1163)))

(declare-fun b!1059592 () Bool)

(declare-fun res!707800 () Bool)

(assert (=> b!1059592 (=> (not res!707800) (not e!603105))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059592 (= res!707800 (and (= (size!32722 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32723 _keys!1163) (size!32722 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059593 () Bool)

(assert (=> b!1059593 (= e!603105 false)))

(declare-fun lt!467149 () Bool)

(declare-datatypes ((List!22435 0))(
  ( (Nil!22432) (Cons!22431 (h!23640 (_ BitVec 64)) (t!31742 List!22435)) )
))
(declare-fun arrayNoDuplicates!0 (array!66955 (_ BitVec 32) List!22435) Bool)

(assert (=> b!1059593 (= lt!467149 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22432))))

(declare-fun b!1059594 () Bool)

(assert (=> b!1059594 (= e!603106 (and e!603104 mapRes!39109))))

(declare-fun condMapEmpty!39109 () Bool)

(declare-fun mapDefault!39109 () ValueCell!11778)

(assert (=> b!1059594 (= condMapEmpty!39109 (= (arr!32186 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11778)) mapDefault!39109)))))

(declare-fun b!1059595 () Bool)

(assert (=> b!1059595 (= e!603108 tp_is_empty!24963)))

(declare-fun b!1059596 () Bool)

(declare-fun res!707799 () Bool)

(assert (=> b!1059596 (=> (not res!707799) (not e!603105))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66955 (_ BitVec 32)) Bool)

(assert (=> b!1059596 (= res!707799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!93658 res!707798) b!1059592))

(assert (= (and b!1059592 res!707800) b!1059596))

(assert (= (and b!1059596 res!707799) b!1059593))

(assert (= (and b!1059594 condMapEmpty!39109) mapIsEmpty!39109))

(assert (= (and b!1059594 (not condMapEmpty!39109)) mapNonEmpty!39109))

(get-info :version)

(assert (= (and mapNonEmpty!39109 ((_ is ValueCellFull!11778) mapValue!39109)) b!1059595))

(assert (= (and b!1059594 ((_ is ValueCellFull!11778) mapDefault!39109)) b!1059591))

(assert (= start!93658 b!1059594))

(declare-fun m!978967 () Bool)

(assert (=> mapNonEmpty!39109 m!978967))

(declare-fun m!978969 () Bool)

(assert (=> start!93658 m!978969))

(declare-fun m!978971 () Bool)

(assert (=> start!93658 m!978971))

(declare-fun m!978973 () Bool)

(assert (=> start!93658 m!978973))

(declare-fun m!978975 () Bool)

(assert (=> b!1059593 m!978975))

(declare-fun m!978977 () Bool)

(assert (=> b!1059596 m!978977))

(check-sat (not b!1059593) (not b!1059596) (not mapNonEmpty!39109) tp_is_empty!24963 (not start!93658))
(check-sat)
