; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100466 () Bool)

(assert start!100466)

(declare-fun b_free!25795 () Bool)

(declare-fun b_next!25795 () Bool)

(assert (=> start!100466 (= b_free!25795 (not b_next!25795))))

(declare-fun tp!90374 () Bool)

(declare-fun b_and!42455 () Bool)

(assert (=> start!100466 (= tp!90374 b_and!42455)))

(declare-fun b!1199768 () Bool)

(declare-fun res!798639 () Bool)

(declare-fun e!681387 () Bool)

(assert (=> b!1199768 (=> (not res!798639) (not e!681387))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77700 0))(
  ( (array!77701 (arr!37495 (Array (_ BitVec 32) (_ BitVec 64))) (size!38033 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77700)

(assert (=> b!1199768 (= res!798639 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38033 _keys!1208))))))

(declare-fun b!1199769 () Bool)

(declare-fun e!681385 () Bool)

(declare-fun tp_is_empty!30499 () Bool)

(assert (=> b!1199769 (= e!681385 tp_is_empty!30499)))

(declare-fun b!1199770 () Bool)

(declare-fun e!681382 () Bool)

(assert (=> b!1199770 (= e!681382 true)))

(declare-datatypes ((V!45793 0))(
  ( (V!45794 (val!15306 Int)) )
))
(declare-fun zeroValue!944 () V!45793)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((tuple2!19682 0))(
  ( (tuple2!19683 (_1!9852 (_ BitVec 64)) (_2!9852 V!45793)) )
))
(declare-datatypes ((List!26472 0))(
  ( (Nil!26469) (Cons!26468 (h!27677 tuple2!19682) (t!39238 List!26472)) )
))
(declare-datatypes ((ListLongMap!17651 0))(
  ( (ListLongMap!17652 (toList!8841 List!26472)) )
))
(declare-fun lt!543702 () ListLongMap!17651)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!543700 () array!77700)

(declare-datatypes ((ValueCell!14540 0))(
  ( (ValueCellFull!14540 (v!17943 V!45793)) (EmptyCell!14540) )
))
(declare-datatypes ((array!77702 0))(
  ( (array!77703 (arr!37496 (Array (_ BitVec 32) ValueCell!14540)) (size!38034 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77702)

(declare-fun minValue!944 () V!45793)

(declare-fun getCurrentListMapNoExtraKeys!5290 (array!77700 array!77702 (_ BitVec 32) (_ BitVec 32) V!45793 V!45793 (_ BitVec 32) Int) ListLongMap!17651)

(declare-fun dynLambda!3170 (Int (_ BitVec 64)) V!45793)

(assert (=> b!1199770 (= lt!543702 (getCurrentListMapNoExtraKeys!5290 lt!543700 (array!77703 (store (arr!37496 _values!996) i!673 (ValueCellFull!14540 (dynLambda!3170 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38034 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543701 () ListLongMap!17651)

(assert (=> b!1199770 (= lt!543701 (getCurrentListMapNoExtraKeys!5290 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199771 () Bool)

(declare-fun res!798638 () Bool)

(assert (=> b!1199771 (=> (not res!798638) (not e!681387))))

(declare-datatypes ((List!26473 0))(
  ( (Nil!26470) (Cons!26469 (h!27678 (_ BitVec 64)) (t!39239 List!26473)) )
))
(declare-fun arrayNoDuplicates!0 (array!77700 (_ BitVec 32) List!26473) Bool)

(assert (=> b!1199771 (= res!798638 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26470))))

(declare-fun b!1199772 () Bool)

(declare-fun e!681384 () Bool)

(assert (=> b!1199772 (= e!681384 (not e!681382))))

(declare-fun res!798637 () Bool)

(assert (=> b!1199772 (=> res!798637 e!681382)))

(assert (=> b!1199772 (= res!798637 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77700 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199772 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39641 0))(
  ( (Unit!39642) )
))
(declare-fun lt!543703 () Unit!39641)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77700 (_ BitVec 64) (_ BitVec 32)) Unit!39641)

(assert (=> b!1199772 (= lt!543703 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!798630 () Bool)

(assert (=> start!100466 (=> (not res!798630) (not e!681387))))

(assert (=> start!100466 (= res!798630 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38033 _keys!1208))))))

(assert (=> start!100466 e!681387))

(assert (=> start!100466 tp_is_empty!30499))

(declare-fun array_inv!28692 (array!77700) Bool)

(assert (=> start!100466 (array_inv!28692 _keys!1208)))

(assert (=> start!100466 true))

(assert (=> start!100466 tp!90374))

(declare-fun e!681388 () Bool)

(declare-fun array_inv!28693 (array!77702) Bool)

(assert (=> start!100466 (and (array_inv!28693 _values!996) e!681388)))

(declare-fun b!1199773 () Bool)

(declare-fun e!681383 () Bool)

(declare-fun mapRes!47591 () Bool)

(assert (=> b!1199773 (= e!681388 (and e!681383 mapRes!47591))))

(declare-fun condMapEmpty!47591 () Bool)

(declare-fun mapDefault!47591 () ValueCell!14540)

(assert (=> b!1199773 (= condMapEmpty!47591 (= (arr!37496 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14540)) mapDefault!47591)))))

(declare-fun b!1199774 () Bool)

(declare-fun res!798632 () Bool)

(assert (=> b!1199774 (=> (not res!798632) (not e!681387))))

(assert (=> b!1199774 (= res!798632 (and (= (size!38034 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38033 _keys!1208) (size!38034 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199775 () Bool)

(declare-fun res!798631 () Bool)

(assert (=> b!1199775 (=> (not res!798631) (not e!681387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199775 (= res!798631 (validMask!0 mask!1564))))

(declare-fun b!1199776 () Bool)

(declare-fun res!798635 () Bool)

(assert (=> b!1199776 (=> (not res!798635) (not e!681384))))

(assert (=> b!1199776 (= res!798635 (arrayNoDuplicates!0 lt!543700 #b00000000000000000000000000000000 Nil!26470))))

(declare-fun b!1199777 () Bool)

(declare-fun res!798633 () Bool)

(assert (=> b!1199777 (=> (not res!798633) (not e!681387))))

(assert (=> b!1199777 (= res!798633 (= (select (arr!37495 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!47591 () Bool)

(declare-fun tp!90375 () Bool)

(assert (=> mapNonEmpty!47591 (= mapRes!47591 (and tp!90375 e!681385))))

(declare-fun mapRest!47591 () (Array (_ BitVec 32) ValueCell!14540))

(declare-fun mapKey!47591 () (_ BitVec 32))

(declare-fun mapValue!47591 () ValueCell!14540)

(assert (=> mapNonEmpty!47591 (= (arr!37496 _values!996) (store mapRest!47591 mapKey!47591 mapValue!47591))))

(declare-fun b!1199778 () Bool)

(declare-fun res!798629 () Bool)

(assert (=> b!1199778 (=> (not res!798629) (not e!681387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199778 (= res!798629 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47591 () Bool)

(assert (=> mapIsEmpty!47591 mapRes!47591))

(declare-fun b!1199779 () Bool)

(assert (=> b!1199779 (= e!681383 tp_is_empty!30499)))

(declare-fun b!1199780 () Bool)

(declare-fun res!798636 () Bool)

(assert (=> b!1199780 (=> (not res!798636) (not e!681387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77700 (_ BitVec 32)) Bool)

(assert (=> b!1199780 (= res!798636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199781 () Bool)

(assert (=> b!1199781 (= e!681387 e!681384)))

(declare-fun res!798634 () Bool)

(assert (=> b!1199781 (=> (not res!798634) (not e!681384))))

(assert (=> b!1199781 (= res!798634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543700 mask!1564))))

(assert (=> b!1199781 (= lt!543700 (array!77701 (store (arr!37495 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38033 _keys!1208)))))

(assert (= (and start!100466 res!798630) b!1199775))

(assert (= (and b!1199775 res!798631) b!1199774))

(assert (= (and b!1199774 res!798632) b!1199780))

(assert (= (and b!1199780 res!798636) b!1199771))

(assert (= (and b!1199771 res!798638) b!1199768))

(assert (= (and b!1199768 res!798639) b!1199778))

(assert (= (and b!1199778 res!798629) b!1199777))

(assert (= (and b!1199777 res!798633) b!1199781))

(assert (= (and b!1199781 res!798634) b!1199776))

(assert (= (and b!1199776 res!798635) b!1199772))

(assert (= (and b!1199772 (not res!798637)) b!1199770))

(assert (= (and b!1199773 condMapEmpty!47591) mapIsEmpty!47591))

(assert (= (and b!1199773 (not condMapEmpty!47591)) mapNonEmpty!47591))

(get-info :version)

(assert (= (and mapNonEmpty!47591 ((_ is ValueCellFull!14540) mapValue!47591)) b!1199769))

(assert (= (and b!1199773 ((_ is ValueCellFull!14540) mapDefault!47591)) b!1199779))

(assert (= start!100466 b!1199773))

(declare-fun b_lambda!20973 () Bool)

(assert (=> (not b_lambda!20973) (not b!1199770)))

(declare-fun t!39237 () Bool)

(declare-fun tb!10587 () Bool)

(assert (=> (and start!100466 (= defaultEntry!1004 defaultEntry!1004) t!39237) tb!10587))

(declare-fun result!21759 () Bool)

(assert (=> tb!10587 (= result!21759 tp_is_empty!30499)))

(assert (=> b!1199770 t!39237))

(declare-fun b_and!42457 () Bool)

(assert (= b_and!42455 (and (=> t!39237 result!21759) b_and!42457)))

(declare-fun m!1105717 () Bool)

(assert (=> b!1199776 m!1105717))

(declare-fun m!1105719 () Bool)

(assert (=> b!1199781 m!1105719))

(declare-fun m!1105721 () Bool)

(assert (=> b!1199781 m!1105721))

(declare-fun m!1105723 () Bool)

(assert (=> b!1199771 m!1105723))

(declare-fun m!1105725 () Bool)

(assert (=> start!100466 m!1105725))

(declare-fun m!1105727 () Bool)

(assert (=> start!100466 m!1105727))

(declare-fun m!1105729 () Bool)

(assert (=> b!1199772 m!1105729))

(declare-fun m!1105731 () Bool)

(assert (=> b!1199772 m!1105731))

(declare-fun m!1105733 () Bool)

(assert (=> b!1199777 m!1105733))

(declare-fun m!1105735 () Bool)

(assert (=> b!1199780 m!1105735))

(declare-fun m!1105737 () Bool)

(assert (=> mapNonEmpty!47591 m!1105737))

(declare-fun m!1105739 () Bool)

(assert (=> b!1199778 m!1105739))

(declare-fun m!1105741 () Bool)

(assert (=> b!1199770 m!1105741))

(declare-fun m!1105743 () Bool)

(assert (=> b!1199770 m!1105743))

(declare-fun m!1105745 () Bool)

(assert (=> b!1199770 m!1105745))

(declare-fun m!1105747 () Bool)

(assert (=> b!1199770 m!1105747))

(declare-fun m!1105749 () Bool)

(assert (=> b!1199775 m!1105749))

(check-sat (not b!1199770) (not b!1199772) (not b_lambda!20973) (not mapNonEmpty!47591) (not b!1199780) (not b!1199771) (not b!1199781) (not b_next!25795) (not start!100466) (not b!1199775) (not b!1199778) (not b!1199776) b_and!42457 tp_is_empty!30499)
(check-sat b_and!42457 (not b_next!25795))
