; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113248 () Bool)

(assert start!113248)

(declare-fun b_free!31075 () Bool)

(declare-fun b_next!31075 () Bool)

(assert (=> start!113248 (= b_free!31075 (not b_next!31075))))

(declare-fun tp!109030 () Bool)

(declare-fun b_and!50107 () Bool)

(assert (=> start!113248 (= tp!109030 b_and!50107)))

(declare-fun b!1340919 () Bool)

(declare-fun res!889182 () Bool)

(declare-fun e!763882 () Bool)

(assert (=> b!1340919 (=> (not res!889182) (not e!763882))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91127 0))(
  ( (array!91128 (arr!44015 (Array (_ BitVec 32) (_ BitVec 64))) (size!44566 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91127)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340919 (= res!889182 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44566 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57319 () Bool)

(declare-fun mapRes!57319 () Bool)

(assert (=> mapIsEmpty!57319 mapRes!57319))

(declare-fun b!1340920 () Bool)

(declare-fun res!889184 () Bool)

(assert (=> b!1340920 (=> (not res!889184) (not e!763882))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54537 0))(
  ( (V!54538 (val!18612 Int)) )
))
(declare-datatypes ((ValueCell!17639 0))(
  ( (ValueCellFull!17639 (v!21255 V!54537)) (EmptyCell!17639) )
))
(declare-datatypes ((array!91129 0))(
  ( (array!91130 (arr!44016 (Array (_ BitVec 32) ValueCell!17639)) (size!44567 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91129)

(assert (=> b!1340920 (= res!889184 (and (= (size!44567 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44566 _keys!1571) (size!44567 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340921 () Bool)

(declare-fun res!889183 () Bool)

(assert (=> b!1340921 (=> (not res!889183) (not e!763882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91127 (_ BitVec 32)) Bool)

(assert (=> b!1340921 (= res!889183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!889180 () Bool)

(assert (=> start!113248 (=> (not res!889180) (not e!763882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113248 (= res!889180 (validMask!0 mask!1977))))

(assert (=> start!113248 e!763882))

(declare-fun tp_is_empty!37075 () Bool)

(assert (=> start!113248 tp_is_empty!37075))

(assert (=> start!113248 true))

(declare-fun array_inv!33453 (array!91127) Bool)

(assert (=> start!113248 (array_inv!33453 _keys!1571)))

(declare-fun e!763883 () Bool)

(declare-fun array_inv!33454 (array!91129) Bool)

(assert (=> start!113248 (and (array_inv!33454 _values!1303) e!763883)))

(assert (=> start!113248 tp!109030))

(declare-fun b!1340922 () Bool)

(declare-fun e!763886 () Bool)

(assert (=> b!1340922 (= e!763883 (and e!763886 mapRes!57319))))

(declare-fun condMapEmpty!57319 () Bool)

(declare-fun mapDefault!57319 () ValueCell!17639)

(assert (=> b!1340922 (= condMapEmpty!57319 (= (arr!44016 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17639)) mapDefault!57319)))))

(declare-fun b!1340923 () Bool)

(assert (=> b!1340923 (= e!763882 false)))

(declare-fun minValue!1245 () V!54537)

(declare-fun lt!594383 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!54537)

(declare-datatypes ((tuple2!24006 0))(
  ( (tuple2!24007 (_1!12014 (_ BitVec 64)) (_2!12014 V!54537)) )
))
(declare-datatypes ((List!31163 0))(
  ( (Nil!31160) (Cons!31159 (h!32377 tuple2!24006) (t!45487 List!31163)) )
))
(declare-datatypes ((ListLongMap!21671 0))(
  ( (ListLongMap!21672 (toList!10851 List!31163)) )
))
(declare-fun contains!9039 (ListLongMap!21671 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5804 (array!91127 array!91129 (_ BitVec 32) (_ BitVec 32) V!54537 V!54537 (_ BitVec 32) Int) ListLongMap!21671)

(assert (=> b!1340923 (= lt!594383 (contains!9039 (getCurrentListMap!5804 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57319 () Bool)

(declare-fun tp!109029 () Bool)

(declare-fun e!763884 () Bool)

(assert (=> mapNonEmpty!57319 (= mapRes!57319 (and tp!109029 e!763884))))

(declare-fun mapRest!57319 () (Array (_ BitVec 32) ValueCell!17639))

(declare-fun mapValue!57319 () ValueCell!17639)

(declare-fun mapKey!57319 () (_ BitVec 32))

(assert (=> mapNonEmpty!57319 (= (arr!44016 _values!1303) (store mapRest!57319 mapKey!57319 mapValue!57319))))

(declare-fun b!1340924 () Bool)

(declare-fun res!889181 () Bool)

(assert (=> b!1340924 (=> (not res!889181) (not e!763882))))

(declare-datatypes ((List!31164 0))(
  ( (Nil!31161) (Cons!31160 (h!32378 (_ BitVec 64)) (t!45488 List!31164)) )
))
(declare-fun arrayNoDuplicates!0 (array!91127 (_ BitVec 32) List!31164) Bool)

(assert (=> b!1340924 (= res!889181 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31161))))

(declare-fun b!1340925 () Bool)

(assert (=> b!1340925 (= e!763884 tp_is_empty!37075)))

(declare-fun b!1340926 () Bool)

(assert (=> b!1340926 (= e!763886 tp_is_empty!37075)))

(assert (= (and start!113248 res!889180) b!1340920))

(assert (= (and b!1340920 res!889184) b!1340921))

(assert (= (and b!1340921 res!889183) b!1340924))

(assert (= (and b!1340924 res!889181) b!1340919))

(assert (= (and b!1340919 res!889182) b!1340923))

(assert (= (and b!1340922 condMapEmpty!57319) mapIsEmpty!57319))

(assert (= (and b!1340922 (not condMapEmpty!57319)) mapNonEmpty!57319))

(get-info :version)

(assert (= (and mapNonEmpty!57319 ((_ is ValueCellFull!17639) mapValue!57319)) b!1340925))

(assert (= (and b!1340922 ((_ is ValueCellFull!17639) mapDefault!57319)) b!1340926))

(assert (= start!113248 b!1340922))

(declare-fun m!1229211 () Bool)

(assert (=> b!1340921 m!1229211))

(declare-fun m!1229213 () Bool)

(assert (=> mapNonEmpty!57319 m!1229213))

(declare-fun m!1229215 () Bool)

(assert (=> b!1340923 m!1229215))

(assert (=> b!1340923 m!1229215))

(declare-fun m!1229217 () Bool)

(assert (=> b!1340923 m!1229217))

(declare-fun m!1229219 () Bool)

(assert (=> b!1340924 m!1229219))

(declare-fun m!1229221 () Bool)

(assert (=> start!113248 m!1229221))

(declare-fun m!1229223 () Bool)

(assert (=> start!113248 m!1229223))

(declare-fun m!1229225 () Bool)

(assert (=> start!113248 m!1229225))

(check-sat b_and!50107 (not b_next!31075) (not start!113248) (not b!1340921) (not b!1340923) (not b!1340924) (not mapNonEmpty!57319) tp_is_empty!37075)
(check-sat b_and!50107 (not b_next!31075))
