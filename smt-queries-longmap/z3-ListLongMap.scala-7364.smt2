; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93904 () Bool)

(assert start!93904)

(declare-fun b_free!21363 () Bool)

(declare-fun b_next!21363 () Bool)

(assert (=> start!93904 (= b_free!21363 (not b_next!21363))))

(declare-fun tp!75515 () Bool)

(declare-fun b_and!34085 () Bool)

(assert (=> start!93904 (= tp!75515 b_and!34085)))

(declare-fun mapIsEmpty!39433 () Bool)

(declare-fun mapRes!39433 () Bool)

(assert (=> mapIsEmpty!39433 mapRes!39433))

(declare-fun b!1061977 () Bool)

(declare-fun e!604833 () Bool)

(assert (=> b!1061977 (= e!604833 true)))

(declare-datatypes ((V!38699 0))(
  ( (V!38700 (val!12637 Int)) )
))
(declare-datatypes ((tuple2!15978 0))(
  ( (tuple2!15979 (_1!8000 (_ BitVec 64)) (_2!8000 V!38699)) )
))
(declare-datatypes ((List!22561 0))(
  ( (Nil!22558) (Cons!22557 (h!23766 tuple2!15978) (t!31872 List!22561)) )
))
(declare-datatypes ((ListLongMap!13947 0))(
  ( (ListLongMap!13948 (toList!6989 List!22561)) )
))
(declare-fun lt!467844 () ListLongMap!13947)

(declare-fun -!555 (ListLongMap!13947 (_ BitVec 64)) ListLongMap!13947)

(assert (=> b!1061977 (= (-!555 lt!467844 #b0000000000000000000000000000000000000000000000000000000000000000) lt!467844)))

(declare-datatypes ((Unit!34780 0))(
  ( (Unit!34781) )
))
(declare-fun lt!467842 () Unit!34780)

(declare-fun removeNotPresentStillSame!2 (ListLongMap!13947 (_ BitVec 64)) Unit!34780)

(assert (=> b!1061977 (= lt!467842 (removeNotPresentStillSame!2 lt!467844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!709121 () Bool)

(declare-fun e!604828 () Bool)

(assert (=> start!93904 (=> (not res!709121) (not e!604828))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93904 (= res!709121 (validMask!0 mask!1515))))

(assert (=> start!93904 e!604828))

(assert (=> start!93904 true))

(declare-fun tp_is_empty!25173 () Bool)

(assert (=> start!93904 tp_is_empty!25173))

(declare-datatypes ((ValueCell!11883 0))(
  ( (ValueCellFull!11883 (v!15247 V!38699)) (EmptyCell!11883) )
))
(declare-datatypes ((array!67351 0))(
  ( (array!67352 (arr!32382 (Array (_ BitVec 32) ValueCell!11883)) (size!32918 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67351)

(declare-fun e!604834 () Bool)

(declare-fun array_inv!25090 (array!67351) Bool)

(assert (=> start!93904 (and (array_inv!25090 _values!955) e!604834)))

(assert (=> start!93904 tp!75515))

(declare-datatypes ((array!67353 0))(
  ( (array!67354 (arr!32383 (Array (_ BitVec 32) (_ BitVec 64))) (size!32919 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67353)

(declare-fun array_inv!25091 (array!67353) Bool)

(assert (=> start!93904 (array_inv!25091 _keys!1163)))

(declare-fun b!1061978 () Bool)

(declare-fun res!709123 () Bool)

(assert (=> b!1061978 (=> (not res!709123) (not e!604828))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061978 (= res!709123 (and (= (size!32918 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32919 _keys!1163) (size!32918 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1061979 () Bool)

(declare-fun e!604831 () Bool)

(assert (=> b!1061979 (= e!604828 (not e!604831))))

(declare-fun res!709120 () Bool)

(assert (=> b!1061979 (=> res!709120 e!604831)))

(assert (=> b!1061979 (= res!709120 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!467845 () ListLongMap!13947)

(declare-fun lt!467846 () ListLongMap!13947)

(assert (=> b!1061979 (= lt!467845 lt!467846)))

(declare-fun zeroValueBefore!47 () V!38699)

(declare-fun lt!467843 () Unit!34780)

(declare-fun minValue!907 () V!38699)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38699)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!627 (array!67353 array!67351 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38699 V!38699 V!38699 V!38699 (_ BitVec 32) Int) Unit!34780)

(assert (=> b!1061979 (= lt!467843 (lemmaNoChangeToArrayThenSameMapNoExtras!627 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3590 (array!67353 array!67351 (_ BitVec 32) (_ BitVec 32) V!38699 V!38699 (_ BitVec 32) Int) ListLongMap!13947)

(assert (=> b!1061979 (= lt!467846 (getCurrentListMapNoExtraKeys!3590 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061979 (= lt!467845 (getCurrentListMapNoExtraKeys!3590 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061980 () Bool)

(assert (=> b!1061980 (= e!604831 e!604833)))

(declare-fun res!709122 () Bool)

(assert (=> b!1061980 (=> res!709122 e!604833)))

(declare-fun contains!6223 (ListLongMap!13947 (_ BitVec 64)) Bool)

(assert (=> b!1061980 (= res!709122 (contains!6223 lt!467844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3976 (array!67353 array!67351 (_ BitVec 32) (_ BitVec 32) V!38699 V!38699 (_ BitVec 32) Int) ListLongMap!13947)

(assert (=> b!1061980 (= lt!467844 (getCurrentListMap!3976 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061981 () Bool)

(declare-fun e!604829 () Bool)

(assert (=> b!1061981 (= e!604829 tp_is_empty!25173)))

(declare-fun b!1061982 () Bool)

(declare-fun res!709119 () Bool)

(assert (=> b!1061982 (=> (not res!709119) (not e!604828))))

(declare-datatypes ((List!22562 0))(
  ( (Nil!22559) (Cons!22558 (h!23767 (_ BitVec 64)) (t!31873 List!22562)) )
))
(declare-fun arrayNoDuplicates!0 (array!67353 (_ BitVec 32) List!22562) Bool)

(assert (=> b!1061982 (= res!709119 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22559))))

(declare-fun mapNonEmpty!39433 () Bool)

(declare-fun tp!75514 () Bool)

(declare-fun e!604830 () Bool)

(assert (=> mapNonEmpty!39433 (= mapRes!39433 (and tp!75514 e!604830))))

(declare-fun mapValue!39433 () ValueCell!11883)

(declare-fun mapRest!39433 () (Array (_ BitVec 32) ValueCell!11883))

(declare-fun mapKey!39433 () (_ BitVec 32))

(assert (=> mapNonEmpty!39433 (= (arr!32382 _values!955) (store mapRest!39433 mapKey!39433 mapValue!39433))))

(declare-fun b!1061983 () Bool)

(declare-fun res!709124 () Bool)

(assert (=> b!1061983 (=> (not res!709124) (not e!604828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67353 (_ BitVec 32)) Bool)

(assert (=> b!1061983 (= res!709124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061984 () Bool)

(assert (=> b!1061984 (= e!604830 tp_is_empty!25173)))

(declare-fun b!1061985 () Bool)

(assert (=> b!1061985 (= e!604834 (and e!604829 mapRes!39433))))

(declare-fun condMapEmpty!39433 () Bool)

(declare-fun mapDefault!39433 () ValueCell!11883)

(assert (=> b!1061985 (= condMapEmpty!39433 (= (arr!32382 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11883)) mapDefault!39433)))))

(assert (= (and start!93904 res!709121) b!1061978))

(assert (= (and b!1061978 res!709123) b!1061983))

(assert (= (and b!1061983 res!709124) b!1061982))

(assert (= (and b!1061982 res!709119) b!1061979))

(assert (= (and b!1061979 (not res!709120)) b!1061980))

(assert (= (and b!1061980 (not res!709122)) b!1061977))

(assert (= (and b!1061985 condMapEmpty!39433) mapIsEmpty!39433))

(assert (= (and b!1061985 (not condMapEmpty!39433)) mapNonEmpty!39433))

(get-info :version)

(assert (= (and mapNonEmpty!39433 ((_ is ValueCellFull!11883) mapValue!39433)) b!1061984))

(assert (= (and b!1061985 ((_ is ValueCellFull!11883) mapDefault!39433)) b!1061981))

(assert (= start!93904 b!1061985))

(declare-fun m!980747 () Bool)

(assert (=> start!93904 m!980747))

(declare-fun m!980749 () Bool)

(assert (=> start!93904 m!980749))

(declare-fun m!980751 () Bool)

(assert (=> start!93904 m!980751))

(declare-fun m!980753 () Bool)

(assert (=> b!1061983 m!980753))

(declare-fun m!980755 () Bool)

(assert (=> mapNonEmpty!39433 m!980755))

(declare-fun m!980757 () Bool)

(assert (=> b!1061982 m!980757))

(declare-fun m!980759 () Bool)

(assert (=> b!1061977 m!980759))

(declare-fun m!980761 () Bool)

(assert (=> b!1061977 m!980761))

(declare-fun m!980763 () Bool)

(assert (=> b!1061980 m!980763))

(declare-fun m!980765 () Bool)

(assert (=> b!1061980 m!980765))

(declare-fun m!980767 () Bool)

(assert (=> b!1061979 m!980767))

(declare-fun m!980769 () Bool)

(assert (=> b!1061979 m!980769))

(declare-fun m!980771 () Bool)

(assert (=> b!1061979 m!980771))

(check-sat (not mapNonEmpty!39433) (not b_next!21363) (not b!1061980) (not start!93904) (not b!1061977) (not b!1061983) (not b!1061979) (not b!1061982) tp_is_empty!25173 b_and!34085)
(check-sat b_and!34085 (not b_next!21363))
