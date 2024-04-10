; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93782 () Bool)

(assert start!93782)

(declare-fun b_free!21255 () Bool)

(declare-fun b_next!21255 () Bool)

(assert (=> start!93782 (= b_free!21255 (not b_next!21255))))

(declare-fun tp!75188 () Bool)

(declare-fun b_and!33969 () Bool)

(assert (=> start!93782 (= tp!75188 b_and!33969)))

(declare-fun res!708424 () Bool)

(declare-fun e!603944 () Bool)

(assert (=> start!93782 (=> (not res!708424) (not e!603944))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93782 (= res!708424 (validMask!0 mask!1515))))

(assert (=> start!93782 e!603944))

(assert (=> start!93782 true))

(declare-fun tp_is_empty!25065 () Bool)

(assert (=> start!93782 tp_is_empty!25065))

(declare-datatypes ((V!38555 0))(
  ( (V!38556 (val!12583 Int)) )
))
(declare-datatypes ((ValueCell!11829 0))(
  ( (ValueCellFull!11829 (v!15193 V!38555)) (EmptyCell!11829) )
))
(declare-datatypes ((array!67143 0))(
  ( (array!67144 (arr!32279 (Array (_ BitVec 32) ValueCell!11829)) (size!32815 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67143)

(declare-fun e!603946 () Bool)

(declare-fun array_inv!25012 (array!67143) Bool)

(assert (=> start!93782 (and (array_inv!25012 _values!955) e!603946)))

(assert (=> start!93782 tp!75188))

(declare-datatypes ((array!67145 0))(
  ( (array!67146 (arr!32280 (Array (_ BitVec 32) (_ BitVec 64))) (size!32816 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67145)

(declare-fun array_inv!25013 (array!67145) Bool)

(assert (=> start!93782 (array_inv!25013 _keys!1163)))

(declare-fun mapNonEmpty!39268 () Bool)

(declare-fun mapRes!39268 () Bool)

(declare-fun tp!75187 () Bool)

(declare-fun e!603948 () Bool)

(assert (=> mapNonEmpty!39268 (= mapRes!39268 (and tp!75187 e!603948))))

(declare-fun mapRest!39268 () (Array (_ BitVec 32) ValueCell!11829))

(declare-fun mapKey!39268 () (_ BitVec 32))

(declare-fun mapValue!39268 () ValueCell!11829)

(assert (=> mapNonEmpty!39268 (= (arr!32279 _values!955) (store mapRest!39268 mapKey!39268 mapValue!39268))))

(declare-fun b!1060739 () Bool)

(declare-fun e!603947 () Bool)

(assert (=> b!1060739 (= e!603947 tp_is_empty!25065)))

(declare-fun b!1060740 () Bool)

(assert (=> b!1060740 (= e!603948 tp_is_empty!25065)))

(declare-fun b!1060741 () Bool)

(assert (=> b!1060741 (= e!603946 (and e!603947 mapRes!39268))))

(declare-fun condMapEmpty!39268 () Bool)

(declare-fun mapDefault!39268 () ValueCell!11829)

(assert (=> b!1060741 (= condMapEmpty!39268 (= (arr!32279 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11829)) mapDefault!39268)))))

(declare-fun mapIsEmpty!39268 () Bool)

(assert (=> mapIsEmpty!39268 mapRes!39268))

(declare-fun b!1060742 () Bool)

(declare-fun res!708423 () Bool)

(assert (=> b!1060742 (=> (not res!708423) (not e!603944))))

(declare-datatypes ((List!22486 0))(
  ( (Nil!22483) (Cons!22482 (h!23691 (_ BitVec 64)) (t!31795 List!22486)) )
))
(declare-fun arrayNoDuplicates!0 (array!67145 (_ BitVec 32) List!22486) Bool)

(assert (=> b!1060742 (= res!708423 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22483))))

(declare-fun b!1060743 () Bool)

(assert (=> b!1060743 (= e!603944 false)))

(declare-datatypes ((tuple2!15900 0))(
  ( (tuple2!15901 (_1!7961 (_ BitVec 64)) (_2!7961 V!38555)) )
))
(declare-datatypes ((List!22487 0))(
  ( (Nil!22484) (Cons!22483 (h!23692 tuple2!15900) (t!31796 List!22487)) )
))
(declare-datatypes ((ListLongMap!13869 0))(
  ( (ListLongMap!13870 (toList!6950 List!22487)) )
))
(declare-fun lt!467364 () ListLongMap!13869)

(declare-fun minValue!907 () V!38555)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38555)

(declare-fun getCurrentListMapNoExtraKeys!3552 (array!67145 array!67143 (_ BitVec 32) (_ BitVec 32) V!38555 V!38555 (_ BitVec 32) Int) ListLongMap!13869)

(assert (=> b!1060743 (= lt!467364 (getCurrentListMapNoExtraKeys!3552 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38555)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun lt!467365 () ListLongMap!13869)

(assert (=> b!1060743 (= lt!467365 (getCurrentListMapNoExtraKeys!3552 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060744 () Bool)

(declare-fun res!708421 () Bool)

(assert (=> b!1060744 (=> (not res!708421) (not e!603944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67145 (_ BitVec 32)) Bool)

(assert (=> b!1060744 (= res!708421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060745 () Bool)

(declare-fun res!708422 () Bool)

(assert (=> b!1060745 (=> (not res!708422) (not e!603944))))

(assert (=> b!1060745 (= res!708422 (and (= (size!32815 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32816 _keys!1163) (size!32815 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93782 res!708424) b!1060745))

(assert (= (and b!1060745 res!708422) b!1060744))

(assert (= (and b!1060744 res!708421) b!1060742))

(assert (= (and b!1060742 res!708423) b!1060743))

(assert (= (and b!1060741 condMapEmpty!39268) mapIsEmpty!39268))

(assert (= (and b!1060741 (not condMapEmpty!39268)) mapNonEmpty!39268))

(get-info :version)

(assert (= (and mapNonEmpty!39268 ((_ is ValueCellFull!11829) mapValue!39268)) b!1060740))

(assert (= (and b!1060741 ((_ is ValueCellFull!11829) mapDefault!39268)) b!1060739))

(assert (= start!93782 b!1060741))

(declare-fun m!979735 () Bool)

(assert (=> mapNonEmpty!39268 m!979735))

(declare-fun m!979737 () Bool)

(assert (=> b!1060743 m!979737))

(declare-fun m!979739 () Bool)

(assert (=> b!1060743 m!979739))

(declare-fun m!979741 () Bool)

(assert (=> b!1060742 m!979741))

(declare-fun m!979743 () Bool)

(assert (=> b!1060744 m!979743))

(declare-fun m!979745 () Bool)

(assert (=> start!93782 m!979745))

(declare-fun m!979747 () Bool)

(assert (=> start!93782 m!979747))

(declare-fun m!979749 () Bool)

(assert (=> start!93782 m!979749))

(check-sat (not b!1060744) tp_is_empty!25065 (not b_next!21255) (not b!1060743) b_and!33969 (not b!1060742) (not mapNonEmpty!39268) (not start!93782))
(check-sat b_and!33969 (not b_next!21255))
