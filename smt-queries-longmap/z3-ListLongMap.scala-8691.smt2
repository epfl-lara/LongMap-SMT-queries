; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105790 () Bool)

(assert start!105790)

(declare-fun b_free!27181 () Bool)

(declare-fun b_next!27181 () Bool)

(assert (=> start!105790 (= b_free!27181 (not b_next!27181))))

(declare-fun tp!95063 () Bool)

(declare-fun b_and!45049 () Bool)

(assert (=> start!105790 (= tp!95063 b_and!45049)))

(declare-fun res!838815 () Bool)

(declare-fun e!715987 () Bool)

(assert (=> start!105790 (=> (not res!838815) (not e!715987))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105790 (= res!838815 (validMask!0 mask!1466))))

(assert (=> start!105790 e!715987))

(assert (=> start!105790 true))

(assert (=> start!105790 tp!95063))

(declare-fun tp_is_empty!32083 () Bool)

(assert (=> start!105790 tp_is_empty!32083))

(declare-datatypes ((array!81845 0))(
  ( (array!81846 (arr!39475 (Array (_ BitVec 32) (_ BitVec 64))) (size!40012 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81845)

(declare-fun array_inv!30205 (array!81845) Bool)

(assert (=> start!105790 (array_inv!30205 _keys!1118)))

(declare-datatypes ((V!48143 0))(
  ( (V!48144 (val!16104 Int)) )
))
(declare-datatypes ((ValueCell!15278 0))(
  ( (ValueCellFull!15278 (v!18802 V!48143)) (EmptyCell!15278) )
))
(declare-datatypes ((array!81847 0))(
  ( (array!81848 (arr!39476 (Array (_ BitVec 32) ValueCell!15278)) (size!40013 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81847)

(declare-fun e!715988 () Bool)

(declare-fun array_inv!30206 (array!81847) Bool)

(assert (=> start!105790 (and (array_inv!30206 _values!914) e!715988)))

(declare-fun mapNonEmpty!49915 () Bool)

(declare-fun mapRes!49915 () Bool)

(declare-fun tp!95062 () Bool)

(declare-fun e!715986 () Bool)

(assert (=> mapNonEmpty!49915 (= mapRes!49915 (and tp!95062 e!715986))))

(declare-fun mapValue!49915 () ValueCell!15278)

(declare-fun mapRest!49915 () (Array (_ BitVec 32) ValueCell!15278))

(declare-fun mapKey!49915 () (_ BitVec 32))

(assert (=> mapNonEmpty!49915 (= (arr!39476 _values!914) (store mapRest!49915 mapKey!49915 mapValue!49915))))

(declare-fun b!1258921 () Bool)

(declare-fun e!715985 () Bool)

(assert (=> b!1258921 (= e!715988 (and e!715985 mapRes!49915))))

(declare-fun condMapEmpty!49915 () Bool)

(declare-fun mapDefault!49915 () ValueCell!15278)

(assert (=> b!1258921 (= condMapEmpty!49915 (= (arr!39476 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15278)) mapDefault!49915)))))

(declare-fun b!1258922 () Bool)

(assert (=> b!1258922 (= e!715987 (not true))))

(declare-datatypes ((tuple2!20832 0))(
  ( (tuple2!20833 (_1!10427 (_ BitVec 64)) (_2!10427 V!48143)) )
))
(declare-datatypes ((List!28059 0))(
  ( (Nil!28056) (Cons!28055 (h!29273 tuple2!20832) (t!41542 List!28059)) )
))
(declare-datatypes ((ListLongMap!18713 0))(
  ( (ListLongMap!18714 (toList!9372 List!28059)) )
))
(declare-fun lt!569305 () ListLongMap!18713)

(declare-fun lt!569303 () ListLongMap!18713)

(assert (=> b!1258922 (= lt!569305 lt!569303)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48143)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48143)

(declare-fun minValueBefore!43 () V!48143)

(declare-datatypes ((Unit!41887 0))(
  ( (Unit!41888) )
))
(declare-fun lt!569304 () Unit!41887)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1102 (array!81845 array!81847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48143 V!48143 V!48143 V!48143 (_ BitVec 32) Int) Unit!41887)

(assert (=> b!1258922 (= lt!569304 (lemmaNoChangeToArrayThenSameMapNoExtras!1102 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5788 (array!81845 array!81847 (_ BitVec 32) (_ BitVec 32) V!48143 V!48143 (_ BitVec 32) Int) ListLongMap!18713)

(assert (=> b!1258922 (= lt!569303 (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258922 (= lt!569305 (getCurrentListMapNoExtraKeys!5788 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258923 () Bool)

(declare-fun res!838816 () Bool)

(assert (=> b!1258923 (=> (not res!838816) (not e!715987))))

(assert (=> b!1258923 (= res!838816 (and (= (size!40013 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40012 _keys!1118) (size!40013 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49915 () Bool)

(assert (=> mapIsEmpty!49915 mapRes!49915))

(declare-fun b!1258924 () Bool)

(declare-fun res!838814 () Bool)

(assert (=> b!1258924 (=> (not res!838814) (not e!715987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81845 (_ BitVec 32)) Bool)

(assert (=> b!1258924 (= res!838814 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258925 () Bool)

(assert (=> b!1258925 (= e!715985 tp_is_empty!32083)))

(declare-fun b!1258926 () Bool)

(assert (=> b!1258926 (= e!715986 tp_is_empty!32083)))

(declare-fun b!1258927 () Bool)

(declare-fun res!838817 () Bool)

(assert (=> b!1258927 (=> (not res!838817) (not e!715987))))

(declare-datatypes ((List!28060 0))(
  ( (Nil!28057) (Cons!28056 (h!29274 (_ BitVec 64)) (t!41543 List!28060)) )
))
(declare-fun arrayNoDuplicates!0 (array!81845 (_ BitVec 32) List!28060) Bool)

(assert (=> b!1258927 (= res!838817 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28057))))

(assert (= (and start!105790 res!838815) b!1258923))

(assert (= (and b!1258923 res!838816) b!1258924))

(assert (= (and b!1258924 res!838814) b!1258927))

(assert (= (and b!1258927 res!838817) b!1258922))

(assert (= (and b!1258921 condMapEmpty!49915) mapIsEmpty!49915))

(assert (= (and b!1258921 (not condMapEmpty!49915)) mapNonEmpty!49915))

(get-info :version)

(assert (= (and mapNonEmpty!49915 ((_ is ValueCellFull!15278) mapValue!49915)) b!1258926))

(assert (= (and b!1258921 ((_ is ValueCellFull!15278) mapDefault!49915)) b!1258925))

(assert (= start!105790 b!1258921))

(declare-fun m!1159791 () Bool)

(assert (=> b!1258924 m!1159791))

(declare-fun m!1159793 () Bool)

(assert (=> b!1258927 m!1159793))

(declare-fun m!1159795 () Bool)

(assert (=> start!105790 m!1159795))

(declare-fun m!1159797 () Bool)

(assert (=> start!105790 m!1159797))

(declare-fun m!1159799 () Bool)

(assert (=> start!105790 m!1159799))

(declare-fun m!1159801 () Bool)

(assert (=> b!1258922 m!1159801))

(declare-fun m!1159803 () Bool)

(assert (=> b!1258922 m!1159803))

(declare-fun m!1159805 () Bool)

(assert (=> b!1258922 m!1159805))

(declare-fun m!1159807 () Bool)

(assert (=> mapNonEmpty!49915 m!1159807))

(check-sat (not mapNonEmpty!49915) b_and!45049 (not b!1258922) (not start!105790) (not b_next!27181) (not b!1258927) (not b!1258924) tp_is_empty!32083)
(check-sat b_and!45049 (not b_next!27181))
