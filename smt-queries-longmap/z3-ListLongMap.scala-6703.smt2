; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84358 () Bool)

(assert start!84358)

(declare-fun b_free!19891 () Bool)

(declare-fun b_next!19891 () Bool)

(assert (=> start!84358 (= b_free!19891 (not b_next!19891))))

(declare-fun tp!69278 () Bool)

(declare-fun b_and!31869 () Bool)

(assert (=> start!84358 (= tp!69278 b_and!31869)))

(declare-fun b!985535 () Bool)

(declare-fun e!555645 () Bool)

(declare-fun e!555646 () Bool)

(assert (=> b!985535 (= e!555645 e!555646)))

(declare-fun res!659214 () Bool)

(assert (=> b!985535 (=> (not res!659214) (not e!555646))))

(declare-datatypes ((array!62004 0))(
  ( (array!62005 (arr!29855 (Array (_ BitVec 32) (_ BitVec 64))) (size!30335 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62004)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!985535 (= res!659214 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29855 _keys!1544) from!1932))))))

(declare-datatypes ((V!35641 0))(
  ( (V!35642 (val!11547 Int)) )
))
(declare-datatypes ((ValueCell!11015 0))(
  ( (ValueCellFull!11015 (v!14106 V!35641)) (EmptyCell!11015) )
))
(declare-datatypes ((array!62006 0))(
  ( (array!62007 (arr!29856 (Array (_ BitVec 32) ValueCell!11015)) (size!30336 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62006)

(declare-fun lt!437261 () V!35641)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15515 (ValueCell!11015 V!35641) V!35641)

(declare-fun dynLambda!1852 (Int (_ BitVec 64)) V!35641)

(assert (=> b!985535 (= lt!437261 (get!15515 (select (arr!29856 _values!1278) from!1932) (dynLambda!1852 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35641)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35641)

(declare-datatypes ((tuple2!14790 0))(
  ( (tuple2!14791 (_1!7406 (_ BitVec 64)) (_2!7406 V!35641)) )
))
(declare-datatypes ((List!20671 0))(
  ( (Nil!20668) (Cons!20667 (h!21835 tuple2!14790) (t!29498 List!20671)) )
))
(declare-datatypes ((ListLongMap!13489 0))(
  ( (ListLongMap!13490 (toList!6760 List!20671)) )
))
(declare-fun lt!437262 () ListLongMap!13489)

(declare-fun getCurrentListMapNoExtraKeys!3495 (array!62004 array!62006 (_ BitVec 32) (_ BitVec 32) V!35641 V!35641 (_ BitVec 32) Int) ListLongMap!13489)

(assert (=> b!985535 (= lt!437262 (getCurrentListMapNoExtraKeys!3495 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!659211 () Bool)

(assert (=> start!84358 (=> (not res!659211) (not e!555645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84358 (= res!659211 (validMask!0 mask!1948))))

(assert (=> start!84358 e!555645))

(assert (=> start!84358 true))

(declare-fun tp_is_empty!22993 () Bool)

(assert (=> start!84358 tp_is_empty!22993))

(declare-fun e!555647 () Bool)

(declare-fun array_inv!23099 (array!62006) Bool)

(assert (=> start!84358 (and (array_inv!23099 _values!1278) e!555647)))

(assert (=> start!84358 tp!69278))

(declare-fun array_inv!23100 (array!62004) Bool)

(assert (=> start!84358 (array_inv!23100 _keys!1544)))

(declare-fun b!985536 () Bool)

(declare-fun res!659213 () Bool)

(assert (=> b!985536 (=> (not res!659213) (not e!555645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985536 (= res!659213 (validKeyInArray!0 (select (arr!29855 _keys!1544) from!1932)))))

(declare-fun b!985537 () Bool)

(declare-fun e!555644 () Bool)

(assert (=> b!985537 (= e!555644 tp_is_empty!22993)))

(declare-fun b!985538 () Bool)

(declare-fun res!659212 () Bool)

(assert (=> b!985538 (=> (not res!659212) (not e!555645))))

(assert (=> b!985538 (= res!659212 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985539 () Bool)

(declare-fun res!659210 () Bool)

(assert (=> b!985539 (=> (not res!659210) (not e!555645))))

(assert (=> b!985539 (= res!659210 (and (= (size!30336 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30335 _keys!1544) (size!30336 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36518 () Bool)

(declare-fun mapRes!36518 () Bool)

(assert (=> mapIsEmpty!36518 mapRes!36518))

(declare-fun b!985540 () Bool)

(assert (=> b!985540 (= e!555646 (not true))))

(declare-fun lt!437259 () tuple2!14790)

(declare-fun lt!437260 () tuple2!14790)

(declare-fun +!3062 (ListLongMap!13489 tuple2!14790) ListLongMap!13489)

(assert (=> b!985540 (= (+!3062 (+!3062 lt!437262 lt!437259) lt!437260) (+!3062 (+!3062 lt!437262 lt!437260) lt!437259))))

(assert (=> b!985540 (= lt!437260 (tuple2!14791 (select (arr!29855 _keys!1544) from!1932) lt!437261))))

(assert (=> b!985540 (= lt!437259 (tuple2!14791 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32704 0))(
  ( (Unit!32705) )
))
(declare-fun lt!437258 () Unit!32704)

(declare-fun addCommutativeForDiffKeys!669 (ListLongMap!13489 (_ BitVec 64) V!35641 (_ BitVec 64) V!35641) Unit!32704)

(assert (=> b!985540 (= lt!437258 (addCommutativeForDiffKeys!669 lt!437262 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29855 _keys!1544) from!1932) lt!437261))))

(declare-fun b!985541 () Bool)

(declare-fun res!659208 () Bool)

(assert (=> b!985541 (=> (not res!659208) (not e!555645))))

(declare-datatypes ((List!20672 0))(
  ( (Nil!20669) (Cons!20668 (h!21836 (_ BitVec 64)) (t!29499 List!20672)) )
))
(declare-fun arrayNoDuplicates!0 (array!62004 (_ BitVec 32) List!20672) Bool)

(assert (=> b!985541 (= res!659208 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20669))))

(declare-fun mapNonEmpty!36518 () Bool)

(declare-fun tp!69277 () Bool)

(declare-fun e!555648 () Bool)

(assert (=> mapNonEmpty!36518 (= mapRes!36518 (and tp!69277 e!555648))))

(declare-fun mapRest!36518 () (Array (_ BitVec 32) ValueCell!11015))

(declare-fun mapValue!36518 () ValueCell!11015)

(declare-fun mapKey!36518 () (_ BitVec 32))

(assert (=> mapNonEmpty!36518 (= (arr!29856 _values!1278) (store mapRest!36518 mapKey!36518 mapValue!36518))))

(declare-fun b!985542 () Bool)

(declare-fun res!659209 () Bool)

(assert (=> b!985542 (=> (not res!659209) (not e!555645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62004 (_ BitVec 32)) Bool)

(assert (=> b!985542 (= res!659209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985543 () Bool)

(declare-fun res!659215 () Bool)

(assert (=> b!985543 (=> (not res!659215) (not e!555645))))

(assert (=> b!985543 (= res!659215 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30335 _keys!1544))))))

(declare-fun b!985544 () Bool)

(assert (=> b!985544 (= e!555647 (and e!555644 mapRes!36518))))

(declare-fun condMapEmpty!36518 () Bool)

(declare-fun mapDefault!36518 () ValueCell!11015)

(assert (=> b!985544 (= condMapEmpty!36518 (= (arr!29856 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11015)) mapDefault!36518)))))

(declare-fun b!985545 () Bool)

(assert (=> b!985545 (= e!555648 tp_is_empty!22993)))

(assert (= (and start!84358 res!659211) b!985539))

(assert (= (and b!985539 res!659210) b!985542))

(assert (= (and b!985542 res!659209) b!985541))

(assert (= (and b!985541 res!659208) b!985543))

(assert (= (and b!985543 res!659215) b!985536))

(assert (= (and b!985536 res!659213) b!985538))

(assert (= (and b!985538 res!659212) b!985535))

(assert (= (and b!985535 res!659214) b!985540))

(assert (= (and b!985544 condMapEmpty!36518) mapIsEmpty!36518))

(assert (= (and b!985544 (not condMapEmpty!36518)) mapNonEmpty!36518))

(get-info :version)

(assert (= (and mapNonEmpty!36518 ((_ is ValueCellFull!11015) mapValue!36518)) b!985545))

(assert (= (and b!985544 ((_ is ValueCellFull!11015) mapDefault!36518)) b!985537))

(assert (= start!84358 b!985544))

(declare-fun b_lambda!14937 () Bool)

(assert (=> (not b_lambda!14937) (not b!985535)))

(declare-fun t!29497 () Bool)

(declare-fun tb!6677 () Bool)

(assert (=> (and start!84358 (= defaultEntry!1281 defaultEntry!1281) t!29497) tb!6677))

(declare-fun result!13351 () Bool)

(assert (=> tb!6677 (= result!13351 tp_is_empty!22993)))

(assert (=> b!985535 t!29497))

(declare-fun b_and!31871 () Bool)

(assert (= b_and!31869 (and (=> t!29497 result!13351) b_and!31871)))

(declare-fun m!913007 () Bool)

(assert (=> b!985541 m!913007))

(declare-fun m!913009 () Bool)

(assert (=> b!985540 m!913009))

(declare-fun m!913011 () Bool)

(assert (=> b!985540 m!913011))

(assert (=> b!985540 m!913011))

(declare-fun m!913013 () Bool)

(assert (=> b!985540 m!913013))

(declare-fun m!913015 () Bool)

(assert (=> b!985540 m!913015))

(declare-fun m!913017 () Bool)

(assert (=> b!985540 m!913017))

(assert (=> b!985540 m!913015))

(assert (=> b!985540 m!913009))

(declare-fun m!913019 () Bool)

(assert (=> b!985540 m!913019))

(declare-fun m!913021 () Bool)

(assert (=> start!84358 m!913021))

(declare-fun m!913023 () Bool)

(assert (=> start!84358 m!913023))

(declare-fun m!913025 () Bool)

(assert (=> start!84358 m!913025))

(assert (=> b!985536 m!913009))

(assert (=> b!985536 m!913009))

(declare-fun m!913027 () Bool)

(assert (=> b!985536 m!913027))

(assert (=> b!985535 m!913009))

(declare-fun m!913029 () Bool)

(assert (=> b!985535 m!913029))

(declare-fun m!913031 () Bool)

(assert (=> b!985535 m!913031))

(declare-fun m!913033 () Bool)

(assert (=> b!985535 m!913033))

(assert (=> b!985535 m!913029))

(assert (=> b!985535 m!913033))

(declare-fun m!913035 () Bool)

(assert (=> b!985535 m!913035))

(declare-fun m!913037 () Bool)

(assert (=> mapNonEmpty!36518 m!913037))

(declare-fun m!913039 () Bool)

(assert (=> b!985542 m!913039))

(check-sat (not start!84358) (not b!985542) (not b_next!19891) (not b_lambda!14937) b_and!31871 (not b!985540) (not b!985536) (not b!985541) tp_is_empty!22993 (not b!985535) (not mapNonEmpty!36518))
(check-sat b_and!31871 (not b_next!19891))
