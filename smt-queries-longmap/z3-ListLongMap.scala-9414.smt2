; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112094 () Bool)

(assert start!112094)

(declare-fun mapNonEmpty!56272 () Bool)

(declare-fun mapRes!56272 () Bool)

(declare-fun tp!107179 () Bool)

(declare-fun e!756869 () Bool)

(assert (=> mapNonEmpty!56272 (= mapRes!56272 (and tp!107179 e!756869))))

(declare-datatypes ((V!53635 0))(
  ( (V!53636 (val!18274 Int)) )
))
(declare-datatypes ((ValueCell!17301 0))(
  ( (ValueCellFull!17301 (v!20911 V!53635)) (EmptyCell!17301) )
))
(declare-datatypes ((array!89706 0))(
  ( (array!89707 (arr!43319 (Array (_ BitVec 32) ValueCell!17301)) (size!43869 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89706)

(declare-fun mapRest!56272 () (Array (_ BitVec 32) ValueCell!17301))

(declare-fun mapKey!56272 () (_ BitVec 32))

(declare-fun mapValue!56272 () ValueCell!17301)

(assert (=> mapNonEmpty!56272 (= (arr!43319 _values!1320) (store mapRest!56272 mapKey!56272 mapValue!56272))))

(declare-fun b!1327703 () Bool)

(declare-fun res!881003 () Bool)

(declare-fun e!756868 () Bool)

(assert (=> b!1327703 (=> (not res!881003) (not e!756868))))

(declare-datatypes ((array!89708 0))(
  ( (array!89709 (arr!43320 (Array (_ BitVec 32) (_ BitVec 64))) (size!43870 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89708)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89708 (_ BitVec 32)) Bool)

(assert (=> b!1327703 (= res!881003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327704 () Bool)

(declare-fun e!756867 () Bool)

(declare-fun tp_is_empty!36399 () Bool)

(assert (=> b!1327704 (= e!756867 tp_is_empty!36399)))

(declare-fun b!1327705 () Bool)

(assert (=> b!1327705 (= e!756869 tp_is_empty!36399)))

(declare-fun mapIsEmpty!56272 () Bool)

(assert (=> mapIsEmpty!56272 mapRes!56272))

(declare-fun b!1327706 () Bool)

(assert (=> b!1327706 (= e!756868 false)))

(declare-fun lt!590740 () Bool)

(declare-datatypes ((List!30695 0))(
  ( (Nil!30692) (Cons!30691 (h!31900 (_ BitVec 64)) (t!44701 List!30695)) )
))
(declare-fun arrayNoDuplicates!0 (array!89708 (_ BitVec 32) List!30695) Bool)

(assert (=> b!1327706 (= lt!590740 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30692))))

(declare-fun b!1327707 () Bool)

(declare-fun e!756870 () Bool)

(assert (=> b!1327707 (= e!756870 (and e!756867 mapRes!56272))))

(declare-fun condMapEmpty!56272 () Bool)

(declare-fun mapDefault!56272 () ValueCell!17301)

(assert (=> b!1327707 (= condMapEmpty!56272 (= (arr!43319 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17301)) mapDefault!56272)))))

(declare-fun res!881004 () Bool)

(assert (=> start!112094 (=> (not res!881004) (not e!756868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112094 (= res!881004 (validMask!0 mask!1998))))

(assert (=> start!112094 e!756868))

(assert (=> start!112094 true))

(declare-fun array_inv!32695 (array!89706) Bool)

(assert (=> start!112094 (and (array_inv!32695 _values!1320) e!756870)))

(declare-fun array_inv!32696 (array!89708) Bool)

(assert (=> start!112094 (array_inv!32696 _keys!1590)))

(declare-fun b!1327708 () Bool)

(declare-fun res!881002 () Bool)

(assert (=> b!1327708 (=> (not res!881002) (not e!756868))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327708 (= res!881002 (and (= (size!43869 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43870 _keys!1590) (size!43869 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112094 res!881004) b!1327708))

(assert (= (and b!1327708 res!881002) b!1327703))

(assert (= (and b!1327703 res!881003) b!1327706))

(assert (= (and b!1327707 condMapEmpty!56272) mapIsEmpty!56272))

(assert (= (and b!1327707 (not condMapEmpty!56272)) mapNonEmpty!56272))

(get-info :version)

(assert (= (and mapNonEmpty!56272 ((_ is ValueCellFull!17301) mapValue!56272)) b!1327705))

(assert (= (and b!1327707 ((_ is ValueCellFull!17301) mapDefault!56272)) b!1327704))

(assert (= start!112094 b!1327707))

(declare-fun m!1216929 () Bool)

(assert (=> mapNonEmpty!56272 m!1216929))

(declare-fun m!1216931 () Bool)

(assert (=> b!1327703 m!1216931))

(declare-fun m!1216933 () Bool)

(assert (=> b!1327706 m!1216933))

(declare-fun m!1216935 () Bool)

(assert (=> start!112094 m!1216935))

(declare-fun m!1216937 () Bool)

(assert (=> start!112094 m!1216937))

(declare-fun m!1216939 () Bool)

(assert (=> start!112094 m!1216939))

(check-sat tp_is_empty!36399 (not b!1327703) (not mapNonEmpty!56272) (not b!1327706) (not start!112094))
(check-sat)
