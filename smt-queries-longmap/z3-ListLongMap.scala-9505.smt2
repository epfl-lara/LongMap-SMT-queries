; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112946 () Bool)

(assert start!112946)

(declare-fun b_free!31033 () Bool)

(declare-fun b_next!31033 () Bool)

(assert (=> start!112946 (= b_free!31033 (not b_next!31033))))

(declare-fun tp!108743 () Bool)

(declare-fun b_and!50013 () Bool)

(assert (=> start!112946 (= tp!108743 b_and!50013)))

(declare-fun mapIsEmpty!57095 () Bool)

(declare-fun mapRes!57095 () Bool)

(assert (=> mapIsEmpty!57095 mapRes!57095))

(declare-fun b!1338419 () Bool)

(declare-fun e!762236 () Bool)

(declare-fun tp_is_empty!36943 () Bool)

(assert (=> b!1338419 (= e!762236 tp_is_empty!36943)))

(declare-fun res!887847 () Bool)

(declare-fun e!762235 () Bool)

(assert (=> start!112946 (=> (not res!887847) (not e!762235))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112946 (= res!887847 (validMask!0 mask!1998))))

(assert (=> start!112946 e!762235))

(declare-datatypes ((V!54361 0))(
  ( (V!54362 (val!18546 Int)) )
))
(declare-datatypes ((ValueCell!17573 0))(
  ( (ValueCellFull!17573 (v!21182 V!54361)) (EmptyCell!17573) )
))
(declare-datatypes ((array!90861 0))(
  ( (array!90862 (arr!43890 (Array (_ BitVec 32) ValueCell!17573)) (size!44441 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90861)

(declare-fun e!762238 () Bool)

(declare-fun array_inv!33363 (array!90861) Bool)

(assert (=> start!112946 (and (array_inv!33363 _values!1320) e!762238)))

(assert (=> start!112946 true))

(declare-datatypes ((array!90863 0))(
  ( (array!90864 (arr!43891 (Array (_ BitVec 32) (_ BitVec 64))) (size!44442 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90863)

(declare-fun array_inv!33364 (array!90863) Bool)

(assert (=> start!112946 (array_inv!33364 _keys!1590)))

(assert (=> start!112946 tp!108743))

(assert (=> start!112946 tp_is_empty!36943))

(declare-fun b!1338420 () Bool)

(declare-fun res!887848 () Bool)

(assert (=> b!1338420 (=> (not res!887848) (not e!762235))))

(declare-datatypes ((List!31109 0))(
  ( (Nil!31106) (Cons!31105 (h!32323 (_ BitVec 64)) (t!45413 List!31109)) )
))
(declare-fun arrayNoDuplicates!0 (array!90863 (_ BitVec 32) List!31109) Bool)

(assert (=> b!1338420 (= res!887848 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31106))))

(declare-fun b!1338421 () Bool)

(assert (=> b!1338421 (= e!762235 false)))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!593558 () Bool)

(declare-fun minValue!1262 () V!54361)

(declare-fun zeroValue!1262 () V!54361)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23968 0))(
  ( (tuple2!23969 (_1!11995 (_ BitVec 64)) (_2!11995 V!54361)) )
))
(declare-datatypes ((List!31110 0))(
  ( (Nil!31107) (Cons!31106 (h!32324 tuple2!23968) (t!45414 List!31110)) )
))
(declare-datatypes ((ListLongMap!21633 0))(
  ( (ListLongMap!21634 (toList!10832 List!31110)) )
))
(declare-fun contains!9011 (ListLongMap!21633 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5786 (array!90863 array!90861 (_ BitVec 32) (_ BitVec 32) V!54361 V!54361 (_ BitVec 32) Int) ListLongMap!21633)

(assert (=> b!1338421 (= lt!593558 (contains!9011 (getCurrentListMap!5786 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1338422 () Bool)

(declare-fun res!887849 () Bool)

(assert (=> b!1338422 (=> (not res!887849) (not e!762235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90863 (_ BitVec 32)) Bool)

(assert (=> b!1338422 (= res!887849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1338423 () Bool)

(declare-fun e!762237 () Bool)

(assert (=> b!1338423 (= e!762237 tp_is_empty!36943)))

(declare-fun b!1338424 () Bool)

(assert (=> b!1338424 (= e!762238 (and e!762237 mapRes!57095))))

(declare-fun condMapEmpty!57095 () Bool)

(declare-fun mapDefault!57095 () ValueCell!17573)

(assert (=> b!1338424 (= condMapEmpty!57095 (= (arr!43890 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17573)) mapDefault!57095)))))

(declare-fun mapNonEmpty!57095 () Bool)

(declare-fun tp!108742 () Bool)

(assert (=> mapNonEmpty!57095 (= mapRes!57095 (and tp!108742 e!762236))))

(declare-fun mapKey!57095 () (_ BitVec 32))

(declare-fun mapRest!57095 () (Array (_ BitVec 32) ValueCell!17573))

(declare-fun mapValue!57095 () ValueCell!17573)

(assert (=> mapNonEmpty!57095 (= (arr!43890 _values!1320) (store mapRest!57095 mapKey!57095 mapValue!57095))))

(declare-fun b!1338425 () Bool)

(declare-fun res!887851 () Bool)

(assert (=> b!1338425 (=> (not res!887851) (not e!762235))))

(assert (=> b!1338425 (= res!887851 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44442 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1338426 () Bool)

(declare-fun res!887850 () Bool)

(assert (=> b!1338426 (=> (not res!887850) (not e!762235))))

(assert (=> b!1338426 (= res!887850 (and (= (size!44441 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44442 _keys!1590) (size!44441 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112946 res!887847) b!1338426))

(assert (= (and b!1338426 res!887850) b!1338422))

(assert (= (and b!1338422 res!887849) b!1338420))

(assert (= (and b!1338420 res!887848) b!1338425))

(assert (= (and b!1338425 res!887851) b!1338421))

(assert (= (and b!1338424 condMapEmpty!57095) mapIsEmpty!57095))

(assert (= (and b!1338424 (not condMapEmpty!57095)) mapNonEmpty!57095))

(get-info :version)

(assert (= (and mapNonEmpty!57095 ((_ is ValueCellFull!17573) mapValue!57095)) b!1338419))

(assert (= (and b!1338424 ((_ is ValueCellFull!17573) mapDefault!57095)) b!1338423))

(assert (= start!112946 b!1338424))

(declare-fun m!1226845 () Bool)

(assert (=> b!1338422 m!1226845))

(declare-fun m!1226847 () Bool)

(assert (=> b!1338420 m!1226847))

(declare-fun m!1226849 () Bool)

(assert (=> mapNonEmpty!57095 m!1226849))

(declare-fun m!1226851 () Bool)

(assert (=> start!112946 m!1226851))

(declare-fun m!1226853 () Bool)

(assert (=> start!112946 m!1226853))

(declare-fun m!1226855 () Bool)

(assert (=> start!112946 m!1226855))

(declare-fun m!1226857 () Bool)

(assert (=> b!1338421 m!1226857))

(assert (=> b!1338421 m!1226857))

(declare-fun m!1226859 () Bool)

(assert (=> b!1338421 m!1226859))

(check-sat (not b!1338422) (not b!1338421) tp_is_empty!36943 (not b!1338420) b_and!50013 (not mapNonEmpty!57095) (not start!112946) (not b_next!31033))
(check-sat b_and!50013 (not b_next!31033))
