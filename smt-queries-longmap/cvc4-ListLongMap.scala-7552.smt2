; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95636 () Bool)

(assert start!95636)

(declare-fun b_free!22289 () Bool)

(declare-fun b_next!22289 () Bool)

(assert (=> start!95636 (= b_free!22289 (not b_next!22289))))

(declare-fun tp!78716 () Bool)

(declare-fun b_and!35267 () Bool)

(assert (=> start!95636 (= tp!78716 b_and!35267)))

(declare-fun b!1080717 () Bool)

(declare-fun e!617781 () Bool)

(declare-fun e!617779 () Bool)

(assert (=> b!1080717 (= e!617781 e!617779)))

(declare-fun res!720302 () Bool)

(assert (=> b!1080717 (=> (not res!720302) (not e!617779))))

(declare-datatypes ((array!69533 0))(
  ( (array!69534 (arr!33440 (Array (_ BitVec 32) (_ BitVec 64))) (size!33976 (_ BitVec 32))) )
))
(declare-fun lt!479087 () array!69533)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69533 (_ BitVec 32)) Bool)

(assert (=> b!1080717 (= res!720302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479087 mask!1414))))

(declare-fun _keys!1070 () array!69533)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080717 (= lt!479087 (array!69534 (store (arr!33440 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33976 _keys!1070)))))

(declare-fun b!1080719 () Bool)

(declare-fun res!720305 () Bool)

(assert (=> b!1080719 (=> (not res!720305) (not e!617781))))

(assert (=> b!1080719 (= res!720305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080720 () Bool)

(declare-fun res!720306 () Bool)

(assert (=> b!1080720 (=> (not res!720306) (not e!617781))))

(declare-datatypes ((V!40181 0))(
  ( (V!40182 (val!13202 Int)) )
))
(declare-datatypes ((ValueCell!12436 0))(
  ( (ValueCellFull!12436 (v!15823 V!40181)) (EmptyCell!12436) )
))
(declare-datatypes ((array!69535 0))(
  ( (array!69536 (arr!33441 (Array (_ BitVec 32) ValueCell!12436)) (size!33977 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69535)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1080720 (= res!720306 (and (= (size!33977 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33976 _keys!1070) (size!33977 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!41191 () Bool)

(declare-fun mapRes!41191 () Bool)

(declare-fun tp!78715 () Bool)

(declare-fun e!617778 () Bool)

(assert (=> mapNonEmpty!41191 (= mapRes!41191 (and tp!78715 e!617778))))

(declare-fun mapKey!41191 () (_ BitVec 32))

(declare-fun mapRest!41191 () (Array (_ BitVec 32) ValueCell!12436))

(declare-fun mapValue!41191 () ValueCell!12436)

(assert (=> mapNonEmpty!41191 (= (arr!33441 _values!874) (store mapRest!41191 mapKey!41191 mapValue!41191))))

(declare-fun b!1080721 () Bool)

(declare-fun res!720299 () Bool)

(assert (=> b!1080721 (=> (not res!720299) (not e!617781))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080721 (= res!720299 (validKeyInArray!0 k!904))))

(declare-fun b!1080722 () Bool)

(declare-fun res!720300 () Bool)

(assert (=> b!1080722 (=> (not res!720300) (not e!617781))))

(assert (=> b!1080722 (= res!720300 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33976 _keys!1070))))))

(declare-fun b!1080723 () Bool)

(declare-fun res!720304 () Bool)

(assert (=> b!1080723 (=> (not res!720304) (not e!617779))))

(declare-datatypes ((List!23303 0))(
  ( (Nil!23300) (Cons!23299 (h!24508 (_ BitVec 64)) (t!32662 List!23303)) )
))
(declare-fun arrayNoDuplicates!0 (array!69533 (_ BitVec 32) List!23303) Bool)

(assert (=> b!1080723 (= res!720304 (arrayNoDuplicates!0 lt!479087 #b00000000000000000000000000000000 Nil!23300))))

(declare-fun res!720301 () Bool)

(assert (=> start!95636 (=> (not res!720301) (not e!617781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95636 (= res!720301 (validMask!0 mask!1414))))

(assert (=> start!95636 e!617781))

(assert (=> start!95636 tp!78716))

(assert (=> start!95636 true))

(declare-fun tp_is_empty!26291 () Bool)

(assert (=> start!95636 tp_is_empty!26291))

(declare-fun array_inv!25818 (array!69533) Bool)

(assert (=> start!95636 (array_inv!25818 _keys!1070)))

(declare-fun e!617783 () Bool)

(declare-fun array_inv!25819 (array!69535) Bool)

(assert (=> start!95636 (and (array_inv!25819 _values!874) e!617783)))

(declare-fun b!1080718 () Bool)

(declare-fun e!617782 () Bool)

(assert (=> b!1080718 (= e!617783 (and e!617782 mapRes!41191))))

(declare-fun condMapEmpty!41191 () Bool)

(declare-fun mapDefault!41191 () ValueCell!12436)

