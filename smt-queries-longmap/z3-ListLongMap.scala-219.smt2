; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3998 () Bool)

(assert start!3998)

(declare-fun b_free!903 () Bool)

(declare-fun b_next!903 () Bool)

(assert (=> start!3998 (= b_free!903 (not b_next!903))))

(declare-fun tp!4128 () Bool)

(declare-fun b_and!1713 () Bool)

(assert (=> start!3998 (= tp!4128 b_and!1713)))

(declare-fun b!28971 () Bool)

(declare-fun e!18727 () Bool)

(declare-fun e!18725 () Bool)

(assert (=> b!28971 (= e!18727 e!18725)))

(declare-fun res!17327 () Bool)

(assert (=> b!28971 (=> (not res!17327) (not e!18725))))

(declare-datatypes ((V!1501 0))(
  ( (V!1502 (val!655 Int)) )
))
(declare-datatypes ((tuple2!1088 0))(
  ( (tuple2!1089 (_1!555 (_ BitVec 64)) (_2!555 V!1501)) )
))
(declare-datatypes ((List!688 0))(
  ( (Nil!685) (Cons!684 (h!1251 tuple2!1088) (t!3381 List!688)) )
))
(declare-datatypes ((ListLongMap!665 0))(
  ( (ListLongMap!666 (toList!348 List!688)) )
))
(declare-fun lt!11023 () ListLongMap!665)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun contains!288 (ListLongMap!665 (_ BitVec 64)) Bool)

(assert (=> b!28971 (= res!17327 (not (contains!288 lt!11023 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!429 0))(
  ( (ValueCellFull!429 (v!1744 V!1501)) (EmptyCell!429) )
))
(declare-datatypes ((array!1749 0))(
  ( (array!1750 (arr!828 (Array (_ BitVec 32) ValueCell!429)) (size!929 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1749)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1751 0))(
  ( (array!1752 (arr!829 (Array (_ BitVec 32) (_ BitVec 64))) (size!930 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1751)

(declare-fun zeroValue!1443 () V!1501)

(declare-fun minValue!1443 () V!1501)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun getCurrentListMap!178 (array!1751 array!1749 (_ BitVec 32) (_ BitVec 32) V!1501 V!1501 (_ BitVec 32) Int) ListLongMap!665)

(assert (=> b!28971 (= lt!11023 (getCurrentListMap!178 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!28972 () Bool)

(declare-fun res!17330 () Bool)

(assert (=> b!28972 (=> (not res!17330) (not e!18727))))

(assert (=> b!28972 (= res!17330 (and (= (size!929 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!930 _keys!1833) (size!929 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!28973 () Bool)

(declare-fun res!17325 () Bool)

(assert (=> b!28973 (=> (not res!17325) (not e!18727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28973 (= res!17325 (validKeyInArray!0 k0!1304))))

(declare-fun b!28974 () Bool)

(declare-fun res!17328 () Bool)

(assert (=> b!28974 (=> (not res!17328) (not e!18725))))

(declare-fun arrayContainsKey!0 (array!1751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28974 (= res!17328 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun res!17326 () Bool)

(assert (=> start!3998 (=> (not res!17326) (not e!18727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3998 (= res!17326 (validMask!0 mask!2294))))

(assert (=> start!3998 e!18727))

(assert (=> start!3998 true))

(assert (=> start!3998 tp!4128))

(declare-fun e!18724 () Bool)

(declare-fun array_inv!573 (array!1749) Bool)

(assert (=> start!3998 (and (array_inv!573 _values!1501) e!18724)))

(declare-fun array_inv!574 (array!1751) Bool)

(assert (=> start!3998 (array_inv!574 _keys!1833)))

(declare-fun tp_is_empty!1257 () Bool)

(assert (=> start!3998 tp_is_empty!1257))

(declare-fun b!28975 () Bool)

(declare-fun e!18728 () Bool)

(assert (=> b!28975 (= e!18728 tp_is_empty!1257)))

(declare-fun mapIsEmpty!1414 () Bool)

(declare-fun mapRes!1414 () Bool)

(assert (=> mapIsEmpty!1414 mapRes!1414))

(declare-fun b!28976 () Bool)

(declare-fun e!18726 () Bool)

(assert (=> b!28976 (= e!18726 tp_is_empty!1257)))

(declare-fun b!28977 () Bool)

(declare-fun res!17331 () Bool)

(assert (=> b!28977 (=> (not res!17331) (not e!18727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1751 (_ BitVec 32)) Bool)

(assert (=> b!28977 (= res!17331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1414 () Bool)

(declare-fun tp!4129 () Bool)

(assert (=> mapNonEmpty!1414 (= mapRes!1414 (and tp!4129 e!18728))))

(declare-fun mapValue!1414 () ValueCell!429)

(declare-fun mapKey!1414 () (_ BitVec 32))

(declare-fun mapRest!1414 () (Array (_ BitVec 32) ValueCell!429))

(assert (=> mapNonEmpty!1414 (= (arr!828 _values!1501) (store mapRest!1414 mapKey!1414 mapValue!1414))))

(declare-fun b!28978 () Bool)

(declare-fun res!17329 () Bool)

(assert (=> b!28978 (=> (not res!17329) (not e!18727))))

(declare-datatypes ((List!689 0))(
  ( (Nil!686) (Cons!685 (h!1252 (_ BitVec 64)) (t!3382 List!689)) )
))
(declare-fun arrayNoDuplicates!0 (array!1751 (_ BitVec 32) List!689) Bool)

(assert (=> b!28978 (= res!17329 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!686))))

(declare-fun b!28979 () Bool)

(assert (=> b!28979 (= e!18725 (not true))))

(declare-datatypes ((SeekEntryResult!77 0))(
  ( (MissingZero!77 (index!2430 (_ BitVec 32))) (Found!77 (index!2431 (_ BitVec 32))) (Intermediate!77 (undefined!889 Bool) (index!2432 (_ BitVec 32)) (x!6371 (_ BitVec 32))) (Undefined!77) (MissingVacant!77 (index!2433 (_ BitVec 32))) )
))
(declare-fun lt!11024 () SeekEntryResult!77)

(declare-fun lt!11021 () (_ BitVec 32))

(get-info :version)

(assert (=> b!28979 (and ((_ is Found!77) lt!11024) (= (index!2431 lt!11024) lt!11021))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1751 (_ BitVec 32)) SeekEntryResult!77)

(assert (=> b!28979 (= lt!11024 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!661 0))(
  ( (Unit!662) )
))
(declare-fun lt!11020 () Unit!661)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!1751 (_ BitVec 32)) Unit!661)

(assert (=> b!28979 (= lt!11020 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!11021 _keys!1833 mask!2294))))

(assert (=> b!28979 (contains!288 lt!11023 (select (arr!829 _keys!1833) lt!11021))))

(declare-fun lt!11022 () Unit!661)

(declare-fun lemmaValidKeyInArrayIsInListMap!24 (array!1751 array!1749 (_ BitVec 32) (_ BitVec 32) V!1501 V!1501 (_ BitVec 32) Int) Unit!661)

(assert (=> b!28979 (= lt!11022 (lemmaValidKeyInArrayIsInListMap!24 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11021 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!1751 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!28979 (= lt!11021 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!28980 () Bool)

(assert (=> b!28980 (= e!18724 (and e!18726 mapRes!1414))))

(declare-fun condMapEmpty!1414 () Bool)

(declare-fun mapDefault!1414 () ValueCell!429)

(assert (=> b!28980 (= condMapEmpty!1414 (= (arr!828 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!429)) mapDefault!1414)))))

(assert (= (and start!3998 res!17326) b!28972))

(assert (= (and b!28972 res!17330) b!28977))

(assert (= (and b!28977 res!17331) b!28978))

(assert (= (and b!28978 res!17329) b!28973))

(assert (= (and b!28973 res!17325) b!28971))

(assert (= (and b!28971 res!17327) b!28974))

(assert (= (and b!28974 res!17328) b!28979))

(assert (= (and b!28980 condMapEmpty!1414) mapIsEmpty!1414))

(assert (= (and b!28980 (not condMapEmpty!1414)) mapNonEmpty!1414))

(assert (= (and mapNonEmpty!1414 ((_ is ValueCellFull!429) mapValue!1414)) b!28975))

(assert (= (and b!28980 ((_ is ValueCellFull!429) mapDefault!1414)) b!28976))

(assert (= start!3998 b!28980))

(declare-fun m!23145 () Bool)

(assert (=> start!3998 m!23145))

(declare-fun m!23147 () Bool)

(assert (=> start!3998 m!23147))

(declare-fun m!23149 () Bool)

(assert (=> start!3998 m!23149))

(declare-fun m!23151 () Bool)

(assert (=> mapNonEmpty!1414 m!23151))

(declare-fun m!23153 () Bool)

(assert (=> b!28978 m!23153))

(declare-fun m!23155 () Bool)

(assert (=> b!28977 m!23155))

(declare-fun m!23157 () Bool)

(assert (=> b!28973 m!23157))

(declare-fun m!23159 () Bool)

(assert (=> b!28971 m!23159))

(declare-fun m!23161 () Bool)

(assert (=> b!28971 m!23161))

(declare-fun m!23163 () Bool)

(assert (=> b!28979 m!23163))

(declare-fun m!23165 () Bool)

(assert (=> b!28979 m!23165))

(declare-fun m!23167 () Bool)

(assert (=> b!28979 m!23167))

(declare-fun m!23169 () Bool)

(assert (=> b!28979 m!23169))

(assert (=> b!28979 m!23167))

(declare-fun m!23171 () Bool)

(assert (=> b!28979 m!23171))

(declare-fun m!23173 () Bool)

(assert (=> b!28979 m!23173))

(declare-fun m!23175 () Bool)

(assert (=> b!28974 m!23175))

(check-sat (not start!3998) (not mapNonEmpty!1414) (not b_next!903) (not b!28973) (not b!28979) (not b!28974) b_and!1713 (not b!28978) tp_is_empty!1257 (not b!28977) (not b!28971))
(check-sat b_and!1713 (not b_next!903))
