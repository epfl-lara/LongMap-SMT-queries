; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133458 () Bool)

(assert start!133458)

(declare-fun b!1560249 () Bool)

(declare-fun res!1066928 () Bool)

(declare-fun e!869388 () Bool)

(assert (=> b!1560249 (=> (not res!1066928) (not e!869388))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!103806 0))(
  ( (array!103807 (arr!50095 (Array (_ BitVec 32) (_ BitVec 64))) (size!50645 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103806)

(declare-datatypes ((V!59595 0))(
  ( (V!59596 (val!19354 Int)) )
))
(declare-datatypes ((ValueCell!18240 0))(
  ( (ValueCellFull!18240 (v!22106 V!59595)) (EmptyCell!18240) )
))
(declare-datatypes ((array!103808 0))(
  ( (array!103809 (arr!50096 (Array (_ BitVec 32) ValueCell!18240)) (size!50646 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103808)

(assert (=> b!1560249 (= res!1066928 (and (= (size!50646 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50645 _keys!637) (size!50646 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1066927 () Bool)

(assert (=> start!133458 (=> (not res!1066927) (not e!869388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133458 (= res!1066927 (validMask!0 mask!947))))

(assert (=> start!133458 e!869388))

(assert (=> start!133458 true))

(declare-fun array_inv!38941 (array!103806) Bool)

(assert (=> start!133458 (array_inv!38941 _keys!637)))

(declare-fun e!869389 () Bool)

(declare-fun array_inv!38942 (array!103808) Bool)

(assert (=> start!133458 (and (array_inv!38942 _values!487) e!869389)))

(declare-fun b!1560250 () Bool)

(declare-fun res!1066929 () Bool)

(assert (=> b!1560250 (=> (not res!1066929) (not e!869388))))

(declare-datatypes ((tuple2!25034 0))(
  ( (tuple2!25035 (_1!12528 (_ BitVec 64)) (_2!12528 V!59595)) )
))
(declare-datatypes ((List!36388 0))(
  ( (Nil!36385) (Cons!36384 (h!37830 tuple2!25034) (t!51121 List!36388)) )
))
(declare-datatypes ((ListLongMap!22469 0))(
  ( (ListLongMap!22470 (toList!11250 List!36388)) )
))
(declare-fun contains!10240 (ListLongMap!22469 (_ BitVec 64)) Bool)

(assert (=> b!1560250 (= res!1066929 (not (contains!10240 (ListLongMap!22470 Nil!36385) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1560251 () Bool)

(declare-fun res!1066925 () Bool)

(assert (=> b!1560251 (=> (not res!1066925) (not e!869388))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1560251 (= res!1066925 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50645 _keys!637)) (bvsge from!782 (size!50645 _keys!637))))))

(declare-fun b!1560252 () Bool)

(declare-fun e!869386 () Bool)

(declare-fun tp_is_empty!38541 () Bool)

(assert (=> b!1560252 (= e!869386 tp_is_empty!38541)))

(declare-fun b!1560253 () Bool)

(declare-fun e!869385 () Bool)

(assert (=> b!1560253 (= e!869385 tp_is_empty!38541)))

(declare-fun b!1560254 () Bool)

(declare-fun mapRes!59187 () Bool)

(assert (=> b!1560254 (= e!869389 (and e!869385 mapRes!59187))))

(declare-fun condMapEmpty!59187 () Bool)

(declare-fun mapDefault!59187 () ValueCell!18240)

(assert (=> b!1560254 (= condMapEmpty!59187 (= (arr!50096 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18240)) mapDefault!59187)))))

(declare-fun b!1560255 () Bool)

(assert (=> b!1560255 (= e!869388 false)))

(declare-fun lt!670968 () Bool)

(assert (=> b!1560255 (= lt!670968 (contains!10240 (ListLongMap!22470 Nil!36385) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59187 () Bool)

(declare-fun tp!112842 () Bool)

(assert (=> mapNonEmpty!59187 (= mapRes!59187 (and tp!112842 e!869386))))

(declare-fun mapValue!59187 () ValueCell!18240)

(declare-fun mapKey!59187 () (_ BitVec 32))

(declare-fun mapRest!59187 () (Array (_ BitVec 32) ValueCell!18240))

(assert (=> mapNonEmpty!59187 (= (arr!50096 _values!487) (store mapRest!59187 mapKey!59187 mapValue!59187))))

(declare-fun b!1560256 () Bool)

(declare-fun res!1066926 () Bool)

(assert (=> b!1560256 (=> (not res!1066926) (not e!869388))))

(declare-datatypes ((List!36389 0))(
  ( (Nil!36386) (Cons!36385 (h!37831 (_ BitVec 64)) (t!51122 List!36389)) )
))
(declare-fun arrayNoDuplicates!0 (array!103806 (_ BitVec 32) List!36389) Bool)

(assert (=> b!1560256 (= res!1066926 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36386))))

(declare-fun b!1560257 () Bool)

(declare-fun res!1066924 () Bool)

(assert (=> b!1560257 (=> (not res!1066924) (not e!869388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103806 (_ BitVec 32)) Bool)

(assert (=> b!1560257 (= res!1066924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59187 () Bool)

(assert (=> mapIsEmpty!59187 mapRes!59187))

(assert (= (and start!133458 res!1066927) b!1560249))

(assert (= (and b!1560249 res!1066928) b!1560257))

(assert (= (and b!1560257 res!1066924) b!1560256))

(assert (= (and b!1560256 res!1066926) b!1560251))

(assert (= (and b!1560251 res!1066925) b!1560250))

(assert (= (and b!1560250 res!1066929) b!1560255))

(assert (= (and b!1560254 condMapEmpty!59187) mapIsEmpty!59187))

(assert (= (and b!1560254 (not condMapEmpty!59187)) mapNonEmpty!59187))

(get-info :version)

(assert (= (and mapNonEmpty!59187 ((_ is ValueCellFull!18240) mapValue!59187)) b!1560252))

(assert (= (and b!1560254 ((_ is ValueCellFull!18240) mapDefault!59187)) b!1560253))

(assert (= start!133458 b!1560254))

(declare-fun m!1436165 () Bool)

(assert (=> b!1560256 m!1436165))

(declare-fun m!1436167 () Bool)

(assert (=> b!1560250 m!1436167))

(declare-fun m!1436169 () Bool)

(assert (=> start!133458 m!1436169))

(declare-fun m!1436171 () Bool)

(assert (=> start!133458 m!1436171))

(declare-fun m!1436173 () Bool)

(assert (=> start!133458 m!1436173))

(declare-fun m!1436175 () Bool)

(assert (=> mapNonEmpty!59187 m!1436175))

(declare-fun m!1436177 () Bool)

(assert (=> b!1560257 m!1436177))

(declare-fun m!1436179 () Bool)

(assert (=> b!1560255 m!1436179))

(check-sat (not start!133458) (not b!1560256) tp_is_empty!38541 (not b!1560257) (not b!1560250) (not mapNonEmpty!59187) (not b!1560255))
(check-sat)
