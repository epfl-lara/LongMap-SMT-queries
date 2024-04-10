; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77700 () Bool)

(assert start!77700)

(declare-fun b_free!16285 () Bool)

(declare-fun b_next!16285 () Bool)

(assert (=> start!77700 (= b_free!16285 (not b_next!16285))))

(declare-fun tp!57117 () Bool)

(declare-fun b_and!26723 () Bool)

(assert (=> start!77700 (= tp!57117 b_and!26723)))

(declare-fun b!906353 () Bool)

(declare-fun res!611669 () Bool)

(declare-fun e!507918 () Bool)

(assert (=> b!906353 (=> (not res!611669) (not e!507918))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906353 (= res!611669 (inRange!0 i!717 mask!1756))))

(declare-fun b!906354 () Bool)

(declare-fun e!507917 () Bool)

(declare-fun tp_is_empty!18703 () Bool)

(assert (=> b!906354 (= e!507917 tp_is_empty!18703)))

(declare-fun b!906355 () Bool)

(declare-fun res!611668 () Bool)

(declare-fun e!507920 () Bool)

(assert (=> b!906355 (=> (not res!611668) (not e!507920))))

(declare-datatypes ((V!29903 0))(
  ( (V!29904 (val!9402 Int)) )
))
(declare-datatypes ((ValueCell!8870 0))(
  ( (ValueCellFull!8870 (v!11907 V!29903)) (EmptyCell!8870) )
))
(declare-datatypes ((array!53448 0))(
  ( (array!53449 (arr!25683 (Array (_ BitVec 32) ValueCell!8870)) (size!26142 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53448)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!53450 0))(
  ( (array!53451 (arr!25684 (Array (_ BitVec 32) (_ BitVec 64))) (size!26143 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53450)

(assert (=> b!906355 (= res!611668 (and (= (size!26142 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26143 _keys!1386) (size!26142 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906356 () Bool)

(declare-fun res!611660 () Bool)

(declare-fun e!507921 () Bool)

(assert (=> b!906356 (=> res!611660 e!507921)))

(declare-fun lt!408889 () V!29903)

(declare-datatypes ((tuple2!12238 0))(
  ( (tuple2!12239 (_1!6130 (_ BitVec 64)) (_2!6130 V!29903)) )
))
(declare-datatypes ((List!18044 0))(
  ( (Nil!18041) (Cons!18040 (h!19186 tuple2!12238) (t!25501 List!18044)) )
))
(declare-datatypes ((ListLongMap!10935 0))(
  ( (ListLongMap!10936 (toList!5483 List!18044)) )
))
(declare-fun lt!408887 () ListLongMap!10935)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun apply!469 (ListLongMap!10935 (_ BitVec 64)) V!29903)

(assert (=> b!906356 (= res!611660 (not (= (apply!469 lt!408887 k!1033) lt!408889)))))

(declare-fun b!906357 () Bool)

(assert (=> b!906357 (= e!507921 true)))

(declare-fun lt!408888 () ListLongMap!10935)

(assert (=> b!906357 (= (apply!469 lt!408888 k!1033) lt!408889)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29903)

(declare-datatypes ((Unit!30760 0))(
  ( (Unit!30761) )
))
(declare-fun lt!408890 () Unit!30760)

(declare-fun minValue!1094 () V!29903)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!24 (array!53450 array!53448 (_ BitVec 32) (_ BitVec 32) V!29903 V!29903 (_ BitVec 64) V!29903 (_ BitVec 32) Int) Unit!30760)

(assert (=> b!906357 (= lt!408890 (lemmaListMapApplyFromThenApplyFromZero!24 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!408889 i!717 defaultEntry!1160))))

(declare-fun res!611662 () Bool)

(assert (=> start!77700 (=> (not res!611662) (not e!507920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77700 (= res!611662 (validMask!0 mask!1756))))

(assert (=> start!77700 e!507920))

(declare-fun e!507914 () Bool)

(declare-fun array_inv!20122 (array!53448) Bool)

(assert (=> start!77700 (and (array_inv!20122 _values!1152) e!507914)))

(assert (=> start!77700 tp!57117))

(assert (=> start!77700 true))

(assert (=> start!77700 tp_is_empty!18703))

(declare-fun array_inv!20123 (array!53450) Bool)

(assert (=> start!77700 (array_inv!20123 _keys!1386)))

(declare-fun b!906358 () Bool)

(declare-fun res!611664 () Bool)

(assert (=> b!906358 (=> (not res!611664) (not e!507920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53450 (_ BitVec 32)) Bool)

(assert (=> b!906358 (= res!611664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906359 () Bool)

(assert (=> b!906359 (= e!507920 e!507918)))

(declare-fun res!611663 () Bool)

(assert (=> b!906359 (=> (not res!611663) (not e!507918))))

(declare-fun contains!4528 (ListLongMap!10935 (_ BitVec 64)) Bool)

(assert (=> b!906359 (= res!611663 (contains!4528 lt!408888 k!1033))))

(declare-fun getCurrentListMap!2749 (array!53450 array!53448 (_ BitVec 32) (_ BitVec 32) V!29903 V!29903 (_ BitVec 32) Int) ListLongMap!10935)

(assert (=> b!906359 (= lt!408888 (getCurrentListMap!2749 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapIsEmpty!29767 () Bool)

(declare-fun mapRes!29767 () Bool)

(assert (=> mapIsEmpty!29767 mapRes!29767))

(declare-fun b!906360 () Bool)

(declare-fun e!507915 () Bool)

(assert (=> b!906360 (= e!507918 (not e!507915))))

(declare-fun res!611661 () Bool)

(assert (=> b!906360 (=> res!611661 e!507915)))

(assert (=> b!906360 (= res!611661 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26143 _keys!1386))))))

(declare-fun get!13502 (ValueCell!8870 V!29903) V!29903)

(declare-fun dynLambda!1346 (Int (_ BitVec 64)) V!29903)

(assert (=> b!906360 (= lt!408889 (get!13502 (select (arr!25683 _values!1152) i!717) (dynLambda!1346 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906360 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408891 () Unit!30760)

(declare-fun lemmaKeyInListMapIsInArray!218 (array!53450 array!53448 (_ BitVec 32) (_ BitVec 32) V!29903 V!29903 (_ BitVec 64) Int) Unit!30760)

(assert (=> b!906360 (= lt!408891 (lemmaKeyInListMapIsInArray!218 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!906361 () Bool)

(declare-fun e!507916 () Bool)

(assert (=> b!906361 (= e!507916 tp_is_empty!18703)))

(declare-fun b!906362 () Bool)

(declare-fun res!611665 () Bool)

(assert (=> b!906362 (=> (not res!611665) (not e!507918))))

(assert (=> b!906362 (= res!611665 (and (= (select (arr!25684 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29767 () Bool)

(declare-fun tp!57116 () Bool)

(assert (=> mapNonEmpty!29767 (= mapRes!29767 (and tp!57116 e!507916))))

(declare-fun mapValue!29767 () ValueCell!8870)

(declare-fun mapKey!29767 () (_ BitVec 32))

(declare-fun mapRest!29767 () (Array (_ BitVec 32) ValueCell!8870))

(assert (=> mapNonEmpty!29767 (= (arr!25683 _values!1152) (store mapRest!29767 mapKey!29767 mapValue!29767))))

(declare-fun b!906363 () Bool)

(assert (=> b!906363 (= e!507914 (and e!507917 mapRes!29767))))

(declare-fun condMapEmpty!29767 () Bool)

(declare-fun mapDefault!29767 () ValueCell!8870)

