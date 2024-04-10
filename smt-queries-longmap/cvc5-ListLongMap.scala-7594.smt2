; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95884 () Bool)

(assert start!95884)

(declare-fun b_free!22537 () Bool)

(declare-fun b_next!22537 () Bool)

(assert (=> start!95884 (= b_free!22537 (not b_next!22537))))

(declare-fun tp!79459 () Bool)

(declare-fun b_and!35749 () Bool)

(assert (=> start!95884 (= tp!79459 b_and!35749)))

(declare-fun b!1085545 () Bool)

(declare-fun e!620135 () Bool)

(declare-fun e!620131 () Bool)

(assert (=> b!1085545 (= e!620135 e!620131)))

(declare-fun res!723783 () Bool)

(assert (=> b!1085545 (=> res!723783 e!620131)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1085545 (= res!723783 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40513 0))(
  ( (V!40514 (val!13326 Int)) )
))
(declare-datatypes ((tuple2!16898 0))(
  ( (tuple2!16899 (_1!8460 (_ BitVec 64)) (_2!8460 V!40513)) )
))
(declare-datatypes ((List!23487 0))(
  ( (Nil!23484) (Cons!23483 (h!24692 tuple2!16898) (t!33082 List!23487)) )
))
(declare-datatypes ((ListLongMap!14867 0))(
  ( (ListLongMap!14868 (toList!7449 List!23487)) )
))
(declare-fun lt!481809 () ListLongMap!14867)

(declare-fun lt!481822 () ListLongMap!14867)

(assert (=> b!1085545 (= lt!481809 lt!481822)))

(declare-fun lt!481807 () ListLongMap!14867)

(declare-fun -!775 (ListLongMap!14867 (_ BitVec 64)) ListLongMap!14867)

(assert (=> b!1085545 (= lt!481809 (-!775 lt!481807 k!904))))

(declare-fun lt!481816 () ListLongMap!14867)

(declare-datatypes ((Unit!35716 0))(
  ( (Unit!35717) )
))
(declare-fun lt!481815 () Unit!35716)

(declare-fun zeroValue!831 () V!40513)

(declare-fun addRemoveCommutativeForDiffKeys!13 (ListLongMap!14867 (_ BitVec 64) V!40513 (_ BitVec 64)) Unit!35716)

(assert (=> b!1085545 (= lt!481815 (addRemoveCommutativeForDiffKeys!13 lt!481816 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!481812 () ListLongMap!14867)

(declare-fun lt!481808 () tuple2!16898)

(declare-fun +!3257 (ListLongMap!14867 tuple2!16898) ListLongMap!14867)

(assert (=> b!1085545 (= lt!481812 (+!3257 lt!481822 lt!481808))))

(declare-fun lt!481818 () ListLongMap!14867)

(declare-fun lt!481813 () tuple2!16898)

(assert (=> b!1085545 (= lt!481822 (+!3257 lt!481818 lt!481813))))

(declare-fun lt!481817 () ListLongMap!14867)

(declare-fun lt!481806 () ListLongMap!14867)

(assert (=> b!1085545 (= lt!481817 lt!481806)))

(assert (=> b!1085545 (= lt!481806 (+!3257 lt!481807 lt!481808))))

(assert (=> b!1085545 (= lt!481807 (+!3257 lt!481816 lt!481813))))

(declare-fun lt!481820 () ListLongMap!14867)

(assert (=> b!1085545 (= lt!481812 (+!3257 (+!3257 lt!481820 lt!481813) lt!481808))))

(declare-fun minValue!831 () V!40513)

(assert (=> b!1085545 (= lt!481808 (tuple2!16899 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085545 (= lt!481813 (tuple2!16899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1085546 () Bool)

(declare-fun e!620133 () Bool)

(assert (=> b!1085546 (= e!620133 (not e!620135))))

(declare-fun res!723780 () Bool)

(assert (=> b!1085546 (=> res!723780 e!620135)))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085546 (= res!723780 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((array!70013 0))(
  ( (array!70014 (arr!33680 (Array (_ BitVec 32) (_ BitVec 64))) (size!34216 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70013)

(declare-datatypes ((ValueCell!12560 0))(
  ( (ValueCellFull!12560 (v!15947 V!40513)) (EmptyCell!12560) )
))
(declare-datatypes ((array!70015 0))(
  ( (array!70016 (arr!33681 (Array (_ BitVec 32) ValueCell!12560)) (size!34217 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70015)

(declare-fun getCurrentListMap!4234 (array!70013 array!70015 (_ BitVec 32) (_ BitVec 32) V!40513 V!40513 (_ BitVec 32) Int) ListLongMap!14867)

(assert (=> b!1085546 (= lt!481817 (getCurrentListMap!4234 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!481821 () array!70015)

(declare-fun lt!481819 () array!70013)

(assert (=> b!1085546 (= lt!481812 (getCurrentListMap!4234 lt!481819 lt!481821 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1085546 (and (= lt!481820 lt!481818) (= lt!481818 lt!481820))))

(assert (=> b!1085546 (= lt!481818 (-!775 lt!481816 k!904))))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lt!481810 () Unit!35716)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!53 (array!70013 array!70015 (_ BitVec 32) (_ BitVec 32) V!40513 V!40513 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35716)

(assert (=> b!1085546 (= lt!481810 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!53 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!3994 (array!70013 array!70015 (_ BitVec 32) (_ BitVec 32) V!40513 V!40513 (_ BitVec 32) Int) ListLongMap!14867)

(assert (=> b!1085546 (= lt!481820 (getCurrentListMapNoExtraKeys!3994 lt!481819 lt!481821 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2131 (Int (_ BitVec 64)) V!40513)

(assert (=> b!1085546 (= lt!481821 (array!70016 (store (arr!33681 _values!874) i!650 (ValueCellFull!12560 (dynLambda!2131 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34217 _values!874)))))

(assert (=> b!1085546 (= lt!481816 (getCurrentListMapNoExtraKeys!3994 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1085546 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-fun lt!481811 () Unit!35716)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70013 (_ BitVec 64) (_ BitVec 32)) Unit!35716)

(assert (=> b!1085546 (= lt!481811 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1085547 () Bool)

(declare-fun res!723786 () Bool)

(declare-fun e!620138 () Bool)

(assert (=> b!1085547 (=> (not res!723786) (not e!620138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70013 (_ BitVec 32)) Bool)

(assert (=> b!1085547 (= res!723786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!723782 () Bool)

(assert (=> start!95884 (=> (not res!723782) (not e!620138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95884 (= res!723782 (validMask!0 mask!1414))))

(assert (=> start!95884 e!620138))

(assert (=> start!95884 tp!79459))

(assert (=> start!95884 true))

(declare-fun tp_is_empty!26539 () Bool)

(assert (=> start!95884 tp_is_empty!26539))

(declare-fun array_inv!25992 (array!70013) Bool)

(assert (=> start!95884 (array_inv!25992 _keys!1070)))

(declare-fun e!620132 () Bool)

(declare-fun array_inv!25993 (array!70015) Bool)

(assert (=> start!95884 (and (array_inv!25993 _values!874) e!620132)))

(declare-fun b!1085548 () Bool)

(assert (=> b!1085548 (= e!620131 true)))

(assert (=> b!1085548 (= (-!775 lt!481806 k!904) (+!3257 lt!481809 lt!481808))))

(declare-fun lt!481814 () Unit!35716)

(assert (=> b!1085548 (= lt!481814 (addRemoveCommutativeForDiffKeys!13 lt!481807 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k!904))))

(declare-fun b!1085549 () Bool)

(declare-fun res!723776 () Bool)

(assert (=> b!1085549 (=> (not res!723776) (not e!620133))))

(declare-datatypes ((List!23488 0))(
  ( (Nil!23485) (Cons!23484 (h!24693 (_ BitVec 64)) (t!33083 List!23488)) )
))
(declare-fun arrayNoDuplicates!0 (array!70013 (_ BitVec 32) List!23488) Bool)

(assert (=> b!1085549 (= res!723776 (arrayNoDuplicates!0 lt!481819 #b00000000000000000000000000000000 Nil!23485))))

(declare-fun mapIsEmpty!41563 () Bool)

(declare-fun mapRes!41563 () Bool)

(assert (=> mapIsEmpty!41563 mapRes!41563))

(declare-fun b!1085550 () Bool)

(declare-fun res!723777 () Bool)

(assert (=> b!1085550 (=> (not res!723777) (not e!620138))))

(assert (=> b!1085550 (= res!723777 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34216 _keys!1070))))))

(declare-fun b!1085551 () Bool)

(declare-fun res!723785 () Bool)

(assert (=> b!1085551 (=> (not res!723785) (not e!620138))))

(assert (=> b!1085551 (= res!723785 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23485))))

(declare-fun b!1085552 () Bool)

(declare-fun res!723784 () Bool)

(assert (=> b!1085552 (=> (not res!723784) (not e!620138))))

(assert (=> b!1085552 (= res!723784 (= (select (arr!33680 _keys!1070) i!650) k!904))))

(declare-fun b!1085553 () Bool)

(declare-fun e!620137 () Bool)

(assert (=> b!1085553 (= e!620137 tp_is_empty!26539)))

(declare-fun b!1085554 () Bool)

(declare-fun res!723779 () Bool)

(assert (=> b!1085554 (=> (not res!723779) (not e!620138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1085554 (= res!723779 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!41563 () Bool)

(declare-fun tp!79460 () Bool)

(declare-fun e!620134 () Bool)

(assert (=> mapNonEmpty!41563 (= mapRes!41563 (and tp!79460 e!620134))))

(declare-fun mapKey!41563 () (_ BitVec 32))

(declare-fun mapRest!41563 () (Array (_ BitVec 32) ValueCell!12560))

(declare-fun mapValue!41563 () ValueCell!12560)

(assert (=> mapNonEmpty!41563 (= (arr!33681 _values!874) (store mapRest!41563 mapKey!41563 mapValue!41563))))

(declare-fun b!1085555 () Bool)

(assert (=> b!1085555 (= e!620132 (and e!620137 mapRes!41563))))

(declare-fun condMapEmpty!41563 () Bool)

(declare-fun mapDefault!41563 () ValueCell!12560)

