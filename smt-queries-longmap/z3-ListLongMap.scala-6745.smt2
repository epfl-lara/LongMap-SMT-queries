; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84530 () Bool)

(assert start!84530)

(declare-fun b_free!20029 () Bool)

(declare-fun b_next!20029 () Bool)

(assert (=> start!84530 (= b_free!20029 (not b_next!20029))))

(declare-fun tp!69876 () Bool)

(declare-fun b_and!32101 () Bool)

(assert (=> start!84530 (= tp!69876 b_and!32101)))

(declare-fun b!988598 () Bool)

(declare-fun res!661242 () Bool)

(declare-fun e!557442 () Bool)

(assert (=> b!988598 (=> (not res!661242) (not e!557442))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62384 0))(
  ( (array!62385 (arr!30046 (Array (_ BitVec 32) (_ BitVec 64))) (size!30527 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62384)

(assert (=> b!988598 (= res!661242 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30527 _keys!1544))))))

(declare-fun b!988599 () Bool)

(declare-fun e!557441 () Bool)

(assert (=> b!988599 (= e!557442 e!557441)))

(declare-fun res!661243 () Bool)

(assert (=> b!988599 (=> (not res!661243) (not e!557441))))

(assert (=> b!988599 (= res!661243 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30046 _keys!1544) from!1932))))))

(declare-datatypes ((V!35977 0))(
  ( (V!35978 (val!11673 Int)) )
))
(declare-datatypes ((ValueCell!11141 0))(
  ( (ValueCellFull!11141 (v!14239 V!35977)) (EmptyCell!11141) )
))
(declare-datatypes ((array!62386 0))(
  ( (array!62387 (arr!30047 (Array (_ BitVec 32) ValueCell!11141)) (size!30528 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62386)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!438354 () V!35977)

(declare-fun get!15606 (ValueCell!11141 V!35977) V!35977)

(declare-fun dynLambda!1853 (Int (_ BitVec 64)) V!35977)

(assert (=> b!988599 (= lt!438354 (get!15606 (select (arr!30047 _values!1278) from!1932) (dynLambda!1853 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14954 0))(
  ( (tuple2!14955 (_1!7488 (_ BitVec 64)) (_2!7488 V!35977)) )
))
(declare-datatypes ((List!20842 0))(
  ( (Nil!20839) (Cons!20838 (h!22000 tuple2!14954) (t!29774 List!20842)) )
))
(declare-datatypes ((ListLongMap!13641 0))(
  ( (ListLongMap!13642 (toList!6836 List!20842)) )
))
(declare-fun lt!438359 () ListLongMap!13641)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35977)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35977)

(declare-fun getCurrentListMapNoExtraKeys!3539 (array!62384 array!62386 (_ BitVec 32) (_ BitVec 32) V!35977 V!35977 (_ BitVec 32) Int) ListLongMap!13641)

(assert (=> b!988599 (= lt!438359 (getCurrentListMapNoExtraKeys!3539 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988600 () Bool)

(declare-fun res!661247 () Bool)

(assert (=> b!988600 (=> (not res!661247) (not e!557442))))

(assert (=> b!988600 (= res!661247 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36909 () Bool)

(declare-fun mapRes!36909 () Bool)

(assert (=> mapIsEmpty!36909 mapRes!36909))

(declare-fun b!988601 () Bool)

(declare-fun e!557438 () Bool)

(declare-fun e!557437 () Bool)

(assert (=> b!988601 (= e!557438 (and e!557437 mapRes!36909))))

(declare-fun condMapEmpty!36909 () Bool)

(declare-fun mapDefault!36909 () ValueCell!11141)

(assert (=> b!988601 (= condMapEmpty!36909 (= (arr!30047 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11141)) mapDefault!36909)))))

(declare-fun b!988602 () Bool)

(assert (=> b!988602 (= e!557441 (not true))))

(declare-fun lt!438357 () ListLongMap!13641)

(declare-fun getCurrentListMap!3813 (array!62384 array!62386 (_ BitVec 32) (_ BitVec 32) V!35977 V!35977 (_ BitVec 32) Int) ListLongMap!13641)

(assert (=> b!988602 (= lt!438357 (getCurrentListMap!3813 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438356 () tuple2!14954)

(declare-fun lt!438358 () tuple2!14954)

(declare-fun +!3105 (ListLongMap!13641 tuple2!14954) ListLongMap!13641)

(assert (=> b!988602 (= (+!3105 (+!3105 lt!438359 lt!438356) lt!438358) (+!3105 (+!3105 lt!438359 lt!438358) lt!438356))))

(assert (=> b!988602 (= lt!438358 (tuple2!14955 (select (arr!30046 _keys!1544) from!1932) lt!438354))))

(assert (=> b!988602 (= lt!438356 (tuple2!14955 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32684 0))(
  ( (Unit!32685) )
))
(declare-fun lt!438355 () Unit!32684)

(declare-fun addCommutativeForDiffKeys!700 (ListLongMap!13641 (_ BitVec 64) V!35977 (_ BitVec 64) V!35977) Unit!32684)

(assert (=> b!988602 (= lt!438355 (addCommutativeForDiffKeys!700 lt!438359 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30046 _keys!1544) from!1932) lt!438354))))

(declare-fun b!988603 () Bool)

(declare-fun res!661248 () Bool)

(assert (=> b!988603 (=> (not res!661248) (not e!557442))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988603 (= res!661248 (validKeyInArray!0 (select (arr!30046 _keys!1544) from!1932)))))

(declare-fun b!988604 () Bool)

(declare-fun res!661246 () Bool)

(assert (=> b!988604 (=> (not res!661246) (not e!557442))))

(declare-datatypes ((List!20843 0))(
  ( (Nil!20840) (Cons!20839 (h!22001 (_ BitVec 64)) (t!29775 List!20843)) )
))
(declare-fun arrayNoDuplicates!0 (array!62384 (_ BitVec 32) List!20843) Bool)

(assert (=> b!988604 (= res!661246 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20840))))

(declare-fun b!988605 () Bool)

(declare-fun res!661244 () Bool)

(assert (=> b!988605 (=> (not res!661244) (not e!557442))))

(assert (=> b!988605 (= res!661244 (and (= (size!30528 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30527 _keys!1544) (size!30528 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988606 () Bool)

(declare-fun e!557439 () Bool)

(declare-fun tp_is_empty!23245 () Bool)

(assert (=> b!988606 (= e!557439 tp_is_empty!23245)))

(declare-fun b!988607 () Bool)

(declare-fun res!661249 () Bool)

(assert (=> b!988607 (=> (not res!661249) (not e!557442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62384 (_ BitVec 32)) Bool)

(assert (=> b!988607 (= res!661249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988608 () Bool)

(assert (=> b!988608 (= e!557437 tp_is_empty!23245)))

(declare-fun res!661245 () Bool)

(assert (=> start!84530 (=> (not res!661245) (not e!557442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84530 (= res!661245 (validMask!0 mask!1948))))

(assert (=> start!84530 e!557442))

(assert (=> start!84530 true))

(assert (=> start!84530 tp_is_empty!23245))

(declare-fun array_inv!23221 (array!62386) Bool)

(assert (=> start!84530 (and (array_inv!23221 _values!1278) e!557438)))

(assert (=> start!84530 tp!69876))

(declare-fun array_inv!23222 (array!62384) Bool)

(assert (=> start!84530 (array_inv!23222 _keys!1544)))

(declare-fun mapNonEmpty!36909 () Bool)

(declare-fun tp!69875 () Bool)

(assert (=> mapNonEmpty!36909 (= mapRes!36909 (and tp!69875 e!557439))))

(declare-fun mapRest!36909 () (Array (_ BitVec 32) ValueCell!11141))

(declare-fun mapValue!36909 () ValueCell!11141)

(declare-fun mapKey!36909 () (_ BitVec 32))

(assert (=> mapNonEmpty!36909 (= (arr!30047 _values!1278) (store mapRest!36909 mapKey!36909 mapValue!36909))))

(assert (= (and start!84530 res!661245) b!988605))

(assert (= (and b!988605 res!661244) b!988607))

(assert (= (and b!988607 res!661249) b!988604))

(assert (= (and b!988604 res!661246) b!988598))

(assert (= (and b!988598 res!661242) b!988603))

(assert (= (and b!988603 res!661248) b!988600))

(assert (= (and b!988600 res!661247) b!988599))

(assert (= (and b!988599 res!661243) b!988602))

(assert (= (and b!988601 condMapEmpty!36909) mapIsEmpty!36909))

(assert (= (and b!988601 (not condMapEmpty!36909)) mapNonEmpty!36909))

(get-info :version)

(assert (= (and mapNonEmpty!36909 ((_ is ValueCellFull!11141) mapValue!36909)) b!988606))

(assert (= (and b!988601 ((_ is ValueCellFull!11141) mapDefault!36909)) b!988608))

(assert (= start!84530 b!988601))

(declare-fun b_lambda!15067 () Bool)

(assert (=> (not b_lambda!15067) (not b!988599)))

(declare-fun t!29773 () Bool)

(declare-fun tb!6783 () Bool)

(assert (=> (and start!84530 (= defaultEntry!1281 defaultEntry!1281) t!29773) tb!6783))

(declare-fun result!13571 () Bool)

(assert (=> tb!6783 (= result!13571 tp_is_empty!23245)))

(assert (=> b!988599 t!29773))

(declare-fun b_and!32103 () Bool)

(assert (= b_and!32101 (and (=> t!29773 result!13571) b_and!32103)))

(declare-fun m!915185 () Bool)

(assert (=> mapNonEmpty!36909 m!915185))

(declare-fun m!915187 () Bool)

(assert (=> b!988607 m!915187))

(declare-fun m!915189 () Bool)

(assert (=> b!988599 m!915189))

(declare-fun m!915191 () Bool)

(assert (=> b!988599 m!915191))

(declare-fun m!915193 () Bool)

(assert (=> b!988599 m!915193))

(declare-fun m!915195 () Bool)

(assert (=> b!988599 m!915195))

(assert (=> b!988599 m!915191))

(assert (=> b!988599 m!915195))

(declare-fun m!915197 () Bool)

(assert (=> b!988599 m!915197))

(declare-fun m!915199 () Bool)

(assert (=> b!988604 m!915199))

(assert (=> b!988603 m!915189))

(assert (=> b!988603 m!915189))

(declare-fun m!915201 () Bool)

(assert (=> b!988603 m!915201))

(declare-fun m!915203 () Bool)

(assert (=> start!84530 m!915203))

(declare-fun m!915205 () Bool)

(assert (=> start!84530 m!915205))

(declare-fun m!915207 () Bool)

(assert (=> start!84530 m!915207))

(assert (=> b!988602 m!915189))

(declare-fun m!915209 () Bool)

(assert (=> b!988602 m!915209))

(declare-fun m!915211 () Bool)

(assert (=> b!988602 m!915211))

(declare-fun m!915213 () Bool)

(assert (=> b!988602 m!915213))

(declare-fun m!915215 () Bool)

(assert (=> b!988602 m!915215))

(declare-fun m!915217 () Bool)

(assert (=> b!988602 m!915217))

(assert (=> b!988602 m!915213))

(declare-fun m!915219 () Bool)

(assert (=> b!988602 m!915219))

(assert (=> b!988602 m!915215))

(assert (=> b!988602 m!915189))

(check-sat (not b_lambda!15067) (not b!988604) (not mapNonEmpty!36909) (not b!988599) tp_is_empty!23245 (not b_next!20029) (not b!988603) (not b!988607) (not start!84530) (not b!988602) b_and!32103)
(check-sat b_and!32103 (not b_next!20029))
