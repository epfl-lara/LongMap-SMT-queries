; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84656 () Bool)

(assert start!84656)

(declare-fun b_free!20067 () Bool)

(declare-fun b_next!20067 () Bool)

(assert (=> start!84656 (= b_free!20067 (not b_next!20067))))

(declare-fun tp!69995 () Bool)

(declare-fun b_and!32205 () Bool)

(assert (=> start!84656 (= tp!69995 b_and!32205)))

(declare-fun b!990025 () Bool)

(declare-fun res!662024 () Bool)

(declare-fun e!558252 () Bool)

(assert (=> b!990025 (=> (not res!662024) (not e!558252))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!990025 (= res!662024 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!990026 () Bool)

(declare-fun res!662019 () Bool)

(assert (=> b!990026 (=> (not res!662019) (not e!558252))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62527 0))(
  ( (array!62528 (arr!30115 (Array (_ BitVec 32) (_ BitVec 64))) (size!30594 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62527)

(assert (=> b!990026 (= res!662019 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30594 _keys!1544))))))

(declare-fun b!990027 () Bool)

(declare-fun res!662018 () Bool)

(assert (=> b!990027 (=> (not res!662018) (not e!558252))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36027 0))(
  ( (V!36028 (val!11692 Int)) )
))
(declare-datatypes ((ValueCell!11160 0))(
  ( (ValueCellFull!11160 (v!14262 V!36027)) (EmptyCell!11160) )
))
(declare-datatypes ((array!62529 0))(
  ( (array!62530 (arr!30116 (Array (_ BitVec 32) ValueCell!11160)) (size!30595 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62529)

(assert (=> b!990027 (= res!662018 (and (= (size!30595 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30594 _keys!1544) (size!30595 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990028 () Bool)

(declare-fun e!558255 () Bool)

(declare-fun tp_is_empty!23283 () Bool)

(assert (=> b!990028 (= e!558255 tp_is_empty!23283)))

(declare-fun b!990029 () Bool)

(declare-fun res!662022 () Bool)

(assert (=> b!990029 (=> (not res!662022) (not e!558252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990029 (= res!662022 (validKeyInArray!0 (select (arr!30115 _keys!1544) from!1932)))))

(declare-fun b!990030 () Bool)

(declare-fun res!662021 () Bool)

(assert (=> b!990030 (=> (not res!662021) (not e!558252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62527 (_ BitVec 32)) Bool)

(assert (=> b!990030 (= res!662021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!662023 () Bool)

(assert (=> start!84656 (=> (not res!662023) (not e!558252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84656 (= res!662023 (validMask!0 mask!1948))))

(assert (=> start!84656 e!558252))

(assert (=> start!84656 true))

(assert (=> start!84656 tp_is_empty!23283))

(declare-fun e!558251 () Bool)

(declare-fun array_inv!23259 (array!62529) Bool)

(assert (=> start!84656 (and (array_inv!23259 _values!1278) e!558251)))

(assert (=> start!84656 tp!69995))

(declare-fun array_inv!23260 (array!62527) Bool)

(assert (=> start!84656 (array_inv!23260 _keys!1544)))

(declare-fun mapNonEmpty!36973 () Bool)

(declare-fun mapRes!36973 () Bool)

(declare-fun tp!69996 () Bool)

(declare-fun e!558253 () Bool)

(assert (=> mapNonEmpty!36973 (= mapRes!36973 (and tp!69996 e!558253))))

(declare-fun mapKey!36973 () (_ BitVec 32))

(declare-fun mapValue!36973 () ValueCell!11160)

(declare-fun mapRest!36973 () (Array (_ BitVec 32) ValueCell!11160))

(assert (=> mapNonEmpty!36973 (= (arr!30116 _values!1278) (store mapRest!36973 mapKey!36973 mapValue!36973))))

(declare-fun b!990031 () Bool)

(declare-fun e!558250 () Bool)

(assert (=> b!990031 (= e!558250 (not true))))

(declare-fun minValue!1220 () V!36027)

(declare-datatypes ((tuple2!14908 0))(
  ( (tuple2!14909 (_1!7465 (_ BitVec 64)) (_2!7465 V!36027)) )
))
(declare-datatypes ((List!20837 0))(
  ( (Nil!20834) (Cons!20833 (h!21995 tuple2!14908) (t!29800 List!20837)) )
))
(declare-datatypes ((ListLongMap!13605 0))(
  ( (ListLongMap!13606 (toList!6818 List!20837)) )
))
(declare-fun lt!439187 () ListLongMap!13605)

(declare-fun zeroValue!1220 () V!36027)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMap!3868 (array!62527 array!62529 (_ BitVec 32) (_ BitVec 32) V!36027 V!36027 (_ BitVec 32) Int) ListLongMap!13605)

(assert (=> b!990031 (= lt!439187 (getCurrentListMap!3868 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439188 () ListLongMap!13605)

(declare-fun lt!439184 () tuple2!14908)

(declare-fun lt!439186 () tuple2!14908)

(declare-fun +!3088 (ListLongMap!13605 tuple2!14908) ListLongMap!13605)

(assert (=> b!990031 (= (+!3088 (+!3088 lt!439188 lt!439184) lt!439186) (+!3088 (+!3088 lt!439188 lt!439186) lt!439184))))

(declare-fun lt!439183 () V!36027)

(assert (=> b!990031 (= lt!439186 (tuple2!14909 (select (arr!30115 _keys!1544) from!1932) lt!439183))))

(assert (=> b!990031 (= lt!439184 (tuple2!14909 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32850 0))(
  ( (Unit!32851) )
))
(declare-fun lt!439185 () Unit!32850)

(declare-fun addCommutativeForDiffKeys!710 (ListLongMap!13605 (_ BitVec 64) V!36027 (_ BitVec 64) V!36027) Unit!32850)

(assert (=> b!990031 (= lt!439185 (addCommutativeForDiffKeys!710 lt!439188 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30115 _keys!1544) from!1932) lt!439183))))

(declare-fun b!990032 () Bool)

(assert (=> b!990032 (= e!558252 e!558250)))

(declare-fun res!662025 () Bool)

(assert (=> b!990032 (=> (not res!662025) (not e!558250))))

(assert (=> b!990032 (= res!662025 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30115 _keys!1544) from!1932))))))

(declare-fun get!15633 (ValueCell!11160 V!36027) V!36027)

(declare-fun dynLambda!1870 (Int (_ BitVec 64)) V!36027)

(assert (=> b!990032 (= lt!439183 (get!15633 (select (arr!30116 _values!1278) from!1932) (dynLambda!1870 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3507 (array!62527 array!62529 (_ BitVec 32) (_ BitVec 32) V!36027 V!36027 (_ BitVec 32) Int) ListLongMap!13605)

(assert (=> b!990032 (= lt!439188 (getCurrentListMapNoExtraKeys!3507 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990033 () Bool)

(declare-fun res!662020 () Bool)

(assert (=> b!990033 (=> (not res!662020) (not e!558252))))

(declare-datatypes ((List!20838 0))(
  ( (Nil!20835) (Cons!20834 (h!21996 (_ BitVec 64)) (t!29801 List!20838)) )
))
(declare-fun arrayNoDuplicates!0 (array!62527 (_ BitVec 32) List!20838) Bool)

(assert (=> b!990033 (= res!662020 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20835))))

(declare-fun b!990034 () Bool)

(assert (=> b!990034 (= e!558253 tp_is_empty!23283)))

(declare-fun mapIsEmpty!36973 () Bool)

(assert (=> mapIsEmpty!36973 mapRes!36973))

(declare-fun b!990035 () Bool)

(assert (=> b!990035 (= e!558251 (and e!558255 mapRes!36973))))

(declare-fun condMapEmpty!36973 () Bool)

(declare-fun mapDefault!36973 () ValueCell!11160)

(assert (=> b!990035 (= condMapEmpty!36973 (= (arr!30116 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11160)) mapDefault!36973)))))

(assert (= (and start!84656 res!662023) b!990027))

(assert (= (and b!990027 res!662018) b!990030))

(assert (= (and b!990030 res!662021) b!990033))

(assert (= (and b!990033 res!662020) b!990026))

(assert (= (and b!990026 res!662019) b!990029))

(assert (= (and b!990029 res!662022) b!990025))

(assert (= (and b!990025 res!662024) b!990032))

(assert (= (and b!990032 res!662025) b!990031))

(assert (= (and b!990035 condMapEmpty!36973) mapIsEmpty!36973))

(assert (= (and b!990035 (not condMapEmpty!36973)) mapNonEmpty!36973))

(get-info :version)

(assert (= (and mapNonEmpty!36973 ((_ is ValueCellFull!11160) mapValue!36973)) b!990034))

(assert (= (and b!990035 ((_ is ValueCellFull!11160) mapDefault!36973)) b!990028))

(assert (= start!84656 b!990035))

(declare-fun b_lambda!15147 () Bool)

(assert (=> (not b_lambda!15147) (not b!990032)))

(declare-fun t!29799 () Bool)

(declare-fun tb!6813 () Bool)

(assert (=> (and start!84656 (= defaultEntry!1281 defaultEntry!1281) t!29799) tb!6813))

(declare-fun result!13627 () Bool)

(assert (=> tb!6813 (= result!13627 tp_is_empty!23283)))

(assert (=> b!990032 t!29799))

(declare-fun b_and!32207 () Bool)

(assert (= b_and!32205 (and (=> t!29799 result!13627) b_and!32207)))

(declare-fun m!917423 () Bool)

(assert (=> start!84656 m!917423))

(declare-fun m!917425 () Bool)

(assert (=> start!84656 m!917425))

(declare-fun m!917427 () Bool)

(assert (=> start!84656 m!917427))

(declare-fun m!917429 () Bool)

(assert (=> b!990033 m!917429))

(declare-fun m!917431 () Bool)

(assert (=> b!990029 m!917431))

(assert (=> b!990029 m!917431))

(declare-fun m!917433 () Bool)

(assert (=> b!990029 m!917433))

(declare-fun m!917435 () Bool)

(assert (=> mapNonEmpty!36973 m!917435))

(assert (=> b!990031 m!917431))

(declare-fun m!917437 () Bool)

(assert (=> b!990031 m!917437))

(declare-fun m!917439 () Bool)

(assert (=> b!990031 m!917439))

(assert (=> b!990031 m!917437))

(declare-fun m!917441 () Bool)

(assert (=> b!990031 m!917441))

(declare-fun m!917443 () Bool)

(assert (=> b!990031 m!917443))

(declare-fun m!917445 () Bool)

(assert (=> b!990031 m!917445))

(assert (=> b!990031 m!917443))

(assert (=> b!990031 m!917431))

(declare-fun m!917447 () Bool)

(assert (=> b!990031 m!917447))

(assert (=> b!990032 m!917431))

(declare-fun m!917449 () Bool)

(assert (=> b!990032 m!917449))

(declare-fun m!917451 () Bool)

(assert (=> b!990032 m!917451))

(declare-fun m!917453 () Bool)

(assert (=> b!990032 m!917453))

(assert (=> b!990032 m!917449))

(assert (=> b!990032 m!917453))

(declare-fun m!917455 () Bool)

(assert (=> b!990032 m!917455))

(declare-fun m!917457 () Bool)

(assert (=> b!990030 m!917457))

(check-sat (not start!84656) (not b!990031) (not b!990033) (not b!990030) (not b!990029) (not b_lambda!15147) b_and!32207 (not mapNonEmpty!36973) (not b!990032) (not b_next!20067) tp_is_empty!23283)
(check-sat b_and!32207 (not b_next!20067))
