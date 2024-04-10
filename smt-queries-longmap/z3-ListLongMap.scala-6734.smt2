; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84378 () Bool)

(assert start!84378)

(declare-fun b_free!19965 () Bool)

(declare-fun b_next!19965 () Bool)

(assert (=> start!84378 (= b_free!19965 (not b_next!19965))))

(declare-fun tp!69670 () Bool)

(declare-fun b_and!31999 () Bool)

(assert (=> start!84378 (= tp!69670 b_and!31999)))

(declare-fun b!986985 () Bool)

(declare-fun res!660311 () Bool)

(declare-fun e!556571 () Bool)

(assert (=> b!986985 (=> (not res!660311) (not e!556571))))

(declare-datatypes ((array!62319 0))(
  ( (array!62320 (arr!30017 (Array (_ BitVec 32) (_ BitVec 64))) (size!30496 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62319)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986985 (= res!660311 (validKeyInArray!0 (select (arr!30017 _keys!1544) from!1932)))))

(declare-fun b!986986 () Bool)

(declare-fun res!660307 () Bool)

(assert (=> b!986986 (=> (not res!660307) (not e!556571))))

(declare-datatypes ((List!20758 0))(
  ( (Nil!20755) (Cons!20754 (h!21916 (_ BitVec 64)) (t!29657 List!20758)) )
))
(declare-fun arrayNoDuplicates!0 (array!62319 (_ BitVec 32) List!20758) Bool)

(assert (=> b!986986 (= res!660307 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20755))))

(declare-fun b!986987 () Bool)

(declare-datatypes ((V!35891 0))(
  ( (V!35892 (val!11641 Int)) )
))
(declare-datatypes ((ValueCell!11109 0))(
  ( (ValueCellFull!11109 (v!14203 V!35891)) (EmptyCell!11109) )
))
(declare-datatypes ((array!62321 0))(
  ( (array!62322 (arr!30018 (Array (_ BitVec 32) ValueCell!11109)) (size!30497 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62321)

(assert (=> b!986987 (= e!556571 (bvsge from!1932 (size!30497 _values!1278)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35891)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35891)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14828 0))(
  ( (tuple2!14829 (_1!7425 (_ BitVec 64)) (_2!7425 V!35891)) )
))
(declare-datatypes ((List!20759 0))(
  ( (Nil!20756) (Cons!20755 (h!21917 tuple2!14828) (t!29658 List!20759)) )
))
(declare-datatypes ((ListLongMap!13525 0))(
  ( (ListLongMap!13526 (toList!6778 List!20759)) )
))
(declare-fun lt!437567 () ListLongMap!13525)

(declare-fun +!3063 (ListLongMap!13525 tuple2!14828) ListLongMap!13525)

(declare-fun getCurrentListMapNoExtraKeys!3469 (array!62319 array!62321 (_ BitVec 32) (_ BitVec 32) V!35891 V!35891 (_ BitVec 32) Int) ListLongMap!13525)

(assert (=> b!986987 (= lt!437567 (+!3063 (getCurrentListMapNoExtraKeys!3469 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14829 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!986988 () Bool)

(declare-fun res!660309 () Bool)

(assert (=> b!986988 (=> (not res!660309) (not e!556571))))

(assert (=> b!986988 (= res!660309 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30496 _keys!1544))))))

(declare-fun b!986989 () Bool)

(declare-fun res!660306 () Bool)

(assert (=> b!986989 (=> (not res!660306) (not e!556571))))

(assert (=> b!986989 (= res!660306 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!986990 () Bool)

(declare-fun res!660310 () Bool)

(assert (=> b!986990 (=> (not res!660310) (not e!556571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62319 (_ BitVec 32)) Bool)

(assert (=> b!986990 (= res!660310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986991 () Bool)

(declare-fun e!556569 () Bool)

(declare-fun tp_is_empty!23181 () Bool)

(assert (=> b!986991 (= e!556569 tp_is_empty!23181)))

(declare-fun res!660308 () Bool)

(assert (=> start!84378 (=> (not res!660308) (not e!556571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84378 (= res!660308 (validMask!0 mask!1948))))

(assert (=> start!84378 e!556571))

(assert (=> start!84378 true))

(assert (=> start!84378 tp_is_empty!23181))

(declare-fun e!556568 () Bool)

(declare-fun array_inv!23195 (array!62321) Bool)

(assert (=> start!84378 (and (array_inv!23195 _values!1278) e!556568)))

(assert (=> start!84378 tp!69670))

(declare-fun array_inv!23196 (array!62319) Bool)

(assert (=> start!84378 (array_inv!23196 _keys!1544)))

(declare-fun b!986992 () Bool)

(declare-fun res!660305 () Bool)

(assert (=> b!986992 (=> (not res!660305) (not e!556571))))

(assert (=> b!986992 (= res!660305 (and (= (size!30497 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30496 _keys!1544) (size!30497 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36800 () Bool)

(declare-fun mapRes!36800 () Bool)

(declare-fun tp!69669 () Bool)

(assert (=> mapNonEmpty!36800 (= mapRes!36800 (and tp!69669 e!556569))))

(declare-fun mapRest!36800 () (Array (_ BitVec 32) ValueCell!11109))

(declare-fun mapValue!36800 () ValueCell!11109)

(declare-fun mapKey!36800 () (_ BitVec 32))

(assert (=> mapNonEmpty!36800 (= (arr!30018 _values!1278) (store mapRest!36800 mapKey!36800 mapValue!36800))))

(declare-fun b!986993 () Bool)

(declare-fun e!556572 () Bool)

(assert (=> b!986993 (= e!556572 tp_is_empty!23181)))

(declare-fun mapIsEmpty!36800 () Bool)

(assert (=> mapIsEmpty!36800 mapRes!36800))

(declare-fun b!986994 () Bool)

(assert (=> b!986994 (= e!556568 (and e!556572 mapRes!36800))))

(declare-fun condMapEmpty!36800 () Bool)

(declare-fun mapDefault!36800 () ValueCell!11109)

(assert (=> b!986994 (= condMapEmpty!36800 (= (arr!30018 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11109)) mapDefault!36800)))))

(assert (= (and start!84378 res!660308) b!986992))

(assert (= (and b!986992 res!660305) b!986990))

(assert (= (and b!986990 res!660310) b!986986))

(assert (= (and b!986986 res!660307) b!986988))

(assert (= (and b!986988 res!660309) b!986985))

(assert (= (and b!986985 res!660311) b!986989))

(assert (= (and b!986989 res!660306) b!986987))

(assert (= (and b!986994 condMapEmpty!36800) mapIsEmpty!36800))

(assert (= (and b!986994 (not condMapEmpty!36800)) mapNonEmpty!36800))

(get-info :version)

(assert (= (and mapNonEmpty!36800 ((_ is ValueCellFull!11109) mapValue!36800)) b!986991))

(assert (= (and b!986994 ((_ is ValueCellFull!11109) mapDefault!36800)) b!986993))

(assert (= start!84378 b!986994))

(declare-fun m!913623 () Bool)

(assert (=> b!986985 m!913623))

(assert (=> b!986985 m!913623))

(declare-fun m!913625 () Bool)

(assert (=> b!986985 m!913625))

(declare-fun m!913627 () Bool)

(assert (=> b!986987 m!913627))

(assert (=> b!986987 m!913627))

(declare-fun m!913629 () Bool)

(assert (=> b!986987 m!913629))

(declare-fun m!913631 () Bool)

(assert (=> b!986986 m!913631))

(declare-fun m!913633 () Bool)

(assert (=> start!84378 m!913633))

(declare-fun m!913635 () Bool)

(assert (=> start!84378 m!913635))

(declare-fun m!913637 () Bool)

(assert (=> start!84378 m!913637))

(declare-fun m!913639 () Bool)

(assert (=> mapNonEmpty!36800 m!913639))

(declare-fun m!913641 () Bool)

(assert (=> b!986990 m!913641))

(check-sat (not b_next!19965) (not b!986986) (not start!84378) (not b!986990) (not b!986987) (not mapNonEmpty!36800) (not b!986985) tp_is_empty!23181 b_and!31999)
(check-sat b_and!31999 (not b_next!19965))
