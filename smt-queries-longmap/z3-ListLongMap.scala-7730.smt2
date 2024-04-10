; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97110 () Bool)

(assert start!97110)

(declare-fun b!1104452 () Bool)

(declare-fun res!736856 () Bool)

(declare-fun e!630431 () Bool)

(assert (=> b!1104452 (=> (not res!736856) (not e!630431))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104452 (= res!736856 (validKeyInArray!0 k0!934))))

(declare-fun b!1104453 () Bool)

(declare-fun e!630430 () Bool)

(declare-fun tp_is_empty!27357 () Bool)

(assert (=> b!1104453 (= e!630430 tp_is_empty!27357)))

(declare-fun b!1104454 () Bool)

(declare-fun res!736859 () Bool)

(assert (=> b!1104454 (=> (not res!736859) (not e!630431))))

(declare-datatypes ((array!71639 0))(
  ( (array!71640 (arr!34473 (Array (_ BitVec 32) (_ BitVec 64))) (size!35009 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71639)

(declare-datatypes ((List!24058 0))(
  ( (Nil!24055) (Cons!24054 (h!25263 (_ BitVec 64)) (t!34323 List!24058)) )
))
(declare-fun arrayNoDuplicates!0 (array!71639 (_ BitVec 32) List!24058) Bool)

(assert (=> b!1104454 (= res!736859 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24055))))

(declare-fun b!1104456 () Bool)

(declare-fun res!736862 () Bool)

(assert (=> b!1104456 (=> (not res!736862) (not e!630431))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71639 (_ BitVec 32)) Bool)

(assert (=> b!1104456 (= res!736862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104457 () Bool)

(declare-fun res!736861 () Bool)

(assert (=> b!1104457 (=> (not res!736861) (not e!630431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104457 (= res!736861 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42850 () Bool)

(declare-fun mapRes!42850 () Bool)

(assert (=> mapIsEmpty!42850 mapRes!42850))

(declare-fun b!1104458 () Bool)

(declare-fun res!736858 () Bool)

(assert (=> b!1104458 (=> (not res!736858) (not e!630431))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104458 (= res!736858 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35009 _keys!1208))))))

(declare-fun mapNonEmpty!42850 () Bool)

(declare-fun tp!81770 () Bool)

(declare-fun e!630428 () Bool)

(assert (=> mapNonEmpty!42850 (= mapRes!42850 (and tp!81770 e!630428))))

(declare-datatypes ((V!41603 0))(
  ( (V!41604 (val!13735 Int)) )
))
(declare-datatypes ((ValueCell!12969 0))(
  ( (ValueCellFull!12969 (v!16368 V!41603)) (EmptyCell!12969) )
))
(declare-fun mapValue!42850 () ValueCell!12969)

(declare-fun mapRest!42850 () (Array (_ BitVec 32) ValueCell!12969))

(declare-fun mapKey!42850 () (_ BitVec 32))

(declare-datatypes ((array!71641 0))(
  ( (array!71642 (arr!34474 (Array (_ BitVec 32) ValueCell!12969)) (size!35010 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71641)

(assert (=> mapNonEmpty!42850 (= (arr!34474 _values!996) (store mapRest!42850 mapKey!42850 mapValue!42850))))

(declare-fun b!1104459 () Bool)

(declare-fun res!736860 () Bool)

(assert (=> b!1104459 (=> (not res!736860) (not e!630431))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104459 (= res!736860 (and (= (size!35010 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35009 _keys!1208) (size!35010 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104460 () Bool)

(declare-fun e!630427 () Bool)

(assert (=> b!1104460 (= e!630427 (and e!630430 mapRes!42850))))

(declare-fun condMapEmpty!42850 () Bool)

(declare-fun mapDefault!42850 () ValueCell!12969)

(assert (=> b!1104460 (= condMapEmpty!42850 (= (arr!34474 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12969)) mapDefault!42850)))))

(declare-fun b!1104461 () Bool)

(assert (=> b!1104461 (= e!630428 tp_is_empty!27357)))

(declare-fun b!1104455 () Bool)

(declare-fun e!630426 () Bool)

(assert (=> b!1104455 (= e!630426 false)))

(declare-fun lt!495142 () Bool)

(declare-fun lt!495143 () array!71639)

(assert (=> b!1104455 (= lt!495142 (arrayNoDuplicates!0 lt!495143 #b00000000000000000000000000000000 Nil!24055))))

(declare-fun res!736855 () Bool)

(assert (=> start!97110 (=> (not res!736855) (not e!630431))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97110 (= res!736855 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35009 _keys!1208))))))

(assert (=> start!97110 e!630431))

(declare-fun array_inv!26540 (array!71639) Bool)

(assert (=> start!97110 (array_inv!26540 _keys!1208)))

(assert (=> start!97110 true))

(declare-fun array_inv!26541 (array!71641) Bool)

(assert (=> start!97110 (and (array_inv!26541 _values!996) e!630427)))

(declare-fun b!1104462 () Bool)

(declare-fun res!736854 () Bool)

(assert (=> b!1104462 (=> (not res!736854) (not e!630431))))

(assert (=> b!1104462 (= res!736854 (= (select (arr!34473 _keys!1208) i!673) k0!934))))

(declare-fun b!1104463 () Bool)

(assert (=> b!1104463 (= e!630431 e!630426)))

(declare-fun res!736857 () Bool)

(assert (=> b!1104463 (=> (not res!736857) (not e!630426))))

(assert (=> b!1104463 (= res!736857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495143 mask!1564))))

(assert (=> b!1104463 (= lt!495143 (array!71640 (store (arr!34473 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35009 _keys!1208)))))

(assert (= (and start!97110 res!736855) b!1104457))

(assert (= (and b!1104457 res!736861) b!1104459))

(assert (= (and b!1104459 res!736860) b!1104456))

(assert (= (and b!1104456 res!736862) b!1104454))

(assert (= (and b!1104454 res!736859) b!1104458))

(assert (= (and b!1104458 res!736858) b!1104452))

(assert (= (and b!1104452 res!736856) b!1104462))

(assert (= (and b!1104462 res!736854) b!1104463))

(assert (= (and b!1104463 res!736857) b!1104455))

(assert (= (and b!1104460 condMapEmpty!42850) mapIsEmpty!42850))

(assert (= (and b!1104460 (not condMapEmpty!42850)) mapNonEmpty!42850))

(get-info :version)

(assert (= (and mapNonEmpty!42850 ((_ is ValueCellFull!12969) mapValue!42850)) b!1104461))

(assert (= (and b!1104460 ((_ is ValueCellFull!12969) mapDefault!42850)) b!1104453))

(assert (= start!97110 b!1104460))

(declare-fun m!1024195 () Bool)

(assert (=> b!1104455 m!1024195))

(declare-fun m!1024197 () Bool)

(assert (=> b!1104456 m!1024197))

(declare-fun m!1024199 () Bool)

(assert (=> start!97110 m!1024199))

(declare-fun m!1024201 () Bool)

(assert (=> start!97110 m!1024201))

(declare-fun m!1024203 () Bool)

(assert (=> mapNonEmpty!42850 m!1024203))

(declare-fun m!1024205 () Bool)

(assert (=> b!1104454 m!1024205))

(declare-fun m!1024207 () Bool)

(assert (=> b!1104452 m!1024207))

(declare-fun m!1024209 () Bool)

(assert (=> b!1104457 m!1024209))

(declare-fun m!1024211 () Bool)

(assert (=> b!1104463 m!1024211))

(declare-fun m!1024213 () Bool)

(assert (=> b!1104463 m!1024213))

(declare-fun m!1024215 () Bool)

(assert (=> b!1104462 m!1024215))

(check-sat (not b!1104455) (not b!1104463) (not b!1104456) (not b!1104454) (not start!97110) tp_is_empty!27357 (not b!1104457) (not b!1104452) (not mapNonEmpty!42850))
(check-sat)
