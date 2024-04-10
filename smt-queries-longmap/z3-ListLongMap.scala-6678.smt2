; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84042 () Bool)

(assert start!84042)

(declare-fun b_free!19797 () Bool)

(declare-fun b_next!19797 () Bool)

(assert (=> start!84042 (= b_free!19797 (not b_next!19797))))

(declare-fun tp!68913 () Bool)

(declare-fun b_and!31677 () Bool)

(assert (=> start!84042 (= tp!68913 b_and!31677)))

(declare-fun b!982489 () Bool)

(declare-fun e!553822 () Bool)

(declare-fun tp_is_empty!22845 () Bool)

(assert (=> b!982489 (= e!553822 tp_is_empty!22845)))

(declare-fun b!982490 () Bool)

(declare-fun res!657479 () Bool)

(declare-fun e!553821 () Bool)

(assert (=> b!982490 (=> (not res!657479) (not e!553821))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982490 (= res!657479 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!657478 () Bool)

(assert (=> start!84042 (=> (not res!657478) (not e!553821))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84042 (= res!657478 (validMask!0 mask!1948))))

(assert (=> start!84042 e!553821))

(assert (=> start!84042 true))

(assert (=> start!84042 tp_is_empty!22845))

(declare-datatypes ((V!35443 0))(
  ( (V!35444 (val!11473 Int)) )
))
(declare-datatypes ((ValueCell!10941 0))(
  ( (ValueCellFull!10941 (v!14035 V!35443)) (EmptyCell!10941) )
))
(declare-datatypes ((array!61681 0))(
  ( (array!61682 (arr!29698 (Array (_ BitVec 32) ValueCell!10941)) (size!30177 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61681)

(declare-fun e!553820 () Bool)

(declare-fun array_inv!22965 (array!61681) Bool)

(assert (=> start!84042 (and (array_inv!22965 _values!1278) e!553820)))

(assert (=> start!84042 tp!68913))

(declare-datatypes ((array!61683 0))(
  ( (array!61684 (arr!29699 (Array (_ BitVec 32) (_ BitVec 64))) (size!30178 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61683)

(declare-fun array_inv!22966 (array!61683) Bool)

(assert (=> start!84042 (array_inv!22966 _keys!1544)))

(declare-fun b!982491 () Bool)

(declare-fun e!553819 () Bool)

(assert (=> b!982491 (= e!553819 (not true))))

(declare-datatypes ((tuple2!14696 0))(
  ( (tuple2!14697 (_1!7359 (_ BitVec 64)) (_2!7359 V!35443)) )
))
(declare-datatypes ((List!20577 0))(
  ( (Nil!20574) (Cons!20573 (h!21735 tuple2!14696) (t!29324 List!20577)) )
))
(declare-datatypes ((ListLongMap!13393 0))(
  ( (ListLongMap!13394 (toList!6712 List!20577)) )
))
(declare-fun lt!436158 () ListLongMap!13393)

(declare-fun lt!436160 () tuple2!14696)

(declare-fun lt!436157 () tuple2!14696)

(declare-fun +!3010 (ListLongMap!13393 tuple2!14696) ListLongMap!13393)

(assert (=> b!982491 (= (+!3010 (+!3010 lt!436158 lt!436160) lt!436157) (+!3010 (+!3010 lt!436158 lt!436157) lt!436160))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!436159 () V!35443)

(assert (=> b!982491 (= lt!436157 (tuple2!14697 (select (arr!29699 _keys!1544) from!1932) lt!436159))))

(declare-fun zeroValue!1220 () V!35443)

(assert (=> b!982491 (= lt!436160 (tuple2!14697 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32659 0))(
  ( (Unit!32660) )
))
(declare-fun lt!436156 () Unit!32659)

(declare-fun addCommutativeForDiffKeys!638 (ListLongMap!13393 (_ BitVec 64) V!35443 (_ BitVec 64) V!35443) Unit!32659)

(assert (=> b!982491 (= lt!436156 (addCommutativeForDiffKeys!638 lt!436158 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29699 _keys!1544) from!1932) lt!436159))))

(declare-fun b!982492 () Bool)

(declare-fun res!657480 () Bool)

(assert (=> b!982492 (=> (not res!657480) (not e!553821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982492 (= res!657480 (validKeyInArray!0 (select (arr!29699 _keys!1544) from!1932)))))

(declare-fun b!982493 () Bool)

(declare-fun e!553824 () Bool)

(assert (=> b!982493 (= e!553824 tp_is_empty!22845)))

(declare-fun b!982494 () Bool)

(assert (=> b!982494 (= e!553821 e!553819)))

(declare-fun res!657482 () Bool)

(assert (=> b!982494 (=> (not res!657482) (not e!553819))))

(assert (=> b!982494 (= res!657482 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29699 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15404 (ValueCell!10941 V!35443) V!35443)

(declare-fun dynLambda!1795 (Int (_ BitVec 64)) V!35443)

(assert (=> b!982494 (= lt!436159 (get!15404 (select (arr!29698 _values!1278) from!1932) (dynLambda!1795 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35443)

(declare-fun getCurrentListMapNoExtraKeys!3412 (array!61683 array!61681 (_ BitVec 32) (_ BitVec 32) V!35443 V!35443 (_ BitVec 32) Int) ListLongMap!13393)

(assert (=> b!982494 (= lt!436158 (getCurrentListMapNoExtraKeys!3412 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982495 () Bool)

(declare-fun res!657477 () Bool)

(assert (=> b!982495 (=> (not res!657477) (not e!553821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61683 (_ BitVec 32)) Bool)

(assert (=> b!982495 (= res!657477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982496 () Bool)

(declare-fun res!657476 () Bool)

(assert (=> b!982496 (=> (not res!657476) (not e!553821))))

(assert (=> b!982496 (= res!657476 (and (= (size!30177 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30178 _keys!1544) (size!30177 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982497 () Bool)

(declare-fun res!657475 () Bool)

(assert (=> b!982497 (=> (not res!657475) (not e!553821))))

(assert (=> b!982497 (= res!657475 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30178 _keys!1544))))))

(declare-fun b!982498 () Bool)

(declare-fun res!657481 () Bool)

(assert (=> b!982498 (=> (not res!657481) (not e!553821))))

(declare-datatypes ((List!20578 0))(
  ( (Nil!20575) (Cons!20574 (h!21736 (_ BitVec 64)) (t!29325 List!20578)) )
))
(declare-fun arrayNoDuplicates!0 (array!61683 (_ BitVec 32) List!20578) Bool)

(assert (=> b!982498 (= res!657481 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20575))))

(declare-fun mapNonEmpty!36296 () Bool)

(declare-fun mapRes!36296 () Bool)

(declare-fun tp!68914 () Bool)

(assert (=> mapNonEmpty!36296 (= mapRes!36296 (and tp!68914 e!553824))))

(declare-fun mapValue!36296 () ValueCell!10941)

(declare-fun mapRest!36296 () (Array (_ BitVec 32) ValueCell!10941))

(declare-fun mapKey!36296 () (_ BitVec 32))

(assert (=> mapNonEmpty!36296 (= (arr!29698 _values!1278) (store mapRest!36296 mapKey!36296 mapValue!36296))))

(declare-fun b!982499 () Bool)

(assert (=> b!982499 (= e!553820 (and e!553822 mapRes!36296))))

(declare-fun condMapEmpty!36296 () Bool)

(declare-fun mapDefault!36296 () ValueCell!10941)

(assert (=> b!982499 (= condMapEmpty!36296 (= (arr!29698 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10941)) mapDefault!36296)))))

(declare-fun mapIsEmpty!36296 () Bool)

(assert (=> mapIsEmpty!36296 mapRes!36296))

(assert (= (and start!84042 res!657478) b!982496))

(assert (= (and b!982496 res!657476) b!982495))

(assert (= (and b!982495 res!657477) b!982498))

(assert (= (and b!982498 res!657481) b!982497))

(assert (= (and b!982497 res!657475) b!982492))

(assert (= (and b!982492 res!657480) b!982490))

(assert (= (and b!982490 res!657479) b!982494))

(assert (= (and b!982494 res!657482) b!982491))

(assert (= (and b!982499 condMapEmpty!36296) mapIsEmpty!36296))

(assert (= (and b!982499 (not condMapEmpty!36296)) mapNonEmpty!36296))

(get-info :version)

(assert (= (and mapNonEmpty!36296 ((_ is ValueCellFull!10941) mapValue!36296)) b!982493))

(assert (= (and b!982499 ((_ is ValueCellFull!10941) mapDefault!36296)) b!982489))

(assert (= start!84042 b!982499))

(declare-fun b_lambda!14835 () Bool)

(assert (=> (not b_lambda!14835) (not b!982494)))

(declare-fun t!29323 () Bool)

(declare-fun tb!6597 () Bool)

(assert (=> (and start!84042 (= defaultEntry!1281 defaultEntry!1281) t!29323) tb!6597))

(declare-fun result!13183 () Bool)

(assert (=> tb!6597 (= result!13183 tp_is_empty!22845)))

(assert (=> b!982494 t!29323))

(declare-fun b_and!31679 () Bool)

(assert (= b_and!31677 (and (=> t!29323 result!13183) b_and!31679)))

(declare-fun m!909827 () Bool)

(assert (=> b!982492 m!909827))

(assert (=> b!982492 m!909827))

(declare-fun m!909829 () Bool)

(assert (=> b!982492 m!909829))

(declare-fun m!909831 () Bool)

(assert (=> mapNonEmpty!36296 m!909831))

(declare-fun m!909833 () Bool)

(assert (=> start!84042 m!909833))

(declare-fun m!909835 () Bool)

(assert (=> start!84042 m!909835))

(declare-fun m!909837 () Bool)

(assert (=> start!84042 m!909837))

(assert (=> b!982494 m!909827))

(declare-fun m!909839 () Bool)

(assert (=> b!982494 m!909839))

(declare-fun m!909841 () Bool)

(assert (=> b!982494 m!909841))

(declare-fun m!909843 () Bool)

(assert (=> b!982494 m!909843))

(assert (=> b!982494 m!909839))

(assert (=> b!982494 m!909843))

(declare-fun m!909845 () Bool)

(assert (=> b!982494 m!909845))

(declare-fun m!909847 () Bool)

(assert (=> b!982491 m!909847))

(declare-fun m!909849 () Bool)

(assert (=> b!982491 m!909849))

(declare-fun m!909851 () Bool)

(assert (=> b!982491 m!909851))

(assert (=> b!982491 m!909851))

(declare-fun m!909853 () Bool)

(assert (=> b!982491 m!909853))

(assert (=> b!982491 m!909827))

(declare-fun m!909855 () Bool)

(assert (=> b!982491 m!909855))

(assert (=> b!982491 m!909827))

(assert (=> b!982491 m!909847))

(declare-fun m!909857 () Bool)

(assert (=> b!982495 m!909857))

(declare-fun m!909859 () Bool)

(assert (=> b!982498 m!909859))

(check-sat (not b!982494) (not b_lambda!14835) (not b_next!19797) (not start!84042) b_and!31679 (not b!982495) (not b!982491) (not mapNonEmpty!36296) tp_is_empty!22845 (not b!982498) (not b!982492))
(check-sat b_and!31679 (not b_next!19797))
