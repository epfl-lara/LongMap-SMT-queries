; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95380 () Bool)

(assert start!95380)

(declare-fun b!1077349 () Bool)

(declare-fun res!717872 () Bool)

(declare-fun e!615990 () Bool)

(assert (=> b!1077349 (=> (not res!717872) (not e!615990))))

(declare-datatypes ((List!23217 0))(
  ( (Nil!23214) (Cons!23213 (h!24422 (_ BitVec 64)) (t!32576 List!23217)) )
))
(declare-fun noDuplicate!1576 (List!23217) Bool)

(assert (=> b!1077349 (= res!717872 (noDuplicate!1576 Nil!23214))))

(declare-fun b!1077350 () Bool)

(declare-fun e!615993 () Bool)

(declare-fun tp_is_empty!26105 () Bool)

(assert (=> b!1077350 (= e!615993 tp_is_empty!26105)))

(declare-fun b!1077351 () Bool)

(declare-fun e!615992 () Bool)

(assert (=> b!1077351 (= e!615990 e!615992)))

(declare-fun res!717874 () Bool)

(assert (=> b!1077351 (=> res!717874 e!615992)))

(declare-fun contains!6368 (List!23217 (_ BitVec 64)) Bool)

(assert (=> b!1077351 (= res!717874 (contains!6368 Nil!23214 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1077352 () Bool)

(declare-fun res!717871 () Bool)

(assert (=> b!1077352 (=> (not res!717871) (not e!615990))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69161 0))(
  ( (array!69162 (arr!33259 (Array (_ BitVec 32) (_ BitVec 64))) (size!33795 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69161)

(declare-datatypes ((V!39933 0))(
  ( (V!39934 (val!13109 Int)) )
))
(declare-datatypes ((ValueCell!12343 0))(
  ( (ValueCellFull!12343 (v!15728 V!39933)) (EmptyCell!12343) )
))
(declare-datatypes ((array!69163 0))(
  ( (array!69164 (arr!33260 (Array (_ BitVec 32) ValueCell!12343)) (size!33796 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69163)

(assert (=> b!1077352 (= res!717871 (and (= (size!33796 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33795 _keys!1070) (size!33796 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!717875 () Bool)

(assert (=> start!95380 (=> (not res!717875) (not e!615990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95380 (= res!717875 (validMask!0 mask!1414))))

(assert (=> start!95380 e!615990))

(assert (=> start!95380 true))

(declare-fun e!615991 () Bool)

(declare-fun array_inv!25694 (array!69163) Bool)

(assert (=> start!95380 (and (array_inv!25694 _values!874) e!615991)))

(declare-fun array_inv!25695 (array!69161) Bool)

(assert (=> start!95380 (array_inv!25695 _keys!1070)))

(declare-fun b!1077353 () Bool)

(declare-fun res!717876 () Bool)

(assert (=> b!1077353 (=> (not res!717876) (not e!615990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69161 (_ BitVec 32)) Bool)

(assert (=> b!1077353 (= res!717876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1077354 () Bool)

(declare-fun e!615989 () Bool)

(declare-fun mapRes!40897 () Bool)

(assert (=> b!1077354 (= e!615991 (and e!615989 mapRes!40897))))

(declare-fun condMapEmpty!40897 () Bool)

(declare-fun mapDefault!40897 () ValueCell!12343)

