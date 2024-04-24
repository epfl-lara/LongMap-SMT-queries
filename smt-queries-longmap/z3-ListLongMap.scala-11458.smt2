; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133958 () Bool)

(assert start!133958)

(declare-fun b_free!31963 () Bool)

(declare-fun b_next!31963 () Bool)

(assert (=> start!133958 (= b_free!31963 (not b_next!31963))))

(declare-fun tp!113012 () Bool)

(declare-fun b_and!51439 () Bool)

(assert (=> start!133958 (= tp!113012 b_and!51439)))

(declare-fun b!1563675 () Bool)

(declare-fun e!871558 () Bool)

(declare-fun tp_is_empty!38629 () Bool)

(assert (=> b!1563675 (= e!871558 tp_is_empty!38629)))

(declare-fun b!1563676 () Bool)

(declare-fun e!871557 () Bool)

(assert (=> b!1563676 (= e!871557 (not true))))

(declare-datatypes ((V!59713 0))(
  ( (V!59714 (val!19398 Int)) )
))
(declare-datatypes ((tuple2!25114 0))(
  ( (tuple2!25115 (_1!12568 (_ BitVec 64)) (_2!12568 V!59713)) )
))
(declare-datatypes ((List!36453 0))(
  ( (Nil!36450) (Cons!36449 (h!37913 tuple2!25114) (t!51198 List!36453)) )
))
(declare-datatypes ((ListLongMap!22557 0))(
  ( (ListLongMap!22558 (toList!11294 List!36453)) )
))
(declare-fun lt!672057 () ListLongMap!22557)

(declare-datatypes ((array!104092 0))(
  ( (array!104093 (arr!50231 (Array (_ BitVec 32) (_ BitVec 64))) (size!50782 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104092)

(declare-fun lt!672058 () V!59713)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun contains!10295 (ListLongMap!22557 (_ BitVec 64)) Bool)

(declare-fun +!5070 (ListLongMap!22557 tuple2!25114) ListLongMap!22557)

(assert (=> b!1563676 (not (contains!10295 (+!5070 lt!672057 (tuple2!25115 (select (arr!50231 _keys!637) from!782) lt!672058)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51825 0))(
  ( (Unit!51826) )
))
(declare-fun lt!672059 () Unit!51825)

(declare-fun addStillNotContains!521 (ListLongMap!22557 (_ BitVec 64) V!59713 (_ BitVec 64)) Unit!51825)

(assert (=> b!1563676 (= lt!672059 (addStillNotContains!521 lt!672057 (select (arr!50231 _keys!637) from!782) lt!672058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18284 0))(
  ( (ValueCellFull!18284 (v!22142 V!59713)) (EmptyCell!18284) )
))
(declare-datatypes ((array!104094 0))(
  ( (array!104095 (arr!50232 (Array (_ BitVec 32) ValueCell!18284)) (size!50783 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104094)

(declare-fun get!26236 (ValueCell!18284 V!59713) V!59713)

(declare-fun dynLambda!3868 (Int (_ BitVec 64)) V!59713)

(assert (=> b!1563676 (= lt!672058 (get!26236 (select (arr!50232 _values!487) from!782) (dynLambda!3868 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59713)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59713)

(declare-fun getCurrentListMapNoExtraKeys!6693 (array!104092 array!104094 (_ BitVec 32) (_ BitVec 32) V!59713 V!59713 (_ BitVec 32) Int) ListLongMap!22557)

(assert (=> b!1563676 (= lt!672057 (getCurrentListMapNoExtraKeys!6693 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563677 () Bool)

(declare-fun res!1068364 () Bool)

(assert (=> b!1563677 (=> (not res!1068364) (not e!871557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563677 (= res!1068364 (validKeyInArray!0 (select (arr!50231 _keys!637) from!782)))))

(declare-fun res!1068365 () Bool)

(assert (=> start!133958 (=> (not res!1068365) (not e!871557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133958 (= res!1068365 (validMask!0 mask!947))))

(assert (=> start!133958 e!871557))

(assert (=> start!133958 tp!113012))

(assert (=> start!133958 tp_is_empty!38629))

(assert (=> start!133958 true))

(declare-fun array_inv!39289 (array!104092) Bool)

(assert (=> start!133958 (array_inv!39289 _keys!637)))

(declare-fun e!871554 () Bool)

(declare-fun array_inv!39290 (array!104094) Bool)

(assert (=> start!133958 (and (array_inv!39290 _values!487) e!871554)))

(declare-fun b!1563678 () Bool)

(declare-fun res!1068363 () Bool)

(assert (=> b!1563678 (=> (not res!1068363) (not e!871557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104092 (_ BitVec 32)) Bool)

(assert (=> b!1563678 (= res!1068363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59319 () Bool)

(declare-fun mapRes!59319 () Bool)

(assert (=> mapIsEmpty!59319 mapRes!59319))

(declare-fun b!1563679 () Bool)

(declare-fun res!1068362 () Bool)

(assert (=> b!1563679 (=> (not res!1068362) (not e!871557))))

(declare-datatypes ((List!36454 0))(
  ( (Nil!36451) (Cons!36450 (h!37914 (_ BitVec 64)) (t!51199 List!36454)) )
))
(declare-fun arrayNoDuplicates!0 (array!104092 (_ BitVec 32) List!36454) Bool)

(assert (=> b!1563679 (= res!1068362 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36451))))

(declare-fun mapNonEmpty!59319 () Bool)

(declare-fun tp!113013 () Bool)

(assert (=> mapNonEmpty!59319 (= mapRes!59319 (and tp!113013 e!871558))))

(declare-fun mapKey!59319 () (_ BitVec 32))

(declare-fun mapValue!59319 () ValueCell!18284)

(declare-fun mapRest!59319 () (Array (_ BitVec 32) ValueCell!18284))

(assert (=> mapNonEmpty!59319 (= (arr!50232 _values!487) (store mapRest!59319 mapKey!59319 mapValue!59319))))

(declare-fun b!1563680 () Bool)

(declare-fun e!871555 () Bool)

(assert (=> b!1563680 (= e!871554 (and e!871555 mapRes!59319))))

(declare-fun condMapEmpty!59319 () Bool)

(declare-fun mapDefault!59319 () ValueCell!18284)

(assert (=> b!1563680 (= condMapEmpty!59319 (= (arr!50232 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18284)) mapDefault!59319)))))

(declare-fun b!1563681 () Bool)

(declare-fun res!1068361 () Bool)

(assert (=> b!1563681 (=> (not res!1068361) (not e!871557))))

(assert (=> b!1563681 (= res!1068361 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50782 _keys!637)) (bvslt from!782 (size!50782 _keys!637))))))

(declare-fun b!1563682 () Bool)

(declare-fun res!1068360 () Bool)

(assert (=> b!1563682 (=> (not res!1068360) (not e!871557))))

(assert (=> b!1563682 (= res!1068360 (and (= (size!50783 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50782 _keys!637) (size!50783 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1563683 () Bool)

(assert (=> b!1563683 (= e!871555 tp_is_empty!38629)))

(assert (= (and start!133958 res!1068365) b!1563682))

(assert (= (and b!1563682 res!1068360) b!1563678))

(assert (= (and b!1563678 res!1068363) b!1563679))

(assert (= (and b!1563679 res!1068362) b!1563681))

(assert (= (and b!1563681 res!1068361) b!1563677))

(assert (= (and b!1563677 res!1068364) b!1563676))

(assert (= (and b!1563680 condMapEmpty!59319) mapIsEmpty!59319))

(assert (= (and b!1563680 (not condMapEmpty!59319)) mapNonEmpty!59319))

(get-info :version)

(assert (= (and mapNonEmpty!59319 ((_ is ValueCellFull!18284) mapValue!59319)) b!1563675))

(assert (= (and b!1563680 ((_ is ValueCellFull!18284) mapDefault!59319)) b!1563683))

(assert (= start!133958 b!1563680))

(declare-fun b_lambda!24831 () Bool)

(assert (=> (not b_lambda!24831) (not b!1563676)))

(declare-fun t!51197 () Bool)

(declare-fun tb!12499 () Bool)

(assert (=> (and start!133958 (= defaultEntry!495 defaultEntry!495) t!51197) tb!12499))

(declare-fun result!26287 () Bool)

(assert (=> tb!12499 (= result!26287 tp_is_empty!38629)))

(assert (=> b!1563676 t!51197))

(declare-fun b_and!51441 () Bool)

(assert (= b_and!51439 (and (=> t!51197 result!26287) b_and!51441)))

(declare-fun m!1439169 () Bool)

(assert (=> mapNonEmpty!59319 m!1439169))

(declare-fun m!1439171 () Bool)

(assert (=> start!133958 m!1439171))

(declare-fun m!1439173 () Bool)

(assert (=> start!133958 m!1439173))

(declare-fun m!1439175 () Bool)

(assert (=> start!133958 m!1439175))

(declare-fun m!1439177 () Bool)

(assert (=> b!1563676 m!1439177))

(declare-fun m!1439179 () Bool)

(assert (=> b!1563676 m!1439179))

(declare-fun m!1439181 () Bool)

(assert (=> b!1563676 m!1439181))

(declare-fun m!1439183 () Bool)

(assert (=> b!1563676 m!1439183))

(declare-fun m!1439185 () Bool)

(assert (=> b!1563676 m!1439185))

(assert (=> b!1563676 m!1439177))

(declare-fun m!1439187 () Bool)

(assert (=> b!1563676 m!1439187))

(assert (=> b!1563676 m!1439179))

(assert (=> b!1563676 m!1439187))

(declare-fun m!1439189 () Bool)

(assert (=> b!1563676 m!1439189))

(assert (=> b!1563676 m!1439183))

(declare-fun m!1439191 () Bool)

(assert (=> b!1563676 m!1439191))

(declare-fun m!1439193 () Bool)

(assert (=> b!1563678 m!1439193))

(declare-fun m!1439195 () Bool)

(assert (=> b!1563679 m!1439195))

(assert (=> b!1563677 m!1439187))

(assert (=> b!1563677 m!1439187))

(declare-fun m!1439197 () Bool)

(assert (=> b!1563677 m!1439197))

(check-sat (not start!133958) (not b!1563677) (not b_lambda!24831) (not b!1563676) (not b!1563679) tp_is_empty!38629 (not b_next!31963) b_and!51441 (not mapNonEmpty!59319) (not b!1563678))
(check-sat b_and!51441 (not b_next!31963))
