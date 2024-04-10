; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95596 () Bool)

(assert start!95596)

(declare-fun b_free!22249 () Bool)

(declare-fun b_next!22249 () Bool)

(assert (=> start!95596 (= b_free!22249 (not b_next!22249))))

(declare-fun tp!78595 () Bool)

(declare-fun b_and!35227 () Bool)

(assert (=> start!95596 (= tp!78595 b_and!35227)))

(declare-fun b!1079997 () Bool)

(declare-fun res!719766 () Bool)

(declare-fun e!617420 () Bool)

(assert (=> b!1079997 (=> (not res!719766) (not e!617420))))

(declare-datatypes ((array!69455 0))(
  ( (array!69456 (arr!33401 (Array (_ BitVec 32) (_ BitVec 64))) (size!33937 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69455)

(declare-datatypes ((List!23273 0))(
  ( (Nil!23270) (Cons!23269 (h!24478 (_ BitVec 64)) (t!32632 List!23273)) )
))
(declare-fun arrayNoDuplicates!0 (array!69455 (_ BitVec 32) List!23273) Bool)

(assert (=> b!1079997 (= res!719766 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23270))))

(declare-fun b!1079998 () Bool)

(declare-fun e!617419 () Bool)

(assert (=> b!1079998 (= e!617419 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-datatypes ((V!40129 0))(
  ( (V!40130 (val!13182 Int)) )
))
(declare-fun minValue!831 () V!40129)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((tuple2!16694 0))(
  ( (tuple2!16695 (_1!8358 (_ BitVec 64)) (_2!8358 V!40129)) )
))
(declare-datatypes ((List!23274 0))(
  ( (Nil!23271) (Cons!23270 (h!24479 tuple2!16694) (t!32633 List!23274)) )
))
(declare-datatypes ((ListLongMap!14663 0))(
  ( (ListLongMap!14664 (toList!7347 List!23274)) )
))
(declare-fun lt!478909 () ListLongMap!14663)

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-fun zeroValue!831 () V!40129)

(declare-datatypes ((ValueCell!12416 0))(
  ( (ValueCellFull!12416 (v!15803 V!40129)) (EmptyCell!12416) )
))
(declare-datatypes ((array!69457 0))(
  ( (array!69458 (arr!33402 (Array (_ BitVec 32) ValueCell!12416)) (size!33938 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69457)

(declare-fun getCurrentListMapNoExtraKeys!3895 (array!69455 array!69457 (_ BitVec 32) (_ BitVec 32) V!40129 V!40129 (_ BitVec 32) Int) ListLongMap!14663)

(assert (=> b!1079998 (= lt!478909 (getCurrentListMapNoExtraKeys!3895 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!69455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1079998 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35514 0))(
  ( (Unit!35515) )
))
(declare-fun lt!478907 () Unit!35514)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69455 (_ BitVec 64) (_ BitVec 32)) Unit!35514)

(assert (=> b!1079998 (= lt!478907 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1079999 () Bool)

(declare-fun res!719763 () Bool)

(assert (=> b!1079999 (=> (not res!719763) (not e!617420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69455 (_ BitVec 32)) Bool)

(assert (=> b!1079999 (= res!719763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080000 () Bool)

(declare-fun e!617421 () Bool)

(declare-fun tp_is_empty!26251 () Bool)

(assert (=> b!1080000 (= e!617421 tp_is_empty!26251)))

(declare-fun res!719759 () Bool)

(assert (=> start!95596 (=> (not res!719759) (not e!617420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95596 (= res!719759 (validMask!0 mask!1414))))

(assert (=> start!95596 e!617420))

(assert (=> start!95596 tp!78595))

(assert (=> start!95596 true))

(assert (=> start!95596 tp_is_empty!26251))

(declare-fun array_inv!25790 (array!69455) Bool)

(assert (=> start!95596 (array_inv!25790 _keys!1070)))

(declare-fun e!617418 () Bool)

(declare-fun array_inv!25791 (array!69457) Bool)

(assert (=> start!95596 (and (array_inv!25791 _values!874) e!617418)))

(declare-fun b!1080001 () Bool)

(declare-fun res!719761 () Bool)

(assert (=> b!1080001 (=> (not res!719761) (not e!617420))))

(assert (=> b!1080001 (= res!719761 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33937 _keys!1070))))))

(declare-fun b!1080002 () Bool)

(assert (=> b!1080002 (= e!617420 e!617419)))

(declare-fun res!719764 () Bool)

(assert (=> b!1080002 (=> (not res!719764) (not e!617419))))

(declare-fun lt!478908 () array!69455)

(assert (=> b!1080002 (= res!719764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478908 mask!1414))))

(assert (=> b!1080002 (= lt!478908 (array!69456 (store (arr!33401 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33937 _keys!1070)))))

(declare-fun b!1080003 () Bool)

(declare-fun res!719760 () Bool)

(assert (=> b!1080003 (=> (not res!719760) (not e!617420))))

(assert (=> b!1080003 (= res!719760 (and (= (size!33938 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33937 _keys!1070) (size!33938 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080004 () Bool)

(declare-fun res!719762 () Bool)

(assert (=> b!1080004 (=> (not res!719762) (not e!617419))))

(assert (=> b!1080004 (= res!719762 (arrayNoDuplicates!0 lt!478908 #b00000000000000000000000000000000 Nil!23270))))

(declare-fun b!1080005 () Bool)

(declare-fun res!719765 () Bool)

(assert (=> b!1080005 (=> (not res!719765) (not e!617420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080005 (= res!719765 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!41131 () Bool)

(declare-fun mapRes!41131 () Bool)

(declare-fun tp!78596 () Bool)

(assert (=> mapNonEmpty!41131 (= mapRes!41131 (and tp!78596 e!617421))))

(declare-fun mapKey!41131 () (_ BitVec 32))

(declare-fun mapRest!41131 () (Array (_ BitVec 32) ValueCell!12416))

(declare-fun mapValue!41131 () ValueCell!12416)

(assert (=> mapNonEmpty!41131 (= (arr!33402 _values!874) (store mapRest!41131 mapKey!41131 mapValue!41131))))

(declare-fun b!1080006 () Bool)

(declare-fun res!719758 () Bool)

(assert (=> b!1080006 (=> (not res!719758) (not e!617420))))

(assert (=> b!1080006 (= res!719758 (= (select (arr!33401 _keys!1070) i!650) k!904))))

(declare-fun mapIsEmpty!41131 () Bool)

(assert (=> mapIsEmpty!41131 mapRes!41131))

(declare-fun b!1080007 () Bool)

(declare-fun e!617422 () Bool)

(assert (=> b!1080007 (= e!617422 tp_is_empty!26251)))

(declare-fun b!1080008 () Bool)

(assert (=> b!1080008 (= e!617418 (and e!617422 mapRes!41131))))

(declare-fun condMapEmpty!41131 () Bool)

(declare-fun mapDefault!41131 () ValueCell!12416)

