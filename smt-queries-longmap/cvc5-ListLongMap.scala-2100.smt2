; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35768 () Bool)

(assert start!35768)

(declare-fun mapIsEmpty!13839 () Bool)

(declare-fun mapRes!13839 () Bool)

(assert (=> mapIsEmpty!13839 mapRes!13839))

(declare-fun res!199709 () Bool)

(declare-fun e!220033 () Bool)

(assert (=> start!35768 (=> (not res!199709) (not e!220033))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35768 (= res!199709 (validMask!0 mask!1842))))

(assert (=> start!35768 e!220033))

(assert (=> start!35768 true))

(declare-datatypes ((V!11939 0))(
  ( (V!11940 (val!4155 Int)) )
))
(declare-datatypes ((ValueCell!3767 0))(
  ( (ValueCellFull!3767 (v!6349 V!11939)) (EmptyCell!3767) )
))
(declare-datatypes ((array!20001 0))(
  ( (array!20002 (arr!9494 (Array (_ BitVec 32) ValueCell!3767)) (size!9846 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20001)

(declare-fun e!220035 () Bool)

(declare-fun array_inv!6984 (array!20001) Bool)

(assert (=> start!35768 (and (array_inv!6984 _values!1208) e!220035)))

(declare-datatypes ((array!20003 0))(
  ( (array!20004 (arr!9495 (Array (_ BitVec 32) (_ BitVec 64))) (size!9847 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20003)

(declare-fun array_inv!6985 (array!20003) Bool)

(assert (=> start!35768 (array_inv!6985 _keys!1456)))

(declare-fun b!359300 () Bool)

(assert (=> b!359300 (= e!220033 false)))

(declare-fun lt!166319 () Bool)

(declare-datatypes ((List!5462 0))(
  ( (Nil!5459) (Cons!5458 (h!6314 (_ BitVec 64)) (t!10612 List!5462)) )
))
(declare-fun arrayNoDuplicates!0 (array!20003 (_ BitVec 32) List!5462) Bool)

(assert (=> b!359300 (= lt!166319 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5459))))

(declare-fun b!359301 () Bool)

(declare-fun e!220036 () Bool)

(declare-fun tp_is_empty!8221 () Bool)

(assert (=> b!359301 (= e!220036 tp_is_empty!8221)))

(declare-fun mapNonEmpty!13839 () Bool)

(declare-fun tp!27906 () Bool)

(assert (=> mapNonEmpty!13839 (= mapRes!13839 (and tp!27906 e!220036))))

(declare-fun mapValue!13839 () ValueCell!3767)

(declare-fun mapRest!13839 () (Array (_ BitVec 32) ValueCell!3767))

(declare-fun mapKey!13839 () (_ BitVec 32))

(assert (=> mapNonEmpty!13839 (= (arr!9494 _values!1208) (store mapRest!13839 mapKey!13839 mapValue!13839))))

(declare-fun b!359302 () Bool)

(declare-fun res!199711 () Bool)

(assert (=> b!359302 (=> (not res!199711) (not e!220033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20003 (_ BitVec 32)) Bool)

(assert (=> b!359302 (= res!199711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359303 () Bool)

(declare-fun res!199710 () Bool)

(assert (=> b!359303 (=> (not res!199710) (not e!220033))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359303 (= res!199710 (and (= (size!9846 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9847 _keys!1456) (size!9846 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359304 () Bool)

(declare-fun e!220034 () Bool)

(assert (=> b!359304 (= e!220035 (and e!220034 mapRes!13839))))

(declare-fun condMapEmpty!13839 () Bool)

(declare-fun mapDefault!13839 () ValueCell!3767)

