; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77692 () Bool)

(assert start!77692)

(declare-fun b_free!16277 () Bool)

(declare-fun b_next!16277 () Bool)

(assert (=> start!77692 (= b_free!16277 (not b_next!16277))))

(declare-fun tp!57092 () Bool)

(declare-fun b_and!26707 () Bool)

(assert (=> start!77692 (= tp!57092 b_and!26707)))

(declare-fun b!906189 () Bool)

(declare-fun e!507823 () Bool)

(assert (=> b!906189 (= e!507823 true)))

(declare-datatypes ((V!29891 0))(
  ( (V!29892 (val!9398 Int)) )
))
(declare-datatypes ((tuple2!12230 0))(
  ( (tuple2!12231 (_1!6126 (_ BitVec 64)) (_2!6126 V!29891)) )
))
(declare-datatypes ((List!18037 0))(
  ( (Nil!18034) (Cons!18033 (h!19179 tuple2!12230) (t!25486 List!18037)) )
))
(declare-datatypes ((ListLongMap!10927 0))(
  ( (ListLongMap!10928 (toList!5479 List!18037)) )
))
(declare-fun lt!408827 () ListLongMap!10927)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun lt!408829 () V!29891)

(declare-fun apply!466 (ListLongMap!10927 (_ BitVec 64)) V!29891)

(assert (=> b!906189 (= (apply!466 lt!408827 k!1033) lt!408829)))

(declare-datatypes ((ValueCell!8866 0))(
  ( (ValueCellFull!8866 (v!11903 V!29891)) (EmptyCell!8866) )
))
(declare-datatypes ((array!53432 0))(
  ( (array!53433 (arr!25675 (Array (_ BitVec 32) ValueCell!8866)) (size!26134 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53432)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29891)

(declare-datatypes ((array!53434 0))(
  ( (array!53435 (arr!25676 (Array (_ BitVec 32) (_ BitVec 64))) (size!26135 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53434)

(declare-datatypes ((Unit!30752 0))(
  ( (Unit!30753) )
))
(declare-fun lt!408831 () Unit!30752)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29891)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!21 (array!53434 array!53432 (_ BitVec 32) (_ BitVec 32) V!29891 V!29891 (_ BitVec 64) V!29891 (_ BitVec 32) Int) Unit!30752)

(assert (=> b!906189 (= lt!408831 (lemmaListMapApplyFromThenApplyFromZero!21 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408829 i!717 defaultEntry!1160))))

(declare-fun b!906190 () Bool)

(declare-fun res!611540 () Bool)

(declare-fun e!507822 () Bool)

(assert (=> b!906190 (=> (not res!611540) (not e!507822))))

(assert (=> b!906190 (= res!611540 (and (= (size!26134 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26135 _keys!1386) (size!26134 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906191 () Bool)

(declare-fun res!611547 () Bool)

(assert (=> b!906191 (=> res!611547 e!507823)))

(declare-fun lt!408828 () ListLongMap!10927)

(assert (=> b!906191 (= res!611547 (not (= (apply!466 lt!408828 k!1033) lt!408829)))))

(declare-fun b!906192 () Bool)

(declare-fun e!507825 () Bool)

(declare-fun tp_is_empty!18695 () Bool)

(assert (=> b!906192 (= e!507825 tp_is_empty!18695)))

(declare-fun mapNonEmpty!29755 () Bool)

(declare-fun mapRes!29755 () Bool)

(declare-fun tp!57093 () Bool)

(assert (=> mapNonEmpty!29755 (= mapRes!29755 (and tp!57093 e!507825))))

(declare-fun mapKey!29755 () (_ BitVec 32))

(declare-fun mapRest!29755 () (Array (_ BitVec 32) ValueCell!8866))

(declare-fun mapValue!29755 () ValueCell!8866)

(assert (=> mapNonEmpty!29755 (= (arr!25675 _values!1152) (store mapRest!29755 mapKey!29755 mapValue!29755))))

(declare-fun b!906193 () Bool)

(declare-fun res!611549 () Bool)

(declare-fun e!507821 () Bool)

(assert (=> b!906193 (=> (not res!611549) (not e!507821))))

(assert (=> b!906193 (= res!611549 (and (= (select (arr!25676 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906194 () Bool)

(assert (=> b!906194 (= e!507822 e!507821)))

(declare-fun res!611545 () Bool)

(assert (=> b!906194 (=> (not res!611545) (not e!507821))))

(declare-fun contains!4524 (ListLongMap!10927 (_ BitVec 64)) Bool)

(assert (=> b!906194 (= res!611545 (contains!4524 lt!408827 k!1033))))

(declare-fun getCurrentListMap!2745 (array!53434 array!53432 (_ BitVec 32) (_ BitVec 32) V!29891 V!29891 (_ BitVec 32) Int) ListLongMap!10927)

(assert (=> b!906194 (= lt!408827 (getCurrentListMap!2745 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906195 () Bool)

(declare-fun res!611543 () Bool)

(assert (=> b!906195 (=> (not res!611543) (not e!507822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53434 (_ BitVec 32)) Bool)

(assert (=> b!906195 (= res!611543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906196 () Bool)

(declare-fun e!507820 () Bool)

(assert (=> b!906196 (= e!507820 tp_is_empty!18695)))

(declare-fun res!611546 () Bool)

(assert (=> start!77692 (=> (not res!611546) (not e!507822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77692 (= res!611546 (validMask!0 mask!1756))))

(assert (=> start!77692 e!507822))

(declare-fun e!507819 () Bool)

(declare-fun array_inv!20114 (array!53432) Bool)

(assert (=> start!77692 (and (array_inv!20114 _values!1152) e!507819)))

(assert (=> start!77692 tp!57092))

(assert (=> start!77692 true))

(assert (=> start!77692 tp_is_empty!18695))

(declare-fun array_inv!20115 (array!53434) Bool)

(assert (=> start!77692 (array_inv!20115 _keys!1386)))

(declare-fun b!906197 () Bool)

(declare-fun e!507818 () Bool)

(assert (=> b!906197 (= e!507818 e!507823)))

(declare-fun res!611544 () Bool)

(assert (=> b!906197 (=> res!611544 e!507823)))

(assert (=> b!906197 (= res!611544 (not (contains!4524 lt!408828 k!1033)))))

(assert (=> b!906197 (= lt!408828 (getCurrentListMap!2745 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906198 () Bool)

(declare-fun res!611542 () Bool)

(assert (=> b!906198 (=> (not res!611542) (not e!507821))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906198 (= res!611542 (inRange!0 i!717 mask!1756))))

(declare-fun b!906199 () Bool)

(declare-fun res!611541 () Bool)

(assert (=> b!906199 (=> (not res!611541) (not e!507822))))

(declare-datatypes ((List!18038 0))(
  ( (Nil!18035) (Cons!18034 (h!19180 (_ BitVec 64)) (t!25487 List!18038)) )
))
(declare-fun arrayNoDuplicates!0 (array!53434 (_ BitVec 32) List!18038) Bool)

(assert (=> b!906199 (= res!611541 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18035))))

(declare-fun b!906200 () Bool)

(assert (=> b!906200 (= e!507819 (and e!507820 mapRes!29755))))

(declare-fun condMapEmpty!29755 () Bool)

(declare-fun mapDefault!29755 () ValueCell!8866)

