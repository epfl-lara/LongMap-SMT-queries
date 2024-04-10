; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35804 () Bool)

(assert start!35804)

(declare-fun b!359624 () Bool)

(declare-fun e!220305 () Bool)

(declare-fun tp_is_empty!8257 () Bool)

(assert (=> b!359624 (= e!220305 tp_is_empty!8257)))

(declare-fun b!359625 () Bool)

(declare-fun e!220306 () Bool)

(assert (=> b!359625 (= e!220306 tp_is_empty!8257)))

(declare-fun b!359626 () Bool)

(declare-fun res!199872 () Bool)

(declare-fun e!220303 () Bool)

(assert (=> b!359626 (=> (not res!199872) (not e!220303))))

(declare-datatypes ((array!20067 0))(
  ( (array!20068 (arr!9527 (Array (_ BitVec 32) (_ BitVec 64))) (size!9879 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20067)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20067 (_ BitVec 32)) Bool)

(assert (=> b!359626 (= res!199872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359627 () Bool)

(declare-fun res!199873 () Bool)

(assert (=> b!359627 (=> (not res!199873) (not e!220303))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11987 0))(
  ( (V!11988 (val!4173 Int)) )
))
(declare-datatypes ((ValueCell!3785 0))(
  ( (ValueCellFull!3785 (v!6367 V!11987)) (EmptyCell!3785) )
))
(declare-datatypes ((array!20069 0))(
  ( (array!20070 (arr!9528 (Array (_ BitVec 32) ValueCell!3785)) (size!9880 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20069)

(assert (=> b!359627 (= res!199873 (and (= (size!9880 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9879 _keys!1456) (size!9880 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359628 () Bool)

(declare-fun e!220307 () Bool)

(declare-fun mapRes!13893 () Bool)

(assert (=> b!359628 (= e!220307 (and e!220305 mapRes!13893))))

(declare-fun condMapEmpty!13893 () Bool)

(declare-fun mapDefault!13893 () ValueCell!3785)

