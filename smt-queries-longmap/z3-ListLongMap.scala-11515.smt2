; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134066 () Bool)

(assert start!134066)

(declare-fun b_free!32193 () Bool)

(declare-fun b_next!32193 () Bool)

(assert (=> start!134066 (= b_free!32193 (not b_next!32193))))

(declare-fun tp!113898 () Bool)

(declare-fun b_and!51837 () Bool)

(assert (=> start!134066 (= tp!113898 b_and!51837)))

(declare-fun b!1566853 () Bool)

(declare-fun e!873388 () Bool)

(assert (=> b!1566853 (= e!873388 false)))

(declare-fun lt!672815 () Bool)

(declare-datatypes ((V!60171 0))(
  ( (V!60172 (val!19570 Int)) )
))
(declare-datatypes ((tuple2!25248 0))(
  ( (tuple2!25249 (_1!12635 (_ BitVec 64)) (_2!12635 V!60171)) )
))
(declare-datatypes ((List!36637 0))(
  ( (Nil!36634) (Cons!36633 (h!38080 tuple2!25248) (t!51541 List!36637)) )
))
(declare-datatypes ((ListLongMap!22683 0))(
  ( (ListLongMap!22684 (toList!11357 List!36637)) )
))
(declare-fun lt!672814 () ListLongMap!22683)

(declare-fun contains!10351 (ListLongMap!22683 (_ BitVec 64)) Bool)

(assert (=> b!1566853 (= lt!672815 (contains!10351 lt!672814 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1566854 () Bool)

(declare-fun e!873390 () Bool)

(declare-fun tp_is_empty!38973 () Bool)

(assert (=> b!1566854 (= e!873390 tp_is_empty!38973)))

(declare-fun b!1566855 () Bool)

(declare-fun res!1070876 () Bool)

(declare-fun e!873389 () Bool)

(assert (=> b!1566855 (=> (not res!1070876) (not e!873389))))

(declare-datatypes ((array!104636 0))(
  ( (array!104637 (arr!50503 (Array (_ BitVec 32) (_ BitVec 64))) (size!51053 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104636)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566855 (= res!1070876 (not (validKeyInArray!0 (select (arr!50503 _keys!637) from!782))))))

(declare-fun res!1070875 () Bool)

(assert (=> start!134066 (=> (not res!1070875) (not e!873389))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134066 (= res!1070875 (validMask!0 mask!947))))

(assert (=> start!134066 e!873389))

(assert (=> start!134066 tp!113898))

(assert (=> start!134066 tp_is_empty!38973))

(assert (=> start!134066 true))

(declare-fun array_inv!39241 (array!104636) Bool)

(assert (=> start!134066 (array_inv!39241 _keys!637)))

(declare-datatypes ((ValueCell!18456 0))(
  ( (ValueCellFull!18456 (v!22329 V!60171)) (EmptyCell!18456) )
))
(declare-datatypes ((array!104638 0))(
  ( (array!104639 (arr!50504 (Array (_ BitVec 32) ValueCell!18456)) (size!51054 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104638)

(declare-fun e!873386 () Bool)

(declare-fun array_inv!39242 (array!104638) Bool)

(assert (=> start!134066 (and (array_inv!39242 _values!487) e!873386)))

(declare-fun mapIsEmpty!59859 () Bool)

(declare-fun mapRes!59859 () Bool)

(assert (=> mapIsEmpty!59859 mapRes!59859))

(declare-fun mapNonEmpty!59859 () Bool)

(declare-fun tp!113897 () Bool)

(assert (=> mapNonEmpty!59859 (= mapRes!59859 (and tp!113897 e!873390))))

(declare-fun mapRest!59859 () (Array (_ BitVec 32) ValueCell!18456))

(declare-fun mapKey!59859 () (_ BitVec 32))

(declare-fun mapValue!59859 () ValueCell!18456)

(assert (=> mapNonEmpty!59859 (= (arr!50504 _values!487) (store mapRest!59859 mapKey!59859 mapValue!59859))))

(declare-fun b!1566856 () Bool)

(declare-fun res!1070873 () Bool)

(assert (=> b!1566856 (=> (not res!1070873) (not e!873389))))

(declare-datatypes ((List!36638 0))(
  ( (Nil!36635) (Cons!36634 (h!38081 (_ BitVec 64)) (t!51542 List!36638)) )
))
(declare-fun arrayNoDuplicates!0 (array!104636 (_ BitVec 32) List!36638) Bool)

(assert (=> b!1566856 (= res!1070873 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36635))))

(declare-fun b!1566857 () Bool)

(declare-fun e!873387 () Bool)

(assert (=> b!1566857 (= e!873387 tp_is_empty!38973)))

(declare-fun b!1566858 () Bool)

(assert (=> b!1566858 (= e!873389 e!873388)))

(declare-fun res!1070874 () Bool)

(assert (=> b!1566858 (=> (not res!1070874) (not e!873388))))

(assert (=> b!1566858 (= res!1070874 (not (contains!10351 lt!672814 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60171)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60171)

(declare-fun getCurrentListMapNoExtraKeys!6722 (array!104636 array!104638 (_ BitVec 32) (_ BitVec 32) V!60171 V!60171 (_ BitVec 32) Int) ListLongMap!22683)

(assert (=> b!1566858 (= lt!672814 (getCurrentListMapNoExtraKeys!6722 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566859 () Bool)

(declare-fun res!1070878 () Bool)

(assert (=> b!1566859 (=> (not res!1070878) (not e!873389))))

(assert (=> b!1566859 (= res!1070878 (and (= (size!51054 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51053 _keys!637) (size!51054 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566860 () Bool)

(declare-fun res!1070872 () Bool)

(assert (=> b!1566860 (=> (not res!1070872) (not e!873389))))

(assert (=> b!1566860 (= res!1070872 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51053 _keys!637)) (bvslt from!782 (size!51053 _keys!637))))))

(declare-fun b!1566861 () Bool)

(assert (=> b!1566861 (= e!873386 (and e!873387 mapRes!59859))))

(declare-fun condMapEmpty!59859 () Bool)

(declare-fun mapDefault!59859 () ValueCell!18456)

(assert (=> b!1566861 (= condMapEmpty!59859 (= (arr!50504 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18456)) mapDefault!59859)))))

(declare-fun b!1566862 () Bool)

(declare-fun res!1070877 () Bool)

(assert (=> b!1566862 (=> (not res!1070877) (not e!873389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104636 (_ BitVec 32)) Bool)

(assert (=> b!1566862 (= res!1070877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!134066 res!1070875) b!1566859))

(assert (= (and b!1566859 res!1070878) b!1566862))

(assert (= (and b!1566862 res!1070877) b!1566856))

(assert (= (and b!1566856 res!1070873) b!1566860))

(assert (= (and b!1566860 res!1070872) b!1566855))

(assert (= (and b!1566855 res!1070876) b!1566858))

(assert (= (and b!1566858 res!1070874) b!1566853))

(assert (= (and b!1566861 condMapEmpty!59859) mapIsEmpty!59859))

(assert (= (and b!1566861 (not condMapEmpty!59859)) mapNonEmpty!59859))

(get-info :version)

(assert (= (and mapNonEmpty!59859 ((_ is ValueCellFull!18456) mapValue!59859)) b!1566854))

(assert (= (and b!1566861 ((_ is ValueCellFull!18456) mapDefault!59859)) b!1566857))

(assert (= start!134066 b!1566861))

(declare-fun m!1441869 () Bool)

(assert (=> b!1566856 m!1441869))

(declare-fun m!1441871 () Bool)

(assert (=> b!1566853 m!1441871))

(declare-fun m!1441873 () Bool)

(assert (=> b!1566858 m!1441873))

(declare-fun m!1441875 () Bool)

(assert (=> b!1566858 m!1441875))

(declare-fun m!1441877 () Bool)

(assert (=> b!1566862 m!1441877))

(declare-fun m!1441879 () Bool)

(assert (=> start!134066 m!1441879))

(declare-fun m!1441881 () Bool)

(assert (=> start!134066 m!1441881))

(declare-fun m!1441883 () Bool)

(assert (=> start!134066 m!1441883))

(declare-fun m!1441885 () Bool)

(assert (=> mapNonEmpty!59859 m!1441885))

(declare-fun m!1441887 () Bool)

(assert (=> b!1566855 m!1441887))

(assert (=> b!1566855 m!1441887))

(declare-fun m!1441889 () Bool)

(assert (=> b!1566855 m!1441889))

(check-sat (not mapNonEmpty!59859) (not b!1566862) (not start!134066) tp_is_empty!38973 (not b!1566855) (not b!1566858) (not b!1566853) (not b_next!32193) b_and!51837 (not b!1566856))
(check-sat b_and!51837 (not b_next!32193))
