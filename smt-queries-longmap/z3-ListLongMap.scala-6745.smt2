; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84716 () Bool)

(assert start!84716)

(declare-fun b_free!20029 () Bool)

(declare-fun b_next!20029 () Bool)

(assert (=> start!84716 (= b_free!20029 (not b_next!20029))))

(declare-fun tp!69876 () Bool)

(declare-fun b_and!32137 () Bool)

(assert (=> start!84716 (= tp!69876 b_and!32137)))

(declare-fun b!989740 () Bool)

(declare-fun e!558170 () Bool)

(assert (=> b!989740 (= e!558170 (not true))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35977 0))(
  ( (V!35978 (val!11673 Int)) )
))
(declare-fun minValue!1220 () V!35977)

(declare-datatypes ((ValueCell!11141 0))(
  ( (ValueCellFull!11141 (v!14237 V!35977)) (EmptyCell!11141) )
))
(declare-datatypes ((array!62496 0))(
  ( (array!62497 (arr!30097 (Array (_ BitVec 32) ValueCell!11141)) (size!30577 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62496)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35977)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((array!62498 0))(
  ( (array!62499 (arr!30098 (Array (_ BitVec 32) (_ BitVec 64))) (size!30578 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62498)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((tuple2!14900 0))(
  ( (tuple2!14901 (_1!7461 (_ BitVec 64)) (_2!7461 V!35977)) )
))
(declare-datatypes ((List!20805 0))(
  ( (Nil!20802) (Cons!20801 (h!21969 tuple2!14900) (t!29738 List!20805)) )
))
(declare-datatypes ((ListLongMap!13599 0))(
  ( (ListLongMap!13600 (toList!6815 List!20805)) )
))
(declare-fun lt!438951 () ListLongMap!13599)

(declare-fun getCurrentListMap!3868 (array!62498 array!62496 (_ BitVec 32) (_ BitVec 32) V!35977 V!35977 (_ BitVec 32) Int) ListLongMap!13599)

(assert (=> b!989740 (= lt!438951 (getCurrentListMap!3868 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438956 () ListLongMap!13599)

(declare-fun lt!438952 () tuple2!14900)

(declare-fun lt!438955 () tuple2!14900)

(declare-fun +!3108 (ListLongMap!13599 tuple2!14900) ListLongMap!13599)

(assert (=> b!989740 (= (+!3108 (+!3108 lt!438956 lt!438952) lt!438955) (+!3108 (+!3108 lt!438956 lt!438955) lt!438952))))

(declare-fun lt!438953 () V!35977)

(assert (=> b!989740 (= lt!438955 (tuple2!14901 (select (arr!30098 _keys!1544) from!1932) lt!438953))))

(assert (=> b!989740 (= lt!438952 (tuple2!14901 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32812 0))(
  ( (Unit!32813) )
))
(declare-fun lt!438954 () Unit!32812)

(declare-fun addCommutativeForDiffKeys!710 (ListLongMap!13599 (_ BitVec 64) V!35977 (_ BitVec 64) V!35977) Unit!32812)

(assert (=> b!989740 (= lt!438954 (addCommutativeForDiffKeys!710 lt!438956 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30098 _keys!1544) from!1932) lt!438953))))

(declare-fun b!989741 () Bool)

(declare-fun res!661699 () Bool)

(declare-fun e!558169 () Bool)

(assert (=> b!989741 (=> (not res!661699) (not e!558169))))

(assert (=> b!989741 (= res!661699 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30578 _keys!1544))))))

(declare-fun b!989742 () Bool)

(declare-fun e!558172 () Bool)

(declare-fun e!558171 () Bool)

(declare-fun mapRes!36909 () Bool)

(assert (=> b!989742 (= e!558172 (and e!558171 mapRes!36909))))

(declare-fun condMapEmpty!36909 () Bool)

(declare-fun mapDefault!36909 () ValueCell!11141)

(assert (=> b!989742 (= condMapEmpty!36909 (= (arr!30097 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11141)) mapDefault!36909)))))

(declare-fun b!989743 () Bool)

(declare-fun res!661700 () Bool)

(assert (=> b!989743 (=> (not res!661700) (not e!558169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989743 (= res!661700 (validKeyInArray!0 (select (arr!30098 _keys!1544) from!1932)))))

(declare-fun b!989744 () Bool)

(declare-fun res!661701 () Bool)

(assert (=> b!989744 (=> (not res!661701) (not e!558169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62498 (_ BitVec 32)) Bool)

(assert (=> b!989744 (= res!661701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989745 () Bool)

(declare-fun tp_is_empty!23245 () Bool)

(assert (=> b!989745 (= e!558171 tp_is_empty!23245)))

(declare-fun b!989746 () Bool)

(declare-fun res!661703 () Bool)

(assert (=> b!989746 (=> (not res!661703) (not e!558169))))

(assert (=> b!989746 (= res!661703 (and (= (size!30577 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30578 _keys!1544) (size!30577 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989747 () Bool)

(declare-fun e!558168 () Bool)

(assert (=> b!989747 (= e!558168 tp_is_empty!23245)))

(declare-fun b!989748 () Bool)

(declare-fun res!661696 () Bool)

(assert (=> b!989748 (=> (not res!661696) (not e!558169))))

(assert (=> b!989748 (= res!661696 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!661702 () Bool)

(assert (=> start!84716 (=> (not res!661702) (not e!558169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84716 (= res!661702 (validMask!0 mask!1948))))

(assert (=> start!84716 e!558169))

(assert (=> start!84716 true))

(assert (=> start!84716 tp_is_empty!23245))

(declare-fun array_inv!23277 (array!62496) Bool)

(assert (=> start!84716 (and (array_inv!23277 _values!1278) e!558172)))

(assert (=> start!84716 tp!69876))

(declare-fun array_inv!23278 (array!62498) Bool)

(assert (=> start!84716 (array_inv!23278 _keys!1544)))

(declare-fun mapNonEmpty!36909 () Bool)

(declare-fun tp!69875 () Bool)

(assert (=> mapNonEmpty!36909 (= mapRes!36909 (and tp!69875 e!558168))))

(declare-fun mapValue!36909 () ValueCell!11141)

(declare-fun mapKey!36909 () (_ BitVec 32))

(declare-fun mapRest!36909 () (Array (_ BitVec 32) ValueCell!11141))

(assert (=> mapNonEmpty!36909 (= (arr!30097 _values!1278) (store mapRest!36909 mapKey!36909 mapValue!36909))))

(declare-fun b!989749 () Bool)

(declare-fun res!661697 () Bool)

(assert (=> b!989749 (=> (not res!661697) (not e!558169))))

(declare-datatypes ((List!20806 0))(
  ( (Nil!20803) (Cons!20802 (h!21970 (_ BitVec 64)) (t!29739 List!20806)) )
))
(declare-fun arrayNoDuplicates!0 (array!62498 (_ BitVec 32) List!20806) Bool)

(assert (=> b!989749 (= res!661697 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20803))))

(declare-fun mapIsEmpty!36909 () Bool)

(assert (=> mapIsEmpty!36909 mapRes!36909))

(declare-fun b!989750 () Bool)

(assert (=> b!989750 (= e!558169 e!558170)))

(declare-fun res!661698 () Bool)

(assert (=> b!989750 (=> (not res!661698) (not e!558170))))

(assert (=> b!989750 (= res!661698 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30098 _keys!1544) from!1932))))))

(declare-fun get!15643 (ValueCell!11141 V!35977) V!35977)

(declare-fun dynLambda!1891 (Int (_ BitVec 64)) V!35977)

(assert (=> b!989750 (= lt!438953 (get!15643 (select (arr!30097 _values!1278) from!1932) (dynLambda!1891 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3543 (array!62498 array!62496 (_ BitVec 32) (_ BitVec 32) V!35977 V!35977 (_ BitVec 32) Int) ListLongMap!13599)

(assert (=> b!989750 (= lt!438956 (getCurrentListMapNoExtraKeys!3543 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (= (and start!84716 res!661702) b!989746))

(assert (= (and b!989746 res!661703) b!989744))

(assert (= (and b!989744 res!661701) b!989749))

(assert (= (and b!989749 res!661697) b!989741))

(assert (= (and b!989741 res!661699) b!989743))

(assert (= (and b!989743 res!661700) b!989748))

(assert (= (and b!989748 res!661696) b!989750))

(assert (= (and b!989750 res!661698) b!989740))

(assert (= (and b!989742 condMapEmpty!36909) mapIsEmpty!36909))

(assert (= (and b!989742 (not condMapEmpty!36909)) mapNonEmpty!36909))

(get-info :version)

(assert (= (and mapNonEmpty!36909 ((_ is ValueCellFull!11141) mapValue!36909)) b!989747))

(assert (= (and b!989742 ((_ is ValueCellFull!11141) mapDefault!36909)) b!989745))

(assert (= start!84716 b!989742))

(declare-fun b_lambda!15099 () Bool)

(assert (=> (not b_lambda!15099) (not b!989750)))

(declare-fun t!29737 () Bool)

(declare-fun tb!6783 () Bool)

(assert (=> (and start!84716 (= defaultEntry!1281 defaultEntry!1281) t!29737) tb!6783))

(declare-fun result!13571 () Bool)

(assert (=> tb!6783 (= result!13571 tp_is_empty!23245)))

(assert (=> b!989750 t!29737))

(declare-fun b_and!32139 () Bool)

(assert (= b_and!32137 (and (=> t!29737 result!13571) b_and!32139)))

(declare-fun m!917237 () Bool)

(assert (=> b!989740 m!917237))

(declare-fun m!917239 () Bool)

(assert (=> b!989740 m!917239))

(declare-fun m!917241 () Bool)

(assert (=> b!989740 m!917241))

(declare-fun m!917243 () Bool)

(assert (=> b!989740 m!917243))

(declare-fun m!917245 () Bool)

(assert (=> b!989740 m!917245))

(assert (=> b!989740 m!917239))

(declare-fun m!917247 () Bool)

(assert (=> b!989740 m!917247))

(assert (=> b!989740 m!917243))

(assert (=> b!989740 m!917237))

(declare-fun m!917249 () Bool)

(assert (=> b!989740 m!917249))

(declare-fun m!917251 () Bool)

(assert (=> b!989749 m!917251))

(declare-fun m!917253 () Bool)

(assert (=> start!84716 m!917253))

(declare-fun m!917255 () Bool)

(assert (=> start!84716 m!917255))

(declare-fun m!917257 () Bool)

(assert (=> start!84716 m!917257))

(assert (=> b!989743 m!917237))

(assert (=> b!989743 m!917237))

(declare-fun m!917259 () Bool)

(assert (=> b!989743 m!917259))

(declare-fun m!917261 () Bool)

(assert (=> b!989744 m!917261))

(declare-fun m!917263 () Bool)

(assert (=> mapNonEmpty!36909 m!917263))

(assert (=> b!989750 m!917237))

(declare-fun m!917265 () Bool)

(assert (=> b!989750 m!917265))

(declare-fun m!917267 () Bool)

(assert (=> b!989750 m!917267))

(declare-fun m!917269 () Bool)

(assert (=> b!989750 m!917269))

(assert (=> b!989750 m!917265))

(assert (=> b!989750 m!917269))

(declare-fun m!917271 () Bool)

(assert (=> b!989750 m!917271))

(check-sat (not b!989744) (not start!84716) b_and!32139 tp_is_empty!23245 (not b!989749) (not b_lambda!15099) (not b_next!20029) (not b!989743) (not mapNonEmpty!36909) (not b!989740) (not b!989750))
(check-sat b_and!32139 (not b_next!20029))
