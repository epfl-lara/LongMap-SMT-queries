; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112690 () Bool)

(assert start!112690)

(declare-fun b_free!31027 () Bool)

(declare-fun b_next!31027 () Bool)

(assert (=> start!112690 (= b_free!31027 (not b_next!31027))))

(declare-fun tp!108721 () Bool)

(declare-fun b_and!49991 () Bool)

(assert (=> start!112690 (= tp!108721 b_and!49991)))

(declare-fun b!1336823 () Bool)

(declare-fun e!761227 () Bool)

(declare-fun tp_is_empty!36937 () Bool)

(assert (=> b!1336823 (= e!761227 tp_is_empty!36937)))

(declare-fun res!887180 () Bool)

(declare-fun e!761229 () Bool)

(assert (=> start!112690 (=> (not res!887180) (not e!761229))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112690 (= res!887180 (validMask!0 mask!1998))))

(assert (=> start!112690 e!761229))

(declare-datatypes ((V!54353 0))(
  ( (V!54354 (val!18543 Int)) )
))
(declare-datatypes ((ValueCell!17570 0))(
  ( (ValueCellFull!17570 (v!21183 V!54353)) (EmptyCell!17570) )
))
(declare-datatypes ((array!90732 0))(
  ( (array!90733 (arr!43831 (Array (_ BitVec 32) ValueCell!17570)) (size!44381 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90732)

(declare-fun e!761228 () Bool)

(declare-fun array_inv!33055 (array!90732) Bool)

(assert (=> start!112690 (and (array_inv!33055 _values!1320) e!761228)))

(assert (=> start!112690 true))

(declare-datatypes ((array!90734 0))(
  ( (array!90735 (arr!43832 (Array (_ BitVec 32) (_ BitVec 64))) (size!44382 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90734)

(declare-fun array_inv!33056 (array!90734) Bool)

(assert (=> start!112690 (array_inv!33056 _keys!1590)))

(assert (=> start!112690 tp!108721))

(assert (=> start!112690 tp_is_empty!36937))

(declare-fun b!1336824 () Bool)

(declare-fun res!887178 () Bool)

(assert (=> b!1336824 (=> (not res!887178) (not e!761229))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54353)

(declare-fun zeroValue!1262 () V!54353)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23918 0))(
  ( (tuple2!23919 (_1!11970 (_ BitVec 64)) (_2!11970 V!54353)) )
))
(declare-datatypes ((List!31061 0))(
  ( (Nil!31058) (Cons!31057 (h!32266 tuple2!23918) (t!45369 List!31061)) )
))
(declare-datatypes ((ListLongMap!21575 0))(
  ( (ListLongMap!21576 (toList!10803 List!31061)) )
))
(declare-fun contains!8968 (ListLongMap!21575 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5774 (array!90734 array!90732 (_ BitVec 32) (_ BitVec 32) V!54353 V!54353 (_ BitVec 32) Int) ListLongMap!21575)

(assert (=> b!1336824 (= res!887178 (contains!8968 (getCurrentListMap!5774 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1336825 () Bool)

(declare-fun res!887182 () Bool)

(assert (=> b!1336825 (=> (not res!887182) (not e!761229))))

(assert (=> b!1336825 (= res!887182 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44382 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336826 () Bool)

(declare-fun res!887183 () Bool)

(assert (=> b!1336826 (=> (not res!887183) (not e!761229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90734 (_ BitVec 32)) Bool)

(assert (=> b!1336826 (= res!887183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336827 () Bool)

(declare-fun e!761226 () Bool)

(assert (=> b!1336827 (= e!761226 tp_is_empty!36937)))

(declare-fun mapNonEmpty!57083 () Bool)

(declare-fun mapRes!57083 () Bool)

(declare-fun tp!108722 () Bool)

(assert (=> mapNonEmpty!57083 (= mapRes!57083 (and tp!108722 e!761227))))

(declare-fun mapRest!57083 () (Array (_ BitVec 32) ValueCell!17570))

(declare-fun mapValue!57083 () ValueCell!17570)

(declare-fun mapKey!57083 () (_ BitVec 32))

(assert (=> mapNonEmpty!57083 (= (arr!43831 _values!1320) (store mapRest!57083 mapKey!57083 mapValue!57083))))

(declare-fun b!1336828 () Bool)

(assert (=> b!1336828 (= e!761228 (and e!761226 mapRes!57083))))

(declare-fun condMapEmpty!57083 () Bool)

(declare-fun mapDefault!57083 () ValueCell!17570)

