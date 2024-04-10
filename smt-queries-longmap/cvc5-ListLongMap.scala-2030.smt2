; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35336 () Bool)

(assert start!35336)

(declare-fun b!353865 () Bool)

(declare-fun res!196184 () Bool)

(declare-fun e!216777 () Bool)

(assert (=> b!353865 (=> (not res!196184) (not e!216777))))

(declare-datatypes ((array!19197 0))(
  ( (array!19198 (arr!9093 (Array (_ BitVec 32) (_ BitVec 64))) (size!9445 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19197)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19197 (_ BitVec 32)) Bool)

(assert (=> b!353865 (= res!196184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353866 () Bool)

(declare-fun res!196186 () Bool)

(assert (=> b!353866 (=> (not res!196186) (not e!216777))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11379 0))(
  ( (V!11380 (val!3945 Int)) )
))
(declare-datatypes ((ValueCell!3557 0))(
  ( (ValueCellFull!3557 (v!6139 V!11379)) (EmptyCell!3557) )
))
(declare-datatypes ((array!19199 0))(
  ( (array!19200 (arr!9094 (Array (_ BitVec 32) ValueCell!3557)) (size!9446 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19199)

(assert (=> b!353866 (= res!196186 (and (= (size!9446 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9445 _keys!1456) (size!9446 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353867 () Bool)

(declare-fun e!216775 () Bool)

(declare-fun e!216779 () Bool)

(declare-fun mapRes!13206 () Bool)

(assert (=> b!353867 (= e!216775 (and e!216779 mapRes!13206))))

(declare-fun condMapEmpty!13206 () Bool)

(declare-fun mapDefault!13206 () ValueCell!3557)

