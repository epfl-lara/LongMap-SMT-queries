; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77790 () Bool)

(assert start!77790)

(declare-fun b_free!16207 () Bool)

(declare-fun b_next!16207 () Bool)

(assert (=> start!77790 (= b_free!16207 (not b_next!16207))))

(declare-fun tp!56884 () Bool)

(declare-fun b_and!26583 () Bool)

(assert (=> start!77790 (= tp!56884 b_and!26583)))

(declare-fun b!905670 () Bool)

(declare-fun res!610842 () Bool)

(declare-fun e!507567 () Bool)

(assert (=> b!905670 (=> (not res!610842) (not e!507567))))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53339 0))(
  ( (array!53340 (arr!25624 (Array (_ BitVec 32) (_ BitVec 64))) (size!26084 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53339)

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!905670 (= res!610842 (and (= (select (arr!25624 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905671 () Bool)

(declare-fun e!507569 () Bool)

(declare-fun tp_is_empty!18625 () Bool)

(assert (=> b!905671 (= e!507569 tp_is_empty!18625)))

(declare-fun b!905672 () Bool)

(declare-fun res!610848 () Bool)

(assert (=> b!905672 (=> (not res!610848) (not e!507567))))

(declare-datatypes ((List!17949 0))(
  ( (Nil!17946) (Cons!17945 (h!19097 (_ BitVec 64)) (t!25324 List!17949)) )
))
(declare-fun arrayNoDuplicates!0 (array!53339 (_ BitVec 32) List!17949) Bool)

(assert (=> b!905672 (= res!610848 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17946))))

(declare-fun b!905673 () Bool)

(declare-fun e!507572 () Bool)

(assert (=> b!905673 (= e!507567 (not e!507572))))

(declare-fun res!610843 () Bool)

(assert (=> b!905673 (=> res!610843 e!507572)))

(assert (=> b!905673 (= res!610843 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26084 _keys!1386))))))

(declare-fun arrayContainsKey!0 (array!53339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905673 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((V!29799 0))(
  ( (V!29800 (val!9363 Int)) )
))
(declare-fun zeroValue!1094 () V!29799)

(declare-datatypes ((Unit!30694 0))(
  ( (Unit!30695) )
))
(declare-fun lt!408678 () Unit!30694)

(declare-datatypes ((ValueCell!8831 0))(
  ( (ValueCellFull!8831 (v!11865 V!29799)) (EmptyCell!8831) )
))
(declare-datatypes ((array!53341 0))(
  ( (array!53342 (arr!25625 (Array (_ BitVec 32) ValueCell!8831)) (size!26085 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53341)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29799)

(declare-fun lemmaKeyInListMapIsInArray!194 (array!53339 array!53341 (_ BitVec 32) (_ BitVec 32) V!29799 V!29799 (_ BitVec 64) Int) Unit!30694)

(assert (=> b!905673 (= lt!408678 (lemmaKeyInListMapIsInArray!194 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905674 () Bool)

(declare-fun e!507571 () Bool)

(assert (=> b!905674 (= e!507572 e!507571)))

(declare-fun res!610846 () Bool)

(assert (=> b!905674 (=> res!610846 e!507571)))

(declare-datatypes ((tuple2!12102 0))(
  ( (tuple2!12103 (_1!6062 (_ BitVec 64)) (_2!6062 V!29799)) )
))
(declare-datatypes ((List!17950 0))(
  ( (Nil!17947) (Cons!17946 (h!19098 tuple2!12102) (t!25325 List!17950)) )
))
(declare-datatypes ((ListLongMap!10801 0))(
  ( (ListLongMap!10802 (toList!5416 List!17950)) )
))
(declare-fun lt!408679 () ListLongMap!10801)

(declare-fun contains!4472 (ListLongMap!10801 (_ BitVec 64)) Bool)

(assert (=> b!905674 (= res!610846 (not (contains!4472 lt!408679 k0!1033)))))

(declare-fun getCurrentListMap!2683 (array!53339 array!53341 (_ BitVec 32) (_ BitVec 32) V!29799 V!29799 (_ BitVec 32) Int) ListLongMap!10801)

(assert (=> b!905674 (= lt!408679 (getCurrentListMap!2683 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!610841 () Bool)

(assert (=> start!77790 (=> (not res!610841) (not e!507567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77790 (= res!610841 (validMask!0 mask!1756))))

(assert (=> start!77790 e!507567))

(declare-fun e!507568 () Bool)

(declare-fun array_inv!20136 (array!53341) Bool)

(assert (=> start!77790 (and (array_inv!20136 _values!1152) e!507568)))

(assert (=> start!77790 tp!56884))

(assert (=> start!77790 true))

(assert (=> start!77790 tp_is_empty!18625))

(declare-fun array_inv!20137 (array!53339) Bool)

(assert (=> start!77790 (array_inv!20137 _keys!1386)))

(declare-fun b!905675 () Bool)

(declare-fun res!610844 () Bool)

(assert (=> b!905675 (=> (not res!610844) (not e!507567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53339 (_ BitVec 32)) Bool)

(assert (=> b!905675 (= res!610844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29650 () Bool)

(declare-fun mapRes!29650 () Bool)

(assert (=> mapIsEmpty!29650 mapRes!29650))

(declare-fun b!905676 () Bool)

(declare-fun e!507570 () Bool)

(assert (=> b!905676 (= e!507570 tp_is_empty!18625)))

(declare-fun b!905677 () Bool)

(assert (=> b!905677 (= e!507568 (and e!507569 mapRes!29650))))

(declare-fun condMapEmpty!29650 () Bool)

(declare-fun mapDefault!29650 () ValueCell!8831)

(assert (=> b!905677 (= condMapEmpty!29650 (= (arr!25625 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8831)) mapDefault!29650)))))

(declare-fun b!905678 () Bool)

(declare-fun res!610847 () Bool)

(assert (=> b!905678 (=> (not res!610847) (not e!507567))))

(assert (=> b!905678 (= res!610847 (contains!4472 (getCurrentListMap!2683 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun mapNonEmpty!29650 () Bool)

(declare-fun tp!56883 () Bool)

(assert (=> mapNonEmpty!29650 (= mapRes!29650 (and tp!56883 e!507570))))

(declare-fun mapValue!29650 () ValueCell!8831)

(declare-fun mapRest!29650 () (Array (_ BitVec 32) ValueCell!8831))

(declare-fun mapKey!29650 () (_ BitVec 32))

(assert (=> mapNonEmpty!29650 (= (arr!25625 _values!1152) (store mapRest!29650 mapKey!29650 mapValue!29650))))

(declare-fun b!905679 () Bool)

(declare-fun res!610849 () Bool)

(assert (=> b!905679 (=> (not res!610849) (not e!507567))))

(assert (=> b!905679 (= res!610849 (and (= (size!26085 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26084 _keys!1386) (size!26085 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905680 () Bool)

(declare-fun res!610845 () Bool)

(assert (=> b!905680 (=> (not res!610845) (not e!507567))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905680 (= res!610845 (inRange!0 i!717 mask!1756))))

(declare-fun b!905681 () Bool)

(assert (=> b!905681 (= e!507571 true)))

(declare-fun lt!408677 () V!29799)

(declare-fun apply!442 (ListLongMap!10801 (_ BitVec 64)) V!29799)

(assert (=> b!905681 (= lt!408677 (apply!442 lt!408679 k0!1033))))

(assert (= (and start!77790 res!610841) b!905679))

(assert (= (and b!905679 res!610849) b!905675))

(assert (= (and b!905675 res!610844) b!905672))

(assert (= (and b!905672 res!610848) b!905678))

(assert (= (and b!905678 res!610847) b!905680))

(assert (= (and b!905680 res!610845) b!905670))

(assert (= (and b!905670 res!610842) b!905673))

(assert (= (and b!905673 (not res!610843)) b!905674))

(assert (= (and b!905674 (not res!610846)) b!905681))

(assert (= (and b!905677 condMapEmpty!29650) mapIsEmpty!29650))

(assert (= (and b!905677 (not condMapEmpty!29650)) mapNonEmpty!29650))

(get-info :version)

(assert (= (and mapNonEmpty!29650 ((_ is ValueCellFull!8831) mapValue!29650)) b!905676))

(assert (= (and b!905677 ((_ is ValueCellFull!8831) mapDefault!29650)) b!905671))

(assert (= start!77790 b!905677))

(declare-fun m!841499 () Bool)

(assert (=> b!905672 m!841499))

(declare-fun m!841501 () Bool)

(assert (=> b!905680 m!841501))

(declare-fun m!841503 () Bool)

(assert (=> b!905675 m!841503))

(declare-fun m!841505 () Bool)

(assert (=> b!905673 m!841505))

(declare-fun m!841507 () Bool)

(assert (=> b!905673 m!841507))

(declare-fun m!841509 () Bool)

(assert (=> b!905681 m!841509))

(declare-fun m!841511 () Bool)

(assert (=> b!905678 m!841511))

(assert (=> b!905678 m!841511))

(declare-fun m!841513 () Bool)

(assert (=> b!905678 m!841513))

(declare-fun m!841515 () Bool)

(assert (=> start!77790 m!841515))

(declare-fun m!841517 () Bool)

(assert (=> start!77790 m!841517))

(declare-fun m!841519 () Bool)

(assert (=> start!77790 m!841519))

(declare-fun m!841521 () Bool)

(assert (=> b!905670 m!841521))

(declare-fun m!841523 () Bool)

(assert (=> b!905674 m!841523))

(declare-fun m!841525 () Bool)

(assert (=> b!905674 m!841525))

(declare-fun m!841527 () Bool)

(assert (=> mapNonEmpty!29650 m!841527))

(check-sat (not mapNonEmpty!29650) (not b!905675) (not b_next!16207) (not b!905674) b_and!26583 (not b!905672) (not b!905680) (not start!77790) tp_is_empty!18625 (not b!905681) (not b!905678) (not b!905673))
(check-sat b_and!26583 (not b_next!16207))
