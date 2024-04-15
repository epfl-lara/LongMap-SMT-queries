; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113600 () Bool)

(assert start!113600)

(declare-fun b_free!31567 () Bool)

(declare-fun b_next!31567 () Bool)

(assert (=> start!113600 (= b_free!31567 (not b_next!31567))))

(declare-fun tp!110513 () Bool)

(declare-fun b_and!50907 () Bool)

(assert (=> start!113600 (= tp!110513 b_and!50907)))

(declare-fun mapNonEmpty!58064 () Bool)

(declare-fun mapRes!58064 () Bool)

(declare-fun tp!110514 () Bool)

(declare-fun e!767145 () Bool)

(assert (=> mapNonEmpty!58064 (= mapRes!58064 (and tp!110514 e!767145))))

(declare-datatypes ((V!55193 0))(
  ( (V!55194 (val!18858 Int)) )
))
(declare-datatypes ((ValueCell!17885 0))(
  ( (ValueCellFull!17885 (v!21509 V!55193)) (EmptyCell!17885) )
))
(declare-fun mapRest!58064 () (Array (_ BitVec 32) ValueCell!17885))

(declare-fun mapValue!58064 () ValueCell!17885)

(declare-datatypes ((array!91913 0))(
  ( (array!91914 (arr!44411 (Array (_ BitVec 32) ValueCell!17885)) (size!44963 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91913)

(declare-fun mapKey!58064 () (_ BitVec 32))

(assert (=> mapNonEmpty!58064 (= (arr!44411 _values!1303) (store mapRest!58064 mapKey!58064 mapValue!58064))))

(declare-fun b!1348492 () Bool)

(declare-fun e!767142 () Bool)

(declare-fun e!767143 () Bool)

(assert (=> b!1348492 (= e!767142 (and e!767143 mapRes!58064))))

(declare-fun condMapEmpty!58064 () Bool)

(declare-fun mapDefault!58064 () ValueCell!17885)

(assert (=> b!1348492 (= condMapEmpty!58064 (= (arr!44411 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17885)) mapDefault!58064)))))

(declare-fun mapIsEmpty!58064 () Bool)

(assert (=> mapIsEmpty!58064 mapRes!58064))

(declare-fun res!894721 () Bool)

(declare-fun e!767144 () Bool)

(assert (=> start!113600 (=> (not res!894721) (not e!767144))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113600 (= res!894721 (validMask!0 mask!1977))))

(assert (=> start!113600 e!767144))

(declare-fun tp_is_empty!37567 () Bool)

(assert (=> start!113600 tp_is_empty!37567))

(assert (=> start!113600 true))

(declare-datatypes ((array!91915 0))(
  ( (array!91916 (arr!44412 (Array (_ BitVec 32) (_ BitVec 64))) (size!44964 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91915)

(declare-fun array_inv!33653 (array!91915) Bool)

(assert (=> start!113600 (array_inv!33653 _keys!1571)))

(declare-fun array_inv!33654 (array!91913) Bool)

(assert (=> start!113600 (and (array_inv!33654 _values!1303) e!767142)))

(assert (=> start!113600 tp!110513))

(declare-fun b!1348493 () Bool)

(declare-fun res!894723 () Bool)

(assert (=> b!1348493 (=> (not res!894723) (not e!767144))))

(declare-fun minValue!1245 () V!55193)

(declare-fun zeroValue!1245 () V!55193)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24390 0))(
  ( (tuple2!24391 (_1!12206 (_ BitVec 64)) (_2!12206 V!55193)) )
))
(declare-datatypes ((List!31523 0))(
  ( (Nil!31520) (Cons!31519 (h!32728 tuple2!24390) (t!46153 List!31523)) )
))
(declare-datatypes ((ListLongMap!22047 0))(
  ( (ListLongMap!22048 (toList!11039 List!31523)) )
))
(declare-fun contains!9146 (ListLongMap!22047 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5871 (array!91915 array!91913 (_ BitVec 32) (_ BitVec 32) V!55193 V!55193 (_ BitVec 32) Int) ListLongMap!22047)

(assert (=> b!1348493 (= res!894723 (contains!9146 (getCurrentListMap!5871 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348494 () Bool)

(declare-fun res!894725 () Bool)

(assert (=> b!1348494 (=> (not res!894725) (not e!767144))))

(declare-datatypes ((List!31524 0))(
  ( (Nil!31521) (Cons!31520 (h!32729 (_ BitVec 64)) (t!46154 List!31524)) )
))
(declare-fun arrayNoDuplicates!0 (array!91915 (_ BitVec 32) List!31524) Bool)

(assert (=> b!1348494 (= res!894725 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31521))))

(declare-fun b!1348495 () Bool)

(assert (=> b!1348495 (= e!767144 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1960 (size!44963 _values!1303))))))

(declare-fun b!1348496 () Bool)

(assert (=> b!1348496 (= e!767143 tp_is_empty!37567)))

(declare-fun b!1348497 () Bool)

(assert (=> b!1348497 (= e!767145 tp_is_empty!37567)))

(declare-fun b!1348498 () Bool)

(declare-fun res!894719 () Bool)

(assert (=> b!1348498 (=> (not res!894719) (not e!767144))))

(assert (=> b!1348498 (= res!894719 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44964 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348499 () Bool)

(declare-fun res!894726 () Bool)

(assert (=> b!1348499 (=> (not res!894726) (not e!767144))))

(assert (=> b!1348499 (= res!894726 (not (= (select (arr!44412 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1348500 () Bool)

(declare-fun res!894722 () Bool)

(assert (=> b!1348500 (=> (not res!894722) (not e!767144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91915 (_ BitVec 32)) Bool)

(assert (=> b!1348500 (= res!894722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348501 () Bool)

(declare-fun res!894724 () Bool)

(assert (=> b!1348501 (=> (not res!894724) (not e!767144))))

(assert (=> b!1348501 (= res!894724 (and (= (size!44963 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44964 _keys!1571) (size!44963 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348502 () Bool)

(declare-fun res!894720 () Bool)

(assert (=> b!1348502 (=> (not res!894720) (not e!767144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348502 (= res!894720 (validKeyInArray!0 (select (arr!44412 _keys!1571) from!1960)))))

(assert (= (and start!113600 res!894721) b!1348501))

(assert (= (and b!1348501 res!894724) b!1348500))

(assert (= (and b!1348500 res!894722) b!1348494))

(assert (= (and b!1348494 res!894725) b!1348498))

(assert (= (and b!1348498 res!894719) b!1348493))

(assert (= (and b!1348493 res!894723) b!1348499))

(assert (= (and b!1348499 res!894726) b!1348502))

(assert (= (and b!1348502 res!894720) b!1348495))

(assert (= (and b!1348492 condMapEmpty!58064) mapIsEmpty!58064))

(assert (= (and b!1348492 (not condMapEmpty!58064)) mapNonEmpty!58064))

(get-info :version)

(assert (= (and mapNonEmpty!58064 ((_ is ValueCellFull!17885) mapValue!58064)) b!1348497))

(assert (= (and b!1348492 ((_ is ValueCellFull!17885) mapDefault!58064)) b!1348496))

(assert (= start!113600 b!1348492))

(declare-fun m!1235103 () Bool)

(assert (=> b!1348493 m!1235103))

(assert (=> b!1348493 m!1235103))

(declare-fun m!1235105 () Bool)

(assert (=> b!1348493 m!1235105))

(declare-fun m!1235107 () Bool)

(assert (=> b!1348499 m!1235107))

(assert (=> b!1348502 m!1235107))

(assert (=> b!1348502 m!1235107))

(declare-fun m!1235109 () Bool)

(assert (=> b!1348502 m!1235109))

(declare-fun m!1235111 () Bool)

(assert (=> b!1348494 m!1235111))

(declare-fun m!1235113 () Bool)

(assert (=> b!1348500 m!1235113))

(declare-fun m!1235115 () Bool)

(assert (=> start!113600 m!1235115))

(declare-fun m!1235117 () Bool)

(assert (=> start!113600 m!1235117))

(declare-fun m!1235119 () Bool)

(assert (=> start!113600 m!1235119))

(declare-fun m!1235121 () Bool)

(assert (=> mapNonEmpty!58064 m!1235121))

(check-sat (not b!1348500) tp_is_empty!37567 b_and!50907 (not b!1348502) (not b!1348493) (not mapNonEmpty!58064) (not b_next!31567) (not b!1348494) (not start!113600))
(check-sat b_and!50907 (not b_next!31567))
