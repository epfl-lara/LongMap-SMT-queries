; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133596 () Bool)

(assert start!133596)

(declare-fun b_free!32013 () Bool)

(declare-fun b_next!32013 () Bool)

(assert (=> start!133596 (= b_free!32013 (not b_next!32013))))

(declare-fun tp!113163 () Bool)

(declare-fun b_and!51537 () Bool)

(assert (=> start!133596 (= tp!113163 b_and!51537)))

(declare-fun b!1561973 () Bool)

(declare-fun e!870433 () Bool)

(assert (=> b!1561973 (= e!870433 (not true))))

(declare-fun lt!671420 () Bool)

(declare-datatypes ((V!59779 0))(
  ( (V!59780 (val!19423 Int)) )
))
(declare-datatypes ((tuple2!25092 0))(
  ( (tuple2!25093 (_1!12557 (_ BitVec 64)) (_2!12557 V!59779)) )
))
(declare-datatypes ((List!36464 0))(
  ( (Nil!36461) (Cons!36460 (h!37906 tuple2!25092) (t!51267 List!36464)) )
))
(declare-datatypes ((ListLongMap!22527 0))(
  ( (ListLongMap!22528 (toList!11279 List!36464)) )
))
(declare-fun lt!671422 () ListLongMap!22527)

(declare-fun contains!10269 (ListLongMap!22527 (_ BitVec 64)) Bool)

(assert (=> b!1561973 (= lt!671420 (contains!10269 lt!671422 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1561973 (not (contains!10269 lt!671422 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!671421 () ListLongMap!22527)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun lt!671424 () V!59779)

(declare-datatypes ((array!104076 0))(
  ( (array!104077 (arr!50230 (Array (_ BitVec 32) (_ BitVec 64))) (size!50780 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104076)

(declare-fun +!5049 (ListLongMap!22527 tuple2!25092) ListLongMap!22527)

(assert (=> b!1561973 (= lt!671422 (+!5049 lt!671421 (tuple2!25093 (select (arr!50230 _keys!637) from!782) lt!671424)))))

(declare-datatypes ((Unit!51952 0))(
  ( (Unit!51953) )
))
(declare-fun lt!671423 () Unit!51952)

(declare-fun addStillNotContains!539 (ListLongMap!22527 (_ BitVec 64) V!59779 (_ BitVec 64)) Unit!51952)

(assert (=> b!1561973 (= lt!671423 (addStillNotContains!539 lt!671421 (select (arr!50230 _keys!637) from!782) lt!671424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((ValueCell!18309 0))(
  ( (ValueCellFull!18309 (v!22175 V!59779)) (EmptyCell!18309) )
))
(declare-datatypes ((array!104078 0))(
  ( (array!104079 (arr!50231 (Array (_ BitVec 32) ValueCell!18309)) (size!50781 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104078)

(declare-fun get!26230 (ValueCell!18309 V!59779) V!59779)

(declare-fun dynLambda!3833 (Int (_ BitVec 64)) V!59779)

(assert (=> b!1561973 (= lt!671424 (get!26230 (select (arr!50231 _values!487) from!782) (dynLambda!3833 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59779)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59779)

(declare-fun getCurrentListMapNoExtraKeys!6663 (array!104076 array!104078 (_ BitVec 32) (_ BitVec 32) V!59779 V!59779 (_ BitVec 32) Int) ListLongMap!22527)

(assert (=> b!1561973 (= lt!671421 (getCurrentListMapNoExtraKeys!6663 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561974 () Bool)

(declare-fun e!870430 () Bool)

(declare-fun tp_is_empty!38679 () Bool)

(assert (=> b!1561974 (= e!870430 tp_is_empty!38679)))

(declare-fun mapNonEmpty!59394 () Bool)

(declare-fun mapRes!59394 () Bool)

(declare-fun tp!113162 () Bool)

(assert (=> mapNonEmpty!59394 (= mapRes!59394 (and tp!113162 e!870430))))

(declare-fun mapRest!59394 () (Array (_ BitVec 32) ValueCell!18309))

(declare-fun mapValue!59394 () ValueCell!18309)

(declare-fun mapKey!59394 () (_ BitVec 32))

(assert (=> mapNonEmpty!59394 (= (arr!50231 _values!487) (store mapRest!59394 mapKey!59394 mapValue!59394))))

(declare-fun b!1561975 () Bool)

(declare-fun e!870432 () Bool)

(assert (=> b!1561975 (= e!870432 tp_is_empty!38679)))

(declare-fun b!1561976 () Bool)

(declare-fun res!1067960 () Bool)

(assert (=> b!1561976 (=> (not res!1067960) (not e!870433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104076 (_ BitVec 32)) Bool)

(assert (=> b!1561976 (= res!1067960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561977 () Bool)

(declare-fun e!870429 () Bool)

(assert (=> b!1561977 (= e!870429 (and e!870432 mapRes!59394))))

(declare-fun condMapEmpty!59394 () Bool)

(declare-fun mapDefault!59394 () ValueCell!18309)

(assert (=> b!1561977 (= condMapEmpty!59394 (= (arr!50231 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18309)) mapDefault!59394)))))

(declare-fun res!1067964 () Bool)

(assert (=> start!133596 (=> (not res!1067964) (not e!870433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133596 (= res!1067964 (validMask!0 mask!947))))

(assert (=> start!133596 e!870433))

(assert (=> start!133596 tp!113163))

(assert (=> start!133596 tp_is_empty!38679))

(assert (=> start!133596 true))

(declare-fun array_inv!39043 (array!104076) Bool)

(assert (=> start!133596 (array_inv!39043 _keys!637)))

(declare-fun array_inv!39044 (array!104078) Bool)

(assert (=> start!133596 (and (array_inv!39044 _values!487) e!870429)))

(declare-fun b!1561978 () Bool)

(declare-fun res!1067963 () Bool)

(assert (=> b!1561978 (=> (not res!1067963) (not e!870433))))

(assert (=> b!1561978 (= res!1067963 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50780 _keys!637)) (bvslt from!782 (size!50780 _keys!637))))))

(declare-fun b!1561979 () Bool)

(declare-fun res!1067959 () Bool)

(assert (=> b!1561979 (=> (not res!1067959) (not e!870433))))

(assert (=> b!1561979 (= res!1067959 (and (= (size!50781 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50780 _keys!637) (size!50781 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!59394 () Bool)

(assert (=> mapIsEmpty!59394 mapRes!59394))

(declare-fun b!1561980 () Bool)

(declare-fun res!1067962 () Bool)

(assert (=> b!1561980 (=> (not res!1067962) (not e!870433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561980 (= res!1067962 (validKeyInArray!0 (select (arr!50230 _keys!637) from!782)))))

(declare-fun b!1561981 () Bool)

(declare-fun res!1067961 () Bool)

(assert (=> b!1561981 (=> (not res!1067961) (not e!870433))))

(declare-datatypes ((List!36465 0))(
  ( (Nil!36462) (Cons!36461 (h!37907 (_ BitVec 64)) (t!51268 List!36465)) )
))
(declare-fun arrayNoDuplicates!0 (array!104076 (_ BitVec 32) List!36465) Bool)

(assert (=> b!1561981 (= res!1067961 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36462))))

(assert (= (and start!133596 res!1067964) b!1561979))

(assert (= (and b!1561979 res!1067959) b!1561976))

(assert (= (and b!1561976 res!1067960) b!1561981))

(assert (= (and b!1561981 res!1067961) b!1561978))

(assert (= (and b!1561978 res!1067963) b!1561980))

(assert (= (and b!1561980 res!1067962) b!1561973))

(assert (= (and b!1561977 condMapEmpty!59394) mapIsEmpty!59394))

(assert (= (and b!1561977 (not condMapEmpty!59394)) mapNonEmpty!59394))

(get-info :version)

(assert (= (and mapNonEmpty!59394 ((_ is ValueCellFull!18309) mapValue!59394)) b!1561974))

(assert (= (and b!1561977 ((_ is ValueCellFull!18309) mapDefault!59394)) b!1561975))

(assert (= start!133596 b!1561977))

(declare-fun b_lambda!24887 () Bool)

(assert (=> (not b_lambda!24887) (not b!1561973)))

(declare-fun t!51266 () Bool)

(declare-fun tb!12557 () Bool)

(assert (=> (and start!133596 (= defaultEntry!495 defaultEntry!495) t!51266) tb!12557))

(declare-fun result!26395 () Bool)

(assert (=> tb!12557 (= result!26395 tp_is_empty!38679)))

(assert (=> b!1561973 t!51266))

(declare-fun b_and!51539 () Bool)

(assert (= b_and!51537 (and (=> t!51266 result!26395) b_and!51539)))

(declare-fun m!1437681 () Bool)

(assert (=> start!133596 m!1437681))

(declare-fun m!1437683 () Bool)

(assert (=> start!133596 m!1437683))

(declare-fun m!1437685 () Bool)

(assert (=> start!133596 m!1437685))

(declare-fun m!1437687 () Bool)

(assert (=> b!1561981 m!1437687))

(declare-fun m!1437689 () Bool)

(assert (=> b!1561976 m!1437689))

(declare-fun m!1437691 () Bool)

(assert (=> b!1561973 m!1437691))

(declare-fun m!1437693 () Bool)

(assert (=> b!1561973 m!1437693))

(declare-fun m!1437695 () Bool)

(assert (=> b!1561973 m!1437695))

(declare-fun m!1437697 () Bool)

(assert (=> b!1561973 m!1437697))

(declare-fun m!1437699 () Bool)

(assert (=> b!1561973 m!1437699))

(assert (=> b!1561973 m!1437691))

(declare-fun m!1437701 () Bool)

(assert (=> b!1561973 m!1437701))

(declare-fun m!1437703 () Bool)

(assert (=> b!1561973 m!1437703))

(assert (=> b!1561973 m!1437693))

(declare-fun m!1437705 () Bool)

(assert (=> b!1561973 m!1437705))

(declare-fun m!1437707 () Bool)

(assert (=> b!1561973 m!1437707))

(assert (=> b!1561973 m!1437697))

(assert (=> b!1561980 m!1437697))

(assert (=> b!1561980 m!1437697))

(declare-fun m!1437709 () Bool)

(assert (=> b!1561980 m!1437709))

(declare-fun m!1437711 () Bool)

(assert (=> mapNonEmpty!59394 m!1437711))

(check-sat (not b!1561981) b_and!51539 (not b_next!32013) tp_is_empty!38679 (not b!1561976) (not b!1561980) (not b!1561973) (not mapNonEmpty!59394) (not b_lambda!24887) (not start!133596))
(check-sat b_and!51539 (not b_next!32013))
