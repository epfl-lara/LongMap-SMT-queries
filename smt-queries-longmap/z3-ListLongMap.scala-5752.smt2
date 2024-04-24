; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74508 () Bool)

(assert start!74508)

(declare-fun b_free!15103 () Bool)

(declare-fun b_next!15103 () Bool)

(assert (=> start!74508 (= b_free!15103 (not b_next!15103))))

(declare-fun tp!52985 () Bool)

(declare-fun b_and!24889 () Bool)

(assert (=> start!74508 (= tp!52985 b_and!24889)))

(declare-fun b!875777 () Bool)

(declare-fun e!487650 () Bool)

(declare-fun tp_is_empty!17347 () Bool)

(assert (=> b!875777 (= e!487650 tp_is_empty!17347)))

(declare-fun b!875778 () Bool)

(declare-fun res!594912 () Bool)

(declare-fun e!487651 () Bool)

(assert (=> b!875778 (=> (not res!594912) (not e!487651))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875778 (= res!594912 (validMask!0 mask!1196))))

(declare-fun res!594914 () Bool)

(assert (=> start!74508 (=> (not res!594914) (not e!487651))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50873 0))(
  ( (array!50874 (arr!24460 (Array (_ BitVec 32) (_ BitVec 64))) (size!24901 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50873)

(assert (=> start!74508 (= res!594914 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24901 _keys!868))))))

(assert (=> start!74508 e!487651))

(assert (=> start!74508 tp_is_empty!17347))

(assert (=> start!74508 true))

(assert (=> start!74508 tp!52985))

(declare-fun array_inv!19344 (array!50873) Bool)

(assert (=> start!74508 (array_inv!19344 _keys!868)))

(declare-datatypes ((V!28177 0))(
  ( (V!28178 (val!8721 Int)) )
))
(declare-datatypes ((ValueCell!8234 0))(
  ( (ValueCellFull!8234 (v!11150 V!28177)) (EmptyCell!8234) )
))
(declare-datatypes ((array!50875 0))(
  ( (array!50876 (arr!24461 (Array (_ BitVec 32) ValueCell!8234)) (size!24902 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50875)

(declare-fun e!487648 () Bool)

(declare-fun array_inv!19345 (array!50875) Bool)

(assert (=> start!74508 (and (array_inv!19345 _values!688) e!487648)))

(declare-fun mapNonEmpty!27629 () Bool)

(declare-fun mapRes!27629 () Bool)

(declare-fun tp!52984 () Bool)

(declare-fun e!487652 () Bool)

(assert (=> mapNonEmpty!27629 (= mapRes!27629 (and tp!52984 e!487652))))

(declare-fun mapRest!27629 () (Array (_ BitVec 32) ValueCell!8234))

(declare-fun mapKey!27629 () (_ BitVec 32))

(declare-fun mapValue!27629 () ValueCell!8234)

(assert (=> mapNonEmpty!27629 (= (arr!24461 _values!688) (store mapRest!27629 mapKey!27629 mapValue!27629))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun b!875779 () Bool)

(assert (=> b!875779 (= e!487651 (and (= from!1053 i!612) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24901 _keys!868)) (bvsge (bvsub (size!24901 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (bvsub (size!24901 _keys!868) from!1053))))))

(declare-fun v!557 () V!28177)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28177)

(declare-fun zeroValue!654 () V!28177)

(declare-datatypes ((tuple2!11452 0))(
  ( (tuple2!11453 (_1!5737 (_ BitVec 64)) (_2!5737 V!28177)) )
))
(declare-datatypes ((List!17299 0))(
  ( (Nil!17296) (Cons!17295 (h!18432 tuple2!11452) (t!24332 List!17299)) )
))
(declare-datatypes ((ListLongMap!10223 0))(
  ( (ListLongMap!10224 (toList!5127 List!17299)) )
))
(declare-fun lt!396383 () ListLongMap!10223)

(declare-fun getCurrentListMapNoExtraKeys!3170 (array!50873 array!50875 (_ BitVec 32) (_ BitVec 32) V!28177 V!28177 (_ BitVec 32) Int) ListLongMap!10223)

(assert (=> b!875779 (= lt!396383 (getCurrentListMapNoExtraKeys!3170 _keys!868 (array!50876 (store (arr!24461 _values!688) i!612 (ValueCellFull!8234 v!557)) (size!24902 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396384 () ListLongMap!10223)

(assert (=> b!875779 (= lt!396384 (getCurrentListMapNoExtraKeys!3170 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875780 () Bool)

(declare-fun res!594910 () Bool)

(assert (=> b!875780 (=> (not res!594910) (not e!487651))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875780 (= res!594910 (validKeyInArray!0 k0!854))))

(declare-fun b!875781 () Bool)

(declare-fun res!594913 () Bool)

(assert (=> b!875781 (=> (not res!594913) (not e!487651))))

(declare-datatypes ((List!17300 0))(
  ( (Nil!17297) (Cons!17296 (h!18433 (_ BitVec 64)) (t!24333 List!17300)) )
))
(declare-fun arrayNoDuplicates!0 (array!50873 (_ BitVec 32) List!17300) Bool)

(assert (=> b!875781 (= res!594913 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17297))))

(declare-fun b!875782 () Bool)

(declare-fun res!594908 () Bool)

(assert (=> b!875782 (=> (not res!594908) (not e!487651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50873 (_ BitVec 32)) Bool)

(assert (=> b!875782 (= res!594908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875783 () Bool)

(assert (=> b!875783 (= e!487652 tp_is_empty!17347)))

(declare-fun b!875784 () Bool)

(declare-fun res!594911 () Bool)

(assert (=> b!875784 (=> (not res!594911) (not e!487651))))

(assert (=> b!875784 (= res!594911 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24901 _keys!868))))))

(declare-fun b!875785 () Bool)

(declare-fun res!594907 () Bool)

(assert (=> b!875785 (=> (not res!594907) (not e!487651))))

(assert (=> b!875785 (= res!594907 (and (= (size!24902 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24901 _keys!868) (size!24902 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27629 () Bool)

(assert (=> mapIsEmpty!27629 mapRes!27629))

(declare-fun b!875786 () Bool)

(assert (=> b!875786 (= e!487648 (and e!487650 mapRes!27629))))

(declare-fun condMapEmpty!27629 () Bool)

(declare-fun mapDefault!27629 () ValueCell!8234)

(assert (=> b!875786 (= condMapEmpty!27629 (= (arr!24461 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8234)) mapDefault!27629)))))

(declare-fun b!875787 () Bool)

(declare-fun res!594909 () Bool)

(assert (=> b!875787 (=> (not res!594909) (not e!487651))))

(assert (=> b!875787 (= res!594909 (and (= (select (arr!24460 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!74508 res!594914) b!875778))

(assert (= (and b!875778 res!594912) b!875785))

(assert (= (and b!875785 res!594907) b!875782))

(assert (= (and b!875782 res!594908) b!875781))

(assert (= (and b!875781 res!594913) b!875784))

(assert (= (and b!875784 res!594911) b!875780))

(assert (= (and b!875780 res!594910) b!875787))

(assert (= (and b!875787 res!594909) b!875779))

(assert (= (and b!875786 condMapEmpty!27629) mapIsEmpty!27629))

(assert (= (and b!875786 (not condMapEmpty!27629)) mapNonEmpty!27629))

(get-info :version)

(assert (= (and mapNonEmpty!27629 ((_ is ValueCellFull!8234) mapValue!27629)) b!875783))

(assert (= (and b!875786 ((_ is ValueCellFull!8234) mapDefault!27629)) b!875777))

(assert (= start!74508 b!875786))

(declare-fun m!816187 () Bool)

(assert (=> b!875779 m!816187))

(declare-fun m!816189 () Bool)

(assert (=> b!875779 m!816189))

(declare-fun m!816191 () Bool)

(assert (=> b!875779 m!816191))

(declare-fun m!816193 () Bool)

(assert (=> b!875780 m!816193))

(declare-fun m!816195 () Bool)

(assert (=> b!875778 m!816195))

(declare-fun m!816197 () Bool)

(assert (=> mapNonEmpty!27629 m!816197))

(declare-fun m!816199 () Bool)

(assert (=> b!875782 m!816199))

(declare-fun m!816201 () Bool)

(assert (=> start!74508 m!816201))

(declare-fun m!816203 () Bool)

(assert (=> start!74508 m!816203))

(declare-fun m!816205 () Bool)

(assert (=> b!875787 m!816205))

(declare-fun m!816207 () Bool)

(assert (=> b!875781 m!816207))

(check-sat (not mapNonEmpty!27629) (not b_next!15103) (not start!74508) (not b!875781) (not b!875779) (not b!875778) (not b!875782) b_and!24889 (not b!875780) tp_is_empty!17347)
(check-sat b_and!24889 (not b_next!15103))
