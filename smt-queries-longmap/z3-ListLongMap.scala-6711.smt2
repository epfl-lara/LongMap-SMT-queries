; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84240 () Bool)

(assert start!84240)

(declare-fun b_free!19941 () Bool)

(declare-fun b_next!19941 () Bool)

(assert (=> start!84240 (= b_free!19941 (not b_next!19941))))

(declare-fun tp!69427 () Bool)

(declare-fun b_and!31959 () Bool)

(assert (=> start!84240 (= tp!69427 b_and!31959)))

(declare-fun b!985507 () Bool)

(declare-fun e!555516 () Bool)

(declare-fun tp_is_empty!23043 () Bool)

(assert (=> b!985507 (= e!555516 tp_is_empty!23043)))

(declare-fun b!985508 () Bool)

(declare-fun e!555511 () Bool)

(assert (=> b!985508 (= e!555511 tp_is_empty!23043)))

(declare-fun b!985509 () Bool)

(declare-fun res!659470 () Bool)

(declare-fun e!555512 () Bool)

(assert (=> b!985509 (=> (not res!659470) (not e!555512))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62061 0))(
  ( (array!62062 (arr!29888 (Array (_ BitVec 32) (_ BitVec 64))) (size!30367 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62061)

(assert (=> b!985509 (= res!659470 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30367 _keys!1544))))))

(declare-fun b!985510 () Bool)

(declare-fun e!555513 () Bool)

(declare-fun mapRes!36593 () Bool)

(assert (=> b!985510 (= e!555513 (and e!555516 mapRes!36593))))

(declare-fun condMapEmpty!36593 () Bool)

(declare-datatypes ((V!35707 0))(
  ( (V!35708 (val!11572 Int)) )
))
(declare-datatypes ((ValueCell!11040 0))(
  ( (ValueCellFull!11040 (v!14134 V!35707)) (EmptyCell!11040) )
))
(declare-datatypes ((array!62063 0))(
  ( (array!62064 (arr!29889 (Array (_ BitVec 32) ValueCell!11040)) (size!30368 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62063)

(declare-fun mapDefault!36593 () ValueCell!11040)

(assert (=> b!985510 (= condMapEmpty!36593 (= (arr!29889 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11040)) mapDefault!36593)))))

(declare-fun mapNonEmpty!36593 () Bool)

(declare-fun tp!69426 () Bool)

(assert (=> mapNonEmpty!36593 (= mapRes!36593 (and tp!69426 e!555511))))

(declare-fun mapValue!36593 () ValueCell!11040)

(declare-fun mapRest!36593 () (Array (_ BitVec 32) ValueCell!11040))

(declare-fun mapKey!36593 () (_ BitVec 32))

(assert (=> mapNonEmpty!36593 (= (arr!29889 _values!1278) (store mapRest!36593 mapKey!36593 mapValue!36593))))

(declare-fun b!985512 () Bool)

(declare-fun res!659469 () Bool)

(assert (=> b!985512 (=> (not res!659469) (not e!555512))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985512 (= res!659469 (and (= (size!30368 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30367 _keys!1544) (size!30368 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985513 () Bool)

(declare-fun e!555514 () Bool)

(assert (=> b!985513 (= e!555514 (not true))))

(declare-datatypes ((tuple2!14810 0))(
  ( (tuple2!14811 (_1!7416 (_ BitVec 64)) (_2!7416 V!35707)) )
))
(declare-datatypes ((List!20701 0))(
  ( (Nil!20698) (Cons!20697 (h!21859 tuple2!14810) (t!29586 List!20701)) )
))
(declare-datatypes ((ListLongMap!13507 0))(
  ( (ListLongMap!13508 (toList!6769 List!20701)) )
))
(declare-fun lt!437273 () ListLongMap!13507)

(declare-fun lt!437275 () tuple2!14810)

(declare-fun lt!437276 () tuple2!14810)

(declare-fun +!3056 (ListLongMap!13507 tuple2!14810) ListLongMap!13507)

(assert (=> b!985513 (= (+!3056 (+!3056 lt!437273 lt!437275) lt!437276) (+!3056 (+!3056 lt!437273 lt!437276) lt!437275))))

(declare-fun lt!437272 () V!35707)

(assert (=> b!985513 (= lt!437276 (tuple2!14811 (select (arr!29888 _keys!1544) from!1932) lt!437272))))

(declare-fun minValue!1220 () V!35707)

(assert (=> b!985513 (= lt!437275 (tuple2!14811 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32751 0))(
  ( (Unit!32752) )
))
(declare-fun lt!437274 () Unit!32751)

(declare-fun addCommutativeForDiffKeys!684 (ListLongMap!13507 (_ BitVec 64) V!35707 (_ BitVec 64) V!35707) Unit!32751)

(assert (=> b!985513 (= lt!437274 (addCommutativeForDiffKeys!684 lt!437273 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29888 _keys!1544) from!1932) lt!437272))))

(declare-fun mapIsEmpty!36593 () Bool)

(assert (=> mapIsEmpty!36593 mapRes!36593))

(declare-fun b!985511 () Bool)

(declare-fun res!659464 () Bool)

(assert (=> b!985511 (=> (not res!659464) (not e!555512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62061 (_ BitVec 32)) Bool)

(assert (=> b!985511 (= res!659464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!659467 () Bool)

(assert (=> start!84240 (=> (not res!659467) (not e!555512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84240 (= res!659467 (validMask!0 mask!1948))))

(assert (=> start!84240 e!555512))

(assert (=> start!84240 true))

(assert (=> start!84240 tp_is_empty!23043))

(declare-fun array_inv!23103 (array!62063) Bool)

(assert (=> start!84240 (and (array_inv!23103 _values!1278) e!555513)))

(assert (=> start!84240 tp!69427))

(declare-fun array_inv!23104 (array!62061) Bool)

(assert (=> start!84240 (array_inv!23104 _keys!1544)))

(declare-fun b!985514 () Bool)

(declare-fun res!659465 () Bool)

(assert (=> b!985514 (=> (not res!659465) (not e!555512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985514 (= res!659465 (validKeyInArray!0 (select (arr!29888 _keys!1544) from!1932)))))

(declare-fun b!985515 () Bool)

(declare-fun res!659471 () Bool)

(assert (=> b!985515 (=> (not res!659471) (not e!555512))))

(assert (=> b!985515 (= res!659471 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985516 () Bool)

(assert (=> b!985516 (= e!555512 e!555514)))

(declare-fun res!659468 () Bool)

(assert (=> b!985516 (=> (not res!659468) (not e!555514))))

(assert (=> b!985516 (= res!659468 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29888 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15515 (ValueCell!11040 V!35707) V!35707)

(declare-fun dynLambda!1840 (Int (_ BitVec 64)) V!35707)

(assert (=> b!985516 (= lt!437272 (get!15515 (select (arr!29889 _values!1278) from!1932) (dynLambda!1840 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35707)

(declare-fun getCurrentListMapNoExtraKeys!3460 (array!62061 array!62063 (_ BitVec 32) (_ BitVec 32) V!35707 V!35707 (_ BitVec 32) Int) ListLongMap!13507)

(assert (=> b!985516 (= lt!437273 (getCurrentListMapNoExtraKeys!3460 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985517 () Bool)

(declare-fun res!659466 () Bool)

(assert (=> b!985517 (=> (not res!659466) (not e!555512))))

(declare-datatypes ((List!20702 0))(
  ( (Nil!20699) (Cons!20698 (h!21860 (_ BitVec 64)) (t!29587 List!20702)) )
))
(declare-fun arrayNoDuplicates!0 (array!62061 (_ BitVec 32) List!20702) Bool)

(assert (=> b!985517 (= res!659466 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20699))))

(assert (= (and start!84240 res!659467) b!985512))

(assert (= (and b!985512 res!659469) b!985511))

(assert (= (and b!985511 res!659464) b!985517))

(assert (= (and b!985517 res!659466) b!985509))

(assert (= (and b!985509 res!659470) b!985514))

(assert (= (and b!985514 res!659465) b!985515))

(assert (= (and b!985515 res!659471) b!985516))

(assert (= (and b!985516 res!659468) b!985513))

(assert (= (and b!985510 condMapEmpty!36593) mapIsEmpty!36593))

(assert (= (and b!985510 (not condMapEmpty!36593)) mapNonEmpty!36593))

(get-info :version)

(assert (= (and mapNonEmpty!36593 ((_ is ValueCellFull!11040) mapValue!36593)) b!985508))

(assert (= (and b!985510 ((_ is ValueCellFull!11040) mapDefault!36593)) b!985507))

(assert (= start!84240 b!985510))

(declare-fun b_lambda!14973 () Bool)

(assert (=> (not b_lambda!14973) (not b!985516)))

(declare-fun t!29585 () Bool)

(declare-fun tb!6735 () Bool)

(assert (=> (and start!84240 (= defaultEntry!1281 defaultEntry!1281) t!29585) tb!6735))

(declare-fun result!13459 () Bool)

(assert (=> tb!6735 (= result!13459 tp_is_empty!23043)))

(assert (=> b!985516 t!29585))

(declare-fun b_and!31961 () Bool)

(assert (= b_and!31959 (and (=> t!29585 result!13459) b_and!31961)))

(declare-fun m!912563 () Bool)

(assert (=> b!985513 m!912563))

(declare-fun m!912565 () Bool)

(assert (=> b!985513 m!912565))

(assert (=> b!985513 m!912565))

(declare-fun m!912567 () Bool)

(assert (=> b!985513 m!912567))

(assert (=> b!985513 m!912563))

(declare-fun m!912569 () Bool)

(assert (=> b!985513 m!912569))

(declare-fun m!912571 () Bool)

(assert (=> b!985513 m!912571))

(assert (=> b!985513 m!912571))

(declare-fun m!912573 () Bool)

(assert (=> b!985513 m!912573))

(assert (=> b!985516 m!912563))

(declare-fun m!912575 () Bool)

(assert (=> b!985516 m!912575))

(declare-fun m!912577 () Bool)

(assert (=> b!985516 m!912577))

(declare-fun m!912579 () Bool)

(assert (=> b!985516 m!912579))

(assert (=> b!985516 m!912575))

(assert (=> b!985516 m!912579))

(declare-fun m!912581 () Bool)

(assert (=> b!985516 m!912581))

(declare-fun m!912583 () Bool)

(assert (=> b!985517 m!912583))

(declare-fun m!912585 () Bool)

(assert (=> b!985511 m!912585))

(declare-fun m!912587 () Bool)

(assert (=> start!84240 m!912587))

(declare-fun m!912589 () Bool)

(assert (=> start!84240 m!912589))

(declare-fun m!912591 () Bool)

(assert (=> start!84240 m!912591))

(assert (=> b!985514 m!912563))

(assert (=> b!985514 m!912563))

(declare-fun m!912593 () Bool)

(assert (=> b!985514 m!912593))

(declare-fun m!912595 () Bool)

(assert (=> mapNonEmpty!36593 m!912595))

(check-sat (not mapNonEmpty!36593) (not b!985517) tp_is_empty!23043 b_and!31961 (not b!985513) (not b_next!19941) (not b!985516) (not b!985511) (not start!84240) (not b_lambda!14973) (not b!985514))
(check-sat b_and!31961 (not b_next!19941))
