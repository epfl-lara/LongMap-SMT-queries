; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134072 () Bool)

(assert start!134072)

(declare-fun b_free!32199 () Bool)

(declare-fun b_next!32199 () Bool)

(assert (=> start!134072 (= b_free!32199 (not b_next!32199))))

(declare-fun tp!113916 () Bool)

(declare-fun b_and!51843 () Bool)

(assert (=> start!134072 (= tp!113916 b_and!51843)))

(declare-fun b!1566943 () Bool)

(declare-fun res!1070939 () Bool)

(declare-fun e!873444 () Bool)

(assert (=> b!1566943 (=> (not res!1070939) (not e!873444))))

(declare-datatypes ((array!104648 0))(
  ( (array!104649 (arr!50509 (Array (_ BitVec 32) (_ BitVec 64))) (size!51059 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104648)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104648 (_ BitVec 32)) Bool)

(assert (=> b!1566943 (= res!1070939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1070940 () Bool)

(assert (=> start!134072 (=> (not res!1070940) (not e!873444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134072 (= res!1070940 (validMask!0 mask!947))))

(assert (=> start!134072 e!873444))

(assert (=> start!134072 tp!113916))

(declare-fun tp_is_empty!38979 () Bool)

(assert (=> start!134072 tp_is_empty!38979))

(assert (=> start!134072 true))

(declare-fun array_inv!39247 (array!104648) Bool)

(assert (=> start!134072 (array_inv!39247 _keys!637)))

(declare-datatypes ((V!60179 0))(
  ( (V!60180 (val!19573 Int)) )
))
(declare-datatypes ((ValueCell!18459 0))(
  ( (ValueCellFull!18459 (v!22332 V!60179)) (EmptyCell!18459) )
))
(declare-datatypes ((array!104650 0))(
  ( (array!104651 (arr!50510 (Array (_ BitVec 32) ValueCell!18459)) (size!51060 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104650)

(declare-fun e!873442 () Bool)

(declare-fun array_inv!39248 (array!104650) Bool)

(assert (=> start!134072 (and (array_inv!39248 _values!487) e!873442)))

(declare-fun mapIsEmpty!59868 () Bool)

(declare-fun mapRes!59868 () Bool)

(assert (=> mapIsEmpty!59868 mapRes!59868))

(declare-fun b!1566944 () Bool)

(declare-fun e!873441 () Bool)

(assert (=> b!1566944 (= e!873444 e!873441)))

(declare-fun res!1070937 () Bool)

(assert (=> b!1566944 (=> (not res!1070937) (not e!873441))))

(declare-datatypes ((tuple2!25254 0))(
  ( (tuple2!25255 (_1!12638 (_ BitVec 64)) (_2!12638 V!60179)) )
))
(declare-datatypes ((List!36641 0))(
  ( (Nil!36638) (Cons!36637 (h!38084 tuple2!25254) (t!51545 List!36641)) )
))
(declare-datatypes ((ListLongMap!22689 0))(
  ( (ListLongMap!22690 (toList!11360 List!36641)) )
))
(declare-fun lt!672833 () ListLongMap!22689)

(declare-fun contains!10354 (ListLongMap!22689 (_ BitVec 64)) Bool)

(assert (=> b!1566944 (= res!1070937 (not (contains!10354 lt!672833 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60179)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60179)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun defaultEntry!495 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6725 (array!104648 array!104650 (_ BitVec 32) (_ BitVec 32) V!60179 V!60179 (_ BitVec 32) Int) ListLongMap!22689)

(assert (=> b!1566944 (= lt!672833 (getCurrentListMapNoExtraKeys!6725 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1566945 () Bool)

(declare-fun e!873443 () Bool)

(assert (=> b!1566945 (= e!873443 tp_is_empty!38979)))

(declare-fun b!1566946 () Bool)

(assert (=> b!1566946 (= e!873441 false)))

(declare-fun lt!672832 () Bool)

(assert (=> b!1566946 (= lt!672832 (contains!10354 lt!672833 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59868 () Bool)

(declare-fun tp!113915 () Bool)

(assert (=> mapNonEmpty!59868 (= mapRes!59868 (and tp!113915 e!873443))))

(declare-fun mapValue!59868 () ValueCell!18459)

(declare-fun mapRest!59868 () (Array (_ BitVec 32) ValueCell!18459))

(declare-fun mapKey!59868 () (_ BitVec 32))

(assert (=> mapNonEmpty!59868 (= (arr!50510 _values!487) (store mapRest!59868 mapKey!59868 mapValue!59868))))

(declare-fun b!1566947 () Bool)

(declare-fun res!1070938 () Bool)

(assert (=> b!1566947 (=> (not res!1070938) (not e!873444))))

(assert (=> b!1566947 (= res!1070938 (and (= (size!51060 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51059 _keys!637) (size!51060 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1566948 () Bool)

(declare-fun e!873445 () Bool)

(assert (=> b!1566948 (= e!873445 tp_is_empty!38979)))

(declare-fun b!1566949 () Bool)

(declare-fun res!1070935 () Bool)

(assert (=> b!1566949 (=> (not res!1070935) (not e!873444))))

(declare-datatypes ((List!36642 0))(
  ( (Nil!36639) (Cons!36638 (h!38085 (_ BitVec 64)) (t!51546 List!36642)) )
))
(declare-fun arrayNoDuplicates!0 (array!104648 (_ BitVec 32) List!36642) Bool)

(assert (=> b!1566949 (= res!1070935 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36639))))

(declare-fun b!1566950 () Bool)

(declare-fun res!1070941 () Bool)

(assert (=> b!1566950 (=> (not res!1070941) (not e!873444))))

(assert (=> b!1566950 (= res!1070941 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51059 _keys!637)) (bvslt from!782 (size!51059 _keys!637))))))

(declare-fun b!1566951 () Bool)

(declare-fun res!1070936 () Bool)

(assert (=> b!1566951 (=> (not res!1070936) (not e!873444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566951 (= res!1070936 (not (validKeyInArray!0 (select (arr!50509 _keys!637) from!782))))))

(declare-fun b!1566952 () Bool)

(assert (=> b!1566952 (= e!873442 (and e!873445 mapRes!59868))))

(declare-fun condMapEmpty!59868 () Bool)

(declare-fun mapDefault!59868 () ValueCell!18459)

(assert (=> b!1566952 (= condMapEmpty!59868 (= (arr!50510 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18459)) mapDefault!59868)))))

(assert (= (and start!134072 res!1070940) b!1566947))

(assert (= (and b!1566947 res!1070938) b!1566943))

(assert (= (and b!1566943 res!1070939) b!1566949))

(assert (= (and b!1566949 res!1070935) b!1566950))

(assert (= (and b!1566950 res!1070941) b!1566951))

(assert (= (and b!1566951 res!1070936) b!1566944))

(assert (= (and b!1566944 res!1070937) b!1566946))

(assert (= (and b!1566952 condMapEmpty!59868) mapIsEmpty!59868))

(assert (= (and b!1566952 (not condMapEmpty!59868)) mapNonEmpty!59868))

(get-info :version)

(assert (= (and mapNonEmpty!59868 ((_ is ValueCellFull!18459) mapValue!59868)) b!1566945))

(assert (= (and b!1566952 ((_ is ValueCellFull!18459) mapDefault!59868)) b!1566948))

(assert (= start!134072 b!1566952))

(declare-fun m!1441935 () Bool)

(assert (=> b!1566943 m!1441935))

(declare-fun m!1441937 () Bool)

(assert (=> b!1566944 m!1441937))

(declare-fun m!1441939 () Bool)

(assert (=> b!1566944 m!1441939))

(declare-fun m!1441941 () Bool)

(assert (=> b!1566946 m!1441941))

(declare-fun m!1441943 () Bool)

(assert (=> b!1566951 m!1441943))

(assert (=> b!1566951 m!1441943))

(declare-fun m!1441945 () Bool)

(assert (=> b!1566951 m!1441945))

(declare-fun m!1441947 () Bool)

(assert (=> mapNonEmpty!59868 m!1441947))

(declare-fun m!1441949 () Bool)

(assert (=> b!1566949 m!1441949))

(declare-fun m!1441951 () Bool)

(assert (=> start!134072 m!1441951))

(declare-fun m!1441953 () Bool)

(assert (=> start!134072 m!1441953))

(declare-fun m!1441955 () Bool)

(assert (=> start!134072 m!1441955))

(check-sat tp_is_empty!38979 (not mapNonEmpty!59868) (not b!1566944) (not b!1566943) (not b!1566946) (not start!134072) (not b!1566949) b_and!51843 (not b!1566951) (not b_next!32199))
(check-sat b_and!51843 (not b_next!32199))
