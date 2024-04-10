; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93788 () Bool)

(assert start!93788)

(declare-fun b_free!21261 () Bool)

(declare-fun b_next!21261 () Bool)

(assert (=> start!93788 (= b_free!21261 (not b_next!21261))))

(declare-fun tp!75205 () Bool)

(declare-fun b_and!33975 () Bool)

(assert (=> start!93788 (= tp!75205 b_and!33975)))

(declare-fun b!1060802 () Bool)

(declare-fun res!708457 () Bool)

(declare-fun e!603992 () Bool)

(assert (=> b!1060802 (=> (not res!708457) (not e!603992))))

(declare-datatypes ((array!67153 0))(
  ( (array!67154 (arr!32284 (Array (_ BitVec 32) (_ BitVec 64))) (size!32820 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67153)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67153 (_ BitVec 32)) Bool)

(assert (=> b!1060802 (= res!708457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1060803 () Bool)

(declare-fun e!603990 () Bool)

(declare-fun e!603991 () Bool)

(declare-fun mapRes!39277 () Bool)

(assert (=> b!1060803 (= e!603990 (and e!603991 mapRes!39277))))

(declare-fun condMapEmpty!39277 () Bool)

(declare-datatypes ((V!38563 0))(
  ( (V!38564 (val!12586 Int)) )
))
(declare-datatypes ((ValueCell!11832 0))(
  ( (ValueCellFull!11832 (v!15196 V!38563)) (EmptyCell!11832) )
))
(declare-datatypes ((array!67155 0))(
  ( (array!67156 (arr!32285 (Array (_ BitVec 32) ValueCell!11832)) (size!32821 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67155)

(declare-fun mapDefault!39277 () ValueCell!11832)

(assert (=> b!1060803 (= condMapEmpty!39277 (= (arr!32285 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11832)) mapDefault!39277)))))

(declare-fun b!1060804 () Bool)

(assert (=> b!1060804 (= e!603992 false)))

(declare-datatypes ((tuple2!15904 0))(
  ( (tuple2!15905 (_1!7963 (_ BitVec 64)) (_2!7963 V!38563)) )
))
(declare-datatypes ((List!22490 0))(
  ( (Nil!22487) (Cons!22486 (h!23695 tuple2!15904) (t!31799 List!22490)) )
))
(declare-datatypes ((ListLongMap!13873 0))(
  ( (ListLongMap!13874 (toList!6952 List!22490)) )
))
(declare-fun lt!467383 () ListLongMap!13873)

(declare-fun minValue!907 () V!38563)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38563)

(declare-fun getCurrentListMapNoExtraKeys!3554 (array!67153 array!67155 (_ BitVec 32) (_ BitVec 32) V!38563 V!38563 (_ BitVec 32) Int) ListLongMap!13873)

(assert (=> b!1060804 (= lt!467383 (getCurrentListMapNoExtraKeys!3554 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun lt!467382 () ListLongMap!13873)

(declare-fun zeroValueBefore!47 () V!38563)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1060804 (= lt!467382 (getCurrentListMapNoExtraKeys!3554 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1060805 () Bool)

(declare-fun res!708458 () Bool)

(assert (=> b!1060805 (=> (not res!708458) (not e!603992))))

(assert (=> b!1060805 (= res!708458 (and (= (size!32821 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32820 _keys!1163) (size!32821 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1060806 () Bool)

(declare-fun e!603989 () Bool)

(declare-fun tp_is_empty!25071 () Bool)

(assert (=> b!1060806 (= e!603989 tp_is_empty!25071)))

(declare-fun res!708460 () Bool)

(assert (=> start!93788 (=> (not res!708460) (not e!603992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93788 (= res!708460 (validMask!0 mask!1515))))

(assert (=> start!93788 e!603992))

(assert (=> start!93788 true))

(assert (=> start!93788 tp_is_empty!25071))

(declare-fun array_inv!25016 (array!67155) Bool)

(assert (=> start!93788 (and (array_inv!25016 _values!955) e!603990)))

(assert (=> start!93788 tp!75205))

(declare-fun array_inv!25017 (array!67153) Bool)

(assert (=> start!93788 (array_inv!25017 _keys!1163)))

(declare-fun mapIsEmpty!39277 () Bool)

(assert (=> mapIsEmpty!39277 mapRes!39277))

(declare-fun mapNonEmpty!39277 () Bool)

(declare-fun tp!75206 () Bool)

(assert (=> mapNonEmpty!39277 (= mapRes!39277 (and tp!75206 e!603989))))

(declare-fun mapRest!39277 () (Array (_ BitVec 32) ValueCell!11832))

(declare-fun mapKey!39277 () (_ BitVec 32))

(declare-fun mapValue!39277 () ValueCell!11832)

(assert (=> mapNonEmpty!39277 (= (arr!32285 _values!955) (store mapRest!39277 mapKey!39277 mapValue!39277))))

(declare-fun b!1060807 () Bool)

(declare-fun res!708459 () Bool)

(assert (=> b!1060807 (=> (not res!708459) (not e!603992))))

(declare-datatypes ((List!22491 0))(
  ( (Nil!22488) (Cons!22487 (h!23696 (_ BitVec 64)) (t!31800 List!22491)) )
))
(declare-fun arrayNoDuplicates!0 (array!67153 (_ BitVec 32) List!22491) Bool)

(assert (=> b!1060807 (= res!708459 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22488))))

(declare-fun b!1060808 () Bool)

(assert (=> b!1060808 (= e!603991 tp_is_empty!25071)))

(assert (= (and start!93788 res!708460) b!1060805))

(assert (= (and b!1060805 res!708458) b!1060802))

(assert (= (and b!1060802 res!708457) b!1060807))

(assert (= (and b!1060807 res!708459) b!1060804))

(assert (= (and b!1060803 condMapEmpty!39277) mapIsEmpty!39277))

(assert (= (and b!1060803 (not condMapEmpty!39277)) mapNonEmpty!39277))

(get-info :version)

(assert (= (and mapNonEmpty!39277 ((_ is ValueCellFull!11832) mapValue!39277)) b!1060806))

(assert (= (and b!1060803 ((_ is ValueCellFull!11832) mapDefault!39277)) b!1060808))

(assert (= start!93788 b!1060803))

(declare-fun m!979783 () Bool)

(assert (=> b!1060802 m!979783))

(declare-fun m!979785 () Bool)

(assert (=> b!1060804 m!979785))

(declare-fun m!979787 () Bool)

(assert (=> b!1060804 m!979787))

(declare-fun m!979789 () Bool)

(assert (=> mapNonEmpty!39277 m!979789))

(declare-fun m!979791 () Bool)

(assert (=> start!93788 m!979791))

(declare-fun m!979793 () Bool)

(assert (=> start!93788 m!979793))

(declare-fun m!979795 () Bool)

(assert (=> start!93788 m!979795))

(declare-fun m!979797 () Bool)

(assert (=> b!1060807 m!979797))

(check-sat (not start!93788) tp_is_empty!25071 (not b!1060804) (not b!1060802) (not mapNonEmpty!39277) (not b_next!21261) (not b!1060807) b_and!33975)
(check-sat b_and!33975 (not b_next!21261))
