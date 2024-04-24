; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95648 () Bool)

(assert start!95648)

(declare-fun mapNonEmpty!40930 () Bool)

(declare-fun mapRes!40930 () Bool)

(declare-fun tp!78392 () Bool)

(declare-fun e!617027 () Bool)

(assert (=> mapNonEmpty!40930 (= mapRes!40930 (and tp!78392 e!617027))))

(declare-datatypes ((V!39961 0))(
  ( (V!39962 (val!13119 Int)) )
))
(declare-datatypes ((ValueCell!12353 0))(
  ( (ValueCellFull!12353 (v!15735 V!39961)) (EmptyCell!12353) )
))
(declare-datatypes ((array!69239 0))(
  ( (array!69240 (arr!33291 (Array (_ BitVec 32) ValueCell!12353)) (size!33828 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69239)

(declare-fun mapValue!40930 () ValueCell!12353)

(declare-fun mapKey!40930 () (_ BitVec 32))

(declare-fun mapRest!40930 () (Array (_ BitVec 32) ValueCell!12353))

(assert (=> mapNonEmpty!40930 (= (arr!33291 _values!874) (store mapRest!40930 mapKey!40930 mapValue!40930))))

(declare-fun b!1078926 () Bool)

(declare-fun tp_is_empty!26125 () Bool)

(assert (=> b!1078926 (= e!617027 tp_is_empty!26125)))

(declare-fun mapIsEmpty!40930 () Bool)

(assert (=> mapIsEmpty!40930 mapRes!40930))

(declare-datatypes ((array!69241 0))(
  ( (array!69242 (arr!33292 (Array (_ BitVec 32) (_ BitVec 64))) (size!33829 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69241)

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun i!650 () (_ BitVec 32))

(declare-fun b!1078927 () Bool)

(declare-fun e!617024 () Bool)

(assert (=> b!1078927 (= e!617024 (and (= (select (arr!33292 _keys!1070) i!650) k0!904) (= (size!33829 _keys!1070) (bvadd #b00000000000000000000000000000001 mask!1414)) (bvsgt #b00000000000000000000000000000000 (size!33829 _keys!1070))))))

(declare-fun b!1078928 () Bool)

(declare-fun res!718539 () Bool)

(assert (=> b!1078928 (=> (not res!718539) (not e!617024))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69241 (_ BitVec 32)) Bool)

(assert (=> b!1078928 (= res!718539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun res!718541 () Bool)

(assert (=> start!95648 (=> (not res!718541) (not e!617024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95648 (= res!718541 (validMask!0 mask!1414))))

(assert (=> start!95648 e!617024))

(assert (=> start!95648 true))

(declare-fun array_inv!25758 (array!69241) Bool)

(assert (=> start!95648 (array_inv!25758 _keys!1070)))

(declare-fun e!617026 () Bool)

(declare-fun array_inv!25759 (array!69239) Bool)

(assert (=> start!95648 (and (array_inv!25759 _values!874) e!617026)))

(declare-fun b!1078929 () Bool)

(declare-fun res!718543 () Bool)

(assert (=> b!1078929 (=> (not res!718543) (not e!617024))))

(declare-datatypes ((List!23234 0))(
  ( (Nil!23231) (Cons!23230 (h!24448 (_ BitVec 64)) (t!32585 List!23234)) )
))
(declare-fun arrayNoDuplicates!0 (array!69241 (_ BitVec 32) List!23234) Bool)

(assert (=> b!1078929 (= res!718543 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23231))))

(declare-fun b!1078930 () Bool)

(declare-fun e!617025 () Bool)

(assert (=> b!1078930 (= e!617025 tp_is_empty!26125)))

(declare-fun b!1078931 () Bool)

(assert (=> b!1078931 (= e!617026 (and e!617025 mapRes!40930))))

(declare-fun condMapEmpty!40930 () Bool)

(declare-fun mapDefault!40930 () ValueCell!12353)

(assert (=> b!1078931 (= condMapEmpty!40930 (= (arr!33291 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12353)) mapDefault!40930)))))

(declare-fun b!1078932 () Bool)

(declare-fun res!718540 () Bool)

(assert (=> b!1078932 (=> (not res!718540) (not e!617024))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078932 (= res!718540 (and (= (size!33828 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33829 _keys!1070) (size!33828 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078933 () Bool)

(declare-fun res!718544 () Bool)

(assert (=> b!1078933 (=> (not res!718544) (not e!617024))))

(assert (=> b!1078933 (= res!718544 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33829 _keys!1070))))))

(declare-fun b!1078934 () Bool)

(declare-fun res!718542 () Bool)

(assert (=> b!1078934 (=> (not res!718542) (not e!617024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078934 (= res!718542 (validKeyInArray!0 k0!904))))

(assert (= (and start!95648 res!718541) b!1078932))

(assert (= (and b!1078932 res!718540) b!1078928))

(assert (= (and b!1078928 res!718539) b!1078929))

(assert (= (and b!1078929 res!718543) b!1078933))

(assert (= (and b!1078933 res!718544) b!1078934))

(assert (= (and b!1078934 res!718542) b!1078927))

(assert (= (and b!1078931 condMapEmpty!40930) mapIsEmpty!40930))

(assert (= (and b!1078931 (not condMapEmpty!40930)) mapNonEmpty!40930))

(get-info :version)

(assert (= (and mapNonEmpty!40930 ((_ is ValueCellFull!12353) mapValue!40930)) b!1078926))

(assert (= (and b!1078931 ((_ is ValueCellFull!12353) mapDefault!40930)) b!1078930))

(assert (= start!95648 b!1078931))

(declare-fun m!998067 () Bool)

(assert (=> b!1078934 m!998067))

(declare-fun m!998069 () Bool)

(assert (=> b!1078927 m!998069))

(declare-fun m!998071 () Bool)

(assert (=> start!95648 m!998071))

(declare-fun m!998073 () Bool)

(assert (=> start!95648 m!998073))

(declare-fun m!998075 () Bool)

(assert (=> start!95648 m!998075))

(declare-fun m!998077 () Bool)

(assert (=> mapNonEmpty!40930 m!998077))

(declare-fun m!998079 () Bool)

(assert (=> b!1078928 m!998079))

(declare-fun m!998081 () Bool)

(assert (=> b!1078929 m!998081))

(check-sat (not b!1078934) (not b!1078929) (not mapNonEmpty!40930) (not b!1078928) (not start!95648) tp_is_empty!26125)
(check-sat)
