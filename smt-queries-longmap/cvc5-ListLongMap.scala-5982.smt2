; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77718 () Bool)

(assert start!77718)

(declare-fun b_free!16303 () Bool)

(declare-fun b_next!16303 () Bool)

(assert (=> start!77718 (= b_free!16303 (not b_next!16303))))

(declare-fun tp!57170 () Bool)

(declare-fun b_and!26759 () Bool)

(assert (=> start!77718 (= tp!57170 b_and!26759)))

(declare-fun mapNonEmpty!29794 () Bool)

(declare-fun mapRes!29794 () Bool)

(declare-fun tp!57171 () Bool)

(declare-fun e!508133 () Bool)

(assert (=> mapNonEmpty!29794 (= mapRes!29794 (and tp!57171 e!508133))))

(declare-datatypes ((V!29927 0))(
  ( (V!29928 (val!9411 Int)) )
))
(declare-datatypes ((ValueCell!8879 0))(
  ( (ValueCellFull!8879 (v!11916 V!29927)) (EmptyCell!8879) )
))
(declare-datatypes ((array!53484 0))(
  ( (array!53485 (arr!25701 (Array (_ BitVec 32) ValueCell!8879)) (size!26160 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53484)

(declare-fun mapKey!29794 () (_ BitVec 32))

(declare-fun mapRest!29794 () (Array (_ BitVec 32) ValueCell!8879))

(declare-fun mapValue!29794 () ValueCell!8879)

(assert (=> mapNonEmpty!29794 (= (arr!25701 _values!1152) (store mapRest!29794 mapKey!29794 mapValue!29794))))

(declare-fun b!906722 () Bool)

(declare-fun e!508130 () Bool)

(declare-fun tp_is_empty!18721 () Bool)

(assert (=> b!906722 (= e!508130 tp_is_empty!18721)))

(declare-fun mapIsEmpty!29794 () Bool)

(assert (=> mapIsEmpty!29794 mapRes!29794))

(declare-fun b!906723 () Bool)

(declare-fun e!508136 () Bool)

(declare-fun e!508132 () Bool)

(assert (=> b!906723 (= e!508136 e!508132)))

(declare-fun res!611931 () Bool)

(assert (=> b!906723 (=> (not res!611931) (not e!508132))))

(declare-datatypes ((tuple2!12254 0))(
  ( (tuple2!12255 (_1!6138 (_ BitVec 64)) (_2!6138 V!29927)) )
))
(declare-datatypes ((List!18058 0))(
  ( (Nil!18055) (Cons!18054 (h!19200 tuple2!12254) (t!25533 List!18058)) )
))
(declare-datatypes ((ListLongMap!10951 0))(
  ( (ListLongMap!10952 (toList!5491 List!18058)) )
))
(declare-fun lt!409022 () ListLongMap!10951)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4536 (ListLongMap!10951 (_ BitVec 64)) Bool)

(assert (=> b!906723 (= res!611931 (contains!4536 lt!409022 k!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29927)

(declare-datatypes ((array!53486 0))(
  ( (array!53487 (arr!25702 (Array (_ BitVec 32) (_ BitVec 64))) (size!26161 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53486)

(declare-fun minValue!1094 () V!29927)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun getCurrentListMap!2757 (array!53486 array!53484 (_ BitVec 32) (_ BitVec 32) V!29927 V!29927 (_ BitVec 32) Int) ListLongMap!10951)

(assert (=> b!906723 (= lt!409022 (getCurrentListMap!2757 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906724 () Bool)

(declare-fun e!508137 () Bool)

(declare-fun e!508135 () Bool)

(assert (=> b!906724 (= e!508137 e!508135)))

(declare-fun res!611934 () Bool)

(assert (=> b!906724 (=> res!611934 e!508135)))

(declare-fun lt!409024 () ListLongMap!10951)

(assert (=> b!906724 (= res!611934 (not (contains!4536 lt!409024 k!1033)))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!906724 (= lt!409024 (getCurrentListMap!2757 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906725 () Bool)

(declare-fun res!611935 () Bool)

(assert (=> b!906725 (=> (not res!611935) (not e!508136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53486 (_ BitVec 32)) Bool)

(assert (=> b!906725 (= res!611935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906726 () Bool)

(declare-fun res!611932 () Bool)

(assert (=> b!906726 (=> (not res!611932) (not e!508132))))

(assert (=> b!906726 (= res!611932 (and (= (select (arr!25702 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906727 () Bool)

(declare-fun res!611933 () Bool)

(assert (=> b!906727 (=> res!611933 e!508135)))

(declare-fun lt!409023 () V!29927)

(declare-fun apply!477 (ListLongMap!10951 (_ BitVec 64)) V!29927)

(assert (=> b!906727 (= res!611933 (not (= (apply!477 lt!409024 k!1033) lt!409023)))))

(declare-fun res!611938 () Bool)

(assert (=> start!77718 (=> (not res!611938) (not e!508136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77718 (= res!611938 (validMask!0 mask!1756))))

(assert (=> start!77718 e!508136))

(declare-fun e!508134 () Bool)

(declare-fun array_inv!20134 (array!53484) Bool)

(assert (=> start!77718 (and (array_inv!20134 _values!1152) e!508134)))

(assert (=> start!77718 tp!57170))

(assert (=> start!77718 true))

(assert (=> start!77718 tp_is_empty!18721))

(declare-fun array_inv!20135 (array!53486) Bool)

(assert (=> start!77718 (array_inv!20135 _keys!1386)))

(declare-fun b!906728 () Bool)

(declare-fun res!611930 () Bool)

(assert (=> b!906728 (=> (not res!611930) (not e!508132))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906728 (= res!611930 (inRange!0 i!717 mask!1756))))

(declare-fun b!906729 () Bool)

(assert (=> b!906729 (= e!508133 tp_is_empty!18721)))

(declare-fun b!906730 () Bool)

(assert (=> b!906730 (= e!508132 (not e!508137))))

(declare-fun res!611937 () Bool)

(assert (=> b!906730 (=> res!611937 e!508137)))

(assert (=> b!906730 (= res!611937 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26161 _keys!1386))))))

(declare-fun get!13516 (ValueCell!8879 V!29927) V!29927)

(declare-fun dynLambda!1354 (Int (_ BitVec 64)) V!29927)

(assert (=> b!906730 (= lt!409023 (get!13516 (select (arr!25701 _values!1152) i!717) (dynLambda!1354 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906730 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30776 0))(
  ( (Unit!30777) )
))
(declare-fun lt!409025 () Unit!30776)

(declare-fun lemmaKeyInListMapIsInArray!226 (array!53486 array!53484 (_ BitVec 32) (_ BitVec 32) V!29927 V!29927 (_ BitVec 64) Int) Unit!30776)

(assert (=> b!906730 (= lt!409025 (lemmaKeyInListMapIsInArray!226 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!906731 () Bool)

(declare-fun res!611936 () Bool)

(assert (=> b!906731 (=> (not res!611936) (not e!508136))))

(assert (=> b!906731 (= res!611936 (and (= (size!26160 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26161 _keys!1386) (size!26160 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906732 () Bool)

(declare-fun res!611939 () Bool)

(assert (=> b!906732 (=> (not res!611939) (not e!508136))))

(declare-datatypes ((List!18059 0))(
  ( (Nil!18056) (Cons!18055 (h!19201 (_ BitVec 64)) (t!25534 List!18059)) )
))
(declare-fun arrayNoDuplicates!0 (array!53486 (_ BitVec 32) List!18059) Bool)

(assert (=> b!906732 (= res!611939 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18056))))

(declare-fun b!906733 () Bool)

(assert (=> b!906733 (= e!508135 true)))

(assert (=> b!906733 (= (apply!477 lt!409022 k!1033) lt!409023)))

(declare-fun lt!409026 () Unit!30776)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!32 (array!53486 array!53484 (_ BitVec 32) (_ BitVec 32) V!29927 V!29927 (_ BitVec 64) V!29927 (_ BitVec 32) Int) Unit!30776)

(assert (=> b!906733 (= lt!409026 (lemmaListMapApplyFromThenApplyFromZero!32 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409023 i!717 defaultEntry!1160))))

(declare-fun b!906734 () Bool)

(assert (=> b!906734 (= e!508134 (and e!508130 mapRes!29794))))

(declare-fun condMapEmpty!29794 () Bool)

(declare-fun mapDefault!29794 () ValueCell!8879)

