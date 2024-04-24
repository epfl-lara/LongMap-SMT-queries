; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94180 () Bool)

(assert start!94180)

(declare-fun b_free!21403 () Bool)

(declare-fun b_next!21403 () Bool)

(assert (=> start!94180 (= b_free!21403 (not b_next!21403))))

(declare-fun tp!75634 () Bool)

(declare-fun b_and!34135 () Bool)

(assert (=> start!94180 (= tp!75634 b_and!34135)))

(declare-fun b!1063845 () Bool)

(declare-fun res!710001 () Bool)

(declare-fun e!606107 () Bool)

(assert (=> b!1063845 (=> (not res!710001) (not e!606107))))

(declare-datatypes ((array!67471 0))(
  ( (array!67472 (arr!32436 (Array (_ BitVec 32) (_ BitVec 64))) (size!32973 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67471)

(declare-datatypes ((List!22579 0))(
  ( (Nil!22576) (Cons!22575 (h!23793 (_ BitVec 64)) (t!31882 List!22579)) )
))
(declare-fun arrayNoDuplicates!0 (array!67471 (_ BitVec 32) List!22579) Bool)

(assert (=> b!1063845 (= res!710001 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22576))))

(declare-fun b!1063846 () Bool)

(declare-fun e!606103 () Bool)

(declare-fun tp_is_empty!25213 () Bool)

(assert (=> b!1063846 (= e!606103 tp_is_empty!25213)))

(declare-fun mapIsEmpty!39493 () Bool)

(declare-fun mapRes!39493 () Bool)

(assert (=> mapIsEmpty!39493 mapRes!39493))

(declare-fun b!1063847 () Bool)

(declare-fun e!606108 () Bool)

(assert (=> b!1063847 (= e!606108 tp_is_empty!25213)))

(declare-fun b!1063848 () Bool)

(declare-fun e!606109 () Bool)

(declare-fun e!606106 () Bool)

(assert (=> b!1063848 (= e!606109 e!606106)))

(declare-fun res!710003 () Bool)

(assert (=> b!1063848 (=> res!710003 e!606106)))

(declare-datatypes ((V!38753 0))(
  ( (V!38754 (val!12657 Int)) )
))
(declare-datatypes ((tuple2!15996 0))(
  ( (tuple2!15997 (_1!8009 (_ BitVec 64)) (_2!8009 V!38753)) )
))
(declare-datatypes ((List!22580 0))(
  ( (Nil!22577) (Cons!22576 (h!23794 tuple2!15996) (t!31883 List!22580)) )
))
(declare-datatypes ((ListLongMap!13973 0))(
  ( (ListLongMap!13974 (toList!7002 List!22580)) )
))
(declare-fun lt!468660 () ListLongMap!13973)

(declare-fun contains!6257 (ListLongMap!13973 (_ BitVec 64)) Bool)

(assert (=> b!1063848 (= res!710003 (contains!6257 lt!468660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38753)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38753)

(declare-datatypes ((ValueCell!11903 0))(
  ( (ValueCellFull!11903 (v!15263 V!38753)) (EmptyCell!11903) )
))
(declare-datatypes ((array!67473 0))(
  ( (array!67474 (arr!32437 (Array (_ BitVec 32) ValueCell!11903)) (size!32974 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67473)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!3983 (array!67471 array!67473 (_ BitVec 32) (_ BitVec 32) V!38753 V!38753 (_ BitVec 32) Int) ListLongMap!13973)

(assert (=> b!1063848 (= lt!468660 (getCurrentListMap!3983 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39493 () Bool)

(declare-fun tp!75635 () Bool)

(assert (=> mapNonEmpty!39493 (= mapRes!39493 (and tp!75635 e!606103))))

(declare-fun mapRest!39493 () (Array (_ BitVec 32) ValueCell!11903))

(declare-fun mapKey!39493 () (_ BitVec 32))

(declare-fun mapValue!39493 () ValueCell!11903)

(assert (=> mapNonEmpty!39493 (= (arr!32437 _values!955) (store mapRest!39493 mapKey!39493 mapValue!39493))))

(declare-fun b!1063844 () Bool)

(assert (=> b!1063844 (= e!606106 true)))

(declare-fun -!565 (ListLongMap!13973 (_ BitVec 64)) ListLongMap!13973)

(assert (=> b!1063844 (= (-!565 lt!468660 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468660)))

(declare-datatypes ((Unit!34807 0))(
  ( (Unit!34808) )
))
(declare-fun lt!468658 () Unit!34807)

(declare-fun removeNotPresentStillSame!16 (ListLongMap!13973 (_ BitVec 64)) Unit!34807)

(assert (=> b!1063844 (= lt!468658 (removeNotPresentStillSame!16 lt!468660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!710006 () Bool)

(assert (=> start!94180 (=> (not res!710006) (not e!606107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94180 (= res!710006 (validMask!0 mask!1515))))

(assert (=> start!94180 e!606107))

(assert (=> start!94180 true))

(assert (=> start!94180 tp_is_empty!25213))

(declare-fun e!606105 () Bool)

(declare-fun array_inv!25146 (array!67473) Bool)

(assert (=> start!94180 (and (array_inv!25146 _values!955) e!606105)))

(assert (=> start!94180 tp!75634))

(declare-fun array_inv!25147 (array!67471) Bool)

(assert (=> start!94180 (array_inv!25147 _keys!1163)))

(declare-fun b!1063849 () Bool)

(declare-fun res!710002 () Bool)

(assert (=> b!1063849 (=> (not res!710002) (not e!606107))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1063849 (= res!710002 (and (= (size!32974 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32973 _keys!1163) (size!32974 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063850 () Bool)

(assert (=> b!1063850 (= e!606107 (not e!606109))))

(declare-fun res!710005 () Bool)

(assert (=> b!1063850 (=> res!710005 e!606109)))

(assert (=> b!1063850 (= res!710005 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468659 () ListLongMap!13973)

(declare-fun lt!468657 () ListLongMap!13973)

(assert (=> b!1063850 (= lt!468659 lt!468657)))

(declare-fun lt!468661 () Unit!34807)

(declare-fun zeroValueAfter!47 () V!38753)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!648 (array!67471 array!67473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38753 V!38753 V!38753 V!38753 (_ BitVec 32) Int) Unit!34807)

(assert (=> b!1063850 (= lt!468661 (lemmaNoChangeToArrayThenSameMapNoExtras!648 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3645 (array!67471 array!67473 (_ BitVec 32) (_ BitVec 32) V!38753 V!38753 (_ BitVec 32) Int) ListLongMap!13973)

(assert (=> b!1063850 (= lt!468657 (getCurrentListMapNoExtraKeys!3645 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063850 (= lt!468659 (getCurrentListMapNoExtraKeys!3645 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063851 () Bool)

(assert (=> b!1063851 (= e!606105 (and e!606108 mapRes!39493))))

(declare-fun condMapEmpty!39493 () Bool)

(declare-fun mapDefault!39493 () ValueCell!11903)

(assert (=> b!1063851 (= condMapEmpty!39493 (= (arr!32437 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11903)) mapDefault!39493)))))

(declare-fun b!1063852 () Bool)

(declare-fun res!710004 () Bool)

(assert (=> b!1063852 (=> (not res!710004) (not e!606107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67471 (_ BitVec 32)) Bool)

(assert (=> b!1063852 (= res!710004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!94180 res!710006) b!1063849))

(assert (= (and b!1063849 res!710002) b!1063852))

(assert (= (and b!1063852 res!710004) b!1063845))

(assert (= (and b!1063845 res!710001) b!1063850))

(assert (= (and b!1063850 (not res!710005)) b!1063848))

(assert (= (and b!1063848 (not res!710003)) b!1063844))

(assert (= (and b!1063851 condMapEmpty!39493) mapIsEmpty!39493))

(assert (= (and b!1063851 (not condMapEmpty!39493)) mapNonEmpty!39493))

(get-info :version)

(assert (= (and mapNonEmpty!39493 ((_ is ValueCellFull!11903) mapValue!39493)) b!1063846))

(assert (= (and b!1063851 ((_ is ValueCellFull!11903) mapDefault!39493)) b!1063847))

(assert (= start!94180 b!1063851))

(declare-fun m!982939 () Bool)

(assert (=> b!1063844 m!982939))

(declare-fun m!982941 () Bool)

(assert (=> b!1063844 m!982941))

(declare-fun m!982943 () Bool)

(assert (=> b!1063850 m!982943))

(declare-fun m!982945 () Bool)

(assert (=> b!1063850 m!982945))

(declare-fun m!982947 () Bool)

(assert (=> b!1063850 m!982947))

(declare-fun m!982949 () Bool)

(assert (=> b!1063845 m!982949))

(declare-fun m!982951 () Bool)

(assert (=> start!94180 m!982951))

(declare-fun m!982953 () Bool)

(assert (=> start!94180 m!982953))

(declare-fun m!982955 () Bool)

(assert (=> start!94180 m!982955))

(declare-fun m!982957 () Bool)

(assert (=> mapNonEmpty!39493 m!982957))

(declare-fun m!982959 () Bool)

(assert (=> b!1063852 m!982959))

(declare-fun m!982961 () Bool)

(assert (=> b!1063848 m!982961))

(declare-fun m!982963 () Bool)

(assert (=> b!1063848 m!982963))

(check-sat (not start!94180) (not b!1063852) tp_is_empty!25213 (not mapNonEmpty!39493) (not b_next!21403) (not b!1063845) (not b!1063848) (not b!1063844) (not b!1063850) b_and!34135)
(check-sat b_and!34135 (not b_next!21403))
